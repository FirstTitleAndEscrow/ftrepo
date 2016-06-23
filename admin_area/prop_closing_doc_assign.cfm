<!--- <cfif cgi.REMOTE_ADDR eq '98.233.235.105'>

<cfabort>

</cfif>
 --->
<CFPARAM NAME="a_trigger" DEFAULT=0>

<CFQUERY datasource="#request.dsn#" NAME="read_cl">
			SELECT *
			FROM Title_Closing_Order_Request_Prop
			WHERE prop_ID = #rec_ID#
		</CFQUERY>
<cfif read_cl.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="insert_cl">
			insert into Title_Closing_Order_Request_Prop (prop_id)
			values ('#rec_ID#')
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_cl">
			SELECT *
			FROM Title_Closing_Order_Request_Prop
			WHERE prop_ID = #rec_ID#
		</CFQUERY>
</cfif>

	<cfif #read_cl.request_date# eq "">

	<CFLOCATION URL="https://#cgi.server_name#/admin_area/prop_closing_doc_view.cfm?uid=#uid#&al=#al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&a_point=1">

	<cfelse>


		<CFQUERY datasource="#request.dsn#" NAME="read_status">

			UPDATE Property
			SET appraisal_status = 'Closer Assigned'
			WHERE prop_ID = #rec_ID#

		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_abs">

			select * from closer
			WHERE closer_ID = #closer_ID_new#

		</CFQUERY>


<cfif #a_trigger# eq 10>
<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
<CFQUERY datasource="#request.dsn#" NAME="read_abs">
			SELECT *
			FROM Doc_closer_Prop
			WHERE prop_ID = #rec_ID#
		</CFQUERY>
<cfif  read_abs.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="insert_cl">
			insert into Doc_closer_Prop (prop_id)
			values ('#rec_ID#')
		</CFQUERY>
</cfif>

		<CFQUERY datasource="#request.dsn#" NAME="read_title_abs">
			UPDATE Doc_closer_Prop
			SET closer_ID = #closer_ID_new#,
			a_Assigned_by = #uid#,
			a_Date_Assigned = '#DateFormat(Now(), "mm/dd/yyyy")#',
			ac_dateandtime = '#order_date_adj#',
			a_Time_Assigned = '#TimeFormat(Now(), "HH:mm:ss")#'
			WHERE prop_ID = #rec_ID#

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_user">

			select * from first_admin

			WHERE ID = #session.ft_user_id#

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Closing assigned to vendor', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'P', '1', '1')
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_event">
			select * from eventlist
			WHERE prop_ID = #rec_id#
		</CFQUERY>
<cfif read_event.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="insert_cl">
			insert into eventlist (prop_id)
			values ('#rec_ID#')
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_event">
			select * from eventlist
			WHERE prop_ID = #rec_id#
		</CFQUERY>
</cfif>
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
where prop_id = #URL.rec_id#
</cfquery>
	</cfif>
</cfif>

<cfparam name="form.A_REQ_CLOSING_TIME" default="">
<cfparam name="form.A_SETTLE_LOCATION" default="">
<cfparam name="form.COMFIRM_DAY" default="">
<cfparam name="form.CONFIRM_MON" default="">
<cfparam name="form.CONFIRM_YEAR" default="">

<cfif form.A_REQ_CLOSING_TIME neq ''>
<cfset hour_ord = ListGetAt(form.A_REQ_CLOSING_TIME, 1, ": ")>
<cfset min_ord = ListGetAt(form.A_REQ_CLOSING_TIME, 2, ": ")>
<cfset sec_ord = '0'>
<cfset ampm_ord = ListGetAt(form.A_REQ_CLOSING_TIME, 3, ": ")>
</cfif>
<cfif hour_ord eq 12 and ampm_ord eq 'am'>
<cfset hour_ord = '0'>
<cfelseif hour_ord neq 12 and ampm_ord eq 'PM'>
<cfset hour_ord = hour_ord + 12>
</cfif>
<cfif form.A_REQ_CLOSING_TIME neq '' and form.CONFIRM_MON neq ''>
<cfquery name="updateclosing" datasource="#request.dsn#">
update eventlist
set
	yearmonth = #CreateDate(form.CONFIRM_YEAR,form.CONFIRM_MON,form.COMFIRM_DAY)#,
	yearmonthday = '#form.CONFIRM_YEAR##form.CONFIRM_MON##form.COMFIRM_DAY#',
	sc_dateandtime = #CreateDateTime(form.CONFIRM_YEAR,form.CONFIRM_MON,form.COMFIRM_DAY,hour_ord,min_ord,sec_ord)#,
	c_day = '#form.COMFIRM_DAY#',
	c_time = '#form.A_REQ_CLOSING_TIME#',
	c_year = '#form.CONFIRM_YEAR#',
	c_month = '#form.CONFIRM_MON#',
	s_time = '#form.A_REQ_CLOSING_TIME#',
	s_date = #CreateDate(form.CONFIRM_YEAR,form.CONFIRM_MON,form.COMFIRM_DAY)#,
	closing_date = #CreateDate(form.CONFIRM_YEAR,form.CONFIRM_MON,form.COMFIRM_DAY)#,
	comp_id = '#form.comp_id#'
where prop_id = #URL.rec_id#
</cfquery>
</cfif>
<CFLOCATION URL="https://#cgi.server_name#/admin_area/prop_closing_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=0&company_id=#url.company_id#">
	</cfif>