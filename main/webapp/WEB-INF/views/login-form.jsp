<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/styles.css">
<link rel="icon" type="image/jpg" href="images/my-logo.jpg"  sizes="16x16">
<title>Admin Login</title>
</head>

<body>
	<main>
		<section id="contact-me-section">
			<div class="section-header">
				<h2>Admin Login</h2>
			</div>
			<div class="section-content">

				<br />
				<form:form action="/login" method="post" modelAttribute="login">
					<div class="form-details">
						<div class="stretch-input">
						
				
							<form:label path="username" class="label">Username:</form:label>
							<br />
							<form:input path="username" />
							<form:errors path="username" class="error" />
							<br />
							<form:label path="password" class="label">Password:</form:label>
							<br />
							<form:input path="password" type="password" />
							<form:errors path="password" class="error" />
							<br />
							<div class="error">${errorMessage}</div>
						</div>

						<br /> <br />
						<form:button>Submit</form:button>

					</div>
				</form:form> 
			</div>
		</section>

	</main>

	<footer>
		<p id="datetime"></p>
		<script>
			document.getElementById("datetime").innerHTML = Date();
		</script>
		<noscript>Sorry, your browser does not support JavaScript!</noscript>
	</footer>

</body>
</html>
