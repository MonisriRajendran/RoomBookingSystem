<%@page import="Bean.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png" href="images/logo.png">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hotel Residents</title>
</head>
<body>
	<%@ page import="DAO.HotelDAO, Bean.Rooms, java.util.*"%>
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
	<form method="post" action="PaymentsController">
		<div style="display: inline; float: left;">
			<h3>Stay Details</h3>
			<table border="0" width="500" align="center">
				<col width="200">
				<tr>
					<td>Username</td>
					<td><%=(String) request.getSession().getAttribute("Username")%></td>
				</tr>
				<tr>
					<td>Checkin Date</td>
					<td><%=(String) request.getSession().getAttribute("checkinDate")%></td>
				</tr>
				<tr>
					<td>Checkout Date</td>
					<td><%=(String) request.getSession().getAttribute("checkoutDate")%></td>
				</tr>
				<tr>
					<td>Room Number</td>
					<td><%=((Rooms) request.getSession().getAttribute("selectedRoom")).getRoomNumber()%></td>
				<tr>
					<td>Room Type</td>
					<td><%=((Rooms) request.getSession().getAttribute("selectedRoom")).getRoomType()%></td>
				<tr>
					<td>Price</td>
					<td><%=((Rooms) request.getSession().getAttribute("selectedRoom")).getPrice()%></td>
				<tr>
					<td>No of Days Stay</td>
					<td><%=((Rooms) request.getSession().getAttribute("selectedRoom")).getNoofdays()%></td>
				<tr>
					<td>Total taxes (18%)</td>
					<td><%=((Rooms) request.getSession().getAttribute("selectedRoom")).getTaxAmount()%></td>
				<tr>
					<td>Total amount to be paid</td>
					<td><%=((Rooms) request.getSession().getAttribute("selectedRoom")).getAmounttobePaid()%></td>
				</tr>
				<tr>
			</table>
		</div>
		<div style="display: inline; float: left;">
			<h3>Payment Details</h3>
			<table>
				<td>Credit card No</td>
				<td><input type="text" name="creditcardno" required></td>
				</tr>
				<tr>
					<td>Expiry Date</td>
					<td><input type="text" name="expirydate" required></td>
				</tr>
				<tr>
					<td>CVV</td>
					<td><input type="text" name="cvv" required></td>
				</tr>

				<tr>
					<td><%=(request.getAttribute("message") == null) ? "" : request.getAttribute("message")%></td>
				</tr>

				<tr>
					<td><input type="submit" name="booking"
						value="Confirm booking" /></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>