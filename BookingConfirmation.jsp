<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="Bean.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png" href="images/logo.png">
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
		if (userName == null) {
			request.setAttribute("sessionMsg", "Please Login to Continue!!!");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
	%>
	<form method="post" action="BookingConfirmationController">
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
				<td colspan="2"><input type="checkbox"
					name="termsandconditions" value="privacyPolicy" required> I
					have read and accepted the Terms & Conditions, Disclaimer and
					Privacy Policy</td>
			</tr>
			<tr>
				<td colspan="2"><input type="checkbox"
					name="termsandconditions" value="cancelPolicy" required> I
					have read and understood the Cancellation and Refund Policy</td>
			</tr>
			<tr>
				<td colspan="2"><input type="checkbox"
					name="termsandconditions" value="updateMail"> I would like
					to receive information from ITC Hotels about the new offers and
					updates about the ongoing food promotions and events.</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" name="room"
					value="Proceed to Pay" /></td>
			</tr>
			<tr>
				<td><%=(request.getAttribute("message") == null) ? "" : request.getAttribute("message")%></td>
			</tr>
		</table>
	</form>
</body>
</html>