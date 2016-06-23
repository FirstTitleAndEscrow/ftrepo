<!--- This page has been commented out to prevent it from running again. It's only purpose was to update rates in the rates tables.

--Rick Jermain
 --->

<cfset count = 1>
<CFQUERY datasource="#request.dsn#" NAME="insert_rates">
Delete StateTexas_Steve
where a_to <= '100000'
</CFQUERY>
<CFQUERY NAME="test" DataSource="TX_Rates">
SELECT * FROM `Sheet1$`
order by a_to DESC
</CFQUERY>
<cfoutput query="test">
<CFQUERY datasource="#request.dsn#" NAME="insert_rates">
Insert into StateTexas_Steve
(a_to, a_from, sale, ID)
values
('#a_to#', '#a_from#', '#sale#', #count#)
</CFQUERY>
<cfset count = count + 1>
</cfoutput>
DONE Texas<br>

