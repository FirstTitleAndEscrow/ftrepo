<CFQUERY DATASOURCE="First_Title_Services" NAME="getcompany">
SELECT company
FROM login
WHERE loginid=#loginid#
</CFQUERY>





<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">


<html>
<head>
	<title>1st Title & Escrow, Inc. - Welcome</title>
</head>

<body leftmargin="0" topmargin="0" marginheight = "0" marginwidth = "0">
<table width=620 border="0" cellpadding="0" cellspacing="0"><td colspan="2" valign=bottom><IMG height=1 src="./images/clear.gif" width=10><IMG src="./images/logo.gif"><b><font size=2 color=red face=arial><IMG height=1 src="./images/clear.gif" width=30><cfoutput> #datnow# - #timnow#</CFOUTPUT> (EST)</b></FONT><img src="images/clear.gif" width=69 height=1 alt="" border="0">
<a href="./welcome.cfm"><img src="images/home.gif" width=55 height=18 alt="" border="0"></a></td></tr><tr><td colspan="2" valign="top"><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/bar.gif"></td></tr><tr><td width="145" valign="top"><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_01.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./title_services.cfm"><IMG src="./images/nav_02.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_03.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./closing_services.cfm"><IMG src="./images/nav_04.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_05.gif"><br><IMG height=1 src="./images/clear.gif" width=20><A href="./customer_login.cfm"><IMG border=0 src="./images/nav_06.gif"></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_07.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./contact_info.cfm"><IMG src="./images/nav_08.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_09.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./mail.cfm?pass=0"><IMG src="./images/nav_10.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_11.gif"><br><IMG height=1 src="./images/clear.gif" width=20><br></TD><TD>

<TABLE WIDTH=440 BORDER=0 CELLSPACING=0 align="center">
<TR>
<TD ALIGN=middle>
<FONT FACE=ARIAL COLOR="red" SIZE=4><b>Place an Order</b></FONT>

<CENTER>
<TABLE BORDER=1 CELLSPACING=0>
<CFFORM METHOD="post" ACTION="https://#cgi.server_name#/order_entry.cfm">


<TR BGCOLOR="blue">
<TD ALIGN=middle>
<FONT FACE=ARIAL SIZE=2 color="white">
<cfoutput query="getcompany">
#Ucase("#company#")#
</cfoutput>
</FONT>
</TD>
</TR>
<TR BGCOLOR="#4b4bff">
<TD ALIGN=middle>
<FONT FACE=ARIAL SIZE=2 color="white">Select product you want to order.  If you would like an appraisal as well, please indicate on order form accordingly.</FONT>

</TD>
</TR>
<TR BGCOLOR="#a2a3fe">
<TD ALIGN=middle>

<TABLE BORDER=0 CELLSPACING=0>
<TR>
<TD>
<CFINPUT type="radio" NAME="choice" value="prop" required="yes" message="You must select one of the product.">
<FONT FACE=ARIAL SIZE=2 color="red">PROPERTY REPORT</FONT>
</TD>
</TR>

<input type="hidden"  name="choice_required" value="You must select one of the product">

<TR>
<TD>
<CFINPUT type="radio" NAME="choice" value="title" required="yes" message="You must select one of the product.">
<FONT FACE=ARIAL SIZE=2 color="red">TITLE COMMITMENT</FONT>
</TD>
</TR>


<!---<TR>
<TD>
<INPUT TYPE=checkbox NAME=closing value="yes">
<FONT FACE=ARIAL SIZE=2 color="red">CLOSING</FONT>
</TD>
</TR>--->
</TABLE>

</TD>
</TR>

<TR BGCOLOR=blue>
<TD ALIGN=middle>

<cfoutput>
<input type="hidden" name="loginid" value="#loginid#">
<input type="hidden" name="acct_num" value="#acct_num#">
<input type="hidden" name="password" value="#password#">
</cfoutput>

<FONT FACE=ARIAL SIZE=2><INPUT TYPE=submit VALUE="CONTINUE">
<INPUT TYPE=reset VALUE="CLEAR FIELDS"></FONT>
</TD>
</CFFORM>
</TR>
</TABLE><p></p></CENTER>



</td></tr>
</table></TR></td></TABLE></NOBR>

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
