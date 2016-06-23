






		<CFQUERY datasource="#request.dsn#" NAME="read_Examiners">

			SELECT *
			FROM Examiner
			WHERE Examiner_ID = #Examiner_ID#

		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_state_list">

			SELECT *
			FROM first_title_states
			ORDER BY st_abbrev ASC

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_Examiner_states_list">

			SELECT st_id, Examiner_ID, st_abbrev
			FROM Examiner_states
			WHERE Examiner_ID = #Examiner_ID#
			ORDER BY st_abbrev ASC

		</CFQUERY>


		<CFSET st_list_1 = ArrayNew(1)>
		<CFSET a_count = "1">

		<CFOUTPUT QUERY="read_Examiner_states_list">
			<CFSET st_list_1[a_count] = #st_abbrev#>
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
			<font size=2 color=green face=arial><B>Modify Examiner States List</B>
		</td>
	</tr>

</table>

		</td>
	</tr>
	<tr>
		<td width=499 align=left valign=top bgcolor=e1e1e1>
		<NOBR><a href="https://#cgi.server_name#/admin_area/Examiner_modify_choose.cfm?uid=#URL.uid#&al=#URL.al#&Examiner_ID=#Examiner_ID#"><img src="./images/button_return.gif" border=0></a><img src="./images/clear.gif" height=10 width=85></NOBR>

		</td>
	</tr>

	<tr>
		<td width=499 align=center valign=top bgcolor=e1e1e1>


<table width=498 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>

		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<img src="./images/clear.gif" height=10 width=85>


		</td>
	</tr>

	<tr>

		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=black face=arial>
		You are modifying the States List for:<p>
		<b>#read_Examiners.company#<br>
		#read_Examiners.fname# #read_Examiners.lname#</b>

		</td>
	</tr>
</CFOUTPUT>


	<tr>

		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>States Currently Serviced</b>
		</td>
	</tr>


<CFIF #read_Examiner_states_list.recordcount# EQ "0">

	<tr>
		<td width=498 colspan=2 align=left valign=top bgcolor=f1f1f1>
		<p>
		<bR>
		<font size=2 color=blue face=arial>
		This Examiner does not have any "States Serviced" in their list.
		<p>
		</td>
	</tr>

<CFELSE>
	<tr>
		<td width=448 align=left valign=top bgcolor=f1f1f1>
		<font size=2 color=black face=arial>
		This is the current List of States for this Examiner.	To
		Delete states from this list, click on each one to be deleted
		then click on the submit button.
		<p>	<font size=1 color=red face=arial>
		Deleting a State will also delete all Counties associated with that
		State from this Examiner Counties List
		</td>

		<td width=50 align=left valign=top bgcolor=f1f1f1>
<CFOUTPUT>
	<FORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/Examiner_modify_states_delete.cfm?uid=#URL.uid#&al=#URL.al#&Examiner_ID=#Examiner_ID#">
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
					><CFOUTPUT QUERY="read_Examiner_states_list"><OPTION VALUE="#st_abbrev#">#st_abbrev#</OPTION></CFOUTPUT>
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
			<b>States NOT Currently Serviced</b>
		</td>
	</tr>

	<tr>
		<td width=448 align=left valign=top bgcolor=f1f1f1>
		<font size=2 color=black face=arial>
		Click on any of the
		States in the list to add them to this Examiner <br>"States
		Serviced" List.<font size=1 color=blue face=arial> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(hold down the CTRL key to select more than one)
		<p>
		</td>

		<td width=50 align=left valign=top bgcolor=f1f1f1>
<CFOUTPUT>
	<FORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/Examiner_modify_states_add.cfm?uid=#URL.uid#&al=#URL.al#&Examiner_ID=#Examiner_ID#">
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
					<CFOUTPUT QUERY="read_state_list">
						<CFSET a_trigger = "1">
						<CFLOOP FROM="1" TO="#ArrayLen(st_list_1)#" INDEX="RRR">
							<CFIF #st_list_1[RRR]# EQ "#st_abbrev#">
								<CFSET a_trigger = "2">
							</CFIF>
						</CFLOOP>
							<CFIF #a_trigger# EQ "1">
								<OPTION VALUE="#st_abbrev#">#st_abbrev#</OPTION>
							</CFIF>
					</CFOUTPUT>
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

