package amlyp.companyDB;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.text.*;
import oracle.sql.TIMESTAMP;

public class Items implements Serializable{
 private int itemId;
 private String itemName;
 private int userId; 
 private String description; 
 private double startPrice;
 private String auctionStartDate;
 private String auctionEndDate;
 private String category;

 
 public Items(){
  
 }
 
 public Items(int itemId, String itemName, int userId, String description, double startPrice, String auctionStartDate, String auctionEndDate, String category) {
  this.itemId = itemId; 
  this.itemName = itemName; 
  this.userId = userId; 
  this.description = description;
  this.startPrice = startPrice;
  this.auctionStartDate = auctionStartDate;
  this.auctionEndDate = auctionEndDate;
  this.category = category;
 }
 
 public Items(int itemId, String itemName,String category,  String auctionStartDate, String auctionEndDate, double startPrice, String description) {
  this.itemId = itemId; 
  this.itemName = itemName; 
  this.startPrice = startPrice;
  this.auctionStartDate = auctionStartDate;
  this.auctionEndDate = auctionEndDate;
  this.category = category;
  this.description = description;
 }
 
 
 public int getItemId() {
  return itemId;
 }
 
 public void setItemId(int itemId) {
  this.itemId = itemId;
 }
 
 public String getItemName() {
  return itemName;
 }
 
 public void setItemName(String itemName) {
  this.itemName = itemName;
 }
 
 public int getUserId() {
  return userId;
 }
 
 public void setUserId(int userId) {
  this.userId = userId;
 }
 
 public String getDescription() {
  return description;
 }
 
 public void setDescription(String description) {
  this.description = description;
 }
 
 public double getStartPrice() {
  return startPrice;
 }
 public void setStartPrice(double startPrice) {
  this.startPrice = startPrice;
 }
 
 public String getAuctionStartDate() {
  return auctionStartDate;
 }
 
 public void setAuctionStartDate(String auctionStartDate) {
  this.auctionStartDate = auctionStartDate;
 }
 
 public String getAuctionEndDate() {
  return auctionEndDate;
 }
 
 public void setAuctionEndDate(String auctionEndDate) {
  this.auctionEndDate = auctionEndDate;
 }
 
 public String getCategory() {
  return category;
 }
 
 public void setCategory(String category) {
  this.category = category;
 }
 
 public void setInfo(int itemID){
  Connection con = DBConnection.openDBConection();
  Statement stmt;
     
  try {
   stmt = con.createStatement();
   String queryString = "Select * FROM TEAM7.TEAM7_ITEM T where T.ITEM_ID = '" + itemID +"'";
   ResultSet result = stmt.executeQuery(queryString);
       
      if(result.next()){    
       this.setItemId(itemID);
       this.setItemName(result.getString("ITEM_NAME"));
       this.setUserId(result.getInt("USER_ID"));
       this.setDescription(result.getString("DESCRIPTION"));
       this.setStartPrice(result.getDouble("START_PRICE"));
       this.setAuctionStartDate(result.getString("AUCTION_START_TIME"));
       this.setAuctionEndDate(result.getString("AUCTION_END_TIME"));
       this.setCategory(result.getString("CATEGORY"));
      }     
  }
  catch(Exception e){ 
  }
 }
 
 public boolean onAuction(int itemID){
   Connection con = DBConnection.openDBConection();
   Statement stmt;
     
   try {
    stmt = con.createStatement();
    String queryString = "Select team7_checkstatus("+itemID+") from dual";
    ResultSet result = stmt.executeQuery(queryString); 
    if(result.next()){ 
        String compare =   result.getString(1);
        System.out.println("!!!!!!!!!!!!!!!" + compare);
        if(compare.equals("NOT ON AUCTION")){
         return false ; 
        }
        else {
         return true; 
        } 
       }
  
   }
   catch(Exception e){
   }
   return false;
 }
 
 public double  findCurrentWinning(int itemID){
  
   Connection con = DBConnection.openDBConection();
   Statement stmt;
   try {
   stmt = con.createStatement();
   String queryString = "Select findCurrentBid("+itemID+") from dual";
   ResultSet result = stmt.executeQuery(queryString);
   if(result.next()){ 
       return  result.getInt(1);
        
      }
   }
   catch(Exception e){
   }
  return 0;
 }
 
 public String  findStatus(int itemID){
  
   Connection con = DBConnection.openDBConection();
   Statement stmt;
   try {
   stmt = con.createStatement();
   String queryString = "Select team7_checkstatus("+itemID+") from dual";
   ResultSet result = stmt.executeQuery(queryString);
      if(result.next()){ 
       return  result.getString(1);     
      }
   }
   catch(Exception e){
    
   }
  return ""; 
 }
 
 public String getWinningBidder(int itemID){
  
   Connection con = DBConnection.openDBConection();
   Statement stmt;
    
   try {
   stmt = con.createStatement();
   String queryString = "Select USERNAME from TEAM7_USER U, TEAM7_BID B  WHERE U.USER_ID = B.USER_ID AND MAX_BID = (SELECT MAX(MAX_BID) FROM TEAM7_BID where ITEM_ID = '"+itemID+"' ) ";
   System.out.println(queryString);
   ResultSet result = stmt.executeQuery(queryString);
   if(result.next()){    
       return  result.getString(1); 
      }
  
   }
   catch(Exception e){
   }
  return ""; 
 
 }
 
 public String getSellerName(int itemID){
  Connection con = DBConnection.openDBConection();
  Statement stmt;
    
  try {
   stmt = con.createStatement();
   String queryString = "Select u.USERNAME from TEAM7_USER u, TEAM7_ITEM i where ITEM_ID ="+itemID+ " and u.USER_ID=I.USER_ID";
      ResultSet result = stmt.executeQuery(queryString);
     
      if(result.next()){ 
       return  result.getString(1); 
      }

  }
  catch(Exception e){
  }
  
  return ""; 
  
 }
 
 public String getSellerEmail(int itemID){
  Connection con = DBConnection.openDBConection();
  Statement stmt;
    
  try {
   stmt = con.createStatement();
   String queryString = "Select u.EMAIL from TEAM7_USER u, TEAM7_ITEM i where ITEM_ID ="+itemID+ " and u.USER_ID=I.USER_ID";
      ResultSet result = stmt.executeQuery(queryString);
     
      if(result.next()){
       return  result.getString(1);
      }   
  }
  catch(Exception e){
  }
  return ""; 
 }
  
public ArrayList<Items> searchForItems(String search){
 
 Connection myConnection = DBConnection.openDBConection(); 
    Statement stmt;
 try {
  stmt = myConnection.createStatement();
  String queryStringUser = "Select * from TEAM7.TEAM7_ITEM I WHERE SOUNDEX('"+search+"') = SOUNDEX(I.ITEM_NAME) OR I.ITEM_NAME LIKE '%" + search+ "%' OR  I.ITEM_ID LIKE '%" + search+ "%' OR I.DESCRIPTION LIKE '%" + search+ "%' ";
  ResultSet result = stmt.executeQuery(queryStringUser);
  ArrayList<Items> returnValue = new ArrayList<Items>();
  while(result.next()){
      Items it = new Items(result.getInt("ITEM_ID"), result.getString("ITEM_NAME"), result.getString("CATEGORY"),result.getString("AUCTION_START_TIME"), result.getString("AUCTION_END_TIME"), result.getDouble("START_PRICE"), result.getString("DESCRIPTION"));
   returnValue.add(it);
  }
   return returnValue; 
  }
  catch(Exception e){
  System.out.println("Did not work"); 
  }
  return null; 
 }

 public void placeBid(int itemId, int customerId, Timestamp timeStamp, double bid){
  Connection myConnection = DBConnection.openDBConection(); 
  Statement stmt;
  try {
   stmt = myConnection.createStatement();
   
   String queryString = "INSERT into TEAM7.TEAM7_BID values (?,?, ?, ?)";
   PreparedStatement p = myConnection.prepareStatement(queryString);
   p.clearParameters();
   p.setInt(1, itemId);
   p.setInt(2, customerId);
   
//   SimpleDateFormat timeStamp2 = new SimpleDateFormat("yyyy-mm-dd");
//
//   String s = timeStamp2.format(new java.util.Date());
   SimpleDateFormat form = new SimpleDateFormat("yyyy-mmm-dd");
	java.util.Date d = form.parse(timeStamp.toString());

	java.sql.Date timeS=new java.sql.Date(d.getTime());
	
	
   p.setDate(3, timeS);
   p.setDouble(4, bid);

   boolean resultInt = p.execute(); 		   
   p.close();
  }
  catch(Exception e){ 
   e.printStackTrace();   
  }
 }
 
 
	
 public ArrayList<Items> getItemsBidOn(int userID){
 
 Connection myConnection = DBConnection.openDBConection(); 
    Statement stmt;
 try {
  stmt = myConnection.createStatement();
  String queryStringUser = "Select DISTINCT I.ITEM_ID, I.ITEM_NAME, I.USER_ID, I.DESCRIPTION, I.START_PRICE, I.AUCTION_START_TIME, I.AUCTION_END_TIME, I.CATEGORY from TEAM7.TEAM7_ITEM I, TEAM7_BID B WHERE B.ITEM_ID = I.ITEM_ID AND B.USER_ID = '"+userID+"' ORDER BY I.ITEM_ID";
  ResultSet result = stmt.executeQuery(queryStringUser);
  ArrayList<Items> returnValue = new ArrayList<Items>();
  while(result.next()){
      Items it = new Items(result.getInt("ITEM_ID"), result.getString("ITEM_NAME"), result.getString("CATEGORY"),result.getString("AUCTION_START_TIME"), result.getString("AUCTION_END_TIME"), result.getDouble("START_PRICE"), result.getString("DESCRIPTION"));
   returnValue.add(it);
  }
   return returnValue; 
  }
  catch(Exception e){
  System.out.println("Did not work"); 
  }
  return null; 
 }
 
 public void addItem(int itemId, String itemName, int userId, String description, double startPrice, String auctionStart, String auctionEnd, String category) throws ParseException{
		
	  Connection con = DBConnection.openDBConection();
	  Statement stmt;
		try {
			stmt = con.createStatement();
			String queryString = "INSERT into TEAM7.TEAM7_ITEM values (?,?,?,?,?,?,?,?)";
			
			System.out.println("INSERT into TEAM7.TEAM7_ITEM values ("+itemId+","+itemName+", "+userId+", "+description+", "+startPrice+","+auctionStart+"," +auctionEnd+","+category+")");
			    PreparedStatement p = con.prepareStatement(queryString);
			    p.clearParameters();
			    p.setInt(1, itemId);
			    p.setString(2, itemName);
			    p.setInt(3, userId);
			    p.setString(4, description);
			    p.setDouble(5, startPrice);
			    
			    
			
//				java.util.Date startdate= new java.util.Date();
//				java.sql.Date startsqldate=new java.sql.Date(startdate.getTime());
//				
				
				SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
				java.util.Date date = format.parse(auctionStart.substring(0,10));
				
				java.sql.Date startsqldate=new java.sql.Date(date.getTime());
			
			    p.setDate(6, startsqldate);
			    
			   // DateFormat dateform2= new SimpleDateFormat("yyyy-mm-dd");
				//Date enddate= (Date) dateform2.parse(auctionEnd);
	
			    
			    
				SimpleDateFormat format2 = new SimpleDateFormat("MM/dd/yyyy");
				System.out.println(auctionEnd.toString());
				java.util.Date date2 = format2.parse(auctionEnd.substring(0,10));
				
				java.sql.Date endsqldate=new java.sql.Date(date2.getTime());
			
			    p.setDate(7, endsqldate);
			    System.out.println(endsqldate.toString());
			    System.out.println("date 2" + date2.toString());

			    p.setString(8, category);

			    int resultInt = p.executeUpdate(); 		   
		p.close();
		
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}

 }
 
 public int  getMaxId(){
		
	  Connection con = DBConnection.openDBConection();
	  Statement stmt;
	  try {
			stmt = con.createStatement();
			String queryString = "SELECT MAX(I.ITEM_ID)+1 FROM TEAM7.TEAM7_ITEM I";
			    
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
 
 public ArrayList<Items> getItemsPurchased(int userId){
	
	 Connection myConnection = DBConnection.openDBConection(); 
	    Statement stmt;
	 try {
		 
		 
	  stmt = myConnection.createStatement();
	  String queryStringUser = "Select I.ITEM_ID, I.ITEM_NAME,I.CATEGORY, I.AUCTION_START_TIME, I.AUCTION_END_TIME, I.START_PRICE,U.USER_NAME, U.EMAIL "
	  		+ "from TEAM7.TEAM7_ITEM I, TEAM7_BID B, TEAM7_USER U, TEAM7_SELLER S"
	  		+ "WHERE U.USER_ID = '"+userId+"' AND I.USER_ID =  S.USER_ID AND B.MAX_BID = MAX(MAX_BID) AND B.USER_ID = U.USER_ID";
	  
	 // Select I.ITEM_ID, I.ITEM_NAME,I.CATEGORY, I.AUCTION_START_TIME, I.AUCTION_END_TIME, I.START_PRICE,S2.USERNAME, S2.EMAIL 
	//	 from TEAM7.TEAM7_ITEM I, TEAM7_BID B, TEAM7_USER U, TEAM7_SELLER S , TEAM7_USER S2
	//	 WHERE U.USER_ID = 1 AND I.USER_ID =  S.USER_ID  AND B.USER_ID = U.USER_ID AND S.USER_ID = I.USER_ID AND I.ITEM_ID = B.ITEM_ID
  
  //GROUP BY I.ITEM_ID, I.ITEM_NAME, I.CATEGORY, I.AUCTION_START_TIME, I.AUCTION_END_TIME, I.START_PRICE,S2.USERNAME, S2.EMAIL 
 
	  
	  
	  ResultSet result = stmt.executeQuery(queryStringUser);
	  ArrayList<Items> returnValue = new ArrayList<Items>();
	  while(result.next()){
	      Items it = new Items(result.getInt("ITEM_ID"), result.getString("ITEM_NAME"), result.getString("CATEGORY"),result.getString("AUCTION_START_TIME"), result.getString("AUCTION_END_TIME"), result.getDouble("START_PRICE"), result.getString("DESCRIPTION"));
	   returnValue.add(it);
	  }
	   return returnValue; 
	  }
	  catch(Exception e){
	  System.out.println("Did not work"); 
	  }
	 
	 
	 
	 
	 return null;
	 
	 
 }
 
 public ArrayList<Items> advanceSearch(String itemId,String keyword,String category,String bidLow,String bidUpper, String timeLow,String timeUpper){
	
	 
	 String nothing = "";
	 
	 System.out.println(category + keyword + itemId + bidLow + bidUpper + timeLow + timeUpper);
	 
	 
	 if(!(keyword.equals(""))&& !(category.equals(""))&& !(bidLow.equals(""))&& !(bidUpper.equals(""))&& !(timeLow.equals(""))&& !(timeUpper.equals(""))){
		
	
		
		 Connection myConnection = DBConnection.openDBConection(); 
		    Statement stmt;
		 try {
			 
		
			 
		  stmt = myConnection.createStatement();
		  String queryStringUser = "Select * "
			  		+ "from TEAM7.TEAM7_ITEM I"
			  		+ " WHERE (I.DESCRIPTION LIKE '%"+ keyword+"%' OR 	I.ITEM_NAME LIKE '%"+ keyword+"%')	AND I.CATEGORY = '"+category+"' AND I.START_PRICE BETWEEN  '" +bidLow+"' AND '"+bidUpper+"'    AND I.AUCTION_START_TIME BETWEEN  '" +timeLow+"' AND '"+timeUpper+"'AND I.AUCTION_END_TIME BETWEEN  '" +timeLow+"' AND '"+timeUpper+"'";
		  		System.out.println(queryStringUser);		
		  
	
		  
		  
		  ResultSet result = stmt.executeQuery(queryStringUser);
		  ArrayList<Items> returnValue = new ArrayList<Items>();
		  while(result.next()){
		      Items it = new Items(result.getInt("ITEM_ID"), result.getString("ITEM_NAME"), result.getString("CATEGORY"),result.getString("AUCTION_START_TIME"), result.getString("AUCTION_END_TIME"), result.getDouble("START_PRICE"), result.getString("DESCRIPTION"));
		   returnValue.add(it);
		  }
		   return returnValue; 
		  }
		  catch(Exception e){
		  System.out.println("Did not work"); 
		  } 
		 
		 
	 }
	 
	 
	 
	 
	 
	 if(!(keyword.equals(""))&&  !(bidLow.equals(""))&& !(bidUpper.equals(""))&& !(timeLow.equals(""))&& !(timeUpper.equals(""))){
		
	
		
		 Connection myConnection = DBConnection.openDBConection(); 
		    Statement stmt;
		 try {
			 
		
			 
		  stmt = myConnection.createStatement();
		  String queryStringUser = "Select * "
			  		+ "from TEAM7.TEAM7_ITEM I"
			  		+ " WHERE (I.DESCRIPTION LIKE '%"+ keyword+"%' OR 	I.ITEM_NAME LIKE '%"+ keyword+"%')	AND I.START_PRICE BETWEEN  '" +bidLow+"' AND '"+bidUpper+"'    AND I.AUCTION_START_TIME BETWEEN  '" +timeLow+"' AND '"+timeUpper+"'AND I.AUCTION_END_TIME BETWEEN  '" +timeLow+"' AND '"+timeUpper+"'";
		  		System.out.println(queryStringUser);		
		  
	
		  
		  
		  ResultSet result = stmt.executeQuery(queryStringUser);
		  ArrayList<Items> returnValue = new ArrayList<Items>();
		  while(result.next()){
		      Items it = new Items(result.getInt("ITEM_ID"), result.getString("ITEM_NAME"), result.getString("CATEGORY"),result.getString("AUCTION_START_TIME"), result.getString("AUCTION_END_TIME"), result.getDouble("START_PRICE"), result.getString("DESCRIPTION"));
		   returnValue.add(it);
		  }
		   return returnValue; 
		  }
		  catch(Exception e){
		  System.out.println("Did not work"); 
		  } 
		 
		 
	 }
	 if(!(keyword.equals(""))&& !(category.equals(""))&& !(timeLow.equals(""))&& !(timeUpper.equals(""))){
			
			
			
		 Connection myConnection = DBConnection.openDBConection(); 
		    Statement stmt;
		 try {
			 
		
			 
		  stmt = myConnection.createStatement();
		  String queryStringUser = "Select * "
			  		+ "from TEAM7.TEAM7_ITEM I"
			  		+ " WHERE (I.DESCRIPTION LIKE '%"+ keyword+"%' OR 	I.ITEM_NAME LIKE '%"+ keyword+"%')	AND I.CATEGORY = '"+category+"' AND  I.AUCTION_START_TIME BETWEEN  '" +timeLow+"' AND '"+timeUpper+"'AND I.AUCTION_END_TIME BETWEEN  '" +timeLow+"' AND '"+timeUpper+"'";
		  		System.out.println(queryStringUser);		
		  
	
		  
		  
		  ResultSet result = stmt.executeQuery(queryStringUser);
		  ArrayList<Items> returnValue = new ArrayList<Items>();
		  while(result.next()){
		      Items it = new Items(result.getInt("ITEM_ID"), result.getString("ITEM_NAME"), result.getString("CATEGORY"),result.getString("AUCTION_START_TIME"), result.getString("AUCTION_END_TIME"), result.getDouble("START_PRICE"), result.getString("DESCRIPTION"));
		   returnValue.add(it);
		  }
		   return returnValue; 
		  }
		  catch(Exception e){
		  System.out.println("Did not work"); 
		  } 
		 
		 
	 }
	 
	 if(!(keyword.equals(""))&& !(category.equals(""))&& !(bidLow.equals(""))&& !(bidUpper.equals(""))){
			
			
			
		 Connection myConnection = DBConnection.openDBConection(); 
		    Statement stmt;
		 try {
			 
		
			 
		  stmt = myConnection.createStatement();
		  String queryStringUser = "Select * "
			  		+ "from TEAM7.TEAM7_ITEM I"
			  		+ " WHERE (I.DESCRIPTION LIKE '%"+ keyword+"%' OR 	I.ITEM_NAME LIKE '%"+ keyword+"%')	AND I.CATEGORY = '"+category+"' AND I.START_PRICE BETWEEN  '" +bidLow+"' AND '"+bidUpper+"' ";
		  		System.out.println(queryStringUser);		
		  
	
		  
		  
		  ResultSet result = stmt.executeQuery(queryStringUser);
		  ArrayList<Items> returnValue = new ArrayList<Items>();
		  while(result.next()){
		      Items it = new Items(result.getInt("ITEM_ID"), result.getString("ITEM_NAME"), result.getString("CATEGORY"),result.getString("AUCTION_START_TIME"), result.getString("AUCTION_END_TIME"), result.getDouble("START_PRICE"), result.getString("DESCRIPTION"));
		   returnValue.add(it);
		  }
		   return returnValue; 
		  }
		  catch(Exception e){
		  System.out.println("Did not work"); 
		  } 
		 
		 
	 }
	 
	 
	 if(!(keyword.equals(""))&& !(timeLow.equals(""))&& !(timeUpper.equals(""))){
		
	
		
		 Connection myConnection = DBConnection.openDBConection(); 
		    Statement stmt;
		 try {
			 
		
			 
		  stmt = myConnection.createStatement();
		  String queryStringUser = "Select * "
			  		+ "from TEAM7.TEAM7_ITEM I"
			  		+ " WHERE (I.DESCRIPTION LIKE '%"+ keyword+"%' OR 	I.ITEM_NAME LIKE '%"+ keyword+"%')	 AND I.AUCTION_START_TIME BETWEEN  '" +timeLow+"' AND '"+timeUpper+"'AND I.AUCTION_END_TIME BETWEEN  '" +timeLow+"' AND '"+timeUpper+"'";
		  		System.out.println(queryStringUser);		
		  
	
		  
		  
		  ResultSet result = stmt.executeQuery(queryStringUser);
		  ArrayList<Items> returnValue = new ArrayList<Items>();
		  while(result.next()){
		      Items it = new Items(result.getInt("ITEM_ID"), result.getString("ITEM_NAME"), result.getString("CATEGORY"),result.getString("AUCTION_START_TIME"), result.getString("AUCTION_END_TIME"), result.getDouble("START_PRICE"), result.getString("DESCRIPTION"));
		   returnValue.add(it);
		  }
		   return returnValue; 
		  }
		  catch(Exception e){
		  System.out.println("Did not work"); 
		  } 
		 
		 
	 }
	 
	 
	 if(!(keyword.equals("")) && !(timeLow.equals(""))&& !(timeUpper.equals(""))){
		
	
		
		 Connection myConnection = DBConnection.openDBConection(); 
		    Statement stmt;
		 try {
			 
		
			 
		  stmt = myConnection.createStatement();
		  String queryStringUser = "Select * "
			  		+ "from TEAM7.TEAM7_ITEM I"
			  		+ " WHERE (I.DESCRIPTION LIKE '%"+ keyword+"%' OR 	I.ITEM_NAME LIKE '%"+ keyword+"%') AND I.AUCTION_START_TIME BETWEEN  '" +timeLow+"' AND '"+timeUpper+"'AND I.AUCTION_END_TIME BETWEEN  '" +timeLow+"' AND '"+timeUpper+"'";
		  		System.out.println(queryStringUser);		
		  
	
		  
		  
		  ResultSet result = stmt.executeQuery(queryStringUser);
		  ArrayList<Items> returnValue = new ArrayList<Items>();
		  while(result.next()){
		      Items it = new Items(result.getInt("ITEM_ID"), result.getString("ITEM_NAME"), result.getString("CATEGORY"),result.getString("AUCTION_START_TIME"), result.getString("AUCTION_END_TIME"), result.getDouble("START_PRICE"), result.getString("DESCRIPTION"));
		   returnValue.add(it);
		  }
		   return returnValue; 
		  }
		  catch(Exception e){
		  System.out.println("Did not work"); 
		  } 
		 
		 
	 }
	 
	 
	 if(!(keyword.equals(""))&& !(category.equals(""))){
		
	
		
		 Connection myConnection = DBConnection.openDBConection(); 
		    Statement stmt;
		 try {
			 
		
			 
		  stmt = myConnection.createStatement();
		  String queryStringUser = "Select * "
			  		+ "from TEAM7.TEAM7_ITEM I"
			  		+ " WHERE (I.DESCRIPTION LIKE '%"+ keyword+"%' OR 	I.ITEM_NAME LIKE '%"+ keyword+"%')	AND I.CATEGORY = '"+category+"'";
		  		System.out.println(queryStringUser);		
		  
	
		  
		  
		  ResultSet result = stmt.executeQuery(queryStringUser);
		  ArrayList<Items> returnValue = new ArrayList<Items>();
		  while(result.next()){
		      Items it = new Items(result.getInt("ITEM_ID"), result.getString("ITEM_NAME"), result.getString("CATEGORY"),result.getString("AUCTION_START_TIME"), result.getString("AUCTION_END_TIME"), result.getDouble("START_PRICE"), result.getString("DESCRIPTION"));
		   returnValue.add(it);
		  }
		   return returnValue; 
		  }
		  catch(Exception e){
		  System.out.println("Did not work"); 
		  } 
		 
		 
	 }
	 if(!(keyword.equals(""))){
			
			
			
		 Connection myConnection = DBConnection.openDBConection(); 
		    Statement stmt;
		 try {
			 
		
			 
		  stmt = myConnection.createStatement();
		  String queryStringUser = "Select * "
			  		+ "from TEAM7.TEAM7_ITEM I"
			  		+ " WHERE SOUNDEX(I.ITEM_NAME) = SOUNDEX('"+ keyword +"' ) ";
		  		System.out.println(queryStringUser);		
		  

		  
		  
		  ResultSet result = stmt.executeQuery(queryStringUser);
		  ArrayList<Items> returnValue = new ArrayList<Items>();
		  while(result.next()){
		      Items it = new Items(result.getInt("ITEM_ID"), result.getString("ITEM_NAME"), result.getString("CATEGORY"),result.getString("AUCTION_START_TIME"), result.getString("AUCTION_END_TIME"), result.getDouble("START_PRICE"), result.getString("DESCRIPTION"));
		   returnValue.add(it);
		  }
		   return returnValue; 
		  }
		  catch(Exception e){
		  System.out.println("Did not work"); 
		  } 

	 }
	 
	 
	 if(!(keyword.equals(""))){
		
	
		
		 Connection myConnection = DBConnection.openDBConection(); 
		    Statement stmt;
		 try {
			 
		
			 
		  stmt = myConnection.createStatement();
		  String queryStringUser = "Select * "
			  		+ "from TEAM7.TEAM7_ITEM I"
			  		+ " WHERE (I.DESCRIPTION LIKE '%"+ keyword+"%' OR 	I.ITEM_NAME LIKE '%"+ keyword+"%')";
		  		System.out.println(queryStringUser);		
		  
	
		  
		  
		  ResultSet result = stmt.executeQuery(queryStringUser);
		  ArrayList<Items> returnValue = new ArrayList<Items>();
		  while(result.next()){
		      Items it = new Items(result.getInt("ITEM_ID"), result.getString("ITEM_NAME"), result.getString("CATEGORY"),result.getString("AUCTION_START_TIME"), result.getString("AUCTION_END_TIME"), result.getDouble("START_PRICE"), result.getString("DESCRIPTION"));
		   returnValue.add(it);
		  }
		   return returnValue; 
		  }
		  catch(Exception e){
		  System.out.println("Did not work"); 
		  } 
		 
		 
	 }
	 
	 
	 if(!(itemId.equals(""))){
		
	
		
		 Connection myConnection = DBConnection.openDBConection(); 
		    Statement stmt;
		 try {
			 
		
			 
		  stmt = myConnection.createStatement();
		  String queryStringUser = "Select * "
			  		+ "from TEAM7.TEAM7_ITEM I"
			  		+ " WHERE I.ITEM_ID = '" + itemId +"'";
		  		System.out.println(queryStringUser);		
		  
	
		  
		  
		  ResultSet result = stmt.executeQuery(queryStringUser);
		  ArrayList<Items> returnValue = new ArrayList<Items>();
		  while(result.next()){
		      Items it = new Items(result.getInt("ITEM_ID"), result.getString("ITEM_NAME"), result.getString("CATEGORY"),result.getString("AUCTION_START_TIME"), result.getString("AUCTION_END_TIME"), result.getDouble("START_PRICE"), result.getString("DESCRIPTION"));
		   returnValue.add(it);
		  }
		   return returnValue; 
		  }
		  catch(Exception e){
		  System.out.println("Did not work"); 
		  } 
		 
		 
	 }
	 
	
	 	return null;
 }


 
public boolean hasFeedback(int itemId){
	

	
	 Connection myConnection = DBConnection.openDBConection(); 
	    Statement stmt;
	 try {
		 
	
		 
	  stmt = myConnection.createStatement();
	  String queryStringUser = "Select * "
		  		+ "from TEAM7.TEAM7_LEAVE_FEEDBACK I"
		  		+ " WHERE I.ITEM_ID = '"+itemId+"'";
	  		System.out.println(queryStringUser);		
	  
	        ResultSet result = stmt.executeQuery(queryStringUser);

	  
	  
	 	  if(result.next()){
	      return true ; 
	  }
	 	  else {
	 		  
	 		  return false; 
	 	  }
	   
	  }
	  catch(Exception e){
	  System.out.println("Did not work"); 
	  }
	return false; 
	
	
	 
 }

}

 