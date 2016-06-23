<cfabort>
<cfif #a_trigger# EQ "7">
    <CFQUERY datasource="#request.dsn#" NAME="read_time">
	    select check_date from title
		WHERE title_id = #url.rec_ID#
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
	    update Doc_Title_Insurance_Title set s_status = 1,
		a_recieved_date = #newdate#,
		a_recieved_time = '#TimeFormat(Now(), "HH:mm:ss")#',
		f_dateandtime = '#order_date_adj#',
		a_recieved_by = #uid#
		WHERE title_id = #url.rec_ID#
	</cfquery>

    <CFQUERY datasource="#request.dsn#" NAME="insert">
	    update title set appraisal_status = 'Report E-mailed'
		WHERE title_id = #url.rec_ID#
	</cfquery>

    <CFQUERY datasource="#request.dsn#" NAME="read_user">
	    select * from first_admin
		WHERE ID = #session.ft_user_id#
	</CFQUERY>

    <CFQUERY datasource="#request.dsn#">
	    INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
		VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Title Commitment Delivered by e-mail', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
	</CFQUERY>

    <CFQUERY datasource="#request.dsn#" NAME="read_title_data">
	    select * from title_ins_view
		WHERE title_id = #url.rec_ID# and selectedOrgs is not null
	</cfquery>

	<cfif #read_title_data.data32# neq "">
	    <CFQUERY datasource="#request.dsn#" NAME="read_title_hud">
			select * from hud_form_title_pg1
			WHERE title_id = #url.rec_ID#
		</cfquery>

		<CFSET a_109_b = #read_title_data.data32#>

        <cfif #read_title_hud.a_109_b# neq "">
			<CFSET a_120a = #read_title_hud.a_120# - #read_title_hud.a_109_b#>
			<CFSET a_120 = #a_120a# + #a_109_b#>
			<CFSET a_301a = #read_title_hud.a_301# - #read_title_hud.a_109_b#>
			<CFSET a_301 = #a_301a# + #a_109_b#>
			<CFSET a_303a = #read_title_hud.a_303# - #read_title_hud.a_109_b#>
			<CFSET a_303 = #a_303a# + #a_109_b#>
		<cfelse>
			<CFSET a_120 = #read_title_hud.a_120# + #a_109_b#>
			<CFSET a_301 = #read_title_hud.a_301# + #a_109_b#>
			<CFSET a_303 = #read_title_hud.a_303# + #a_109_b#>
		</cfif>

		<CFQUERY datasource="#request.dsn#">
			UPDATE hud_form_title_pg1
			SET a_109_b = '#a_109_b#',
			a_120 = '#a_120#',
			a_301 = '#a_301#',
			a_303 = '#a_303#'
			WHERE title_id = #rec_id#
		</cfquery>

	</cfif>

    <CFQUERY datasource="#request.dsn#" NAME="read_title">
	    select * from title
		WHERE title_id = #url.rec_ID#
	</cfquery>

	<CFQUERY datasource="#request.dsn#" NAME="read_icl">
	    select abstractor_icl_upload from doc_abstract_title
		WHERE title_id = #url.rec_ID#
	</cfquery>

<cfset to_addr=p_email>
<cfif read_title.comp_id eq 623 and read_title.o_email NEQ "">
<cfset to_addr=to_addr & "; " & read_title.o_email>
</cfif>

    <CFMAIL
        TO="#to_addr#"
        FROM="webmaster@firsttitleservices.com"
        Subject="Title Insurance Commitment has been completed for order number #rec_id#, Loan Number: #read_title.loan_number# -- #read_title.bfirstname1# #read_title.blastname1#"
        TIMEOUT="600"
        type="HTML"
	    >

Title Insurance Commitment has been completed for order number #rec_id#.<br>

To view/print it you may click <a href="https://#cgi.server_name#/title_Committment_email.cfm?comp_id=#read_title.comp_id#&rec_id=#rec_id#" target = "new">Title Insurance Commitment</a><br><br>

<cfif Len(read_icl.abstractor_icl_upload)>
To view/print the ICL you may click <a href="https://#cgi.server_name#/uploads/#read_icl.abstractor_icl_upload#" target = "new">ICL</a><br><br>

</cfif>

Thank you,<br><br>

First Title and Escrow staff
    </CFMAIL>

</CFIF>

<CFLOCATION URL="https://#cgi.server_name#/admin_area/title_Committment.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=0">



