<style>
.table_header {font-family:Arial, Helvetica, sans-serif; font-size:13px}
.table_border {border-style:solid; border-color:#000000; border-width:thin;}
td {font-family:Arial, Helvetica, sans-serif; font-size: 12px;}
.large_header {font-family:Arial, Helvetica, sans-serif; font-size: 16px;}
</style>

<CFQUERY datasource="#request.dsn#" NAME="get_IDs">
SELECT     ID, company
FROM         Companies
WHERE     (company LIKE 'Secretary of Veterans Affairs%')
</CFQUERY>
<cfset comp_ids = ValueList(get_ids.ID, ",")>



<CFQUERY datasource="#request.dsn#" NAME="find_notes">
select * 
from title t, title_notes n
where t.comp_id IN (#comp_ids#) and t.cancelled is NULL
and n.N_Note = 'Loan Closed-Seller Rep'
and n.order_id = t.title_id 
</CFQUERY>
<cfset closed_list = ValueList(find_notes.order_id, ",")>


<CFQUERY datasource="#request.dsn#" NAME="get_recs">
select * 
from title t, eventlist e
where t.title_id in (#closed_list#)
and t.btc_closing_package_upload is NULL
and t.btc_closing_package_upload_date is NULL
and e.title_id = t.title_id
</CFQUERY>

<center>
<span class="large_header"><strong>Secretary of Veteran Affairs<br>
Loan Closed-Seller Rep - No BTC CLosing Package</strong></span><br>

<!--- <b>Files in RED are past due (due in 3 business days)</b> --->
<table border=1 cellspacing=2 cellpadding=2 class="table_border">
<tr>
<td align="left" valign="bottom"><strong>Title_id</strong></td>
<td align="left" valign="bottom"><strong>Address</strong></td>
<td align="left" valign="bottom"><strong>State</strong></td>
<td align="left" valign="bottom" width=150><strong>County</strong></td>
<td align="left" valign="bottom" width=150><strong>Date Opened</strong></td>
<td align="left" valign="bottom" width=150><strong>Date Closed</strong></td>
<td align="left" valign="bottom" width=150><strong>BTC Package Due</strong></td>
</tr>


<cfif get_recs.recordcount>
<cfoutput query="get_recs">
<cfset due_date = DateAdd("w", 1, cl_dateandtime)>
<cfset past_due = 0>

<cfif DateDiff("d",due_date,Now()) gt 0>
<cfset past_due = 1>
</cfif> 

	<cfif past_due EQ 1>
		<cfset fontcolor='FF3300'>
	<cfelse>
		<cfset fontcolor='000000'>
	</cfif>

	<cfset bgcolor = 'efefef'>
		<tr bgcolor="#bgcolor#">
		<td><a href="title_report_nav.cfm?uid=56&al=1&rec_id=#title_id#&company_id=0&code=T" target="_new"><font color="#fontcolor#">T-#title_id#</font></a></td>
		<td>#paddress#</td>
		<td>#pstate#</td>
		<td width=150>#pcounty#</td>
		<td width=150>#DateFormat(order_date, "mm/dd/yyyy")#</td>
		<td width=150>#DateFormat(cl_dateandtime, "mm/dd/yyyy")# #TimeFormat(cl_dateandtime)#</td>
		<td width=150>#DateFormat(due_date, "mm/dd/yyyy")# #TimeFormat(due_date)#</td>
		</tr>
		<cfif bgcolor eq 'efefef'>
			<cfset bgcolor = 'ffffff'>
			<cfelse>
			<cfset bgcolor = 'efefef'>
		</cfif>
</cfoutput>
</cfif>


</table>
</center>

<br>
<br>
<br>



