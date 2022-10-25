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
<title>Search Employee</title>
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
		<section id="search-employee-section">
			<div class="section-header">
				<h2>Search Employee</h2>
			</div>
			<div class="section-content">

				<p>Search by first name, last name, and/or position.</p>

				<p class="error">${noResults}</p>
				<form:form action="search-employee" method="post" modelAttribute="employee">
					<div class="form-details">
						<div class="stretch-input">
							<form:label path="firstName" class="label">First Name:</form:label>
							<br />
							<form:input path="firstName" />
							<br />

							<form:label path="lastName" class="label">Last Name:</form:label>
							<br />
							<form:input path="lastName" />
							<br />

							<form:label path="position">Position:</form:label>
							<br />
							<form:input path="position" />
							<br />
						</div>
						<br />
						<form:button type="submit">Submit</form:button>
						<form:button type="reset">Clear</form:button>
					</div>
				</form:form>
			</div>
		</section>
	</main>

	<footer>
		<nav class="footer-nav">
			<ul class="nav-links clearfix">
				<li><a href="/home">Home</a></li>
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
