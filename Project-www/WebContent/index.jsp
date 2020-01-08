<%@page contentType="text/html"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="style.css">
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<title>Home Page</title>
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
					<br>
					</li><a href="logout.jsp" role="button" style = "color:black">LOG OUT</a>
				<%}
		%>  </li></br>
      </ul>
      
	</div>
	    
	  <div class = "slide-show">
	     <div class="mySlides fade">
		  <img src="london.jpg" style="width:100%">
		  <div class="text">UNITED KINGDOM</div>
		 </div>
		 
		 <div class="mySlides fade">
		  <img src="paris.jpg" style="width:100%">
		  <div class="text">FRANCE</div>
		 </div>
		 
		 <div class="mySlides fade">
		  <img src="seattle.jpg" style="width:100%">
		  <div class="text">UNITED STATES of AMERICA</div>
		 </div>
		 
		 <div class="mySlides fade">
		  <img src="tokyo.jpg" style="width:100%">
		  <div class="text">JAPAN</div>
		 </div>
		 
		 <div class="mySlides fade">
		  <img src="egypt.jpg" style="width:100%">
		  <div class="text">EGYPT</div>
		 </div>
		 
		 <a class="prev" onclick="plusSlides(-1)">&#9650;</a>
  		 <a class="next" onclick="plusSlides(1)">&#9660;</a>
		 
	</div>
	 
	 <script>
		var slideIndex = 1;
		showSlides(slideIndex);
		
		function plusSlides(n) {
		  showSlides(slideIndex += n);
		}
		
		function currentSlide(n) {
		  showSlides(slideIndex = n);
		}
		
		function showSlides(n) {
		  var i;
		  var slides = document.getElementsByClassName("mySlides");
		  var dots = document.getElementsByClassName("dot");
		  if (n > slides.length) {slideIndex = 1}    
		  if (n < 1) {slideIndex = slides.length}
		  for (i = 0; i < slides.length; i++) {
		      slides[i].style.display = "none";  
		  }
		  for (i = 0; i < dots.length; i++) {
		      dots[i].className = dots[i].className.replace(" active", "");
		  }
		  slides[slideIndex-1].style.display = "block";  
		  dots[slideIndex-1].className += " active";
		}
		</script>
    
</body>
</html>