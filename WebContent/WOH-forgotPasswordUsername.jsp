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
	
	<script src="forgotPassword/forgotPasswordUsername.js"></script>

	<title>Forgot Password</title>
</head>

<body>
<%@include file="banner/WOH-bannerLoggedOut.jsp" %>
	
	<div class ="container-fluid">
	
	<input type="hidden" name="error" class="WOH-forgotPasswordUsername-errorHiddenInput" value="${errorMessage}">
		
		<div class="row-fluid">
			<div class="col-sm-10 col-sm-offset-2">
			<h1 class="WOH-forgotPasswordUsername--Title">Forgot Password</h1>
				<form action = "ForgotPasswordGetQuestions" method = "POST" class="form-horizontal WOH-forgotPasswordUsername-form">
					<div class = "col-sm-8">
											
						<!-- User Name Textbox -->
							<div class="form-group">
							<label class="control-label col-sm-3" for="WOH-forgotPasswordUsername-usernameInput">Username</label>
								<div class="col-sm-9">
		         					<input type = "text" class="form-control WOH-forgotPasswordUsername-UsernameInput" name = "username">
		         				</div>
		         			</div>
	         			
						<!-- Submit Button -->
							
		  					<button type="button" class="btn btn-default pull-right WOH-forgotPasswordUsername-submitButton" onclick="formatData()">Submit</button>
					</div>
					
				</form>
			</div>
		</div>
	</div>

</body>

</html>