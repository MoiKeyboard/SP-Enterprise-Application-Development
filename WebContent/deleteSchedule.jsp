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
	int aId=Integer.parseInt(request.getParameter("fId"));
	// Step1: Load JDBC Driver
    Class.forName("com.mysql.jdbc.Driver");
    // Step 2: Define Connection URL
    String connURL ="jdbc:mysql://localhost/sp_airlines?user=root&password=root"; 
    // Step 3: Establish connection to URL
    Connection conn =   DriverManager.getConnection(connURL); 
    // Step 4: Create Statement object
	String sqlStr="DELETE FROM schedule WHERE flight_schedule_id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setInt(1, aId);
	int rowsDeleted = pstmt.executeUpdate();
	if (rowsDeleted == 0) {
		JOptionPane.showMessageDialog(null,
                "Database not affected!",
                "Error",
                JOptionPane.ERROR_MESSAGE);
		response.sendRedirect("scheduleUpdateDelete.jsp");
	} else {
		JOptionPane.showMessageDialog(null, "Database affected! "+rowsDeleted+" row(s) affected.");
		response.sendRedirect("scheduleUpdateDelete.jsp");
	}
} catch (Exception e) {
	out.println(e);
}
%>
</body>
</html>