<!--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Welcome To Coldfusion Test</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
</head>
<body class="test-data">-->
<!---<h2>This is A Coldfusion Test Page</h2>
---><!---<cfinclude template="endRequestFunction.cfc"/>--->
<cfinvoke component="endRequestFunction" method="endRequestFunc"/>
<!---<h4>This is the CF File Output</h4>
<cffile action="read" file="C:\ColdFusion9\logs\server.log" variable="httpLog">
<cfoutput>#httpLog#</cfoutput--->


<!---<table cellspacing="0" cellpadding="0" border="0">
<tr class="subhead" align="Left"><th>Name</th><th>Value</th></tr>
<cfoutput><tr class="normal"><td>HTTP_REFERER</td><td>#CGI.HTTP_REFERER#</td></tr></cfoutput>
<cfoutput><tr class="alt"><td>HTTP_USER_AGENT</td><td>#CGI.HTTP_USER_AGENT#</td></tr></cfoutput>
<cfoutput><tr class="normal"><td>REQUEST_METHOD</td><td>#CGI.REQUEST_METHOD#</td></tr></cfoutput>
<cfoutput><tr class="normal"><td>SCRIPT_METHOD</td><td>#CGI.SCRIPT_NAME#</td></tr></cfoutput>
</table>
--->

</body>
</html>