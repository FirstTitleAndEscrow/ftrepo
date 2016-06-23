<!--- this part reads in the XML document --->
<cffile action="READ" file="C:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\testing_xml\reopen_closing_order.xml" variable="M1"> 

<cfset dataString = ToString(M1)>
<CFSET MyXml = XmlParse(dataString)>
<!--- this part posts the document, via https, to our server, just as Calyx should --->
<cfhttp url="http://www.firsttitleservices.com/equator/index.cfm" method="post" resolveurl="no">
<cfhttpparam type="body" name="raw_xml" value="#M1#">
</cfhttp>

<!--- this part displays whatever is returned by the post --->

<cfoutput>#cfhttp.filecontent#</cfoutput>

