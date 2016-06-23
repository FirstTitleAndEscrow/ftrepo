<cfif IsDefined("form.loan_funded_datetime")>
 <CFSET order_date_adj = '#form.loan_funded_datetime#'>
<cfelse>
 <CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
</cfif>



<cfquery datasource="#request.dsn#">

update eventlist
set loanfun = 1,
fl_dateandtime = '#order_date_adj#'
where title_id = #rec_ID#
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="read_user">
		
			select * from first_admin
			WHERE ID = #session.ft_user_id#
		
		</CFQUERY>

<cfset otherpro = 'Loan Funded - ' & order_date_adj>

		<!--- <CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Loan Funded - #order_date_adj#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
		</CFQUERY> --->
		<CFQUERY datasource="#request.dsn#" name="update_record">		
				Update title set appraisal_status = 'Loan Funded',
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
 where title_id = #rec_id#
		</CFQUERY>
		
<!--- send out Loan Funded Emails --->
