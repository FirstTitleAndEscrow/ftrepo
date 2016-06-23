<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">
<html>
<head>
<meta name="keywords" content="title, title company, companies, title companies, title insurance, company, insurance companies, agent, title agents, search, title searches, insurance agents, agency, settlement, settlement company, settlement companies, settlement services, settlement service companies, settlements, settlement agents, settlement agent, settlements agency, national company, national title companies, national  company , closings, abstract, abstracts, real estate abstracts, real estate, real estate services, escrow">
<meta name="description" content="Title company is provider of title insurance, title searches, closings, appraisals to national mortgage lenders, brokers, and realty companies.">
	<title>1st Title & Esc. Settlement Services Company & Subsid. Companies<</title>
</head>

<body leftmargin="0" topmargin="0" marginheight = "0" marginwidth = "0">
<table width=620 border="0" cellpadding="0" cellspacing="0"><tr><nobr><td colspan="2" valign=bottom><IMG height=1 src="./images/clear.gif" width=10><IMG src="./images/logo.gif"><b><font size=2 color=red face=arial><IMG height=1 src="./images/clear.gif" width=30><cfoutput> #datnow# - #timnow#</CFOUTPUT> (EST)</b></FONT><img src="images/clear.gif" width=69 height=1 alt="" border="0">
<a href="./welcome.cfm"><img src="images/home.gif" width=55 height=18 alt="" border="0"></a></td></tr><tr><td colspan="2" valign="top"><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/bar.gif"></td></tr><tr><td width="145" valign="top"><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_01.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./title_services.cfm"><IMG src="./images/nav_02.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_03.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./closing_services.cfm"><IMG src="./images/nav_04.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_05.gif"><br><IMG height=1 src="./images/clear.gif" width=20><A href="./customer_login.cfm"><IMG border=0 src="./images/nav_06.gif"></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_07.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./contact_info.cfm"><IMG src="./images/nav_08.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_09.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./mail.cfm?pass=0"><IMG src="./images/nav_10.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_11.gif"><br><img src="images/house_faded.gif" width=140 height=75 alt="" border="0"></td>
<td>
<table width=455>
<tr>
<td>

<CFIF #pass# NEQ '1'>

<CFFORM NAME=EMAIL METHOD=POST ACTION="./mail.cfm?pass=1">
<TABLE BORDER=0 CELLPADDING=1 CELLSPACING=1 WIDTH=480 HEIGHT=330 BGCOLOR=0033FF>
<TR BGCOLOR=6699FF><TD><FONT FACE=ARIAL SIZE=2><B><NOBR>&nbsp;&nbsp;Your E-Mail:</NOBR></B></FONT></TD><TD><CFINPUT NAME=from SIZE=47 MAXLENGTH=100 required="yes" message="Please enter your email address so we may reply to your message."></TD></TR>
<TR BGCOLOR=6699FF><TD COLSPAN=2><FONT FACE=ARIAL SIZE=2><B>&nbsp;&nbsp;Message:</B></FONT><BR>
<CENTER><TEXTAREA NAME=message ROWS=15 COLS=55 MAXLENGTH=500></TEXTAREA></CENTER></TD></TR>
</TABLE><P>
<CENTER><INPUT TYPE=SUBMIT VALUE="        Send E-Mail        ">&nbsp;<INPUT TYPE=RESET VALUE="        Reset Form        "></CENTER>
</CFFORM>

<CFELSE>

<CFMAIL
TO="spape@firsttitleservices.com,titleorders@yahoo.com,sdari@firsttitleservices.com,nstol@firsttitleservices.com"
FROM="#from#" SUBJECT = "Email from Paper Master Web Site"
>

The following was sent on #datnow# - #timnow#


#message#

</CFMAIL>

Thank you for your interest.  One of our representatives will contact you shortly.

</CFIF>


</td></tr></table></NOBR></td></tr></table></NOBR>


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
