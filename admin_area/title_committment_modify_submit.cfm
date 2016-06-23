



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
	
		

		
			<CFQUERY datasource="#request.dsn#">		
				UPDATE Title_Committment_Clauses_Selected_Title
				SET Committment_Item = '#ParagraphFormat(a_Committment_item)#'
				WHERE Committment_id = #URL.Committment_id#	
			</CFQUERY>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=400 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=400 align=center valign=top>
		
<table width=409 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width=409 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Insurance Commitments</B> [ MODIFY ]</CENTER>
			</TD>
		</TR>
<CFOUTPUT>

	<tr>
		<td width=409 align=center valign=top bgcolor=e1e1e1>
		
	
		
<!--- ================================================================ --->
<table width=408 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

		<tr>
			<td width=408  align=left valign=top bgcolor=green>
				<font size=1 color=white face=verdana>
				The Committment has been modified and is shown below.
				<p>
				Click on the Close button below.
			</td>
		</tr>
		<tr>
			<td width=408 align=left valign=top bgcolor=white>
				<font size=1 color=black face=verdana>
				#ParagraphFormat(a_Committment_item)#

			</td>
		</tr>

		<tr>
			<td width=408 align=right valign=top bgcolor=e1e1e1>
		<form>
					<input type="image" src="./images/button_close.gif" border=0 onClick="opener.location.reload(); self.close()">
			</form>	
			</td>

		</tr>

	</table>


			</td>

		</tr>

</table>
<!--- =========================================================== --->

</CFOUTPUT>

			</TD>
		</TR>

	</table>		


<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>