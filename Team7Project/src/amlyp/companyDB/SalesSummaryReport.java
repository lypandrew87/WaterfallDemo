package amlyp.companyDB;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class SalesSummaryReport {
	

	
public int getFinalSellingPrice(int itemId) throws SQLException{
	System.out.println(itemId + " !!!!!!!!!!!");
  	Connection con = DBConnection.openDBConection(); 
    Statement stmt = con.createStatement();
    String queryString = "Select FINAL_SELLING_PRICE from TEAM7.TEAM7_SUMMARY_REPORT_VIEW where ITEM_ID = '"+itemId + "'";
    System.out.println(queryString);
    ResultSet result = stmt.executeQuery(queryString);
    int returnValue = 0; 
    if(result.next()){
    	
    	returnValue = result.getInt(1);
    }
    
    return returnValue;

}

	public double getCommission(int itemId) throws SQLException{
	  	Connection con = DBConnection.openDBConection(); 
		    Statement stmt = con.createStatement();
		    String queryString = "Select COMMISSION from TEAM7.TEAM7_SUMMARY_REPORT_VIEW where ITEM_ID = '"+itemId + "'";
		    
		    ResultSet result = stmt.executeQuery(queryString);
		    double returnValue = 0; 
		    if(result.next()){
		    	
		    	returnValue = result.getDouble(1);
		    }
		    
		    return returnValue;
		
	}
	
	  public ResultSet getMyItems(){
		  
		  ResultSet rs = null;
		  ArrayList<Items> result=null;
		  try {
			  result =new ArrayList<Items>();
		    	Connection myConnection = DBConnection.openDBConection(); 
	          Statement stmt= myConnection.createStatement();
		        String queryStringUser = "Select * from TEAM7.TEAM7_SUMMARY_REPORT_VIEW"; 
		 rs = stmt.executeQuery(queryStringUser);
		 return rs;
		

			
			 
		  }catch(Exception e){
			  
		  }
		
		
		  
		  return rs;
		  
	  }
	  
}
