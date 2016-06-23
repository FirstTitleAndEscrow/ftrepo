<cfset read_title.pstate = 'MD'>
<cfset read_title.pcounty = 'Baltimore'>
<cfset read_title.title_id = '12345'>
<cfset url.order_type = 'T'>

<cfparam name="url.selected_abstract_vendor_id" default=0>
<cfparam name="url.selected_typing_vendor_id" default=0>
<cfparam name="url.selected_appraisal_vendor_id" default=0>
<cfparam name="url.selected_taxprep_vendor_id" default=0>
<cfparam name="url.selected_icl_vendor_id" default=0>
<cfparam name="url.selected_payoff_vendor_id" default=0>
<cfparam name="url.selected_deedprep_vendor_id" default=0>

<cfif url.selected_abstract_vendor_id neq 0>
<CFQUERY datasource="#request.dsn#" NAME="read_abstractor_pricing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'Abstract' and s.service_type LIKE '%Abstract%')
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'Abstract' and s.service_type LIKE '%Abstract%')
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'Abstract' and s.service_type LIKE '%Abstract%')
			 and p.vendor_id = s.vendor_id
			 and p.vendor_id = #url.selected_abstract_vendor_id#
</CFQUERY>
<cfoutput>
<script language="javascript">
function fill_abstractor_prices() {
var bring_to_date_price = #read_abstractor_pricing.bring_to_date#;
var two_owner_price = #read_abstractor_pricing.two_owner#;
var doc_retrieval_price = #read_abstractor_pricing.doc_retrieval#;
var current_owner_price = #read_abstractor_pricing.current_owner#;
var full_search_price = #read_abstractor_pricing.full_search#;

if (document.abstractor_form.product_ordered[0].checked == true) {
document.abstractor_form.abstract_price.value = bring_to_date_price;
}

if (document.abstractor_form.product_ordered[1].checked == true) {
document.abstractor_form.abstract_price.value = full_search_price;
}

if (document.abstractor_form.product_ordered[2].checked == true) {
document.abstractor_form.abstract_price.value = current_owner_price;
}

if (document.abstractor_form.product_ordered[3].checked == true) {
document.abstractor_form.abstract_price.value = doc_retrieval_price;
}

if (document.abstractor_form.product_ordered[4].checked == true) {
document.abstractor_form.abstract_price.value = two_owner_price;
}


}


</script>
</cfoutput>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_abstractors">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'Abstract' and s.service_type LIKE '%Abstract%')
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'Abstract' and s.service_type LIKE '%Abstract%')
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'Abstract' and s.service_type LIKE '%Abstract%')
			 and p.vendor_id = s.vendor_id
</CFQUERY>
<cfset found_abstractors = "">
<cfif read_abstractors.recordcount neq 0>
<cfset found_abstractors = ValueList(read_abstractors.vendor_id, ",")>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_abstractors">
			Select * from Vendors_Stacie
			where vendor_id IN (#found_abstractors#)
			and status = 1
			order by company
</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_assigned_abstract" maxrows="1">
			Select * from Vendor_Tracker_new v, Vendors_Stacie s
			where v.order_id = #read_title.title_id#
			and v.task = 'Abstract'
			and v.vendor_id = s.vendor_id
			order by v.ID DESC, v.assign_date
</CFQUERY>
<cfset the_product = "">
<cfif read_assigned_abstract.recordcount>
<CFQUERY datasource="#request.dsn#" NAME="read_abstract_assigned_by" maxrows="1">
			Select fname, lname
			from First_Admin
			where id = #read_assigned_abstract.assigned_by#
</CFQUERY>
<cfswitch expression="#read_assigned_abstract.product_ordered#">
<cfcase value="bring_to_date">
<cfset the_product = "Bring To Date">
</cfcase>
<cfcase value="full_search">
<cfset the_product = "Full Search">
</cfcase>
<cfcase value="current_owner">
<cfset the_product = "Current Owner Search with 24 month chain of title">
</cfcase>
<cfcase value="doc_retrieval">
<cfset the_product = "Document Retrieval">
</cfcase>
<cfcase value="two_owner">
<cfset the_product = "Two Owner Search">
</cfcase>
</cfswitch>
</cfif>

<cfif url.selected_abstract_vendor_id neq 0>
<CFQUERY datasource="#request.dsn#" NAME="read_abstractor_pricing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'Abstract' and s.service_type LIKE '%Abstract%')
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'Abstract' and s.service_type LIKE '%Abstract%')
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'Abstract' and s.service_type LIKE '%Abstract%')
			 and p.vendor_id = s.vendor_id
			 and p.vendor_id = #url.selected_abstract_vendor_id#
</CFQUERY>
<cfoutput>
<script language="javascript">
function fill_abstractor_prices() {
var bring_to_date_price = #read_abstractor_pricing.bring_to_date#;
var two_owner_price = #read_abstractor_pricing.two_owner#;
var doc_retrieval_price = #read_abstractor_pricing.doc_retrieval#;
var current_owner_price = #read_abstractor_pricing.current_owner#;
var full_search_price = #read_abstractor_pricing.full_search#;

if (document.abstractor_form.product_ordered[0].checked == true) {
document.abstractor_form.abstract_price.value = bring_to_date_price;
}

if (document.abstractor_form.product_ordered[1].checked == true) {
document.abstractor_form.abstract_price.value = full_search_price;
}

if (document.abstractor_form.product_ordered[2].checked == true) {
document.abstractor_form.abstract_price.value = current_owner_price;
}

if (document.abstractor_form.product_ordered[3].checked == true) {
document.abstractor_form.abstract_price.value = doc_retrieval_price;
}

if (document.abstractor_form.product_ordered[4].checked == true) {
document.abstractor_form.abstract_price.value = two_owner_price;
}


}
</script>
</cfoutput>
</cfif>


<!--- TYPING --->
<CFQUERY datasource="#request.dsn#" NAME="read_typing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'Typing' and s.service_type LIKE '%Typing%')
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'Typing' and s.service_type LIKE '%Typing%')
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'Typing' and s.service_type LIKE '%Typing%')
			 and p.vendor_id = s.vendor_id
</CFQUERY>
 <CFQUERY datasource="#request.dsn#" NAME="read_assigned_typing" maxrows="1">
			Select * from Vendor_Tracker_new v, Vendors_Stacie s
			where v.order_id = #read_title.title_id#
			and v.task = 'Typing'
			and v.vendor_id = s.vendor_id
			order by v.ID DESC, v.assign_date
</CFQUERY>
<cfif read_assigned_typing.recordcount>
<CFQUERY datasource="#request.dsn#" NAME="read_typing_assigned_by" maxrows="1">
			Select fname, lname
			from First_Admin
			where id = #read_assigned_typing.assigned_by#
</CFQUERY>
</cfif>
<!--- END TYPING --->



<!--- APPRAISAL --->
<CFQUERY datasource="#request.dsn#" NAME="read_Appraisal">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'Appraisal' and s.service_type LIKE '%Appraisal%')
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'Appraisal' and s.service_type LIKE '%Appraisal%')
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'Appraisal' and s.service_type LIKE '%Appraisal%')
			 and p.vendor_id = s.vendor_id
</CFQUERY>
 <CFQUERY datasource="#request.dsn#" NAME="read_assigned_Appraisal" maxrows="1">
			Select * from Vendor_Tracker_new v, Vendors_Stacie s
			where v.order_id = #read_title.title_id#
			and v.task = 'Appraisal'
			and v.vendor_id = s.vendor_id
			order by v.ID DESC, v.assign_date
</CFQUERY>
<cfif read_assigned_Appraisal.recordcount>
<CFQUERY datasource="#request.dsn#" NAME="read_Appraisal_assigned_by" maxrows="1">
			Select fname, lname
			from First_Admin
			where id = #read_assigned_Appraisal.assigned_by#
</CFQUERY>
</cfif>
<!--- END APPRAISAL --->


<!--- TAXPREP --->
<CFQUERY datasource="#request.dsn#" NAME="read_taxprep">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'TaxPrep' and s.service_type LIKE '%TaxPrep%')
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'TaxPrep' and s.service_type LIKE '%TaxPrep%')
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'TaxPrep' and s.service_type LIKE '%TaxPrep%')
			 and p.vendor_id = s.vendor_id
</CFQUERY>
 <CFQUERY datasource="#request.dsn#" NAME="read_assigned_TaxPrep" maxrows="1">
			Select * from Vendor_Tracker_new v, Vendors_Stacie s
			where v.order_id = #read_title.title_id#
			and v.task = 'TaxPrep'
			and v.vendor_id = s.vendor_id
			order by v.ID DESC, v.assign_date
</CFQUERY>
<cfif read_assigned_TaxPrep.recordcount>
<CFQUERY datasource="#request.dsn#" NAME="read_TaxPrep_assigned_by" maxrows="1">
			Select fname, lname
			from First_Admin
			where id = #read_assigned_TaxPrep.assigned_by#
</CFQUERY>
</cfif>
<!--- END TAXPREP --->

<!--- ICL --->
<CFQUERY datasource="#request.dsn#" NAME="read_ICL">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'ICL' and s.service_type LIKE '%ICL%')
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'ICL' and s.service_type LIKE '%ICL%')
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'ICL' and s.service_type LIKE '%ICL%')
			 and p.vendor_id = s.vendor_id
</CFQUERY>
 <CFQUERY datasource="#request.dsn#" NAME="read_assigned_ICL" maxrows="1">
			Select * from Vendor_Tracker_new v, Vendors_Stacie s
			where v.order_id = #read_title.title_id#
			and v.task = 'ICL'
			and v.vendor_id = s.vendor_id
			order by v.ID DESC, v.assign_date
</CFQUERY>
<cfif read_assigned_ICL.recordcount>
<CFQUERY datasource="#request.dsn#" NAME="read_ICL_assigned_by" maxrows="1">
			Select fname, lname
			from First_Admin
			where id = #read_assigned_ICL.assigned_by#
</CFQUERY>
</cfif>
<!--- END ICL --->

<!--- payoff --->
<CFQUERY datasource="#request.dsn#" NAME="read_payoff">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'Payoff' and s.service_type LIKE '%Payoff%')
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'Payoff' and s.service_type LIKE '%Payoff%')
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'Payoff' and s.service_type LIKE '%Payoff%')
			 and p.vendor_id = s.vendor_id
</CFQUERY>
 <CFQUERY datasource="#request.dsn#" NAME="read_assigned_payoff" maxrows="1">
			Select * from Vendor_Tracker_new v, Vendors_Stacie s
			where v.order_id = #read_title.title_id#
			and v.task = 'Payoff'
			and v.vendor_id = s.vendor_id
			order by v.ID DESC, v.assign_date
</CFQUERY>
<cfif read_assigned_payoff.recordcount>
<CFQUERY datasource="#request.dsn#" NAME="read_payoff_assigned_by" maxrows="1">
			Select fname, lname
			from First_Admin
			where id = #read_assigned_payoff.assigned_by#
</CFQUERY>
</cfif>
<!--- END payoff --->


<!--- deedprep --->
<CFQUERY datasource="#request.dsn#" NAME="read_deedprep">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'DeedPrep' and s.service_type LIKE '%DeedPrep%')
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'DeedPrep' and s.service_type LIKE '%DeedPrep%')
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'DeedPrep' and s.service_type LIKE '%DeedPrep%')
			 and p.vendor_id = s.vendor_id
</CFQUERY>
 <CFQUERY datasource="#request.dsn#" NAME="read_assigned_deedprep" maxrows="1">
			Select * from Vendor_Tracker_new v, Vendors_Stacie s
			where v.order_id = #read_title.title_id#
			and v.task = 'DeedPrep'
			and v.vendor_id = s.vendor_id
			order by v.ID DESC, v.assign_date
</CFQUERY>
<cfif read_assigned_deedprep.recordcount>
<CFQUERY datasource="#request.dsn#" NAME="read_deedprep_assigned_by" maxrows="1">
			Select fname, lname
			from First_Admin
			where id = #read_assigned_deedprep.assigned_by#
</CFQUERY>
</cfif>
<!--- END deedprep --->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>
<style type="text/css" media="screen">
<!--
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
-->
</style>
</head>

<body>


<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="sale_table" style="display:block;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="850">
<tr><td bgcolor="#FFFFFF" colspan=9 align="left" valign="middle"><font size=2>QUICK VIEW</font></td></tr>
<tr>
<td bgcolor="#CCCCCC" width="75" align="left" valign="middle"><strong><font color="#000000">Abstract</font></strong>&nbsp;<cfif read_assigned_abstract.recordcount eq 0><img src="../admin_area/images/ind_open.gif" width=17 height=17><cfelseif read_assigned_abstract.completed eq 1><img src="../admin_area/images/ind_closed.gif" width=17 height=17><cfelse><img src="../admin_area/images/ind_started.gif" width=17 height=17></cfif></td>


<td bgcolor="#CCCCCC" width="65" align="left" valign="middle"><strong><font color="#000000">Typing</font></strong>&nbsp;<cfif read_assigned_typing.recordcount eq 0><img src="../admin_area/images/ind_open.gif" width=17 height=17><cfelseif read_assigned_typing.completed eq 1><img src="../admin_area/images/ind_closed.gif" width=17 height=17><cfelse><img src="../admin_area/images/ind_started.gif" width=17 height=17></cfif></td>

<td bgcolor="#CCCCCC" width="75" align="left" valign="middle"><strong><font color="#000000">Appraisal</font></strong>&nbsp;<cfif read_assigned_appraisal.recordcount eq 0><img src="../admin_area/images/ind_open.gif" width=17 height=17><cfelseif read_assigned_appraisal.completed eq 1><img src="../admin_area/images/ind_closed.gif" width=17 height=17><cfelse><img src="../admin_area/images/ind_started.gif" width=17 height=17></cfif></td>

<td bgcolor="#CCCCCC" width="75" align="left" valign="middle"><strong><font color="#000000">Tax Prep</font></strong>&nbsp;<cfif read_assigned_taxprep.recordcount eq 0><img src="../admin_area/images/ind_open.gif" width=17 height=17><cfelseif read_assigned_taxprep.completed eq 1><img src="../admin_area/images/ind_closed.gif" width=17 height=17><cfelse><img src="../admin_area/images/ind_started.gif" width=17 height=17></cfif></td>


<td bgcolor="#CCCCCC" width="50" align="left" valign="middle"><strong><font color="#000000">ICL</font></strong>&nbsp;<cfif read_assigned_icl.recordcount eq 0><img src="../admin_area/images/ind_open.gif" width=17 height=17><cfelseif read_assigned_icl.completed eq 1><img src="../admin_area/images/ind_closed.gif" width=17 height=17><cfelse><img src="../admin_area/images/ind_started.gif" width=17 height=17></cfif></td>

<td bgcolor="#CCCCCC" width="75" align="left" valign="middle"><strong><font color="#000000">Payoffs</font></strong>&nbsp;<cfif read_assigned_payoff.recordcount eq 0><img src="../admin_area/images/ind_open.gif" width=17 height=17><cfelseif read_assigned_payoff.completed eq 1><img src="../admin_area/images/ind_closed.gif" width=17 height=17><cfelse><img src="../admin_area/images/ind_started.gif" width=17 height=17></cfif></td>

<td bgcolor="#CCCCCC" width="85" align="left" valign="middle"><strong><font color="#000000">Deed Prep</font></strong>&nbsp;<cfif read_assigned_deedprep.recordcount eq 0><img src="../admin_area/images/ind_open.gif" width=17 height=17><cfelseif read_assigned_deedprep.completed eq 1><img src="../admin_area/images/ind_closed.gif" width=17 height=17><cfelse><img src="../admin_area/images/ind_started.gif" width=17 height=17></cfif></td>


<td bgcolor="#CCCCCC" width="106" align="left" valign="middle"><strong><font color="#000000">Closing Req.</font></strong>&nbsp;<img src="../admin_area/images/ind_open.gif" width=17 height=17></td>
<td bgcolor="#CCCCCC" width="106" align="left" valign="middle"><strong><font color="#000000">Closing Sched.</font></strong>&nbsp;<img src="../admin_area/images/ind_open.gif" width=17 height=17></td>
</tr>
</table>
</td>
</tr>
</table>
<br>
<br>
<br>
<!--- ABSTRACTOR --->
<form action="../admin_area/vendor_assign_abstract.cfm" method="post" name="abstractor_form">
<input type="hidden" name="order_id" value="<cfoutput>#read_title.title_id#</cfoutput>">
<input type="hidden" name="order_type" value="<cfoutput>#url.order_type#</cfoutput>">
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="sale_table" style="display:block;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="850">
<tr><td bgcolor="#FFFFFF" width="650" align="left" valign="middle"><strong><font size=2>ABSTRACT</font></strong></td>
<td bgcolor="#FFFFFF" width="50" align="center" valign="middle"><font size=2>history</font></td></tr>
<tr><td colspan="4" bgcolor="#FFFFFF" align="right">


<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="850">
<tr>
<td align="left" valign="top" width="195" rowspan="2" bgcolor="#FFFFFF"><br>
<strong><font color="#000000">Current Status</font></strong>:<br>
<cfif read_assigned_abstract.recordcount>
<cfif read_assigned_abstract.completed eq 1>
<font color="green"><strong>COMPLETED</strong></font> by:<BR>
<CFELSE>
<font color="blue"><strong>ASSIGNED</strong></font> to:<BR>
</cfif>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_assigned_abstract.company#</cfoutput><br><BR>
<strong>Product Ordered</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#the_product# <cfif read_assigned_abstract.bring_to_date neq '1900-01-01 00:00:00.0'>#DateFormat(read_assigned_abstract.bring_to_date, "mm/dd/yyyy")#</cfif> </cfoutput><BR><BR>
<strong>Assigned Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_abstract.assign_date, "mm/dd/yyyy")# #timeFormat(read_assigned_abstract.assign_time, "h:mm tt")#</cfoutput><br><BR>
<cfif read_assigned_abstract.completed eq 1>
<strong>Completed Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_abstract.return_date, "mm/dd/yyyy")#  #timeFormat(read_assigned_abstract.return_time, "h:mm tt")#</cfoutput><br><BR>
</cfif>
<strong>Assigned By</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_abstract_assigned_by.fname# #read_abstract_assigned_by.lname#<br><br></cfoutput>
<cfelse>
Unassigned<BR><BR>
</cfif>
</td>
<td bgcolor="#FFFFFF" colspan=4 align="left" valign="middle"><font size=2><cfif read_assigned_abstract.recordcount>RE-</cfif>ASSIGN THIS FILE</font></td></tr>
<tr>
<td bgcolor="#CCCCCC" width="450" align="left" valign="middle"><SELECT NAME="vendor_id"
										size="1"
										style=" text-align:right;
				width: 400px;" onchange="document.abstractor_form.submit();">
				<OPTION VALUE="" selected>To <cfif read_assigned_abstract.recordcount>re-</cfif>assign this file's abstract work, select a Vendor here</OPTION>
<cfif read_abstractors.recordcount>
<cfoutput query="read_abstractors">
					<OPTION VALUE="#read_abstractors.vendor_id#" <cfif url.selected_abstract_vendor_id eq read_abstractors.vendor_id>selected</cfif>>#read_abstractors.Company#</OPTION>
</cfoutput>
</cfif>
					</select>
					<br><input type="radio" name="product_ordered" value="bring_to_date" onclick="fill_abstractor_prices();">Bring to Date&nbsp;&nbsp;<input type=text name="bring_to_date" VALUE="" size=6 maxlength=22

				style="width: 75px; ">&nbsp;<em>'mm/dd/yyyy'</em><br>
<input type="radio" name="product_ordered" value="full_search" onclick="fill_abstractor_prices();">Full Search<br>
<input type="radio" name="product_ordered" value="current_owner" onclick="fill_abstractor_prices();">Current Owner Search with 24 month chain of title<br>
<input type="radio" name="product_ordered" value="doc_retrieval" onclick="fill_abstractor_prices();">Document Retrieval<br>
<input type="radio" name="product_ordered" value="two_owner" onclick="fill_abstractor_prices();">Two Owner Search<br>
<input type="checkbox" name="title_update" value="1">Title Update Only<br>
<input type="checkbox" name="taxes_from_search" value="1">Complete Taxes from Search<br>

</td>
<td bgcolor="#CCCCCC" width="150" align="left" valign="top">$<input type=text name="abstract_price" VALUE="" size=3 maxlength=22

				style="text-align:right;">&nbsp;<input type="hidden" name="abs_commit" value="0"><input type="button" value="<cfif read_assigned_abstract.recordcount>RE-ASSIGN<cfelse>ASSIGN</cfif>" onclick="document.abstractor_form.abs_commit.value=1;document.abstractor_form.submit();"><br>
&nbsp;&nbsp;&nbsp;<strong>price</strong></td>
</tr>
</table>
</td></tr>
</table>
</td>
</tr>
</table>
</form>
<!--- END ABSTRACTOR --->

<br>
<br>
<!--- TYPING --->
<form action="../admin_area/vendor_assign_typing.cfm" method="post" name="typing_form" ID="typing_form">
<input type="hidden" name="order_id" value="<cfoutput>#read_title.title_id#</cfoutput>">
<input type="hidden" name="order_type" value="<cfoutput>#url.order_type#</cfoutput>">
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="sale_table" style="display:block;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="850">
<tr><td bgcolor="#FFFFFF" width="650" align="left" valign="middle"><strong><font size=2>TYPING</font></strong></td>
<td bgcolor="#FFFFFF" width="50" align="center" valign="middle"><font size=2>history</font></td></tr>
<tr><td colspan="4" bgcolor="#FFFFFF" align="right">


<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="850">
<tr>
<td align="left" valign="top" width="195" rowspan="2" bgcolor="#FFFFFF"><br>
<strong><font color="#000000">Current Status</font></strong>:<br>
<cfif read_assigned_typing.recordcount>
<cfif read_assigned_typing.completed eq 1>
<font color="green"><strong>COMPLETED</strong></font> by:<BR>
<CFELSE>
<font color="blue"><strong>ASSIGNED</strong></font> to:<BR>
</cfif>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_assigned_typing.company#</cfoutput><br><BR>
<strong>Assigned Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_typing.assign_date, "mm/dd/yyyy")# #timeFormat(read_assigned_typing.assign_time, "h:mm tt")#</cfoutput><br><BR>
<cfif read_assigned_typing.completed eq 1>
<strong>Completed Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_typing.return_date, "mm/dd/yyyy")#  #timeFormat(read_assigned_typing.return_time, "h:mm tt")#</cfoutput><br><BR>
</cfif>
<strong>Assigned By</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_typing_assigned_by.fname# #read_typing_assigned_by.lname#<br><br></cfoutput>
<cfelse>
Unassigned<BR><BR>
</cfif>
</td>
<td bgcolor="#FFFFFF" colspan=4 align="left" valign="middle"><font size=2><cfif read_assigned_typing.recordcount>RE-</cfif>ASSIGN THIS FILE</font></td></tr>
<tr>
<td bgcolor="#CCCCCC" width="450" align="left" valign="middle"><SELECT NAME="vendor_id"
										size="1"
										style=" text-align:right;
				width: 400px;" onchange="document.typing_form.submit();">
				<OPTION VALUE="" selected>To <cfif read_assigned_typing.recordcount>re-</cfif>assign this file's typing work, select a Vendor here</OPTION>
<cfif read_typing.recordcount>
<cfoutput query="read_typing">
					<OPTION VALUE="#read_typing.vendor_id#" <cfif url.selected_typing_vendor_id eq read_typing.vendor_id>selected</cfif>>#read_typing.Company#</OPTION>
</cfoutput>
</cfif>
					</select>
<br><br><br><br><br><br><br>

</td>
<td bgcolor="#CCCCCC" width="150" align="left" valign="top">$<input type=text name="typing_price" id="typing_price" VALUE="" size=3 maxlength=22

				style="text-align:right;">&nbsp;<input type="hidden" name="typing_commit" value="0"><input type="button" value="<cfif read_assigned_typing.recordcount>RE-ASSIGN<cfelse>ASSIGN</cfif>" onclick="document.typing_form.typing_commit.value=1;document.typing_form.submit();"><br>
&nbsp;&nbsp;&nbsp;<strong>price</strong></td>
</tr>
</table>
</td></tr>
</table>
</td>
</tr>
</table>
</form>

<cfif url.selected_typing_vendor_id neq 0>
<CFQUERY datasource="#request.dsn#" NAME="read_typing_pricing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'Typing' and s.service_type LIKE '%Typing%')
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'Typing' and s.service_type LIKE '%Typing%')
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'Typing' and s.service_type LIKE '%Typing%')
			 and p.vendor_id = s.vendor_id
			 and p.vendor_id = #url.selected_typing_vendor_id#
</CFQUERY>

<cfoutput>
<script language="javascript">
document.typing_form.typing_price.value = #read_typing_pricing.typing_fee#;
</script>
</cfoutput>
</cfif>

<!--- END TYPING --->

<br>


<!--- APPRAISAL --->
<form action="../admin_area/vendor_assign_appraisal.cfm" method="post" name="appraisal_form" ID="appraisal_form">
<input type="hidden" name="order_id" value="<cfoutput>#read_title.title_id#</cfoutput>">
<input type="hidden" name="order_type" value="<cfoutput>#url.order_type#</cfoutput>">
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="sale_table" style="display:block;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="850">
<tr><td bgcolor="#FFFFFF" width="650" align="left" valign="middle"><strong><font size=2>APPRAISAL</font></strong></td>
<td bgcolor="#FFFFFF" width="50" align="center" valign="middle"><font size=2>history</font></td></tr>
<tr><td colspan="4" bgcolor="#FFFFFF" align="right">


<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="850">
<tr>
<td align="left" valign="top" width="195" rowspan="2" bgcolor="#FFFFFF"><br>
<strong><font color="#000000">Current Status</font></strong>:<br>
<cfif read_assigned_appraisal.recordcount>
<cfif read_assigned_appraisal.completed eq 1>
<font color="green"><strong>COMPLETED</strong></font> by:<BR>
<CFELSE>
<font color="blue"><strong>ASSIGNED</strong></font> to:<BR>
</cfif>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_assigned_appraisal.company#</cfoutput><br><BR>
<strong>Assigned Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_appraisal.assign_date, "mm/dd/yyyy")# #timeFormat(read_assigned_appraisal.assign_time, "h:mm tt")#</cfoutput><br><BR>
<cfif read_assigned_appraisal.completed eq 1>
<strong>Completed Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_appraisal.return_date, "mm/dd/yyyy")#  #timeFormat(read_assigned_appraisal.return_time, "h:mm tt")#</cfoutput><br><BR>
</cfif>
<strong>Assigned By</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_appraisal_assigned_by.fname# #read_appraisal_assigned_by.lname#<br><br></cfoutput>
<cfelse>
Unassigned<BR><BR>
</cfif>
</td>
<td bgcolor="#FFFFFF" colspan=4 align="left" valign="middle"><font size=2><cfif read_assigned_appraisal.recordcount>RE-</cfif>ASSIGN THIS FILE</font></td></tr>
<tr>
<td bgcolor="#CCCCCC" width="450" align="left" valign="middle"><SELECT NAME="vendor_id"
										size="1"
										style=" text-align:right;
				width: 400px;" onchange="document.appraisal_form.submit();">
				<OPTION VALUE="" selected>To <cfif read_assigned_appraisal.recordcount>re-</cfif>assign this file's appraisal work, select a Vendor here</OPTION>
<cfif read_appraisal.recordcount>
<cfoutput query="read_appraisal">
					<OPTION VALUE="#read_appraisal.vendor_id#" <cfif url.selected_appraisal_vendor_id eq read_appraisal.vendor_id>selected</cfif>>#read_appraisal.Company#</OPTION>
</cfoutput>
</cfif>
					</select>
<br><br><br><br><br><br><br>

</td>
<td bgcolor="#CCCCCC" width="150" align="left" valign="top">$<input type=text name="appraisal_price" id="appraisal_price" VALUE="" size=3 maxlength=22

				style="text-align:right;">&nbsp;<input type="hidden" name="appraisal_commit" value="0"><input type="button" value="<cfif read_assigned_appraisal.recordcount>RE-ASSIGN<cfelse>ASSIGN</cfif>" onclick="document.appraisal_form.appraisal_commit.value=1;document.appraisal_form.submit();"><br>
&nbsp;&nbsp;&nbsp;<strong>price</strong></td>
</tr>
</table>
</td></tr>
</table>
</td>
</tr>
</table>
</form>

<cfif url.selected_appraisal_vendor_id neq 0>
<CFQUERY datasource="#request.dsn#" NAME="read_appraisal_pricing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'Appraisal' and s.service_type LIKE '%Appraisal%')
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'Appraisal' and s.service_type LIKE '%Appraisal%')
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'Appraisal' and s.service_type LIKE '%Appraisal%')
			 and p.vendor_id = s.vendor_id
			 and p.vendor_id = #url.selected_appraisal_vendor_id#
</CFQUERY>

<cfoutput>
<script language="javascript">
document.appraisal_form.appraisal_price.value = #read_appraisal_pricing.appraisal_fee#;
</script>
</cfoutput>
</cfif>

<!--- END APPRAISAL --->


<br>


<!--- taxprep --->
<form action="../admin_area/vendor_assign_taxprep.cfm" method="post" name="taxprep_form" ID="taxprep_form">
<input type="hidden" name="order_id" value="<cfoutput>#read_title.title_id#</cfoutput>">
<input type="hidden" name="order_type" value="<cfoutput>#url.order_type#</cfoutput>">
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="sale_table" style="display:block;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="850">
<tr><td bgcolor="#FFFFFF" width="650" align="left" valign="middle"><strong><font size=2>TAX PREPARATION</font></strong></td>
<td bgcolor="#FFFFFF" width="50" align="center" valign="middle"><font size=2>history</font></td></tr>
<tr><td colspan="4" bgcolor="#FFFFFF" align="right">


<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="850">
<tr>
<td align="left" valign="top" width="195" rowspan="2" bgcolor="#FFFFFF"><br>
<strong><font color="#000000">Current Status</font></strong>:<br>
<cfif read_assigned_taxprep.recordcount>
<cfif read_assigned_taxprep.completed eq 1>
<font color="green"><strong>COMPLETED</strong></font> by:<BR>
<CFELSE>
<font color="blue"><strong>ASSIGNED</strong></font> to:<BR>
</cfif>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_assigned_taxprep.company#</cfoutput><br><BR>
<strong>Assigned Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_taxprep.assign_date, "mm/dd/yyyy")# #timeFormat(read_assigned_taxprep.assign_time, "h:mm tt")#</cfoutput><br><BR>
<cfif read_assigned_taxprep.completed eq 1>
<strong>Completed Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_taxprep.return_date, "mm/dd/yyyy")#  #timeFormat(read_assigned_taxprep.return_time, "h:mm tt")#</cfoutput><br><BR>
</cfif>
<strong>Assigned By</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_taxprep_assigned_by.fname# #read_taxprep_assigned_by.lname#<br><br></cfoutput>
<cfelse>
Unassigned<BR><BR>
</cfif>
</td>
<td bgcolor="#FFFFFF" colspan=4 align="left" valign="middle"><font size=2><cfif read_assigned_taxprep.recordcount>RE-</cfif>ASSIGN THIS FILE</font></td></tr>
<tr>
<td bgcolor="#CCCCCC" width="450" align="left" valign="middle"><SELECT NAME="vendor_id"
										size="1"
										style=" text-align:right;
				width: 400px;" onchange="document.taxprep_form.submit();">
				<OPTION VALUE="" selected>To <cfif read_assigned_taxprep.recordcount>re-</cfif>assign this file's tax preparation work, select a Vendor here</OPTION>
<cfif read_taxprep.recordcount>
<cfoutput query="read_taxprep">
					<OPTION VALUE="#read_taxprep.vendor_id#" <cfif url.selected_taxprep_vendor_id eq read_taxprep.vendor_id>selected</cfif>>#read_taxprep.Company#</OPTION>
</cfoutput>
</cfif>
					</select>
<br><br><br><br><br><br><br>

</td>
<td bgcolor="#CCCCCC" width="150" align="left" valign="top">$<input type=text name="taxprep_price" id="taxprep_price" VALUE="" size=3 maxlength=22

				style="text-align:right;">&nbsp;<input type="hidden" name="taxprep_commit" value="0"><input type="button" value="<cfif read_assigned_taxprep.recordcount>RE-ASSIGN<cfelse>ASSIGN</cfif>" onclick="document.taxprep_form.taxprep_commit.value=1;document.taxprep_form.submit();"><br>
&nbsp;&nbsp;&nbsp;<strong>price</strong></td>
</tr>
</table>
</td></tr>
</table>
</td>
</tr>
</table>
</form>

<cfif url.selected_taxprep_vendor_id neq 0>
<CFQUERY datasource="#request.dsn#" NAME="read_taxprep_pricing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'TaxPrep' and s.service_type LIKE '%TaxPrep%')
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'TaxPrep' and s.service_type LIKE '%TaxPrep%')
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'TaxPrep' and s.service_type LIKE '%TaxPrep%')
			 and p.vendor_id = s.vendor_id
			 and p.vendor_id = #url.selected_taxprep_vendor_id#
</CFQUERY>

<cfoutput>
<script language="javascript">
document.taxprep_form.taxprep_price.value = #read_taxprep_pricing.taxprep_fee#;
</script>
</cfoutput>
</cfif>

<!--- END taxprep --->


<br>


<!--- ICL --->
<form action="../admin_area/vendor_assign_ICL.cfm" method="post" name="ICL_form" ID="ICL_form">
<input type="hidden" name="order_id" value="<cfoutput>#read_title.title_id#</cfoutput>">
<input type="hidden" name="order_type" value="<cfoutput>#url.order_type#</cfoutput>">
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="sale_table" style="display:block;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="850">
<tr><td bgcolor="#FFFFFF" width="650" align="left" valign="middle"><strong><font size=2>ICL PREPARATION</font></strong></td>
<td bgcolor="#FFFFFF" width="50" align="center" valign="middle"><font size=2>history</font></td></tr>
<tr><td colspan="4" bgcolor="#FFFFFF" align="right">


<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="850">
<tr>
<td align="left" valign="top" width="195" rowspan="2" bgcolor="#FFFFFF"><br>
<strong><font color="#000000">Current Status</font></strong>:<br>
<cfif read_assigned_ICL.recordcount>
<cfif read_assigned_ICL.completed eq 1>
<font color="green"><strong>COMPLETED</strong></font> by:<BR>
<CFELSE>
<font color="blue"><strong>ASSIGNED</strong></font> to:<BR>
</cfif>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_assigned_ICL.company#</cfoutput><br><BR>
<strong>Assigned Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_ICL.assign_date, "mm/dd/yyyy")# #timeFormat(read_assigned_ICL.assign_time, "h:mm tt")#</cfoutput><br><BR>
<cfif read_assigned_ICL.completed eq 1>
<strong>Completed Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_ICL.return_date, "mm/dd/yyyy")#  #timeFormat(read_assigned_ICL.return_time, "h:mm tt")#</cfoutput><br><BR>
</cfif>
<strong>Assigned By</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_ICL_assigned_by.fname# #read_ICL_assigned_by.lname#<br><br></cfoutput>
<cfelse>
Unassigned<BR><BR>
</cfif>
</td>
<td bgcolor="#FFFFFF" colspan=4 align="left" valign="middle"><font size=2><cfif read_assigned_ICL.recordcount>RE-</cfif>ASSIGN THIS FILE</font></td></tr>
<tr>
<td bgcolor="#CCCCCC" width="450" align="left" valign="middle"><SELECT NAME="vendor_id"
										size="1"
										style=" text-align:right;
				width: 400px;" onchange="document.ICL_form.submit();">
				<OPTION VALUE="" selected>To <cfif read_assigned_ICL.recordcount>re-</cfif>assign this file's tax preparation work, select a Vendor here</OPTION>
<cfif read_ICL.recordcount>
<cfoutput query="read_ICL">
					<OPTION VALUE="#read_ICL.vendor_id#" <cfif url.selected_ICL_vendor_id eq read_ICL.vendor_id>selected</cfif>>#read_ICL.Company#</OPTION>
</cfoutput>
</cfif>
					</select>
<br><br><br><br><br><br><br>

</td>
<td bgcolor="#CCCCCC" width="150" align="left" valign="top">$<input type=text name="ICL_price" id="ICL_price" VALUE="" size=3 maxlength=22

				style="text-align:right;">&nbsp;<input type="hidden" name="ICL_commit" value="0"><input type="button" value="<cfif read_assigned_ICL.recordcount>RE-ASSIGN<cfelse>ASSIGN</cfif>" onclick="document.ICL_form.ICL_commit.value=1;document.ICL_form.submit();"><br>
&nbsp;&nbsp;&nbsp;<strong>price</strong></td>
</tr>
</table>
</td></tr>
</table>
</td>
</tr>
</table>
</form>

<cfif url.selected_ICL_vendor_id neq 0>
<CFQUERY datasource="#request.dsn#" NAME="read_ICL_pricing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'ICL' and s.service_type LIKE '%ICL%')
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'ICL' and s.service_type LIKE '%ICL%')
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'ICL' and s.service_type LIKE '%ICL%')
			 and p.vendor_id = s.vendor_id
			 and p.vendor_id = #url.selected_ICL_vendor_id#
</CFQUERY>

<cfoutput>
<script language="javascript">
document.ICL_form.ICL_price.value = #read_ICL_pricing.ICL_fee#;
</script>
</cfoutput>
</cfif>

<!--- END ICL --->


<br>


<!--- payoff --->
<form action="../admin_area/vendor_assign_payoff.cfm" method="post" name="payoff_form" ID="payoff_form">
<input type="hidden" name="order_id" value="<cfoutput>#read_title.title_id#</cfoutput>">
<input type="hidden" name="order_type" value="<cfoutput>#url.order_type#</cfoutput>">
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="sale_table" style="display:block;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="850">
<tr><td bgcolor="#FFFFFF" width="650" align="left" valign="middle"><strong><font size=2>PAYOFFS</font></strong></td>
<td bgcolor="#FFFFFF" width="50" align="center" valign="middle"><font size=2>history</font></td></tr>
<tr><td colspan="4" bgcolor="#FFFFFF" align="right">


<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="850">
<tr>
<td align="left" valign="top" width="195" rowspan="2" bgcolor="#FFFFFF"><br>
<strong><font color="#000000">Current Status</font></strong>:<br>
<cfif read_assigned_payoff.recordcount>
<cfif read_assigned_payoff.completed eq 1>
<font color="green"><strong>COMPLETED</strong></font> by:<BR>
<CFELSE>
<font color="blue"><strong>ASSIGNED</strong></font> to:<BR>
</cfif>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_assigned_payoff.company#</cfoutput><br><BR>
<strong>Assigned Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_payoff.assign_date, "mm/dd/yyyy")# #timeFormat(read_assigned_payoff.assign_time, "h:mm tt")#</cfoutput><br><BR>
<cfif read_assigned_payoff.completed eq 1>
<strong>Completed Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_payoff.return_date, "mm/dd/yyyy")#  #timeFormat(read_assigned_payoff.return_time, "h:mm tt")#</cfoutput><br><BR>
</cfif>
<strong>Assigned By</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_payoff_assigned_by.fname# #read_payoff_assigned_by.lname#<br><br></cfoutput>
<cfelse>
Unassigned<BR><BR>
</cfif>
</td>
<td bgcolor="#FFFFFF" colspan=4 align="left" valign="middle"><font size=2><cfif read_assigned_payoff.recordcount>RE-</cfif>ASSIGN THIS FILE</font></td></tr>
<tr>
<td bgcolor="#CCCCCC" width="450" align="left" valign="middle"><SELECT NAME="vendor_id"
										size="1"
										style=" text-align:right;
				width: 400px;" onchange="document.payoff_form.submit();">
				<OPTION VALUE="" selected>To <cfif read_assigned_payoff.recordcount>re-</cfif>assign this file's tax preparation work, select a Vendor here</OPTION>
<cfif read_payoff.recordcount>
<cfoutput query="read_payoff">
					<OPTION VALUE="#read_payoff.vendor_id#" <cfif url.selected_payoff_vendor_id eq read_payoff.vendor_id>selected</cfif>>#read_payoff.Company#</OPTION>
</cfoutput>
</cfif>
					</select>
<br><br><br><br><br><br><br>

</td>
<td bgcolor="#CCCCCC" width="150" align="left" valign="top">$<input type=text name="payoff_price" id="payoff_price" VALUE="" size=3 maxlength=22

				style="text-align:right;">&nbsp;<input type="hidden" name="payoff_commit" value="0"><input type="button" value="<cfif read_assigned_payoff.recordcount>RE-ASSIGN<cfelse>ASSIGN</cfif>" onclick="document.payoff_form.payoff_commit.value=1;document.payoff_form.submit();"><br>
&nbsp;&nbsp;&nbsp;<strong>price</strong></td>
</tr>
</table>
</td></tr>
</table>
</td>
</tr>
</table>
</form>

<cfif url.selected_payoff_vendor_id neq 0>
<CFQUERY datasource="#request.dsn#" NAME="read_payoff_pricing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'Payoff' and s.service_type LIKE '%Payoff%')
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'Payoff' and s.service_type LIKE '%Payoff%')
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'Payoff' and s.service_type LIKE '%Payoff%')
			 and p.vendor_id = s.vendor_id
			 and p.vendor_id = #url.selected_payoff_vendor_id#
</CFQUERY>

<cfoutput>
<script language="javascript">
document.payoff_form.payoff_price.value = #read_payoff_pricing.payoff_fee#;
</script>
</cfoutput>
</cfif>

<!--- END payoff --->


<br>


<!--- deedprep --->
<form action="../admin_area/vendor_assign_deedprep.cfm" method="post" name="deedprep_form" ID="deedprep_form">
<input type="hidden" name="order_id" value="<cfoutput>#read_title.title_id#</cfoutput>">
<input type="hidden" name="order_type" value="<cfoutput>#url.order_type#</cfoutput>">
<table cellspacing="1" cellpadding="0" bgcolor="#000000" id="sale_table" style="display:block;">
<tr><td align="left" valign="middle">
<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="850">
<tr><td bgcolor="#FFFFFF" width="650" align="left" valign="middle"><strong><font size=2>DEED PREPARATION</font></strong></td>
<td bgcolor="#FFFFFF" width="50" align="center" valign="middle"><font size=2>history</font></td></tr>
<tr><td colspan="4" bgcolor="#FFFFFF" align="right">


<table cellspacing="1" cellpadding="1" bgcolor="#000000" width="850">
<tr>
<td align="left" valign="top" width="195" rowspan="2" bgcolor="#FFFFFF"><br>
<strong><font color="#000000">Current Status</font></strong>:<br>
<cfif read_assigned_deedprep.recordcount>
<cfif read_assigned_deedprep.completed eq 1>
<font color="green"><strong>COMPLETED</strong></font> by:<BR>
<CFELSE>
<font color="blue"><strong>ASSIGNED</strong></font> to:<BR>
</cfif>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_assigned_deedprep.company#</cfoutput><br><BR>
<strong>Assigned Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_deedprep.assign_date, "mm/dd/yyyy")# #timeFormat(read_assigned_deedprep.assign_time, "h:mm tt")#</cfoutput><br><BR>
<cfif read_assigned_deedprep.completed eq 1>
<strong>Completed Date/Time</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#DateFormat(read_assigned_deedprep.return_date, "mm/dd/yyyy")#  #timeFormat(read_assigned_deedprep.return_time, "h:mm tt")#</cfoutput><br><BR>
</cfif>
<strong>Assigned By</strong>:<br>
&nbsp;&nbsp;&nbsp;- <cfoutput>#read_deedprep_assigned_by.fname# #read_deedprep_assigned_by.lname#<br><br></cfoutput>
<cfelse>
Unassigned<BR><BR>
</cfif>
</td>
<td bgcolor="#FFFFFF" colspan=4 align="left" valign="middle"><font size=2><cfif read_assigned_deedprep.recordcount>RE-</cfif>ASSIGN THIS FILE</font></td></tr>
<tr>
<td bgcolor="#CCCCCC" width="450" align="left" valign="middle"><SELECT NAME="vendor_id"
										size="1"
										style=" text-align:right;
				width: 400px;" onchange="document.deedprep_form.submit();">
				<OPTION VALUE="" selected>To <cfif read_assigned_deedprep.recordcount>re-</cfif>assign this file's tax preparation work, select a Vendor here</OPTION>
<cfif read_deedprep.recordcount>
<cfoutput query="read_deedprep">
					<OPTION VALUE="#read_deedprep.vendor_id#" <cfif url.selected_deedprep_vendor_id eq read_deedprep.vendor_id>selected</cfif>>#read_deedprep.Company#</OPTION>
</cfoutput>
</cfif>
					</select>
<br><br><br><br><br><br><br>

</td>
<td bgcolor="#CCCCCC" width="150" align="left" valign="top">$<input type=text name="deedprep_price" id="deedprep_price" VALUE="" size=3 maxlength=22

				style="text-align:right;">&nbsp;<input type="hidden" name="deedprep_commit" value="0"><input type="button" value="<cfif read_assigned_deedprep.recordcount>RE-ASSIGN<cfelse>ASSIGN</cfif>" onclick="document.deedprep_form.deedprep_commit.value=1;document.deedprep_form.submit();"><br>
&nbsp;&nbsp;&nbsp;<strong>price</strong></td>
</tr>
</table>
</td></tr>
</table>
</td>
</tr>
</table>
</form>

<cfif url.selected_deedprep_vendor_id neq 0>
<CFQUERY datasource="#request.dsn#" NAME="read_deedprep_pricing">
			Select * from Vendor_Pricing p, Vendors_Stacie s
			where (p.state = '#read_title.pstate#' and p.county = '#read_title.pcounty#'
			and p.service_type = 'deedprep' and s.service_type LIKE '%deedprep%')
			or (p.state = '#read_title.pstate#' and p.county = 'All'
			and p.service_type = 'deedprep' and s.service_type LIKE '%deedprep%')
			or (p.state = 'ALL' and p.county = 'All'
			and p.service_type = 'deedprep' and s.service_type LIKE '%deedprep%')
			 and p.vendor_id = s.vendor_id
			 and p.vendor_id = #url.selected_deedprep_vendor_id#
</CFQUERY>

<cfoutput>
<script language="javascript">
document.deedprep_form.deedprep_price.value = #read_deedprep_pricing.deedprep_fee#;
</script>
</cfoutput>
</cfif>

<!--- END deedprep --->

</body>
</html>
