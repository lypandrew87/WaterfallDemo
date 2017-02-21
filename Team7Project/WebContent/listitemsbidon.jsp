<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="header.html"%>
<jsp:useBean id="item" class= "amlyp.companyDB.Items" scope="session"/> 
<jsp:useBean id="customer" class= "amlyp.companyDB.User" scope="session"/> 
 <jsp:setProperty name="item" property="*"/> 
  <jsp:setProperty name="customer" property="*"/> 

<%if(!customer.getLoggedIn()){response.sendRedirect("Login.jsp");
} %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<meta charset="utf-8"><title>Untitled Document</title>

<script language="javascript" type="text/javascript" src="Script/jquery.js"></script>
<script language="javascript" type="text/javascript" src="Script/script.js"></script>

<link rel="stylesheet" type="text/css" href="CSS/style.css">

<header id="header"></header></head><body><div class="page-content">


<h1>
List of Items Bid On</h1>
<table class = "table-format"  border="3" cellpadding="2" cellspacing="2">
<tr class = "table-heading"> <td> Item ID </td> <td> Item Name </td> <td> Category</td> <td> Auction Start Time<br> </td> <td> Auction End Time</td> <td> Current Winning Bid </td><td>Winner</td>
 <%@ page import="java.util.ArrayList" %>
  <%@ page import="amlyp.companyDB.Items" %>
  
  <%
  
  ArrayList<Items> it = item.getItemsBidOn(customer.getUserId());
  
  for(int i = 0; i< it.size(); i++){
  
  System.out.println(it.get(i).getItemId());
%> 

<form action = "Item.jsp">
<tr class=table-data> <td> <input disabled value = "<%= it.get(i).getItemId()%>" name = "itemId"></td> <td><input disabled value = "<%= it.get(i).getItemName()%>" name = "itemName"> </td>
<td><input disabled value ="<%= it.get(i).getCategory()%>" name = "category" ></td><td><input disabled value = "<%= it.get(i).getAuctionStartDate().substring(0,10)%>" name = "auctionStartDate"></td>
<td><input disabled value ="<%=it.get(i).getAuctionEndDate().substring(0,10)%>" name = "auctionEndDate"> </td><td><%= "$" + String.format("%.2f", item.findCurrentWinning(it.get(i).getItemId())) %></td>
<td><%= item.getWinningBidder(it.get(i).getItemId()) %></td>




 </td> 


 
 <%} %>
 
  </tbody>
</table>
<h1>
</h1>


</div>

</body></html>