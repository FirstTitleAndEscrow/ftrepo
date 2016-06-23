
<CFQUERY datasource="#request.dsn#" NAME="read_processor">
	Select typing_ID from tblUser_Roles
	where Title_Id = #rec_id#
</CFQUERY>

<CFIF #trim(read_processor.typing_ID)# eq #Trim(Form.NewName)#>
	<B><Center>You did not change the Typing Person.  Press back to try again.</CENTER></B>
<Cfelse>
<CFQUERY datasource="#request.dsn#" NAME="read_title_Instructions">
	Update tblUser_Roles
	set typing_Start_Datetime = getDate(),
		typing_ID = #Form.NewName#
	where Title_ID = #rec_id#
</CFQUERY>

<CFLOCATION URL="https://#cgi.server_name#/admin_area/menu_cleartoclose.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1">
</CFIF>
