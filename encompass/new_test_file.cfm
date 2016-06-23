<!--- this part reads in the XML document --->
<cffile action="READ" file="C:\inetpub\wwwroot\clients\firsttitleservices.com\www\encompass\temp_file_new.xml" variable="M1">
 
<cfset dataString = ToString(M1)>
<CFSET MyXml = XmlParse(dataString)>
yes?
<cfabort>

<!---  --->

<!--- this part posts the document, via https, to our server, just as Calyx should --->
<cfhttp url="https://machine1.firsttitleservices.com/encompass/index.cfm" method="post" resolveurl="no">
<cfhttpparam type="body" name="raw_xml" value="#M1#">
</cfhttp>

<!--- this part displays whatever is returned by the post --->
 
<cfoutput>#cfhttp.filecontent#</cfoutput>

