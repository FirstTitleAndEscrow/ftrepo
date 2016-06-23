		<CFQUERY datasource="#request.dsn#" NAME="read_data">
			SELECT *
			FROM hud_form_prop_pg2
			WHERE Prop_ID = #rec_id#
		</CFQUERY>


<!--- =================================== --->






<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE></TITLE>

</HEAD>

<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" marginheight=0 marginwidth=0 topmargin=0 leftmargin=0>


<CFOUTPUT>


<CENTER>
<table width=800 cellpadding=1 cellspacing=1 border=0>
	<tr>
		<td bgcolor=white width=800 align=left valign=top>
			<font size=1 color=black face=verdana>
				<NOBR>U.S. DEPARTMET OF HOUSING AND URBAN DEVELOPMENT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;File Number:<font size=1 color=blue face=verdana><b>#read_data.prop_id#</font></b></NOBR><br>
				<font size=2 color=black face=times><NOBR><b>Settlement Statement</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<font size=1 color=black face=verdana>Page 2</NOBR>
		</td>
	</tr>
</table>

<table width=800 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

<!--- ===/ NOTE \=== --->

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr><b>L.</b> SETTLEMENT CHARGES

			<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=e3e3e3>
				<tr>
					<td width=499 align=left valign=top bgcolor=white>
						<font size=1 color=black face=arial>
						<nobr>700. TOTAL SALES/BROKER'S COMMISSION based on price &nbsp;&nbsp;&nbsp;&nbsp;$ <font size=1 color=blue face=verdana><b>#read_data.a_700_a#</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@&nbsp;&nbsp;&nbsp;<font size=1 color=blue face=verdana><b>#read_data.a_700_b#</b> </font>= <font size=1 color=blue face=verdana><b>#read_data.a_700_c#</b></NOBR>
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
						<nobr>701. &nbsp;&nbsp;$<font size=1 color=blue face=verdana><b>#read_data.a_701_a#</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>to <font size=1 color=blue face=verdana> <b>#read_data.a_701_b#</b></NOBR>
					</td>
				</tr>

				<tr>
					<td width=499 align=left valign=top bgcolor=white>
						<font size=1 color=black face=arial>
						<nobr>702. &nbsp;&nbsp;$<font size=1 color=blue face=verdana> <b>#read_data.a_702_a#</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>to <font size=1 color=blue face=verdana> <b>#read_data.a_702_b#</b></NOBR>
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
			<b>#read_data.a_703_a#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_703_b#</b>

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
			<b>#read_data.a_801_a#</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_801_b#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_801_c#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;802. Loan Discount &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%<font size=1 color=blue face=verdana>
			<b>#read_data.a_802_a#</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_802_b#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_802_c#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;803. Appraisal Fee</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_803_b#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_803_c#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;804. Credit Report</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_804_b#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_804_c#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;805. #read_data.a_805_a#</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_805_b#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_805_c#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;806. #read_data.a_806_a#</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_806_b#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_806_c#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;807. #read_data.a_807_a#</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_807_b#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_807_c#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;808. #read_data.a_808_a#</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_808_b#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_808_c#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;809. #read_data.a_809_a#</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_809_b#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_809_b#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;810. #read_data.a_810_a#</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_810_b#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_810_c#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;811. #read_data.a_811_a#</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_811_b#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_811_c#</b>

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
			<b>#read_data.a_901_a#</b></font>&nbsp;&nbsp;&nbsp;to &nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<b>#read_data.a_901_b#</b></font>&nbsp;&nbsp; @ $ <font size=1 color=blue face=verdana>
			<b>#read_data.a_901_c#</b> </font> &nbsp;&nbsp;/day</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_901_d#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_901_e#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;902. Mortgage Insurance Premium for&nbsp;&nbsp;<font size=1 color=blue face=verdana><b>#read_data.a_902_a#</b> </font>&nbsp;&nbsp;&nbsp; to <font size=1 color=blue face=verdana>
			<b>#read_data.a_902_b#</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_902_c#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_902_d#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;903. Hazard Insurance Premium for &nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<b>#read_data.a_903_a#</b></font> &nbsp;&nbsp;&nbsp; to <font size=1 color=blue face=verdana>
			<b>#read_data.a_903_b#</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_903_c#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_903_d#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;904. #read_data.a_904_a#</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_904_b#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_904_c#</b>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;905. Lender's Inspection Fee</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_905_a#</b>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_905_b#</b>

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
			<b>#read_data.a_1001_a#</b></font>mo. @ $&nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<b>#read_data.a_1001_b#</b></font>&nbsp;&nbsp;/mo</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1001_c#</b></font>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1001_d#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1002. Mortgage Insurance&nbsp;&nbsp; <font size=1 color=blue face=verdana>
			<b>#read_data.a_1002_a#</b></font>mo. @ $&nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<b>#read_data.a_1002_b#</b></font>&nbsp;&nbsp;/mo</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1002_c#</b></font>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1002_d#</b></font>

		</td>
	</tr>


	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1003. City Property Taxes&nbsp;&nbsp; <font size=1 color=blue face=verdana>
			<b>#read_data.a_1003_a#</b></font>mo. @ $&nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<b>#read_data.a_1003_b#</b></font>&nbsp;&nbsp;/mo</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1003_c#</b></font>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1003_d#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1004. County Property Taxes&nbsp;&nbsp; <font size=1 color=blue face=verdana>
			<b>#read_data.a_1004_a#</b></font>mo. @ $&nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<b>#read_data.a_1004_b#</b></font>&nbsp;&nbsp;/mo</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1004_c#</b></font>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1004_d#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1005. Annual Assessments&nbsp;&nbsp; <font size=1 color=blue face=verdana>
			<b>#read_data.a_1005_a#</b></font>mo. @ $&nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<b>#read_data.a_1005_b#</b></font>&nbsp;&nbsp;/mo</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1005_c#</b></font>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1005_d#</b></font>

		</td>
	</tr>



	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1006. Aggragate Analysis Adjustment</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1006_a#</b></font>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1006_b#</b></font>

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
				<nobr>&nbsp;1101. Settlement or closing fee</NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1101_a#</b></font>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1101_b#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1102. Abstract or Title Search&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to <font size=1 color=black face=verdana><b>First Title Services, LLC</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1102_a#</b></font>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1103_b#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1103. Title Examination</NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1103_a#</b></font>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1103_b#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1104. Title Insurance Binder</NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1104_a#</b></font>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1104_b#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1105. Document Preparation</NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1105_a#</b></font>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1105_b#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1106. Notary Fees</NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1106_a#</b></font>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1106_b#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1107. Attorney's Fees</NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1107_a#</b></font>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1107_b#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(includes above items No.&nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<b>#read_data.a_1107_c#</b></font>)</NOBR>
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
			<b>#read_data.a_1108_a#</b></font>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1108_b#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(includes above items No.&nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<b>#read_data.a_1108_c#</b></font>)</NOBR>
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
			<b>#read_data.a_1109_a#</b></font></NOBR>
					</td>
				</tr>

				<tr>
					<td width=499 align=left valign=top bgcolor=white>
						<font size=1 color=black face=arial>
						<nobr>&nbsp;1110. Owner's Coverage $ <font size=1 color=blue face=verdana>
			<b>#read_data.a_1110_a#</b></font></NOBR>
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
			#read_data.a_1111_a#</font></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1111_b#</b></font>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1111_c#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1112.  <font size=1 color=blue face=verdana>
			#read_data.a_1112_a#</font></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1112_b#</b></font>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1112_c#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1113.  <font size=1 color=blue face=verdana>
			#read_data.a_1113_a#</font></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1113_b#</b></font>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1113_c#</b></font>

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
			<b>#read_data.a_1201_a#</b></font>&nbsp;&nbsp; Mortgage $  &nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<b>#read_data.a_1201_b#</b></font>&nbsp;&nbsp;&nbsp;: Release $ <font size=1 color=blue face=verdana>
			<b>#read_data.a_1201_c#</b></font></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1201_d#</b></font>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1201_e#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1202. City/County tax/Stamps: &nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<b>#read_data.a_1202_a#</b></font>&nbsp;&nbsp;Deed $ &nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<b>#read_data.a_1202_b#</b></font>&nbsp;&nbsp;: Mortgage $ <font size=1 color=blue face=verdana>
			<b>#read_data.a_1202_c#</b></font> </NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1202_d#</b></font>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1202_e#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1203. State tax/Stamps: &nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<b>#read_data.a_1203_a#</b></font>&nbsp;&nbsp;Deed $ &nbsp;&nbsp;<font size=1 color=blue face=verdana>
			<b>#read_data.a_1203_b#</b></font>&nbsp;&nbsp;: Mortgage $ <font size=1 color=blue face=verdana>
			<b>#read_data.a_1203_c#</b></font></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1203_d#</b></font>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1203_e#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1204.  <font size=1 color=blue face=verdana>
			#read_data.a_1204_a#</font></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1204_b#</b></font>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1204_c#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1205.  <font size=1 color=blue face=verdana>
			#read_data.a_1205_a#</font></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1205_b#</b></font>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1205_c#</b></font>

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
			<b>#read_data.a_1301_a#</b></font>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1301_b#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1302. Pest Inspection</NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1302_a#</b></font>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1302_b#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1303.  <font size=1 color=blue face=verdana>
			#read_data.a_1303_a#</font></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1303_b#</b></font>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1303_c#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1304.  <font size=1 color=blue face=verdana>
			#read_data.a_1304_a#</font></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1304_b#</b></font>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1304_c#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1305.  <font size=1 color=blue face=verdana>
			#read_data.a_1305_a#</font></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1305_b#</b></font>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1305_c#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1306.  <font size=1 color=blue face=verdana>
			#read_data.a_1306_a#</font></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1306_b#</b></font>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1306_c#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1307.  <font size=1 color=blue face=verdana>
			#read_data.a_1307_a#</font></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1307_b#</b></font>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1307_c#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1308.  <font size=1 color=blue face=verdana>
			#read_data.a_1308_a#</font></NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1308_b#</b></font>


		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1308_c#</b></font>

		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1400. TOTAL SETTLEMENT CHARGES (enter on lines 103, Section J and 502 Section K)</NOBR>
		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1400_a#</b></font>

		</td>

		<td bgcolor=white width=150 align=right valign=top>
			<font size=1 color=blue face=verdana>
			<b>#read_data.a_1400_b#</b></font>

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
		<td bgcolor=white width=800 align=center valign=top>
			<font size=1 color=black face=verdana>
				<NOBR>HUD CERTIFICATION OF BUYER AND SELLER</NOBR>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=800 align=left valign=top>
			<font size=1 color=black face=verdana>
			<p><br>
				I have carefully reviewed the HUD-1 Settlement Statement and to the best of my knowledge and belief, it is a true and accurate statement of all reciepts and disbursements made on my account or by me in this transaction. I further certify that I have received a copy of the HUD-1 Settlement Statement. I agree to further adjustments in the event of any errors or omissions and indemnify and hold harmless Settlement Agent against any such error or omissions<br>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=800 align=left valign=top>
			<font size=1 color=black face=verdana>
			<p><br>
			<p><br>
				<NOBR>____________________________________________________________</NOBR><br>
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=800 align=left valign=top>
			<font size=1 color=black face=verdana>
			<p><br>
			<p><br>
				<NOBR>____________________________________________________________</NOBR><br>
		</td>
	</tr>
</table>

<table width=800 cellpadding=1 cellspacing=1 border=0>
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



<table width=800 cellpadding=1 cellspacing=1 border=0>
	<tr>
		<td bgcolor=white width=400 align=left valign=top>
			<font size=1 color=black face=verdana>
			<p><br>
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
