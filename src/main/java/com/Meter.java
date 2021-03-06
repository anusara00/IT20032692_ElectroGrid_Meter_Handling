package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Meter {
private Connection connect(){ 
		
		Connection con = null; 
		
		try{ 
				Class.forName("com.mysql.jdbc.Driver"); 

				//Provide the correct details: DBServer/DBName, username, password 
				//DB Connection
				con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/meterdatabase", "root", ""); 
		} 
		catch (Exception e) {
			e.printStackTrace();
			} 
		
		return con; 
} 

//Insert Function
public String insertMeter(String accno, String cusname, String units, String totamount){ 

	String output = ""; 
	
	try
	{ 
		Connection con = connect(); 
		
		if (con == null) 
		{
			return "Error while connecting to the database for inserting."; 
			
		} 
		// create a prepared statement
		
		String query = " insert into meters (`MeterID`,`AccountNo`,`Cus_name`,`Units`,`Total_amount`)"+" values (?, ?, ?, ?, ?)"; 
		PreparedStatement preparedStmt = con.prepareStatement(query); 
		// binding values
		preparedStmt.setInt(1, 0); 
		preparedStmt.setString(2, accno); 
		preparedStmt.setString(3, cusname); 
		preparedStmt.setString(4, units); 
		preparedStmt.setString(5, totamount); 
		// execute the statement

		preparedStmt.execute(); 
		con.close(); 
		
		String newMeters = readMeters(); 
		output = "{\"status\":\"success\",\"data\":\""+newMeters+"\"}";
	} 
	
	catch (Exception e) 
	{ 
		output = "{\"status\":\"error\", \"data\":\"Error while inserting the Meter.\"}"; 
		System.err.println(e.getMessage()); 
	} 
	return output; 
} 


//Read Function
public String readMeters(){ 

	String output = ""; 
	
	try{ 
			Connection con = connect(); 
			if (con == null){
				
				return "Error while connecting to the database for reading."; 
				
				} 
			// Prepare the html table to be displayed
			output = "<table border=\"1\" class=\"table\"><tr><th>AccountNo</th>" +
					"<th>Cus_name</th><th>Units</th>" + 
					"<th>Total_amount</th>" +
					"<th>Update</th><th>Remove</th></tr>"; 

			String query = "select * from meters"; 
			Statement stmt = con.createStatement(); 
			ResultSet rs = stmt.executeQuery(query); 
			// iterate through the rows in the result set
			while (rs.next()) 
			{ 
					String MeterID = Integer.toString(rs.getInt("MeterID")); 
					String AccountNo = rs.getString("AccountNo"); 
					String Cus_name = rs.getString("Cus_name"); 
					String Units = rs.getString("Units"); 
					String Total_amount = rs.getString("Total_amount"); 
					// Add into the html table
					output += "<tr><td><input id='hidMeterIDUpdate' name='hidMeterIDUpdate' type='hidden' value='"+MeterID+"'>"+AccountNo+"</td>"; 
					output += "<td>" + Cus_name + "</td>"; 
					output += "<td>" + Units + "</td>"; 
					output += "<td>" + Total_amount + "</td>"; 
					// buttons
					 output += "<td><input name='btnUpdate' type='button' value='Update' "
							 + "class='btnUpdate btn btn-secondary' data-meterid='" + MeterID + "'></td>"
							 + "<td><input name='btnRemove' type='button' value='Remove' "
							 + "class='btnRemove btn btn-danger' data-meterid='" + MeterID + "'></td></tr>"; 
			} 
				con.close(); 
				// Complete the html table
				output += "</table>"; 
		} 
		catch (Exception e){ 
					output = "Error while reading the items."; 
					System.err.println(e.getMessage()); 
		} 
		return output; 
		} 


//Update Function
public String updateMeter(String ID, String accno, String cusname, String units, String totamount){ 

	String output = ""; 
	
	try{ 
			Connection con = connect(); 
			if (con == null){
				return "Error while connecting to the database for updating.";
				} 
			// create a prepared statement
			String query = "UPDATE meters SET AccountNo=?,Cus_name=?,Units=?,Total_amount=? WHERE MeterID=?"; 
			PreparedStatement preparedStmt = con.prepareStatement(query); 
			// binding values
			preparedStmt.setString(1, accno); 
			preparedStmt.setString(2, cusname); 
			preparedStmt.setString(3, units); 
			preparedStmt.setString(4, totamount); 
			preparedStmt.setInt(5, Integer.parseInt(ID)); 
			// execute the statement
			preparedStmt.execute(); 
			con.close(); 
			
			String newMeters = readMeters(); 
			output = "{\"status\":\"success\",\"data\":\""+newMeters+"\"}";
			
	} 
	
	catch (Exception e){ 
		
		output = "{\"status\":\"error\",\"data\":\"Error while updating the Meter.\"}"; 
		System.err.println(e.getMessage()); 
		
	} 
	
	return output; 
} 


//Delete Function
public String deleteMeter(String MeterID){ 

	String output = ""; 
	
	try{ 
		Connection con = connect(); 
		
		if (con == null){
			return "Error while connecting to the database for deleting."; 
			} 
		// create a prepared statement
		String query = "delete from meters where MeterID=?"; 
		PreparedStatement preparedStmt = con.prepareStatement(query); 
		// binding values
		preparedStmt.setInt(1, Integer.parseInt(MeterID)); 
		// execute the statement
		preparedStmt.execute(); 
		con.close(); 
		
		String newMeters = readMeters(); 
		 output = "{\"status\":\"success\",\"data\":\""+newMeters+"\"}"; 
	} 
	
	catch (Exception e){ 
		output = "{\"status\":\"error\",\"data\":\"Error while deleting the Meter.\"}";
		System.err.println(e.getMessage()); 
	} 
	return output; 
} 


}
