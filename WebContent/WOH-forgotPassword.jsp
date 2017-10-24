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

	
	<link rel="stylesheet" type="text/css" href="forgotPassword/WOH-forgotPassword.css">
	<link rel="stylesheet" type="text/css" href="site/WOH-site.css">

	<title>Forgot Password</title>
</head>

<body>
<%@include file="banner/WOH-banner.jsp" %>
	
	<div class ="container-fluid">
		
		<div class="row-fluid">
			<div class="col-sm-10 col-sm-offset-2">
			<h1 class="WOH-forgotPassword--Title">Forgot Password</h1>
				<form action = "forgotPassword" method = "POST" class="form-horizontal WOH-forgotPassword-form">
					<div class = "col-sm-8">
											
						<!-- User Name Textbox -->
							<div class="form-group">
							<label class="control-label col-sm-3" for="WOH-forgotPassword-usernameInput">Username</label>
								<div class="col-sm-9">
		         					<input type = "text" class="form-control WOH-forgotPassword-UsernameInput" name = "username">
		         				</div>
		         			</div>
		         			
		         			<!-- Password Textbox -->
							<div class="form-group">
							<label class="control-label col-sm-3" for="WOH-forgotPassword-passwordInput">New Password</label>
								<div class="col-sm-9">
		         					<input type = "text" class="form-control WOH-forgotPassword-passwordInput" name = "password">
		         				</div>
		         			</div>
		         			
		         			<!-- Security Question 1 Dropdown -->
							<div class="form-group">
									<div class="col-sm-3">
				  						<label class="pull-right control-label" for="WOH-forgotPassword-secQuestion1Dropdown">Question 1</label>
				  					</div>
				  					<div class="col-sm-9">
				  						<select class="form-control WOH-forgotPassword-secQuestion1Dropdown" name="secQuestion1">
				    						<option selected="selected" value = "0" >-- Select a Question --</option>
				    						<option value = "1" >What is your mother's maiden name?</option>
				    						<option value = "2" >What is the name of your favorite pet?</option>
				    						<option value = "3" >What is the last name of your favorite teacher?</option>
				    						<option value = "4" >What is the name of your favorite family member?</option>
				  						</select>
				  					</div>
			  				</div>
		         			
		         			<!-- Security Question 1 Textbox -->
							<div class="form-group">
							<label class="control-label col-sm-3" for="WOH-forgotPassword-secQuestion1Input">Answer</label>
								<div class="col-sm-9">
		         					<input type = "text" class="form-control WOH-forgotPassword-secQuestion1Input" name = "secQuestion1Answer">
		         				</div>
		         			</div>
		         			
		         			<!-- Security Question 2 Dropdown -->
							<div class="form-group">
									<div class="col-sm-3">
				  						<label class="pull-right control-label" for="WOH-forgotPassword-secQuestion2Dropdown">Question 2</label>
				  					</div>
				  					<div class="col-sm-9">
				  						<select class="form-control WOH-forgotPassword-secQuestion2Dropdown" name="secQuestion2">
				    						<option selected="selected" value = "0" >-- Select a Question --</option>
				    						<option value = "1" >What is your mother's maiden name?</option>
				    						<option value = "2" >What is the name of your favorite pet?</option>
				    						<option value = "3" >What is the last name of your favorite teacher?</option>
				    						<option value = "4" >What is the name of your favorite family member?</option>
				  						</select>
				  					</div>
			  				</div>
		         			
		         			<!-- Security Question 2 Textbox -->
							<div class="form-group">
							<label class="control-label col-sm-3" for="WOH-forgotPassword-secQuestion2Input">Answer</label>
								<div class="col-sm-9">
		         					<input type = "text" class="form-control WOH-forgotPassword-secQuestion2Input" name = "secQuestionAnswer2">
		         				</div>
		         			</div>
		         			
		         			<!-- Security Question 3 Dropdown -->
							<div class="form-group">
									<div class="col-sm-3">
				  						<label class="pull-right control-label" for="WOH-forgotPassword-secQuestion3Dropdown">Question 3</label>
				  					</div>
				  					<div class="col-sm-9">
				  						<select class="form-control WOH-forgotPassword-secQuestion3Dropdown" name="secQuestion3">
				    						<option selected="selected" value = "0" >-- Select a Question --</option>
				    						<option value = "1" >What is your mother's maiden name?</option>
				    						<option value = "2" >What is the name of your favorite pet?</option>
				    						<option value = "3" >What is the last name of your favorite teacher?</option>
				    						<option value = "4" >What is the name of your favorite family member?</option>
				  						</select>
				  					</div>
			  				</div>
		         			
		         			<!-- Security Question 3 Textbox -->
							<div class="form-group">
							<label class="control-label col-sm-3" for="WOH-forgotPassword-secQuestion3Input">Answer</label>
								<div class="col-sm-9">
		         					<input type = "text" class="form-control WOH-forgotPassword-secQuestion3Input" name = "secQuestionAnswer3">
		         				</div>
		         			</div>
	         			
						<!-- Submit Button -->
							
		  					<button type="button" class="btn btn-default pull-right WOH-forgotPassword-submitButton" onclick="formatData()">Submit</button>
					</div>
					
				</form>
			</div>
		</div>
	</div>

</body>

</html>