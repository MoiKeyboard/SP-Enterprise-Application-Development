<%@ page contentType="text/html"%>
<%@ page import="java.sql.*" %>
<%@ page import="Connection.*" %>
<%@ page import="java.util.*,Model.*" %>
 <!DOCTYPE html>
<html lang="en">
<head>
<title>SP Airlines - Fast, Frequent &amp; Safe Flights</title>
<link rel="shortcut icon" href="images/icon.ico" />
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script type="text/javascript" src="js/jquery-1.5.2.js" ></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>
<script type="text/javascript" src="js/Cabin_400.font.js"></script>
<script type="text/javascript" src="js/tabs.js"></script>
<script type="text/javascript" src="js/jquery.jqtransform.js" ></script>
<script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript" src="js/atooltip.jquery.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="js/html5.js"></script>
<style type="text/css">.main, .tabs ul.nav a, .content, .button1, .box1, .top { behavior:url("../js/PIE.htc")}</style>
<![endif]-->
</head>
<body id="page3">
<%
int items = 0;
if (session.getAttribute("cart") != null) {
	ArrayList<FullBooking> al=(ArrayList<FullBooking>)session.getAttribute("cart");
	items = al.size();
}
%>
<%
    String loginStatus = (String)session.getAttribute("User1");
	System.out.println(loginStatus);
	if (loginStatus==null) {
		%>
		<div class="main">
  <!--header -->
  <header>
    <div class="wrapper">
      <h1><a href="index.jsp" id="logo">AirLines</a></h1>
      <span id="slogan">Fast, Frequent &amp; Safe Flights</span>
    </div>
	 <div id="cart">
   <form action="add2Cart.jsp" method="Post">
    <input type="text" class="tftextinput2"  name="q" size="15" maxlength="120" value='<%=items %> flight(s)' readonly/><input type="submit" value="MY CART" class="tfbutton1">
    </form>
    </div>
    <div id="login">
    <form action="Authenticate" method="post">
    MEMBER LOGIN:<a href="register.jsp" id="registerword">&#10148;Register now</a><br />
    <input type="text" class="tftextinput1" name="username" placeholder="Username" size="21" required>&nbsp;&nbsp;&nbsp;<input type="password" class="tftextinput1" name="password" placeholder="Password" size="21" required>&nbsp;&nbsp;&nbsp;<input type="submit" value="Login" class="tfbutton1"><br />
     <input type="checkbox" name="loginkeeping" /><span id="edit">Remember Me</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="forgotpassword.jsp" id="word">Forgot password</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </form>
    </div>
	<%
	}else{
		%>	
		<div class="main">
  <!--header -->
  <header>
    <div class="wrapper">
      <h1><a href="index.jsp" id="logo">AirLines</a></h1>
      <span id="slogan">Fast, Frequent &amp; Safe Flights</span>
      <nav id="top_nav">
        <ul>
          <li><a href="index.jsp" class="nav1">Home</a></li>
          <li><a href="account.jsp" class="nav2">Account</a></li>
          <li><a href="logout.jsp" class="nav3">Logout</a></li>
        </ul>
      </nav>
    </div>
		<div id="cart1">
		   <form action="add2Cart.jsp" method="Post">
		    <input type="text" class="tftextinput2"  name="q" size="15" maxlength="120" value='<%=items %> flight(s)' readonly/><input type="submit" value="MY CART" class="tfbutton1">
		    </form>
		    </div>
	<%
	}
	
	%>
    <nav>
      <ul id="menu">
        <li><a href="index.jsp"><span><span>About Us</span></span></a></li>
        <li><a href="offers.jsp"><span><span>Promotions</span></span></a></li>
        <li><a href="book.jsp"><span><span>Bookings</span></span></a></li>
        <li class="end"><a href="contacts.jsp"><span><span>Contacts Us</span></span></a></li>
      </ul>
    </nav>
    <div id="tfheader">
		<form id="tfnewsearch" method="get" action="scheduleDisplay.jsp">
		        <input type="text" class="tftextinput" name="query" placeholder="Search..." size="21" maxlength="120"><input type="submit" value="search" class="tfbutton">
		</form>
	<div class="tfclear"></div>
	</div>
  </header>
  <!-- / header -->
  <!--content -->
  <section id="content">
  <br />
    <div id="admin">
    <span id="word2">FULL FLIGHT DETAIL</span><br /><br />
    <div id="create">
<span class="word3">Flight</span>
<table width="100%" border="0">
  <tr>
  	<td bgcolor='#84a3a5' align='center'>Origin Airport</td>
  	<td bgcolor='#84a3a5' align='center'>Destination airport</td>
    <td bgcolor='#84a3a5' align='center'>Plane Number</td>
    <td bgcolor='#84a3a5' align='center'>Departure Time</td>
    <td bgcolor='#84a3a5' align='center'>Arrival Time</td>
    <td bgcolor='#84a3a5' align='center'>Total Flight Time</td>
    <td bgcolor='#84a3a5' align='center'>Date_of_Flight</td>
  </tr>
<% 
try {
	int fId=Integer.parseInt(request.getParameter("fId"));
	Connection conn =   DBConnection.getConnection(); 
	String sqlStr="SELECT * FROM schedule,aircrafts WHERE flight_schedule_id LIKE ? AND aircrafts.aircraft_id=schedule.aircraft_id";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setInt(1, fId);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	String origin_airport = rs.getString("origin_airport");
	String destination_airport = rs.getString("destination_airport");
	String aircraft_flight_number = rs.getString("aircraft_flight_number");
	String departure_time = rs.getString("departure_time");
	String arrival_time = rs.getString("arrival_time");
	String flight_time = rs.getString("flight_time");
	String date_of_flight = rs.getString("date_of_flight");
    out.println("<tr>");
    out.println("<td bgcolor='#e6f0f1' align='center'>"+origin_airport+"</td>");
    out.println("<td bgcolor='#e6f0f1' align='center'>"+destination_airport+"</td>");
    out.println("<td bgcolor='#e6f0f1' align='center'>"+aircraft_flight_number+"</td>");
    out.println("<td bgcolor='#e6f0f1' align='center'>"+departure_time+"</td>");
    out.println("<td bgcolor='#e6f0f1' align='center'>"+arrival_time+"</td>");
    out.println("<td bgcolor='#e6f0f1' align='center'>"+flight_time+"</td>");
    out.println("<td bgcolor='#e6f0f1' align='center'>"+date_of_flight+"</td>");
  	out.println("</tr>");
} catch (Exception e) {
	System.out.println(e);
}
%>
</table>
<br />

<span class="word3">Cost</span>
<table width="50%" border="0">
  <tr>
    <td bgcolor='#84a3a5' width='33%' align='center'>Economy Cost</td>
    <td bgcolor='#84a3a5' width='33%' align='center'>Business Class Cost</td>
    <td bgcolor='#84a3a5' width='33%' align='center'>First Class Cost</td>
  </tr>
<% 
try {
	int fId=Integer.parseInt(request.getParameter("fId"));
	Connection conn =   DBConnection.getConnection(); 
	String sqlStr="SELECT * FROM schedule,aircrafts WHERE flight_schedule_id LIKE ? AND aircrafts.aircraft_id=schedule.aircraft_id";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setInt(1, fId);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	Double economy_cost = rs.getDouble("economy_cost");
	Double business_class_cost = rs.getDouble("business_class_cost");
	Double first_class_cost = rs.getDouble("first_class_cost");
    out.println("<tr>");
    out.println("<td bgcolor='#e6f0f1' align='center'>"+economy_cost+"</td>");
    out.println("<td bgcolor='#e6f0f1' align='center'>"+business_class_cost+"</td>");
    out.println("<td bgcolor='#e6f0f1' align='center'>"+first_class_cost+"</td>");
  	out.println("</tr>");
} catch (Exception e) {
	System.out.println(e);
}
%>

</table>
<br  />
<span class="word3">Availability</span>
<table width="50%" border="0">
  <tr>
    <td bgcolor='#84a3a5' align='center'>First Class</td>
    <td bgcolor='#84a3a5' align='center'>Business Class</td>
    <td bgcolor='#84a3a5' align='center'>Economy Class</td>
  </tr>
<% 
try {
	int fId=Integer.parseInt(request.getParameter("fId"));
	Connection conn =   DBConnection.getConnection(); 
	String sqlStr="SELECT * FROM schedule,aircrafts WHERE flight_schedule_id LIKE ? AND aircrafts.aircraft_id=schedule.aircraft_id";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setInt(1, fId);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	int first_class_capacity = rs.getInt("first_class_capacity");
	int business_class_capacity = rs.getInt("business_class_capacity");
	int economy_class_capacity = rs.getInt("economy_class_capacity");
    out.println("<tr>");
    out.println("<td bgcolor='#e6f0f1' align='center'>"+first_class_capacity+"</td>");
    out.println("<td bgcolor='#e6f0f1' align='center'>"+business_class_capacity+"</td>");
    out.println("<td bgcolor='#e6f0f1' align='center'>"+economy_class_capacity+"</td>");
  	out.println("</tr>");
} catch (Exception e) {
	System.out.println(e);
}
%>

</table>
<br />
<%
try {
	int fId2=Integer.parseInt(request.getParameter("fId2"));
	if (fId2 != 0) {

%>
<span class="word3">Transit Flight</span>
<table width="100%" border="0">
  <tr>
  	<td bgcolor='#84a3a5' align='center'>Origin Airport</td>
  	<td bgcolor='#84a3a5' align='center'>Destination airport</td>
    <td bgcolor='#84a3a5' align='center'>Plane Number</td>
    <td bgcolor='#84a3a5' align='center'>Departure Time</td>
    <td bgcolor='#84a3a5' align='center'>Arrival Time</td>
    <td bgcolor='#84a3a5' align='center'>Total Flight Time</td>
    <td bgcolor='#84a3a5' align='center'>Date_of_Flight</td>
  </tr>
<% 
try {
	int fId=Integer.parseInt(request.getParameter("fId2"));
	Connection conn =   DBConnection.getConnection(); 
	String sqlStr="SELECT * FROM schedule,aircrafts WHERE flight_schedule_id LIKE ? AND aircrafts.aircraft_id=schedule.aircraft_id";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setInt(1, fId);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	String origin_airport = rs.getString("origin_airport");
	String destination_airport = rs.getString("destination_airport");
	String aircraft_flight_number = rs.getString("aircraft_flight_number");
	String departure_time = rs.getString("departure_time");
	String arrival_time = rs.getString("arrival_time");
	String flight_time = rs.getString("flight_time");
	String date_of_flight = rs.getString("date_of_flight");
    out.println("<tr>");
    out.println("<td bgcolor='#e6f0f1' align='center'>"+origin_airport+"</td>");
    out.println("<td bgcolor='#e6f0f1' align='center'>"+destination_airport+"</td>");
    out.println("<td bgcolor='#e6f0f1' align='center'>"+aircraft_flight_number+"</td>");
    out.println("<td bgcolor='#e6f0f1' align='center'>"+departure_time+"</td>");
    out.println("<td bgcolor='#e6f0f1' align='center'>"+arrival_time+"</td>");
    out.println("<td bgcolor='#e6f0f1' align='center'>"+flight_time+"</td>");
    out.println("<td bgcolor='#e6f0f1' align='center'>"+date_of_flight+"</td>");
  	out.println("</tr>");
} catch (Exception e) {
	System.out.println(e);
}
%>
</table>
<br />

<span class="word3">Cost of Transit Flight</span>
<table border="0">
  <tr>
    <td bgcolor='#84a3a5'>Economy Cost</td>
    <td bgcolor='#84a3a5'>Business Class Cost</td>
    <td bgcolor='#84a3a5'>First Class Cost</td>
  </tr>
<% 
try {
	int fId=Integer.parseInt(request.getParameter("fId2"));
	Connection conn =   DBConnection.getConnection(); 
	String sqlStr="SELECT * FROM schedule,aircrafts WHERE flight_schedule_id LIKE ? AND aircrafts.aircraft_id=schedule.aircraft_id";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setInt(1, fId);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	Double economy_cost = rs.getDouble("economy_cost");
	Double business_class_cost = rs.getDouble("business_class_cost");
	Double first_class_cost = rs.getDouble("first_class_cost");
    out.println("<tr>");
    out.println("<td bgcolor='#e6f0f1' align='center'>"+economy_cost+"</td>");
    out.println("<td bgcolor='#e6f0f1' align='center'>"+business_class_cost+"</td>");
    out.println("<td bgcolor='#e6f0f1' align='center'>"+first_class_cost+"</td>");
  	out.println("</tr>");
} catch (Exception e) {
	System.out.println(e);
}
%>
</table>
<br  />
<span class="word3">Transit Flight Availability</span>
<table width="50%" border="0">
  <tr>
    <td bgcolor='#84a3a5' align='center'>Seats Remaining</td>
  </tr>
<% 
try {
	int fId=Integer.parseInt(request.getParameter("fId"));
	Connection conn =   DBConnection.getConnection(); 
	String sqlStr="SELECT * FROM schedule,aircrafts WHERE flight_schedule_id LIKE ? AND aircrafts.aircraft_id=schedule.aircraft_id";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setInt(1, fId);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	int flight_capacity = rs.getInt("schedule.flight_capacity");
    out.println("<tr>");
    out.println("<td bgcolor='#e6f0f1' align='center'>"+flight_capacity+"</td>");
  	out.println("</tr>");
} catch (Exception e) {
	System.out.println(e);
}
	} //end if from transit
} catch (Exception e) {//end try from transit
	
}
%>
<table width="10%" border="0">
 <tr>
 	<br  /><br  />
    <td align='center'>Seatings Layout</td>
  </tr>
<% 
try {
	int fId=Integer.parseInt(request.getParameter("fId"));
	int adults = Integer.parseInt(request.getParameter("adults"));
	int children = Integer.parseInt(request.getParameter("children"));
	String flight_class= request.getParameter("flight_class");
	Connection conn =   DBConnection.getConnection(); 
	String sqlStr="SELECT * FROM schedule,aircrafts WHERE flight_schedule_id LIKE ? AND aircrafts.aircraft_id=schedule.aircraft_id";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setInt(1, fId);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	String date_of_flight = rs.getString("date_of_flight");
	String aircraft_flight_number = rs.getString("aircraft_flight_number");
	int fId3 = rs.getInt("flight_schedule_id");
	String image = rs.getString("image");
    out.println("<tr>");
    out.println("<td align='center'><img src='"+image+"' width='100px' height='200px' align='center'></td>");
    out.println("</tr>");
%>
	<tr>
  	<td align='center'>Flight Class</td><td align='center'>Adults</td><td align='center'>Children</td>
  	</tr>
<%
    out.println("<tr>");
    if (flight_class.equals("eclass")) {
    	out.println("<td align='center'><select name='flight_class' style='width:150px'>");
		out.println("<option value='fclass'>First Class</option>");
		out.println("<option value='bclass'>Business Class</option>");
		out.println("<option selected='selected' value='eclass'>Economy Class</option>");
        out.println("</select></td>");
    } else if (flight_class.equals("bclass")) {
    	out.println("<td align='center'><select name='flight_class'>");
		out.println("<option value='fclass'>First Class</option>");
		out.println("<option selected='selected' value='bclass'>Business Class</option>");
		out.println("<option value='eclass'>Economy Class</option>");
        out.println("</select></td>");
    } else {
    	out.println("<td align='center'><select name='flight_class'>");
		out.println("<option selected='selected' value='fclass'>First Class</option>");
		out.println("<option value='bclass'>Business Class</option>");
		out.println("<option value='eclass'>Economy Class</option>");
        out.println("</select></td>");    	
    }
%>
  	<td><input type='text' name= "adults" style='width:30px' value=<%=adults %>></td><td><input type='text' name="children" style='width:30px' value=<%=children %>></td>
	</tr>
	<input type='hidden' name="flight_schedule_id" value='<%=fId3%>'><input type='hidden' name="date_of_flight" value='<%=date_of_flight%>'><input type='hidden' name="aircraft_flight_number" value='<%=aircraft_flight_number%>'>
<%
} catch (Exception e) {
	System.out.println(e);
}
%>
</table><br /><br />

    </div>
    </div>
    <br />
  </section>
  <!--content end-->
  <!--footer -->
  <footer>
    <div class="wrapper">
      <ul id="icons">
        <li><a href="https://www.facebook.com/pages/SP-Airlines/177235039150440?ref=hl&ref_type=bookmark" target="_blank" class="normaltip"><img src="images/facebook.png" width="30" height="30" alt=""></a></li>
        <li><a href="https://plus.google.com/" target="_blank" class="normaltip"><img src="images/g+icon.png" width="30" height="30" alt=""></a></li>
        <li><a href="https://twitter.com/" target="_blank" class="normaltip"><img src="images/twitter.png" width="30" height="30" alt=""></a></li>
      </ul>
      <div class="links">&copy; 2014 SP AIRLINES ALL Rights Reserved<br>
        </div>
    </div>
  </footer>
  <!--footer end-->
</div>
<script type="text/javascript">Cufon.now();</script>
<script type="text/javascript">
jQuery(document).ready(function ($) {
    $('.form_5').jqTransform({
        imgPath: 'jqtransformplugin/img/'
    });
});
$(document).ready(function () {
    tabs2.init();
});
</script>
</body>
</html>