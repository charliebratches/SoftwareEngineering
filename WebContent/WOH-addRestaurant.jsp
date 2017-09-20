<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="addRestaurant/WOH-addRestaurant.css">
	<link rel="stylesheet" type="text/css" href="site/WOH-site.css">
	
	<title>Wheel of Hunger - Add Restaurant</title>
</head>

<body>

	<nav class="navbar navbar-inverse">
  	<div class="container-fluid">
    	<div class="navbar-header">
      	<a class="navbar-brand" href="#">Wheel of Hunger</a>
    	</div>
    	<ul class="nav navbar-nav">
      	<li><a href="WOH-index.jsp">Home</a></li>
      	<li class="active"><a href="WOH-addRestaurant.jsp">Add</a></li>
      	<li><a href="WOH-spinSetup.jsp">Setup Spin</a></li>
    	</ul>
    	<ul class="nav navbar-nav navbar-right">
      	<li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      	<li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    	</ul>
  	</div>
	</nav>
	
	<div class ="container">
		<div class="row">
			<div class="col-sm-10 col-sm-offset-1">
				<form action = "" method = "POST" class="form-horizontal" id="">
										
					<!-- Restaurant Name Textbox -->
						<div class="form-group">
						<label class="control-label col-sm-2" for="item">Restaurant Name</label>
							<div class="col-sm-10">
	         					<input type = "text" class="form-control" name = "restaurantName">
	         				</div>
	         			</div>
	         			
					<!-- Average Price Textbox -->
						<div class="form-group">
						<label class="control-label col-sm-2" for="averagePrice">Price Per Meal</label>
							<div class="col-sm-10">
	         					<input type = "text" class="form-control" name = "averagePrice">
	         				</div>
	         			</div>
					
					<!-- Distance Textbox(If we use this) -->
						<div class="form-group">
						<label class="control-label col-sm-2" for="distance">Distance</label>
							<div class="col-sm-10">
	         					<input type = "text" class="form-control" name = "distance">
	         				</div>
	         			</div>
	         			
	         		<!-- Food Type Dropdown -->
						<div class="form-group">
	  					<label class="control-label col-sm-2" for="foodType">Select Food Type</label>
	  						<div class="col-sm-10">
	  							<select class="form-control" name="foodType">
	    							<option value = "Fast-Food" >Fast Food</option>
	    							<option value = "Sit-Down" >Sit-Down</option>
	    							<option value = "Drive-Through" >Drive-Through</option>
	  							</select>
	  						</div>
	  					</div>
	  					
	  					<!-- Cuisine Type Checkbox -->
	  					<div class="form-group"> 
	  						<div class="checkbox">
	  							<label><input type="checkbox" value="">American</label>
							</div>
							<div class="checkbox">
	  							<label><input type="checkbox" value="">Chinese</label>
							</div>
							<div class="checkbox">
	  							<label><input type="checkbox" value="">Mexican</label>
							</div>
						</div>
	  				
	  				<!-- Submit Button -->
	  				<input type = "submit" class="btn btn-default" value = "Add Restaurant" />
					
				</form>
			</div>
		</div>
	</div>


</body>

</html>