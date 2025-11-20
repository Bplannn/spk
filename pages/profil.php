<?php
session_start();
include('../config/db.php');
include('../includes/header.php');

// Ambil data user
$id_user = $_SESSION['id_user'];
$query = $koneksi->query("SELECT * FROM users WHERE id_user = '$id_user'");
$data = $query->fetch_assoc();

// Update nama pengguna
if (isset($_POST['update_profil'])) {
    $nama_pengguna = $_POST['nama_pengguna'];

    $update = $koneksi->query("
        UPDATE users SET nama_pengguna = '$nama_pengguna'
        WHERE id_user = '$id_user'
    ");

    if ($update) {
        $_SESSION['nama_pengguna'] = $nama_pengguna;
        echo "<script>alert('Profil diperbarui!'); window.location='profil.php';</script>";
    } else {
        echo "<script>alert('Gagal memperbarui profil!');</script>";
    }
}

// Ganti password (plain text)
if (isset($_POST['ganti_password'])) {
    $password_baru = $_POST['password_baru'];

    $updatePw = $koneksi->query("
        UPDATE users SET password = '$password_baru'
        WHERE id_user = '$id_user'
    ");

    if ($updatePw) {
        echo "<script>alert('Password diganti!'); window.location='profil.php';</script>";
    } else {
        echo "<script>alert('Gagal mengganti password!');</script>";
    }
}
?>

<div class="container-fluid">
  <div class="row">

    <!-- Sidebar -->
    <?php include('../includes/sidebar.php'); ?>

    <!-- Konten Profil -->
    <div class="col-10 p-4 page-content">

      <h3>Profil Pengguna</h3>
      <p>Perbarui informasi profil Anda.</p>

      <div class="card p-4" style="max-width: 500px;">

        <form method="POST">
          <div class="mb-3">
            <label class="form-label">Nama Pengguna</label>
            <input type="text" class="form-control" name="nama_pengguna"
                   value="<?= $data['nama_pengguna']; ?>" required>
          </div>

          <button type="submit" name="update_profil" class="btn btn-primary">Simpan Perubahan</button>
        </form>

        <hr>

        <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#modalPassword">
          Ganti Password
        </button>

      </div>

    </div>

  </div>
</div>

<!-- MODAL GANTI PASSWORD -->
<div class="modal fade" id="modalPassword" tabindex="-1">
  <div class="modal-dialog">
    <form method="POST" class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Ganti Password</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body">

        <div class="mb-3">
          <label class="form-label">Password Baru</label>
          <input type="password" class="form-control" name="password_baru" required>
        </div>

      </div>

      <div class="modal-footer">
        <button type="submit" name="ganti_password" class="btn btn-success">Ubah Password</button>
      </div>

    </form>
  </div>
</div>

<?php include('../includes/footer.php'); ?>
