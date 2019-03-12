<%@ page contentType="text/html"%>
<%@page import="java.util.*,Model.*" %>
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

<script type="text/javascript">
function validate(){
	var validateSuccess=true;
	var errMsg="";
	var errMsg1="";
	var errMsg2="";
	var errMsg3="";
	var errMsg4="";
	var msgBox=document.getElementById("msg");
	var msgBox1=document.getElementById("msg1");
	var msgBox2=document.getElementById("msg2");
	var msgBox3=document.getElementById("msg3");
	var msgBox4=document.getElementById("msg4");
	var idBox=document.getElementById("cardCV2");
	var idBox1=document.getElementById("cardexpiry");
	var idBox2=document.getElementById("cardno");
	var idBox3=document.getElementById("hp");
	var idBox4=document.getElementById("email");
	if(!idBox.value.match(/^[0-9]+$/)){
		errMsg+="<font color='red'>Please enter your security number</font>";
		idBox.style.borderColor = "red";
		validateSuccess=false;
	}else{
		idBox.style.borderColor = "#e5e5e5";
	}
	if(!idBox1.value.match(/^(0[1-9]|1\d|2[0-8]|29(?=-\d\d-(?!1[01345789]00|2[1235679]00)\d\d(?:[02468][048]|[13579][26]))|30(?!-02)|31(?=-0[13578]|-1[02]))-(0[1-9]|1[0-2])-([12]\d{3})?$/gm)){
		errMsg1+="<font color='red'>Please enter your card expiry date</font>";
		idBox1.style.borderColor = "red";
		validateSuccess=false;
	}else{
		idBox1.style.borderColor = "#e5e5e5";
	}
	if(!idBox2.value.match(/^[0-9-]+$/)){
		errMsg2+="<font color='red'>Please enter your card number</font>";
		idBox2.style.borderColor = "red";
		validateSuccess=false;
	}else{
		idBox2.style.borderColor = "#e5e5e5";
	}
	if(!idBox3.value.match(/^[0-9]+$/)){
		errMsg3+="<font color='red'>Please enter your handphone number</font>";
		idBox3.style.borderColor = "red";
		validateSuccess=false;
	}else{
		idBox3.style.borderColor = "#e5e5e5";
	}
	if(!idBox4.value.match(/.+@.+\..{2,6}/)){
		errMsg4+="<font color='red'>Please enter your email</font>";
		idBox4.style.borderColor = "red";
		validateSuccess=false;
	}else{
		idBox4.style.borderColor = "#e5e5e5";
	}
	msgBox.innerHTML=errMsg;
	msgBox1.innerHTML=errMsg1;
	msgBox2.innerHTML=errMsg2;
	msgBox3.innerHTML=errMsg3;
	msgBox4.innerHTML=errMsg4;
	
	
	
	
	var adultid=document.getElementsByClassName("adultid");
	for (var a = 0; a < adultid.length; a++) {
		var err = "";
		var msg=document.getElementById("adultidmsg"+a);
		if(!adultid[a].value.match(/^[a-zA-Z ]+$/)) {
    		err="<font color='red'>Please enter your full name</font>";
    		adultid[a].style.borderColor = "red";
			validateSuccess=false;
		
		}else{
			err+="";
			adultid[a].style.borderColor = "#e5e5e5";
		}
		msg.innerHTML=err;
	}

	var adultdateofbirth=document.getElementsByClassName("adultdateofbirth");
	for (var b = 0; b < adultdateofbirth.length; b++) {
		var err1 = "";
		var msg1=document.getElementById("adultdateofbirthmsg"+b);
		if(!adultdateofbirth[b].value.match(/^(0[1-9]|1\d|2[0-8]|29(?=-\d\d-(?!1[01345789]00|2[1235679]00)\d\d(?:[02468][048]|[13579][26]))|30(?!-02)|31(?=-0[13578]|-1[02]))-(0[1-9]|1[0-2])-([12]\d{3})?$/gm)){
			err1="<font color='red'>Please enter your date of birth</font>";
			adultdateofbirth[b].style.borderColor = "red";
			validateSuccess=false;
		
		}else{
			err1+="";
			adultdateofbirth[b].style.borderColor = "#e5e5e5";
		}
		msg1.innerHTML=err1;
	}
	var adultpass=document.getElementsByClassName("adultpass");
	for (var c = 0; c < adultpass.length; c++) {
		var err2 = "";
		var msg2=document.getElementById("adultpassmsg"+c);
		if(!adultpass[c].value.match(/^[A-Z0-9]+$/)){
			err2="<font color='red'>Please enter your passport</font>";
			adultpass[c].style.borderColor = "red";
			validateSuccess=false;
		
		}else{
			err2+="";
			adultpass[c].style.borderColor = "#e5e5e5";
		}
		msg2.innerHTML=err2;
	}
	
	var childid=document.getElementsByClassName("childid");
	for (var d = 0; d < childid.length; d++) {
		 var err3 = "";
		var msg3=document.getElementById("childidmsg"+d);
		if(!childid[d].value.match(/^[a-zA-Z ]+$/)){
			err3="<font color='red'>Please enter your full name</font>";
			childid[d].style.borderColor = "red";
			validateSuccess=false;
		}else{
			err3+="";
			childid[d].style.borderColor = "#e5e5e5";
		}
		msg3.innerHTML=err3;
	} 
	
	var childdateofbirth=document.getElementsByClassName("childdateofbirth");
	for (var e = 0; e < childdateofbirth.length; e++) {
		var err4 = "";
		var msg4=document.getElementById("childdateofbirthmsg"+e);
		if(!childdateofbirth[e].value.match(/^(0[1-9]|1\d|2[0-8]|29(?=-\d\d-(?!1[01345789]00|2[1235679]00)\d\d(?:[02468][048]|[13579][26]))|30(?!-02)|31(?=-0[13578]|-1[02]))-(0[1-9]|1[0-2])-([12]\d{3})?$/gm)){
			err4="<font color='red'>Please enter your date of birth</font>";
			childdateofbirth[e].style.borderColor = "red";
			validateSuccess=false;
		}else{
			err4=" ";
			childdateofbirth[e].style.borderColor = "#e5e5e5";
		}
		msg4.innerHTML=err4;
	} 
	var childpass=document.getElementsByClassName("childpass");
	for (var f = 0; f < childpass.length; f++) {
		var err5 = "";
		var msg5=document.getElementById("childpassmsg"+f);
		if(!childpass[f].value.match(/^[A-Z0-9]+$/)){
			err5="<font color='red'>Please enter your passport</font>";
			childpass[f].style.borderColor = "red";
			validateSuccess=false;
		}else{
			err5+="";
			childpass[f].style.borderColor = "#e5e5e5";
		}
		msg5.innerHTML=err5;
	} 
	 
	if(validateSuccess){
		alert("You have successfully submitted your details!");
	}
	
	return validateSuccess;
	
	/* var errMsg6="";
	var errMsg7="";
	var errMsg8=""; 
	var errMsg9="";
	var errMsg10=""; */
	
/* 	var msgBox6=document.getElementById("msg6");
	var msgBox7=document.getElementById("msg7");
	var msgBox8=document.getElementById("msg8");
 	var msgBox9=document.getElementById("msg9");
	var msgBox10=document.getElementById("msg10"); */ 
	
	//var Box1=document.getElementsByClassName("adultdateofbirth");
	//var Box2=document.getElementsByClassName("adultpass");
	//var Box3=document.getElementsByClassName("childid");
	//var Box4=document.getElementsByClassName("childdateofbirth");
	//var Box5=document.getElementsByClassName("childpass");
	//var idBox5=document.getElementByClass("adultid");
	//var idBox6=document.getElementById("adultdateofbirth");
	//var idBox7=document.getElementById("adultpass");
	//var idBox8=document.getElementById("childid");
	//var idBox9=document.getElementById("childdateofbirth");
	//var idBox10=document.getElementById("childpass"); 
 
	
	/* if(!idBox5.value.match(/^[a-zA-Z ]+$/)){
		errMsg5+="<font color='red'>Please enter your full name</font>";
		idBox5.style.borderColor = "red";
		validateSuccess=false;
	}else{
		idBox5.style.borderColor = "#e5e5e5";
	}
	if(!idBox6.value.match(/^(0[1-9]|1\d|2[0-8]|29(?=-\d\d-(?!1[01345789]00|2[1235679]00)\d\d(?:[02468][048]|[13579][26]))|30(?!-02)|31(?=-0[13578]|-1[02]))-(0[1-9]|1[0-2])-([12]\d{3})?$/gm)){
		errMsg6+="<font color='red'>Please enter your date of birth</font>";
		idBox6.style.borderColor = "red";
		validateSuccess=false;
	}else{
		idBox6.style.borderColor = "#e5e5e5";
	}
	if(!idBox7.value.match(/^[A-Z0-9]+$/)){
		errMsg7+="<font color='red'>Please enter your passport</font>";
		idBox7.style.borderColor = "red";
		validateSuccess=false;
	}else{
		idBox7.style.borderColor = "#e5e5e5";
	}
	if(!idBox8.value.match(/^[a-zA-Z ]+$/)){
		errMsg8+="<font color='red'>Please enter your full name</font>";
		idBox8.style.borderColor = "red";
		validateSuccess=false;
	}else{
		idBox8.style.borderColor = "#e5e5e5";
	}
	if(!idBox9.value.match(/^(0[1-9]|1\d|2[0-8]|29(?=-\d\d-(?!1[01345789]00|2[1235679]00)\d\d(?:[02468][048]|[13579][26]))|30(?!-02)|31(?=-0[13578]|-1[02]))-(0[1-9]|1[0-2])-([12]\d{3})?$/gm)){
		errMsg9+="<font color='red'>Please enter your date of birth</font>";
		idBox9.style.borderColor = "red";
		validateSuccess=false;
	}else{
		idBox9.style.borderColor = "#e5e5e5";
	}
	if(!idBox10.value.match(/^[A-Z0-9]+$/)){
		errMsg10+="<font color='red'>Please enter your passport</font>";
		idBox10.style.borderColor = "red";
		validateSuccess=false;
	}else{
		idBox10.style.borderColor = "#e5e5e5";
	} */
	
	
	/* msgBox6.innerHTML=errMsg6;
	msgBox7.innerHTML=errMsg7;
	msgBox8.innerHTML=errMsg8;
	msgBox9.innerHTML=errMsg9;
	msgBox10.innerHTML=errMsg10; */


	
	//var validateSuccess=true;
	//var validateSuccess1=true;
	//var validateSuccess2=true;
	//var validateSuccess3=true;
	//var validateSuccess4=true;
	//var validateSuccess5=true;
	//var Box=document.getElementsByClassName("adultid");
	//var Box1=document.getElementsByClassName("childid");
	//var Box2=document.getElementsByClassName("adultpass");
	//var Box3=document.getElementsByClassName("childpass");
	//var Box4=document.getElementsByClassName("dateofbirth");
	//var Box5=document.getElementsByClassName("email");
	//var Box7=document.getElementsByClassName("hp");
	//var Box8=document.getElementsByClassName("cardno");
	//for (var a = 0; a < Box.length; a++) {
		//if(!Box[a].value.match(/^[a-zA-Z ]+$/)) {
	    	//validateSuccess=false;
		//}
	//}
	//for (var c = 0; c < Box1.length; c++) {
		//if(!Box1[c].value.match(/^[a-zA-Z ]+$/)) {
	    	//validateSuccess=false;
		//}
	//}
	//for (var ap = 0; ap < Box2.length; ap++) {
		//if(!Box2[ap].value){
		//if(!Box2[ap].value.match(/^[A-Z0-9]+$/)){
			//validateSuccess1=false;
        //}
	//}
	//for (var ac = 0; ac < Box3.length; ac++) {
		//if(!Box3[ac].value) {
		//if(!Box3[ac].value.match(/^[A-Z0-9]+$/)) {
	    	//validateSuccess1=false;
		//}
	//}
	//for (var dob = 0; dob < Box4.length; dob++) {
		//if(!Box4[dob].value) {
		//if(!Box4[dob].value.match(/^(0[1-9]|1\d|2[0-8]|29(?=-\d\d-(?!1[01345789]00|2[1235679]00)\d\d(?:[02468][048]|[13579][26]))|30(?!-02)|31(?=-0[13578]|-1[02]))-(0[1-9]|1[0-2])-([12]\d{3})?$/gm)) {
	    	//validateSuccess2=false;
		//}
	//}
	//for (var e = 0; e < Box5.length; e++) {
	//	if(!Box5[e].value) {
		//if(!Box5[e].value.match(/.+@.+\..{2,6}/)) {
	    	//validateSuccess3=false;
		//}
	//}
	//for (var hpno = 0; hpno < Box7.length; hpno++) {
		//if(!Box7[hpno].value) {
		//if(!Box7[hpno].value.match(/^[0-9]+$/)) {
	    	//validateSuccess4=false;
		//}
	//}
	//for (var cno = 0; cno < Box8.length; cno++) {
		//if(!Box8[cno].value) {
		//if(!Box8[cno].value.match(/^[0-9]+$/)) {
	    	//validateSuccess5=false;
		//}
	//}
	//if(!validateSuccess){
		//alert("You did not enter your full name");
		//Box.focus();
	//}
	//else if(!validateSuccess1){
		//alert("You did not enter numeric characters for your passport! (Allowed input:0-9)");
		//Box.focus();
	//}
	//else if(!validateSuccess2){
		//alert("You did not enter the correct date format!");
		//Box.focus();
	//}
	//else if(!validateSuccess3){
		//alert("You did not enter the correct email format!");
		//Box.focus();
	//}
	//else if(!validateSuccess4){
		//alert("You did not enter numeric characters for your handphone number! (Allowed input:0-9)");
		//Box.focus();
	//}
	//else if(!validateSuccess5){
		//alert("You did not enter numeric characters for your card number! (Allowed input:0-9)");
		//Box.focus();
	//}
	//return validateSuccess, validateSuccess1, validateSuccess2, validateSuccess3, validateSuccess4, validateSuccess5;
}
</script>

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
    <span id="word2">Customer Details</span><br /><br />
    <div id="create">
    All items marked with an asterisk(<font color='red'>*</font>) are required<br/><br/>
   	<form action="processCreateBooking" method="post">
   	<input type='hidden' name='loginStatus' value='<%=loginStatus%>'>
   <% 
try {
	ArrayList<FullBooking> al=(ArrayList<FullBooking>)session.getAttribute("cart");
	FullBooking b=al.get(0);
		for(FullBooking z:al){
%>
		<input type='hidden' name='fId' value='<%=z.getFlight_schedule_id() %>'>
<%
		}
		System.out.println(b.getFlight_schedule_id());
		out.println("<img src='images/line.png' alt=''/>");
		out.println("<table width='100%' border='0'>");
		out.println("<tr>");
		out.println(" <td width='32%'><u>"+b.getOrigin_airport()+" &#8594; "+b.getDestination_airport()+"</u></td>");
		out.println(" <td>&nbsp;</td>");
		out.println(" <td width='48%'>&nbsp;</td>");
		out.println("</tr>");
		for(int a=0; a<b.getTotal(); a++) {
			if(a<b.getAdults()){
		out.println("<tr>");
		out.println(" <td><b style='font-size:20px;'>Particular "+(a+1)+"-Adults </b></td>");
		out.println(" <td>&nbsp;</td>");
		out.println(" <td>&nbsp;</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println(" <td>Title:</td>");
		out.println(" <td><SELECT name='adulttitle' size='1'><OPTION value='Mr'>Mr</OPTION><OPTION value='Ms'>Ms</OPTION></SELECT></td>");
		out.println(" <td>&nbsp;</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println(" <td><font color='red'>*</font>Full Name:</td>");
		out.println(" <td><input type='text' name='adultid' class='adultid' /></td>");
		out.println(" <td><div id='adultidmsg"+a+"'></div></td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println(" <td><font color='red'>*</font>Date of Birth(in DD-MM-YYYY format):</td>");
		out.println(" <td><input type=text name='adultdateofbirth' class='adultdateofbirth'/></td>");
		out.println(" <td><div id='adultdateofbirthmsg"+a+"'></div></td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println(" <td><font color='red'>*</font>Passport no.:</td>");
		out.println(" <td><input type='text' name='adultpass' class='adultpass'/></td>");
		out.println(" <td><div id='adultpassmsg"+a+"'></div></td>");
		out.println("</tr>");
			}else{
		out.println("<tr>");
		out.println(" <td><b style='font-size:20px;'>Particular "+(a+1)+"-Child</b></td>");
		out.println(" <td>&nbsp;</td>");
		out.println(" <td>&nbsp;</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println(" <td>Title:</td>");
		out.println(" <td><SELECT name='childtitle' size='1'><OPTION value='Mr'>Mr</OPTION><OPTION value='Ms'>Ms</OPTION></SELECT></td>");
		out.println(" <td>&nbsp;</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println(" <td><font color='red'>*</font>Full Name:</td>");
		out.println(" <td><input type='text' name='childid' class='childid'/></td>");
		out.println(" <td><div id='childidmsg"+(a-b.getAdults())+"'></div></td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println(" <td><font color='red'>*</font>Date of Birth(in DD-MM-YYYY format):</td>");
		out.println(" <td><input type=text name='childdateofbirth' class='childdateofbirth'/> </td>");
		out.println(" <td><div id='childdateofbirthmsg"+(a-b.getAdults())+"'></div></td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println(" <td><font color='red'>*</font>Passport no.:</td>");
		out.println(" <td><input type='text' name='childpass' class='childpass'/></td>");
		out.println(" <td><div id='childpassmsg"+(a-b.getAdults())+"'></div></td>");
		out.println("</tr>");
			}
		}
		out.println("<tr>");
		out.println(" <td><b style='font-size:20px;'>Contact details</b></td>");
		out.println(" <td>&nbsp;</td>");
		out.println(" <td>&nbsp;</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println(" <td colspan='3'>Please enter your the contact details we should use in the event of flight disruptions or schedule changes.</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println(" <td><font color='red'>*</font>Email address:</td>");
		out.println(" <td><input type='text' name='email' id='email' /></td>");
		out.println(" <td><div id='msg4'></div></td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println(" <td><font color='red'>*</font>Contact number:</td>");
		out.println(" <td><input type='text' name='handphone' id='hp'/></td>");
		out.println(" <td><div id='msg3'></div></td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println(" <td><b style='font-size:20px;'>Payment</b></td>");
		out.println(" <td>&nbsp;</td>");
		out.println(" <td>&nbsp;</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println(" <td>Amount:</td>");
		out.println(" <td><input type='text' name='user' value='$"+(b.getTotalcost()*2)+"' disabled/></td>");
		out.println(" <td>&nbsp;</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println(" <td>Card type:</td>");
		out.println(" <td><SELECT size='1' name='cardtype'><OPTION value='Visa'>Visa</OPTION><OPTION value='MasterCard'>MasterCard</OPTION></SELECT></td>");
		out.println(" <td>&nbsp;</td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println(" <td><font color='red'>*</font>Card number:</td>");
		out.println(" <td><input type='text' name='cardnumber' id='cardno'/></td>");
		out.println(" <td><div id='msg2'></div></td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println(" <td><font color='red'>*</font>Card Expiry Date:</td>");
		out.println(" <td><input type='text' name='cardexpiry' id='cardexpiry'/></td>");
		out.println(" <td><div id='msg1'></div></td>");
		out.println("</tr>");
		out.println("<tr>");
		out.println(" <td><font color='red'>*</font>Security Number:</td>");
		out.println(" <td><input type='text' name='cardCV2' id='cardCV2'/></td>");
		out.println(" <td><div id='msg'></div></td>");
		out.println("</tr>");
		
		
		out.println("</table>");
		/* out.println("<u>"+b.getOrigin_airport()+" &#8594; "+b.getDestination_airport()+"</u>"+"<br/><br/>");
		for(int a=1; a<=b.getTotal(); a++) {
			if(a<=b.getAdults()){
				out.println("<b style='font-size:20px;'>Particular "+a+"-Adults </b><br/><br/>");
				out.println("<span class='name1'>Title:</span>");
				out.println("<SELECT name='adulttitle' size='1' class='input7'>");
				out.println("<OPTION value='Mr'>Mr</OPTION>");
				out.println("<OPTION value='Ms'>Ms</OPTION>");
				out.println("</SELECT><br/>");
				out.println("<span class='name1'><font color='red'>*</font>Full Name:</span>");
				out.println("<input type='text' name='adultid' class='adultid input8' id='adultid"+a+"'/><br/>");
				out.println("<span class='name1'><font color='red'>*</font>Date of Birth:</span>");	
				out.println("<input type=text name='adultdateofbirth' class='dateofbirth input8'> (in DD-MM-YYYY format)<br/>");	
				out.println("<span class='name1'><font color='red'>*</font>Passport no.:</span>");
				out.println("<input type='text' name='adultpass' class='adultpass input8'/>");
				out.println("<br/><br/>");			
			}else{
				out.println("<b style='font-size:20px;'>Particular "+a+"-Child</b><br/><br/>");
				out.println("<span class='name1'>Title:</span>");
				out.println("<SELECT name='childtitle' size='1' class='input7'>");
				out.println("<OPTION value='Mr'>Mr</OPTION>");
				out.println("<OPTION value='Ms'>Ms</OPTION>");
				out.println("</SELECT><br/>");
				out.println("<span class='name1'><font color='red'>*</font>Full Name:</span>");
				out.println("<input type='text' name='childid' class='childid input8'/>");
				out.println("<br/>");	
				out.println("<span class='name1'><font color='red'>*</font>Date of Birth:</span>");	
				out.println("<input type=text name='childdateofbirth' class='dateofbirth input8'> (in DD-MM-YYYY format)<br/>");	
				out.println("<span class='name1'><font color='red'>*</font>Passport no.:</span>");
				out.println("<input type='text' name='childpass' class='childpass input8'/><br/><br/>");
			}
			
		}
		out.println("<b style='font-size:20px;'>Contact details</b><br/>");
		out.println("<span style='color:red'>Please enter your the contact details we should use in the event of flight disruptions or schedule changes.</span><br/>");
		out.println("<span class='name1'><font color='red'>*</font>Email address:</span>");
		out.println("<input type='text' name='email' id='email' class='input8'/><br/>");
		out.println("<span class='name1'><font color='red'>*</font>Contact number:</span>");
		out.println("<input type='text' name='handphone' id='hp' class='input8'/><br/><br/>");
		out.println("<b style='font-size:20px;'>Payment</b><br/>");
		out.println("<span class='name1'>Amount:</span>");
		out.println("<input type='text' name='user' class='input8' value='$"+b.getTotalcost()+"' disabled/><br/>");
		out.println("<span class='name1'>Card type:</span>");
		out.println("<SELECT size='1' name='cardtype' class='input7'>");
		out.println("<OPTION value='Visa'>Visa</OPTION>");
		out.println("<OPTION value='MasterCard'>MasterCard</OPTION>");
		out.println("</SELECT><br/>");
		out.println("<span class='name1'>Card number:</span>");
		out.println("<input type='text' name='cardnumber' id='cardno' class='input8'/><br/>");
		out.println("<span class='name1'>Card Expiry Date:</span>");
		out.println("<input type='text' name='cardexpiry' id='cardexpiry' class='input8'/><br/>");
		out.println("<span class='name1'>CV2 Number:</span>");
		out.println("<input type='text' name='cardCV2' class='input8' id='cardCV2'/><br/>");
		out.println("<br/><br/>"); */
	
} catch (Exception e) {
	System.out.println(e);
}
%>
<%
//try {
	//ArrayList<FullBooking> al=(ArrayList<FullBooking>)session.getAttribute("cart");
	//if(session.getAttribute("cart") != null){
		//out.println("<input type='submit' value='Confirm' class='tfbutton2'  onclick='return validate()'>");
	//}else{
		
	//}
//}catch (Exception e) {
	//System.out.println(e);
//}

%>
<%
try {
	ArrayList<FullBooking> al=(ArrayList<FullBooking>)session.getAttribute("cart");
	if(loginStatus!=null && session.getAttribute("cart") != null){
		out.println("<form action='customerdetails.jsp'><input type='submit' value='Confirm' class='tfbutton2' onclick='return validate()'></form>");
	}if(loginStatus==null) {
		%>
		<center><b style="color:red">Please log in to confirm your order</b></center>
	<%
	}
	
}catch (Exception e) {
	System.out.println(e);
}

%>

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