<cfif isdefined("form.login")>
	<!---
	<cfquery name="verifyUser" datasource="">
		select * from users where username='#form.usr# and password='#form.psw#'
	</cfquery>
	
	<cfif verifyuser.recordcount eq 1>--->
	<cfif 1 eq 1>
	<table align="center">
	<tr><td colspan="2">Welcome, <cfoutput>#form.usr#</cfoutput>!</td></tr>
	<Tr><td colspan="2">We have received your MorVision Load Application, thanks!</td></Tr>
	</table>	
	<!--- call stored procedure to load data --->	
	<cfoutput>#form.loandata#</cfoutput>
	<cfoutput>#form.usr#, #form.psw#</cfoutput>	
	<cfelse>
		<cflocation url="upload.cfm">
	</cfif>
<cfelse>
	<cflocation url="upload.cfm">
</cfif>
