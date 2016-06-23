



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

		<CFQUERY datasource="#request.dsn#" NAME="read_title_co">		
			SELECT *
			FROM Title_companies
			WHERE Title_co_ID = 7		
		</CFQUERY>

		

		<CFQUERY datasource="#request.dsn#" NAME="read_current_endorsements">		
			SELECT *
			FROM Title_Endorsements_Selected
			WHERE Endorse_id = #URL.Endorse_id#	
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
			<td width=409 align=left valign=top bgcolor=red>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Insurance Endorsements</B> [ DELETE ]</CENTER>
			</TD>
		</TR>
<CFOUTPUT>

	<tr>
		<td width=409 align=center valign=top bgcolor=e1e1e1>
		
	
		
<!--- ================================================================ --->
<table width=408 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
		<tr>
			<td width=408  align=left valign=top bgcolor=red>
				<font size=1 color=white face=verdana>
				The Endorsement shown below is the one you have chosen to delete. Please review it before clicking on the delete button below, to ensure that this is the Endorsement that you actually want to delete.
			</td>
		</tr>
		<tr>
			<td width=408 align=left valign=top bgcolor=white>
				<font size=1 color=black face=verdana>
				#read_current_endorsements.endorse_item#
			</td>
		</tr>

		<tr>
			<td width=408 align=left valign=top bgcolor=white>
			
<table width=407 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=200  align=left valign=top bgcolor=e1e1e1>
				<font size=1 color=black face=verdana>
				<a href=javascript:window.close();><img src="./images/button_close.gif" border="0"></a>
			</td>
			<td width=207  align=right valign=top bgcolor=e1e1e1>
				<font size=1 color=black face=verdana>
				<A href="./title_endorsement_delete_submit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&Endorse_id=#URL.Endorse_id#"><img src="./images/button_delete.gif" border="0"></a>
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