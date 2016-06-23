
<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">

<html>
<head>
	<title>1st Title & Escrow, Inc. - Welcome</title>
</head>

<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
<table width=620 border="0" cellpadding="0" cellspacing="0"><tr><nobr><td colspan="2" valign=bottom><img src="./images/clear.gif" width="10" height="1"><img src="./images/logo.gif"><b><font size=2 color=red face=arial><img src="./images/clear.gif" width="30" height="1"><cfoutput>#datnow# - #timnow#</cfoutput> (EST)</b></td></tr><tr><td colspan="2" valign="top"><img src="./images/clear.gif" width="20" height="1"><img src="./images/bar.gif"></td></tr><tr><td width="145" valign="top"><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_01.gif"><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_02.gif"><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_03.gif"><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_04.gif"><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_05.gif"><br><img src="./images/clear.gif" width="20" height="1"><a href="./customer_login.cfm"><img src="./images/nav_06.gif" border="0"></a><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_07.gif"><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_08.gif"><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_09.gif"><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_10.gif"><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_11.gif"><br></td><td>

<TABLE WIDTH=440 BORDER=0 CELLSPACING=0 align="center">
<TR align=center>
<TD VALIGN=TOP WIDTH=440>
<FONT FACE=ARIAL COLOR="red" SIZE=4><b>Billing Statement</b></FONT>
<p>
<a href="./help.htm" target="new">Click Here for Help</a>
<HR>
<CENTER>



</TD>

<CENTER>
<FORM METHOD=POST ACTION="./bill_date.cfm">
<TABLE bgcolor="a2a3fe" BORDER=1 CELLSPACING=-1>
<TR><TD>
<TABLE BORDER=0 CELLSPACING=-1>

<TR>
  <TD ALIGN=RIGHT bgcolor="a2a3fe"><FONT FACE=ARIAL SIZE=2>Run Date:</FONT></TD>
<TD><INPUT NAME="billstatement" VALUE="" SIZE=10 MAXLENGTH=10></TD>
</TR>
</TABLE>
</TD></TR></TABLE><P>

<TABLE><TR ALIGN=CENTER VALIGN=CENTER>
    <TD><input type="submit" value="Run Report"></TD>
    <TD><input type="reset" value="Reset"></TD>
  </FORM>
  <FORM METHOD="POST" ACTION="./account_menu.cfm">

  <cfoutput>
<input type="hidden" name="acct_num" value="#acct_num#">
<input type="hidden" name="password" value="#password#">
</cfoutput>

    <TD><input type="submit" value="Back to Menu"></TD>
  </FORM>
</TR>
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

