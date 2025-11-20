<?php
// simple login page (hard-coded users)
session_start();
$err = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $u = $_POST['username'] ?? '';
    $p = $_POST['password'] ?? '';
    // hard-coded users: admin/admin, user/user
    if ($u === 'admin' && $p === 'admin') {
        $_SESSION['username'] = 'admin';
        $_SESSION['role'] = 'admin';
        header('Location: pages/dashboard.php'); exit;
    } elseif ($u === 'user' && $p === 'user') {
      $_SESSION['username'] = 'user';
      $_SESSION['role'] = 'user';
      header('Location: pages/dashboard.php'); exit;
    } else {
        $err = 'Username atau password salah.';
    }
}
include 'includes/header.php';
?>

<div class="container mt-5">
  <div class="row align-items-center" style="min-height:65vh">
    <div class="col-md-7 d-none d-md-block">
      <h1 style="color:var(--accent-1);font-size:48px;margin-bottom:12px">KeputusanEQU</h1>
      <p style="color:#6b7785;max-width:640px;line-height:1.6">Aplikasi penunjang keputusan dengan metode SAW. Kelola kriteria, alternatif, dan jalankan perhitungan untuk mendapatkan rekomendasi equipment.</p>
    </div>
    <div class="col-12 col-md-5">
      <div class="card login-card p-3">
        <div class="card-body">
          <h4 class="mb-3">Login Account</h4>
          <?php if($err): ?><div class="alert alert-danger auto-dismiss"><?=htmlspecialchars($err)?></div><?php endif; ?>
          <form method="post">
            <div class="mb-3">
              <input name="username" class="form-control" placeholder="Username" required>
            </div>
            <div class="mb-3">
              <input name="password" type="password" class="form-control" placeholder="Password" required>
            </div>
            <div class="d-grid">
              <button class="btn btn-primary">Login</button>
            </div>
          </form>
          <div class="login-hint mt-3">Gunakan <strong>admin/admin</strong> atau <strong>user/user</strong></div>
        </div>
      </div>
    </div>
  </div>
</div>

<?php include 'includes/footer.php'; ?>