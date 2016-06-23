<CFMAIL
  from="weberror@firsttitleservices.com"
  to="#Error.MailTo#"
	server="127.0.0.1"
  subject="Auto Error Report"
	TIMEOUT="600"
	type="HTML">
1.Error occured in template<font color="blue">:#Error.Template#</font><br>

2.At this time:<font color="blue">#Error.DateTime#</font><br>

3.The query string was:<font color="green">#Error.QueryString#</font><br>

4.A detailed diagnostic follows:<br>

<font color="red">"#Error.Diagnostics#"</font><br>
</cfmail>



<html>
<head>
   <title>We're sorry -- An Error Occurred</title>
</head>
<body>
   <h2>We're sorry -- An Error Occurred. Webmaster is informed</h2>

   <p>
	 <cfoutput>
     <!---  If you continue to have this problem, please contact <a href="mailto:#error.mailTo#">Webmaster</a>
      with the following information (please copy and paste into email): --->
	  Please describe how you get this error and send message to <a href="mailto:#error.mailTo#">Webmaster</a>
	  </p>
   <p>
<ul>

   <li><b>Date and Time the Error Occurred:</b> #error.dateTime#
   <li><b>Page You Came From:</b><font color="blue"> #error.HTTPReferer#</font>
   <li><b>Message Content</b>:
    <p><font color="red">"#error.diagnostics#"</p></font>
</ul>
 </cfoutput>

</body>
</html>
<!--- <cfset dtstamp = now()>



<cfset uurl     = "https://#cgi.server_name##cgi.script_name#">



<cfif len(trim(cgi.query_string)) gt 0>

            <cfset uurl  = "#uurl#?#cgi.query_string#">

</cfif>

<cfset sbj     = "Site Error has occurred: #error.type# on server: at: #dtstamp#">



<!--- *** setting up the error msg  **    - a --->

<cfset msg   = "#uurl#   Error Diagnostics #error.diagnostics# <br>



Error Template:  #error.template# <br>



Error Type:  #error.type# <br>



HTTP_USER_AGENT:  #cgi.HTTP_USER_AGENT# <br>



HTTP_REFERER:   #cgi.HTTP_REFERER# <br>



Date Time Stamp:  #now()# <br>



">

<!--- setup log file: optional - a

<cflog text="#sbj##chr(13)##chr(10)##msg#" log="APPLICATION" type="Error" thread="yes" date="yes" time="yes" application="yes"></cflog>--->






<cfmail  to="nsalatova@yahoo.com " from="webmaster@firsttitleservices.com" subject="#sbj#" type="html">

#msg#

</cfmail>

 --->