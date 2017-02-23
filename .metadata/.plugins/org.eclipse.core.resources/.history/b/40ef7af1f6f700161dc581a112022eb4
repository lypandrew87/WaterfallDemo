package amlyp.companyDB;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection implements Serializable  {

	@SuppressWarnings("serial")
	public static Connection openDBConection(){
		try{
			
			Class.forName("oracle.jdbc.OracleDriver");
			Connection  myConnection =  DriverManager.getConnection("jdbc:oracle:thin:@//cscioraclesrv.ad.csbsju.edu:1521/"
					+ "csci.cscioraclesrv.ad.csbsju.edu","team7", "llst4");
			return myConnection; 	
		}
		catch(Exception e){
			e.printStackTrace(); 
		}

		return null;
	}
}
