package Model;

import Connection.*;


import java.sql.*;
import java.util.ArrayList;

public class add2CartDB {
	public static FullBooking addBooking(int fId, String flight_class, int adults, int children, int total) {
		try{
			double totalcost; 
			Connection conn = DBConnection.getConnection(); 
			String sqlStr="SELECT * FROM schedule,aircrafts WHERE flight_schedule_id LIKE ? AND aircrafts.aircraft_id=schedule.aircraft_id";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setInt(1, fId);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			String origin_airport = rs.getString("origin_airport");
			String destination_airport = rs.getString("destination_airport");
			String aircraft_flight_number = rs.getString("aircraft_flight_number");
			String departure_time = rs.getString("departure_time");
			String arrival_time = rs.getString("arrival_time");
			String date_of_flight = rs.getString("date_of_flight");
			String flight_time = rs.getString("flight_time");
			double economy_cost = rs.getDouble("economy_cost");
			double business_class_cost = rs.getDouble("business_class_cost");
			double first_class_cost = rs.getDouble("first_class_cost");
			double child_economy_cost = rs.getDouble("child_economy_cost");
			double child_business_class_cost = rs.getDouble("child_business_class_cost");
			double child_first_class_cost = rs.getDouble("child_first_class_cost");
			if (flight_class.equals("economy_class")) {
				totalcost = adults * economy_cost + children * child_economy_cost;
			}else if (flight_class.equals("business_class")) {
				totalcost = adults * business_class_cost + children * child_business_class_cost;
			}else{
				totalcost = adults * first_class_cost + children * child_first_class_cost;
			}
			FullBooking b = new FullBooking(origin_airport, destination_airport, aircraft_flight_number, departure_time, arrival_time, date_of_flight, flight_time, economy_cost, business_class_cost, first_class_cost, child_economy_cost, child_business_class_cost, child_first_class_cost, adults, children, total, flight_class, totalcost, fId);
			return b;
		}catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

}
