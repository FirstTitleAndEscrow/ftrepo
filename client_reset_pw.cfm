<cfset comp_not_found = 0>
<cfset get_comp.recordcount = 0>
<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="url.error_message" DEFAULT="">
<CFPARAM NAME="url.uuid" DEFAULT="">
<cfif url.uuid neq ''>
<CFQUERY datasource="#request.dsn#" NAME="get_comp">
		select * from companies
		where a_pass = '#url.uuid#'
</CFQUERY>
<cfset session.comp_pass_reset = get_comp.ID>
</cfif>

<cfif IsDefined("session.comp_pass_reset") and session.comp_pass_reset neq ''  and session.comp_pass_reset neq 'NULL' >
<CFQUERY datasource="#request.dsn#" NAME="get_comp">
		select * from companies
		where ID = #session.comp_pass_reset#
</CFQUERY>
</cfif>


<cfif get_comp.recordcount eq 0>
<cfset comp_not_found = 1>
</cfif>
<cfinclude template="client/vendorHeader.cfm">
			<!---- body text starts ----->
			<table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">

				<tr>
					<td>
					<table width="410" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
<tr>

					<td align="center" valign="center"><br><font color="#CC6633" face="Arial"><H3><B>CLIENT PASSWORD RESET</B></H3></FONT></td>
				</tr>
<tr>
					<td align="left">
<cfif comp_not_found eq 1>
<table>
	<tr>
	<td align="left"><font face="Arial, Helvetica, sans-serif" size="2">Account not found. If you continue to experience this error, please call your <cfoutput>#session.site.short_Name#</cfoutput> representative for help in resetting you password.</td>
	</tr>
	</table><br>
<br>
<br>
<br>
<br>

<cfelse>

			 	<p><font face="Arial, Helvetica, sans-serif" size="2">As part of our continuing efforts to improve security of your data and personally identifying information, <cfoutput>#session.site.short_name#</cfoutput> now requires all users of our system users to change their passwords every 90 days. <br>
<br>
<strong>Further, to create a strong password, we require your new password to be at least six characters long, and must contain at least one upper-case letter, one lower-case letter, and one number</strong>. Please enter a new password below.<br>
<br>
<br>

<cfif url.error_message neq ''>
<font color="red">Your chosen password failed because it did not meet the following criteria:<br>
<cfoutput>#error_message#</cfoutput><br>
<br>
</font>
</cfif>




<CFFORM action="https://#CGI.SERVER_NAME#/client_reset_pw_submit.cfm">
				 <p align="center">


<input name="comppassreset" type="hidden" value="<cfoutput>#get_comp.ID#</cfoutput>">
<input name="username" type="hidden" value="<cfoutput>#get_comp.a_user#</cfoutput>">
	<table>
	<tr>
	<td align="right"><B><font color="#CC6633" face="Arial" size="2">New Password:</font></b>&nbsp;</td>
	<td align="left"><input name="new_password" type="password" size="20" maxlength="20"></td>
	</tr>
	<tr>
	<td align="right"><B><font color="#CC6633" face="Arial" size="2">Confirm New Password:</font></b>&nbsp;</td>
	<td align="left"><input name="retype_new_password" type="password" size="20" maxlength="20"></td>
	</tr>

	</table>
				 <input type="submit" name="Submit" value="Submit"></p><br>

</cfform>
</font>
</cfif>
				</td>
				</tr>
			</table>

<table width="100%"  border="0" cellspacing="3" cellpadding="3">
  <tr>
    <td width="25%" align="left" valign="middle"><img src="/client/images/Calyx_bug.gif" alt="Calyx Connected Logo" width="80" height="33"></td>
    <td width="50%" align="center" valign="top"><font color="#990000" size="2" face="Times New Roman, Times, serif"><!--- <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/retpassword.cfm?a_flag=1" target="retpassword" onClick="window.open('','retpassword','width=420,height=250,status=0,resizable=0,scrollbars=0')">Forgot your password? Click here</a> --->
	</font><br>
<font color="#990000" size="2" face="Times New Roman, Times, serif"><!--- <a href="registerb.cfm">Don&#8217;t
                have a username and password? Click here</a> ---></font><br>
<font color="#990000" size="2" face="Times New Roman, Times, serif"><!--- <a href="title_profile_login.cfm">Property Profiles - Click Here</a> ---></font></td>
    <td width="25%" align="right" valign="midddle"><img src="/client/images/encompass_logo.jpg" alt="Intergrated in Encompass Logo" width="122" height="43" border="0"></td>
  </tr>
</table>
			</td>
				</tr>
			</table>

			<!---- body text ends ----->
		<cfinclude template="client/vendorFooter.cfm">
