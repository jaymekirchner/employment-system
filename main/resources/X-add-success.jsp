<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employment System - Employee Added</title>
</head>
<body>
	<jsp:include page="my-header.html" />

	<p>Success! The new employee is successfully added!</p>
	<ul>
		<li>${param.firstname} ${param.middlename} ${param.lastname}</li>
		<li>${param.dob}</li>
		<li>${param.position}</li>
	</ul>

	<jsp:include page="my-footer.jsp" />
</body>
</html>