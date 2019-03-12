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
try {
	String loginStatus = (String)session.getAttribute("User");
	System.out.println(loginStatus);
	if (loginStatus == null) {
		response.sendRedirect("index.jsp");
	}
} catch (Exception e) {
	System.out.println(e);
	response.sendRedirect("index.jsp");
}
%>
<div class="main">
  <!--header -->
  <header>
    <div class="wrapper">
      <h1><a href="index.jsp" id="logo">AirLines</a></h1>
      <span id="slogan">Fast, Frequent &amp; Safe Flights</span>
      <nav id="top_nav">
        <ul>
          <li><a href="#" class="nav1">Home</a></li>
          <li><a href="logout.jsp" class="nav3">Logout</a></li>
        </ul>
      </nav>
    </div>
    
    <nav>
      <ul id="menu">
        <li><a href="#"><span><span>About Us</span></span></a></li>
        <li><a href="#"><span><span>Promotions</span></span></a></li>
        <li><a href="#"><span><span>Bookings</span></span></a></li>
        <li class="end"><a href="#"><span><span>Contacts Us</span></span></a></li>
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
    <span id="word2">ADMINISTRATOR SETTING</span><br /><br />
    <div id="create">
    <div id="schedule">
    <form action="processCreateSchedule.jsp" method="post">
    <span class="word3">Create Data</span><img src="images/line.png" alt="" />
<u>Schedule Detail</u><br />
<div class="name1">Aircraft ID</div><input type="text" name="aId" class="input5"/><br />
<div class="name1">Origin airport</div><input type="text" name="originAirport" class="input5"/><br />
<div class="name1">Destination airport</div><input type="text" name="destinationAirport" class="input5"/><br />
<div class="name1">Country</div><input type="text" name="country" class="input5"/><br />
<div class="name1">Economy Cost</div><input type="text" name="economyCost" class="input5"/><br />
<div class="name1">Business Class Cost</div><input type="text" name="businessCost" class="input5"/><br />
<div class="name1">First Class Cost</div><input type="text" name="firstClassCost" class="input5"/><br />
<div class="name1">Date of flight</div><input type="text" name="fDate" class="input5"/><br />
<div class="name1">Departure Time</div><input type="text" name="fDepart" class="input5"/><br />
<div class="name1">Arrival Time</div><input type="text" name="fArrive" class="input5"/><br />
<div class="name1">Flight Time</div><input type="text" name="fTime" class="input5"/><br  />
<div class="name1">Flight Capacity</div><input type="text" name="flight_capacity" class="input5"/><br  />
<div class="name1">Child Economy Cost</div><input type="text" name="child_economy_cost" class="input5"/><br  />
<div class="name1">Child Business Cost</div><input type="text" name="child_business_cost" class="input5"/><br  />
<div class="name1">Child First_Class Cost</div><input type="text" name="child_first_class_cost" class="input5"/><br  />
<br />
<input type="submit" value="Create" class="tfbutton2">
</form>
</div>
<br /><br /><img src="images/line1.png" alt="" id="line"/>
<div id="aircraft">
<form action="processCreatePlane.jsp" method="post">

<u>Aircraft Detail</u><br />
<div class="name">Aircraft model</div><input type="text" name="model" class="input5"/><br />
<div class="name">Aircraft flight number</div><input type="text" name="flight_number" class="input5"/><br />
<div class="name">Flight passenger capacity</div><input type="text" name="capacity" class="input5"/><br />
<div class="name">Image path showcasing plane seat layout</div><input type="text" name="image" class="input5"/>
<br />
<input type="submit" value="Create" class="tfbutton2">
</form>
</div>
<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br/><br/>
</div>
<br />
<div id="updateanddelete">
<span class="word3">Alter Planes Data</span>
<br  />
<form action="planeUpdateDelete.jsp" method="post" >
<input type="text" class="tftextinput" name="query" placeholder="Search planes by model/flight_name..." size="55"><input type="submit" value="Search" class="tfbutton3">
</form>
<br  />
<span class="word3">Alter Schedules Data</span>
<form action="scheduleUpdateDelete.jsp" method="post" >
<input type="text" class="tftextinput" name="query" placeholder="Search schedules by origin/destination airport or dates..." size="55"><input type="submit" value="Search" class="tfbutton3">
</form>
<br  />
<span class="word3">View Bookings by Flight Number</span>
<form action="booking">
<input type="text" class="tftextinput" name="query" placeholder="Enter flight number..." size="55"><input type="submit" value="Search" class="tfbutton3">
</form>
<br  />
<span class="word3">View Top Flights by Year</span>
<form action="popular">
<input type="text" class="tftextinput" name="query" placeholder="Enter year..." size="55"><input type="submit" value="Search" class="tfbutton3">
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