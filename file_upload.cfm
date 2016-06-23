<CFQUERY DATASOURCE="First_Title_Services" NAME="readin">
SELECT adminID, adminlogin, adminpassword
FROM admin
WHERE adminlogin = '#adminlogin#' AND adminpassword = '#adminpassword#'
</CFQUERY>

<CFQUERY DATASOURCE="First_Title_Services" NAME="get_id">
SELECT orderid
FROM orders
WHERE customerid = #customerid#
</CFQUERY>

<CFQUERY DATASOURCE="First_Title_Services" NAME="get_email">
SELECT RptbyEmail
FROM customers
WHERE customerid = #customerid#
</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">




<html>
<head>
	<title>1st Title & Escrow, Inc. - Welcome</title>
</head>

<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0" link="blue" alink="a2a3fe" vlink="a2a3fe">
<table width=620 border="0" cellpadding="0" cellspacing="0"><tr><nobr><td colspan="2" valign=bottom><img src="./images/clear.gif" width="10" height="1"><img src="./images/logo.gif"><b><font size=2 color=red face=arial><img src="./images/clear.gif" width="30" height="1"><cfoutput>#datnow# - #timnow#</cfoutput> (EST)</b></td></tr><tr><td colspan="2" valign="top"><img src="./images/clear.gif" width="20" height="1"><img src="./images/bar.gif"></td></tr><tr><td width="145" valign="top"><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_01.gif"><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_02.gif"><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_03.gif"><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_04.gif"><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_05.gif"><br><img src="./images/clear.gif" width="20" height="1"><IMG border=0 src="./images/nav_06.gif"><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_07.gif"><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_08.gif"><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_09.gif"><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_10.gif"><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_11.gif"><br></td><td>

<table width=455 cellpadding=0 cellspacing=0 border=0>
<tr>
<td width=50 align=left valign=top>
<img src="./images/clear.gif" height=1 width=50>
</td>
<td width=455 align=center valign=top>



<table width=455 cellpadding=1 cellspacing=1 border=0>

		<tr>
		<td width=455 colspan=2 align=center valign=top>
			<img src="images/clear.gif" width=455 height=10 alt="" border="0">
		</td>
		</tr>
		<tr>
		<td width=455 colspan=2 align=center valign=top>
			<font size=3 align=center color=blue face=arial>
		<B>1st Title & Escrow, Inc. - File Upload for Order #<CFOUTPUT query="get_id">#orderid#</CFOUTPUT></B>
		<p>
		<CFOUTPUT query="get_email">
		<CFIF #RptbyEmail# IS NOT "">
		<b>Send Report via email to: <A HREF="mailto:#RptbyEmail#">#RptbyEmail#</a></b><p>
		<CFELSE>
		<b>Customer has not requested file to be emailed.</b><p>
		</CFIF>
		</CFOUTPUT>
		</td>
		</tr>

		<tr>

		<td width=455 align=center valign=top>
<FORM action="./file_upload_final.cfm"  ENCTYPE="multipart/form-data" method="post">
<CFOUTPUT query="get_id">
<input type="hidden" name="orderid" value="#orderid#">
</CFOUTPUT>
<input type="file" name="file_upload">
<input type="submit" value="Upload File">

</FORM>
		</td>
		</tr>
		</table>



    </td>
  </tr>
</table>
  </td>
  </tr>
</table>

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
</HTML>