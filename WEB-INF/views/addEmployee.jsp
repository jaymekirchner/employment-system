<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Employment System - Add Employee</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>

	<form action="addNewEmployee" method="post">
	<h1>Add Employee</h1>
		<pre>
First Name*: <input type="text" name="firstName" id="firstname" />
Middle Name: <input type="text" name="middleName" />
Last Name*: <input type="text" name="lastName" id="lastname" />
Date of Birth*: <input type="date" name="dob" id="dob" /><span style="color: red"><b>${dobError}</b></span>
Position*: <input type="text" name="position" id="position" />
<input type="submit" value="Add Employee" name="submit" />
</pre>
	</form>

	<br>${result}

</body>
</html>