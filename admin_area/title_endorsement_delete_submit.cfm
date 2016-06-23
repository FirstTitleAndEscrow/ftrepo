



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
			DELETE
			FROM Title_Endorsements_Selected
			WHERE Endorse_id = #URL.Endorse_id#	
		</CFQUERY>



<!--- ===/ Read the list of endorsements, and clean \=== --->
<!--- ===/ up the blank slot in the order to display \=== --->

		<CFQUERY datasource="#request.dsn#" NAME="read_list_of_endorsements">		
			SELECT *
			FROM Title_Endorsements_Selected
			WHERE Title_ID = #rec_id#
			ORDER BY Endorse_Item_Order ASC
		</CFQUERY>
		
		<CFSET a_temp_counter = "1">
		
		<CFOUTPUT QUERY="read_list_of_endorsements">
		
			<CFQUERY datasource="#request.dsn#">		
				UPDATE Title_Endorsements_Selected
				SET Endorse_Item_Order = #a_temp_counter#
				WHERE Endorse_id = #read_list_of_endorsements.Endorse_id#	
			</CFQUERY>
		
			<CFSET a_temp_counter = #a_temp_counter# + "1">
		
		
		</CFOUTPUT>
		
<!--- ================================================= --->		
		
		
		



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
				The Endorsement has been sucessfully deleted.  Click on the Close Window
				button below, and the Endorsements Page will refresh.
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