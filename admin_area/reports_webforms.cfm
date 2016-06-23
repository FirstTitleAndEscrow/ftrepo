<CFQUERY datasource="#request.dsn#" NAME="getforms">
	select * from webforms
	order by datecreated desc
</CFQUERY>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Web Form Report</title>
</head>

<style>
.table_header {font-family:Arial, Helvetica, sans-serif; font-size:13px}
.table_border {border-style:solid; border-color:##000000; border-width:thin;}
td {font-family:Arial, Helvetica, sans-serif; font-size: 12px;}
.large_header {font-family:Arial, Helvetica, sans-serif; font-size: 16px;}
</style>

	
<body>	


<table border=1 cellspacing=4 cellpadding=4 class="table_border">
<tr>
<td align="left" valign="bottom"><strong>Name</strong></td>
<td align="left" valign="bottom"><strong>Company</strong></td>
<td align="left" valign="bottom"><strong>Email</strong></td>
<td align="left" valign="bottom"><strong>Phone</strong></td>
<td align="left" valign="bottom"><strong>Received</strong></td>
<td align="left" valign="bottom"><strong>Discuss</strong></td>
<td align="center" valign="bottom"><strong>Source Page</strong></td>

</tr>



<cfoutput query="getForms">
	<tr>
		<td valign="top">#fname# #lname#</td>
		<td valign="top">#company#</td>
		<td valign="top">#email#</td>
		<td valign="top">#phone#</td>
		<td valign="top">#DateFormat(datecreated,"mm/dd/yyyy")# #TimeFormat(datecreated,"hh:mm tt")#</td>
		<td valign="top">#discuss#</td>
		<td valign="top">#sourcePage#</td>
	</tr>

</cfoutput>

</table>
</body>
</html>