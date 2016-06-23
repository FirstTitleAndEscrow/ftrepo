<cfparam name="effective_date" default="">
<cfparam name="updated" default="0">
<CFFILE 			
	DESTINATION="c:\uploads\"
	ACTION="UPLOAD"
	NAMECONFLICT="MAKEUNIQUE"
	FILEFIELD="file_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

	<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
		update Doc_Abstract_Title set 
		<cfif updated>
		abstractor_doc_upload7
		<cfelse>
		abstractor_doc_upload3 
		</cfif>
		= '#new_file_name#'
		WHERE title_id = #rec_ID#
	</cfquery> 

<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
		
		<CFQUERY datasource="#request.dsn#" NAME="read_title_abs">
			UPDATE Doc_Abstract_Title
			set
			a_Recieved_by = #uid#,
			a_Date_Completed = '#DateFormat(Now(), "mm/dd/yyyy")#',
			r_dateandtime = '#order_date_adj#',
			a_Time_Completed = '#TimeFormat(Now(), "HH:mm:ss")#'
			<cfif Len(effective_date)>
				<cfif updated>
					,effective_date2 = 
				<cfelse>
				,effective_date = 
				</cfif>
				'#effective_date#'
			</cfif>
			WHERE title_ID = #rec_ID#
		</CFQUERY>
		
		<CFQUERY datasource="#request.dsn#" NAME="check_record">
			Select * from Doc_Title_Insurance_Title
			where title_id = #rec_id#
		</CFQUERY>
		<cfif check_record.recordcount eq 0>
		<CFQUERY datasource="#request.dsn#" NAME="insert_record">
			insert into  Doc_Title_Insurance_Title (title_id)
			values (#rec_id#)
		</CFQUERY>
		</cfif>
		
		<CFQUERY datasource="#request.dsn#" NAME="update_rec">
			UPDATE Doc_Title_Insurance_Title
			set
			merge_date = '#order_date_adj#'
			WHERE title_ID = #rec_ID#
		</cfquery>
			
		<CFQUERY datasource="#request.dsn#" NAME="read_role">
		 	Select * from tblUser_Roles
			where title_id = #rec_id# 
		</CFQUERY>



		<CFQUERY datasource="#request.dsn#" NAME="read_user">
		
			select * from first_admin
			WHERE ID = #session.ft_user_id#
		
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #rec_id#, 'Abstract Received - Title In Typing', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_title">
			Select * from Title
					WHERE title_ID = #rec_ID#
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_title_abs">
UPDATE Title
set
appraisal_status = 'Abstract Received from Vendor'
WHERE title_ID = #rec_ID#
</CFQUERY>
		
				
		<CFINCLUDE template="./includes/typing.cfm">