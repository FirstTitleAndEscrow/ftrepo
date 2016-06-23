<cfparam name="url.title_id" default="44888">

<CFQUERY datasource="#request.dsn#" NAME="read_all">
  SELECT * FROM title where title_id = '#url.title_id#'
</CFQUERY>


<cfif NOT IsDefined("session.ft_user_id")>
<cfset session.ft_user_id = 264>
<cfset session.is_logged_in = 1>
</cfif>



<cfoutput query="read_all">
<cfhttp url="https://#cgi.server_name#/rick_tests/Title_committment_open.cfm?uid=#session.ft_user_id#&al=1&rec_id=#read_all.title_id#&company_id=0&a_trigger=7" method="post">
<cfhttpparam type="Formfield" name="GRANTOR2" value="">
</cfhttp>
</cfoutput>


<!--- <cfdump var="#read_all#">
<cfabort> --->


<!--- <cfoutput>#cfhttp.FileContent#</cfoutput><br> --->
<br>
DONE!
<CFLOCATION URL="https://#cgi.server_name#/rick_tests/tcs/TC-#read_all.title_id#.pdf">
<cfflush>