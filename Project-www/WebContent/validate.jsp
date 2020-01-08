<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String username=request.getParameter("username");
String password=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectwww","root","root");
Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from users where user_name='"+username+"'");
try{
rs.next();
if(rs.getString("user_pass").equals(password)&&rs.getString("user_name").equals(username))
{
	session.setAttribute("username",username);
	session.setAttribute("level",rs.getString("user_level"));
	session.setAttribute("countries",rs.getString("user_countries"));
	request.setAttribute("message", "Hello "+username+". Welcome!");
    request.getRequestDispatcher("index.jsp").forward(request, response);
}
else{
request.setAttribute("message", "Hello "+username+". Wrong password!");
request.getRequestDispatcher("login.jsp").forward(request, response);
}
}
catch (Exception e) {
request.setAttribute("message", "User don't exist. Create a new account");
request.getRequestDispatcher("login.jsp").forward(request, response);
}
%>