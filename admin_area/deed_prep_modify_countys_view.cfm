






		<CFQUERY datasource="#request.dsn#" NAME="read_abstractors">

			SELECT *
			FROM Abstractors
			WHERE Abstractor_ID = #Abstractor_ID#

		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_state_list">

			SELECT *
			FROM first_title_states
			ORDER BY st_abbrev ASC

		</CFQUERY>


		<CFSET a_states_list = ArrayNew(1)>
		<CFSET a_count = "1">

		<CFOUTPUT QUERY="read_state_list">
			<CFSET a_states_list[a_count] = #st_abbrev#>
			<CFSET a_count = #a_count# + "1">

		</CFOUTPUT>

			<CFSET a_state_cty_list = ArrayNew(2)>
			<CFSET a_county_count = ArrayNew(1)>

		<CFLOOP FROM="1" TO="#ArrayLen(a_states_list)#" INDEX="TTT">

			<CFQUERY datasource="#request.dsn#" NAME="read_state_cty_list">

				SELECT DISTINCT COUNTY
				FROM zip_info
				WHERE state = '#a_states_list[TTT]#'
				ORDER BY county ASC

			</CFQUERY>

				<CFSET b_count = "1">

				<CFOUTPUT QUERY="read_state_cty_list">
					<CFSET a_state_cty_list[TTT][b_count] = #county#>

					<CFSET b_count = #b_count# + "1">
				</CFOUTPUT>

				<CFSET a_county_count[TTT] = #b_count# - "1">

		</CFLOOP>



		<CFQUERY datasource="#request.dsn#" NAME="read_abstractors_county_list">

			SELECT st_abbrev, ct_name
			FROM Abstractors_county
			WHERE Abstractor_ID = #Abstractor_ID#
			ORDER BY st_abbrev ASC, ct_name ASC

		</CFQUERY>


		<CFSET a_app_states_1 = ArrayNew(1)>
		<CFSET a_app_county_1 = ArrayNew(1)>
		<CFSET c_count = "1">

		<CFOUTPUT QUERY="read_abstractors_county_list">
			<CFSET a_app_states_1[c_count] = #st_abbrev#>
			<CFSET a_app_county_1[c_count] = #ct_name#>
			<CFSET c_count = #c_count# + "1">
		</CFOUTPUT>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>

</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>



<CENTER>

<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=500 align=center valign=top>

<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

	<tr>
		<td width=499 align=center valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>

<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

<CFOUTPUT>
	<tr>
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Modify Deed Prep Vendor County List</B>
		</td>
	</tr>

</table>

		</td>
	</tr>

	<tr>
		<td width=499 align=center valign=top bgcolor=white>


<table width=498 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>

		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<img src="./images/clear.gif" height=10 width=85>


		</td>
	</tr>

	<tr>

		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=black face=arial>
		You are modifying the Counties List for:<p>
		<b>#read_abstractors.company#<br>
		#read_abstractors.fname# #read_abstractors.lname#</b>

		</td>
	</tr>
</CFOUTPUT>


	<tr>

		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>Counties Currently Serviced</b>
		</td>
	</tr>


<CFIF #read_abstractors_county_list.recordcount# EQ "0">

	<tr>
		<td width=498 colspan=2 align=left valign=top bgcolor=f1f1f1>
		<p>
		<bR>
		<font size=2 color=blue face=arial>
		This Abstractor does not have any "Counties Serviced" in their list.
		<p>
		</td>
	</tr>

<CFELSE>
	<tr>
		<td width=348 align=left valign=top bgcolor=f1f1f1>
		<font size=2 color=black face=arial>
		This is the current List of States and Counties for this Abstractor.
		<p>
		To
		Delete Counties from this list, click on each one to be deleted
		then click on the submit button.
		<p>
		</td>

		<td width=150 align=left valign=top bgcolor=f1f1f1>
<CFOUTPUT>
<FORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/deed_prep_modify_countys_delete.cfm?uid=#URL.uid#&al=#URL.al#&Abstractor_ID=#Abstractor_ID#">
</CFOUTPUT>
				<SELECT NAME="zip_id" MULTIPLE
					size="6"
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
					>
					<CFLOOP FROM="1" TO="#ArrayLen(a_app_states_1)#" INDEX="UUU">
						<CFOUTPUT >
							<OPTION VALUE="#a_app_states_1[UUU]#|#a_app_county_1[UUU]#">#a_app_states_1[UUU]# --- #a_app_county_1[UUU]#</OPTION>
						</CFOUTPUT>
					</CFLOOP>
			</SELECT>
		</td>
	</tr>

	<tr>
		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<INPUT TYPE=IMAGE src="./images/button_delete.gif" BORDER=0>
</FORM>
		</td>
	</tr>

</CFIF>

	<tr>

		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>Counties NOT Currently Serviced</b>
		</td>
	</tr>

	<tr>
		<td width=348 align=left valign=top bgcolor=f1f1f1>
		<font size=2 color=black face=arial>
		Click on any of the items in the list to add them to this Abstractors "Countys
		Serviced" List.
		<p><font size=1 color=blue face=arial> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(hold down the CTRL key to select more than one)
		<p>
		</td>

		<td width=150 align=left valign=top bgcolor=f1f1f1>
<CFOUTPUT>
<FORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/deed_prep_modify_countys_add.cfm?uid=#URL.uid#&al=#URL.al#&Abstractor_ID=#Abstractor_ID#">
</CFOUTPUT>
				<SELECT NAME="zip_id" MULTIPLE
					size="6"
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
					>
	<!--- 	<CFIF #ArrayLen(a_app_county_1)# EQ "0"> --->

					<CFLOOP FROM="1" TO="#ArrayLen(a_states_list)#" INDEX="DDD">
						<CFSET a_trigger = "1">

						<CFLOOP FROM="1" TO="#a_county_count[DDD]#" INDEX="RRR">
							<CFOUTPUT>
								<OPTION VALUE="#a_states_list[DDD]#|#a_state_cty_list[DDD][RRR]#">#a_states_list[DDD]# --- #a_state_cty_list[DDD][RRR]#</OPTION>
							</CFOUTPUT>
						</CFLOOP>
					</CFLOOP>


		<!--- <CFELSE>
					<CFLOOP FROM="1" TO="#ArrayLen(a_states_list)#" INDEX="DDD">						<CFSET a_trigger = "1">
						<CFLOOP FROM="1" TO="#a_county_count[DDD]#" INDEX="RRR">
							<CFLOOP FROM="1" TO="#ArrayLen(a_app_county_1)#" INDEX="CCC">
								<CFIF (#a_states_list[DDD]# EQ "#a_app_states_1[CCC]#")
										AND
										(#a_state_cty_list[DDD][RRR]# EQ "#a_app_county_1[CCC]#")>
									<CFSET a_trigger = "2">
								</CFIF>
							</CFLOOP>
							<CFOUTPUT>
								<CFIF #a_trigger# EQ "1">
									<OPTION VALUE="#a_states_list[DDD]#|#a_state_cty_list[DDD][RRR]#">#a_states_list[DDD]# --- #a_state_cty_list[DDD][RRR]#</OPTION>
								</CFIF>
							</CFOUTPUT>
					</CFLOOP>
				</CFLOOP>
			</CFIF>		 --->
			</SELECT>
		</td>
	</tr>

	<tr>
		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<INPUT TYPE=IMAGE src="./images/button_add.gif" BORDER=0>
</FORM>
		</td>
	</tr>


</table>

		</td>



	</tr>
</table>

	<tr>
		<td width=499 align=center valign=top bgcolor=white>




	</td>
</tr>
</table>

	</td>
</tr>
</table>


</BODY>
</HTML>


