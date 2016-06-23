
<html>
<head>
<title>Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

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

.menu1 {color:#FFFFFF;font:normal bold 13px Arial, Helvetica, sans-serif;text-align:center;font-color:#FFFFFF}
.menu1:link    {text-decoration:none;color:#FFFFFF}
.menu1:visited {text-decoration:none;color:#FFFFFF}
.menu1:hover   {font:normal bold 14px Arial, Helvetica, sans-serif;text-decoration:none;color:#000000}

.menu2 {color:#FFFFFF;font:normal bold 13px Arial, Helvetica, sans-serif;text-align:center;font-color:#FFFFFF}
.menu2:link    {text-decoration:none;color:#000000}
.menu2:visited {text-decoration:none;color:#000000}
.menu2:hover   {font:normal bold 14px Arial, Helvetica, sans-serif;text-decoration:none;color:#FFFFFF}

.menu3 {color:#FFFFFF;font:normal bold 13px Arial, Helvetica, sans-serif;text-align:center;font-color:#FFFFFF}
.menu3:link    {text-decoration:none;color:#FFFFFF}
.menu3:visited {text-decoration:none;color:#FFFFFF}
.menu3:hover   {font:normal bold 14px Arial, Helvetica, sans-serif;text-decoration:none;color:#FF3300}

</STYLE>

</STYLE>

</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#294163" link="#FF0000" vlink="#FF0000" alink="#FF0000">
<p><H1><font color="#FFFFFF">LOGO</font></H1></p>

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
		<td width="160" valign="bottom"><img src="images/loginbg1.jpg"></td>
		<td width="620" valign="bottom"><img src="images/loginbg2.jpg" border="0" usemap="#Map"></td>
	</tr>
	<tr>
		<td bgcolor="FECE62" valign="top"><br>
		<table cellpadding="1" cellspacing="1" border="0" width="160">
		<tr>
		      <tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='#FF9900'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/loginb.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/loginb.cfm"><nobr>Customer Login</nobr></font></a></td></tr>
         <tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='#FF9900'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/vlogin.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/vlogin.cfm"><nobr>Vendor Login</nobr></font></a></td></tr>
         <tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='#FF9900'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/alogin.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/alogin.cfm"><nobr>Admin Login</nobr></font></a></td></tr>

		<tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='FF9900'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/registerb.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/contact.cfm"><nobr>New Customer Signup</nobr></font></a></td></tr>
	<tr> <td width="89" bgcolor="#FF9900" nowrap onmouseover="this.bgColor='#FFFF99'" onmouseout="this.bgColor='FF9900'" onClick="document.location.href='https://<cfoutput>#cgi.server_name#</cfoutput>/client/vendor.cfm';return false;"><a class="menu1" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/vendor.cfm"><nobr>New Vendor Signup</nobr></font></a></td></tr>

					 </table>

</td>
		<td bgcolor="FFFFFF" valign="top">
			<!---- body text starts ----->
			<table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
				<tr>
					<td align="center" valign="center"><br><font color="#CC6633" face="Arial"><H3><B>ADMIN LOGIN</B></H3></FONT><br></td>
				</tr>
				<tr>
					<td>
					<table width="410" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
			  <tr>
					<td>
				<p><font face="Arial, Helvetica, sans-serif" size="2">Welcome
                to the gateway to First Title's automated, web-based, ordering
                and tracking system. <br>To login please type your username and password
                below. Having trouble logging in? Click on one of the links below
                the login for help. </font>
				</td>
				</tr>
			</table>
			 <CFFORM action="https://#cgi.server_name#/admin_area/login.cfm">

				 <p align="center">
				 <B><font color="#CC6633" face="Arial" size="2">Username:</font>&nbsp;&nbsp;<input name="username" type="text" size="20" maxlength="20">
             <br><br>
			  <B><font color="#CC6633" face="Arial" size="2">Password:</font>&nbsp;&nbsp;<input name="password" type="text" size="20" maxlength="20">
              <br><br>
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="Submit" value="Submit"></p>
			<div align="center">
                  <p><font color="#990000" size="2" face="Times New Roman, Times, serif"><a href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/retpassword.cfm" target="retpassword" onClick="window.open('','retpassword','width=420,height=200,status=0,resizable=0,scrollbars=0')">Forgot your password? Click</a>
	</font></p>
              </div>
			  <div align="center"><font color="#990000" size="2" face="Times New Roman, Times, serif"><a href="register.cfm">Don&#8217;t
                have a username and password? Click</a></font></div>
				<p>&nbsp;</p>
					</td>
				</tr>
			</table></cfform>
			<!---- body text ends ----->
		</td>
	</tr>
	<tr>
		<td bgcolor="D98002">&nbsp;</td>
		<td bgcolor="000000">
			<table cellpadding="0" cellspacing="0" border="0" width="98%" align="center">
				<tr>
					<td width="47%"><font face="Verdana, Arial, Helvetica, sans-serif" color="FFFFFF" size="1"><b><a class="menu3" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/main.cfm">Home<a> | <a class="menu3" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/termuse.cfm">Terms of Use<a>  | <a class="menu3" href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/policy.cfm">Privacy Policy<a></b></font></td>
				<td width="43%" align="right"><font face="Verdana, Arial, Helvetica, sans-serif" color="FFFFFF" size="1"><b>© 2003-<cfoutput>#DatePart("yyyy", Now())#</cfoutput> First Title & Escrow Inc.</b></font></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>
