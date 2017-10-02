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
	<script src="addRestaurant/addRestaurant.js"></script>
	
	<link rel="stylesheet" type="text/css" href="addRestaurant/WOH-addRestaurant.css">
	<link rel="stylesheet" type="text/css" href="site/WOH-site.css">
	
	<title>Add Restaurant</title>
</head>

<body>
<%@include file="banner/WOH-banner.html" %>
	
	<div class ="container">
		<div class="row">
			<div class="col-sm-10 col-sm-offset-1">
				<form action = "" method = "POST" class="form-horizontal WOH-addRestaurant-form">
										
					<!-- Restaurant Name Textbox -->
						<div class="form-group">
						<label class="control-label col-sm-2" for="WOH-addRestaurants-restaurantNameInput">Restaurant Name</label>
							<div class="col-sm-10">
	         					<input type = "text" class="form-control WOH-addRestaurant-restaurantNameInput" name = "name">
	         				</div>
	         			</div>
	         			
					<!-- Average Price Textbox -->
						<div class="form-group">
						<label class="control-label col-sm-2" for="WOH-addRestaurant-priceInput">Price Per Meal</label>
							<div class="col-sm-10">
	         					<input type = "text" class="form-control WOH-addRestaurant-priceInput" name = "price">
	         				</div>
	         			</div>
					
					<!-- Distance Textbox(If we use this) -->
						<div class="form-group">
						<label class="control-label col-sm-2" for="WOH-addRestaurant-distanceInput">Distance</label>
							<div class="col-sm-10">
	         					<input type = "text" class="form-control WOH-addRestaurant-distanceInput" name = "distance">
	         				</div>
	         			</div>
	         			
	         		<!-- Food Type Dropdown -->
						<div class="form-group">
							<div class="col-sm-2">
		  						<label class="control-label" for="WOH-addRestaurant-typeInput">Select Food Type</label>
		  					</div>
		  					<div class="col-sm-10">
		  						<select class="form-control WOH-addRestaurants-typeInput" name="type">
		    						<option value = "fastFood" >Fast Food</option>
		    						<option value = "sitDown" >Sit-Down</option>
		    						<option value = "dessert" >Dessert</option>
		  						</select>
		  					</div>
	  					</div>
	  					
	  				<!-- Cuisine Type Checkbox -->
	  					<div class="form-group "> 
	  						<input type="hidden" name="cuisines" class="WOH-addRestaurant-cuisineInput">
	  						<div class="checkbox ">
	  							<label><input type="checkbox" value="american" class="WOH-addRestaurant-checkbox">American</label>
							</div>
							<div class="checkbox">
	  							<label><input type="checkbox" value="chinese" class="WOH-addRestaurant-checkbox">Chinese</label>
							</div>
							<div class="checkbox">
	  							<label><input type="checkbox" value="mexican" class="WOH-addRestaurant-checkbox">Mexican</label>
							</div>
						</div>
						
					<!-- Notes Text Area -->
						<div class="form-group">
  							<label for="WOH-addRestaurants-notesInput">Notes</label>
  							<textarea class="form-control WOH-addRestaurants-notesInput" rows="5" name="notes"></textarea>
						</div>
	  				
	  				<!-- Submit Button -->
	  					<button type="button" class="btn btn-default" onclick="formatData()">Submit</button>
						
				</form>
			</div>
		</div>
	</div>


</body>

</html>