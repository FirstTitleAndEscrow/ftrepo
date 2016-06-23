
<CFPARAM NAME="a_trigger" DEFAULT="0">
<cfinclude template="vendorHeader.cfm">
				<div class="container_16" id="main_content">
	
			<!---- body text starts ----->
		<div class="main_area">
		<div class="ctnt_left">
			<cfset resetsuccess = 0>
			<cfset errmsg = "">
			<cfif isDefined("form.password")>
			<cfif form.password NEQ form.password2>
				<cfset errmsg = errmsg&"The passwords do not match.<br>">
			</cfif>
			<CFQUERY datasource="#request.dsn#" NAME="read_user" maxrows="1">
			SELECT id, 'admin' as type
			FROM first_admin
			WHERE email = '#email#'
			UNION
			SELECT id, 'client' as type
			FROM companies
			WHERE email = '#email#'
			</CFQUERY>
			<cfif read_user.recordcount EQ 0>
				<cfset errmsg = errmsg&"No user was found for the email address #email#<br>">
			</cfif>
			
			<CFQUERY datasource="#request.dsn#" NAME="readpass" maxrows="1">
			SELECT *
			FROM first_admin_logins
			WHERE id = #read_user.id# and password = '#password#'
			</CFQUERY>
			
			<cfif readpass.recordcount>
				<cfset errmsg = errmsg&"You cannot use one of your previous 20 passwords.<br>">
			</cfif>
			<cfif NOT len(Password) GTE 8>
				<cfset errmsg = errmsg&"Password must contain at least 8 characters.<br>">
			</cfif>
			
			<cfif NOT refind('[A-Z]',Password)>
				<cfset errmsg = errmsg&"Password must contain at least one Uppercase Character.<br>">
			</cfif>
			
			<cfif NOT refind('[a-z]',Password)>
				<cfset errmsg = errmsg&"Password must contain at least one Lowercase Character.<br>">
			</cfif>
			
			<cfif NOT refind('[0-9]',Password)>
				<cfset errmsg = errmsg&"Password must contain at least one number.<br>">
			</cfif>
			
			<cfif NOT refind('[!@##$&*]',Password)>
				<cfset errmsg = errmsg&"Password must contain at least one Special Character (!@$%*).<br>">
			</cfif>
			
		
	 <cfif Len(errmsg) EQ 0>
	    
		<CFQUERY datasource="#request.dsn#" NAME="update_user" >
		    <cfif read_user.type EQ "admin">
			update first_admin
			set password = '#password#'
			WHERE email = '#email#'
			<cfelse>
			update companies
			set a_pass = '#password#'
			WHERE email = '#email#'
			</cfif>
			</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="update_user" >
			insert into first_admin_logins(id,password)values(#read_user.id#,'#password#')
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="update_user">
	update first_admin
	set loggedin = 1
	WHERE email = '#email#'
</CFQUERY>
		<cfset resetsuccess = 1>
	 </cfif>
			
			
			
			</cfif>
			
			<cfif resetsuccess EQ 0>
			<div class="login_area" >
				<img src="https://www.firsttitleservices.com/wp-content/themes/ft_responsive/images/login_top.gif" border="0" alt="">
				<div class="login_bg">
					<h1>RESET PASSWORD <cfif Len(errmsg)>ERROR:</cfif></h1>
					<p>Please fill out the form below to reset your password.
					<cfif Len(errmsg)>
						<span style="color:red">
						<br>
						Password reset failed because of the following:
						<br>
						</span>
					</cfif>
					<br>
					Passwords must:<br>
					<cfif FindNoCase("8",errmsg)>
					<span style="color:red">Contain at least 8 characters</span>
					<cfelse>
					Contain at least 8 characters
					</cfif>

<br>
<cfif FindNoCase("Uppercase",errmsg)>
					<span style="color:red">Contain at least one Uppercase Character</span>
					<cfelse>
Contain at least one Uppercase Character
</cfif>
<br>
<cfif FindNoCase("Lowercase",errmsg)>
					<span style="color:red">Contain at least one Lowercase Character</span>
					<cfelse>
Contain at least one Lowercase Character
</cfif>
<br>
<cfif FindNoCase("Number",errmsg)>
					<span style="color:red">Contain at least one Number</span>
					<cfelse>
Contain at least one Number
</cfif>

<br>
<cfif FindNoCase("Special",errmsg)>
					<span style="color:red">Contain at least one Special Character (!@$%*)</span>
					<cfelse>
Contain at least one Special Character (!@$%*)
</cfif>
<br>
<cfif FindNoCase("previous",errmsg)>
					<span style="color:red">Must not be one of your previous 20 passwords</span>
					<cfelse>
Must not be one of your previous 20 passwords
</cfif><br>
<cfif FindNoCase("match",errmsg)>
					<span style="color:red">The passwords you entered do not match.</span>
					
</cfif>


					</p>
					<form action="<cfoutput>#request.httpsurl#</cfoutput>/client/reset_password.cfm?a_flag=1" method="post">
					<input type="hidden" name="email" value="<cfoutput>#email#</cfoutput>">
						<!---
						<p><label style="width:300px">Email address</label> <input name="email" type="text" class="loginbox" style="width:250px"></p>
						--->
						<p><label style="width:300px">Choose a password</label> <input name="password" type="password" class="loginbox" style="width:250px"></p>
						<p><label style="width:300px">Confirm password</label> <input name="password2" type="password" class="loginbox" style="width:250px"></p>

					<div style="padding-left:100px;"><input type="image" src="https://www.firsttitleservices.com/wp-content/themes/ft_responsive/images/btn_submit.gif" border="0" alt=""></div>
					</form>
					
				</div>

				<div class="login_btm">

				 </div>
				
			</div>
			<cfelse>
			<b>Your password has been reset. <br>You may now login with your new password using the links in the right sidebar.</b>
			</cfif>
		
		</div>
		<div class="ctnt_right">
			<div class="right_list_area">
				<img src="http://www.firsttitleservices.com/wp-content/themes/ft_responsive/images/right_list_top.gif" border="0" alt="">
				<div class="right_list">
					<ul>
						<li><a href="http://www.firsttitleservices.com/login">Customer Login</a></li>
						<li><a href="http://www.firsttitleservices.com/loginv">Vendor Login</a></li>
						<li><a href="http://www.firsttitleservices.com/logint">Third Party Login</a></li>
						<li><a href="http://www.firsttitleservices.com/logina">Admin Login</a></li>
						<li><a href="http://www.firsttitleservices.com/sign-up">New Customer Signup</a></li>
						<li class="last"><a href="http://machine1.firsttitleservices.com/client/vendor_new2.cfm">New Vendor Signup</a></li>
					</ul>
				</div>
				<img src="http://www.firsttitleservices.com/wp-content/themes/ft_responsive/images/right_list_btm.gif" border="0" alt="">
			</div>
		</div>
		<div class="clear"></div>
	</div>
		</div><br><br><br><br><br><br><br><br><br>
</div>
	
	 
<cfinclude template="vendorFooter.cfm">
