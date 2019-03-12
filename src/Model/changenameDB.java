package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import Connection.DBConnection;

public class changenameDB {
	public static username editpassword(String oldname, String password) {
		try{
				Connection conn = DBConnection.getConnection(); 
				String sqlStr="UPDATE user SET password = ? WHERE username = ?";
				PreparedStatement pstmt = conn.prepareStatement(sqlStr);
				pstmt.setString(1, password);
				pstmt.setString(2, oldname);
				int rowsAffected = pstmt.executeUpdate();
				username b = new username(rowsAffected);
				return b;
		}catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	public static username editemail(String oldname, String email) {
		try{
				Connection conn = DBConnection.getConnection(); 
				String sqlStr="UPDATE user SET email = ? WHERE username = ?";
				PreparedStatement pstmt = conn.prepareStatement(sqlStr);
				pstmt.setString(1, email);
				pstmt.setString(2, oldname);
				int rowsAffected = pstmt.executeUpdate();
				username c = new username(rowsAffected);
				return c;
		}catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

}
