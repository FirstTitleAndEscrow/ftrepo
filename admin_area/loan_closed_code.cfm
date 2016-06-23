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

<cfquery name="get_sales_rep_info" datasource="#request.dsn#">
    select * 
    from first_admin
    where id = #get_comp.intSales#
</cfquery>




<cfquery name="get_list" datasource="#request.dsn#">
    select * from eventlist
    where title_id = #get_order.title_id#
</cfquery>
<cfif get_list.recordcount eq 0>
<cfquery name="insert_this" DATASOURCE="#request.dsn#">
    Insert Into eventlist (title_id)
    values ('#get_order.title_id#')
</cfquery>
<cfquery name="get_list" datasource="#request.dsn#">
    select * from eventlist
    where title_id = #get_order.title_id#
</cfquery>
</cfif>


<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">

        <cfquery name="updateclosing" datasource="#request.dsn#">
            update Title
            set 
	        Appraisal_status = 'Loan Closed',
			lender_realtor_1 = '#form.lender_realtor_1#',
			lender_realtor_2 = '#form.lender_realtor_2#',
			lender_realtor_3 = '#form.lender_realtor_3#',
			lender_realtor_fname_1 = '#form.lender_realtor_fname_1#',
			lender_realtor_fname_2 = '#form.lender_realtor_fname_2#',
			lender_realtor_fname_3 = '#form.lender_realtor_fname_3#',
			lender_realtor_lname_1 = '#form.lender_realtor_lname_1#',
			lender_realtor_lname_2 = '#form.lender_realtor_lname_2#',
			lender_realtor_lname_3 = '#form.lender_realtor_lname_3#',
			lender_realtor_email_1 = '#form.lender_realtor_email_1#',
			lender_realtor_email_2 = '#form.lender_realtor_email_2#',
			lender_realtor_email_3 = '#form.lender_realtor_email_3#'			
            where title_id = #URL.rec_id#
        </cfquery>

        <!--- <CFSET order_date_adj = form.close_month & "/" &  form.close_day & "/" & form.close_year & " " & form.close_time> --->
		<cfif IsDefined("form.loan_closed_datetime")>
		 <CFSET cl_button_pushed = '#form.loan_closed_datetime#'>
		<cfelse>
		 <CFSET cl_button_pushed = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
		</cfif>

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
		    <!--- <CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Loan Closed - #cl_button_pushed#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
		    </CFQUERY> --->

<cfset otherpro = 'Loan Closed - ' & cl_button_pushed>

<cfinclude template="send_loan_closed_emails.cfm">


<cfif get_comp.send_post_close_survey eq 1>
<cfinclude template="../auto_emails/post_close_survey.cfm">
</cfif>
