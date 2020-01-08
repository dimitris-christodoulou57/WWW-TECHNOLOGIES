<%@page contentType="text/html"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="style.css">
	<title>Login-Page</title>
</head>
<body>
	<form class="login-form" action="validate.jsp" method = "Post">
		<div class="login-box">
			<h1>LOGIN</h1>
			<br>
			<h2>Login with your Account</h2>
			<br>
			<h3 class="message">${message}</h3>
			<br>
			<table class="login-table">
                    <tr><td><input class="table-cell" type="text" name="username" placeholder="User name"></td></tr>
                    <tr><td><input class="table-cell" type="password" name="password" placeholder="Password"></td></tr>
                    <tr><td><input class="table-cell submit" type="submit" name="submit" value="Login"></td></tr>
                    <br>
                    <tr><td><a href="register.php" role = "button"> New to site.Create a new account</a></td></tr>
                </table>
		</div>
	</form>
</body>
</html>