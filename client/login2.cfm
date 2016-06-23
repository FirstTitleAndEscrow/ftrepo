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

<STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}
.menu4 {color:#FFFFFF;font:normal bold 13px Arial, Helvetica, sans-serif;text-align:center;font-color:#FFFFFF}
.menu4:link    {text-decoration:none;color:#FFFFFF;}
.menu4:visited {text-decoration:none;color:#FFFFFF}
.menu4:hover   {font:normal bold 13px Arial, Helvetica, sans-serif;text-decoration:none;color:#000000}

.menu1 {color:#000000;font:normal bold 11px helvetica, geneva, sans serif;text-align:center;font-color:#000000}
.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:hover   {font:normal bold 11px helvetica, geneva, sans serif;text-decoration:none;color:#FFFFFF}
.menu3 {color:#FFFFFF;font:normal bold 10px helvetica, geneva, sans serif;text-align:center;font-color:#FFFFFF}
.menu3:link    {text-decoration:none;color:#FFFFFF}
.menu3:visited {text-decoration:none;color:#FFFFFF}
.menu3:hover   {font:normal bold 11px Verdana, Arial, Helvetica, sans-serif;text-decoration:none;color:#FF3300}

.menu2 {color:#FFFFFF;font:normal bold 13px Arial, Helvetica, sans-serif;text-align:center;font-color:#FFFFFF}
.menu2:link    {text-decoration:none;color:#000000}
.menu2:visited {text-decoration:none;color:#000000}
.menu2:hover   {font:normal bold 14px Arial, Helvetica, sans-serif;text-decoration:none;color:#FFFFFF}
.menu5 {color:#ffffff;font:normal bold 11px helvetica, geneva, sans serif;text-align:center;font-color:#000000}
.menu5:link    {text-decoration:none;color:#ffffff;font:normal bold 11px helvetica, geneva, sans serif;}
.menu5:visited {text-decoration:none;color:#ffffff;font:normal bold 11px helvetica, geneva, sans serif;}
.menu5:hover   {font:normal bold 11px helvetica, geneva, sans serif;text-decoration:none;color:#000000}

</STYLE>

</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#294163" link="#FF0000" vlink="#FF0000" alink="#FF0000">
<table bgcolor=000000 border=0 cellspacing=0 cellpadding=0 valign=top width="780">
  <tr>
    <td rowspan="2" valign="top"><a href="https://<cfoutput>#cgi.server_name#</cfoutput>">
	<img src="/images/fadedblack.jpg" border="0"></a></td>
    <td valign="top" align="right">
	<br>
	<FORM name=formSearch action="javascript:startsearch() //">
	    <table align="right" cellpadding="0" cellspacing=0>
          <tr>
            <td align="center" valign="middle"><b><font color="96E102" size="2" face="Verdana, Helvetica, sans-serif">Search</font></b>&nbsp;</td>
            <td align="center" valign="center">
              <input type="text" name="txtSearch" size=20>&nbsp;</td>
            <td align="right" valign="bottom"><input type="image" src="https://<cfoutput>#cgi.server_name#</cfoutput>/client/images/searchgo2.jpg" border=0 alt="Begin your Web search"></td>
			<td width="30">&nbsp;</td>
  </tr></table>
  </FORM>
</td>
  </tr>
  <tr>
    <td valign="top" align="center"><nobr><b><font face="verdana,arial,helvetica" color="D1ECF1" size="2">"Integrating People and Technology for Your Real Estate Solutions"</font></b></nobr></td>
  </tr>
</table>

<table cellpadding="0" cellspacing="0" border="0" width="780">
	<tr><td colspan="2"><map name="Map">
        <area shape="rect" coords="10,1,74,19" href="login.cfm" alt="Login">
        <area shape="rect" coords="112,1,173,18" href="company.cfm" alt="Company">
        <area shape="rect" coords="197,2,315,17" href="services.cfm" alt="Product & Services">
        <area shape="rect" coords="346,2,411,19" href="vendor.cfm" alt="Vendors">
        <area shape="rect" coords="432,1,495,19" href="employment.cfm" alt="Careers">
        <area shape="rect" coords="525,1,594,18" href="contact.cfm" alt="Contact Us">
      </map></td></tr>
	<tr>
		<td width="160" bgcolor="#D98002">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>

		<td width="620" valign="bottom">
		<table cellpadding="1" cellspacing="1" border="0" width="620">


		<tr>

		  <td valign="middle" align = "center" width="95" bgcolor="#FECE62" nowrap onmouseover="this.bgColor='#FECE62'" onmouseout="this.bgColor='#FECE62'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/loginb.cfm';return false;"><a class="menu5" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/loginb.cfm"><nobr><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/client/images/arrowlogin.jpg" border=0>&nbsp;LOGIN&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="95" bgcolor="#CCD2D2" nowrap onmouseover="this.bgColor='#0066CC'" onmouseout="this.bgColor='#CCD2D2'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/company.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/company.cfm"><nobr><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/client/images/arrowcompany.jpg" border=0>&nbsp;COMPANY&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="95" bgcolor="#CCD2D2" nowrap onmouseover="this.bgColor='#FF0000'" onmouseout="this.bgColor='#CCD2D2'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/services.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/services.cfm"><nobr><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/client/images/arrowproducts.jpg" border=0>&nbsp;PRODUCTS&nbsp;</nobr></a></td>
<td width="95" valign="middle"  align = "center" bgcolor="#CCD2D2" nowrap onmouseover="this.bgColor='#00FF66'" onmouseout="this.bgColor='#CCD2D2'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/vendor.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/vendor.cfm"><nobr><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/client/images/arrowvendor.jpg" border=0>&nbsp;VENDORS&nbsp;</nobr></a></td>
	<td width="95" valign="middle"  align = "center" bgcolor="#CCD2D2" nowrap onmouseover="this.bgColor='#FF9900'" onmouseout="this.bgColor='#CCD2D2'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/employment.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/employement.cfm"><nobr><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/client/images/arrowcareers.jpg" border=0>&nbsp;CAREERS&nbsp;</nobr></a></td>
	<td width="95" valign="middle"  align = "center" bgcolor="#CCD2D2" nowrap onmouseover="this.bgColor='#669999'" onmouseout="this.bgColor='#CCD2D2'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/contact.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/contact.cfm"><nobr><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/client/images/arrowcontact.jpg" border=0 valign="middel">&nbsp;CONTACT US&nbsp;</nobr></a></td>
		<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></table>
		</td>
	</tr>



	<tr>
		<td bgcolor="FECE62" valign="top"><br>
		<table cellpadding="1" cellspacing="1" border="0" width="160">

		      <tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='#FF9900'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/loginb.cfm';return false;"><a class="menu4" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/loginb.cfm"><nobr>Customer Login</nobr></font></a></td></tr>
         <tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='#FF9900'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/vlogin.cfm';return false;"><a class="menu4" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/vlogin.cfm"><nobr>Vendor Party Login</nobr></font></a></td></tr>
          <tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='#FF9900'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/tlogin.cfm';return false;"><a class="menu4" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/tlogin.cfm"><nobr>Third Party Login</nobr></font></a></td></tr>
       	 <tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='#FF9900'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/alogin.cfm';return false;"><a class="menu4" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/alogin.cfm"><nobr>Admin Login</nobr></font></a></td></tr>
		<tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='FF9900'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/registerb.cfm';return false;"><a class="menu4" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/contact.cfm"><nobr>New Customer Signup</nobr></font></a></td></tr>
	<tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='FF9900'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/vendor.cfm';return false;"><a class="menu4" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/vendor.cfm"><nobr>New Vendor Signup</nobr></font></a></td></tr>
	<tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='FF9900'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/registertp.cfm';return false;"><a class="menu4" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/registertp.cfm"><nobr>Third Party Signup</nobr></font></a></td></tr>

					 </table>




</td>
		<td bgcolor="FFFFFF" valign="top">
			<!---- body text starts ----->
			<table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
				<tr>
					<cfif #a_trigger# eq 0>
					<td align="center" valign="center"><br><font color="#CC6633" face="Arial"><H3><B>CUSTOMER LOGIN</B></H3></FONT><br></td>
			<cfelse>
		<td align="center" valign="center"><br><font color="#CC6633" face="Arial"><H3><B>CUSTOMER LOGIN ERROR</B></H3></FONT><br></td>

			</cfif>
				</tr>
				<tr>
					<td>
					<table width="410" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
			  <tr>
					<cfif #a_trigger# eq 0><td>
			 	<p><font face="Arial, Helvetica, sans-serif" size="2">Welcome
                to the gateway to <cfoutput>#session.site.short_name#</cfoutput>'s automated, web-based, ordering
                and tracking system. <br>To login please type your username and password
                below. Having trouble logging in? Click on one of the links below
                the login for help. </font>
				</td>
				<cfelse>
				<td>
			 	<p><font face="Arial, Helvetica, sans-serif" size="2">Invalid user name and password
				<br>Please try to log in again by typing your username and password
                below. Having trouble logging in? Click on one of the links below
                the login for help. </font>
				</td>
				</cfif>
				</tr>
			</table>
				 <CFFORM action="https://#cgi.server_name#/client_login_submit.cfm">
				 <p align="center">
				 <B><font color="#CC6633" face="Arial" size="2">Username:</font>&nbsp;&nbsp;<input name="user_name" type="text" size="20" maxlength="20">
             <br><br>
			  <B><font color="#CC6633" face="Arial" size="2">Password:</font>&nbsp;&nbsp;<input name="password" type="password" size="20" maxlength="20">
              <br><br>
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="Submit" value="Submit"></p>
			<div align="center">
                <p><font color="#990000" size="2" face="Times New Roman, Times, serif"><a href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/retpassword.cfm" target="retpassword" onClick="window.open('','retpassword','width=420,height=200,status=0,resizable=0,scrollbars=0')">Forgot your password? Click here</a>
	</font></p>
              </div>
			  <div align="center"><font color="#990000" size="2" face="Times New Roman, Times, serif"><a href="register.cfm">Don&#8217;t
                have a username and password? Click</a></font></div>
				<p>&nbsp;</p>
					</td>
				</tr>
			</table>
			</cfform>
			<!---- body text ends ----->
		</td>
	</tr>
	<tr>
		<td bgcolor="D98002">&nbsp;</td>
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
