<?php
include 'connect.php';
include 'header.php';

//first select the category based on $_GET['cat_id']


$sql = "SELECT
            cat_id,
            cat_name,
            cat_description
        FROM
            categories
        WHERE
            cat_id = '" . mysql_real_escape_string($_GET['cat_id']) . "'";

$result = mysql_query($sql);

if(!$result)
{
    echo 'The category could not be displayed, please try again later.';
}
else
{
    if(mysql_num_rows($result) == 0)
    {
        echo 'This category does not exist.'. mysql_real_escape_string($_GET['cat_id']);
    }
    else
    {
        //display category data
        while($row = mysql_fetch_assoc($result))
        {
            echo '<br>
                  <br>
                    <h2>Topics in ' . $row['cat_name'] . ' category</h2>
                  <br>';
        }

        //do a query for the topics
        $sql = "SELECT
                    topics.topic_id,
                    topics.topic_subject,
                    topics.topic_date,
                    topics.topic_cat,
                    topics.topic_by,
                    users.user_name,
                    users.user_id
                FROM
                    topics
                LEFT JOIN
                    users
                ON
                    topics.topic_by = users.user_id
                WHERE
                    topics.topic_cat = '" . mysql_real_escape_string($_GET['topic_cat']) . "'";

        $result = mysql_query($sql);

        if(!$result)
        {
            echo 'The topics could not be displayed, please try again later.';
        }
        else
        {
            if(mysql_num_rows($result) == 0)
            {
                echo 'There are no topics in this category yet.';
            }
            else
            {
                
                echo '<div class="thread-list">

                    <h2 class="list-title" style = "text-align:center">Topics</h2>

                    <br>';

                while($row = mysql_fetch_assoc($result))
                {
                  echo '<div class="thread">
                      <div>
                          <p>
                              <h3><a href="topic.php?topic_id=' . $row['topic_id'] . '&post_topic=' . $row['topic_id'] . '" style = "color:black">' . $row['topic_subject'] . '</a><h3>
                          </p>
                      </div>

                      <div class="activity">
                           <img src="info.png" alt="Dimitris" style="width:5%; margin-top:10px;">

                          <div>
                              <p class="text-xsmall">
                                  <a href="user.jsp?user_id='.$row['user_id'].'" style = "color:black">'.$row['user_name'].'</a>
                              </p>
                              <p class="text-xsmall text-faded">'. date('d-m-Y', strtotime($row['topic_date'])).'</p>
                          </div>
                      </div>
                  </div>';
                }
                echo '</div>';
            }
        }
    }
}

include 'footer.php';
?>
