
<CFQUERY datasource="#request.dsn#" NAME="read_preprocessor">
	Select p_name from Title_Closing_Order_Request
	where Title_Id = #rec_id#
</CFQUERY>

<CFIF #trim(read_preprocessor.p_name)# eq #Trim(Form.NewName)#>
	<B><Center>You did not change the processor.  Press back to try again.</CENTER></B>
<Cfelse>
<CFQUERY datasource="#request.dsn#" NAME="read_title_Instructions">
	Update tblUser_roles
	set Preprocessor_Start_Datetime = #Now()#,
		Preprocessor_ID = #NewName#
	where Title_ID = #rec_id#
</CFQUERY>

<CFLOCATION URL="https://#cgi.server_name#/admin_area/menu_Processing_All.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1">
</CFIF>
