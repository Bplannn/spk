<?php
session_start();
include('../config/db.php');
include('../includes/header.php');

// Ambil data user
$id_user = $_SESSION['id_user'];
$query = $koneksi->query("SELECT * FROM users WHERE id_user = '$id_user'");
$data = $query->fetch_assoc();

$showModalSuccess = ""; // untuk menampilkan modal sukses

// =============== UPDATE NAMA ===============
if (isset($_POST['update_nama'])) {

    $nama_pengguna = $_POST['nama_pengguna'];

    $update = $koneksi->query("
        UPDATE users SET nama_pengguna = '$nama_pengguna'
        WHERE id_user = '$id_user'
    ");

    if ($update) {
        $_SESSION['nama_pengguna'] = $nama_pengguna;
        $showModalSuccess = "nama"; // trigger modal sukses
    }
}

// =============== GANTI PASSWORD ===============
if (isset($_POST['ganti_password'])) {

    $password_baru = $_POST['password_baru'];

    // sesuai permintaan: SIMPAN PLAIN TEXT
    $updatePw = $koneksi->query("
        UPDATE users SET password = '$password_baru'
        WHERE id_user = '$id_user'
    ");

    if ($updatePw) {
        $showModalSuccess = "password"; // trigger modal sukses
    }
}

?>

<div class="container-fluid">
  <div class="row">

    <!-- SIDEBAR -->
    <?php include('../includes/sidebar.php'); ?>

    <!-- KONTEN PROFIL -->
    <div class="col-10 p-4 page-content">

      <h3>Profil Pengguna</h3>
      <p>Perbarui informasi profil Anda.</p>

      <div class="card p-4" style="max-width: 500px;">

        <!-- DATA NAMA -->
        <div class="mb-3">
          <label class="form-label">Nama Anda Saat Ini</label>
          <input type="text" class="form-control" value="<?= $data['nama_pengguna']; ?>" disabled>
        </div>

        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalNama">
          Ganti Nama
        </button>

        <hr>

        <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#modalPassword">
          Ganti Password
        </button>

      </div>

    </div>
  </div>
</div>


<!-- ====================== MODAL GANTI NAMA ====================== -->
<div class="modal fade" id="modalNama" tabindex="-1">
  <div class="modal-dialog">
    <form method="POST" class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Ganti Nama</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <div class="modal-body">

        <div class="mb-3">
          <label class="form-label">Nama Baru</label>
          <input type="text" class="form-control" name="nama_pengguna"
                 value="<?= $data['nama_pengguna']; ?>" required>
        </div>

      </div>

      <div class="modal-footer">
        <button type="submit" name="update_nama" class="btn btn-success">Simpan</button>
      </div>

    </form>
  </div>
</div>


<!-- ====================== MODAL GANTI PASSWORD ====================== -->
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


<!-- MODAL SUKSES -->
<div class="modal fade" id="modalSuccess" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content text-center p-4">
      <h4 class="text-success mb-3">Berhasil!</h4>
      <p id="modalSuccessMsg"></p>
      <button class="btn btn-primary mt-3" data-bs-dismiss="modal">OK</button>
    </div>
  </div>
</div>

<!-- BOOTSTRAP JS (WAJIB ADA) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<?php if ($showModalSuccess !== ""): ?>
<script>
document.addEventListener("DOMContentLoaded", function () {
    const modalSuccess = new bootstrap.Modal(document.getElementById('modalSuccess'));

    // Set pesan berdasarkan PHP
    <?php if ($showModalSuccess === "nama"): ?>
        document.getElementById("modalSuccessMsg").textContent = "Nama berhasil diperbarui.";
    <?php elseif ($showModalSuccess === "password"): ?>
        document.getElementById("modalSuccessMsg").textContent = "Password berhasil diganti.";
    <?php endif; ?>

    modalSuccess.show();
});
</script>
<?php endif; ?>

<?php include('../includes/footer.php'); ?>
