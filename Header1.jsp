<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="CSS/StyleSheet.css" type="text/css"></link>
<title>Hotel Hwain</title>
</head>
<body>
	<div class="header" style="margin-top: 10px;">
		<div style="display: inline;">
			<div style="display: inline;margin-left: 20px;">
				<img src="images/logo.png" width="80" height="80">
			</div>
			<div class="hotel-name"
				style="display: inline; font-size: 50px; margin-left: 20px; color: #b18223;">Hotel
				Residents</div>
		</div>
		<div class="contact" style="float: right;display: inline;margin-top: 50px;margin-right: 10px;">
			<div class="phone-ico">
				<img src="images/phone.png" width="20" height="20">
			</div>
			<div class="contactno" style="display: inline;">+91 98765 65432</div>
		</div>
	</div>
	<div class="container">

		<ul>

			<li><a href="Homepage.jsp">Home</a></li>
			
			<li><a href="AddRooms.jsp">Rooms</a>
				<ul>
					<%
						if (request.getSession(false) != null && request.getSession(false).getAttribute("Role") != null
								&& request.getSession(false).getAttribute("Role").equals("Admin")) {
					%>
					<li><a href="AddRooms.jsp">Add a Room</a></li>
					<li><a href="EditRooms.jsp">Edit Room</a></li>
					<li><a href="ViewRooms.jsp">View a Room</a></li>
					<%
						}
					%>
					<li><a href="RoomBookings.jsp">Book a Room</a></li>
				</ul></li>
			<li><a href="Signup.jsp">Facilities</a></li>
			<%
				if (request.getSession(false) != null && request.getSession(false).getAttribute("Role") != null){%>
				<li><a href="Payments.jsp">Payments</a></li>
				<%} %>
				<%
				if (request.getSession(false) != null && request.getSession(false).getAttribute("Role") != null){%>
			<li><a href="Logout.jsp">Logout</a></li>
			<%}else{ %>
			<li><a href="Login.jsp">Login</a></li>
			<%} %>
			<li><a href="Signup.jsp">Contacts</a></li>
			
		</ul>
	</div>
	<div>
	
		
	</div>
	<br />
	<br />
</body>
</html>