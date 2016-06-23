
<CFPARAM NAME="a_direction" DEFAULT="">
<CFPARAM NAME="Insurance_Company" DEFAULT="">

<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="Plant_no_1" DEFAULT="">
<CFPARAM NAME="Agent_Branch_1" DEFAULT="">
<CFPARAM NAME="ReInsurance_No_1" DEFAULT="">
<CFPARAM NAME="Policy_To_Issue_Lender_1" DEFAULT="">
<CFPARAM NAME="Policy_To_Issue_Buyer_1" DEFAULT="">
<CFPARAM NAME="inst_day" DEFAULT="">
<CFPARAM NAME="inst_mon" DEFAULT="">
<CFPARAM NAME="inst_year" DEFAULT="">
<CFPARAM NAME="select1" DEFAULT="">
<CFPARAM NAME="Buyer_Owner" DEFAULT="">
<CFPARAM NAME="a_comments" DEFAULT="">
<CFPARAM NAME="tax_info" DEFAULT="">
<CFPARAM NAME="a_comments2" DEFAULT="">
<CFPARAM NAME="a_comments3" DEFAULT="">
<CFPARAM NAME="a_comments4" DEFAULT="">
<CFPARAM NAME="a_comments5" DEFAULT="">
<CFPARAM NAME="a_comments6" DEFAULT="">
<CFPARAM NAME="a_comments7" DEFAULT="">
<CFPARAM NAME="a_comments8" DEFAULT="">
<CFPARAM NAME="a_comments9" DEFAULT="">
<CFPARAM NAME="a_comments10" DEFAULT="">
<CFPARAM NAME="a_comments11" DEFAULT="">
<CFPARAM NAME="a_comments12" DEFAULT="">
<CFPARAM NAME="a_comments13" DEFAULT="">
<CFPARAM NAME="a_comments14" DEFAULT="">
<CFPARAM NAME="a_comments15" DEFAULT="">
<CFPARAM NAME="a_comments16" DEFAULT="">
<CFPARAM NAME="a_comments17" DEFAULT="">
<CFPARAM NAME="a_comments18" DEFAULT="">
<CFPARAM NAME="a_comments19" DEFAULT="">
<CFPARAM NAME="a_comments20" DEFAULT="">
<CFPARAM NAME="a_comments21" DEFAULT="">


<CFQUERY datasource="#request.dsn#" NAME="read_Title">
		
			SELECT *
			FROM Title
			WHERE Title_ID = #rec_ID#
		
		</CFQUERY>
<CFSET a_proposed_insured_1 = #read_Title.bfirstname1# & " " & #read_Title.bminame1# & " " & #read_Title.blastname1# >
			<CFSET a_proposed_insured_2 = #read_Title.bfirstname2# & " " & #read_Title.bminame2# & " " & #read_Title.blastname2# >
			
			
			<CFSET Buyer_1 = #read_Title.bfirstname1# & " " & #read_Title.bminame1# & " " & #read_Title.blastname1#>
			
			<CFSET Buyer_2 = #read_Title.bfirstname2# & " " & #read_Title.bminame2# & " " & #read_Title.blastname2#>
			
			<CFSET Seller_1 = #read_Title.sfirstname1# & " " & #read_Title.sminame1# & " " & #read_Title.slastname1#>
			
			<CFSET Seller_2 = #read_Title.sfirstname2# & " " & #read_Title.sminame2# & " " & #read_Title.slastname2#>		


		<CFQUERY datasource="#request.dsn#" NAME="read_ins_committments">		
			SELECT *
			FROM Doc_Title_Insurance_Title
			WHERE Title_ID = #rec_ID#		
		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_Title_FT_Agency_company">
		
			SELECT *
			FROM Title_FT_Agencies
			WHERE Title_FT_Agency_ID = #read_ins_committments.FT_Agency#
			
		</CFQUERY>	

		<CFQUERY datasource="#request.dsn#" NAME="read_Insurance_company">		
			SELECT *
			FROM Title_Companies
			WHERE Title_Co_ID = #read_ins_committments.Insurance_Co#			
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="Read_Committment_Doc">		
			SELECT *
			FROM Doc_Amer_Pioneer_Ins_ALL_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY> 
<CFOUTPUT>
		<TR>
			<TD width=700 align=left valign=top bgcolor=white>
		<!--- =================================================================== --->			
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
				<TR>
					<TD width=699 align=center valign=top>
			<table width=698 cellpadding=1 cellspacing=1 border=0 bgcolor=black>
				<TR>
					<TD width=699 align=center valign=top>
			<table width=698 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699 align=center valign=top>
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699 colspan=2 align=center valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<B>Schedule A </B>
					</td>
				</tr>

				<TR>
					<TD width=345  align=left valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
		<!--- ===/ This is the Title_ID from the Title Table \=== --->
						<NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR>
					</td>
					<TD width=345  align=right valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<NOBR>Committment Number: <CFINPUT type=text name="Committment_Number"  size=30 maxlength=125
							VALUE=""
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
						$<B> #NumberFormat(read_title.Purchase_Price, "999,999,999.00")#</B>
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
						<CFSET a_section_code_for_this_section = "A2">
						<CFINCLUDE TEMPLATE="./TC_ClauseDisplay_ST_All.cfm">
					</td>
				</tr>
			</table>
		<!--- =========================================================== --->		
			<p>
		<table width=699 cellpadding=0 cellspacing=0 border=0 bgcolor=white>
			<TR>
				<TD bgcolor=white width=293 align=center valign=top>			
					<img src="./images/clear.gif" height=1 width=293>
				</td>
				<TD bgcolor=white width=50 align=center valign=top>			
					<img src="./images/clear.gif" height=1 width=50>
				</td>
				<TD bgcolor=white width=352 align=left valign=top>			
					<FONT SIZE=1 color=black face=arial>
					Issued through the office of:<br>
				</td>
			</tr>
<CFOUTPUT>
			<TR>
				<TD bgcolor=white width=293 align=center valign=top>			
					<FONT SIZE=2 color=gray face=arial>
					
				</td>
				<TD bgcolor=white width=50 align=center valign=top>			
					<img src="./images/clear.gif" height=1 width=50>
				</td>
				<TD bgcolor=white width=352 align=left valign=top>
					<FONT SIZE=2 color=black face=verdana>
					<B>#read_Title_FT_Agency_company.Company#</B><br>
					#read_Title_FT_Agency_company.Addr1#<br>
		<CFIF #read_Title_FT_Agency_company.Addr2# GT "" OR #read_Title_FT_Agency_company.Addr2# GT " ">#read_Title_FT_Agency_company.Addr2#<br></CFIF>
		<NOBR>#read_Title_FT_Agency_company.city#, #read_Title_FT_Agency_company.state#&nbsp;&nbsp;&nbsp;#read_Title_FT_Agency_company.zip_code#</NOBR><br>
		Phone - #read_Title_FT_Agency_company.phone#<br><CFIF #read_Title_FT_Agency_company.fax# GT "" OR #read_Title_FT_Agency_company.fax# GT " ">
		Fax - #read_Title_FT_Agency_company.fax#</CFIF>
				</td>
			</tr>

			<TR>
				<TD bgcolor=white width=293 align=center valign=top>			
					<img src="./images/sign4.gif">
				</td>
				<TD bgcolor=white width=50 align=center valign=top>			
					<img src="./images/clear.gif" height=1 width=50>
				</td>
				<TD bgcolor=white width=352 align=right valign=top>			
					<img src="./images/clear.gif" height=1 width=352>						
				</td>
			</tr>

			<TR>
				<TD bgcolor=white width=293 align=center valign=top>			
					<FONT SIZE=1 color=black face=verdana>
					Countersigned Authorized Signatory
				</td>
				<TD bgcolor=white width=50 align=center valign=top>			
					<img src="./images/clear.gif" height=1 width=50>
				</td>
				<TD bgcolor=white width=352 align=right valign=top>			
					<img src="./images/logo-Stewart-title.gif">					
				</td>
			</tr>

			<TR>
				<TD bgcolor=white colspan=3 width=699 align=right valign=top>			
					<img src="./images/clear.gif" height=10 width=690>
					</td>
				</tr>
		<!--- ===/ Create a tall blank space before Schedule B Section is displayed \=== --->
			</table>			
		</td>
	</tr>
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
<!--- ====================[ B1 and B2          ]============================ --->
<!--- ====================================================================== --->
			<table width=698 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699 align=center valign=top>

			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699 colspan=2 align=center valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<B>Schedule B </B>
					</td>
				</tr>
				<TR>
					<TD width=345  align=left valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
		<!--- ===/ This is the Title_ID from the Title Table \=== --->
						<NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR>
					</td>
					<TD width=345  align=right valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<NOBR>Committment Number: <B>#Read_Committment_Doc.Committment_Number#</B></NOBR>
					</td>
				</tr>
					<TD width=699 colspan=2 align=center valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<B>Part I </B>
					</td>
				</tr>

				</tr>
					<TD width=699 colspan=2 align=left valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						Showing matters which will be excepted in the Policy unless the same are disposed of to the satisfaction of the Company:
					</td>
				</tr>
			</table>					
		<p>
</CFOUTPUT>
		<!--- =========================================================== --->
		<!--- =========================================================== --->		
		<!--- =========================================================== --->
		
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699  align=left valign=top  bgcolor=white>
						<CFSET a_section_code_for_this_section = "B1">
						<CFINCLUDE TEMPLATE="./TC_ClauseDisplay_ST_All.cfm">
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
		<!--- =========================================================== --->
		<!--- =========================================================== --->
		<p>
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				</tr>
					<TD width=699 colspan=2 align=center valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<B>Part II </B>
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
						<CFSET a_section_code_for_this_section = "B2">
						<CFINCLUDE TEMPLATE="./TC_ClauseDisplay_ST_All.cfm">
					</td>
				</tr>
			</table>
		<p>
<CFOUTPUT>
		<!--- =========================================================== --->
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699  align=left valign=top  bgcolor=white>
						<a href="./title_committment_select_add_popup.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&a_section_code=B2" target="Title_committment" onClick="window.open('','Title_committment','width=605,height=500,left=10,top=10,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img src="./images/button_add_a_clause.gif" border=0 ALT="[*] ADD a new Clause"></a>
					</td>
				</tr>	
			</table>
			<p>
		<!--- =========================================================== --->
		<!--- =========================================================== --->

			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
			<TR>
				<TD bgcolor=white width=699 align=right valign=top>			
					<img src="./images/logo-Stewart-title.gif">
					<img src="./images/clear.gif" height=10 width=690>
					</td>
				</tr>
		<!--- ===/ Create a tall blank space before Schedule B2 Section is displayed \=== --->
			</table>			
<p>				
		</td>
	</tr>
</table>
<p>
<!--- ====================================================================== --->
<!--- =================[ END OF SCHEDULE B1 and B2 ]======================== --->
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
<!--- ====================[ BEGIN OF SCHEDULE C ]=========================== --->
<!--- ====================================================================== --->
			<table width=698 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699 align=center valign=top>
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699 colspan=2 align=center valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<B>Schedule C </B>
					</td>
				</tr>

				<TR>
					<TD width=345  align=left valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
		<!--- ===/ This is the Title_ID from the Title Table \=== --->
						<NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR>
					</td>
					<TD width=345  align=right valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<NOBR>Committment Number: <B>#Read_Committment_Doc.Committment_Number#</B></NOBR>
					</td>

				</tr>
					<TD width=699 colspan=2 align=left valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						The following requirements must be met and completed to the satisfaction of the Company before its policy of title insurance will be issued: 
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
						<CFSET a_section_code_for_this_section = "C1">
						<CFINCLUDE TEMPLATE="./TC_ClauseDisplay_ST_All.cfm">
					</td>
				</tr>
			</table>
		<p>
<CFOUTPUT>
		<!--- =========================================================== --->
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699  align=left valign=top  bgcolor=white>
						<a href="./title_committment_select_add_popup.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&a_section_code=C1" target="Title_committment" onClick="window.open('','Title_committment','width=605,height=500,left=10,top=10,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img src="./images/button_add_a_clause.gif" border=0 ALT="[*] ADD a new Clause"></a>
					</td>
				</tr>	
			</table>
			<p>
		<!--- =========================================================== --->

			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
			<TR>
				<TD bgcolor=white width=699 align=right valign=top>			
					<img src="./images/logo-Stewart-title.gif">
					<img src="./images/clear.gif" height=10 width=690>
					</td>
				</tr>
		<!--- ===/ Create a tall blank space before Schedule B2 Section is displayed \=== --->
			</table>			
		</td>
	</tr>
</table>
<p>				
		
<!--- ====================================================================== --->
<!--- =================[ END OF SCHEDULE C         ]======================== --->
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
<!--- ====================[ BEGIN OF EXHIBIT A  ]=========================== --->
<!--- ====================================================================== --->
			<table width=698 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699 align=center valign=top>
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699 colspan=2 align=center valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<B>Exhibit "A" <br>
						Legal Description</B>
					</td>
				</tr>

				<TR>
					<TD width=345  align=left valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
		<!--- ===/ This is the Title_ID from the Title Table \=== --->
						<NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR>
					</td>
					<TD width=345  align=right valign=top  bgcolor=white>
						<FONT SIZE=2 color=black face=arial>
						<NOBR>Committment Number: <B>#Read_Committment_Doc.Committment_Number#</B></NOBR>
					</td>
			</table>					
		<p>
		<!--- =========================================================== --->
		<!--- =========================================================== --->		
		<!--- =========================================================== --->
</CFOUTPUT>		
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699  align=left valign=top  bgcolor=white>
						<CFSET a_section_code_for_this_section = "EA">
						<CFINCLUDE TEMPLATE="./TC_ClauseDisplay_ST_All.cfm">
					</td>
				</tr>
			</table>
<CFOUTPUT>
		<!--- =========================================================== --->
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=699  align=left valign=top  bgcolor=white>
						<a href="./title_committment_select_add_popup.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&a_section_code=EA" target="Title_committment" onClick="window.open('','Title_committment','width=605,height=500,left=10,top=10,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')"><img src="./images/button_add_a_clause.gif" border=0 ALT="[*] ADD a new Clause"></a>
					</td>
				</tr>	
			</table>
			<p>
			<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
			<TR>
				<TD bgcolor=white width=699 align=right valign=top>			
					<img src="./images/logo-Stewart-title.gif">
					<img src="./images/clear.gif" height=10 width=690>
					</td>
				</tr>
		<!--- ===/ Create a tall blank space before Schedule B2 Section is displayed \=== --->
			</table>			
		</td>
	</tr>
</table>
<p>	
</CFOUTPUT>