<%@ page contentType="text/html" %>
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
<body id="page2">
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
        <li id="menu_active"><a href="offers.jsp"><span><span>Promotions</span></span></a></li>
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
    <div class="wrapper pad1">
      <article class="col1">
        <div class="pad_bot3">
          <h2 class="top">Hot Offers of the Week</h2>
          <div class="pad"> <strong>Birmingham</strong><br>
            <ul class="pad_bot1 list1">
              <li> <span class="right color1">from GBP 143.-</span> Zurich </li>
            </ul>
            <strong>London (LCY)</strong><br>
            <ul class="pad_bot1 list1">
              <li> <span class="right color1">from GBP 176.-</span> Geneva </li>
              <li> <span class="right color1">from GBP 109.-</span> Zurich </li>
            </ul>
            <strong>London (LHR)</strong><br>
            <ul class="pad_bot2 list1">
              <li> <span class="right color1">from GBP 100.-</span> Geneva </li>
              <li> <span class="right color1">from GBP 112.-</span> Zurich </li>
              <li> <span class="right color1">from GBP 88.-</span> Basel </li>
            </ul>
            <strong>Manchester</strong><br>
            <ul class="pad_bot2 list1">
              <li> <span class="right color1">from GBP 97.-</span> Basel</li>
              <li> <span class="right color1">from GBP 103.-</span> Zurich </li>
            </ul>
            <strong>Edinburgh</strong><br>
            <ul class="pad_bot2 list1">
              <li> <span class="right color1">from GBP 165.-</span> Zurich </li>
            </ul>
          </div>
        </div>
      </article>
      <article class="col2">
        <h3 class="pad_top1">UK Europe Specials</h3>
        <div class="wrapper pad_bot3">
          <figure class="left marg_right1"><img src="images/page2_img1.jpg" alt=""></figure>
          <div class="cols">
            <h4>From UK</h4>
            <ul class="list1">
              <li> <span class="color1 right">from GBP 130.-</span> Malaga</li>
              <li> <span class="color1 right">GBP 144.-</span> Rome </li>
              <li> <span class="color1 right">from GBP 146.-</span>Budapest </li>
              <li> <span class="color1 right">from GBP 146.-</span> Bucharest</li>
              <li> <span class="color1 right">from GBP 159.-</span>Athens </li>
             </ul>
          </div>
        </div>
        <h3>Switzerland Special from UK</h3>
        <div class="wrapper pad_bot3">
          <figure class="left marg_right1"><img src="images/page2_img2.jpg" alt=""></figure>
          <div class="cols">
            <h4>From Birmingham</h4>
            <ul class="list1 pad_bot1">
              <li> <span class="color1 right">from GBP 143.-</span> Zurich</a> </li>
            </ul>
            <h4>From London Heatrow</h4>
            <ul class="list1 pad_bot1">
              <li> <span class="color1 right">from GBP 146.-</span> Zurich </li>
              <li> <span class="color1 right">from GBP 146.-</span> Geneva </li>
              <li> <span class="color1 right">from GBP 159.-</span>Basel </li>
            </ul>
            <h4>From Manchester</h4>
            <ul class="list1">
              <li> <span class="color1 right">from GBP 146.-</span> Zurich </li>
              <li> <span class="color1 right">from GBP 146.-</span> Geneva </li>
              <li> <span class="color1 right">from GBP 159.-</span> Basel </li>
            </ul>
          </div>
        </div>
        <h3>UK Intercontinental Economy Special</h3>
        <div class="wrapper">
          <figure class="left marg_right1"><img src="images/page2_img3.jpg" alt=""></figure>
          <div class="cols">
            <h4>From UK</h4>
            <ul class="list1 pad_bot1">
              <li> <span class="color1 right">from GBP 464.-</span> Hong Kong </li>
              <li> <span class="color1 right">from GBP 509.-</span> Johannesburg</li>
              <li> <span class="color1 right">from GBP 601.-</span>Bangkok </li>
              <li> <span class="color1 right">from GBP 727.-</span> Paulo </li>
              <li> <span class="color1 right">from GBP 464.-</span>Zurich </li>
              <li> <span class="color1 right">from GBP 509.-</span>Geneva</li>
              <li> <span class="color1 right">from GBP 601.-</span>Basel </li>
             
            </ul>
            Book by 15 May 2015 and travel between 16 June and 30 June 2015. </div>
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
jQuery(document).ready(function ($) {
    $('#form_4').jqTransform({
        imgPath: 'jqtransformplugin/img/'
    });
});
</script>
</body>
</html>