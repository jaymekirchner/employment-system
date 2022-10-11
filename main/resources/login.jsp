<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employment System Login</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link type="text/css" rel="stylesheet" href="css/style.css">

</head>
<body class="login">
	<div class="w3-card-4">
		<h1 class="w3-container w3-blue w3-center">Employment System -
			Login</h1>
		<form class="w3-panel" action="LoginServlet" method="get"> <label
				for="username">User Name: </label><input class="w3-input w3-border"
				type="text" name="username" value="HRMgr" id="login-username"><br />
			<label for="password">Password: </label><input type="password"
				class="w3-input w3-border" name="password" value="test@123"
				id="login-password"><br /> <input type="submit"
				value="Login">
		</form>
		${errMessage}
		<h1 class="w3-container"></h1>
	</div>
<body>
</html>