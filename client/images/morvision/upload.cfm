<cfif isdefined("form.filename")>
	<cfset dest='C:\Inetpub\wwwroot\Clients\firsttitleservices.com\www\client\morvision\'>
	<cffile action="upload" filefield="form.filename" nameconflict="makeunique" destination="#dest#">
	<cfif file.FileWasSaved eq "Yes">
		<cfoutput>#file.ClientFile#</cfoutput> saved to <cfoutput>#file.serverfile#</cfoutput>
	</cfif>
<cfelseif isdefined("form.txtfield")>
<cfoutput>#form.txtfield#</cfoutput>
<!---<form name="form1" action="import.cfm" method="post">
	<table align="center">		
	<tr><td colspan="2">User Login</td></tr>
	<tr><td>Username</td><td><input type="text" name="usr"></td></tr>
	<tr><td>Password</td><td><input type="password" name="psw"></td></tr>
	<input name="loandata"  type="hidden" value="<cfoutput>#form.txtfield#</cfoutput>">
	<Tr><td colspan="2"><input type="submit" name="login" value="login"></td></Tr>
	</table>
	
	</form>--->
	<!---<cfoutput>#form.txtfield#</cfoutput>--->
	<!---<cfoutput>#form.username#</cfoutput>	--->
	<!---<cfoutput>#form.password#</cfoutput>	--->
<cfelse>
	<cfoutput>SORRY, NO FILE NAME WAS FOUND, PLEASE RETRY.</cfoutput>
</cfif>
