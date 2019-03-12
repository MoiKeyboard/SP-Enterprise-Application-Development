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
<div>Click <a href="admin.jsp">here</a> to return to admin page.</div>
<br  />
<form action="planeUpdateDelete.jsp">
<input type="text" class="tftextinput" name="query" placeholder="Search Planes" size="25"><input type="submit" value="Search" class="tfbutton3">
</form>
<hr align="center" size="1" noshade="noshade">
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
	String query=request.getParameter("query");
    // Step1: Load JDBC Driver
    Class.forName("com.mysql.jdbc.Driver");
    // Step 2: Define Connection URL
    String connURL ="jdbc:mysql://localhost/sp_airlines?user=root&password=root"; 
    // Step 3: Establish connection to URL
    Connection conn =   DriverManager.getConnection(connURL); 
    // Step 4: Create Statement object
    Statement stmt = conn.createStatement();
	String sqlStr="SELECT * FROM aircrafts WHERE Aircraft_Model LIKE ? OR Aircraft_flight_number LIKE ?";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setString(1, "%"+query+"%");
	pstmt.setString(2, "%"+query+"%");

	ResultSet rs = pstmt.executeQuery();

	out.println("<table border='0' style='width:100%'>");
	out.println("<tr>");
	out.println("<td 'width:10%' bgcolor='#84a3a5'>Aircraft_Id</td>");
	out.println("<td 'width:10%' bgcolor='#84a3a5'>Aircraft_Model</td>");
	out.println("<td 'width:20%' bgcolor='#84a3a5'>Aircraft_flight_number</td>");
	out.println("<td 'width:40%' bgcolor='#84a3a5'>Flight_capacity</td>");
	out.println("<td 'width:10%' bgcolor='#84a3a5'>Image</td>");
	out.println("<td 'width:20%' bgcolor='#84a3a5'>Actions</td>");
	out.println("</tr>");
	while (rs.next()) {
		int aId=rs.getInt("aircraft_id");
		String aircraft_model=rs.getString("aircraft_model");
		String aircraft_flight_number=rs.getString("aircraft_flight_number");
		int flight_capacity=rs.getInt("flight_capacity");
		String image=rs.getString("image");
		out.println("<tr>");
		out.println("<td bgcolor='#e6f0f1'>"+aId+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+aircraft_model+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+aircraft_flight_number+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+flight_capacity+"</td>");
		out.println("<td bgcolor='#e6f0f1'><img src='"+image+"' width='100px' height='200px' align='center'></td>");
%>
	<td bgcolor='#e6f0f1'><form style='display:inline' action='deletePlane.jsp'><input type='hidden' name='aId' value='<%=aId%>'><input type='submit' value='Delete'></form><form style='display:inline' action='updatePlane.jsp'><input type='hidden' name='aId' value='<%=aId%>'><input type='submit' value='Update'></form></td>
<%		
		out.println("</tr>");
	}
	out.println("</table>");
	
} catch (Exception e) {
	System.out.println(e);
}
%>
</body>
</html>