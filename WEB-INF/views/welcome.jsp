<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>

<!-- <!DOCTYPE html> -->
<!-- may need to be removed once adding JQuery/AJAX code -->
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<title>Employment System - Welcome</title>
</head>
<body>
	<h1>EMPLOYMENT SYSTEM</h1>
	<p>
		Welcome to the Employment System, ${name}! <br> <br> Please
		select from the menu below.
	</p>
	<br>
	<button id="addEmployee">Add Employee</button><span>${addBtn}</span>
	

	<button>View &amp; Edit Employee</button>
	<br />
	<br />
	<button>Search Employee</button>
	<button>Employee Compensation</button>

</body>
</html>