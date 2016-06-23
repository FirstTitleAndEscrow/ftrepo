<cfparam name="prop_id" default="0">

<cfset request.dsn = "First_Title_Main_Admin">

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_property">
	select * from property
	where prop_id = #url.rec_id#
</CFQUERY>

<cfset prop_id = url.rec_id>

<cfdocument format="pdf" fileName="c:\uploads\P-#read_property.prop_id#_REPORT.pdf" overwrite="true">
<cfinclude template="../admin_area/property_report_doj.cfm">
</cfdocument>
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfinvoke	component = "cfc.FileManagement"	method = "PDFcompress" file2="P-#read_property.prop_id#_REPORT.pdf" filepath="c:\uploads\">
<cfset new_file_name = #fileSys.MoveFromUploadsOverwrite('P-#read_property.prop_id#_REPORT.pdf')#>
