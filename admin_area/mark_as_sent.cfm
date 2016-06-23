
<cfparam name="form.submit" default="0">





<cfif form.submit eq 0>
Type in the file number<br />
<form action="#cgi.script_name#" name="this_form" method="post">
<input type="text" name="idnumber" size="5" />
<input type="submit" name="submit" value="Submit" />

</form>
<cfabort>
</cfif>



<cfif form.submit eq 'Submit'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">
		select *
		from title
		WHERE title_id = #form.idnumber#
	</cfquery>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_time">
		select check_date
		from title
		WHERE title_id = #form.idnumber#
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
	<cfif add_day eq -1>
	<cfset add_day = 1>
	</cfif>
<CFSET newdate = #CreateDate(#add_year#, #add_month#, #add_day#)#>
<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_user">
select * from first_admin
WHERE ID = #session.ft_user_id#
</CFQUERY>


<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
update Doc_Title_Insurance_Title set s_status = 1,
a_recieved_date = #newdate#,
a_recieved_time = '#TimeFormat(Now(), "HH:mm:ss")#',
f_dateandtime = '#order_date_adj#',
a_recieved_by = #session.ft_user_id#
WHERE title_id = #form.idnumber#
</cfquery>
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert_filename">
update vendor_tracker_new
set completed = 1
where order_id = #form.idnumber#
AND task = 'Review'
</cfquery>


<cfif #read_title.appraisal_status# neq "Loan Closed"
and #read_title.appraisal_status# neq "Closer Assigned"
and #read_title.appraisal_status# neq "Closing Complete"
and #read_title.appraisal_status# neq "Closing Requested"
and #read_title.appraisal_status# neq "Closing Rescheduled"
and #read_title.appraisal_status# neq "Closing Scheduled">
<CFQUERY DATASOURCE="#request.dsn#" NAME="insert">
update title set appraisal_status = 'Report E-mailed'
WHERE title_id = #form.idnumber#
</cfquery>
</cfif>

<CFQUERY DATASOURCE="#request.dsn#">
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('#read_user.FName#', '#read_user.LName#', #form.idnumber#, 'Title Commitment Delivered by e-mail', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
</CFQUERY>
File successfully marked as Sent<br />
<a href="mark_as_sent.cfm">Return to form</a><br />
<br />
</cfif>