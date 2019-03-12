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
<form action="popular">
<input type="text" class="tftextinput" name="query" placeholder="Search Bookings" size="25"><input type="submit" value="Search" class="tfbutton3">
</form>
<hr align="center" size="1" noshade="noshade">
<%
	out.println("<table border='0' style='width:50%'>");
	out.println("<tr>");
	out.println("<td bgcolor='#84a3a5' style='width:70%'>Country</td>");
	out.println("<td bgcolor='#84a3a5' style='width:30%'>Number of Bookings</td>");
	out.println("</tr>");
	ArrayList<Popular> al = (ArrayList<Popular>)request.getAttribute("popular");
	if (al == null) {
		System.out.println("Array list is null!");
		return;
	}
	for (Popular p : al) {
		out.println("<tr>");
		out.println("<td bgcolor='#e6f0f1'>"+p.getCountry()+"</td>");
		out.println("<td bgcolor='#e6f0f1'>"+p.getCount()+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
%>
</body>
</html>