<?php
// include this at top of pages
if (session_status() === PHP_SESSION_NONE) session_start();
?>
<!doctype html>
<html lang="id">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>SPK SAW - Maintenance</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
  <link href="/SPK_Maintenance/style.css" rel="stylesheet">
  <style>
    body { padding-top: 56px; font-family: 'Poppins', sans-serif; background: #f6f7fb; }
    .sidebar { min-width:220px; max-width:220px; }
    /* header tweaks to make navbar match dashboard look */
    .navbar { background: linear-gradient(90deg,#538CDF,#6FA8E6) !important; }
    .navbar-brand { font-weight:700; color: #fff !important; }
    .navbar .ms-auto { color: #fff; }
    .navbar .btn-light { background: rgba(255,255,255,0.9); }
  </style>
</head>
<!-- Logout Confirmation Modal -->
<div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      
      <div class="modal-header">
        <h5 class="modal-title" id="logoutModalLabel">Konfirmasi Logout</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>

      <div class="modal-body">
        Anda yakin ingin logout dari aplikasi?
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
        <a href="/SPK_Maintenance/process/logout.php" class="btn btn-danger">Logout</a>
      </div>

    </div>
  </div>
</div>


<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top no-print">
  <div class="container-fluid">
    <a class="navbar-brand ms-3" href="/SPK_Maintenance/index.php">KeputusanEQU</a>
    <button class="sidebar-toggle d-md-none" aria-label="Toggle menu" title="Menu">
      <!-- small menu icon (3 bars) -->
      <svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
        <path d="M3 6h18M3 12h18M3 18h18" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
    </button>
    <div class="ms-auto text-white">
      <?php if(isset($_SESSION['username'])):
          $displayName = $_SESSION['nama_pengguna'] ?? $_SESSION['username'] ?? '';
      ?>
        <span class="me-3">Logged as: <strong><?=htmlspecialchars($displayName)?></strong> (<?=htmlspecialchars($_SESSION['role'] ?? '')?>)</span>
        <button class="btn btn-sm btn-light" data-bs-toggle="modal" data-bs-target="#logoutModal">
          Logout
        </button>

      <?php else: ?>
        <a href="/SPK_Maintenance/login.php" class="btn btn-sm btn-light">Login</a>
      <?php endif; ?>
    </div>
  </div>
</nav>
<div class="container-fluid">
  <div class="row">
