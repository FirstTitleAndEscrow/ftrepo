<!---
		
		Create the table of good email adresses

		<!--- STEP 1: Get Raw Addresses and Names data --->
		<cfquery datasource="#request.dsn#" name="get_emails">
		SELECT lp_fname, lp_email
		FROM Users
		WHERE (streamline_emp = 0 OR streamline_emp is null) 
		AND lp_email is not null
		AND lp_email <> ''
		AND lp_fname is not null
		AND lp_fname <> ''
		ORDER BY lp_email;
		</cfquery>
		
		
		<!--- STEP 2, create email table with only valid emails --->
		<cfloop query="get_emails">
			<cfloop list="#get_emails.lp_email#" index="email">
				<CFIF REFindNoCase('^([[:alnum:]][-a-zA-Z0-9_%\.]*)?[[:alnum:]]@[[:alnum:]][-a-zA-Z0-9%\>.]*\.[[:alpha:]]{2,}$',trim(email))>
					<cfquery datasource="#request.dsn#" name="insert_email">
						INSERT INTO email_tracker (email, name)
						VALUES ('#trim(email)#', '#UCase(Left(Trim(get_emails.lp_fname),1))##LCase(Mid(Trim(get_emails.lp_fname),2,500))# ')				
					</cfquery>
				</CFIF>
			</cfloop>
		</cfloop>
 --->
 
 <!---  #### Table reset 
		<cfquery datasource="#request.dsn#" name="insert_email">
			DELETE FROM email_tracker 
		</cfquery>
 --->
 	


<!--- send the email test
<cfset variables.recipient = "First Title User">
<cfset variables.recipient_email = "sodell@firsttitleservices.com"> 
<cfmail to="#variables.recipient_email#" 
		from="news@firsttitleservices.com" 
		subject="NEW Automatic 2010 HUD-1, Updated Closing Cost Calculator, and GFE Tool" 
		type="html"><cfinclude template="email_announcement.cfm"></cfmail>		

 --->
 
  <cfabort> The following won't actually do anything (all the codes have been set to 1 after the first run completed), but leaving the abort tag out here anyways.
  
<!--- process email addresses --->
<cfset variables.morerecords = true>
<cfset variables.emails_processed = 0>

<cfoutput><form name="numf" id="numf">Emails Processed:<input name="num" id="num" type="text" value="#variables.emails_processed#"></form>
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
					subject="NEW Automatic 2010 HUD-1, Updated Closing Cost Calculator, and GFE Tool" 
					type="html"><cfinclude template="email_announcement.cfm"></cfmail>					
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