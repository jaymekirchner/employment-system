<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employment System - Search Results</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

	<table border="1">

		<tr>
			<th></th>
			<th>ID</th>
			<th>FIRST NAME</th>
			<th>MIDDLE NAME</th>
			<th>LAST NAME</th>
			<th>DATE OF BIRTH</th>
			<th>POSITION</th>
			
		</tr>

		<c:forEach items="${employees}" var="emp">
			<tr>
				<td><input type="radio" value='${emp.id}'>
				<td>${emp.id}</td>
				<td>${emp.firstName}</td>
				<td>${emp.middleName}</td>
				<td>${emp.lastName}</td>
				<td>${emp.dob}</td>
				<td>${emp.position}</td>
			</tr>
		</c:forEach>

	</table>

</body>
</html>