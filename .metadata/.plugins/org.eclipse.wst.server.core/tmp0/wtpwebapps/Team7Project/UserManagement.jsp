<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="admin-header.html"%>
	<jsp:useBean id="customer" class= "amlyp.companyDB.User" scope="session"/> 

	<jsp:useBean id="admin" class= "amlyp.companyDB.Admin" scope="session"/> 
<%if(!admin.getLoggedIn()){    response.sendRedirect("Login.jsp");} %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">




<html>
<head>
<meta charset="utf-8">
<title>User List</title>
<script language="javascript" type="text/javascript" src="Script/jquery.js"></script>
<script language="javascript" type="text/javascript" src="Script/script.js"></script>

<link rel="stylesheet" type="text/css" href="CSS/style.css">

<header id = "header">
</header>
<div class = "page-content" >
<font size="5">

<h1>User Management</h1>
<div style="overflow-y: scroll; height:400px;">
<table border = 1 class="infobox">

<tr>
	<td><b>User ID </b></td><td><b>User Name </b></td><td><b>First Name</b></td><td><b>Last Name </b></td><td><b>Email </b></td><td>Password </b></td>
</tr>


 <%@ page import="java.util.ArrayList" %>
  <%@ page import="amlyp.companyDB.User" %>
   <%@ page import="amlyp.companyDB.Items" %>
 
<% ArrayList<User> u = customer.getAllUsers();
System.out.println(customer.getUserId());

for(int i = 0; i< u.size(); i++){
	
	
%>


<tr class=table-data> <td> <%= u.get(i).getUserId()%> </td> <td> <%= u.get(i).getUsername()%> </td> <td> <%= u.get(i).getFirstName() %></td> 
<td> <%= u.get(i).getLastName()%></td> 
<td> <%= u.get(i).getEmail()%> </td> 
<td><input disabled type = "password"value =  <%=u.get(i).getPassword()%>></td>
</tr>


<%} %>
</table>
</div>


<form method = "post" action = "addUser_action.jsp" >
<table class="infobox">
<tr>
	<td><b>User ID: </b></td> 
	<td><input disabled name = "userId"  name="userId" value="<%=customer.getMaxId()%>" ></td>
</tr>
<tr>
	<td><b>Username: </b></td>
	<td><input  name="username"  ></td>
</tr>

<tr>
	<td><b>First Name: </b></td>
	<td><input  name="firstName"  ></td>
</tr>

</td>

<tr>
	<td><b>Last Name: </b></td>
	<td><input  name="lastName"  ></td>
</tr>
<tr>
	<td><b>Email: </b></td>
	<td><input name="email"  ></td>
</tr>

<tr>
	<td><b>Password: </b></td>
	<td><input type="password" name="password"  ></td>
</tr>
<tr>
	<td><b>Retype Password: </b></td>
	<td><input type="password" name="password2"  ></td>




</tr>

	





</table>
</font>
<tr><input  type = "submit" style = " color: blue;width:150px;height:50px;" value = "Add User"></form><input  style = "color: blue; width:150px;height: 50px;" type = "reset" value = "Clear"></tr>
</body>
</html>
