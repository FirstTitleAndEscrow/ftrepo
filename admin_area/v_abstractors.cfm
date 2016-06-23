
		<CFQUERY datasource="#request.dsn#" NAME="read_abstractors">
		
			SELECT *
			FROM Abstractors 
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
<CFSET a_bg_color = "79FBB7">

<CFOUTPUT QUERY="read_abstractors">
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
			<NOBR><a href="./v_abstractor_modify.cfm?aid=#abstractor_id#" target="v_abstractors" onClick="window.open('','v_abstractors','width=520,height=450,status=0,resizable=0,scrollbars=1')">MODIFY</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="./v_delete_abstractors.cfm?aid=#abstractor_id#">DELETE</a>
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
		<CFSET a_bg_color = "79FBB7">
		
	<CFELSE>

		<CFSET a_trigger = "1">
		<CFSET a_bg_color = "FBF779">
		
	</CFIF>
	
</CFOUTPUT>

</table>


</BODY>
</HTML>