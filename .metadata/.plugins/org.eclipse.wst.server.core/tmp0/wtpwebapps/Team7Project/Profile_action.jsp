
 <%@page language="java" import="java.sql.*"%>
<jsp:useBean id="customer" class= "amlyp.companyDB.User" scope="session"/> 
	<jsp:setProperty name="customer" property="*"/> 
<%if(!customer.getLoggedIn()){response.sendRedirect("Login.jsp");
} %>
<%

System.out.println(request.getParameter("password"));
System.out.println(request.getParameter("password2"));
System.out.println(request.getParameter("old pass" + customer.getPassword()));
if ((request.getParameter("password").equals(request.getParameter("password2")))){
	System.out.println("working");
	if((request.getParameter("password").equals(""))){
		customer.updateDB(customer.getUserId(), customer.getFirstName(), customer.getLastName(), customer.getPhoneNumber(), customer.getUsername(), customer.getPassword(), customer.getEmail(), customer.getAdminId());
	}
	else{
		customer.updateDB(customer.getUserId(), customer.getFirstName(), customer.getLastName(), customer.getPhoneNumber(), customer.getUsername(), request.getParameter("password"), customer.getEmail(), customer.getAdminId());
	}
	System.out.println("updated");
}
else{	
	System.out.println(" NOT updated");
}
response.sendRedirect("Profile.jsp");
  %> 


