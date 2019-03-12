<%@ page contentType="text/html"%>
<%@ page import="java.sql.*" %>
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
<div class="main">
  <!--header -->
  <header>
    <div class="wrapper">
      <h1><a href="index.jsp" id="logo">AirLines</a></h1>
      <span id="slogan">Fast, Frequent &amp; Safe Flights</span>
       <div id="cart">
   <form action="add2Cart.jsp" method="Post">
    
    <input type="text" class="tftextinput2"  name="q" size="15" maxlength="120" value='<%=items %> flight(s)' readonly/><input type="submit" value="MY CART" class="tfbutton1">
    </form>
    </div>
    <div id="login">
    <form action="Authenticate" method="post">
    MEMBER LOGIN:<a href="register.jsp" id="registerword">&#10148;Register now</a><br />
    <input type="text" class="tftextinput1" name="username" placeholder="Username" size="21" required>&nbsp;&nbsp;&nbsp;<input type="password" class="tftextinput1" name="password" placeholder="Password" size="21" required>&nbsp;&nbsp;&nbsp;<input type="submit" value="Login" class="tfbutton1"><br />
     <input type="checkbox" name="loginkeeping" /><span id="edit">Remember Me</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="forgotpassword.jsp" id="word">Forgot password</a>
    </form>
    </div>
    </div>
    
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
    <span id="word2">Register</span><br /><br />
    <div id="create">
    <form action="userregister" method="post">
<table width="30%" border="0" >
  <tr>
    <td align='left'>Username:</td>
    <td align='left'><input required type='text' name='name' id='name'/></td>
  </tr>
   <tr>
    <td align='left'>Gender:</td>
    <td align='left'><select name="gender"><option value='M' selected>M</option><option value='F'>F</option></select></td>
  </tr>
    <tr>
    <td align='left'>Date of Birth:</td>
    <td align='left'><input required type='date' name='dateofbrith' id='dateofbirth'/></td>
  </tr>
    <tr>
    <td align='left'>Email:</td>
    <td align='left'><input required type='email' name='email' id='email' /></td>
  </tr>
  <tr>
    <td align='left'>Password:</td>
    <td align='left'><input required type='password' name='password' id='password'/></td>
  </tr>
    <tr>
    <td align='left' colspan='2'><input type='submit' value='Confirm' class='tfbutton2' onclick="return myFunction()"><input type='reset' value='Reset' class='tfbutton2'></td>

  </tr>

</table>
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
function myFunction() {
	alert('Account Created Successfully!');
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