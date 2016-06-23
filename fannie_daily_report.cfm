

<cfparam name="form.submit" default="">
<cfparam name="form.spreadsheet_upload" default="">
<cfparam name="url.uploaded" default=0>
<CFPARAM NAME="excel" DEFAULT="0">




<!--- <cfif form.submit eq 'Upload'>
<cfif Len(form.spreadsheet_upload)>
<CFFILE
DESTINATION="c:\uploads\"
ACTION="UPLOAD"
NAMECONFLICT="overwrite"
FILEFIELD="spreadsheet_upload">

<cfx_excel2query
    name="read_all"
    file="c:\uploads\#FILE.ServerFile#"
	headerrow="0"
	startrow="9">


<cfset temp_QUERY = QueryNew("COL01, COL02, COL03, COL04, COL05, COL06, COL07, COL08, COL09, COL10, COL11, COL12, COL13, COL14, report_date, ")>


<cfset report_date = CreateODBCDate(Now())>
<!--- <cfset report_date = CreateODBCDate(DateAdd("d", -1, Now()))> --->
<cfset yesterdays_report_date = CreateODBCDate(DateAdd("d", -1, Now()))>


<CFQUERY datasource="#request.dsn#" NAME="delete_todays_recs">
		Delete from Fannie_Daily_Reports where report_date = #report_date#
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
	<cfset filename = "file.xls">
		<cfcontent type="application/vnd.ms-excel">
<cfheader name="Content-Disposition" value="attachment; filename=#filename#">
#filename#
</cfif>
</cfoutput> --->



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
</head>
<body>

<cfoutput>
<form name="excel_form" action="fannie_daily_report_display.cfm" method="post">
<input type="hidden" name="excel" value="1">
<input type="hidden" name="spreadsheet_upload" value="#spreadsheet_upload#">
</form>
</cfoutput>


<form action="fannie_daily_report_display.cfm" method="post" enctype="multipart/form-data" name="fannie_report" target="_new">
<input type="hidden" name="excel" value="1">
<table with="300" cellpadding="2" cellspacing="1" border=1>
<tr>
<Td align="left" valign="top">Upload TR139932X Here<br>
<input type="file" name="spreadsheet_upload" style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none; width: 250px;">
</Td>
</tr>
<tr>
<Td align="left" valign="top"><input name="submit" type="submit" style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="Upload">&nbsp;&nbsp;<input type="radio" name="yesterday" value="1">Upload as yesterday's file

</Td>
</tr>
</table>
</form>
<br>
<br>
<br>
<form action="fannie_daily_report_display2.cfm" method="post" enctype="multipart/form-data" name="fannie_report" target="_new">
<input type="hidden" name="excel" value="1">
<table with="300" cellpadding="2" cellspacing="1" border=1>
<tr>
<Td align="left" valign="top">Upload TR140135X Here<br>
<input type="file" name="spreadsheet_upload" style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none; width: 250px;">
</Td>
</tr>
<tr>
<Td align="left" valign="top"><input name="submit" type="submit" style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: white;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="Upload">&nbsp;&nbsp;<input type="radio" name="yesterday" value="1">Upload as yesterday's file

</Td>
</tr>
</table>
</form>
</center>
<cfif form.submit eq 'Upload'>
<table border=1>
<cfoutput query="todays_recs">
<cfset new_add = 0>
<CFQUERY datasource="#request.dsn#" NAME="find_rec">
		Select * from Fannie_Daily_Reports
		where report_date = #yesterdays_report_date#
		and uploaded_filename = 'TR139932X'
		and col01 = '#todays_recs.col01#'
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
</tr>
</cfoutput>
</table>
</cfif>
</body>
</html>
