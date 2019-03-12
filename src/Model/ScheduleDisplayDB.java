package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Connection.DBConnection;

public class ScheduleDisplayDB {
	public static ArrayList<SearchSchedule> search(int adults, int children, int total, String flight_class, String flight_type, String from, String to, String depart, String dreturn) {
		try {
			Connection conn = DBConnection.getConnection();
			String sqlStr= "SELECT * FROM schedule, aircrafts WHERE origin_airport LIKE ? AND destination_airport LIKE ? AND date_of_flight LIKE ? AND aircrafts.aircraft_id=schedule.aircraft_id AND ? <= schedule.first_class_capacity";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
			pstmt.setString(1, from);
			pstmt.setString(2, to);
			pstmt.setString(3, depart);
			pstmt.setInt(4, total);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<SearchSchedule> al = new ArrayList<SearchSchedule>();
			while (rs.next()) {
	 			int fId = rs.getInt("flight_schedule_id");
	 			String aircraft_flight_name = rs.getString("aircrafts.aircraft_flight_number");
	 			String date_of_flight = rs.getString("date_of_flight");
	 			String departure_time = rs.getString("departure_time");
	 			String origin_airport = rs.getString("origin_airport");
	 			String destination_airport = rs.getString("destination_airport");
				String via = rs.getString("origin_airport");		
				SearchSchedule ss = new SearchSchedule(fId, aircraft_flight_name, date_of_flight, departure_time, origin_airport, destination_airport, via);
				al.add(ss);
			}
			return al;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	public static ArrayList<SearchSchedule> searchReturn(int adults, int children, int total, String flight_class, String flight_type, String from, String to, String depart, String dreturn) {
		try {
			Connection conn = DBConnection.getConnection();
			if (flight_class.equals("first_class")) {
			String sqlStr= "SELECT * FROM schedule, aircrafts WHERE origin_airport LIKE ? AND destination_airport LIKE ? AND date_of_flight LIKE ? AND aircrafts.aircraft_id=schedule.aircraft_id AND ? <= schedule.first_class_capacity";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	 		pstmt.setString(1, to);
	 		pstmt.setString(2, from);
	 		pstmt.setString(3, dreturn);
	 		pstmt.setInt(4,total);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<SearchSchedule> al = new ArrayList<SearchSchedule>();
			while (rs.next()) {
	 			int fId = rs.getInt("flight_schedule_id");
	 			String aircraft_flight_name = rs.getString("aircrafts.aircraft_flight_number");
	 			String date_of_flight = rs.getString("date_of_flight");
	 			String departure_time = rs.getString("departure_time");
	 			String origin_airport = rs.getString("origin_airport");
	 			String destination_airport = rs.getString("destination_airport");
				String via = rs.getString("origin_airport");		
				SearchSchedule ss = new SearchSchedule(fId, aircraft_flight_name, date_of_flight, departure_time, origin_airport, destination_airport, via);
				al.add(ss);
				}
				return al;
			} else if (flight_class.equals("business_class")) {
				String sqlStr= "SELECT * FROM schedule, aircrafts WHERE origin_airport LIKE ? AND destination_airport LIKE ? AND date_of_flight LIKE ? AND aircrafts.aircraft_id=schedule.aircraft_id AND ? <= schedule.business_class_capacity";
				PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		 		pstmt.setString(1, to);
		 		pstmt.setString(2, from);
		 		pstmt.setString(3, dreturn);
		 		pstmt.setInt(4,total);
				ResultSet rs = pstmt.executeQuery();
				ArrayList<SearchSchedule> al = new ArrayList<SearchSchedule>();
				while (rs.next()) {
		 			int fId = rs.getInt("flight_schedule_id");
		 			String aircraft_flight_name = rs.getString("aircrafts.aircraft_flight_number");
		 			String date_of_flight = rs.getString("date_of_flight");
		 			String departure_time = rs.getString("departure_time");
		 			String origin_airport = rs.getString("origin_airport");
		 			String destination_airport = rs.getString("destination_airport");
					String via = rs.getString("origin_airport");		
					SearchSchedule ss = new SearchSchedule(fId, aircraft_flight_name, date_of_flight, departure_time, origin_airport, destination_airport, via);
					al.add(ss);
				}
				return al;
			} else if (flight_class.equals("economy_class")){
				String sqlStr= "SELECT * FROM schedule, aircrafts WHERE origin_airport LIKE ? AND destination_airport LIKE ? AND date_of_flight LIKE ? AND aircrafts.aircraft_id=schedule.aircraft_id AND ? <= schedule.economy_class_capacity";
				PreparedStatement pstmt = conn.prepareStatement(sqlStr);
		 		pstmt.setString(1, to);
		 		pstmt.setString(2, from);
		 		pstmt.setString(3, dreturn);
		 		pstmt.setInt(4,total);
				ResultSet rs = pstmt.executeQuery();
				ArrayList<SearchSchedule> al = new ArrayList<SearchSchedule>();
				while (rs.next()) {
		 			int fId = rs.getInt("flight_schedule_id");
		 			String aircraft_flight_name = rs.getString("aircrafts.aircraft_flight_number");
		 			String date_of_flight = rs.getString("date_of_flight");
		 			String departure_time = rs.getString("departure_time");
		 			String origin_airport = rs.getString("origin_airport");
		 			String destination_airport = rs.getString("destination_airport");
					String via = rs.getString("origin_airport");		
					SearchSchedule ss = new SearchSchedule(fId, aircraft_flight_name, date_of_flight, departure_time, origin_airport, destination_airport, via);
					al.add(ss);
				}
				return al;
			}
			else {
				return null;
			}
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}
