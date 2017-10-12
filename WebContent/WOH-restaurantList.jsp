
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>

<!-- The taglib tag is very important.  If its not included, jstl wont work. -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">	

	<link rel="stylesheet" type="text/css" href="site/WOH-site.css"/>
	<link rel="stylesheet" type="text/css" href="restaurantList/WOH-restaurantList.css"/>

  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  	<script type="text/javascript" src="restaurantList/WOH-restaurantList.js"></script>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Restaurants</title>

</head>

<body>

<%@ page isELIgnored="false" %>

<%@include file="banner/WOH-banner.jsp" %>

<%@ page import ="java.util.ArrayList, wheelofhunger.models.RestaurantModel" %>



<%

	ArrayList<RestaurantModel> restaurantList = (ArrayList<RestaurantModel>) request.getAttribute("restaurantList");

%>



<div class ="container">

	<h1 class = "WOH-RestaurantList--Title">Restaurants</h1>

	<table class ="table table-striped">

		<thead>

			<tr>

				<th class ="col-sm-2">Restaurant</th>

				<th class ="col-sm-2">Type</th>

				<th class ="col-sm-2">Price</th>

				<th class ="col-sm-1"></th>
				<th class ="col-sm-3 WOH-RestaurantList--Button-Panel">
					<div class="pull-right">
											
						<a href="WOH-addRestaurant.jsp" class="glyphicon glyphicon-plus btn btn-success WOH-RestaurantList--New-Restaurant-Button"></a>
					</div>
					
				</th>

			</tr>

		</thead>

		<tbody>

			

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
								<form action="GetById" method="GET" class="WOH-RestaurantList--Edit-Form">
									<input type="hidden" name="id" value="${model.getId() }">
									<button type="submit" class="glyphicon glyphicon-pencil btn btn-primary"></button>
								</form>
								<button class="glyphicon glyphicon-trash btn btn-danger" data-toggle="modal"
									data-target="#WOH-RestaurantList--Delete-Modal" onclick="setId(${model.getId()})"></button>
							</div>							
						</td>
						
					</tr>					

				</c:forEach>

			</c:if>

		</tbody>

	</table>

</div>

<!-- Delete Modal -->
<div id="WOH-RestaurantList--Delete-Modal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title text-center">Deletion Confirmation</h4>
      </div>
      <div class="modal-body">
        <p class ="text-center">Are you sure you want to delete this restaurant?</p>    
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="setId(0)">Cancel</button>
        <button class="btn btn-danger" onclick="deleteById()">Confirm</button>
      </div>
    </div>
  </div>
</div>

</body>

</html>