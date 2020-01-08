<?php
//signin.php
include 'connect.php';
include 'header.php';

if (session_destroy()){
    echo 'Successfully log out!!';
    header("Location: forum-index.php");
}

include 'footer.php';
?>