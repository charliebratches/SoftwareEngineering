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
	
	<link rel="stylesheet" type="text/css" href="spinSetup/WOH-spinSetup.css">
	<link rel="stylesheet" type="text/css" href="site/WOH-site.css">
	
	<script src="spinSetup/spinSetup.js"></script>
	<title>Spin Setup</title>
</head>

<body>
<%@include file="banner/WOH-banner.html" %>
	
	<div class ="container-fluid">
		<div class="row-fluid">
			<div class="col-sm-10 col-sm-offset-1">
				<h1 class="WOH-spinSetup--Title">Wheel Setup</h1>
				<form action = "WheelQuery" method = "POST" class="form-horizontal WOH-spinSetup-form">
					<div class = "col-sm-10">						
	         			
						<!-- Average Price Dropdown -->
						<div class="form-group">
								<div class="col-sm-2">
			  						<label class="pull-right control-label" for="WOH-spinSetup-priceInput">Price</label>
			  					</div>
			  					<div class="col-sm-10">
			  						<select class="form-control WOH-spinSetup-priceInput" name="price">
			    						<option selected="selected" value = "1" >$</option>
			    						<option value = "2" >$$</option>
			    						<option value = "3" >$$$</option>
			    						<option value = "4" >$$$$</option>
			  						</select>
			  					</div>
		  				</div>
						
						<!-- Distance Textbox(If we use this) -->
						<div class="form-group">
							<input type="hidden" name="distance" class="WOH-spinSetup-distanceHiddenInput">
							<label class="control-label col-sm-2 WOH-spinSetup-distanceLabel" for="WOH-spinSetup-distanceInput">Distance</label>
								<div class="col-sm-10">
  									<input id="distanceSlider" class="WOH-spinSetup-distanceInput" data-slider-id='distanceSlider1' type="text" data-slider-min="1" data-slider-max="100" data-slider-step="1" data-slider-value="10"/>
		         				</div>
		         		</div>
		         					
		         		<!-- Food Type Dropdown -->
							<div class="form-group">
								<div class="col-sm-2">
			  						<label class="pull-right control-label" for="WOH-spinSetup-typeInput">Food Type</label>
			  					</div>
			  					<div class="col-sm-10">
			  						<select class="form-control WOH-spinSetup-typeInput" name="type">
			    						<option selected="selected" value = "1" >Fast Food</option>
			    						<option value = "2" >Sit-Down</option>
			    						<option value = "3" >Dessert</option>
			    						<option value = "4" >Bakery</option>
			    						<option value = "5" >Cafe</option>
			  						</select>
			  					</div>
		  					</div>
					</div>
					
					<div class = "col-sm-2">

					<!-- Cuisine Type Checkbox -->
				  		<div class="panel panel-default form-group WOH-spinSetup-cuisineCheckboxGroup"> 
				  			<div class="panel-heading">	
					  			<!-- Checkbox Search -->
								<div class="WOH-spinSetup-cuisineSearchInputGroup inner-addon left-addon">
									<i class="glyphicon glyphicon-search"></i>
	    							<input type="text" class="form-control WOH-spinSetup-cuisineSearch" name="cuisineSearch" placeholder="Search">
    							</div>
  							</div>
  							<div class="WOH-spinSetup-cuisineCheckboxPanelBody panel-body">
					  			<div class="WOH-spinSetup-cuisineCheckboxPanel">
									<input type="hidden" name="cuisines" class="WOH-spinSetup-cuisineInput">
									<div class="checkbox ">
										<label><input type="checkbox" value="american" class="WOH-spinSetup-checkbox">American</label>
									</div>
									<div class="checkbox">
										<label><input type="checkbox" value="chinese" class="WOH-spinSetup-checkbox">Chinese</label>
									</div>
									<div class="checkbox">
										<label><input type="checkbox" value="mexican" class="WOH-spinSetup-checkbox">Mexican</label>
									</div>
									<div class="checkbox">
										<label><input type="checkbox" value="indian" class="WOH-spinSetup-checkbox">Indian</label>
									</div>
									<div class="checkbox">
										<label><input type="checkbox" value="korean" class="WOH-spinSetup-checkbox">Korean</label>
									</div>
									<div class="checkbox">
										<label><input type="checkbox" value="pizza" class="WOH-spinSetup-checkbox">Pizza</label>
									</div>
									<div class="checkbox">
										<label><input type="checkbox" value="italian" class="WOH-spinSetup-checkbox">Italian</label>
									</div>
									<div class="checkbox">
										<label><input type="checkbox" value="italian" class="WOH-spinSetup-checkbox">Sandwiches</label>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Submit Button -->
		  					<button type="button" class="btn btn-default pull-right WOH-spinSetup-submitButton" onclick="formatData()">Submit</button>
					</div>
					
				</form>
			</div>
		</div>
	</div>

</body>

</html>