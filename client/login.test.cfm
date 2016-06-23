
<html>
<head>
<title>Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
body
{
    BACKGROUND-COLOR: #284466;
    FONT-FAMILY: Verdana;
    FONT-SIZE: 10px;
    MARGIN: 0px
}
P
{
    COLOR: #66CCFF;
    FONT-FAMILY: Verdana;
    FONT-SIZE: 10px;
    MARGIN-BOTTOM: 7px;
    MARGIN-TOP: 7px
	line-height: 12px;
}
A:link
{
    Color: #66CC00;
    FONT-FAMILY: Verdana;
    FONT-SIZE: 10px;
    FONT-WEIGHT: bold
}
A:visited
{
    Color: #66CC00;
    FONT-FAMILY: Verdana;
    FONT-SIZE: 10px;
    FONT-WEIGHT: bold
}
.HP_STOCK
{
    COLOR: #ffffff;
    FONT-FAMILY: Verdana;
    FONT-SIZE: 12px;
    MARGIN: 0px;
    PADDING-BOTTOM: 0px;
    PADDING-LEFT: 0px;
    PADDING-RIGHT: 0px;
    PADDING-TOP: 0px
}
LI
{
    MARGIN: 5px 0px 0px   
}
   </style> 

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
		<td bgcolor="FECE62" valign="top"><br><br><cfif isdefined ("url.loginflg")>
        <cfif url.loginflg is 1>
          <font color="#FF0000" size="2" face="Arial"><img src="orgarrow1.jpg" width="9" height="6"><strong>Customer 
              Login</strong><br>
              &nbsp;-Existing Member<br>
              &nbsp;-New Member Signup<br>
              <img src="orgarrow.jpg" width="9" height="6"><strong><a href="login.cfm?loginflg=2">Vendor 
              Login</a></strong> </font></div>
          <cfelse>
        
           <font color="#FF0000" size="2" face="Arial"><img src="orgarrow.jpg" width="9" height="6"><strong><a href="login.cfm?loginflg=1">Customer Login</a></strong><br>
              <img src="orgarrow1.jpg" width="9" height="6"><strong>Vendor Login</strong></font><br>
              <font color="#FF0000" size="2" face="Arial">&nbsp;-Existing Member</font><br>
              <font size="1" color="#FF0000">&nbsp;&nbsp;&nbsp;-Abstractor/Title Information<br>
              &nbsp;&nbsp;&nbsp;-Title Agent<br>
              &nbsp;&nbsp;&nbsp;-Attorney Closing Agent<br>
              &nbsp;&nbsp;&nbsp;-Notary Closing Agent<br>
              &nbsp;&nbsp;&nbsp;-Appraiser<br>
              &nbsp;&nbsp;&nbsp;-Ancillary Service Provider<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-Flood Determination Vendor<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-Credit Vendor<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-AVM Vendor</font><br>
              
			  <font color="#FF0000" size="2" face="Arial">&nbsp;-New Member Signup</font><br>
              <font size="1" color="#FF0000">
			  &nbsp;&nbsp;&nbsp;-Abstractor/Title Information<br>
              &nbsp;&nbsp;&nbsp;-Title Agent<br>
              &nbsp;&nbsp;&nbsp;-Attorney Closing Agent<br>
              &nbsp;&nbsp;&nbsp;-Notary Closing Agent<br>
              &nbsp;&nbsp;&nbsp;-Appraiser<br>
              &nbsp;&nbsp;&nbsp;-Ancillary Service Provider<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-Flood Determination Vendor<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-Credit Vendor<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-AVM Vendor</font><br>
              
			 <font color="#FF0000" size="2" face="Arial">&nbsp;-Administrative Login</font><br>
        </cfif>
        <cfelse>
        <div align="left"><font color="#FF0000" size="2" face="Arial"><img src="orgarrow3.jpg" width="6" height="9"><strong><a href="login.cfm?loginflg=1">Customer 
            Login</a></strong><br>
            <img src="orgarrow2.jpg" width="9" height="6"><strong><a href="login.cfm?loginflg=2">Vendor 
            Login</a></strong> </font></div>
      </cfif>
</td>
		<td bgcolor="FFFFFF" valign="top">
			<!---- body text starts ----->
			<table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
				<tr>
					<td align="center" valign="center"><br><font color="#CC6633" face="Arial"><H3><B>CUSTOMER LOGIN</B></H3></FONT><br></td>
				</tr>
				<tr>
					<td>
			  <p align="justify"><font color="#666666" face="Arial, Helvetica, sans-serif" size="3">Welcome 
                to the gateway to <cfoutput>#session.site.short_name#</cfoutput>&#8217;s automated, web-based, ordering 
                and tracking system. To login please type your username and password 
                below. Having trouble logging in? Click on one of the links below 
                the login for help. </font></p>
				 <p align="center">
				 <B><font color="#CC6633" face="Arial" size="2">Username:</font>&nbsp;&nbsp;<input name="textfield" type="text" size="20" maxlength="20">
             <br><br>
			  <B><font color="#CC6633" face="Arial" size="2"">Password:</font>&nbsp;&nbsp;<input name="textfield2" type="text" size="20" maxlength="20">
              <br><br>
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="Submit" value="Submit"></p>
			<div align="center"> 
                <p><font color="#990000" size="2" face="Times New Roman, Times, serif"><a href="retpassword.cfm" target="_blank">Forgot 
                  your Password? Click</a></font></p>
              </div>
			  <div align="center"><font color="#990000" size="2" face="Times New Roman, Times, serif"><a href="register.cfm">Don&#8217;t 
                have a username and password? Click</a></font></div>
				<p>&nbsp;</p>
					</td>
				</tr>
			</table>
			<!---- body text ends ----->
		</td>
	</tr>
	<tr>
		<td bgcolor="D98002">&nbsp;</td>
		<td bgcolor="000000">
			<table cellpadding="0" cellspacing="0" border="0" width="98%" align="center">
				<tr>
					<td width="57%"><font face="Verdana, Arial, Helvetica, sans-serif" color="FFFFFF" size="1"><b>FAQs | Site Map | Site Policies | Privacy Policy</b></font></td>
					<td width="43%" align="right"><font face="Verdana, Arial, Helvetica, sans-serif" color="FFFFFF" size="1"><b>© 2003-<cfoutput>#DatePart("yyyy", Now())#</cfoutput> <cfoutput>#session.site.Long_Name#</cfoutput></b></font></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>
