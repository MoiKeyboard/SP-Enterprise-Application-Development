package Model;

import Connection.*;

import java.sql.*;
import java.util.ArrayList;

import Connection.DBConnection;

public class CreateCustomerDB {
	public static ArrayList<retrievebooking_id> createCustomer(int Arraysize) {
		try{
			Connection conn = DBConnection.getConnection(); 
			String sqlStr="SELECT booking_id FROM bookings order by booking_id desc LIMIT ?";
			PreparedStatement pstmt=conn.prepareStatement(sqlStr);
			pstmt.setInt(1, Arraysize);
			ResultSet rs=pstmt.executeQuery();
			
			ArrayList<retrievebooking_id> al = new ArrayList<retrievebooking_id>();
			while (rs.next()) {
				int booking_id=rs.getInt(("booking_id"));
				retrievebooking_id b = new retrievebooking_id(booking_id);
				al.add(b);
			}
			return al;
		}catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	public static details createCustomerDetails(int booking_id, String title, String name, String date_of_birth, String passport_no, String email, String contact_no, String card_type, String card_number, String card_expiry_date, String CV2_number) {
		try{
			Connection conn=DBConnection.getConnection();
			String sqlStr="INSERT INTO customers VALUES (?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt=conn.prepareStatement(sqlStr);
			pstmt.setInt(1, booking_id);
			pstmt.setString(2, title);
			pstmt.setString(3, name);
			pstmt.setString(4, date_of_birth);
			pstmt.setString(5, passport_no);
			pstmt.setString(6, email);
			pstmt.setString(7, contact_no);
			pstmt.setString(8, card_type);
			pstmt.setString(9, card_number);
			pstmt.setString(10, card_expiry_date);
			pstmt.setString(11, CV2_number);
			int rowsAffected = pstmt.executeUpdate();
			details b = new details(booking_id, title, name, date_of_birth, passport_no, email, contact_no, card_type, card_number, card_expiry_date, CV2_number, rowsAffected);
			return b;
		}catch(Exception e){
			System.out.println(e);
			return null;
		}
	}
}
