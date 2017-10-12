<!doctype html>
<html>

<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="Wheel/WOH-Wheel.css">
<link rel="stylesheet" href="site/WOH-site.css">
<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
</head>
<body>
	<%@include file="banner/WOH-banner.jsp" %>	
	<div class="container WOH-Wheel--WheelContainer">
		<div class="row">
			<div class="text-center">
				<canvas id="canvas" width="550" height="550"></canvas>
				<script src="Wheel/WOH-Wheel.js"></script>
			</div>
		</div>
		<div class="row">
			<div class="WOH-Wheel--ButtonPanel text-center">
				<button type="button" value="spin"  onClick="spin()" class="btn btn-default">Spin</button>
				<button type="button" value="colorToggle" onclick="colorToggle()" class="btn btn-default">Color Toggle</button>
			</div>
		</div>
	 </div>
</body>
</html>
