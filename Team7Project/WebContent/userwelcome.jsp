<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.html" %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
<script language="javascript" type="text/javascript" src="Script/jquery.js"></script>
<script language="javascript" type="text/javascript" src="Script/script-admin.js"></script>
<jsp:useBean id="customer" class= "amlyp.companyDB.User" scope="session"/> 
<%if(!customer.getLoggedIn()){response.sendRedirect("Login.jsp");
} %>

<link rel="stylesheet" type="text/css" href="CSS/style.css">

<header id = "header">
</header>

<div class = "page-content">

<h1 >
Welcome, <%=customer.getUsername() %>
</h1>
<form action = "Profile.jsp"><input style = "color: blue; " type = "submit" name = "updateProfile" value = "Update Profile"></input></form>
<form action = "SellingManagement.jsp"><input style = "color: blue;"type = "submit" name = "sellingmanagement" value = "Selling Management"></form>
<form action = "BiddingManagement.jsp"><input style = "color: blue;"  type = "submit" name = "BiddingManagement" value = "Bidding Management"></form>
<form action = "leavefeedback.jsp"><input style = "color: blue;"  type = "submit" name = "LeaveFeedback" value = "Leave Feedback"></form>
<form action = "viewmyfeedback.jsp"><input style = "color: blue;"  type = "submit" name = "ViewMyFeedback" value = "View My Feedback"></form>

</body>
</html>
