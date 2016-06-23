<cfparam name="form.submit" default=0>

<cfif form.submit eq 'Submit'>
<!--- this part reads in the XML document --->
<cffile action="READ" file="C:\inetpub\wwwroot\clients\firsttitleservices.com\www\encompass\output_xml\#form.xml_file#" variable="M1">


<CFSET MyXml = XmlParse(M1)>


<cfdump var="#MyXml#">
</cfif>

<form action="show_xml_responses.cfm" method="post">
<p>Submit this XML File:
<select name="xml_file">
<cfdirectory  action="list" directory="C:\inetpub\wwwroot\clients\firsttitleservices.com\www\encompass\output_xml\" name="files">
<cfoutput query="files">
<option value="#files.name#">#files.name#</option>
</cfoutput>
</select><br>
<input type="submit" name="Submit" value="Submit">
</form>

