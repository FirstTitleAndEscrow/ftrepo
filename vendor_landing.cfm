<cfparam name="url.vendor_id" default=3>
<cfparam name="url.uploaded" default=0>
<cfset session.new_vendor_system = "1">
<CFQUERY datasource="#request.dsn#" NAME="get_vendor">
select * from vendors_stacie
where vendor_id = #url.vendor_id#
</CFQUERY>


<cfset session.vendor_id = get_vendor.vendor_id>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css" media="screen">
body, TD {
font: 10px verdana, arial, sans-serif;
}
input {
font: 9px verdana, arial, sans-serif;
}
select, option {
font: 9px verdana, arial, sans-serif;
}
.header {
font: 14px verdana, arial, sans-serif;
}
</style>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>

<body>
<div align="left">
<form action="vendor_pricing_upload.cfm?vendor_id=<cfoutput>#url.vendor_id#</cfoutput>" method="post" enctype="multipart/form-data" name="abstractor_form">
<table with="300" cellpadding="2" cellspacing="1" border=1>
<tr>
<Td align="left" valign="top"><a href="/vendor_pricing/vendor_pricing_export.cfm" target="_new">Export Current Price List</a><br>
</Td>
</tr>
<tr>
<Td align="left" valign="top">Upload New Pricing<br>
<input type="file" name="pricing_upload" style="font-size: 9;
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
</div>
<br>
<br>

<cfif ListContainsNoCase(get_vendor.service_type, 'Abstract', ',')>
<CFQUERY datasource="#request.dsn#" NAME="get_abstract_work">
select * from vendor_tracker_new
where vendor_id = #url.vendor_id#
and completed is NULL
and task = 'Abstract'
order by order_id
</CFQUERY>

<form action="vendor_abstract_upload.cfm?a_trigger=1&company_id=<cfoutput>#get_vendor.vendor_id#</cfoutput>" method="post" enctype="multipart/form-data" name="abstractor_form">
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="abstract" style="display:<cfif ListContainsNoCase(get_vendor.service_type, 'Abstract', ',')>block<cfelse>none</cfif>;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="350">
<tr><td bgcolor="#FFFFFF" width="200" align="left" valign="middle">
&nbsp; <strong>ABSTRACT</strong>
</td>
<td bgcolor="#FFFFFF" width="75" align="left" valign="middle">
<SELECT NAME="rec_id"
			size="1"
			style="font-size: 9;
			font-family: verdana;
			font-style: normal;
			color: blue;
			background-color: e1e1e1;
			border-color: e1e1e1;
			border-left-width: thin;
			border-right-width: thin;
			border-top-width: thin;
			border-bottom-width: thin;
			border-width: thin;
			border-style: bar;
			clear: none;
			float: none; width: 150px;"
			>
			<cfif get_abstract_work.recordcount eq 0>
			<OPTION VALUE="">No Files Found</OPTION>
			<cfelse>
			<CFOUTPUT QUERY="get_abstract_work">
			<OPTION VALUE="#get_abstract_work.order_id#">#get_abstract_work.order_id#</OPTION>
			</CFOUTPUT>
			</cfif>
			</SELECT>
</td>
<td bgcolor="#FFFFFF" width="75" align="right" valign="middle"><input type="button" value="GO" onclick="document.abstractor_form.submit();"></td>
</tr>
</table>
</td>
</tr>
</table>
</form>
</cfif>




<cfif ListContainsNoCase(get_vendor.service_type, 'Typing', ',')>
<CFQUERY datasource="#request.dsn#" NAME="get_typing_work">
select * from vendor_tracker_new
where vendor_id = #url.vendor_id#
and completed is NULL
and task = 'Typing'
order by order_id
</CFQUERY>
<cfset typing_id_list = ValueList(get_typing_work.order_id, ",")>

<cfoutput><form action="vendor_typing.cfm?username=#URLEncodedFormat(get_vendor.Username)#&password=#URLEncodedFormat(get_vendor.Password)#&a_trigger=1&company_id=0" method="post" enctype="multipart/form-data" name="typing_form"></cfoutput>
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="abstract" style="display:<cfif ListContainsNoCase(get_vendor.service_type, 'Typing', ',')>block<cfelse>none</cfif>;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="350">
<tr><td bgcolor="#FFFFFF" width="200" align="left" valign="middle">
&nbsp; <strong>TYPING</strong>
</td>
<td bgcolor="#FFFFFF" width="75" align="left" valign="middle">
<SELECT NAME="rec_id"
			size="1"
			style="font-size: 9;
			font-family: verdana;
			font-style: normal;
			color: blue;
			background-color: e1e1e1;
			border-color: e1e1e1;
			border-left-width: thin;
			border-right-width: thin;
			border-top-width: thin;
			border-bottom-width: thin;
			border-width: thin;
			border-style: bar;
			clear: none;
			float: none; width: 150px;"
			>
			<cfif get_typing_work.recordcount eq 0>
			<OPTION VALUE="">No Files Found</OPTION>
			<cfelse>
			<CFOUTPUT QUERY="get_typing_work"><OPTION VALUE="#get_typing_work.order_id#">#get_typing_work.order_id#</OPTION></CFOUTPUT>
			</cfif>
			</SELECT>
</td>
<td bgcolor="#FFFFFF" width="75" align="right" valign="middle"><input type="button" value="GO" onclick="document.typing_form.submit();"></td>
</tr>
</table>
</td>
</tr>
</table>
</form>
</cfif>



<cfif ListContainsNoCase(get_vendor.service_type, 'Review', ',')>
<CFQUERY datasource="#request.dsn#" NAME="get_review_work">
select * from vendor_tracker_new
where vendor_id = #url.vendor_id#
and completed is NULL
and task = 'Review'
<cfif IsDefined("get_typing_work.recordcount") and get_typing_work.recordcount gt 0>
and order_id NOT IN (#typing_id_list#)
</cfif>
order by order_id
</CFQUERY>


<cfoutput><form action="vendor_typing.cfm?username=#URLEncodedFormat(get_vendor.Username)#&password=#URLEncodedFormat(get_vendor.Password)#&a_trigger=1&company_id=0&rec_type=T" method="post" enctype="multipart/form-data" name="review_form"></cfoutput>
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="review" style="display:<cfif ListContainsNoCase(get_vendor.service_type, 'Review', ',')>block<cfelse>none</cfif>;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="350">
<tr><td bgcolor="#FFFFFF" width="200" align="left" valign="middle">
&nbsp; <strong><nobr>TITLE COMMITMENT REVIEW&nbsp;</nobr></strong>
</td>
<td bgcolor="#FFFFFF" width="75" align="left" valign="middle">
<SELECT NAME="rec_id"
			size="1"
			style="font-size: 9;
			font-family: verdana;
			font-style: normal;
			color: blue;
			background-color: e1e1e1;
			border-color: e1e1e1;
			border-left-width: thin;
			border-right-width: thin;
			border-top-width: thin;
			border-bottom-width: thin;
			border-width: thin;
			border-style: bar;
			clear: none;
			float: none; width: 150px;"
			>
			<cfif get_review_work.recordcount eq 0>
			<OPTION VALUE="">No Files Found</OPTION>
			<cfelse>
			<CFOUTPUT QUERY="get_review_work"><OPTION VALUE="#get_review_work.order_id#">#get_review_work.order_id#</OPTION></CFOUTPUT>
			</cfif>
			</SELECT>
</td>
<td bgcolor="#FFFFFF" width="75" align="right" valign="middle"><input type="button" value="GO" onclick="document.review_form.submit();"></td>
</tr>
</table>
</td>
</tr>
</table>
</form>
</cfif>











<cfif ListContainsNoCase(get_vendor.service_type, 'Appraisal', ',')>
<CFQUERY datasource="#request.dsn#" NAME="get_appraisal_work">
select * from vendor_tracker_new
where vendor_id = #url.vendor_id#
and completed is NULL
and task = 'Appraisal'
order by order_id
</CFQUERY>

<form action="vendor_appraisal_upload.cfm?a_trigger=1&company_id=<cfoutput>#get_vendor.vendor_id#</cfoutput>" method="post" enctype="multipart/form-data" name="appraisal_form">
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="abstract" style="display:<cfif ListContainsNoCase(get_vendor.service_type, 'Appraisal', ',')>block<cfelse>none</cfif>;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="350">
<tr><td bgcolor="#FFFFFF" width="200" align="left" valign="middle">
&nbsp; <strong>APPRAISAL</strong>
</td>
<td bgcolor="#FFFFFF" width="75" align="left" valign="middle">
<SELECT NAME="rec_id"
			size="1"
			style="font-size: 9;
			font-family: verdana;
			font-style: normal;
			color: blue;
			background-color: e1e1e1;
			border-color: e1e1e1;
			border-left-width: thin;
			border-right-width: thin;
			border-top-width: thin;
			border-bottom-width: thin;
			border-width: thin;
			border-style: bar;
			clear: none;
			float: none; width: 150px;"
			>
			<cfif get_appraisal_work.recordcount eq 0>
			<OPTION VALUE="">No Files Found</OPTION>
			<cfelse>
			<CFOUTPUT QUERY="get_appraisal_work"><OPTION VALUE="#get_appraisal_work.order_id#">#get_appraisal_work.order_id#</OPTION></CFOUTPUT>
			</cfif>
			</SELECT>
</td>
<td bgcolor="#FFFFFF" width="75" align="right" valign="middle"><input type="button" value="GO" onclick="document.appraisal_form.submit();"></td>
</tr>
</table>
</td>
</tr>
</table>
</form>
</cfif>





<cfif ListContainsNoCase(get_vendor.service_type, 'REO', ',')>
<CFQUERY datasource="#request.dsn#" NAME="get_reo_work">
select * from vendor_tracker_new
where (vendor_id = #url.vendor_id#
and completed is NULL
and task = 'REO'
and cancelled = 'False')
order by order_id
</CFQUERY>

<form action="vendor_REO_upload.cfm?a_trigger=1&company_id=<cfoutput>#get_vendor.vendor_id#</cfoutput>" method="post" enctype="multipart/form-data" name="reo_form">
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="abstract" style="display:<cfif ListContainsNoCase(get_vendor.service_type, 'REO', ',')>block<cfelse>none</cfif>;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="350">
<tr><td bgcolor="#FFFFFF" width="200" align="left" valign="middle">
&nbsp;<strong>REO PACKAGE<br>
&nbsp;RETRIEVAL</strong>
</td>
<td bgcolor="#FFFFFF" width="75" align="left" valign="middle">
<SELECT NAME="rec_id"
			size="1"
			style="font-size: 9;
			font-family: verdana;
			font-style: normal;
			color: blue;
			background-color: e1e1e1;
			border-color: e1e1e1;
			border-left-width: thin;
			border-right-width: thin;
			border-top-width: thin;
			border-bottom-width: thin;
			border-width: thin;
			border-style: bar;
			clear: none;
			float: none; width: 150px;"
			>
			<cfif get_reo_work.recordcount eq 0>
			<OPTION VALUE="">No Files Found</OPTION>
			<cfelse>
			<CFOUTPUT QUERY="get_reo_work"><OPTION VALUE="#get_reo_work.order_id#">#get_reo_work.order_id#</OPTION></CFOUTPUT>
			</cfif>
			</SELECT>
</td>
<td bgcolor="#FFFFFF" width="75" align="right" valign="middle"><input type="button" value="GO" onclick="document.reo_form.submit();"></td>
</tr>
</table>
</td>
</tr>
</table>
</form>
</cfif>




<cfif ListContainsNoCase(get_vendor.service_type, 'TaxPrep', ',')>
<CFQUERY datasource="#request.dsn#" NAME="get_taxprep_work">
select * from vendor_tracker_new
where vendor_id = #url.vendor_id#
and completed is NULL
and task = 'TaxPrep'
order by order_id
</CFQUERY>

<cfoutput><form action="vendor_taxes.cfm?username=#URLEncodedFormat(get_vendor.Username)#&password=#URLEncodedFormat(get_vendor.Password)#&a_trigger=1&company_id=0" method="post" enctype="multipart/form-data" name="taxprep_form"></cfoutput>
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="abstract" style="display:<cfif ListContainsNoCase(get_vendor.service_type, 'TaxPrep', ',')>block<cfelse>none</cfif>;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="350">
<tr><td bgcolor="#FFFFFF" width="200" align="left" valign="middle">
&nbsp; <strong>TAX PREPARATION</strong>
</td>
<td bgcolor="#FFFFFF" width="75" align="left" valign="middle">
<SELECT NAME="rec_id"
			size="1"
			style="font-size: 9;
			font-family: verdana;
			font-style: normal;
			color: blue;
			background-color: e1e1e1;
			border-color: e1e1e1;
			border-left-width: thin;
			border-right-width: thin;
			border-top-width: thin;
			border-bottom-width: thin;
			border-width: thin;
			border-style: bar;
			clear: none;
			float: none; width: 150px;"
			>
			<cfif get_taxprep_work.recordcount eq 0>
			<OPTION VALUE="">No Files Found</OPTION>
			<cfelse>
			<CFOUTPUT QUERY="get_taxprep_work"><OPTION VALUE="#get_taxprep_work.order_id#">#get_taxprep_work.order_id#</OPTION></CFOUTPUT>
			</cfif>
			</SELECT>
</td>
<td bgcolor="#FFFFFF" width="75" align="right" valign="middle"><input type="button" value="GO" onclick="document.taxprep_form.submit();"></td>
</tr>
</table>
</td>
</tr>
</table>
</form>
</cfif>









<cfif ListContainsNoCase(get_vendor.service_type, 'ICL', ',')>
<CFQUERY datasource="#request.dsn#" NAME="get_ICL_work">
select * from vendor_tracker_new
where vendor_id = #url.vendor_id#
and completed is NULL
and task = 'ICL'
order by order_id
</CFQUERY>

<form action="vendor_ICL_upload.cfm?a_trigger=1&company_id=<cfoutput>#get_vendor.vendor_id#</cfoutput>" method="post" enctype="multipart/form-data" name="ICL_form">
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="abstract" style="display:<cfif ListContainsNoCase(get_vendor.service_type, 'ICL', ',')>block<cfelse>none</cfif>;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="350">
<tr><td bgcolor="#FFFFFF" width="200" align="left" valign="middle">
&nbsp; <strong>ICL PREPARATION</strong>
</td>
<td bgcolor="#FFFFFF" width="75" align="left" valign="middle">
<SELECT NAME="rec_id"
			size="1"
			style="font-size: 9;
			font-family: verdana;
			font-style: normal;
			color: blue;
			background-color: e1e1e1;
			border-color: e1e1e1;
			border-left-width: thin;
			border-right-width: thin;
			border-top-width: thin;
			border-bottom-width: thin;
			border-width: thin;
			border-style: bar;
			clear: none;
			float: none; width: 150px;"
			>
			<cfif get_ICL_work.recordcount eq 0>
			<OPTION VALUE="">No Files Found</OPTION>
			<cfelse>
			<CFOUTPUT QUERY="get_ICL_work"><OPTION VALUE="#get_ICL_work.order_id#">#get_ICL_work.order_id#</OPTION></CFOUTPUT>
			</cfif>
			</SELECT>
</td>
<td bgcolor="#FFFFFF" width="75" align="right" valign="middle"><input type="button" value="GO" onclick="document.ICL_form.submit();"></td>
</tr>
</table>
</td>
</tr>
</table>
</form>

</cfif>




<cfif ListContainsNoCase(get_vendor.service_type, 'Payoff', ',')>
<CFQUERY datasource="#request.dsn#" NAME="get_Payoff_work">
select * from vendor_tracker_new
where vendor_id = #url.vendor_id#
and completed is NULL
and task = 'Payoff'
order by order_id
</CFQUERY>

<form action="vendor_abstract_upload.cfm?a_trigger=1&company_id=<cfoutput>#get_vendor.vendor_id#</cfoutput>" method="post" enctype="multipart/form-data" name="Payoff_form">
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="abstract" style="display:<cfif ListContainsNoCase(get_vendor.service_type, 'Payoff', ',')>block<cfelse>none</cfif>;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="350">
<tr><td bgcolor="#FFFFFF" width="200" align="left" valign="middle">
&nbsp; <strong>PAYOFFS</strong>
</td>
<td bgcolor="#FFFFFF" width="75" align="left" valign="middle">
<SELECT NAME="rec_id"
			size="1"
			style="font-size: 9;
			font-family: verdana;
			font-style: normal;
			color: blue;
			background-color: e1e1e1;
			border-color: e1e1e1;
			border-left-width: thin;
			border-right-width: thin;
			border-top-width: thin;
			border-bottom-width: thin;
			border-width: thin;
			border-style: bar;
			clear: none;
			float: none; width: 150px;"
			>
			<cfif get_Payoff_work.recordcount eq 0>
			<OPTION VALUE="">No Files Found</OPTION>
			<cfelse>
			<CFOUTPUT QUERY="get_Payoff_work"><OPTION VALUE="#get_Payoff_work.order_id#">#get_Payoff_work.order_id#</OPTION></CFOUTPUT>
			</cfif>
			</SELECT>
</td>
<td bgcolor="#FFFFFF" width="75" align="right" valign="middle"><input type="button" value="GO" onclick="document.Payoff_form.submit();"></td>
</tr>
</table>
</td>
</tr>
</table>
</form>
</cfif>
<script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body>
</html>
