<?php
include('../config/db.php');
include('../includes/header.php');
include('../includes/sidebar.php');
?>
<h3>Data Kriteria</h3>
<span class="welcome-pill">Kelola bobot dan tipe kriteria untuk perhitungan</span>

<!-- Form tambah / edit (card) -->
<div class="card mb-3">
  <div class="card-body">
    <?php
    // edit mode
    if (isset($_GET['edit'])) {
      $id = $koneksi->real_escape_string($_GET['edit']);
      $row = $koneksi->query("SELECT * FROM criteria_weight WHERE id_criteria='$id'")->fetch_assoc();
      if ($row) {
        ?>
        <form method="post" action="../process/update_kriteria.php" class="row g-2 mb-0">
          <input type="hidden" name="id_criteria" value="<?= htmlspecialchars($row['id_criteria']) ?>">
          <div class="col-md-6"><input name="criteria_name" value="<?= htmlspecialchars($row['criteria_name']) ?>" class="form-control" placeholder="Label (e.g. Classification)" required></div>
          <div class="col-md-2"><input name="weight" value="<?= htmlspecialchars($row['weight']) ?>" step="0.01" type="number" class="form-control" placeholder="0.25" required></div>
          <div class="col-md-2">
            <select name="type" class="form-select">
              <option value="benefit" <?= $row['type']=='benefit' ? 'selected' : '' ?>>Benefit</option>
              <option value="cost" <?= $row['type']=='cost' ? 'selected' : '' ?>>Cost</option>
            </select>
          </div>
          <div class="col-12"><button class="btn btn-primary mt-2">Update Kriteria</button> <a href="data_kriteria.php" class="btn btn-secondary mt-2">Batal</a></div>
        </form>
        <?php
      } else {
        echo '<div class="alert alert-danger">Kriteria tidak ditemukan.</div>';
      }
    } else {
    ?>
    <form method="post" action="../process/insert_kriteria.php" class="row g-2 mb-0">
      <div class="col-md-6"><input name="criteria_name" class="form-control" placeholder="Label (e.g. Classification)" required></div>
      <div class="col-md-2"><input name="weight" step="0.01" type="number" class="form-control" placeholder="0.25" required></div>
      <div class="col-md-2">
        <select name="type" class="form-select">
          <option value="benefit">Benefit</option>
          <option value="cost">Cost</option>
        </select>
      </div>
      <div class="col-12"><button class="btn btn-primary mt-2">Simpan Kriteria</button></div>
    </form>
    <?php } ?>
  </div>
</div>

<!-- Tabel kriteria (card) -->
<div class="card">
  <div class="card-body p-0">
    <table class="table table-bordered mb-0">
      <thead><tr><th>No</th><th>Label</th><th>Bobot</th><th>Type</th><th>Aksi</th></tr></thead>
      <tbody>
        <?php
        $q = $koneksi->query("SELECT * FROM criteria_weight");
        $no = 1;
        while($r = $q->fetch_assoc()){
          echo "<tr><td>{$no}</td><td>{$r['criteria_name']}</td><td>{$r['weight']}</td><td>{$r['type']}</td>";
            echo "<td class='actions-cell'>";
              echo "<a href='data_kriteria.php?edit={$r['id_criteria']}' class='btn btn-icon btn-sm btn-warning me-1' title='Edit'>";
                echo '<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25z" stroke="currentColor" stroke-width="0" fill="currentColor"/></svg>';
              echo "</a> ";
              echo "<a href='../process/delete_kriteria.php?id={$r['id_criteria']}' class='btn btn-icon btn-sm btn-danger' title='Hapus' onclick=\"return confirm('Yakin ingin menghapus data ini?')\">";
                echo '<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M3 6h18" stroke="currentColor" stroke-width="2" stroke-linecap="round"/><path d="M8 6v14c0 1.1.9 2 2 2h4c1.1 0 2-.9 2-2V6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/><path d="M10 11v6M14 11v6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></svg>';
              echo "</a></td></tr>";
          $no++;
        }
        ?>
      </tbody>
    </table>
  </div>
</div>

<?php include('../includes/footer.php'); ?>
