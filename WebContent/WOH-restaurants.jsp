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
	
	<link rel="stylesheet" type="text/css" href="restaurants/WOH-restaurants.css">
	<link rel="stylesheet" type="text/css" href="site/WOH-site.css">
	
	<title>Restaurants</title>
</head>

<body>
	<%@ page isELIgnored="false" %>
	<%@include file="banner/WOH-banner.html" %>
	<%@ page import ="java.util.ArrayList, wheelofhunger.models.RestaurantModel" %>

	<%
	ArrayList<RestaurantModel> restaurantList = (ArrayList<RestaurantModel>) request.getAttribute("restaurantList");
	%>
	
</body>
</html>