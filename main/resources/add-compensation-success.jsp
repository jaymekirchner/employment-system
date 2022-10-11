<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employment System - Compensation Added</title>
</head>
<body>
	<h1>Success!</h1>
	<p>Compensation Details are successfully added! </p>
	<ul>
		<li>${param.compensationType}</li>
		<li>${param.amount}</li>
		<li>${param.description}</li>
		<li>${param.dateOfCompensation}</li>
	</ul>

</body>
</html>