


<!--- <cfdump var="#mydirectory#">
<cfabort> --->

<cffile action="READ" file="C:\inetpub\wwwroot\clients\firsttitleservices.com\www\encompass\output_xml\RESPONSE_2014_10_23_02_26_42.xml" variable="M1">


<CFSET MyXml = XmlParse(M1)>


<cfdump var="#MyXml#">