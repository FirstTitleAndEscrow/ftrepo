








		<CFQUERY datasource="#request.dsn#" NAME="read_lenders">

			SELECT *
			FROM Lenders
			WHERE lender_id = #lender_id#

		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_lenders_states">

			SELECT *
			FROM Lenders_States
			WHERE lender_id = #lender_id#
			ORDER BY st_abbrev ASC

		</CFQUERY>



		<CFQUERY datasource="#request.dsn#" NAME="read_states">

			SELECT *
			FROM first_title_states
			ORDER BY st_abbrev ASC

		</CFQUERY>

		<CFSET a_states_1 = ArrayNew(1)>
		<CFSET a_count = "1">

		<CFOUTPUT QUERY="read_states">

			<CFSET a_states_1[a_count] = #st_abbrev#>
			<CFSET a_count = #a_count# + "1">


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
			<font size=2 color=green face=arial><B>Modify Lenders </B>
		</td>
	</tr>
</CFOUTPUT>

</table>

		</td>
	</tr>

	<tr>
		<td width=499 align=center valign=top bgcolor=white>


<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=white>



<CFOUTPUT>
	<FORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/Lenders_modify_submit.cfm?uid=#URL.uid#&al=#URL.al#&lender_id=#lender_id#&a_flag=1">

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=red face=arial>
			<B>TSS ID - </B>
		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="tss_id" VALUE="#read_lenders.tss_id#" size=35 maxlength=90
							size="1"
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Company Name -
		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="company" VALUE="#read_lenders.company#" size=55 maxlength=90
							size="1"
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;" >
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Address -
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="addr1" VALUE="#read_lenders.addr1#" size=40 maxlength=120
				size="1"
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none; ">
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Address -
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="addr2" VALUE="#read_lenders.addr2#" size=40 maxlength=120
				size="1"
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none; ">
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Note -
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="a_note_1" VALUE="#read_lenders.a_note_1#" size=55 maxlength=120
				size="1"
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none; ">
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			City -
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="city" VALUE="#read_lenders.city#" size=30 maxlength=50
				size="1"
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none; ">
		</td>
	</tr>

</CFOUTPUT>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			State -
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>

											<SELECT NAME="state"
												size="1"
												style="font-size: 9;
												font-family: verdana;
												font-style: normal;
												color: blue;
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
				<CFLOOP FROM="1" TO="#ArrayLen(a_list_of_all_states_1)#" INDEX="NNN">
					<CFOUTPUT>
						<CFIF #read_lenders.state# EQ "#a_list_of_all_states_1[NNN]#">
							<option value="#a_list_of_all_states_1[NNN]#" SELECTED>#a_list_of_all_states_1[NNN]#</option>
						<CFELSE>
							<option value="#a_list_of_all_states_1[NNN]#">#a_list_of_all_states_1[NNN]#</option>
						</CFIF>
					</CFOUTPUT>
				</CFLOOP>

										</SELECT>
		</td>
	</tr>
<CFOUTPUT>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Zip Code -
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="zip" VALUE="#read_lenders.zip_code#" size=20 maxlength=20
				size="1"
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none; ">
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Phone -
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="phone" VALUE="#read_lenders.phone#" size=25 maxlength=22
				size="1"
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none; ">
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Fax -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="fax" VALUE="#read_lenders.fax#" size=25 maxlength=22
				size="1"
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none; ">


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Email -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="email" VALUE="#read_lenders.email#" size=35 maxlength=160
				size="1"
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none; ">


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Comments -
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<TEXTAREA name="a_comment"  COLS=60 ROWS=10
				style="font-size: 9;
				font-family: verdana;
				font-style: normal;
				color: blue;
				background-color: e6e6e6;
				border-color: e6e6e6;
				border-left-width: thin;
				border-right-width: thin;
				border-top-width: thin;
				border-bottom-width: thin;
				border-width: thin;
				border-style: bar;
				clear: none;">#read_lenders.a_comment#</TEXTAREA>
		</td>
	</tr>

	<tr>

		<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<NOBR><input type=image src="./images/button_submit.gif" border=0><img src="./images/clear.gif" height=10 width=40></NOBR>


		</td>
	</tr>

</FORM>

</CFOUTPUT>
<!--- ====================================================== --->
<!--- ====================================================== --->
<!--- ====================================================== --->
<!--- ====================================================== --->


	<tr>
		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=1 color=black face=verdana>
			To select Multiple States in either list, hold down the Ctrl Key, and click on each state to be selected.
			<p>

			<table width=498 cellpadding=2 cellspacing=2 border=0>
				<tr>
					<td width=249 align=center valign=top>
						<font size=2 color=green face=arial>
							States Currently Served
					</td>

					<td width=249 align=center valign=top>
						<font size=2 color=green face=arial>
							States NOT Served
					</td>
				</tr>

				<tr>
<CFOUTPUT>
	<FORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/Lenders_modify_submit.cfm?uid=#URL.uid#&al=#URL.al#&lender_id=#lender_id#&a_flag=2">
</CFOUTPUT>
					<td width=249 align=center valign=top>
						<font size=2 color=green face=arial>
						<SELECT NAME="st_abbrev1" MULTIPLE
							size="8"
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
							><CFOUTPUT QUERY="read_lenders_states"><OPTION VALUE="#st_abbrev#">#st_abbrev# </OPTION></CFOUTPUT>
							</SELECT>
							<p>
							<input type=image src="./images/button_delete.gif" border=0>
					</td>
	</FORM>

<CFOUTPUT>
	<FORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/lenders_modify_submit.cfm?uid=#URL.uid#&al=#URL.al#&lender_id=#lender_id#&a_flag=3">
</CFOUTPUT>

					<td width=249 align=center valign=top>
						<SELECT NAME="st_abbrev2" MULTIPLE
							size="8"
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
								<CFSET a_trigger = "1">
								<CFLOOP FROM="1" TO="#ArrayLen(a_states_1)#" INDEX="RRR">
									<CFOUTPUT QUERY="read_lenders_states">
										<CFIF #a_states_1[RRR]# EQ "#st_abbrev#">
											<CFSET a_trigger = "2">
										</CFIF>
									</CFOUTPUT>
								<CFIF #a_trigger# EQ "1">
									<CFOUTPUT>
									<OPTION VALUE="#a_states_1[RRR]#">#a_states_1[RRR]#</OPTION>
									</CFOUTPUT>
								</CFIF>
									<CFSET a_trigger = "1">
								</CFLOOP>

							</SELECT>
							<p>
							<input type=image src="./images/button_add.gif" border=0>
					</td>
				</tr>
	</FORM>
			</table>



		</td>
	</tr>

</table>

		</td>



	</tr>
</table>



	</td>
</tr>
</table>

	</td>
</tr>
</table>


</BODY>
</HTML>

