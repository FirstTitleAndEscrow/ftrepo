





		<CFQUERY datasource="#request.dsn#" NAME="read_Closers">

			SELECT *
			FROM Closer
			ORDER BY company ASC, lname ASC, fname ASC

		</CFQUERY>







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
			<font size=2 color=green face=arial><B>Add Closer </B>
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
	<FORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/Closer_add_submit.cfm?uid=#URL.uid#&al=#URL.al#">
</CFOUTPUT>

	<tr>

		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<img src="./images/clear.gif" height=10 width=85>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			TSS Code -


		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="tss_id"  size=35 maxlength=75
			VALUE=""
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
			<input type=text name="company" VALUE="" size=25 maxlength=90
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
			First Name -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<input type=text name="fname" VALUE="" size=35 maxlength=50
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
			<input type=text name="lname" VALUE="" size=35 maxlength=50
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
			<input type=text name="phone" VALUE="" size=25 maxlength=22
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
			<input type=text name="cell" VALUE="" size=25 maxlength=22
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
			<input type=text name="fax" VALUE="" size=25 maxlength=22
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
			<input type=text name="email" VALUE="" size=35 maxlength=160
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
			<input type=text name="addr1" VALUE="" size=40 maxlength=120
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
			<input type=text name="addr2" VALUE="" size=40 maxlength=120
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
			<input type=text name="a_note_1" VALUE="" size=40 maxlength=400
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
			<input type=text name="city" VALUE="" size=30 maxlength=50
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
			<input type=text name="state" VALUE="" size=30 maxlength=50
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
			<input type=text name="zip" VALUE="" size=20 maxlength=20
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
			<input type=text name="a_cost" VALUE="" size=15 maxlength=20
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
					clear: none;"></TEXTAREA>


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
			<NOBR>Email - <input type=radio name="spref" VALUE="Email" checked>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fax - <input type=radio name="spref" VALUE="Fax"></NOBR>


		</td>
	</tr>





	<tr>

		<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<NOBR><input type=image src="./images/button_submit.gif" border=0><img src="./images/clear.gif" height=10 width=40></NOBR>


		</td>
	</tr>



</table>

</FORM>
		</td>



	</tr>
</table>

	<tr>
		<td width=499 align=center valign=top bgcolor=white>


<table width=498 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>

		<td width=497 align=center valign=top bgcolor=e1e1e1>
			<img src="./images/clear.gif" height=10 width=85>
			<font size=1 color=red face=arial>
			Review the list below to ensure the Closer isn't already in the Database

		</td>
	</tr>

	<tr>

		<td width=497  align=right valign=top bgcolor=e1e1e1>
			<FORM><SELECT NAME="a" MULTIPLE
			size="4"
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
			><CFOUTPUT QUERY="read_Closers"><OPTION VALUE="#company#">#Company# ---  #lname#, #fname#</OPTION></CFOUTPUT>
			</SELECT></FORM>
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

