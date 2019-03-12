<%@ page contentType="text/html"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,Model.*, Connection.*" %>
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
    %>
   
    <%
	System.out.println(loginStatus);
	if (loginStatus==null) {
		response.sendRedirect("index.jsp");
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
    <span id="word2">Account</span><br /><br />
    <div id="create">
<form action="changepassword" method="post">
<table width="30%" border="0">
  <tr>
    <td align='left' colspan='2'><b style="font-size:18px;">Change Password</b></td>
  </tr>
   <tr>
    <td align='left' colspan='2'><img src='images/line.png' alt=''/></td>
  </tr>
  <tr>
    <td align='left' colspan='2'>New Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input required type='text' name='password' /></td>
    
  </tr>
  <tr>
  <td align='left' colspan='2'> <input type='hidden' name='loginStatus' value='<%=loginStatus%>'></td>
  </tr>
    <tr>
    <td align='left' colspan='2'><input type='submit' value='Confirm' class='tfbutton2'><input type='reset' value='Reset' class='tfbutton2'></td>

  </tr>

</table>
</form>
<br/>
<form action="changeemail" method="post">
<table width="30%" border="0">
  <tr>
    <td align='left' colspan='2'><b style="font-size:18px;">Change Email</b></td>
  </tr>
   <tr>
    <td align='left' colspan='2'><img src='images/line.png' alt=''/></td>
  </tr>
	  <tr>
    <td align='left' colspan='2'>New Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input required type='text' name='email' /></td>
    
  </tr>
  <tr>
  <td align='left' colspan='2'> <input type='hidden' name='loginStatus' value='<%=loginStatus%>'></td>
  </tr>
   <tr>
    <td align='left' colspan='2'><input type='submit' value='Confirm' class='tfbutton2'><input type='reset' value='Reset' class='tfbutton2'></td>

  </tr>
</table>

</form>
<br />
<table width="30%" border="0">
  <tr>
    <td align='left' colspan='2'><b style="font-size:18px;">Past Transactions</b></td>
  </tr>
   <tr>
    <td align='left' colspan='2'><img src='images/line.png' alt=''/></td>
  </tr>
  <tr>
  <td align='left' colspan='2'> <input type='hidden' name='loginStatus' value='<%=loginStatus%>'></td>
  </tr>
    <table width='100%' border='0'>
    <tr>
      <td bgcolor='#84a3a5' align='center'>Origin</td>
      <td bgcolor='#84a3a5' align='center'>Destination</td>
      <td bgcolor='#84a3a5' align='center'>Date of flight</td>
      <td bgcolor='#84a3a5' align='center'>Aircraft flight number</td>
      <td bgcolor='#84a3a5' align='center'>Number of Adults</td>
      <td bgcolor='#84a3a5' align='center'>Number of Children</td>
      <td bgcolor='#84a3a5' align='center'>Amount Paid(SGD)</td>
	</tr>
<% 
try {
	Connection conn =   DBConnection.getConnection();
	String sqlStr="SELECT * FROM schedule s, bookings b WHERE b.username LIKE ? AND s.flight_schedule_id=b.flight_schedule_id";
	PreparedStatement pstmt = conn.prepareCall(sqlStr);
	pstmt.setString(1, loginStatus);
	ResultSet rs = pstmt.executeQuery();
	ArrayList<String> ar = new ArrayList<String>();
	while (rs.next()) {
		String origin_airport= rs.getString("s.origin_airport");
		String destination_airport =rs.getString("s.destination_airport");
		String date_of_flight = rs.getString("b.date_of_flight");
		String aircraft_flight_number = rs.getString("b.aircraft_flight_number");
		int number_of_adults = rs.getInt("b.adults");
		int number_of_children = rs.getInt("b.children");
		double totalcost = rs.getDouble("b.totalcost");
		out.println("<tr>");
		out.println("<td bgcolor='#e6f0f1' align='center'>"+origin_airport+"</td>");
		out.println("<td bgcolor='#e6f0f1' align='center'>"+destination_airport+"</td>");
		out.println("<td bgcolor='#e6f0f1' align='center'>"+date_of_flight+"</td>");
		out.println("<td bgcolor='#e6f0f1' align='center'>"+aircraft_flight_number+"</td>");
		out.println("<td bgcolor='#e6f0f1' align='center'>"+number_of_adults+"</td>");
		out.println("<td bgcolor='#e6f0f1' align='center'>"+number_of_children+"</td>");
		out.println("<td bgcolor='#e6f0f1' align='center'>"+totalcost+"</td>");
		out.println("</tr>");
	}
} catch (Exception e) {
	System.out.println(e);
}
%>

</table>
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