<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ include file="header.html"%>
<jsp:useBean id="item" class= "amlyp.companyDB.Items" scope="session"/> 
<jsp:useBean id="customer" class= "amlyp.companyDB.User" scope="session"/> 

<%if(!customer.getLoggedIn()){    response.sendRedirect("Login.jsp");
} %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
<script language="javascript" type="text/javascript" src="Script/jquery.js"></script>
<script language="javascript" type="text/javascript" src="Script/script.js"></script>

<link rel="stylesheet" type="text/css" href="CSS/style.css">

<header id = "header">
</header>
<div class = "page-content">

<h1>
Item Search
</h1>
<table class="infobox">
<tr>


 <form  method="post" action="advancedSearch_Action.jsp" >

<td>Item ID:</td>
<td><input  name="itemId"></td>

</tr>
<tr>
<td>Keyword:</td>

<td><input  name="KEYWORD"></td>


</tr>
	
</td>

<tr>
<td>Category:</td>
<td><input  name="category"></td>


</tr>

<tr>
<td>Current Bid Range:</td>
<td><input  name="CURRENT_BID_LOWER"> </td>  <td><= X <= </td> <td><input  name="CURRENT_BID_UPPER"></td>



</tr>

<tr>
<td>Auction Time Period:</td>
<td> From<input  name="AUCTION_TIME_LOWER" to input  name="AUCTION_TIME_LOWER"></td>

<td>To <input  name="AUCTION_TIME_UPPER" to input  name="AUCTION_TIME_UPPER"></td>

</tr>
</table>
<input  style = "color:blue ; width:150px; height: 50px; " type = "submit" value = "Search" ></input><input  style = "color:blue ; width:150px; height: 50px; " type = "reset" value = "Cancel" ></input>

</form>
</div>
</body>
</html>
