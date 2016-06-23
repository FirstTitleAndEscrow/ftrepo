



		<CFQUERY datasource="#request.dsn#" NAME="read_Title">

			SELECT *
			FROM Title
			WHERE Title_ID = #rec_ID#


		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = #read_Title.comp_ID#

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_title_co">
			SELECT *
			FROM Title_companies
			WHERE Title_co_ID = 7
		</CFQUERY>



		<CFQUERY datasource="#request.dsn#" NAME="read_current_endorsements">
			SELECT *
			FROM doc_amer_title_fla_title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>



		<CFQUERY datasource="#request.dsn#" NAME="read_all_endorsements">
			SELECT *
			FROM doc_endorsements
			WHERE Endorse_Ref = '#a_list_to_view#'
			ORDER BY Endorse_Name ASC
		</CFQUERY>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=582 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=582 align=center valign=top>

<table width=581 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width=581 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Insurance Endorsements</B></CENTER>
			</TD>
		</TR>
<CFOUTPUT>
	<tr>
			<td width=581 align=center valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><NOBR><B>
				<CFIF #a_list_to_view# EQ "ALL">
					All  Endorsements (Not State Specific)
				<CFELSEIF #a_list_to_view# EQ "MD">
					Maryland  Endorsements
				<CFELSE>
					District of Columbia Endorsements
				</CFIF>&nbsp;&nbsp;[ &nbsp;<b>#read_all_endorsements.recordcount#</b>&nbsp; ] records.</NOBR>
				</B></CENTER>
			</TD>
		</TR>
</CFOUTPUT>

	<tr>
		<td width=581 align=center valign=top bgcolor=e1e1e1>


<CFFORM NAME="frm" ACTION="./Title_select_endorsements_submit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&a_list_to_view=#a_list_to_view#" METHOD=POST>



				<table width=580 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

					<tr>
						<td width=40 align=center valign=top bgcolor=white>

						</TD>

						<td width=100 align=center valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							<B>Doc Name</B>
						</TD>

						<td width=420 align=center valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							<B>Doc Content</B>
						</TD>

					</tr>


<CFSET bg_color="e1e1e1">
<CFSET a_counter_1 = "1">

<CFOUTPUT QUERY="read_all_endorsements">

					<tr>
						<td bgcolor="#bg_color#" width=40 align=center valign=top bgcolor=white>
							<input TYPE=checkbox NAME="a_end_sel" VALUE="#Endorsement_ID#">
						</TD>

						<td bgcolor="#bg_color#" width=100 align=center valign=top bgcolor=white>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#endorse_name#</b>
						</TD>

						<td bgcolor="#bg_color#" width=420 align=left valign=top bgcolor=white>
							<FONT FACE=verdana SIZE=1 color="black">
							#endorse_content#
						</TD>

					</tr>

<CFIF #a_counter_1# EQ "1">
	<CFSET bg_color="white">
	<CFSET a_counter_1 = "2">
<CFELSE>
	<CFSET bg_color="e1e1e1">
	<CFSET a_counter_1 = "1">
</CFIF>

</CFOUTPUT>
					<tr>
						<td width=519 colspan=3 align=right valign=top bgcolor=white>
							<p>
							<br>
							<p>
							<input type=image src="./images/button_submit.gif" border=0>

		</CFFORM>


						</TD>

					</tr>


				</table>


		</TD>
	</TR>



<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->



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


