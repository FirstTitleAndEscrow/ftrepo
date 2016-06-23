<CFQUERY DATASOURCE="First_Title_Services" NAME="readin">
SELECT loginID, acct_num, password, company
FROM login
WHERE acct_num = '#acct_num#' AND password = '#password#'
</CFQUERY>

<cfquery name="get_oname" DATASOURCE="First_Title_Services">
SELECT DISTINCT oname
FROM customers
WHERE loginid = #readin.loginid#
ORDER BY oname
</cfquery>

<cfquery name="get_pname" DATASOURCE="First_Title_Services">
SELECT DISTINCT pname
FROM customers
WHERE loginid = #readin.loginid#
ORDER BY pname
</cfquery>

<cfquery name="getstate" DATASOURCE="First_Title_Services">
SELECT state from taxtable ORDER BY state
</cfquery>


<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">

<html>
<head>
	<title>1st Title & Escrow, Inc. - Closing- Get Customer Information</title>
</head>

<body leftmargin="0" topmargin="0" marginheight = "0" marginwidth = "0">
<table width=620 border="0" cellpadding="0" cellspacing="0"><td colspan="2" valign=bottom><IMG height=1 src="./images/clear.gif" width=10><IMG src="./images/logo.gif"><b><font size=2 color=red face=arial><IMG height=1 src="./images/clear.gif" width=30><cfoutput> #datnow# - #timnow#</CFOUTPUT> (EST)</b></FONT><img src="images/clear.gif" width=69 height=1 alt="" border="0">
<a href="./welcome.cfm"><img src="images/home.gif" width=55 height=18 alt="" border="0"></a></td></tr><tr><td colspan="2" valign="top"><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/bar.gif"></td></tr><tr><td width="145" valign="top"><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_01.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./title_services.cfm"><IMG src="./images/nav_02.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_03.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./closing_services.cfm"><IMG src="./images/nav_04.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_05.gif"><br><IMG height=1 src="./images/clear.gif" width=20><A href="./customer_login.cfm"><IMG border=0 src="./images/nav_06.gif"></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_07.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./contact_info.cfm"><IMG src="./images/nav_08.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_09.gif"><br><IMG height=1 src="./images/clear.gif" width=20><a href="./mail.cfm?pass=0"><IMG src="./images/nav_10.gif" border=0></a><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_11.gif"><br><IMG height=1 src="./images/clear.gif" width=20><br></TD><TD>

<TABLE WIDTH=440 BORDER=0 CELLSPACING=0 cellpadding=3 align="center">
                <TBODY>
<TR>
<TD align=middle>
<FONT FACE=ARIAL COLOR="red" SIZE=4><b><CFOUTPUT query="readin">#company#</CFOUTPUT>:<BR> Closing - Customer Information</b></FONT>
<p>You will receive your closing confirmation report no later than 24 hours from time requested.<p>
<A href="./preclosinghelp.htm" target=new>Click Here for Help</a>
<HR>

</TD></td>

<CENTER>

<tr><td>


<FORM METHOD=post ACTION="./preclosing2.cfm">
<TABLE bgcolor="#a2a3fe" BORDER=0 CELLSPACING=0 cellpadding=3><TR><TD>
<TABLE BORDER=1 CELLSPACING=0 cellpadding=3 align=left>

  <tr><td align=left colspan=2><b>Please enter any of the requested information in the box below to search for your closing request(s).</b></td></tr>


 <TR><TD ALIGN=right bgcolor="#a2a3fe">
  <FONT FACE=ARIAL SIZE=2>Borrower's Last Name:</FONT></TD>
  <TD bgcolor="#a2a3fe"><INPUT NAME="blastname1" SIZE=25 MAXLENGTH=25 ></TD></TR>

  <TR><TD ALIGN=right bgcolor="#a2a3fe"><FONT FACE=ARIAL SIZE=2>Borrower's First Name:</FONT></TD><TD bgcolor="#a2a3fe"><INPUT NAME="bfirstname1" SIZE=25 MAXLENGTH=25 ></TD></TR>

  <TR><TD ALIGN=right bgcolor="#a2a3fe"><FONT FACE=ARIAL SIZE=2>Loan Officer:</FONT></TD><TD bgcolor="#a2a3fe">
<SELECT name="oname">
<OPTION value=""></OPTION>
<CFOUTPUT query="get_oname">
<CFIF #oname# NEQ "">
<OPTION value="#oname#">#oname#</OPTION>
</CFIF>
</CFOUTPUT>
</SELECT>
</TD></TR>


  <TR><TD ALIGN=right bgcolor="#a2a3fe"><FONT FACE=ARIAL SIZE=2>Loan Processor:</FONT></TD><TD bgcolor="#a2a3fe"><SELECT name="pname">
<OPTION value=""></OPTION>
<CFOUTPUT query="get_pname">
<CFIF #pname# NEQ "">
<OPTION value="#pname#">#pname#</OPTION>
</CFIF>
</CFOUTPUT>
</SELECT>
</TD></TR>

<!---<TR><TD ALIGN=right bgcolor="#a2a3fe"><FONT FACE=ARIAL SIZE=2>Customer Information No.:</FONT></TD><TD bgcolor="#a2a3fe"><INPUT NAME="customerid" SIZE=25 MAXLENGTH=25 value=""></TD></TR>--->



<TR><TD ALIGN=right bgcolor="#a2a3fe"><FONT FACE=ARIAL SIZE=2>State of Property:</FONT></TD><TD bgcolor="#a2a3fe">
<select name="pstate">
<option value="">State
<cfoutput query="getstate">
<option value="#state#">#state#
</cfoutput>
</select>

</TD></TR>


</TABLE>



</TD></TR></TABLE><P>
<TABLE>
                            <TBODY><TR ALIGN=middle VALIGN=center>

<cfoutput>
<input type="hidden" name="loginid" value="#loginid#">
<input type="hidden" name="acct_num" value="#acct_num#">
<input type="hidden" name="password" value="#password#"></CFOUTPUT>
    <TD><input type="submit" value="Search"></TD>
    <TD><input type="reset" value="Reset"></TD>
  </FORM>

  <FORM METHOD="post" ACTION="./account_menu.cfm">
  <cfoutput>
  <input type="hidden" name="loginid" value="#loginid#">
<input type="hidden" name="acct_num" value="#acct_num#">
<input type="hidden" name="password" value="#password#"></CFOUTPUT>

    <TD><input type="submit" value="Back to Menu"></TD>
  </FORM>
</tr></table>
                        <CENTER></CENTER>
<P><HR>
                        </TD></TR></TBODY></TABLE></CENTER></TD></TR></TBODY></TABLE></NOBR>



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

