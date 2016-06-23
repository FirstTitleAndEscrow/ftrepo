
<CFSET r_count = "0">


		<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM Property
			WHERE USER_ID = #user_id_1#
			ORDER BY oda_year DESC, oda_month DESC, oda_day DESC

		</CFQUERY>

		<CFSET r_count = #read_report.recordcount#>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=770 align=center valign=top>

<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=770 align=center valign=top bgcolor=e1e1e1>
			<IMG SRC="./images/logo_prop_reports.gif">

		</td>
	</tr>


<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->


	<tr>
		<td width=770 align=left valign=top bgcolor=e1e1e1>
			<nobr><a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a></NOBR>


<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

<CFOUTPUT>

<table width=770 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>

	<tr>
			<td width=770 align=left valign=top bgcolor=d3d3d3>
				<table width=770 cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=gray width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Processor
						</td>

						<td bgcolor=gray width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>

						<td bgcolor=gray width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>

						<td bgcolor=gray width=90 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<td bgcolor=gray width=90 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td>

						<td bgcolor=gray width=80 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>

						<td bgcolor=gray width=80 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td>

						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Appr?
						</td>

						<td bgcolor=gray width=80 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Appr Stat
						</td>

						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Details
						</td>
					</tr>
</CFOUTPUT>
<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">

			<CFOUTPUT QUERY="read_report">
					<tr>
						<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
					         <img src="./images/indicator_status_#order_status#.gif">
						</td>
		<CFQUERY datasource="#request.dsn#" NAME="read_pid">
			SELECT *
			FROM users
			WHERE ID = #user_id_1#
		</CFQUERY>

						<td bgcolor=#a_bgcolor# width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_pid.lp_fname# #read_pid.lp_lname#
						</td>

						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#oda_month#/#oda_day#/#oda_year#
						</td>

						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#duedate#
						</td>

						<td bgcolor=#a_bgcolor# width=90 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=90 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

						<td bgcolor=#a_bgcolor# width=80 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=80 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td>

						<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td>

						<td bgcolor=#a_bgcolor# width=80 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<a href="./prop_report_nav.cfm?uid=#USER_ID_1#&rec_id=#prop_id#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
						</td>
					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">
							</CFIF>
			</CFOUTPUT>

				</table>


<nobr><a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a></NOBR>



			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>

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


