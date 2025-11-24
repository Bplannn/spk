<?php
session_start();
include('../config/db.php');
include('../includes/header.php');

// Pastikan user login
if (!isset($_SESSION['id_user'])) {
    header('Location: ../login.php');
    exit;
}

$id_user = $_SESSION['id_user'];
$role = $_SESSION['role'] ?? 'user';

// helper: ambil data user terbaru
function get_user($koneksi, $id_user) {
    $stmt = $koneksi->prepare("SELECT id_user, username, nama_pengguna, password, role FROM users WHERE id_user = ?");
    $stmt->bind_param("s", $id_user);
    $stmt->execute();
    $res = $stmt->get_result();
    return $res ? $res->fetch_assoc() : null;
}

$data = get_user($koneksi, $id_user);

// flags untuk modal
$showModalSuccess = "";   // "nama" atau "password"
$add_success = "";
$add_error = "";

/* ================= UPDATE NAMA ================= */
if (isset($_POST['update_nama'])) {
    $nama_pengguna = trim($_POST['nama_pengguna'] ?? '');
    if ($nama_pengguna === '') {
        // ignore empty
    } else {
        $stmt = $koneksi->prepare("UPDATE users SET nama_pengguna = ? WHERE id_user = ?");
        $stmt->bind_param("ss", $nama_pengguna, $id_user);
        if ($stmt->execute()) {
            $_SESSION['nama_pengguna'] = $nama_pengguna;
            $showModalSuccess = "nama";
            // reload data
            $data = get_user($koneksi, $id_user);
        } else {
            // leave empty or set error variable if needed
        }
    }
}

/* ================= GANTI PASSWORD (PLAIN TEXT) ================= */
if (isset($_POST['ganti_password'])) {
    $password_baru = $_POST['password_baru'] ?? '';
    if ($password_baru !== '') {
        $stmt = $koneksi->prepare("UPDATE users SET password = ? WHERE id_user = ?");
        $stmt->bind_param("ss", $password_baru, $id_user);
        if ($stmt->execute()) {
            $showModalSuccess = "password";
            // reload data
            $data = get_user($koneksi, $id_user);
        }
    }
}

/* ============== TAMBAH AKUN (HANYA ADMIN) ============== */
if ($role === 'admin' && isset($_POST['add_account'])) {
    $new_name = trim($_POST['new_nama'] ?? '');
    $new_user = trim($_POST['new_username'] ?? '');
    $new_pass = $_POST['new_password'] ?? '';
    $new_role = $_POST['new_role'] ?? 'user';

    // basic validation
    if ($new_name === '' || $new_user === '' || $new_pass === '') {
        $add_error = "Semua field wajib diisi.";
    } else {
        // cek duplicate username
        $cek = $koneksi->prepare("SELECT username FROM users WHERE username = ?");
        $cek->bind_param("s", $new_user);
        $cek->execute();
        $res = $cek->get_result();
        if ($res && $res->num_rows > 0) {
            $add_error = "Username sudah dipakai!";
        } else {
            $new_id = "mc-" . substr(md5(rand()), 0, 8);
            $stmt = $koneksi->prepare("INSERT INTO users (id_user, username, nama_pengguna, password, role) VALUES (?,?,?,?,?)");
            $stmt->bind_param("sssss", $new_id, $new_user, $new_name, $new_pass, $new_role);
            if ($stmt->execute()) {
                $add_success = "Akun baru berhasil dibuat!";
            } else {
                $add_error = "Gagal membuat akun: " . $koneksi->error;
            }
        }
    }
    // don't auto-open other modals — modalAddAccount will be triggered below if needed
}

?>

<div class="container-fluid">
  <div class="row">

    <!-- SIDEBAR -->
    <?php include('../includes/sidebar.php'); ?>

    <!-- KONTEN PROFIL -->
    <div class="col-10 p-4 page-content">

      <h3>Profil Pengguna</h3>
      <p>Kelola informasi akun Anda.</p>

      <div class="card p-4" style="max-width: 600px;">

        <!-- TAMPILAN DATA -->
        <div class="mb-3">
          <label class="form-label">Nama Anda Saat Ini</label>
          <input type="text" class="form-control" value="<?= htmlspecialchars($data['nama_pengguna'] ?? '') ?>" disabled>
        </div>

        <div class="mb-3">
          <label class="form-label">Username</label>
          <input type="text" class="form-control" value="<?= htmlspecialchars($data['username'] ?? '') ?>" disabled>
        </div>

        <!-- tombol ubah nama & password -->
        <div class="d-flex gap-2 mb-3">
          <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalNama">Ubah Nama</button>
          <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#modalPassword">Ganti Password</button>
          <?php if ($role === 'admin'): ?>
            <button class="btn btn-success ms-auto" data-bs-toggle="modal" data-bs-target="#modalAddAccount">+ Tambah Akun Baru</button>
          <?php endif; ?>
        </div>

        <small class="text-muted">Role: <strong><?= htmlspecialchars($data['role'] ?? $role) ?></strong></small>

      </div>

    </div>
  </div>
</div>

<!-- MODAL: UBAH NAMA -->
<div class="modal fade" id="modalNama" tabindex="-1">
  <div class="modal-dialog">
    <form method="POST" class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Ubah Nama Pengguna</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <div class="mb-3">
          <label class="form-label">Nama Baru</label>
          <input type="text" name="nama_pengguna" class="form-control" value="<?= htmlspecialchars($data['nama_pengguna'] ?? '') ?>" required>
        </div>
      </div>
      <div class="modal-footer">
        <button type="submit" name="update_nama" class="btn btn-success">Simpan</button>
      </div>
    </form>
  </div>
</div>

<!-- MODAL: GANTI PASSWORD -->
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
          <input type="password" name="password_baru" class="form-control" required>
        </div>
      </div>
      <div class="modal-footer">
        <button type="submit" name="ganti_password" class="btn btn-success">Ubah Password</button>
      </div>
    </form>
  </div>
</div>

<!-- MODAL: TAMBAH AKUN (Hanya admin) -->
<div class="modal fade" id="modalAddAccount" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <form method="POST">
        <div class="modal-header">
          <h5 class="modal-title">Tambah Akun Baru</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>

        <div class="modal-body">

          <?php if ($add_error): ?>
            <div class="alert alert-danger"><?= htmlspecialchars($add_error) ?></div>
          <?php endif; ?>

          <?php if ($add_success): ?>
            <div class="alert alert-success"><?= htmlspecialchars($add_success) ?></div>
          <?php endif; ?>

          <input type="hidden" name="add_account" value="1">

          <div class="mb-2">
            <label class="form-label">Nama Pengguna</label>
            <input name="new_nama" class="form-control" required>
          </div>

          <div class="mb-2">
            <label class="form-label">Username</label>
            <input name="new_username" class="form-control" required>
          </div>

          <div class="mb-2">
            <label class="form-label">Password</label>
            <input name="new_password" type="password" class="form-control" required>
          </div>

          <div class="mb-2">
            <label class="form-label">Role</label>
            <select name="new_role" class="form-select" required>
              <option value="user">User</option>
              <option value="admin">Admin</option>
            </select>
          </div>

        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
          <button class="btn btn-primary">Simpan</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- MODAL SUKSES -->
<div class="modal fade" id="modalSuccess" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content text-center p-4">
      <h4 class="text-success mb-3">Berhasil!</h4>
      <p id="modalSuccessMsg"></p>
      <button class="btn btn-primary mt-3" data-bs-dismiss="modal">OK</button>
    </div>
  </div>
</div>

<!-- Bootstrap bundle (Popper + JS) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
document.addEventListener("DOMContentLoaded", function () {
    // show modal success if update name/password succeeded
    <?php if ($showModalSuccess === "nama"): ?>
        var m = new bootstrap.Modal(document.getElementById('modalSuccess'));
        document.getElementById('modalSuccessMsg').textContent = "Nama berhasil diperbarui.";
        m.show();
    <?php elseif ($showModalSuccess === "password"): ?>
        var m = new bootstrap.Modal(document.getElementById('modalSuccess'));
        document.getElementById('modalSuccessMsg').textContent = "Password berhasil diganti.";
        m.show();
    <?php endif; ?>

    // show modalAddAccount only if add_success or add_error set (admin actions)
    <?php if ($add_success || $add_error): ?>
        var ma = new bootstrap.Modal(document.getElementById('modalAddAccount'));
        ma.show();
    <?php endif; ?>
});
</script>

<?php include('../includes/footer.php'); ?>
