
<!--- =================================== --->
<!--- ===/ Decide which table to use \=== --->
<!--- ===/ Property or Title         \=== --->


	<CFIF #URL.tbl_to_use# EQ "PROP">



		<CFQUERY datasource="#request.dsn#" NAME="read_data">
			SELECT *
			FROM hud_form_prop_pg1
			WHERE Prop_ID = #URL.tbl_id#
		</CFQUERY>

	<CFELSE>

		<CFQUERY datasource="#request.dsn#" NAME="read_data">
			SELECT *
			FROM hud_form_title_pg1
			WHERE Title_ID = #URL.tbl_id#
		</CFQUERY>

	</CFIF>

<!--- =================================== --->





<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE></TITLE>

</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" marginheight=0 marginwidth=0 topmargin=0 leftmargin=0>

<CENTER>
<table width=800 cellpadding=1 cellspacing=1 border=0>
	<tr>
		<td bgcolor=white width=400 align=left valign=top>
			<font size=1 color=black face=verdana>
				<B>A.</B> <font size=2 color=black face=times><b>Settlement Statement</b><br>
				<font size=1 color=black face=verdana>
				<B>B.</B> Type of Loan			
		</td>

		<td bgcolor=white width=400 align=right valign=top>
			<font size=1 color=black face=arial>
				<nobr>US Department of Housing&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</NOBR><br>
				<nobr>and Urban Development&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OMB No. 2502-0265</NOBR>
		</td>
	</tr>
</table>

<table width=800 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td bgcolor=white width=300 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>1. <img src="./images/checkbox1.gif"> FHA&nbsp;&nbsp;&nbsp;&nbsp;2. <img src="./images/checkbox1.gif"> FmHA&nbsp;&nbsp;&nbsp;&nbsp;3. <img src="./images/checkbox1.gif"> Conv. Unins.</NOBR><br>
				<nobr>4. <img src="./images/checkbox1.gif"> VA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5. <img src="./images/checkbox1.gif"> Conv. Ins. </NOBR>
				
		</td>

		<td bgcolor=white width=150 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>6. File Number</NOBR><br>
				<font size=1 color=red face=verdana><b>[ Dynamic Value ]</b>
				
		</td>

		<td bgcolor=white width=150 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>7. Loan Number</NOBR><br>				
		</td>
		
		<td bgcolor=white width=200 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>8. Mortgage Insurance Case Number </NOBR>
				
		</td>


	</tr>

<!--- ===/ NOTE \=== --->

	<tr>
		<td bgcolor=white colspan=4 width=800 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr><b>C.</b> Note: &nbsp;&nbsp;This form is furnished to give you a statement of the actual settlement costs.  Amounts paid by and to the settlement agent are shown. Items marked "(p.o.c)"</NOBR><br>
				<nobr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;were paid outside the closing; they are shown here for information purposes and are not included in the totals. WARNING: It is a crime to knowlingly make</NOBR><br>
				<nobr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;false statements to the United states on this or any other similar form. Penalties upon conviction can include a fine and imprisonment. For details see; Title</NOBR><br>
				<nobr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;18 U.S. Code Section 1001 and Section 1010.</NOBR><br>
				
		</td>
	</tr>

<!--- ===/ NAME OF BORROWER \=== --->

	<tr>
		<td bgcolor=white colspan=4 width=800 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr><b>D.</b> Name of Borrower:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=1 color=red face=verdana><b>[ First, Last, MI. ]</b></font></NOBR><br>
				<nobr>&nbsp;&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=1 color=red face=verdana><b>[ 460 Girard St ]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ Gaithersburg ]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ Maryland ]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 20877 ]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ Montgomery County ]</b></NOBR><br>
				
		</td>
	</tr>

<!--- ===/ NAME OF SELLER \=== --->

	<tr>
		<td bgcolor=white colspan=4 width=800 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr><b>E.</b> Name of Seller:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=1 color=red face=verdana><b>[ First, Last, MI. ]</b></font></NOBR><br>
				<nobr>&nbsp;&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=1 color=red face=verdana><b>[ 460 Girard St ]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ Gaithersburg ]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ Maryland ]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 20877 ]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ Montgomery County ]</b></NOBR><br>
				
		</td>
	</tr>

<!--- ===/ NAME OF LENDER \=== --->

	<tr>
		<td bgcolor=white colspan=4 width=800 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr><b>F.</b> Name of Lender:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=1 color=red face=verdana><b>[ First, Last, MI. ]</b></font></NOBR><br>
				<nobr>&nbsp;&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=1 color=red face=verdana><b>[ 460 Girard St ]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ Gaithersburg ]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ Maryland ]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 20877 ]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ Montgomery County ]</b></NOBR><br>
				
		</td>
	</tr>

<!--- ===/ PROPERTY ADDRESS \=== --->

	<tr>
		<td bgcolor=white colspan=4 width=800 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr><b>G.</b> Property Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=1 color=red face=verdana><b>[ 460 Girard St ]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ Gaithersburg ]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ Maryland ]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ 20877 ]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[ Montgomery County ]</b></NOBR><br>
				
		</td>
	</tr>

<!--- ===/ SETTLEMENT AGENT \=== --->

	<tr>
		<td bgcolor=white colspan=4 width=800 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr><b>H.</b> Settlement Agent:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=1 color=black face=verdana>&nbsp;&nbsp;&nbsp;<b>First Title and Escrow, Inc.</b></font></NOBR><br>
				<nobr><font size=1 color=black face=arial>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Place of Settlement:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=1 color=black face=verdana><b>51 Monroe St - Suite 1101 - Rockville MD 20850 - Montgomery County</b></NOBR><br>
				
		</td>
	</tr>

<!--- ===/ SETTLEMENT DATE \=== --->

	<tr>
		<td bgcolor=white colspan=4 width=800 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr><b>I.</b> Settlement Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=1 color=red face=verdana><b>[ June 12, 2001 ]</b></font></b></NOBR><br>
				
		</td>
	</tr>
	
</table>


<!--- ======================================== --->
<!--- ===/     SUMMARY OF TRANSACTIONS    \=== --->
<!--- ======================================== --->

<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=black>
	<tr>
		<td bgcolor=white width=395 align=center valign=top>
			<font size=1 color=black face=arial>
				<nobr><b>J.</b> SUMMARY OF BORROWERS TRANSACTIONS:</font></b></NOBR><br>
		<!--- ================================ --->
		<!--- ===/ BORROWERS TRANSACTIONS \=== --->
		<!--- ================================ --->				
				<table width=394 cellpadding=1 cellspacing=1 border=0 bgcolor=e3e3e3>
					<tr>
						<td width=394 colspan=2 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							100. GROSS AMOUNT DUE FROM BORROWER:
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							101. Contract Sales Price
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							102. Personal Property
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							103. Settlement charges to buyer (line 1400)
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							<b>825.00</b>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							104.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							105.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td width=394 colspan=2 bgcolor=white align=center>
							<font size=1 color=black face=arial>
							Adjustments for items paid by seller in advance
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							106. City / town taxes
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							107. County Taxes
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							108. Assessments
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							109.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							110.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>					
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							111.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>					
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							112.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>					

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							120. GROSS AMOUNT DUE FROM BORROWER
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							<b>825.00</b>
						</td>
					</tr>	

					<tr>
						<td width=394 colspan=2 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							200. AMOUNTS PAID BY OR ON BEHALF OF BORROWER:
						</td>
					</tr>					

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							201. Deposit or earnest money
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							202. Principal amount of new loan(s)
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							203. Existing loan(s) taken subject to
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							204. 
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>					

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							&nbsp; 
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>	

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							205. 
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>						
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>	

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							206. 
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>	

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							207. 
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>						

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							208. 
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>	

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							209. 
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>						

					<tr>
						<td width=394 colspan=2 bgcolor=white align=center>
							<font size=1 color=black face=arial>
							Adjustments for items unpaid by seller
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							210. City / town taxes
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							211. County Taxes
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							212. Assessments
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							213.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							214.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>					
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							215.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>					
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							216.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>					

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							217.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							218.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							219.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							220. TOTAL PAID BY/FOR BORROWER
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>	

					<tr>
						<td width=394 colspan=2 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							300. CASH AT SETTLEMENT FROM OR TO BORROWER:
						</td>
					</tr>					

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							301. Gross amount due from borrower (line 120)
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							<b>825.00</b>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							302. Less amounts paid by/for borrower (line 220)
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							303. CASH FROM BORROWER
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							<b>825.00</b>
						</td>
					</tr>
					
				</table>
		</td>


		<td bgcolor=white width=390 align=center valign=top>
			<font size=1 color=black face=arial>
				<nobr><b>K.</b> SUMMARY OF SELLERS TRANSACTIONS:</font></b></NOBR><br>
		<!--- ================================ --->
		<!--- ===/   SELLERS TRANSACTIONS \=== --->
		<!--- ================================ --->				
				<table width=394 cellpadding=1 cellspacing=1 border=0 bgcolor=e3e3e3>
					<tr>
						<td width=394 colspan=2 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							400. GROSS AMOUNT DUE TO SELLER:
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							401. Contract Sales Price
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							402. Personal Property
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							403.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							404.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>					

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							405.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>					
					
					<tr>
						<td width=394 colspan=2 bgcolor=white align=center>
							<font size=1 color=black face=arial>
							Adjustments for items paid by seller in advance
						</td>
					</tr>					

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							406. City / town taxes
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							407. County Taxes
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							408. Assessments
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							409.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							410.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>					
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							411.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>					
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							412.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>					

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							420. GROSS AMOUNT DUE TO SELLER
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>					

					<tr>
						<td width=394 colspan=2 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							500. REDUCTIONS IN AMOUNT DUE TO SELLER:
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							501. Excess deposit (see instructions)
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							502. Settlement charges to seller (line 1400)
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							503. Existing loan(s) taken subject to
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							504. Payoff of First Mortgage Loan
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>					

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							&nbsp; 
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>	

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							505. Payoff of Second Mortgage Loan
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>						
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>	

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							506. 
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>	

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							507. 
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>						

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							508. 
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>	

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							509. 
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>



















					<tr>
						<td width=394 colspan=2 bgcolor=white align=center>
							<font size=1 color=black face=arial>
							Adjustments for items unpaid by seller
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							510. City / town taxes
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							511. County Taxes
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							512. Assessments
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							513.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							514.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>					
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							515.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>					
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							516.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>					

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							517.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							518.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							519.
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							520. TOTAL REDUCTION AMOUNT DUE SELLER
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>
					</tr>	

					<tr>
						<td width=394 colspan=2 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							600. CASH AT SETTLEMENT TO OR FROM SELLER:
						</td>
					</tr>					

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							601. Gross amount due to seller (line 420)
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							302. Less reduction amount due seller (line 520)
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							303. CASH TO SELLER
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=black face=verdana>
							&nbsp;
						</td>
					</tr>



				</table>
		</td>
	</tr>
</table>
				
<!--- ============================== --->
<!--- ===/       NOTICES        \=== --->
<!--- ============================== --->

<p>

<table width=800 cellpadding=1 cellspacing=1 border=0>
	<tr>
		<td bgcolor=white width=800 align=left valign=top>
			<font size=1 color=black face=verdana>
			<p>
				<NOBR>SUBSTITUE FROM 1099 SELLER STATEMENT: The information contained herein is important tax information and is being furnished to the </NOBR><br>
				<NOBR>Internal Revenue Service.  If you are required to file a return, a negligence penalty or other sanction will be imposed on you if this item is </NOBR><br>
				<NOBR>required to be reported and the IRS determines that it has not been reported.  The contract sales price described on line 401 above </NOBR><br>
				<NOBR>constitutes the gross proceeds of this transaction.</NOBR><br> 				
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=800 align=left valign=top>
			<font size=1 color=black face=verdana>
			<p><br>
				<NOBR>SELLER INSTRUCTIONS: If this real estate was your principal residence, file form 2119 , Sale or Exchange of PRincipal Residence, for </NOBR><br>
				<NOBR>any gain, with your income tax return: for other transactions, complete the applicable parts of Form 4797, Form 6252 and/or </NOBR><br>
				<NOBR>Schedule D (Form 1040) </NOBR><br> 				
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=800 align=left valign=top>
			<font size=1 color=black face=verdana>
			<p><br>
				<NOBR>You are required by law to provide the settlement agent (Fed. Tax ID No:________________________) with your correct taxpayer</NOBR><br> 	
				<NOBR>identification number. If you do not provide your correct taxpayer identification number, you may be subject to civil</NOBR><br> 
				<NOBR>or criminal penalties imposed by law. Under penalties of purjury, I certify that the number shown on this statement is my correct </NOBR><br>
				<NOBR>taxpayer identification number.</NOBR><br>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=800 align=left valign=top>
			<font size=1 color=black face=verdana>
			<p><br>
				<NOBR>TIN:___________________________/______________________ Seller(s) Signature(s)_______________________________________________</NOBR><br>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=800 align=left valign=top>
			<font size=1 color=black face=verdana>
			<p><br>
				<NOBR>SELLER(S) NEW MAILING ADDRESS: ________________________________________________________________________________________</NOBR><br>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=800 align=left valign=top>
			<font size=1 color=black face=verdana>
			<p><br>
				<NOBR>SELLER(S)PHONE NUMBERS: _____________________________________(H) ______________________________________(W)</NOBR><br>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=800 align=left valign=top>
			<font size=1 color=black face=verdana>
			<p><br>
				<NOBR>_____________________________________________________________________________________________________________________________</NOBR><br>
				<nobr>First Title and Escrow, Inc. --  Printed <font size=1 color=red face=verdana><b> June 21, 2001 at 14:30</b></FONT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;REV. HUD-1 (3/86)</NOBR>
		</td>
	</tr>
	
	
</table>




</BODY>
</HTML>
