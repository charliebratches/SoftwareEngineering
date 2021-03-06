<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
    
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) 
    {
    	response.sendRedirect("WOH-login.jsp");
    }
    else
    {
    }
%>
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
	
	<link rel="stylesheet" type="text/css" href="site/WOH-site.css">
	
	<script src="banner/banner.js"></script>	
	
	<title>Wheel of Hunger</title>
</head>

<body>
	

	<nav class="navbar navbar-default">
  	<div class="container-fluid">
    	<div class="navbar-header">
      	<a class="navbar-brand" href="WOH-index.jsp">Wheel of Hunger</a>
    	</div>
    	<ul class="nav navbar-nav">
      	<li><a href="WOH-index.jsp">Home</a></li>
      	<li><a href="WOH-addRestaurant.jsp">Add</a></li>
      	<li><a href="DisplayAll">Restaurants</a></li>
      	<li><a href="WOH-spinSetup.jsp">Setup Spin</a></li>
    	</ul>
    	<form action = "Logout" method = "POST" class="WOH-logout-form">
    	<ul class="nav navbar-nav navbar-right">
      	<li><a href="#" onclick="logoutFormSubmit();return false;" ><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
    	</ul>
    	</form>
  	</div>
	</nav>
</body>
</html>