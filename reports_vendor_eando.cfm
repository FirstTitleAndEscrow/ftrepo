<CFQUERY datasource="#request.dsn#" NAME="getvendors">
	select * from vendors_stacie
	WHERE e_and_o_expiration IS NOT NULL
	order by e_and_o_expiration desc
</CFQUERY>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Vendor E&O Report</title>
</head>


<body>
<TABLE cellSpacing=1 cellPadding=1 width="100%" align="Center">
<tr>
<td align="center"><font size=1 color=black face=verdana><b>Vendor Name</b></font></td>
<td align="center"><font size=1 color=black face=verdana><b>Vendor Email</b></font></td>
<td align="center"><font size=1 color=black face=verdana><b>Vendor Phone</b></font></td>
<td align="center"><font size=1 color=black face=verdana><b>E&O Policy Number</b></font></td>
<td align="center"><font size=1 color=black face=verdana><b>E&0 Carrier</b></font></td>
<td align="center"><font size=1 color=black face=verdana><b>E&O Expiration Date</b></font></td>
</tr>
<cfoutput query="getVendors">
	<tr <cfif DateDiff('d',e_and_o_expiration,Now()) LT 0>style="background-color:##90EE90"<cfelse>style="background-color:##FF8C69"</cfif>>
		<td><font size=1 color=black face=verdana>#company#</font></td>
		<td><font size=1 color=black face=verdana>#email#</font></td>
		<td><font size=1 color=black face=verdana>#phone#</font></td>
		<td><font size=1 color=black face=verdana>#e_and_o_policy_num#</font></td>
		<td><font size=1 color=black face=verdana>#e_and_o_carrier#</font></td>
		<td><font size=1 color=black face=verdana>#DateFormat(e_and_o_expiration,"mm/dd/yyyy")#</font></td>
	</tr>

</cfoutput>

</table>
</body>
</html>
