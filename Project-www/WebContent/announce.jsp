<%@page contentType="text/html"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="style.css">
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<title>ANNOUNCEMENTS</title>
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
    
    <div class = "container">
    	<h1>Next destination to visit this week:</h1>
    	<br>
    	
    	<h3>New York</h3>
    	<br>
    	
    	<p>The City of New York, usually referred to as either New York City (NYC) or <br>
    	simply New York (NY), is the most populous city in the United States.<br>
    	Follow the link to discover more information about this city.
    	<a href = "https://en.wikipedia.org/wiki/New_York_City" style = "color:black">Wikipedia</a>
    	</p><br>
    	
    	<div class = "map-announce">
		    <script src="https://www.amcharts.com/lib/3/ammap.js"></script>
			<script src="https://www.amcharts.com/lib/3/maps/js/worldLow.js"></script>
			<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
			<div id="chartdiv"></div>
			<%--<div id="info">Seletced countries: <span id="selected">-</span></div> --%>
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
    
    	
    	<br>
    	<a class="weatherwidget-io" href="https://forecast7.com/en/40d71n74d01/new-york/" data-label_1="NEW YORK" data-label_2="WEATHER" data-theme="dark" >NEW YORK WEATHER</a>
		<script>
			!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src='https://weatherwidget.io/js/widget.min.js';fjs.parentNode.insertBefore(js,fjs);}}(document,'script','weatherwidget-io-js');
		</script>
    	
    </div>
</body>
</html>
