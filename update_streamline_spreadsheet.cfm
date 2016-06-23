

<cfparam name="form.submit" default="">
<cfparam name="url.uploaded" default=0>
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
    sheetNumber="0"
	headerrow="1">

<cfset temp_QUERY = QueryNew("ADDRESS_,ADDR_ST,AMT_SLS_PRCE,CLOSEDATE,COMPLEX,DAYS_FROM_EXEC,DAYS_TO_CLOSE,DESC_FIN_TYPE,DESC_PPTY_TYPE_CD,DT_CONT_EXECN,DT_OFR_ACCPTD,DT_RVSD_CLSG,DT_SCHEDD_CLSG,ID_AST,OFRACCPTTOEXEC,PROCESSOR,SLS_SPCLST,TITLE_STATUS,ST_TITLE_ID")>

<cfoutput query="read_all">
<CFQUERY datasource="#request.dsn#" NAME="get_file_info">
select title_id, pname, paddress from title where reo_number = '#read_all.ID_AST#'
</CFQUERY>

<cfset temp = QueryAddRow(temp_QUERY)>
<cfset temp = QuerySetCell(temp_QUERY, "ADDRESS_",#get_file_info.paddress#)>
<cfset temp = QuerySetCell(temp_QUERY, "ADDR_ST", #read_all.ADDR_ST#)>
<cfset temp = QuerySetCell(temp_QUERY, "AMT_SLS_PRCE", #read_all.AMT_SLS_PRCE#)>
<cfset temp = QuerySetCell(temp_QUERY, "CLOSEDATE", #read_all.CLOSEDATE#)>
<cfset temp = QuerySetCell(temp_QUERY, "COMPLEX", #read_all.COMPLEX#)>
<cfset temp = QuerySetCell(temp_QUERY, "DAYS_FROM_EXEC", #read_all.DAYS_FROM_EXEC#)>
<cfset temp = QuerySetCell(temp_QUERY, "DAYS_TO_CLOSE", #read_all.DAYS_TO_CLOSE#)>
<cfset temp = QuerySetCell(temp_QUERY, "DESC_FIN_TYPE", #read_all.DESC_FIN_TYPE#)>
<cfset temp = QuerySetCell(temp_QUERY, "DESC_PPTY_TYPE_CD", #read_all.DESC_PPTY_TYPE_CD#)>
<cfset temp = QuerySetCell(temp_QUERY, "DT_CONT_EXECN", #read_all.DT_CONT_EXECN#)>
<cfset temp = QuerySetCell(temp_QUERY, "DT_OFR_ACCPTD", #read_all.DT_OFR_ACCPTD#)>
<cfset temp = QuerySetCell(temp_QUERY, "DT_RVSD_CLSG", #read_all.DT_RVSD_CLSG#)>
<cfset temp = QuerySetCell(temp_QUERY, "DT_SCHEDD_CLSG", #read_all.DT_SCHEDD_CLSG#)>
<cfset temp = QuerySetCell(temp_QUERY, "ID_AST", #read_all.ID_AST#)>
<cfset temp = QuerySetCell(temp_QUERY, "OFRACCPTTOEXEC", #read_all.OFRACCPTTOEXEC#)>
<cfset temp = QuerySetCell(temp_QUERY, "PROCESSOR", #get_file_info.pname#)>
<cfset temp = QuerySetCell(temp_QUERY, "SLS_SPCLST", #read_all.SLS_SPCLST#)>
<cfset temp = QuerySetCell(temp_QUERY, "TITLE_STATUS", #read_all.TITLE_STATUS#)>
<cfset temp = QuerySetCell(temp_QUERY, "ST_TITLE_ID", #get_file_info.title_id#)>

</cfoutput>

<script language="javascript">
to_excel();
</script>



<cfx_query2excel
	query="temp_QUERY"
	templateFile="C:\inetpub\wwwroot\Clients\firsttitleservices.com\www\rick_tests\cfx_Query2Excel\sample\freddie_update_template.xls"
	outputFile="C:\inetpub\wwwroot\Clients\firsttitleservices.com\www\rick_tests\freddie_updated.xls"
	startRow=1
	columnHeaderRow=1
	columnOrder="ADDRESS_,ADDR_ST,AMT_SLS_PRCE,CLOSEDATE,COMPLEX,DAYS_FROM_EXEC,DAYS_TO_CLOSE,DESC_FIN_TYPE,DESC_PPTY_TYPE_CD,DT_CONT_EXECN,DT_OFR_ACCPTD,DT_RVSD_CLSG,DT_SCHEDD_CLSG,ID_AST,OFRACCPTTOEXEC,PROCESSOR,SLS_SPCLST,TITLE_STATUS,ST_TITLE_ID"
	columnHeadings="ADDRESS_,ADDR_ST,AMT_SLS_PRCE,CLOSEDATE,COMPLEX,DAYS_FROM_EXEC,DAYS_TO_CLOSE,DESC_FIN_TYPE,DESC_PPTY_TYPE_CD,DT_CONT_EXECN,DT_OFR_ACCPTD,DT_RVSD_CLSG,DT_SCHEDD_CLSG,ID_AST,OFRACCPTTOEXEC,PROCESSOR,SLS_SPCLST,TITLE_STATUS,ST_TITLE_ID"
	appendOverwrites="true">

<cflocation url="https://www.firsttitleservices.com/rick_tests/freddie_updated.xls" addtoken="no">
</cfif>
<br>
<br>
<br>
<br>
<br>
<br>
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>
</head>

<body>

<form action="update_streamline_spreadsheet.cfm" method="post" enctype="multipart/form-data" name="abstractor_form">
<table with="300" cellpadding="2" cellspacing="1" border=1>
<tr>
<Td align="left" valign="top">Upload Spreadsheet<br>
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
									clear: none;" value="Upload">
									<cfif url.uploaded eq 1><font color="red">new pricing awaiting approval</font></cfif>
</Td>
</tr>
</table>
</form>

</body>
</html>
