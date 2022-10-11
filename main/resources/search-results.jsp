<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employment System - Search Employees</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- <link type="text/css" rel="stylesheet" href="css/style.css"> -->
</head>
<body>
	<jsp:include page="my-header.html" />
	
	<div align="center">
		<form action="search-results.jsp" method="GET">
			<label for="firstname">First Name: </label><input type="text"
				name="firstname" value="${param.firstname}" />&emsp; <label
				for="lastname">Last Name: </label><input type="text" name="lastname"
				value="${param.lastname}" />&emsp; <label for="position">Position:
			</label><input type="text" name="position" value="${param.position}" />&emsp;
			<input type="submit" value="Search">&ensp; 
<!-- 			<input type="reset" value="Clear"> -->
		</form>
		
		
		<br>
		<hr>

		<h2>Search Results</h2>
		<table border="1">

			<tr>
				<th>Id</th>
				<th>First Name</th>
				<th>Middle Name</th>
				<th>Last Name</th>
				<th>Date of Birth</th>
				<th>Position</th>
				<th colspan="2">Action</th>
			</tr>

			<c:forEach var="emp" items="${EMPLOYEE_LIST}">

				<!-- define link for each employee -->
				<c:url var="tempLink" value="EmployeeControllerServlet">
					<c:param name="command" value="LOAD" />
					<c:param name="empId" value="${emp.id}" />
				</c:url>

				<!-- define link to delete a employee -->
				<c:url var="deleteLink" value="EmployeeControllerServlet">
					<c:param name="command" value="DELETE" />
					<c:param name="empId" value="${emp.id}" />
				</c:url>

				<tr>
					<td>${emp.id}</td>
					<td>${emp.firstName}</td>
					<td>${emp.middleName}</td>
					<td>${emp.lastName}</td>
					<td>${emp.dateOfBirth}</td>
					<td>${emp.position}</td>
					<td>&ensp;<a href="${tempLink}">Update</a>&ensp; | 
					&ensp;<a href="${deleteLink}"
						onclick="if (!(confirm('Are you sure?'))) return false">
							Delete</a> &ensp;
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<jsp:include page="my-footer.jsp" />
</body>
</html>