<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hotel Residents</title>
</head>
<body>
	<%@ include file="Header.jsp"%>
	<%
		Cookie[] cookies = null;

		// Get an array of Cookies associated with the this domain
		cookies = request.getCookies();
		String userName = null;
		cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("user"))
					userName = cookie.getValue();
			}
		}
		if (userName == null){
			request.setAttribute("sessionMsg", "Please Login to Continue!!!");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
	%>
	
	<h2><%=(request.getAttribute("SuccessMessage") == null) ? "" : request.getAttribute("SuccessMessage")%></h2>

	<h1>Welcome to Hotel Residents</h1>
	<div class="bg"></div>
</body>
</html>