<cfparam name="form.close_month" default="">
<cfparam name="form.close_day" default="">
<cfparam name="form.close_year" default="">
<cfparam name="form.close_time" default="">

<cfquery datasource="#request.dsn#" name="getuser">
    select * 
    from first_admin
    where id = #session.ft_user_id#
</cfquery>

<cfquery name="get_order" datasource="#request.dsn#">
    select * 
    from Title
    where title_id = #URL.rec_id#
</cfquery>

<cfquery name="get_comp" datasource="#request.dsn#">
    select * 
    from companies
    where id = #get_order.comp_id#
</cfquery>

<cfquery name="get_list" datasource="#request.dsn#">
    select * from eventlist
    where title_id = #get_order.title_id#
</cfquery>

<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">

        <cfquery name="updateclosing" datasource="#request.dsn#">
            update Title
            set 
	        Appraisal_status = 'Loan Closed'
            where title_id = #URL.rec_id#
        </cfquery>

        <!--- <CFSET order_date_adj = form.close_month & "/" &  form.close_day & "/" & form.close_year & " " & form.close_time> --->
		 <CFSET cl_button_pushed = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
		<cfquery name="up" datasource="#request.dsn#">
                update eventlist
                set 
	            l_date = '#DateFormat(Now(), "m/d/yyyy")#',
	            cl_dateandtime = '#cl_button_pushed#',
				cl_button_pushed = '#cl_button_pushed#',
	            l_time = '#TimeFormat(Now(), "HH:mm:ss")#'
                where title_id = #URL.rec_id#
            </cfquery>

            <CFQUERY datasource="#request.dsn#" NAME="read_user">
		        select * 
                from first_admin
			    WHERE ID = #session.ft_user_id#
		    </CFQUERY>
		    <CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Loan Closed', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
		    </CFQUERY>

<cfinclude template="send_loan_closed_emails.cfm">
