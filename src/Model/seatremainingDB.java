package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;

import Connection.DBConnection;

public class seatremainingDB {
	public static seatremaining minusseats(String flight_class, int Total, int Flight_schedule_id) {
		try{
			if (flight_class.equals("first_class")) {
				Connection conn = DBConnection.getConnection(); 
				String sqlStr="UPDATE schedule SET first_class_capacity = first_class_capacity - ? WHERE first_class_capacity >= 0 AND flight_schedule_id = ?";
				PreparedStatement pstmt = conn.prepareStatement(sqlStr);
				pstmt.setInt(1, Total);
				pstmt.setInt(2, Flight_schedule_id);
				int rowsAffected = pstmt.executeUpdate();
				seatremaining b = new seatremaining(flight_class, Total, Flight_schedule_id, rowsAffected);
				return b;
			}
			else if (flight_class.equals("business_class")) {
				Connection conn = DBConnection.getConnection(); 
				String sqlStr="UPDATE schedule SET business_class_capacity = business_class_capacity - ? WHERE business_class_capacity >= 0 AND flight_schedule_id = ?";
				PreparedStatement pstmt = conn.prepareStatement(sqlStr);
				pstmt.setInt(1, Total);
				pstmt.setInt(2, Flight_schedule_id);
				int rowsAffected = pstmt.executeUpdate();
				seatremaining b = new seatremaining(flight_class, Total, Flight_schedule_id, rowsAffected);
				return b;
			}
			else if (flight_class.equals("economy_class")) {
				Connection conn = DBConnection.getConnection(); 
				String sqlStr="UPDATE schedule SET economy_class_capacity = economy_class_capacity - ? WHERE economy_class_capacity >= 0 AND flight_schedule_id = ?";
				PreparedStatement pstmt = conn.prepareStatement(sqlStr);
				pstmt.setInt(1, Total);
				pstmt.setInt(2, Flight_schedule_id);
				int rowsAffected = pstmt.executeUpdate();
				seatremaining b = new seatremaining(flight_class, Total, Flight_schedule_id, rowsAffected);
				return b;
			}
			else {
				return null;
			}
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
