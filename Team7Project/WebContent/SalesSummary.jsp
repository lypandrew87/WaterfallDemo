<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="admin-header.html"%>
<%@ page language="java" import="java.sql.*"%>
<html>

<jsp:useBean id="sales" class= "amlyp.companyDB.SalesSummaryReport"  scope="session"/>


<script language="javascript" type="text/javascript" src="Script/jquery.js"></script>
<script language="javascript" type="text/javascript" src="Script/script-admin.js"></script>
<jsp:useBean id="customer" class= "amlyp.companyDB.User" scope="session"/> 
<jsp:useBean id="admin" class= "amlyp.companyDB.Admin" scope="session"/> 

<%if(!admin.getLoggedIn()){response.sendRedirect("Login.jsp");} %>

<link rel="stylesheet" type="text/css" href="CSS/style.css"> 
</body>
<body>
            <br>
             <h1 align=center> Sales Summary Report </h1>
                <table style="text-align: left; width: 100%;" border=".3">
    <tr>
    <td style="vertical-align: top;"><b>Category</b><br>
    </td>
    <td style="vertical-align: top;"><b>Item ID</b><br>
    </td>
    <td style="vertical-align: top;"><b>Item Name</b><br>
    </td>
    <td style="vertical-align: top;"><b>Final Selling Price</b><br>
    </td>
    <td style="vertical-align: top;"><b>Commission</b><br>
    </td>
    </tr>
    <tr>
    
    <td style="vertical-align: top;"><br>
    
    </td>
    <td style="vertical-align: top;"><br>
    
    </td>
    </td>
    <td style="vertical-align: top;"><br>
    
    </td>
    </td>
    <td style="vertical-align: top;"><br>
    
    </td>
    </td>
    <td style="vertical-align: top;"><br>
    
     <%@ page import="java.util.*" %>
      <%@ page import="amlyp.companyDB.Items" %>
            <%@ page import="amlyp.companyDB.SalesSummaryReport" %>
   
   <%!
   ResultSet it = null;

%>
   
   
   
    <%  double Total =0; try{
      it = sales.getMyItems(); 
     
      
      while(it.next()){
    
     
     
    

     
    

     
    
      %>
        <tr>
        <tr class=table-data> 
        
        <%!
public String category;
        public int itemId ;
        public String itemname; 

%>
        
        
         <% itemname = it.getString(3); category  =it.getString(1); itemId =it.getInt(2);  if(category ==null){%>
        
         <tr> <td><b>Total: </b></td><td></td><td></td><td> <b><%=it.getDouble(4)%></b></td><td><b> <%=it.getDouble(5)%></b></td></tr>
        
        
        <%} else if(itemId == 0){ %>
        
        <tr> <td></td><td><b>Subtotal: </b></td><td></td><td><b> <%=it.getDouble(4)%></b></td><td> <b> <%=it.getDouble(5)%></b></td></tr>
        
        <%}else { %>
      <%  if(category ==null){%>
        
         <tr> <td><b>Total: </b></td><td></td><td></td><td> <b> <%=it.getDouble(4)%></b></td><td><b> <%=it.getDouble(5)%></b></td></tr>
        
        
        <%}else if(itemname == null) { System.out.println(itemname); %>
 <%}else   {%>
       <tr>
       
       <td> <%=category%></td> 
        <td> <%= itemId%></td> 
        
      
        
        <td> <%= itemname %></td> 
		
        <td style="vertical-align: top;"><br>
        <%=it.getDouble(4)%>
        </td>
        <td style="vertical-align: top;"><br>
        <%=it.getDouble(5)%>
        </td>
        </tr>   
     <%
     

     
     
     }}} }
     
         catch(IllegalStateException ise){
             out.println(ise.getMessage());
         }
     
     %>

    </tbody>
    </table>
   </form>
 <form method="post" action="welcome.jsp">  
 <input name="Submit" value="Back to menu"style = " color: blue; width:150px; height: 50px;" type="submit"><br>
 </form>  
        

        </body>
    </html>


