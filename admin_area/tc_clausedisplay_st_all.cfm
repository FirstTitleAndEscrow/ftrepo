<!--- ================================================= --->
<!--- ===/ [] Display all Clauses for each section \=== --->
<!--- ===/                                         \=== --->

<CFSET a_up_trigger = "1">
<CFSET a_down_trigger = "1">



				<CFQUERY datasource="#request.dsn#" NAME="read_temp_comm_12">		
					SELECT *
					FROM Title_Committment_Clauses_Selected_Title
					WHERE Title_ID = #rec_ID# AND a_section_code = '#a_section_code_for_this_section#'
					ORDER BY Committment_Item_Order ASC
				</CFQUERY>			


			<CFSET A_3 = "1">				
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
<CFIF #read_temp_comm_12.recordcount# GT "0">
<CFOUTPUT QUERY="read_temp_comm_12">
	<TR>
					<TD width=14 align=center valign=top  bgcolor=white>
						<a href="./title_committment_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&committment_id=#committment_id#&a_section_code=#a_section_code_for_this_section#" target="Title_committment_modify" onClick="window.open('','Title_committment_modify','width=440,height=450,left=10,top=10,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img src="./images/button_m.gif" border=0 ALT="[*] MODIFY  this   Clause"></a></TD>
<!---				<TD width=14 align=center valign=top  bgcolor=white>
						<a href="./title_committment_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&committment_id=#committment_id#&a_section_code=#a_section_code_for_this_section#" target="Title_committment_delete" onClick="window.open('','Title_committment_delete','width=440,height=450,left=10,top=10,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img src="./images/button_d.gif" border=0 ALT="[*] DELETE  this   Clause"></a></TD>
					<TD width=14 align=center valign=top  bgcolor=white><CFIF #a_up_trigger# GT "1"><a href="./title_committment.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&committment_id=#committment_id#&c_committment_Item_Order=#committment_Item_Order#&a_direction=up&c_committment_id=#committment_id#&a_section_code=#a_section_code_for_this_section#"><img src="./images/button_move_up.gif" border=0 ALT="[*] This Clause - MOVE UP"></a><CFELSE><img src="./images/button_move_up_gray.gif" border=0></CFIF><img src="./images/line_move_up_down.gif"><CFIF #a_down_trigger# LT #read_temp_comm_12.recordcount#><a href="./title_committment.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&c_committment_id=#committment_id#&c_committment_Item_Order=#committment_Item_Order#&a_direction=down&committment_id=#committment_id#&a_section_code=#a_section_code_for_this_section#"><img src="./images/button_move_down.gif" border=0  ALT="[*] This Clause - MOVE DOWN"></a><CFELSE><img src="./images/button_move_down_gray.gif" border=0></CFIF></td>
--->
					<TD width=15 align=right valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<NOBR>( #read_temp_comm_12.Committment_Item_Order#.) </NOBR>
					</td>
					<TD width=670 align=left valign=top  bgcolor=white>					
						<FONT SIZE=2 color=black face=arial>			

						#read_temp_comm_12.Committment_Item#			
						<p>
					</td>
				</tr>
			<CFSET A_3 = #A_3# + "1">
			<CFSET a_up_trigger = "2">
			<CFSET a_down_trigger = #a_down_trigger# + "1">				
</CFOUTPUT>

<CFELSE>
<CFOUTPUT>		<TR>
					<TD width=699 align=left valign=top  bgcolor=white>
					
						<!--- ===[ ]   BLANK SPACE    |=== --->
						
					</td>
				</tr>
</CFOUTPUT>
</CFIF>

</table>
<!--- ================================================= --->