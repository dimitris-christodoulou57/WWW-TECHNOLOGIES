<%@page contentType="text/html"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="style.css">
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<title>User-Page</title>
</head>
<body>
	<%String var = null;
	String name = null;
	String level = null;
	String countries = null;
	var = request.getParameter("user_id"); %>
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
					<br><li>
					<a href="logout.jsp" role="button" style = "color:black">LOG OUT</a>
				<%}
				
		%>  </li></br>
      </ul>
      
    </div>
    
	<%
		//HERE WE GETTING THE ATTRIBUTE DECLARED IN VALIDATE.JSP AND CHECKING IF IT IS NULL, THE USER WILL BE REDIRECTED TO LOGIN PAG
				String uid_temp = (String)session.getAttribute("username");
				
				if (uid_temp == null)
				{
				}
				else
				{
				name = uid_temp;
				level = (String)session.getAttribute("level");
				countries = (String)session.getAttribute("countries");
				}
   	%>
   	
   	<%@page import="java.sql.*,java.util.*"%>	
   	<%if(var!=null){
   	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectwww","root","root");
	Statement st= con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where user_id='"+var+"'");
	try{
	rs.next();
	name = rs.getString("user_name");
	level = rs.getString("user_level");
	countries = rs.getString("user_countries");  
	}
	catch (Exception e) {
	}
	} %>
	
	
	    <div class = "map">
	    <script src="https://www.amcharts.com/lib/3/ammap.js"></script>
		<script src="https://www.amcharts.com/lib/3/maps/js/worldLow.js"></script>
		<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
		<h1>Countries you have visited</h1>
		<div id="chartdiv"></div>
	</div>

	<div class="card">
      <img src="info.png" alt="Dimitris" style="width:60%; margin-top:10px;">
      <%out.println(" <h1>" +name+"</h1>"); %>
      <br>
      <% out.println("<h3>"+level+"</h3>");%>
      <br>
      <p>Countries you have visited appear on the left.<span id = "area"></span></p>
    </div>
   		
   
	    
    <script>
	    var map = AmCharts.makeChart("chartdiv", {
		  "type": "map",
		  "theme": "light",
		  "projection": "eckert3",
		  "dataProvider": {
		    "map": "worldLow",
		    "getAreasFromMap": true
		  },
		  "areasSettings": {
		    "selectedColor": "#CC0000",
		    "selectable": true
		  },
		  /**
		   * Add click event to track country selection/unselection
		   */
		  "listeners": [{
		    "event": "clickMapObject",
		    "method": function(e) {
		      
		      // Ignore any click not on area
		      if (e.mapObject.objectType !== "MapArea")
		        return;
		      
		      var area = e.mapObject;
		      
		      // Toggle showAsSelected
		      area.showAsSelected = !area.showAsSelected;
		      e.chart.returnInitialColor(area);
		      
		      // Update the list
		      document.getElementById("area").innerHTML = area.showAsSelected;
		      document.getElementById("selected").innerHTML = JSON.stringify(getSelectedCountries());
		      
		    }
		  }]
		});
		
		/**
		 * Function which extracts currently selected country list.
		 * Returns array consisting of country ISO2 codes
		 */
		function getSelectedCountries() {
		  var selected = [];
		  for(var i = 0; i < map.dataProvider.areas.length; i++) {
		    if(map.dataProvider.areas[i].showAsSelected)
		      selected.push(map.dataProvider.areas[i].id);
		  }
		  
		  return selected;
		  
		}	
	</script>
	
	
    
</body>
</html>