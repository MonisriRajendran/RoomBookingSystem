<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png"  href="images/logo.png">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hotel Residents</title>
</head>
<body>
	<%@ include file="Header.jsp"%>
	<div class="container">
	<form name="login" method="post" action="LoginController" onsubmit=>
		<table>
			<tr>
				<td colspan="2"><%=(request.getAttribute("sessionMsg") == null) ? "" : request.getAttribute("sessionMsg")%></td>
			</tr>
			<tr>
				<td colspan="2"><%=(request.getAttribute("Message") == null) ? "" : request.getAttribute("Message")%></td>
			</tr>
			<tr>
				<td>User Name*</td>
				<td><input type="text" name="uname" placeholder="username" required></td>
			</tr>
			<tr>
				<td>Password*</td>
				<td><input type="password" name="password" placeholder="password" required></td>
			</tr>
			<tr>
				<td colspan="2"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></td>
			</tr>
			<tr>
			<td colspan="2">New Customers <a href="Signup.jsp">Click here</a> for Signup!!!</td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Login"></td>
			</tr>
		</table>
	</form>
	
</body>
</html>