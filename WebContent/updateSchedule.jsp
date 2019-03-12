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
	int fId=Integer.parseInt(request.getParameter("fId"));
    // Step1: Load JDBC Driver
    Class.forName("com.mysql.jdbc.Driver");
    // Step 2: Define Connection URL
    String connURL ="jdbc:mysql://localhost/sp_airlines?user=root&password=root"; 
    // Step 3: Establish connection to URL
    Connection conn =   DriverManager.getConnection(connURL); 
    // Step 4: Create Statement object
    Statement stmt = conn.createStatement();
	String sqlStr="SELECT * FROM schedule WHERE flight_schedule_id=?";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setInt(1, fId);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	int flId=rs.getInt("flight_schedule_id");
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
	int flight_capacity = rs.getInt("flight_capacity");
	Double child_economy_cost=rs.getDouble("child_economy_cost");
	Double child_business_class_cost=rs.getDouble("child_business_class_cost");
	Double child_first_class_cost=rs.getDouble("child_first_class_cost");
%>

<form action="processUpdateSchedule.jsp">
<div style="background-color: yellow"><strong>Update Record</strong></div>
<br  />
<div class="name">Flight_Schedule_Id:</div> <input type="text" name="fId" value='<%=fId %>'readonly>
<br  />
<div class="name">Aircraft_Id:</div> <input type="text" name="aId" value='<%=aId%>'>
<br  />
<div class="name">Origin_Airport:</div> <input type="text" name="origin_airport" value='<%=origin_airport%>'>
<br  />
<div class="name">Destination_Airport:</div> <input type="text" name="destination_airport" value='<%=destination_airport%>'>
<br  />
<div class="name">Country:</div> <input type="text" name="country" value='<%=country%>'>
<br  />
<div class="name">Economy_Cost:</div> <input type="text" name="economy_cost" value='<%=economy_cost%>'>
<br  />
<div class="name">Business_Class_Cost:</div> <input type="text" name="business_class_cost" value='<%=business_class_cost%>'>
<br  />
<div class="name">First_Class_Cost:</div> <input type="text" name="first_class_cost" value='<%=first_class_cost%>'>
<br  />
<div class="name">Date_of_Flight:</div> <input type="text" name="date_of_flight" value='<%=date_of_flight%>'>
<br  />
<div class="name">Departure_Time:</div> <input type="text" name="departure_time" value='<%=departure_time%>'>
<br  />
<div class="name">Arrival_Time:</div> <input type="text" name="arrival_time" value='<%=arrival_time%>'>
<br  />
<div class="name">Flight_Time:</div> <input type="text" name="flight_time" value='<%=flight_time%>'>
<br  />
<div class="name">Flight_Capacity:</div> <input type="text" name="flight_capacity" value='<%=flight_capacity%>'>
<br  />
<div class="name">Child_Economy_Cost:</div> <input type="text" name="child_economy_cost" value='<%=child_economy_cost%>'>
<br />
<div class="name">Child_Business_Class_Cost:</div> <input type="text" name="child_business_class_cost" value='<%=child_business_class_cost%>'>
<br />
<div class="name">Child_First_Class_Cost:</div> <input type="text" name="child_first_class_cost" value='<%=child_first_class_cost%>'>
<br /><br/>
<input type="submit" value="Update Now!" class="tfbutton2"><input type="reset" value="Clear" class="tfbutton2">
</form>

<%
} catch (Exception e) {
		System.out.println(e);
}
%>
</body>
</html>