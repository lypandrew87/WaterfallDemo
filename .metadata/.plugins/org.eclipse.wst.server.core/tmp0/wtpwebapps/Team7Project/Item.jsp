<html>
<head>
<meta charset="utf-8">
<title>Item Information</title>
        <%@ include file="header.html"%>

<script language="javascript" type="text/javascript" src="Script/jquery.js"></script>
<script language="javascript" type="text/javascript" src="Script/script.js"></script>
	<jsp:useBean id="item" class= "amlyp.companyDB.Items" scope="session"/> 
	<jsp:setProperty name="item" property="*"/> 
	<jsp:useBean id="customer" class= "amlyp.companyDB.User" scope="session"/> 
	
<link rel="stylesheet" type="text/css" href="CSS/style.css">
<%if(!customer.getLoggedIn()){response.sendRedirect("Login.jsp");
} %>
<%

String itemId =  request.getParameter("itemId");
System.out.println(itemId );

item.setInfo(Integer.parseInt(itemId));

 %>

<header id = "header">
</header>
<div class = "page-content">

<h1>Item Information</h1>
<table class="infobox">
<form  method="post" action="Item_action.jsp" >

<tr>
 <td><b>Item ID: </b></td>
 <td><input disabled  name="ITEM_ID" value="<%=item.getItemId()%>" disabled></td>
</tr>

<tr>
 <td><b>Item Name: </b></td>
 <td><input disabled name="ITEM_NAME" value="<%=item.getItemName()%>" ></td>
</tr>

<tr>
 <td><b>Category: </b></td>
 <td><input   disabled name="CATEGORY" value="<%=item.getCategory()%>" ></td>
</tr>

<tr>
 <td><b>Start Price: </b></td>
 <td><input  disabled name="START_PRICE" value="<%="$" + String.format("%.2f", item.getStartPrice())%>" ></td>
</tr>
  <%@ page import="java.lang.*" %>
<tr>
 <%System.out.println(item.getAuctionStartDate()); %>

 <td><b>Auction Starts: </b></td>
 <td><input disabled name="AUCTION_START_MONTH" value="<%=item.getAuctionStartDate().substring(0, 10)%>"></td>

  
</tr>

<tr>
 <td><b>Auction Ends: </b></td>
 <td><input disabled name="AUCTION_END_MONTH" value="<%=item.getAuctionEndDate().substring(0,10)%>"></td>

</tr>

<tr>
 <td><b>Description: </b></td>
 <td><textarea disabled cols = "50" rows = "10" name="DESCRIPTION" ><%=item.getDescription()%></textarea></td>
 
 </form>
 
</tr>
<tr><td><form action = "viewMyItems.jsp">
<input    style = "color:blue ; width:150px; height: 50px; " type = "submit" value = "Cancel" ></input>

</form>
</td>
</tr>
</table>


</div>
</body>
</html>
