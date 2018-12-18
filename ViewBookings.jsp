<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png" href="images/logo.png">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hotel Residents</title>
</head>
<body>
	<%@ page import="DAO.HotelDAO, Bean.*, java.util.*"%>
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
	<%
		String username= request.getSession(false).getAttribute("Username").toString();
		HotelDAO hotelDAO = new HotelDAO();
		List<Booking> bookings = null;
		if (request.getSession(false) != null && request.getSession(false).getAttribute("Role") != null
				&& request.getSession(false).getAttribute("Role").equals("Admin")) {
			bookings = hotelDAO.selectBookings("");
		}else{
		bookings = hotelDAO.selectBookings(username);
		
		}
		request.setAttribute("bookings", bookings);
	%>
	<table border="1" width="500" align="center">
		<tr>
			<th>Booking ID</th>
			<th>Username</th>
			<th>Room Number</th>
			<th>Booking Date</th>
			<th>Checkin Date</th>
			<th>Checkout Date</th>
		</tr>

		<c:forEach var="booking" items="${bookings}" varStatus="status">
			<tr>
				<td>${booking.bookingid}</td>
				<td>${booking.username}</td>
				<td>${booking.roomNumber}</td>
				<td>${booking.bookingDate}</td>
				<td>${booking.checkinDate }</td>
				<td>${booking.checkoutDate }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>