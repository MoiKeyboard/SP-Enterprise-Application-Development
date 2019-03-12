<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>    
<%@ page import="javax.swing.JOptionPane" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SP Airlines - Fast, Frequent &amp; Safe Flights</title>
</head>
<body>
<%
try {
	String loginStatus = (String)session.getAttribute("User");
	System.out.println(loginStatus);
	if (!loginStatus.equals("admin")) {
		response.sendRedirect("index.jsp");
	}
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("index.jsp");
}
%>
<%
try {
	int fId = Integer.parseInt(request.getParameter("fId"));
	int aId = Integer.parseInt(request.getParameter("aId"));
	String origin_airport=request.getParameter("origin_airport");
	String destination_airport=request.getParameter("destination_airport");
	String country=request.getParameter("country");
	Double economy_cost=Double.parseDouble(request.getParameter("economy_cost"));
	Double business_class_cost=Double.parseDouble(request.getParameter("business_class_cost"));
	Double first_class_cost=Double.parseDouble(request.getParameter("first_class_cost"));
	String date_of_flight=request.getParameter("date_of_flight");
	String departure_time=request.getParameter("departure_time");
	String arrival_time=request.getParameter("arrival_time");
	String flight_time=request.getParameter("flight_time");
	int flight_capacity=Integer.parseInt(request.getParameter("flight_capacity"));
	Double child_economy_cost=Double.parseDouble(request.getParameter("child_economy_cost"));
	Double child_business_class_cost=Double.parseDouble(request.getParameter("child_business_class_cost"));
	Double child_first_class_cost=Double.parseDouble(request.getParameter("child_first_class_cost"));
    // Step1: Load JDBC Driver
    Class.forName("com.mysql.jdbc.Driver");
    // Step 2: Define Connection URL
    String connURL ="jdbc:mysql://localhost/sp_airlines?user=root&password=root"; 
    // Step 3: Establish connection to URL
    Connection conn =   DriverManager.getConnection(connURL); 
    // Step 4: Create Statement object
	String sqlStr="UPDATE schedule SET aircraft_id=?, origin_airport=?, destination_airport=?, country=?, economy_cost=?, business_class_Cost=?, first_class_cost=?, date_of_flight=?, departure_time=?, arrival_time=?, flight_time=?, flight_capacity=?, child_economy_cost=?, child_business_class_cost=?, child_first_class_cost=? where flight_schedule_id=?";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setInt(1, aId);
	pstmt.setString(2, origin_airport);
	pstmt.setString(3, destination_airport);
	pstmt.setString(4, country);
	pstmt.setDouble(5, economy_cost);
	pstmt.setDouble(6, business_class_cost);
	pstmt.setDouble(7, first_class_cost);
	pstmt.setString(8, date_of_flight);
	pstmt.setString(9, departure_time);
	pstmt.setString(10, arrival_time);
	pstmt.setString(11, flight_time);
	pstmt.setInt(12, flight_capacity);
	pstmt.setDouble(13, child_economy_cost);
	pstmt.setDouble(14, child_business_class_cost);
	pstmt.setDouble(15, child_first_class_cost);
	pstmt.setInt(16, fId);
	int rowsAffected = pstmt.executeUpdate();
	if (rowsAffected == 0) {
		JOptionPane.showMessageDialog(null,
                "Database not affected!",
                "Error",
                JOptionPane.ERROR_MESSAGE);
		response.sendRedirect("scheduleUpdateDelete.jsp");
	} else {
		JOptionPane.showMessageDialog(null, "Database affected! "+rowsAffected+" row(s) affected.");
		response.sendRedirect("scheduleUpdateDelete.jsp");
	}
} catch (Exception e) {
	System.out.println(e);
}
%>
</body>
</html>