<%@page language="java" import="java.sql.*"%>
<jsp:useBean id="item" class= "amlyp.companyDB.Items" scope="session"/> 
<jsp:useBean id="customer" class= "amlyp.companyDB.User" scope="session"/> 

<%if(!customer.getLoggedIn()){    response.sendRedirect("Login.jsp");
} %>

 <jsp:setProperty name="item" property="*"/> 
 
<%@ page import="amlyp.companyDB.Items" %>
<%@ page import="java.text.*" %>
<%
System.out.println(request.getParameter("auctionEndDate"));
		String itemName = request.getParameter("itemName");
		String description = request.getParameter("description");
		double startPrice = Double.parseDouble(request.getParameter("startPrice"));
		String auctionStartDate = request.getParameter("auctionStartDate");
		System.out.println(request.getParameter("auctionStartDate"));
		String auctionEndDate = request.getParameter("auctionEndDate");
		String category = request.getParameter("category");



	item.addItem(item.getMaxId(), itemName,customer.getUserId(), description, startPrice, auctionStartDate, auctionEndDate, category); 

	response.sendRedirect("viewMyItems.jsp");
    
    %>
