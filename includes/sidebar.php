<?php
if (session_status() === PHP_SESSION_NONE) session_start();
?>
<div class="sidebar bg-light vh-100 p-3 no-print">
  <h4>Menu</h4>
  <ul class="nav flex-column">
    <li class="nav-item"><a class="nav-link" href="/SPK_Maintenance/pages/dashboard.php">Dashboard</a></li>

    <?php if(isset($_SESSION['role']) && $_SESSION['role'] === 'admin'): ?>
      <li class="nav-item"><a class="nav-link" href="/SPK_Maintenance/pages/data_kriteria.php">Data Kriteria</a></li>
      <li class="nav-item"><a class="nav-link" href="/SPK_Maintenance/pages/data_subkriteria.php">Data Sub Kriteria</a></li>
      <li class="nav-item"><a class="nav-link" href="/SPK_Maintenance/pages/data_alternatif.php">Data Alternatif</a></li>
      <li class="nav-item"><a class="nav-link" href="/SPK_Maintenance/pages/data_perhitungan.php">Data Perhitungan</a></li>
      <li class="nav-item"><a class="nav-link" href="/SPK_Maintenance/pages/data_hasil.php">Data Hasil Akhir</a></li>
      <li class="nav-item"><a class="nav-link" href="/SPK_Maintenance/pages/profil.php">Profil</a></li>
    <?php else: ?>
      <li class="nav-item"><a class="nav-link" href="/SPK_Maintenance/pages/data_alternatif.php">Data Alternatif</a></li>
      <li class="nav-item"><a class="nav-link" href="/SPK_Maintenance/pages/data_hasil.php">Data Hasil Akhir</a></li>
    <?php endif; ?>
  </ul>
</div>
