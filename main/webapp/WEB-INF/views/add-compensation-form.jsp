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
<title>Add Compensation</title>
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
				<h2>Compensation for Employee: ${employee.firstName}
					${employee.lastName} (id=${employee.id})</h2>
			</div>
			<div class="section-content">
				<br />
				<form:form action="/add-compensation/${employee.id}" method="post"
					modelAttribute="compensation">
					<div class="form-details">
						<div class="stretch-input">
							<form:label path="compensationType" class="label">Compensation Type:</form:label>
							<span class="error">${typeError}</span>
							<form:select path="compensationType" id="compensationType">
								<form:option value="Salary">Salary</form:option>
								<form:option value="Bonus">Bonus</form:option>
								<form:option value="Commission">Commission</form:option>
								<form:option value="Allowance">Allowance</form:option>
								<form:option value="Adjustment">Adjustment</form:option>
							</form:select>
							<form:errors path="compensationType" class="error" />
							<br />

							<form:label path="amount" class="label">Amount:</form:label><span class="error">${amountError}</span> 
								<c:if test="${compensation.compensationType.equals('Commission')}">
									<span class="error">${"Make sure to enter an exact amount, not a percentage"}</span>  
									
								</c:if> 
							<br />
							
							<form:input path="amount"
								pattern="^(\d{1,3}(\,\d{3})*|(\d+))(\.\d{2})?$" />
							<form:errors path="amount" class="error" />
							<br />

							<form:label path="description" class="label">Description:</form:label>
							<span class="error">${descriptionError}</span> <br />
							<form:input path="description" />
							<form:errors path="description" class="error" />
							<br />

							<form:label path="date" class="label">Compensation Date:</form:label>
							<span class="error">${dateError}</span> <br />
							<form:input id="compensationDate" path="date" type="month" />
							<form:errors path="date" class="error" />
							<br />

							<form:label path="employee" class="label">Associated Employee:</form:label>
							<br />
							<form:input path="employee" value="${employeeId}" readonly="true" />
							<br /> <br />
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
