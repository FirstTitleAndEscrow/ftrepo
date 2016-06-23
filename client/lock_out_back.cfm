<cfset passcode = CreateUUID()>

<CFQUERY datasource="#request.dsn#" NAME="update_pass">
		update companies set a_pass = '#passcode#',
		last_password_change = #CreateODBCDateTime(Now())#,
		reset_password_due = 'True'
		where a_user = '#session.tried_username#'
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_comp">
		select * from companies
		where a_user = '#session.tried_username#'
</CFQUERY>

<!--- send email here --->
<cfif get_comp.streamline_client eq 'True'>
<cfset company_name = "Streamline Title & Escrow">
<cfset company_web = "www.streamline-title.com">
<cfset company_suffix = "streamline-title.com">
<cfset company_num = 2>
<cfelse>
<cfset company_name = "First Title & Escrow">
<cfset company_web = "www.firsttitleservices.com">
<cfset company_suffix = "firsttitleservices.com">
<cfset company_num = 1>
</cfif>
<cfmail to="#get_comp.email#" from="spape@#company_suffix#" subject="Account Security Alert from #company_name#" type="html" bcc="rjermain@firsttitleservices.com">

<style type="text/css" media="screen">

<!--
body, TD {
margin: 3;
padding: 3;
font: 12px verdana, arial, sans-serif;
}
.small {
margin: 3;
padding: 3;
font: 9px verdana, arial, sans-serif;
}
input {
margin: 3;
padding: 3;
font: 9px verdana, arial, sans-serif;
}
select, option {
margin: 3;
padding: 3;
font: 9px verdana, arial, sans-serif;
}
.header {

font: 14px verdana, arial, sans-serif;
}
-->
</style>
<cfoutput>

<table width="544" cellpadding="1" cellspacing="1" bgcolor="##000000">
<tr><td align="left" valign="top">
<table width="100%" cellpadding="0" cellspacing="4" bgcolor="##ffffff" border=0>
<tr>
<cfif company_num eq 1><td align="left" valign="top" colspan="3"><IMG SRC="https://#cgi.server_name#/auto_emails/images/header.jpg" width="542" height="85"></td>
<cfelse>
<td align="left" valign="top" colspan="3"><IMG SRC="https://#cgi.server_name#/auto_emails/images/streamline_header.jpg" width="542" height="85"></td>
</cfif>
</tr>
<tr>
<td width="414" align="left" valign="top">

Dear #get_comp.contact_fname# #get_comp.contact_lname#,<BR><BR>

As part of our continuing efforts to protect your online privacy, your account has been temporarily deactivated after three unsuccessful logon attempts. To reset your password and immediately reactivate your account, simply follow the link below. <BR><BR>

If phishing schemes are of concern to you, rest assured that you can call us directly anytime, for assistance in resetting your password.

Thank you in advance for your cooperation.<BR><BR>

<a href="https://www.firsttitleservices.com/client_reset_pw.cfm?uuid=#passcode#">Please click here to reset your password and reactivate your account</a><BR><BR>


</td><td width="165" align="left" valign="top"><img src="https://#cgi.server_name#/auto_emails/images/inset.jpg" width="165" height="204">
<!--- <table width="160" cellpadding="6" bgcolor="##99CCCC" border=1>
<tr>
<td align="center" valign="top"><font size = -1><strong>QUESTIONS?</strong><br>
Your Customer Service
Team Lead:<br>
<strong>Bob Barker<br>
410-655-5557<br>
<A href="whatever">Click here to Email</A></strong>
</font></td>
</tr>
</table> --->

</td>
<td width="20">&nbsp;</td>
</tr>
<tr><td colspan="2">

<br>
<br>

Stephen Papermaster, Esquire<br>
Managing Attorney<br>
#company_name# <br>
Phone: 301-279-0303<br>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
30 West Gude Drive, 4th Floor<br>
Rockville, MD 20850<br>
<cfelse>
7361 Calhoun Place, Suite 200<br>
Rockville, MD 20855<br>
</cfif>
Web Address: <cfoutput><a href="https://#company_web#">#company_web#</a></cfoutput>
<br>
</td>
</tr>
<tr>
<cfif company_num eq 1>
<td align="left" valign="top" colspan="3"><IMG SRC="https://#cgi.server_name#/auto_emails/images/ft_footer.jpg" width="542" height="49"></td>
<cfelse>
<td align="left" valign="top" colspan="3"><IMG SRC="https://#cgi.server_name#/auto_emails/images/st_footer.jpg" width="542" height="49"></td>
</cfif>
</tr>
</table>
</td></tr>
</table>
</cfoutput>
</cfmail>
<!--- end send email here --->


<CFPARAM NAME="a_trigger" DEFAULT="0">
<html>
<head>
<title>Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
 <!--- P {font:bold 11px Courier,Verdana,Tahoma,Arial} --->
<script language="JavaScript" type="text/JavaScript">
<!--
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
<STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}

.menu1 {color:#FFFFFF;font:normal bold 13px Arial, Helvetica, sans-serif;text-align:center;font-color:#FFFFFF}
.menu1:link    {text-decoration:none;color:#FFFFFF;}
.menu1:visited {text-decoration:none;color:#FFFFFF}
.menu1:hover   {font:normal bold 13px Arial, Helvetica, sans-serif;text-decoration:none;color:#000000}
.menu3 {color:#FFFFFF;font:normal bold 10px Verdana, Arial, Helvetica, sans-serif;text-align:center;font-color:#FFFFFF}
.menu3:link    {text-decoration:none;color:#FFFFFF}
.menu3:visited {text-decoration:none;color:#FFFFFF}
.menu3:hover   {font:normal bold 11px Verdana, Arial, Helvetica, sans-serif;text-decoration:none;color:#FF3300}

.menu2 {color:#FFFFFF;font:normal bold 13px Arial, Helvetica, sans-serif;text-align:center;font-color:#FFFFFF}
.menu2:link    {text-decoration:none;color:#000000}
.menu2:visited {text-decoration:none;color:#000000}
.menu2:hover   {font:normal bold 14px Arial, Helvetica, sans-serif;text-decoration:none;color:#FFFFFF}
</STYLE>

</head>
<body bgcolor="#294163" link="#FF0000" vlink="#FF0000" alink="#FF0000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="MM_preloadImages('/client/images/nav_company_on.jpg')">
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
            <td align="right" valign="bottom"><input type="image" src="https://www.firsttitleservices.com/client/images/searchgo2.jpg" border=0 alt="Begin your Web search"></td>
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
	<!--- navigation table begins---->

	<table cellpadding="0" cellspacing="0" border="0" width="780" bgcolor="000000">
	<cfif session.site.site_initials eq 'FT'>
			<tr>
				<td width="160" bgcolor="000000">&nbsp;</td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/loginb.cfm"><img src="images/nav_login.jpg" border="0" alt="LOGIN" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/loginb.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/company.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('COMPANY','','images/nav_company_on.jpg',1);" ><img name="COMPANY" src="images/nav_company_off.jpg" border="0" alt="COMPANY" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/company.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/services.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('PRODUCTS','','images/nav_products_on.jpg',1);" ><img name="PRODUCTS" src="images/nav_products_off.jpg" alt="PRODUCTS" border="0" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/services.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/vendor.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('VENDORS','','images/nav_vendors_on.jpg',1);" ><img name="VENDORS" src="images/nav_vendors_off.jpg" alt="VENDORS" border="0" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/vendor.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/employment.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('CAREERS','','images/nav_careers_on.jpg',1);" ><img name="CAREERS" src="images/nav_careers_off.jpg" alt="CAREERS" border="0" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/employment.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/contact.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('CONTACT','','images/nav_contact_on.jpg',1);" ><img name="CONTACT" src="images/nav_contact_off.jpg" alt="CONTACT US" border="0" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/contact.cfm';return false;"></a></td>
			</tr>
</cfif>
			<tr>
				<td width="160"><img src="images/nav_login_bar_left.jpg" border="0"></td>
				<cfif session.site.site_initials eq 'FT'>
				<td colspan="6"><img src="images/nav_login_bar_right.jpg" border="0"></td>
				<cfelse>
				<td colspan="6"><img src="images/nav_login_bar_right_blank.jpg" border="0"></td>
				</cfif>

			</tr>
	</table>

	<!--- navigation table ends---->
<table cellpadding="0" cellspacing="0" border="0" width="780">
	<tr>
		<td bgcolor="FECE62" valign="top" width="160"><br>
		<table cellpadding="1" cellspacing="1" border="0" width="160">
	        <tr> <td width="89" bgcolor="#FF9900" nowrap onMouseOver="this.bgColor='#FFFF99'" onMouseOut="this.bgColor='#FF9900'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/loginb.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/loginb.cfm"><nobr>Customer Login</nobr></font></a></td></tr>
         <tr> <td width="89" bgcolor="#FF9900" nowrap onMouseOver="this.bgColor='#FFFF99'" onMouseOut="this.bgColor='#FF9900'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/vlogin.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/vlogin.cfm"><nobr>Vendor Login</nobr></font></a></td></tr>
          <tr> <td width="89" bgcolor="#FF9900" nowrap onMouseOver="this.bgColor='#FFFF99'" onMouseOut="this.bgColor='#FF9900'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/tlogin.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/tlogin.cfm"><nobr>Third Party Login</nobr></font></a></td></tr>
       	 <tr> <td width="89" bgcolor="#FF9900" nowrap onMouseOver="this.bgColor='#FFFF99'" onMouseOut="this.bgColor='#FF9900'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/alogin.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/alogin.cfm"><nobr>Admin Login</nobr></font></a></td></tr>
		<tr> <td width="89" bgcolor="#FF9900" nowrap onMouseOver="this.bgColor='#FFFF99'" onMouseOut="this.bgColor='FF9900'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/registerb.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/registerb.cfm"><nobr>New Customer Signup</nobr></font></a></td></tr>
	<tr> <td width="89" bgcolor="#FF9900" nowrap onMouseOver="this.bgColor='#FFFF99'" onMouseOut="this.bgColor='FF9900'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/vendor.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/vendor.cfm"><nobr>New Vendor Signup</nobr></font></a></td></tr>

					 </table><br>
<br>

<!--- <div align="center">
<script src="https://siteseal.thawte.com/cgi/server/thawte_seal_generator.exe"></script>
</div>
 --->
</td>
		<td bgcolor="FFFFFF" valign="top">
			<!---- body text starts ----->
			<table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
				<tr>

					<td align="center" valign="center"><br><font color="#CC6633" face="Arial"><H3><B>CLIENT PASSWORD LOCK OUT</B></H3></FONT></td>
				</tr>
				<tr>
					<td>
					<table width="410" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
			  <tr>
					<td align="center">
			 	<p><font face="Arial, Helvetica, sans-serif" size="2">For security purposes, after three unsuccessful login attempts, your account is temporarily deactivated. An email has been sent to the email address on file for this account, containing instructions on how to reset the password on the account.<br>
<br>
<br>
<br>
<br>
<br>
</font>
				</td>
				</tr>
			</table>


<table width="100%"  border="0" cellspacing="3" cellpadding="3">
  <tr>
    <td width="25%" align="left" valign="middle"><img src="/client/images/Calyx_bug.gif" alt="Calyx Connected Logo" width="80" height="33"></td>
    <td width="50%" align="center" valign="top"><font color="#990000" size="2" face="Times New Roman, Times, serif"><a href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/retpassword.cfm?a_flag=1" target="retpassword" onClick="window.open('','retpassword','width=420,height=250,status=0,resizable=0,scrollbars=0')">Forgot your password? Click here</a>
	</font><br>
<font color="#990000" size="2" face="Times New Roman, Times, serif"><a href="registerb.cfm">Don&#8217;t
                have a username and password? Click here</a></font><br>
<font color="#990000" size="2" face="Times New Roman, Times, serif"><a href="title_profile_login.cfm">Property Profiles - Click Here</a></font></td>
    <td width="25%" align="right" valign="midddle"><img src="/client/images/encompass_logo.jpg" alt="Intergrated in Encompass Logo" width="122" height="43" border="0"></td>
  </tr>
</table>
			</td>
				</tr>
			</table>
			<!---- body text ends ----->
		</td>
	</tr>
	<tr>
		<td bgcolor="D98002" width="160">&nbsp;</td>
		<td bgcolor="000000">
			<table cellpadding="0" cellspacing="0" border="0" width="98%" align="center">
				<tr>
					<td width="47%"><font face="Verdana, Arial, Helvetica, sans-serif" color="FFFFFF" size="1"><b><a class="menu3" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/main.cfm">Home<a> | <a class="menu3" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/termuse.cfm">Terms of Use<a>  | <a class="menu3" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/policy.cfm">Privacy Policy<a></b></font></td>
				<td width="43%" align="right"><font face="Verdana, Arial, Helvetica, sans-serif" color="FFFFFF" size="1"><b>© 2003-<cfoutput>#DatePart("yyyy", Now())#</cfoutput> <cfoutput>#session.site.Long_Name#</cfoutput></b></font></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>
