<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SP Airlines - Fast, Frequent &amp; Safe Flights</title>
<link rel="stylesheet" href="css/admin.css" type="text/css" media="all">
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
    // Step1: Load JDBC Driver
    Class.forName("com.mysql.jdbc.Driver");
    // Step 2: Define Connection URL
    String connURL ="jdbc:mysql://localhost/sp_airlines?user=root&password=root"; 
    // Step 3: Establish connection to URL
    Connection conn =   DriverManager.getConnection(connURL); 
    // Step 4: Create Statement object
    Statement stmt = conn.createStatement();
	String sqlStr="SELECT * FROM aircrafts WHERE aircraft_id=?";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setInt(1, aId);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	int airId=rs.getInt("aircraft_id");
	String aircraft_model=rs.getString("aircraft_model");
	String aircraft_flight_number=rs.getString("aircraft_flight_number");
	int flight_capacity=rs.getInt("flight_capacity");
	String image=rs.getString("image");
%>

<form action="processUpdatePlane.jsp">
<div style="background-color: yellow"><strong>Update Record</strong></div>
<br  />
<div class="name">Aircraft_Id:</div><input type="text" name="aId" value='<%=aId %>'readonly>
<br  />
<div class="name">Aircraft_Model:</div> <input type="text" name="aircraft_model" value='<%=aircraft_model%>'>
<br  />
<div class="name">Aircraft_flight_number:</div> <input type="text" name="aircraft_flight_number" value='<%=aircraft_flight_number%>'>
<br  />
<div class="name">Flight_Capacity:</div> <input type="text" name="flight_capacity" value='<%=flight_capacity%>'>
<br  />
<div class="name">Image:</div> <input type="text" name="image" value='<%=image%>'>
<br  /><br />
<input type="submit" value="Update Now!" class="tfbutton2"><input type="reset" value="Clear" class="tfbutton2">
</form>

<%
} catch (Exception e) {
		System.out.println(e);
}
%>
</body>
</html>