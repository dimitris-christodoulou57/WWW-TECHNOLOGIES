<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="nl" lang="nl">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="description" content="A short description." />
    <meta name="keywords" content="put, keywords, here" />
    <title>PHP-MySQL forum</title>
    <link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>

<?php
include 'connect.php';
 
if($_SERVER['REQUEST_METHOD'] != 'POST')
{
    /*the form hasn't been posted yet, display it
      note that the action="" will cause the form to post to the same page it is on */
        
        echo '<form class="register-form" action="" method = "post">
		<div class="register-box">
			<h2>CREATE NEW ACCOYNT</h2>
			<br>
			<table class="register-table">
                    <tr><td><input class="table-cell" type="text" name="user_name" placeholder="Username"></td></tr
                    <tr><td><input class="table-cell" type="password" name="user_pass" placeholder="Password"></td></tr>
                    <tr><td><input class="table-cell" type="password" name="user_pass_check" placeholder="Confirm Password"></td></tr>
                    <tr><td><input class="table-cell" type="text" name="user_email" placeholder="Email"></td></tr>
                    <tr><td><input class="table-cell submit"type="submit" name="submit" value="Sing Up"></td></tr>
                </table>
		</div>
	</form>';
}
else
{
    /* so, the form has been posted, we'll process the data in three steps:
        1.  Check the data
        2.  Let the user refill the wrong fields (if necessary)
        3.  Save the data 
    */
    $errors = array(); /* declare the array for later use */
     
    if(isset($_POST['user_name']))
    {
        
        if(!ctype_alnum($_POST['user_name']))
        {
            $errors[] = 'The username can only contain letters and digits.';
        }
        if(strlen($_POST['user_name']) > 30)
        {
            $errors[] = 'The username cannot be longer than 30 characters.';
        }
    }
    else
    {
        $errors[] = 'The username field must not be empty.';
    }
     
     
    if(isset($_POST['user_pass']))
    {
        if($_POST['user_pass'] != $_POST['user_pass_check'])
        {
            $errors[] = 'The two passwords did not match.';
        }
    }
    else
    {
        $errors[] = 'The password field cannot be empty.';
    }
    
    if(isset($_POST['user_email']))
    {
       $sql = "SELECT
                    *
               FROM 
                    users
               WHERE
                    user_email =  '" . mysql_real_escape_string($_POST['user_email']) . "'";
       
       if ((mysql_num_rows(mysql_query($sql)) != 0)){
           $errors[] = 'The email exist.';
       }
    }
    else
    {
        $errors[] = 'The email field cannot be empty.';
    }
    
     
    if(!empty($errors)) /*check for an empty array, if there are errors, they're in this array (note the ! operator)*/
    {
        echo 'Uh-oh.. a couple of fields are not filled in correctly..';
        echo '<ul>';
        foreach($errors as $key => $value) /* walk through the array so all the errors get displayed */
        {
            echo '<li>' . $value . '</li>'; /* this generates a nice error list */
        }
        echo '</ul>';
    }
    else
    {
        //the form has been posted without, so save it
        //notice the use of mysql_real_escape_string, keep everything safe!
        //also notice the sha1 function which hashes the password
        //'" . sha1($_POST['user_pass']) . "',  replaced by 
        $sql = "INSERT INTO
                    users(user_name, user_pass, user_email, user_level, user_countries)
                VALUES('" . mysql_real_escape_string($_POST['user_name']) . "',
                       '" . mysql_real_escape_string($_POST['user_pass']) . "',
                       '" . mysql_real_escape_string($_POST['user_email']) . "',
                       '" . mysql_real_escape_string(Beginner) ."', 0 )";
                         
        $result = mysql_query($sql);
        if(!$result)
        {
            //something went wrong, display the error
            echo 'User already exist.<a href="register.php">Please try again.</a>';
            //echo mysql_error(); //debugging purposes, uncomment when needed
        }
        else
        {
            echo 'Successfully registered. You can now <a href="login.jsp" style="color:black;">Sign in</a>';
        }
    }
}
 
include 'footer.php';
?>
