<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="5" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/styles.css">
<link rel="icon" type="image/jpg" href="images/my-logo.jpg"  sizes="16x16">
<title>Home</title>

</head>

<body>
	<header>
		<div class="header-content clearfix">
			<h1>Employment System</h1>
		</div>
		<nav class="header-nav">
			<ul class="nav-links">
				<li><a href="/" onclick="self.reload(true);">Home</a></li>
				<li><a href="/add-employee" target="_blank">Add Employee</a></li>
            	<li><a href="/search-employee">Search Employee</a></li>
			</ul>
		</nav>
	</header>

	<main>
		<section>
			<div class="section-header"><h2>List of Employees</h2></div>
			
			
			<div class="table"> 
				<table>
					<thead class="center-text">
						<th>Id</th>
						<th>First Name</th>
						<th>Middle Name</th>
						<th>Last Name</th>
						<th>Birth Date</th>
						<th>Position</th>
						<!-- <th>Actions</th> -->
					</thead>
					<tbody>
						<c:forEach items="${employees}" var="employee">
							<tr>
								<td class="center-text">${employee.id}</td>
								<td>${employee.firstName}</td>
								<td>${employee.middleName}</td>
								<td>${employee.lastName}</td>
								<td>${employee.birthday}</td>
								<td>${employee.position}</td>
								<%-- <td class="center-text actions">
									<a href="/delete/${employee.id}">Delete</a>
								</td> --%>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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
