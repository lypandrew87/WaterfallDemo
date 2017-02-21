<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="header.html"%>
   
<jsp:useBean id="bid" class= "amlyp.companyDB.Bid"  scope="session"/>
<jsp:useBean id="item" class= "amlyp.companyDB.Items" scope="session"/>  
<jsp:setProperty name="item" property="*"/> 
<jsp:useBean id="customer" class= "amlyp.companyDB.User" scope="session"/> 

<%if(!customer.getLoggedIn()){response.sendRedirect("Login.jsp");
} %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<meta charset="utf-8"><title>UntitgetItemIdled Document</title>

<script language="javascript" type="text/javascript" src="Script/jquery.js"></script>
<script language="javascript" type="text/javascript" src="Script/script.js"></script>

<link rel="stylesheet" type="text/css" href="CSS/style.css">

<header id="header"></header></head><body><div class="page-content">


<h1>
List of Bidders</h1>


<b>Item ID:  <%=item.getItemId() %></b></br>
<%System.out.println(item.getAuctionEndDate()); %>
<b><%=item.getAuctionStartDate().substring(0,10)+ "  -  "%></b>
<b><%=item.getAuctionEndDate().substring(0,10)%></b>


<table class = "table-format"  border="3" cellpadding="2" cellspacing="2">
<tr class = "table-heading"> <td> Bidding Time</td> <td> Username </td> <td> Bidding Price</td> </tr>



      <%@ page import="amlyp.companyDB.Bid" %>
           <%@ page import = "java.sql.ResultSet" %>
      
    <% ResultSet rs = null; int winner =0; try{
       rs = bid.getAllBids(item.getItemId());
       double winningBid = 0;
     
     while(rs.next()){
      
     
    
      %>
        <tr>
        <td style="vertical-align: top;"><br>
        <%=rs.getString("TIME_STAMP").substring(5,7) + "/" + rs.getString("TIME_STAMP").substring(8,10) + "/" + rs.getString("TIME_STAMP").substring(0,4) + " " + rs.getString("TIME_STAMP").substring(11,16)%>
        </td>
        <td style="vertical-align: top;"><br>
        <%=rs.getString("USERNAME")%>
        </td>
        <td style="vertical-align: top;"><br>
        <%= "$" + String.format("%.2f", rs.getDouble("MAX_BID")) %>
        </td>
       


        </tr>
     <%
     

     
     
     } }
     
         catch(IllegalStateException ise){
             out.println(ise.getMessage());
         }
     
     %>
     <tr>
     </tr>
      
      <b><tr >
       <td>  <b>Winner: </b></td>
         <%System.out.println("twaasdfasdert" + item.getItemId()); %>
      
      <td><b><%=item.getWinningBidder(item.getItemId())%></b></td>
       <td><b><%= "$" + String.format("%.2f", item.findCurrentWinning(item.getItemId())) %></b></td>
       </tr>
 
  </tbody>
</table>
<h1>
</h1>


</div>

</body></html>