




<CFOUTPUT>
		<!--- =================================================================== --->			
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699 align=center valign=top>
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699  align=center valign=top  bgcolor=white>
						<img src="./images/Logo-Chicago-Sched-A.gif">
					</td>
				</tr>
				<TR>
					<TD width=699  align=center valign=top  bgcolor=white>
						<FONT SIZE=3 color=black face=arial>
						COMMITTMENT FOR TITLE INSURANCE
					</td>
				</tr>
				<TR>
					<TD width=699  align=RIGHT valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<NOBR>Committment Number: <CFINPUT type=text name="Committment_Number"  size=30 maxlength=125
							VALUE="#Read_Committment_Doc.Committment_Number#"
							style="font-size: 11; 
							font-family: verdana; 
							font-style: normal; 
							color: blue; 
							background-color: white; 
							border-color: e6e6e6; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none; "></NOBR>
					</td>
				</tr>

			</table>					
		<p>
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=30  align=right valign=top  bgcolor=white>
						<p><FONT SIZE=2 color=black face=arial>
						( 1.)
					</td>
					<TD width=669 align=left valign=top  bgcolor=white>
						<p><FONT SIZE=2 color=black face=arial>
						Effective Date: <CFINPUT type=text name="Effective_Date"  size=30 maxlength=125
							VALUE="#Read_Committment_Doc.Effective_Date#"
							style="font-size: 11; 
							font-family: verdana; 
							font-style: normal; 
							color: blue; 
							background-color: white; 
							border-color: e6e6e6; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none; "></NOBR></NOBR>
					</td>
				</tr>
			</table>
		<p>
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=30  align=right valign=top  bgcolor=white>
						<p><FONT SIZE=2 color=black face=arial>
						( 2.)
					</td>
					<TD width=469 colspan=2 align=left valign=top  bgcolor=white>
						<p><FONT SIZE=2 color=black face=arial>
						Policy or Policies to be issued:
					</td>
					<TD width=200 align=center valign=top  bgcolor=white>
						<p><FONT SIZE=2 color=black face=arial>
						<NOBR>Amount of Insurance</NOBR>
					</td>
				</tr>
				<TR>
					<TD width=30  align=right valign=top  bgcolor=white>
						<img src="./images/clear.gif" height=10 width=30>
					</td>
					<TD width=20  align=right valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial><NOBR><img src="./images/clear.gif" height=10 width=5>(a) </NOBR>
					</td>
					<TD width=449 align=left valign=top  bgcolor=white>
						<CFINPUT type=text name="Policy_To_Issue_Owner_1"  size=60 maxlength=1000
							VALUE="#Read_Committment_Doc.Policy_To_Issue_Owner_1#"
							style="font-size: 11; 
							font-family: verdana; 
							font-style: normal; 
							color: blue; 
							background-color: white; 
							border-color: e6e6e6; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none; ">
					</td>
					<TD width=200 align=center valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						$ <B>#NumberFormat(read_title.Purchase_Price, "999,999,999.00")#</B>
					</td>
				</tr>
			<!--- ============================================================== --->
				<TR>
					<TD width=30  align=right valign=top  bgcolor=white>
						<img src="./images/clear.gif" height=10 width=30>
					</td>
					<TD width=20  align=right valign=top  bgcolor=white>
						<img src="./images/clear.gif" height=10 width=20>
					</td>
					<TD width=449 align=left valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						Proposed Insured:
					</td>
					<TD width=200 align=center valign=top  bgcolor=white>
						<FONT SIZE=2 color=gray face=arial>
						&nbsp;
					</td>
				</tr>
			<!--- ============================================================== --->
				<TR>
					<TD width=30  align=right valign=top  bgcolor=white>
						<img src="./images/clear.gif" height=10 width=30>
					</td>
					<TD width=20  align=right valign=top  bgcolor=white>
						<img src="./images/clear.gif" height=10 width=20>
					</td>
					<TD width=449 align=left valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<B>#a_proposed_insured_1#</B><br>
						<B>#a_proposed_insured_2#</B>
					</td>
					<TD width=200 align=center valign=top  bgcolor=white>
						<FONT SIZE=2 color=gray face=arial>
						&nbsp;
					</td>
				</tr>
			<!--- ============================================================= --->
			<!--- ============================================================= --->
			<!--- ============================================================= --->
				<TR>
					<TD width=699  colspan=4 align=left valign=top  bgcolor=white>
						<img src="./images/clear.gif" height=15 width=699>
					</td>
				</tr>
				<TR>
					<TD width=30  align=right valign=top  bgcolor=white>
						<img src="./images/clear.gif" height=10 width=30>
					</td>
					<TD width=20  align=right valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial><NOBR><img src="./images/clear.gif" height=10 width=25>(b) </NOBR>
					</td>
					<TD width=449 align=left valign=top  bgcolor=white>
						<CFINPUT type=text name="Policy_To_Issue_Lender_1"  size=60 maxlength=1000
							VALUE="#Read_Committment_Doc.Policy_To_Issue_Lender_1#"
							style="font-size: 11; 
							font-family: verdana; 
							font-style: normal; 
							color: blue; 
							background-color: white; 
							border-color: e6e6e6; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none; ">
					</td>
					<TD width=200 align=center valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						$ <B>#NumberFormat(read_title.loanamt_float, "999,999,999.00")#</B>
					</td>
				</tr>
			<!--- ============================================================== --->
				<TR>
					<TD width=30  align=right valign=top  bgcolor=white>
						<img src="./images/clear.gif" height=10 width=30>
					</td>
					<TD width=20  align=right valign=top  bgcolor=white>
						<img src="./images/clear.gif" height=10 width=20>
					</td>
					<TD width=449 align=left valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						Proposed Insured:
					</td>
					<TD width=200 align=center valign=top  bgcolor=white>
						<FONT SIZE=2 color=gray face=arial>
						&nbsp;
					</td>
				</tr>
			<!--- ============================================================== --->
				<TR>
					<TD width=30  align=right valign=top  bgcolor=white>
						<img src="./images/clear.gif" height=10 width=30>
					</td>
					<TD width=20  align=right valign=top  bgcolor=white>
						<img src="./images/clear.gif" height=10 width=20>
					</td>
					<TD width=449 align=left valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<B>#read_Title.Insured#</B>
					</td>
					<TD width=200 align=center valign=top  bgcolor=white>
						<FONT SIZE=2 color=gray face=arial>
						&nbsp;
					</td>
				</tr>			
			</table>
		<p>
		<!--- =========================================================== --->
		<!--- =========================================================== --->		
		<!--- =========================================================== --->
</CFOUTPUT>		
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

				<TR>
					<TD width=699  align=left valign=top  bgcolor=white>
						<CFSET a_section_code_for_this_section = "A1">
						<CFINCLUDE TEMPLATE="./TC_ClauseDisplay_CH_All.cfm">
					</td>
				</tr>

			</table>
		<!--- =========================================================== --->		
			<p>
		<table width=699 cellpadding=0 cellspacing=0 border=0 bgcolor=white>
			<TR>
				<TD bgcolor=white width=699 align=left valign=top>			
					<FONT SIZE=2 color=black face=arial>
					Countersigned By:
				</td>
			</tr>
			<TR>
				<TD bgcolor=white width=699 align=left valign=top>			
					<img src="./images/clear.gif" height=45 width=50>
				</td>
			</tr>
			<TR>
				<TD bgcolor=white width=699 align=left valign=top>			
					<NOBR><FONT SIZE=2 color=black face=arial><img src="./images/sign4.gif"></NOBR>
				</td>
			</tr>
			<TR>
				<TD bgcolor=black width=699 align=left valign=top>			
					<img src="./images/clear.gif" height=45 width=50>
				</td>
			</tr>

		<!--- ===/ Create a tall blank space before Schedule B Section is displayed \=== --->
			</table>			
<p>				
		
<!--- ====================================================================== --->
<!--- =================[ END OF SCHEDULE A ]================================ --->
<!--- ====================================================================== --->				
				
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
				

<!--- ====================================================================== --->
<!--- ====================[ BEGIN OF SCHEDULE  ]============================ --->
<!--- ====================[ A2 - Description   ]============================ --->
<!--- ====================================================================== --->

			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699  align=center valign=top  bgcolor=white>
						<img src="./images/Logo-Chicago-Sched-A-Desc.gif">
					</td>
				</tr>
				<TR>
					<TD width=699  align=center valign=top  bgcolor=white>
						<FONT SIZE=3 color=black face=arial>
						COMMITTMENT FOR TITLE INSURANCE
					</td>
				</tr>
<CFOUTPUT>
				<TR>
					<TD width=699  align=RIGHT valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<NOBR>Committment Number: #Read_Committment_Doc.Committment_Number#</NOBR>
					</td>
				</tr>
</CFOUTPUT>
			</table>					
		<p>

		<!--- =========================================================== --->
		<!--- =========================================================== --->		
		<!--- =========================================================== --->
		
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699  align=left valign=top  bgcolor=white>
						<CFSET a_section_code_for_this_section = "A2">
						<CFINCLUDE TEMPLATE="./TC_ClauseDisplay_CH_All.cfm">
					</td>
				</tr>
			</table>
		<p>
<CFOUTPUT>
		<!--- =========================================================== --->
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699  align=left valign=top  bgcolor=white>
						<a href="./title_committment_select_add_popup.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&a_section_code=A2" target="Title_committment" onClick="window.open('','Title_committment','width=605,height=500,left=10,top=10,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img src="./images/button_add_a_clause.gif" border=0 ALT="[*] ADD a new Clause"></a>
					</td>
				</tr>	
			</table>
</CFOUTPUT>
			<p>
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
			<TR>
				<TD bgcolor=black width=699 align=right valign=top>			
					<img src="./images/clear.gif" height=60 width=690>
					</td>
				</tr>
		<!--- ===/ Create a tall blank space before Schedule B2 Section is displayed \=== --->
			</table>			
<p>				
		
<!--- ====================================================================== --->
<!--- =================[ END OF SCHEDULE A2 Desc   ]======================== --->
<!--- ====================================================================== --->				
				
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
				

<!--- ====================================================================== --->
<!--- ==============[ BEGIN OF SCHEDULE B - SECTION 1 ]===================== --->
<!--- ==============[ Requirements                    ]===================== --->
<!--- ==============[ B1                              ]===================== --->
<!--- ====================================================================== --->

			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699  align=center valign=top  bgcolor=white>
						<img src="./images/Logo-Chicago-Sched-B-Sect-1.gif">
					</td>
				</tr>
				<TR>
					<TD width=699  align=center valign=top  bgcolor=white>
						<FONT SIZE=3 color=black face=arial>
						COMMITTMENT FOR TITLE INSURANCE
					</td>
				</tr>
<CFOUTPUT>
				<TR>
					<TD width=699  align=RIGHT valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<NOBR>Committment Number: #Read_Committment_Doc.Committment_Number#</NOBR>
					</td>
				</tr>
</CFOUTPUT>
				<TR>
					<TD width=699  align=left valign=top  bgcolor=white>
						<p>
						<br><FONT SIZE=3 color=black face=arial>
						The following are the requirements to be complied with:
					</td>
				</tr>
			</table>					
		<p>
<!--- ========================================================================== --->
				<CFQUERY datasource="#request.dsn#" NAME="Read_temp_comp_b1">		
					SELECT *
					FROM Title_Committment_Clauses_Selected_Title
					WHERE Title_ID = #rec_ID# AND a_section_code = 'B1' AND Committment_Item_Order = 1
				</CFQUERY>

		<CFSET a_section_code_for_this_section = "B1">
		
<CFOUTPUT QUERY="Read_temp_comp_b1">	
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699  align=left valign=top  bgcolor=white>
			<table width=698 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=14 align=center valign=top  bgcolor=white>
						<a href="./title_committment_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&committment_id=#committment_id#&a_section_code=#a_section_code_for_this_section#" target="Title_committment_modify" onClick="window.open('','Title_committment_modify','width=440,height=450,left=10,top=10,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img src="./images/button_m.gif" border=0 ALT="[*] MODIFY  this   Clause"></a></TD>
					<TD width=15 align=right valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<NOBR>( 1. ) </NOBR>
					</td>
					<TD width=670 align=left valign=top  bgcolor=white>					
						<FONT SIZE=2 color=black face=arial>
						#Read_temp_comp_b1.Committment_Item#			
					</td>
				</tr>
			</table>
			
				</td>
			</tr>
</CFOUTPUT>	
		</table>
		<p>
		<table width=699 cellpadding=1 cellspacing=1 border=0>


				<CFQUERY datasource="#request.dsn#" NAME="Read_temp_comp_b11">		
					SELECT *
					FROM Title_Committment_Clauses_Selected_Title
					WHERE Title_ID = #rec_ID# AND a_section_code = 'B11' 
					ORDER BY Committment_Item_Order ASC
				</CFQUERY>
		
		<CFSET cc_count =  1>
		<CFSET a_section_code_for_this_section = "B11">
		
				<TR>
					<TD width=699  align=left valign=top  bgcolor=white>	
			<table width=698 cellpadding=1 cellspacing=1 border=0>
<CFOUTPUT QUERY="Read_temp_comp_b11">
				<TR>
					<TD width=20 align=left valign=top  bgcolor=white>
						<img src="./images/clear.gif" height=14 width=20></a></TD>
					<TD width=14 align=center valign=top  bgcolor=white>
						<a href="./title_committment_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&committment_id=#committment_id#&a_section_code=#a_section_code_for_this_section#" target="Title_committment_modify" onClick="window.open('','Title_committment_modify','width=440,height=450,left=10,top=10,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img src="./images/button_m.gif" border=0 ALT="[*] MODIFY  this   Clause"></a></TD>
					<TD width=14 align=center valign=top  bgcolor=white>
						<a href="./title_committment_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&committment_id=#committment_id#&a_section_code=#a_section_code_for_this_section#" target="Title_committment_delete" onClick="window.open('','Title_committment_delete','width=440,height=450,left=10,top=10,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img src="./images/button_d.gif" border=0 ALT="[*] DELETE  this   Clause"></a></TD>
					<TD width=15 align=right valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<NOBR>( #a_list_of_all_Letters[cc_count]#. ) </NOBR>
					</td>
					<TD width=635 align=left valign=top  bgcolor=white>					
						<FONT SIZE=2 color=black face=arial>
						#Committment_Item#			
					</td>
				</tr>
				
		<CFSET cc_count = #cc_count# + 1>
				
</CFOUTPUT>

<CFOUTPUT>				
				<TR>
					<TD width=48 colspan=3 align=left valign=top  bgcolor=white>
						<img src="./images/clear.gif" height=14 width=48></a></TD>
					<TD width=650 colspan=2  align=left valign=top  bgcolor=white>
						<a href="./title_committment_select_add_popup.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&a_section_code=B11" target="Title_committment" onClick="window.open('','Title_committment','width=605,height=500,left=10,top=10,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img src="./images/button_add_a_clause.gif" border=0 ALT="[*] ADD a new Clause"></a>
					</td>
				</tr>
			</table>
					</td>
				</tr>
			</table>
</CFOUTPUT>


		<!--- =========================================================== --->
		<!--- =========================================================== --->		
		<!--- =========================================================== --->
		
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699  align=left valign=top  bgcolor=white>
						<CFSET a_section_code_for_this_section = "B1">
						<CFINCLUDE TEMPLATE="./TC_ClauseDisplay_CH_All.cfm">
					</td>
				</tr>
			</table>
		<p>
<CFOUTPUT>
		<!--- =========================================================== --->
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699  align=left valign=top  bgcolor=white>
						<a href="./title_committment_select_add_popup.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&a_section_code=B1" target="Title_committment" onClick="window.open('','Title_committment','width=605,height=500,left=10,top=10,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img src="./images/button_add_a_clause.gif" border=0 ALT="[*] ADD a new Clause"></a>
					</td>
				</tr>	
			</table>
			<p>
		<!--- =========================================================== --->

			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
			<TR>
				<TD bgcolor=black width=699 align=right valign=top>			
					<img src="./images/clear.gif" height=60 width=690>
				</td>
			</tr>
		<!--- ===/ Create a tall blank space before next Section is displayed \=== --->
			</table>			
<p>				
		
<!--- ==============[ END OF SCHEDULE B - SECTION 1   ]===================== --->
<!--- ==============[ Requirements                    ]===================== --->
<!--- ==============[ B1                              ]===================== --->
<!--- ====================================================================== --->				
				
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
				

<!--- ====================================================================== --->
<!--- =============[ BEGIN OF SCHEDULE B SECTION 2 Exceptions ]============= --->
<!--- =============[ B2                                       ]============= --->
<!--- ====================================================================== --->

			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699  align=center valign=top  bgcolor=white>
						<img src="./images/Logo-Chicago-Sched-B-Sect-2-Except.gif">
					</td>
				</tr>
				<TR>
					<TD width=699  align=center valign=top  bgcolor=white>
						<FONT SIZE=3 color=black face=arial>
						COMMITTMENT FOR TITLE INSURANCE
					</td>
				</tr>

				<TR>
					<TD width=699  align=RIGHT valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<NOBR>Committment Number: #Read_Committment_Doc.Committment_Number#</NOBR>
					</td>
				</tr>
</CFOUTPUT>
				<TR>
					<TD width=699  align=left valign=top  bgcolor=white>
						<p>
						<br><FONT SIZE=3 color=black face=arial>
						Schedule B of the policy or policies to be issued will contain exceptions to the following matters unless the same are disposed of to the satisfaction of the Company.
					</td>
				</tr>
			</table>					
		<p>
		<!--- =========================================================== --->
		<!--- =========================================================== --->		
		<!--- =========================================================== --->
		
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699  align=left valign=top  bgcolor=white>
						<CFSET a_section_code_for_this_section = "B2">
						<CFINCLUDE TEMPLATE="./TC_ClauseDisplay_CH_All.cfm">
					</td>
				</tr>
			</table>
			<p>
<!--- ========================================================================== --->
				<CFQUERY datasource="#request.dsn#" NAME="Read_temp_comp_b2">		
					SELECT *
					FROM Title_Committment_Clauses_Selected_Title
					WHERE Title_ID = #rec_ID# AND a_section_code = 'B2' AND Committment_Item_Order = 7
				</CFQUERY>

		<CFSET a_section_code_for_this_section = "B2">
		
<CFOUTPUT QUERY="Read_temp_comp_b2">	
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699  align=left valign=top  bgcolor=white>
			<table width=698 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=14 align=center valign=top  bgcolor=white>
						<a href="./title_committment_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&committment_id=#committment_id#&a_section_code=#a_section_code_for_this_section#" target="Title_committment_modify" onClick="window.open('','Title_committment_modify','width=440,height=450,left=10,top=10,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img src="./images/button_m.gif" border=0 ALT="[*] MODIFY  this   Clause"></a></TD>
					<TD width=15 align=right valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<NOBR>( 7. ) </NOBR>
					</td>
					<TD width=670 align=left valign=top  bgcolor=white>					
						<FONT SIZE=2 color=black face=arial>
						#Read_temp_comp_b2.Committment_Item#			
					</td>
				</tr>
			</table>
			
				</td>
			</tr>
</CFOUTPUT>	
		</table>
		<p>
		<table width=699 cellpadding=1 cellspacing=1 border=0>


				<CFQUERY datasource="#request.dsn#" NAME="Read_temp_comp_b22">		
					SELECT *
					FROM Title_Committment_Clauses_Selected_Title
					WHERE Title_ID = #rec_ID# AND a_section_code = 'B22' 
					ORDER BY Committment_Item_Order ASC
				</CFQUERY>
		
		<CFSET cc_count =  1>
		<CFSET a_section_code_for_this_section = "B22">
		
				<TR>
					<TD width=699  align=left valign=top  bgcolor=white>	
			<table width=698 cellpadding=1 cellspacing=1 border=0>
<CFOUTPUT QUERY="Read_temp_comp_b22">
				<TR>
					<TD width=20 align=left valign=top  bgcolor=white>
						<img src="./images/clear.gif" height=14 width=20></a></TD>
					<TD width=14 align=center valign=top  bgcolor=white>
						<a href="./title_committment_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&committment_id=#committment_id#&a_section_code=#a_section_code_for_this_section#" target="Title_committment_modify" onClick="window.open('','Title_committment_modify','width=440,height=450,left=10,top=10,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img src="./images/button_m.gif" border=0 ALT="[*] MODIFY  this   Clause"></a></TD>
					<TD width=14 align=center valign=top  bgcolor=white>
						<a href="./title_committment_delete.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&committment_id=#committment_id#&a_section_code=#a_section_code_for_this_section#" target="Title_committment_delete" onClick="window.open('','Title_committment_delete','width=440,height=450,left=10,top=10,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img src="./images/button_d.gif" border=0 ALT="[*] DELETE  this   Clause"></a></TD>
					<TD width=15 align=right valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<NOBR>( #a_list_of_all_Letters[cc_count]#. ) </NOBR>
					</td>
					<TD width=635 align=left valign=top  bgcolor=white>					
						<FONT SIZE=2 color=black face=arial>
						#Committment_Item#			
					</td>
				</tr>
				
		<CFSET cc_count = #cc_count# + 1>
				
</CFOUTPUT>
			</table>
			<p>
			
				<CFQUERY datasource="#request.dsn#" NAME="Read_temp_comp_b23">		
					SELECT *
					FROM Title_Committment_Clauses_Selected_Title
					WHERE Title_ID = #rec_ID# AND a_section_code = 'B23' 
					ORDER BY Committment_Item_Order ASC
				</CFQUERY>
		
		<CFSET cc_count =  1>
		<CFSET a_section_code_for_this_section = "B23">

<CFOUTPUT QUERY="Read_temp_comp_b23">	
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699  align=left valign=top  bgcolor=white>
			<table width=698 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=14 align=center valign=top  bgcolor=white>
						<a href="./title_committment_modify.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&committment_id=#committment_id#&a_section_code=#a_section_code_for_this_section#" target="Title_committment_modify" onClick="window.open('','Title_committment_modify','width=440,height=450,left=10,top=10,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img src="./images/button_m.gif" border=0 ALT="[*] MODIFY  this   Clause"></a></TD>
					<TD width=15 align=right valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						&nbsp;
					</td>
					<TD width=670 align=left valign=top  bgcolor=white>					
						<FONT SIZE=2 color=black face=arial>
						#Read_temp_comp_b23.Committment_Item#			
					</td>
				</tr>
			</table>
			
				</td>
			</tr>
		</table>
</CFOUTPUT>	
		<p>




			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
			<TR>
				<TD bgcolor=black width=699 align=right valign=top>			
					<img src="./images/clear.gif" height=60 width=690>
					</td>
				</tr>
		<!--- ===/ Create a tall blank space before next Section is displayed \=== --->
			</table>			
<!--- =============[ END OF SCHEDULE B SECTION 2 Exceptions   ]============= --->
<!--- =============[ B2                                       ]============= --->
<!--- ====================================================================== --->				