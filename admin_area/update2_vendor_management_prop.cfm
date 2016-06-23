<CFQUERY datasource="#request.dsn#" NAME="read_processor">
	Select  abstract_ID from tblUser_Roles
	where Prop_Id = #rec_id#
</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_title_Instructions">
	Update tblUser_Roles
	set  abstract_Start_Datetime = getDate(),
		 abstract_ID = #Form.NewName#
	where Prop_ID = #rec_id#
</CFQUERY>

<CFLOCATION URL="https://#cgi.server_name#/admin_area/menu_vendor_management.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&role_mgr=1">

