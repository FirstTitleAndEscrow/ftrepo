


		<CFQUERY datasource="#request.dsn#" NAME="read_data">
			SELECT *
			FROM hud_form_title_pg1
			WHERE Title_ID = #rec_id#
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_data2">
			SELECT *
			FROM hud_form_title_pg2
			WHERE Title_ID = #rec_id#
		</CFQUERY>
<!--- =================================== --->

<CFQUERY datasource="#request.dsn#" NAME="get_titleid">
			SELECT *
			FROM title
			WHERE Title_ID = #rec_id#
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_billing_states">
		SELECT *
		FROM  Company_Billing_states
		WHERE company_id = #get_titleid.comp_id# AND a_states = '#get_titleid.pstate#'

</CFQUERY>
<cfif #get_billing_states.recordcount# GT "0">
<CFQUERY datasource="#request.dsn#" NAME="get_line_costs">
		SELECT *
		FROM Company_Billing_Values
		WHERE company_id = #get_titleid.comp_id# AND billing_id = #get_billing_states.billing_id#
	</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_agency">
		SELECT title_ft_agency_name
		FROM  company_agency_assoc
		WHERE billing_id = '#get_billing_states.billing_id#'

</CFQUERY>

<cfelse>
<cfset #read_agency.TITLE_FT_AGENCY_NAME# = "No Agency assigned">
<cfset #get_line_costs.A_1111_TEXT# = "">
<cfset #get_line_costs.A_1112_TEXT# = "">
<cfset #get_line_costs.A_1113_TEXT# = "">
<cfset #get_line_costs.A_1205_TEXT# = "">
<cfset #get_line_costs.A_1303_TEXT# = "">
<cfset #get_line_costs.A_1304_TEXT# = "">
<cfset #get_line_costs.A_1305_TEXT# = "">
</cfif>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE></TITLE>

</HEAD>

<BODY BGCOLOR=white TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" marginheight=0 marginwidth=0 topmargin=0 leftmargin=0>





<CENTER>
<table width=800 cellpadding=1 cellspacing=1 border=0>
	<tr>
		<td bgcolor=white width=400 align=left valign=top>
			<font size=1 color=blue face=verdana>
				<B>A.</B> <font size=2 color=black face=times><b>Settlement Statement</b><br>
				<font size=1 color=blue face=verdana>
				<B>B.</B> Type of Loan
		</td>

		<td bgcolor=white width=400 align=right valign=top>
			<font size=1 color=black face=arial>
				<nobr>US Department of Housing&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</NOBR><br>
				<nobr>and Urban Development&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OMB No. 2502-0265</NOBR>
		</td>
	</tr>
</table>


<CFOUTPUT>

<table width=800 cellpadding=1 cellspacing=1 border=1 bgcolor=gray>
	<tr>
		<td bgcolor=white width=300 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>1. <CFIF #read_data.a_1# EQ "FHA"><img src="./images/checkbox_checked.gif"><CFELSE><img src="./images/checkbox1.gif"></CFIF> FHA&nbsp;&nbsp;&nbsp;&nbsp;2. <CFIF #read_data.a_1# EQ "FmHA"><img src="./images/checkbox_checked.gif"><CFELSE><img src="./images/checkbox1.gif"></CFIF>FmHA&nbsp;&nbsp;&nbsp;&nbsp;3. <CFIF #read_data.a_1# EQ "Conventional"><img src="./images/checkbox_checked.gif"><CFELSE><img src="./images/checkbox1.gif"></CFIF>Conv. Unins.</NOBR><br>
				<nobr>4. <CFIF #read_data.a_1# EQ "VA"><img src="./images/checkbox_checked.gif"><CFELSE><img src="./images/checkbox1.gif"></CFIF> VA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5. <CFIF #read_data.a_1# EQ "Conv. Ins."><img src="./images/checkbox_checked.gif"><CFELSE><img src="./images/checkbox1.gif"></CFIF> Conv. Ins. </NOBR>

		</td>

		<td bgcolor=white width=150 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>6. File Number</NOBR><br>
				<font size=1 color=blue face=verdana><b>#read_data.a_6#</b>

		</td>

		<td bgcolor=white width=150 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>7. Loan Number</NOBR><br>
				<font size=1 color=blue face=verdana><b>#read_data.a_7#</b>
		</td>

		<td bgcolor=white width=200 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>8. Mortgage Insurance Case Number </NOBR>
				<font size=1 color=blue face=verdana><b>#read_data.a_8#</b>
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
				<nobr><b>D.</b> Name of Borrower:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=1 color=blue face=verdana><b>#read_data.d_bname#</b></font></NOBR><br>
				<nobr>&nbsp;&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=1 color=blue face=verdana><b>#read_data.d_baddr#</b></NOBR><br>

		</td>
	</tr>

<!--- ===/ NAME OF SELLER \=== --->

	<tr>
		<td bgcolor=white colspan=4 width=800 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr><b>E.</b> Name of Seller:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=1 color=blue face=verdana><b>#read_data.e_sname#</b></font></NOBR><br>
				<nobr>&nbsp;&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=1 color=blue face=verdana><b>#read_data.e_saddr#</b></NOBR><br>

		</td>
	</tr>

<!--- ===/ NAME OF LENDER \=== --->

	<tr>
		<td bgcolor=white colspan=4 width=800 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr><b>F.</b> Name of Lender:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=1 color=blue face=verdana><b>#read_data.f_lname#</b></font></NOBR><br>
				<nobr>&nbsp;&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=1 color=blue face=verdana><b>#read_data.f_laddr#</b></NOBR><br>

		</td>
	</tr>

<!--- ===/ PROPERTY ADDRESS \=== --->

	<tr>
		<td bgcolor=white colspan=4 width=800 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr><b>G.</b> Property Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=1 color=blue face=verdana><b>#read_data.g_propaddr#</b></NOBR><br>

		</td>
	</tr>

<!--- ===/ SETTLEMENT AGENT \=== --->

	<tr>
		<td bgcolor=white colspan=4 width=800 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr><b>H.</b> Settlement Agent:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=1 color=blue face=verdana>&nbsp;&nbsp;&nbsp;<b>#read_agency.title_FT_Agency_name#</b></font></NOBR><br>
				<cfif NOT DateDiff("d", Now(), "1/30/2012")>
<nobr><font size=1 color=black face=arial>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Place of Settlement:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=1 color=blue face=verdana><b>30 W. Gude Dr. Rockville, MD. 20850 - Montgomery County</b></NOBR><br>
<cfelse>
<nobr><font size=1 color=black face=arial>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Place of Settlement:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=1 color=blue face=verdana><b>7361 Calhoun Place, Suite 200, Rockville, MD - Montgomery County</b></NOBR><br>
</cfif>


		</td>
	</tr>

<!--- ===/ SETTLEMENT DATE \=== --->

	<tr>
		<td bgcolor=white colspan=4 width=800 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr><b>I.</b> Settlement Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=1 color=blue face=verdana><b>#read_data.i_settlementDate#</b></font></b></NOBR><br>

		</td>
	</tr>

</table>


<!--- ======================================== --->
<!--- ===/     SUMMARY OF TRANSACTIONS    \=== --->
<!--- ======================================== --->

<table width=790 cellpadding=1 cellspacing=1 border=1 bgcolor=black>
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
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_101#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							102. Personal Property
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_102#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							103. Settlement charges to buyer (line 1400)
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_103#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							104. #read_data.a_104_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_104_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							105. <B>#read_data.a_105_a#</B>
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_105_b#</B>
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
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_106#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							107. County Taxes
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_107#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							108. Assessments
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_108#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							109. #read_data.a_109_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_109_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							110. #read_data.a_110_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_110_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							111. #read_data.a_111_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_111_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							112. #read_data.a_112_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_112_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							120. GROSS AMOUNT DUE FROM BORROWER
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_120#</B>
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
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_201#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							202. Principal amount of new loan(s)
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_202#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							203. Existing loan(s) taken subject to
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_203#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							204. #read_data.a_204_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_204_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							205. #read_data.a_205_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_205_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							206. #read_data.a_206_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_206_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							207. #read_data.a_207_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_207_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							208. #read_data.a_208_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_208_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							209. #read_data.a_209_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_209_b#</B>
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
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_210#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							211. County Taxes
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_211#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							212. Assessments
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_212#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							213. #read_data.a_213_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_213_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							214. #read_data.a_214_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_214_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							215. #read_data.a_215_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_215_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							216. #read_data.a_216_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_216_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							217. #read_data.a_217_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_217_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							218. #read_data.a_218_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_218_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							219. #read_data.a_219_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_219_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							220. TOTAL PAID BY/FOR BORROWER
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_220#</B>
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
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_301#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							302. Less amounts paid by/for borrower (line 220)
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_302#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							303. CASH FROM BORROWER
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_303#</B>
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
				<table width=394 cellpadding=1 cellspacing=1 border=1 bgcolor=e3e3e3>
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
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_401#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							402. Personal Property
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_402#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							403. #read_data.a_403_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_403_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							404. #read_data.a_404_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_404_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							405. #read_data.a_405_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_405_b#</B>
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
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_406#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							407. County Taxes
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_407#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							408. Assessments
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_408#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							409. #read_data.a_409_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_409_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							410. #read_data.a_410_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_410_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							411. #read_data.a_411_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_411_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							412. #read_data.a_412_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_412_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							420. GROSS AMOUNT DUE TO SELLER
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data2.a_1400_b#</B>
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
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_500#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							502. Settlement charges to seller (line 1400)
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data2.a_1400_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							503. Existing loan(s) taken subject to
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_503#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							504. Payoff of First Mortgage Loan
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_504#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							505. Payoff of Second Mortgage Loan
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_505#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							&nbsp;
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							&nbsp;
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							506.  #read_data.a_506_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_506_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							507. #read_data.a_507_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_507_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							508. #read_data.a_508_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_508_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							509. #read_data.a_509_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_509_b#</B>
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
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_510#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							511. County Taxes
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_511#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							512. Assessments
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_512#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							513. #read_data.a_513_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_513_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							514. #read_data.a_514_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_514_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							515. #read_data.a_515_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_515_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							516. #read_data.a_516_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_516_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							517. #read_data.a_517_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_517_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							518. #read_data.a_518_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_518_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							519. #read_data.a_519_a#
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_519_b#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							520. TOTAL REDUCTION AMOUNT DUE SELLER
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_520#</B>
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
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_601#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							602. Less reduction amount due seller (line 520)
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_602#</B>
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							603. CASH TO SELLER
						</td>

						<td  width=150 bgcolor=white align=right>
							<font size=1 color=blue face=verdana>
							<B>#read_data.a_603#</B>
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

<table width=800 cellpadding=1 cellspacing=1 border=1>
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
				<NOBR>You are required by law to provide the settlement agent (Fed. Tax ID No:<font size=1 color=blue face=verdana><B>#read_data.Fed_tax_id_no#</B></font> ) with your correct taxpayer</NOBR><br>
				<NOBR>identification number. If you do not provide your correct taxpayer identification number, you may be subject to civil</NOBR><br>
				<NOBR>or criminal penalties imposed by law. Under penalties of purjury, I certify that the number shown on this statement is my correct </NOBR><br>
				<NOBR>taxpayer identification number.</NOBR><br>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=800 align=left valign=top>
			<font size=1 color=black face=verdana>
			<p><br>
				<NOBR>TIN:<font size=1 color=blue face=verdana><B>#read_data.Fed_tax_id_no#</B> </font>Seller(s) Signature(s)_______________________________________________</NOBR><br>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=800 align=left valign=top>
			<font size=1 color=black face=verdana>
			<p><br>
				<NOBR>SELLER(S) NEW MAILING ADDRESS: <font size=1 color=blue face=verdana><B>#read_data.seller_new_addr#</B></font></NOBR><br>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=800 align=left valign=top>
			<font size=1 color=black face=verdana>
			<p><br>
				<NOBR>SELLER(S)PHONE NUMBERS:<font size=1 color=blue face=verdana><B>#read_data.seller_new_home_phone#</B></font>(H) <font size=1 color=blue face=verdana><B>#read_data.seller_new_work_phone#</B></font>(W)</NOBR><br>
		</td>
	</tr>



</table>


</CFOUTPUT>
<br><br><br><br><br><br><br>
<CFOUTPUT  query="read_data2">


<CENTER>
<table width=800 cellpadding=1 cellspacing=1 border=1>
	<tr>
		<td bgcolor=white width=800 align=left valign=top>
			<font size=1 color=black face=verdana>
				<NOBR>U.S. DEPARTMET OF HOUSING AND URBAN DEVELOPMENT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;File Number:<font size=1 color=blue face=verdana><b>#read_data2.title_id#</font></b></NOBR><br>
				<font size=2 color=black face=times><NOBR><b>Settlement Statement</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<font size=1 color=black face=verdana>Page 2</NOBR>
		</td>
	</tr>
</table>

<table width=800 cellpadding=1 cellspacing=1 border=1 bgcolor=gray>

<!--- ===/ NOTE \=== --->

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr><b>L.</b> SETTLEMENT CHARGES

			<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=e3e3e3>
				<tr>
					<td width=499 align=left valign=top bgcolor=white>
						<font size=1 color=black face=arial>
						<nobr>700. TOTAL SALES/BROKER'S COMMISSION based on price &nbsp;&nbsp;&nbsp;&nbsp;$ <font size=1 color=blue face=verdana><b>#read_data2.a_700_a#</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@&nbsp;&nbsp;&nbsp;<font size=1 color=blue face=verdana><b>#read_data2.a_700_b#</b> </font>= <font size=1 color=blue face=verdana><b>#read_data2.a_700_c#</b></NOBR>
					</td>
				</tr>

				<tr>
					<td width=499 align=left valign=top bgcolor=white>
						<font size=1 color=black face=arial>
						<nobr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Division of commission (line 700) as follows:</NOBR>
					</td>
				</tr>

				<tr>
					<td width=499 align=left valign=top bgcolor=white>
						<font size=1 color=black face=arial>
						<nobr>701. &nbsp;&nbsp;$<font size=1 color=blue face=verdana><b>#read_data2.a_701_a#</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>to <font size=1 color=blue face=verdana> <b>#read_data2.a_701_b#</b></NOBR>
					</td>
				</tr>

				<tr>
					<td width=499 align=left valign=top bgcolor=white>
						<font size=1 color=black face=arial>
						<nobr>702. &nbsp;&nbsp;$<font size=1 color=blue face=verdana> <b>#read_data2.a_702_a#</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>to <font size=1 color=blue face=verdana> <b>#read_data2.a_702_b#</b></NOBR>
					</td>
				</tr>


			</table>

		</td>


		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=black face=arial>
				PAID FROM<br>
				BORROWERS<br>
				FUNDS AT <br>
				SETTLEMENT
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=black face=arial>
				PAID FROM<br>
				SELLERS<br>
				FUNDS AT <br>
				SETTLEMENT
		</td>

	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;703. Commission paid at settlement</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_703_a#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_703_b#</b>

		</td>

	</tr>

	<tr>
		<td bgcolor=white colspan=3 width=800 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;800. ITEMS PAYABLE IN CONNECTION WITH LOAN
		</td>
	</tr>


	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;801. Loan Origination Fee&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%<font size=1 color=blue face=verdana>
			<b>#read_data2.a_801_a#</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_801_b#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_801_c#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;802. Loan Discount &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%<font size=1 color=blue face=verdana>
			<b>#read_data2.a_802_a#</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_802_b#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_802_c#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;803. Appraisal Fee</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_803_b#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_803_c#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;804. Credit Report</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_804_b#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_804_c#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;805. #read_data2.a_805_a#</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_805_b#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_805_c#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;806. #read_data2.a_806_a#</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_806_b#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_806_c#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;807. #read_data2.a_807_a#</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_807_b#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_807_c#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;808. #read_data2.a_808_a#</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_808_b#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_808_c#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;809. #read_data2.a_809_a#</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_809_b#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_809_b#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;810. #read_data2.a_810_a#</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_810_b#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_810_c#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;811. #read_data2.a_811_a#</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_811_b#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_811_c#</b>

		</td>
	</tr>


	<tr>
		<td bgcolor=white colspan=3 width=800 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;900. ITEMS REQUIRED BY LENDER TO BE PAID IN ADVANCE
		</td>
	</tr>


	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;901. Interest From&nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<b>#read_data2.a_901_a#</b></font>&nbsp;&nbsp;&nbsp;to &nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<b>#read_data2.a_901_b#</b></font>&nbsp;&nbsp; @ $ <font size=1 color=blue face=verdana>
			<b>#read_data2.a_901_c#</b> </font> &nbsp;&nbsp;/day</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_901_d#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_901_e#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;902. Mortgage Insurance Premium for&nbsp;&nbsp;<font size=1 color=blue face=verdana><b>#read_data2.a_902_a#</b> </font>&nbsp;&nbsp;&nbsp; to <font size=1 color=blue face=verdana>
			<b>#read_data2.a_902_b#</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_902_c#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_902_d#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;903. Hazard Insurance Premium for &nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<b>#read_data2.a_903_a#</b></font> &nbsp;&nbsp;&nbsp; to <font size=1 color=blue face=verdana>
			<b>#read_data2.a_903_b#</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_903_c#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_903_d#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;904. #read_data2.a_904_a#</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_904_b#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_904_c#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;905. Lender's Inspection Fee</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_905_a#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_905_b#</b>

		</td>
	</tr>



	<tr>
		<td bgcolor=white colspan=3 width=800 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1000. RESERVES DEPOSITED WITH LENDER FOR
		</td>
	</tr>


	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1001. Hazard Insurance&nbsp;&nbsp; <font size=1 color=blue face=verdana>
			<b>#read_data2.a_1001_a#</b></font>mo. @ $&nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<b>#read_data2.a_1001_b#</b></font>&nbsp;&nbsp;/mo</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_1001_c#</b></font>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_1001_d#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1002. Mortgage Insurance&nbsp;&nbsp; <font size=1 color=blue face=verdana>
			<b>#read_data2.a_1002_a#</b></font>mo. @ $&nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<b>#read_data2.a_1002_b#</b></font>&nbsp;&nbsp;/mo</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_1002_c#</b></font>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_1002_d#</b></font>

		</td>
	</tr>


	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1003. City Property Taxes&nbsp;&nbsp; <font size=1 color=blue face=verdana>
			<b>#read_data2.a_1003_a#</b></font>mo. @ $&nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<b>#read_data2.a_1003_b#</b></font>&nbsp;&nbsp;/mo</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_1003_c#</b></font>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_1003_d#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1004. County Property Taxes&nbsp;&nbsp; <font size=1 color=blue face=verdana>
			<b>#read_data2.a_1004_a#</b></font>mo. @ $&nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<b>#read_data2.a_1004_b#</b></font>&nbsp;&nbsp;/mo</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_1004_c#</b></font>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_1004_d#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1005. Annual Assessments&nbsp;&nbsp; <font size=1 color=blue face=verdana>
			<b>#read_data2.a_1005_a#</b></font>mo. @ $&nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<b>#read_data2.a_1005_b#</b></font>&nbsp;&nbsp;/mo</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_1005_c#</b></font>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_1005_d#</b></font>

		</td>
	</tr>



	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1006. Aggragate Analysis Adjustment</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_1006_a#</b></font>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_1006_b#</b></font>

		</td>
	</tr>


	<tr>
		<td bgcolor=white colspan=3 width=800 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1100. TITLE CHARGES
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1101. Settlement or closing fee&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to <font size=1 color=blue face=verdana><b>#read_agency.title_ft_agency_name#</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1101_a# neq "0">
			<b>#read_data2.a_1101_a#</b></font>
			</cfif>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1101_b# neq "0">
			<b>#read_data2.a_1101_b#</b></font>
			</cfif>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1102. Abstract or Title Search&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to <font size=1 color=blue face=verdana><b>Abstracts USA, LLC</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1102_a# neq "0">
			<b>#read_data2.a_1102_a#</b></font>
			</cfif>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1102_b# neq "0">
			<b>#read_data2.a_1102_b#</b></font>
				</cfif>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1103. Title Examination&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to <font size=1 color=blue face=verdana><b>#read_agency.title_ft_agency_name#</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1103_a# neq "0">
			<b>#read_data2.a_1103_a#</b></font>
		</cfif>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1103_b# neq "0">
			<b>#read_data2.a_1103_b#</b></font>
				</cfif>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1104. Title Insurance Binder&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to <font size=1 color=blue face=verdana><b>#read_agency.title_ft_agency_name#</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1104_a# neq "0">
			<b>#read_data2.a_1104_a#</b></font>
				</cfif>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1104_b# neq "0">
			<b>#read_data2.a_1104_b#</b></font>
				</cfif>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1105. Document Preparation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to <font size=1 color=blue face=verdana><b>#read_agency.title_ft_agency_name#</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1105_a# neq "0">
			<b>#read_data2.a_1105_a#</b></font>
			</cfif>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1105_b# neq "0">
			<b>#read_data2.a_1105_b#</b></font>
			</cfif>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1106. Notary Fees&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to <font size=1 color=blue face=verdana><b>#read_agency.title_ft_agency_name#</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1106_a# neq "0">
			<b>#read_data2.a_1106_a#</b></font>
			</cfif>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1106_b# neq "0">
			<b>#read_data2.a_1106_b#</b></font>
				</cfif>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1107. Attorney's Fees</NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1107_a# neq "0">
			<b>#read_data2.a_1107_a#</b></font>
				</cfif>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1107_b# neq "0">
			<b>#read_data2.a_1107_b#</b></font>
				</cfif>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(includes above items No.&nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<b>#read_data2.a_1107_c#</b></font>)</NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=black face=verdana>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=black face=arial>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1108. Title Insurance</NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1108_a# neq "0">
			<b>#read_data2.a_1108_a#</b></font>
					</cfif>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1108_b# neq "0">
			<b>#read_data2.a_1108_b#</b></font>
				</cfif>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(includes above items No.&nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<b>#read_data2.a_1108_c#</b></font>)</NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=black face=verdana>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=black face=arial>

		</td>
	</tr>



	<tr>
		<td bgcolor=white width=500 align=left valign=top>

			<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=e3e3e3>
				<tr>
					<td width=499 align=left valign=top bgcolor=white>
						<font size=1 color=black face=arial>
						<nobr>&nbsp;1109. Lender's Coverage $ <font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1109_a# neq "0">
			<b>#read_data2.a_1109_a#</b></cfif></font></NOBR>

					</td>
				</tr>

				<tr>
					<td width=499 align=left valign=top bgcolor=white>
						<font size=1 color=black face=arial>
						<nobr>&nbsp;1110. Owner's Coverage $ <font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1110_a# neq "0">
			<b>#read_data2.a_1110_a#</b></cfif></font></NOBR>

					</td>
				</tr>
			</table>

		</td>


		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=black face=arial>
				&nbsp;
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=black face=arial>
				&nbsp;
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1111.  <font size=1 color=blue face=verdana>

			        <cfif #get_titleid.pstate# eq "NV" or #get_titleid.pstate# eq "CA">
				Delivery
				<cfelse>

			#get_line_costs.a_1111_text# </cfif>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<b>#read_agency.title_ft_agency_name#</b>
		</font></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1111_a# neq "0">
			<b>#read_data2.a_1111_a#</b></font>
			</cfif>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1111_b# neq "0">
			<b>#read_data2.a_1111_b#</b></font>
				</cfif>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
			<nobr>&nbsp;1112.  <font size=1 color=blue face=verdana>
			#get_line_costs.a_1112_text#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<b>#read_agency.title_ft_agency_name#</b>
		</font></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1112_a# neq "0">
			<b>#read_data2.a_1112_a#</b></font>
			</cfif>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1112_b# neq "0">
			<b>#read_data2.a_1112_b#</b></font>
			</cfif>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
			<nobr>&nbsp;1113. <font size=1 color=blue face=verdana>
			#get_line_costs.a_1113_text#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<b>#read_agency.title_ft_agency_name#</b>
		</font></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1113_a# neq "0">
			<b>#read_data2.a_1113_a#</b></font>

				</cfif>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1113_b# neq "0">
			<b>#read_data2.a_1113_b#</b></font>
				</cfif>
		</td>
	</tr>

	<tr>
		<td bgcolor=white colspan=3 width=800 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1200. GOVERNMENT RECORDING AND TRANSFER CHARGES
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1201. Recording Fees Deed $ &nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1201_a# neq "0"><b>#read_data2.a_1201_a#</b></cfif></font>&nbsp;&nbsp; Mortgage $  &nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1201_b# neq "0"><b>#read_data2.a_1201_b#</b></cfif></font>&nbsp;&nbsp;&nbsp;: Release $ <font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1201_c# neq "0"><b>#read_data2.a_1201_c#</b></cfif></font></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1201_d# neq "0">
			<b>#read_data2.a_1201_d#</b></font>
		</cfif>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1201_e# neq "0">
			<b>#read_data2.a_1201_e#</b></font>
				</cfif>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1202. City/County tax/Stamps: &nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1202_a# neq "0"><b>#read_data2.a_1202_a#</b></cfif></font>&nbsp;&nbsp;Deed $ &nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1202_b# neq "0"><b>#read_data2.a_1202_b#</b></cfif></font>&nbsp;&nbsp;: Mortgage $ <font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1202_c# neq "0"><b>#read_data2.a_1202_c#</b></cfif></font> </NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1202_d# neq "0"><b>#read_data2.a_1202_d#</b></cfif></font>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1202_e# neq "0"><b>#read_data2.a_1202_e#</b></cfif></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1203. State tax/Stamps: &nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1203_a# neq "0"><b>#read_data2.a_1203_a#</b></cfif></font>&nbsp;&nbsp;Deed $ &nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1203_b# neq "0"><b>#read_data2.a_1203_b#</b></cfif></font>&nbsp;&nbsp;: Mortgage $ <font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1203_c# neq "0"><b>#read_data2.a_1203_c#</b></cfif></font></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1203_d# neq "0"><b>#read_data2.a_1203_d#</b></cfif></font>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1203_e# neq "0"><b>#read_data2.a_1203_e#</b></cfif></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1204.  <font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1204_a# neq "0"><b>#read_data2.a_1204_a#</b></cfif></font></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1204_b# neq "0"><b>#read_data2.a_1204_b#</b></cfif></font>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1204_c# neq "0"><b>#read_data2.a_1204_c#</b></cfif></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1205.  <font size=1 color=blue face=verdana>
			#get_line_costs.a_1205_text#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<b>#read_agency.title_ft_agency_name#</b>
		</font></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1205_a# neq "0"><b>#read_data2.a_1205_a#</b></cfif></font>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1205_b# neq "0"><b>#read_data2.a_1205_b#</b></cfif></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white colspan=3 width=800 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1300. ADDITIONAL SETTLEMENT CHARGES
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1301. Survey</NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1301_a# neq "0"><b>#read_data2.a_1301_a#</b></cfif></font>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1301_b# neq "0"><b>#read_data2.a_1301_b#</b></cfif></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1302. Pest Inspection</NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1302_a# neq "0"><b>#read_data2.a_1302_a#</b></cfif></font>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1302_b# neq "0"><b>#read_data2.a_1302_b#</b></cfif></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1303.  <font size=1 color=blue face=verdana>
			#get_line_costs.a_1303_text#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<b>#read_agency.title_ft_agency_name#</b></font></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1303_a# neq "0"><b>#read_data2.a_1303_a#</b></cfif></font>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1303_b# neq "0"><b>#read_data2.a_1303_b#</b></cfif></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1304.  <font size=1 color=blue face=verdana>
			#get_line_costs.a_1304_text#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<b>#read_agency.title_ft_agency_name#</b></font></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1304_a# neq "0"><b>#read_data2.a_1304_a#</b></cfif></font>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1304_b# neq "0"><b>#read_data2.a_1304_b#</b></cfif></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1305.  <font size=1 color=blue face=verdana>
			#get_line_costs.a_1305_text#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<b>#read_agency.title_ft_agency_name#</b></font></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1305_a# neq "0"><b>#read_data2.a_1305_a#</b></cfif></font>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1305_b# neq "0"><b>#read_data2.a_1305_b#</b></cfif></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1306.  <font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1306_a# neq "0">#read_data2.a_1306_a#</font></cfif></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<nobr><font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1306_b# neq "0"><b>#read_data2.a_1306_b#</b></cfif></font></nobr>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<nobr><font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1306_c# neq "0"><b>#read_data2.a_1306_c#</b></cfif></font></nobr>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<nobr><font size=1 color=black face=arial>
				&nbsp;1307.  <font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1307_a# neq "0">#read_data2.a_1307_a#</font></cfif></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<nobr><font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1307_b# neq "0"><b>#read_data2.a_1307_b#</b></font></cfif></NOBR>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<nobr><font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1307_c# neq "0"><b>#read_data2.a_1307_c#</b></font></cfif></NOBR>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<nobr><font size=1 color=black face=arial>
				&nbsp;1308.  <font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1308_a# neq "0"><b>#read_data2.a_1308_a#</font></cfif></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<nobr><font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1308_b# neq "0"><b>#read_data2.a_1308_b#</b></font></cfif></NOBR>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<nobr><font size=1 color=blue face=verdana>
			<cfif #read_data2.a_1308_c# neq "0"><b>#read_data2.a_1308_c#</b></font></cfif></NOBR>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1400. TOTAL SETTLEMENT CHARGES (enter on lines 103, Section J and 502 Section K)</NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_1400_a#</b></font>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data2.a_1400_b#</b></font>

		</td>
	</tr>
</table>



		</td>
	</tr>
</table>









<!--- ============================== --->
<!--- ===/       NOTICES        \=== --->
<!--- ============================== --->

<!--- <p> --->

<table width=800 cellpadding=1 cellspacing=1 border=1>
	<tr>
		<td bgcolor=white width=800 align=center valign=top>
			<font size=1 color=black face=verdana>
				<NOBR>HUD CERTIFICATION OF BUYER AND SELLER</NOBR>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=800 align=left valign=top>
			<font size=1 color=black face=verdana>
			<!--- <p><br> --->
				I have carefully reviewed the HUD-1 Settlement Statement and to the best of my knowledge and belief, it is a true and accurate statement of all reciepts and disbursements made on my account or by me in this transaction. I further certify that I have recieved a copy of the HUD-1 Settlement Statement. I agree to further adjustments in the event of any errors or omissions and indemnify and hold harmless Settlement Agent against any such error or omissions<br>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=800 align=left valign=top>
			<font size=1 color=black face=verdana>
			<!--- <p><br>
			<p><br> --->
				<NOBR>____________________________________________________________</NOBR><br>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=800 align=left valign=top>
			<font size=1 color=black face=verdana>
			<!--- <p><br>
			<p><br> --->
				<NOBR>____________________________________________________________</NOBR><br>
		</td>
	</tr>
</table>

<table width=800 cellpadding=1 cellspacing=1 border=1>
	<tr>
		<td bgcolor=white width=400 align=left valign=top>
			<font size=1 color=black face=verdana>
				WARNING: It is a crime to knowlingly make false statements to the United states on this or any other similar form. Penalties upon conviction can include a fine and imprisonment. For details see; Title 18 U.S. Code Section 1001 and Section 1010.
			</td>

		<td bgcolor=white width=400 align=left valign=top>
			<font size=1 color=black face=verdana>
				The HUD-1 Settlement Statement which I have perpared is a true and accurate account of this transaction. I have caused or will cause the funds to be dispersed in accordance with this statement.
				<p>
				By:_____________________________________ Date _________________

			</td>
	</tr>
</table>



<table width=800 cellpadding=1 cellspacing=1 border=1>
	<tr>
		<td bgcolor=white width=400 align=left valign=top>
			<font size=1 color=black face=verdana>
			<!--- <p><br> --->
				<NOBR>_____________________________________________________________________________________________________________________________</NOBR><br>
				<nobr>First Title and Escrow, Inc. --  Printed <font size=1 color=red face=verdana><b> June 21, 2001 at 14:30</b></FONT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;REV. HUD-1 (3/86)</NOBR>
		</td>
	</tr>


</table>

</CFOUTPUT>

<script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body>
</HTML>
