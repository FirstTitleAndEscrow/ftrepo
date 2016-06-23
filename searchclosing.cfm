<CFQUERY DATASOURCE="First_Title_Services" NAME="readin">
SELECT adminID, adminlogin, adminpassword
FROM admin
WHERE adminlogin = '#adminlogin#' AND adminpassword = '#adminpassword#'
</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">


<CFQUERY DATASOURCE="First_Title_Services" name="get_acct">
SELECT DISTINCT orderid
FROM orders
ORDER BY orderid
</CFQUERY>

<CFQUERY DATASOURCE="First_Title_Services" name="get_comp">
SELECT company
FROM login
ORDER BY company
</CFQUERY>

<CFIF readin.recordcount NEQ 1>


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
		<B>1st Title & Escrow, Inc. - Administration</B>
		<p>
		</td>
		</tr>

		<tr>

		<td width=455 align=center valign=top>
			<font size=2 color=black face=arial>
			Sorry, your Login ID and Password were not valid.<p>
			<a href="./adminlogin.cfm">Back</a> to login.
		</td>
		</tr>
		</table>



    </td>
  </tr>
</table>
  </td>
  </tr>
</table>


<CFELSE>


<html>
<head>
	<title>1st Title & Escrow, Inc. - Admin Main Page</title>
</head>

<body leftmargin="0" topmargin="0" marginheight = "0" marginwidth = "0">
<table width=620 border="0" cellpadding="0" cellspacing="0"><tr><nobr><td colspan="2" valign=bottom><IMG height=1 src="./images/clear.gif" width=10><IMG src="./images/logo.gif"><b><font size=2 color=red face=arial><IMG height=1 src="./images/clear.gif" width=30><cfoutput> #datnow# - #timnow#</CFOUTPUT> (EST)</b></FONT></td></tr><tr><td colspan="2" valign="top"><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/bar.gif"></td></tr><tr><td width="145" valign="top"><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_01.gif"><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_02.gif"><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_03.gif"><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_04.gif"><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_05.gif"><br><IMG height=1 src="./images/clear.gif" width=20><IMG border=0 src="./images/nav_06.gif"><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_07.gif"><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_08.gif"><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_09.gif"><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_10.gif"><br><IMG height=1 src="./images/clear.gif" width=20><IMG src="./images/nav_11.gif"><br></td><td>

<TABLE WIDTH=455 BORDER=0 CELLSPACING=0 align="center">
<TR>
<TD ALIGN=middle>
<FONT FACE=ARIAL COLOR="red" SIZE=6>Search Closings</FONT>
<p>
<A href="./adminhelp.htm" target=new>Click Here for Help</a>

<HR>
<FONT SIZE=2 FACE=ARIAL></FONT>


<FORM METHOD=post ACTION="./closingresult.cfm">

<TABLE bgcolor="blue" BORDER=1 CELLSPACING=0 cellpadding=3 width="455" align=center>

<TR bgcolor="blue"><TD align=middle><font face=arial size=2 color=white>Input date or name to search:</font>     </TD></TR>

<tr><td>

<TABLE BORDER=1 CELLSPACING=0 cellpadding=3 align=left width="455" >


  <TR><TD ALIGN=right bgcolor="#a2a3fe"><FONT FACE=ARIAL SIZE=2>Month:</FONT></TD><TD bgcolor="#a2a3fe">
<select name="start_month_pass">
	 	<option value="">Month</option>
	   	<option value="Jan">January</option>
		<option value="Feb">February</option>
		<option value="Mar">March</option>
		<option value="Apr">April</option>
		<option value="May">May</option>
		<option value="Jun">June</option>
		<option value="Jul">July</option>
		<option value="Aug">August</option>
		<option value="Sep">September</option>
		<option value="Oct">October</option>
		<option value="Nov">November</option>
		<option value="Dec">December</option>
</select>
<!--- <select name="start_day">
	 	<OPTION VALUE="">Day</OPTION>
		<OPTION VALUE="01">01</OPTION>
		<OPTION VALUE="02">02</OPTION>
		<OPTION VALUE="03">03</OPTION>
		<OPTION VALUE="04">04</OPTION>
		<OPTION VALUE="05">05</OPTION>
		<OPTION VALUE="06">06</OPTION>
		<OPTION VALUE="07">07</OPTION>
		<OPTION VALUE="08">08</OPTION>
		<OPTION VALUE="09">09</OPTION>
		<OPTION VALUE="10">10</OPTION>
		<OPTION VALUE="11">11</OPTION>
		<OPTION VALUE="12">12</OPTION>
		<OPTION VALUE="13">13</OPTION>
		<OPTION VALUE="14">14</OPTION>
		<OPTION VALUE="15">15</OPTION>
		<OPTION VALUE="16">16</OPTION>
		<OPTION VALUE="17">17</OPTION>
		<OPTION VALUE="18">18</OPTION>
		<OPTION VALUE="19">19</OPTION>
		<OPTION VALUE="20">20</OPTION>
		<OPTION VALUE="21">21</OPTION>
		<OPTION VALUE="22">22</OPTION>
		<OPTION VALUE="23">23</OPTION>
		<OPTION VALUE="24">24</OPTION>
		<OPTION VALUE="25">25</OPTION>
		<OPTION VALUE="26">26</OPTION>
		<OPTION VALUE="27">27</OPTION>
		<OPTION VALUE="28">28</OPTION>
		<OPTION VALUE="29">29</OPTION>
		<OPTION VALUE="30">30</OPTION>
		<OPTION VALUE="31">31</OPTION>
</select>
<select name="start_year">
		<option value="">Year</option>
	   	<option value="00">2000</option>
		<option value="01">2001</option>
		<option value="02">2002</option>
		<option value="03">2003</option>
		<option value="04">2004</option>
		<option value="05">2005</option>
		<option value="06">2006</option>
		<option value="07">2007</option>
		<option value="08">2008</option>
		<option value="09">2009</option>
		<option value="10">2010</option>
		</select>
</TD></TR>

  <TR>
  <TD ALIGN=right bgcolor="#a2a3fe"><FONT FACE=ARIAL SIZE=2>End Date: </FONT></TD>
<TD bgcolor="#a2a3fe">

<select name="end_month">
	 	<option value="">Month</option>
	   	<option value="Jan">January</option>
		<option value="Feb">February</option>
		<option value="Mar">March</option>
		<option value="Apr">April</option>
		<option value="May">May</option>
		<option value="Jun">June</option>
		<option value="Jul">July</option>
		<option value="Aug">August</option>
		<option value="Sep">September</option>
		<option value="Oct">October</option>
		<option value="Nov">November</option>
		<option value="Dec">December</option>
</select>
<select name="end_day">
	 	<OPTION VALUE="">Day</OPTION>
		<OPTION VALUE="01">01</OPTION>
		<OPTION VALUE="02">02</OPTION>
		<OPTION VALUE="03">03</OPTION>
		<OPTION VALUE="04">04</OPTION>
		<OPTION VALUE="05">05</OPTION>
		<OPTION VALUE="06">06</OPTION>
		<OPTION VALUE="07">07</OPTION>
		<OPTION VALUE="08">08</OPTION>
		<OPTION VALUE="09">09</OPTION>
		<OPTION VALUE="10">10</OPTION>
		<OPTION VALUE="11">11</OPTION>
		<OPTION VALUE="12">12</OPTION>
		<OPTION VALUE="13">13</OPTION>
		<OPTION VALUE="14">14</OPTION>
		<OPTION VALUE="15">15</OPTION>
		<OPTION VALUE="16">16</OPTION>
		<OPTION VALUE="17">17</OPTION>
		<OPTION VALUE="18">18</OPTION>
		<OPTION VALUE="19">19</OPTION>
		<OPTION VALUE="20">20</OPTION>
		<OPTION VALUE="21">21</OPTION>
		<OPTION VALUE="22">22</OPTION>
		<OPTION VALUE="23">23</OPTION>
		<OPTION VALUE="24">24</OPTION>
		<OPTION VALUE="25">25</OPTION>
		<OPTION VALUE="26">26</OPTION>
		<OPTION VALUE="27">27</OPTION>
		<OPTION VALUE="28">28</OPTION>
		<OPTION VALUE="29">29</OPTION>
		<OPTION VALUE="30">30</OPTION>
		<OPTION VALUE="31">31</OPTION>
</select>
<select name="end_year">
		<option value="">Year</option>
	   	<option value="00">2000</option>
		<option value="2001">2001</option>
		<option value="2002">2002</option>
		<option value="2003">2003</option>
		<option value="2004">2004</option>
		<option value="2005">2005</option>
		<option value="2006">2006</option>
		<option value="2007">2007</option>
		<option value="2008">2008</option>
		<option value="2009">2009</option>
		<option value="2010">2010</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
		<OPTION VALUE="2016">2016</OPTION>
										<OPTION VALUE="2017">2017</OPTION>
										<OPTION VALUE="2018">2018</OPTION>
										<OPTION VALUE="2019">2019</OPTION>
										<OPTION VALUE="2020">2020</OPTION>
		</select> --->
</TD></TR>

</TD></TR>

  <TR><TD ALIGN=right bgcolor="#a2a3fe"><FONT FACE=ARIAL SIZE=2>Sort By:</FONT></TD>
<TD bgcolor="#a2a3fe"><SELECT name=sortorder>
<OPTION VALUE="orderdate" selected>Order Date
<OPTION VALUE="orderid">Order No.
<OPTION VALUE="blastname1">Borrower's Last Name
<OPTION VALUE="company">Account Name
</SELECT></TD></TR>


  <TR><TD ALIGN=right bgcolor="a2a3fe"><FONT FACE=ARIAL SIZE=2>Order Number:</FONT></TD>
  <TD bgcolor="a2a3fe"><SELECT name="get_id">
  <option value=""></option>
  <CFOUTPUT query="get_acct">
<OPTION VALUE="#orderid#">#orderid#</option>
</CFOUTPUT>
</SELECT></TD></TR>


  <TR><TD ALIGN=right bgcolor="#a2a3fe"><FONT FACE=ARIAL SIZE=2>Account Name:</FONT></TD>
  <TD bgcolor="#a2a3fe">
<SELECT name="company_pass">
  <option value=""></option>
  <CFOUTPUT query="get_comp">
<OPTION VALUE="#company#">#company#</option>
</CFOUTPUT>
</SELECT>
</TD></TR>

  <TR><TD ALIGN=right bgcolor="#a2a3fe">
  <FONT FACE=ARIAL SIZE=2>Borrower's Last Name:</FONT></TD>
  <TD bgcolor="#a2a3fe">
  	<INPUT NAME="blastname_pass" SIZE=25 MAXLENGTH=25 ></TD></TR>

  <TR><TD ALIGN=right bgcolor="#a2a3fe">
  	<FONT FACE=ARIAL SIZE=2>Borrower's First Name:</FONT></TD>
	<TD bgcolor="#a2a3fe"><INPUT NAME="bfirstname_pass" SIZE=25 MAXLENGTH=25 ></TD></TR>

</TABLE>


</td></tr>
<tr bgcolor=blue align=middle><td>


<cfoutput query="readin">

<input type="hidden" name="adminid" value="#adminid#"></CFOUTPUT>
<cfoutput>
<input type="hidden" name="adminlogin" value="#adminlogin#">
<input type="hidden" name="adminpassword" value="#adminpassword#">
</cfoutput>
<input type="submit" value=" Search Closings"></td></tr>
</FORM>

</TABLE><p></p>


</CFIF>

</td></tr>
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
</html>
