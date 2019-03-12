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
<div>Click <a href="admin.jsp">here</a> to return to admin page.</div>
<br  />
<form action="scheduleUpdateDelete.jsp">
<input type="text" class="tftextinput" name="query" placeholder="Search Schedules" size="25"><input type="submit" value="Search" class="tfbutton3">

</form>
<hr align="center" size="1" noshade="noshade">
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
	String sqlStr="SELECT * FROM schedule WHERE origin_airport LIKE ? OR destination_airport LIKE ? OR date_of_flight LIKE ?";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setString(1, "%"+query+"%");
	pstmt.setString(2, "%"+query+"%");
	pstmt.setString(3, "%"+query+"%");
	ResultSet rs = pstmt.executeQuery();

	out.println("<table border='0' style='width:100%'>");
	out.println("<tr>");
	out.println("<td bgcolor='#84a3a5'>Flight_Schedule_ID</td>");
	out.println("<td bgcolor='#84a3a5'>Aircraft_ID</td>");
	out.println("<td bgcolor='#84a3a5'>Origin_Airport</td>");
	out.println("<td bgcolor='#84a3a5'>Destination_Airport</td>");
	out.println("<td bgcolor='#84a3a5'>Country</td>");
	out.println("<td bgcolor='#84a3a5'>Economy_Cost(S$)</td>");
	out.println("<td bgcolor='#84a3a5'>Business_Cost(S$)</td>");
	out.println("<td bgcolor='#84a3a5'>First_Class_Cost(S$)</td>");
	out.println("<td bgcolor='#84a3a5'>Date_Of_Flight</td>");
	out.println("<td bgcolor='#84a3a5'>Departue_Time</td>");
	out.println("<td bgcolor='#84a3a5'>Arrival_Time</td>");
	out.println("<td bgcolor='#84a3a5'>Flight_Time</td>");
	out.println("<td bgcolor='#84a3a5'>First_Class_Capacity</td>");
	out.println("<td bgcolor='#84a3a5'>Business_Class_Capacity</td>");
	out.println("<td bgcolor='#84a3a5'>Economy_Class_Capacity</td>");
	out.println("<td bgcolor='#84a3a5'>Child_Economy_Cost</td>");
	out.println("<td bgcolor='#84a3a5'>Child_Business_Class_Cost</td>");
	out.println("<td bgcolor='#84a3a5'>Child_First_Class_Cost</td>");
	out.println("<td bgcolor='#84a3a5'>Actions</td>");
	out.println("</tr>");
	while (rs.next()) {
		int fId=rs.getInt("flight_schedule_id");
		int aId=rs.getInt("aircraft_id");
		String origin_airport=rs.getString("origin_airport");
		String destination_airport=rs.getString("destination_airport");
		String country=rs.getString("country");
		Double economy_cost=rs.getDouble("economy_cost");
		Double business_class_cost=rs.getDouble("business_class_cost");
		Double first_class_cost=rs.getDouble("first_class_cost");
		String date_of_flight=rs.getString("date_of_flight");
		String departure_time=rs.getString("departure_time");
		String arrival_time=rs.getString("arrival_time");
		String flight_time=rs.getString("flight_time");
		int first_class_capacity=rs.getInt("first_class_capacity");
		int business_class_capacity=rs.getInt("business_class_capacity");
		int economy_class_capacity=rs.getInt("economy_class_capacity");
		Double child_economy_cost=rs.getDouble("child_economy_cost");
		Double child_business_class_cost=rs.getDouble("child_business_class_cost");
		Double child_first_class_cost=rs.getDouble("child_first_class_cost");
		out.println("<tr>");
		out.println("<td bgcolor='#e6f0f1'>"+fId+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+aId+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+origin_airport+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+destination_airport+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+country+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+economy_cost+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+business_class_cost+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+first_class_cost+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+date_of_flight+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+departure_time+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+arrival_time+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+flight_time+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+first_class_capacity+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+business_class_capacity+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+economy_class_capacity+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+child_economy_cost+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+child_business_class_cost+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+child_first_class_cost+"</td>");
%>
	<td bgcolor='#e6f0f1'><form style='display:inline' action='deleteSchedule.jsp'><input type='hidden' name='fId' value='<%=fId%>'><input type='submit' value='Delete'></form><form style='display:inline' action='updateSchedule.jsp'><input type='hidden' name='fId' value='<%=fId%>'><input type='submit' value='Update'></form></td>
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