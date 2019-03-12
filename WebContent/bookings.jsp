<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="Connection.*" %>
<%@ page import="Model.*" %>
<%@ page import="java.util.ArrayList" %>
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
<div>Click <a href="admin.jsp">here</a> to return to admin page.</div>
<br  />
<form action="booking">
<input type="text" class="tftextinput" name="query" placeholder="Search Bookings" size="25"><input type="submit" value="Search" class="tfbutton3">
</form>
<hr align="center" size="1" noshade="noshade">
<%
	out.println("<table border='0' style='width:100%'>");
	out.println("<tr>");
	out.println("<td bgcolor='#84a3a5'>Booking_ID</td>");
	out.println("<td bgcolor='#84a3a5'>Aircraft_Flight_Number</td>");
	out.println("<td bgcolor='#84a3a5'>Flight_Schedule_ID</td>");
	out.println("<td bgcolor='#84a3a5'>Number_Of_Adults</td>");
	out.println("<td bgcolor='#84a3a5'>Number_Of_Children</td>");
	out.println("<td bgcolor='#84a3a5'>Total Cost(SGD)</td>");
	out.println("<td bgcolor='#84a3a5'>User</td>");
	out.println("<td bgcolor='#84a3a5'>Actions</td>");
	out.println("</tr>");
	ArrayList<Booking> al = (ArrayList<Booking>)request.getAttribute("bookings");
	if (al == null) {
		System.out.println("Array list is null!");
		return;
	}
	for (Booking b : al) {
		out.println("<tr>");
		out.println("<td bgcolor='#e6f0f1'>"+b.getBooking_id()+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+b.getAircraft_flight_number()+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+b.getFlight_schedule_id()+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+b.getAdults()+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+b.getChildren()+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+b.getTotalcost()+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+b.getName()+"</td>");
%>
	<td bgcolor='#e6f0f1'><form style='display:inline' action='deleteBooking'><input type='hidden' name='bId' value='<%=b.getBooking_id()%>'><input type='submit' value='Delete'></form>
	<form style='display:inline' action='UpdateBooking'><input type='hidden' name='bId' value='<%=b.getBooking_id()%>'><input type='hidden' name='fId' value='<%=b.getAircraft_flight_number()%>'><input type='submit' value='Update'></form></td>
<%		
		out.println("</tr>");
	}
	out.println("</table>");
%>
</body>
</html>