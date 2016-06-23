<cffunction name="FixDecimals" >
	<cfargument name="input_num">
	<cfif IsNumeric(arguments.input_num) and arguments.input_num neq 0>
		<cfset new_num = NumberFormat(arguments.input_num, "_,___,___,___.__")>
	<cfelse>
		<cfset new_num = "">
	</cfif>
	<cfif arguments.input_num eq 0>
		<cfset new_num = "">
	</cfif>
	<cfreturn new_num>
</cffunction>

<cfparam name="url.rec_id" type="integer" default="0">
<cfparam name="form.rec_id" type="integer" default="#url.rec_id#">

<CFQUERY datasource="#request.dsn#" NAME="get_title_data">
	SELECT title_id, loan_number, paddress, pcounty, pcity, pstate, pzip, comp_id, share_loan_payoff, order_date, last_fees_date
	FROM title
	WHERE Title_ID = #form.rec_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_hud_data">
	SELECT *
	FROM HUD2010_TITLE_DATA
	WHERE Title_ID = #form.rec_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_hud_data_b">
	SELECT *
	FROM HUD2010_TITLE_DATA_B
	WHERE Title_ID = #form.rec_id#
</CFQUERY>
<!---
<cfdump var="#get_title_data#" expand="no" label="get_title_data">
<cfdump var="#get_hud_data#" expand="no" label="get_hud_data">
<cfdump var="#get_hud_data_b#" expand="no" label="get_hud_data_b">
--->

<cfoutput>
</center>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"https://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Settlement Statement (HUD-1)</title>
<style type="text/css">
<!--
body { margin:0px;padding:0px;font-family:arial,sans-serif;font-size:10px;}
table { font-size:9px; }
td { padding: 1px; }
img { margin-bottom: 5px ;}
p.pagebreak { page-break-before:always }
.loantype { border:1px solid black; }
.page_container { width: 670px; }
.page_title { font-size:20px; }
.gray_title { font-size:12px; color:##CCCCCC; }
.table_header { font-weight:bold; background-color:black; color:white; }
.bsilver { border-right:1px solid black; border-left:1px solid black; border-bottom:1px solid black;  background-color:##dddddd; }
.bdarksilver { border:1px solid black; background-color:##bbbbbb; }
.bdarksilver_head { border:1px solid black; font-weight:bold; background-color:##bbbbbb; }
.black { font-weight:bold; background-color:black; color:white; }
.bordered { border-bottom:1px solid black; border-right:1px solid black; text-align:right; vertical-align:bottom;  }
.bordered_wleft { border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; text-align:right; vertical-align:bottom;  }
.fourthpage { border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; text-align:left; vertical-align:top;  }
.fourthpageright { border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; text-align:right; vertical-align:top;  }
.fourthpagecenter { border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; text-align:center; vertical-align:top;  }
.fourthpagenoright { border-bottom:1px solid black; border-left:1px solid black; border-right:0px solid black; text-align:right; vertical-align:top;  }
.fourthpagenoleft { border-bottom:1px solid black; border-left:0px solid black; border-right:1px solid black; text-align:left; vertical-align:top;  }
.entry { color: blue; height: 9px; }
-->
</style>
	</head>
	<body>

<div class="page_container">

<form>
<cfif get_title_data.last_fees_date eq '' or get_title_data.last_fees_date eq 'NULL'>
<cfset date_to_use = get_title_data.order_date>
<cfelse>
<cfset date_to_use = get_title_data.last_fees_date>
</cfif>
<img alt="HUD Logo" src="https://#cgi.server_name#/HUD%20Logo.png" height="64" width="70" />
<div style="position:absolute;top:24;left:82"><span class="page_title">A. Settlement Statement (HUD-1)</span></div>
<div style="position:absolute;top:23;left:518"><span>OMB Approval No. 2502-0265</span></div>
<div style="position:absolute;top:38;left:518"><span class="gray_title">DRAFT - QUOTE VALID UNTIL #DateFormat(DateAdd("d", 60, date_to_use), "mm/dd/yyyy")#</span></div>

<!-- TABLE: Type of Loan -->
<table class="loantype" width="100%" summary="Type of Loan" cellspacing="0">
<tr>
<td valign="top" colspan="4" class="black">B. Type of Loan</td>
</tr>
<tr>
<td valign="top" class="loantype">
	<table summary="Loan Types" cellpadding="0" cellspacing="0">
	<tr>
	<td><input type="checkbox" name="B_LOANTYPE" value="FHA" <cfif get_hud_data.B_LOANTYPE eq 'FHA'>checked</cfif> /></td><td>FHA</td>
	<td><input type="checkbox" name="B_LOANTYPE" value="RHS" <cfif get_hud_data.B_LOANTYPE eq 'RHS'>checked</cfif> /></td><td>RHS</td>
	<td><input type="checkbox" name="B_LOANTYPE" value="COU" <cfif get_hud_data.B_LOANTYPE eq 'COU'>checked</cfif> /></td><td>Conv. Unins.</td>
	<tr>
	<tr>
	<td><input type="checkbox" name="B_LOANTYPE" value="VA" <cfif get_hud_data.B_LOANTYPE eq 'VA'>checked</cfif> /></td><td>VA</td>
	<td><input type="checkbox" name="B_LOANTYPE" value="COI" <cfif get_hud_data.B_LOANTYPE eq 'COI'>checked</cfif> /></td><td>Conv. Ins.</td>
	<tr>
	</table>
</td>
<td valign="top" class="loantype">6. File Number:<br /><span class="entry">#get_title_data.title_id#</span></td>
<td valign="top" class="loantype">7. Loan Number:<br /><span class="entry">#get_title_data.loan_number#</span></td>
<td valign="top" class="loantype">8. Mortgage Insurance Case Number: <br /><span class="entry">#get_hud_data.B_8_CASENUMBER#</span></td>
</tr>
<tr>
<td valign="top" class="loantype" colspan="4"><b>C. Note:</b> This form is furnished to give you a statement of actual settlement costs. Amounts paid to and by the settlement agent are shown. Items marked
"(p.o.c.)" were paid outside the closing; they are shown here for informational purposes and are not included in the totals.</td>
</tr>
<tr>
<td valign="top" class="loantype">D. Name &amp; Address of Borrower: <br /> <span class="entry">#get_hud_data.D_BORROWERNAMEADDRESS#</span> </td>
<td valign="top" class="loantype" colspan="2">E. Name &amp; Address of Seller: <br /> <span class="entry">#get_hud_data.E_SELLERNAMEADDRESS#</span></td>
<td valign="top" class="loantype">F. Name &amp; Address of Lender: <br /> <span class="entry">#get_hud_data.F_LENDERNAMEADDRESS#</span> </td>
</tr>
<tr>
<td valign="top" class="loantype" rowspan="2" valign="top">G. Property Location: <br />
<span class="entry">#get_title_data.PADDRESS#</span><br />
<!---<span class="entry">#get_title_data.PCOUNTY#</span><br />--->
<span class="entry">#get_title_data.PCITY#</span>
<span class="entry">#get_title_data.PSTATE#</span>
<span class="entry">#get_title_data.PZIP#</span>
</td>
<td valign="top" class="loantype" colspan="2">H. Settlement Agent: <br /> <span class="entry">#get_hud_data.H_SETTLEMENTAGENT#</span> </td>
<td valign="top" class="loantype">I. Settlement Date: <br /> <span class="entry"><cfif get_hud_data.I_1_SETTLEMENTDATE NEQ 'NULL'>#DateFormat(get_hud_data.I_1_SETTLEMENTDATE, 'm/d/yyyy')#</cfif></span></td>
</tr>
<tr>
<td valign="top" class="loantype" colspan="2">Place of Settlement: <br /> <span class="entry">#get_hud_data.I_2_SETTLEMENTADDRESS#</span></td>
<td valign="top" class="loantype">&nbsp;</td>
</tr>
</table><!-- TABLE: Type of Loan -->

<br />

<!-- TABLE: Summary of Transactions -->
<table width="100%" cellspacing="0" border="0" summary="Summary of Transactions">
<tr>
<td colspan="2" class="table_header" width="50%">J. Summary of Borrower's Transaction</td>
<td>&nbsp;  </td>
<td colspan="2" class="table_header" width="50%">K. Summary of Seller's Transaction</td>
</tr>
<tr><td height="1" colspan="2"></td><td></td><td height="1" colspan="2"></td></tr>
<tr>
<td colspan="2" class="bdarksilver_head">100. Gross Amount Due from Borrower</td>
<td></td>
<td colspan="2" class="bdarksilver_head">400. Gross Amount Due to Seller</td>
</tr>
<tr>
<td class="bsilver">101. Contract sales price</td>
<td class="bordered" width="10%"><span class="entry">#FixDecimals(Trim(get_hud_data.A_0101_CONTRACTSALESPRICE), "___,___.00")#</span></td>
<td></td>
<td class="bsilver">401. Contract sales price</td>
<td class="bordered" width="10%"><span class="entry">#FixDecimals(get_hud_data.A_0401_CONTRACTSALESPRICE, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">102. <cfif (get_title_data.comp_id eq 3722 or get_title_data.comp_id eq 4702 or get_title_data.comp_id eq 4752) and Len(get_title_data.share_loan_payoff)>Personal Share Loan Payoff<cfelse>Personal property</cfif></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0102_PERSONALPROPERTY, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">402. Personal property</td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0402_PERSONALPROPERTY, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">103. Settlement charges to borrower (line 1400)</td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0103_SETTLEMENTCHARGESTOBORROWER, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">403. <span class="entry">#get_hud_data.A_0403_USERDESC#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0403_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">104.<span class="entry">#get_hud_data.A_0104_USERDESC#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0104_USERAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">404.<span class="entry">#get_hud_data.A_0404_USERDESC#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0404_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">105.<span class="entry">#get_hud_data.A_0105_USERDESC#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0105_USERAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">405. <span class="entry">#get_hud_data.A_0405_USERDESC#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0405_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver" colspan="2" style="font-weight:bold;">Adjustment for items paid by seller in advance</td>
<td></td>
<td class="bsilver" colspan="2" style="font-weight:bold;">Adjustments for items paid by seller in advance</td>
</tr>
<tr>
<td class="bsilver">106. City/town taxes
<span class="entry"><cfif get_hud_data.A_0106_CITYTOWNTAXESDATEFROM NEQ 'NULL'>#DateFormat(get_hud_data.A_0106_CITYTOWNTAXESDATEFROM, 'm/d/yyyy')#</cfif></span>
to <span class="entry"><cfif get_hud_data.A_0106_CITYTOWNTAXESDATETO NEQ 'NULL'>#DateFormat(get_hud_data.A_0106_CITYTOWNTAXESDATETO, 'm/d/yyyy')#</cfif></span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0106_CITYTOWNTAXESAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">406. City/town taxes
<span class="entry"><cfif get_hud_data.A_0406_CITYTOWNTAXESDATEFROM NEQ 'NULL'>#DateFormat(get_hud_data.A_0406_CITYTOWNTAXESDATEFROM, 'm/d/yyyy')#</cfif></span>
to <span class="entry"><cfif get_hud_data.A_0406_CITYTOWNTAXESDATETO NEQ 'NULL'>#DateFormat(get_hud_data.A_0406_CITYTOWNTAXESDATETO, 'm/d/yyyy')#</cfif></span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0406_CITYTOWNTAXESAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">107. County taxes
<span class="entry"><cfif get_hud_data.A_0107_COUNTYTAXESDATEFROM NEQ 'NULL'>#DateFormat(get_hud_data.A_0107_COUNTYTAXESDATEFROM, 'm/d/yyyy')#</cfif></span>
to <span class="entry"><cfif get_hud_data.A_0107_COUNTYTAXESDATETO NEQ 'NULL'>#DateFormat(get_hud_data.A_0107_COUNTYTAXESDATETO, 'm/d/yyyy')#</cfif></span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0107_COUNTYTAXESAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">407. County taxes
<span class="entry"><cfif get_hud_data.A_0407_COUNTYTAXESDATEFROM NEQ 'NULL'>#DateFormat(get_hud_data.A_0407_COUNTYTAXESDATEFROM, 'm/d/yyyy')#</cfif></span>
to <span class="entry"><cfif get_hud_data.A_0407_COUNTYTAXESDATETO NEQ 'NULL'>#DateFormat(get_hud_data.A_0407_COUNTYTAXESDATETO, 'm/d/yyyy')#</cfif></span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0407_COUNTYTAXESAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">108. Assessments
<span class="entry"><cfif get_hud_data.A_0108_ASSESSMENTSDATEFROM NEQ 'NULL'>#DateFormat(get_hud_data.A_0108_ASSESSMENTSDATEFROM, 'm/d/yyyy')#</cfif></span>
to <span class="entry"><cfif get_hud_data.A_0108_ASSESSMENTSDATETO NEQ 'NULL'>#DateFormat(get_hud_data.A_0108_ASSESSMENTSDATETO, 'm/d/yyyy')#</cfif></span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0108_ASSESSMENTSAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">408. Assessments
<span class="entry"><cfif get_hud_data.A_0408_ASSESSMENTSDATEFROM NEQ 'NULL'>#DateFormat(get_hud_data.A_0408_ASSESSMENTSDATEFROM, 'm/d/yyyy')#</cfif></span>
to <span class="entry"><cfif get_hud_data.A_0408_ASSESSMENTSDATETO NEQ 'NULL'>#DateFormat(get_hud_data.A_0408_ASSESSMENTSDATETO, 'm/d/yyyy')#</cfif></span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0408_ASSESSMENTSAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">109. <span class="entry">#get_hud_data.A_0109_USERDESC#</span>
 to <span class="entry">#get_hud_data.A_0109_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0109_USERAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">409. <span class="entry">#get_hud_data.A_0409_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0409_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0409_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">110. <span class="entry">#get_hud_data.A_0110_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0110_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0110_USERAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">410. <span class="entry">#get_hud_data.A_0410_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0410_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0410_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">111. <span class="entry">#get_hud_data.A_0111_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0111_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0111_USERAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">411. <span class="entry">#get_hud_data.A_0411_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0411_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0411_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">112. <span class="entry">#get_hud_data.A_0112_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0112_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0112_USERAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">412. <span class="entry">#get_hud_data.A_0412_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0412_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0412_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver" style="font-weight:bold;">120. Gross Amount Due from Borrower</td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0120_GROSS_BORROWER_DUE_AMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver" style="font-weight:bold;">420. Gross Amount Due to Seller</td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0420_GROSS_SELLER_DUE_AMOUNT, "___,___.00")#</span></td>
</tr>

<!-- 200 / 500 -->

<tr>
<td colspan="2" class="bdarksilver_head">200. Amounts Paid by or in Behalf of Borrower</td>
<td></td>
<td colspan="2" class="bdarksilver_head">500. Reductions In Amount Due to Seller</td>
</tr>
<tr>
<td class="bsilver">201. Deposit or earnest money</td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0201_EARNESTMONEYAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">501. Excess deposit (see instructions)</td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0501_EXCESSDEPOSITAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">202. Principal amount of new loan(s)</td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0202_PRINCIPALNEWLOANAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">502. Settlement charges to seller (line 1400)</td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0502_SETTLEMENTCHARGESTOSELLERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">203. Existing loan(s) taken subject to</td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0203_EXISTINGLOANSAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">503. Existing loan(s) taken subject to</td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0503_EXISTINGLOANSAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">204. <span class="entry">#get_hud_data.A_0204_USERDESC#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0204_USERAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">504. Payoff of first mortgage loan</td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0504_PAYOFFFIRSTMORTGAGEAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">205. <span class="entry">#get_hud_data.A_0205_USERDESC#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0205_USERAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">505. Payoff of second mortgage loan</td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0505_PAYOFFSECONDMORTGAGEAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">206. <span class="entry">#get_hud_data.A_0206_USERDESC#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0206_USERAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">506. <span class="entry">#get_hud_data.A_0506_USERDESC#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0506_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">207. <span class="entry">#get_hud_data.A_0207_USERDESC#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0207_USERAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">507. <span class="entry">#get_hud_data.A_0507_USERDESC#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0507_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">208. <span class="entry">#get_hud_data.A_0208_USERDESC#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0208_USERAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">508. <span class="entry">#get_hud_data.A_0508_USERDESC#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0508_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">209. <span class="entry">#get_hud_data.A_0209_USERDESC#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0209_USERAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">509. <span class="entry">#get_hud_data.A_0509_USERDESC#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0509_USERAMOUNT, "___,___.00")#</span></td>
</tr>

<!-- Adjustments 200 / 500 -->

<tr>
<td class="bsilver" colspan="2" style="font-weight:bold;">Adjustments for items unpaid by seller</td>
<td></td>
<td class="bsilver" colspan="2" style="font-weight:bold;">Adjustments for items unpaid by seller</td>
</tr>
<tr>
<td class="bsilver">210. City/town taxes
<span class="entry"><cfif get_hud_data.A_0210_CITYTOWNTAXESDATEFROM NEQ 'NULL'>#DateFormat(get_hud_data.A_0210_CITYTOWNTAXESDATEFROM, 'm/d/yyyy')#</cfif></span>
 to <span class="entry"><cfif get_hud_data.A_0210_CITYTOWNTAXESDATETO NEQ 'NULL'>#DateFormat(get_hud_data.A_0210_CITYTOWNTAXESDATETO, 'm/d/yyyy')#</cfif></span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0210_CITYTOWNTAXESAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">510. City/town taxes
<span class="entry"><cfif get_hud_data.A_0510_CITYTOWNTAXESDATEFROM NEQ 'NULL'>#DateFormat(get_hud_data.A_0510_CITYTOWNTAXESDATEFROM, 'm/d/yyyy')#</cfif></span>
to <span class="entry"><cfif get_hud_data.A_0510_CITYTOWNTAXESDATETO NEQ 'NULL'>#DateFormat(get_hud_data.A_0510_CITYTOWNTAXESDATETO, 'm/d/yyyy')#</cfif></span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0510_CITYTOWNTAXESAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">211. County taxes
<span class="entry"><cfif get_hud_data.A_0211_COUNTYTAXESDATEFROM NEQ 'NULL'>#DateFormat(get_hud_data.A_0211_COUNTYTAXESDATEFROM, 'm/d/yyyy')#</cfif></span>
to <span class="entry"><cfif get_hud_data.A_0211_COUNTYTAXESDATETO NEQ 'NULL'>#DateFormat(get_hud_data.A_0211_COUNTYTAXESDATETO, 'm/d/yyyy')#</cfif></span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0211_COUNTYTAXESAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">511. County taxes
<span class="entry"><cfif get_hud_data.A_0511_COUNTYTAXESDATEFROM NEQ 'NULL'>#DateFormat(get_hud_data.A_0511_COUNTYTAXESDATEFROM, 'm/d/yyyy')#</cfif></span>
to <span class="entry"><cfif get_hud_data.A_0511_COUNTYTAXESDATETO NEQ 'NULL'>#DateFormat(get_hud_data.A_0511_COUNTYTAXESDATETO, 'm/d/yyyy')#</cfif></span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0511_COUNTYTAXESAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">212. Assessments
<span class="entry"><cfif get_hud_data.A_0212_ASSESSMENTSDATEFROM NEQ 'NULL'>#DateFormat(get_hud_data.A_0212_ASSESSMENTSDATEFROM, 'm/d/yyyy')#</cfif></span>
to <span class="entry"><cfif get_hud_data.A_0212_ASSESSMENTSDATETO NEQ 'NULL'>#DateFormat(get_hud_data.A_0212_ASSESSMENTSDATETO, 'm/d/yyyy')#</cfif></span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0212_ASSESSMENTSAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">512. Assessments
<span class="entry"><cfif get_hud_data.A_0512_ASSESSMENTSDATEFROM NEQ 'NULL'>#DateFormat(get_hud_data.A_0512_ASSESSMENTSDATEFROM, 'm/d/yyyy')#</cfif></span>
to <span class="entry"><cfif get_hud_data.A_0512_ASSESSMENTSDATETO NEQ 'NULL'>#DateFormat(get_hud_data.A_0512_ASSESSMENTSDATETO, 'm/d/yyyy')#</cfif></span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0512_ASSESSMENTSAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">213. <span class="entry">#get_hud_data.A_0213_USERDESC#</span>
 to <span class="entry">#get_hud_data.A_0213_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0213_USERAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">513. <span class="entry">#get_hud_data.A_0513_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0513_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0513_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">214. <span class="entry">#get_hud_data.A_0214_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0214_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0214_USERAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">514.  <span class="entry">#get_hud_data.A_0514_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0514_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0514_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">215. <span class="entry">#get_hud_data.A_0215_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0215_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0215_USERAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">515.  <span class="entry">#get_hud_data.A_0515_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0515_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0515_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">216. <span class="entry">#get_hud_data.A_0216_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0216_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0216_USERAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">516.  <span class="entry">#get_hud_data.A_0516_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0516_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0516_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">217. <span class="entry">#get_hud_data.A_0217_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0217_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0217_USERAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">517.  <span class="entry">#get_hud_data.A_0517_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0517_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0517_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">218. <span class="entry">#get_hud_data.A_0218_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0218_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0218_USERAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">518.  <span class="entry">#get_hud_data.A_0518_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0518_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0518_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">219. <span class="entry">#get_hud_data.A_0219_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0219_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0219_USERAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">519. <span class="entry">#get_hud_data.A_0519_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0519_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0519_USERAMOUNT, "___,___.00")#</span></td>
</tr>

<tr>
<td class="bsilver"><br /><b>220. Total Paid by/for Seller</b></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0220_TOTALPAIDBYSELLERAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver"><br /><b>520. Total Reduction Amount Due Seller</b></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0520_REDUCTIONDUESELLERAMOUNT, "___,___.00")#</span></td>
</tr>

<!-- Cash at Settlement -->

<tr>
<td colspan="2" class="bdarksilver_head">300. Cash at Settlement from/to Borrower</td>
<td></td>
<td colspan="2" class="bdarksilver_head">600. Cash at Settlement to/from Seller</td>
</tr>
<tr>
<td class="bsilver">301. Gross amount due from borrower (line 120)</td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0301_GROSSDUEFROMBORROWERAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">601. Gross amount due to seller (line 420)</td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0601_GROSSDUETOSELLERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">302. Less amounts paid by/for borrower (line 220)</td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0302_LESSPAIDBYBORROWERAMOUNT, "___,___.00")#</span></td>
<td></td>
<td class="bsilver">602. Less reductions in amount due seller (line 520)</td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0602_LESSREDUCTIONSDUESELLERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td height="30" valign="middle" class="bsilver" style="font-weight:bold;">303. Cash
<input type="checkbox"  name="A_0303_CASHTOFROM" value="FROM" onclick="document.hud1_form.A_0603_CASHTOFROM[0].checked = true;" <cfif get_hud_data.A_0303_CASHTOFROM eq 'FROM'>CHECKED</cfif> /> From
<input type="checkbox"  name="A_0303_CASHTOFROM" value="TO"   onclick="document.hud1_form.A_0603_CASHTOFROM[1].checked = true;" <cfif get_hud_data.A_0303_CASHTOFROM eq 'TO'>CHECKED</cfif> />To Borrower</td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0303_CASHAMOUNT, "___,___.00")#</span></td>
<td></td>
<td height="30" valign="middle" class="bsilver" style="font-weight:bold;">603. Cash
<input type="checkbox"  name="A_0603_CASHTOFROM" value="TO"   onclick="document.hud1_form.A_0303_CASHTOFROM[0].checked = true;" <cfif get_hud_data.A_0603_CASHTOFROM eq 'TO' >CHECKED</cfif> />To
<input type="checkbox"  name="A_0603_CASHTOFROM" value="FROM" onclick="document.hud1_form.A_0303_CASHTOFROM[1].checked = true;" <cfif get_hud_data.A_0603_CASHTOFROM eq 'FROM' >CHECKED</cfif> />From Seller</td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0603_CASHAMOUNT, "___,___.00")#</span></td>
</tr>

</table><!-- TABLE: Summary of Transactions -->

<br />

<p>The Public Reporting Burden for this collection of information is estimated at 35 minutes per response for collecting, reviewing, and
reporting the data. This agency may not collect this information, and you are not required to complete this form, unless it displays a
currently valid OMB control number. No confidentiality is assured; this disclosure is mandatory. This is designed to provide the parties to
a RESPA covered transaction with information during the settlement process.</p>

<P CLASS="pagebreak"><!-- PAGE BREAK (printing) -->&nbsp;</p>


<!-- TABLE: Settlement Charges -->
<table width="100%" cellspacing="0" border="0" summary="Summary of Transactions">
<tr>
<td colspan="3" class="black">L. Settlement Charges</td>
</tr>
<tr><td height="4" colspan="3"></td></tr>
<tr>
<td class="bdarksilver_head">700. Total Real Estate Broker Fees</td>
<td width="15%" rowspan="4" class="bdarksilver" align="center" valign="middle" style="border-left:none;">Paid From <br /> Borrower's <br />Funds at <br /> Settlement</td>
<td width="15%" rowspan="4" class="bdarksilver" align="center" valign="middle" style="border-left:none;">Paid From <br /> Seller's <br />Funds at <br /> Settlement</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;Division of commission (line 700) as follows:</td>
</tr>
<tr>
<td class="bsilver">701. $<span class="entry">#FixDecimals(get_hud_data.A_0701_COMMISSIONAMOUNT, "___,___.00")#</span>
to <span class="entry">#get_hud_data.A_0701_COMMISSIONPAYTO#</span></td>
</tr>
<tr>
<td class="bsilver">702. $<span class="entry">#FixDecimals(get_hud_data.A_0702_COMMISSIONAMOUNT, "___,___.00")#</span>
to <span class="entry">#get_hud_data.A_0702_COMMISSIONPAYTO#</span></td>
</tr>
<tr>
<td class="bsilver">703. Commission paid at settlement</td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0703_BORROWER_COMMISSIONAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0703_SELLER_COMMISSIONAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">704. <span class="entry">#get_hud_data.A_0704_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0704_USERPAYTO#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0704_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0704_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">705. <span class="entry">#get_hud_data.A_0705_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0705_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0705_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0705_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">706. <span class="entry">#get_hud_data.A_0706_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0706_USERPAYTO#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0706_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0706_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>

<!-- 800 -->

<tr><td height="4" colspan="3"></td></tr>
<tr>
<td colspan="3" class="bdarksilver_head">800. Items Payable in Connection with Loan</td>
</tr>
<tr>
<td class="bsilver">801. Our origination charge
$<span class="entry">#get_hud_data.A_0801_OUTSIDE_ORIGINATIONCHARGE#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0801_BORROWER_ORIGINATIONCHARGE#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0801_SELLER_ORIGINATIONCHARGE#</span></td>
</tr>
<tr>
<td class="bsilver">802. Your credit or charge (points) for the specific interest rate chosen
$<span class="entry">#get_hud_data.A_0802_OUTSIDE_POINTS#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0802_BORROWER_POINTS#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0802_SELLER_POINTS#</span></td>
</tr>
<tr>
<td class="bsilver">803. Your adjusted origination charges</td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0803_BORROWER_ADJORIGINATIONCHARGE, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0803_SELLER_ADJORIGINATIONCHARGE, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">804. Appraisal fee to <span class="entry">#get_hud_data.A_0804_APPRAISALFEEPAYTO#&nbsp;&nbsp;$#get_hud_data.A_0804_APPRAISALFEE_OUTSIDE_AMOUNT#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0804_BORROWER_APPRAISALFEE, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0804_SELLER_APPRAISALFEE, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">805. Credit report to <span class="entry">#get_hud_data.A_0805_CREDITREPORTPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0805_BORROWER_CREDITREPORT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0805_SELLER_CREDITREPORT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">806. Tax service to <span class="entry">#get_hud_data.A_0806_TAXSERVICEPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0806_BORROWER_TAXSERVICE, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0806_SELLER_TAXSERVICE, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">807. Flood certification to <span class="entry">#get_hud_data.A_0807_FLOODCERTPAYTO#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0807_BORROWER_FLOODCERT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0807_SELLER_FLOODCERT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">808. <span class="entry">#get_hud_data.A_0808_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0808_USERPAYTO#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0808_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0808_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">809. <span class="entry">#get_hud_data.A_0809_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0809_USERPAYTO#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0809_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0809_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">810.<span class="entry">#get_hud_data.A_0810_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0810_USERPAYTO#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0810_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0810_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">811. <span class="entry">#get_hud_data.A_0811_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0811_USERPAYTO#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0811_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0811_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">812. <span class="entry">#get_hud_data.A_0812_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0812_USERPAYTO#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0812_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0812_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>

<!-- 900 -->

<tr><td height="4" colspan="3"></td></tr>
<tr>
<td colspan="3" class="bdarksilver_head">900. Items Required by Lender to Be Paid in Advance</td>
</tr>
<tr>
<td class="bsilver">901. Daily interest charges from
<span class="entry"><cfif get_hud_data.A_0901_DAILYINTERESTDATEFROM NEQ 'NULL'>#DateFormat(get_hud_data.A_0901_DAILYINTERESTDATEFROM, 'm/d/yyyy')#</cfif></span>
@ $<span class="entry">#get_hud_data.A_0901_OUTSIDE_DAILYINTERESTPERDAY#</span> /day</td>
<td class="bordered"><span class="entry">#get_hud_data.A_0901_BORROWER_DAILYINTEREST#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0901_SELLER_DAILYINTEREST#</span></td>
</tr>
<tr>
<td class="bsilver">902. Mortgage insurance premium for
<span class="entry">#get_hud_data.A_0902_MORTGAGEINSMONTHS#</span> months
to <span class="entry">#get_hud_data.A_0902_MORTGAGEINSPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0902_BORROWER_MORTGAGEINS#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0902_SELLER_MORTGAGEINS#</span></td>
</tr>
<tr>
<td class="bsilver">903. Homeowner's insurance for
<span class="entry">#get_hud_data.A_0903_HOMEOWNERSINSMONTHS#</span> months
to <span class="entry">#get_hud_data.A_0903_HOMEOWNERSINSPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0903_BORROWER_HOMEOWNERSINS#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0903_SELLER_HOMEOWNERSINS#</span></td>
</tr>
<tr>
<td class="bsilver">904. <span class="entry">#get_hud_data.A_0904_USERDESC#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0904_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_0904_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>

<!-- 1000 -->

<tr><td height="4" colspan="3"></td></tr>
<tr>
<td colspan="3" class="bdarksilver_head">1000. Reserves Deposited with Lender</td>
</tr>
<tr>
<td class="bsilver">1001. Initial deposit for your escrow account</td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1001_BORROWER_INITIALESCROWDEPOSIT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1001_SELLER_INITIALESCROWDEPOSIT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver"><div style="float:left">1002. Homeowner's insurance</div>
<div style="float:right"> <span class="entry">#get_hud_data.A_1002_HOMEOWNERSINSMONTHS#</span> months @
$<span class="entry">#FixDecimals(get_hud_data.A_1002_HOMEOWNERSINSPERMONTH, "___,___.00")#</span> per month
$<span class="entry">#FixDecimals(get_hud_data.A_1002_OUTSIDE_HOMEOWNERSINS, "___,___.00")#</span></div></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1002_BORROWER_HOMEOWNERSINS, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1002_SELLER_HOMEOWNERSINS, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver"><div style="float:left">1003. Mortgage insurance</div>
<div style="float:right"> <span class="entry">#get_hud_data.A_1003_MORTGAGEINSMONTHS#</span> months @
$<span class="entry">#FixDecimals(get_hud_data.A_1003_MORTGAGEINSPERMONTH, "___,___.00")#</span> per month
$<span class="entry">#FixDecimals(get_hud_data.A_1003_OUTSIDE_MORTGAGEINS, "___,___.00")#</span></div></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1003_BORROWER_MORTGAGEINS, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1003_SELLER_MORTGAGEINS, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver"><div style="float:left">1004. City property tax</div>
<div style="float:right"> <span class="entry">#get_hud_data.A_1004_CITYPROPTAXMONTHS#</span> months @
$<span class="entry">#FixDecimals(get_hud_data.A_1004_CITYPROPTAXPERMONTH, "___,___.00")#</span> per month
$<span class="entry">#FixDecimals(get_hud_data.A_1004_OUTSIDE_CITYPROPTAX, "___,___.00")#</span></div></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1004_BORROWER_CITYPROPTAX, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1004_SELLER_CITYPROPTAX, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver"><div style="float:left">1005. County property tax</div>
<div style="float:right"> <span class="entry">#get_hud_data.A_1005_COUNTYPROPTAXMONTHS#</span> months @
$<span class="entry">#FixDecimals(get_hud_data.A_1005_COUNTYPROPTAXPERMONTH, "___,___.00")#</span> per month
$<span class="entry">#FixDecimals(get_hud_data.A_1005_OUTSIDE_COUNTYPROPTAX, "___,___.00")#</span></div></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1005_BORROWER_COUNTYPROPTAX, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1005_SELLER_COUNTYPROPTAX, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver"><div style="float:left">1006. Assessments</div>
<div style="float:right"> <span class="entry">#get_hud_data.A_1006_ASSESSMENTSMONTHS#</span> months @
$<span class="entry">#FixDecimals(get_hud_data.A_1006_ASSESSMENTSPERMONTH, "___,___.00")#</span> per month
$<span class="entry">#FixDecimals(get_hud_data.A_1006_OUTSIDE_ASSESSMENTS, "___,___.00")#</span></div></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1006_BORROWER_ASSESSMENTS, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1006_SELLER_ASSESSMENTS, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver" valign="top"><div style="float:left">1007. Aggregate Adjustment</div>
<div style="float:right"> <span class="entry">#get_hud_data.A_1007_OUTSIDE_AGGREGATEADJUSTMENT#</span></div></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1007_BORROWER_AGGREGATEADJUSTMENT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1007_SELLER_AGGREGATEADJUSTMENT, "___,___.00")#</span></td>
</tr>

<!-- 1100 -->

<tr><td height="4" colspan="3"></td></tr>
<tr>
<td colspan="3" class="bdarksilver_head">1100. Title Charges</td>
</tr>
<tr>
<td class="bsilver">1101. Title services and lender's title insurance</td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1101_BORROWER_TITLESERVICES, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1101_SELLER_TITLESERVICES, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">1102. Settlement or closing fee
to <span class="entry">#get_hud_data.A_1102_CLOSINGFEEPAYTO#</span>
$<span class="entry">#get_hud_data.A_1102_OUTSIDE_CLOSINGFEE#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1102_BORROWER_CLOSINGFEE, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1102_SELLER_CLOSINGFEE, "___,___.00")#</span></td>
</tr>
<cfif get_hud_data.A_1102A_OUTSIDE_CLOSINGFEE neq '' or get_hud_data.A_1102A_BORROWER_CLOSINGFEE neq '' or get_hud_data.A_1102A_SELLER_CLOSINGFEE neq ''>
<tr>
<td class="bsilver">1102. #get_hud_data.A_1102A_DESCRIPTION#
to <span class="entry">#get_hud_data.A_1102A_CLOSINGFEEPAYTO#</span>
$<span class="entry">#get_hud_data.A_1102A_OUTSIDE_CLOSINGFEE#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1102A_BORROWER_CLOSINGFEE, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1102A_SELLER_CLOSINGFEE, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif get_hud_data.A_1102B_OUTSIDE_CLOSINGFEE neq '' or get_hud_data.A_1102B_BORROWER_CLOSINGFEE neq '' or get_hud_data.A_1102B_SELLER_CLOSINGFEE neq ''>
<tr>
<td class="bsilver">1102. #get_hud_data.A_1102B_DESCRIPTION#
to <span class="entry">#get_hud_data.A_1102B_CLOSINGFEEPAYTO#</span>
$<span class="entry">#get_hud_data.A_1102B_OUTSIDE_CLOSINGFEE#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1102B_BORROWER_CLOSINGFEE, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1102B_SELLER_CLOSINGFEE, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif get_hud_data.A_1102C_OUTSIDE_CLOSINGFEE neq '' or get_hud_data.A_1102C_BORROWER_CLOSINGFEE neq '' or get_hud_data.A_1102C_SELLER_CLOSINGFEE neq ''>
<tr>
<td class="bsilver">1102. #get_hud_data.A_1102C_DESCRIPTION#
to <span class="entry">#get_hud_data.A_1102C_CLOSINGFEEPAYTO#</span>
$<span class="entry">#get_hud_data.A_1102C_OUTSIDE_CLOSINGFEE#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1102C_BORROWER_CLOSINGFEE, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1102C_SELLER_CLOSINGFEE, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif get_hud_data.A_1102D_OUTSIDE_CLOSINGFEE neq '' or get_hud_data.A_1102D_BORROWER_CLOSINGFEE neq '' or get_hud_data.A_1102D_SELLER_CLOSINGFEE neq ''>
<tr>
<td class="bsilver">1102. #get_hud_data.A_1102D_DESCRIPTION#
to <span class="entry">#get_hud_data.A_1102D_CLOSINGFEEPAYTO#</span>
$<span class="entry">#get_hud_data.A_1102D_OUTSIDE_CLOSINGFEE#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1102D_BORROWER_CLOSINGFEE, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1102D_SELLER_CLOSINGFEE, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif get_hud_data.A_1102E_OUTSIDE_CLOSINGFEE neq '' or get_hud_data.A_1102E_BORROWER_CLOSINGFEE neq '' or get_hud_data.A_1102E_SELLER_CLOSINGFEE neq ''>
<tr>
<td class="bsilver">1102. #get_hud_data.A_1102E_DESCRIPTION#
to <span class="entry">#get_hud_data.A_1102E_CLOSINGFEEPAYTO#</span>
$<span class="entry">#get_hud_data.A_1102E_OUTSIDE_CLOSINGFEE#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1102E_BORROWER_CLOSINGFEE, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1102E_SELLER_CLOSINGFEE, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif get_hud_data.A_1102F_OUTSIDE_CLOSINGFEE neq '' or get_hud_data.A_1102F_BORROWER_CLOSINGFEE neq '' or get_hud_data.A_1102F_SELLER_CLOSINGFEE neq ''>
<tr>
<td class="bsilver">1102. #get_hud_data.A_1102F_DESCRIPTION#
to <span class="entry">#get_hud_data.A_1102F_CLOSINGFEEPAYTO#</span>
$<span class="entry">#get_hud_data.A_1102F_OUTSIDE_CLOSINGFEE#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1102F_BORROWER_CLOSINGFEE, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1102F_SELLER_CLOSINGFEE, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif get_hud_data.A_1102G_OUTSIDE_CLOSINGFEE neq '' or get_hud_data.A_1102G_BORROWER_CLOSINGFEE neq '' or get_hud_data.A_1102G_SELLER_CLOSINGFEE neq ''>
<tr>
<td class="bsilver">1102. #get_hud_data.A_1102G_DESCRIPTION#
to <span class="entry">#get_hud_data.A_1102G_CLOSINGFEEPAYTO#</span>
$<span class="entry">#get_hud_data.A_1102G_OUTSIDE_CLOSINGFEE#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1102G_BORROWER_CLOSINGFEE, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1102G_SELLER_CLOSINGFEE, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif get_hud_data.A_1102H_OUTSIDE_CLOSINGFEE neq '' or get_hud_data.A_1102H_BORROWER_CLOSINGFEE neq '' or get_hud_data.A_1102H_SELLER_CLOSINGFEE neq ''>
<tr>
<td class="bsilver">1102. #get_hud_data.A_1102H_DESCRIPTION#
to <span class="entry">#get_hud_data.A_1102H_CLOSINGFEEPAYTO#</span>
$<span class="entry">#get_hud_data.A_1102H_OUTSIDE_CLOSINGFEE#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1102H_BORROWER_CLOSINGFEE, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1102H_SELLER_CLOSINGFEE, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif get_hud_data.A_1102I_OUTSIDE_CLOSINGFEE neq '' or get_hud_data.A_1102I_BORROWER_CLOSINGFEE neq '' or get_hud_data.A_1102I_SELLER_CLOSINGFEE neq ''>
<tr>
<td class="bsilver">1102. #get_hud_data.A_1102I_DESCRIPTION#
to <span class="entry">#get_hud_data.A_1102I_CLOSINGFEEPAYTO#</span>
$<span class="entry">#get_hud_data.A_1102I_OUTSIDE_CLOSINGFEE#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1102I_BORROWER_CLOSINGFEE, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1102I_SELLER_CLOSINGFEE, "___,___.00")#</span></td>
</tr>
</cfif>
<tr>
<td class="bsilver">1103. Owner's title insurance
to <span class="entry">#get_hud_data.A_1103_OWNERSTITLEINSPAYTO#</span>
$<span class="entry">#get_hud_data.A_1103_OUTSIDE_OWNERSTITLEINS#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1103_BORROWER_OWNERSTITLEINS, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1103_SELLER_OWNERSTITLEINS, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">1104. Lender's title insurance
to <span class="entry">#get_hud_data.A_1104_LENDERSTITLEINSPAYTO#</span>
$<span class="entry">#get_hud_data.A_1104_OUTSIDE_LENDERSTITLEINS#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1104_BORROWER_LENDERSTITLEINS, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1104_SELLER_LENDERSTITLEINS, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">1105. Lender's title policy limit
$<span class="entry">#FixDecimals(get_hud_data.A_1105_LENDERSTITLEPOLICYLIMIT, "___,___.00")#</span> </td>
<td class="bordered">&nbsp; </td>
<td class="bordered">&nbsp; </td>
</tr>
<tr>
<td class="bsilver">1106. Owner's title policy limit
$<span class="entry">#FixDecimals(get_hud_data.A_1106_OWNERSTITLEPOLICYLIMIT, "___,___.00")#</span> </td>
<td class="bordered">&nbsp; </td>
<td class="bordered">&nbsp; </td>
</tr>
<tr>
<td class="bsilver">1107. Agent's portion of the total title insurance premium
$<span class="entry">#FixDecimals(get_hud_data.A_1107_AGENTPREMIUMPORTION, "___,___.00")#</span> </td>
<td class="bordered">&nbsp; </td>
<td class="bordered">&nbsp; </td>
</tr>
<tr>
<td class="bsilver">1108. Underwriter's portion of the total title insurance premium
$<span class="entry">#FixDecimals(get_hud_data.A_1108_UNDERWRITERPREMIUMPORTION, "___,___.00")#</span> </td>
<td class="bordered">&nbsp; </td>
<td class="bordered">&nbsp; </td>
</tr>
<tr>
<td class="bsilver">1109. <span class="entry">#get_hud_data.A_1109_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1109_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1109_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1109_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1109_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">1110. <span class="entry">#get_hud_data.A_1110_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1110_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1110_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1110_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1110_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">1111. <span class="entry">#get_hud_data.A_1111_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1111_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1111_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1111_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1111_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">1112. <span class="entry">#get_hud_data.A_1112_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1112_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1112_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1112_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1112_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">1113. <span class="entry">#get_hud_data.A_1113_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1113_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1113_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1113_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1113_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<cfif Len(get_hud_data.A_1114_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1114_BORROWER_USERAMOUNT) or Len(get_hud_data.A_1114_SELLER_USERAMOUNT)>
<tr>
<td class="bsilver">1114. <span class="entry">#get_hud_data.A_1114_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1114_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1114_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1114_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1114_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1115_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1115_BORROWER_USERAMOUNT) or Len(get_hud_data.A_1115_SELLER_USERAMOUNT)>
<tr>
<td class="bsilver">1115. <span class="entry">#get_hud_data.A_1115_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1115_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1115_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1115_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1115_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1116_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1116_BORROWER_USERAMOUNT) or Len(get_hud_data.A_1116_SELLER_USERAMOUNT)>
<tr>
<td class="bsilver">1116. <span class="entry">#get_hud_data.A_1116_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1116_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1116_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1116_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1116_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1117_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1117_BORROWER_USERAMOUNT) or Len(get_hud_data.A_1117_SELLER_USERAMOUNT)>
<tr>
<td class="bsilver">1117. <span class="entry">#get_hud_data.A_1117_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1117_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1117_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1117_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1117_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1118_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1118_BORROWER_USERAMOUNT) or Len(get_hud_data.A_1118_SELLER_USERAMOUNT)>
<tr>
<td class="bsilver">1118. <span class="entry">#get_hud_data.A_1118_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1118_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1118_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1118_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1118_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1119_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1119_BORROWER_USERAMOUNT) or Len(get_hud_data.A_1119_SELLER_USERAMOUNT)>
<tr>
<td class="bsilver">1119. <span class="entry">#get_hud_data.A_1119_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1119_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1119_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1119_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1119_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1120_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1120_BORROWER_USERAMOUNT) or Len(get_hud_data.A_1120_SELLER_USERAMOUNT)>
<tr>
<td class="bsilver">1120. <span class="entry">#get_hud_data.A_1120_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1120_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1120_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1120_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1120_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1121_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1121_BORROWER_USERAMOUNT) or Len(get_hud_data.A_1121_SELLER_USERAMOUNT)>
<tr>
<td class="bsilver">1121. <span class="entry">#get_hud_data.A_1121_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1121_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1121_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1121_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1121_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1122_OUTSIDE_USERAMOUNT) or Len(get_hud_data.A_1122_BORROWER_USERAMOUNT) or Len(get_hud_data.A_1122_SELLER_USERAMOUNT)>
<tr>
<td class="bsilver">1122. <span class="entry">#get_hud_data.A_1122_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1122_USERPAYTO#</span>
$<span class="entry">#FixDecimals(get_hud_data.A_1122_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1122_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data.A_1122_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif>

<!-- 1200 -->

<tr><td height="4" colspan="3"></td></tr>
<tr>
<td colspan="3" class="bdarksilver_head">1200. Government Recording and Transfer Charges</td>
</tr>
<tr>
<td class="bsilver">1201. Government recording charges</td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1201_BORROWER_GOVTRECORDINGCHARGES#</span></td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1201_SELLER_GOVTRECORDINGCHARGES#</span></td>
</tr>
<tr>
<td class="bsilver">1202.
Deed $<span class="entry">#get_hud_data_b.A_1202_DEED#</span>
Mortgage $<span class="entry">#get_hud_data_b.A_1202_DEEDMORTGAGE#</span>
Releases $<span class="entry">#get_hud_data_b.A_1202_DEEDRELEASES#</span></td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1202_BORROWER_DEED#</span></td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1202_SELLER_DEED#</span></td>
</tr>
<tr>
<td class="bsilver">1203. Transfer taxes</td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1203_BORROWER_TRANSFERTAXES#</span></td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1203_SELLER_TRANSFERTAXES#</span></td>
</tr>
<tr>
<td class="bsilver">1204. City/County tax/stamps &nbsp; &nbsp; &nbsp;
Deed $<span class="entry">#get_hud_data_b.A_1204_CITYCOUNTYTAXDEED#</span>
Mortgage $<span class="entry">#get_hud_data_b.A_1204_CITYCOUNTYTAXMORTGAGE#</span></td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1204_BORROWER_CITYCOUNTYTAX#</span></td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1204_SELLER_CITYCOUNTYTAX#</span></td>
</tr>
<tr>
<td class="bsilver">1205. State tax/stamps &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
Deed $<span class="entry">#get_hud_data_b.A_1205_STATETRANSTAXDEED#</span>
Mortgage $<span class="entry">#get_hud_data_b.A_1205_STATETRANSTAXMORTGAGE#</span></td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1205_BORROWER_STATETRANSTAX#</span></td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1205_SELLER_STATETRANSTAX#</span></td>
</tr>
<cfif FixDecimals(get_hud_data_b.A_1206_BORROWER_USERAMOUNT, "___,___.00") gt 0 or FixDecimals(get_hud_data_b.A_1206_SELLER_USERAMOUNT, "___,___.00") gt 0 or FixDecimals(get_hud_data_b.A_1206_OUTSIDE_USERAMOUNT, "___,___.00") gt 0 or FixDecimals(get_hud_data_b.A_1207_BORROWER_USERAMOUNT, "___,___.00") gt 0 or FixDecimals(get_hud_data_b.A_1207_SELLER_USERAMOUNT, "___,___.00") gt 0 or FixDecimals(get_hud_data_b.A_1207_OUTSIDE_USERAMOUNT, "___,___.00") gt 0>
<tr>
<td class="bsilver">1206. <span class="entry">#get_hud_data_b.A_1206_USERDESC#</span>
to <span class="entry">#get_hud_data_b.A_1206_USERPAYTO#&nbsp;&nbsp;&nbsp;#FixDecimals(get_hud_data_b.A_1206_OUTSIDE_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1206_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1206_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr> 
</cfif>
<cfif FixDecimals(get_hud_data_b.A_1207_BORROWER_USERAMOUNT, "___,___.00") gt 0 or FixDecimals(get_hud_data_b.A_1207_SELLER_USERAMOUNT, "___,___.00") gt 0 or FixDecimals(get_hud_data_b.A_1207_OUTSIDE_USERAMOUNT, "___,___.00") gt 0>
<tr>
<td class="bsilver">1207. <span class="entry">#get_hud_data_b.A_1207_USERDESC#</span>
to <span class="entry">#get_hud_data_b.A_1207_USERPAYTO#&nbsp;&nbsp;&nbsp;#FixDecimals(get_hud_data_b.A_1207_OUTSIDE_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1207_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1207_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
</cfif><!-- 1300 -->

<tr><td height="4" colspan="3"></td></tr>
<tr>
<td colspan="3" class="bdarksilver_head">1300. Additional Settlement Charges</td>
</tr>
<tr>
<td class="bsilver">1301. Required services that you can shop for</td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1301_BORROWER_SERVICESYOUCANSHOPFOR#</span></td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1301_SELLER_SERVICESYOUCANSHOPFOR#</span></td>
</tr>
<tr>
<td class="bsilver">1302. <span class="entry">#get_hud_data_b.A_1302_USERDESC#</span>
to <span class="entry">#get_hud_data_b.A_1302_USERPAYTO#</span>
$ <span class="entry">#FixDecimals(get_hud_data_b.A_1302_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1302_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1302_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">1303. <span class="entry">#get_hud_data_b.A_1303_USERDESC#</span>
to <span class="entry">#get_hud_data_b.A_1303_USERPAYTO#</span>
$ <span class="entry">#FixDecimals(get_hud_data_b.A_1303_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1303_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1303_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">1304. <span class="entry">#get_hud_data_b.A_1304_USERDESC#</span>
to <span class="entry">#get_hud_data_b.A_1304_USERPAYTO#</span>
$ <span class="entry">#FixDecimals(get_hud_data_b.A_1304_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1304_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1304_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">1305. <span class="entry">#get_hud_data_b.A_1305_USERDESC#</span>
to <span class="entry">#get_hud_data_b.A_1305_USERPAYTO#</span>
$ <span class="entry">#FixDecimals(get_hud_data_b.A_1305_OUTSIDE_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1305_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1305_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">1306. <span class="entry">#get_hud_data_b.A_1306_USERDESC#</span>
to <span class="entry">#get_hud_data_b.A_1306_USERPAYTO#</span>
$ <span class="entry">#FixDecimals(get_hud_data_b.A_1306_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1306_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1306_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">1307. <span class="entry">#get_hud_data_b.A_1307_USERDESC#</span>
to <span class="entry">#get_hud_data_b.A_1307_USERPAYTO#</span>
$ <span class="entry">#FixDecimals(get_hud_data_b.A_1307_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1307_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1307_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">1308. <span class="entry">#get_hud_data_b.A_1308_USERDESC#</span>
to <span class="entry">#get_hud_data_b.A_1308_USERPAYTO#</span>
$ <span class="entry">#FixDecimals(get_hud_data_b.A_1308_OUTSIDE_USERAMOUNT, "___,___.00")#</span> </td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1308_BORROWER_USERAMOUNT, "___,___.00")#</span></td>
<td class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.A_1308_SELLER_USERAMOUNT, "___,___.00")#</span></td>
</tr>

<tr><td height="4" colspan="3"></td></tr>
<tr>
<td class="black">1400. Total Settlement Charges (enter on lines 103, Section J and 502, Section K)</td>
<td class="bordered" style="border-top:1px solid black;"><span class="entry">#get_hud_data_b.A_1400_BORROWER_TOTALSETTLEMENTCHARGES#</span></td>
<td class="bordered" style="border-top:1px solid black;"><span class="entry">#get_hud_data_b.A_1400_SELLER_TOTALSETTLEMENTCHARGES#</span></td>
</tr>
</table><!-- TABLE: Settlement Charges -->

<P CLASS="pagebreak"><!-- PAGE BREAK (printing) -->&nbsp;</p>

<!-- TABLE: Comparison of Good Faith Estimate (GFE) and HUD-1 Charges -->
<table width="100%" cellspacing="0" border="0" summary="Comparison of Good Faith Estimate (GFE) and HUD-1 Charges">
<tr>
<td colspan="2" class="bdarksilver_head">Comparison of Good Faith Estimate (GFE) and HUD-1 Charges</td>
<td>&nbsp;  </td>
<td align="center" width="17%" class="bdarksilver_head">Good Faith Estimate</td>
<td align="center" width="17%" class="bdarksilver_head" style="border-left:none;">HUD-1</td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left">Charges That Cannot Increase</div>
<div style="float:right">HUD-1 Line Number &nbsp; &nbsp; &nbsp;</div></td>
<td></td>
<td align="center" class="bordered_wleft">&nbsp;</td>
<td align="center" class="bordered">&nbsp;</td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left">Our origination charge</div>
<div style="float:right">## 801 &nbsp; &nbsp; &nbsp;</div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#get_hud_data_b.COMPARE_01_GFE_ORIGINCHARGE#</span></td>
<td align="center" class="bordered"><span class="entry">#get_hud_data_b.COMPARE_01_HUD_ORIGINCHARGE#</span></td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left">Your credit or charge (points) for the specific interest rate chosen</div>
<div style="float:right">## 802 &nbsp; &nbsp; &nbsp;</div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#get_hud_data_b.COMPARE_02_GFE_POINTS#</span> </td>
<td align="center" class="bordered"><span class="entry">#get_hud_data_b.COMPARE_02_HUD_POINTS#</span> </td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left">Your adjusted origination charges</div>
<div style="float:right">## 803 &nbsp; &nbsp; &nbsp;</div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#get_hud_data_b.COMPARE_03_GFE_ADJORIGINCHARGE#</span> </td>
<td align="center" class="bordered"><span class="entry">#get_hud_data_b.COMPARE_03_HUD_ADJORIGINCHARGE#</span> </td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left">Transfer taxes</div>
<div style="float:right">## 1203 &nbsp; &nbsp; &nbsp;</div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#get_hud_data_b.COMPARE_04_GFE_TRANSFERTAX#</span> </td>
<td align="center" class="bordered"><span class="entry">#get_hud_data_b.COMPARE_04_HUD_TRANSFERTAX#</span></td>
</tr>

<tr><td height="14" colspan="4"></td></tr>

<tr>
<td colspan="2" class="bdarksilver_head">Charges That in Total Cannot Increase More Than 10%</td>
<td>&nbsp;  </td>
<td align="center" class="bdarksilver_head">Good Faith Estimate</td>
<td align="center" class="bdarksilver_head" style="border-left:none;">HUD-1</td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left">Government recording charges</div>
<div style="float:right">## 1201 &nbsp; &nbsp; &nbsp;</div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#get_hud_data_b.COMPARE_05_GFE_GOVTRECCHARGE#</span></td>
<td align="center" class="bordered"><span class="entry">#get_hud_data_b.COMPARE_05_HUD_GOVTRECCHARGE#</span></td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left"><span class="entry">#get_hud_data_b.COMPARE_06_USERHUDDESC#</span></div>
<div style="float:right">##<span class="entry">#get_hud_data_b.COMPARE_06_USERHUDLINE#</span>  &nbsp; &nbsp; &nbsp;</div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#FixDecimals(get_hud_data_b.COMPARE_06_GFE_USERAMOUNT, "___,___.00")#</span></td>
<td align="center" class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.COMPARE_06_HUD_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left"><span class="entry">#get_hud_data_b.COMPARE_07_USERHUDDESC#</span></div>
<div style="float:right">##<span class="entry">#get_hud_data_b.COMPARE_07_USERHUDLINE#</span>  &nbsp; &nbsp; &nbsp;</div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#FixDecimals(get_hud_data_b.COMPARE_07_GFE_USERAMOUNT, "___,___.00")#</span></td>
<td align="center" class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.COMPARE_07_HUD_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left"><span class="entry">#get_hud_data_b.COMPARE_08_USERHUDDESC#</span></div>
<div style="float:right">##<span class="entry">#get_hud_data_b.COMPARE_08_USERHUDLINE#</span>  &nbsp; &nbsp; &nbsp;</div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#FixDecimals(get_hud_data_b.COMPARE_08_GFE_USERAMOUNT, "___,___.00")#</span></td>
<td align="center" class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.COMPARE_08_HUD_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left"><span class="entry">#get_hud_data_b.COMPARE_09_USERHUDDESC#</span></div>
<div style="float:right">##<span class="entry">#get_hud_data_b.COMPARE_09_USERHUDLINE#</span>  &nbsp; &nbsp; &nbsp;</div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#FixDecimals(get_hud_data_b.COMPARE_09_GFE_USERAMOUNT, "___,___.00")#</span></td>
<td align="center" class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.COMPARE_09_HUD_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left"><span class="entry">#get_hud_data_b.COMPARE_10_USERHUDDESC#</span></div>
<div style="float:right">##<span class="entry">#get_hud_data_b.COMPARE_10_USERHUDLINE#</span>  &nbsp; &nbsp; &nbsp;</div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#FixDecimals(get_hud_data_b.COMPARE_10_GFE_USERAMOUNT, "___,___.00")#</span></td>
<td align="center" class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.COMPARE_10_HUD_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left"><span class="entry">#get_hud_data_b.COMPARE_11_USERHUDDESC#</span></div>
<div style="float:right">##<span class="entry">#get_hud_data_b.COMPARE_11_USERHUDLINE#</span>  &nbsp; &nbsp; &nbsp;</div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#FixDecimals(get_hud_data_b.COMPARE_11_GFE_USERAMOUNT, "___,___.00")#</span></td>
<td align="center" class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.COMPARE_11_HUD_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left"><span class="entry">#get_hud_data_b.COMPARE_12_USERHUDDESC#</span></div>
<div style="float:right">##<span class="entry">#get_hud_data_b.COMPARE_12_USERHUDLINE#</span>  &nbsp; &nbsp; &nbsp;</div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#FixDecimals(get_hud_data_b.COMPARE_12_GFE_USERAMOUNT, "___,___.00")#</span></td>
<td align="center" class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.COMPARE_12_HUD_USERAMOUNT, "___,___.00")#</span></td>
</tr>

<tr><td height="2" colspan="4"></td></tr>

<tr>
<td colspan="2" class="black" align="right">Total</td>
<td>&nbsp;  </td>
<td align="center" class="bordered_wleft" style="border-top:1px solid black;"><span class="entry">#FixDecimals(get_hud_data_b.COMPARE_GFE_TOTAL_USERAMOUNT, "___,___.00")#</span></td>
<td align="center" class="bordered" style="border-top:1px solid black;"><span class="entry">#FixDecimals(get_hud_data_b.COMPARE_HUD_TOTAL_USERAMOUNT, "___,___.00")#</span></td>
</tr>

<tr><td height="2" colspan="4"></td></tr>

<tr>
<td colspan="2" class="black" align="right">Increase between GFE and HUD-1 Charges</td>
<td>&nbsp;  </td>
<td colspan="2" class="bordered_wleft" style="border-top:1px solid black;text-align:center;">$<span class="entry">#get_hud_data_b.COMPARE_GFE_TOTAL_DIFFERENCE#</span> or <span class="entry">#get_hud_data_b.COMPARE_HUD_TOTAL_DIFFERENCE#</span>%</td>
</tr>

<tr><td height="14" colspan="4"></td></tr>

<tr>
<td colspan="2" class="bdarksilver_head">Charges That Can Change</td>
<td>&nbsp;  </td>
<td align="center" class="bdarksilver_head">Good Faith Estimate</td>
<td align="center" class="bdarksilver_head" style="border-left:none;">HUD-1</td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left">Initial deposit for your escrow account</div>
<div style="float:right">## 1001 &nbsp; &nbsp; &nbsp;</div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#get_hud_data_b.COMPARE_13_GFE_ESCROWDEPOSIT#</span></td>
<td align="center" class="bordered"><span class="entry">#get_hud_data_b.COMPARE_13_HUD_ESCROWDEPOSIT#</span></td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left">Daily interest charges</div>
<div style="float:right">## 901 $<span class="entry">#get_hud_data_b.COMPARE_14_INTERESTCHARGESPERDAY#</span> /day</div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#get_hud_data_b.COMPARE_14_GFE_INTERESTCHARGES#</span></td>
<td align="center" class="bordered"><span class="entry">#get_hud_data_b.COMPARE_14_HUD_INTERESTCHARGES#</span></td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left">Homeowner's insurance</div>
<div style="float:right">## 903 &nbsp; &nbsp; &nbsp;</div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#get_hud_data_b.COMPARE_15_GFE_HOMEOWNERSINS#</span></td>
<td align="center" class="bordered"><span class="entry">#get_hud_data_b.COMPARE_15_HUD_HOMEOWNERSINS#</span></td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left"><span class="entry">#get_hud_data_b.COMPARE_16_USERDESC#</span></div>
<div style="float:right">##<span class="entry">#get_hud_data_b.COMPARE_16_USERHUDLINE#</span>
$<span class="entry">#FixDecimals(get_hud_data_b.COMPARE_16_USERAMOUNT, "___,___.00")#</span></div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#FixDecimals(get_hud_data_b.COMPARE_16_GFE_USERAMOUNT, "___,___.00")#</span></td>
<td align="center" class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.COMPARE_16_HUD_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left"><span class="entry">#get_hud_data_b.COMPARE_17_USERDESC#</span></div>
<div style="float:right">##<span class="entry">#get_hud_data_b.COMPARE_17_USERHUDLINE#</span>
$<span class="entry">#FixDecimals(get_hud_data_b.COMPARE_17_USERAMOUNT, "___,___.00")#</span></div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#FixDecimals(get_hud_data_b.COMPARE_17_GFE_USERAMOUNT, "___,___.00")#</span></td>
<td align="center" class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.COMPARE_17_HUD_USERAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left"><span class="entry">#get_hud_data_b.COMPARE_18_USERDESC#</span></div>
<div style="float:right">##<span class="entry">#get_hud_data_b.COMPARE_18_USERHUDLINE#</span>
$<span class="entry">#FixDecimals(get_hud_data_b.COMPARE_18_USERAMOUNT, "___,___.00")#</span></div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#FixDecimals(get_hud_data_b.COMPARE_18_GFE_USERAMOUNT, "___,___.00")#</span></td>
<td align="center" class="bordered"><span class="entry">#FixDecimals(get_hud_data_b.COMPARE_18_HUD_USERAMOUNT, "___,___.00")#</span></td>
</tr>

</table><!-- TABLE: Comparison of Good Faith Estimate (GFE) and HUD-1 Charges -->

<br /><br /><br /><br /><br />

<b>Loan Terms</b>

<!-- TABLE: Loan Terms -->
<table width="100%" cellspacing="0" border="0" summary="Loan Terms">
<tr>
<td width="45%" class="bsilver" style="border-top:1px solid black;">Your initial loan amount is</td>
<td width="55%" class="bordered" style="border-top:1px solid black; text-align:left;">$<span class="entry">#FixDecimals(get_hud_data_b.TERMS_01_INITIALLOANAMOUNT, "___,___.00")#</span></td>
</tr>
<tr>
<td class="bsilver">Your loan term is</td>
<td class="bordered" style="text-align:left;"><span class="entry">#get_hud_data_b.TERMS_02_LOANTERM#</span> years</td>
</tr>
<tr>
<td class="bsilver">Your initial interest rate is</td>
<td class="bordered" style="text-align:left;"><span class="entry">#get_hud_data_b.TERMS_03_INTERESTRATE#</span>%</td>
</tr>
<tr>
<td valign="top" class="bsilver">Your initial monthly amount owed for principal, interest, and <br />and any mortgage insurance is</td>
<td class="bordered" style="text-align:left;">
$<span class="entry">#FixDecimals(get_hud_data_b.TERMS_04_MONTHLYAMOUNT, "___,___.00")#</span> includes <br />
<input type="checkbox"  value="1" name="TERMS_04_INCLUDESPRINCIPAL" <cfif get_hud_data_b.TERMS_04_INCLUDESPRINCIPAL eq 1>checked</cfif> /> Principal <br />
<input type="checkbox"  value="1" name="TERMS_04_INCLUDESINTEREST" <cfif get_hud_data_b.TERMS_04_INCLUDESINTEREST eq 1>checked</cfif> />Interest <br />
<input type="checkbox"  value="1" name="TERMS_04_INCLUDESMORTGAGEINS" <cfif get_hud_data_b.TERMS_04_INCLUDESMORTGAGEINS eq 1>checked</cfif> />Mortgage Insurance
</td>
</tr>
<tr>
<td valign="top" class="bsilver">Can your interest rate rise?</td>
<td class="bordered" style="text-align:left;">
<input type="checkbox"  name="TERMS_05_CANINTERESTRISE" value="NO" <cfif get_hud_data_b.TERMS_05_CANINTERESTRISE eq 'NO'>checked</cfif> onclick="document.hud1_form.TERMS_05_MAXINTEREST.value = ''; document.hud1_form.TERMS_05_FIRSTCHANGEDATE.value = ''; document.hud1_form.TERMS_05_CHANGEYEARS.value = ''; document.hud1_form.TERMS_05_AFTERDATE.value = ''; document.hud1_form.TERMS_05_CHANGEPERCENT.value = ''; document.hud1_form.TERMS_05_LOWESTINTEREST.value = ''; document.hud1_form.TERMS_05_HIGHESTINTEREST.value = '';" /> No.
<input type="checkbox"  name="TERMS_05_CANINTERESTRISE" value="YES" <cfif get_hud_data_b.TERMS_05_CANINTERESTRISE eq 'YES'>checked</cfif> /> Yes, it can rise to a
maximum of <span class="entry">#get_hud_data_b.TERMS_05_MAXINTEREST#</span>%. The first change will be
on <span class="entry">#DateFormat(get_hud_data_b.TERMS_05_FIRSTCHANGEDATE, 'm/d/yyyy')#</span> and can change again
every <span class="entry">#get_hud_data_b.TERMS_05_CHANGEYEARS#</span> years
after <span class="entry">#DateFormat(get_hud_data_b.TERMS_05_AFTERDATE, 'm/d/yyyy')#</span>. Every change date, your interest rate can increase or decrease
by <span class="entry">#get_hud_data_b.TERMS_05_CHANGEPERCENT#</span>%. Over the life of the loan, your interest rate is guaranteed to never be
lower than <span class="entry">#get_hud_data_b.TERMS_05_LOWESTINTEREST#</span>% or
higher than <span class="entry">#get_hud_data_b.TERMS_05_HIGHESTINTEREST#</span>%.
</td>
</tr>
<tr>
<td valign="top" class="bsilver">Even if you make payments on time, can your loan balance rise?</td>
<td class="bordered" style="text-align:left;">
<input type="checkbox"  name="TERMS_06_CANBALANCERISE" value="NO" <cfif get_hud_data_b.TERMS_06_CANBALANCERISE eq 'NO'>checked</cfif> onclick="document.hud1_form.TERMS_06_MAXBALANCE.value = '';" />No.
<input type="checkbox"  name="TERMS_06_CANBALANCERISE" value="YES" <cfif get_hud_data_b.TERMS_06_CANBALANCERISE eq 'YES'>checked</cfif> />Yes, it can rise to a
maximum of $<span class="entry">#get_hud_data_b.TERMS_06_MAXBALANCE#</span>.</td>
</tr>
<tr>
<td valign="top" class="bsilver">Even if you make payments on time, can your monthly amount owed for principal, interest, and mortgage insurance rise?</td>
<td class="bordered" style="text-align:left;">
<input type="checkbox"  name="TERMS_07_CANMONTHLYRISE" value="NO" <cfif get_hud_data_b.TERMS_07_CANMONTHLYRISE eq 'NO'>checked</cfif> onclick="document.hud1_form.TERMS_07_FIRSTRISEDATE.value = ''; document.hud1_form.TERMS_07_FIRSTRISEDATE.value = ''; document.hud1_form.TERMS_07_FIRSTRISEAMOUNT.value = ''; document.hud1_form.TERMS_07_MAXRISEAMOUNT.value = '';" />No.
<input type="checkbox"  name="TERMS_07_CANMONTHLYRISE" value="YES" <cfif get_hud_data_b.TERMS_07_CANMONTHLYRISE eq 'YES'>checked</cfif> />Yes, the
first increase can be on <span class="entry">#DateFormat(get_hud_data_b.TERMS_07_FIRSTRISEDATE, 'm/d/yyyy')#</span> and the
monthly amount owed can rise to $<span class="entry">#FixDecimals(get_hud_data_b.TERMS_07_FIRSTRISEAMOUNT, "___,___.00")#</span>. <br /> The
maximum it can ever rise to is $<span class="entry">#FixDecimals(get_hud_data_b.TERMS_07_MAXRISEAMOUNT, "___,___.00")#</span>. </td>
</tr>
<tr>
<td valign="top" class="bsilver">Does your loan have a prepayment penalty?</td>
<td class="bordered" style="text-align:left;">
<input type="checkbox"  name="TERMS_08_PREPAYMENTPENALTY" value="NO" <cfif get_hud_data_b.TERMS_08_PREPAYMENTPENALTY eq 'NO'>checked</cfif>  onclick="document.hud1_form.TERMS_08_MAXPREPAYMENTPENALTY.value = '';" />No.
<input type="checkbox"  name="TERMS_08_PREPAYMENTPENALTY" value="YES" <cfif get_hud_data_b.TERMS_08_PREPAYMENTPENALTY eq 'YES'>checked</cfif>  />Yes, your
maximum prepayment penalty is $<span class="entry">#get_hud_data_b.TERMS_08_MAXPREPAYMENTPENALTY#</span> </td>
</tr>
<tr>
<td valign="top" class="bsilver">Does your loan have a balloon payment?</td>
<td class="bordered" style="text-align:left;">
<input type="checkbox"  value="NO" name="TERMS_09_BALLOONPAYMENT" <cfif get_hud_data_b.TERMS_09_BALLOONPAYMENT eq 'NO'>checked</cfif> onclick="document.hud1_form.TERMS_09_BALLOONPAYMENTAMOUNT.value = ''; document.hud1_form.TERMS_09_BALLOONPAYMENTDUEYEARS.value = ''; document.hud1_form.TERMS_09_BALLOONPAYMENTDUEDATE.value = '';" />No.
<input type="checkbox"  name="TERMS_09_BALLOONPAYMENT" value="YES" <cfif get_hud_data_b.TERMS_09_BALLOONPAYMENT eq 'YES'>checked</cfif> >Yes, you have a
balloon payment of $<span class="entry">#FixDecimals(get_hud_data_b.TERMS_09_BALLOONPAYMENTAMOUNT, "___,___.00")#</span>
due in <span class="entry">#get_hud_data_b.TERMS_09_BALLOONPAYMENTDUEYEARS#</span> years
on <span class="entry">#DateFormat(get_hud_data_b.TERMS_09_BALLOONPAYMENTDUEDATE, 'm/d/yyyy')#</span></td>
</tr>
<tr>
<td valign="top" class="bsilver">Total monthly amount owed including escrow account payments</td>
<td class="bordered" style="text-align:left;">
<input type="checkbox"  name="TERMS_10_TOTALESCROW" value="NO" <cfif get_hud_data_b.TERMS_10_TOTALESCROW eq 'NO'>checked</cfif> onclick="document.hud1_form.TERMS_10_ADDTIONALPAYMENT.value = ''; document.hud1_form.TERMS_10_MONTHLYPAYMENT.value = ''; document.hud1_form.TERMS_10_PROPERTYTAX.checked = false; document.hud1_form.TERMS_10_HOMEOWNERSINS.checked = false; document.hud1_form.TERMS_10_FLOODINS.checked = false; document.hud1_form.TERMS_10_USERITEM1.checked = false; document.hud1_form.TERMS_10_USERITEM1_DESC.value = ''; document.hud1_form.TERMS_10_USERITEM2.checked = false; document.hud1_form.TERMS_10_USERITEM2_DESC.value = ''; document.hud1_form.TERMS_10_USERITEM3.checked = false; document.hud1_form.TERMS_10_USERITEM3_DESC.value = '';" /> You do not have a monthly escrow payment for items, such as property taxes and homeowner's insurance. You must pay these items directly yourself.
<br />
<input type="checkbox"  name="TERMS_10_TOTALESCROW" value="YES" <cfif get_hud_data_b.TERMS_10_TOTALESCROW eq 'YES'>checked</cfif> /> You have an additional monthly escrow
payment of $<span class="entry">#get_hud_data_b.TERMS_10_ADDTIONALPAYMENT#</span> that results in a total initial
monthly amount owed of $<span class="entry">#get_hud_data_b.TERMS_10_MONTHLYPAYMENT#</span>. This includes principal, interest, any mortgage insurance and any items checked below:
<table width="100%" celpadding="0" cellspacing="0" summary="Other Additional Monthly Escrow Payment Items">
<tr>
<td><input type="checkbox"  name="TERMS_10_PROPERTYTAX" value="1" <cfif get_hud_data_b.TERMS_10_PROPERTYTAX eq 1>checked</cfif> />
Property taxes </td>
<td><input type="checkbox"  name="TERMS_10_HOMEOWNERSINS" value="1" <cfif get_hud_data_b.TERMS_10_HOMEOWNERSINS eq 1>checked</cfif> />
Homeowner's insurance</td>
</tr>
<tr>
<td><input type="checkbox"  name="TERMS_10_FLOODINS" value="1" <cfif get_hud_data_b.TERMS_10_FLOODINS eq 1>checked</cfif> />
Flood insurance </td>
<td><input type="checkbox"  name="TERMS_10_USERITEM1" value="1" <cfif get_hud_data_b.TERMS_10_USERITEM1 eq 1>checked</cfif> />
<span class="entry">#get_hud_data_b.TERMS_10_USERITEM1_DESC#</span></td>
</tr>
<tr>
<td><input type="checkbox"  name="TERMS_10_USERITEM2" value="1" <cfif get_hud_data_b.TERMS_10_USERITEM2 eq 1>checked</cfif> />
<span class="entry">#get_hud_data_b.TERMS_10_USERITEM2_DESC#</span></td>
<td><input type="CHECKBOX"  name="TERMS_10_USERITEM3" value="1" <cfif get_hud_data_b.TERMS_10_USERITEM3 eq 1>checked</cfif> />
<span class="entry">#get_hud_data_b.TERMS_10_USERITEM3_DESC#</span></td>
</tr>
</table>

</td>
</tr>
</table><!-- TABLE: Loan Terms -->

<P CLASS="pagebreak"><!-- PAGE BREAK (printing) -->&nbsp;</p>
<!-- TABLE: Type of Loan -->
<table class="loantype" width="670" summary="Type of Loan" cellspacing="0">
<tr>
<td valign="top" colspan="4" class="black">Itemization of Lines 1101, 1103, 1104</td>
</tr>
<tr>
<td valign="top" class="loantype" width="220">Borrower:<br>
&nbsp;&nbsp;&nbsp;<span class="entry">#get_hud_data.D_BORROWERNAMEADDRESS#</span><br>
</td>
<td valign="top" class="loantype" width="220">Seller:<br>
&nbsp;&nbsp;&nbsp;<span class="entry">#get_hud_data.E_SELLERNAMEADDRESS#</span></td>
<td valign="top" class="loantype" width="220">File Number:<br>
&nbsp;&nbsp;&nbsp;<span class="entry">#get_title_data.title_id#</span></td>
</tr>
</table>
<table class="loantype" width="670" summary="Type of Loan" cellspacing="0">
<tr>
<td align="left" class="fourthpagenoright" width="40" valign="top">note:&nbsp;&nbsp;<br>
</td>
<td align="left" class="fourthpagenoleft" width="480" valign="top">This page is furnished to give you an itemization of the amounts shown on Lines 1101, 1103 and 1104 of the Settlement Statement (HUD-1). This page accompanies but is not part of the settlement statement. If a discrepancy exists, the information shown on the Settlement Statement (HUD-1) applies.<br>
</td>
<td align="center" class="fourthpage" width="76" valign="top">Paid From Borrower's Funds at Settlement</td>
<td align="center" class="fourthpage" width="76" valign="top">Paid From Seller's Funds at Settlement</td>
</tr>
</table>

<table class="loantype" width="100%" summary="Type of Loan" cellspacing="0">
<tr>
<td align="left" class="fourthpage" colspan=3 valign="top">1100. Title Charges</td>
<td align="center" class="fourthpagecenter" valign="top">Amounts Included in<BR>Line 1101</td>
<td align="right" class="fourthpageright" valign="top" width="75">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top" width="75">&nbsp;</td>
</tr>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">1101.</td>
<td align="left" class="fourthpage" colspan=2 valign="top">Title services and lender's title insurance</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#get_hud_data.A_1101_BORROWER_TITLESERVICES#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#get_hud_data.A_1101_SELLER_TITLESERVICES#</td>
</tr>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_01) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_01)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">&nbsp;</td>
<td align="left" class="fourthpage" valign="top" colspan=2>a. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_01#</td>
<td align="right" class="fourthpageright" valign="top">#get_hud_data_b.A_1101_ITEM_AMOUNT_01#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_02) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_02)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">&nbsp;</td>
<td align="left" class="fourthpage" valign="top" colspan=2>b. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_02#</td>
<td align="right" class="fourthpageright" valign="top">#get_hud_data_b.A_1101_ITEM_AMOUNT_02#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_03) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_03)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">&nbsp;</td>
<td align="left" class="fourthpage" valign="top" colspan=2>c. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_03#</td>
<td align="right" class="fourthpageright" valign="top">#get_hud_data_b.A_1101_ITEM_AMOUNT_03#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_04) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_04)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">&nbsp;</td>
<td align="left" class="fourthpage" valign="top" colspan=2>d. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_04#</td>
<td align="right" class="fourthpageright" valign="top">#get_hud_data_b.A_1101_ITEM_AMOUNT_04#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_05) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_05)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">&nbsp;</td>
<td align="left" class="fourthpage" valign="top" colspan=2>e. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_05#</td>
<td align="right" class="fourthpageright" valign="top">#get_hud_data_b.A_1101_ITEM_AMOUNT_05#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_06) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_06)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">&nbsp;</td>
<td align="left" class="fourthpage" valign="top" colspan=2>f. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_06#</td>
<td align="right" class="fourthpageright" valign="top">#get_hud_data_b.A_1101_ITEM_AMOUNT_06#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_07) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_07)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">&nbsp;</td>
<td align="left" class="fourthpage" valign="top" colspan=2>g. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_07#</td>
<td align="right" class="fourthpageright" valign="top">#get_hud_data_b.A_1101_ITEM_AMOUNT_07#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_08) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_08)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">&nbsp;</td>
<td align="left" class="fourthpage" valign="top" colspan=2>h. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_08#</td>
<td align="right" class="fourthpageright" valign="top">#get_hud_data_b.A_1101_ITEM_AMOUNT_08#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_09) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_09)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">&nbsp;</td>
<td align="left" class="fourthpage" valign="top" colspan=2>i. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_09#</td>
<td align="right" class="fourthpageright" valign="top">#get_hud_data_b.A_1101_ITEM_AMOUNT_09#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_10) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_10)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">&nbsp;</td>
<td align="left" class="fourthpage" valign="top" colspan=2>j. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_10#</td>
<td align="right" class="fourthpageright" valign="top">#get_hud_data_b.A_1101_ITEM_AMOUNT_10#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_11) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_11)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">&nbsp;</td>
<td align="left" class="fourthpage" valign="top" colspan=2>k. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_11#</td>
<td align="right" class="fourthpageright" valign="top">#get_hud_data_b.A_1101_ITEM_AMOUNT_11#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_12) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_12)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">&nbsp;</td>
<td align="left" class="fourthpage" valign="top" colspan=2>l. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_12#</td>
<td align="right" class="fourthpageright" valign="top">#get_hud_data_b.A_1101_ITEM_AMOUNT_12#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_13) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_13)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">&nbsp;</td>
<td align="left" class="fourthpage" valign="top" colspan=2>m. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_13#</td>
<td align="right" class="fourthpageright" valign="top">#get_hud_data_b.A_1101_ITEM_AMOUNT_13#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_14) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_14)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">&nbsp;</td>
<td align="left" class="fourthpage" valign="top" colspan=2>n. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_14#</td>
<td align="right" class="fourthpageright" valign="top">#get_hud_data_b.A_1101_ITEM_AMOUNT_14#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_15) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_15)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">&nbsp;</td>
<td align="left" class="fourthpage" valign="top" colspan=2>o. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_15#</td>
<td align="right" class="fourthpageright" valign="top">#get_hud_data_b.A_1101_ITEM_AMOUNT_15#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_16) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_16)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">&nbsp;</td>
<td align="left" class="fourthpage" valign="top" colspan=2>p. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_16#</td>
<td align="right" class="fourthpageright" valign="top">#get_hud_data_b.A_1101_ITEM_AMOUNT_16#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_17) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_17)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">&nbsp;</td>
<td align="left" class="fourthpage" valign="top" colspan=2>q. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_17#</td>
<td align="right" class="fourthpageright" valign="top">#get_hud_data_b.A_1101_ITEM_AMOUNT_17#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_18) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_18)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">&nbsp;</td>
<td align="left" class="fourthpage" valign="top" colspan=2>r. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_18#</td>
<td align="right" class="fourthpageright" valign="top">#get_hud_data_b.A_1101_ITEM_AMOUNT_18#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_19) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_19)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">&nbsp;</td>
<td align="left" class="fourthpage" valign="top" colspan=2>s. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_19#</td>
<td align="right" class="fourthpageright" valign="top">#get_hud_data_b.A_1101_ITEM_AMOUNT_19#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
</cfif>
<cfif Len(get_hud_data_b.A_1101_ITEM_AMOUNT_20) and Len(get_hud_data_b.A_1101_ITEM_DESCRIPTION_20)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">&nbsp;</td>
<td align="left" class="fourthpage" valign="top" colspan=2>t. #get_hud_data_b.A_1101_ITEM_DESCRIPTION_20#</td>
<td align="right" class="fourthpageright" valign="top">#get_hud_data_b.A_1101_ITEM_AMOUNT_20#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
</cfif>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">1102.</td>
<td align="left" class="fourthpage" colspan=2 valign="top">Settlement or Closing Fee</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#get_hud_data.A_1102_OUTSIDE_CLOSINGFEE#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#get_hud_data.A_1102_BORROWER_CLOSINGFEE#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#get_hud_data.A_1102_SELLER_CLOSINGFEE#</td>
</tr>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">1103.</td>
<td align="left" class="fourthpage" colspan=2 valign="top">Owner's title insurance</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#get_hud_data.A_1103_BORROWER_OWNERSTITLEINS#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#get_hud_data.A_1103_SELLER_OWNERSTITLEINS#</td>
</tr>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">1104.</td>
<td align="left" class="fourthpage" valign="top">Lender's title insurance</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#get_hud_data.PRE_ALTA_LENDERS_TITLE_INSURANCE#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#get_hud_data.A_1104_OUTSIDE_LENDERSTITLEINS#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#get_hud_data.A_1104_BORROWER_LENDERSTITLEINS#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#get_hud_data.A_1104_SELLER_LENDERSTITLEINS#</td>
</tr>
<!--- add up altas and display here --->
<cfparam name="get_hud_data.PRE_ALTA_LENDERS_TITLE_INSURANCE" default=0>
<cfset alta_total = 0>
<cfif get_hud_data.A_1109_USERDESC contains 'ALTA' and IsNumeric(get_hud_data.A_1109_BORROWER_USERAMOUNT)>
<cfset alta_total = alta_total + get_hud_data.A_1109_BORROWER_USERAMOUNT>
</cfif>
<cfif get_hud_data.A_1110_USERDESC contains 'ALTA' and IsNumeric(get_hud_data.A_1110_BORROWER_USERAMOUNT)>
<cfset alta_total = alta_total + get_hud_data.A_1110_BORROWER_USERAMOUNT>
</cfif>
<cfif get_hud_data.A_1111_USERDESC contains 'ALTA' and IsNumeric(get_hud_data.A_1111_BORROWER_USERAMOUNT)>
<cfset alta_total = alta_total + get_hud_data.A_1111_BORROWER_USERAMOUNT>
</cfif>
<cfif get_hud_data.A_1112_USERDESC contains 'ALTA' and IsNumeric(get_hud_data.A_1112_BORROWER_USERAMOUNT)>
<cfset alta_total = alta_total + get_hud_data.A_1112_BORROWER_USERAMOUNT>
</cfif>
<cfif get_hud_data.A_1113_USERDESC contains 'ALTA' and IsNumeric(get_hud_data.A_1113_BORROWER_USERAMOUNT)>
<cfset alta_total = alta_total + get_hud_data.A_1113_BORROWER_USERAMOUNT>
</cfif>
<cfif get_hud_data.A_1114_USERDESC contains 'ALTA' and IsNumeric(get_hud_data.A_1114_BORROWER_USERAMOUNT)>
<cfset alta_total = alta_total + get_hud_data.A_1114_BORROWER_USERAMOUNT>
</cfif>
<cfif get_hud_data.A_1115_USERDESC contains 'ALTA' and IsNumeric(get_hud_data.A_1115_BORROWER_USERAMOUNT)>
<cfset alta_total = alta_total + get_hud_data.A_1115_BORROWER_USERAMOUNT>
</cfif>
<cfif get_hud_data.A_1116_USERDESC contains 'ALTA' and IsNumeric(get_hud_data.A_1116_BORROWER_USERAMOUNT)>
<cfset alta_total = alta_total + get_hud_data.A_1116_BORROWER_USERAMOUNT>
</cfif>
<cfif get_hud_data.A_1117_USERDESC contains 'ALTA' and IsNumeric(get_hud_data.A_1117_BORROWER_USERAMOUNT)>
<cfset alta_total = alta_total + get_hud_data.A_1117_BORROWER_USERAMOUNT>
</cfif>
<cfif get_hud_data.A_1118_USERDESC contains 'ALTA' and IsNumeric(get_hud_data.A_1118_BORROWER_USERAMOUNT)>
<cfset alta_total = alta_total + get_hud_data.A_1118_BORROWER_USERAMOUNT>
</cfif>
<cfif get_hud_data.A_1119_USERDESC contains 'ALTA' and IsNumeric(get_hud_data.A_1119_BORROWER_USERAMOUNT)>
<cfset alta_total = alta_total + get_hud_data.A_1119_BORROWER_USERAMOUNT>
</cfif>
<cfif get_hud_data.A_1120_USERDESC contains 'ALTA' and IsNumeric(get_hud_data.A_1120_BORROWER_USERAMOUNT)>
<cfset alta_total = alta_total + get_hud_data.A_1120_BORROWER_USERAMOUNT>
</cfif>
<cfif get_hud_data.A_1121_USERDESC contains 'ALTA' and IsNumeric(get_hud_data.A_1121_BORROWER_USERAMOUNT)>
<cfset alta_total = alta_total + get_hud_data.A_1121_BORROWER_USERAMOUNT>
</cfif>
<cfif get_hud_data.A_1122_USERDESC contains 'ALTA' and IsNumeric(get_hud_data.A_1122_BORROWER_USERAMOUNT)>
<cfset alta_total = alta_total + get_hud_data.A_1122_BORROWER_USERAMOUNT>
</cfif>
<cfset ti_total = get_hud_data.PRE_ALTA_LENDERS_TITLE_INSURANCE>
<cfif alta_total neq 0>
<cfset ti_total = alta_total + get_hud_data.PRE_ALTA_LENDERS_TITLE_INSURANCE>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">&nbsp;</td>
<td align="left" class="fourthpage" valign="top">Endorsements Itemized Below</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#alta_total#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
</cfif>
<cfif alta_total neq 0>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">&nbsp;</td>
<td align="left" class="fourthpage" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#ti_total#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
</cfif>
<tr>
<td align="left" class="fourthpage" valign="top" colspan="6">&nbsp;</td>
</tr>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">1105.</td>
<td align="left" class="fourthpage" valign="top" colspan=3>Lender's Policy Limit $#get_hud_data.A_1105_LENDERSTITLEPOLICYLIMIT#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">1106.</td>
<td align="left" class="fourthpage" valign="top" colspan=3>Owner's Policy Limit $#get_hud_data.A_1106_OWNERSTITLEPOLICYLIMIT#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">1107.</td>
<td align="left" class="fourthpage" valign="top">Agent's portion of the total title insurance premium</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#get_hud_data.A_1107_AGENTPREMIUMPORTION#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">1108.</td>
<td align="left" class="fourthpage" valign="top">Underwriter's portion of the total title insurance premium</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#get_hud_data.A_1108_UNDERWRITERPREMIUMPORTION#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
<!--- <tr>
<td align="left" class="fourthpage" valign="top" width="45">&nbsp;</td>
<td align="left" class="fourthpage" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#ti_total#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
</tr>
 ---><tr>
<td align="left" class="fourthpage" valign="top" colspan="6">&nbsp;</td>
</tr>
<cfif Len(get_hud_data.A_1109_USERDESC)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">1109.</td>
<td align="left" class="fourthpage" valign="top">#get_hud_data.A_1109_USERDESC# to #get_hud_data.A_1109_USERPAYTO#</td>
<cfif get_hud_data.A_1109_USERDESC contains 'ALTA'>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1109_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<cfelse>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1109_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
</cfif>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1109_BORROWER_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1109_SELLER_USERAMOUNT, "___,___.00")#</td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1110_USERDESC)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">1110.</td>
<td align="left" class="fourthpage" valign="top">#get_hud_data.A_1110_USERDESC# to #get_hud_data.A_1110_USERPAYTO#</td>
<cfif get_hud_data.A_1110_USERDESC contains 'ALTA'>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1110_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<cfelse>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1110_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
</cfif>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1110_BORROWER_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1110_SELLER_USERAMOUNT, "___,___.00")#</td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1111_USERDESC)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">1111.</td>
<td align="left" class="fourthpage" valign="top">#get_hud_data.A_1111_USERDESC# to #get_hud_data.A_1111_USERPAYTO#</td>
<cfif get_hud_data.A_1111_USERDESC contains 'ALTA'>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1111_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<cfelse>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1111_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
</cfif>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1111_BORROWER_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1111_SELLER_USERAMOUNT, "___,___.00")#</td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1112_USERDESC)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">1112.</td>
<td align="left" class="fourthpage" valign="top">#get_hud_data.A_1112_USERDESC# to #get_hud_data.A_1112_USERPAYTO#</td>
<cfif get_hud_data.A_1112_USERDESC contains 'ALTA'>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1112_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<cfelse>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1112_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
</cfif>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1112_BORROWER_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1112_SELLER_USERAMOUNT, "___,___.00")#</td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1113_USERDESC)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">1113.</td>
<td align="left" class="fourthpage" valign="top">#get_hud_data.A_1113_USERDESC# to #get_hud_data.A_1113_USERPAYTO#</td>
<cfif get_hud_data.A_1113_USERDESC contains 'ALTA'>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1113_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<cfelse>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1113_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
</cfif>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1113_BORROWER_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1113_SELLER_USERAMOUNT, "___,___.00")#</td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1114_USERDESC)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">1114.</td>
<td align="left" class="fourthpage" valign="top">#get_hud_data.A_1114_USERDESC# to #get_hud_data.A_1114_USERPAYTO#</td>
<cfif get_hud_data.A_1114_USERDESC contains 'ALTA'>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1114_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<cfelse>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1114_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
</cfif>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1114_BORROWER_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1114_SELLER_USERAMOUNT, "___,___.00")#</td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1115_USERDESC)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">1115.</td>
<td align="left" class="fourthpage" valign="top">#get_hud_data.A_1115_USERDESC# to #get_hud_data.A_1115_USERPAYTO#</td>
<cfif get_hud_data.A_1115_USERDESC contains 'ALTA'>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1115_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<cfelse>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1115_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
</cfif>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1115_BORROWER_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1115_SELLER_USERAMOUNT, "___,___.00")#</td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1116_USERDESC)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">1116.</td>
<td align="left" class="fourthpage" valign="top">#get_hud_data.A_1116_USERDESC# to #get_hud_data.A_1116_USERPAYTO#</td>
<cfif get_hud_data.A_1116_USERDESC contains 'ALTA'>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1116_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<cfelse>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1116_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
</cfif>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1116_BORROWER_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1116_SELLER_USERAMOUNT, "___,___.00")#</td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1117_USERDESC)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">1117.</td>
<td align="left" class="fourthpage" valign="top">#get_hud_data.A_1117_USERDESC# to #get_hud_data.A_1117_USERPAYTO#</td>
<cfif get_hud_data.A_1117_USERDESC contains 'ALTA'>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1117_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<cfelse>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1117_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
</cfif>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1117_BORROWER_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1117_SELLER_USERAMOUNT, "___,___.00")#</td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1118_USERDESC)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">1118.</td>
<td align="left" class="fourthpage" valign="top">#get_hud_data.A_1118_USERDESC# to #get_hud_data.A_1118_USERPAYTO#</td>
<cfif get_hud_data.A_1118_USERDESC contains 'ALTA'>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1118_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<cfelse>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1118_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
</cfif>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1118_BORROWER_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1118_SELLER_USERAMOUNT, "___,___.00")#</td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1119_USERDESC)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">1119.</td>

<td align="left" class="fourthpage" valign="top">#get_hud_data.A_1119_USERDESC# to #get_hud_data.A_1119_USERPAYTO#</td>
<cfif get_hud_data.A_1119_USERDESC contains 'ALTA'>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1119_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<cfelse>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1119_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
</cfif>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1119_BORROWER_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1119_SELLER_USERAMOUNT, "___,___.00")#</td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1120_USERDESC)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">1120.</td>
<td align="left" class="fourthpage" valign="top">#get_hud_data.A_1120_USERDESC# to #get_hud_data.A_1120_USERPAYTO#</td>
<cfif get_hud_data.A_1120_USERDESC contains 'ALTA'>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1120_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<cfelse>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1120_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
</cfif>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1120_BORROWER_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1120_SELLER_USERAMOUNT, "___,___.00")#</td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1121_USERDESC)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">1121.</td>
<td align="left" class="fourthpage" valign="top">#get_hud_data.A_1121_USERDESC# to #get_hud_data.A_1121_USERPAYTO#</td>
<cfif get_hud_data.A_1121_USERDESC contains 'ALTA'>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1121_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<cfelse>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1121_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
</cfif>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1121_BORROWER_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1121_SELLER_USERAMOUNT, "___,___.00")#</td>
</tr>
</cfif>
<cfif Len(get_hud_data.A_1122_USERDESC)>
<tr>
<td align="left" class="fourthpage" valign="top" width="45">1122.</td>
<td align="left" class="fourthpage" valign="top">#get_hud_data.A_1122_USERDESC# to #get_hud_data.A_1122_USERPAYTO#</td>
<cfif get_hud_data.A_1122_USERDESC contains 'ALTA'>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1122_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<cfelse>
<td align="right" class="fourthpageright" valign="top">&nbsp;</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1122_OUTSIDE_USERAMOUNT, "___,___.00")#</td>
</cfif>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1122_BORROWER_USERAMOUNT, "___,___.00")#</td>
<td align="right" class="fourthpageright" valign="top">&nbsp;#FixDecimals(get_hud_data.A_1122_SELLER_USERAMOUNT, "___,___.00")#</td>
</tr>
</cfif>



</table>

<b>Note</b>: If you have any questions about the Settlement Charges and Loan Terms listed on this form, please contact your lender.

</form>

</div> <!-- page_container -->

</body>
</html>
</cfoutput>