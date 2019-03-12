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
<script type="text/javascript" language="javascript">
function verify(person) {	  
var person=document.getElementById("name").value;
	  alert("You have submit your feedback sucessfully! Thank you " + person +"!");  
	  open("index.jsp")
  	  }

</script>
<!--[if lt IE 9]>
<script type="text/javascript" src="js/html5.js"></script>
<style type="text/css">.main, .tabs ul.nav a, .content, .button1, .box1, .top { behavior:url("../js/PIE.htc")}</style>
<![endif]-->
</head>
<body id="page6">
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
        <li id="menu_active" class="end"><a href="contacts.jsp"><span><span>Contacts Us</span></span></a></li>
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
      <article class="col4">
        <div class="box1">
          <h2 class="top">Contact Us</h2>
          <div class="pad">
            <div class="wrapper pad_bot1">
              <p class="cols pad_bot2"><strong>Country:<br>
                City:<br>
                Address:<br><br><br><br><br>
                Operating Hours:<br><br>
                Tel:<br>
                Email:</strong></p>
              <p class="color1 pad_bot2">Singapore<br>
                Singapore<br>
                2 Orchard Turn<br>
#03-05 ION Orchard<br>
Singapore 238801<br>
(Above Orchard MRT station)<br>
9am - 11pm (Mon - Fri),<br>
 10am - 11pm(Sat - Sun)<br>
  +65 63301996<br>
                <a href="#">SP@hotmail.com</a></p>
                <br />
               
           <iframe width="300" height="300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.com.sg/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=2+Orchard+Turn+%2303-05+ION+Orchard+Singapore+238801&amp;aq=&amp;sll=1.359,103.818&amp;sspn=0.376862,0.591202&amp;t=h&amp;ie=UTF8&amp;hq=2+Orchard+Turn+%2303-05+ION+Orchard+Singapore+238801&amp;ll=1.304086,103.831864&amp;spn=0.006295,0.006295&amp;output=embed"></iframe>
           <br /><br />
            </div>
          </div>
         
        </div>
      </article>
      <article class="col2">
        <h3 class="pad_top1">Contact Form</h3>
        <form id="ContactForm" name="feedback" method="post" action="#" onSubmit="return verify()">
          <div>
            <div  class="wrapper"> <span>Name:</span>
              <SELECT name="greeting" size="1" class="input3">
            <OPTION value="0">Mr</OPTION>
            <OPTION value="1">Ms</OPTION>
            <OPTION value="2">Miss</OPTION>
            <OPTION value="3">Mrs</OPTION>
</SELECT>&nbsp;<input required type="text" name="person" id="name" class="input4"/>
            </div>
            <div  class="wrapper"> <span>Email:</span>
              <input required type="email" name="emailAddr" maxlength="25" class="input">
            </div>
            <div  class="textarea_box"> <span>Message:</span>
              <textarea name="textarea" cols="1" rows="1"></textarea>
            </div>
            <div id="shiftbutton1">
            <a href="#"><input type="submit" value="Submit" class="tfbutton2"></a><a href="#"><input type="reset" value="Clear" class="tfbutton2"></a></div> </div>
        </form>
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
</body>
</html>