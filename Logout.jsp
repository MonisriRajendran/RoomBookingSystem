<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png"  href="images/logo.png">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hotel Residents</title>
</head>
<body>
<%
		Cookie[] cookies = null;

		// Get an array of Cookies associated with the this domain
		cookies = request.getCookies();
		String userName = null;
		cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("user"))
					cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		}	%>
<% request.getSession().removeAttribute("Role");
request.getSession().invalidate(); %>

<%@ include file="Header.jsp" %>
<div class="container">
<h1>Logout Successful!!! - Please login for new bookings</h1>
</body>
</html>