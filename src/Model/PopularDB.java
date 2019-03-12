package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Connection.DBConnection;

public class PopularDB {
	public static ArrayList<Popular> showByYear(String year) {
		try {
			Connection conn = DBConnection.getConnection();
			String sqlStr="SELECT COUNT(b.booking_id) AS 'Count', s.country" +
						   " FROM bookings b, `schedule` s" +
						   " WHERE s.flight_schedule_id=b.flight_schedule_id" +
						   " AND b.date_of_flight LIKE ?" +
						   " GROUP BY s.country" +
						   " ORDER BY Count DESC";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setString(1, "%"+year+"%");
			ResultSet rs = pstmt.executeQuery();
			ArrayList<Popular> al = new ArrayList<Popular>();
			while (rs.next()) {
				int count = rs.getInt("count");
				String country = rs.getString("country");
				Popular p = new Popular(count, country);
				al.add(p);
			}
			return al;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}
