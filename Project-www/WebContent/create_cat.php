<?php
//create_cat.php
include 'connect.php';
include 'header.php';

if($_SESSION['signed_in'] == false)
{
    //the user is not signed in
    echo 'Sorry, you have to be <a href="signin.php" style="color:black;">signed in</a> to create a topic.';
}
else{
    if($_SERVER['REQUEST_METHOD'] != 'POST')
    {
        //the form hasn't been posted yet, display it
        echo '<div class="container">
            
                              <div class="card-new-post">
                                
                                <br>
        
                                <h2>Create a Category</h2>';
        echo '<form method="post" action="">
            Category name
            <br>
            <input type="text" name="cat_name" />
            <br>
            <br>
            Category description
            <br>
             <textarea name="cat_description" rows="5" cols="50"/></textarea>
            <br>
            <br>
            <input type="submit" value="Add category" />
         </form>';
        echo '</div>
        </div>';
    }
    else
    {
        //the form has been posted, so save it
        $sql = "INSERT INTO categories(cat_name, cat_description)
        VALUES('" . mysql_real_escape_string($_POST['cat_name']) . "',
                 '" . mysql_real_escape_string($_POST['cat_description']) . "')";
        $result = mysql_query($sql);
        if(!$result)
        {
            //something went wrong, display the error
            echo 'Error' . mysql_error();
        }
        else
        {
            echo 'New category successfully added.';
        }
    }
}

include 'footer.php';
?>