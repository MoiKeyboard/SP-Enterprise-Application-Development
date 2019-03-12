package Model;

import Connection.*;


import java.sql.*;
import java.util.ArrayList;

public class CreateBookingDb {
	public static rowsBooking createBooking(int Flight_schedule_id, String Date_of_flight, String Aircraft_flight_number, int Adults, int Children, int Total, double Totalcost, String oldname) {
		try{
			Connection conn = DBConnection.getConnection(); 
			String sqlStr="INSERT INTO bookings VALUES (null,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setInt(1, Flight_schedule_id);
			pstmt.setString(2, Date_of_flight);
			pstmt.setString(3, Aircraft_flight_number);
			pstmt.setInt(4, Adults);
			pstmt.setInt(5, Children);
			pstmt.setInt(6, Total);
			pstmt.setDouble(7, Totalcost);
			pstmt.setString(8, oldname);
			int rowsAffected = pstmt.executeUpdate();
			rowsBooking b = new rowsBooking(Flight_schedule_id, Date_of_flight, Aircraft_flight_number, Adults, Children, Total, Totalcost, rowsAffected);
			return b;
//			if (rowsAffected == 0) {
//				
//				JOptionPane.showMessageDialog(null,
//		                "Database not affected!",
//		                "Error",
//		                JOptionPane.ERROR_MESSAGE);
//				response.sendRedirect("index.jsp");
//			} else {
//				JOptionPane.showMessageDialog(null, "Database affected! "+rowsAffected+" row(s) affected.");
//				response.sendRedirect("planeUpdateDelete.jsp");
//			}
//			
		}catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}
