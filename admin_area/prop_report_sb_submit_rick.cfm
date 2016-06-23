<cfif #a_trigger# EQ "7">
			<CFQUERY datasource="#request.dsn#" NAME="read_title">
			select * from Property
			WHERE prop_id = #url.rec_ID#
			</cfquery>


<CFQUERY datasource="#request.dsn#" NAME="read_time">
			select check_date from Property
			WHERE prop_id = #url.rec_ID#
			</cfquery>



	<CFSET today = #DateFormat(Now(), "mm-dd-yyyy")#>
	<CFSET num_day = #DatePart('W', #today#)#>
	<!--- note: Sun = 1
				Mon = 2
				Tue = 3
				Wed = 4
				Thu = 5
				Fri = 6
				Sat = 7 --->

	<!--------------------------->
	<!--- Fourth Business Day --->
	<!--------------------------->

	<cfif #read_time.check_date# neq "">


	<CFIF #DayOfWeek(today)# EQ 1>

		<CFSET add_day = #Day(today)# - 2>
	<CFELSEIF #DayOfWeek(today)# EQ 2>
		<CFSET add_day = #Day(today)#>
	<CFELSEIF #DayOfWeek(today)# EQ 3>

		<CFSET add_day = #Day(today)#>
	<CFELSEIF #DayOfWeek(today)# EQ 4>

		<CFSET add_day = #Day(today)#>
	<CFELSEIF #DayOfWeek(today)# EQ 5>

		<CFSET add_day = #Day(today)#>
	<CFELSEIF #DayOfWeek(today)# EQ 6>

		<CFSET add_day = #Day(today)#>
	<CFELSEIF #DayOfWeek(today)# EQ 7>
		<CFSET add_day = #Day(today)# - 1>
<CFELSE>
<CFSET add_day = #Day(today)#>
	</CFIF>
	<cfelse>
	<CFSET add_day = #Day(today)#>
	</cfif>

<CFSET add_month = #Month(today)#>

	<CFSET add_year = #year(today)#>

<CFSET newdate = #CreateDate(#add_year#, #add_month#, #add_day#)#>

<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>

			<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			update Doc_Title_Insurance_prop set s_status = 1,
			 a_recieved_date = #newdate#,
				a_recieved_time = '#TimeFormat(Now(), "HH:mm:ss")#',
				f_dateandtime = '#order_date_adj#',
				a_recieved_by = #uid#
				WHERE prop_id = #url.rec_ID#
			</cfquery>
				<CFQUERY datasource="#request.dsn#" NAME="insert">
			update Property set appraisal_status = 'Report E-mailed'
			WHERE prop_id = #url.rec_ID#
			</cfquery>
		<CFQUERY datasource="#request.dsn#" NAME="read_user">

			select * from first_admin

			WHERE ID = #session.ft_user_id#

		</CFQUERY>

			<CFQUERY datasource="#request.dsn#" NAME="read_title_data">
			select * from prop_ins_view
			WHERE prop_id = #url.rec_ID# and selectedOrgs is not null
			</cfquery>





<CFIF #read_title.comp_id# eq "627">
    <CFSET Email = "REIOSOrders@CTT.com">
<CFELSE>
    <CFSET Email = "#read_title.p_email#">
</CFIF>

<cfset prop_id = #rec_id#>

<cfif Len(read_title.logstransactionid) eq 0 or read_title.logstransactionid eq 'NULL' or read_title.logstransactionid eq ''>
<cfif Len(fileSys.FindFilePath('P-#rec_id#_REPORT.PDF', 'file'))>
<cffile action="delete" file="#fileSys.FindFilePath('P-#rec_id#_REPORT.PDF', 'file')#">
</cfif>
<cfif Len(fileSys.FindFilePath('P-#rec_id#_INVOICE.PDF', 'file'))>
<cffile action="delete" file="#fileSys.FindFilePath('P-#rec_id#_INVOICE.PDF', 'file')#">
</cfif>

<cfinclude template="../includes/sb_prop_report_create_pdf.cfm">
<cfinclude template="../includes/sbinvoice.cfm">
</cfif>

<cfquery name="get_file1" datasource="#request.dsn#">
SELECT abstractor_doc_upload
FROM  doc_abstract_prop
WHERE prop_id = #prop_ID#
</CFQUERY>
<cfquery name="get_updates" datasource="#request.dsn#">
SELECT *
FROM  abstractor_uploads
WHERE order_id = #prop_ID#
</CFQUERY>

<!--- if this is S&B OTHER (company ID 6415) - then use different emails depending on the state ---> 
	<cfif read_title.comp_id eq 6415>
	<cfif read_title.pstate eq 'MD'>
	<CFSET Email = "Mdtitle@streamline-title.com">
	<cfelse>
	<CFSET Email = "vabtitlereceived@streamline-title.com">
	</cfif>
	</cfif>




<cfif Len(read_title.logstransactionid) eq 0 or read_title.logstransactionid eq 'NULL' or read_title.logstransactionid eq ''>

<cftry>
<CFMAIL
TO="#email#"
FROM="vendormgr@streamline-title.com" bcc="rjermain@firsttitleservices.com" Subject="Property Report has been completed for order number #rec_id#, Loan Number: #read_title.loan_number# -- #read_title.bfirstname1# #read_title.blastname1#"
TIMEOUT="600"
type="HTML"
	>
	
<cfoutput>
Follow these links to download your files.
(Click to open, right-click to save)<br>
<br>
<cfif Len(fileSys.FindFilePath('P-#rec_id#_REPORT.PDF', 'file'))>
<cfset new_url = fileSys.FindFilePath('P-#rec_id#_REPORT.PDF', 'url')>
<cfset new_url = ReplaceNoCase(new_url, "\", "/", "ALL")>
<cfset new_url = ReplaceNoCase(new_url, "http:", "https:", "ALL")>
Property Report<BR>
<a href="#new_url#" target="new">P-#rec_id#_REPORT.PDF</a><br>
<br>
</cfif>

<cfif Len(fileSys.FindFilePath('P-#rec_id#_INVOICE.PDF', 'file'))>
<cfset new_url = fileSys.FindFilePath('P-#rec_id#_INVOICE.PDF', 'url')>
<cfset new_url = ReplaceNoCase(new_url, "\", "/", "ALL")>
<cfset new_url = ReplaceNoCase(new_url, "http:", "https:", "ALL")>
Invoice<BR>
<a href="#new_url#" target="new">P-#rec_id#_INVOICE.PDF</a><br>
<br>
</cfif>

<cfif Len(fileSys.FindFilePath('#get_file1.abstractor_doc_upload#', 'file'))>
<cfset new_url = fileSys.FindFilePath('#get_file1.abstractor_doc_upload#', 'url')>
<cfset new_url = ReplaceNoCase(new_url, "\", "/", "ALL")>
<cfset new_url = ReplaceNoCase(new_url, "http:", "https:", "ALL")>
Original Search<BR>
<a href="#new_url#" target="new">#get_file1.abstractor_doc_upload#</a><br>
<br>
</cfif>

<!--- <cfif Len(fileSys.FindFilePath('P-#rec_id#_REPORT.PDF', 'file'))>
<cfset temp = #fileSys.FindFilePath('P-#rec_id#_REPORT.PDF', 'file')#>
<cfmailparam 
file="#temp#" 
disposition="attachment; filename=""P-#rec_id#_REPORT.PDF""">
</cfif>

<cfif Len(fileSys.FindFilePath('P-#rec_id#_INVOICE.PDF', 'file'))>
<cfset temp = #fileSys.FindFilePath('P-#rec_id#_INVOICE.PDF', 'file')#>
<cfmailparam 
file="#temp#" 
disposition="attachment; filename=""P-#rec_id#_INVOICE.PDF""">
</cfif>

<cfif Len(fileSys.FindFilePath('#get_file1.abstractor_doc_upload#', 'file'))>
<cfset temp = #fileSys.FindFilePath('#get_file1.abstractor_doc_upload#', 'file')#>
<cfmailparam 
file="#temp#" 
disposition="attachment; filename=""#get_file1.abstractor_doc_upload#""">
</cfif> --->




The Property Report has been completed for order number #rec_id#, and is included as a link in this email.<br>
<br>
The original Search: '#get_file1.abstractor_doc_upload#' has also been linked:<br>
<!--- <A HREF="#fileSys.FindFilePath('#get_file1.abstractor_doc_upload#', 'url', 'st')#" target="new">#get_file1.abstractor_doc_upload#</a><BR> --->
<br>
<cfif get_updates.recordcount>
Additional Updates to the Search are available here:<Br>


<cfloop query="get_updates">
<cfif Len(fileSys.FindFilePath('#get_updates.filename#', 'file'))>
<cfset new_url = fileSys.FindFilePath('#get_updates.filename#', 'url')>
<cfset new_url = ReplaceNoCase(new_url, "\", "/", "ALL")>
<cfset new_url = ReplaceNoCase(new_url, "http:", "https:", "ALL")>
Original Search<BR>
<a href="#new_url#" target="new">#get_updates.filename#</a><br>
<br>
</cfif>
</cfloop>
</cfif>
</cfoutput>

Thank you,<br><br>

Streamline Title staff
</CFMAIL>
<cfcatch type="any">
<cfmail to="rjermain@firsttitleservices.com" from="rjermain@firsttitleservices.com" subject="BAD PROP REPORT SEND - REGULAR EMAIL">
#cfcatch.Detail#<br>
<br>
File Number: P-#rec_id#<br>
</cfmail>
</cfcatch>
</cftry>

</cfif>

<cfif Len(read_title.logstransactionid) eq 0 or read_title.logstransactionid eq 'NULL' or read_title.logstransactionid eq ''>
		<CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Property Report Completed - emailed to client', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>
</cfif>


</CFIF>


<cfif Len(read_title.logstransactionid)>
<cfset prop_id = #rec_id#>
<cfinclude template="../includes/sb_prop_report_create_pdf.cfm">
<cfinclude template="../includes/sbinvoice.cfm">
<cfset prop_id = #rec_id#>
<cfset filename = "P-" & #rec_id# & "_REPORT.PDF">

<cftry>
<cfinvoke	component = "cfc.LOGS"	method = "sendPropReportProduct" order_ID="#rec_ID#" filename="#filename#">
<cfcatch type="any">
<cfmail to="rjermain@firsttitleservices.com" from="rjermain@firsttitleservices.com" subject="BAD PROP REPORT SEND - LOGS SYSTEM">
#cfcatch.Detail#<br>
<br>
File Number: P-#rec_id#<br>
</cfmail>
</cfcatch>
</cftry>
</cfif>

<CFLOCATION URL="https://#cgi.server_name#/admin_area/admin_property_report.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=0">



