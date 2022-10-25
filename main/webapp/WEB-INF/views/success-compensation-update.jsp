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
<title>Success!</title>
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
		<section>
			<div class="section-header">
				<h2>Success!</h2>
			</div>
			<div class="section-content">
				<p>Compensation was successfully ${task} for ${employee.firstName} ${employee.lastName} (Id=${employee.id}) with the following details:</p>
				<div class="table">
					<table>
						<thead class="center-text">
							<th>Type</th>
							<th>Amount</th>
							<th>Description</th>
							<th>Date</th>
						</thead>
						<tbody>
							<tr>
								<td>${compensation.compensationType}</td>
								<td>${compensation.amount}</td>
								<td>${compensation.description}</td>
								<td>${compensation.date}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btn-group success-table">
					<a href="" onclick="self.close()" class="btn">Go Back</a>
				</div>
				<div class="clear-float"></div>
			</div>
		</section>

	</main>

	<footer>
		<nav class="footer-nav">
			<ul class="nav-links clearfix">
				<li><a href="/home">Home</a></li>
				<!-- <li><a href="/add-employee" target="_blank">Add Employee</a></li>
				<li><a href="/search-employee">Search Employee</a></li> -->
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
