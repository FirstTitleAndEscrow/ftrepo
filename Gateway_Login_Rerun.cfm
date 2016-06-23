<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="comp_id" DEFAULT="">
<CFPARAM NAME="pass" DEFAULT="">
<CFPARAM NAME="txtfield" DEFAULT="">
<CFPARAM NAME="txtfield2" DEFAULT="">
<CFPARAM NAME="ExportFile" DEFAULT="">


<!---The comp-id is really the user name for the company and
the password is their password.  This is carried over from the Dynatek Plug_In.--->
<CFQUERY datasource="#request.dsn#" NAME="read_company">
	SELECT *
	FROM companies
	WHERE a_user = '#comp_id#' and a_pass = '#pass#' and a_status = 1
</CFQUERY>

<html>
<head>
<title>Dynatek Login</title>
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
	.menu1 {color:#000000;font:normal bold 11px helvetica, geneva, sans serif;text-align:center;font-color:#000000}
	.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
	.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
	.menu1:hover   {font:normal bold 11px helvetica, geneva, sans serif;text-decoration:none;color:#FFFFFF}
</style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#294163" link="#FF0000" vlink="#FF0000" alink="#FF0000">
<!---<CFSET ExportFile = "#txtfield#">--->
<CFFORM action="https://#cgi.server_name#/Dynatek_login_rerun_submit.cfm?">
<cfif #a_trigger# eq 1>
	<cfset txtfield = Session.ExportFile>
</cfif>
<cfINPUT TYPE="Text" NAME="ExportFile" SIZE=1 MAXLENGTH=100 VALUE="#txtfield#"

									style="font-size: 0;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: black;
									border-color: black;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;"
									>
						</td>


<CFIF #read_company.recordcount# eq 1>
<!---	<CFLOCATION URL="https://#cgi.server_name#/Dynatek_login_submit.cfm?user_name=#read_company.a_user#&password=#read_company.a_pass#&txt&txtfield=#txtfield#">--->
	<CFLOCATION URL="https://#cgi.server_name#/Dynatek_login_Rerun_submit.cfm?user_name=#read_company.a_user#&password=#read_company.a_pass#&txt">
</CFIF>
		<td bgcolor="FFFFFF" valign="top">
			<!---- body text starts ----->
			<table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
				<tr>
					<cfif #a_trigger# eq 0>
					<td align="center" valign="center"><br><font color="#CC6633" face="Arial"><H3><B>DYNATEK CUSTOMER LOGIN</B></H3></FONT><br></td>
					<cfelseif #a_trigger# eq 2>
					<td align="center" valign="center"><br><font color="#CC6633" face="Arial"><H3><B>DYNATEK CUSTOMER LOGIN</B></H3></FONT><br></td>
					<cfelse>
					<td align="center" valign="center"><br><font color="#CC6633" face="Arial"><H3><B>DYNATEK CUSTOMER LOGIN ERROR</B></H3></FONT><br></td>
					</cfif>

				</tr>
				<tr>
					<td>
						<table width="410" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
			  				<tr>
							<cfif #a_trigger# eq 0><td>
						 	<p><font face="Arial, Helvetica, sans-serif" size="2">To login please type your username and password
            			    below. Having trouble logging in? Click on one of the links below
			                the login for help. </font>

							<cfelseif #a_trigger# eq 2><td>
						 	<p><font face="Arial, Helvetica, sans-serif" size="2">The File you are importing from Dynatek is invalid.  Please try your Plug In again or
							call (301)279-0303 for assistance.</font>
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
			<!---
			 <CFFORM action="https://#cgi.server_name#/Dynatek_login_submit.cfm?txtfield=#txtfield#">--->
				<!--- <CFFORM action="https://#cgi.server_name#/Dynatek_login_submit.cfm?txtfield=#txtfield#">--->
				 <!--- <CFFORM action="https://#cgi.server_name#/Dynatek_login_submit.cfm?">--->
				 <p align="center">
				 <B><font color="#CC6633" face="Arial" size="2">Username:</font>&nbsp;&nbsp;<input name="user_name" type="text" size="20" maxlength="20">
             <br><br>
			  <B><font color="#CC6633" face="Arial" size="2">Password:</font>&nbsp;&nbsp;<input name="password" type="password" size="20" maxlength="20">
              <br><br>

			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="Submit" value="Submit"></p>
			<div align="center">
                <p><font color="#990000" size="2" face="Times New Roman, Times, serif"><a href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/retpassword.cfm?a_flag=1" target="retpassword" onClick="window.open('','retpassword','width=900,height=800,status=0,resizable=0,scrollbars=0')">Forgot your password? Click here</a>
	</font></p>
              </div>
			  <div align="center"><font color="#990000" size="2" face="Times New Roman, Times, serif"><a href="https://#cgi.server_name#/client/registerb.cfm">Don&#8217;t
                have a username and password? Click</a></font></div>
				<p>&nbsp;</p>
					</td>
					<td>
<cfINPUT TYPE="Text" NAME="ExportFile2" SIZE=10 MAXLENGTH=100 VALUE="#job_id#"

									style="font-size: 5;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
									border-color: black;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;"
									>  						</td>
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
				<td width="43%" align="right"><font face="Verdana, Arial, Helvetica, sans-serif" color="FFFFFF" size="1"><b>© 2003-<cfoutput>#DatePart("yyyy", Now())#</cfoutput> First Title & Escrow Inc.</b></font></td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body>
</html>
