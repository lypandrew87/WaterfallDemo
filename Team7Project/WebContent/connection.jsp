<%@ page language="java" import="java.sql.*"%>
<%

Class.forName("oracle.jdbc.OracleDriver");
Connection  myConnection = DriverManager.getConnection("jdbc:oracle:thin:@//cscioraclesrv.ad.csbsju.edu:1521/csci.cscioraclesrv.ad.csbsju.edu","alyp", "900206749");
System.out.println("Lets see if this is working" + myConnection);

%>