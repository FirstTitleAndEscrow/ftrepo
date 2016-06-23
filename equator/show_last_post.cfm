<cffile action="READ" file="C:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\last_outgoing_post.txt" variable="M1">


<CFSET MyXml = XmlParse(M1)>


<cfdump var="#MyXml#">