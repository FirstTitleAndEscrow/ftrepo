

<style>
.table_header {font-family:Arial, Helvetica, sans-serif; font-size:13px}
.table_border {border-style:solid; border-color:##000000; border-width:thin;}
td {font-family:Arial, Helvetica, sans-serif; font-size: 12px;}
.large_header {font-family:Arial, Helvetica, sans-serif; font-size: 16px;}
</style>

<CFQUERY datasource="#request.dsn#" NAME="get_recs">
	select t.comp_id, c.company, t.title_id, t.pstate, t.pname, t.pphone, t.pfax, t.p_email, t.oname, t.ophone, t.ofax, t.o_email
	from title t
	inner join companies c on c.id = t.comp_id
	where t.comp_id IN (7393,7402)
	order by t.comp_id, t.title_id
</CFQUERY>
	
	

<cfoutput query="get_recs" group="comp_id">
	<h2>Account: #company#</h2>
	<table border=1 cellspacing=4 cellpadding=4 class="table_border">
	<tr>
	<td align="left" valign="bottom"><strong>Title ID</strong></td>
	<td align="left" valign="bottom"><strong>State</strong></td>
	<td align="left" valign="bottom"><strong>LP Name</strong></td>
	<td align="left" valign="bottom"><strong>LP Email</strong></td>
	<td align="left" valign="bottom"><strong>LP Phone</strong></td>
	
	<td align="left" valign="bottom"><strong>LO Name</strong></td>
	<td align="center" valign="bottom"><strong>LO Email</strong></td>
	<td align="left" valign="bottom"><strong>LO Phone</strong></td>
	
	</tr>
	
	<cfoutput>
		<tr>
			<td>T-#title_id#</td>
			<td>#pstate#</td>
			<td>#pname#</td>
			<td>#p_email#</td>
			<td>#pphone#</td>
			
			<td>#oname#</td>
			<td>#o_email#</td>
			<td>#ophone#</td>
			
		</tr>
	
	</cfoutput>
	</table>
</cfoutput>


