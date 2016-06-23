

		<CFQUERY datasource="#request.dsn#" NAME="read_companies">
		
			SELECT *
			FROM companies
			WHERE company = '#URL.company#'
		
		</CFQUERY>



		<CFQUERY datasource="#request.dsn#" NAME="read_all_first_title_states">
		
			SELECT *
			FROM first_title_states
			ORDER BY st_abbrev ASC
		
		</CFQUERY>		
		
		
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>

</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>


<CENTER>

<CENTER>


	
	<CFFORM METHOD=POST ACTION="./client_line_costs_add_old.cfm?uid=#URL.uid#&al=#URL.al#&company=#URL.company#">	
			<p>
			<font size=2 color=black face=arial>
			<b>From the listbox below, choose which states to add to a new Line
			Cost set. Hold CTRL key to select more then one state</b>
			<p>
			<CENTER>
			
			
				
						<SELECT NAME="a_st_list_2" 	MULTIPLE		
								size="10" 
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e1e1e1; 
								border-color: e1e1e1; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none; 
								float: none;" 
								rows="5" 
								cols="45" 
								>
							<CFOUTPUT QUERY="read_all_first_title_states"> 
								<OPTION VALUE="#st_abbrev#">#st_abbrev#</OPTION>							
							</CFOUTPUT>
						</SELECT>			
			
			<p>
			<input type=image src="./images/button_next.gif" border=0>
			<p>
			</CFFORM>
			</CENTER>
		</td>
	</tr>
</table>
		</td>
	</tr>
</table>
		
		</td>		

		

	</tr>
</table>


	</td>
</tr>
</table>	

	</td>
</tr>
</table>


</BODY>
</HTML>

