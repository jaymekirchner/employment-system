<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>

<!-- <!DOCTYPE html> -->
<!-- may need to be removed once adding JQuery/AJAX code -->
<html>
<head>
<meta charset="UTF-8">
<title>Employment System - Login</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
</head>
<body>
	<h1>LOGIN TO THE SYSTEM</h1>

	<!-- error message if incorrect log-in details -->
	<p style="color: red">
		<b>${errMsg}</b>
	</p>
	<br>

	<!-- DO NOT HAVE slash '/' in 'action="login.do"!!! GAVE ME ERRORS!! -->
	<form action="login" method="POST">
		UserName: <input type="text" name="name" value="HRMgr" /> Password: <input
			type="password" name="password" value="t3st!"/>
		<input type="submit" value="Log In" />
	</form>

</body>
</html>