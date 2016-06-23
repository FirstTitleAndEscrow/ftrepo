<cfparam name="prop_id" default="0">

<cfset request.dsn = "First_Title_Main_Admin">

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_property">
	select * from property
	where prop_id = #prop_id#
</CFQUERY>

<cfset rec_id = #prop_id#>
<cfset url.rec_id = #prop_id#>

<cfdocument format="pdf" fileName="c:\uploads\P-#read_property.prop_id#_REPORT.pdf" overwrite="true">
<cfinclude template="../admin_area/landsafe_property_report_prop.cfm">
</cfdocument>

<cfinvoke	component = "cfc.FileManagement"	method = "PDFcompress" file2="P-#read_property.prop_id#_REPORT.pdf" filepath="c:\uploads\">
<cfset new_prop_file_name = #fileSys.MoveFromUploadsOverwrite('P-#read_property.prop_id#_REPORT.pdf')#>
