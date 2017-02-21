package amlyp.companyDB;

import java.io.*;
import java.sql.*;
import oracle.jdbc.*;


public class Admin implements Serializable {

	private int adminId; 
	private  String username; 
	private String password; 
    private boolean loggedIn = false;
  
 
public String getUsername() {
	return username;
}

public void setUsername(String username) {
	this.username = username;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public int getAdminId() {
	return adminId;
}

public void setAdminId(int adminId) {
	this.adminId = adminId;
}

public void setLoggedIn(boolean loggedIn) {
	this.loggedIn = loggedIn;
}
public boolean getLoggedIn() {
	return loggedIn; 
}

public Admin() {
  }
  
 
  
  /**
   * A getter for class field loggedIn
   * @return whether the Customer is logged in or not
   */
  public Boolean isLoggedIn() {
    return this.loggedIn;
  }
  
  public void logOut() {

				this.loggedIn = false; 

	}
  
	public boolean login() {
		try {

			Connection myConnection = DBConnection.openDBConection();
			Statement stmt = myConnection.createStatement();
			String queryStringAdmin = "Select * from TEAM7.TEAM7_ADMIN where USERNAME='" + this.username
					+ "' and password='" + this.password + "'";
			ResultSet rs = stmt.executeQuery(queryStringAdmin);

			if (rs.next()) {
				this.loggedIn = true; 
				
				return true;
			} else {
				
				System.out.println("Invalid Username or Password");
				return false;
			}

		} catch (Exception E) {
			E.printStackTrace();
		}
		return false;

	}
	
	public void updateDB(){
		  Connection myConnection = DBConnection.openDBConection(); 
		    Statement stmt;
		    try{
		  stmt = myConnection.createStatement();
			String queryStringUser = "EXEC UPDATE_ADMIN_PROC ('"+ this.getUsername()+"','"+ this.getPassword() + "','"+ this.getAdminId() + "')";
			System.out.println(queryStringUser); 

		    }catch(Exception e){	    	
				e.printStackTrace();    	
		    }	
	}
	
	public void setValues(){
		
		Connection myConnection = DBConnection.openDBConection(); 
	    Statement stmt;
		try {
			stmt = myConnection.createStatement();
			String queryStringUser = "Select * from TEAM7.TEAM7_ADMIN where USERNAME='"+
		    this.username+"' and PASSWORD='"+
	        this.password+ "'";

		   System.out.println(this.getPassword());
		   System.out.println(this.getAdminId());

				ResultSet rs = stmt.executeQuery(queryStringUser);
				
				if(rs.next()){
					System.out.println("!!!!!!!!!!!!!");
					this.setAdminId(rs.getInt("Admin_ID"));
					this.setPassword(rs.getString("Password"));
				
				}
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
