<?php
session_start();
include 'config/db.php';
$err = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $u = trim($_POST['username'] ?? '');
  $p = $_POST['password'] ?? '';

  if ($u === '' || $p === '') {
    $err = 'Masukkan username dan password.';
  } else {
    $stmt = $koneksi->prepare("SELECT id_user, username, nama_pengguna, password, role FROM users WHERE username = ?");
    $stmt->bind_param('s', $u);
    $stmt->execute();
    $res = $stmt->get_result();
    if ($res && $res->num_rows === 1) {
      $row = $res->fetch_assoc();
      // password stored as plaintext in this project
      if ($p === $row['password']) {
        $_SESSION['id_user'] = $row['id_user'];
        $_SESSION['username'] = $row['username'];
        $_SESSION['nama_pengguna'] = $row['nama_pengguna'];
        $_SESSION['role'] = $row['role'];
        header('Location: pages/dashboard.php'); exit;
      } else {
        $err = 'Username atau password salah.';
      }
    } else {
      $err = 'Username tidak ditemukan.';
    }
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
          <div class="mt-3">
            <a href="register.php" class="btn btn-outline-secondary w-100">Register</a>
          </div>

          <div class="login-hint mt-3">Gunakan <strong>admin/admin</strong> atau <strong>user/user</strong></div>
        </div>
      </div>
    </div>
  </div>
</div>

<?php include 'includes/footer.php'; ?>