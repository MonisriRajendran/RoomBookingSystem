<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png" href="images/logo.png">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hotel Residents</title>
<style>
body, html {
	height: 100%;
	margin: 0;
}

.bg {
	background-image: url("images/room/hotel.jpg");
	height: 100%;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<%@ include file="Header.jsp"%>

	<h2><%=(request.getAttribute("SuccessMessage") == null) ? "" : request.getAttribute("SuccessMessage")%></h2>

	<h1>Welcome to Hotel Residents</h1>
	<div class="bg"></div>
</body>
</html>