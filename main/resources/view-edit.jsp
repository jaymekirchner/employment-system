<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript" src="js/employee-validation.js"></script>	
<title>Employment System - View &amp; Edit</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- <link type="text/css" rel="stylesheet" href="css/style.css"> -->
</head>
<body>

	<jsp:include page="my-header.html" />

	<div align="center">
		<h2>View and Edit Employee</h2>
		<form action="EmployeeControllerServlet" method="POST" name="studentForm" onSubmit="return validateForm()">

			<input type="hidden" name="command" value="UPDATE" /> 
			<input type="hidden" name="empId" value="${EMPLOYEE.id}" /> 
			
			<label for="id">Id: </label> 
			<input style="background-color: #D3D3D3" type="text" name="id" value="${EMPLOYEE.id}" readonly />
			<br> <br>
			<label for="firstname">First Name: </label> 
			<input type="text" name="firstname" value="${EMPLOYEE.firstName}" />
			<br /> <br /> 
			<label for="middlename">Middle Name: </label> 
			<input type="text" name="middlename" value="${EMPLOYEE.middleName}" />
			<br /> <br />
			<label for="lastname">Last Name: </label> 
			<input type="text" name="lastname" value="${EMPLOYEE.lastName}" />
			<br /> <br /> 
			<label for="dob">Date of Birth: </label> 
			<input type="date" name="dob" value="${EMPLOYEE.dateOfBirth}" />
			<br /> <br /> 
			<label for="position">Position: </label> 
			<input type="text" name="position" value="${EMPLOYEE.position}" />
			<br /> <br /> 
			<label></label> 
			<input type="submit" value="Save">
		</form>
	</div>
	<jsp:include page="my-footer.jsp" />
</body>
</html>