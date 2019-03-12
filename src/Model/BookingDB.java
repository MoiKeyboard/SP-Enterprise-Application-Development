package Model;

import java.sql.*;



import java.util.ArrayList;

import Connection.DBConnection;

public class BookingDB {
	public static ArrayList<Booking> showBooking(String query) {
		try {
			Connection conn =   DBConnection.getConnection(); 
			String sqlStr="SELECT * FROM bookings WHERE aircraft_flight_number LIKE ?";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setString(1, "%"+query+"%");
			ResultSet rs = pstmt.executeQuery();
			ArrayList <Booking> al = new ArrayList<Booking>();
			while (rs.next()) {
				int bId=rs.getInt("booking_id");
				String afNo=rs.getString("aircraft_flight_number");
				String date_of_flight = rs.getString("date_of_flight");
				int fId=rs.getInt("flight_schedule_id");
				int no_of_adult = rs.getInt("adults");
				int no_of_children = rs.getInt("children");
				int total = rs.getInt("total");
				double totalcost = rs.getDouble("totalcost");
				String oldname = rs.getString("username");
				Booking b = new Booking(bId, fId, date_of_flight, afNo, no_of_adult, no_of_children, total, totalcost, oldname);
				al.add(b);
			}
			return al;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public static Booking updateBooking(int bId0) {
		try {
			Connection conn =   DBConnection.getConnection(); 
			String sqlStr="SELECT * FROM bookings WHERE booking_id=?";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setInt(1, bId0);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			int bId=rs.getInt("booking_id");
			String date_of_flight = rs.getString("date_of_flight");
			String aircraft_flight_number=rs.getString("aircraft_flight_number");
			int fId=rs.getInt("flight_schedule_id");
			int no_of_adult = rs.getInt("adults");
			int no_of_children = rs.getInt("children");
			int total = no_of_adult + no_of_children;
			double totalcost = rs.getDouble("totalcost");
			String oldname = rs.getString("username");
			Booking b = new Booking(bId, fId, date_of_flight, aircraft_flight_number, no_of_adult, no_of_children, total, totalcost, oldname);
			return b;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public static void deleteBooking(int bId0) {
		try {
			Connection conn =   DBConnection.getConnection(); 
			String sqlStr="DELETE FROM bookings WHERE booking_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setInt(1, bId0);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public static void commitBooking(int bId0, int adults0, int children0, int total0, int fId0) {
		try {
			Connection conn =   DBConnection.getConnection(); 
			String sqlStr0 = "UPDATE schedule SET flight_capacity = flight_capacity - ? WHERE flight_capacity >= 0 AND flight_schedule_id = ?";
			PreparedStatement pstmt0 = conn.prepareStatement(sqlStr0);
			pstmt0.setInt(1,total0);
			pstmt0.setInt(2,fId0);
			pstmt0.executeUpdate();
		
			String sqlStr="UPDATE bookings SET adults=?, children=? where booking_id=?";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setInt(1, adults0);
			pstmt.setInt(2, children0);
			pstmt.setInt(3, bId0);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
