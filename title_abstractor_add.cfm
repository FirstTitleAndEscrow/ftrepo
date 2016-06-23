

		<CFQUERY datasource="#request.dsn#" NAME="read_order">

			SELECT *
			FROM TRANSUNIONMAST
			WHERE order_num = '#url.rec_ID#'


		</CFQUERY>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="#ffffff" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

<CENTER>
<CENTER>
<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="gray">
	<tr>
		<td width=830 align=middle valign=top>

<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="white">

		<!---<tr> <td width=830 align=middle valign=top bgcolor="e1e1el">
			<IMG src="./images/logo_title_reports.gif">

		</td></tr> --->




	<tr>
		<td width=830 align=middle valign=top bgcolor=e1e1el>




	<CFINCLUDE TEMPLATE="./includes/title_top_nava.cfm">



<CFOUTPUT>
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=bfbfbf>
	<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>ORDER INFO</B></CENTER></FONT>
			</td>
		</tr>

			<TR>
			<TD width=519 align=center valign=top bgcolor=blue>
				<FONT SIZE=3 color=white face=arial>
				Order Number is...<b>#read_order.order_num#</b>
				 </FONT>
			</TD>
		</TR><br><br>
		<TR>
			<TD width=519 align=center valign=top bgcolor=gray>
				<FONT SIZE=2 color=white face=arial>
				<b>Click in any buttons above to add data</b>
				 </FONT>
			</TD>
		</TR>


		</TD>
	</TR>
</TABLE>
</CFOUTPUT>

		</td>

		</tr>



	</table>


			</td>
		</tr>

	</table></CENTER></CENTER>

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





