



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

		
		

		

		<CFQUERY datasource="#request.dsn#" NAME="read_current_committment_Clauses">		
			SELECT *
			FROM Title_Committment_Clauses_Selected_Title
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
<FORM ACTION="./title_Committment_modify_submit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_ID#&a_trigger=1&company_id=#company_ID#&Committment_id=#URL.Committment_id#" METHOD=POST>
		
	
		
		<tr>
			<td width=408  align=left valign=top bgcolor=green>
				<font size=1 color=white face=verdana>
				The Committment shown below is the one you have chosen to modify. Make any changes you need to and then click on the submit button below.
			</td>
		</tr>
		<tr>
			<td width=408 align=left valign=top bgcolor=white>
				<TEXTAREA name="a_Committment_item"  COLS=76 ROWS=6
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
					clear: none;">#read_current_committment_Clauses.Committment_item#</TEXTAREA>

			</td>
		</tr>

		<tr>
			<td width=408 align=right valign=top bgcolor=e1e1e1>
				<INPUT TYPE=IMAGE src="./images/button_submit.gif" border="0">
			</td>

		</tr>

	</table>
<input type="Hidden" name = "rec_ID" value="#read_current_committment_Clauses.Committment_item#">

			</td>

		</tr>

</table>
<!--- =========================================================== --->
</FORM>
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