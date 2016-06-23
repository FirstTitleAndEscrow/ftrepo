
<CFPARAM NAME="a_direction" DEFAULT="">
<CFPARAM NAME="Insurance_Company" DEFAULT="">
<CFPARAM NAME="Title_Ins_Co_Is" DEFAULT="0">
<CFPARAM NAME="A_Update_DB_Flag" DEFAULT="0">
<CFPARAM NAME="shipping" DEFAULT="0">






		<!--- ===/ If the A_Update_DB_Flag is GT 0   \=== --->
		<!--- ===/ then we need to update the proper \=== --->
		<!--- ===/ Table with the data from the form \=== --->
			<CFIF #A_Update_DB_Flag# GT "0">

	<CFQUERY datasource="#request.dsn#" NAME="read_uder_info">		
				SELECT *
				FROM First_Admin
				WHERE ID = #URL.uid#
			</CFQUERY>		

	
			
		<!--- 	<CFQUERY datasource="#request.dsn#" NAME="read_all_shipping">		
				SELECT *
				FROM shipping_info
				Where Id = #URL.rec_id#
				
			</CFQUERY>
			<cfif #read_all_shipping.recordcount# GT "0">
		
		<CFQUERY datasource="#request.dsn#">		
				update Shipping_Info
				set ID = #URL.rec_id#, 
				shipping_data = '#shipping#',
				shipping_Date = '#DateFormat(Now(), "m/d/yyyy")#',
				shipping_Time = '#TimeFormat(Now(), "HH:mm:ss")#',
				u_lname = '#read_uder_info.lname#',
				u_fname = '#read_uder_info.fname#'	
			where ID = #URL.rec_id#
			</CFQUERY>	

			<cfelse> --->

			<CFQUERY datasource="#request.dsn#">		
				Insert into Shipping_Info
				(ID, shipping_data, shipping_Date, shipping_Time, u_lname, u_fname)
				values (#URL.rec_id#, 
				 '#shipping#',
				 '#DateFormat(Now(), "m/d/yyyy")#',
				 '#TimeFormat(Now(), "HH:mm:ss")#',
				 '#read_uder_info.lname#',
				 '#read_uder_info.fname#'	)
			</CFQUERY>	
			
		</CFIF>


	<!--- Read all of the Notes for this title --->
	
			<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">		
				SELECT *
				FROM shipping_info
				Where Id = #URL.rec_id#
				
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
				<CENTER><B>Shipping Information</B></CENTER>
			</TD>
		</TR>
	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>

		<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">
		<p>


<CFOUTPUT QUERY="Read_all_notes">

<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>
			
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#shipping_Date#			
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#shipping_Time#			
					</td>
					<td width=125 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#u_Fname# #u_LName#
					</td>
				<tr>
			</table>
			
		<td width=444 align=left valign=top bgcolor=e1e1e1>
			<PRE><font face=verdana size=1 color=black>#shipping_data#</PRE>
		</td>
	</tr>
</table>
		
		</CFOUTPUT> 	
		






<CFFORM NAME="frm" ACTION="./shipping_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&Title_Ins_Co_Is=#Title_Ins_Co_Is#&A_Update_DB_Flag=1" METHOD=POST>

	<table width=619 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
		<tr>
			<td width=619 align=center valign=top bgcolor=green>
				<font face=verdana size=1 color=white>
				<b>Add Shipping Information</a>			
		</tr>
		<tr>
			<td width=619 align=left valign=top bgcolor=e1e1e1>
				<TEXTAREA name="shipping"  COLS=120 ROWS=20
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
	
	
	