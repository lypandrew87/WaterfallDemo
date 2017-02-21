<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="header.html"%>
<jsp:useBean id="item" class= "amlyp.companyDB.Items" scope="session"/> 
<jsp:useBean id="customer" class= "amlyp.companyDB.User" scope="session"/> 
	<jsp:setProperty name="item" property="*"/> 

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
Search Result</h1>
<table class = "table-format"  border="3" cellpadding="2" cellspacing="2">
<tr class = "table-heading"> <td> Item ID </td> <td> Item Name </td> <td> Category</td> <td> Auction Start Time<br> </td> <td> Auction End Time</td> <td> Current Bid </td><td> </td><td>  </td>
 <%@ page import="java.util.ArrayList" %>
  <%@ page import="amlyp.companyDB.Items" %>
  
  <% 
  String search = request.getParameter("Search");
  
  ArrayList<Items> it = item.searchForItems(search);
  
  for(int i = 0; i< it.size(); i++){
		
		System.out.println(it.get(i).getItemId());
		if (item.findStatus(it.get(i).getItemId()).equals("ON AUCTION")){
%>
<form action = "Item.jsp">
<tr class=table-data> <td> <input disabled value = "<%= it.get(i).getItemId()%>" name = "itemId"></td> <td><input disabled value = "<%= it.get(i).getItemName()%>" name = "itemName"> </td>
<td><input disabled value ="<%= it.get(i).getCategory()%>" name = "category" ></td><td><input disabled value = "<%= it.get(i).getAuctionStartDate().substring(0,10)%>" name = "auctionStartDate"></td>
<td><input disabled value ="<%=it.get(i).getAuctionEndDate().substring(0,10)%>" name = "auctionEndDate"> </td><td><%= "$" + String.format("%.2f", item.findCurrentWinning(it.get(i).getItemId())) %></td>




<td> <input  value = "<%=it.get(i).getItemId()%>" type = "hidden" name= "itemId">    <button style = "color: blue; "type="submit">Item Info</button> </form></td>
<form action = "bid.jsp">
<td> <input  value = "<%= it.get(i).getItemId()%>" type = "hidden" name= "itemId">    <button style = "color: blue; " type="submit">Bid</button> </form></td>


 </td> 


 
 <%}
		} %>
 
  </tbody>
</table>
<h1>
</h1>


</div>

</body></html>