<CFFILE 			
				DESTINATION="c:\uploads\"
				ACTION="UPLOAD"
				NAMECONFLICT="MAKEUNIQUE"
				FILEFIELD="file_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>
				
   <cfif form.payoff_num eq 1>
            <CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
			<CFQUERY datasource="#request.dsn#">
			UPDATE Pay_Off_Lender_1_Title
			SET
			payoff1_upload = '#new_file_name#',
			a_Recieved_by = 277,
			p_dateandtime = '#order_date_adj#',
			a_recieved_Date = '#DateFormat(Now(), "mm/dd/yyyy")#',
			a_recieved_Time = '#TimeFormat(Now(), "HH:mm:ss")#'
			WHERE Pay_off_1_ID = #form.payoff_id#		
		    </CFQUERY>
					
	<cfelse>
	<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
			<CFQUERY datasource="#request.dsn#">
			UPDATE Pay_Off_Lender_2_Title
			SET
			payoff2_upload = '#new_file_name#',
			a_Recieved_by = 277,
			p_dateandtime = '#order_date_adj#',
			a_recieved_Date = '#DateFormat(Now(), "mm/dd/yyyy")#',
			a_recieved_Time = '#TimeFormat(Now(), "HH:mm:ss")#'
			WHERE Pay_off_2_ID = #form.payoff_id#		
		    </CFQUERY>
    </cfif>

<script language="javascript">
window.opener.location.href='ctc_payoff_upload.cfm';
window.close();
</script>