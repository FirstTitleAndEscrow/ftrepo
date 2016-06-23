<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>

<!--- <cfform action="pdfoutput.cfm" method="POST" enablecab="Yes">
<table>
<td><cfinput type="Text" name="fname"></td></tr>
<td><cfinput type="Text" name="mname"></td></tr>
<td><cfinput type="Text" name="lname"></td></tr>
</table>
<input type="submit" value="Submit">
</cfform> --->
<!--- //--- do your query ---// --->
<cfquery name="myQuery" datasource="#request.dsn#">
SELECT * FROM title
</cfquery>

<!--- //--- HTML2PDF3 opening tag to capture the dynamic data ---// --->
<CF_HTML2PDF3 myHTMLDOC="https:\\www.firsttitleservices.com\pdf\htmldoc.exe" myOPTIONS="--landscape --fontsize 10pt">

	<TABLE>
	<!--- //--- Output the results of your query ---// --->
	<CFOUTPUT QUERY="myQuery">
	<TR><TD>#title_id#</TD></TR>
	</CFOUTPUT>
	</TABLE>

<!--- //--- Close the HTML2PDF3 tag ---// --->
</CF_HTML2PDF3>

<!--- RETURN LINKS:
	This will output a client specific file called #Client.CFID#_#Client.CFToken#.pdf
	which can be accessed in the calling template by using either:

	<A HREF="#Client.CFID#_#Client.CFToken#.pdf">Default PDF File</A> OR
	<A HREF="#Request.myPDF#">Your PDF File</A>
 --->

<script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body>
</html>
