<?php
include('../config/db.php'); include('../includes/header.php'); include('../includes/sidebar.php');
?>

<div class="container mt-4">
  <h3>Hasil Perhitungan</h3>

<?php
// Flash messages
if (!empty($_GET['msg'])) {
  $msg = $_GET['msg'];
  if ($msg === 'deleted') echo "<div class='alert alert-success auto-dismiss no-print'>History perhitungan berhasil dihapus.</div>";
  if ($msg === 'error') echo "<div class='alert alert-danger auto-dismiss no-print'>Gagal menghapus history.</div>";
}

?>

<?php
// If history_id provided, show detail for that history (printable)
if (!empty($_GET['history_id'])) {
  $hid = (int)$_GET['history_id'];
  $h = $koneksi->query("SELECT * FROM compute_history WHERE id_history=$hid")->fetch_assoc();
  if (!$h) { echo "<div class='alert alert-warning'>History tidak ditemukan.</div>"; }
  else {
    echo "<div class='mb-2'>Perhitungan oleh <strong>".htmlspecialchars($h['computed_by'])."</strong> pada <strong>".htmlspecialchars($h['computed_at'])."</strong></div>";
    echo "<div class='mb-2'>";
    echo "<button class='btn btn-sm btn-outline-primary' onclick='window.print()'>Cetak</button> ";
    if (isset($_SESSION['role']) && $_SESSION['role'] === 'admin') {
      $formId = 'delete-form-'.intval($hid);
      echo "<form id='".$formId."' method='POST' action='/SPK_Maintenance/process/delete_history.php' style='display:inline'>";
      echo "<input type='hidden' name='history_id' value='".htmlspecialchars($hid)."'>";
      echo "<button type='button' data-form='".$formId."' class='btn btn-sm btn-danger ms-2 btn-delete-history'>Hapus History</button>";
      echo "</form>";
    }
    echo "</div>";
    echo "<table class='table table-bordered'><thead><tr><th>Rank</th><th>ID</th><th>Equipment</th><th>Score</th></tr></thead><tbody>";
    $q = $koneksi->query("SELECT cr.*, e.equipment_name FROM compute_results cr JOIN equipment e ON cr.id_equipment=e.id_equipment WHERE cr.history_id=$hid ORDER BY cr.score DESC");
    $rank = 1;
    while($row = $q->fetch_assoc()){
      echo "<tr><td>$rank</td><td>{$row['id_equipment']}</td><td>".htmlspecialchars($row['equipment_name'])."</td><td>".round($row['score'],4)."</td></tr>";
      $rank++;
    }
    echo "</tbody></table>";
  }
} else {
  // list history as date links
  echo "<h5>Riwayat Perhitungan</h5>";
  $qh = $koneksi->query("SELECT * FROM compute_history ORDER BY computed_at DESC");
  echo "<ul class='list-group'>";
  while($hh = $qh->fetch_assoc()){
    $date = $hh['computed_at'];
    $who = htmlspecialchars($hh['computed_by']);
    echo "<li class='list-group-item d-flex justify-content-between align-items-center'>";
    echo "<div><a href='?history_id={$hh['id_history']}'>".htmlspecialchars($date)."</a> &nbsp;<small>by $who</small></div>";
    if (isset($_SESSION['role']) && $_SESSION['role'] === 'admin') {
      $fid = 'delete-form-'.intval($hh['id_history']);
      echo "<div>";
      echo "<form id='".$fid."' method='POST' action='/SPK_Maintenance/process/delete_history.php' style='margin:0'>";
      echo "<input type='hidden' name='history_id' value='".htmlspecialchars($hh['id_history'])."'>";
      echo "<button type='button' data-form='".$fid."' class='btn btn-sm btn-danger btn-delete-history'>Hapus</button>";
      echo "</form>";
      echo "</div>";
    }
    echo "</li>";
  }
  echo "</ul>";
}

?>

</div>

<?php include('../includes/footer.php'); ?>
