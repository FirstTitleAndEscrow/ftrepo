
		<CFQUERY datasource="#request.dsn#" NAME="read_data">
		
			SELECT * 
			FROM Closing_Forms
			WHERE Form_ID = #form_id#
		
		</CFQUERY>
		
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>

<BODY BGCOLOR="#FFFFFF" TEXT="Black" LINK="Blue" VLINK="Blue" ALINK="Blue" BACKGROUND="./" TopMargin=0 LeftMargin=0 MarginHeight=0 MarginWidth=0>

<CENTER>

<table width=600 cellpadding=1 cellspacing=1 border=0>
	<tr>
		<td width=600 align=left valign=top>
		<font size=3 color=black face=arial>
<CFOUTPUT>

#HTMLCodeFormat(read_data.form_content)#


</CFOUTPUT>
		</td>
	</tr>
</table>


</BODY>
</HTML>
