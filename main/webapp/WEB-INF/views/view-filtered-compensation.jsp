<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.text.DecimalFormat"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/styles.css">
<link rel="icon" type="image/jpg" href="images/my-logo.jpg"
	sizes="16x16">
<title>Compensation History</title>
</head>

<body>

	<header>
		<div class="header-content clearfix">
			<h1>Employment System</h1>
		</div>
		<nav class="header-nav">
			<ul class="nav-links">
				<li><a href="/home">Home</a></li>
				<!-- <li><a href="/add-employee" target="_blank">Add Employee</a></li>
				<li><a href="/search-employee">Search Employee</a></li> -->
			</ul>
		</nav>
	</header>

	<main>
		<section id="compensation-list-section">
			<div class="section-header">
				<h2>Compensation History for ${employee.firstName} ${employee.lastName} (id=${employee.id})</h2>
			</div>
			<div class="section-content">

				<div class="btn-group">
					<%-- <a href="/add-compensation/${employee.id}" target="_blank" class="btn">Add Compensation</a> --%> 
					<a href="/filter-compensation/${employee.id}" class="btn">Filter Compensation</a>
					<a href="" onclick="self.close()" class="btn">Go Back</a>
				</div>
				<div class="clear-float"></div>
				<div class="table history-table">
					<table>
						<thead class="center-text">
							<th>Date</th>
							<th>Total</th>
							<th>Actions</th>
						</thead>
						<tbody>
							<c:forEach items="${map}" var="entry">
								<tr>
									<td class="center-text">${entry.key}</td>
									<td class="center-text">${entry.value}</td>
									<td class="center-text actions">
										<a href="/view-details/${employee.id}/${entry.key}" target="_blank">Details</a> 
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
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
