<CFQUERY datasource="#request.dsn#" NAME="find_files">
select t.*, d.abstractor_doc_upload
from title t, doc_abstract_title d
where t.paddress like '#url.prop_add1#%#url.prop_add2#%' and t.pstate = '#url.state#'
and d.abstractor_doc_upload <> '' and d.abstractor_doc_upload IS NOT NULL and t.title_id <> #url.title_id#
and d.title_id = t.title_id
order by t.pzip

</CFQUERY>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>
<style type="text/css" media="screen">
<!--
body, TD {
margin: 3;
padding: 3;
font: 10px verdana, arial, sans-serif;
}
input {
margin: 3;
padding: 3;
font: 12px verdana, arial, sans-serif;
}
select, option {
margin: 3;
padding: 3;
font: 12px verdana, arial, sans-serif;
}
.header {

font: 14px verdana, arial, sans-serif;
}
-->
</style>

</head>


<body>


<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="sale_table" style="display:block;">
<tr><td align="left" valign="top">
<table cellspacing="0" cellpadding="2" bgcolor="#000000" width="500">
<tr colspan=3>
<td bgcolor="black" width=250><font color="white">Possible Matches</font></td>
<td bgcolor="black" width=50><font color="white">City</font></td>
<td bgcolor="black" width=50><font color="white">State</font></td>
<td bgcolor="black" width=50><font color="white">Zip</font></td>
<td bgcolor="black" width=100><font color="white">Uploaded File</font></td>
<td bgcolor="black" width=50><font color="white">File #</font></td>
</tr>
<cfif find_files.recordcount eq 1>
<cfoutput query="find_files">
<tr>
<td bgcolor="white" width=250><font color="black">#find_files.paddress#</font></td>
<td bgcolor="white" width=50><font color="black">#find_files.pcity#</font></td>
<td bgcolor="white" width=50><font color="black">#find_files.pstate#</font></td>
<td bgcolor="white" width=50><font color="black">#find_files.pzip#</font></td>
<td bgcolor="white" width=100><font color="black"><A href="#fileSys.FindFilePath('#find_files.abstractor_doc_upload#', 'url')#" target="_new">#find_files.abstractor_doc_upload#</A></font></td>
<td bgcolor="white" width=50><font color="black"><a href="title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#find_files.title_id#&a_trigger=1" target="_blank">#find_files.title_id#</a></font></td>
</tr>
</cfoutput>
<cfelse>
<tr>
<td bgcolor="white" colspan=6><font color="black">No matches found</font></td>
</tr>
</cfif>
</table>
</td></tr></table>










