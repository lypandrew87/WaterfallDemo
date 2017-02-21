package amlyp.companyDB;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CommissionReport {
	
	public int getUserRating(int userId){
    	try {
			Connection con = DBConnection.openDBConection(); 
		    Statement stmt = con.createStatement();
			String queryStringUser = " SELECT  SATISFACTIONAVERAGE(" + userId + ") from dual";
		    
		    ResultSet result = stmt.executeQuery(queryStringUser);
		    
		    if(result.next()){
		    	return result.getInt(1);
				} 
		    }
    	catch (SQLException e) {		
    		e.printStackTrace();
		}
    	return 0; 
	}
	
	public double getCommission(int userId) throws SQLException{
	  	Connection con = DBConnection.openDBConection(); 
	  	Statement stmt = con.createStatement();
		String queryString = "Select COMMISSION from TEAM7.TEAM7_COMMISSION_REPORT_VIEW where USER_ID = '"+userId + "'";
		    
	    ResultSet result = stmt.executeQuery(queryString);
	    double returnValue = 0; 
	    if(result.next()){
	    	returnValue = result.getDouble(1);
	    }
	    return returnValue;
	}
	
	  public ResultSet getMyUsers(){
		  ResultSet rs = null;
		  try {
	    	Connection myConnection = DBConnection.openDBConection(); 
	    	Statement stmt= myConnection.createStatement();
	        String queryStringUser = "Select * from TEAM7.TEAM7_SELLER s , TEAM7.TEAM7_USER u WHERE s.USER_ID = u.USER_ID";  
	        rs = stmt.executeQuery(queryStringUser);
		  }
		  catch(Exception e){
			  
		  }
		  return rs;
	  }	  
}
