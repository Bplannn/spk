<?php
$host = "localhost";
$user = "root";
$pass = "";
$db   = "spk3";

$koneksi = new mysqli($host, $user, $pass, $db);
if ($koneksi->connect_error) {
    die("Koneksi gagal: " . $koneksi->connect_error);
}
$koneksi->set_charset("utf8mb4");
?>
