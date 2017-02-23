<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ include file="header.html"%>
<jsp:useBean id="item" class= "amlyp.companyDB.Items" scope="session"/> 
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

<header id = "header">
</header>
<div class = "page-content">

<h1>
Search Result
</h1>
<table class="infobox">
<tr>

<td>Item ID:</td>

<td>Item Name:</td>

<td>Category:</td>

<td>Auction Start Time:</td>

<td>Auction End Time:</td>

<td>Current Bid:</td>
<td></td>
<td></td>
<td></td>

</tr>
<tr>
<td>While loop listing search results.. getting the searched items from items.java method</td>
</tr>
</table>
</form>
</div>
</body>
</html>
