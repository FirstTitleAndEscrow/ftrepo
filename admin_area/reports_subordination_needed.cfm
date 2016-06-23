<CFPARAM NAME="a_fname" DEFAULT="">
<CFPARAM NAME="a_lname" DEFAULT="">
<CFPARAM NAME="a_user" DEFAULT="">
<CFPARAM NAME="a_date" DEFAULT="">
<CFPARAM NAME="a_time" DEFAULT="">
<CFPARAM NAME="a_ip" DEFAULT="">
<CFPARAM NAME="vendor" DEFAULT="">
<CFPARAM NAME="calendar" DEFAULT="">
<CFPARAM NAME="order" DEFAULT="">
<CFPARAM NAME="excel" DEFAULT="0">
<CFPARAM NAME="url.remove_this" DEFAULT="0">
<CFPARAM NAME="url.type" DEFAULT="T">
<CFPARAM NAME="url.sub_rec" DEFAULT="0">
<cfset ri_employee = 0>
<CFQUERY datasource="#request.dsn#" NAME="read_user">
select *
from first_admin
where ID = #session.ft_user_id#
</CFQUERY>
<cfif read_user.va_employee eq 'True'>
<cfset ri_employee = 1>
</cfif>
<cfif read_user.ft_fairfax_employee eq 'True'>
<cfset fx_employee = 1>
</cfif>

<cfif url.remove_this neq '0'>

<cfif url.type eq 'T'>

<cfif url.sub_rec eq 'R'>
<CFQUERY datasource="#request.dsn#">
						INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type)
						VALUES('#read_user.FName#', '#read_user.LName#', #URL.remove_this#,'Subordination Received', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T')
					</CFQUERY>
<CFQUERY DATASOURCE="#request.dsn#" NAME="set_received">
	update tax_cert_title
	set subordination_received = 1
    WHERE title_ID = #url.remove_this#
</CFQUERY>

<cfelseif url.sub_rec eq 'L'>

<CFQUERY datasource="#request.dsn#">
						INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type)
						VALUES('#read_user.FName#', '#read_user.LName#', #URL.remove_this#,'Lender Ordering Sub', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T')
					</CFQUERY>
<CFQUERY DATASOURCE="#request.dsn#" NAME="set_received">
	update tax_cert_title
	set lender_to_order_sub = 1
    WHERE title_ID = #url.remove_this#
</CFQUERY>
</cfif>
</cfif>

<cfif url.type eq 'P'>
<cfif url.sub_rec eq 'R'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="set_received">
	update tax_cert_prop
	set subordination_received = 1
    WHERE prop_ID = #url.remove_this#
</CFQUERY>
<CFQUERY datasource="#request.dsn#">
						INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type)
						VALUES('#read_user.FName#', '#read_user.LName#', #URL.remove_this#,'Subordination Received', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'P')
					</CFQUERY>


<cfelseif url.sub_rec eq 'L'>
<CFQUERY DATASOURCE="#request.dsn#" NAME="set_received">
	update tax_cert_prop
	set subordination_received = 1
    WHERE prop_ID = #url.remove_this#
</CFQUERY>
<CFQUERY datasource="#request.dsn#">
						INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type)
						VALUES('#read_user.FName#', '#read_user.LName#', #URL.remove_this#,'Subordination Received', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'P')
					</CFQUERY>


</cfif>
</cfif>

</cfif>


<!---d3d3d3--->
<CFSET a_bgcolor = "d3d3d3">
<CFSET a_color_trigger = "1">



<cfoutput>
<cfif #excel# EQ 1>
	<cfset filename = "file.xls">
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
<title>Subordination Needed</title>
<script language="javascript">

function to_excel() {
document.excel_form.submit();
}
</script>

</head>
<body>



<CFQUERY datasource="#request.dsn#" NAME="get_files">
SELECT    t.title_id, t.order_date, c.company, t.pstate, t.SearchType, t.bfirstname1, t.blastname1, x.subordination_date
FROM     title t, companies c, tax_cert_title x
where 
t.cancelled IS NULL
and x.subordination_need = 1 and (x.subordination_received is NULL or x.subordination_received = '' or x.subordination_received = 0) and (x.lender_to_order_sub is NULL or x.lender_to_order_sub = '' or x.lender_to_order_sub = 0)
<cfif session.ft_user_id eq 462 or read_user.fairfax_admin eq 1>
and c.fairfax_client = 1
</cfif>
and t.comp_id = c.ID
and t.title_id = x.title_id
order by x.subordination_date
</cfquery>


<CFQUERY datasource="#request.dsn#" NAME="get_files2">
SELECT    t.prop_id, t.order_date, c.company, t.pstate, t.SearchType, t.bfirstname1, t.blastname1
FROM     property t, companies c, tax_cert_prop x
where 
t.cancelled IS NULL
and x.subordination_need = 1 and (x.subordination_received is NULL or x.subordination_received = '' or x.subordination_received = 0) and (x.lender_to_order_sub is NULL or x.lender_to_order_sub = '' or x.lender_to_order_sub = 0)
<cfif session.ft_user_id eq 462 or read_user.fairfax_admin eq 1>
and c.fairfax_client = 1
</cfif>
and t.comp_id = c.ID
and t.prop_id = x.prop_id
</cfquery>


<cfoutput>
<form name="excel_form" action="reports_subordination_needed.cfm?uid=#URL.uid#&al=#URL.al#" method="post">
<input type="hidden" name="excel" value="1">
</form>
</cfoutput>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="excel_submit" type="button" onclick="to_excel();" value="EXPORT TO EXCEL"><br>




<cfoutput>
<TABLE cellSpacing=1 cellPadding=1 width="1000" align="Center">
	<tr>
		<td align="center"
              colspan= 6
            width="100%">
			<B>Subordination Needed</B><br>
<br>

		</td>
	</tr>
	<tr>
		<td width=100 align="left" valign="top"><font size=2 color=black face=verdana><b>Order Num</b></font></td>
		<td width=100 align="left" valign="top"><font size=2 color=black face=verdana><b>Borrower</b></font></td>
		<td  width=300 align="left" valign="top"><font size=2 color=black face=verdana><b>Company Name</b></font></td>
		<td  width=100 align="left" valign="top"><font size=2 color=black face=verdana><b>Sub-Needed Date</b></font></td>
		<td  width=200 align="left" valign="top"><font size=2 color=black face=verdana><b>&nbsp;</b></font></td>
		<td  width=200 align="left" valign="top"><font size=2 color=black face=verdana><b>&nbsp;</b></font></td>
	</tr>
	</cfoutput>
<CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="get_files">
<cfset richmond = 0>
<CFQUERY datasource="#request.dsn#" NAME="get_va">
select f.va_employee
from first_admin f, Companies c, title t
where 
t.title_id = #get_files.title_id#
and c.id = t.comp_id
and f.id = c.intsales
</CFQUERY>
<cfif get_va.va_employee eq 'True'>
<cfset richmond = 1>
</cfif>



<cfset fx = 0>
<CFQUERY datasource="#request.dsn#" NAME="get_fx">
select f.ft_fairfax_employee
from first_admin f, Companies c, title t
where 
t.title_id = #get_files.title_id#
and c.id = t.comp_id
and f.id = c.intsales
</CFQUERY>
<cfif get_fx.ft_fairfax_employee eq 'True'>
<cfset fx = 1>
</cfif>


<cfset a_color_temp = a_bgcolor>
<cfif get_files.SearchType eq 'Purchase'>
<cfset a_bgcolor="FFCC66">
<cfelse>
<cfset a_bgcolor = a_color_temp>
</cfif>
<cfif richmond eq 1 or (richmond eq 0 and ri_employee eq 0)>
   <tr>
			<td bgcolor="#a_bgcolor#" width=100><a href="title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#get_files.title_id#&a_trigger=1" target="_blank"><font color=blue face=verdana>T-#get_files.title_id# <cfif richmond eq 1>(R)</cfif></font></a></td>
		<td  width=100 bgcolor="#a_bgcolor#" align="left" valign="top"><font size=2 color=black face=verdana><b>
			#get_files.blastname1#, #get_files.bfirstname1#</b></font></td>
		<td  width=300 bgcolor="#a_bgcolor#" align="left" valign="top"><font size=2 color=black face=verdana><b>
		    #get_files.company#</b></font></td>
		<td  width=100 bgcolor="#a_bgcolor#" align="left" valign="top"><font size=2 color=black face=verdana><b>
		    #DateFormat(get_files.subordination_date, "m/d/yyyy")#</b></font></td>
		<td  width=200 bgcolor="#a_bgcolor#" align="left" valign="top"><font size=2 color=black face=verdana><b>
			<a href="reports_subordination_needed.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&remove_this=#get_files.title_id#&type=T&sub_rec=R" target="_blank">mark as received</b></font></td>
		<td  width=200 bgcolor="#a_bgcolor#" align="left" valign="top"><font size=2 color=black face=verdana><b>
			<a href="reports_subordination_needed.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&remove_this=#get_files.title_id#&type=T&sub_rec=L" target="_blank">lender will order sub</b></font></td>
	</tr>
	<CFIF #a_color_trigger# eq "1">
		<CFSET a_bgcolor = "white">
		<CFSET a_color_trigger = "2">
	<CFELSE>
		<CFSET a_bgcolor = "d3d3d3">
		<CFSET a_color_trigger = "1">
	</CFIF>
</cfif>
</CFOUTPUT>


<!--- <CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="get_files2">
<cfset a_color_temp = a_bgcolor>
<cfif get_files2.SearchType eq 'Purchase'>
<cfset a_bgcolor="FFCC66">
<cfelse>
<cfset a_bgcolor = a_color_temp>
</cfif>
    <tr>
			<td bgcolor="#a_bgcolor#" width=100><a href="prop_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#get_files2.prop_id#&a_trigger=1" target="_blank"><font color=blue face=verdana>T-#get_files2.title_id#</font></a></td>
		<td  width=100 bgcolor="#a_bgcolor#" align="left" valign="top"><font size=2 color=black face=verdana><b>
			#get_files2.blastname1#, #get_files2.bfirstname1#</b></font></td>
		<td  width=100 bgcolor="#a_bgcolor#" align="left" valign="top"><font size=2 color=black face=verdana><b>
			#DateFormat(get_files2.order_date, "m/d/yyyy")#</b></font></td>
		<td  width=300 bgcolor="#a_bgcolor#" align="left" valign="top"><font size=2 color=black face=verdana><b>
		    #get_files2.company#</b></font></td>
		<td  width=100 bgcolor="#a_bgcolor#" align="left" valign="top"><font size=2 color=black face=verdana><b>
		    #get_files2.pstate#</b></font></td>
		<td  width=100 bgcolor="#a_bgcolor#" align="left" valign="top"><font size=2 color=black face=verdana><b>
			<a href="reports_subordination_needed.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&remove_this=#get_files2.prop_id#&type=P" target="_blank">mark as received</b></font></td>
	</tr>
	<CFIF #a_color_trigger# eq "1">
		<CFSET a_bgcolor = "white">
		<CFSET a_color_trigger = "2">
	<CFELSE>
		<CFSET a_bgcolor = "d3d3d3">
		<CFSET a_color_trigger = "1">
	</CFIF>
</CFOUTPUT> --->

</body>
</html>
