
<cfset get_rows = 3000>
<cfset start_time = Now()>
<cfset unfound = "">



<CFQUERY datasource="#request.dsn#" name="new_zips">		
	Select * from Zip_Info_Temp order by state, city, county, zip
</CFQUERY>

<div align="left">
<table>
<tr>
<td>State</td>
<td>City</td>
<td>County</td>
<td>Zip</td>
</tr>

<cfoutput query="new_zips" startrow=60001 maxrows=20000>
<CFQUERY datasource="#request.dsn#" name="check_existing" maxrows=1>		
	Select * from Zip_info
	where city = '#new_zips.city#' and zip = '#new_zips.zip#' and county = '#new_zips.county#' and state = '#new_zips.state#'
</CFQUERY>
<cfif check_existing.recordcount>
<cfelse>
<cfset unfound = ListAppend(unfound, new_zips.zip_id, ",")>
<tr>
<td>#new_zips.state#</td>
<td>#new_zips.city#</td>
<td>#new_zips.county#</td>
<td>#new_zips.zip#</td>
</tr>
</cfif>
</cfoutput>
</table>
DONE<br>

<cfoutput>TOTAL #ListLen(unfound, ",")# RECORDS</cfoutput>
</div>
<CFFLUSH>

