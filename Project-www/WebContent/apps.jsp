<%@page contentType="text/html"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="style.css">
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<title>APPS</title>
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
				{
					%>
					<a href="user.jsp" role="button" style = "color:black"><%out.println("User:"+uid+""); %></a></li>
					<!-- WE HAVE GIVEN LOGOUT.JSP FILE INORDER TO LOGOUT THE SESSION -->
					<br></li>
					<a href="logout.jsp" role="button" style = "color:black">LOG OUT</a>
				<%}
		%>  </li></br>
      </ul>
      
    </div>
   	
   	<div class="top-left">
   	 <img src="tripadvisor.png" alt="logo" style="width:80%; margin-top:5%;">
   	 <br>
	 <a href="https://www.tripadvisor.com.gr/" target = "_blanc" style = "color:black">TripAdvisor  <i class="fas fa-comments"></i></a>
	</div>
	 
	<div class="top-right">
	 <img src="roadtrippers.png" alt="logo" style="width:80%; margin-top:5%;">
	 <br>
	 <a href="https://roadtrippers.com/" target = "_blanc" style = "color:black">RoadTrippers  <i class="fas fa-road"></i></a>
	</div>
	 
	<div class="down-left">
	 <img src="culture.png" alt="logo" style="width:80%; margin-top:5%;">
	 <br>
	 <a href="https://theculturetrip.com/" target = "_blanc" style = "color:black">TheCultureTrip  <i class="fas fa-monument"></i></a>
	</div>
	 
	<div class="down-right">
	 <img src="globe.png" alt="logo" style="width:80%; margin-top:5%;">
	 <br>
	 <a href="https://www.globe.studio/globetipping" target = "_blanc" style = "color:black">GlodeTip  <i class="fas fa-money-check"></i></a>
   	</div>
   	
   	
</body>
</html>