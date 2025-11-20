<?php
session_start();
include('config/db.php');

$err = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $u = $_POST['username'] ?? '';
    $p = $_POST['password'] ?? '';

    // Query cek user
    $stmt = $koneksi->prepare("SELECT id_user, username, nama_pengguna, password, role FROM users WHERE username = ?");
    $stmt->bind_param("s", $u);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 1) {
        $row = $result->fetch_assoc();

        // password masih plaintext sesuai permintaan
        if ($p === $row['password']) {

            $_SESSION['id_user']       = $row['id_user'];
            $_SESSION['username']      = $row['username'];
            $_SESSION['nama_pengguna'] = $row['nama_pengguna'];
            $_SESSION['role']          = $row['role'];

            header('Location: pages/dashboard.php');
            exit;

        } else {
            $err = 'Password salah.';
        }
    } else {
        $err = 'Username tidak ditemukan.';
    }
}
?>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="p-4">
  <div class="container" style="max-width:420px">
    <h3>Login</h3>

    <?php if($err): ?>
      <div class="alert alert-danger"><?= htmlspecialchars($err) ?></div>
    <?php endif; ?>

    <form method="post">
      <div class="mb-2"><input name="username" class="form-control" placeholder="Username"></div>
      <div class="mb-2"><input name="password" type="password" class="form-control" placeholder="Password"></div>

      <button class="btn btn-primary w-100">Login</button>
    </form>

    <hr>
    <a href="register.php" class="btn btn-outline-secondary w-100">Register</a>
  </div>
</body>
</html>
