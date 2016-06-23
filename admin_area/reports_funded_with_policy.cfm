<style>
.table_header {font-family:Arial, Helvetica, sans-serif; font-size:13px}
.table_border {border-style:solid; border-color:#000000; border-width:thin;}
td {font-family:Arial, Helvetica, sans-serif; font-size: 12px;}
.large_header {font-family:Arial, Helvetica, sans-serif; font-size: 16px;}
</style>


<CFQUERY datasource="#request.dsn#" NAME="get_recs">
select t.*,l.titlepol, fa.va_employee, fa.ft_fairfax_employee
from title t
inner join eventlist l on l.title_id = t.title_id
inner join companies c on c.id = t.comp_id
inner join first_admin fa on fa.id = c.intsales
where l.titlepol is not null 
AND t.appraisal_status = 'Loan Funded'
AND t.order_date_adjusted > '1/1/2013'
order by t.title_id desc
</CFQUERY>

<center>
<span class="large_header"><strong>Loan Funded - With Title Policy</strong></span><br>
Chase/RealEC files marked in RED<br>
<br>

<table border=1 cellspacing=2 cellpadding=2 class="table_border">
<tr>
<td align="left" valign="bottom"><strong>Title_id</strong></td>
<td align="left" valign="bottom"><strong>Address</strong></td>
<td align="left" valign="bottom"><strong>City</strong></td>
<td align="left" valign="bottom"><strong>State</strong></td>
<td align="center" valign="bottom"><strong>Policy</strong></td>

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
		<td><strong><cfif va_employee EQ 1>R-<cfelseif ft_fairfax_employee EQ 1>FX-<cfelse>T-</cfif>#title_id#</strong></td>
		<td>#paddress#</td>
		<td>#pcity#</td>
		<td>#pstate#</td>
		<td><A HREF="#fileSys.FindFilePath('#titlepol#', 'url')#" target="new">#titlepol#</a></td>
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



