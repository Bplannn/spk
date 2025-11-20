<?php
include('../config/db.php');
include('../includes/header.php');
include('../includes/sidebar.php');
?>

<div class="container mt-4">
<h3>Data Perhitungan (Step by Step)</h3>
<span class="welcome-pill">Lakukan perhitungan SAW — filter dan jalankan untuk melihat hasil</span>

<?php
$grade = $koneksi->query("SELECT * FROM grade");
$plant = $koneksi->query("SELECT * FROM plant");
$classification = $koneksi->query("SELECT * FROM classification");
$inspection_period = $koneksi->query("SELECT * FROM inspection_period");
// last inspection years
$last_inspection = $koneksi->query("SELECT * FROM last_inspection ORDER BY year DESC");

// get current filter values (from GET for preview)
$f_grade = $_GET['id_grade'] ?? '';
$f_plant = $_GET['id_plant'] ?? '';
$f_classification = $_GET['id_classification'] ?? '';
$f_period = $_GET['id_inspection_period'] ?? '';
$f_last = $_GET['id_last_inspection'] ?? '';
?>

<!-- Filter form (preview) -->
<div class="card mb-3">
  <div class="card-body">
    <form method="get" class="row g-2 mb-0">
  <div class="col-md-2">
    <select name="id_grade" class="form-select">
      <option value="">-- Semua Grade --</option>
      <?php foreach($grade as $g) { $sel = ($f_grade== $g['id_grade'])? 'selected':''; echo "<option value='{$g['id_grade']}' $sel>{$g['grade_name']}</option>"; } ?>
    </select>
  </div>
  <div class="col-md-2">
    <select name="id_plant" class="form-select">
      <option value="">-- Semua Plant --</option>
      <?php foreach($plant as $p) { $sel = ($f_plant== $p['id_plant'])? 'selected':''; echo "<option value='{$p['id_plant']}' $sel>{$p['plant_name']}</option>"; } ?>
    </select>
  </div>
  <div class="col-md-2">
    <select name="id_classification" class="form-select">
      <option value="">-- Semua Classification --</option>
      <?php foreach($classification as $c) { $sel = ($f_classification== $c['id_classification'])? 'selected':''; echo "<option value='{$c['id_classification']}' $sel>{$c['classification_name']}</option>"; } ?>
    </select>
  </div>
  <div class="col-md-2">
    <select name="id_inspection_period" class="form-select">
      <option value="">-- Semua Period --</option>
      <?php foreach($inspection_period as $ip) { $sel = ($f_period== $ip['id_inspection_period'])? 'selected':''; echo "<option value='{$ip['id_inspection_period']}' $sel>{$ip['period_name']}</option>"; } ?>
    </select>
  </div>
  <div class="col-md-2">
    <select name="id_last_inspection" class="form-select">
      <option value="">-- Semua Last Inspection --</option>
      <?php foreach($last_inspection as $li) { $sel = ($f_last== $li['id_last_inspection'])? 'selected':''; echo "<option value='{$li['id_last_inspection']}' $sel>{$li['year']}</option>"; } ?>
    </select>
  </div>
  <div class="col-md-2">
    <button class="btn btn-secondary">Tampilkan</button>
  </div>
    </form>
  </div>
</div>

<!-- Compute button (admin only) -->
<?php if(isset($_SESSION['role']) && $_SESSION['role']==='admin'): ?>
  <div class="card mb-3">
    <div class="card-body">
    <form method="post" action="../process/compute_saw.php" class="mb-0">
    <input type="hidden" name="id_grade" value="<?=htmlspecialchars($f_grade)?>">
    <input type="hidden" name="id_plant" value="<?=htmlspecialchars($f_plant)?>">
    <input type="hidden" name="id_classification" value="<?=htmlspecialchars($f_classification)?>">
    <input type="hidden" name="id_inspection_period" value="<?=htmlspecialchars($f_period)?>">
    <input type="hidden" name="id_last_inspection" value="<?=htmlspecialchars($f_last)?>">
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" id="purge_prev" name="purge_previous" value="1">
        <label class="form-check-label" for="purge_prev">Hapus hasil perhitungan sebelumnya</label>
      </div>
      <button class="btn btn-primary">Hitung (hanya data terfilter)</button>
    </form>
    </div>
  </div>
<?php endif; ?>

<?php
// ambil semua equipment beserta nilai kriterianya langsung dari relasi (dengan filter jika ada)
$whereClauses = [];
if($f_grade) $whereClauses[] = "e.id_grade=".(int)$f_grade;
if($f_plant) $whereClauses[] = "e.id_plant=".(int)$f_plant;
if($f_classification) $whereClauses[] = "e.id_classification=".(int)$f_classification;
if($f_period) $whereClauses[] = "e.id_inspection_period=".(int)$f_period;
if($f_last) $whereClauses[] = "e.id_last_inspection=".(int)$f_last;

$whereSql = count($whereClauses)? 'WHERE '.implode(' AND ', $whereClauses):'';

$q = $koneksi->query("SELECT 
    e.id_equipment,
    e.equipment_name,
      e.inspection_name,
    g.grade_point,
    c.classification_point,
    ip.period_point
  FROM equipment e
  LEFT JOIN grade g ON e.id_grade = g.id_grade
  LEFT JOIN classification c ON e.id_classification = c.id_classification
  LEFT JOIN inspection_period ip ON e.id_inspection_period = ip.id_inspection_period
  $whereSql");

$items = [];
while($r = $q->fetch_assoc()) $items[] = $r;
// ambil kriteria dan bobot
$kq = $koneksi->query("SELECT * FROM criteria_weight ORDER BY id_criteria");
$criteria = [];
while($k = $kq->fetch_assoc()) $criteria[$k['criteria_name']] = $k;

// bangun matrix nilai awal (berdasarkan nama kriteria)
$matrix = [];
foreach($items as $it){
  $id = $it['id_equipment'];
  $matrix[$id]['name'] = $it['equipment_name'];
  foreach($criteria as $key=>$meta){
    switch (strtolower($key)) {
      case 'grade': $matrix[$id]['raw'][$key] = $it['grade_point']; break;
      case 'classification': $matrix[$id]['raw'][$key] = $it['classification_point']; break;
      case 'inspection period':
      case 'period': $matrix[$id]['raw'][$key] = $it['period_point']; break;
      default: $matrix[$id]['raw'][$key] = 0;
    }
  }
}

// hitung normalisasi
$normalized = [];
foreach($criteria as $key=>$meta){
  $values = array_column(array_map(fn($r) => $r['raw'][$key], $matrix), null);
  $values = array_filter(array_column($matrix, 'raw'), fn($r) => isset($r[$key]));
  $vals = [];
  foreach ($matrix as $row) {
    $vals[] = $row['raw'][$key] ?? 0;
  }
  $max = count($vals) ? max($vals) : 0;
  $min = count($vals) ? min($vals) : 0;

  foreach($matrix as $id=>$row){
    $x = $row['raw'][$key];
    if ($meta['type'] == 'benefit') {
      $r = ($max > 0) ? ($x / $max) : 0;
    } else {
      $r = ($x > 0) ? ($min / $x) : 0;
    }
    $normalized[$id][$key] = $r;
  }
}

// hitung bobot dan total
$results = [];
foreach($matrix as $id=>$row){
  $total = 0;
  foreach($criteria as $key=>$meta){
    $w = (float)$meta['weight'];
    $r = $normalized[$id][$key] ?? 0;
    $weighted = $r * $w;
    $results[$id]['weights'][$key] = $weighted;
    $total += $weighted;
  }
  $results[$id]['total'] = $total;
  $results[$id]['name'] = $row['name'];
}

// tampilkan hasil (dibungkus card agar rapi)
echo "<div class='card mb-3'><div class='card-body'><h5 class='card-title'>Matrix Nilai Awal</h5>";
echo "<div class='table-responsive'><table class='table table-bordered table-sm mb-0'><thead><tr><th>Equipment</th>";
foreach($criteria as $k=>$m) echo "<th>{$m['criteria_name']}</th>";
echo "</tr></thead><tbody>";
foreach($matrix as $id=>$row){
  echo "<tr><td>{$row['name']}</td>";
  foreach($criteria as $k=>$m) echo "<td>{$row['raw'][$k]}</td>";
  echo "</tr>";
}
echo "</tbody></table></div></div></div>";

echo "<div class='card mb-3'><div class='card-body'><h5 class='card-title'>Normalisasi</h5>";
echo "<div class='table-responsive'><table class='table table-bordered table-sm mb-0'><thead><tr><th>Equipment</th>";
foreach($criteria as $k=>$m) echo "<th>{$m['criteria_name']}</th>";
echo "</tr></thead><tbody>";
foreach($normalized as $id=>$vals){
  echo "<tr><td>{$matrix[$id]['name']}</td>";
  foreach($criteria as $k=>$m) echo "<td>".round($vals[$k],4)."</td>";
  echo "</tr>";
}
echo "</tbody></table></div></div></div>";

echo "<div class='card mb-3'><div class='card-body'><h5 class='card-title'>Bobot & Total</h5>";
echo "<div class='table-responsive'><table class='table table-bordered table-sm mb-0'><thead><tr><th>Equipment</th>";
foreach($criteria as $k=>$m) echo "<th>{$m['criteria_name']} (w={$m['weight']})</th>";
echo "<th>Total</th></tr></thead><tbody>";
foreach($results as $id=>$res){
  echo "<tr><td>{$res['name']}</td>";
  foreach($criteria as $k=>$m) echo "<td>".round($res['weights'][$k],4)."</td>";
  echo "<td>".round($res['total'],4)."</td></tr>";
}
echo "</tbody></table></div></div></div>";
?>
</div>

<?php include('../includes/footer.php'); ?>
