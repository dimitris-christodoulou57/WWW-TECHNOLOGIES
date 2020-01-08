<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="nl" lang="nl">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="description" content="A short description." />
    <meta name="keywords" content="put, keywords, here" />
    <title>Forum</title>
    <link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>

  <div class="navigation-bar">
      <img src="plane.png" alt="logo" style="width:100%; margin-top:5%;">
      <br>
      <br>
      <br>
      <br>
      <ul class = "navigation-table">
      	<li><a href="index.jsp" role="button" style = "color:black">HOME PAGE  <i class="fas fa-home"></i></a></li>
      	<br>
      	<li><a href="announce.jsp" role="button" style = "color:black">ANNOUNCEMENTS  <i class="fas fa-info"></i></a></li>
      	<br>
      	<li><a href="forum-index.php" role="button" style = "color:black">FORUM  <i class="fas fa-comments"></i></a></li>
      	<br>
      	<li><a href="apps.jsp" role="button" style = "color:black">APPS  <i class="fab fa-google-play"></i></a></li>
      	<br>
      	<li><a href="aboutus.jsp" role="button" style = "color:black">ABOUT US  <i class="fas fa-handshake"></i></a></li>
      	
      </ul>

    </div>
    
    <?php

        session_start();
        if(isset($_SESSION['signed_in']))
            {
                echo '<span style="float:right; margin-top: 5px; margin-right: 5px" class="hide-mobile text-faded text-small">
                  Hello ' . $_SESSION['user_name'] . '. Not you? <a href="signout.php" style = "color:black">Sign out</a><br>
                </span>';
            }
            else
            {
                echo '<span style="float:right; margin-top: 2px;" class="hide-mobile text-faded text-small">
                  <a href="signin.php" style = "color:black">Sign in</a> or <a href="signup.php" style = "color:black">Create an account</a>.<br>
                </span>';
            }
        ?>

    <div class="container">

      <div class="col-large push-top">

          <h1>My forum</h1>

          <br>

          <a href="forum-index.php" style = "color:black">HOME</a> -
          <a href="create_topic.php" style = "color:black">Create a topic</a> -
          <a href="create_cat.php" style = "color:black">Create a category</a>
          
          <br>
          <br>

        
