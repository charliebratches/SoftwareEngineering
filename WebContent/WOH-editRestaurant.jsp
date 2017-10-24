<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

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
	
	<link rel="stylesheet" type="text/css" href="editRestaurant/WOH-editRestaurant.css">
	<link rel="stylesheet" type="text/css" href="site/WOH-site.css">
	
	<script src="editRestaurant/editRestaurant.js"></script>
	<title>Edit Restaurant</title>
</head>

<body>
<%@include file="banner/WOH-banner.html" %>
	
	<div class ="container-fluid">
		<div class="row-fluid">
			<div class="col-sm-10 col-sm-offset-1">
			<h1 class="WOH-editRestaurant--Title">Edit Restaurant</h1>
				<form action = "Edit" method = "POST" class="form-horizontal WOH-editRestaurant-form">
					<input type="hidden" name="id" value="${restaurant.getId()}">
					<div class = "col-sm-10">						
						<!-- Restaurant Name Textbox -->
							<div class="form-group">
							<label class="control-label col-sm-2" for="WOH-editRestaurant-restaurantNameInput">Name</label>
								<div class="col-sm-10">
		         					<input type = "text" class="form-control WOH-editRestaurant-restaurantNameInput" name = "name" required value="${restaurant.getName()}">
		         				</div>
		         			</div>
	         			
						<!-- Average Price Dropdown -->
						<div class="form-group">
							<input type="hidden" name="startingPrice" class="WOH-editRestaurant-startingPriceHiddenInput" value ="${restaurant.getPrice()}">
								<div class="col-sm-2">
			  						<label class="pull-right control-label" for="WOH-editRestaurant-priceInput">Price</label>
			  					</div>
			  					<div class="col-sm-10">
			  						<select class="form-control WOH-editRestaurant-priceInput" id ="priceSelect" name="price">
			    						<option selected="selected" value = "1" >$</option>
			    						<option value = "2" >$$</option>
			    						<option value = "3" >$$$</option>
			    						<option value = "4" >$$$$</option>
			  						</select>
			  					</div>
		  				</div>
						
						<!-- Distance Slider -->
						<div class="form-group">
							<input type="hidden" name="startingDistance" class="WOH-editRestaurant-StartingDistanceHiddenInput" value ="${restaurant.getDistance()}">
							<input type="hidden" name="distance" class="WOH-editRestaurant-distanceHiddenInput">
							<label class="control-label col-sm-2 WOH-editRestaurant-distanceLabel" for="WOH-editRestaurant-distanceInput">Distance</label>
								<div class="col-sm-10">
  									<input id="distanceSlider" class="WOH-editRestaurant-distanceInput" data-slider-id='distanceSlider1' type="text" data-slider-min="1" data-slider-max="100" data-slider-step="1" data-slider-value="${restaurant.getDistance()}"/>
		         				</div>
		         		</div>
		         						
		         		<!-- Food Type Dropdown -->
							<div class="form-group">
								<input type="hidden" name="startingFoodType" class="WOH-editRestaurant-startingFoodTypeHiddenInput" value ="${restaurant.getType()}">
								<div class="col-sm-2">
			  						<label class="pull-right control-label" for="WOH-editRestaurant-typeInput">Food Type</label>
			  					</div>
			  					<div class="col-sm-10">
			  						<select class="form-control WOH-editRestaurant-typeInput" name="type" id="foodTypeSelect">
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
								<input type="hidden" name="notes" class="WOH-editRestaurant-notesInput">
								<div class = "col-sm-2">
	  								<label class = "control-label pull-right" for="WOH-editRestaurant-notesTextArea">Notes</label>
	  							</div>
	  							<div class = "col-sm-10">
	  							<textarea class="WOH-editRestaurant-notesTextArea" rows="5" name="notesInput"><%= '\n' %><c:forEach items="${restaurant.getNotes()}" var="current"><c:out value="${current}" /></c:forEach></textarea>
	  							</div>
							</div>				
					</div>
					
					<div class = "col-sm-2">
					
					<!-- Cuisine Type Checkbox -->
				  		<div class="panel panel-default form-group WOH-editRestaurant-cuisineCheckboxGroup"> 
				  			<div class="panel-heading">		
					  			<!-- Checkbox Search -->
								<div class="WOH-editRestaurant-cuisineSearchInputGroup inner-addon left-addon">
	    							<i class="glyphicon glyphicon-search"></i>
	    							<input type="text" class="form-control WOH-editRestaurant-cuisineSearch" name="cuisineSearch" placeholder="Search">
	  							</div>
  							</div>
  					
  							<!-- Build comparison string to determine which boxes are checked by default -->
  							<c:forEach items="${restaurant.getCuisines()}" var="currentItem" varStatus="stat">
  								<c:set var="cuisineString" value="${stat.first ? '' : cuisineString} ${currentItem}" />
							</c:forEach>
				  			<div class="WOH-editRestaurant-cuisineCheckboxPanelBody panel-body">
					  			<div class="WOH-editRestaurant-cuisineCheckboxPanel">
									<input type="hidden" name="cuisines" class="WOH-editRestaurant-cuisineInput">
										
										<div class="checkbox">
											<label><input type="checkbox" value="american" class="WOH-editRestaurant-checkbox"<c:if test = "${fn:contains(cuisineString, 'american')}">checked="checked"</c:if> />American</label>
										</div>
										<div class="checkbox">
											<label><input type="checkbox" value="chinese" class="WOH-editRestaurant-checkbox" <c:if test = "${fn:contains(cuisineString, 'chinese')}">checked="checked"</c:if> />Chinese</label>
										</div>
										<div class="checkbox">
											<label><input type="checkbox" value="mexican" class="WOH-editRestaurant-checkbox" <c:if test = "${fn:contains(cuisineString, 'mexican')}">checked="checked"</c:if> />Mexican</label>
										</div>
										<div class="checkbox">
											<label><input type="checkbox" value="indian" class="WOH-editRestaurant-checkbox" <c:if test = "${fn:contains(cuisineString, 'indian')}">checked="checked"</c:if> />Indian</label>
										</div>
										<div class="checkbox">
											<label><input type="checkbox" value="korean" class="WOH-editRestaurant-checkbox" <c:if test = "${fn:contains(cuisineString, 'korean')}">checked="checked"</c:if> />Korean</label>
										</div>
										<div class="checkbox">
											<label><input type="checkbox" value="pizza" class="WOH-editRestaurant-checkbox" <c:if test = "${fn:contains(cuisineString, 'pizza')}">checked="checked"</c:if> />Pizza</label>
										</div>
										<div class="checkbox">
											<label><input type="checkbox" value="italian" class="WOH-editRestaurant-checkbox" <c:if test = "${fn:contains(cuisineString, 'italian')}">checked="checked"</c:if> />Italian</label>
										</div>
										<div class="checkbox">
											<label><input type="checkbox" value="sandwiches" class="WOH-editRestaurant-checkbox" <c:if test = "${fn:contains(cuisineString, 'sandwiches')}">checked="checked"</c:if> />Sandwiches</label>
										</div>
										
								</div>
							</div>
						</div>
						
						<!-- Submit Button -->
		  					<button type="button" class="btn btn-default pull-right WOH-editRestaurant-submitButton" onclick="formatData()">Submit</button>
					</div>
					
				</form>
			</div>
		</div>
	</div>

</body>

</html>