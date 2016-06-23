<CFPARAM NAME="a_trigger" DEFAULT=0>

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
		<CFINCLUDE TEMPLATE="./includes/title_top_navt.cfm">
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width=790 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Sent Information</B></CENTER>
			</TD>
		</TR>
	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>

<CFQUERY datasource="#request.dsn#" NAME="read_DEED">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'DATA'
				
</CFQUERY>


<cfif #read_deed.recordcount# GT 0>



<CFQUERY datasource="#request.dsn#" NAME="read_seq_num1">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'DATA' and seq_num = 1
				
</CFQUERY>

<cfif #read_seq_num1.recordcount# GT 0>
	

<CFOUTPUT QUERY="read_seq_num1">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
				
				</tr>
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	
			<a href="./abstractor_admin_deed_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify DEED 1</font></a>	
			</td>
			<td width=270 align=left valign=top bgcolor=e1e1e1>
				
		
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
	</cfif>
	
<CFQUERY datasource="#request.dsn#" NAME="read_seq_num2">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'DATA' and seq_num = 2
				
</CFQUERY>

<cfif #read_seq_num2.recordcount# GT 0>
	

<CFOUTPUT QUERY="read_seq_num2">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
				
				</tr>
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	
			<a href="./abstractor_admin_deed_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify DEED 2</font></a>	
			</td>
			<td width=270 align=left valign=top bgcolor=e1e1e1>
				
		
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
	</cfif>
	
	
	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num3">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'DATA' and seq_num = 3
				
</CFQUERY>

<cfif #read_seq_num3.recordcount# GT 0>
	

<CFOUTPUT QUERY="read_seq_num3">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
				
				</tr>
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	
			<a href="./abstractor_admin_deed_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify DEED 3</font></a>	
			</td>
			<td width=270 align=left valign=top bgcolor=e1e1e1>
				
		
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
	</cfif>
	
	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num4">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'DATA' and seq_num = 4
				
</CFQUERY>

<cfif #read_seq_num4.recordcount# GT 0>
	

<CFOUTPUT QUERY="read_seq_num4">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
				
				</tr>
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	
			<a href="./abstractor_admin_deed_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify DEED 4</font></a>	
			</td>
			<td width=270 align=left valign=top bgcolor=e1e1e1>
				
		
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
	</cfif>
	
	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num5">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'DATA' and seq_num = 5
				
</CFQUERY>

<cfif #read_seq_num5.recordcount# GT 0>
	

<CFOUTPUT QUERY="read_seq_num5">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
				
				</tr>
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	
			<a href="./abstractor_admin_deed_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify DEED 5</font></a>	
			</td>
			<td width=270 align=left valign=top bgcolor=e1e1e1>
				
		
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
	</cfif>
	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num6">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'DATA' and seq_num = 6
				
</CFQUERY>

<cfif #read_seq_num6.recordcount# GT 0>
	

<CFOUTPUT QUERY="read_seq_num6">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
				
				</tr>
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	
			<a href="./abstractor_admin_deed_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify DEED 6</font></a>	
			</td>
			<td width=270 align=left valign=top bgcolor=e1e1e1>
				
		
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
	</cfif>
	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num7">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'DATA' and seq_num = 7
				
</CFQUERY>

<cfif #read_seq_num7.recordcount# GT 0>
	

<CFOUTPUT QUERY="read_seq_num7">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
				
				</tr>
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	
			<a href="./abstractor_admin_deed_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify DEED 7</font></a>	
			</td>
			<td width=270 align=left valign=top bgcolor=e1e1e1>
				
		
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
	</cfif>
	
	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num8">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'DATA' and seq_num = 8
				
</CFQUERY>

<cfif #read_seq_num8.recordcount# GT 0>
	

<CFOUTPUT QUERY="read_seq_num8">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
				
				</tr>
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	
			<a href="./abstractor_admin_deed_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify DEED 8</font></a>	
			</td>
			<td width=270 align=left valign=top bgcolor=e1e1e1>
				
		
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
	</cfif>
	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num9">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'DATA' and seq_num = 9
				
</CFQUERY>

<cfif #read_seq_num9.recordcount# GT 0>
	

<CFOUTPUT QUERY="read_seq_num9">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
				
				</tr>
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	
			<a href="./abstractor_admin_deed_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify DEED 9</font></a>	
			</td>
			<td width=270 align=left valign=top bgcolor=e1e1e1>
				
		
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
	</cfif>
	<CFQUERY datasource="#request.dsn#" NAME="read_seq_num10">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'DATA' and seq_num = 10
				
</CFQUERY>

<cfif #read_seq_num10.recordcount# GT 0>
	

<CFOUTPUT QUERY="read_seq_num10">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
				
				</tr>
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	
			<a href="./abstractor_admin_deed_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify DEED 10</font></a>	
			</td>
			<td width=270 align=left valign=top bgcolor=e1e1e1>
				
		
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
	</cfif>
	
	
	</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_LIEN">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'LIEN'
				
</CFQUERY>


<cfif #read_LIEN.recordcount# GT 0>



<CFQUERY datasource="#request.dsn#" NAME="read_seq_num1">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'LIEN' and seq_num = 1
				
</CFQUERY>

<cfif #read_seq_num1.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num1">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	
			<a href="./abstractor_admin_lien_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify LIEN 1</font></a>	
			</td>
			<td width=270 align=left valign=top bgcolor=e1e1e1>
				
		
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
	</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num2">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'LIEN' and seq_num = 2
				
</CFQUERY>

<cfif #read_seq_num2.recordcount# GT 0>
<CFOUTPUT QUERY="read_seq_num2">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	
			<a href="./abstractor_admin_lien_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify LIEN 2</font></a>	
			</td>
			<td width=270 align=left valign=top bgcolor=e1e1e1>
				
		
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num3">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'LIEN' and seq_num = 3
				
</CFQUERY>

<cfif #read_seq_num3.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num3">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	
			<a href="./abstractor_admin_lien_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify LIEN 3</font></a>	
			</td>
			<td width=270 align=left valign=top bgcolor=e1e1e1>
				
		
		</td>
	</tr>
</table>
		
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num4">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'LIEN' and seq_num = 4
				
</CFQUERY>
<cfif #read_seq_num4.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num4">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	
			<a href="./abstractor_admin_lien_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify LIEN 4</font></a>	
			</td>
			<td width=270 align=left valign=top bgcolor=e1e1e1>
				
		
		</td>
	</tr>
</table>
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num5">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'LIEN' and seq_num = 5
				
</CFQUERY>
<cfif #read_seq_num5.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num5">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	
			<a href="./abstractor_admin_lien_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify LIEN 5</font></a>	
			</td>
			<td width=270 align=left valign=top bgcolor=e1e1e1>
				
		
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num6">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'LIEN' and seq_num = 6
				
</CFQUERY>
<cfif #read_seq_num6.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num6">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	
			<a href="./abstractor_admin_lien_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify LIEN 6</font></a>	
			</td>
			<td width=270 align=left valign=top bgcolor=e1e1e1>
				
		
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num7">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'LIEN' and seq_num = 7
				
</CFQUERY>

<cfif #read_seq_num7.recordcount# GT 0>
<CFOUTPUT QUERY="read_seq_num7">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	
			<a href="./abstractor_admin_lien_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify LIEN 7</font></a>	
			</td>
			<td width=270 align=left valign=top bgcolor=e1e1e1>
				
		
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num8">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'LIEN' and seq_num = 8
				
</CFQUERY>

<cfif #read_seq_num8.recordcount# GT 0>
<CFOUTPUT QUERY="read_seq_num8">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	
			<a href="./abstractor_admin_lien_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify LIEN 8</font></a>	
			</td>
			<td width=270 align=left valign=top bgcolor=e1e1e1>
				
		
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num9">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'LIEN' and seq_num = 9
				
</CFQUERY>
<cfif #read_seq_num9.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num9">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	
			<a href="./abstractor_admin_lien_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify LIEN 9</font></a>	
			</td>
			<td width=270 align=left valign=top bgcolor=e1e1e1>
				
		
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
	
	
	</cfif>
	
<CFQUERY datasource="#request.dsn#" NAME="read_seq_num10">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'LIEN' and seq_num = 10
				
</CFQUERY>
<cfif #read_seq_num10.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num10">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	
			<a href="./abstractor_admin_lien_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify LIEN 10</font></a>	
			</td>
			<td width=270 align=left valign=top bgcolor=e1e1e1>
				
		
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
	
	
	</cfif>

</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_mortgage">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'MORTGAGE'
				
</CFQUERY>


<cfif #read_mortgage.recordcount# GT 0>



<CFQUERY datasource="#request.dsn#" NAME="read_seq_num1">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 1
				
</CFQUERY>

<cfif #read_seq_num1.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num1">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
		
		<a href="./abstractor_admin_MORTGAGE_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify MORTGAGE 1</font></a>	
				</td>
				<td width=270 align=left valign=top bgcolor=e1e1e1>
	
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
	</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num2">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 2
				
</CFQUERY>

<cfif #read_seq_num2.recordcount# GT 0>
<CFOUTPUT QUERY="read_seq_num2">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>

		<a href="./abstractor_admin_MORTGAGE_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify MORTGAGE 2</font></a>	
				</td>		
				<td width=290 align=left valign=top bgcolor=e1e1e1>
	
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num3">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 3
				
</CFQUERY>

<cfif #read_seq_num3.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num3">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>

			<a href="./abstractor_admin_MORTGAGE_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify MORTGAGE 3</font></a>	
			</td>
				<td width=290 align=left valign=top bgcolor=e1e1e1>		
		
		
		</td>
	</tr>
</table>
		
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num4">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 4
				
</CFQUERY>
<cfif #read_seq_num4.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num4">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	<a href="./abstractor_admin_MORTGAGE_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify MORTGAGE 4</font></a>	
				</td>
				<td width=290 align=left valign=top bgcolor=e1e1e1>	
	
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num5">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 5
				
</CFQUERY>
<cfif #read_seq_num5.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num5">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	
			<a href="./abstractor_admin_MORTGAGE_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify MORTGAGE 5</font></a>	
				</td>
					<td width=290 align=left valign=top bgcolor=e1e1e1>
		
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num6">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 6
				
</CFQUERY>
<cfif #read_seq_num6.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num6">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	
			<a href="./abstractor_admin_MORTGAGE_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify MORTGAGE 6</font></a>	
				</td>	<td width=290 align=left valign=top bgcolor=e1e1e1>		
			
		
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num7">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 7
				
</CFQUERY>
<cfif #read_seq_num7.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num7">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	
			<a href="./abstractor_admin_MORTGAGE_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify MORTGAGE 7</font></a>	
			</td>
			<td width=270 align=left valign=top bgcolor=e1e1e1>
				
		
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num8">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 8
				
</CFQUERY>

<cfif #read_seq_num8.recordcount# GT 0>
<CFOUTPUT QUERY="read_seq_num8">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	
			<a href="./abstractor_admin_MORTGAGE_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify MORTGAGE 8</font></a>	
			</td>
			<td width=270 align=left valign=top bgcolor=e1e1e1>
				
		
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num9">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 9
				
</CFQUERY>

<cfif #read_seq_num9.recordcount# GT 0>
<CFOUTPUT QUERY="read_seq_num9">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	
			<a href="./abstractor_admin_MORTGAGE_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify MORTGAGE 9</font></a>	
			</td>
			<td width=270 align=left valign=top bgcolor=e1e1e1>
				
		
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num10">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 10
				
</CFQUERY>
<cfif #read_seq_num10.recordcount# GT 0>

<CFOUTPUT QUERY="read_seq_num10">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
		<td width=174 align=left valign=top bgcolor=e1e1e1>
	
			<a href="./abstractor_admin_MORTGAGE_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Click to modify MORTGAGE 10</font></a>	
			</td>
			<td width=270 align=left valign=top bgcolor=e1e1e1>
				
		
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
	
	
	</cfif>
	
	</cfif>

	
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
	
	
	