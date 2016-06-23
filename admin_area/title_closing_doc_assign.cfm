<cfset objChase = CreateObject('component','cfc.chaseRealEC')>

<CFPARAM NAME="a_trigger" DEFAULT=0>

<CFQUERY datasource="#request.dsn#" NAME="check">
select * from doc_closer_title
where title_id = #rec_id#

</cfquery>

<cfif check.recordcount EQ 0>
<CFQUERY datasource="#request.dsn#" NAME="ins">
insert into doc_closer_title(title_id)
values(#rec_id#)

</cfquery>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_cl">

			SELECT *
			FROM Title_Closing_Order_Request
			WHERE title_ID = #rec_ID#

		</CFQUERY>

	<cfif #read_cl.request_date# eq "">

	<CFLOCATION URL="https://#cgi.server_name#/admin_area/title_closing_doc_view.cfm?uid=#uid#&al=#al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&a_point=1">

	<cfelse>


	<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#

		</CFQUERY>

<cfif #read_title.appraisal_status# neq "Loan Closed">
		<CFQUERY datasource="#request.dsn#" NAME="read_status">
			UPDATE Title
			SET appraisal_status = 'Closer Assigned'
			WHERE title_ID = #rec_ID#
		</CFQUERY>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_abs">

			select * from closer
			WHERE closer_ID = #closer_ID_new#

		</CFQUERY>


<cfif #a_trigger# eq 10>
<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
<CFQUERY datasource="#request.dsn#" NAME="read_cl">
			SELECT *
			FROM Title_Closing_Order_Request
			WHERE title_ID = #rec_ID#
		</CFQUERY>

<cfif read_cl.a_req_closing_time neq ''>
<CFQUERY datasource="#request.dsn#" NAME="check_closer_availability">
Select *
from Doc_closer_Title c, Title_Closing_Order_Request r
where c.closer_id = #closer_id_new#
and r.a_req_closing_month = #read_cl.a_req_closing_month#
and r.a_req_closing_day = #read_cl.a_req_closing_day#
and r.a_req_closing_year = #read_cl.a_req_closing_year#
and r.a_req_closing_time = '#read_cl.a_req_closing_time#'
and r.title_id = c.title_id
</cfquery>

<cfif check_closer_availability.recordcount>
<script language="javascript">
alert("This closer already has another appointment at this date and time, please reschedule, or choose a different closer.");
history.back();
</script>
</cfif>
</cfif>


		<CFQUERY datasource="#request.dsn#" NAME="read_title_abs">
		UPDATE Doc_closer_Title
			SET closer_ID = #closer_ID_new#,
			a_Assigned_by = #uid#,
			a_Date_Assigned = '#DateFormat(Now(), "mm/dd/yyyy")#',
			ac_dateandtime = '#order_date_adj#',
			a_Time_Assigned = '#TimeFormat(Now(), "HH:mm:ss")#'
			WHERE title_ID = #rec_ID#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_user">
			select * from first_admin
			WHERE ID = #session.ft_user_id#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Closing assigned to vendor', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_event">

			select * from eventlist
			WHERE title_ID = #rec_id#

		</CFQUERY>
		<cfif #read_event.c_day# neq "" or #read_event.c_comment# neq "">
		<cfquery name="updateclosing" datasource="#request.dsn#">
update eventlist
set
	yearmonth = null,
	yearmonthday = null,
	sc_dateandtime = null,
	c_day = null,
	c_time = null,
	c_year = null,
	c_month = null,
	s_time = null,
	s_date = null,
	l_date = null,
	l_time = null,
	c_comment = null,
	closing_date = null
where title_id = #URL.rec_id#
</cfquery>
	</cfif>
</cfif>

<cfif Len(read_title.realec_transactionID) AND Len(read_title.realec_transactionid)>	
<cfset signingmethod = structNew()>
<cfset signingmethod.signingmethod = read_cl.signing_method_type>
<cfif read_cl.multiple_sets eq 1>
<cfset productCode=285>
<cfelse>
<cfset productCode=284>
</cfif>
<cfset objChase.addTurnTimeEvent(title_id=#read_title.title_id#,event_type="marker",event_description="closing_scheduled")>
<cfif form.reassign EQ 1>
	<cfset objChase.processEvent(eventCode=310,  productCode=#productCode#, title_id=#read_title.title_id#, signingmethod=signingmethod)>
<cfelse>
	<cfset objChase.processEvent(eventCode=300,  productCode=#productCode#, title_id=#read_title.title_id#, signingmethod=signingmethod)>	
</cfif>				
 
</cfif> 


<CFLOCATION URL="https://#cgi.server_name#/admin_area/title_closing_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=0&company_id=#url.company_id#">
	</cfif>