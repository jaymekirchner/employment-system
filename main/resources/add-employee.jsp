<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employment System - Add Employee</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link type="text/css" rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="js/employee-validation.js"></script>	
</head>
<body class="w3-container">
<jsp:include page="my-header.html" />
<div class="main-content">
	<form align="center" action="EmployeeControllerServlet" method="POST" name="employeeForm" onSubmit="return validateForm()">
	<input type="hidden" name="command" value="ADD" />
		<label for="firstname">First Name*: </label><input type="text" name="firstname"
			id="addFirstname" required /><br />
		<br /> <label for="middlename">Middle Name: </label><input type="text"
			name="middlename" id="addMiddlename" /><br />
		<br /> <label for="lastname">Last Name*: </label><input type="text" name="lastname"
			id="addLastname" required /><br />
		<br /> <label for="dob">Date of Birth*: </label><input type="date" name="dob"
			id="addDob" required /><br />
		<br /> <label for="position">Position*: </label><input type="text" name="position"
			id="addPosition" required /><br />
		<br /> <input type="submit" value="Add Employee">
	</form>
	</div>
	<jsp:include page="my-footer.jsp" />
</body>
</html>