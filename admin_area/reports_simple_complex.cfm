<style>
.table_header {font-family:Arial, Helvetica, sans-serif; font-size:13px}
.table_border {border-style:solid; border-color:#000000; border-width:thin;}
td {font-family:Arial, Helvetica, sans-serif; font-size: 12px;}
.large_header {font-family:Arial, Helvetica, sans-serif; font-size: 16px;}
</style>
<cfset ri_employee = 0>
<CFQUERY datasource="#request.dsn#" NAME="get_user">
select va_employee, ft_fairfax_employee
from first_admin
where ID = #session.ft_user_id#
</CFQUERY>
<cfif get_user.va_employee eq 'True'>
<cfset ri_employee = 1>
</cfif>
<cfif get_user.ft_fairfax_employee eq 'True'>
<cfset fx_employee = 1>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="get_recs_simple">
select distinct t.Title_id, t.comp_id, t.loan_number, t.paddress, t.pcity, t.pstate, t.insured, n.n_date as NOTE_DATE, n.n_note, t.appraisal_status, t.realec_transactionid
from title t
inner join title_notes n on n.order_id = t.title_id
where (t.cancelled IS NULL or t.cancelled = 0)
and 
n.N_Note LIKE '%Issue Type: Simple%'
and (t.appraisal_status <>  'Loan Closed'
and t.appraisal_status <>  'Loan Closed-Seller Rep'
and t.appraisal_status <>  'Loan Funded')
AND not exists
(
select * from title_notes where order_id = t.title_ID and N_Note = 'Clear to Close' and n_date > n.n_date
)
order by t.title_id
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
<td align="center" valign="bottom"><strong>Loan Num</strong></td>
<td align="center" valign="bottom"><strong>Status</strong></td>
<td align="center" valign="bottom"><strong>Note Date</strong></td>
</tr>


<cfif get_recs_simple.recordcount>
<cfoutput query="get_recs_simple">
<cfset richmond = 0>
<CFQUERY datasource="#request.dsn#" NAME="check_richmond">
select c.intsales, f.va_employee, f.ft_fairfax_employee, f.ID
from companies c, first_admin f
where c.ID = #get_recs_simple.comp_id#
and f.ID = c.IntSales
</CFQUERY>
<cfif check_richmond.va_employee eq 'True'>
<cfset richmond = 1>
</cfif>
<cfif check_richmond.ft_fairfax_employee eq 'True'>
<cfset fx = 1>
</cfif>
	<cfset bgcolor = 'efefef'>
	<cfif get_recs_simple.realec_transactionid eq '' or get_recs_simple.realec_transactionid eq 'NULL'>
	<cfset bgcolor = bgcolor>
    <cfelse>
	<cfset bgcolor = 'FF3300'>
	</cfif>
	<cfif richmond eq 1 or (richmond eq 0 and ri_employee eq 0)>
		<tr bgcolor="#bgcolor#">
		<td><strong>#get_recs_simple.title_id#<cfif richmond eq 1>-R</cfif></strong></td>
		<td>#get_recs_simple.paddress#</td>
		<td>#get_recs_simple.pcity#</td>
		<td>#get_recs_simple.pstate#</td>
		<td>#get_recs_simple.N_NOTE#</td>
		<td>#get_recs_simple.insured#</td>
		<td>#get_recs_simple.loan_number#</td>
		<td>#get_recs_simple.appraisal_status#</td>
		<td>#DateFormat(get_recs_simple.NOTE_DATE, "m/d/yyyy")#</td>
		</tr>
		<cfif bgcolor eq 'efefef'>
			<cfset bgcolor = 'ffffff'>
			<cfelse>
			<cfset bgcolor = 'efefef'>
		</cfif>
		</cfif>
</cfoutput>
</cfif>


</table>
</center>

<br>
<br>
<br>






	<CFQUERY datasource="#request.dsn#" NAME="get_recs_complex">
select distinct t.Title_id, t.comp_id, t.loan_number, t.paddress, t.pcity, t.pstate, t.insured, n.n_date as NOTE_DATE, n.n_note, t.appraisal_status, t.realec_transactionid
from title t
inner join title_notes n on n.order_id = t.title_id
where (t.cancelled IS NULL or t.cancelled = 0)
and 
n.N_Note LIKE '%Issue Type: Complex%'
and (t.appraisal_status <>  'Loan Closed'
and t.appraisal_status <>  'Loan Closed-Seller Rep'
and t.appraisal_status <>  'Loan Funded')
AND not exists
(
select * from title_notes where order_id = t.title_ID and N_Note = 'Clear to Close' and n_date > n.n_date
)
order by t.title_id
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
<td align="center" valign="bottom"><strong>Loan Num</strong></td>
<td align="center" valign="bottom"><strong>Status</strong></td>
<td align="center" valign="bottom"><strong>Note Date</strong></td>
</tr>


<cfif get_recs_complex.recordcount>
	<cfset bgcolor = 'efefef'>
	<cfoutput query="get_recs_complex">
<cfset richmond = 0>
<CFQUERY datasource="#request.dsn#" NAME="check_richmond">
select c.intsales, f.va_employee, f.ft_fairfax_employee, f.ID
from companies c, first_admin f
where c.ID = #get_recs_complex.comp_id#
and f.ID = c.IntSales
</CFQUERY>
<cfif check_richmond.va_employee eq 'True'>
<cfset richmond = 1>
</cfif>
<cfif check_richmond.ft_fairfax_employee eq 'True'>
<cfset fx = 1>
</cfif>
	<cfif get_recs_complex.realec_transactionid eq '' or get_recs_complex.realec_transactionid eq 'NULL'>
	<cfset bgcolor = bgcolor>
    <cfelse>
	<cfset bgcolor = 'FF3300'>
	</cfif>
		<cfif richmond eq 1 or (richmond eq 0 and ri_employee eq 0)>
		<tr bgcolor="#bgcolor#">
		<td><strong>#get_recs_complex.title_id#<cfif richmond eq 1>-R</cfif></strong></td>
		<td>#get_recs_complex.paddress#</td>
		<td>#get_recs_complex.pcity#</td>
		<td>#get_recs_complex.pstate#</td>
		<td>#get_recs_complex.N_NOTE#</td>
		<td>#get_recs_complex.insured#</td>
		<td>#get_recs_complex.loan_number#</td>
		<td>#get_recs_complex.appraisal_status#</td>
		<td>#DateFormat(get_recs_complex.NOTE_DATE, "m/d/yyyy")#</td>
		</tr>
		<cfif bgcolor eq 'efefef'>
			<cfset bgcolor = 'ffffff'>
			<cfelse>
			<cfset bgcolor = 'efefef'>
		</cfif>
		</cfif>
</cfoutput>
</cfif>


</table>
</center>
