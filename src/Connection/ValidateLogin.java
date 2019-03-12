package Connection;

import java.sql.*;

public class ValidateLogin {

	public static boolean validate(String id, String pwd) {
		try {
			Connection conn =   DBConnection.getConnection(); 
			String sqlStr="SELECT * FROM accounts WHERE username=? AND password=?";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setString(1,id);
			pstmt.setString(2, pwd);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}
	public static boolean uservalidate(String id, String pwd) {
		try {
			Connection conn =   DBConnection.getConnection(); 
			String sqlStr="SELECT * FROM user WHERE username=? AND password=?";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setString(1,id);
			pstmt.setString(2, pwd);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return false;
	}
}
