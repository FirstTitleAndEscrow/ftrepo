		
			<CFQUERY datasource="#request.dsn#" NAME="read_shipping">		
				SELECT *
				FROM closer_info
				Where title_Id = #URL.rec_id#
				
			</CFQUERY>
	
	
	
			<CFQUERY datasource="#request.dsn#" NAME="read_notes">		
				SELECT *
				FROM closer_info
				Where title_Id = #URL.rec_id#
				
			</CFQUERY>
		
		
	
			
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>

		
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=elelel>
	<tr>
		<td width=790 align=center valign=top>
		<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width=790 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Closer Data Information</B></CENTER>
			</TD>
		</TR>
	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>
		
<CFOUTPUT QUERY="Read_notes">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#closer_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#closer_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
		<td width=444 align=left valign=top bgcolor=e1e1e1>
			<PRE><font face=verdana size=1 color=black>#closer_data#</PRE>
		</td>
	</tr>
</table>
		
		</CFOUTPUT> 	
		



			</td>
		</tr>		
</table>

				


</td>
</tr>

	</table>

			
			</TD>
		</TR>

	</table>

</BODY>
</HTML>
	
	
	