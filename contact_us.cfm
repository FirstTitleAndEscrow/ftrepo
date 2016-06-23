
<CFQUERY datasource="#request.dsn#" NAME="read_content">

			SELECT *
			FROM web_site
			WHERE page_id = 4

		</CFQUERY>


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

<CFOUTPUT>
	<tr>
		<td width=607 align=center valign=top>

<table width="#read_content.page_width#" cellpadding=1 cellspacing=1 border=0 bgcolor=white>



	<tr>
		<td width="#read_content.page_width#" align=center valign=top bgcolor=white>

			#read_content.page_content#

		</td>
	</tr>

	<tr>
		<td width="#read_content.page_width#" align=center valign=top >
			<p>
			<br>
			<p>
			<img src="./images/text_01.gif">
			<p>
			<br>
			<p>
			<CFINCLUDE TEMPLATE="./footer_links.cfm">
		</td>
	</tr>
</table>


</td></tr></CFOUTPUT>


</table></NOBR></td></tr></table></NOBR>


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
