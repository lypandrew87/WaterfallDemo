<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>		      


 <%@ include file="header.html"%>
    
    
  <jsp:useBean id="item" class= "amlyp.companyDB.Items" scope="session"/>  
<jsp:setProperty name="item" property="*"/> 
<jsp:useBean id="customer" class= "amlyp.companyDB.User" scope="session"/> 
<%if(!customer.getLoggedIn()){response.sendRedirect("Login.jsp");
} %>

<script language="javascript" type="text/javascript" src="Script/jquery.js"></script>
<script language="javascript" type="text/javascript" src="Script/script-admin.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/style.css">

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%item.setInfo(item.getItemId()); %>


<td> <form method = "post" action = "leavefeedback_action.jsp" >





<h1>Leave Feedback</h1>
<table class = "table-format" >
<tr> <td> Item ID</td> <td> <input disabled value = "<%= item.getItemId()%>"><input type = "hidden" name = "itemId" value = "<%= item.getItemId()%>"></td>
<tr> <td> Item Name </td> <td> <input disabled value = "<%= item.getItemName() %> " ><input type = "hidden" name = "itemName" value = "<%= item.getItemName() %> "> </td> </tr>
<tr> <td> Overall Satisfaction </td> 

<td> <select name="satisfaction">
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
</select> 

</td></tr>

<tr><td> Item Quality</td> 

<td>
  <input type="radio" name="itemQuality" value="1" checked>1

  <input type="radio" name="itemQuality" value="2">2
    <input type="radio" name="itemQuality" value="3">3
      <input type="radio" name="itemQuality" value="4">4
        <input type="radio" name="itemQuality" value="5">5
 </td> </tr> 

<tr> <td> Delivery</td> <td> 

  <input type="radio" name="deliveryRating" value="1" checked>1

  <input type="radio" name="deliveryRating" value="2">2
    <input type="radio" name="deliveryRating" value="3">3
      <input type="radio" name="deliveryRating" value="4">4
        <input type="radio" name="deliveryRating" value="5">5
</td>  </tr>
<tr>
<td> </td>


</tr>

<tr> <td>Comments </td> <td> <textarea style  = "resize: none;" name = "comment"  rows = "4" columns = "75"></textarea></td>


<tr><td><button style = "color:blue;" type = "reset" >Cancel</button></td> <td><input style= "color:blue;" type = "submit" value = "submit" ></td></tr>

</tr>


</form>




</body>
</html>