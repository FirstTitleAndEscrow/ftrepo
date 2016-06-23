
<CFOUTPUT QUERY="Read_Committment_Doc">
		<TR>
			<TD width=700 align=left valign=top bgcolor=white>
		<!--- =================================================================== --->			
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
				<TR>
					<TD width=699 align=center valign=top>
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=155 align=center valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=verdana>
						Plant No. <br><FONT SIZE=2 color=black face=arial>
						<B>#Plant_no#</B>
					</td>
					<TD width=404 align=center valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=verdana>
						Schedule A<br><FONT SIZE=2 color=black face=arial>
						<NOBR><b>#read_Title_FT_Agency_company.company#<br> #read_Title_FT_Agency_company.addr1# #read_Title_FT_Agency_company.addr2# #read_Title_FT_Agency_company.city#, #read_Title_FT_Agency_company.state# #read_Title_FT_Agency_company.zip_code#</b></NOBR>
					</td>
					<TD width=140 align=center valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=verdana>
						<NOBR>Agent / Branch No.</NOBR> <br><FONT SIZE=2 color=black face=arial>
						<B>#Agent_Branch#</B>
					</td>
				</tr>
			</table>

					</td>
				</tr>
			</table>

			</td>
		</tr>
				
		<TR>
			<TD width=700 align=left valign=top bgcolor=white>
				<p>
				
		<!--- =========================================================== --->
		
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
				<TR>
					<TD width=699 align=center valign=top>			
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=155 align=center valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=verdana>
						<NOBR>Re-Insurance No.</NOBR> <br><FONT SIZE=2 color=black face=arial>
						<B>#ReInsurance_No#</B>
					</td>
					<TD width=404 align=center valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=verdana>
						<NOBR>Effective Date and Time</NOBR><br><FONT SIZE=2 color=black face=arial>
						<NOBR><B>#Effective_Date# &nbsp;&nbsp; - &nbsp;&nbsp; #Effective_Time#</B></NOBR>
					</td>
					<TD width=140 align=center valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=verdana>
						State / County <br><FONT SIZE=2 color=black face=arial>
						<NOBR><b>#read_title.pstate# - #read_title.pcounty#</b></NOBR>
					</td>
				</tr>
			</table>
					</td>
				</tr>
			</table>

			</td>
		</tr>
				
		<TR>
			<TD width=700 align=left valign=top bgcolor=white>
				<p>
				
		<!--- =========================================================== --->
		
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
				<TR>
					<TD width=699 align=center valign=top>			
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699 colspan=3 align=left valign=top  bgcolor=white>
						<p>
						<br>
						<FONT SIZE=2 color=black face=verdana>
						<NOBR>&nbsp;&nbsp;( 1.) Policy or Policies to be issued: (Lender)</NOBR>
					</td>
				</tr>
				
				<TR>
					<TD width=699 colspan=3 align=left valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<NOBR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #Policy_To_Issue_Lender#</NOBR>
							<p>
					</td>
				</tr>

				<TR>
					<TD width=637 colspan=2 align=left valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=verdana>
						<NOBR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Proposed Insured: (Lender)</NOBR>
					</td>
					<TD width=125  align=center valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=verdana>
						<NOBR>Amount</NOBR>
					</td>
				</tr>

				<TR>
					<TD width=600  align=left valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<NOBR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#read_title.insured#, and the Veterans Administration, it's successors and/or </NOBR><br><NOBR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;assigns, as their interests may appear.</NOBR>
						<p>
					</td>
					<TD width=37  align=right valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=verdana>
						$
					</td>

					<TD width=125  align=center valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						#NumberFormat(read_title.loanamt_float, "999,999,999.00")#
					</td>
				</tr>
		<!--- ============================================================ --->			

				<TR>
					<TD width=699 colspan=3 align=left valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=verdana>
						<NOBR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Policy or Policies to be issued: (Owner)</NOBR>
					</td>
				</tr>
				
				<TR>
					<TD width=699 colspan=3 align=left valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<NOBR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #Policy_To_Issue_Buyer#</NOBR>
							<p>
					</td>
				</tr>

				<TR>
					<TD width=637 colspan=2 align=left valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=verdana>
						<NOBR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Proposed Insured: (Owner)</nobr>
					</td>
					<TD width=125  align=center valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=verdana>
						Amount
					</td>
				</tr>

				<TR>
					<TD width=600  align=left valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<NOBR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#Buyer_1#, #Buyer_2#</NOBR>
						<p>
					</td>
					<TD width=37  align=right valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=verdana>
						$
					</td>
					<TD width=125  align=center valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						#NumberFormat(read_title.Purchase_Price, "999,999,999.00")#
					</td>
				</tr>
				


			</table>
					</td>
				</tr>
			</table>


		<!--- =================================================================== --->	

			</td>
		</tr>

</CFOUTPUT>
		<TR>
			<TD width=700 align=left valign=top bgcolor=white>
				<p>

				<CFQUERY datasource="#request.dsn#" NAME="read_temp_comm_13">		
					SELECT *
					FROM Title_Committment_Clauses_Selected_Title
					WHERE Title_ID = #rec_ID# AND a_section_code = 'A2'
					ORDER BY Committment_Item_Order ASC
				</CFQUERY>
				
	<CFLOOP FROM="1" TO="#read_temp_comm_13.recordcount#" INDEX="ZZZ">
	
				<TR>
					<TD width=699  align=left valign=top  bgcolor=white>
						<CFSET a_section_code_for_this_section = "A2">
						<CFINCLUDE TEMPLATE="./TC_ClauseView_AP_All.cfm">
					</td>
				</tr>
	
	</CFLOOP>
<!--- =========================================================== --->

			</td>
		</tr>

		<TR>
			<TD width=700 align=left valign=top bgcolor=white>
			
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=14 align=center valign=top  bgcolor=white>
						<!--- === [ ]  SPACER    \=== --->
						<img src="./images/clear.gif" height=1 width=14>
					</TD>
<CFOUTPUT QUERY="Read_Committment_Doc">

					<TD width=10 align=right valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<NOBR>( 3.) </NOBR>
					</td>
					<TD width=670 align=left valign=top  bgcolor=white>					
						<FONT SIZE=2 color=black face=arial>The land is described as follows:
						<p>
					</td>
				</tr>

				<TR>
					<TD width=14 align=center valign=top  bgcolor=white>
						<!--- === [ ]  SPACER    \=== --->
						<img src="./images/clear.gif" height=1 width=14>
					</TD>
					<TD width=10 align=right valign=top  bgcolor=white>
						<img src="./images/clear.gif" height=1 width=10>
					</td>
					<TD width=670 align=left valign=top  bgcolor=white>					
						<FONT SIZE=2 color=black face=arial>#read_Title.plegaldesc#			
						<p>
					</td>
				</tr>
			</table>
			
		<!--- =================================================================== --->	

			</td>
		</tr>

		<TR>
			<TD width=700 align=left valign=top bgcolor=white>
				<p>
				
		<!--- =========================================================== --->
		
			<table width=699 cellpadding=0 cellspacing=0 border=0 bgcolor=white>
				<TR>
					<TD bgcolor=white width=296 align=center valign=top>			
						<img src="./images/clear.gif" height=1 width=293>
					</td>
					<TD bgcolor=white width=50 align=center valign=top>			
						<img src="./images/clear.gif" height=1 width=50>
					</td>
					<TD bgcolor=white width=352 align=left valign=top>			
						<FONT SIZE=2 color=black face=arial>
						Issued By:<br>
					</td>
				</tr>

				<TR>
					<TD bgcolor=white width=296 align=center valign=top>			
						<FONT SIZE=2 color=red face=arial>
						Title Ins Co goes here
					</td>
					<TD bgcolor=white width=50 align=center valign=top>			
						<img src="./images/clear.gif" height=1 width=50>
					</td>
					<TD bgcolor=white width=352 align=left valign=top>
						<FONT SIZE=2 color=red face=arial>
						This is the Title Agency Assigned by the Examiner						
					</td>
				</tr>


				<TR>
					<TD bgcolor=white width=296 align=center valign=top>			
						<img src="./images/line_black_293.gif">
					</td>
					<TD bgcolor=white width=50 align=center valign=top>			
						<img src="./images/clear.gif" height=1 width=50>
					</td>
					<TD bgcolor=white width=352 align=right valign=top>			
						<img src="./images/clear.gif" height=1 width=352>						
					</td>
				</tr>

				<TR>
					<TD bgcolor=white width=296 align=center valign=top>			
						<FONT SIZE=2 color=black face=arial>
						Countersigned Authorized Signatory
					</td>
					<TD bgcolor=white width=50 align=center valign=top>			
						<img src="./images/clear.gif" height=1 width=50>
					</td>
					<TD bgcolor=white width=352 align=right valign=top>			
						<img src="./images/clear.gif" height=1 width=352>						
					</td>
				</tr>

				<TR>
					<TD bgcolor=white colspan=3 width=699 align=left valign=top>			
						<FONT SIZE=2 color=black face=arial>
						<p>
						<br>
						NOTE: This committment consists of insert pages labeled as Schedule A, Schedule B, Section 1, and Schedule B Section 2.  This committment is of no force and effect unless all schedules are included, along with any Rider pages incorporated by reference in the insert page.
					</td>
				</tr>
			</table>			
		<!--- =================================================================== --->	
			</td>
		</tr>
	
		<!--- ===/ Create a tall blank space before Schedule B Section 1 is displayed \=== --->

		<TR>
			<TD width=700 align=left valign=top bgcolor=e1e1e1>
				<img src="./images/clear.gif" height=60 width=1>

			</td>
		</tr>				
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
<!--- ====================[ BEGIN OF SCHEDULE B ]=========================== --->
<!--- ====================[ SECTION 1           ]=========================== --->
<!--- ====================================================================== --->

		<TR>
			<TD width=700 align=left valign=top bgcolor=white>
		<!--- =================================================================== --->			
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
				<TR>
					<TD width=699 align=center valign=top>
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=140 align=center valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=verdana>
						Plant No. <br><FONT SIZE=2 color=black face=arial>
						<B>#Plant_no#</B>
					</td>
					<TD width=419 align=center valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=verdana>
						Schedule B - Section 1<br><FONT SIZE=2 color=black face=arial>
						<NOBR><b>#read_Title_FT_Agency_company.company#<br> #read_Title_FT_Agency_company.addr1# #read_Title_FT_Agency_company.addr2# #read_Title_FT_Agency_company.city#, #read_Title_FT_Agency_company.state# #read_Title_FT_Agency_company.zip_code#</b></NOBR>
					</td>
					<TD width=140 align=center valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=verdana>
						<NOBR>Agent / Branch No.</NOBR> <br><FONT SIZE=2 color=black face=arial>
						<B>#Agent_Branch#</B>
					</td>
				</tr>
			</table>

					</td>
				</tr>
			</table>

			</td>
		</tr>
</CFOUTPUT>					
		<TR>
			<TD width=700 align=left valign=top bgcolor=white>
				<p>
<cfif read_title.pstate eq 'IN'>
<table width="100%" >
        <tr align="center" valign="top"> 
          <td align="left" valign="top">By virtue of I.C. 27-7-3.6, a fee of $5.00 payable to the title insurance underwriter will be collected from the purchaser of the policy for each policy issued in conjunction with any closing occurring on or after July 1, 2006.  The fee should be designated in the 1100 or 1300 series of the HUD-1 or HUD-1A Settlement Statement as TIEFF (Title Insurance Enforcement Fund Fee) charge.</td>
		  </tr>
</table>
</cfif>
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699  align=left valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=verdana>
						The following are requirements to be complied with:
						<p>
					</td>
				</tr>

<!--- ========================================================================== --->
				<CFQUERY datasource="#request.dsn#" NAME="read_temp_comm_13">		
					SELECT *
					FROM Title_Committment_Clauses_Selected_Title
					WHERE Title_ID = #rec_ID# AND a_section_code LIKE 'B1%'
					ORDER BY Committment_Item_Order ASC
				</CFQUERY>
				
	<CFLOOP FROM="1" TO="#read_temp_comm_13.recordcount#" INDEX="ZZZ">
	
				<TR>
					<TD width=699  align=left valign=top  bgcolor=white>
						<CFSET a_section_code_for_this_section = "B1#ZZZ#">
						<CFINCLUDE TEMPLATE="./TC_ClauseView_AP_All.cfm">
					</td>
				</tr>
	
	</CFLOOP>
<!--- ========================================================================== --->


			</table>
					</td>
				</tr>

<!--- ===/ Create a tall blank space before Schedule B Section 2 is displayed \=== --->
		<TR>
			<TD width=700 align=left valign=top bgcolor=e1e1e1>
				<img src="./images/clear.gif" height=60 width=10>

			</td>
		</tr>				
<!--- ====================================================================== --->
<!--- =================[ END OF SCHEDULE B ]================================ --->
<!--- =================[ SECTION 1         ]================================ --->
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
<!--- ====================[ BEGIN OF SCHEDULE B ]=========================== --->
<!--- ====================[ SECTION 2           ]=========================== --->


<CFOUTPUT>
		<TR>
			<TD width=700 align=left valign=top bgcolor=white>
		<!--- =================================================================== --->			
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
				<TR>
					<TD width=699 align=center valign=top>
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=140 align=center valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=verdana>
						Plant No. <br><FONT SIZE=2 color=black face=arial>
						<B>#Read_Committment_Doc.Plant_no#</B>
					</td>
					<TD width=419 align=center valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=verdana>
						Schedule B - Section 2<br><FONT SIZE=2 color=black face=arial>
						<NOBR><b>#read_Title_FT_Agency_company.company#<br> #read_Title_FT_Agency_company.addr1# #read_Title_FT_Agency_company.addr2# #read_Title_FT_Agency_company.city#, #read_Title_FT_Agency_company.state# #read_Title_FT_Agency_company.zip_code#</b></NOBR>
					</td>
					<TD width=140 align=center valign=top bgcolor=white>
						<FONT SIZE=2 color=black face=verdana>
						<NOBR>Agent / Branch No.</NOBR> <br><FONT SIZE=2 color=black face=arial>
						<B>#Read_Committment_Doc.Agent_Branch#</B>
					</td>
				</tr>
			</table>
</CFOUTPUT>
					</td>
				</tr>
			</table>

			</td>
		</tr>
				
		<TR>
			<TD width=700 align=left valign=top bgcolor=white>
				<p>

			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699 colspan=2 align=left valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=verdana>
						<p>
						Exceptions
						<p>						
					</td>
				</tr>
				<TR>
					<TD width=699 colspan=2 align=left valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=verdana>
						Schedule B of the policy or policies to be issued will contain exceptions to the following matters unless the same are disposed of to the satisfaction of the company.
						<p>						
					</td>
				</tr>
<!--- ========================================================================== --->
				<CFQUERY datasource="#request.dsn#" NAME="read_temp_comm_13">		
					SELECT *
					FROM Title_Committment_Clauses_Selected_Title
					WHERE Title_ID = #rec_ID# AND a_section_code LIKE 'B2%'
					ORDER BY Committment_Item_Order ASC
				</CFQUERY>
				
	<CFLOOP FROM="1" TO="#read_temp_comm_13.recordcount#" INDEX="ZZZ">
	
				<TR>
					<TD width=699  align=left valign=top  bgcolor=white>
						<CFSET a_section_code_for_this_section = "B2#ZZZ#">
						<CFINCLUDE TEMPLATE="./TC_ClauseView_AP_All.cfm">
					</td>
				</tr>
	
	</CFLOOP>
<!--- ========================================================================== --->
			</table>
			
			</td>
		</tr>
	</table>			
			</TD>
		</TR>
	</table>

	
	
	
