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
	
	
	<!-- Bootstrap - Slider -->
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/9.9.0/bootstrap-slider.js"></script> -->
	<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-slider/9.9.0/css/bootstrap-slider.css"></script> -->
	
	<link rel="stylesheet" type="text/css" href="addRestaurant/WOH-addRestaurant.css">
	<link rel="stylesheet" type="text/css" href="site/WOH-site.css">
	
	<script src="addRestaurant/addRestaurant.js"></script>
	<title>Add Restaurant</title>
</head>

<body>
<%@include file="banner/WOH-banner.jsp" %>
	
	<div class ="container-fluid">
		
		<div class="row-fluid">
			<div class="col-sm-10 col-sm-offset-1">
			<h1 class="WOH-addRestaurant--Title">New Restaurant</h1>
				<form action = "Insert" method = "POST" class="form-horizontal WOH-addRestaurant-form">
					<div class = "col-sm-10">						
						<!-- Restaurant Name Textbox -->
							<div class="form-group">
							<label class="control-label col-sm-2" for="WOH-addRestaurants-restaurantNameInput">Name</label>
								<div class="col-sm-10">
		         					<input type = "text" class="form-control WOH-addRestaurants-restaurantNameInput" name = "name">
		         				</div>
		         			</div>
	         			
						<!-- Average Price Dropdown -->
						<div class="form-group">
								<div class="col-sm-2">
			  						<label class="pull-right control-label" for="WOH-addRestaurant-priceInput">Price</label>
			  					</div>
			  					<div class="col-sm-10">
			  						<select class="form-control WOH-addRestaurant-priceInput" name="price">
			    						<option selected="selected" value = "1" >-- Price --</option>
			    						<option value = "1" >$</option>
			    						<option value = "2" >$$</option>
			    						<option value = "3" >$$$</option>
			    						<option value = "4" >$$$$</option>
			  						</select>
			  					</div>
		  				</div>
						
						<!-- Distance Textbox(If we use this) -->
						<div class="form-group">
							<input type="hidden" name="distance" class="WOH-addRestaurant-distanceHiddenInput">
							<label class="control-label col-sm-2 WOH-addRestaurant-distanceLabel" for="WOH-addRestaurant-distanceInput">Distance</label>
								<div class="col-sm-10">
  									<input id="distanceSlider" class="WOH-addRestaurant-distanceInput" data-slider-id='distanceSlider1' type="text" data-slider-min="1" data-slider-max="100" data-slider-step="1" data-slider-value="1"/>
		         				</div>
		         		</div>
		         			
		         			
		         					
		         		<!-- Food Type Dropdown -->
							<div class="form-group">
								<div class="col-sm-2">
			  						<label class="pull-right control-label" for="WOH-addRestaurants-typeInput">Food Type</label>
			  					</div>
			  					<div class="col-sm-10">
			  						<select class="form-control WOH-addRestaurants-typeInput" name="type">
			    						<option selected="selected" value = "1" >Fast Food</option>
			    						<option value = "2" >Sit-Down</option>
			    						<option value = "3" >Dessert</option>
			    						<option value = "4" >Bakery</option>
			    						<option value = "5" >Cafe</option>
			  						</select>
			  					</div>
		  					</div>
		  						
						<!-- Notes Text Area -->
							<div class="form-group">
								<input type="hidden" name="notes" class="WOH-addRestaurant-notesInput">
								<div class = "col-sm-2">
	  							<label class = "control-label pull-right" for="WOH-addRestaurants-notesTextArea">Notes</label>
	  							</div>
	  							<div class = "col-sm-10">
	  							<textarea class="WOH-addRestaurants-notesTextArea form-control" rows="5" name="notesInput"></textarea>
	  							</div>
							</div>				
					</div>
					
					<div class = "col-sm-2">
					
					<!-- Cuisine Type Checkbox -->
				  		<div class="panel panel-default form-group WOH-addRestaurant-cuisineCheckboxGroup"> 
				  		
				  			<!-- Checkbox Search -->
							<div class="WOH-addRestaurants-cuisineSearchInputGroup input-group ">
    							<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
    							<input type="text" class="form-control WOH-addRestaurants-cuisineSearch" name="cuisineSearch" placeholder="Search">
  							</div>
				  			<div class="WOH-addRestaurant-cuisineCheckboxPanel">
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
									<div class="checkbox">
										<label><input type="checkbox" value="indian" class="WOH-addRestaurant-checkbox">Indian</label>
									</div>
									<div class="checkbox">
										<label><input type="checkbox" value="korean" class="WOH-addRestaurant-checkbox">Korean</label>
									</div>
									<div class="checkbox">
										<label><input type="checkbox" value="pizza" class="WOH-addRestaurant-checkbox">Pizza</label>
									</div>
									<div class="checkbox">
										<label><input type="checkbox" value="italian" class="WOH-addRestaurant-checkbox">Italian</label>
									</div>
									<div class="checkbox">
										<label><input type="checkbox" value="italian" class="WOH-addRestaurant-checkbox">Sandwiches</label>
									</div>
								</div>
						</div>
						
						<!-- Submit Button -->
		  					<button type="button" class="btn btn-default pull-right WOH-addRestaurants-submitButton" onclick="formatData()">Submit</button>
					</div>
					
				</form>
			</div>
		</div>
	</div>

</body>

</html>