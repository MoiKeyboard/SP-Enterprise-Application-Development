package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Connection.DBConnection;

public class registerDB {
	public static registeruser registeruserDB(String username, String gender, String date_of_birth, String email, String password) {
		try{
			Connection conn = DBConnection.getConnection(); 
			String sqlStr="INSERT INTO user VALUES (?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setString(1, username);
			pstmt.setString(2, gender);
			pstmt.setString(3, date_of_birth);
			pstmt.setString(4, email);
			pstmt.setString(5, password);
			int rowsAffected = pstmt.executeUpdate();
			registeruser b = new registeruser(username, gender, date_of_birth, email, password, rowsAffected);
			return b;
		}catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}
