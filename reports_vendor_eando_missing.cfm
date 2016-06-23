<CFQUERY datasource="#request.dsn#" NAME="getvendors">
	select * from vendors_stacie
	WHERE e_and_o_expiration IS NULL
	AND company <> ''
	AND service_type LIKE '%Abstract%'
	AND status = 1
	order by company
</CFQUERY>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Vendor E&O Report</title>
</head>


<body>
<h2>Abstractors</h2>
<TABLE cellSpacing=1 cellPadding=1 width="100%" >
<tr>
<td ><font size=1 color=black face=verdana><b>Vendor Name</b></font></td>
<td ><font size=1 color=black face=verdana><b>Vendor Email</b></font></td>
<td ><font size=1 color=black face=verdana><b>Vendor Phone</b></font></td>

</tr>
<cfoutput query="getVendors">
	<tr >
		<td><font size=1 color=black face=verdana>#company#</font></td>
		<td><font size=1 color=black face=verdana>#email#</font></td>
		<td><font size=1 color=black face=verdana>#phone#</font></td>
		
	</tr>

</cfoutput>

</table>
</body>
</html>
