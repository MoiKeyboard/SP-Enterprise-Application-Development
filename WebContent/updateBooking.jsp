<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="Connection.*" %>
<%@ page import="Model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/admin.css" type="text/css" media="all">
</head>
<body>
<%
try {
	String loginStatus = (String)session.getAttribute("User");
	if (!loginStatus.equals("admin")) {
		response.sendRedirect("index.jsp");
	}
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("index.jsp");
}
%>
<%
	Booking b = (Booking)request.getAttribute("bookings");
%>
<form action="processUpdateBooking">
<div style="background-color: yellow"><strong>Update Record</strong></div>
<br  />
<div class="name">Booking:</div><input type="text" name="bId" value='<%=b.getBooking_id() %>'readonly>
<br  />
<div class="name">Aircraft_flight_number:</div> <input type="text" name="aircraft_flight_number" value='<%=b.getAircraft_flight_number()%>'readonly>
<br  />
<div class="name">Flight_schedule_ID:</div> <input type="text" name="flight_schedule_id" value='<%=b.getFlight_schedule_id()%>'readonly>
<br  />
<div class="name">Number_of_adults:</div> <input type="text" name="no_of_adult" value='<%=b.getAdults()%>'>
<br  />
<div class="name">Number_of_children:</div> <input type="text" name="no_of_children" value='<%=b.getChildren()%>'>
<br  /><br />
<input type="submit" value="Update Now!" class="tfbutton2"><input type="reset" value="Clear" class="tfbutton2">
</form>
</body>
</html>