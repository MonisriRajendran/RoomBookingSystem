<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="css/jquery.ui.datepicker.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>-->
<script type="text/javascript" language="javascript">
	$(function() {
		from = $("#from").datepicker({
			dateFormat : "mm/dd/yy",
			defaultDate : "+1d",
			minDate : 0,
			changeMonth : true,
			numberOfMonths : 1
		}).on("change", function() {
			var date2 = $('#from').datepicker('getDate');
			date2.setDate(date2.getDate() + 1);
			to.datepicker("option", "minDate", date2);
		}), to = $("#to").datepicker({
			dateFormat : "mm/dd/yy",
			defaultDate : "+1d",
			changeMonth : true,
			minDate : 0,
			numberOfMonths : 1
		}).on("change", function() {
			from.datepicker("option", "maxDate", getDate(this));
		});

		function getDate(element) {
			var date;
			try {
				date = $.datepicker.parseDate(dateFormat, element.value);
			} catch (error) {
				date = null;
			}

			return date;
		}
	});
</script>


<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : "mm/dd/yy",
			defaultDate : "+1d",
			minDate : 0,
			changeMonth : true,
			numberOfMonths : 1
		})
	});
</script>
</script>
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
	<form method="post" action="BookingsController">
		<table border="0" width="500" align="center">
			<tr>
				<td>Room Type</td>
				<td><select name="roomType">
						<%
							if (!(request.getAttribute("roomType") == null)
									&& request.getAttribute("roomType").equals("Deluxe Room Non-A/C")) {
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
							if (!(request.getAttribute("roomType") == null)
									&& request.getAttribute("roomType").equals("Deluxe Room A/C")) {
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
							if (!(request.getAttribute("roomType") == null)
									&& request.getAttribute("roomType").equals("Superior Room")) {
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
							if (!(request.getAttribute("roomType") == null)
									&& request.getAttribute("roomType").equals("Executive Suite")) {
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
							if (!(request.getAttribute("roomType") == null)
									&& request.getAttribute("roomType").equals("Family 3 Beded Room")) {
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
							if (!(request.getAttribute("roomType") == null)
									&& request.getAttribute("roomType").equals("Meeting Room")) {
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
							if (!(request.getAttribute("roomType") == null)
									&& request.getAttribute("roomType").equals("Conference Hall")) {
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
				<td>Checkin Date</td>
				<%
					if (request.getSession(false) != null && request.getSession(false).getAttribute("checkinDate") != null) {
				%>
				<td><input type="text" name="from" id="from"
					value=<%=(String) request.getSession().getAttribute("checkinDate")%>
					required></td>
				<%
					} else {
				%>
				<td><input type="text" name="from" id="from" required></td>
				<%
					}
				%>
			</tr>
			<tr>
				<td>Checkout Date</td>
				<%
					if (request.getSession(false) != null && request.getSession(false).getAttribute("checkoutDate") != null) {
				%>
				<td><input type="text" name="to" required id="to"
					value="<%=(String) request.getSession().getAttribute("checkoutDate")%>"></td>
				<%
					} else {
				%>
				<td><input type="text" name="to" id="to" required></td>
				<%
					}
				%>
			</tr>
			<tr>
				<td><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></td>
			</tr>
			<tr>
				<td><input name="room" type="submit" value="Search"></td>
				<td><input name="reset" type="reset" value="Reset"></td>
			</tr>
		</table>

		<table border="1" width="500" align="center">
			<tr>
				<th>Room No</th>
				<th>Room Type</th>
				<th>Description</th>
				<th>Location</th>
				<th>Price</th>
			</tr>

			<c:forEach var="room" items="${rooms}">
				<tr>
					<td>${room.roomNumber}</td>
					<td>${room.roomType}</td>
					<td>${room.description}</td>
					<td>${room.location}</td>
					<td>${room.price}</td>
					<td><input type="submit" name="room"
						id=${room.roomNumber
						} value=${room.roomNumber } /></td>
				</tr>
			</c:forEach>

			</tr>
		</table>
	</form>
</body>
</html>