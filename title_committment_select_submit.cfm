
<CFPARAM NAME="a_end_sel" DEFAULT="">

<CFSET a_list_of_picks = #ListToArray(a_end_sel, ",")#>




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

			<td width=581 align=center valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>
				<CFIF #a_list_to_view# EQ "ALL">
					Clauses - (Not State Specific)
				<CFELSEIF #a_list_to_view# EQ "MD">
					Clauses - Maryland
				<CFELSE>
					Clauses - District of Columbia
				</CFIF>
				</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=581 align=center valign=top bgcolor=e1e1e1>



				<table width=580 cellpadding=1 cellspacing=1 border=0 bgcolor=white>


<CFSET a_final_Committments = "">

		<!--- ===/ Get the highest Commitment_Item_Order value for \=== --->
		<!--- ===/ the Clause Section to be added to               \=== --->

		<CFQUERY datasource="#request.dsn#" NAME="Read_Highest_Number">
			SELECT *
			FROM Title_Committment_Clauses_Selected_Title
			WHERE Title_ID = #rec_ID# AND a_section_code = '#a_section_code#'
			ORDER BY Committment_Item_Order ASC
		</CFQUERY>

		<CFSET a_item_order_list = ArrayNew(1)>
		<CFSET a_high_counter = "1">
			<CFOUTPUT QUERY="Read_Highest_Number">
				<CFSET a_item_order_list[a_high_counter] = #Committment_Item_Order#>
				<CFSET a_high_counter = #a_high_counter# + "1">
			</CFOUTPUT>

			<CFSET a_highest_number = #a_high_counter# >


		<tr>
			<td  width=580 align=left valign=top >
	<CFOUTPUT>

	highest number - #a_highest_number#<p>
	</CFOUTPUT>
<CFLOOP FROM="1" TO="#ArrayLen(a_list_of_picks)#" INDEX="AAA">
		<CFQUERY datasource="#request.dsn#" NAME="read_selected_Committments">
			SELECT *
			FROM doc_Committment_Clauses
			WHERE Committment_ID = #a_list_of_picks[AAA]#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#">
			INSERT INTO Title_Committment_Clauses_Selected_Title(Title_ID, Committment_Item, Committment_Name, a_section_code, Committment_Item_Order)
			VALUES(#rec_id#, '#read_selected_Committments.Committment_Content#', '#read_selected_Committments.Committment_name#', '#a_section_code#', #a_highest_number#)
		</CFQUERY>

		<CFSET a_highest_number = #a_highest_number# + 1>


<CFOUTPUT>

					<CFSET a_final_Committments = #a_final_Committments# & #Chr(10)# & #Chr(13)# & #Chr(10)# & #Chr(13)# & #read_selected_Committments.Committment_content#>

							<FONT FACE=verdana SIZE=2 color="black">
							#read_selected_Committments.Committment_content#<p>

</CFOUTPUT>

</CFLOOP>

						</TD>
					</tr>


				</table>


		</TD>
	</TR>


		<tr>
			<td width=581 align=right valign=top bgcolor=e1e1e1>
					<form>
					<input type="image" src="./images/button_close.gif" border=0 onClick="opener.location.reload(); self.close()">
					</form>
			</td>
		</tr>
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


