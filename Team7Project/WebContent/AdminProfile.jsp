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
<%if(!admin.getLoggedIn()){    response.sendRedirect("Login.jsp");
} %>

<link rel="stylesheet" type="text/css" href="CSS/style.css">

<header id = "header">
</header>

<div class = "page-content">
 <form  method="post" action="AdminProfile_Action.jsp" >
	
<h1 >
Admin Profile
</h1>

<table class="infobox">
<tr>
	<td><b>Admin ID:</b></td>
	<td><input disabled name = "adminId" type = "text" value = "<%=admin.getAdminId() %>"></td>
</tr>

<tr>
	<td><b>Admin User Name: </b></td>
	<td><input disabled name = "username" type = "text" value ="<%=admin.getUsername() %>" ></td>
</tr>


<tr>
	<td><b>Password: </b></td>
	<td><input name = "password" type = "password" value = <%=admin.getPassword() %>></td>
</tr>


</td>


</table>
<input  style = "color:blue ; width:150px; height: 50px; " type = "submit" value = "Update" ></input>

 </form >

</div>

</body>
</html>