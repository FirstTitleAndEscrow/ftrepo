








		<CFQUERY datasource="#request.dsn#" NAME="read_lenders">

			SELECT *
			FROM Lenders
			ORDER BY company ASC, state ASC

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

	<tr>

		<td width=498 align=left valign=top bgcolor=e1e1e1>
			<font size=1 color=black face=arial>
			From the pulldown below, pick the Lenders that you want to
			modify
			<p>
		</td>
	</tr>
<CFOUTPUT>
	<FORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/Lenders_modify_view.cfm?uid=#URL.uid#&al=#URL.al#">
</CFOUTPUT>
	<tr>

		<td width=498 colspan=2 align=left valign=top bgcolor=e1e1e1>
			<FORM><SELECT NAME="Lender_id"
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
			><CFOUTPUT QUERY="read_lenders"><OPTION VALUE="#lender_id#">#state#&nbsp;&nbsp;--&nbsp;#Company# </OPTION></CFOUTPUT>
			</SELECT>

		</td>
	</tr>



	<tr>

		<td width=367  align=right valign=top bgcolor=e6e6e6>
			<NOBR><input type=image src="./images/button_submit.gif" border=0><img src="./images/clear.gif" height=10 width=40></NOBR>


		</td>
	</tr>



</table>

</FORM>
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

