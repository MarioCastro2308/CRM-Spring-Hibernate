<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
    	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    	<script
      		src="https://kit.fontawesome.com/e8dcf38ad6.js"
      		crossorigin="anonymous"
    	>
    	</script>
		<title>List Customers</title>
		<link type="text/css" rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
	<header>
		<h1>CRM - Customer Relationship Manager</h1>
	</header>
	<div id="container">
		<div id="customers-container">
			<!-- Add button  -->
			<input type="button" value="Add customer"
				onclick="window.location.href='formToAddCustomer'; return false;"
				class="add-button" />
			<!-- Add out html table here  -->
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
				<!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${customers}">
					<!-- construct an "update" link with customer id -->
					<c:url var="updateLink" value="/customer/formToUpdateCustomer">
						<c:param name="customerId" value="${tempCustomer.id}" />
					</c:url>
					<!-- construct a "delete" link with customer id-->
					<c:url var="deleteLink" value="/customer/deleteCustomer">
						<c:param name="customerId" value="${tempCustomer.id}" />
					</c:url>
					<tr>
						<td>${tempCustomer.firstName}</td>
						<td>${tempCustomer.lastName}</td>
						<td>${tempCustomer.email}</td>
						<td>
							<!-- display update link -->
							<a href="${updateLink}">Update</a>
							|
							<a href="${deleteLink}"
								onclick="if(!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>