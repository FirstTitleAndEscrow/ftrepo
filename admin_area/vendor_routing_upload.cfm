


<cfif Len(form.routing_upload)>
<CFFILE 			
DESTINATION="c:\uploads\"
ACTION="UPLOAD"
NAMECONFLICT="MAKEUNIQUE"
FILEFIELD="routing_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>


<cfx_excel2query
    name="test_import"
    file="c:\uploads\#new_file_name#"
    sheetNumber="0">

<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
delete from Vendor_Routing_Table
</CFQUERY>

<cfoutput query="test_import">
<cfif test_import.Column2 neq 'County'>
<CFQUERY datasource="#request.dsn#" NAME="insert_filename">
Insert into Vendor_Routing_table
(State,
County,
Current_owner_1st_Tier,
Current_owner_1st_Tier_Email,
Current_owner_2nd_Tier,
Current_owner_2nd_Tier_Email,
Two_owner_1st_Tier,
Two_owner_1st_Tier_Email,
Two_owner_2nd_Tier,
Two_owner_2nd_Tier_Email,
Full_search,
Full_search_email)
values
('#COLUMN1#', '#COLUMN2#', '#COLUMN3#', '#COLUMN4#', '#COLUMN5#', '#COLUMN6#', '#COLUMN7#', '#COLUMN8#', '#COLUMN9#', '#COLUMN10#', '#COLUMN11#', '#COLUMN12#')
</cfquery> 
</cfif>
</cfoutput>




<cflocation url="vendor_routing_table.cfm" addtoken="no">
</cfif>