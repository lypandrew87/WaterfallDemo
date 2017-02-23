<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ include file="header.html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="customer" class= "amlyp.companyDB.User" scope="session"/> 
<jsp:useBean id="item" class= "amlyp.companyDB.Items" scope="session"/> 
 <jsp:setProperty name="item" property="*"/> 
<%if(!customer.getLoggedIn()){response.sendRedirect("Login.jsp");
} %>

<html>
<head>
<meta charset="utf-8">
<title>Leave Feedback</title>
<script language="javascript" type="text/javascript" src="Script/jquery.js"></script>
<script language="javascript" type="text/javascript" src="Script/script.js"></script>

<link rel="stylesheet" type="text/css" href="CSS/style.css">

<header id = "header">
</header>
<div class = "page-content">
<body>
<h1 >
List of Items Bought
</h1>
<table class = "table-format"  border="3" cellpadding="2" cellspacing="2">
<tr class = "table-heading"> <td> Item ID </td> <td> Item Name</td> <td> Category </td> <td> Auction Start Time </td> <td> Auction End Time </td> <td> Start Price </td><td> Sold Price </td>
<td> Seller</td> <td> Seller Email </td><td>  </td>
 <%@ page import="java.util.ArrayList" %>
  <%@ page import="amlyp.companyDB.User" %>
   <%@ page import="amlyp.companyDB.Items" %>
 
<% ArrayList<Items> it = customer.getItemsBought(customer.getUserId());
System.out.println(customer.getUserId());

System.out.println("Looking at this: " + it.size()); 
for(int i = 0; i< it.size(); i++){
	
	
%>

</tr>
<tr class=table-data> <td> <%= it.get(i).getItemId()%> </td> <td> <%= it.get(i).getItemName()%> </td> <td> <%= it.get(i).getCategory() %></td> 
<td> <%= it.get(i).getAuctionStartDate().substring(0,10)%></td> 
<td> <%= it.get(i).getAuctionEndDate().substring(0,10)%> </td> 
<td> <%="$" + String.format("%.2f", it.get(i).getStartPrice())%></td>
<td><%= "$" + String.format("%.2f", it.get(i).findCurrentWinning(it.get(i).getItemId()))%>  </td> 
<td> <%= it.get(i).getSellerName(it.get(i).getItemId())%></td>
<td> <%= it.get(i).getSellerEmail(it.get(i).getItemId())%></td>
<%System.out.println((it.get(i).hasFeedback( it.get(i).getItemId())));
if (!(it.get(i).hasFeedback(it.get(i).getItemId()))){%><td><form  action = "leavefeedbackform.jsp"> <button style = "color:blue ;" type = "submit" >Rate Seller</button>  <input value = "<%= it.get(i).getItemId()%>" 
name = "itemId" type = "hidden"> </form></td><%}else {%><td>Already left Feedback!</td>
	
	

<%} }%>
</tr>
</table>
</body>
</html>