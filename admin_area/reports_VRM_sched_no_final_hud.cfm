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



<CFQUERY datasource="#request.dsn#" NAME="get_recs">
select * 
from title t, eventlist e, doc_closer_title d
where t.comp_id IN (#comp_ids#) and t.cancelled is NULL
and e.cl_dateandtime is NULL and e.fl_dateandtime is NULL
and d.final_HUD is NULL
and e.sc_dateandtime is NOT NULL
and 
e.title_id = t.title_id 
and d.title_id = t.title_id
</CFQUERY>

<center>
<span class="large_header"><strong>Secretary of Veteran Affairs<br>
Closing Scheduled - No Final HUD Uploaded</strong></span><br>

<!--- <b>Files in RED are past due (due in 3 business days)</b> --->
<table border=1 cellspacing=2 cellpadding=2 class="table_border">
<tr>
<td align="left" valign="bottom"><strong>Title_id</strong></td>
<td align="left" valign="bottom"><strong>Address</strong></td>
<td align="left" valign="bottom"><strong>State</strong></td>
<td align="left" valign="bottom" width=150><strong>County</strong></td>
<td align="left" valign="bottom" width=150><strong>Date Opened</strong></td>
<td align="left" valign="bottom" width=150><strong>Closing Scheduled Date</strong></td>
</tr>


<cfif get_recs.recordcount>
<cfoutput query="get_recs">
<!--- <cfset past_due = 0>
<cfset ord_date = get_recs.title_package_upload_date>
<cfset due_date = DateAdd("w", 3, title_package_upload_date)>
<cfif DateDiff("d",title_package_upload_date,due_date) gt 0>
<cfset past_due = 1>
</cfif> --->

	<!--- <cfif past_due EQ 1>
		<cfset fontcolor='FF3300'>
	<cfelse>
		<cfset fontcolor='000000'>
	</cfif> --->
		<cfset fontcolor='000000'>

	<cfset bgcolor = 'efefef'>
		<tr bgcolor="#bgcolor#">
		<td><a href="title_report_nav.cfm?uid=56&al=1&rec_id=#title_id#&company_id=0&code=T" target="_new"><font color="#fontcolor#">T-#title_id#</font></a></td>
		<td>#paddress#</td>
		<td>#pstate#</td>
		<td width=150>#pcounty#</td>
		<td width=150>#DateFormat(order_date, "mm/dd/yyyy")#</td>
		<td width=150>#DateFormat(sc_dateandtime, "mm/dd/yyyy")# #TimeFormat(sc_dateandtime)#</td>
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



