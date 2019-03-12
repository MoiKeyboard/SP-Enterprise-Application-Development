<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.swing.JOptionPane" %>
<%@ page import="java.util.*, java.text.*,java.util.Date" %>
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
	int aId=Integer.parseInt(request.getParameter("aId"));
	String originAirport=request.getParameter("originAirport");
	String destinationAirport=request.getParameter("destinationAirport");
	String country=request.getParameter("country");
	Double economyCost=Double.parseDouble(request.getParameter("economyCost"));
	Double businessCost=Double.parseDouble(request.getParameter("businessCost"));
	Double firstClassCost=Double.parseDouble(request.getParameter("firstClassCost"));
	String fDate = request.getParameter("fDate");
	String fDepart = request.getParameter("fDepart");
	String fArrive = request.getParameter("fArrive");
	String fTime = request.getParameter("fTime");
	int flight_capacity = Integer.parseInt(request.getParameter("flight_capacity"));
	Double CeconomyCost=Double.parseDouble(request.getParameter("child_economy_cost"));
	Double CbusinessCost=Double.parseDouble(request.getParameter("child_business_cost"));
	Double CfirstClassCost=Double.parseDouble(request.getParameter("child_first_class_cost"));
    // Step1: Load JDBC Driver
    Class.forName("com.mysql.jdbc.Driver");
    // Step 2: Define Connection URL
    String connURL ="jdbc:mysql://localhost/sp_airlines?user=root&password=root"; 
    // Step 3: Establish connection to URL
    Connection conn =   DriverManager.getConnection(connURL); 
    // Step 4: Create Statement object
    Statement stmt = conn.createStatement();
	String sqlStr="INSERT INTO schedule VALUES (null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setInt(1, aId);
	pstmt.setString(2, originAirport);
	pstmt.setString(3, destinationAirport);
	pstmt.setString(4, country);
	pstmt.setDouble(5,economyCost);
	pstmt.setDouble(6,businessCost);
	pstmt.setDouble(7,firstClassCost);
	pstmt.setString(8, fDate);
	pstmt.setString(9, fDepart);
	pstmt.setString(10, fArrive);
	pstmt.setString(11, fTime);
	pstmt.setInt(12, flight_capacity);
	pstmt.setDouble(13,CeconomyCost);
	pstmt.setDouble(14,CbusinessCost);
	pstmt.setDouble(15,CfirstClassCost);
	int rowsAffected = pstmt.executeUpdate();
	if (rowsAffected == 0) {
		JOptionPane.showMessageDialog(null,
                "Database not affected!",
                "Error",
                JOptionPane.ERROR_MESSAGE);
		response.sendRedirect("admin.jsp");
	} else {
		JOptionPane.showMessageDialog(null, "Database affected! "+rowsAffected+" row(s) affected.");
		response.sendRedirect("admin.jsp");
	}
} catch (Exception e) {
	System.out.println(e);
}
%>
</body>
</html>