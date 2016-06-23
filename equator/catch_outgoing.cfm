<CFSETTING enablecfoutputonly="yes">
<cfset missing_fields = "">

<cfset x = GetHttpRequestData()>
<cfset dataString = ToString(x.content)>
<cfset posted_xml_filename = "POST_" & #DateFormat(Now(), 'yyyy_mm_dd')# & "_" & #TimeFormat(Now(), 'hh_mm_ss')# & ".xml">
<cffile action="write" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\equator\caught_outgoing_xml\#posted_xml_filename#" nameconflict="makeunique" output="#Trim(datastring)#">
