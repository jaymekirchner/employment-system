<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html>
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
		
			<input type="hidden" name="command" value="SEARCH" />
			
			<b>Search for an Employee: </b>&emsp; 
			
			<label for="searchFirstname">First Name: </label>
			<input type="text" name="searchFirstname" />&emsp; 
				
			<label for="searchLastname">Last Name: </label>
			<input type="text" name="searchLastname" />&emsp;
				
			<label for="searchPosition">Position: </label>
			<input type="text" name="searchPosition" />&emsp; 
			
			<input type="submit" value="Search">&ensp;
			<input type="reset" value="Clear">
		</form>
	</div>
	
	
	<jsp:include page="my-footer.jsp" />


</body>
</html>