<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to Employment System!</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:include page="my-header.html" />
	<div class="main-content" align="center">

		<!-- ADD Button -->
		<input class="w3-button w3-border" type="button" value="Add New Employee"
			onclick="window.location.href='add-employee.jsp'; return false;" />
		&emsp;&emsp;

		<!-- SEARCH Button -->
		<input class="w3-button w3-border" type="button" value="Search Employees"
			onclick="window.location.href='search-employee.jsp'; return false;" />
		<br> <br>

		<table class="w3-table-all">

			<!-- Load the database table when page loads -->
			<input type="hidden" name="command" value="LIST" />t
			<tr>
				<th>Id</th>
				<th>First Name</th>
				<th>Middle Name</th>
				<th>Last Name</th>
				<th>Date of Birth</th>
				<th>Position</th>
				<th class="w3-center" >Action</th>
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
					<td class="w3-center"><a href="${tempLink}"><i class="fa fa-edit"></i></a> | 
					 <a href="${deleteLink}"
						onclick="if (!(confirm('Are you sure?'))) return false"><i class="fa fa-trash"></i></a>
					</td>
				</tr>
			</c:forEach>
		</table>

	</div>
	<jsp:include page="my-footer.jsp" />
</body>
</html>