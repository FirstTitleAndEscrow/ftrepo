
<CFQUERY datasource="#request.dsn#" NAME="read_single_login">
SELECT *
FROM single_logins
WHERE companies_id = #read_user.comp_id#
</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_companies">

			SELECT *
			FROM companies
			WHERE ID = #read_user.comp_ID#

		</CFQUERY>

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
<cfoutput>
			<b>Welcome, #Ucase("#read_companies.company#")#</b>
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

<cfoutput query="read_user">

	<TR>
		<TD>
			<FONT SIZE=2 FACE=ARIAL>
			<a href="./place_order.cfm?uid=#id#">Place Title / Prop Order with or without Appraisal </a>
			</FONT>
		</TD>
	</TR>

	<TR>
		<TD>
			<FONT SIZE=2 FACE=ARIAL>
			<a href="./appraisal_order.cfm?uid=#id#">Appraisal Only </a>
			</FONT>
		</TD>
	</TR>

	<TR>
		<TD>
			<FONT SIZE=2 FACE=ARIAL>
			<a href="./preclosing.cfm?uid=#id#">Set Up Closing</a>
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

	<TR>
		<TD>
			<FONT SIZE=2 FACE=ARIAL>
			<A HREF="./order_status.cfm?uid=#id#">Title / Prop  Status</A>
			</FONT>
		</TD>
	</TR>

	<TR>
		<TD>
			<FONT SIZE=2 FACE=ARIAL>
			<A HREF="./appraisal_status.cfm?uid=#id#">Appraisal Status</A>
			</FONT>
		</TD>
	</TR>

	<TR>
		<TD>
			<FONT SIZE=2 FACE=ARIAL>
			<A HREF="./closing_status.cfm?uid=#id#">Closing Status</A>
			</FONT>
		</TD>
	</TR>

	<TR>
		<TD>
			<FONT SIZE=2 FACE=ARIAL>
			<A HREF="./open_detail.cfm?uid=#id#">Combined Detail Report</A>
			</FONT>
		</TD>
	</TR>



</cfoutput>
</TABLE>

<div align="center"><A HREF="./welcome.cfm">Logout</A></div>

</TD></TR>
</TABLE>
</CENTER>







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
