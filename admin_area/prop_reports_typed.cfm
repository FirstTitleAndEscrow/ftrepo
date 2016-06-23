<style>
.table_header {font-family:Arial, Helvetica, sans-serif; font-size:13px}
.table_border {border-style:solid; border-color:#000000; border-width:thin;}
td {font-family:Arial, Helvetica, sans-serif; font-size: 12px;}
.large_header {font-family:Arial, Helvetica, sans-serif; font-size: 16px;}
</style>


<CFQUERY datasource="#request.dsn#" NAME="get_recs">
select p.*, c.streamline_client from property p
inner join tblUser_Roles tu on tu.prop_id = p.prop_id
inner join companies c on c.id = p.comp_id
where appraisal_status = 'In Typing'
AND (Typing_End_Datetime IS NOT NULL OR Typing_End_Datetime <> '')
order by p.prop_id desc
</CFQUERY>

<center>
<span class="large_header"><strong>Property Files Typed</strong></span><br>

<p>Streamline files are in yellow</p>
<table border=1 cellspacing=2 cellpadding=2 class="table_border">
<tr>
<td align="left" valign="bottom"><strong>Prop_id</strong></td>
<td align="left" valign="bottom"><strong>Address</strong></td>
<td align="left" valign="bottom"><strong>State</strong></td>
<td align="left" valign="bottom" width=150><strong>County</strong></td>
</tr>


<cfif get_recs.recordcount>
<cfoutput query="get_recs">
	<cfset bgcolor = 'efefef'>
	<cfif streamline_client EQ 1>
		<cfset bgcolor = "yellow">
	</cfif>
		<tr bgcolor="#bgcolor#">
		<td><a href="prop_report_nav.cfm?uid=56&al=1&rec_id=#prop_id#&company_id=0&code=T">P-#prop_id#</a></td>
		<td>#paddress#</td>
		<td>#pstate#</td>
		<td width=150>#pcounty#</td>
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



