



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

		<CFQUERY datasource="#request.dsn#" NAME="read_ins_committments">
			SELECT *
			FROM Doc_Title_Insurance_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_Title_FT_Agency_company">

			SELECT *
			FROM Title_FT_Agencies
			WHERE Title_FT_Agency_ID = #read_ins_committments.Insurance_Co#

		</CFQUERY>




		<CFQUERY datasource="#request.dsn#" NAME="read_current_committment_Clauses">
			SELECT *
			FROM Doc_Title_Insurance_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>



		<CFQUERY datasource="#request.dsn#" NAME="read_all_Committment_Clauses">
			SELECT *
			FROM doc_Committment_Clauses
			WHERE Committment_Ref = '#a_list_to_view#' AND a_group_name = '#a_clause_group_is#'
			ORDER BY Committment_Name ASC
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_list_of_current_Committment_Clauses">
			SELECT *
			FROM Title_Committment_Clauses_Selected_Title
			WHERE Title_ID = #URL.rec_ID# AND a_section_code = '#URL.a_section_code#'
			ORDER BY Committment_Item_Order ASC
		</CFQUERY>


		<CFSET a_selected_Committment_Names = ArrayNew(1)>
		<CFSET aa_counter_2 = "1">
			<CFOUTPUT QUERY="read_list_of_current_Committment_Clauses">


				<CFSET a_selected_Committment_Names[aa_counter_2] = #Committment_Name#>
				<CFSET aa_counter_2 = #aa_counter_2#  + "1">

			</CFOUTPUT>


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
				<CENTER><B>Title Insurance Clauses</B></CENTER>
			</TD>
		</TR>
<CFOUTPUT>
	<tr>
			<td width=581 align=center valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><NOBR><B>
				<CFIF #a_list_to_view# EQ "ALL">
					Clauses - (Not State Specific)
				<CFELSEIF #a_list_to_view# EQ "MD">
					Clauses - Maryland
				<CFELSE>
					Clauses - District of Columbia
				</CFIF>&nbsp;&nbsp;</NOBR>
				</B></CENTER>
			</TD>
		</TR>

	<tr>
			<td width=581 align=center valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><NOBR>Clause Group  - <b>#a_clause_group_is#</b></NOBR>
				</CENTER>
			</TD>
		</TR>

</CFOUTPUT>

	<tr>
		<td width=581 align=center valign=top bgcolor=e1e1e1>


<CFFORM NAME="frm" ACTION="./Title_Committment_select_submit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&a_list_to_view=#a_list_to_view#&a_section_code=#URL.a_section_code#&a_clause_group_is=#a_clause_group_is#" METHOD=POST>



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

<CFOUTPUT QUERY="read_all_Committment_Clauses">

	<CFSET a_trigger_display = "1">
	<CFLOOP FROM="1" TO="#ArrayLen(a_selected_Committment_Names)#" INDEX="FFF">
		<CFIF #Committment_name# EQ "#a_selected_Committment_Names[FFF]#">
			<CFSET a_trigger_display = "2">
		</CFIF>
	</CFLOOP>
	<CFIF #a_trigger_display# EQ "1">
					<tr>
						<td bgcolor="#bg_color#" width=40 align=center valign=top bgcolor=white>
							<input TYPE=checkbox NAME="a_end_sel" VALUE="#Committment_ID#">
						</TD>

						<td bgcolor="#bg_color#" width=100 align=center valign=top bgcolor=white>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#Committment_name#</b>
						</TD>

						<td bgcolor="#bg_color#" width=420 align=left valign=top bgcolor=white>
							<FONT FACE=verdana SIZE=1 color="black">
							#Committment_content#
						</TD>
					</tr>
			<CFIF #a_counter_1# EQ "1">
				<CFSET bg_color="white">
				<CFSET a_counter_1 = "2">
			<CFELSE>
				<CFSET bg_color="e1e1e1">
				<CFSET a_counter_1 = "1">
			</CFIF>
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


