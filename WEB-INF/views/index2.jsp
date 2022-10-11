<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<html>
<head>
<title>Employment System</title>
<meta charset="utf-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>

	<h1>Employment System</h1>
	<p>Welcome to the Employment System!</p>

	<!-- ADD EMPLOYEE BUTTON -->
	<button id="addEmployee">Add Employee</button>
	<script>
		//'#addEmployee' = button ID
		$("#addEmployee").click(function() {
			window.location.href = "WEB-INF/views/addEmployeePage"; //opens registration page window
		});
	</script>

	<!-- SEARCH EMPLOYEE BUTTON -->
	<button id="searchEmployee">Search Employee</button>
	<script>
		
	</script>

	<button>View &amp; Edit</button>
	<script>
		
	</script>

	<div class="btn-group" style="width: 100%">
		<button style="width: 50%">View Compensation Details</button>
		<script>
			
		</script>

		<button style="width: 50%">View Compensation History</button>
		<script>
			
		</script>
	</div>
	<div class="btn-group" style="width: 100%">
		<button style="width: 50%">Edit Compensation Details</button>
		<script>
			
		</script>
		<button style="width: 50%">View Compensation Breakdown</button>
		<script>
			
		</script>
	</div>


	<!-- 	<button>View Compensation Details</button> -->
	<!-- 	<button>View Compensation History</button> -->

	<!-- 	<button>Edit Compensation Details</button> -->

	<!-- 	<button>View Compensation Breakdown</button> -->
	<br />
	<br />
	<span id="buttonClick"></span>

</body>
</html>