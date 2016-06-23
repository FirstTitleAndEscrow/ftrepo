<CFQUERY datasource="#request.dsn#" NAME="read_u">
		SELECT     *
		FROM	First_Admin
		WHERE	(status = 1) and  (ID != 60) 
		and (ID != 59) and (ID != 58) and (ID != 56) and (ID != 92) and (ID != 187) and (ID != 93)
	</CFQUERY>
		
	<cfif #read_u.recordcount# GT 0>
		<cfloop query="read_u">
			<cfset NumbOfChars=6> 
			<CFSET NewPass = "#read_u.password#"> 
			<!---<CFLOOP INDEX="RandAlhpaNumericPass" 
			FROM="1" TO="#NumbOfChars#"> 
			<CFSET NewPass = 
				NewPass&Mid( 
				'ABCDEFGHIJCLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789' 
				,RandRange('1','66'),'1')> 
		</CFLOOP> --->

		<!---<CFQUERY datasource="#request.dsn#" NAME="read_user">
			update first_admin
			set password = '#NewPass#',
			a_date_created = '#DateFormat(Now(), "mm/dd/yyyy")#'
			 where ID = #ID# and status = 1
		</CFQUERY>--->
	
	<CFMAIL
		TO="#read_u.email#"
		FROM="webmaster@firsttitleservices.com"
		SERVER="127.0.0.1"
		Subject="New First Title web password for #fname# #lname#"
		TIMEOUT="600"
		>
		Hello #fname# #lname#,
		
		Your new First Title web password is:	#NewPass#

		NOTE: Your First Title web password automatically changes every 14 days. 
		In case this email is deleted and you have forgotten your password, 
		in the admin login page you may click on the link "Forgot your password? Click"
		and enter your email address in the showing box and the system will automatically
		email your username and password.
	
		Auto-email
		First Title & Escrow, Inc.

	</cfmail>
	</cfloop>
</cfif> 
