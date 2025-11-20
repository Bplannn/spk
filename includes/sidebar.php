<?php
// sidebar column
if (session_status() === PHP_SESSION_NONE) session_start();
?>
<div class="col-2 bg-light sidebar vh-100 p-3 no-print">
  <?php $cur = basename($_SERVER['PHP_SELF']); ?>
  <div class="d-flex align-items-center mb-3">
    <strong style="color:var(--accent-1)">KeputusanEQU</strong>
  </div>
  <ul class="nav flex-column">
    <li class="nav-item"><a class="nav-link <?= $cur=='dashboard.php' ? 'active' : '' ?>" href="/SPK_Maintenance/pages/dashboard.php">🏠 Dashboard</a></li>
    <?php if(isset($_SESSION['role']) && $_SESSION['role'] === 'admin'): ?>
      <li class="nav-item"><a class="nav-link <?= $cur=='data_kriteria.php' ? 'active' : '' ?>" href="/SPK_Maintenance/pages/data_kriteria.php">📊 Data Kriteria</a></li>
      <li class="nav-item"><a class="nav-link <?= $cur=='data_subkriteria.php' ? 'active' : '' ?>" href="/SPK_Maintenance/pages/data_subkriteria.php">🧾 Data Sub-kriteria</a></li>
      <li class="nav-item"><a class="nav-link <?= $cur=='data_alternatif.php' ? 'active' : '' ?>" href="/SPK_Maintenance/pages/data_alternatif.php">🔧 Data Alternatif</a></li>
      <li class="nav-item"><a class="nav-link <?= $cur=='data_perhitungan.php' ? 'active' : '' ?>" href="/SPK_Maintenance/pages/data_perhitungan.php">🧮 Data Perhitungan</a></li>
      <li class="nav-item"><a class="nav-link <?= $cur=='data_hasil.php' ? 'active' : '' ?>" href="/SPK_Maintenance/pages/data_hasil.php">📈 Data Hasil Akhir</a></li>
      <li class="nav-item"><a class="nav-link <?= $cur=='profil.php' ? 'active' : '' ?>" href="/SPK_Maintenance/pages/profil.php">⚙ Profil</a></li>
    <?php else: ?>
      <li class="nav-item"><a class="nav-link <?= $cur=='data_alternatif.php' ? 'active' : '' ?>" href="/SPK_Maintenance/pages/data_alternatif.php">🔧 Data Alternatif</a></li>
      <li class="nav-item"><a class="nav-link <?= $cur=='data_hasil.php' ? 'active' : '' ?>" href="/SPK_Maintenance/pages/data_hasil.php">📈 Data Hasil Akhir</a></li>
    <?php endif; ?>
  </ul>
</div>
<div class="col-10 p-4 page-content">
