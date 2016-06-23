<CFFILE 			
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				NAMECONFLICT="MAKEUNIQUE"
				FILEFIELD="file_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>
				
<cfif payoff_type eq 'title'>
   <cfif form.payoff_num eq 1>
    <CFQUERY datasource="#request.dsn#" NAME="get_payoff">
			Select * from Pay_Off_Lender_1_Title
			WHERE Pay_off_1_ID = #form.payoff_id#
			</cfquery>

			 <CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			update Pay_Off_Lender_1_Title set payoff1_upload = '#new_file_name#'
			WHERE Pay_off_1_ID = #form.payoff_id#
			</cfquery> 
<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
			<CFQUERY datasource="#request.dsn#">
		
			UPDATE Pay_Off_Lender_1_Title
			SET
			a_Recieved_by = #form.uid#,
			p_dateandtime = '#order_date_adj#',
			a_recieved_Date = '#DateFormat(Now(), "mm/dd/yyyy")#',
			a_recieved_Time = '#TimeFormat(Now(), "HH:mm:ss")#'
			WHERE Pay_off_1_ID = #form.payoff_id#
		
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
		update Title set appraisal_status = 'In Typing'
		WHERE title_id = #get_payoff.Title_ID#
	</cfquery> 
	<cfelse>
	<CFQUERY datasource="#request.dsn#" NAME="get_payoff">
			Select * from Pay_Off_Lender_2_Title
			WHERE Pay_off_2_ID = #form.payoff_id#
			</cfquery>

			 <CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			update Pay_Off_Lender_2_Title set payoff2_upload = '#new_file_name#'
			WHERE Pay_off_2_ID = #form.payoff_id#
			</cfquery> 
<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
			<CFQUERY datasource="#request.dsn#">
		
			UPDATE Pay_Off_Lender_2_Title
			SET
			a_Recieved_by = #form.uid#,
			a_recieved_Date = '#DateFormat(Now(), "mm/dd/yyyy")#',
			a_recieved_Time = '#TimeFormat(Now(), "HH:mm:ss")#'
			WHERE Pay_off_2_ID = #form.payoff_id#
		
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
		update Title set appraisal_status = 'In Typing'
		WHERE title_id = #get_payoff.Title_ID#
	</cfquery> 
    </cfif>
	
	
<cfelse>



   <cfif form.payoff_num eq 1>
    <CFQUERY datasource="#request.dsn#" NAME="get_payoff">
			Select * from Pay_Off_Lender_1_Prop
			WHERE Pay_off_1_ID = #form.payoff_id#
			</cfquery>

			 <CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			update Pay_Off_Lender_1_Prop set payoff1_upload = '#new_file_name#'
			WHERE Pay_off_1_ID = #form.payoff_id#
			</cfquery> 
<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
			<CFQUERY datasource="#request.dsn#">
		
			UPDATE Pay_Off_Lender_1_Prop
			SET
			a_Recieved_by = #form.uid#,
			p_dateandtime = '#order_date_adj#',
			a_recieved_Date = '#DateFormat(Now(), "mm/dd/yyyy")#',
			a_recieved_Time = '#TimeFormat(Now(), "HH:mm:ss")#'
			WHERE Pay_off_1_ID = #form.payoff_id#
		
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
		update Property set appraisal_status = 'In Typing'
		WHERE prop_id = #get_payoff.prop_ID#
	</cfquery> 
	<cfelse>
	<CFQUERY datasource="#request.dsn#" NAME="get_payoff">
			Select * from Pay_Off_Lender_2_prop
			WHERE Pay_off_2_ID = #form.payoff_id#
			</cfquery>

			 <CFQUERY datasource="#request.dsn#" NAME="insert_filename">
			update Pay_Off_Lender_2_prop set payoff2_upload = '#new_file_name#'
			WHERE Pay_off_2_ID = #form.payoff_id#
			</cfquery> 
<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
			<CFQUERY datasource="#request.dsn#">
		
			UPDATE Pay_Off_Lender_2_Prop
			SET
			a_Recieved_by = #form.uid#,
			a_recieved_Date = '#DateFormat(Now(), "mm/dd/yyyy")#',
			a_recieved_Time = '#TimeFormat(Now(), "HH:mm:ss")#'
			WHERE Pay_off_2_ID = #form.payoff_id#
		
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
		update Property set appraisal_status = 'In Typing'
		WHERE prop_id = #get_payoff.prop_ID#
	</cfquery> 
    </cfif>
</cfif>

<cflocation url="vendor_rep_view.cfm?a_trigger=3&username=#form.username#&password=#form.password#&message=success">