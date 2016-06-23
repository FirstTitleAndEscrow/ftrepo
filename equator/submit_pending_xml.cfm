<cfparam name="form.submit" default=0>

<cfif form.submit eq 'Submit'>
<!--- this part reads in the XML document --->
<cffile action="READ" file="C:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\testing_xml\#form.xml_file#" variable="M1"> 

<cfset dataString = ToString(M1)>
<CFSET MyXml = XmlParse(dataString)>
<!--- this part posts the document, via https, to our server, just as Calyx should --->

<cfhttp url="http://www.streamline-title.com/equator/index.cfm" method="post" resolveurl="no">
<cfhttpparam type="body" name="raw_xml" value="#M1#">
</cfhttp>

<!--- this part displays whatever is returned by the post --->

<cfoutput>#cfhttp.filecontent#</cfoutput><br>
<br>
<br>
Submitted<br>
</cfif>

<form action="xml_test_form.cfm" method="post">
<p>Submit this XML File:
<select name="xml_file">
<cfdirectory  action="list" directory="C:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\testing_xml\" name="files">
<cfoutput query="files">
<option value="#files.name#">#files.name#</option>
</cfoutput>
</select><br>
<input type="submit" name="Submit" value="Submit">
</form>

<cfabort>



