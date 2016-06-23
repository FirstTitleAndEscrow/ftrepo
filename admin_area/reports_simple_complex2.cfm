<style>
.table_header {font-family:Arial, Helvetica, sans-serif; font-size:13px}
.table_border {border-style:solid; border-color:#000000; border-width:thin;}
td {font-family:Arial, Helvetica, sans-serif; font-size: 12px;}
.large_header {font-family:Arial, Helvetica, sans-serif; font-size: 16px;}
</style>


<CFQUERY datasource="#request.dsn#" NAME="get_recs_simple">
select t.*, n.n_date as NOTE_DATE, n.n_note
from title t
inner join title_notes n on n.order_id = t.title_id
where t.cancelled IS NULL
and 
n.N_Note LIKE '%Issue Type: Simple%'
AND not exists
(
select * from title_notes where order_id = t.title_ID and N_Note = 'Clear to Close' and n_date > n.n_date
)
</CFQUERY>

<center>
<span class="large_header"><strong>Not Clear to Close - Simple Issues</strong></span><br>
Chase/RealEC files marked in RED<br>
<br>

<table border=1 cellspacing=2 cellpadding=2 class="table_border">
<tr>
<td align="left" valign="bottom"><strong>Title_id</strong></td>
<td align="left" valign="bottom"><strong>Address</strong></td>
<td align="left" valign="bottom"><strong>City</strong></td>
<td align="left" valign="bottom"><strong>State</strong></td>
<td align="center" valign="bottom"><strong>Issue</strong></td>
<td align="center" valign="bottom"><strong>Lender</strong></td>
<td align="center" valign="bottom"><strong>Note Date</strong></td>
</tr>


<cfif get_recs_simple.recordcount>
<cfoutput query="get_recs_simple">
	<cfset bgcolor = 'efefef'>
	<cfif get_recs_simple.realec_transactionid eq '' or get_recs_simple.realec_transactionid eq 'NULL'>
	<cfset bgcolor = bgcolor>
    <cfelse>
	<cfset bgcolor = 'FF3300'>
	</cfif>
		<tr bgcolor="#bgcolor#">
		<td><strong>#get_recs_simple.title_id#</strong></td>
		<td>#get_recs_simple.paddress#</td>
		<td>#get_recs_simple.pcity#</td>
		<td>#get_recs_simple.pstate#</td>
		<td>#get_recs_simple.N_NOTE#</td>
		<td>#get_recs_simple.insured#</td>
		<td>#DateFormat(get_recs_simple.NOTE_DATE, "m/d/yyyy")#</td>
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






	<CFQUERY datasource="#request.dsn#" NAME="get_recs_complex">
select t.*, n.n_date as NOTE_DATE, n.n_note
from title t
inner join title_notes n on n.order_id = t.title_id
where t.cancelled IS NULL
and 
n.N_Note LIKE '%Issue Type: Complex%'
AND not exists
(
select * from title_notes where order_id = t.title_ID and N_Note = 'Clear to Close' and n_date > n.n_date
)
    </CFQUERY>

<center>
<span class="large_header"><strong>Not Clear to Close - Complex Issues</strong></span><br>
Chase/RealEC files marked in RED<br>
<br>


<table border=1 cellspacing=2 cellpadding=2 class="table_border">
<tr>
<td align="left" valign="bottom"><strong>Title_id</strong></td>
<td align="left" valign="bottom"><strong>Address</strong></td>
<td align="left" valign="bottom"><strong>City</strong></td>
<td align="left" valign="bottom"><strong>State</strong></td>
<td align="center" valign="bottom"><strong>Issue</strong></td>
<td align="center" valign="bottom"><strong>Lender</strong></td>
<td align="center" valign="bottom"><strong>Note Date</strong></td>
</tr>


<cfif get_recs_complex.recordcount>
	<cfset bgcolor = 'efefef'>
	<cfoutput query="get_recs_complex">
	<cfif get_recs_complex.realec_transactionid eq '' or get_recs_complex.realec_transactionid eq 'NULL'>
	<cfset bgcolor = bgcolor>
    <cfelse>
	<cfset bgcolor = 'FF3300'>
	</cfif>
		<tr bgcolor="#bgcolor#">
		<td><strong>#get_recs_complex.title_id#</strong></td>
		<td>#get_recs_complex.paddress#</td>
		<td>#get_recs_complex.pcity#</td>
		<td>#get_recs_complex.pstate#</td>
		<td>#get_recs_complex.N_NOTE#</td>
		<td>#get_recs_complex.insured#</td>
		<td>#DateFormat(get_recs_complex.NOTE_DATE, "m/d/yyyy")#</td>
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
