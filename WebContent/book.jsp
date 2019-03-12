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
<body id="page3">
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
        <li><a href="index.jsp"><span><span>About Us</span></span></a></li>
        <li><a href="offers.jsp"><span><span>Promotions</span></span></a></li>
        <li id="menu_active"><a href="book.jsp"><span><span>Bookings</span></span></a></li>
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
        <div class="box1">
          <h2 class="top">Hot Offers of the Week</h2>
          <div class="pad"> <strong>Birmingham</strong><br>
            <ul class="pad_bot1 list1">
              <li><span class="right color1">from GBP 143.-</span>Zurich</li>
            </ul>
            <strong>London (LCY)</strong><br>
            <ul class="pad_bot1 list1">
              <li><span class="right color1">from GBP 176.-</span>Geneva</li>
              <li><span class="right color1">from GBP 109.-</span>Zurich</li>
            </ul>
            <strong>London (LHR)</strong><br>
            <ul class="pad_bot2 list1">
              <li><span class="right color1">from GBP 100.-</span>Geneva</li>
              <li><span class="right color1">from GBP 112.-</span>Zurich</li>
              <li><span class="right color1">from GBP 88.-</span>Basel</li>
            </ul>
            <strong>Manchester</strong><br>
            <ul class="pad_bot2 list1">
              <li><span class="right color1">from GBP 97.-</span>Basel</li>
              <li><span class="right color1">from GBP 103.-</span>Zurich</li>
            </ul>
            <strong>Edinburgh</strong><br>
            <ul class="pad_bot2 list1">
              <li><span class="right color1">from GBP 165.-</span>Zurich</li>
            </ul>
            <strong>Birmingham</strong><br>
            <ul class="pad_bot1 list1">
              <li><span class="right color1">from GBP 143.-</span>Zurich</li>
            </ul>
            <strong>London (LCY)</strong><br>
            <ul class="pad_bot1 list1">
              <li><span class="right color1">from GBP 176.-</span>Geneva</li>
              <li><span class="right color1">from GBP 109.-</span>Zurich</li>
            </ul>
            <strong>London (LHR)</strong><br>
            <ul class="pad_bot2 list1">
              <li><span class="right color1">from GBP 100.-</span>Geneva</li>
              <li><span class="right color1">from GBP 112.-</span>Zurich</li>
              <li><span class="right color1">from GBP 88.-</span>Basel</li>
            </ul>
          </div>
        </div>
      </article>
      <article class="col2">
          <br />
          <div class="content">
            <div class="tab-content" id="Flight">
              <form id="form_5" action="scheduleDisplay2" class="form_5" method="post">
                <div>
                  
                  <div class="pad">
                    <div class="wrapper under">
                                       &nbsp;&nbsp;
                   <div class="wrapper">
                     <input type="radio" name="flightType" value="direct" checked>
                     <span class="left1">Direct Flight&nbsp;&nbsp;</span> 
                     <input type="radio" name="flightType" value="inter">
                     <span class="left1">Transit Flight</span>
                   </div>
                   <br  />
                      <div class="col1">
                        <div class="row">
                        <span class="left">From</span>
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
                          </div>
                        <div class="row">
                        <span class="left">To</span>
                  	<select style="width:108px"name="destination_airport">
                  	  <%
                  	  	for (String s:ar2) {	
                  	  		out.println("<option value='"+s+"'>"+s+"</option>");
                  	  	}
                  	  %>
                  	  </select>
                           </div>
                      </div>
                      
                    </div>
                    <div class="wrapper under"> <span class="left">Flights</span>
                      <div class="cols marg_right1">
                        <h6>Departing date</h6>
                        <div class="row">
                          <input type="text" name="date_of_flight" class="input1" required>
                          <span class="pad_left2" style="font-size:14px !important; margin-left:0px !important;">(DD-MM-YYYY)</span>
                        </div>
                        
                        
                      </div>
                      <div class="cols">
                        <h5>Return date</h5>
                        <div class="row">
                          <input type="text" name="date_of_return" class="input1" required>
                          <span class="pad_left2" style="font-size:14px !important; margin-left:0px !important;">(DD-MM-YYYY)</span>
                        </div>
                        
                      </div>
                    </div>
                    <div class="wrapper pad_bot1"> <span class="left">Passengers</span>
                      <div class="cols marg_right1">
                        <div class="row">
                          <input type="number" name="adults" class="input2" value="0" min="1" required>
                          <span class="left">Adults</span></div>
                        <div class="row">
                          <input type="number" name="children" class="input2" value="0" min="0" required>
                          <span class="left">Children</span></div>
                      </div>
                      
                      <div class="cols">
                        <div class="select1"><span class="left">Class</span>
                          <select name="flight_class">
                          <option value="first_class" >First Class</option>
                    	  <option value="business_class">Business Class</option>
                   		  <option value="economy_class">Economy Class</option>
                          </select>
                           </div>
                        
                      </div>
                      <br />
                      <br />
                      <br />
                      
                      <span class="right relative"><a href="#"><input type="submit" value="Search" class="tfbutton2"></a></span> </div>
                  </div>
                </div>
              </form>
            </div>
            
            
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
    $('.form_5').jqTransform({
        imgPath: 'jqtransformplugin/img/'
    });
});
$(document).ready(function () {
    tabs2.init();
});
</script>
<%
} catch (Exception e) {
	System.out.println(e);
}
%>
</body>
</html>