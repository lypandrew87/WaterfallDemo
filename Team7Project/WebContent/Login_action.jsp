
 <%@page language="java" import="java.sql.*"%>
<jsp:useBean id="customer" class= "amlyp.companyDB.User" scope="session"/> 
<jsp:useBean id="admin" class= "amlyp.companyDB.Admin" scope="session"/> 
 <jsp:setProperty name="customer" property="*"/> 
 <jsp:setProperty name="admin" property="*"/> 

<%

if(request.getParameter("type").equals("User")){

System.out.println("This is a user ");



if (customer.login()){
    
    System.out.println("From Post:  " + request.getParameter("username"));
     
    customer.setValues(); 
    System.out.println("After set values");
    response.sendRedirect("userwelcome.jsp");

}
 
   else{
    
    System.out.println("From Post:  " + request.getParameter("username"));


    response.sendRedirect("Login.jsp");
   }
}else{
 
 System.out.println("This is an admin");
 
 if (admin.login()){
  
  admin.setValues();
      response.sendRedirect("welcome.jsp");

 }
  
    else{
     
     System.out.println("From Post:  " + request.getParameter("username"));
     response.sendRedirect("Login.jsp");
    }




}%> 
