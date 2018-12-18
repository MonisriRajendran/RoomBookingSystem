<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png" href="images/logo.png">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hotel Residents</title>
</head>
<body>
	<%@ include file="Header.jsp"%>
	<form method="post" action="SignupController">
		<table border="0" width="500" align="center">
			<tr>
				<td colspan="2"><%=(request.getAttribute("Message") == null) ? "" : request.getAttribute("Message")%></td>
			</tr>
			<tr>
				<td colspan="2" style="color: red"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></td>
			</tr>
			<tr>
				<td>User Name*</td>
				<td><input type="text" name="uname" placeholder="username"
					required></td>
			</tr>
			<tr>
				<td>Password*</td>
				<td><input type="password" name="password"
					placeholder="password" required></td>
			</tr>
			<tr>
				<td>Confirm Password*</td>
				<td><input type="password" name="confirmpassword"
					placeholder="confirm password" required></td>
			</tr>
			<tr>
				<td>Phone Number*</td>
				<td><input type="text" name="phoneNumber" required></td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><input type="text" name="firstName"></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="lastName"></td>
			</tr>
			<tr>
				<td>Address Line1</td>
				<td><input type="text" name="addressLine1"></td>
			</tr>
			<tr>
				<td>Address Line2</td>
				<td><input type="text" name="addressLine2"></td>
			</tr>
			<tr>
				<td>City</td>
				<td><input type="text" name="state"></td>
			</tr>
			<tr>
				<td>Country</td>
				<td><input type="text" name="country"></td>
			</tr>
			<tr>
				<td>Postal Code</td>
				<td><input type="text" name="postalCode"></td>
			</tr>
			<%
				if (request.getSession(false).getAttribute("Role") == null) {
			%>
			<tr>
				<td><input type="hidden" name="role" value="Customer"></td>
			</tr>
			<%
				} else {
			%>
			<tr>

				<td>Role*</td>
				<td><select name="role">
						<option value="Admin">Admin</option>
						<option value="Customer">Customer</option>
				</select>
			</tr>

			<%
				}
			%>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="Register/Signup"></td>
			</tr>
		</table>
	</form>
</body>
</html>