<style>
.table_header {font-family:Arial, Helvetica, sans-serif; font-size:13px}
.table_border {border-style:solid; border-color:#000000; border-width:thin;}
td {font-family:Arial, Helvetica, sans-serif; font-size: 12px;}
.large_header {font-family:Arial, Helvetica, sans-serif; font-size: 16px;}
</style>


<CFQUERY datasource="#request.dsn#" NAME="get_recs">
select t.*,l.titlepol,l.l_date, fa.va_employee,c.streamline_client, c.company, fa.ft_fairfax_employee
from title t
inner join eventlist l on l.title_id = t.title_id
inner join companies c on c.id = t.comp_id
inner join first_admin fa on fa.id = c.intsales
where t.appraisal_status = 'Loan Funded'
AND t.order_date_adjusted > '#DateFormat(DateAdd("m","-6",Now()),"mm/dd/yyyy")#'
AND l_date <> ''
order by t.title_id desc
</CFQUERY>

<cfquery dbtype="query" name="getft">
	select * from get_recs where streamline_client <> 1
</cfquery>

<cfquery dbtype="query" name="getstreamline">
	select * from get_recs where streamline_client = 1
</cfquery>

<center>
<span class="large_header"><strong>Order Aging Report</strong></span><br>
<!---Chase/RealEC files marked in RED<br>--->
<br>
<b>First Title Orders</b>
<table border=1 cellspacing=2 cellpadding=2 class="table_border">
<tr>
<td align="left" valign="bottom"><strong>Title_id</strong></td>
<td align="left" valign="bottom"><strong>State</strong></td>
<td align="left" valign="bottom"><strong>Client</strong></td>
<td align="left" valign="bottom"><strong>Borrower</strong></td>
<td align="left" valign="bottom"><strong>Order Date</strong></td>
<td align="left" valign="bottom"><strong>Funded Date</strong></td>
<td align="left" valign="bottom"><strong>Time Order To Funded</strong></td>
</tr>


<cfif getft.recordcount>
<cfoutput query="getft">
	<cfset bgcolor = 'efefef'>
	<cfif get_recs.realec_transactionid eq '' or get_recs.realec_transactionid eq 'NULL' OR 1 EQ 1>
	<cfset bgcolor = bgcolor>
    <cfelse>
	<cfset bgcolor = 'FF3300'>
	</cfif>
		<tr bgcolor="#bgcolor#">
		<td><a href="title_report_nav.cfm?uid=56&al=1&rec_id=#title_id#&company_id=0&code=T"><cfif va_employee EQ 1>R-<cfelseif ft_fairfax_employee EQ 1>FX-<cfelse>T-</cfif>#title_id#</a></td>
		<td>#pstate#</td>
		<td>#company#</td>
		<td>#blastname1#, #bfirstname1# <cfif Len(bminame1)>#bminame1#.</cfif></td>
		<td>#DateFormat(a_insert_date,"mm/dd/yyyy")#</td>
		<td>#DateFormat(l_date,"mm/dd/yyyy")#</td>
		<td>#DateDiff("d",a_insert_date,l_date)# days</td>
		</tr>
		<cfif bgcolor eq 'efefef'>
			<cfset bgcolor = 'ffffff'>
			<cfelse>
			<cfset bgcolor = 'efefef'>
		</cfif>
</cfoutput>
</cfif>
</table>
<br><br>
<b>Streamline Orders</b>
<table border=1 cellspacing=2 cellpadding=2 class="table_border">
<cfif getstreamline.recordcount>
<cfoutput query="getstreamline">
	<cfset bgcolor = 'efefef'>
	<cfif get_recs.realec_transactionid eq '' or get_recs.realec_transactionid eq 'NULL' OR 1 EQ 1>
	<cfset bgcolor = bgcolor>
    <cfelse>
	<cfset bgcolor = 'FF3300'>
	</cfif>
		<tr bgcolor="#bgcolor#">
		<td><a href="title_report_nav.cfm?uid=56&al=1&rec_id=#title_id#&company_id=0&code=T"><cfif va_employee EQ 1>R-<cfelseif ft_fairfax_employee EQ 1>FX-<cfelse>T-</cfif>#title_id#</a></td>
		<td>#pstate#</td>
		<td>#company#</td>
		<td>#blastname1#, #bfirstname1# <cfif Len(bminame1)>#bminame1#.</cfif></td>
		<td>#DateFormat(a_insert_date,"mm/dd/yyyy")#</td>
		<td>#DateFormat(l_date,"mm/dd/yyyy")#</td>
		<td>#DateDiff("d",a_insert_date,l_date)# days</td>
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



