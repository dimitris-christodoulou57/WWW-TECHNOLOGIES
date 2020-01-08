<?php
include 'connect.php';
include 'header.php';

//first select the category based on $_GET['cat_id']
$sql = "SELECT
        topic_id,
        topic_subject,
        topic_cat
        FROM
            topics
        WHERE
            topics.topic_id = '" . mysql_real_escape_string($_GET['topic_id'])."'";

$result = mysql_query($sql);

if(!$result)
{
    echo 'The category could not be displayed, please try again later.' . mysql_error();
}
else
{
    if(mysql_num_rows($result) == 0)
    {
        echo 'This category does not exist.';
    }
    else
    {

        //display category data
        while($row = mysql_fetch_assoc($result))
        {
            echo '<br>
                   <br> <h2>Topics in ' . $row['topic_subject'] . ' category</h2>';
        }
        $topic_name = $row['topic_cat'];
        //do a query for the topics
        $sql = "SELECT
                posts.post_topic,
                posts.post_content,
                posts.post_date,
                posts.post_by,
                users.user_id,
                users.user_name
                FROM
                    posts
                LEFT JOIN
                    users
                ON
                    posts.post_by = users.user_id
                WHERE
                    posts.post_topic = '" . mysql_real_escape_string($_GET['post_topic']) ."'";

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
                //prepare the table
                echo'  <h1>' . $row['topic_cat'] . '</h1>';

                while($row = mysql_fetch_assoc($result))
                {
                  echo '

                        <div class="post-list">

                            <div class="post">

                                <div class="user-info">
                                    <img src="info.png" alt="Dimitris" style="width:60%; margin-top:10px;"><br>

                                    <a href="user.jsp?user_id='.$row['user_id'].'" class="user-name">'. $row['user_name'].'</a>

                                </div>

                                <div class="post-content">
                                    <div>
                                      <p>';
                                        echo   $row['post_content'] ;
                                    echo '  </p>
                                    </div>
                                    <a href="#" style="margin-left: auto;" class="link-unstyled" title="Make a change"><i class="fa fa-pencil"></i></a>
                                </div>



                                <div class="post-date text-faded">';
                                    echo date('d-m-Y', strtotime($row['post_date']));
                               echo '  </div>

                            </div>

                        </div>';
                }

                echo '<form method="post" action="reply.php?id='.mysql_real_escape_string($_GET['topic_id']) .'">
                    <h2>Write your reply here:</h2>
                    <textarea name="reply-content" rows="5" cols="50" style="margin_left:60%;"></textarea><br>
                    <input type="submit" value="Submit reply" />
                </form>';
                
                echo '</div>
                    </div>';
            }
        }
    }
}

include 'footer.php';
?>
