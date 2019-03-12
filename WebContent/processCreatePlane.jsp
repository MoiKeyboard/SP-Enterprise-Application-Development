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
	String model=request.getParameter("model");
	String flight_number=request.getParameter("flight_number");
	int capacity=Integer.parseInt(request.getParameter("capacity"));
	String image=request.getParameter("image");
    // Step1: Load JDBC Driver
    Class.forName("com.mysql.jdbc.Driver");
    // Step 2: Define Connection URL
    String connURL ="jdbc:mysql://localhost/sp_airlines?user=root&password=root"; 
    // Step 3: Establish connection to URL
    Connection conn =   DriverManager.getConnection(connURL); 
    // Step 4: Create Statement object
    //Statement stmt = conn.createStatement();
	String sqlStr="INSERT INTO aircrafts VALUES (null,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setString(1, model);
	pstmt.setString(2, flight_number);
	pstmt.setInt(3, capacity);
	pstmt.setString(4,image);
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