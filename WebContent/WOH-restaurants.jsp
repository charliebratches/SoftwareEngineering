<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="restaurants/WOH-restaurants.css">
	<link rel="stylesheet" type="text/css" href="site/WOH-site.css">
	
	<title>Restaurants</title>
</head>

<body>
	<%@ page isELIgnored="false" %>
	<%@include file="banner/WOH-banner.html" %>
	<%@ page import ="java.util.ArrayList, wheelofhunger.models.RestaurantModel" %>

	<%
	ArrayList<RestaurantModel> restaurantList = (ArrayList<RestaurantModel>) request.getAttribute("restaurantList");
	%>
	<div class ="container">
	<h1 class = "CL-NewContact--Title">Contacts</h1>
	<table class ="table table-striped">
		<thead>
			<tr>
				<th class ="col-sm-2">Restaurant</th>
				<th class ="col-sm-2">Type</th>
				<th class ="col-sm-2">Price</th>
				<th class ="col-sm-1"></th>
				<th class ="col-sm-3 CL-ContactList--Button-Panel">
					<div class="pull-right">
												
						<a href="NewContact.jsp" class="glyphicon glyphicon-plus btn btn-success CL-ContactList--New-Contact-Button"></a>
					</div>
					
				</th>
			</tr>
		</thead>
		<tbody>
			<!-- These <c> are all jstl tags.  use these instead of the java snippets that look like <%  %>  -->
			<c:if test="${restaurantList !=null }">
				<!-- This forEach statement is saying that each item within contactList is called model
				 and it then loops through contactList -->
				<c:forEach items = "${restaurantList}" var="model">
					<tr>
						<td class ="col-sm-2">${model.getName()}</td>
						<td class ="col-sm-2">${model.getType()}</td>
						<td class ="col-sm-2">${model.getPrice()}</td>
						<td class ="col-sm-1"></td>
						<td class ="col-sm-3">
							<div class="pull-right">
								<form action="GetById" method="GET" class="WOH-restaurants--Edit-Form">
									<input type="hidden" name="id" value="">
									<button type="submit" class="glyphicon glyphicon-pencil btn btn-primary"></button>
								</form>
								<button class="glyphicon glyphicon-trash btn btn-danger"></button>
							</div>							
						</td>
					</tr>					
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</div>
	
</body>
</html>