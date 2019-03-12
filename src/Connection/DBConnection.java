package Connection;

import java.sql.*;

public class DBConnection {
	public static Connection getConnection() throws Exception {
		try {
			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");
			// Step 2: Define Connection URL
			String connURL ="jdbc:mysql://localhost/sp_airlines?user=root&password=root"; 
			// Step 3: Establish connection to URL
			Connection conn =   DriverManager.getConnection(connURL); 
			// Step 4: Create Statement object
			return conn;
		} finally {
		}
	}
}
