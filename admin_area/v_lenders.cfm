
		<CFQUERY datasource="#request.dsn#" NAME="read_lender_co">
		
			SELECT *
			FROM Lenders 
			ORDER BY company ASC
		
		</CFQUERY>
		



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>

<BODY BGCOLOR="#FFFFFF" TEXT="Black" LINK="red" VLINK="red" ALINK="red" BACKGROUND="./" TopMargin=0 LeftMargin=0 MarginHeight=0 MarginWidth=0>


		<CENTER>

<table width=600 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

<CFSET a_trigger = "1">
<CFSET a_bg_color = "e2e2e2">

<CFOUTPUT QUERY="read_lender_co">
	<tr>
		<td bgcolor=#a_bg_color# width=150 align=right valign=top>
			<font size=1 color=black face=verdana>
			#tss_id#
		</td>

		<td bgcolor=#a_bg_color# width=150 align=right valign=top>
			<font size=1 color=black face=verdana>
			#company#
		</td>	
		
		<td bgcolor=#a_bg_color# width=150 align=right valign=top>
			<font size=1 color=black face=verdana>
			#addr1#
		</td>		

		<td bgcolor=#a_bg_color# width=150 align=right valign=top>
			<font size=1 color=black face=verdana>
			#addr2#
		</td>
	</tr>
	
	<tr>

		<td bgcolor=#a_bg_color# width=150 align=right valign=top>
			<font size=1 color=black face=verdana>
			#a_note_1#
		</td>	

		<td bgcolor=#a_bg_color# width=150 align=right valign=top>
			<font size=1 color=black face=verdana>
			#city#
		</td>			

		<td bgcolor=#a_bg_color# width=150 align=right valign=top>
			<font size=1 color=black face=verdana>
			#state#
		</td>
		
		<td bgcolor=#a_bg_color# width=150 align=right valign=top>
			<font size=1 color=black face=verdana>
			#zip_code#
		</td>
	</tr>
	
	<tr>
		<td bgcolor=#a_bg_color# width=150 align=right valign=top>
			<font size=1 color=black face=verdana>
			#phone#
		</td>		

		<td bgcolor=#a_bg_color# width=150 align=right valign=top>
			<font size=1 color=black face=verdana>
			#fax#
		</td>

		<td bgcolor=#a_bg_color# width=150 align=right valign=top>
			<font size=1 color=black face=verdana>
			#email#
		</td>

		<td bgcolor=#a_bg_color# width=150 align=right valign=top>
			<font size=1 color=black face=verdana>
			<NOBR><a href="./v_lender_modify.cfm?lid=#lender_id#" target="v_lender" onClick="window.open('','v_lender','width=520,height=450,status=0,resizable=0,scrollbars=1')">MODIFY</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="./v_delete_lender.cfm?lid=#lender_id#">DELETE</a>
		</td>
	</tr>

	<tr>
		<td bgcolor=gray colspan=4 width=600 align=center valign=top>
			<font size=1 color=black face=verdana>
			&nbsp;
		</td>
	</tr>
	
	<CFIF #a_trigger# EQ "1">
	
		<CFSET a_trigger = "2">
		<CFSET a_bg_color = "white">
		
	<CFELSE>

		<CFSET a_trigger = "1">
		<CFSET a_bg_color = "e2e2e2">
		
	</CFIF>
	
</CFOUTPUT>

</table>


</BODY>
</HTML>