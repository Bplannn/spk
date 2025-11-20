<?php
session_start();
include('config/db.php');

$err = '';
$success = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $id = "mc-" . substr(md5(rand()), 0, 8);
    $username = trim($_POST['username']);
    $nama     = trim($_POST['nama_pengguna']);
    $password = $_POST['password']; // plaintext sesuai permintaan
    $role     = "user";

    // Cek duplikat username
    $cek = $koneksi->prepare("SELECT username FROM users WHERE username=?");
    $cek->bind_param("s", $username);
    $cek->execute();
    $res = $cek->get_result();

    if ($res->num_rows > 0) {
        $err = "Username sudah digunakan!";
    } else {
        $stmt = $koneksi->prepare("INSERT INTO users (id_user, username, nama_pengguna, password, role) VALUES (?,?,?,?,?)");
        $stmt->bind_param("sssss", $id, $username, $nama, $password, $role);
        $stmt->execute();

        $success = "Registrasi berhasil! Silakan login.";
    }
}
?>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>Register</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="p-4">
  <div class="container" style="max-width:420px">

    <h3>Register</h3>

    <?php if($err): ?>
      <div class="alert alert-danger"><?= htmlspecialchars($err) ?></div>
    <?php endif; ?>

    <?php if($success): ?>
      <div class="alert alert-success"><?= htmlspecialchars($success) ?></div>
    <?php endif; ?>

    <form method="post">
      <div class="mb-2"><input required name="nama_pengguna" class="form-control" placeholder="Nama Pengguna"></div>
      <div class="mb-2"><input required name="username" class="form-control" placeholder="Username"></div>
      <div class="mb-2"><input required name="password" type="password" class="form-control" placeholder="Password"></div>
      <button class="btn btn-primary w-100">Register</button>
    </form>

    <hr>
    <a href="login.php" class="btn btn-outline-secondary w-100">Login</a>

  </div>
</body>
</html>
