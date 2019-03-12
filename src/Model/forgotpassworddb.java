package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import Connection.DBConnection;

public class forgotpassworddb {
	public static forgotpassword createforgotpassword(String name, String email) {
		try{
			Connection conn = DBConnection.getConnection(); 
			String sqlStr="SELECT * FROM user WHERE username=? AND email=?";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			String password1 = rs.getString("password");
			String recipient = rs.getString("email");
			
			String password = new String(Base64.decode(password1));
			//change crypt back to plaintext
			forgotpassword b = new forgotpassword(password, recipient);
			return b;
		}catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}
