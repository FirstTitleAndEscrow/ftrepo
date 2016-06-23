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
FROM users
WHERE lp_email = '#email#'
</CFQUERY>

<cfif #read_user.recordcount# GT 0>
<CFQUERY datasource="#request.dsn#" NAME="read_company">
SELECT *
FROM companies
WHERE ID = '#read_user.comp_id#'
</CFQUERY>

<CFMAIL
TO="#email#"
FROM="webmaster@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="Your #session.site.short_name# username and password"
TIMEOUT="600"
>

Dear #read_user.lp_fname# #read_user.lp_lname#:

Your #session.site.short_name# username is:  #read_company.a_user#
Your #session.site.short_name# password is:  #read_company.a_pass#
Thank you!
#session.site.long_name#

</cfmail>
<center>

<table width="400">
  <tr>
    <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="2">
		An email has been sent to you with your username and password.
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
		The email you provided is not found in our system.  If you are not an existing <cfoutput>#session.site.short_name#</cfoutput> customer, click To become a customer and request a user ID and password to start ordering today, please click <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/registerb.cfm" target="register">here to register.</a>
      </font></td>
  </tr>

  <tr>
    <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="2">If you have any questions
	please email us at <a href="mailto:webmaster@firsttitleservices.com"><font face="Arial, Helvetica, sans-serif" size="2" color = "red">webmaster@firsttitleservices.com</font></a></font></td>
  </tr>

 <tr>
    <td align = "center" colspan="2"><br><br><br>
	 <a href="javascript:window.close();"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/button_close.gif" border=0></a>
	</td> </tr>
</table></center>

</cfif>



<cfelse>
<FORM METHOD=POST ACTION="https://<cfoutput>#cgi.server_name#</cfoutput>/client/retpassword.cfm?a_trigger=1">
<table width="400">
  <tr>
    <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="2">Forgot your Username or Password?
      Enter your email address below and we will email you your username and password.
      </font></td>
  </tr>

  <tr>
    <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="2">Not a current <cfoutput>#session.site.short_name#</cfoutput> customer
      ? To become a customer and request a user ID and password to start ordering today, click <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/client/registerb.cfm" target="register">here.</a>
     </font></td>
  </tr>
  <tr>
    <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="2"><b>If you require further assistance,
      please email the <cfoutput>#session.site.short_name#</cfoutput> technical support desk or your service representative at <font color="#990000">866-4TITLES
      (484-8537)</b><br><br></font></td>
  </tr>

   <tr>

	<td width="200"><input type="text" name="email"></td>
    <td width="200"><input type="submit" name="Submit" value="Submit"></td>
  </tr>

</table>
</FORM>
</cfif>
</center>
</body>
</html>
