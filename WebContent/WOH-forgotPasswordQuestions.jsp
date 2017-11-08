<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% 
if(session.getAttribute("forgotPasswordState") == null || Integer.parseInt(session.getAttribute("forgotPasswordState").toString()) != 2)
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
	
	<script src="forgotPassword/forgotPasswordQuestions.js"></script>

	<title>Forgot Password</title>
</head>

<body>
<%@include file="banner/WOH-bannerLoggedOut.jsp" %>
	
	<div class ="container-fluid">
		
		<div class="row-fluid">
			<div class="col-sm-10 col-sm-offset-2">
			<h1 class="WOH-forgotPasswordQuestions--Title">Forgot Password</h1>
				<form action = "ForgotPasswordCheckQuestions" method = "POST" class="form-horizontal WOH-forgotPassword-form">
					<div class = "col-sm-8">
											
		         			
		         			<!-- Security Question 1 Dropdown -->
							<div class="form-group">
									<input type="hidden" name="secQuestion1Hidden" class="WOH-forgotPassword-secQuestion1HiddenInput" value ="${user.getSecQuestion1()}">
									<div class="col-sm-3">
				  						<label class="pull-right control-label" for="WOH-forgotPassword-secQuestion1Dropdown">Question 1</label>
				  					</div>
				  					<div class="col-sm-9">
				  						<select disabled class="form-control WOH-forgotPasswordQuestions-secQuestion1Dropdown" id ="secQuestion1" name="secQuestion1">
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
							
							<label class="control-label col-sm-3" for="WOH-forgotPasswordQuestions-secQuestion1Input">Answer</label>
								<div class="col-sm-9">
		         					<input type = "text" class="form-control WOH-forgotPasswordQuestions-secQuestion1Input"  name = "secQuestionAnswer1">
		         				</div>
		         			</div>
		         			
		         			<!-- Security Question 2 Dropdown -->
							<div class="form-group">
									<input type="hidden" name="secQuestion2Hidden" class="WOH-forgotPassword-secQuestion2HiddenInput" value ="${user.getSecQuestion2()}">
									<div class="col-sm-3">
				  						<label class="pull-right control-label" for="WOH-forgotPasswordQuestions-secQuestion2Dropdown">Question 2</label>
				  					</div>
				  					<div class="col-sm-9">
				  						<select disabled class="form-control WOH-forgotPasswordQuestions-secQuestion2Dropdown" id ="secQuestion2" name="secQuestion2">
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
							<label class="control-label col-sm-3" for="WOH-forgotPasswordQuestions-secQuestion2Input">Answer</label>
								<div class="col-sm-9">
		         					<input type = "text" class="form-control WOH-forgotPasswordQuestions-secQuestion2Input" name = "secQuestionAnswer2">
		         				</div>
		         			</div>
		         			
		         			<!-- Security Question 3 Dropdown -->
							<div class="form-group">
									<input type="hidden" name="secQuestion3Hidden" class="WOH-forgotPassword-secQuestion3HiddenInput" value ="${user.getSecQuestion3()}">
									<div class="col-sm-3">
				  						<label class="pull-right control-label" for="WOH-forgotPasswordQuestions-secQuestion3Dropdown">Question 3</label>
				  					</div>
				  					<div class="col-sm-9">
				  						<select disabled class="form-control WOH-forgotPasswordQuestions-secQuestion3Dropdown" id ="secQuestion3" name="secQuestion3">
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
							<label class="control-label col-sm-3" for="WOH-forgotPasswordQuestions-secQuestion3Input">Answer</label>
								<div class="col-sm-9">
		         					<input type = "text" class="form-control WOH-forgotPasswordQuestions-secQuestion3Input" name = "secQuestionAnswer3">
		         				</div>
		         			</div>
		         	
	         			
						<!-- Submit Button -->
							
		  					<button type="button" class="btn btn-default pull-right WOH-forgotPasswordQuestions-submitButton" onclick="formatData()">Submit</button>
					</div>
					
				</form>
			</div>
		</div>
	</div>

</body>

</html>