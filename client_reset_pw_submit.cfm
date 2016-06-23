<cfset successful_change = 0>
<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="new_password" DEFAULT="">
<CFPARAM NAME="retype_new_password" DEFAULT="">
<cfset lower_case_letters = 'a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z'>
<cfset upper_case_letters = 'A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z'>
<cfset numbers_and_special = '0,1,2,3,4,5,6,7,8,9'>
<cfset error_message = ''>
<cfset contains_upper = 0>
<cfset contains_lower = 0>
<cfset contains_number = 0>



<!--- check to see if  both fields match --->
<cfif new_password eq retype_new_password>
<cfelse>
<cfset error_message = error_message & '<br>New Password and Confirm New Password must match Exactly'>
</cfif>


<!--- check to see if this new password is of proper length --->
<cfif Len(new_password) GTE 8>
<cfelse>
<cfset error_message = error_message & '<br>New Password must contain at least 8 characters'>
</cfif>

<!--- check to see if this new password is the same as the old password, throw error if they are the same --->
<CFQUERY datasource="#request.dsn#" NAME="check_old_password">
		select a_pass from companies
		where ID = #comppassreset#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="check_old_password_history">
		select  TOP (200) * from companies_pwds
		where comp_id = #comppassreset# order by pwd_date
</CFQUERY>
<cfset temp_list = ValueList(check_old_password_history.pwd)>

<cfif new_password eq check_old_password.a_pass or ListContains(temp_list, new_password, ",")>
<cfset error_message = error_message & '<br>New Password must be different from your previous 12 passwords'>
</cfif>



<!--- check to see if this new password contains all valid characters --->
<cfloop index="i" from="1" to="#Len(new_password)#">
<cfif ListContains(lower_case_letters, Mid(new_password, i, 1), ',')>
<cfset contains_lower = 1>
</cfif>
<cfif ListContains(upper_case_letters, Mid(new_password, i, 1), ',')>
<cfset contains_upper = 1>
</cfif>
<cfif ListContains(numbers_and_special, Mid(new_password, i, 1), ',')>
<cfset contains_number = 1>
</cfif>
<cfif ListContains(lower_case_letters, Mid(new_password, i, 1), ',') or ListContains(upper_case_letters, Mid(new_password, i, 1), ',') or ListContains(numbers_and_special, Mid(new_password, i, 1), ',')>
<cfelse>
<cfset error_message = error_message & '<br>New Password must contain only letters and numbers'>
</cfif>
</cfloop>

<cfif contains_upper eq 0>
<cfset error_message = error_message & '<br>New Password must contain at least one UPPER CASE letter'>
</cfif>
<cfif contains_lower eq 0>
<cfset error_message = error_message & '<br>New Password must contain at least one LOWER CASE letter'>
</cfif>
<cfif contains_number eq 0>
<cfset error_message = error_message & '<br>New Password must contain at least one NUMBER'>
</cfif>


<cfif IsDefined("session.comp_pass_reset") and session.comp_pass_reset neq '' and session.comp_pass_reset neq 'NULL'>
<cfset comppassreset = session.comp_pass_reset>
</cfif>

<cfif IsDefined("comppassreset") and comppassreset neq '' and comppassreset neq 'NULL'>
<CFQUERY datasource="#request.dsn#" NAME="check_username">
		select * from companies
		where (a_user = '#username#'
		and a_pass = '#new_password#'
		and ID <> #comppassreset#)
</CFQUERY>
</cfif>
<cfif check_username.recordcount GTE 1>
<cfset error_message = error_message & '<br>Username is already registered, please choose another'>
</cfif>

<!--- if there are errors --->
<cfif error_message neq ''>
<CFLOCATION URL="/client_reset_pw.cfm?user_id_1=0&lo_id=0&error_message=#error_message#">
</cfif>

<!--- if there are no errors, password is good and we should reset it, and log them in --->
<cfif error_message eq ''>
<CFQUERY datasource="#request.dsn#" NAME="update_pass">
		update companies set a_pass = '#new_password#',
		last_password_change = #CreateODBCDateTime(Now())#,
		changed_by_ip_address = '#cgi.REMOTE_ADDR#',
		reset_password_due = 'False',
		a_user = '#username#'
		where ID = #comppassreset#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="update_pass">
		insert into companies_pwds (comp_id, pwd_date, pwd)
        values (#comppassreset#, #CreateODBCDateTime(Now())#, '#new_password#')
</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_comp">
		select * from companies
		where ID = #comppassreset#
</CFQUERY>

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
			 	<p><font face="Arial, Helvetica, sans-serif" size="2">

				Your password has now been reset. Your username for this account is:<br>
<br>
<strong><cfoutput>#GET_COMP.a_USER#</cfoutput></strong><br>
<br>
To continue to your account, click below to be automatically logged in.<br>
<br>

<cfoutput><CFFORM action="https://#CGI.SERVER_NAME#/client_login_submit.cfm">
<input name="user_name" type="hidden"  value="#GET_COMP.a_user#">
<input name="password" type="hidden"   value="#GET_COMP.a_pass#">
<input type="submit" name="Submit" value="Log Me In"></p>
</cfform></cfoutput>


<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>



				</td></tr></table></td></tr></table>
			<!---- body text ends ----->
		<cfinclude template="client/vendorFooter.cfm">
