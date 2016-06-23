		<CFQUERY datasource="#request.dsn#" NAME="read_data">
			SELECT *
			FROM hud_form_prop_pg2
			WHERE prop_ID = #rec_id#
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


<CFOUTPUT query="read_data">

<CFFORM METHOD=POST ACTION="./prop_modify_hud_pg2_submit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#">


<CENTER>
<CENTER>
<table width=800 cellpadding=1 cellspacing=1 border=0>
	<tr>
		<td bgcolor=white width=800 align=left valign=top>
			<font size=1 color=black face=verdana>
				<NOBR>U.S. DEPARTMENT OF HOUSING AND URBAN DEVELOPMENT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;File Number:<font size=1 color=blue face=verdana><b>#read_data.prop_id#</font></b></NOBR><br>
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
		<td bgcolor=white colspan=3 width=800 align=left valign=top>
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
		<td bgcolor=white colspan=3 width=800 align=left valign=top>
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
		<td bgcolor=white colspan=3 width=800 align=left valign=top>
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

		<td bgcolor=white width=150 align=center valign=top>
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
		</td>

		<td bgcolor=white width=150 align=right valign=top>
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
		</td>
	</tr>	
	

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1102. Abstract or Title Search&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to <font size=1 color=black face=verdana><b>First Title Services, LLC</b></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
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
		</td>

		<td bgcolor=white width=150 align=right valign=top>
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
		</td>
	</tr>	

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1103. Title Examination</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
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
		</td>

		<td bgcolor=white width=150 align=right valign=top>
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
		</td>
	</tr>	

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1104. Title Insurance Binder</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
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
		</td>

		<td bgcolor=white width=150 align=right valign=top>
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
		</td>
	</tr>	

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1105. Document Preparation</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
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
		</td>

		<td bgcolor=white width=150 align=right valign=top>
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
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1106. Notary Fees</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
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
		</td>

		<td bgcolor=white width=150 align=right valign=top>
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
		</td>
	</tr>	

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1107. Attorney's Fees</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
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
		</td>

		<td bgcolor=white width=150 align=right valign=top>
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
		</td>

		<td bgcolor=white width=150 align=right valign=top>
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
					<CFINPUT type="text" NAME="a_1111_a" SIZE=61 MAXLENGTH=199 
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
							clear: none;" ></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
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
		</td>

		<td bgcolor=white width=150 align=right valign=top>
					<CFINPUT type="text" NAME="a_1111_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1111_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
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
				<nobr>&nbsp;1112. 
					<CFINPUT type="text" NAME="a_1112_a" SIZE=61 MAXLENGTH=199 
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
							clear: none;" ></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
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
		</td>

		<td bgcolor=white width=150 align=right valign=top>
					<CFINPUT type="text" NAME="a_1112_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1112_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
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
				<nobr>&nbsp;1113. 
					<CFINPUT type="text" NAME="a_1113_a" SIZE=61 MAXLENGTH=199 
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
							clear: none;" ></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
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
		</td>

		<td bgcolor=white width=150 align=right valign=top>
					<CFINPUT type="text" NAME="a_1113_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1113_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
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
		<td bgcolor=white colspan=3 width=800 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1200. GOVERNMENT RECORDING AND TRANSFER CHARGES
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1201. Recording Fees Deed $ &nbsp;&nbsp;
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
				</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
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
		</td>

		<td bgcolor=white width=150 align=right valign=top>
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
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1202. City/County tax/Stamps: &nbsp;
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
				</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
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
		</td>

		<td bgcolor=white width=150 align=right valign=top>
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
								
		</td>
	</tr>

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1203. State tax/Stamps: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
				</NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
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
		</td>

		<td bgcolor=white width=150 align=right valign=top>
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
		</td>

		<td bgcolor=white width=150 align=right valign=top>
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
		</td>
	</tr>	

	<tr>
		<td bgcolor=white width=500 align=left valign=top>
			<font size=1 color=black face=arial>
				<nobr>&nbsp;1205. 
					<CFINPUT type="text" NAME="a_1205_a" SIZE=61 MAXLENGTH=199 
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
							clear: none;" ></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
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
		</td>

		<td bgcolor=white width=150 align=right valign=top>
					<CFINPUT type="text" NAME="a_1205_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1205_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
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
					<CFINPUT type="text" NAME="a_1303_a" SIZE=61 MAXLENGTH=199 
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
							clear: none;" ></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
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
		</td>

		<td bgcolor=white width=150 align=right valign=top>
					<CFINPUT type="text" NAME="a_1303_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1303_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
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
				<nobr>&nbsp;1304. 
					<CFINPUT type="text" NAME="a_1304_a" SIZE=61 MAXLENGTH=199 
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
							clear: none;" ></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
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
		</td>

		<td bgcolor=white width=150 align=right valign=top>
					<CFINPUT type="text" NAME="a_1304_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1304_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
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
				<nobr>&nbsp;1305. 
					<CFINPUT type="text" NAME="a_1305_a" SIZE=61 MAXLENGTH=199 
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
							clear: none;" ></NOBR>
		</td>

		<td bgcolor=white width=150 align=center valign=top>
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
		</td>

		<td bgcolor=white width=150 align=right valign=top>
					<CFINPUT type="text" NAME="a_1305_c" SIZE=19 MAXLENGTH=199 
							VALUE="#a_1305_c#"
							style="font-size: 9; 
							font-family: verdana; 
							font-style: normal; 
							color: 003F1E; 
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
</table>
	
	
	
		</td>
	</tr>
	
	<tr>
		<td bgcolor=white width=800 align=right valign=top>
			<NOBR><input type=image border=0 src="./images/button_modify_01.gif"> &nbsp;&nbsp;&nbsp;&nbsp;</NOBR>
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