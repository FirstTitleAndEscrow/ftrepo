<!---Get the Employees Name--->
<cfquery DATASOURCE="#request.dsn#" Name="Employee_Name">
    Select fname, lname
    from First_Admin
    where id = #uid#
</CFQUERY>

<!---If Title Order--->
<CFIF #Letter# eq "T">
    <cfquery DATASOURCE="#request.dsn#">
        Update Doc_Abstract_Title
        set
        Report_Flag = 1
        where Title_ID = #rec_id#
    </CFQUERY>
</CFIF>

<!---If Property Order--->
<CFIF #Letter# eq "P">
    <cfquery  DATASOURCE="#request.dsn#">
        Update Doc_Abstract_Prop
        set
        Report_Flag = 1
        where Prop_ID = #rec_id#
    </CFQUERY>
</CFIF>

<!---Insert a comment in the notes screen--->
<CFQUERY DATASOURCE="#request.dsn#">
    INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
	VALUES('#Employee_Name.FName#', '#Employee_Name.LName#', #URL.rec_id#, 'Removed from the Abstractors unassigned List', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'S', '1', '1')
</CFQUERY>

<CFLOCATION URL="https://#cgi.server_name#/admin_area/menu_vendor_management_sb.cfm?uid=#uid#&role_mgr=1&al=#al#">