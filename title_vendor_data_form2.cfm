<CFPARAM NAME="a_trigger" DEFAULT="">
<CFPARAM NAME="a_trig" DEFAULT="">
		<CFQUERY datasource="#request.dsn#" NAME="read_order">

			SELECT *
			FROM title
			WHERE title_id = '#url.rec_ID#'


		</CFQUERY>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="elelel" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

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







<CFINCLUDE TEMPLATE="includes/title_top_navt.cfm">



		</td>

		</tr>



	</table>


			</td>
		</tr>

	</table>

<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="white">

		<!---<tr> <td width=830 align=middle valign=top bgcolor="e1e1el">
			<IMG src="./images/logo_title_reports.gif">

		</td></tr> --->




	<tr>
		<td width=830 align=middle valign=top bgcolor=e1e1el>







<CFINCLUDE TEMPLATE="admin_area/title_committment2.cfm">



		</td>

		</tr>



	</table>

		<cfif #a_trig# eq 1>

			<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="white">

		<!---<tr> <td width=830 align=middle valign=top bgcolor="e1e1el">
			<IMG src="./images/logo_title_reports.gif">

		</td></tr> --->




	<tr>
		<td width=830 align=middle valign=top bgcolor=e1e1el>






<b><font face=verdana size=2 color=blue>All selected item(s) were successfully merged to Title Commitment!</font></b>


		</td>

		</tr>



	</table>

</cfif>


			<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="white">

		<!---<tr> <td width=830 align=middle valign=top bgcolor="e1e1el">
			<IMG src="./images/logo_title_reports.gif">

		</td></tr> --->




	<tr>
		<td width=830 align=middle valign=top bgcolor=e1e1el>





	<cfoutput>
Click here to go back to the main page.<a href="./title_abstract_doc_view_c.cfm?username=#url.username#&password=#url.password#&rec_id=#url.rec_id#&company_id=0"><img src="./images/button_return.gif" border=0 ALT="Click this button to return to main"></a>
		</cfoutput>


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





