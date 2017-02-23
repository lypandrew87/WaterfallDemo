
 <%@page language="java" import="java.sql.*"%>
<jsp:useBean id="customer" class= "amlyp.companyDB.User" scope="session"/> 
<jsp:useBean id="admin" class= "amlyp.companyDB.Admin" scope="session"/> 

 <jsp:setProperty name="customer" property="*"/> 
 
<%@ page import="amlyp.companyDB.User" %>

    <%if(!admin.getLoggedIn()){response.sendRedirect("Login.jsp");
} %>
<%



if(customer.getPassword().equals(request.getParameter("password2"))){
	
	System.out.println(admin.getAdminId());
	System.out.println("Customer: " + customer.getMaxId());

	customer.addCustomer(customer.getMaxId(), customer.getFirstName(),customer.getLastName(), customer.getPhoneNumber(), customer.getUsername(), customer.getPassword(), customer.getEmail(), admin.getAdminId()); 
	
    response.sendRedirect("UserManagement.jsp");

	
}else{
	System.out.println("fail");

    response.sendRedirect("UserManagement.jsp");

	
}


  




%> 
