<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/styles.css">
<link rel="icon" type="image/jpg" href="images/my-logo.jpg"
	sizes="16x16">
<title>View Employee</title>
</head>

<body>

	<header>
		<div class="header-content clearfix">
			<h1>Employment System</h1>
		</div>
		<nav class="header-nav">
			<ul class="nav-links">
				<li><a href="/home">Home</a></li>
				<li><a href="/add-employee" target="_blank">Add Employee</a></li>
				<li><a href="/search-employee">Search Employee</a></li>
			</ul>
		</nav>
	</header>

	<main>
		<section id="edit-employee-section">
			<div class="section-header">
				<h2>View Employee</h2>
			</div>
			<div class="section-content">

				<br />
				<form:form id="view-employee" action="/view-employee/${employee.id}" method="post" modelAttribute="employee">
					<div class="form-details">
						<div class="stretch-input">
							<form:label path="id" class="label">Id:</form:label>
							<br />
							<form:input class="remove-readonly" path="id"
								value="${employee.id}" readonly="true" />
							<br />
							<form:label path="firstName" class="label">First Name:</form:label>
							<br />
							<form:input path="firstName" value="${employee.firstName}" />
							<br />

							<form:label path="middleName" class="label">Middle Name:</form:label>
							<br />
							<form:input path="middleName" value="${employee.middleName}" />
							<br />

							<form:label path="lastName" class="label">Last Name:</form:label>
							<br />
							<form:input path="lastName" value="${employee.lastName}" />
							<br />

							<form:label path="birthday" class="label">Date of Birth:</form:label>
							<br />
							<form:input id="datefield" path="birthday" type="date"
								value="${employee.birthday}" />
							<br />

							<form:label path="position">Position:</form:label>
							<br />
							<form:input path="position" value="${employee.position}" />
							<form:errors path="position" class="error" />
							<br />
						</div>
					</div>
				</form:form>
				<div class="btn-group">
					<a href="" onclick="self.close()" class="btn">Go Back</a> 
					<a href="/edit/${employee.id}" target="_blank" class="btn">Edit Employee</a> 
					<a href="/delete/${employee.id}" class="btn">Delete Employee</a> 
					<a href="/add-compensation/${employee.id}" target="_blank" class="btn">Add Compensation</a> 
					<a href="/filter-compensation/${employee.id}" target="_blank" class="btn">Filter Compensation</a>
					<a href="/compensation-details/${employee.id}" class="btn">Compensation Details</a>
				</div>
				<div class="clear-float"></div>
			</div>
		</section>
	</main>

	<footer>
		<nav class="footer-nav">
			<ul class="nav-links clearfix">
				<li><a href="/home">Home</a></li>
				<li><a href="/add-employee" target="_blank">Add Employee</a></li>
				<li><a href="/search-employee">Search Employee</a></li>
			</ul>
		</nav>
		<div class="clear-float"></div>
		<p id="datetime"></p>
		<script>
			document.getElementById("datetime").innerHTML = Date();
		</script>
		<noscript>Sorry, your browser does not support JavaScript!</noscript>
	</footer>

</body>
</html>
