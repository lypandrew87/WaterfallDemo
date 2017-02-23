<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="header.html"%>
	<jsp:useBean id="item" class= "amlyp.companyDB.Items" scope="session"/>
		<jsp:useBean id="customer" class= "amlyp.companyDB.User" scope="session"/>
	
	
	    <%if(!customer.getLoggedIn()){response.sendRedirect("Login.jsp");
} %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript" type="text/javascript" src="Script/jquery.js"></script>
<script language="javascript" type="text/javascript" src="Script/script.js"></script>
  <meta charset="utf-8">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  </script>


<link rel="stylesheet" type="text/css" href="CSS/style.css">
<h1>Item Information</h1>
<title>Add New Item</title>
</head>
<body>
<table class="infobox">
<form  method="post" action="addItem_action.jsp" >

<tr>
 <td><b>Item ID: </b></td>
 <td><input disabled  name="itemId" value="<%=item.getMaxId()%>"></td> 
</tr>

<tr>
 <td><b>Item Name: </b></td>
 <td><input name="itemName"  ></td>
</tr>

<tr>
 <td><b>Category: </b></td>
 <td><input  name="category"  ></td>
</tr>

<tr>
 <td><b>Start Price: </b></td>
 <td><input name="startPrice"  ></td>
</tr>
  <%@ page import="java.lang.*" %>
<tr>
 <%System.out.println(item.getAuctionStartDate()); %>

 <td><b>Auction Starts: </b></td>

 <%@ page import="java.sql.Timestamp" %> 
   <%@ page import="java.util.*" %> 
 <%java.util.Date date = new java.util.Date();
Timestamp t = new Timestamp(date.getTime()); 
System.out.println(t.toString().substring(0,10) + "YAYYAYAYAYYAYAY");%>

 
 <td><input disabled value="<%=t.toString().substring(5,7)+"/"+ t.toString().substring(8,10)+"/" +t.toString().substring(0,4)%>"></td> <input type=hidden name="auctionStartDate" value="<%=t.toString().substring(5,7)+"/"+ t.toString().substring(8,10)+"/" +t.toString().substring(0,4)%>">

  
</tr>

<tr>
 <td><b>Auction Ends: </b></td>
 <td><input type="text" id="datepicker" name ="auctionEndDate"></td>

</tr>

<tr>
 <td><b>Description: </b></td>
 <td><textarea cols = "50" rows = "10" name="description" ></textarea></td>
 

 
</tr>
	<tr><td>
	<input style = "color:blue ; width:150px; height: 50px; " type = "submit" value = "Add Item" ></input></form>
	<form action = "viewMyItems.jsp">
	<input    style = "color:blue ; width:150px; height: 50px; " type = "submit" value = "Cancel" ></input>
	</form>
	</td>
</tr>
</table>
</body>
</html>