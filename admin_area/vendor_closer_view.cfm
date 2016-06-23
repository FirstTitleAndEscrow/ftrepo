








		<CFQUERY datasource="#request.dsn#" NAME="read_Closers">

			SELECT *
			FROM Closer
			WHERE Closer_ID = #Closer_ID#

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



		<CFQUERY datasource="#request.dsn#" NAME="read_Closers_county_list">

			SELECT st_abbrev, ct_name
			FROM Closer_county
			WHERE Closer_ID = #Closer_ID#
			ORDER BY st_abbrev ASC, ct_name ASC

		</CFQUERY>


		<CFSET a_app_states_1 = ArrayNew(1)>
		<CFSET a_app_county_1 = ArrayNew(1)>
		<CFSET c_count = "1">

		<CFOUTPUT QUERY="read_Closers_county_list">
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
			<font size=2 color=green face=arial><B>Modify Closer</B>
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
	<FORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/Closer_modify_submit.cfm?uid=#URL.uid#&al=#URL.al#&Closer_ID=#Closer_ID#">


	<tr>

		<td width=498 colspan=2 align=left valign=top bgcolor=e1e1e1>
			<NOBR><a href="Closer_modify_choose.cfm?uid=#URL.uid#&al=#URL.al#&Closer_ID=#Closer_ID#"><img src="./images/button_return.gif" border=0></a><img src="./images/clear.gif" height=10 width=85></NOBR>


		</td>
	</tr>

	<!--- <tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			TSS Code -


		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="tss_id"  size=35 maxlength=75
			VALUE="#read_Closers.tss_id#"
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
	</tr> --->

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Company Name -


		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="company"  size=40 maxlength=90
			VALUE="#read_Closers.company#"
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

		<font size=2 color=black face=arial>
			(or Closer Name)
		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>User Name -
		</b>

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="user_name"  size=20 maxlength=50
			VALUE="#read_closers.username#"
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
			<b><font size=2 color=blue face=arial>
			Password -
		</b>

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="pass"  size=20 maxlength=50
			VALUE="#read_closers.password#"
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
			First Name -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="fname"  size=35 maxlength=50
			VALUE="#read_Closers.fname#"
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
			Last Name -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="lname"  size=35 maxlength=50
			VALUE="#read_Closers.lname#"
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
			<input type=text name="phone"  size=25 maxlength=22
			VALUE="#read_Closers.phone#"
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
			Cell -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="cell"  size=25 maxlength=22
			VALUE="#read_Closers.cell#"
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
			Pager -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="pager"  size=25 maxlength=22
			VALUE="#read_Closers.pager#"
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
			<input type=text name="fax"  size=25 maxlength=22
			VALUE="#read_Closers.fax#"
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
			<input type=text name="email"  size=35 maxlength=160
			VALUE="#read_Closers.email#"
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
			<input type=text name="addr1"  size=40 maxlength=120
			VALUE="#read_Closers.addr1#"
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
			<input type=text name="addr2"  size=40 maxlength=120
			VALUE="#read_Closers.addr2#"
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
			Notes -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="a_note_1" VALUE="#read_Closers.a_note_1#" size=50 maxlength=300
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
			<input type=text name="city"  size=30 maxlength=50
			VALUE="#read_Closers.city#"
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
			State -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="state"  size=30 maxlength=50
			VALUE="#read_Closers.state#"
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
			Zip Code -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="zip"  size=20 maxlength=20
			VALUE="#read_Closers.zip_code#"
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
			Charge for Svc -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="a_cost" VALUE="#read_Closers.a_cost#" size=15 maxlength=20
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
		<td width=367 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Comments


		</td>
	</tr>

	<tr>
		<td width=367 colspan=2 align=left valign=top bgcolor=e6e6e6>
				<TEXTAREA name="a_comments"  COLS=60 ROWS=6
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
					clear: none;">#read_Closers.a_comments#</TEXTAREA>


		</td>
	</tr>



	<tr>
		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Preferences for recieving Closer Notice

		</td>
	</tr>

	<tr>

		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>
		<font size=2 color=black face=arial>
		<CFIF #read_Closers.pref_for_send# EQ "Email">
			<NOBR>Email - <input type=radio name="spref" VALUE="Email" checked>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fax - <input type=radio name="spref" VALUE="Fax"></NOBR>

		<CFELSE>
			<NOBR>Email - <input type=radio name="spref" VALUE="Email">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fax - <input type=radio name="spref" VALUE="Fax" checked></NOBR>

		</CFIF>

		</td>
	</tr>


	<tr>

		<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<NOBR><input type=image src="./images/button_modify.gif" border=0><img src="./images/clear.gif" height=10 width=40></NOBR>


		</td>
	</tr>

</CFOUTPUT>



</FORM>

	<tr>

		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>Counties Currently Serviced</b>
		</td>
	</tr>


<CFIF #read_Closers_county_list.recordcount# EQ "0">

	<tr>
		<td width=498 colspan=2 align=left valign=top bgcolor=f1f1f1>
		<p>
		<bR>
		<font size=2 color=blue face=arial>
		This Closer does not have any "Counties Serviced" in their list.
		<p>
		</td>
	</tr>

<CFELSE>
	<tr>
		<td width=348 align=left valign=top bgcolor=f1f1f1>
		<font size=2 color=black face=arial>
		This is the current List of States and Counties for this Closer.
		<p>
		To
		Delete Counties from this list, click on each one to be deleted
		then click on the submit button.
		<p>
		</td>

		<td width=150 align=left valign=top bgcolor=f1f1f1>
<CFOUTPUT>
	<FORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/Closer_modify_countys_delete.cfm?uid=#URL.uid#&al=#URL.al#&Closer_ID=#Closer_ID#">
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
		Click on any of the items in the list to add them to this Closer "Countys
		Serviced" List.
		<p><font size=1 color=blue face=arial> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(hold down the CTRL key to select more than one)
		<p>
		</td>

		<td width=150 align=left valign=top bgcolor=f1f1f1>
<CFOUTPUT>
	<FORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/Closer_modify_countys_add.cfm?uid=#URL.uid#&al=#URL.al#&Closer_ID=#Closer_ID#">
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
		<!--- <CFIF #ArrayLen(a_app_county_1)# EQ "0"> --->

					<CFLOOP FROM="1" TO="#ArrayLen(a_states_list)#" INDEX="DDD">
						<CFSET a_trigger = "1">

						<CFLOOP FROM="1" TO="#a_county_count[DDD]#" INDEX="RRR">
							<CFOUTPUT>
								<OPTION VALUE="#a_states_list[DDD]#|#a_state_cty_list[DDD][RRR]#">#a_states_list[DDD]# --- #a_state_cty_list[DDD][RRR]#</OPTION>
							</CFOUTPUT>
						</CFLOOP>
					</CFLOOP>


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

