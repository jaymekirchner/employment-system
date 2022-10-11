	<input type="button" value="Add Employee"
		onclick="window.location.href='add-employee.jsp'; return false;" />

	<table border="1">
				<tr>
					<th>Id</th>
					<th>First Name</th>
					<th>Middle Name</th>
					<th>Last Name</th>
					<th>Date of Birth</th>
					<th>Position</th>
					<th>Action</th>
				</tr>

				<c:forEach var="emp" items="${EMPLOYEE_LIST}">

				<!-- define link for each student -->
				<c:url var="tempLink" value="EmployeeControllerServlet">
					<c:param name="command" value="LOAD" />
					<c:param name="studentId" value="${emp.id}" />
				</c:url>
				
				<tr>
					<td>${emp.id}</td>
					<td>${emp.firstName}</td>
					<td>${emp.middleName}</td>
					<td>${emp.lastName}</td>
					<td>${emp.dateOfBirth}</td>
					<td>${emp.position}</td>
					<td><a href="${tempLink}">Update</a>
					<td><a href="${tempLink}">Delete</a>
				</tr>
			</c:forEach>
			</table>