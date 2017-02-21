<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ include file="header.html"%>
<jsp:useBean id="customer" class= "amlyp.companyDB.User" scope="session"/> 
<%if(!customer.getLoggedIn()){response.sendRedirect("Login.jsp");
} %>
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

<h1 >
View My Feedback
</h1>
<table class = "table-format"  border="3" cellpadding="2" cellspacing="2">
<tr class = "table-heading"> <td> Item ID</td> <td> Item Name </td><td> Buyer </td> <td> Satisfaction </td> <td> Item Quality </td> <td> Delivery </td><td> Comments </td>
 <%@ page import="java.util.ArrayList" %>
  <%@ page import="amlyp.companyDB.Feedback" %>
 
<% ArrayList<Feedback> fb = customer.getMyFeedback();

for(int i = 0; i< fb.size(); i++){
	
	System.out.println(fb.get(0).getComment());
%>

</tr>
<tr class=table-data> <td> <%= fb.get(i).getItemId()%> </td> <td> <%= fb.get(i).getItemName() %></td> <td> <%= fb.get(i).getUserName()%> </td> <td> <%= fb.get(i).getSatisfaction()%></td> <td> <%= fb.get(i).getItemQuality()%> </td> <td> <%=fb.get(i).getDeliveryRating()%></td><td><%= fb.get(i).getComment()%>  </td> 


<%} %>
</tr>
</table>
</div>
</body>
</html>
