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
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top no-print">
  <div class="container-fluid">
    <a class="navbar-brand ms-3" href="/SPK_Maintenance/index.php">KeputusanEQU</a>
    <div class="ms-auto text-white">
      <?php if(isset($_SESSION['username'])):
          $displayName = $_SESSION['nama_pengguna'] ?? $_SESSION['username'] ?? '';
      ?>
        <span class="me-3">Logged as: <strong><?=htmlspecialchars($displayName)?></strong> (<?=htmlspecialchars($_SESSION['role'] ?? '')?>)</span>
        <a href="/SPK_Maintenance/process/logout.php" class="btn btn-sm btn-light">Logout</a>
      <?php else: ?>
        <a href="/SPK_Maintenance/login.php" class="btn btn-sm btn-light">Login</a>
      <?php endif; ?>
    </div>
  </div>
</nav>
<div class="container-fluid">
  <div class="row">
