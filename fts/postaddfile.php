<?php

require "connection/connection.php";

if (!isset($_SESSION['user'])) {
    header("location: index.php");
    die();
} 

$attached = null;
if (isset($_FILES["fileupload"])) {
    $attached = md5(random_bytes(35));
    $filename = $_FILES["fileupload"]["name"];
    $extention = explode(".", $filename)[count(explode(".", $filename)) - 1];
    $attached .= ".".$extention;
    move_uploaded_file($_FILES["fileupload"]["tmp_name"], __DIR__ . "/file/$attached");
}
$file_id = ($_POST["file_id"]);
$file_name = ($_POST["file_name"]);
$description = ($_POST["description"]);

$rawQuery = "INSERT INTO `files` (`hardid`, `filename`, `attachment`, `description`, `user_id`) VALUES ('%s', '%s', '%s', '%s', '%d');";
$query = sprintf($rawQuery, $file_id, $file_name, $attached, $description, $_SESSION['user']);
$result = mysqli_query($connection, $query,MYSQLI_USE_RESULT );

$fileid = mysqli_insert_id($connection);

// Movement
$rawMovementQuery = "INSERT INTO `movements` (`from_id`, `file_id`, `to_id`) VALUES ('%d', '%d', '%d');";
$movementQuery = sprintf($rawMovementQuery, $_SESSION['user'] , $fileid, $_SESSION['user']);
$result = mysqli_query($connection, $movementQuery);

header("location: files.php");

?>