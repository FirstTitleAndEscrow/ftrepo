<CFPARAM NAME="emp" DEFAULT="0">
<CFPARAM NAME="url.file_num" DEFAULT="0">
<CFPARAM NAME="rec_id" DEFAULT="0">


  
  
<cfif url.file_num eq 1>
<CFQUERY datasource="#request.dsn#" NAME="delete_file">
			update title
			set client_upload1 = NULL
			WHERE title_ID = #rec_ID#
</CFQUERY>
<CFFILE ACTION="delete" file="c:\uploads\#file_name#">
<cfelseif url.file_num eq 2>
<CFQUERY datasource="#request.dsn#" NAME="delete_file">
			update title
			set client_upload2 = NULL
			WHERE title_ID = #rec_ID#
</CFQUERY>
<CFFILE ACTION="delete" file="c:\uploads\#file_name#">
<cfelseif url.file_num eq 3>
<CFQUERY datasource="#request.dsn#" NAME="delete_file">
			update title
			set client_upload3 = NULL
			WHERE title_ID = #rec_ID#
</CFQUERY>
<CFFILE ACTION="delete" file="c:\uploads\#file_name#">
<cfelseif url.file_num eq 4>
<CFQUERY datasource="#request.dsn#" NAME="delete_file">
			update title
			set client_upload4 = NULL
			WHERE title_ID = #rec_ID#
</CFQUERY>
<CFFILE ACTION="delete" file="c:\uploads\#file_name#">
<cfelseif url.file_num eq 5>
<CFQUERY datasource="#request.dsn#" NAME="delete_file">
			update title
			set reo_package = NULL
			WHERE title_ID = #rec_ID#
</CFQUERY>
<CFFILE ACTION="delete" file="c:\uploads\#file_name#">
</cfif>
<cflocation url="title_client_upload.cfm?comp_id=#comp_id#&user_id_1=0&lo_id=0&rec_id=#rec_id#&a_trigger=1&company_id=#company_id#">



	
	
