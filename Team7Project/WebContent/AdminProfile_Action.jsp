
 <%@page language="java" import="java.sql.*"%>
<jsp:useBean id="admin" class= "amlyp.companyDB.Admin" scope="session"/> 
	<jsp:setProperty name="admin" property="*"/> 
	
	    <%if(!admin.getLoggedIn()){response.sendRedirect("Login.jsp");
} %>

<%

admin.updateDB();
response.sendRedirect("AdminProfile.jsp");
  
  %> 


