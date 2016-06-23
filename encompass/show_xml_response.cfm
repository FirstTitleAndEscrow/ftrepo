<cffile action="READ" file="C:\inetpub\wwwroot\clients\firsttitleservices.com\www\encompass\testing_XML\heather_test.xml" variable="M1">


<CFSET MyXml = XmlParse(M1)>


<cfdump var="#MyXml#">