
<CFQUERY datasource="#request.dsn#" NAME="read_processor">
	Select  vendor_mgmt_InHouse_ID from tblUser_Roles
	where Title_Id = #rec_id#
</CFQUERY>


<!---Is this person an InHouse Abstractors --->
	<CFQUERY datasource="#request.dsn#" NAME="read_InHouseAbstractors">
		Select ID from First_Admin where role_ID = 29 and  ID = #trim(Form.NewName)#
	</CFQUERY>

	<CFIF #read_InHouseAbstractors.RecordCount# gte 1>
		<CFQUERY datasource="#request.dsn#" NAME="read_title_Instructions">
			Update tblUser_Roles
			set vendor_mgmt_InHouse_Start_Datetime = getDate(),
		 	vendor_mgmt_InHouse_ID = #Form.NewName#
			where Title_ID = #rec_id#
		</CFQUERY>
	<CFELSE>
		<CFQUERY datasource="#request.dsn#" NAME="read_title_Instructions">
			Update tblUser_Roles
			set vendor_mgmt_InHouse_Start_Datetime = null,
		 	vendor_mgmt_InHouse_ID = null,
			abstract_ID = #Form.NewName#,
			abstract_Start_Datetime = getDate()
			where Title_ID = #rec_id#
		</CFQUERY>
	</CFIF>

	<CFLOCATION URL="https://#cgi.server_name#/admin_area/menu_vendor_management.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&role_mgr=1">

