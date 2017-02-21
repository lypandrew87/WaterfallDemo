package amlyp.companyDB;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;

import oracle.jdbc.*;

public class User implements Serializable {
	private int userId;
	private String firstName; 
	private String lastName; 
	private String phoneNumber; 
	private  String username; 
	private String password; 
	private String email; 
	private int adminId;
	private int sellerRating; 
	private int numberOfSellerRatings; 
	
 
	private boolean loggedIn = false;

  public User() {
	  
  }
public User(int userId, String first, String last, String phoneNumber , String username, String password, String email, int adminId ) {
	
	this.userId = userId; 
	this.firstName = first;
	this.lastName = last; 
	this.phoneNumber = phoneNumber; 
	this.username = username; 
	this.password = password; 
	this.email = email; 
	this.adminId = adminId; 
	
	  
  }
  public int getUserId() {
	return userId;
  }

  public void setUserId(int userId) {
	this.userId = userId;
  }
	
  public String getFirstName() {
	return firstName;
  }		
	
  public void setFirstName(String firstName) {
	  this.firstName = firstName;
  }
	
  public String getLastName() {
	  return lastName;
  }
	
  public void setLastName(String lastName) {
	this.lastName = lastName;
  }
	
  public String getPhoneNumber() {
	return phoneNumber;
  }
	
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
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
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getAdminId() {
		return adminId;
	}
	
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	public boolean getLoggedIn() {
		return this.loggedIn;
	}
	public void setLoggedIn(boolean loggedIn) {
		this.loggedIn = loggedIn;
	}public int getNumberOfSellerRatings() {
		return numberOfSellerRatings;
	}
	
	public void setNumberOfSellerRatings(int numberOfSellerRatings) {
		this.numberOfSellerRatings = numberOfSellerRatings;
	}
	
	public int getSellerRating() {
		return sellerRating;
	}
	
	public void setSellerRating(int sellerRating) {
		this.sellerRating = sellerRating;
	}
	
	
	
	public ArrayList<Feedback> getMyFeedback(){
		Connection myConnection = DBConnection.openDBConection(); 
	    Statement stmt;
		try {
			stmt = myConnection.createStatement();
			String queryStringUser = "Select * from TEAM7.TEAM7_USER U ,TEAM7.TEAM7_LEAVE_FEEDBACK F, TEAM7.TEAM7_ITEM I WHERE U.USER_ID = F.USER_ID AND  F.ITEM_ID = I.ITEM_ID AND I.USER_ID ='"+this.getUserId() + "'";
			ResultSet rs = stmt.executeQuery(queryStringUser);
			ArrayList<Feedback> returnValue = new ArrayList<Feedback>();
			while(rs.next()){
				Feedback fb = new Feedback(rs.getString("Item_Name"), rs.getString("UserName"), rs.getInt("Item_Id"), rs.getInt("User_Id"), rs.getInt("Delivery_Rating"), rs.getString("Comments"), rs.getInt("Satisfaction"), rs.getInt("Item_Quality")); 
				returnValue.add(fb);
			}
			return returnValue; 
		}
		catch(Exception e){
				System.out.println("Did not work");	
		}
		return null;	
	}
	
	
	public void setValues(){
		
		Connection myConnection = DBConnection.openDBConection(); 
	    Statement stmt;
		try {
			stmt = myConnection.createStatement();
			String queryStringUser = "Select * from TEAM7.TEAM7_USER where USERNAME='"+
		    this.username+"' and password='"+
	        this.password+ "'";
			ResultSet rs = stmt.executeQuery(queryStringUser);
			
			if(rs.next()){
				this.setUserId(rs.getInt("User_ID"));
				this.setFirstName(rs.getString("First_Name"));
				this.setLastName(rs.getString("Last_Name"));
				this.setPhoneNumber(rs.getString("Phone_Number"));
				this.setUsername(rs.getString("Username"));
				this.setPassword(rs.getString("Password"));
				this.setEmail(rs.getString("Email"));
				this.setAdminId(rs.getInt("Admin_Id"));	
			}
			rs.close();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			stmt = myConnection.createStatement();
			String queryStringUser = " SELECT  SATISFACTIONAVERAGE(" +this.getUserId() +") from dual";
			ResultSet rs = stmt.executeQuery(queryStringUser);
			
			if(rs.next()){
				this.setSellerRating(rs.getInt(1));
			}
			rs.close();

		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			stmt = myConnection.createStatement();
			String queryStringUser = "SELECT  NUMBEROFRATING(" +this.getUserId() +") from dual";
			ResultSet rs = stmt.executeQuery(queryStringUser);
			
			if(rs.next()){
				System.out.println("got to this point");
			this.setNumberOfSellerRatings(rs.getInt(1));
				
			}
			rs.close();
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}	
	}
  
  public void updateDB(int userId, String firstName, String lastName, String phoneNumber, String username, String password, String email, int adminId) {
	  Connection myConnection = DBConnection.openDBConection(); 
	  PreparedStatement p;
	  try{
		  String queryString = "UPDATE TEAM7.TEAM7_USER set FIRST_NAME = ?, LAST_NAME = ?, PHONE_NUMBER = ?, PASSWORD = ? WHERE USER_ID  = ?";
		  p = myConnection.prepareStatement(queryString);
		  p.clearParameters();
		  p.setString(1, firstName);
		  p.setString(2, lastName);
		  p.setString(3, phoneNumber);
		  p.setString(4, password);
		  p.setInt(5, userId);
		  p.executeUpdate(); 
		  System.out.println(queryString);
		  p.close();

	  }
	  catch(Exception e){
		  e.printStackTrace();
	   }
  }
  
  public void logOut() {

		this.loggedIn = false; 

}

  public boolean login() {
	  try {
		Connection myConnection = DBConnection.openDBConection(); 
	    Statement stmt= myConnection.createStatement();
	    String queryStringUser = "Select * from TEAM7.TEAM7_USER where USERNAME='"+
	    this.username+"' and password='"+
	    this.password+ "'";
		   
		ResultSet rs = stmt.executeQuery(queryStringUser);

		if(rs.next() ){
		   rs.close();
		   loggedIn = true; 
		   return true; 
		}
	  } 
	  catch (Exception E) {
		  E.printStackTrace();
	  }
	  return false;
  }
  
	public ArrayList<Items> getMyItems() {
	    Connection con = DBConnection.openDBConection();
	    Statement stmt;
	    ArrayList<Items> returnResult = null;
		try {
			stmt = con.createStatement();
			String queryString = "Select * from TEAM7_ITEM where USER_ID = '"+this.getUserId() + "' ORDER BY ITEM_ID";
			ResultSet result = stmt.executeQuery(queryString); 
			returnResult = new ArrayList<Items>();
			while(result.next()){
		    	Items it = new Items(result.getInt("ITEM_ID"), result.getString("ITEM_NAME"), result.getString("CATEGORY"),result.getString("AUCTION_START_TIME"), result.getString("AUCTION_END_TIME"), result.getDouble("START_PRICE"), result.getString("DESCRIPTION"));
		    	returnResult.add(it); 
		    }
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
	    return returnResult ;
	}
  
	public ArrayList<Items> getItemsBought(int userId) {
	    Connection con = DBConnection.openDBConection();
	    Statement stmt;
	    ArrayList<Items> returnResult = null;
		try {
			stmt = con.createStatement();
			String queryString = "SELECT I.USER_ID, I.CATEGORY, I.ITEM_ID, I.ITEM_NAME, I.DESCRIPTION, I.AUCTION_START_TIME, I.AUCTION_END_TIME, I.START_PRICE, MAX(X.MAX_BID)  FROM TEAM7_BUYER B, TEAM7_ITEM I,  TEAM7_USER U, TEAM7_BID X WHERE I.USER_ID = U.USER_ID AND X.ITEM_ID = I.ITEM_ID AND B.USER_ID="+userId +" AND B.USER_ID = X.USER_ID GROUP BY I.ITEM_ID,I.USER_ID, I.CATEGORY, I.ITEM_ID, I.ITEM_NAME, I.DESCRIPTION, I.AUCTION_START_TIME, I.AUCTION_END_TIME, I.START_PRICE ORDER BY I.ITEM_ID";
			    
			ResultSet result = stmt.executeQuery(queryString);
			   
			returnResult = new ArrayList<Items>();
			while(result.next()){
			   Items it = new Items(result.getInt("ITEM_ID"), result.getString("ITEM_NAME"), result.getString("CATEGORY"),result.getString("AUCTION_START_TIME"), result.getString("AUCTION_END_TIME"), result.getDouble("START_PRICE"), result.getString("DESCRIPTION"));
			   returnResult.add(it);    
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
	    return returnResult ;
	}
	
	public ArrayList<User> getAllUsers(){
		
		  Connection con = DBConnection.openDBConection();
		    Statement stmt;
		    ArrayList<User> returnResult = null;
			try {
				stmt = con.createStatement();
				String queryString = "SELECT * FROM TEAM7.TEAM7_USER ORDER BY USER_ID";
				    
				ResultSet result = stmt.executeQuery(queryString);
				   
				returnResult = new ArrayList<User>();
				while(result.next()){
				   User it = new User(result.getInt("USER_ID"), result.getString("FIRST_NAME"), result.getString("LAST_NAME"),result.getString("PHONE_NUMBER"), result.getString("USERNAME"), result.getString("PASSWORD"), result.getString("EMAIL"), result.getInt("ADMIN_ID"));
				   
				   

				   
				   returnResult.add(it);    
				}
			} 
			catch (SQLException e) {
				e.printStackTrace();
			}
			return returnResult;
		
	}
	
	
	public int  getMaxId(){
		
		  Connection con = DBConnection.openDBConection();
		    Statement stmt;
			try {
				stmt = con.createStatement();
				String queryString = "SELECT MAX(U.USER_ID)+1 FROM TEAM7.TEAM7_USER U";
				    
				ResultSet result = stmt.executeQuery(queryString);
				   
				while(result.next()){
				   
				   

				   
			return result.getInt(1);   
				}
			} 
			catch (SQLException e) {
				e.printStackTrace();
			}
			return 0;
		
		
		
		
	}
	

public void 	addCustomer(int userId, String first, String last, String phoneNumber, String username, String password, String email, int adminId){
	
	  Connection con = DBConnection.openDBConection();
	    Statement stmt;
		try {
			
			
			stmt = con.createStatement();
			
		
			String queryString = "INSERT into TEAM7.TEAM7_USER values (?, ?,?,?,?,?,?,?)";
			    PreparedStatement p = con.prepareStatement(queryString);
			    p.clearParameters();
			    p.setInt(1, userId);
			    p.setString(2, first);
			    p.setString(3, last);
			    p.setString(4, phoneNumber);
			    p.setString(5, username);
			    p.setString(6, password);
			    p.setString(7, email);
			    p.setInt(8, adminId);

			    int resultInt = p.executeUpdate();
			    
			   
		p.close();
		
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		
	
	
	
}
	
	
}
		
  
 
  
  