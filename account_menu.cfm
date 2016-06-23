<CFQUERY DATASOURCE="First_Title_Services" NAME="readin">
SELECT loginID, acct_num, password, company
FROM login
WHERE acct_num = '#acct_num#' AND password = '#password#' AND del_flag = 'no'
</CFQUERY>


<CFIF readin.recordcount EQ 0>

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







		<table width=550 cellpadding=1 cellspacing=1 border=0>

		<tr>
		<td width=550 colspan=2 align=center valign=top>
			<img src="images/clear.gif" width=550 height=10 alt="" border="0">
		</td>
		</tr>
		<tr>
		<td width=550 colspan=2 align=center valign=top>
			<font size=3 align=center color=blue face=arial>
		<B>Member - Account Management</B>
		<p>
		</td>
		</tr>

		<tr>

		<td width=550 align=center valign=top>
			<font size=2 color=black face=arial>
			Sorry, your ID Number and Password were not valid.<p>
			<a href="./customer_login.cfm">Back</a> to login.
		</td>
		</tr>
		</table>

</TD></TR></TABLE>

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


<CFELSE>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">
<html>
<head>
	<title>1st Title & Escrow, Inc. - Welcome</title>
</head>

<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
<table width=620 border="0" cellpadding="0" cellspacing="0"><tr><nobr><td colspan="2" valign=bottom><IMG height=1 src="./images/clear.gif" width=10><IMG src="./images/logo.gif"><b><font size=2 color=red face=arial><IMG height=1 src="./images/clear.gif" width=30><cfoutput> #datnow# - #timnow#</CFOUTPUT> (EST)</b></FONT><img src="images/clear.gif" width=69 height=1 alt="" border="0">
<a href="./welcome.cfm"><img src="images/home.gif" width=55 height=18 alt="" border="0"></a></td></tr><tr><td colspan="2" valign="top"><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/bar.gif"></td></tr><tr><td width="145" valign="top"><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_01.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./title_services.cfm"><IMG src="./images/nav_02.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_03.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./closing_services.cfm"><IMG src="./images/nav_04.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_05.gif"><br><IMG height=1 src="./images/clear.gif" width=20><A href="./customer_login.cfm"><IMG border=0 src="./images/nav_06.gif"></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_07.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./contact_info.cfm"><IMG src="./images/nav_08.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_09.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./mail.cfm?pass=0"><IMG src="./images/nav_10.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_11.gif"><br><IMG height=1 src="./images/clear.gif" width=20><br></td><td>
<TABLE WIDTH=440 BORDER=0 CELLSPACING=-1 align="center">
<TR>
<TD ALIGN=CENTER>
<FONT FACE=ARIAL COLOR="red" SIZE=6>Account Menu</FONT>
<HR>
<FONT SIZE=2 FACE=ARIAL>
<cfoutput query="readin">
<b>Welcome, #Ucase("#company#")#</b>
</cfoutput>
<HR>
</TD>
</TR>
<!---</TABLE>--->
<TABLE WIDTH=440 BORDER=1 CELLSPACING=-1 align="center">
<TR BGCOLOR="blue">
<TD ALIGN=CENTER>
<FONT SIZE=3 FACE=ARIAL color="white">
<B>Services</B>
</FONT>
</TD>
</TR>

<cfoutput query="readin">


<CFIF #loginid# EQ "52" >

<CFSET loginid = "51">



<CFSET login_id = "51">

<CFELSE>

<CFSET login_id = #loginid#>


</CFIF>




<TR>
<TD>
<FONT SIZE=2 FACE=ARIAL>
<a href="./place_order.cfm?loginid=#login_id#&acct_num=#acct_num#&password=#password#">Place Title / Prop Order with or without Appraisal </a>
</FONT>
</TD>
</TR>


<TR>
<TD>
<FONT SIZE=2 FACE=ARIAL>
<a href="./appraisal_order.cfm?loginid=#login_id#&acct_num=#acct_num#&password=#password#">Appraisal Only </a>
</FONT>
</TD>
</TR>


<TR>
<TD>
<FONT SIZE=2 FACE=ARIAL>
<a href="./preclosing.cfm?loginid=#login_id#&acct_num=#acct_num#&password=#password#">Set Up Closing</a>
</FONT>
</TD>
</TR>
</TABLE>
<P>


<TABLE WIDTH=440 BORDER=1 CELLSPACING=-1 align="center">
<TR BGCOLOR="blue">
<TD ALIGN=CENTER>
<FONT SIZE=3 FACE=ARIAL color="white">
<B>Reports</B>
</FONT>
</TD>
</TR>

<CFIF #acct_num# NEQ "nova">

<CFIF #loginid# EQ "52" >

<CFSET loginid = "51">



<CFSET login_id = "51">

<CFELSE>

<CFSET login_id = #loginid#>


</CFIF>

<TR>
<TD>
<FONT SIZE=2 FACE=ARIAL>
<A HREF="./order_status.cfm?loginid=#login_id#&acct_num=#acct_num#&password=#password#">Title / Prop  Status</A>
</FONT>
</TD>
</TR>




<TR>
<TD>
<FONT SIZE=2 FACE=ARIAL>
<A HREF="./appraisal_status.cfm?loginid=#login_id#&acct_num=#acct_num#&password=#password#">Appraisal Status</A>
</FONT>
</TD>
</TR>


<!--- <TR>
<TD>
<FONT SIZE=2 FACE=ARIAL>
<A HREF="./open_order.cfm?loginid=#login_id#&acct_num=#acct_num#&password=#password#">Open Order Status</A>
</FONT>
</TD>
</TR --->

<TR>
<TD>
<FONT SIZE=2 FACE=ARIAL>
<A HREF="./closing_status.cfm?loginid=#login_id#&acct_num=#acct_num#&password=#password#">Closing Status</A>
</FONT>
</TD>
</TR>


<!--- <TR>
<TD>
<FONT SIZE=2 FACE=ARIAL>
<A HREF="./open_closing.cfm?loginid=#login_id#&acct_num=#acct_num#&password=#password#">Open Closing Status</A>
</FONT>
</TD>
</TR> --->

<TR>
<TD>
<FONT SIZE=2 FACE=ARIAL>
<A HREF="./open_detail.cfm?loginid=#login_id#&acct_num=#acct_num#&password=#password#">Combined Detail Report</A>
</FONT>
</TD>
</TR>

</CFIF>

</cfoutput>
</TABLE>

<div align="center"><A HREF="./welcome.cfm">Logout</A></div>

</TD></TR>
</TABLE>
</CENTER>
</CFIF>
</TD></TR>
</TABLE>




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
