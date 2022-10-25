<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/styles.css">
<link rel="icon" type="image/jpg" href="images/my-logo.jpg" sizes="16x16">
<title>Add Employee</title>
</head>

<body>

	<header>
		<div class="header-content clearfix">
			<h1>Employment System</h1>
		</div>
		<nav class="header-nav">
			<ul class="nav-links">
				<li><a href="/home" onclick="self.close();">Home</a></li>
			</ul>
		</nav>
	</header>

	<main>
		<section>
			<div class="section-header">
				<h2>Success!</h2>
			</div>
			<div class="section-content">
				<p>Employee was successfully ${task} with the following details:
				<div class="table success-table">
					<table>
						<thead class="center-text">
							<th>Id</th>
							<th>First Name</th>
							<th>Middle Name</th>
							<th>Last Name</th>
							<th>Birth Date</th>
							<th>Position</th>
						</thead>
						<tbody>
							<tr>
								<td>${employee.id}</td>
								<td>${employee.firstName}</td>
								<td>${employee.middleName}</td>
								<td>${employee.lastName}</td>
								<td>${employee.birthday}</td>
								<td>${employee.position}</td>
							</tr>
						</tbody>
					</table>
				</div>
				</p>
			</div>
		</section>

	</main>

	<footer>
		<div class="clear-float"></div>
		<p id="datetime"></p>
		<script>
			document.getElementById("datetime").innerHTML = Date();
		</script>
		<noscript>Sorry, your browser does not support JavaScript!</noscript>
	</footer>

</body>
</html>
