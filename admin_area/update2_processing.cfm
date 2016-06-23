
<CFQUERY datasource="#request.dsn#" NAME="read_processor">
	Select proc_name from Title
	where Title_Id = #rec_id#
</CFQUERY>

<CFIF #trim(read_processor.proc_name)# eq #Trim(Form.NewName)#>
	<B><Center>You did not change the processor.  Press back to try again.</CENTER></B>
<Cfelse>
<CFQUERY datasource="#request.dsn#" NAME="read_title_Instructions">
	Update title
	set dateandtime = #Now()#,
		proc_name = '#Form.NewName#'
	where Title_ID = #rec_id#
</CFQUERY>

<CFLOCATION URL="https://#cgi.server_name#/admin_area/menu_Processing_All.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1">
</CFIF>
     