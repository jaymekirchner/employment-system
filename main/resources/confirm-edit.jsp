<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employment System - Success!</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<h2>Success!</h2>
	<p>The employee is successfully updated!</p>
	<ul>
		<li>Id: ${param.id}</li>
		<li>First Name: ${param.firstname}</li>
		<li>Middle Name: ${param.middlename}</li>
		<li>Last Name: ${param.lastname}</li>
		<li>Date of Birth: ${param.dob}</li>
		<li>Position: ${param.position}</li>
	</ul>



</body>
</html>