
 <%@page language="java" import="java.sql.*"%>
		<%@page import = "oracle.jdbc.*" %>
		        <%@ include file="header.html"%>
		
    
    <jsp:useBean id="feedback" class= "amlyp.companyDB.Feedback"  scope="session"/>
    <jsp:setProperty name="feedback" property="*"/>   
    
    <%@page language="java" import="java.sql.*"%>
<jsp:useBean id="item" class= "amlyp.companyDB.Items" scope="session"/> 
<jsp:useBean id="customer" class= "amlyp.companyDB.User" scope="session"/> 

 <jsp:setProperty name="item" property="*"/> 
 <%if(!customer.getLoggedIn()){response.sendRedirect("Login.jsp");
} %>

    
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
int itemId = Integer.parseInt(request.getParameter("itemId"));
String itemName = request.getParameter("itemName");
feedback.insertFeedback(itemId,  customer.getUserId(), feedback.getDeliveryRating(),feedback.getComment(),feedback.getSatisfaction(),feedback.getItemQuality());



response.sendRedirect("leavefeedback.jsp");




%>



</body>
</html>