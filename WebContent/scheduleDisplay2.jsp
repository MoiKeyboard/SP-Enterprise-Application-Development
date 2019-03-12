<%@ page contentType="text/html"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="Model.*" %>
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
    <span id="word2">EXACT FLIGHTS</span><br /><br />
    <div id="create">
    <form action="add2Cart" method="post" onsubmit='return added()'>
<table width="100%" border="0">
  <tr>
    <td bgcolor='#84a3a5' align='center'>Plane Number</td>
    <td bgcolor='#84a3a5' align='center'>Date of Flight</td>
    <td bgcolor='#84a3a5' align='center'>Time of Flight</td>
    <td bgcolor='#84a3a5' align='center'>Origin Airport</td>
    <td bgcolor='#84a3a5' align='center'>Destination Airport</td>
    <td bgcolor='#84a3a5' align='center'>Via (if any)</td>
    <td bgcolor='#84a3a5' align='center'>Full Details</td>
    <td bgcolor='#84a3a5' align='center'>Add to cart</td>
  </tr>
<% 
ArrayList<SearchSchedule> al = (ArrayList<SearchSchedule>)request.getAttribute("searchTo");
String flight_class = request.getParameter("flight_class");
int adults = Integer.parseInt(request.getParameter("adults"));
int children = Integer.parseInt(request.getParameter("children"));
for (SearchSchedule s : al) {
    out.println("<tr>");
	out.println("<td bgcolor='#e6f0f1' align='center'>"+s.getAircraft_flight_name()+"</td>");
	out.println("<td bgcolor='#e6f0f1' align='center'>"+s.getDate_of_flight()+"</td>");
	out.println("<td bgcolor='#e6f0f1' align='center'>"+s.getDeparture_time()+"</td>");
	out.println("<td bgcolor='#e6f0f1' align='center'>"+s.getOrigin_airport()+"</td>");
	out.println("<td bgcolor='#e6f0f1' align='center'>"+s.getDestination_airport()+"</td>");
	out.println("<td bgcolor='#e6f0f1' align='center'>"+s.getVia()+"</td>");
	out.println("<td bgcolor='#e6f0f1' align='center'><a href='viewFullSchedule.jsp?flight_class=" +flight_class+ "&adults=" +adults+ "&children=" +children+ "&fId="+s.getfId()+"'><img src='images/marker_right.gif'></a></td>");
 	    	
%>
	<input type='hidden' name='fId' value='<%=s.getfId()%>'>
	<td bgcolor='#e6f0f1' align='center'><input required type='radio' name='bookingdepart' value='<%=s.getfId() %>'></td>		 
<%
	}
	out.println("</tr>");
%>
</table>
<br />
<input type='hidden' name='flight_class' value='<%=flight_class %>'>
<input type='hidden' name='adults' value='<%=adults %>'>
<input type='hidden' name='children' value='<%=children %>'>
<table width="100%" border="0">
  <tr>
    <td bgcolor='#84a3a5' align='center'>Plane Number</td>
    <td bgcolor='#84a3a5' align='center'>Date of Flight</td>
    <td bgcolor='#84a3a5' align='center'>Time of Flight</td>
    <td bgcolor='#84a3a5' align='center'>Origin Airport</td>
    <td bgcolor='#84a3a5' align='center'>Destination Airport</td>
    <td bgcolor='#84a3a5' align='center'>Via (if any)</td>
    <td bgcolor='#84a3a5' align='center'>Full Details</td>
    <td bgcolor='#84a3a5' align='center'>Add to cart</td>
  </tr>
<% 
ArrayList<SearchSchedule> al2 = (ArrayList<SearchSchedule>)request.getAttribute("searchReturn");
for (SearchSchedule s : al2) {
    out.println("<tr>");
	out.println("<td bgcolor='#e6f0f1' align='center'>"+s.getAircraft_flight_name()+"</td>");
	out.println("<td bgcolor='#e6f0f1' align='center'>"+s.getDate_of_flight()+"</td>");
	out.println("<td bgcolor='#e6f0f1' align='center'>"+s.getDeparture_time()+"</td>");
	out.println("<td bgcolor='#e6f0f1' align='center'>"+s.getOrigin_airport()+"</td>");
	out.println("<td bgcolor='#e6f0f1' align='center'>"+s.getDestination_airport()+"</td>");
	out.println("<td bgcolor='#e6f0f1' align='center'>"+s.getVia()+"</td>");
	out.println("<td bgcolor='#e6f0f1' align='center'><a href='viewFullSchedule.jsp?flight_class=" +flight_class+ "&adults=" +adults+ "&children=" +children+ "&fId="+s.getfId()+"'><img src='images/marker_right.gif'></a></td>");
 	    	
%>
	<input type='hidden' name='fId' value='<%=s.getfId()%>'>
	<td bgcolor='#e6f0f1' align='center'><input required type='radio' name='bookingreturn' value='<%=s.getfId() %>'></td>		 
<%
	}
	out.println("</tr>");
%>
</table>
<br/>
<%
try {
	if(loginStatus!=null){
		out.println("<input type='submit' value='Add to cart' class='tfbutton2' >");
	}if(loginStatus==null) {
		%>
	<center><b style="color:red">Please log in to confirm your order</b></center>
	<%
	}
}catch (Exception e) {
	System.out.println(e);
}

%>

<br/>
</form>
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
function added() {
	alert("Flight(s) added to cart!");
	return true;
}
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