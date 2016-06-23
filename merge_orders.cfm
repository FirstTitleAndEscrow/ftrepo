

	<CFQUERY datasource="#request.dsn#" NAME="get_comp">
	SELECT *
	FROM login a, companies b
	WHERE a.company = b.company and a.t_status is null order by a.company
</CFQUERY>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>

	<title>1st Title & Esc. Settlement Services Company & Subsid. Companies<</title>

</head>

<BODY BGCOLOR="#ffffff" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

<CENTER>



<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td>




	<tr>
		<td width=780 align=middle valign=top><!---  onSubmit="CheckForm();" --->
<CFFORM name = "frm" ACTION="./import_orders.cfm" METHOD="POST">

	<table bgcolor=gray border="0" width="100%" cellpadding="1" cellspacing="1">
		<tr>
			<td bgcolor="d3d3d3" colspan=2  width="100%" align="middle" valign="top">
			<br><br><br><br><br><br>
			<font face="Arial" size="2" color="black">
			<b> Select client below to merge orders to the new site<br><br>
			<select name="comp"
											size="1"
											style="font-size: 9;
											font-family: verdana;
											font-style: normal;
											color: 003F1E;
											background-color: E4E3E3;
											border-color: white;
											border-left-width: thin;
											border-right-width: thin;
											border-top-width: thin;
											border-bottom-width: thin;
											border-width: thin;
											border-style: bar;
											clear: none;
											float: none;"
											rows="3"
											cols="45"
											>
								<cfoutput query="get_comp">
								<CFQUERY datasource="#request.dsn#" NAME="get_orders">
	SELECT *
	FROM orders
	WHERE loginid = #get_comp.loginid#
</CFQUERY>	<cfif #get_orders.recordcount# GT 0><OPTION VALUE="#company#">#Company#</OPTION></cfif></cfoutput>
								</select>
			</b>
			</font>
			</td>
		</tr>
	<tr>
			<td bgcolor="d3d3d3" colspan=2 width="100%" align="middle" valign="top">
			<br><br>
			<INPUT TYPE=image SRC="./images/button_submit.gif" border=0>
			</td>
	</tr>
	</table>
	</CFFORM>


<tr><td width=780 align=left valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr></TBODY></TABLE>
</CENTER>
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
