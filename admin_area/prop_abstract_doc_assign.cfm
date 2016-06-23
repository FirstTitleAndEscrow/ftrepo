<CFPARAM NAME="a_trigger" DEFAULT=0>

<CFQUERY datasource="#request.dsn#" NAME="read_abs">

			select * from abstractors
			WHERE abstractor_ID = #Abstractor_ID_new#

		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="find_rec">
select * from Doc_Abstract_prop
WHERE prop_ID = #rec_ID#
</CFQUERY>
<cfif find_rec.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="insert_rec">
Insert into Doc_Abstract_Prop (prop_id)
values (#rec_id#)
</CFQUERY>
</cfif>


<cfif #a_trigger# eq 10>

		<CFQUERY datasource="#request.dsn#" NAME="read_title_abs">
			UPDATE Doc_Abstract_prop
			SET Abstractor_ID = #Abstractor_ID_new#,
			a_Assigned_by = #uid#,
			company = '#read_abs.company#',
			a_Date_Assigned = '#DateFormat(Now(), "mm/dd/yyyy")#',
			a_Time_Assigned = '#TimeFormat(Now(), "HH:mm:ss")#'
			WHERE prop_ID = #rec_ID#
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="reset_typing_abs">
			UPDATE tblUser_Roles
			SET Typing_End_Datetime = NULL
			WHERE prop_ID = #rec_ID#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_user">
			select * from first_admin

			WHERE ID = #session.ft_user_id#
		</CFQUERY>




		<CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Abstract Assigned to Vendor', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>
				<CFQUERY datasource="#request.dsn#" NAME="read_event">

			select * from eventlist
			WHERE title_ID = #rec_id#

		</CFQUERY>
<cfif #read_event.c_day# neq "">
		<cfquery name="updateclosing" datasource="#request.dsn#">
update eventlist
set
	yearmonth = null,
	yearmonthday = null,
	c_day = null,
	c_time = null,
	c_year = null,
	c_month = null,
	s_time = null,
	s_date = null,
	l_date = null,
	l_time = null,
	closing_date = null
where title_id = #URL.rec_id#
</cfquery>
	</cfif>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_title">
			select * from Property
			WHERE prop_ID = #URL.rec_id#
		</CFQUERY>

<cfinclude template="../includes/abstractor_auto_email_prop.cfm">

<CFLOCATION URL="https://#cgi.server_name#/admin_area/prop_abstract_doc_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=0&company_id=#url.company_id#">
