<%@ page language="java" import="java.sql.*"%>
<%@ include file="admin-header.html"%>
<html>
<jsp:useBean id="customer" class= "amlyp.companyDB.User"  scope="session"/>
<jsp:useBean id="commission" class= "amlyp.companyDB.CommissionReport"  scope="session"/>
<jsp:useBean id="admin" class= "amlyp.companyDB.Admin" scope="session"/> 

<%if(!admin.getLoggedIn()){response.sendRedirect("Login.jsp");} %>
<script language="javascript" type="text/javascript" src="Script/jquery.js"></script>
<script language="javascript" type="text/javascript" src="Script/script-admin.js"></script>
<link rel="stylesheet" type="text/css" href="CSS/style.css">
</body>
<body>

            <br>
             <h1 align=center> Commissions Report </h1>
                <table style="text-align: left; width: 100%;" border="1" cellpadding="2" cellspacing="2">
    <tbody>
    <tr>
    <td style="vertical-align: top;"><b>User ID</b><br>
    </td>
    <td style="vertical-align: top;"><b>User Name</b><br>
    </td>
    <td style="vertical-align: top;"><b>First Name</b><br>
    </td>
    <td style="vertical-align: top;"><b>Last Name</b><br>
    </td>
    <td style="vertical-align: top;"><b>Email</b><br>
    </td>
    <td style="vertical-align: top;"><b>Seller Rating</b><br>
    </td>
    <td style="vertical-align: top;"><b>Commissions</b><br>
    </td>
    </tr>
   
   
    
     <%@ page import="java.util.ArrayList" %>
      <%@ page import="amlyp.companyDB.User" %>
    <% ResultSet rs = null; double totalCommission =0; try{
      rs = commission.getMyUsers();
     
     while(rs.next()){
      
     
     
      totalCommission += commission.getCommission(rs.getInt("USER_ID"));

     
    

     
    
      %>
        <tr>
        <td style="vertical-align: top;"><br>
        <%=rs.getInt("USER_ID")%>
        </td>
        <td style="vertical-align: top;"><br>
        <%=rs.getString("USERNAME")%>
        </td>
        <td style="vertical-align: top;"><br>
        <%=rs.getString("FIRST_NAME")%>
        </td>
        <td style="vertical-align: top;"><br>
        <%=rs.getString("LAST_NAME")%>
        </td>
        <td style="vertical-align: top;"><br>
        <%=rs.getString("EMAIL")%>
        </td>
        <td style="vertical-align: top;"><br>
        <%=commission.getUserRating(rs.getInt("USER_ID"))%>
        </td>
        <td style="vertical-align: top;"><br>
        <%=commission.getCommission(rs.getInt("USER_ID"))%>
        </td>
        </tr>
     <%
     

     
     
     } }
     
         catch(IllegalStateException ise){
             out.println(ise.getMessage());
         }
     
     %>
       <tr><td></td>
       <td></td>
       <td></td>
       <td></td>
       <td></td>
       <td></td>
       
       <td style="vertical-align: top;"><br>
       <b>$<%= String.format("%.2f", totalCommission)%></b>
       
       </td>
       </tr>
    </tbody>
   
    </table> 
    
    <tr><td><form method="post" action="welcome.jsp">  
  <input name="Submit" value="Back to menu"style = " color: blue; width:150px; height: 50px;" type="submit"><br>
 </form> </td></tr> 
   </form>

        

        </body>
    </html>


