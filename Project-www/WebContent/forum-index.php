<?php
//create_cat.php
include 'connect.php';
include 'header.php';
 
$sql = "SELECT
            cat_id,
            cat_name,
            cat_description
        FROM
            categories";
 
$result = mysql_query($sql);
 
if(!$result)
{
    echo 'The categories could not be displayed, please try again later.';
    echo 'Error' . mysql_error();
}
else
{
    if(mysql_num_rows($result) == 0)
    {
        echo 'No categories defined yet.';
    }
    else
    {
        echo '<br>
                <br><div class="thread-list">

                    <h2 class="list-title" style = "text-align:center">Countries</h2>
            
                    <br>';
             
        while($row = mysql_fetch_assoc($result))
        {
            echo '<div class="thread">
                      <div>
                          <p>
                              <h3><a href="category.php?cat_id=' . $row['cat_id'] . '&topic_cat=' . $row['cat_id'] . '" style = "color:black">' . $row['cat_name'] . '</a></h3>' . $row['cat_description'].'
                          </p>
                      </div>
                                  
                      <div class="activity">
                           <img src="calendar.png" alt="Dimitris" style="width:5%; margin-top:10px;">
                                  
                          <div>
                              <p class="text-xsmall">
                                  <a href="user.jsp" style = "color:black">'.$row['user_name'].'</a>
                              </p>
                              <p class="text-xsmall text-faded">'. date('d-m-Y', strtotime($row['topic_date'])).'</p>
                          </div>
                      </div>
                  </div>';
        }
    }
}
 
include 'footer.php';
?>