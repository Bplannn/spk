<?php
include('../config/db.php');
$target = $_POST['target'];
$name = $koneksi->real_escape_string($_POST['name']);
$point = (int)$_POST['point'];

if($target === 'grade'){
  $stmt = $koneksi->prepare("INSERT INTO grade (grade_name, grade_point) VALUES (?,?)");
  $stmt->bind_param("si",$name,$point);
} elseif($target === 'classification'){
  $stmt = $koneksi->prepare("INSERT INTO classification (classification_name, classification_point) VALUES (?,?)");
  $stmt->bind_param("si",$name,$point);
} elseif($target === 'inspection_period'){
  $stmt = $koneksi->prepare("INSERT INTO inspection_period (period_name, period_point) VALUES (?,?)");
  $stmt->bind_param("si",$name,$point);
} else {
  // unknown target -> redirect
  header("Location: ../pages/data_subkriteria.php");
  exit;
}
$stmt->execute();
header("Location: ../pages/data_subkriteria.php");
