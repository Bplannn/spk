<?php
include('../config/db.php');
include('../includes/header.php');
include('../includes/sidebar.php');
?>
<h3>Data Kriteria</h3>
<span class="welcome-pill">Kelola bobot dan tipe kriteria untuk perhitungan</span>

<!-- Form tambah (card) -->
<div class="card mb-3">
  <div class="card-body">
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
          echo "<td><a href='../process/delete_kriteria.php?id={$r['id_criteria']}' class='btn btn-danger btn-sm' onclick='return confirm(\"Yakin ingin menghapus data ini?\")'>Hapus</a></td></tr>";
          $no++;
        }
        ?>
      </tbody>
    </table>
  </div>
</div>

<?php include('../includes/footer.php'); ?>
