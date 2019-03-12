<%@ page contentType="text/html" %>
<%@ page import="java.util.*,Model.*,Connection.*,java.sql.*" %>
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
<body id="page1">
<%
int items = 0;
if (session.getAttribute("cart") != null) {
	ArrayList<FullBooking> al=(ArrayList<FullBooking>)session.getAttribute("cart");
	items = al.size();
}

try {
	Connection conn =   DBConnection.getConnection();
	String sqlStr="SELECT DISTINCT origin_airport FROM schedule ORDER BY origin_airport";
	PreparedStatement pstmt = conn.prepareCall(sqlStr);
	ResultSet rs = pstmt.executeQuery();
	ArrayList<String> ar = new ArrayList<String>();
	while (rs.next()) {
		String temp = rs.getString("origin_airport");
		ar.add(temp);
	}
	Connection conn2 =   DBConnection.getConnection();
	String sqlStr2="SELECT DISTINCT country FROM schedule ORDER BY country";
	PreparedStatement pstmt2 = conn2.prepareCall(sqlStr2);
	ResultSet rs2 = pstmt2.executeQuery();
	ArrayList<String> ar2 = new ArrayList<String>();
	while (rs2.next()) {
		String temp2 = rs2.getString("country");
		ar2.add(temp2);
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
        <li id="menu_active"><a href="index.jsp"><span><span>About Us</span></span></a></li>
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
    <div class="for_banners">
      <article class="col1">
        <div class="tabs">
          <div class="content">
            <div class="tab-content" id="Flight">
              <form id="form_1" action="scheduleDisplay2" method="post">
                <div>
                  <div class="radio">
                   <span id="word1">Search and Book Flights</span>
                   <br  /><br  />
                   <div class="wrapper">
                     <input type="radio" name="flightType" value="direct" checked>
                     <span class="left">Direct Flight</span>
                     <input type="radio" name="flightType" value="inter">
                     <span class="left">Transit Flight</span>
                   </div>
                  </div>
                  <div class="row"> <span class="left">From</span>
                  <span class="right input9">
                  	<select name="origin_airport">
                  	  <%
                  	  	for (String s:ar) {
                  	  		if(s.equals("Singapore")){
                  	  			out.println("<option value='"+s+"' selected>"+s+"</option>");
                  	  		}else{
                  	  			out.println("<option value='"+s+"'>"+s+"</option>");
                  	  		}
                  	  	}
                  	  %>
                  	</select>
                  	</span>
                  </div>
                  <div class="row"> <span class="left">To</span>
                  	<span class="right input9">
                  	<select style="width:108px"name="destination_airport">
                  	  <%
                  	  	for (String s:ar2) {	
                  	  		out.println("<option value='"+s+"'>"+s+"</option>");
                  	  	}
                  	  %>
                  	  </select>
                  	  </span>
                  </div>
                  <div class="wrapper">
                    <div class="col1">
                      <div class="row"> <span class="left">Depart</span>
                        <input required type="text" name="date_of_flight" class="input1">
                        <span class="pad_left2" style="font-size:11px !important; margin-left:92px !important;">(DD-MM-YYYY)</span>
                       </div>
                      <div class="row"> <span class="left">Return</span>
                        <input type="text" name="date_of_return" class="input1">
                        <span class="pad_left2" style="font-size:11px !important; margin-left:92px !important;">(DD-MM-YYYY)</span>
                      </div>
                    </div>
                  </div>
             
                  <div class="row"> <span class="left">Adults</span>
                    <input style="width:10em" type="number" name="adults" class="input2" id="adults" value="0" min="1">
                  </div>
                  <div class="row"> <span class="left">Children</span>
                    <input type="number" name="children" class="input2" id="children" value="0" min="0">
                    <span class="pad_left1">(2-11 years)</span> </div>
                  <div class="rows"> <span class="left">Flight Class</span>
                    <span class="right input9">
                    <select name="flight_class" >
                    <option value="first_class" >First Class</option>
                    <option value="business_class">Business Class</option>
                    <option value="economy_class">Economy Class</option>
                    </select></span>
                     <br  /><br  />
                  </div>     
                 
                  <div class="wrapper"> <span class="right relative"><a href="#"><input type="submit" value="Search" class="tfbutton2" onclick="return myFunction()"></a></span>  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </article>
      <div id="slider"> <img src="images/banner1.jpg" alt=""> <img src="images/banner2.jpg" alt=""> <img src="images/banner3.jpg" alt=""> </div>
    </div>
    <div class="wrapper pad1">
      <article class="col1">
        <div class="box1">
          <h2 class="top">Offers of the Week from UK</h2>
          <div class="pad"> <strong>From Birmingham</strong><br>
            <ul class="pad_bot1 list1">
              <li> <span class="right color1">from GBP 143.-</span>Zurich </li>
            </ul>
            <strong>From London City</strong><br>
            <ul class="pad_bot1 list1">
              <li> <span class="right color1">from GBP 176.-</span> Basel </li>
              <li> <span class="right color1">from GBP 109.-</span> Geneva </li>
            </ul>
            <strong>From London Heathrow</strong><br>
            <ul class="pad_bot2 list1">
              <li> <span class="right color1">from GBP 100.-</span> Geneva </li>
              <li> <span class="right color1">from GBP 112.-</span> Zurich </li>
              <li> <span class="right color1">from GBP 88.-</span> Basel </li>
            </ul>
          </div>
          <h2>From Ireland To Switzerland</h2>
          <div class="pad"> <strong>From Dublin</strong><br>
            <ul class="pad_bot2 list1">
              <li class="pad_bot1"> <span class="right color1">from EUR 122.-</span> Zurich </li>
            </ul>
          </div>
        </div>
      </article>
      <article class="col2">
        <h3>About Our Airlines<span>Template created by TemplateMonster.com team</span></h3>
        <div class="wrapper">
          <article class="cols">
            <figure><img src="images/page1_img1.jpg" alt="" class="pad_bot2"></figure>
            <p class="pad_bot1"><strong>Airlines is one of free website templates created by TemplateMonster.com team.</strong></p>
            <p>This website template is optimized for 1024X768 screen resolution. It is also XHTML &amp; CSS valid. This website template has several pages: <a href="index.jsp">About</a>, <a href="offers.jsp">Promotions</a>, <a href="book.jsp">Bookings</a>, <a href="contacts.jsp">Contacts Us</a>.</p>
          </article>
          <article class="cols pad_left1">
            <figure><img src="images/page1_img2.jpg" alt="" class="pad_bot2"></figure>
            <p class="pad_bot1"><strong>This Airlines Template goes with two packages.</strong></p>
            <p>With PSD source files and without them. PSD source files are available for free for the registered members of Templates.com. The basic package (without PSD source files) is available for anyone without registration).</p>
          </article>
        </div>
        </article>
    </div>
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
function myFunction() {
	var adults=document.getElementById("adults");
	var no = parseInt(adults, 10);
	if (no == 0) {
		alert("Please book for at least 1 adult!");
		return false;
	}
	return true;
}
$(document).ready(function () {
    tabs.init();
});
jQuery(document).ready(function ($) {
    $('#form_1, #form_2, #form_3').jqTransform({
        imgPath: 'jqtransformplugin/img/'
    });
});
$(window).load(function () {
    $('#slider').nivoSlider({
        effect: 'fade', //Specify sets like: 'fold,fade,sliceDown, sliceDownLeft, sliceUp, sliceUpLeft, sliceUpDown, sliceUpDownLeft' 
        slices: 15,
        animSpeed: 500,
        pauseTime: 6000,
        startSlide: 0, //Set starting Slide (0 index)
        directionNav: false, //Next & Prev
        directionNavHide: false, //Only show on hover
        controlNav: false, //1,2,3...
        controlNavThumbs: false, //Use thumbnails for Control Nav
        controlNavThumbsFromRel: false, //Use image rel for thumbs
        controlNavThumbsSearch: '.jpg', //Replace this with...
        controlNavThumbsReplace: '_thumb.jpg', //...this in thumb Image src
        keyboardNav: true, //Use left & right arrows
        pauseOnHover: true, //Stop animation while hovering
        manualAdvance: false, //Force manual transitions
        captionOpacity: 1, //Universal caption opacity
        beforeChange: function () {},
        afterChange: function () {},
        slideshowEnd: function () {} //Triggers after all slides have been shown
    });
});
</script>
<%
} catch (Exception e) {
	System.out.println(e);
}
%>
</body>
</html>