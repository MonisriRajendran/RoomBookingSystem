<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
			request.setAttribute("sessionMsg", "Please Login to Continue!!!");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
	%>
	<%
		String username = request.getSession(false).getAttribute("Username").toString();
		HotelDAO hotelDAO = new HotelDAO();
		List<Rooms> viewRooms = hotelDAO.selectRooms();
		request.setAttribute("viewrooms", viewRooms);
		request.getSession().setAttribute("viewrooms", viewRooms);
	%>
	<form method="post" action="EditRoomsController">

		<table border="0" width="500" align="center">
			<tr>
				<td colspan="2"><%=(request.getAttribute("Message") == null) ? "" : request.getAttribute("Message")%></td>
			</tr>
			<tr>
				<td colspan="2" style="color: red;"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></td>
			</tr>
			<tr>
				<td>Room #</td>
				<td><select name="roomno" style="max-width: 70%;">
						<c:forEach var="room" items="${viewrooms}">
							<%
								int roomNo = (request.getAttribute("editRoom") == null) ? 0
											: ((Rooms) request.getAttribute("editRoom")).getRoomNumber();
							%>
							<c:choose>
								<c:when test="${roomNo.equals(room.roomNumber)}">
									<option value="${room.roomNumber}" selected="selected">${room.roomNumber}</option>
								</c:when>
								<c:otherwise>
									<option value="${room.roomNumber}">${room.roomNumber}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
				</select> <input type="submit" Value="Edit" name="edit"></td>

			</tr>
			<tr>
				<td>Room Type</td>
				<td><select name="roomType">
						<%
							if (!(request.getAttribute("editRoom") == null)
									&& ((Rooms) request.getAttribute("editRoom")).getRoomType().equals("Deluxe Room Non-A/C")) {
						%>
						<option value="Deluxe Room Non-A/C" selected="selected">Deluxe
							Room Non-A/C</option>
						<%
							} else {
						%>
						<option value="Deluxe Room Non-A/C">Deluxe Room Non-A/C</option>
						<%
							}
						%>
						<%
							if (!(request.getAttribute("editRoom") == null)
									&& ((Rooms) request.getAttribute("editRoom")).getRoomType().equals("Deluxe Room A/C")) {
						%>
						<option value="Deluxe Room A/C" selected="selected">Deluxe
							Room A/C</option>
						<%
							} else {
						%>
						<option value="Deluxe Room A/C">Deluxe Room A/C</option>
						<%
							}
						%>
						<%
							if (!(request.getAttribute("editRoom") == null)
									&& ((Rooms) request.getAttribute("editRoom")).getRoomType().equals("Superior Room")) {
						%>
						<option value="Superior Room" selected="selected">Superior
							Room</option>
						<%
							} else {
						%>
						<option value="Superior Room">Superior Room</option>
						<%
							}
						%>
						<%
							if (!(request.getAttribute("editRoom") == null)
									&& ((Rooms) request.getAttribute("editRoom")).getRoomType().equals("Executive Suite")) {
						%>
						<option value="Executive Suite" selected="selected">Executive
							Suite</option>
						<%
							} else {
						%>
						<option value="Executive Suite">Executive Suite</option>
						<%
							}
						%>
						<%
							if (!(request.getAttribute("editRoom") == null)
									&& ((Rooms) request.getAttribute("editRoom")).getRoomType().equals("Family 3 Beded Room")) {
						%>
						<option value="Family 3 Beded Room" selected="selected">Family
							3 Beded Room</option>
						<%
							} else {
						%>
						<option value="Family 3 Beded Room">Family 3 Beded Room</option>
						<%
							}
						%>
						<%
							if (!(request.getAttribute("editRoom") == null)
									&& ((Rooms) request.getAttribute("editRoom")).getRoomType().equals("Meeting Room")) {
						%>
						<option value="Meeting Room" selected="selected">Meeting
							Room</option>
						<%
							} else {
						%>
						<option value="Meeting Room">Meeting Room</option>
						<%
							}
						%>
						<%
							if (!(request.getAttribute("editRoom") == null)
									&& ((Rooms) request.getAttribute("editRoom")).getRoomType().equals("Conference Hall")) {
						%>
						<option value="Conference Hall" selected="selected">Conference
							Hall</option>
						<%
							} else {
						%>
						<option value="Conference Hall">Conference Hall</option>
						<%
							}
						%>
				</select></td>
			</tr>
			<tr>
				<td>Description</td>

				<td><input type="text" name="description"
					value="<%=(request.getAttribute("editRoom") == null) ? ""
					: ((Rooms) request.getAttribute("editRoom")).getDescription()%>"></td>
			</tr>
			<tr>
				<td>Location</td>
				<td><input type="text" name="location"
					value="<%=(request.getAttribute("editRoom") == null) ? ""
					: ((Rooms) request.getAttribute("editRoom")).getLocation()%>"></td>
			</tr>
			<tr>
				<td>Room Status</td>
				<td><select name="roomStatus">
						<%
							if (!(request.getAttribute("editRoom") == null)
									&& ((Rooms) request.getAttribute("editRoom")).getState().equals("Available")) {
						%>
						<option value="Available" selected="selected">Available</option>
						<%
							} else {
						%>
						<option value="Available">Available</option>
						<%
							}
						%>
						<%
							if (!(request.getAttribute("editRoom") == null)
									&& ((Rooms) request.getAttribute("editRoom")).getState().equals("Under Maintenance")) {
						%>
						<option value="Under Maintenance" selected="selected">Under
							Maintenance</option>
						<%
							} else {
						%>
						<option value="Under Maintenance">Under Maintenance</option>
				</select></td>
				<%
					}
				%>
			</tr>
			<tr>
				<td>Price</td>
				<td><input type="text" name="price"
					value=<%=(request.getAttribute("editRoom") == null) ? ""
					: ((Rooms) request.getAttribute("editRoom")).getPrice()%>></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Update" name="edit"></td>
			</tr>
		</table>
	</form>
</body>
</html>