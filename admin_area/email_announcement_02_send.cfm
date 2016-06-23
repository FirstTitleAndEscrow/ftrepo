
 
 <!---  #### Table reset  
	<cfquery datasource="#request.dsn#" name="insert_email">
		DELETE FROM email_tracker 
	</cfquery>
 --->
 
  <!--- Records in Email Table
	 <cfquery datasource="#request.dsn#" name="allemails">
			SELECT email, name, code
			FROM email_tracker
			WHERE code = 0
			ORDER BY code DESC, email, name
	 </cfquery>	 
	 <cfdump var="#allemails#" expand="no">
  --->
  
 <!--- Create the table of good email adresses

		<!--- STEP 1: Get Raw Addresses and Names data --->
		<cfquery datasource="#request.dsn#" name="get_user_emails">
			Select LP_fname, LP_email from
			Companies c, [Users] u
			Where (c.a_status = 0)
			and u.comp_id = c.ID
		</cfquery> 
		<cfquery datasource="#request.dsn#" name="get_loaners_emails">
			Select LO_fname, LO_email from
			Companies c, Loan_Officers l
			Where (c.a_status = 0)
			and l.comp_id = c.ID
		</cfquery>
		
		<cfdump var="#get_user_emails#" expand="no"> 
		<cfdump var="#get_loaners_emails#" expand="no"> 
			
		<!--- STEP 2, create email table with only valid emails --->
		<cfloop query="get_user_emails">
			<cfloop list="#get_user_emails.lp_email#" index="email">
				<CFIF REFindNoCase('^([[:alnum:]][-a-zA-Z0-9_%\.]*)?[[:alnum:]]@[[:alnum:]][-a-zA-Z0-9%\>.]*\.[[:alpha:]]{2,}$',trim(email))>
					<cfquery datasource="#request.dsn#" name="insert_email">
						INSERT INTO email_tracker (email, name)
						VALUES ('#trim(email)#', '#UCase(Left(Trim(get_user_emails.lp_fname),1))##LCase(Mid(Trim(get_user_emails.lp_fname),2,500))# ')				
					</cfquery>
				</CFIF>
			</cfloop>
		</cfloop>		
		<cfloop query="get_loaners_emails">
			<cfloop list="#get_loaners_emails.lo_email#" index="email">
				<CFIF REFindNoCase('^([[:alnum:]][-a-zA-Z0-9_%\.]*)?[[:alnum:]]@[[:alnum:]][-a-zA-Z0-9%\>.]*\.[[:alpha:]]{2,}$',trim(email))>
					<cfquery datasource="#request.dsn#" name="insert_email">
						INSERT INTO email_tracker (email, name)
						VALUES ('#trim(email)#', '#UCase(Left(Trim(get_loaners_emails.lo_fname),1))##LCase(Mid(Trim(get_loaners_emails.lo_fname),2,500))# ')				
					</cfquery>
				</CFIF>
			</cfloop>
		</cfloop>
		
	 <cfquery datasource="#request.dsn#" name="allemails">
		SELECT email, name, code
		FROM email_tracker
		WHERE code = 0
		ORDER BY code DESC, email, name
	 </cfquery>	 
	 <cfdump var="#allemails#" expand="no">
 --->

<!--- send a test email
<cfset variables.recipient = "First Title User">
<cfset variables.recipient_email = "sodell@firsttitleservices.com"> 
<cfmail to="#variables.recipient_email#" 
		from="news@firsttitleservices.com" 
		subject="JUST A TEST: Guaranteed Fees with our 2010 HUD-1, Closing Cost Calculator, and GFE Tool" 
		type="html"><cfinclude template="email_announcement_02.cfm"></cfmail>		
 --->


<!--- Add addresses to the mailing list 

	<cfquery datasource="#request.dsn#" name="insert_email">
		INSERT INTO email_tracker (email, name)
		VALUES ('shaun.odell@gmail.com', 'Shaun')				
	</cfquery>

 --->
 
Remove cfabort to use.<cfabort>
  
<!--- process email addresses --->
<cfset variables.morerecords = true>
<cfset variables.emails_processed = 0>

<cfoutput>
Script Begin: #TimeFormat(Now())#. 
<br><br>
<form name="numf" id="numf">Emails Processed:<input name="num" id="num" type="text" value="#variables.emails_processed#"></form>
<br><br>
</cfoutput>
<cfflush>

<cfloop condition="#variables.morerecords#"> 

	<!--- Select a single email that hasn't been sent to --->
	<cfquery datasource="#request.dsn#" name="single_email">
		SELECT TOP 1 email, name
		FROM email_tracker
		WHERE code = 0
		ORDER BY email, name
	</cfquery>
	
	<!--- if no emails left in db, end the loop.  otherwise process the email --->
	<cfif single_email.recordcount EQ 0>	
		
		<cfset variables.morerecords = false>
		
	<cfelse>		
		
		<cftry>
							
			<!--- send the email --->
			<cfset variables.recipient = single_email.name>
			<cfset variables.recipient_email = single_email.email> 
			<cfmail to="#variables.recipient_email#" 
					from="news@firsttitleservices.com" 
					subject="Guaranteed Fees with our 2010 HUD-1, Closing Cost Calculator, and GFE Tool" 
					type="html"><cfinclude template="email_announcement_02.cfm"></cfmail>					
			<!--- set the success code --->
			<cfset variables.processcode = 1>
			
			<cfcatch type="any">
				
				<!--- set the error code --->
				<cfset variables.processcode = 2>
				
			</cfcatch>
		
		</cftry>
			
		<!--- Update the CODE field FOR ALL records with the email address of the one we just sent (removes duplicates)	WITH "1" indicating success OR "2" indicating a general error --->
		<cfquery datasource="#request.dsn#" name="single_email">
			UPDATE email_tracker SET
			code = #variables.processcode#
			WHERE email = '#single_email.email#'
		</cfquery>		
		
		<!--- increment the counter and provide visual feedback via the form --->
		<cfset variables.emails_processed = variables.emails_processed + 1>
		<cfoutput>
			<script type="text/javascript">document.numf.num.value=#variables.emails_processed#;</script></cfoutput>
		<cfflush>
		
	</cfif>	
	
</cfloop>
<cfoutput>Script End #TimeFormat(Now())#.</cfoutput>