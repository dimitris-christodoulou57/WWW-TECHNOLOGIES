<%@page contentType="text/html"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="style.css">
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<title>ABOUT US</title>
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
      	<br><li><%
		//HERE WE GETTING THE ATTRIBUTE DECLARED IN VALIDATE.JSP AND CHECKING IF IT IS NULL, THE USER WILL BE REDIRECTED TO LOGIN PAGE
				String uid = (String)session.getAttribute("username");
				if (uid == null)
				{
		%><!-- NOT A VALID USER, IF THE USER TRIES TO EXECUTE LOGGED IN PAGE DIRECTLY, ACCESS IS RESTRICTED -->
					 <a href="login.jsp" role="button" style = "color:black">LOG IN  <i class="fas fa-user-lock"></i></a>
		<%	
				}
				else
				{//IF THE VALUE IN SESSION IS NOT NULL THEN THE IS USER IS VALID
					%>
					<a href="user.jsp" role="button" style = "color:black"><%out.println("User:"+uid+""); %></a></li>
					<!-- WE HAVE GIVEN LOGOUT.JSP FILE INORDER TO LOGOUT THE SESSION -->
					<br></li>
					<a href="logout.jsp" role="button" style = "color:black">LOG OUT</a>
				<%}
		%>  </li></br>
      </ul>
      
    </div>
    
    <div class="card-aboutus">
      <h1>Our Team</h1>
      <p style="margin: 24px 10px;">We are two undergraduate students from the University of Thessaly, studying electrical and computer engineering, Dimitris and Sotiris. This current site is being developed for our final project in the ce426 class, Worldwide-web technologies.</p>
      <a href="contact.html"><button>Contact</button></a>
    </div>
    
    <div class="social">
      <a href="https://www.facebook.com/dimitris.chr.54" target="_blank" class="fa fa-facebook"></a>
      <a href="https://www.google.com" target="_blank" class="fa fa-google"></a>
      <a href="https://www.linkedin.com/in/dimitris-christodoulou-09383118b/" target="_blank" class="fa fa-linkedin"></a>
      <a href="https://www.instagram.com" target="_blank" class="fa fa-instagram"></a>
      <a href="https://www.skype.com" target="_blank" class="fa fa-skype"></a>
    </div>
</body>
</html>