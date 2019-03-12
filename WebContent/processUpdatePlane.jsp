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
	int aId = Integer.parseInt(request.getParameter("aId"));
	String aircraft_model=request.getParameter("aircraft_model");
	String aircraft_flight_number=request.getParameter("aircraft_flight_number");
	int flight_capacity=Integer.parseInt(request.getParameter("flight_capacity"));
	String image=request.getParameter("image");
    // Step1: Load JDBC Driver
    Class.forName("com.mysql.jdbc.Driver");
    // Step 2: Define Connection URL
    String connURL ="jdbc:mysql://localhost/sp_airlines?user=root&password=root"; 
    // Step 3: Establish connection to URL
    Connection conn =   DriverManager.getConnection(connURL); 
    // Step 4: Create Statement object
	String sqlStr="UPDATE aircrafts SET aircraft_model=?, aircraft_flight_number=?, flight_capacity=?, image=? where aircraft_id=?";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setString(1, aircraft_model);
	pstmt.setString(2, aircraft_flight_number);
	pstmt.setInt(3, flight_capacity);
	pstmt.setString(4, image);
	pstmt.setInt(5, aId);
	int rowsAffected = pstmt.executeUpdate();
	if (rowsAffected == 0) {
		JOptionPane.showMessageDialog(null,
                "Database not affected!",
                "Error",
                JOptionPane.ERROR_MESSAGE);
		response.sendRedirect("planeUpdateDelete.jsp");
	} else {
		JOptionPane.showMessageDialog(null, "Database affected! "+rowsAffected+" row(s) affected.");
		response.sendRedirect("planeUpdateDelete.jsp");
	}
} catch (Exception e) {
	System.out.println(e);
	e.printStackTrace();
}
%>
</body>
</html>