<?php

require "connection/connection.php";



//Protecting Pages
if (isset($_SESSION['user'])) {
    header("location: index2.php");
}


if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);
} else {
    die('getted');
}

//fetching User from the database
//


$getQuery = "SELECT is_admin FROM `users` where `email` = '$email' and `password` = '$password' ;";
$result = mysqli_query($connection, $getQuery);

$userData = mysqli_fetch_array($result);
if (!$userData) {
    die('Invalid password and email combination.');
}
$user_id = $userData[0];
if($user_id==0)
{

$_SESSION['user'] = $user_id;

header("location: index2.php");
}
else
{
	$_SESSION['user'] = $user_id;

    header("location: index.php");
}
