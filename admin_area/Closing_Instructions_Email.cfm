<CFQUERY datasource="#request.dsn#" NAME="Instructions_Uploaded">
	SELECT     TOP 100 PERCENT dbo.EventList.YearMonth, dbo.Title.Title_ID, dbo.Doc_Closer_Title.closing_instructions, dbo.Doc_Closer_Title.closing_inst_date,
                      dbo.Doc_Closer_Title.closing_inst_time, dbo.Doc_Closer_Title.final_HUD, dbo.Companies.company, dbo.Companies.team_id, dbo.Title.pname, dbo.Title.p_email,
                      dbo.Title.email_date
	FROM         dbo.Title LEFT OUTER JOIN
                      dbo.Companies ON dbo.Title.comp_id = dbo.Companies.ID LEFT OUTER JOIN
                      dbo.Doc_Closer_Title ON dbo.Title.Title_ID = dbo.Doc_Closer_Title.TITLE_ID LEFT OUTER JOIN
                      dbo.EventList ON dbo.Title.Title_ID = dbo.EventList.Title_id
	WHERE     (dbo.EventList.YearMonth >= CONVERT(DATETIME, '2004-05-12 00:00:00', 102)) AND (dbo.Doc_Closer_Title.closing_instructions IS NOT NULL) AND
                      (dbo.Doc_Closer_Title.final_HUD IS NULL) AND (dbo.Title.email_date IS NULL)
	ORDER BY dbo.EventList.YearMonth
</CFQUERY>

<cftry>
<cfinvoke component = "cfc.team_info"	method = "getTeamEmail"	returnVariable = "team_email" team_id="#Instructions_Uploaded.team_id#">
<cfcatch type="Any">
		<cfoutput>
		<cfmail from="rjermain@firsttitleservices.com" to="rjermain@firsttitleservices.com" subject="Team Email Failure">
		<hr>
			<h1>Other Error: #cfcatch.Type#</h1>
			<ul>
				<li><b>Message:</b> #cfcatch.Message#
				<li><b>Detail:</b> #cfcatch.Detail#
				<li><B>Page:</B> #GetBaseTemplatePath()#
			</ul>
		</cfmail>
        </cfoutput>
	</cfcatch>
</cftry>

<CFSET b_emails_to_first_title = "pgibb@firsttitleservices.com,mharvey@firsttitleservices.comm">
<CFLOOP QUERY="Instructions_Uploaded">
	<CFMAIL SUBJECT="Closing Instructions for First Title Order #Instructions_Uploaded.title_id#"
	FROM="#team_email#"
	To="#Instructions_Uploaded.p_email#"
	type="HTML">

Your Closing Instructions for First Title Order #Instructions_Uploaded.title_id#
were uploaded on #closing_inst_date# at #closing_inst_time#.

</CFMAIL>

	<CFMAIL SUBJECT="Closing Instructions for First Title Order #Instructions_Uploaded.title_id#"
	FROM="#team_email#"
	To="pgibb@firsttitleservices.com,mharvey@firsttitleservices.com"
	type="HTML">

The Closing Instructions for First Title Order #Instructions_Uploaded.title_id#
were uploaded on #closing_inst_date# at #closing_inst_time#.

</CFMAIL>

</CFLoop>


<cfif #Instructions_Uploaded.RecordCount# gt 0 >
		<CFLOCATION URL="https://#cgi.server_name#/admin_area/Email_Date_Update.cfm?">
</CFIF>

