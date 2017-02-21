
 <%@page language="java" import="java.sql.*"%>
<jsp:useBean id="customer" class= "amlyp.companyDB.User" scope="session"/> 
<jsp:useBean id="item" class= "amlyp.companyDB.Items" scope="session"/> 
	<jsp:setProperty name="customer" property="*"/> 
		<jsp:setProperty name="item" property="*"/> 
		<%@page import = "oracle.jdbc.*" %>
		
	<%if(!customer.getLoggedIn()){    response.sendRedirect("Login.jsp");
} %>

	


<%

item.setInfo(item.getItemId());

System.out.println(request.getParameter("bid"));
double bid = Double.parseDouble(request.getParameter("bid"));

java.util.Date date = new java.util.Date();
Timestamp t = new Timestamp(date.getTime()); 

System.out.println(t);


System.out.println(t.toString().substring(0,10) + "HERE");


item.placeBid(item.getItemId(), customer.getUserId(), t, bid);


	   response.sendRedirect("bid.jsp");


%> 


