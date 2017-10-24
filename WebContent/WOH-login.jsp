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

	
	<link rel="stylesheet" type="text/css" href="login/WOH-login.css">
	<link rel="stylesheet" type="text/css" href="site/WOH-site.css">

	<title>Log In</title>
</head>

<body>
<%@include file="banner/WOH-banner.jsp" %>
	
	<div class ="container-fluid">
		
		<div class="row-fluid">
			<div class="col-sm-10 col-sm-offset-3">
			<h1 class="WOH-login--Title">Log In</h1>
				<form action = "Login" method = "POST" class="form-horizontal WOH-login-form">
					<div class = "col-sm-6">
											
						<!-- User Name Textbox -->
							<div class="form-group">
							<label class="control-label col-sm-2" for="WOH-login-restaurantNameInput">Username</label>
								<div class="col-sm-10">
		         					<input type = "text" class="form-control WOH-login-UserNameInput" name = "username">
		         				</div>
		         			</div>
		         			
		         			<!-- Password Textbox -->
							<div class="form-group">
							<label class="control-label col-sm-2" for="WOH-login-restaurantNameInput">Password</label>
								<div class="col-sm-10">
		         					<input type = "text" class="form-control WOH-login-restaurantNameInput" name = "password">
		         				</div>
		         			</div>
	         			
						<!-- Submit Button -->
							
		  					<button type="button" class="btn btn-default pull-right WOH-login-submitButton" onclick="formatData()">Submit</button>
		  					<a type="button" class="btn btn-default pull-right WOH-login-forgotButton" href="/ForgotPassowrd">Forgot Password</a>
					</div>
					
				</form>
			</div>
		</div>
	</div>

</body>

</html>