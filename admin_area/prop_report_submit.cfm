			<CFQUERY datasource="#request.dsn#" NAME="read_title">
			select * from Property
			WHERE prop_id = #url.rec_ID#
			</cfquery>
			<CFQUERY datasource="#request.dsn#" NAME="read_company">
			select * from companies
			WHERE id = #read_title.comp_ID#
			</cfquery>
<cfif #a_trigger# EQ "7">
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
<cfif Len(read_title.logstransactionid) eq 0 or read_title.logstransactionid eq 'NULL'>
		<CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Property Report Completed - emailed to client', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>
</cfif>
					<CFQUERY datasource="#request.dsn#" NAME="read_title_data">
			select * from prop_ins_view
			WHERE prop_id = #url.rec_ID# and selectedOrgs is not null
			</cfquery>





<CFIF #read_title.comp_id# eq "627">
    <CFSET Email = "REIOSOrders@CTT.com">
<CFELSE>
    <CFSET Email = "#read_title.p_email#">
</CFIF>


<cfset sd_list="9506,9507,9508,9510,9509,9511,9567">
<!--- if this is S&D or one of their companies (listed above) - then use different email --->
	<cfif ListContains(sd_list,read_title.comp_id,",") or Mid(read_company.company,1,3) eq 'S&D'>
	<CFSET Email = "teamlogs@streamline-title.com">
	</cfif>

<cfif cgi.REMOTE_ADDR eq '98.233.235.105'>
	<CFSET Email = "rjermain@firsttitleservices.com">
</cfif>



<cfif Len(read_title.logstransactionid) eq 0 or read_title.logstransactionid eq 'NULL'>
<CFMAIL
TO="#Email#"
FROM="webmaster@firsttitleservices.com" Subject="Property Report has been completed for order number #rec_id#, Loan Number: #read_title.loan_number# -- #read_title.bfirstname1# #read_title.blastname1#"
TIMEOUT="600"
type="HTML"
	>

Property Report has been completed for order number #rec_id#.<br>

To view/print it you may click <a href="https://#cgi.server_name#/property_report.cfm?comp_id=#read_title.comp_id#&rec_id=#rec_id#" target = "new">Property Report</a><br><br>

Thank you,<br><br>

First Title and Escrow staff
</CFMAIL>
</cfif>
</CFIF>



<cfif Len(read_title.logstransactionid)>
<cfset prop_id = #rec_id#>
<cfinclude template="../includes/prop_report_create_pdf.cfm">
<cfset prop_id = #rec_id#>
<cfset filename = "P-" & #rec_id# & "_REPORT.PDF">
<cfinvoke	component = "cfc.LOGS"	method = "sendPropReportProduct" order_ID="#rec_ID#" filename="#filename#">
</cfif>


<CFLOCATION URL="https://#cgi.server_name#/admin_area/admin_property_report.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=0">



