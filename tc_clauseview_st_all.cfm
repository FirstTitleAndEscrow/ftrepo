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
						<!--- === [ ]  SPACER    \=== --->
						<img src="./images/clear.gif" height=1 width=14>
					</TD>

					<TD width=10 align=right valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<NOBR>( #read_temp_comm_12.Committment_Item_Order#.) </NOBR>
					</td>
					<TD width=670 align=left valign=top  bgcolor=white>					
						<FONT SIZE=2 color=black face=arial>							#read_temp_comm_12.Committment_Item#			
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