<!DOCTYPE html>
<html>
<head>
<style>
table {
    width: 100%;
    border-collapse: collapse;
}

table, td, th {
    border: 1px solid black;
    padding: 5px;
}

th {text-align: left;}
</style>
</head>
<body>

<?php
$user_id = intval($_GET['user_id']);
$user_countries = intval($_GET['user_countries']);


$con = mysqli_connect('localhost','root','root','projectwww');
if (!$con) {
    die('Could not connect: ' . mysqli_error($con));
}

mysqli_select_db($con,"projectwww");
$sql="INSERT INTO users (user_id,user_countries)
VALUES ('$user_id', '$tuser_countries') ON DUPLICATE KEY UPDATE    
user_countries='$user_countries'";
$result = mysqli_query($con,$sql);


mysqli_close($con);
?>
</body>
</html>