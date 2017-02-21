package amlyp.companyDB;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.*;

public class Bid implements Serializable{
 private int itemId;
 private int userId; 
 private Timestamp timestamp; 
 private double maxBid;

 
 public Bid(){
  
 }
 
 public Bid(int itemId, int userId, Timestamp timestamp, double maxBid) {
  this.itemId = itemId; 
  this.userId = userId; 
  this.timestamp = timestamp;
  this.maxBid = maxBid;
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
 
 public void setTimestamp(Timestamp timestamp) {
  this.timestamp = timestamp;
 }
 
 public double getMaxBid() {
  return maxBid;
 }
 
 public void setMaxBid(double maxBid) {
  this.maxBid = maxBid;
 }
 
 public ResultSet getAllBids(int itemID){ 
	  ResultSet rs = null;
	  
	  try {
	    Connection myConnection = DBConnection.openDBConection(); 
        Statement stmt= myConnection.createStatement();
	    String queryStringUser = "Select b.time_stamp, u.username, b.max_bid from TEAM7_BID b, TEAM7_USER u where b.item_id = " + itemID + " AND u.user_id = b.user_id ORDER BY b.time_stamp";

	    rs = stmt.executeQuery(queryStringUser);
	  }
	  catch(Exception e){
		  
	  }
	  return rs; 
 	}
}
 
