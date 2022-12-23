<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://kit.fontawesome.com/e8dcf38ad6.js"
	crossorigin="anonymous">
	
</script>
<title>Customer Form</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/add-customer-style.css" />
</head>
<body>
	<header>
		<h1>CRM - Customer Relationship Manager</h1>
	</header>
	<div id="container">
		<div id="form-container">
			<div class="form-header">
				<h3>Customer Form</h3>
			</div>
			<div class="form-content">
			<form:form action="saveCustomer" modelAttribute="customer"
				method="POST">
				<!-- Need to associate this data with customer id  -->
				<form:hidden path="id" />
				<table>
					<tbody>
						<tr>
							<td><label>First Name:</label></td>
							<td><form:input path="firstName" /></td>
						</tr>
						<tr>
							<td><label>Last Name:</label></td>
							<td><form:input path="lastName" /></td>
						</tr>
						<tr>
							<td><label>Email:</label></td>
							<td><form:input path="email" /></td>
						</tr>
						<tr>
							<td><label></label></td>
							<td><input type="submit" value="Save" class="save-button" /></td>
						</tr>
					</tbody>
				</table>
			</form:form>

			<div style=""></div>

			<p>
				<a href="${pageContext.request.contextPath}/customer/list">Back
					to list</a>
			</p>
			</div>
		</div>
	</div>

</body>
</html>