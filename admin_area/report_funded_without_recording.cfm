<style>
.table_header {font-family:Arial, Helvetica, sans-serif; font-size:13px}
.table_border {border-style:solid; border-color:#000000; border-width:thin;}
td {font-family:Arial, Helvetica, sans-serif; font-size: 12px;}
.large_header {font-family:Arial, Helvetica, sans-serif; font-size: 16px;}
</style>


<CFQUERY datasource="#request.dsn#" NAME="get_recs">
select t.*,l.titlepol,l.l_date, fa.va_employee, fa.ft_fairfax_employee
from title t
inner join eventlist l on l.title_id = t.title_id
inner join companies c on c.id = t.comp_id
inner join first_admin fa on fa.id = c.intsales
where l.mortrec is null 
AND t.appraisal_status = 'Loan Funded'
AND t.order_date_adjusted > '1/1/2013'
order by t.title_id desc
</CFQUERY>

<center>
<span class="large_header"><strong>Loan Funded - Without Mortgage Recording</strong></span><br>
Chase/RealEC files marked in RED<br>
<br>

<table border=1 cellspacing=2 cellpadding=2 class="table_border">
<tr>
<td align="left" valign="bottom"><strong>Title_id</strong></td>
<td align="left" valign="bottom"><strong>Address</strong></td>
<td align="left" valign="bottom"><strong>State</strong></td>
<td align="left" valign="bottom" width=150><strong>County</strong></td>
<td align="left" valign="bottom"><strong>Borrower</strong></td>
<td align="left" valign="bottom"><strong>Funded Date</strong></td>
</tr>


<cfif get_recs.recordcount>
<cfoutput query="get_recs">
	<cfset bgcolor = 'efefef'>
	<cfif get_recs.realec_transactionid eq '' or get_recs.realec_transactionid eq 'NULL'>
	<cfset bgcolor = bgcolor>
    <cfelse>
	<cfset bgcolor = 'FF3300'>
	</cfif>
		<tr bgcolor="#bgcolor#">
		<td><a href="title_report_nav.cfm?uid=56&al=1&rec_id=#title_id#&company_id=0&code=T"><cfif va_employee EQ 1>R-<cfelseif ft_fairfax_employee EQ 1>FX-<cfelse>T-</cfif>#title_id#</a></td>
		<td>#paddress#</td>
		<td>#pstate#</td>
		<td width=150>#pcounty#</td>
		<td>#blastname1#, #bfirstname1# <cfif Len(bminame1)>#bminame1#.</cfif></td>
		<td>#DateFormat(l_date,"mm/dd/yyyy")#</td>
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



