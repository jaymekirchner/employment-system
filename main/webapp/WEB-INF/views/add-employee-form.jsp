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
<title>Add Employee</title>
</head>

<body>

	<header>
		<div class="header-content clearfix">
			<!-- <img id="profile-image" src="/images/photo1.jpg" alt="profile picture of Jayme Kirchner" width="15%" height="15%"> -->
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
		<section id="add-employee-section">
			<div class="section-header">
				<h2>Add Employee</h2>
			</div>
			<div class="section-content">

				<br />
				<span class="error">${employeeExists}</span>
				<form:form action="add-employee" method="post" modelAttribute="employee">
					<div class="form-details">
						<div class="stretch-input">
							<form:label path="firstName" class="label">First Name*:</form:label>
							<br />
							<form:input path="firstName" />
							<form:errors path="firstName" class="error" />
							<br />

							<form:label path="middleName" class="label">Middle Name:</form:label>
							<br />
							<form:input path="middleName" />
							<form:errors path="middleName" class="error" />
							<br />

							<form:label path="lastName" class="label">Last Name*:</form:label>
							<br />
							<form:input path="lastName" />
							<form:errors path="lastName" class="error" />
							<br />

							<form:label path="birthday" class="label">Date of Birth*:</form:label>
							<br />
							<form:input id="datefield" path="birthday" type="date" /><span class="error">${errorMessage}</span>
							<form:errors path="birthday" class="error" />
							<br />

							<form:label path="position">Position*:</form:label>
							<br />
							<form:input path="position" />
							<form:errors path="position" class="error" />
							<br />
						</div>

						<br />
						<form:button>Submit</form:button>
						
						<%-- <form:button>Reset</form:button> --%>
					</div>
				</form:form>
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
