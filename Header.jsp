<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png" href="/WebContent/images/logo.png">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="CSS/Stylesheet1.css" type="text/css"></link>
<title>Hotel Residents</title>
</head>
<body>
	<div class="header" style="margin-top: 10px;">
		<div style="display: inline;">
			<div style="display: inline; margin-left: 20px;">
				<img src="images/logo.png" width="80" height="80">
			</div>
			<div class="hotel-name"
				style="display: inline; font-size: 50px; margin-left: 20px; color: #b18223;">Hotel
				Residents</div>
		</div>
		<div class="contact"
			style="float: right; display: inline; margin-top: 50px; margin-right: 10px;">
			<div class="phone-ico">
				<img src="images/phone.png" width="20" height="20">
			</div>
			<div class="contactno" style="display: inline;">+91 98765 65432</div>
		</div>
	</div>
	<div class="container">

		<ul>

			<li><a href="Homepage.jsp">Home</a></li>
			<% if(request.getSession(false) == null ||
			request.getSession(false).getAttribute("Role") == null){%>
			<li class="dropdown"><a>Login</a>
				<div class=dropdown-content>

					<a href="Login.jsp">Login</a> <a href="Signup.jsp">Register/SignUp</a>


				</div></li>
			<%}else if(request.getSession(false).getAttribute("Role").equals("Admin")) {%>
			<li><a href="Signup.jsp">AdminRoles</a></li>
			<%} %>
			<li class="dropdown"><a>Rooms</a>
				<div class=dropdown-content>


					<%
					if (request.getSession(false) != null && request.getSession(false).getAttribute("Role") != null
								&& request.getSession(false).getAttribute("Role").equals("Admin")) {
					%>
					<a href="AddRooms.jsp">Add a Room</a> <a href="EditRoom.jsp">Edit
						Room</a> <a href="ViewRooms.jsp">View a Room</a> <a href="Booking.jsp">Book
						a Room</a> <a href="ImageRoom.jsp">Room Images</a>
					<%
					}else if(request.getSession(false) != null && request.getSession(false).getAttribute("Role") != null
								&& request.getSession(false).getAttribute("Role").equals("Customer")){
					%>
					<a href="Booking.jsp">Book a Room</a> <a href="ImageRoom.jsp">Room
						Images</a>
					<%
					}else{
					%>
					<a href="ImageRoom.jsp">Room Images</a>
					<%
					}
					%>

				</div></li>
			<li class="dropdown"><a>Facilities</a>
				<div class=dropdown-content>

					<a href="NearBy.jsp">Near By Places</a> <a href="Gymnasium.jsp">Gymnasium</a>


				</div></li>
			<%
				if (request.getSession(false) != null && request.getSession(false).getAttribute("Role") != null){%>
			<li class="dropdown"><a>Bookings</a>
				<div class=dropdown-content>

					<a href="ViewBookings.jsp">View Bookings</a> <a
						href="CancelBooking.jsp">Cancel Booking</a>

				</div></li>

			<%} %>


			<%
				if (request.getSession(false) != null && request.getSession(false).getAttribute("Role") != null){%>
			<li><a href="Logout.jsp">Logout</a></li>
			<%}%>

			<li class="dropdown"><a>Help</a>
				<div class=dropdown-content>

					<a href="Contact.jsp">Contact</a> <a href="Feedback.jsp">Feedback</a>

				</div></li>

		</ul>
	</div>
	<div></div>

</body>
</html>