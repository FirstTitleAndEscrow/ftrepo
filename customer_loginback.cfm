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
<table width=620 border="0" cellpadding="0" cellspacing="0"><td colspan="2" valign=bottom><IMG height=1 src="./images/clear.gif" width=10><IMG src="./images/logo.gif"><b><font size=2 color=red face=arial><IMG height=1 src="./images/clear.gif" width=30><cfoutput> #datnow# - #timnow#</CFOUTPUT> (EST)</b></FONT><img src="images/clear.gif" width=69 height=1 alt="" border="0">
<a href="./welcome.cfm"><img src="images/home.gif" width=55 height=18 alt="" border="0"></a></td></tr><tr><td colspan="2" valign="top"><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/bar.gif"></td></tr><tr><td width="145" valign="top"><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_01.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./title_services.cfm"><IMG src="./images/nav_02.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_03.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./closing_services.cfm"><IMG src="./images/nav_04.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_05.gif"><br><IMG height=1 src="./images/clear.gif" width=20><A href="./customer_login.cfm"><IMG border=0 src="./images/nav_06.gif"></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_07.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./contact_info.cfm"><IMG src="./images/nav_08.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_09.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./mail.cfm?pass=0"><IMG src="./images/nav_10.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_11.gif"><br><IMG height=1 src="./images/clear.gif" width=20><br></td>
<TD>
<CFFORM action="account_menu.cfm">
	<table border="0" align="center" width=455 cellpadding="2" cellspacing="2">
        <tr>
			<td colspan="2"  align="center" valign="top">
			<img src="images/clear.gif" width=400 height=10 alt="" border="0">
			</td>
		</tr>
		<tr>
			<td colspan="2"  align="center" valign="top">
			<font face="Arial" size="+2" color="Black">
			<b>Customer Login</b><p>
			</font>
			</td>
		</tr>
		<tr>
			<td bgcolor="blue" width="155" align="right" valign="top">
		  		<font face="arial" size="2" color="white">
			User Name:
				</font>
			</td>

			<td width="300" align="left" valign="top" bgcolor="a2a3fe">
			<cfinput NAME="acct_num" SIZE="25" MAXLENGTH="25" TABINDEX="1" required="yes" message="You must Enter your Account Number ">
			</td>
		</tr>

        <tr>
			<td bgcolor="blue" width="155" align="right" valign="top">
				<font face="arial" size="2" color="white">
			Password:
				</font>
			</td>

			<td width="300" align="left" valign="top" bgcolor="a2a3fe">
			<CFINPUT TYPE="password" NAME="password" SIZE="25" MAXLENGTH="25" TABINDEX="2" required="yes" message="You must Enter your Password">
			</td>
        </tr>

        <tr>
			<td colspan="2"  align="center" valign="top" bgcolor="blue">
				<p>

			<input type="Submit" value="Submit">
			</td>
		</tr>

	</table>
</cfform>
</td></tr></table>

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
