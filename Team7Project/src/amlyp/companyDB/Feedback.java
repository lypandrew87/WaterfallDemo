package amlyp.companyDB;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class Feedback implements Serializable {
	private int satisfaction; 
	private int itemQuality; 
	private int itemId;
	private int userId; 
	private String username;
	private int deliveryRating; 
	private String comment;
	private String itemName;
	public Feedback(String itemName, String username, int itemId, int userId, int deliveryRating,String comment, int satisfaction, int itemquality) {
		this.itemName = itemName;
		this.username = username; 
		this.itemId = itemId; 
		this.userId = userId; 
		this.deliveryRating = deliveryRating; 
		this.comment = comment ; 
		this.satisfaction = satisfaction; 
		this.itemQuality = itemquality; 
	}
	
	public Feedback(){
		
		
	}
	
	public String getItemName(){
		return itemName; 
	}
	
	public String getUserName(){
		return username;
	}
	
	public int getItemId() {
		return itemId;
	}
	
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	
	public int getUserId() {
		return userId;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public int getDeliveryRating() {
		return deliveryRating;
	}
	
	public void setDeliveryRating(int deliveryRating) {
		this.deliveryRating = deliveryRating;
	}
	
	public String getComment() {
		return comment;
	}
	
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public int getSatisfaction() {
		return satisfaction;
	}
	
	public void setSatisfaction(int satisfaction) {
		this.satisfaction = satisfaction;
	}
	
	public int getItemQuality() {
		return itemQuality;
	}
	
	public void setItemQuality(int itemQuality) {
		this.itemQuality = itemQuality;
	} 
	
	
	
	public void insertFeedback( int itemId, int userId, int deliveryRating,String comment, int satisfaction, int itemquality){
		
		 Connection con = DBConnection.openDBConection();
		    Statement stmt;
			try {
				
				
				stmt = con.createStatement();
				
			
				String queryString = "INSERT into TEAM7.TEAM7_LEAVE_FEEDBACK values (?, ?,?,?,?,?)";
				
				System.out.println("INSERT into TEAM7.TEAM7_LEAVE_FEEDBACK values ('"+itemId+"','"+userId+"','"+deliveryRating+"','"+comment+"','"+satisfaction+"','"+itemquality+"')");
				
				System.out.println(comment);

				    PreparedStatement p = con.prepareStatement(queryString);
				    p.clearParameters();
				    p.setInt(1, itemId);
				    p.setInt(2, userId);
				    p.setInt(3, deliveryRating);
				    p.setString(4, comment);
				    p.setInt(5, satisfaction);
				    p.setInt(6, itemquality);
				    

				    int resultInt = p.executeUpdate();
				    
				   
			p.close();
			
			} 
			catch (SQLException e) {
				e.printStackTrace();
			}
			
		
		
		
		}
}
