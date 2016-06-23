<CFPARAM NAME="a_trigger" DEFAULT="0">




<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Retrieve Password</title>
</head>

<body>

<center>
<cfif #a_trigger# eq 1>

<CFQUERY datasource="#request.dsn#" NAME="read_user">
SELECT *
FROM thirdparty
WHERE email = '#email#' and company like '%#name#%'
</CFQUERY>

<cfif #read_user.recordcount# GT 0>


<CFMAIL
TO="#read_user.email#"
FROM="webmaster@firsttitleservices.com" Subject="Your First Title username and password"
TIMEOUT="600"
>

Dear #read_user.first# #read_user.last#:

Your Third Party ID is: #read_user.ID#

Thank you!
First Title & Escrow, Inc.

</cfmail>
<center>

<table width="400">
  <tr>
    <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="2">
		An email has been sent to you with the third party chosen information.
      </font></td>
  </tr>

  <tr>
    <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="2">If you have any questions
	please email us at <a href="mailto:webmaster@firsttitleservices.com"><font face="Arial, Helvetica, sans-serif" size="2" color = "red">webmaster@firsttitleservices.com</font></a></font></td>
  </tr>

 <tr>
    <td align = "center" colspan="2"><br><br><br>
	 <a href="javascript:window.close();"><img src="https://firsttitleservices.com/images/button_close.gif" border=0></a>
	</td> </tr>
</table></center>

<cfelse>

<table width="400">
  <tr>
    <td colspan="2"><font face="Arial, Helvetica, sans-serif" color = "blue" size="2">
		The information you provided is not found in our system.  If the third party is not registered, please <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/registertp.cfm" target="registertp">here</a> to register.
      </font></td>
  </tr>

  <tr>
    <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="2">If you have any questions
	please email us at <a href="mailto:webmaster@firsttitleservices.com"><font face="Arial, Helvetica, sans-serif" size="2" color = "red">webmaster@firsttitleservices.com</font></a></font></td>
  </tr>

 <tr>
    <td align = "center" colspan="2"><br><br><br>
	 <a href="javascript:window.close();"><img src="https://firsttitleservices.com/images/button_close.gif" border=0></a>
	</td> </tr>
</table></center>

</cfif>



<cfelse>
<FORM METHOD=POST ACTION="https://<cfoutput>#cgi.server_name#</cfoutput>/thirdpartyid.cfm?a_trigger=1">
<table width="400">
  <tr>
    <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="2">Please enter all the required information below
      </font></td>
  </tr>


    <tr>

	<td width="200">Company name (as registered): <input type="text" name="name"></td>
    <td width="200">Your email (as registered):<input type="text" name="email"></td>
  </tr>
   <tr>


    <td align = "center" colspan = "2" width="400"><input type="submit" name="Submit" value="Submit"></td>
  </tr>

</table>
</FORM>
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
