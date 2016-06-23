<cffile action="READ" file="C:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\testing_xml\POST_2016_02_01_10_03_09.xml" variable="M1">


<CFSET MyXml = XmlParse(M1)>


<cfdump var="#MyXml#">