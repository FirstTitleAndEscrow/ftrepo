

<cfparam name="form.submit" default="">
<cfparam name="form.spreadsheet_upload" default="">
<cfparam name="form.yesterday" default="0">
<cfparam name="url.uploaded" default=0>
<CFPARAM NAME="excel" DEFAULT="0">




<cfif form.submit eq 'Upload'>
<cfif Len(form.spreadsheet_upload)>
<CFFILE
DESTINATION="c:\uploads\"
ACTION="UPLOAD"
NAMECONFLICT="overwrite"
FILEFIELD="spreadsheet_upload">
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_file_name = #fileSys.MoveFromUploads('#FILE.ServerFile#')#>

<cfx_excel2query
    name="read_all"
    file="c:\uploads\#new_file_name#"
	headerrow="0"
	startrow="9">


<cfset temp_QUERY = QueryNew("COL01, COL02, COL03, COL04, COL05, COL06, COL07, COL08, COL09, COL10, COL11, COL12, COL13, COL14, report_date, ")>

<cfif form.yesterday eq 1>
<cfset report_date = CreateODBCDate(DateAdd("d", -1, Now()))>
<cfelse>
<cfset report_date = CreateODBCDate(Now())>
</cfif>
<cfset todays_report_date = DateFormat(report_date, "m-d-yyyy")>
<cfset yesterdays_report_date = CreateODBCDate(DateAdd("d", -1, Now()))>


<CFQUERY datasource="#request.dsn#" NAME="delete_todays_recs">
		Delete from Fannie_Daily_Reports where report_date = #report_date# and uploaded_filename = 'TR139932X'
</CFQUERY>


<cfoutput query="read_all">
<cfset new_add = 0>
<cfset new_deletion = 0>


<CFQUERY datasource="#request.dsn#" NAME="insert_rec">
		Insert into Fannie_Daily_Reports (COL01, COL02, COL03, COL04, COL05, COL06, COL07, COL08, COL09, COL10, COL11, COL12, COL13, COL14, report_date, uploaded_filename)
		values
		('#read_all.column1#', '#read_all.column2#', '#read_all.column3#', '#read_all.column4#', '#read_all.column5#', '#read_all.column6#', '#read_all.column7#', '#read_all.column8#', '#read_all.column9#', '#read_all.column10#', '#read_all.column11#', '#read_all.column12#', '#read_all.column13#', '#read_all.column14#', #report_date#, 'TR139932X')
</CFQUERY>

<cfset temp = QueryAddRow(temp_QUERY)>
<cfset temp = QuerySetCell(temp_QUERY, "COL01", #read_all.column1#)>
<cfset temp = QuerySetCell(temp_QUERY, "COL02", #read_all.column2#)>
<cfset temp = QuerySetCell(temp_QUERY, "COL03", #read_all.column3#)>
<cfset temp = QuerySetCell(temp_QUERY, "COL04", #read_all.column4#)>
<cfset temp = QuerySetCell(temp_QUERY, "COL05", #read_all.column5#)>
<cfset temp = QuerySetCell(temp_QUERY, "COL06", #read_all.column6#)>
<cfset temp = QuerySetCell(temp_QUERY, "COL07", #read_all.column7#)>
<cfset temp = QuerySetCell(temp_QUERY, "COL08", #read_all.column8#)>
<cfset temp = QuerySetCell(temp_QUERY, "COL09", #read_all.column9#)>
<cfset temp = QuerySetCell(temp_QUERY, "COL10", #read_all.column10#)>
<cfset temp = QuerySetCell(temp_QUERY, "COL11", #read_all.column11#)>
<cfset temp = QuerySetCell(temp_QUERY, "COL12", #read_all.column12#)>
<cfset temp = QuerySetCell(temp_QUERY, "COL13", #read_all.column13#)>
<cfset temp = QuerySetCell(temp_QUERY, "COL14", #read_all.column14#)>
<cfset temp = QuerySetCell(temp_QUERY, "REPORT_DATE", #report_date#)>
</cfoutput>

<CFQUERY datasource="#request.dsn#" NAME="yesterdays_recs">
		Select * from Fannie_Daily_Reports where report_date = #yesterdays_report_date# and uploaded_filename = 'TR139932X' order by col01
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="todays_recs">
		Select * from Fannie_Daily_Reports where report_date = #report_date# and uploaded_filename = 'TR139932X' order by col01
</CFQUERY>

</cfif>
</cfif>

<cfoutput>
<cfif #excel# EQ 1>
	<cfset filename = "file1.xls">
		<cfcontent type="application/vnd.ms-excel">
<cfheader name="Content-Disposition" value="attachment; filename=#filename#">
#filename#
</cfif>
</cfoutput>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>





<script language="javascript">

function to_excel() {
document.excel_form.submit();
}
</script>

<style>
TD {font-family:Arial, Helvetica, sans-serif; font-size:8pt;}
</style>

</head>
<body>

<cfoutput>
<form name="excel_form" action="fannie_daily_report.cfm" method="post">
<input type="hidden" name="excel" value="1">
<input type="hidden" name="spreadsheet_upload" value="#spreadsheet_upload#">
</form>
</cfoutput>



<cfif form.submit eq 'Upload'>
<table border=1>



<tr>
<td colspan=4>Fannie Mae REO Closing Properties With Accepted Offers</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td bgcolor="CCCCCC"></td><td>New File</td>
</tr>
<tr>
<td colspan=4>Data As Of: <cfoutput>#DateFormat(Now(), "ddmmmyy")#</cfoutput></td>
</tr>
<tr>
<td colspan=4>Vendor ID: TR139932X</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td bgcolor="FFCC33"></td><td>File removed from list since last upload</td>
</tr>
<tr>
<td colspan=4>SHAPIRO & BURSON, L.L.P.</td>
</tr>

<tr>
<td><strong>FM REO</strong></td><td><strong>FM LOAN</strong></td><td><strong>FM CLOSER</strong></td><td><strong>FM CLOSER</strong></td><td><strong>FM CLOSER</strong></td><td><strong>PROPERTY</strong></td><td><strong>PROPERTY</strong></td><td><strong>PROPERTY</strong></td><td><strong>PROPERTY</strong></td><td><strong>PROPERTY</strong></td><td><strong>ORIGINAL</strong></td><td><strong>CURRENT</strong></td><td><strong>CLOSING</strong></td><td><strong>CLOSING</strong></td>
</tr>
<tr>
<td><strong>CASE ID</strong></td><td><strong>NUMBER</strong></td><td>&nbsp;</td><td><strong>PHONE NO.</strong></td><td><strong>EMAIL</strong></td><td><strong>ADDRESS</strong></td><td><strong>UNIT NO.</strong></td><td><strong>CITY</strong></td><td><strong>STATE</strong></td><td><strong>ZIP</strong></td><td><strong>ESTIMATED</strong></td><td><strong>ESTIMATED</strong></td><td><strong>COMPANY</strong></td><td><strong>COMPANY</strong></td><td>Contract</td>
</tr>
<tr>
<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td><strong>CLOSING DT.</strong></td><td><strong>CLOSING DT.</strong></td><td><strong>ID</strong></td><td>&nbsp;</td><td>Uploaded</td>
</tr>
<br>
<cfoutput query="todays_recs">
<cfset new_add = 0>
<CFQUERY datasource="#request.dsn#" NAME="find_rec">
		Select * from Fannie_Daily_Reports
		where report_date = #yesterdays_report_date#
		and uploaded_filename = 'TR139932X'
		and col01 = '#todays_recs.col01#'
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="find_contract">
		Select reo_sales_contract from Title
		where reo_number = '#todays_recs.col01#'
		or loan_number  = '#todays_recs.col01#'
</CFQUERY>
<cfif find_rec.recordcount eq 0>
<cfset new_add = 1>
</cfif>

<cfif new_add eq 1>
<cfset bgcolor = 'CCCCCC'>
<cfelse>
<cfset bgcolor = 'FFFFFF'>
</cfif>
<tr bgcolor=#bgcolor#>
<td>#todays_recs.Col01#</td>
<td>#todays_recs.Col02#</td>
<td>#todays_recs.Col03#</td>
<td>#todays_recs.Col04#</td>
<td>#todays_recs.Col05#</td>
<td>#todays_recs.Col06#</td>
<td>#todays_recs.Col07#</td>
<td>#todays_recs.Col08#</td>
<td>#todays_recs.Col09#</td>
<td>#todays_recs.Col10#</td>
<td>#todays_recs.Col11#</td>
<td>#todays_recs.Col12#</td>
<td>#todays_recs.Col13#</td>
<td>#todays_recs.Col14#</td>
<td><cfif Len(find_contract.reo_sales_contract)>Yes<cfelse>No</cfif></td>
</tr>
</cfoutput>
<cfif yesterdays_recs.recordcount gt 0>
<cfoutput query="yesterdays_recs">
<CFQUERY datasource="#request.dsn#" NAME="find_rec">
		Select * from Fannie_Daily_Reports
		where report_date = '#DateFormat(todays_report_date, "m-d-yyyy")#'
		and uploaded_filename = 'TR139932X'
		and col01 = '#yesterdays_recs.col01#'
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="find_contract">
		Select reo_sales_contract from Title
		where reo_number = '#yesterdays_recs.col01#'
		or loan_number  = '#yesterdays_recs.col01#'
</CFQUERY>
<cfset bgcolor = 'FFCC33'>
<cfif find_rec.recordcount eq 0>
<tr bgcolor=#bgcolor#>
<td>#yesterdays_recs.Col01#</td>
<td>#yesterdays_recs.Col02#</td>
<td>#yesterdays_recs.Col03#</td>
<td>#yesterdays_recs.Col04#</td>
<td>#yesterdays_recs.Col05#</td>
<td>#yesterdays_recs.Col06#</td>
<td>#yesterdays_recs.Col07#</td>
<td>#yesterdays_recs.Col08#</td>
<td>#yesterdays_recs.Col09#</td>
<td>#yesterdays_recs.Col10#</td>
<td>#yesterdays_recs.Col11#</td>
<td>#yesterdays_recs.Col12#</td>
<td>#yesterdays_recs.Col13#</td>
<td>#yesterdays_recs.Col14#</td>
<td><cfif Len(find_contract.reo_sales_contract)>Yes<cfelse>No</cfif></td>
</tr>
</cfif>
</cfoutput>
</cfif>

</table>
</cfif>
</body>
</html>
