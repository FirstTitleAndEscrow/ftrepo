


<CFQUERY datasource="#request.dsn#" NAME="read_data">
	UPDATE hud_form_prop_pg1
	SET a_1 = '#a_1#',
		A_7 = '#A_7#',
		A_8 = '#A_8#',
		D_BName = '#D_BName#',
		D_BAddr = '#D_BAddr#',
		E_SName = '#E_SName#',
		E_SAddr = '#E_SAddr#',
		F_LName = '#F_LName#',
		F_LAddr = '#F_LAddr#',
		G_PropAddr = '#G_PropAddr#',
		I_SettlementDate = '#I_SettlementDate#',
		A_101 = '#A_101#',
		A_102 = '#A_102#',
		A_103 = '#A_103#',
		A_104_a = '#A_104_a#',
		A_104_b = '#A_104_b#',
		A_105_a = '#A_105_a#',
		A_105_b = '#A_105_b#',
		A_106 = '#A_106#',
		A_107 = '#A_107#',
		A_108 = '#A_108#',
		A_109_a = '#A_109_a#',
		A_109_b = '#A_109_b#',
		A_110_a = '#A_110_a#',
		A_110_b = '#A_110_b#',
		A_111_a = '#A_111_a#',
		A_111_b = '#A_111_b#',
		A_112_a = '#A_112_a#',
		A_112_b = '#A_112_b#',
		A_120 = '#A_120#',
		A_201 = '#A_201#',
		A_202 = '#A_202#',
		A_203 = '#A_203#',
		A_204_a = '#A_204_a#',
		A_204_b = '#A_204_b#',
		A_205_a = '#A_205_a#',
		A_205_b = '#A_205_b#',
		A_206_a = '#A_206_a#',
		A_206_b = '#A_206_b#',
		A_207_a = '#A_207_a#',
		A_207_b = '#A_207_b#',
		A_208_a = '#A_208_a#',
		A_208_b = '#A_208_b#',
		A_209_a = '#A_209_a#',
		A_209_b = '#A_209_b#',
		A_210 = '#A_210#',
		A_211 = '#A_211#',
		A_212 = '#A_212#',
		A_213_a = '#A_213_a#',
		A_213_b = '#A_213_b#',
		A_214_a = '#A_214_a#',
		A_214_b = '#A_214_b#',
		A_215_a = '#A_215_a#',
		A_215_b  = '#A_215_b #',
		A_216_a = '#A_216_a#',
		A_216_b  = '#A_216_b #',
		A_217_a = '#A_217_a#',
		A_217_b  = '#A_217_b #',
		A_218_a = '#A_218_a#',
		A_218_b  = '#A_218_b #',
		A_219_a = '#A_219_a#',
		A_219_b  = '#A_219_b #',
		A_220 = '#A_220#',
		A_301 = '#A_301#',
		A_302 = '#A_302#',
		A_303 = '#A_303#',
		A_401 = '#A_401#',
		A_402 = '#A_402#',
		A_403_a = '#A_403_a#',
		A_403_b = '#A_403_b#',
		A_404_a = '#A_404_a#',
		A_404_b = '#A_404_b#',
		A_405_a = '#A_405_a#',
		A_405_b = '#A_405_b#',
		A_406 = '#A_406#',
		A_407 = '#A_407#',
		A_408 = '#A_408#',
		A_409_a = '#A_409_a#',
		A_409_b = '#A_409_b#',
		A_410_a = '#A_410_a#',
		A_410_b = '#A_410_b#',
		A_411_a = '#A_411_a#',
		A_411_b = '#A_411_b#',
		A_412_a = '#A_412_a#',
		A_412_b = '#A_412_b#',
		A_420 = '#A_420#',
		A_501 = '#A_501#',
		A_502 = '#A_502#',
		A_503 = '#A_503#',
		A_504 = '#A_504#',
		A_505 = '#A_505#',
		A_506_a = '#A_506_a#',
		A_506_b = '#A_506_b#',
		A_507_a = '#A_507_a#',
		A_507_b = '#A_507_b#',
		A_508_a = '#A_508_a#',
		A_508_b = '#A_508_b#',
		A_509_a = '#A_509_a#',
		A_509_b = '#A_509_b#',
		A_510 = '#A_510#',
		A_511 = '#A_511#',
		A_512 = '#A_512#',
		A_513_a = '#A_513_a#',
		A_513_b = '#A_513_b#',
		A_514_a = '#A_514_a#',
		A_514_b = '#A_514_b#',
		A_515_a = '#A_515_a#',
		A_515_b = '#A_515_b#',
		A_516_a = '#A_516_a#',
		A_516_b = '#A_516_b#',
		A_517_a = '#A_517_a#',
		A_517_b = '#A_517_b#',
		A_518_a = '#A_518_a#',
		A_518_b = '#A_518_b#',
		A_519_a = '#A_519_a#',
		A_519_b = '#A_519_b#',
		A_520 = '#A_520#',
		A_601 = '#A_601#',
		A_602 = '#A_602#',
		A_603 = '#A_603#',
		Fed_tax_id_no = '#Fed_tax_id_no#',
		seller_new_addr = '#seller_new_addr#',
		seller_new_home_phone = '#seller_new_home_phone#',
		seller_new_work_phone = '#seller_new_work_phone	#'

		WHERE prop_ID = 36

</CFQUERY>

<!--- =================================== --->

		<CFQUERY datasource="#request.dsn#" NAME="read_data">
			SELECT *
			FROM hud_form_prop_pg1
			WHERE prop_ID = 36
		</CFQUERY>


<!--- =================================== --->



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
		
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

	<tr>
			<td width=790 align=left valign=top bgcolor=maroon>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Property Report</B></CENTER>
			</TD>
		</TR>
	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>
		


		<CFINCLUDE TEMPLATE="./includes/prop_top_nav.cfm">


	
	


		</td>
	</tr>

	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>
			<font size=2 color=green face=verdana>
			<B>The HUD form Page ( 1 ) has been updated successfully!</B>
			<p>



<CFOUTPUT query="read_data">

<CFFORM METHOD=POST ACTION="./prop_modify_hud_pg1_submit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">


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


<table width=800 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
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
					clear: none;" ></NOBR>
				
		</td>
	</tr>

<!--- ===/ NAME OF SELLER \=== --->

	<tr>
		<td bgcolor=white colspan=4 width=800 align=left valign=top>
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
		<td bgcolor=white colspan=4 width=800 align=left valign=top>
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
		<td bgcolor=white colspan=4 width=800 align=left valign=top>
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
		<td bgcolor=white colspan=4 width=800 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr><b>H.</b> Settlement Agent:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=1 color=blue face=verdana>&nbsp;&nbsp;&nbsp;<b>First Title and Escrow, Inc.</b></font></NOBR><br>
				<nobr><font size=1 color=black face=arial>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Place of Settlement:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size=1 color=blue face=verdana><b>51 Monroe St - Suite 1101 - Rockville MD 20850 - Montgomery County</b></NOBR><br>
				
		</td>
	</tr>

<!--- ===/ SETTLEMENT DATE \=== --->

	<tr>
		<td bgcolor=white colspan=4 width=800 align=left valign=top>
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
								VALUE="#a_420#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
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
								VALUE="#a_502#"
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
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
		<td bgcolor=white width=800 align=left valign=top>
			<font size=1 color=black face=verdana>
			<p><br>
				<NOBR>TIN:  #Fed_tax_id_no#/______________________ Seller(s) Signature(s)_______________________________________________</NOBR><br>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=800 align=left valign=top>
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
		<td bgcolor=white width=800 align=left valign=top>
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

	<tr>
		<td bgcolor=white width=800 align=right valign=top>
			<NOBR><input type=image border=0 src="./images/button_modify_01.gif"> &nbsp;&nbsp;&nbsp;&nbsp;</NOBR>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=800 align=left valign=top>
			<font size=1 color=black face=verdana>
			<p><br>
				<NOBR>_____________________________________________________________________________________________________________________________</NOBR><br>
				<nobr>First Title and Escrow, Inc. --  Printed <font size=1 color=black face=verdana><b> June 21, 2001 at 14:30</b></FONT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;REV. HUD-1 (3/86)</NOBR>
		</td>
	</tr>
	
	
</table>

</CFFORM>

		</td>
	</tr>
	
	
</table>


		</td>
	</tr>
	
	
</table>
</CFOUTPUT>

</BODY>
</HTML>
