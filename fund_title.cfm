<CFPARAM NAME="a_trigger" DEFAULT="0">



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Loan Funding</title>
</head>

<body>

<center>

<cfif #a_trigger# eq 1>
<cfquery datasource="#request.dsn#">

update eventlist
set loanfun = 1
where title_id = #url.rec_id#
</cfquery>

<CFMAIL
TO="glennandrews@homeownersloan.com"
FROM="webmaster@firsttitleservices.com" Subject="#session.site.short_name# Loan has been funded for order #url.rec_id#"
TIMEOUT="600"
>

Dear Mr. Andrews:

First Title Loan has been funded for order #url.rec_id#

Thank you!
First Title & Escrow, Inc.

</cfmail>
<center>

<table width="400">
  <tr>
    <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="2">
		Loan has been funded for <cfoutput>#rec_id#. </cfoutput>
      </font></td>
  </tr>

 <tr>
    <td align = "center" colspan="2"><br><br><br>
	 <a href="javascript:window.close();"><img src="https://firsttitleservices.com/images/button_close.gif" border=0></a>
	</td> </tr>
</table></center>
</cfif>
</center>
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