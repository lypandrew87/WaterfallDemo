<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ include file="header.html"%>
<jsp:useBean id="customer" class= "amlyp.companyDB.User" scope="session"/> 
<%if(!customer.getLoggedIn()){response.sendRedirect("Login.jsp");
} %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
<script language="javascript" type="text/javascript" src="Script/jquery.js"></script>
<script language="javascript" type="text/javascript" src="Script/script.js"></script>

<link rel="stylesheet" type="text/css" href="CSS/style.css">

<header id = "header"></header>
<div class = "page-content">

<h1>Profile Information</h1>
<table class="infobox">
<tr>
	<form  method="post" action="Profile_action.jsp" >
	<td><b>Username: </b></td>
	<td><input  name="username" value="<%=customer.getUsername()%>" disabled></td>
</tr>

<tr>
	<td><b>First Name: </b></td>
	<td><input  name="firstName" value="<%=customer.getFirstName() %>" ></td>
</tr>

</td>

<tr>
	<td><b>Last Name: </b></td>
	<td><input  name="lastName" value="<%=customer.getLastName()%>" ></td>
</tr>

<td class = "hiddentext"  id = "last-change-hide">Enter Last Name:
<input  type="text"></input>
</td>


<tr>
	<td><b>Phone Number: </b></td>
	<td><input  name="phoneNumber" value="<%=customer.getPhoneNumber() %>" ></td>
</tr>
<td class = "hiddentext"  id = "phone-change-hide">Enter Phone Number:
<input  type="text"></input>
</td>
<tr>
	<td><b>Seller Rating: </b></td>
	<td><input name="sellerRating" value="<%=customer.getSellerRating()%>"disabled ></td>
</tr>
<tr>
	<td><b>Number of Seller Ratings: </b></td>
	<td><input name="numberOfSellerRatings" value="<%=customer.getNumberOfSellerRatings() %>" disabled></td>
</tr>
<tr>
	<td> <b>Old Password: </b></td>
	<td><input disabled type = "password" name="oldpassword" value="<%=customer.getPassword()%>" ></td>
</tr>
<tr>
	<td> <b>New Password: </b></td>
	<td><input type = "password" name="password" ></td>
</tr>
<tr>
	<td> <b>Retype Password: </b></td>
	<td><input type = "password" name="password2" ></td>
</tr>
</td>
</table>
<input  style = "color:blue ; width:150px; height: 50px; " type = "submit" value = "Update" ></input>
<input  style = "color:blue ; width:150px; height: 50px; " type = "reset" value = "Cancel" ></input>

</form>
</div>
</body>
</html>