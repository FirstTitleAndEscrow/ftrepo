<cffile action="READ" file="C:\inetpub\wwwroot\clients\firsttitleservices.com\www\FEESREQUEST.xml" variable="M1">

<cfhttp url="https://#cgi.server_name#/calculator_xml.cfm" method="post">
 <cfhttpparam type="Formfield"
  value="#ToBase64(m1)#"
  name="FEESREQUEST">
</cfhttp>

<cfoutput>#cfhttp.filecontent#</cfoutput>

