<cfparam name="url.a_trigger" default="1">
<cfparam name="form.confirm" default="0">

<cfif url.a_trigger eq 2>
<CFQUERY datasource="#request.dsn#" NAME="delete_it">
		Update Companies
		set encompass_confirm_date = #Now()#,
		encompass_gfe_confirm = 1
		WHERE ID = '#FORM.comp_id#'
</CFQUERY>
</cfif>


<html>
<head>
<title><cfoutput>#session.site.short_name#</cfoutput>/Encompass - Getting Started</title>
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
var message = "You must acknowledge acceptance of this agreement by clicking on the checkbox before submitting:\n";
if (!document.register_form.confirm.checked){
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
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-22259646-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
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
		   <tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='#FF9900'" onClick="document.location.href='/client/loginb.cfm';return false;"><a class="menu1" href="/client/loginb.cfm"><nobr>Customer Login</nobr></font></a></td></tr>
         <tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='#FF9900'" onClick="document.location.href='/client/vlogin.cfm';return false;"><a class="menu1" href="/client/vlogin.cfm"><nobr>Vendor Login</nobr></font></a></td></tr>
          <tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='#FF9900'" onClick="document.location.href='/client/tlogin.cfm';return false;"><a class="menu1" href="/client/tlogin.cfm"><nobr>Third Party Login</nobr></font></a></td></tr>
       	 <tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='#FF9900'" onClick="document.location.href='/client/alogin.cfm';return false;"><a class="menu1" href="/client/alogin.cfm"><nobr>Admin Login</nobr></font></a></td></tr>
		<tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='FF9900'" onClick="document.location.href='/client/encompass_register.cfm';return false;"><a class="menu1" href="/client/encompass_register.cfm"><nobr>New Customer Signup</nobr></font></a></td></tr>
	<tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='FF9900'" onClick="document.location.href='/client/vendor.cfm';return false;"><a class="menu1" href="/client/vendor.cfm"><nobr>New Vendor Signup</nobr></font></a></td></tr>

					 </table>

					 <BR>
					 <center>
<style>
.label {font-size: 12px; color:black; font-family:Arial, Helvetica, sans-serif;}
.header {font-size: 20px; color:#000066; font-family:Arial, Helvetica, sans-serif; font-weight:bold}
.header2 {font-size: 14px; color:#000066; font-family:Arial, Helvetica, sans-serif; font-weight:bold}
.header3 {font-size: 18px; color:#000066; font-family:Arial, Helvetica, sans-serif; font-weight:bold}
.smallprint {font-size: 12px; color:black; font-family:Arial, Helvetica, sans-serif;}
.bodytext {font-size: 12px; color:black; font-family:Arial, Helvetica, sans-serif;}
.bodytextred {font-size: 12px; color:red; font-family:Arial, Helvetica, sans-serif;}
.alert {font-size: 16px; color:red; font-family:Arial, Helvetica, sans-serif; font-weight:bold}
</style>

					 <span class="header3">Already a Customer?<br></span>
<a href="login.cfm" class="header2">Login Here</a><br>
</center>


		</td>
		<td bgcolor="FFFFFF" valign="top">
		<!--- body text begins here --->
<table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
 <tr><td>
<table width="100%"  border="0" cellspacing="3" cellpadding="3">
  <tr>
    <td colspan="2" align="center">
<table width="100%">
<tr>
<td align="left" valign="middle"><img src="images/FT_bug.gif" width="44" height="50"></td>
<td align="center" valign="middle" class="header">Welcome Encompass User</td>
<td align="left" valign="middle"><img src="images/encompass_logo.jpg" width="122" height="43"></td>
</tr>
</table>
</td>
  </tr>

  <tr>
   <td align="left" valign="top" class="header3">
<br>
<cfif url.a_trigger eq 1>
<FORM METHOD=POST ACTION="/client/encompass_confirm.cfm?a_trigger=2" name="register_form">
<input type="hidden" name="comp_id" value="<cfoutput>#session.comp_id#</cfoutput>"><br>

<span class="header2"><strong><cfoutput>#session.site.long_name#</cfoutput> GFE Product</strong></span><br>
<br>
<span class="bodytext">Thank you for signing up as a Customer with <cfoutput>#session.site.short_name#</cfoutput>. Included with our title and closing services is the use of our exclusive "Instant GFE" tool, where you will be entitled to request one (1) Good Faith Estimate (GFE) with each accompanying title and closing order you open with <cfoutput>#session.site.short_name#</cfoutput> utilizing the Encompass platform. Your free Title Fee populated GFE will include title premiums, recording and release fees, closing fees, as well as city, county and state transfer taxes.<br>
<br>
For each additional GFE request made in your Encompass Loan File after you have received your first populated GFE, you will incur a charge of $3.00. An invoice will be sent to you on a monthly basis for fees incurred. <br>
<br>
Please read the following Fee Confirmation very carefully and check the Box where indicated to confirm that you have read and understood it. If you do not check the box then you will not be permitted to proceed and obtain fees pertaining to your GFE.<br></span>
<br><br>

<span class="header2"><strong>Fee Confirmation</strong></span><br><br>
<span class="bodytext"><input type="checkbox" name="confirm" value="1">&nbsp;By checking this Box, I certify that I fully understand that I will receive one (1) free "Instant GFE" when I open a title and closing file with <cfoutput>#session.site.short_name#</cfoutput> utilizing the Encompass platform. I certify that I fully understand that in the event I require additional "Instant GFEs" in my Encompass Loan File after I have received my first "Instant GFE," I will incur a charge of $3.00 for each GFE for which I submit a request. I certify that I fully understand that this could result in more than one charge per Encompass Loan File.<br>
<br>
<center><input type="submit" value="I agree" onClick="return validate_form();"></center>
</span><br>
<br>
<cfelse>
<center>
THANK YOU!!! <br>
<br>
<span class="bodytext">Your confirmation has been received.<br>
<br>
<span class="alert">Remember to store your Username and Password in Encompass<br>
for Auto login</span><br>
<img src="images/save_pass.jpg" width="288" height="163"><br>
<br>
<span class="header2"><!--- Join us every Tues. at 10 AM and Thurs. at 4 PM EST for  '<cfoutput>#session.site.short_name#</cfoutput> Web Training'  - Click <a href="calyx_webdemo_register.cfm">here</a> for show times</span><br>
<br><br> --->
<a href="https://<cfoutput>#cgi.server_name#</cfoutput>/training/" target="_new">Click here for <cfoutput>#session.site.short_name#</cfoutput> web demonstration</a><br>
<!--- <a href="https://www.calyxsoftware.com/demo/pointwn5-4.htm" target="_new">Click here for Calyx Point 5.4 demonstration</a> ---></span>
</center>
</cfif>
</td></tr>
</table>
</td></tr></table>
<!---- body text ends ----->
		</td>
	</tr>
	<tr>
		<td bgcolor="D98002">&nbsp;</td>
		<td bgcolor="000000">
			<table cellpadding="0" cellspacing="0" border="0" width="98%" align="center">
				<tr>
				<td width="47%"><font face="Verdana, Arial, Helvetica, sans-serif" color="FFFFFF" size="1"><b><a class="menu3" href="./main.cfm">Home<a> | <a class="menu3" href="./termuse.cfm">Terms of Use<a>  | <a class="menu3" href="./policy.cfm">Privacy Policy<a></b></font></td>
				<td width="43%" align="right"><font face="Verdana, Arial, Helvetica, sans-serif" color="FFFFFF" size="1"><b>� 2003-<cfoutput>#DatePart("yyyy", Now())#</cfoutput> <cfoutput>#session.site.Long_Name#</cfoutput></b></font></td>
				</tr>
			</table>
		</td>
	</tr>
</table>

</body>
</html>
