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
	<link rel="stylesheet" type="text/css" href="site/WOH-site.css">
	
	<title>Wheel of Hunger</title>
</head>

<body>
<% 
	if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) 
    { %>
		<%@include file="banner/WOH-bannerLoggedOut.jsp"%>
    <% }
	else
	{ %>
		<%@include file="banner/WOH-banner.jsp" %>
	<% }
%>
	

</body>
</html>