<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin-header.html" %>


     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
<script language="javascript" type="text/javascript" src="Script/jquery.js"></script>
<script language="javascript" type="text/javascript" src="Script/script-admin.js"></script>
<jsp:useBean id="admin" class= "amlyp.companyDB.Admin" scope="session"/> 

<%if(!admin.getLoggedIn()){response.sendRedirect("Login.jsp");} %>

<link rel="stylesheet" type="text/css" href="CSS/style.css">

<header id = "header">
</header>

<div class = "page-content">

<h1 >
Welcome, <%=admin.getUsername()%>
</h1>

<form action = "UserManagement.jsp"><input style = "color: blue; " type = "submit" name = "userManagement" value = "User Management"></form>



<form action = "SalesSummary.jsp"><input style = "color: blue;"type = "submit" name = "sales" value = "Sales Report"></form>


<form action = "commissionReport.jsp"><input style = "color: blue;"  type = "submit" name = "commission" value = "Commission Report"></form>

</body>
</html>