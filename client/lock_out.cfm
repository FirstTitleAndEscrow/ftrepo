<cfparam name="url.comp_id" default="">
<cfparam name="session.tried_username" default="">
<cfset passcode = CreateUUID()>
<cfif IsDefined("form.updAns")>
	
	<CFQUERY DATASOURCE="#request.dsn#" NAME="update_pass">
		update companies set a_pass = '#passcode#',
		last_password_change = #CreateODBCDateTime(Now())#,
		reset_password_due = 'True'
		where ID = '#URL.comp_id#'
</CFQUERY>
<CFQUERY DATASOURCE="#request.dsn#" NAME="get_comp">
		select * from companies
		where ID = '#URL.comp_id#'
</CFQUERY>
<cfelse>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="update_pass">
		update companies set a_pass = '#passcode#',
		last_password_change = #CreateODBCDateTime(Now())#,
		reset_password_due = 'True'
		where a_user = '#session.tried_username#'
</CFQUERY>
<CFQUERY DATASOURCE="#request.dsn#" NAME="get_comp">
		select * from companies
		where a_user = '#session.tried_username#'
</CFQUERY>
</cfif>

<cfif get_comp.recordcount EQ 0>
<script>
alert('You are attempting to login with an invalid username.');
history.go(-1);
</script>
<cfabort>
</cfif>
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
<cfmail to="#get_comp.email#" from="spape@#company_suffix#" subject="Account Security Alert from #company_name#" type="html">
<!---<cfmail to="#get_comp.email#" from="nachiketp@synechron.com" subject="Account Security Alert from #company_name#" type="html" bcc="sandeepag@synechron.com">--->
<style type="text/css" media="screen">

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

<a href="https://machine1.firsttitleservices.com/client_reset_pw.cfm?uuid=#passcode#">Please click here to reset your password and reactivate your account</a><BR><BR>


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
<cfinclude template="vendorHeader.cfm">

			<!---- body text starts ----->
			<table width="97%" cellpadding="0" cellspacing="0" border="0" valign="top" align="center">

				<tr>
					<td>
					<table width="410" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
<tr>

					<td valign="center" align="center"><br><font color="#CC6633" face="Arial"><H3><B>CLIENT PASSWORD LOCK OUT</B></H3></FONT></td>
				</tr>
			  <tr>
					<td align="center">
			 	<p><font face="Arial, Helvetica, sans-serif" size="2">For security purposes, after three unsuccessful login attempts, your account is temporarily deactivated. An email has been sent to the email address on file for this account, containing instructions on how to reset the password on the account.<br>
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
<font color="#990000" size="2" face="Times New Roman, Times, serif"><a href="https://www.firsttitleservices.com/index.php/sign-up">Don&#8217;t
                have a username and password? Click here</a></font><br>
</td>
    <td width="25%" align="right" valign="midddle"><img src="/client/images/encompass_logo.jpg" alt="Intergrated in Encompass Logo" width="122" height="43" border="0"></td>
  </tr>
</table>
			</td>
				</tr>
			</table>
			<!---- body text ends ----->
		<cfinclude template="vendorFooter.cfm">
