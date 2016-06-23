





<CFIF #a_flag# EQ "1">

		<CFQUERY datasource="#request.dsn#" NAME="read_lenders">

			UPDATE Lenders
			SET tss_id = '#tss_id#',
			company = '#company#',
			phone = '#phone#',
			fax = '#fax#',
			addr1 = '#addr1#',
			addr2 = '#addr2#',
			a_note_1 = '#a_note_1#',
			city = '#city#',
			state = '#state#',
			zip_code = '#zip#',
			email = '#email#',
			a_comment = '#a_comment#'
			WHERE lender_id = #lender_Id#

		</CFQUERY>

<CFELSEIF #a_flag# EQ "2">

	<CFSET st_list = #ListToArray(FORM.st_abbrev1, ",")#>

	<CFLOOP FROM="1" TO="#ArrayLen(st_list)#" INDEX="AAA">

		<CFQUERY datasource="#request.dsn#" >

			DELETE
			FROM Lenders_States
			WHERE Lender_id = #Lender_id# AND st_abbrev = '#st_list[AAA]#'

		</CFQUERY>
	</CFLOOP>



<CFELSE>

	<CFSET st_list = #ListToArray(FORM.st_abbrev2, ",")#>

	<CFLOOP FROM="1" TO="#ArrayLen(st_list)#" INDEX="AAA">

		<CFQUERY datasource="#request.dsn#" >

			INSERT INTO Lenders_States(Lender_ID, St_Abbrev)
			VALUES(#Lender_ID#, '#st_list[AAA]#')

		</CFQUERY>
	</CFLOOP>

</CFIF>


		<CFQUERY datasource="#request.dsn#" NAME="read_lenders">

			SELECT *
			FROM Lenders
			WHERE lender_id = #lender_Id#

		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_lenders_states">

			SELECT *
			FROM Lenders_states
			WHERE lender_id = #lender_Id#
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
			<FONT SIZE=2 COLOR=BLUE FACE=VERDANA>
			<CFIF #a_flag# EQ "1">
				The Address Information was successfully <B>MODIFIED</B>!
			<CFELSEIF #a_flag# EQ "2"><FONT SIZE=2 COLOR=red FACE=VERDANA>
				The Selected States were <B>DELETED</B> from the States Served List!</FONT>
			<CFELSE><FONT SIZE=2 COLOR=green FACE=VERDANA>
				The Selected States were <B>ADDED</B> to the States Served List!</FONT>
			</CFIF>
			<p>
			You may now proceed with any other Modifications you would like
			to make to this Lenders record.
			<p>


<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=white>



<CFOUTPUT>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=red face=arial>
			<B>TSS ID - </B>
		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=verdana>
			<B>#read_lenders.tss_id#</B>
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Company Name -
		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=verdana>
			<B>#read_lenders.company#</B>
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Address -
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=verdana>
			<B>#read_lenders.addr1#</B>
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Address -
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=verdana>
			<B>#read_lenders.addr2#</B>
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Note -
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=verdana>
			<B>#read_lenders.a_note_1#</B>
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			City -
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=verdana>
			<B>#read_lenders.city#</B>
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			State -
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=verdana>
			<B>#read_lenders.state#</B>
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Zip Code -
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=verdana>
			<B>#read_lenders.zip_code#</B>
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Phone -
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=verdana>
			<B>#read_lenders.phone#</B>
		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Fax -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=verdana>
			<B>#read_lenders.fax#</B>

		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Email -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=verdana>
			<B>#read_lenders.email#</B>

		</td>
	</tr>
	<tr>
		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Comments

		</td>
	</tr>

		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=verdana>
			<B>#read_lenders.a_comment#</B>

		</td>
	</tr>

	</tr>

		<td width=367 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<p>
			&nbsp;
			<p>

		</td>
	</tr>

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
	<FORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/lenders_modify_submit.cfm?uid=#URL.uid#&al=#URL.al#&lender_id=#lender_id#&a_flag=2">
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

