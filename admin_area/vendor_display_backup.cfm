<cfset read_title.pstate = 'MD'>
<cfset read_title.pcounty = 'Baltimore'>
<cfset read_title.title_id = '12345'>
<cfset url.order_type = 'T'>

<cfparam name="url.selected_abstract_vendor_id" default=0>
<cfparam name="url.selected_typing_vendor_id" default=0>

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
<cfoutput><script language="javascript">
function fill_abstractor_prices() {
var bring_to_date_price = #read_abstractor_pricing.bring_to_date#;
var two_owner_price = #read_abstractor_pricing.two_owner#;
var twenty_year_price = #read_abstractor_pricing.twenty_year#;
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
document.abstractor_form.abstract_price.value = twenty_year_price;
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
<cfcase value="twenty_year">
<cfset the_product = "Twenty Year Search">
</cfcase>
<cfcase value="two_owner">
<cfset the_product = "Two Owner Search">
</cfcase>
</cfswitch>
</cfif>



<!--- TYPING --->
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
alert(document.abstractor_form.abstract_price.value);
</script>
</cfoutput>
</cfif>


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
<!--- <cfset found_typing = "">
<cfif read_typing.recordcount neq 0>
<cfset found_typing = ValueList(read_typing.vendor_id, ",")>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_typing">
			Select * from Vendors_Stacie
			where vendor_id IN (#found_typing#)
			and status = 1
			order by company
</CFQUERY>
 ---><CFQUERY datasource="#request.dsn#" NAME="read_assigned_typing" maxrows="1">
			Select * from Vendor_Tracker_new v, Vendors_Stacie s
			where v.order_id = #read_title.title_id#
			and v.task = 'Typing'
			and v.vendor_id = s.vendor_id
			order by v.ID DESC, v.assign_date
</CFQUERY>
<!--- END TYPING --->



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
<td bgcolor="#CCCCCC" width="106" align="left" valign="middle"><strong><font color="#000000">Abstract</font></strong>&nbsp;<cfif read_assigned_abstract.recordcount eq 0><img src="../admin_area/images/ind_open.gif" width=17 height=17><cfelseif read_assigned_abstract.completed eq 1><img src="../admin_area/images/ind_closed.gif" width=17 height=17><cfelse><img src="../admin_area/images/ind_started.gif" width=17 height=17></cfif></td>
<td bgcolor="#CCCCCC" width="106" align="left" valign="middle">Appraisal</font></strong>&nbsp;<img src="../admin_area/images/ind_open.gif" width=17 height=17></td>
<td bgcolor="#CCCCCC" width="106" align="left" valign="middle"><strong><font color="#000000">Closing Req.</font></strong>&nbsp;<img src="../admin_area/images/ind_open.gif" width=17 height=17></td>
<td bgcolor="#CCCCCC" width="106" align="left" valign="middle"><strong><font color="#000000">Closing Sched.</font></strong>&nbsp;<img src="../admin_area/images/ind_open.gif" width=17 height=17></td>
<td bgcolor="#CCCCCC" width="106" align="left" valign="middle"><strong><font color="#000000">Tax Prep</font></strong>&nbsp;<img src="../admin_area/images/ind_open.gif" width=17 height=17></td>
<td bgcolor="#CCCCCC" width="106" align="left" valign="middle"><strong><font color="#000000">ICL</font></strong>&nbsp;<img src="../admin_area/images/ind_open.gif" width=17 height=17></td>
<td bgcolor="#CCCCCC" width="106" align="left" valign="middle"><strong><font color="#000000">Payoffs</font></strong>&nbsp;<img src="../admin_area/images/ind_open.gif" width=17 height=17></td>
<td bgcolor="#CCCCCC" width="106" align="left" valign="middle"><strong><font color="#000000">Deed Prep</font></strong>&nbsp;<img src="../admin_area/images/ind_open.gif" width=17 height=17></td>
<td bgcolor="#CCCCCC" width="106" align="left" valign="middle"><strong><font color="#000000">Typing</font></strong>&nbsp;<img src="../admin_area/images/ind_open.gif" width=17 height=17></td>
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
<td bgcolor="#FFFFFF" colspan=4 align="left" valign="middle"><font size=2><cfif read_assigned_abstract.recordcount>RE-ASSIGN THIS FILE<cfelse>ASSIGN THIS FILE</cfif></font></td></tr>
<tr>
<td bgcolor="#CCCCCC" width="450" align="left" valign="middle"><SELECT NAME="vendor_id"
										size="1"
										style=" text-align:right;
				width: 400px;" onchange="document.abstractor_form.submit();">
				<OPTION VALUE="" selected></OPTION>
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
<input type="radio" name="product_ordered" value="twenty_year" onclick="fill_abstractor_prices();">Twenty Year Search<br>
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
<td bgcolor="#FFFFFF" colspan=4 align="left" valign="middle"><font size=2><cfif read_assigned_typing.recordcount>RE-ASSIGN THIS FILE<cfelse>ASSIGN THIS FILE</cfif></font></td></tr>
<tr>
<td bgcolor="#CCCCCC" width="450" align="left" valign="middle"><SELECT NAME="vendor_id"
										size="1"
										style=" text-align:right;
				width: 400px;" onchange="document.typing_form.submit();">
				<OPTION VALUE="" selected></OPTION>
<cfif read_typing.recordcount>
<cfoutput query="read_typing">
					<OPTION VALUE="#read_typing.vendor_id#" <cfif url.selected_typing_vendor_id eq read_typing.vendor_id>selected</cfif>>#read_typing.Company#</OPTION>
</cfoutput>
</cfif>
					</select>
<br>

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
<!--- END TYPING --->
</body>
</html>
