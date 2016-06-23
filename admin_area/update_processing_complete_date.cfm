

<CFQUERY datasource="#request.dsn#" NAME="read_title_Instructions">
	Update title
	set proc_complete_date = #Now()#
	where Title_ID = #rec_id#
</CFQUERY>

<CFLOCATION URL="https://#cgi.server_name#/admin_area/menu_Processing.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_preproc_Name.title_id#&a_trigger=1">
