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
<form action = "AdvancedSearch.jsp"><input style = "color: blue; " type = "submit" name = "listitems" value = "Search Item"></input></form>
<form action = "listitemsbidon.jsp"><input style = "color: blue;"type = "submit" name = "checkstatus" value = "Check Status"></form>
<form action = "userwelcome.jsp"><input style = "color: blue;"  type = "submit" name = "ReturnToMenu" value = "Return to Menu"></form>

</body>
</html>