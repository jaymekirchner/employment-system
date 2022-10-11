<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>

<html>
<head>
<meta charset="UTF-8">
<title>Employment System - Search Employees</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<h1> Search Employee</h1>

		<form action="searchEmployee" method="POST">
			First Name: <input type="text" name="firstname" /> 
			Last Name: <input type="text" name="lastName" /> 
			Position: <input type="text" name="position" /> <br> 
			<input type="submit" value="Search" /> 
			<input type="reset" value="Clear" />
			
			<!-- display "${numResults} results found" -->
		</form>
</body>
</html>