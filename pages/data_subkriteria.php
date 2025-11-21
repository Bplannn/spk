<?php
include('../config/db.php');
include('../includes/header.php');
include('../includes/sidebar.php');
?>

<h3>Data Sub Kriteria</h3>

<div class="row mt-4">
  <div class="col-md-6">
    <!-- Grade (top) -->
    <div class="card mb-3">
      <div class="card-body">
        <h5 class="card-title">Grade</h5>
        <form action="../process/insert_subkriteria.php" method="post" class="input-group mb-2">
          <input type="hidden" name="target" value="grade">
          <input name="name" class="form-control" placeholder="Grade name (A)">
          <input name="point" type="number" class="form-control" placeholder="Point (5)">
          <button class="btn btn-success">Tambah</button>
        </form>
        <table class="table table-sm">
          <thead><tr><th>Grade</th><th>Point</th><th>Aksi</th></tr></thead>
          <tbody>
          <?php
          $gr = $koneksi->query("SELECT * FROM grade ORDER BY id_grade");
          while($g = $gr->fetch_assoc()):
          ?>
            <tr>
              <td><?= htmlspecialchars($g['grade_name']) ?></td>
              <td><?= (int)$g['grade_point'] ?></td>
              <td>
                <a href="data_subkriteria.php?edit=grade&id=<?= $g['id_grade'] ?>" class="btn btn-icon btn-sm btn-warning" title="Edit">
                  <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25z" stroke="currentColor" stroke-width="0" fill="currentColor"/></svg>
                </a>
                <a href="../process/delete_subkriteria.php?target=grade&id=<?= $g['id_grade'] ?>" class="btn btn-icon btn-sm btn-danger" title="Hapus" onclick="return confirm('Yakin ingin menghapus grade ini?')">
                  <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M3 6h18" stroke="currentColor" stroke-width="2" stroke-linecap="round"/><path d="M8 6v14c0 1.1.9 2 2 2h4c1.1 0 2-.9 2-2V6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/><path d="M10 11v6M14 11v6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></svg>
                </a>
              </td>
            </tr>
          <?php endwhile; ?>
          </tbody>
        </table>
      </div>
    </div>

    <!-- Inspection Period (below Grade) -->
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Inspection Period</h5>
        <form action="../process/insert_subkriteria.php" method="post" class="input-group mb-2">
          <input type="hidden" name="target" value="inspection_period">
          <input name="name" class="form-control" placeholder="Period name (2-4)">
          <input name="point" type="number" class="form-control" placeholder="Point (5)">
          <button class="btn btn-success">Tambah</button>
        </form>
        <table class="table table-sm">
          <thead><tr><th>Period</th><th>Point</th><th>Aksi</th></tr></thead>
          <tbody>
          <?php
          $pr = $koneksi->query("SELECT * FROM inspection_period ORDER BY id_inspection_period");
          while($p = $pr->fetch_assoc()):
          ?>
            <tr>
              <td><?= htmlspecialchars($p['period_name']) ?></td>
              <td><?= (int)$p['period_point'] ?></td>
              <td>
                <a href="data_subkriteria.php?edit=inspection_period&id=<?= $p['id_inspection_period'] ?>" class="btn btn-icon btn-sm btn-warning" title="Edit">
                  <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25z" stroke="currentColor" stroke-width="0" fill="currentColor"/></svg>
                </a>
                <a href="../process/delete_subkriteria.php?target=inspection_period&id=<?= $p['id_inspection_period'] ?>" class="btn btn-icon btn-sm btn-danger" title="Hapus" onclick="return confirm('Yakin ingin menghapus period ini?')">
                  <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M3 6h18" stroke="currentColor" stroke-width="2" stroke-linecap="round"/><path d="M8 6v14c0 1.1.9 2 2 2h4c1.1 0 2-.9 2-2V6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/><path d="M10 11v6M14 11v6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></svg>
                </a>
              </td>
            </tr>
          <?php endwhile; ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <div class="col-md-6">
    <!-- Classification (right column) -->
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Classification</h5>
        <form action="../process/insert_subkriteria.php" method="post" class="input-group mb-2">
          <input type="hidden" name="target" value="classification">
          <input name="name" class="form-control" placeholder="Classification name (Rotating work)">
          <input name="point" type="number" class="form-control" placeholder="Point (4)">
          <button class="btn btn-success">Tambah</button>
        </form>
        <table class="table table-sm">
          <thead><tr><th>Classification</th><th>Point</th><th>Aksi</th></tr></thead>
          <tbody>
          <?php
          $cr = $koneksi->query("SELECT * FROM classification ORDER BY id_classification");
          while($c = $cr->fetch_assoc()):
          ?>
            <tr>
              <td><?= htmlspecialchars($c['classification_name']) ?></td>
              <td><?= (int)$c['classification_point'] ?></td>
              <td>
                <a href="data_subkriteria.php?edit=classification&id=<?= $c['id_classification'] ?>" class="btn btn-icon btn-sm btn-warning" title="Edit">
                  <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25z" stroke="currentColor" stroke-width="0" fill="currentColor"/></svg>
                </a>
                <a href="../process/delete_subkriteria.php?target=classification&id=<?= $c['id_classification'] ?>" class="btn btn-icon btn-sm btn-danger" title="Hapus" onclick="return confirm('Yakin ingin menghapus classification ini?')">
                  <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"><path d="M3 6h18" stroke="currentColor" stroke-width="2" stroke-linecap="round"/><path d="M8 6v14c0 1.1.9 2 2 2h4c1.1 0 2-.9 2-2V6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/><path d="M10 11v6M14 11v6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></svg>
                </a>
              </td>
            </tr>
          <?php endwhile; ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

