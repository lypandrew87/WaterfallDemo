
 <%@page language="java" import="java.sql.*"%>
<jsp:useBean id="customer" class= "amlyp.companyDB.User" scope="session"/> 
<jsp:useBean id="admin" class= "amlyp.companyDB.Admin" scope="session"/> 
 <jsp:setProperty name="customer" property="*"/> 
 <jsp:setProperty name="admin" property="*"/> 

<%

customer.logOut();
response.sendRedirect("Login.jsp");


%>