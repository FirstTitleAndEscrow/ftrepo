<CFPARAM NAME="a_trigger" DEFAULT="0">
<html>
<head>
<title>Contact Us</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}
P {font:bold 11px Courier,Verdana,Tahoma,Arial}
.menu1 {color:#FFFFFF;font:normal bold 13px Arial, Helvetica, sans-serif;text-align:center;font-color:#FFFFFF}
.menu1:link    {text-decoration:none;color:#FFFFFF} 
.menu1:visited {text-decoration:none;color:#FFFFFF} 
.menu1:hover   {font:normal bold 13px Arial, Helvetica, sans-serif;text-decoration:none;color:#000000} 
.menu2 {color:#FFFFFF;font:normal bold 13px Arial, Helvetica, sans-serif;text-align:center;font-color:#FFFFFF}
.menu2:link    {text-decoration:none;color:#000000} 
.menu2:visited {text-decoration:none;color:#000000} 
.menu2:hover   {font:normal bold 14px Arial, Helvetica, sans-serif;text-decoration:none;color:#FFFFFF}
.menu3 {color:#FFFFFF;font:normal bold 10px Verdana, Arial, Helvetica, sans-serif;text-align:center;font-color:#FFFFFF}
.menu3:link    {text-decoration:none;color:#FFFFFF} 
.menu3:visited {text-decoration:none;color:#FFFFFF} 
.menu3:hover   {font:normal bold 11px Verdana, Arial, Helvetica, sans-serif;text-decoration:none;color:#FF3300}

</STYLE> 

<script language="JavaScript" type="text/JavaScript">
<!--
function validate_form() {
var valid = true;
var message = "The following fields must be completed before submitting:\n";
if (document.register_form.UID.value=='') {
message = message + "UserName\n"
valid = false;
}
if (document.register_form.PWD.value=='') {
message = message + "Password\n"
valid = false;
}
if (document.register_form.PWD2.value=='') {
message = message + "Confirm Password\n"
valid = false;
}
if (document.register_form.PWD2.value!='' && document.register_form.PWD.value!='' && document.register_form.PWD2.value!=document.register_form.PWD.value) {
message = message + "Password and Verify Password must match exactly\n"
valid = false;
}
if (document.register_form.FIRST.value=='') {
message = message + "Contact First Name\n"
valid = false;
}
if (document.register_form.LAST.value=='') {
message = message + "Contact Last Name\n"
valid = false;
}
if (document.register_form.PHONE.value=='') {
message = message + "Phone Number\n"
valid = false;
}
if (document.register_form.EMAIL.value=='') {
message = message + "Email Address\n"
valid = false;
}
if (valid == false) {
alert(message);
} else {
document.register_form.submit();
}
return valid;
}




function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
<script language="JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}
//-->
</script>
<cfif #a_trigger# eq 1>
<CFQUERY datasource="#request.dsn#" NAME="check_companies">
		SELECT *
		FROM Companies
		WHERE a_user = '#form.UID#'
		and a_pass = '#form.PWD#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="check_users">
		SELECT *
		FROM Users
		WHERE a_user = '#form.UID#'
		and a_pass = '#form.PWD#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="check_closer">
		SELECT *
		FROM Closer
		WHERE username = '#form.UID#'
		and password = '#form.PWD#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="check_abstractors">
		SELECT *
		FROM Abstractors
		WHERE username = '#form.UID#'
		and password = '#form.PWD#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="check_co_user">
		SELECT *
		FROM Companies_User
		WHERE username = '#form.UID#'
		and password = '#form.PWD#'
</CFQUERY>

<cfif check_companies.recordcount or check_users.recordcount or check_closer.recordcount or check_abstractors.recordcount or check_co_user.recordcount>
<script language="javascript">
alert("That UserName/Password combination is already in use, please choose another");
history.go(-1);
</script>
<cfabort>
</cfif>

<SCRIPT LANGUAGE="JavaScript">
<!-- Overture Services Inc. 07/15/2003
var cc_tagVersion = "1.0";
var cc_accountID = "1419082105";
var cc_marketID =  "0";
var cc_protocol="http";
var cc_subdomain = "convctr";
if(location.protocol == "https:")
{
    cc_protocol="https";
     cc_subdomain="convctrs";
}
var cc_queryStr = "?" + "ver=" + cc_tagVersion + "&aID=" + cc_accountID + "&mkt=" + cc_marketID +"&ref=" + escape(document.referrer);
var cc_imageUrl = cc_protocol + "://" + cc_subdomain + ".overture.com/images/cc/cc.gif" + cc_queryStr;
var cc_imageObject = new Image();
cc_imageObject.src = cc_imageUrl;
// -->
</SCRIPT>
</cfif>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#294163" link="#FF0000" vlink="#FF0000" alink="#FF0000">
<table width="780" height="110" border=0 cellpadding=0 cellspacing=0 background="images/banner_black_wout_logo.jpg" valign=top>
  <tr> 
    <td rowspan="2" valign="top" width="220"><cfinclude template="logo_swap_include.cfm"></td>
    <td valign="top" align="right">
	<br>
	<FORM name=formSearch action="javascript:startsearch() //">
	    <table align="right" cellpadding="0" cellspacing=0>
          <tr> 
            <td align="center" valign="middle"><b><font color="96E102" size="2" face="Verdana, Helvetica, sans-serif">Search</font></b>&nbsp;</td>
            <td align="center" valign="center"> 
              <input type="text" name="txtSearch" size=20>&nbsp;</td>
            <td align="right" valign="bottom"><input type="image" src="/client/images/searchgo2.jpg" border=0 alt="Begin your Web search"></td>
			<td width="30">&nbsp;</td>
		  </tr>
		</table>
  </FORM>
</td>
  </tr>
  <tr> 
    <td valign="top" align="center" width="560"><nobr></nobr><br>
      &nbsp;</td>
  </tr>
</table>
<table cellpadding="0" cellspacing="0" border="0" width="780" bgcolor="000000">
			<tr>
				<td width="160" bgcolor="000000">&nbsp;</td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/login.cfm"><img src="images/nav_login.jpg" border="0" alt="LOGIN" onClick="document.location.href='/client/loginb.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/company.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('COMPANY','','images/nav_company_on.jpg',1);" ><img name="COMPANY" src="images/nav_company_off.jpg" border="0" alt="COMPANY" onClick="document.location.href='/client/company.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/services.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('PRODUCTS','','images/nav_products_on.jpg',1);" ><img name="PRODUCTS" src="images/nav_products_off.jpg" alt="PRODUCTS" border="0"  onClick="document.location.href='/client/services.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/vendor.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('VENDORS','','images/nav_vendors_on.jpg',1);" ><img name="VENDORS" src="images/nav_vendors_off.jpg" alt="VENDORS" border="0" onClick="document.location.href='/client/vendor.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/employment.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('CAREERS','','images/nav_careers_on.jpg',1);" ><img name="CAREERS" src="images/nav_careers_off.jpg" alt="CAREERS" border="0" onClick="document.location.href='/client/employment.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/contact.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('CONTACT','','images/nav_contact_on.jpg',1);" ><img name="CONTACT" src="images/nav_contact_off.jpg" alt="CONTACT US" border="0" onClick="document.location.href='/client/contact.cfm';return false;"></a></td>
				</tr>
			<tr>
				<td width="160"><img src="images/nav_login_bar_left.jpg" border="0"></td>
				<td colspan="6"><img src="images/nav_login_bar_right.jpg" border="0"></td>
			</tr>
	</table>
	<table cellpadding="0" cellspacing="0" border="0" width="780">
	<tr>
		<td bgcolor="FECE62" valign="top" width = "160"><br>
		<table cellpadding="1" cellspacing="1" border="0" width="160">
		   <tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='#FF9900'" onClick="document.location.href='/client/login.cfm';return false;"><a class="menu1" href="/client/login.cfm"><nobr>Customer Login</nobr></font></a></td></tr>
         <tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='#FF9900'" onClick="document.location.href='/client/vlogin.cfm';return false;"><a class="menu1" href="/client/vlogin.cfm"><nobr>Vendor Login</nobr></font></a></td></tr>
          <tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='#FF9900'" onClick="document.location.href='/client/tlogin.cfm';return false;"><a class="menu1" href="/client/tlogin.cfm"><nobr>Third Party Login</nobr></font></a></td></tr>
       	 <tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='#FF9900'" onClick="document.location.href='/client/alogin.cfm';return false;"><a class="menu1" href="/client/alogin.cfm"><nobr>Admin Login</nobr></font></a></td></tr>
		<tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='FF9900'" onClick="document.location.href='/client/register.cfm';return false;"><a class="menu1" href="/client/contact.cfm"><nobr>New Customer Signup</nobr></font></a></td></tr>
	<tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='FF9900'" onClick="document.location.href='/client/vendor.cfm';return false;"><a class="menu1" href="/client/vendor.cfm"><nobr>New Vendor Signup</nobr></font></a></td></tr>
		
					 </table>


		</td>
		<td bgcolor="FFFFFF" valign="top">
			<!---- body text starts ----->
			
      <table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
        <tr> 
          <td align="center" valign="center">
 <table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">


 
<cfif #a_trigger# eq 1> 		

<CFQUERY datasource="#request.dsn#" NAME="read_user">
		
			SELECT *
			FROM client_register
				
		</CFQUERY>
 <!---
 <cfif #read_user.id# eq 1>
 <cfset useremail = "lyoung@firsttitleservices.com">
 <CFQUERY datasource="#request.dsn#" NAME="read_user">
		
			update client_register
			set id = 2 
				
		</CFQUERY>
 <cfelse>
   <cfset useremail = "rbowman@firsttitleservices.com">
	 <CFQUERY datasource="#request.dsn#" NAME="read_user">
		
			update client_register
			set id = 1 
				
		</CFQUERY>
</cfif> --->
<!---Changed this next line to just have Lyzette --->
<!---TO="spape@firsttitleservices.com,#useremail#"--->
<CFMAIL 
TO="spape@firsttitleservices.com"
cc="jmoore@firsttitleservices.com"
FROM="spape@firsttitleservices.com"
Subject="New customer signup" 
type = "html"
SERVER="127.0.0.1"
TIMEOUT="600" 
>

    <table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
        <tr> 
          <td align="center" valign="center">
 <table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
 
<tr> 
    <td colspan=2 style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=center style='margin-bottom:12.0pt;text-align:center'><font size="2" face="Times New Roman"><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'><br>
        <font size="3">The information below is entered by a new user of <cfoutput>#session.site.short_name#</cfoutput>'s Web.<o:p></o:p><o:p></o:p><o:p></o:p><o:p></o:p><o:p></o:p></font><o:p></o:p></span></b></font></p></td>
  </tr>
  <tr> 
    <td colspan=2 align = "center" style='background:D98002;padding:2.25pt 2.25pt 2.25pt 2.25pt'> 
      <p class=MsoNormal><font size="2" face="Times New Roman"><b><span style='font-size:7.5pt;font-family:Verdana;
  color:white'>User Information<o:p></o:p></span></b></font></p></td>
  </tr>

 

  <tr> 
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Pick a Username:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> 
   <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'> 
        #UID# <o:p></o:p></span></font></p>
   </td>
  </tr>
  <tr> 
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Pick a Password:&nbsp; 
        <o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'> 
       #PWD#
        &nbsp;(min 4 characters) <o:p></o:p></span></font></p></td>
  </tr>
  <tr> 
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Verify Password:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'> 
  #PWD2#
        <o:p></o:p></span></font></p></td>
  </tr>

  <tr> 
    <td colspan=2 align="center" style='background:D98002;padding:2.25pt 2.25pt 2.25pt 2.25pt'> 
      <p class=MsoNormal><font size="2" face="Times New Roman"><b><span style='font-size:7.5pt;font-family:Verdana;
  color:white'>Contact Information<o:p></o:p></span></b></font></p></td>
  </tr>
  <tr> 
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>First Name:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'> 
     #First#
        <o:p></o:p></span></font></p></td>
  </tr>
  <tr> 
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Last Name:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'> 
     #Last#
        <o:p></o:p></span></font></p></td>
  </tr>
  <tr> 
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Company:<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'> 
      #Company#
        <o:p></o:p></span></font></p></td>
  </tr>
  <tr> 
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'> City:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'> 
      #Branch#
        <o:p></o:p></span></font></p></td>
  </tr>
 
 
   <tr> 
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'> State:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'> 
      #State#
        <o:p></o:p></span></font></p></td>
  </tr>
    
  <tr> 
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Phone Number:&nbsp; 
        <o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'> 
        #Phone#
        <o:p></o:p></span></font></p></td>
  </tr>
  <tr> 
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>FAX Number:&nbsp; <o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'> 
        #Fax#
       <o:p></o:p></span></font></p></td>
  </tr>
  <tr> 
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Email Address:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'> 
    #Email#
        <o:p></o:p></span></font></p></td>
  </tr>
  
  
  
  
  <tr> 
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Best Days/Times to Contact You:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'> 
    #best_time#
        <o:p></o:p></span></font></p></td>
  </tr>
  
  <tr> 
    <td height="65" colspan=2 style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> 
      <div class=MsoNormal align=center style='text-align:center'><span
  style='font-size:7.5pt;font-family:Verdana;color:black'> 
        <hr size=1 width="100%" noshade color=black align=center>
        </span><font size="2" face="Times New Roman"><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
      
        <o:p></o:p></span></font></div>
      </td>
  </tr>
</table>

   </td>
  </tr>
</table>
</cfmail>

<CFMAIL 
TO="spape@firsttitleservices.com"
cc="jmoore@firsttitleservices.com"
FROM="spape@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="New customer signup"
TIMEOUT="600"
>

The information below is entered by a new user of #session.site.short_name#'s Web.
 
Username: #UID#
Password: #PWD#
Verify Password: #PWD2# 
First Name: #First#
Last Name: #Last#
Company: #Company#
City: #Branch#
State: #State#
Phone Number: #Phone#
FAX Number: #Fax#
Email Address: #Email#
Best Days/Times to Contact: #best_time#

</cfmail>

<cfinclude template="../auto_emails/customer_inquiry.cfm">

<cfoutput>


 
<tr> 
    <td colspan=2 style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=center style='margin-bottom:12.0pt;text-align:center'><font size="2" face="Times New Roman"><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'><br>
        <font size="3">Your registration has been received.  
				A <cfoutput>#session.site.short_name#</cfoutput> representative will contact you shortly to activate your account with us.  
				Thank you for your interest in <cfoutput>#session.site.short_name#</cfoutput> & Escrow.<o:p></o:p><o:p></o:p><o:p></o:p><o:p></o:p><o:p></o:p></font><o:p></o:p></span></b></font></p>
<cfif #a_trigger# eq 1> 
<cfinclude template="./tracking_codes.cfm">
</cfif>
</td>
  </tr>
  


</cfoutput>

<cfelse> 



<FORM METHOD=POST ACTION="/client/register.cfm?a_trigger=1" name="register_form">
 <tr> 
    <td colspan=2 style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=center style='margin-bottom:12.0pt;text-align:center'><font size="2" face="Times New Roman"><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'><br>
        <font size="3">Please enter the information below to access <cfoutput>#session.site.short_name#</cfoutput>'s Web Gateway.<o:p></o:p><o:p></o:p><o:p></o:p><o:p></o:p><o:p></o:p></font><o:p></o:p></span></b></font></p></td>
  </tr>
  <tr> 
    <td colspan=2 align = "center" style='background:D98002;padding:2.25pt 2.25pt 2.25pt 2.25pt'> 
      <p class=MsoNormal><font size="2" face="Times New Roman"><b><span style='font-size:7.5pt;font-family:Verdana;
  color:white'>Login Information<o:p></o:p></span></b></font></p></td>
  </tr>

 

  <tr> 
    <td width=200 align = "right" style='width:209.0pt;padding:2.25pt 2.25pt 2.25pt 2.25pt'> <span
  style='font-size:7.5pt;font-family:Verdana;color:black'><b>Pick a Username:</b>&nbsp;<o:p></o:p></span></b></font></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'> 
        <INPUT TYPE="TEXT" MAXLENGTH="12" NAME="UID">
        <span
  class=regtext1>(min 4 characters)</span> <o:p></o:p></span></font></p></td>
  </tr>
  <tr> 
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Pick a Password:&nbsp; 
        <o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'> 
        <INPUT TYPE="password" MAXLENGTH="12" NAME="PWD">
        &nbsp;(min 4 characters) <o:p></o:p></span></font></p></td>
  </tr>
  <tr> 
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Verify Password:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'> 
        <INPUT TYPE="password" MAXLENGTH="12" NAME="PWD2">
        <o:p></o:p></span></font></p></td>
  </tr>
<!---   <tr> 
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'>(The User ID and Password that you select will be your <br>
        credentials to enter the online ordering system.)<o:p></o:p></span></font></p></td>
  </tr> --->
  <tr> 
    <td colspan=2 align="center" style='background:D98002;padding:2.25pt 2.25pt 2.25pt 2.25pt'> 
      <p class=MsoNormal><font size="2" face="Times New Roman"><b><span style='font-size:7.5pt;font-family:Verdana;
  color:white'>Contact Information<o:p></o:p></span></b></font></p></td>
  </tr>
  <tr> 
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>First Name:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'> 
        <INPUT TYPE="TEXT" MAXLENGTH="20" NAME="FIRST">
        <o:p></o:p></span></font></p></td>
  </tr>
  <tr> 
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Last Name:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'> 
        <INPUT TYPE="TEXT" MAXLENGTH="20" NAME="LAST">
        <o:p></o:p></span></font></p></td>
  </tr>
  <tr> 
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Company:<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'> 
        <INPUT TYPE="TEXT" MAXLENGTH="20" NAME="Company">
        <o:p></o:p></span></font></p></td>
  </tr>
  <tr> 
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'> City:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'> 
        <INPUT TYPE="TEXT" MAXLENGTH="20" NAME="Branch">
        <o:p></o:p></span></font></p></td>
  </tr>
 
 
   <tr> 
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'> State:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'> 
       <SELECT NAME="state">
                  <OPTION SELECTED VALUE="USA">Please Select 
                  <OPTION VALUE="USA">---------------------- 
                  <OPTION VALUE="Alabama">Alabama 
                  <OPTION VALUE="Alaska">Alaska 
                  <OPTION VALUE="Arizona">Arizona 
                  <OPTION VALUE="Arkansas">Arkansas 
                  <OPTION VALUE="California">California 
                  <OPTION VALUE="Colorado">Colorado 
                  <OPTION VALUE="Connecticut">Connecticut 
                  <OPTION VALUE="Delaware">Delaware 
                  <OPTION VALUE="District">Dist. of Columbia 
                  <OPTION VALUE="Florida">Florida 
                  <OPTION VALUE="Georgia">Georgia 
                  <OPTION VALUE="Hawaii">Hawaii 
                  <OPTION VALUE="Idaho">Idaho 
                  <OPTION VALUE="Illinois">Illinois 
                  <OPTION VALUE="Indiana">Indiana 
                  <OPTION VALUE="Iowa">Iowa 
                  <OPTION VALUE="Kansas">Kansas 
                  <OPTION VALUE="Kentucky">Kentucky 
                  <OPTION VALUE="Louisiana">Louisiana 
                  <OPTION VALUE="Maine">Maine 
                  <OPTION VALUE="Maryland">Maryland 
                  <OPTION VALUE="Massachusetts">Massachusetts 
                  <OPTION VALUE="Michigan">Michigan 
                  <OPTION VALUE="Minnesota">Minnesota 
                  <OPTION VALUE="Mississippi">Mississippi 
                  <OPTION VALUE="Missouri">Missouri 
                  <OPTION VALUE="Montana">Montana 
                  <OPTION VALUE="Nebraska">Nebraska 
                  <OPTION VALUE="Nevada">Nevada 
                  <OPTION VALUE="New_Hampshire">New Hampshire 
                  <OPTION VALUE="New_Jersey">New Jersey 
                  <OPTION VALUE="New_Mexico">New Mexico 
                  <OPTION VALUE="New_York">New York 
                  <OPTION VALUE="North_Carolina">North Carolina 
                  <OPTION VALUE="North_Dakota">North Dakota 
                  <OPTION VALUE="Ohio">Ohio 
                  <OPTION VALUE="Oklahoma">Oklahoma 
                  <OPTION VALUE="Oregon">Oregon 
                  <OPTION VALUE="Pennsylvania">Pennsylvania 
                  <OPTION VALUE="Rhode_Island">Rhode Island 
                  <OPTION VALUE="South_Carolina">South Carolina 
                  <OPTION VALUE="South_Dakota">South Dakota 
                  <OPTION VALUE="Tennessee">Tennessee 
                  <OPTION VALUE="Texas">Texas 
                  <OPTION VALUE="Utah">Utah 
                  <OPTION VALUE="Vermont">Vermont 
                  <OPTION VALUE="Virginia">Virginia 
                  <OPTION VALUE="Washington">Washington 
                  <OPTION VALUE="West_Virginia">West Virginia 
                  <OPTION VALUE="Wisconsin">Wisconsin 
                  <OPTION VALUE="Wyoming">Wyoming 
                </SELECT>
        <o:p></o:p></span></font></p></td>
  </tr>
    
  <tr> 
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Phone Number:&nbsp; 
        <o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'> 
        <INPUT TYPE="TEXT" MAXLENGTH="15" NAME="PHONE">
        <o:p></o:p></span></font></p></td>
  </tr>
  <tr> 
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>FAX Number:&nbsp; <o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'> 
        <INPUT TYPE="TEXT" MAXLENGTH="15" NAME="FAX">
       <o:p></o:p></span></font></p></td>
  </tr>
  <tr> 
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Email Address:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'> 
        <INPUT TYPE="TEXT" MAXLENGTH="50" SIZE="40" NAME="EMAIL">
        <o:p></o:p></span></font></p></td>
  </tr>
  
 
 
 
 <tr> 
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Best Days/Time to Contact You:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'> 
        <INPUT TYPE="TEXT" MAXLENGTH="50" SIZE="40" NAME="best_time">
        <o:p></o:p></span></font></p></td>
  </tr>
  
  
  <tr> 
    <td height="65" colspan=2 style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> 
      <div class=MsoNormal align=center style='text-align:center'><span
  style='font-size:7.5pt;font-family:Verdana;color:black'> 
        <hr size=1 width="100%" noshade color=black align=center>
        </span><font size="2" face="Times New Roman"><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
      <INPUT NAME="B2" TYPE="button" value="Apply" onClick="return validate_form();">   <INPUT NAME="B2" TYPE="reset" value="reset">
        <o:p></o:p></span></font></div>
      </td>
  </tr>
</form>  





</cfif>

</table>
		  </td>
        </tr>
  <!---       <tr> 
          <td><p>body text</p>
            <p>&nbsp;</p></td>
        </tr> --->
      </table>
			<!---- body text ends ----->
		</td>
	</tr>
	<tr>
		<td bgcolor="D98002">&nbsp;</td>
		<td bgcolor="000000">
			<table cellpadding="0" cellspacing="0" border="0" width="98%" align="center">
				<tr>
				<td width="47%"><font face="Verdana, Arial, Helvetica, sans-serif" color="FFFFFF" size="1"><b><a class="menu3" href="./main.cfm">Home<a> | <a class="menu3" href="./termuse.cfm">Terms of Use<a>  | <a class="menu3" href="./policy.cfm">Privacy Policy<a></b></font></td>
				<td width="43%" align="right"><font face="Verdana, Arial, Helvetica, sans-serif" color="FFFFFF" size="1"><b>© 2003-<cfoutput>#DatePart("yyyy", Now())#</cfoutput> <cfoutput>#session.site.Long_Name#</cfoutput></b></font></td>
				</tr>
			</table>
		</td>
	</tr>
</table>

</body>
</html>
