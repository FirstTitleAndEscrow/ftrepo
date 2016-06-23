<cfquery name="getorderinfo" DATASOURCE="First_Title_Services">
select * from orders where status = 'cancelled'
order by servicetype, orderid, orderdate
</cfquery>

<cfquery name="getclosinginfo" DATASOURCE="First_Title_Services">
select * from closing where status = 'cancelled'
order by closingid, orderdate
</cfquery>



<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">
<html>
<head>
	<title>1st Title & Escrow, Inc - Show All Orders</title>
</head>

<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
<table width=620 border="0" cellpadding="0" cellspacing="0"><tr><nobr><td colspan="2" valign=bottom><img src="./images/clear.gif" width="10" height="1"><img src="./images/logo.gif"><b><font size=2 color=red face=arial><img src="./images/clear.gif" width="30" height="1"><cfoutput>#datnow# - #timnow#</cfoutput> (EST)</b></td></tr><tr><td colspan="2" valign="top"><img src="./images/clear.gif" width="20" height="1"><img src="./images/bar.gif"></td></tr><tr><td width="145" valign="top"><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_01.gif"><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_02.gif"><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_03.gif"><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_04.gif"><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_05.gif"><br><img src="./images/clear.gif" width="20" height="1"><a href="./customer_login.cfm"><img src="./images/nav_06.gif" border="0"></a><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_07.gif"><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_08.gif"><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_09.gif"><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_10.gif"><br><img src="./images/clear.gif" width="20" height="1"><img src="./images/nav_11.gif"><br></td><td>


<TABLE WIDTH=440 BORDER=0 CELLSPACING=-1 align="center">
<TR>
<TD ALIGN=CENTER>
<FONT FACE=ARIAL COLOR="red" SIZE=4>Admin - All Orders</FONT>
<HR>


</TD>
</TR>
</TABLE>


<table border=1 cellspacing=0 cellpadding=3 align=center>
<tr align=center><FONT SIZE=2 FACE=ARIAL>
	<td><FONT SIZE=2 FACE=ARIAL><b>Order No.</b></td>
	<td><FONT SIZE=2 FACE=ARIAL><b>Product</b></td>
	<td><FONT SIZE=2 FACE=ARIAL><b>Order Date</b></td>
	<td><FONT SIZE=2 FACE=ARIAL><b>Status</b></td>
	<td><FONT SIZE=2 FACE=ARIAL><b>Edit</b></td>
</tr>

<cfoutput query="getorderinfo">
<tr align=center>
    <td><FONT SIZE=2 FACE=ARIAL>#orderid#</td>
	<td><FONT SIZE=2 FACE=ARIAL>#servicetype#</td>
	<td><FONT SIZE=2 FACE=ARIAL>#orderdate#</td>
	<td><FONT SIZE=2 FACE=ARIAL>#status#</td>
	<td><a href="./detailorder.cfm?orderid=#orderid#&adminid=#adminid#&adminlogin=#adminlogin#&adminpassword=#adminpassword#"><FONT SIZE=2 FACE=ARIAL>Detail/Update/Delete</a></td>
</tr></cfoutput>

</table>


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
