
<cfparam name="url.company_id" default="">
<cfset xmlstring = ToString(session.XMLOUT)>
<cfset xmlstring = ReplaceNoCase(xmlstring, 'RESPASECTIONCLASSIFICATIONTYPE', 'RESPASectionClassificationType', 'ALL')>
<cfset xmlstring = ReplaceNoCase(xmlstring, 'PAIDTOTYPE', 'PaidToType', 'ALL')>
<cfset xmlstring = ReplaceNoCase(xmlstring, 'PAIDTOTYPEOTHERDESCRIPTION', 'PaidToTypeOtherDescription', 'ALL')>
<cfset xmlstring = ReplaceNoCase(xmlstring, 'SPECIFIEDHUDLINENUMBER', 'SpecifiedHUDLineNumber', 'ALL')>
<cfset xmlstring = ReplaceNoCase(xmlstring, 'TYPE', 'Type', 'ALL')>
<cfset xmlstring = ReplaceNoCase(xmlstring, 'PAIDBYTYPE', 'PaidByType', 'ALL')>
<cfset xmlstring = ReplaceNoCase(xmlstring, 'AMOUNT', 'Amount', 'ALL')>
<cfset xmlstring = ReplaceNoCase(xmlstring, 'ORDERID', 'OrderID', 'ALL')>
<cfset xmlstring = ReplaceNoCase(xmlstring, 'ENCODINGTYPEDESCRIPTION', 'EncodingTypeDescription', 'ALL')>
<cfset xmlstring = ReplaceNoCase(xmlstring, 'MIMETYPEDESCRIPTION', 'MIMETypeDescription', 'ALL')>
<cfset xmlstring = ReplaceNoCase(xmlstring, '<CENTER>', '', 'ALL')>
<cfset xmlstring = ReplaceNoCase(xmlstring, '--', '', 'ALL')>
<cfset xmlstring = ReplaceNoCase(xmlstring, '-', '', 'ALL')>

<!--- <cfif url.company_id eq 3704 or url.company_id eq 3746 or  url.company_id eq 3747 or  url.company_id eq 3748>
<cfset xmlstring = ReplaceNoCase(xmlstring, 'First Title', '', 'ALL')>
</cfif> --->


<cfset output_xml_filename = "RESPONSE_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">

<!---<cfmail to="rick@jermain.com" from="rjermain@firsttitleservices.com" subject="test" type="html">
File Name: <cfoutput>#output_xml_filename#</cfoutput><br />
<cfdump var="#xmlstring#">
</cfmail>--->

<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\encompass\output_xml\#output_xml_filename#" nameconflict="makeunique" output="#xmlstring#">

<CFCONTENT 
  TYPE="text/plain" 
  RESET="Yes"><CFOUTPUT>#xmlstring#</CFOUTPUT></cfcontent>
<cfflush>