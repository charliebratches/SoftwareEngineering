<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% 
if(session.getAttribute("forgotPasswordState") == null || Integer.parseInt(session.getAttribute("forgotPasswordState").toString()) != 3)
{
	RequestDispatcher rd;
	rd = request.getRequestDispatcher("/WOH-forgotPasswordUsername.jsp");
    rd.forward(request, response);
}
%>

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
	
	<script src="forgotPassword/forgotPasswordNewPassword.js"></script>

	<title>Forgot Password</title>
</head>

<body>
<%@include file="banner/WOH-bannerLoggedOut.jsp" %>
	
	<div class ="container-fluid">
		
		<div class="row-fluid">
			<div class="col-sm-10 col-sm-offset-2">
			<h1 class="WOH-forgotPassword--Title">Forgot Password</h1>
				<form action = "ForgotPasswordSetPassword" method = "POST" class="form-horizontal WOH-forgotPassword-form">
					<div class = "col-sm-8">
		         			
		         			<!-- Password Textbox -->
							<div class="form-group">
							<label class="control-label col-sm-3" for="WOH-forgotPassword-passwordInput">New Password</label>
								<div class="col-sm-9">
		         					<input type = "password" class="form-control WOH-forgotPassword-passwordInput" name = "password">
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