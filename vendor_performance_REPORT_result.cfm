<CFPARAM NAME="vendor"     DEFAULT="">
<CFPARAM NAME="state"       DEFAULT="">
<CFPARAM NAME="county"       DEFAULT="">
<CFPARAM NAME="foo"       DEFAULT="">
<CFPARAM NAME="coo"       DEFAULT="">
<CFPARAM NAME="a_trigger"       DEFAULT="0">


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. Vendor Area</title>

</head>

<BODY BGCOLOR="FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>


<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width="98%" align=center valign=top>

<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>


	<tr>
		<td width="98%" align=center valign=top bgcolor=white>

<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->


<table width="100%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width="100%" align=left valign=top bgcolor=white>
				<FONT FACE=ARIAL SIZE=2 color="black"><br>
				<CENTER><B>Vendor Performance Result </B></CENTER>
			</TD>
		</TR>

<tr>
			<td width="100%" align=center valign=top bgcolor=d3d3d3>
				<table width="100%" cellpadding=1 cellspacing=1 border=0>

<cfif #vendor# neq "">

		<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM Title a, doc_abstract_title b
			WHERE a.title_id = b.title_id and b.a_date_assigned is not null and b.a_date_completed is not null


<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (a_date_assigned between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>

			<CFIF #vendor# NEQ "">
				AND b.abstractor_id = #vendor#

			</CFIF>

			 </CFQUERY>


		<CFSET r_count = #read_report.recordcount#>


				<tr>
		<td width="98%" align=left valign=top bgcolor=e1e1e1>
			<!--- <a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a> --->


<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<CFIF #r_count# NEQ "0">

<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width="98%" align=center valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;&nbsp;R e s u l t s </B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width="98%" align=center valign=top bgcolor=d3d3d3>
				<table width="98%" cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Number
						</td>
							<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						Date Assigned
						</td>
						<td bgcolor=gray width=280 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Vendor name
						</td>

						<td bgcolor=gray width=180 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Performance time
						</td>


					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">



			<CFOUTPUT QUERY="read_report">

			<CFQUERY datasource="#request.dsn#" NAME="read_abs">

			SELECT *
			FROM abstractors
			WHERE abstractor_id = #abstractor_id#
			</cfquery>
					<tr>
						<td bgcolor="#a_bgcolor#" width=20 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#title_id#
						</td>
<td bgcolor="#a_bgcolor#" width=20 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(a_date_assigned, "m/d/yyyy")#
						</td>
						<td bgcolor="#a_bgcolor#" width=280 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_abs.company#
						</td>




			<td bgcolor="#a_bgcolor#" width=180 align=right valign=top>

						<cfif #a_date_assigned# neq "" and #a_date_completed# neq "" and #a_time_assigned# neq "" and #a_time_completed# neq "">
						<FONT FACE=verdana SIZE=1 color="black">
						Days:#DATEDIFF("d", a_date_assigned, a_date_completed)#&nbsp;Hours:#DATEDIFF("h", a_time_assigned, a_time_completed)#
					</cfif></td>
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



</CFIF>
<cfelseif #vendor# eq "" and #state# neq "" and #county# neq "">
		<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM Title a, doc_abstract_title b
			WHERE a.title_id = b.title_id and a.pstate = '#state#' and a.pcounty = '#county#' and b.a_date_assigned is not null and b.a_date_completed is not null


<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (a_date_assigned between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>

			<CFIF #vendor# NEQ "">
				AND b.abstractor_id = #vendor#

			</CFIF>

			 </CFQUERY>


		<CFSET r_count = #read_report.recordcount#>


				<tr>
		<td width="98%" align=left valign=top bgcolor=e1e1e1>
			<!--- <a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a> --->


<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<CFIF #r_count# NEQ "0">

<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width="98%" align=center valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;&nbsp;R e s u l t s </B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width="98%" align=center valign=top bgcolor=d3d3d3>
				<table width="98%" cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Number
						</td>
							<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Date Assigned
						</td>
						<td bgcolor=gray width=280 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Vendor name
						</td>

						<td bgcolor=gray width=180 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Performance time
						</td>


					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">



			<CFOUTPUT QUERY="read_report">

			<CFQUERY datasource="#request.dsn#" NAME="read_abs">

			SELECT *
			FROM abstractors
			WHERE abstractor_id = #abstractor_id#
			</cfquery>
					<tr>
						<td bgcolor="#a_bgcolor#" width=20 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#title_id#
						</td>
<td bgcolor="#a_bgcolor#" width=20 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(a_date_assigned, "m/d/yyyy")#
						</td>
						<td bgcolor="#a_bgcolor#" width=280 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_abs.company#
						</td>




			<td bgcolor="#a_bgcolor#" width=180 align=right valign=top>

						<cfif #a_date_assigned# neq "" and #a_date_completed# neq "" and #a_time_assigned# neq "" and #a_time_completed# neq "">
						<FONT FACE=verdana SIZE=1 color="black">
						Days:#DATEDIFF("d", a_date_assigned, a_date_completed)#&nbsp;Hours:#DATEDIFF("h", a_time_assigned, a_time_completed)#
					</cfif></td>
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



</CFIF>

<cfelseif #county# eq "" and #state# neq "" and #vendor# eq "">


<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM Title a, doc_abstract_title b
			WHERE a.title_id = b.title_id and a.pstate = '#state#' and b.a_date_assigned is not null and b.a_date_completed is not null


<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (a_date_assigned between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>


			 </CFQUERY>


		<CFSET r_count = #read_report.recordcount#>


				<tr>
		<td width="98%" align=left valign=top bgcolor=e1e1e1>
			<!--- <a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a> --->


<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<CFIF #r_count# NEQ "0">

<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width="98%" align=center valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;&nbsp;R e s u l t s </B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width="98%" align=center valign=top bgcolor=d3d3d3>
				<table width="98%" cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Number
						</td>
							<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Date Assigned
						</td>
						<td bgcolor=gray width=280 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Vendor name
						</td>

						<td bgcolor=gray width=180 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Performance time
						</td>


					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">



			<CFOUTPUT QUERY="read_report">

			<CFQUERY datasource="#request.dsn#" NAME="read_abs">

			SELECT *
			FROM abstractors
			WHERE abstractor_id = #abstractor_id#
			</cfquery>
					<tr>
						<td bgcolor="#a_bgcolor#" width=20 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#title_id#
						</td>
<td bgcolor="#a_bgcolor#" width=20 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(a_date_assigned, "m/d/yyyy")#
						</td>
						<td bgcolor="#a_bgcolor#" width=280 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_abs.company#
						</td>




			<td bgcolor="#a_bgcolor#" width=180 align=right valign=top>

						<cfif #a_date_assigned# neq "" and #a_date_completed# neq "" and #a_time_assigned# neq "" and #a_time_completed# neq "">
						<FONT FACE=verdana SIZE=1 color="black">
						Days:#DATEDIFF("d", a_date_assigned, a_date_completed)#&nbsp;Hours:#DATEDIFF("h", a_time_assigned, a_time_completed)#
					</cfif>	</td>
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



</CFIF>
<cfelse>

<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM Title a, doc_abstract_title b
			WHERE a.title_id = b.title_id and b.a_date_assigned is not null and b.a_date_completed is not null


<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (a_date_assigned between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>

			<CFIF #vendor# NEQ "">
				AND b.abstractor_id = #vendor#

			</CFIF>

			 </CFQUERY>


		<CFSET r_count = #read_report.recordcount#>


				<tr>
		<td width="98%" align=left valign=top bgcolor=e1e1e1>
			<!--- <a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a> --->


<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<CFIF #r_count# NEQ "0">

<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width="98%" align=center valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;&nbsp;R e s u l t s </B></CENTER>
			</TD>
		</TR>
	<tr>
			<td width="98%" align=center valign=top bgcolor=d3d3d3>
				<table width="98%" cellpadding=1 cellspacing=1 border=0>

					<tr>
						<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Number
						</td>
									<td bgcolor=gray width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Date Assigned
						</td>
						<td bgcolor=gray width=280 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Vendor name
						</td>

						<td bgcolor=gray width=180 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Performance time
						</td>


					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">



			<CFOUTPUT QUERY="read_report">

			<CFQUERY datasource="#request.dsn#" NAME="read_abs">

			SELECT *
			FROM abstractors
			WHERE abstractor_id = #abstractor_id#
			</cfquery>
					<tr>
						<td bgcolor="#a_bgcolor#" width=20 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#title_id#
						</td>
<td bgcolor="#a_bgcolor#" width=20 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(a_date_assigned, "m/d/yyyy")#
						</td>
						<td bgcolor="#a_bgcolor#" width=280 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_abs.company#
						</td>




			<td bgcolor="#a_bgcolor#" width=180 align=right valign=top>
							<cfif #a_date_assigned# neq "" and #a_date_completed# neq "" and #a_time_assigned# neq "" and #a_time_completed# neq "">
						<FONT FACE=verdana SIZE=1 color="black">
						Days:#DATEDIFF("d", a_date_assigned, a_date_completed)#&nbsp;Hours:#DATEDIFF("h", a_time_assigned, a_time_completed)#
					</cfif>
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



</CFIF>

</cfif>
			</TD>
		</TR>






</table>





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


