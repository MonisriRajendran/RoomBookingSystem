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
		if (userName == null) {
			request.setAttribute("Message", "Please Login to Continue!!!");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
	%>
	<%
		try {
			String username = request.getSession(false).getAttribute("Username").toString();
			HotelDAO hotelDAO = new HotelDAO();
			List<Rooms> viewRooms = hotelDAO.selectRooms();
			if (viewRooms.size() > 0)
				request.setAttribute("viewrooms", viewRooms);
			else
				request.setAttribute("Message", "There is no Data available!!!");
		} catch (Exception e) {
			e.printStackTrace();

			request.setAttribute("Message", "Failed to Add Room details. Please try again later !!!");

		}
	%>
	<table border="1" width="500" align="center">
		<tr>
			<td colspan="2" style="color: red;"><%=(request.getAttribute("Message") == null) ? "" : request.getAttribute("Message")%></td>
		</tr>
		<tr>
			<th>Room #</th>
			<th>Room Type</th>
			<th>Availability</th>
			<th>Price</th>
			<th>Description</th>
			<th>Location</th>
		</tr>
		<tr></tr>

		<c:forEach var="room" items="${viewrooms}" varStatus="status">
			<tr>
				<td>${room.roomNumber}</td>
				<td>${room.roomType}</td>
				<td>${room.state}</td>
				<td>${room.price}</td>
				<td>${room.description }</td>
				<td>${room.location }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>