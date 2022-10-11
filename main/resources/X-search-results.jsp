<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employment System - Search Results</title>
</head>
<body>
	Search Parameters:
	<ul>
		<li>${param.firstname}</li>
		<li>${param.lastname}</li>
		<li>${param.position}</li>
	</ul>

	<br>
	<br>
	<table>
		<tr>
			<th>Id</th>
			<th>First Name</th>
			<th>Middle Name</th>
			<th>Last Name</th>
			<th>Date Of Birth</th>
			<th>Position</th>
			<th></th>
			<th></th>
		</tr>
		<tr>
			<td>...</td>
			<td>search</td>
			<td>results</td>
			<td>go</td>
			<td>here</td>
			<td>...</td>
			<td><a href="">Edit</a></td>
			<td><a href="">Delete</a></td>
		</tr>
	</table>
</body>
</html>