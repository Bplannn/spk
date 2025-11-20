<?php
include('../config/db.php');

$l = $koneksi->real_escape_string($_POST['criteria_name'] ?? '');
$w = (float)($_POST['weight'] ?? 0);
$t = $koneksi->real_escape_string($_POST['type'] ?? 'benefit');

// generate simple id if not provided
$id = $_POST['id_criteria'] ?? null;
if (!$id) {
	$id = 'c_' . substr(md5(uniqid('', true)), 0, 8);
}

$stmt = $koneksi->prepare("INSERT INTO criteria_weight (id_criteria, criteria_name, weight, type) VALUES (?, ?, ?, ?)");
if ($stmt) {
	// types: s (string), d (double), s (string) -> use "sds"
	$stmt->bind_param("sds", $id, $l, $w);
	// mysqli requires exact number of params; we'll append type via separate query
	// safer: use full bind with proper order
	$stmt = $koneksi->prepare("INSERT INTO criteria_weight (id_criteria, criteria_name, weight, type) VALUES (?, ?, ?, ?)");
	$stmt->bind_param("sds", $id, $l, $w);
	// rebind with correct signature: s s d s
	$stmt->close();
	$stmt = $koneksi->prepare("INSERT INTO criteria_weight (id_criteria, criteria_name, weight, type) VALUES (?,?,?,?)");
	$stmt->bind_param("ssds", $id, $l, $w, $t);
	$stmt->execute();
}

header("Location: ../pages/data_kriteria.php");
