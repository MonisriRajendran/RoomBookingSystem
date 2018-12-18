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
	<%@ include file="Header.jsp"%>
	<form method="post" action="AddRoomsController">
		<div class="table">
			<table border="0" width="500" align="center">

				<tr>
					<td colspan="2"><%=(request.getAttribute("Message") == null) ? "" : request.getAttribute("Message")%></td>
				</tr>
				<tr>
					<td colspan="2" style="color: red;"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></td>
				</tr>
				<tr>
					<td>Room #</td>
					<td><input type="text" name="roomNumber"></td>
				</tr>
				<tr>
					<td>Room Type</td>
					<td><select name="roomType">
							<option value="Deluxe Room Non-A/C">Deluxe Room Non-A/C</option>
							<option value="Deluxe Room A/C">Deluxe Room A/C</option>
							<option value="Superior Room">Superior Room</option>
							<option value="Executive Suite">Executive Suite</option>
							<option value="Family 3 Beded Room">Family 3 Beded Room</option>
							<option value="Meeting Room">Meeting Room</option>
							<option value="Conference Hall">Conference Hall</option>
					</select></td>
				</tr>
				<tr>
					<td>Description</td>
					<td><input type="text" name="description"></td>
				</tr>
				<tr>
					<td>Location</td>
					<td><input type="text" name="location"></td>
				</tr>
				<tr>
					<td>Room Status</td>
					<td><select name="roomStatus">
							<option value="Available">Available</option>
							<option value="Under Maintenance">Under Maintenance</option>
					</select></td>
				</tr>
				<tr>
					<td>Price</td>
					<td><input type="text" name="price"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Add Room"></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>