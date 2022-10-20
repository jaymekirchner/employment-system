<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
				<li><a href="/add-employee" target="_blank">Add Employee</a></li>
				<li><a href="/search-employee">Search Employee</a></li>
			</ul>
		</nav>
	</header>

	<main>
		<section id="compensation-list-section">
			<div class="section-header">
				<h2>Compensation History for Employee: ${employee.firstName}
					${employee.lastName} (id=${employee.id})</h2>
			</div>
			<div class="section-content">
			
				<form:form action="/filter-compensation/${employee.id}" method="post" modelAttribute="compensation">
					<div class="form-details">
						<div class="stretch-input">
						<p class="error">${validDatesError}</p>
							<form:label path="startDate" class="label">Start Date:</form:label><br/>
							<form:input path="startDate" type="month" value="${dateValue}"/>
							<form:errors path="startDate" class="error" />
							<br />

							<form:label path="endDate" class="label">End Date:</form:label><br/>
							<form:input path="endDate" type="month"  value="${dateValue}"/>
							<form:errors path="endDate" class="error" />
							<br />
						</div>
						<br />
						<form:button>Submit</form:button>
					</div>
				</form:form>
			
			
			
			
				<%-- <div class="btn-group">
					<a href="/add-compensation/${employee.id}" target="_blank" class="btn">Add Compensation</a> 
					<a href="/compensation-history/${employee.id}" target="_blank" class="btn">Compensation History</a> 
				</div> --%>
				
				<%-- <div class="table">
					<table>
						<thead class="center-text">
							<th>Id</th>
							<th>Type</th>
							<th>Amount</th>
							<th>Description</th>
							<th>Date</th>
							<th>Actions</th>
						</thead>
						<tbody>
							<c:forEach items="${compensationList}" var="compensation">
								<tr>
									<td class="center-text">${compensation.id}</td>
									<td>${compensation.compensationType}</td>
									<td>${compensation.amount}</td>
									<td>${compensation.description}</td>
									<td>${compensation.date}</td>
									<td class="center-text actions">
										<a href="/edit-compensation/${compensation.id}" target="_blank">Edit</a> 
										&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
										<a href="/delete-compensation/${employee.id}/${compensation.id}" target="_blank">Delete</a>
									
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div> --%>
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
