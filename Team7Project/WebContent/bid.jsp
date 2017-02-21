<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="customer" class= "amlyp.companyDB.User" scope="session"/> 
    <jsp:useBean id="item" class= "amlyp.companyDB.Items" scope="session"/> 
	<jsp:setProperty name="item" property="*"/> 
	<%if(!customer.getLoggedIn()){response.sendRedirect("Login.jsp");
} %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript" type="text/javascript" src="Script/jquery.js"></script>
<script language="javascript" type="text/javascript" src="Script/script.js"></script>
<%@ include file="header.html"%>
<link rel="stylesheet" type="text/css" href="CSS/style.css">
<title>Insert title here</title>
</head>


<body>


<h1>Bid on Item</h1>
<table>

<tr><td>Item Id</td><td><input disabled name = "itemId" value = "<%=item.getItemId()%>"></td><td></tr>
<tr><td>Item Name</td><td><input disabled value = "<%=item.getItemName()%>"></td><td></tr>

<tr><td>Current Winning Bid</td><td><input disabled value = "<%="$" + String.format("%.2f", item.findCurrentWinning(item.getItemId()))%>"></td><td></tr>
<form method = "post" action = "Bid_Action.jsp">
<tr><td>Max Bid Limit</td><td><input name = "bid"></td><td></tr>


<tr><td><input style = "color: blue ; "type = "submit" value = "Bid On Item" > <input style = "color:blue;"" type = "reset" value = "Cancel"></td></tr></form>




</table>

</body>
</html>