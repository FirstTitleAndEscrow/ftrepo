
<CFPARAM NAME="a_direction" DEFAULT="">
<CFPARAM NAME="Insurance_Company" DEFAULT="">
<CFPARAM NAME="Title_Ins_Co_Is" DEFAULT="0">
<CFPARAM NAME="A_Update_DB_Flag" DEFAULT="0">
<CFPARAM NAME="N_Note_1" DEFAULT="0">






		<!--- ===/ If the A_Update_DB_Flag is GT 0   \=== --->
		<!--- ===/ then we need to update the proper \=== --->
		<!--- ===/ Table with the data from the form \=== --->
		
	

		<CFIF #A_Update_DB_Flag# GT "0">

			<CFQUERY datasource="#request.dsn#" NAME="read_uder_info">		
				SELECT *
				FROM First_Admin
				WHERE ID = #URL.uid#
			</CFQUERY>		
		

			

			<CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time)
				VALUES('#read_uder_info.FName#', '#read_uder_info.LName#', #URL.rec_id#, '#N_Note_1#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#')		
			</CFQUERY>	
			
			<CFQUERY datasource="#request.dsn#" NAME="read_info">		
				SELECT *
				FROM Title_Notes
				WHERE N_date = '#DateFormat(Now(), "m/d/yyyy")#' AND N_Time = '#TimeFormat(Now(), "HH:mm:ss")#' and order_id = #url.rec_id#
			</CFQUERY>	
	<CFQUERY datasource="#request.dsn#" NAME="read_notes">		
				SELECT *
				FROM Title_Notes
				WHERE order_id = #URL.rec_id# and N_Note LIKE '%Clear to Close%'
			</CFQUERY>	
			<cfif #read_notes.recordcount# GT 0>
		<CFQUERY datasource="#request.dsn#">		
				Update Title_Notes
				set status = 1 
				where note_id = #read_info.note_id# and N_Note NOT LIKE '%Clear to Close%'
			</CFQUERY>	
		<cfelse>
		<CFQUERY datasource="#request.dsn#">		
				Update Title_Notes
				set status = 1 
				where note_id = #read_info.note_id# and N_Note NOT LIKE '%Clear to Close%'
			</CFQUERY>
		</cfif>
			
		</CFIF>


	<!--- Read all of the Notes for this title --->
	
			<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">		
				SELECT *
				FROM Title_Notes
				Where Order_Id = #URL.rec_id#
				ORDER BY Note_ID ASC
			</CFQUERY>





<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=790 align=center valign=top>
		
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width=790 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Notes</B></CENTER>
			</TD>
		</TR>
	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>

		<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">
		<p>

<table width=700 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>


		<tr>
			<td width=700  align=right valign=top bgcolor=e1e1e1>
<CFOUTPUT QUERY="Read_all_notes">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>
			
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#N_Date#				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#N_Time#				
					</td>
					<td width=125 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#Fname# #LName#
					</td>
				<tr>
			</table>
			
		<td width=444 align=left valign=top bgcolor=e1e1e1>
			<PRE><font face=verdana size=1 color=black>#N_Note#</PRE>
		</td>
	</tr>
</table>

</CFOUTPUT>


<p>

<CFFORM NAME="frm" ACTION="./Title_Notes.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&Title_Ins_Co_Is=#Title_Ins_Co_Is#&A_Update_DB_Flag=1" METHOD=POST>

	<table width=619 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
		<tr>
			<td width=619 align=center valign=top bgcolor=green>
				<font face=verdana size=1 color=white>
				<b>Add a Note</a>			
		</tr>
		<tr>
			<td width=619 align=left valign=top bgcolor=e1e1e1>
				<TEXTAREA name="N_Note_1"  COLS=120 ROWS=10
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
		</tr>
		<tr>
			<td width=619 align=right valign=top bgcolor=e1e1e1>
				<input type=image src="./images/button_add.gif" border=0>			
		</tr>
	</table>
		
</table>
			</td>
		</tr>		
</table>

				</FORM>
<p>
<p>


<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->

</td>
</tr>

	</table>

			
			</TD>
		</TR>

	</table>
</CFFORM>	
</BODY>
</HTML>
	
	
	