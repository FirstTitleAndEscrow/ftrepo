
<CFPARAM NAME="a_trigger" DEFAULT=0>

<CFQUERY datasource="#request.dsn#" NAME="read_cl">

			SELECT *
			FROM Title_Closing_Order_Request_anc
			WHERE anc_ID = #rec_ID#

		</CFQUERY>

	<cfif #read_cl.request_date# eq "">

	<CFLOCATION URL="https://#cgi.server_name#/admin_area/title_closing_doc_view_sn.cfm?uid=#uid#&al=#al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&a_point=1">

	<cfelse>


		<CFQUERY datasource="#request.dsn#" NAME="read_status">

			UPDATE Ancillary
			SET appraisal_status = 'Closer Assigned'
			WHERE anc_ID = #rec_ID#

		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_abs">

			select * from closer
			WHERE closer_ID = #closer_ID_new#

		</CFQUERY>


<cfif #a_trigger# eq 10>
<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
		<CFQUERY datasource="#request.dsn#" NAME="read_title_abs">


		UPDATE Doc_closer_Anc
			SET closer_ID = #closer_ID_new#,
			a_Assigned_by = #uid#,
			a_Date_Assigned = '#DateFormat(Now(), "mm/dd/yyyy")#',
			ac_dateandtime = '#order_date_adj#',
			a_Time_Assigned = '#TimeFormat(Now(), "HH:mm:ss")#'
			WHERE anc_ID = #rec_ID#

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_user">

			select * from first_admin

			WHERE ID = #session.ft_user_id#

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Closing assigned to vendor', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'S', '1', '1')
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_event">

			select * from eventlist
			WHERE anc_ID = #rec_id#

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
where anc_id = #URL.rec_id#
</cfquery>
	</cfif>
</cfif>

<CFLOCATION URL="https://#cgi.server_name#/admin_area/title_closing_doc_view_sn.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=0&company_id=#url.company_id#">
	</cfif>