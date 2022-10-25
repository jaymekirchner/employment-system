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
				<form:form action="/update-compensation/${employee.id}/${compensation.id}" method="post" modelAttribute="compensation">
					<div class="form-details">
						<div class="stretch-input">
						
							<form:label path="id" class="label">Id</form:label>
							<form:input path="id" value="${compensation.id}" readonly="true"/>
							<br/>
							
							<form:label path="compensationType" class="label">Compensation Type:</form:label><br/>
							<form:input path="compensationType" id="compensationType"  readonly="true" value="${compensation.compensationType}"/>
							<br />

							<form:label path="amount" class="label">Amount:</form:label><span class="error">${amountError}</span> 
								<c:if test="${compensation.compensationType.equals('Commission')}">
									<span class="error">${"Make sure to enter an exact amount, not a percentage"}</span>  
								</c:if> 
								&nbsp;&nbsp;<form:errors path="amount" class="error" />
							<br />
							<form:input path="amount" value="${compensation.amount}"/>
							<br />

							<form:label path="description" class="label">Description:</form:label>&nbsp;&nbsp;<form:errors path="description" class="error" />
							<span class="error">${descriptionError}</span> <br />
							<form:input path="description" value="${compensation.description}"/>
							<br />

							<form:label path="date" class="label">Compensation Date:</form:label> 
							<br />
							<form:input id="compensationDate" path="date" type="month" value="${dateValue}" readonly="true" />
							<br />

							<form:label path="employee" class="label">Associated Employee:</form:label>
							<br />
							<form:input path="employee" value="${employeeId}" readonly="true" />
							<br /> <br />
						</div>

						<br />
						<form:button type="submit">Submit</form:button>
						<form:button type="reset">Reset</form:button>
						<form:button onclick="self.close()">Go Back</form:button>

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
