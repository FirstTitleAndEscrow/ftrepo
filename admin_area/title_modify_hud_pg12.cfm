


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

	



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=790 align=center valign=top>
		
<table width=790 cellpadding=1 cellspacing=1 border=1 bgcolor=white>

	<tr>
			<td width=790 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Committment Report</B></CENTER>
			</TD>
		</TR>
	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>
		


		<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">


	
	
<CFFORM METHOD=POST ACTION="./title_modify_hud_pg1_submit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">
	
<CFOUTPUT query="read_data">




<CENTER>
<table width=790 cellpadding=1 cellspacing=1 border=0>
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


<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td bgcolor=white width=300 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>1. <CFIF #read_data.a_1# EQ "FHA"><input type=radio name=a_1 value="FHA" checked><CFELSE><input type=radio name=a_1 value="FHA"></CFIF> FHA&nbsp;&nbsp;&nbsp;&nbsp;2. <CFIF #read_data.a_1# EQ "FmHA"><input type=radio name=a_1 value="FmHA" checked><CFELSE><input type=radio name=a_1 value="FmHA"></CFIF>FmHA&nbsp;&nbsp;&nbsp;&nbsp;3. <CFIF #read_data.a_1# EQ "Conventional"><input type=radio name=a_1 value="Conventional" checked><CFELSE><input type=radio name=a_1 value="Conventional"></CFIF>Conv. Unins.</NOBR><br>
				<nobr>4. <CFIF #read_data.a_1# EQ "VA"><input type=radio name=a_1 value="VA" checked><CFELSE><input type=radio name=a_1 value="VA"></CFIF> VA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5. <CFIF #read_data.a_1# EQ "Conv. Ins."><input type=radio name=a_1 value="Conv Ins." checked><CFELSE><input type=radio name=a_1 value="Conv Ins."></CFIF> Conv. Ins. </NOBR>
				
		</td>

		<td bgcolor=white width=150 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>6. File Number</NOBR><br><center>
				<font size=3 color=blue face=verdana><b>#read_data.a_6#</b></center
				
		</td>

		<td bgcolor=white width=150 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>7. Loan Number</NOBR><br>	<center>
				<CFINPUT type="text" NAME="a_7" SIZE=19 MAXLENGTH=199 
					VALUE="#a_7#"
					style="font-size: 9; 
					font-family: verdana; 
					font-style: normal; 
					color: 003F1E; 
					background-color: E4E3E3; 
					border-color: white; 
					border-left-width: thin; 
					border-right-width: thin; 
					border-top-width: thin; 
					border-bottom-width: thin; 
					border-width: thin; 
					border-style: bar; 
					clear: none;" > </center>
		</td>
		
		<td bgcolor=white width=200 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>8. Mortgage Insurance Case Number </NOBR><br><center>
				<CFINPUT type="text" NAME="a_8" SIZE=19 MAXLENGTH=199 
					VALUE="#a_8#"
					style="font-size: 9; 
					font-family: verdana; 
					font-style: normal; 
					color: 003F1E; 
					background-color: E4E3E3; 
					border-color: white; 
					border-left-width: thin; 
					border-right-width: thin; 
					border-top-width: thin; 
					border-bottom-width: thin; 
					border-width: thin; 
					border-style: bar; 
					clear: none;" > </center>				
		</td>


	</tr>

<!--- ===/ NOTE \=== --->

	<tr>
		<td bgcolor=white colspan=4 width=790 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr><b>C.</b> Note: &nbsp;&nbsp;This form is furnished to give you a statement of the actual settlement costs.  Amounts paid by and to the settlement agent are shown. Items marked "(p.o.c)"</NOBR><br>
				<nobr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;were paid outside the closing; they are shown here for information purposes and are not included in the totals. WARNING: It is a crime to knowlingly make</NOBR><br>
				<nobr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;false statements to the United states on this or any other similar form. Penalties upon conviction can include a fine and imprisonment. For details see; Title</NOBR><br>
				<nobr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;18 U.S. Code Section 1001 and Section 1010.</NOBR><br>
				
		</td>
	</tr>

<!--- ===/ NAME OF BORROWER \=== --->

	<tr>
		<td bgcolor=white colspan=4 width=790 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr><b>D.</b> Name of Borrower:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;				
				<CFINPUT type="text" NAME="d_bname" SIZE=45 MAXLENGTH=199 
					VALUE="#d_bname#"
					style="font-size: 9; 
					font-family: verdana; 
					font-style: normal; 
					color: 003F1E; 
					background-color: E4E3E3; 
					border-color: white; 
					border-left-width: thin; 
					border-right-width: thin; 
					border-top-width: thin; 
					border-bottom-width: thin; 
					border-width: thin; 
					border-style: bar; 
					clear: none;" > </NOBR><br>
				<nobr>&nbsp;&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<CFINPUT type="text" NAME="d_baddr" SIZE=85 MAXLENGTH=199 
					VALUE="#d_baddr#"
					style="font-size: 9; 
					font-family: verdana; 
					font-style: normal; 
					color: 003F1E; 
					background-color: E4E3E3; 
					border-color: white; 
					border-left-width: thin; 
					border-right-width: thin; 
					border-top-width: thin; 
					border-bottom-width: thin; 
					border-width: thin; 
					border-style: bar; 
					clear: none;" ></NOBR>
				
		</td>
	</tr>

<!--- ===/ NAME OF SELLER \=== --->

	<tr>
		<td bgcolor=white colspan=4 width=790 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr><b>E.</b> Name of Seller:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<CFINPUT type="text" NAME="e_sname" SIZE=45 MAXLENGTH=199 
					VALUE="#e_sname#"
					style="font-size: 9; 
					font-family: verdana; 
					font-style: normal; 
					color: 003F1E; 
					background-color: E4E3E3; 
					border-color: white; 
					border-left-width: thin; 
					border-right-width: thin; 
					border-top-width: thin; 
					border-bottom-width: thin; 
					border-width: thin; 
					border-style: bar; 
					clear: none;" ></NOBR><br>
				<nobr>&nbsp;&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<CFINPUT type="text" NAME="e_saddr" SIZE=85 MAXLENGTH=199 
					VALUE="#e_saddr#"
					style="font-size: 9; 
					font-family: verdana; 
					font-style: normal; 
					color: 003F1E; 
					background-color: E4E3E3; 
					border-color: white; 
					border-left-width: thin; 
					border-right-width: thin; 
					border-top-width: thin; 
					border-bottom-width: thin; 
					border-width: thin; 
					border-style: bar; 
					clear: none;" >	</NOBR>				
		</td>
	</tr>

<!--- ===/ NAME OF LENDER \=== --->

	<tr>
		<td bgcolor=white colspan=4 width=790 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr><b>F.</b> Name of Lender:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<CFINPUT type="text" NAME="f_lname" SIZE=45 MAXLENGTH=199 
					VALUE="#f_lname#"
					style="font-size: 9; 
					font-family: verdana; 
					font-style: normal; 
					color: 003F1E; 
					background-color: E4E3E3; 
					border-color: white; 
					border-left-width: thin; 
					border-right-width: thin; 
					border-top-width: thin; 
					border-bottom-width: thin; 
					border-width: thin; 
					border-style: bar; 
					clear: none;" ></NOBR><br>
				<nobr>&nbsp;&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<CFINPUT type="text" NAME="f_laddr" SIZE=85 MAXLENGTH=199 
					VALUE="#f_laddr#"
					style="font-size: 9; 
					font-family: verdana; 
					font-style: normal; 
					color: 003F1E; 
					background-color: E4E3E3; 
					border-color: white; 
					border-left-width: thin; 
					border-right-width: thin; 
					border-top-width: thin; 
					border-bottom-width: thin; 
					border-width: thin; 
					border-style: bar; 
					clear: none;" ></NOBR>
				
		</td>
	</tr>

<!--- ===/ PROPERTY ADDRESS \=== --->

	<tr>
		<td bgcolor=white colspan=4 width=790 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr><b>G.</b> Property Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<CFINPUT type="text" NAME="g_propaddr" SIZE=85 MAXLENGTH=199 
					VALUE="#g_propaddr#"
					style="font-size: 9; 
					font-family: verdana; 
					font-style: normal; 
					color: 003F1E; 
					background-color: E4E3E3; 
					border-color: white; 
					border-left-width: thin; 
					border-right-width: thin; 
					border-top-width: thin; 
					border-bottom-width: thin; 
					border-width: thin; 
					border-style: bar; 
					clear: none;" >	</NOBR>				
		</td>
	</tr>

<!--- ===/ SETTLEMENT AGENT \=== --->

	<tr>
		<td bgcolor=white colspan=4 width=790 align=left valign=top>
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
		<td bgcolor=white colspan=4 width=790 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr><b>I.</b> Settlement Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<CFINPUT type="text" NAME="i_settlementDate" SIZE=25 MAXLENGTH=199 
					VALUE="#i_settlementDate#"
					style="font-size: 9; 
					font-family: verdana; 
					font-style: normal; 
					color: 003F1E; 
					background-color: E4E3E3; 
					border-color: white; 
					border-left-width: thin; 
					border-right-width: thin; 
					border-top-width: thin; 
					border-bottom-width: thin; 
					border-width: thin; 
					border-style: bar; 
					clear: none;" ></NOBR>				
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
							<CFINPUT type="text" NAME="a_101" SIZE=14 MAXLENGTH=199 
								VALUE="#a_101#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							102. Personal Property
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_102" SIZE=14 MAXLENGTH=199 
								VALUE="#a_102#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >

						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							103. Settlement charges to buyer (line 1400)
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_103" SIZE=14 MAXLENGTH=199 
								VALUE="#a_103#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >

						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>104. <CFINPUT type="text" NAME="a_104_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_104_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_104_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_104_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>105. <CFINPUT type="text" NAME="a_105_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_105_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_105_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_105_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
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
							<CFINPUT type="text" NAME="a_106" SIZE=14 MAXLENGTH=199 
								VALUE="#a_106#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							107. County Taxes
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_107" SIZE=14 MAXLENGTH=199 
								VALUE="#a_107#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							108. Assessments
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_108" SIZE=14 MAXLENGTH=199 
								VALUE="#a_108#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>109. <CFINPUT type="text" NAME="a_109_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_109_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_109_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_109_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>	
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>110. <CFINPUT type="text" NAME="a_110_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_110_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_110_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_110_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>						
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>111. <CFINPUT type="text" NAME="a_111_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_111_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_111_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_111_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>						
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>112. <CFINPUT type="text" NAME="a_112_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_112_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_112_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_112_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>					

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							120. GROSS AMOUNT DUE FROM BORROWER
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_120" SIZE=14 MAXLENGTH=199 
								VALUE="#a_120#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
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
							<CFINPUT type="text" NAME="a_201" SIZE=14 MAXLENGTH=199 
								VALUE="#a_201#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							202. Principal amount of new loan(s)
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_202" SIZE=14 MAXLENGTH=199 
								VALUE="#a_202#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							203. Existing loan(s) taken subject to
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_203" SIZE=14 MAXLENGTH=199 
								VALUE="#a_203#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>204. <CFINPUT type="text" NAME="a_204_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_204_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_204_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_204_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
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
							<NOBR>205. <CFINPUT type="text" NAME="a_205_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_205_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_205_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_205_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
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
							<NOBR>206. <CFINPUT type="text" NAME="a_206_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_206_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_206_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_206_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>	

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>207. <CFINPUT type="text" NAME="a_207_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_207_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_207_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_207_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>						

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>208. <CFINPUT type="text" NAME="a_208_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_208_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_208_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_208_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>	

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>209. <CFINPUT type="text" NAME="a_209_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_209_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_209_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_209_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
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
							<CFINPUT type="text" NAME="a_210" SIZE=14 MAXLENGTH=199 
								VALUE="#a_210#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							211. County Taxes
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_211" SIZE=14 MAXLENGTH=199 
								VALUE="#a_211#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							212. Assessments
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_212" SIZE=14 MAXLENGTH=199 
								VALUE="#a_212#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>213. <CFINPUT type="text" NAME="a_213_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_213_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_213_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_213_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>214. <CFINPUT type="text" NAME="a_214_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_214_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_214_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_214_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>					
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>215. <CFINPUT type="text" NAME="a_215_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_215_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_215_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_215_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>					
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>216. <CFINPUT type="text" NAME="a_216_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_216_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_216_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_216_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>					

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>217. <CFINPUT type="text" NAME="a_217_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_217_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_217_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_217_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>218. <CFINPUT type="text" NAME="a_218_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_218_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_218_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_218_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>219. <CFINPUT type="text" NAME="a_219_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_219_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_219_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_219_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							220. TOTAL PAID BY/FOR BORROWER
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_220" SIZE=14 MAXLENGTH=199 
								VALUE="#a_220#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
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
							<CFINPUT type="text" NAME="a_301" SIZE=14 MAXLENGTH=199 
								VALUE="#a_301#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							302. Less amounts paid by/for borrower (line 220)
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_302" SIZE=14 MAXLENGTH=199 
								VALUE="#a_302#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							303. CASH FROM BORROWER
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_303" SIZE=14 MAXLENGTH=199 
								VALUE="#a_303#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
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
							<CFINPUT type="text" NAME="a_401" SIZE=14 MAXLENGTH=199 
								VALUE="#a_401#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							402. Personal Property
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_402" SIZE=14 MAXLENGTH=199 
								VALUE="#a_402#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>403. <CFINPUT type="text" NAME="a_403_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_403_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_403_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_403_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>404. <CFINPUT type="text" NAME="a_404_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_404_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_404_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_404_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>					

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>405. <CFINPUT type="text" NAME="a_405_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_405_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_405_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_405_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
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
							<CFINPUT type="text" NAME="a_406" SIZE=14 MAXLENGTH=199 
								VALUE="#a_406#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							407. County Taxes
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_407" SIZE=14 MAXLENGTH=199 
								VALUE="#a_407#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							408. Assessments
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_408" SIZE=14 MAXLENGTH=199 
								VALUE="#a_408#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>409. <CFINPUT type="text" NAME="a_409_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_409_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_409_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_409_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>410. <CFINPUT type="text" NAME="a_410_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_410_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_410_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_410_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>					
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>411. <CFINPUT type="text" NAME="a_411_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_411_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_411_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_411_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>					
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>412. <CFINPUT type="text" NAME="a_412_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_412_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_412_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_412_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>					

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							420. GROSS AMOUNT DUE TO SELLER
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_420" SIZE=14 MAXLENGTH=199 
								VALUE="#read_data2.a_1400_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
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
							<CFINPUT type="text" NAME="a_501" SIZE=14 MAXLENGTH=199 
								VALUE="#a_501#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							502. Settlement charges to seller (line 1400)
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_502" SIZE=14 MAXLENGTH=199 
								VALUE="#read_data2.a_1400_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							503. Existing loan(s) taken subject to
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_503" SIZE=14 MAXLENGTH=199 
								VALUE="#a_503#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							504. Payoff of First Mortgage Loan
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_504" SIZE=14 MAXLENGTH=199 
								VALUE="#a_504#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
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
							<CFINPUT type="text" NAME="a_505" SIZE=14 MAXLENGTH=199 
								VALUE="#a_505#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
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
							<NOBR>506. <CFINPUT type="text" NAME="a_506_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_506_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_506_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_506_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>	

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>507. <CFINPUT type="text" NAME="a_507_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_507_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_507_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_507_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>						

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>508. <CFINPUT type="text" NAME="a_508_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_508_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_508_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_508_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>	

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>509. <CFINPUT type="text" NAME="a_509_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_509_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_509_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_509_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
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
							<CFINPUT type="text" NAME="a_510" SIZE=14 MAXLENGTH=199 
								VALUE="#a_510#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							511. County Taxes
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_511" SIZE=14 MAXLENGTH=199 
								VALUE="#a_511#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							512. Assessments
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_512" SIZE=14 MAXLENGTH=199 
								VALUE="#a_512#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>513. <CFINPUT type="text" NAME="a_513_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_513_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_513_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_513_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>514. <CFINPUT type="text" NAME="a_514_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_514_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_514_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_514_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>					
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>515. <CFINPUT type="text" NAME="a_515_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_515_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_515_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_515_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>					
					
					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>516. <CFINPUT type="text" NAME="a_516_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_516_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_516_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_516_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>					

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>517. <CFINPUT type="text" NAME="a_517_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_517_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_517_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_517_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>518. <CFINPUT type="text" NAME="a_518_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_518_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_518_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_518_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							<NOBR>519. <CFINPUT type="text" NAME="a_519_a" SIZE=42 MAXLENGTH=199 
								VALUE="#a_519_a#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR>
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_519_b" SIZE=14 MAXLENGTH=199 
								VALUE="#a_519_b#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							520. TOTAL REDUCTION AMOUNT DUE SELLER
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_520" SIZE=14 MAXLENGTH=199 
								VALUE="#a_520#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
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
							<CFINPUT type="text" NAME="a_601" SIZE=14 MAXLENGTH=199 
								VALUE="#a_601#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							602. Less reduction amount due seller (line 520)
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_602" SIZE=14 MAXLENGTH=199 
								VALUE="#a_602#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
						</td>
					</tr>

					<tr>
						<td  width=244 bgcolor=white align=left>
							<font size=1 color=black face=arial>
							603. CASH TO SELLER
						</td>

						<td  width=150 bgcolor=white align=right>
							<CFINPUT type="text" NAME="a_603" SIZE=14 MAXLENGTH=199 
								VALUE="#a_603#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >
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

<table width=790 cellpadding=1 cellspacing=1 border=0>
	<tr>
		<td bgcolor=white width=790 align=left valign=top>
			<font size=1 color=black face=verdana>
			<p>
				<NOBR>SUBSTITUE FROM 1099 SELLER STATEMENT: The information contained herein is important tax information and is being furnished to the </NOBR><br>
				<NOBR>Internal Revenue Service.  If you are required to file a return, a negligence penalty or other sanction will be imposed on you if this item is </NOBR><br>
				<NOBR>required to be reported and the IRS determines that it has not been reported.  The contract sales price described on line 401 above </NOBR><br>
				<NOBR>constitutes the gross proceeds of this transaction.</NOBR><br> 				
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=790 align=left valign=top>
			<font size=1 color=black face=verdana>
			<p><br>
				<NOBR>SELLER INSTRUCTIONS: If this real estate was your principal residence, file form 2119 , Sale or Exchange of PRincipal Residence, for </NOBR><br>
				<NOBR>any gain, with your income tax return: for other transactions, complete the applicable parts of Form 4797, Form 6252 and/or </NOBR><br>
				<NOBR>Schedule D (Form 1040) </NOBR><br> 				
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=790 align=left valign=top>
			<font size=1 color=black face=verdana>
			<p><br>
				<NOBR>You are required by law to provide the settlement agent (Fed. Tax ID No:							<CFINPUT type="text" NAME="Fed_tax_id_no" SIZE=19 MAXLENGTH=100 
								VALUE="#Fed_tax_id_no#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >) with your correct taxpayer</NOBR><br> 	
				<NOBR>identification number. If you do not provide your correct taxpayer identification number, you may be subject to civil</NOBR><br> 
				<NOBR>or criminal penalties imposed by law. Under penalties of purjury, I certify that the number shown on this statement is my correct </NOBR><br>
				<NOBR>taxpayer identification number.</NOBR><br>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=790 align=left valign=top>
			<font size=1 color=black face=verdana>
			<p><br>
				<NOBR>TIN:  #Fed_tax_id_no#/______________________ Seller(s) Signature(s)_______________________________________________</NOBR><br>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=790 align=left valign=top>
			<font size=1 color=black face=verdana>
			<p><br>
				<NOBR>SELLER(S) NEW MAILING ADDRESS: <CFINPUT type="text" NAME="seller_new_addr" SIZE=60 MAXLENGTH=199 
								VALUE="#seller_new_addr#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" ></NOBR><br>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=790 align=left valign=top>
			<font size=1 color=black face=verdana>
			<p><br>
				<NOBR>SELLER(S)PHONE NUMBERS: <CFINPUT type="text" NAME="seller_new_home_phone" SIZE=28 MAXLENGTH=100 
								VALUE="#seller_new_home_phone#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >(H) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFINPUT type="text" NAME="seller_new_work_phone" SIZE=28 MAXLENGTH=100 
								VALUE="#seller_new_work_phone#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: 003F1E; 
								background-color: E4E3E3; 
								border-color: white; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none;" >(W)</NOBR><br>
		

		</td>
	</tr>
	
	
</table>


		
</CFOUTPUT>
<!--- </td>
	</tr>
	
	
</table>
NEW HUD 2 --->
<CFOUTPUT query="read_data2">

<CENTER>
<CENTER>
<table width=790 cellpadding=1 cellspacing=1 border=0>
	<tr>
		<td bgcolor=white width=790 align=left valign=top>
			<font size=1 color=black face=verdana>
				<NOBR>U.S. DEPARTMENT OF HOUSING AND URBAN DEVELOPMENT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;File Number:<font size=1 color=blue face=verdana><b>#read_data2.title_id#</font></b></NOBR><br>
				<font size=2 color=black face=times><NOBR><b>Settlement Statement</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<font size=1 color=black face=verdana>Page 2</NOBR>			
		</td>
	</tr>
</table>

<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

<!--- ===/ NOTE \=== --->

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr><b>L.</b> SETTLEMENT CHARGES

			<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=e3e3e3>
				<tr>
					<td width=499 align=left valign=top bgcolor=white>
						<font size=1 color=black face=arial>
						<nobr>700. TOTAL SALES/BROKER'S COMMISSION based on price &nbsp;$ 
						<CFINPUT type="text" NAME="a_700_a" SIZE=19 MAXLENGTH=199 
							VALUE="#a_700_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >&nbsp;&nbsp;<br>
							<nobr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@ <CFINPUT type="text" NAME="a_700_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_700_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" ></NOBR>
							<br>
							<nobr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;= <CFINPUT type="text" NAME="a_700_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_700_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
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
						<nobr>701. &nbsp;&nbsp;$
						<CFINPUT type="text" NAME="a_701_a" SIZE=19 MAXLENGTH=199 
							VALUE="#a_701_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >   &nbsp;&nbsp;&nbsp;To -  <CFINPUT type="text" NAME="a_701_b" SIZE=25 MAXLENGTH=199 
							VALUE="#a_701_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" ></NOBR>
					</td>
				</tr>

				<tr>
					<td width=499 align=left valign=top bgcolor=white>
						<font size=1 color=black face=arial>
						<nobr>702. &nbsp;&nbsp;$
						<CFINPUT type="text" NAME="a_702_a" SIZE=19 MAXLENGTH=199 
							VALUE="#a_702_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >   &nbsp;&nbsp;&nbsp;To -  <CFINPUT type="text" NAME="a_702_b" SIZE=25 MAXLENGTH=199 
							VALUE="#a_702_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" ></NOBR>
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

		<td bgcolor=white width=150 align=center valign=top>
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
 			<CFINPUT type="text" NAME="a_703_a" SIZE=19 MAXLENGTH=199 
							VALUE="#a_703_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>

		<td bgcolor=white width=150 align=right valign=top>
 			<CFINPUT type="text" NAME="a_703_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_703_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>
	</tr>

	<tr>
		<td bgcolor=white colspan=3 width=790 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;800. ITEMS PAYABLE IN CONNECTION WITH LOAN
		</td>
	</tr>


	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;801. Loan Origination Fee&nbsp;&nbsp;&nbsp;&nbsp;
				<CFINPUT type="text" NAME="a_801_a" SIZE=19 MAXLENGTH=199 
							VALUE="#a_801_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	%</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
 			<CFINPUT type="text" NAME="a_801_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_801_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>

		<td bgcolor=white width=150 align=right valign=top>
 			<CFINPUT type="text" NAME="a_801_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_801_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;802. Loan Discount &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<CFINPUT type="text" NAME="a_802_a" SIZE=19 MAXLENGTH=199 
							VALUE="#a_802_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	%</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
 			<CFINPUT type="text" NAME="a_802_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_802_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>

		<td bgcolor=white width=150 align=right valign=top>
 			<CFINPUT type="text" NAME="a_802_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_802_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;803. Appraisal Fee</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
 			<CFINPUT type="text" NAME="a_803_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_803_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>

		<td bgcolor=white width=150 align=right valign=top>
 			<CFINPUT type="text" NAME="a_803_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_803_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;804. Credit Report</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
 			<CFINPUT type="text" NAME="a_804_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_804_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>

		<td bgcolor=white width=150 align=right valign=top>
 			<CFINPUT type="text" NAME="a_804_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_804_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;805. 
					<CFINPUT type="text" NAME="a_805_a" SIZE=61 MAXLENGTH=199 
							VALUE="#a_805_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" ></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
 			<CFINPUT type="text" NAME="a_805_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_805_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>

		<td bgcolor=white width=150 align=right valign=top>
 			<CFINPUT type="text" NAME="a_805_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_805_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;806. 
					<CFINPUT type="text" NAME="a_806_a" SIZE=61 MAXLENGTH=199 
							VALUE="#a_806_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" ></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
 			<CFINPUT type="text" NAME="a_806_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_806_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>

		<td bgcolor=white width=150 align=right valign=top>
 			<CFINPUT type="text" NAME="a_806_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_806_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;807. 
					<CFINPUT type="text" NAME="a_807_a" SIZE=61 MAXLENGTH=199 
							VALUE="#a_807_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" ></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
 			<CFINPUT type="text" NAME="a_807_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_807_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>

		<td bgcolor=white width=150 align=right valign=top>
 			<CFINPUT type="text" NAME="a_807_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_807_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;808. 
					<CFINPUT type="text" NAME="a_808_a" SIZE=61 MAXLENGTH=199 
							VALUE="#a_808_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" ></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
					<CFINPUT type="text" NAME="a_808_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_808_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
		</td>

		<td bgcolor=white width=150 align=right valign=top>
					<CFINPUT type="text" NAME="a_808_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_808_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;809. 
					<CFINPUT type="text" NAME="a_809_a" SIZE=61 MAXLENGTH=199 
							VALUE="#a_809_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" ></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
					<CFINPUT type="text" NAME="a_809_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_809_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
		</td>

		<td bgcolor=white width=150 align=right valign=top>
					<CFINPUT type="text" NAME="a_809_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_809_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;810. 
					<CFINPUT type="text" NAME="a_810_a" SIZE=61 MAXLENGTH=199 
							VALUE="#a_810_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" ></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
					<CFINPUT type="text" NAME="a_810_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_810_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
		</td>

		<td bgcolor=white width=150 align=right valign=top>
					<CFINPUT type="text" NAME="a_810_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_810_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;811. 
					<CFINPUT type="text" NAME="a_811_a" SIZE=61 MAXLENGTH=199 
							VALUE="#a_811_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" ></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
					<CFINPUT type="text" NAME="a_811_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_811_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
		</td>

		<td bgcolor=white width=150 align=right valign=top>
					<CFINPUT type="text" NAME="a_811_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_811_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
		</td>
	</tr>


	<tr>
		<td bgcolor=white colspan=3 width=790 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;900. ITEMS REQUIRED BY LENDER TO BE PAID IN ADVANCE
		</td>
	</tr>


	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;901. Interest From&nbsp;-&nbsp;
				<CFINPUT type="text" NAME="a_901_a" SIZE=13 MAXLENGTH=199 
							VALUE="#a_901_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >&nbsp;&nbsp;
					to&nbsp;-&nbsp;
				<CFINPUT type="text" NAME="a_901_b" SIZE=13 MAXLENGTH=199 
							VALUE="#a_901_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >&nbsp;&nbsp;
					@&nbsp;&nbsp;$&nbsp;&nbsp;
				<CFINPUT type="text" NAME="a_901_c" SIZE=13 MAXLENGTH=199 
							VALUE="#a_901_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >&nbsp;&nbsp;/day</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<CFINPUT type="text" NAME="a_901_d" SIZE=19 MAXLENGTH=199 
										VALUE="#a_901_d#"
										style="font-size: 9; 
										font-family: verdana; 
										font-style: normal; 
										color: 003F1E; 
										background-color: E4E3E3; 
										border-color: white; 
										border-left-width: thin; 
										border-right-width: thin; 
										border-top-width: thin; 
										border-bottom-width: thin; 
										border-width: thin; 
										border-style: bar; 
							clear: none;" >
								
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<CFINPUT type="text" NAME="a_901_e" SIZE=19 MAXLENGTH=199 
										VALUE="#a_901_e#"
										style="font-size: 9; 
										font-family: verdana; 
										font-style: normal; 
										color: 003F1E; 
										background-color: E4E3E3; 
										border-color: white; 
										border-left-width: thin; 
										border-right-width: thin; 
										border-top-width: thin; 
										border-bottom-width: thin; 
										border-width: thin; 
										border-style: bar; 
							clear: none;" >
								
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;902. Mortgage Insurance Premium from - &nbsp;&nbsp;
				<CFINPUT type="text" NAME="a_902_a" SIZE=13 MAXLENGTH=199 
							VALUE="#a_902_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >&nbsp;&nbsp;&nbsp; to - 
				<CFINPUT type="text" NAME="a_902_b" SIZE=13 MAXLENGTH=199 
							VALUE="#a_902_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" ></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<CFINPUT type="text" NAME="a_902_c" SIZE=19 MAXLENGTH=199 
										VALUE="#a_902_c#"
										style="font-size: 9; 
										font-family: verdana; 
										font-style: normal; 
										color: 003F1E; 
										background-color: E4E3E3; 
										border-color: white; 
										border-left-width: thin; 
										border-right-width: thin; 
										border-top-width: thin; 
										border-bottom-width: thin; 
										border-width: thin; 
										border-style: bar; 
							clear: none;" >
								
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<CFINPUT type="text" NAME="a_902_d" SIZE=19 MAXLENGTH=199 
										VALUE="#a_902_d#"
										style="font-size: 9; 
										font-family: verdana; 
										font-style: normal; 
										color: 003F1E; 
										background-color: E4E3E3; 
										border-color: white; 
										border-left-width: thin; 
										border-right-width: thin; 
										border-top-width: thin; 
										border-bottom-width: thin; 
										border-width: thin; 
										border-style: bar; 
							clear: none;" >
								
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;903. Hazard Insurance Premium  from - &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<CFINPUT type="text" NAME="a_903_a" SIZE=13 MAXLENGTH=199 
							VALUE="#a_903_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >&nbsp;&nbsp;&nbsp; to - 
				<CFINPUT type="text" NAME="a_903_b" SIZE=13 MAXLENGTH=199 
							VALUE="#a_903_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" ></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<CFINPUT type="text" NAME="a_903_c" SIZE=19 MAXLENGTH=199 
										VALUE="#a_903_c#"
										style="font-size: 9; 
										font-family: verdana; 
										font-style: normal; 
										color: 003F1E; 
										background-color: E4E3E3; 
										border-color: white; 
										border-left-width: thin; 
										border-right-width: thin; 
										border-top-width: thin; 
										border-bottom-width: thin; 
										border-width: thin; 
										border-style: bar; 
							clear: none;" >
								
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<CFINPUT type="text" NAME="a_903_d" SIZE=19 MAXLENGTH=199 
										VALUE="#a_903_d#"
										style="font-size: 9; 
										font-family: verdana; 
										font-style: normal; 
										color: 003F1E; 
										background-color: E4E3E3; 
										border-color: white; 
										border-left-width: thin; 
										border-right-width: thin; 
										border-top-width: thin; 
										border-bottom-width: thin; 
										border-width: thin; 
										border-style: bar; 
							clear: none;" >
								
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;904. 
					<CFINPUT type="text" NAME="a_904_a" SIZE=61 MAXLENGTH=199 
							VALUE="#a_904_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" ></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
					<CFINPUT type="text" NAME="a_904_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_904_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
		</td>

		<td bgcolor=white width=150 align=right valign=top>
					<CFINPUT type="text" NAME="a_904_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_904_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;905. Lender's Inspection Fee</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
 			<CFINPUT type="text" NAME="a_905_a" SIZE=19 MAXLENGTH=199 
							VALUE="#a_905_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>

		<td bgcolor=white width=150 align=right valign=top>
 			<CFINPUT type="text" NAME="a_905_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_905_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>
	</tr>



	<tr>
		<td bgcolor=white colspan=3 width=790 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1000. RESERVES DEPOSITED WITH LENDER FOR
		</td>
	</tr>


	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1001. Hazard Insurance&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					<CFINPUT type="text" NAME="a_1001_a" SIZE=5 MAXLENGTH=3 
							VALUE="#a_1001_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	&nbsp;&nbsp;&nbsp;&nbsp;mo.&nbsp;&nbsp;&nbsp;&nbsp;			
					@ $&nbsp;&nbsp;<CFINPUT type="text" NAME="a_1001_b" SIZE=13 MAXLENGTH=199 
							VALUE="#a_1001_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >&nbsp;&nbsp;&nbsp;&nbsp;/mo</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
				<CFINPUT type="text" NAME="a_1001_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1001_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
		</td>

		<td bgcolor=white width=150 align=right valign=top>
				<CFINPUT type="text" NAME="a_1001_d" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1001_d#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
								
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1002. Mortgage Insurance &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					<CFINPUT type="text" NAME="a_1002_a" SIZE=5 MAXLENGTH=3 
							VALUE="#a_1002_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	&nbsp;&nbsp;&nbsp;&nbsp;mo.&nbsp;&nbsp;&nbsp;&nbsp;			
					@ $&nbsp;&nbsp;<CFINPUT type="text" NAME="a_1002_b" SIZE=13 MAXLENGTH=199 
							VALUE="#a_1002_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >&nbsp;&nbsp;&nbsp;&nbsp;/mo</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
				<CFINPUT type="text" NAME="a_1002_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1002_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
		</td>

		<td bgcolor=white width=150 align=right valign=top>
				<CFINPUT type="text" NAME="a_1002_d" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1002_d#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
								
		</td>
	</tr>


	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1003. City Property Taxes &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					<CFINPUT type="text" NAME="a_1003_a" SIZE=5 MAXLENGTH=3 
							VALUE="#a_1003_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	&nbsp;&nbsp;&nbsp;&nbsp;mo.&nbsp;&nbsp;&nbsp;&nbsp;			
					@ $&nbsp;&nbsp;<CFINPUT type="text" NAME="a_1003_b" SIZE=13 MAXLENGTH=199 
							VALUE="#a_1003_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >&nbsp;&nbsp;&nbsp;&nbsp;/mo</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
				<CFINPUT type="text" NAME="a_1003_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1003_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
		</td>

		<td bgcolor=white width=150 align=right valign=top>
				<CFINPUT type="text" NAME="a_1003_d" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1003_d#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
								
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1004. County Property Taxes  &nbsp;&nbsp; 
					<CFINPUT type="text" NAME="a_1004_a" SIZE=5 MAXLENGTH=3 
							VALUE="#a_1004_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	&nbsp;&nbsp;&nbsp;&nbsp;mo.&nbsp;&nbsp;&nbsp;&nbsp;			
					@ $&nbsp;&nbsp;<CFINPUT type="text" NAME="a_1004_b" SIZE=13 MAXLENGTH=199 
							VALUE="#a_1004_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >&nbsp;&nbsp;&nbsp;&nbsp;/mo</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
				<CFINPUT type="text" NAME="a_1004_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1004_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
		</td>

		<td bgcolor=white width=150 align=right valign=top>
				<CFINPUT type="text" NAME="a_1004_d" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1004_d#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
								
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1005. Annual Assessments     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					<CFINPUT type="text" NAME="a_1005_a" SIZE=5 MAXLENGTH=3 
							VALUE="#a_1005_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	&nbsp;&nbsp;&nbsp;&nbsp;mo.&nbsp;&nbsp;&nbsp;&nbsp;			
					@ $&nbsp;&nbsp;<CFINPUT type="text" NAME="a_1005_b" SIZE=13 MAXLENGTH=199 
							VALUE="#a_1005_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >&nbsp;&nbsp;&nbsp;&nbsp;/mo</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
				<CFINPUT type="text" NAME="a_1005_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1005_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
		</td>

		<td bgcolor=white width=150 align=right valign=top>
				<CFINPUT type="text" NAME="a_1005_d" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1005_d#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
								
		</td>
	</tr>



	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1006. Aggragate Analysis Adjustment</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
 			<CFINPUT type="text" NAME="a_1006_a" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1006_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>

		<td bgcolor=white width=150 align=right valign=top>
 			<CFINPUT type="text" NAME="a_1006_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1006_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>
	</tr>	


	<tr>
		<td bgcolor=white colspan=3 width=790 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1100. TITLE CHARGES
		</td>
	</tr>

<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1101. Settlement or closing fee&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to <font size=1 color=blue face=verdana><b>#read_agency.title_ft_agency_name#</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
 			<cfif #read_data2.a_1101_a# NEQ "0">
			<CFINPUT type="text" NAME="a_1101_a" SIZE=19 MAXLENGTH=199 
							
							VALUE="#a_1101_a#"
							
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		<cfelse>
		<CFINPUT type="text" NAME="a_1101_a" SIZE=19 MAXLENGTH=199 
							
							VALUE=""
							
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >				
		</cfif>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
 				<cfif #read_data2.a_1101_b# NEQ "0">
			<CFINPUT type="text" NAME="a_1101_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1101_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		<cfelse>
		
		<CFINPUT type="text" NAME="a_1101_b" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >			
		
		</cfif>
		</td>
	</tr>	
	

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1102. Abstract or Title Search&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to <font size=1 color=blue face=verdana><b>to Abstracts USA, LLC </b></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
 			<cfif #read_data2.a_1102_a# NEQ "0">
							<CFINPUT type="text" NAME="a_1102_a" SIZE=19 MAXLENGTH=199 
							
							VALUE="#a_1102_a#"
						
							
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		<CFELSE>
		<CFINPUT type="text" NAME="a_1102_a" SIZE=19 MAXLENGTH=199 
							
							VALUE=""
						
							
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >					
		</CFIF>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
 			<cfif #read_data2.a_1102_b# NEQ "0">
			
			<CFINPUT type="text" NAME="a_1102_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1102_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		
		<cfelse>
		<CFINPUT type="text" NAME="a_1102_b" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >			
		
		</cfif>
		</td>
	</tr>	

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1103. Title Examination&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to <font size=1 color=blue face=verdana><b>#read_agency.title_ft_agency_name#</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
 		<cfif #read_data2.a_1103_a# NEQ "0">
			<CFINPUT type="text" NAME="a_1103_a" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1103_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		<cfelse>
		<CFINPUT type="text" NAME="a_1103_a" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >			
		</cfif>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
 			<cfif #read_data2.a_1103_b# NEQ "0">
			
			<CFINPUT type="text" NAME="a_1103_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1103_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		<cfelse>
		
		<CFINPUT type="text" NAME="a_1103_b" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >			
		
		</cfif>
		</td>
	</tr>	

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1104. Title Insurance Binder&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to <font size=1 color=blue face=verdana><b>#read_agency.title_ft_agency_name#</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
 			<cfif #read_data2.a_1104_a# NEQ "0">
			<CFINPUT type="text" NAME="a_1104_a" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1104_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		
		<cfelse>
		<CFINPUT type="text" NAME="a_1104_a" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >			
		
		</cfif>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
 			<cfif #read_data2.a_1104_b# NEQ "0">
			
			<CFINPUT type="text" NAME="a_1104_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1104_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		<cfelse><CFINPUT type="text" NAME="a_1104_b" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >			
		</cfif>
		
		</td>
	</tr>	

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1105. Document Preparation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to <font size=1 color=blue face=verdana><b>#read_agency.title_ft_agency_name#</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
 			<cfif #read_data2.a_1105_a# NEQ "0">
			
			<CFINPUT type="text" NAME="a_1105_a" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1105_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		
		<cfelse>
		<CFINPUT type="text" NAME="a_1105_a" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >		
		</cfif>
		
		</td>

		<td bgcolor=white width=150 align=right valign=top>
 			
			<cfif #read_data2.a_1105_b# NEQ "0">
			
			<CFINPUT type="text" NAME="a_1105_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1105_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		<cfelse>
		<CFINPUT type="text" NAME="a_1105_b" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >			
		</cfif>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1106. Notary Fees&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to <font size=1 color=blue face=verdana><b>#read_agency.title_ft_agency_name#</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
 			<cfif #read_data2.a_1106_a# NEQ "0">
			
			<CFINPUT type="text" NAME="a_1106_a" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1106_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		<cfelse>
		<CFINPUT type="text" NAME="a_1106_a" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >			
		
		</cfif>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
 			<cfif #read_data2.a_1106_b# NEQ "0">
			
			<CFINPUT type="text" NAME="a_1106_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1106_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		<cfelse>
		
			<CFINPUT type="text" NAME="a_1106_b" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >				
		</cfif>
		
		</td>
	</tr>	

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1107. Attorney's Fees</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
 			<cfif #read_data2.a_1107_a# NEQ "0">
			<CFINPUT type="text" NAME="a_1107_a" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1107_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		
		<cfelse>
		
			<CFINPUT type="text" NAME="a_1107_a" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
		
		</cfif>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
 			<cfif #read_data2.a_1107_b# NEQ "0">
			<CFINPUT type="text" NAME="a_1107_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1107_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		<cfelse>
		<CFINPUT type="text" NAME="a_1107_b" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >			
		</cfif>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(includes above items No.&nbsp;&nbsp;
				<CFINPUT type="text" NAME="a_1107_c" SIZE=60 MAXLENGTH=199 
							VALUE="#a_1107_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >&nbsp;&nbsp;&nbsp;)</NOBR>
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

		<td bgcolor=white width=150 align=center valign=top>
 				<cfif #read_data2.a_1108_a# NEQ "0">
			<CFINPUT type="text" NAME="a_1108_a" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1108_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		<cfelse>
		<CFINPUT type="text" NAME="a_1108_a" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >			
		
		</cfif>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
 			<cfif #read_data2.a_1108_b# NEQ "0">
			
			<CFINPUT type="text" NAME="a_1108_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1108_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		<cfelse>
		<CFINPUT type="text" NAME="a_1108_b" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >			
		</cfif>
		
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(includes above items No.&nbsp;&nbsp;
				<CFINPUT type="text" NAME="a_1108_c" SIZE=60 MAXLENGTH=199 
							VALUE="#a_1108_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >&nbsp;&nbsp;&nbsp;)</NOBR>
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
				<nobr>&nbsp;1109. Lender's Coverage $ &nbsp;&nbsp;
				<CFINPUT type="text" NAME="a_1109_a" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1109_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	%</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
 			<CFINPUT type="text" NAME="a_1109_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1109_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>

		<td bgcolor=white width=150 align=right valign=top>
 			<CFINPUT type="text" NAME="a_1109_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1109_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1110. Owner's Coverage $  &nbsp;&nbsp;&nbsp;
				<CFINPUT type="text" NAME="a_1110_a" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1110_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	%</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
 			<CFINPUT type="text" NAME="a_1110_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1110_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>

		<td bgcolor=white width=150 align=right valign=top>
 			<CFINPUT type="text" NAME="a_1110_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1110_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>
	</tr>



	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1111. 
					<CFINPUT type="text" NAME="a_1111_text" SIZE=61 MAXLENGTH=199 
							VALUE="#get_line_costs.a_1111_text#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
						
						to <font size=1 color=blue face=verdana><b>#read_agency.title_ft_agency_name#</b></NOBR>
		
		</td>
&nbsp;&nbsp;&nbsp;
		<td bgcolor=white width=150 align=center valign=top>
					<cfif #read_data2.a_1111_a# NEQ "0">
					<CFINPUT type="text" NAME="a_1111_a" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1111_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
		<cfelse>
		
		<CFINPUT type="text" NAME="a_1111_a" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
		</cfif>
		
		</td>

		<td bgcolor=white width=150 align=right valign=top>
					<cfif #read_data2.a_1111_b# NEQ "0">
					
					<CFINPUT type="text" NAME="a_1111_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1111_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
		<cfelse>
			<CFINPUT type="text" NAME="a_1111_b" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
		
		</cfif>
		
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1112. 
					<CFINPUT type="text" NAME="a_1112_text" SIZE=61 MAXLENGTH=199 
							VALUE="#get_line_costs.a_1112_text#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
							
							to <font size=1 color=blue face=verdana><b>#read_agency.title_ft_agency_name#</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
					<cfif #read_data2.a_1112_a# NEQ "0">
					<CFINPUT type="text" NAME="a_1112_a" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1112_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
		<cfelse>
		
		<CFINPUT type="text" NAME="a_1112_a" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
		</cfif>
		
		</td>

		<td bgcolor=white width=150 align=right valign=top>
					
					<cfif #read_data2.a_1112_b# NEQ "0">
					<CFINPUT type="text" NAME="a_1112_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1112_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
		<cfelse>
		<CFINPUT type="text" NAME="a_1112_b" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
		
	</cfif>
	
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1113. 
					<CFINPUT type="text" NAME="a_1113_text" SIZE=61 MAXLENGTH=199 
							VALUE="#get_line_costs.a_1113_text#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
							
							to <font size=1 color=blue face=verdana><b>#read_agency.title_ft_agency_name#</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
					<cfif #read_data2.a_1113_a# NEQ "0">
					<CFINPUT type="text" NAME="a_1113_a" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1113_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
							<cfelse>
		<CFINPUT type="text" NAME="a_1113_a" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
		</cfif>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
						<cfif #read_data2.a_1113_b# NEQ "0">
					<CFINPUT type="text" NAME="a_1113_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1113_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
		
		<cfelse>
		<CFINPUT type="text" NAME="a_1113_b" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
		</cfif>
		</td>
	</tr>
	
	<tr>
		<td bgcolor=white colspan=3 width=790 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1200. GOVERNMENT RECORDING AND TRANSFER CHARGES
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1201. Recording Fees Deed $ &nbsp;&nbsp;
				<cfif #read_data2.a_1201_a# NEQ "0">
				<CFINPUT type="text" NAME="a_1201_a" SIZE=13 MAXLENGTH=13 
							VALUE="#a_1201_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >&nbsp;&nbsp; 
				Mortgage $  &nbsp;
				
				<cfelse>
				<CFINPUT type="text" NAME="a_1201_a" SIZE=13 MAXLENGTH=13 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >&nbsp;&nbsp; 
				Mortgage $  &nbsp;
				</cfif>
				<cfif #read_data2.a_1201_b# NEQ "0">
				<CFINPUT type="text" NAME="a_1201_b" SIZE=13 MAXLENGTH=13 
							VALUE="#a_1201_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >&nbsp;
				: Release $ 
				<cfelse>
				<CFINPUT type="text" NAME="a_1201_b" SIZE=13 MAXLENGTH=13 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >&nbsp;
				: Release $ 
				</cfif>
				<cfif #read_data2.a_1201_c# NEQ "0">
				<CFINPUT type="text" NAME="a_1201_c" SIZE=13 MAXLENGTH=13 
							VALUE="#a_1201_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
				
				<cfelse>
				<CFINPUT type="text" NAME="a_1201_c" SIZE=13 MAXLENGTH=13 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
				</cfif>
				
				</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
				<cfif #read_data2.a_1201_d# NEQ "0">
				<CFINPUT type="text" NAME="a_1201_d" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1201_d#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
		<cfelse>
		<CFINPUT type="text" NAME="a_1201_d" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
		</cfif>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
				<cfif #read_data2.a_1201_e# NEQ "0">
				<CFINPUT type="text" NAME="a_1201_e" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1201_e#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		<cfelse>
		<CFINPUT type="text" NAME="a_1201_e" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >				
		</cfif>
		
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1202. City/County tax/Stamps: &nbsp;
				<cfif #read_data2.a_1202_a# NEQ "0">
				<CFINPUT type="text" NAME="a_1202_a" SIZE=13 MAXLENGTH=199 
							VALUE="#a_1202_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
				&nbsp;&nbsp;Deed $ &nbsp;&nbsp;
				
				<cfelse>
				<CFINPUT type="text" NAME="a_1202_a" SIZE=13 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
				&nbsp;&nbsp;Deed $ &nbsp;&nbsp;
				</cfif>
				<cfif #read_data2.a_1202_b# NEQ "0">
				<CFINPUT type="text" NAME="a_1202_b" SIZE=13 MAXLENGTH=199 
							VALUE="#a_1202_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
				&nbsp;&nbsp;: Mortgage $ &nbsp;&nbsp;
				<cfelse>
				<CFINPUT type="text" NAME="a_1202_b" SIZE=13 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
				&nbsp;&nbsp;: Mortgage $ &nbsp;&nbsp;
				</cfif>
				<cfif #read_data2.a_1202_c# NEQ "0">
				<CFINPUT type="text" NAME="a_1202_c" SIZE=13 MAXLENGTH=199 
							VALUE="#a_1202_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >					
				<cfelse>
				<CFINPUT type="text" NAME="a_1202_c" SIZE=13 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >				
				</cfif>
				</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
				<cfif #read_data2.a_1202_d# NEQ "0">
				<CFINPUT type="text" NAME="a_1202_d" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1202_d#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >									
		<cfelse>
		<CFINPUT type="text" NAME="a_1202_d" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >			
		</cfif>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
				<cfif #read_data2.a_1202_e# NEQ "0">
				<CFINPUT type="text" NAME="a_1202_e" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1202_e#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
		<cfelse>						
		<CFINPUT type="text" NAME="a_1202_e" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
							</cfif>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1203. State tax/Stamps: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<cfif #read_data2.a_1203_a# NEQ "0">
				<CFINPUT type="text" NAME="a_1203_a" SIZE=13 MAXLENGTH=199 
							VALUE="#a_1203_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
				&nbsp;&nbsp;Deed $ &nbsp;&nbsp;
				<cfelse>
				<CFINPUT type="text" NAME="a_1203_a" SIZE=13 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
				&nbsp;&nbsp;Deed $ &nbsp;&nbsp;
				
				</cfif>
				<cfif #read_data2.a_1203_b# NEQ "0">
				<CFINPUT type="text" NAME="a_1203_b" SIZE=13 MAXLENGTH=199 
							VALUE="#a_1203_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
				&nbsp;&nbsp;: Mortgage $ &nbsp;&nbsp;
				<cfelse>
				<CFINPUT type="text" NAME="a_1203_b" SIZE=13 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
				&nbsp;&nbsp;: Mortgage $ &nbsp;&nbsp;
				</cfif>
				<cfif #read_data2.a_1203_c# NEQ "0">
				<CFINPUT type="text" NAME="a_1203_c" SIZE=13 MAXLENGTH=199 
							VALUE="#a_1203_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >					
				<cfelse>
				<CFINPUT type="text" NAME="a_1203_c" SIZE=13 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >			
				</cfif>
				</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
				<cfif #read_data2.a_1203_d# NEQ "0">
				<CFINPUT type="text" NAME="a_1203_d" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1203_d#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >									
		<cfelse>
		<CFINPUT type="text" NAME="a_1203_d" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >					
		</cfif>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
				<cfif #read_data2.a_1203_e# NEQ "0">
				<CFINPUT type="text" NAME="a_1203_e" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1203_e#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
				<cfelse>
				<CFINPUT type="text" NAME="a_1203_e" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
				</cfif>				
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1204. 
					<CFINPUT type="text" NAME="a_1204_a" SIZE=61 MAXLENGTH=199 
							VALUE="#a_1204_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" ></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
						<cfif #read_data2.a_1204_b# NEQ "0">
					<CFINPUT type="text" NAME="a_1204_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1204_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
							
							<cfelse>
							
							<CFINPUT type="text" NAME="a_1204_b" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
						
							
							</cfif>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
					<cfif #read_data2.a_1204_c# NEQ "0">
					<CFINPUT type="text" NAME="a_1204_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1204_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
		<cfelse>
		<CFINPUT type="text" NAME="a_1204_c" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
		
		</cfif>
		</td>
	</tr>	

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1205. 
					<CFINPUT type="text" NAME="a_1205_text" SIZE=61 MAXLENGTH=199 
							VALUE="#get_line_costs.a_1205_text#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
							
								to <font size=1 color=blue face=verdana><b>#read_agency.title_ft_agency_name#</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
					<cfif #read_data2.a_1205_a# NEQ "0">
					<CFINPUT type="text" NAME="a_1205_a" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1205_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
		<cfelse>
		<CFINPUT type="text" NAME="a_1205_a" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
		</cfif>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
					<cfif #read_data2.a_1205_b# NEQ "0">
					<CFINPUT type="text" NAME="a_1205_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1205_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
		<cfelse>
		<CFINPUT type="text" NAME="a_1205_b" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
			</cfif>
		</td>
	</tr>	

	<tr>
		<td bgcolor=white colspan=3 width=790 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1300. ADDITIONAL SETTLEMENT CHARGES
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1301. Survey</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
 			<CFINPUT type="text" NAME="a_1301_a" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1301_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>

		<td bgcolor=white width=150 align=right valign=top>
 			<CFINPUT type="text" NAME="a_1301_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1301_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1302. Pest Inspection</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
 			<CFINPUT type="text" NAME="a_1302_a" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1302_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>

		<td bgcolor=white width=150 align=right valign=top>
 			<CFINPUT type="text" NAME="a_1302_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1302_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1303. 
					<CFINPUT type="text" NAME="a_1303_text" SIZE=61 MAXLENGTH=199 
							VALUE="#get_line_costs.a_1303_text#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" > 
							to <font size=1 color=blue face=verdana><b>#read_agency.title_ft_agency_name#</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
					<cfif #read_data2.a_1303_a# NEQ "0">
					<CFINPUT type="text" NAME="a_1303_a" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1303_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
		<cfelse>
		<CFINPUT type="text" NAME="a_1303_a" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
	</cfif>	
		</td>

		<td bgcolor=white width=150 align=right valign=top>
					<cfif #read_data2.a_1303_b# NEQ "0">
					<CFINPUT type="text" NAME="a_1303_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1303_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
		<cfelse>
		<CFINPUT type="text" NAME="a_1303_b" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
		
		</cfif>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1304. 
					<CFINPUT type="text" NAME="a_1304_text" SIZE=61 MAXLENGTH=199 
							VALUE="#get_line_costs.a_1304_text#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
								to <font size=1 color=blue face=verdana><b>#read_agency.title_ft_agency_name#</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
					<cfif #read_data2.a_1304_a# NEQ "0">
					<CFINPUT type="text" NAME="a_1304_a" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1304_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
		<cfelse>
		<CFINPUT type="text" NAME="a_1304_a" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
					</cfif>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
					<cfif #read_data2.a_1304_b# NEQ "0">
					<CFINPUT type="text" NAME="a_1304_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1304_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
		<cfelse>
		<CFINPUT type="text" NAME="a_1304_b" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
							</cfif>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1305. 
					
					<CFINPUT type="text" NAME="a_1305_text" SIZE=61 MAXLENGTH=199 
							VALUE="#get_line_costs.a_1305_text#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
							to <font size=1 color=blue face=verdana><b>#read_agency.title_ft_agency_name#</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
					<cfif #read_data2.a_1305_a# NEQ "0">
					<CFINPUT type="text" NAME="a_1305_a" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1305_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
		<cfelse>
			<CFINPUT type="text" NAME="a_1305_a" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
		</cfif>
		
		</td>

		<td bgcolor=white width=150 align=right valign=top>
				<cfif #read_data2.a_1305_b# NEQ "0">
					<CFINPUT type="text" NAME="a_1305_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1305_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
		<cfelse>
		<CFINPUT type="text" NAME="a_1305_b" SIZE=19 MAXLENGTH=199 
							VALUE=""
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
		</cfif>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1306. 
					<CFINPUT type="text" NAME="a_1306_a" SIZE=61 MAXLENGTH=199 
							VALUE="#a_1306_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" ></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
					<CFINPUT type="text" NAME="a_1306_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1306_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
		</td>

		<td bgcolor=white width=150 align=right valign=top>
					<CFINPUT type="text" NAME="a_1306_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1306_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1307. 
					<CFINPUT type="text" NAME="a_1307_a" SIZE=61 MAXLENGTH=199 
							VALUE="#a_1307_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" ></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
					<CFINPUT type="text" NAME="a_1307_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1307_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
		</td>

		<td bgcolor=white width=150 align=right valign=top>
					<CFINPUT type="text" NAME="a_1307_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1307_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1308. 
					<CFINPUT type="text" NAME="a_1308_a" SIZE=61 MAXLENGTH=199 
							VALUE="#a_1308_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" ></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
					<CFINPUT type="text" NAME="a_1308_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1308_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >
		</td>

		<td bgcolor=white width=150 align=right valign=top>
					<CFINPUT type="text" NAME="a_1308_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1308_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >	
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1400. TOTAL SETTLEMENT CHARGES (enter on lines 103, Section J and 502 Section K)</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
 			<CFINPUT type="text" NAME="a_1400_a" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1400_a#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>

		<td bgcolor=white width=150 align=right valign=top>
 			<CFINPUT type="text" NAME="a_1400_b" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1400_b#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
							background-color: E4E3E3; 
							border-color: white; 
							border-left-width: thin; 
							border-right-width: thin; 
							border-top-width: thin; 
							border-bottom-width: thin; 
							border-width: thin; 
							border-style: bar; 
							clear: none;" >								
		</td>
	</tr>	
<!--- </table>
	

	 	</td>
	</tr>  --->
	
	<tr>
		<td bgcolor=white width=790 align=right valign=top colspan = 3>
			<NOBR><input type=image border=0 src="./images/button_modify_01.gif"> &nbsp;&nbsp;&nbsp;&nbsp;</NOBR>
		</td>
	</tr>	
	
	
 </table> 
	
	</CFOUTPUT>
	
</CFFORM>
	
	
	
	
	
	
<!--- ============================== --->
<!--- ===/       NOTICES        \=== --->
<!--- ============================== --->

<p>

<table width=790 cellpadding=1 cellspacing=1 border=0>
	<tr>
		<td bgcolor=white width=790 align=center valign=top>
			<font size=1 color=black face=verdana>
				<NOBR>HUD CERTIFICATION OF BUYER AND SELLER</NOBR>				
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=790 align=left valign=top>
			<font size=1 color=black face=verdana>
			<p><br>
				I have carefully reviewed the HUD-1 Settlement Statement and to the best of my knowledge and belief, it is a true and accurate statement of all reciepts and disbursements made on my account or by me in this transaction. I further certify that I have received a copy of the HUD-1 Settlement Statement. I agree to further adjustments in the event of any errors or omissions and indemnify and hold harmless Settlement Agent against any such error or omissions<br> 				
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=790 align=left valign=top>
			<font size=1 color=black face=verdana>
			<p><br>
			<p><br>
				<NOBR>____________________________________________________________</NOBR><br>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=790 align=left valign=top>
			<font size=1 color=black face=verdana>
			<p><br>
			<p><br>
				<NOBR>____________________________________________________________</NOBR><br>
		</td>
	</tr>
</table>

<table width=790 cellpadding=1 cellspacing=1 border=0>
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

	<tr>
		<td bgcolor=white width=790 align=left valign=top>
			<font size=1 color=black face=verdana>
			<p><br>
				<NOBR>_____________________________________________________________________________________________________________________________</NOBR><br>
				<nobr>First Title and Escrow, Inc. --  Printed <font size=1 color=black face=verdana><b> June 21, 2001 at 14:30</b></FONT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;REV. HUD-1 (3/86)</NOBR>
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
