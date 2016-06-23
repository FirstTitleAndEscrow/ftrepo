<CFPARAM NAME="a_direction" DEFAULT="">




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




		<CFQUERY datasource="#request.dsn#" NAME="read_ins_endorsements">
			SELECT *
			FROM doc_amer_title_fla_title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>



		<!--- ===/ Here is where we move endorse_items up or down \=== --->

		<CFIF #a_direction# EQ "UP">

			<CFSET a_calc_up = #c_Endorse_Item_Order# - 1>

				<CFQUERY datasource="#request.dsn#" NAME="read_temp_endorsements">
					SELECT *
					FROM Title_Endorsements_Selected
					WHERE Title_ID = #rec_ID# AND Endorse_Item_Order = #a_calc_up#
				</CFQUERY>

				<CFQUERY datasource="#request.dsn#">
					UPDATE Title_Endorsements_Selected
					SET Endorse_Item_Order = #c_Endorse_Item_Order#
					WHERE Title_ID = #rec_ID# AND Endorse_ID = #read_temp_endorsements.Endorse_ID#
				</CFQUERY>

				<CFQUERY datasource="#request.dsn#">
					UPDATE Title_Endorsements_Selected
					SET Endorse_Item_Order = #a_calc_up#
					WHERE Title_ID = #rec_ID# AND Endorse_ID = #c_Endorse_ID#
				</CFQUERY>


		<CFELSEIF #a_direction# EQ "Down">

			<CFSET a_calc_down = #c_Endorse_Item_Order# + 1>

				<CFQUERY datasource="#request.dsn#" NAME="read_temp_endorsements">
					SELECT *
					FROM Title_Endorsements_Selected
					WHERE Title_ID = #rec_ID# AND Endorse_Item_Order = #a_calc_down#
				</CFQUERY>

				<CFQUERY datasource="#request.dsn#">
					UPDATE Title_Endorsements_Selected
					SET Endorse_Item_Order = #c_Endorse_Item_Order#
					WHERE Title_ID = #rec_ID# AND Endorse_ID = #read_temp_endorsements.Endorse_ID#
				</CFQUERY>

				<CFQUERY datasource="#request.dsn#">
					UPDATE Title_Endorsements_Selected
					SET Endorse_Item_Order = #a_calc_down#
					WHERE Title_ID = #rec_ID# AND Endorse_ID = #c_Endorse_ID#
				</CFQUERY>

		</CFIF>

		<CFQUERY datasource="#request.dsn#" NAME="read_existing_endorsements">
			SELECT *
			FROM Title_Endorsements_Selected
			WHERE Title_ID = #rec_ID#
			ORDER BY Endorse_Item_Order ASC
		</CFQUERY>



<CFIF #read_ins_endorsements.a_assigned_by# GT "">


		<!--- ===/ Get the name of the person that is  \=== --->
		<!--- ===/ STARTED the Loan Pay Off Process        \=== --->

		<CFQUERY datasource="#request.dsn#" NAME="read_user_assigning">

			SELECT *
			FROM first_admin
			WHERE ID = #read_ins_endorsements.a_assigned_by#

		</CFQUERY>


		<CFSET user_that_started = #read_user_assigning.fname# & " " & #read_user_assigning.lname#>


<CFELSE>
		<CFSET user_that_started = "Not Started Yet">
</CFIF>


<CFIF #read_ins_endorsements.a_recieved_by# GT "">

		<!--- ===/ Get the name of the person that is  \=== --->
		<!--- ===/ FINISHED the Loan Pay Off Process        \=== --->

		<CFQUERY datasource="#request.dsn#" NAME="read_user_recieving">

			SELECT *
			FROM first_admin
			WHERE ID = #read_ins_endorsements.a_recieved_by#

		</CFQUERY>

		<CFSET user_that_started = #read_user_recieving.fname# & " " & #read_user_recieving.lname#>

<CFELSE>
		<CFSET user_that_finished = "Not Finished Yet">
</CFIF>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=790 align=center valign=top>

<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width=790 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Insurance Commitment</B></CENTER>
			</TD>
		</TR>
	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>

		<CFINCLUDE TEMPLATE="./includes/title_top_navu.cfm">
		<p>

<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
<CFFORM NAME="frm" ACTION="./Title_select_endorsements.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" METHOD=POST>
		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Person Obtaining Info -
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<SELECT NAME="Insurance_Company"
					size="1"
					style="font-size: 9;
					font-family: verdana;
					font-style: normal;
					color: blue;
					background-color: e1e1e1;
					border-color: e1e1e1;
					border-left-width: thin;
					border-right-width: thin;
					border-top-width: thin;
					border-bottom-width: thin;
					border-width: thin;
					border-style: bar;
					clear: none;
					float: none;"
					rows="5"
					cols="45"
					><OPTION VALUE="AT-FL">American Pioneer Title - Florida</OPTION>
					<OPTION VALUE="AT-All">American Pioneer Title - All Others</OPTION>
					<OPTION VALUE="ST">Stewart Title - DC-MD-VA-NJ-MI</OPTION>
					<OPTION VALUE="Chicago-FL">Chicago Title - All</OPTION>
					</SELECT>
			</td>
		</tr>
</CFFORM>
</table>

<CFOUTPUT>
<!--- ================================================================ --->
<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Person Obtaining Info -
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#user_that_started#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Date Started -
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#read_ins_endorsements.a_assigned_date#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Time Started -
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#read_ins_endorsements.a_assigned_time#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Person Completing Info -
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#user_that_finished#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Date Completed -
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#read_ins_endorsements.a_recieved_date#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Time Completed -
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#read_ins_endorsements.a_recieved_time#</B>
			</td>
		</tr>
</table>
<!--- =========================================================== --->
<p>

<table width=581 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width=581 align=left valign=top bgcolor=white>
				<font size=2 color=black face=arial>
				 Once the Commitment form is selected, it will be displayed here.
			</TD>
		</TR>
</table>

<p>




<table width=581 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width=581 align=left valign=top bgcolor=e1e1e1>
				 <a href="./title_select_endorse_add_popup.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" target="Title_Endorse" onClick="window.open('','Title_Endorse','width=605,height=500,left=10,top=10,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img src="./images/button_add_endorse.gif" border=0></a>
			</TD>
		</TR>

</CFOUTPUT>


	<tr>
		<td width=581 align=center valign=top bgcolor=e1e1e1>


<!--- ===/ ENDORSEMENTS ARE LISTED HERE \=== --->

<table width=580 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

<CFSET a_up_trigger = "1">
<CFSET a_down_trigger = "1">

<CFOUTPUT QUERY="read_existing_endorsements">
	<tr>
			<td width=14 align=center valign=top bgcolor=white>
				<a href="./title_endorsement_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&Endorse_id=#Endorse_id#" target="Title_Endorse_delete" onClick="window.open('','Title_Endorse_delete','width=440,height=450,left=10,top=10,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img src="./images/button_d.gif" border=0></a>
			</td>
			<td width=14 align=center valign=top bgcolor=white>
				<a href="./title_endorsement_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&Endorse_id=#Endorse_id#" target="Title_Endorse_modify" onClick="window.open('','Title_Endorse_modify','width=440,height=450,left=10,top=10,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img src="./images/button_m.gif" border=0></a>
			</td>
			<td width=14 align=center valign=top bgcolor=white><CFIF #a_up_trigger# GT "1"><a href="./title_endorsements.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&Endorse_id=#Endorse_id#&c_Endorse_Item_Order=#Endorse_Item_Order#&a_direction=up&c_Endorse_id=#Endorse_id#"><img src="./images/button_move_up.gif" border=0></a><CFELSE><img src="./images/button_move_up_gray.gif" border=0></CFIF><img src="./images/line_move_up_down.gif"><CFIF #a_down_trigger# LT #read_existing_endorsements.recordcount#><a href="./title_endorsements.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&c_Endorse_id=#Endorse_id#&c_Endorse_Item_Order=#Endorse_Item_Order#&a_direction=down&Endorse_id=#Endorse_id#"><img src="./images/button_move_down.gif" border=0></a><CFELSE><img src="./images/button_move_down_gray.gif" border=0></CFIF></td>
			<td width=537 align=left valign=top bgcolor=white>
				<FONT SIZE=2 COLOR=black face=arial>
				#endorse_item#
			</td>
		</tr>

	<CFSET a_up_trigger = "2">
	<CFSET a_down_trigger = #a_down_trigger# + "1">
</CFOUTPUT>
</table>








<!--- ======================================= --->
















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


