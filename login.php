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

<div class="container d-flex justify-content-center align-items-center" 
     style="min-height:100vh;">

  <div class="row w-100 d-flex justify-content-center align-items-center"
       style="max-width:1100px;">

    <!-- Kolom Teks Aplikasi -->
    <div class="col-12 col-md-6 text-center text-md-start mb-4 mb-md-0">

  <h1 style="color:var(--accent-1);font-size:48px;font-weight:700;">
    KeputusanEQU
  </h1>

  <p class="desc-app"
     style="color:#6b7785;line-height:1.6;font-size:16px;max-width:420px;">
    Aplikasi penunjang keputusan dengan metode SAW.<br>
    Kelola kriteria, alternatif, dan hasil rekomendasi equipment.
  </p>

</div>


    <!-- Kolom Form Login -->
    <div class="col-12 col-md-6 d-flex justify-content-center">
      <div class="card login-card p-4 w-100" style="max-width:380px;">
        <div class="card-body">
          <h4 class="mb-3 text-center">Login Account</h4>

          <?php if($err): ?>
            <div class="alert alert-danger auto-dismiss text-center">
              <?=htmlspecialchars($err)?>
            </div>
          <?php endif; ?>

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

         
        </div>
      </div>
    </div>

  </div>
</div>

<?php include 'includes/footer.php'; ?>