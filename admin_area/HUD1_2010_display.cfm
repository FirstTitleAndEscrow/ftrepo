<cfsetting enablecfoutputonly="true">

<cfparam name="url.rec_id" type="integer" default="0">
<cfparam name="form.rec_id" type="integer" default="#url.rec_id#">

<cfparam name="url.strEmailAddress" default="">
<cfparam name="form.strEmailAddress" default="#url.strEmailAddress#">

<cfset variables.pdffilename = "T-#form.rec_id#-HUD1.pdf">

<cfif IsDefined('form.submit')>
	<cfdocument format="pdf" name="PDF_OUT" pagetype="legal">
		<cfinclude template="HUD1_2010_PDF.cfm">
	</cfdocument>
</cfif>

<cfif Len(Trim(form.strEmailAddress))>

	<cfset variables.boundary = CreateUUID()>

		<cfmail to="#Trim(form.strEmailAddress)#"
				from="noreply@firsttitleservices.com"
				subject="T-#form.rec_id# : HUD1 Form">

  			<cfmailpart type="multipart/mixed; boundary=#CHR(34)##variables.boundary##CHR(34)#">
This is a multi-part message in MIME format.

--#boundary#
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Your HUD-1 for file: T-#rec_id# is attached. To get the latest PDF viewer, visit https://www.adobe.com

--#boundary#
Content-Type: application/pdf
Content-Disposition: attachment; filename=#variables.pdffilename#
Content-Transfer-Encoding: Base64

#BinaryEncode(PDF_OUT, "Base64")#

--#boundary#--
  	 		</cfmailpart>

			<cfmailpart type="application/x-unsupported">
This should not be rendered by a mail user agent because it does not support the MIME-type.
   			</cfmailpart>

		</cfmail>


<cfelseif IsDefined('form.submit')>

	<cfheader name="Content-Disposition" value="attachment; filename=#variables.pdffilename#">
	<cfcontent type="application/pdf" variable="#PDF_OUT#">
	<cfabort>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="get_title_data">
	SELECT title_id, loan_number, paddress, pcounty, pcity, pstate, pzip
	FROM title
	WHERE Title_ID = #form.rec_id#
</CFQUERY>

<cfoutput>

<CFQUERY datasource="#request.dsn#" NAME="get_hud_data">
	SELECT *
	FROM HUD2010_TITLE_DATA
	WHERE Title_ID = #form.rec_id#
</CFQUERY>
<cfloop query="get_hud_data">
	<cfloop list="#get_hud_data.columnlist#" index="c">
		<cfset t = Evaluate(c)>
		<cfif Trim(t) EQ "">
			<cfset get_hud_data['#c#'][#get_hud_data.currentrow#] = "&nbsp;">
		<cfelseif NOT IsNumeric(t) AND IsDate(t)>
			<cfset get_hud_data['#c#'][#get_hud_data.currentrow#] = DateFormat(t,'m/d/yyyy')>
		</cfif>
	</cfloop>
</cfloop>

<CFQUERY datasource="#request.dsn#" NAME="get_hud_data_b">
	SELECT *
	FROM HUD2010_TITLE_DATA_B
	WHERE Title_ID = #form.rec_id#
</CFQUERY>
<cfloop query="get_hud_data_b">
	<cfloop list="#get_hud_data_b.columnlist#" index="c">
		<cfset t = Evaluate(c)>
		<cfif Trim(t) EQ "">
			<cfset get_hud_data_b['#c#'][#get_hud_data_b.currentrow#] = "&nbsp;">
		<cfelseif NOT IsNumeric(t) AND IsDate(t)>
			<cfset get_hud_data_b['#c#'][#get_hud_data_b.currentrow#] = DateFormat(t,'m/d/yyyy')>
		</cfif>
	</cfloop>
</cfloop>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"https://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Settlement Statement (HUD-1)</title>
<style type="text/css">
<!--
body { margin:0px;padding:0px;font-family:arial,sans-serif;font-size:10px;}
table { font-size:10px;}
p.pagebreak { page-break-before:always }
.page_container { width: 670px; }
.page_title { font-size:20px; }
.table_header { font-weight:bold; background-color:black; color:white; }
.bsilver { border-right:1px solid black; border-left:1px solid black; border-bottom:1px solid black;  background-color:##dddddd; }
.bdarksilver { border:1px solid black; background-color:##bbbbbb; }
.bdarksilver_head { border:1px solid black; font-weight:bold; background-color:##bbbbbb; }
.black { font-weight:bold; background-color:black; color:white; }
.bordered { border-bottom:1px solid black; border-right:1px solid black; text-align:right; vertical-align:bottom;  }
.bordered_wleft { border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; text-align:right; vertical-align:bottom;  }
.entry { color: blue; height: 10px; }
-->
</style>
	</head>
	<body>

	</center>
	<h2>My 2010 HUD-1 for T-#form.rec_id#</h2>
<hr />
My HUD-1 Options
<hr />

	<cfform name="hudoutput" id="hudoutput" action="#cgi.SCRIPT_NAME#" method="post">
		<input name="rec_id" type="hidden" value="#form.rec_id#">
	1. Return to <a href="HUD1_2010_modify.cfm?rec_id=#form.rec_id#">Edit my HUD-1</a>
		<br / >
		2. Print or Download a PDF of my HUD-1 (Click the Button Below - Email Address field must be empty)
		<br />
		3. Email a PDF of my HUD-1 (Enter an email address, then click the button below)
		<br /><br />
		<cfinput name="submit"
			type="submit"
			value="Download or Email PDF" />

		Email Address (Optional):
		<cfinput name = "strEmailAddress"
   			type = "Text"
  		 	message = "Enter a valid e-mail address of the form: name@server.domain"
   			validate = "email"
			required = "no">




	</cfform>
<hr />
My HUD-1 Preview
<hr />
<div class="page_container">

<form>

<!-- TABLE: Type of Loan -->
<table width="100%" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td colspan="4" class="black">B. Type of Loan</td>
</tr>
<tr>
<td>
	<table summary="Loan Types" cellpadding="0" cellspacing="0">
	<tr>
	<td><input type="checkbox" disabled="true" name="B_LOANTYPE" value="FHA" <cfif get_hud_data.B_LOANTYPE eq 'FHA'>checked</cfif> /></td><td>FHA</td>
	<td><input type="checkbox" disabled="true" name="B_LOANTYPE" value="RHS" <cfif get_hud_data.B_LOANTYPE eq 'RHS'>checked</cfif> /></td><td>RHS</td>
	<td><input type="checkbox" disabled="true" name="B_LOANTYPE" value="COU" <cfif get_hud_data.B_LOANTYPE eq 'COU'>checked</cfif> /></td><td>Conv. Unins.</td>
	<tr>
	<tr>
	<td><input type="checkbox" disabled="true" name="B_LOANTYPE" value="VA" <cfif get_hud_data.B_LOANTYPE eq 'VA'>checked</cfif> /></td><td>VA</td>
	<td><input type="checkbox" disabled="true" name="B_LOANTYPE" value="COI" <cfif get_hud_data.B_LOANTYPE eq 'COI'>checked</cfif> /></td><td>Conv. Ins.</td>
	<tr>
	</table>
</td>
<td>6. File Number:<br /><span class="entry">#get_title_data.title_id#</span></td>
<td>7. Loan Number:<br /><span class="entry">#get_title_data.loan_number#</span></td>
<td>8. Mortgage Insurance Case Number: <br /><span class="entry">#get_hud_data.B_8_CASENUMBER#</span></td>
</tr>
<tr>
<td colspan="4"><b>C. Note:</b> This form is furnished to give you a statement of actual settlement costs. Amounts paid to and by the settlement agent are shown. Items marked
"(p.o.c.)" were paid outside the closing; they are shown here for informational purposes and are not included in the totals.</td>
</tr>
<tr>
<td>D. Name &amp; Address of Borrower: <br /> <span class="entry">#get_hud_data.D_BORROWERNAMEADDRESS#</span> </td>
<td colspan="2">E. Name &amp; Address of Seller: <br /> <span class="entry">#get_hud_data.E_SELLERNAMEADDRESS#</span></td>
<td>F. Name &amp; Address of Lender: <br /> <span class="entry">#get_hud_data.F_LENDERNAMEADDRESS#</span> </td>
</tr>
<tr>
<td rowspan="2" valign="top">G. Property Location: <br />
<span class="entry">#get_title_data.PADDRESS#</span><br />
<!---<span class="entry">#get_title_data.PCOUNTY#</span><br />--->
<span class="entry">#get_title_data.PCITY#</span>
<span class="entry">#get_title_data.PSTATE#</span>
<span class="entry">#get_title_data.PZIP#</span>
</td>
<td colspan="2">H. Settlement Agent: <br /> <span class="entry">#get_hud_data.H_SETTLEMENTAGENT#</span> </td>
<td>I. Settlement Date: <br /> <span class="entry"><cfif get_hud_data.I_1_SETTLEMENTDATE NEQ 'NULL'>#get_hud_data.I_1_SETTLEMENTDATE#</cfif></span></td>
</tr>
<tr>
<td colspan="2">Place of Settlement: <br /> <span class="entry">#get_hud_data.I_2_SETTLEMENTADDRESS#</span></td>
<td>&nbsp;</td>
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
<td class="bordered" width="10%"><span class="entry">#Trim(get_hud_data.A_0101_CONTRACTSALESPRICE)#</span></td>
<td></td>
<td class="bsilver">401. Contract sales price</td>
<td class="bordered" width="10%"><span class="entry">#get_hud_data.A_0401_CONTRACTSALESPRICE#</span></td>
</tr>
<tr>
<td class="bsilver">102. <cfif (get_title_data.comp_id eq 3722 or get_title_data.comp_id eq 4702 or get_title_data.comp_id eq 4752) and Len(get_title_data.share_loan_payoff)>Personal Share Loan Payoff<cfelse>Personal property</cfif></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0102_PERSONALPROPERTY#</span></td>
<td></td>
<td class="bsilver">402. Personal property</td>
<td class="bordered"><span class="entry">#get_hud_data.A_0402_PERSONALPROPERTY#</span></td>
</tr>
<tr>
<td class="bsilver">103. Settlement charges to borrower (line 1400)</td>
<td class="bordered"><span class="entry">#get_hud_data.A_0103_SETTLEMENTCHARGESTOBORROWER#</span></td>
<td></td>
<td class="bsilver">403. <span class="entry">#get_hud_data.A_0403_USERDESC#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0403_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">104.<span class="entry">#get_hud_data.A_0104_USERDESC#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0104_USERAMOUNT#</span></td>
<td></td>
<td class="bsilver">404.<span class="entry">#get_hud_data.A_0404_USERDESC#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0404_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">105.<span class="entry">#get_hud_data.A_0105_USERDESC#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0105_USERAMOUNT#</span></td>
<td></td>
<td class="bsilver">405. <span class="entry">#get_hud_data.A_0405_USERDESC#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0405_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver" colspan="2" style="font-weight:bold;">Adjustment for items paid by seller in advance</td>
<td></td>
<td class="bsilver" colspan="2" style="font-weight:bold;">Adjustments for items paid by seller in advance</td>
</tr>
<tr>
<td class="bsilver">106. City/town taxes
<span class="entry"><cfif get_hud_data.A_0106_CITYTOWNTAXESDATEFROM NEQ 'NULL'>#get_hud_data.A_0106_CITYTOWNTAXESDATEFROM#</cfif></span>
to <span class="entry"><cfif get_hud_data.A_0106_CITYTOWNTAXESDATETO NEQ 'NULL'>#get_hud_data.A_0106_CITYTOWNTAXESDATETO#</cfif></span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0106_CITYTOWNTAXESAMOUNT#</span></td>
<td></td>
<td class="bsilver">406. City/town taxes
<span class="entry"><cfif get_hud_data.A_0406_CITYTOWNTAXESDATEFROM NEQ 'NULL'>#get_hud_data.A_0406_CITYTOWNTAXESDATEFROM#</cfif></span>
to <span class="entry"><cfif get_hud_data.A_0406_CITYTOWNTAXESDATETO NEQ 'NULL'>#get_hud_data.A_0406_CITYTOWNTAXESDATETO#</cfif></span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0406_CITYTOWNTAXESAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">107. County taxes
<span class="entry"><cfif get_hud_data.A_0107_COUNTYTAXESDATEFROM NEQ 'NULL'>#get_hud_data.A_0107_COUNTYTAXESDATEFROM#</cfif></span>
to <span class="entry"><cfif get_hud_data.A_0107_COUNTYTAXESDATETO NEQ 'NULL'>#get_hud_data.A_0107_COUNTYTAXESDATETO#</cfif></span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0107_COUNTYTAXESAMOUNT#</span></td>
<td></td>
<td class="bsilver">407. County taxes
<span class="entry"><cfif get_hud_data.A_0407_COUNTYTAXESDATEFROM NEQ 'NULL'>#get_hud_data.A_0407_COUNTYTAXESDATEFROM#</cfif></span>
to <span class="entry"><cfif get_hud_data.A_0407_COUNTYTAXESDATETO NEQ 'NULL'>#get_hud_data.A_0407_COUNTYTAXESDATETO#</cfif></span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0407_COUNTYTAXESAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">108. Assessments
<span class="entry"><cfif get_hud_data.A_0108_ASSESSMENTSDATEFROM NEQ 'NULL'>#get_hud_data.A_0108_ASSESSMENTSDATEFROM#</cfif></span>
to <span class="entry"><cfif get_hud_data.A_0108_ASSESSMENTSDATETO NEQ 'NULL'>#get_hud_data.A_0108_ASSESSMENTSDATETO#</cfif></span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0108_ASSESSMENTSAMOUNT#</span></td>
<td></td>
<td class="bsilver">408. Assessments
<span class="entry"><cfif get_hud_data.A_0408_ASSESSMENTSDATEFROM NEQ 'NULL'>#get_hud_data.A_0408_ASSESSMENTSDATEFROM#</cfif></span>
to <span class="entry"><cfif get_hud_data.A_0408_ASSESSMENTSDATETO NEQ 'NULL'>#get_hud_data.A_0408_ASSESSMENTSDATETO#</cfif></span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0408_ASSESSMENTSAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">109. <span class="entry">#get_hud_data.A_0109_USERDESC#</span>
 to <span class="entry">#get_hud_data.A_0109_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0109_USERAMOUNT#</span></td>
<td></td>
<td class="bsilver">409. <span class="entry">#get_hud_data.A_0409_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0409_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0409_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">110. <span class="entry">#get_hud_data.A_0110_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0110_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0110_USERAMOUNT#</span></td>
<td></td>
<td class="bsilver">410. <span class="entry">#get_hud_data.A_0410_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0410_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0410_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">111. <span class="entry">#get_hud_data.A_0111_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0111_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0111_USERAMOUNT#</span></td>
<td></td>
<td class="bsilver">411. <span class="entry">#get_hud_data.A_0411_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0411_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0411_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">112. <span class="entry">#get_hud_data.A_0112_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0112_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0112_USERAMOUNT#</span></td>
<td></td>
<td class="bsilver">412. <span class="entry">#get_hud_data.A_0412_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0412_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0412_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver" style="font-weight:bold;">120. Gross Amount Due from Borrower</td>
<td class="bordered"><span class="entry">#get_hud_data.A_0120_GROSS_BORROWER_DUE_AMOUNT#</span></td>
<td></td>
<td class="bsilver" style="font-weight:bold;">420. Gross Amount Due to Seller</td>
<td class="bordered"><span class="entry">#get_hud_data.A_0420_GROSS_SELLER_DUE_AMOUNT#</span></td>
</tr>
<!-- 200 / 500 -->

<tr>
<td colspan="2" class="bdarksilver_head">200. Amounts Paid by or in Behalf of Borrower</td>
<td></td>
<td colspan="2" class="bdarksilver_head">500. Reductions In Amount Due to Seller</td>
</tr>
<tr>
<td class="bsilver">201. Deposit or earnest money</td>
<td class="bordered"><span class="entry">#get_hud_data.A_0201_EARNESTMONEYAMOUNT#</span></td>
<td></td>
<td class="bsilver">501. Excess deposit (see instructions)</td>
<td class="bordered"><span class="entry">#get_hud_data.A_0501_EXCESSDEPOSITAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">202. Principal amount of new loan(s)</td>
<td class="bordered"><span class="entry">#get_hud_data.A_0202_PRINCIPALNEWLOANAMOUNT#</span></td>
<td></td>
<td class="bsilver">502. Settlement charges to seller (line 1400)</td>
<td class="bordered"><span class="entry">#get_hud_data.A_0502_SETTLEMENTCHARGESTOSELLERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">203. Existing loan(s) taken subject to</td>
<td class="bordered"><span class="entry">#get_hud_data.A_0203_EXISTINGLOANSAMOUNT#</span></td>
<td></td>
<td class="bsilver">503. Existing loan(s) taken subject to</td>
<td class="bordered"><span class="entry">#get_hud_data.A_0503_EXISTINGLOANSAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">204. <span class="entry">#get_hud_data.A_0204_USERDESC#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0204_USERAMOUNT#</span></td>
<td></td>
<td class="bsilver">504. Payoff of first mortgage loan</td>
<td class="bordered"><span class="entry">#get_hud_data.A_0504_PAYOFFFIRSTMORTGAGEAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">205. <span class="entry">#get_hud_data.A_0205_USERDESC#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0205_USERAMOUNT#</span></td>
<td></td>
<td class="bsilver">505. Payoff of second mortgage loan</td>
<td class="bordered"><span class="entry">#get_hud_data.A_0505_PAYOFFSECONDMORTGAGEAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">206. <span class="entry">#get_hud_data.A_0206_USERDESC#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0206_USERAMOUNT#</span></td>
<td></td>
<td class="bsilver">506. <span class="entry">#get_hud_data.A_0506_USERDESC#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0506_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">207. <span class="entry">#get_hud_data.A_0207_USERDESC#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0207_USERAMOUNT#</span></td>
<td></td>
<td class="bsilver">507. <span class="entry">#get_hud_data.A_0507_USERDESC#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0507_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">208. <span class="entry">#get_hud_data.A_0208_USERDESC#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0208_USERAMOUNT#</span></td>
<td></td>
<td class="bsilver">508. <span class="entry">#get_hud_data.A_0508_USERDESC#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0508_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">209. <span class="entry">#get_hud_data.A_0209_USERDESC#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0209_USERAMOUNT#</span></td>
<td></td>
<td class="bsilver">509. <span class="entry">#get_hud_data.A_0509_USERDESC#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0509_USERAMOUNT#</span></td>
</tr>

<!-- Adjustments 200 / 500 -->

<tr>
<td class="bsilver" colspan="2" style="font-weight:bold;">Adjustments for items unpaid by seller</td>
<td></td>
<td class="bsilver" colspan="2" style="font-weight:bold;">Adjustments for items unpaid by seller</td>
</tr>
<tr>
<td class="bsilver">210. City/town taxes
<span class="entry"><cfif get_hud_data.A_0210_CITYTOWNTAXESDATEFROM NEQ 'NULL'>#get_hud_data.A_0210_CITYTOWNTAXESDATEFROM#</cfif></span>
 to <span class="entry"><cfif get_hud_data.A_0210_CITYTOWNTAXESDATETO NEQ 'NULL'>#get_hud_data.A_0210_CITYTOWNTAXESDATETO#</cfif></span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0210_CITYTOWNTAXESAMOUNT#</span></td>
<td></td>
<td class="bsilver">510. City/town taxes
<span class="entry"><cfif get_hud_data.A_0510_CITYTOWNTAXESDATEFROM NEQ 'NULL'>#get_hud_data.A_0510_CITYTOWNTAXESDATEFROM#</cfif></span>
to <span class="entry"><cfif get_hud_data.A_0510_CITYTOWNTAXESDATETO NEQ 'NULL'>#get_hud_data.A_0510_CITYTOWNTAXESDATETO#</cfif></span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0510_CITYTOWNTAXESAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">211. County taxes
<span class="entry"><cfif get_hud_data.A_0211_COUNTYTAXESDATEFROM NEQ 'NULL'>#get_hud_data.A_0211_COUNTYTAXESDATEFROM#</cfif></span>
to <span class="entry"><cfif get_hud_data.A_0211_COUNTYTAXESDATETO NEQ 'NULL'>#get_hud_data.A_0211_COUNTYTAXESDATETO#</cfif></span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0211_COUNTYTAXESAMOUNT#</span></td>
<td></td>
<td class="bsilver">511. County taxes
<span class="entry"><cfif get_hud_data.A_0511_COUNTYTAXESDATEFROM NEQ 'NULL'>#get_hud_data.A_0511_COUNTYTAXESDATEFROM#</cfif></span>
to <span class="entry"><cfif get_hud_data.A_0511_COUNTYTAXESDATETO NEQ 'NULL'>#get_hud_data.A_0511_COUNTYTAXESDATETO#</cfif></span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0511_COUNTYTAXESAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">212. Assessments
<span class="entry"><cfif get_hud_data.A_0212_ASSESSMENTSDATEFROM NEQ 'NULL'>#get_hud_data.A_0212_ASSESSMENTSDATEFROM#</cfif></span>
to <span class="entry"><cfif get_hud_data.A_0212_ASSESSMENTSDATETO NEQ 'NULL'>#get_hud_data.A_0212_ASSESSMENTSDATETO#</cfif></span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0212_ASSESSMENTSAMOUNT#</span></td>
<td></td>
<td class="bsilver">512. Assessments
<span class="entry"><cfif get_hud_data.A_0512_ASSESSMENTSDATEFROM NEQ 'NULL'>#get_hud_data.A_0512_ASSESSMENTSDATEFROM#</cfif></span>
to <span class="entry"><cfif get_hud_data.A_0512_ASSESSMENTSDATETO NEQ 'NULL'>#get_hud_data.A_0512_ASSESSMENTSDATETO#</cfif></span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0512_ASSESSMENTSAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">213. <span class="entry">#get_hud_data.A_0213_USERDESC#</span>
 to <span class="entry">#get_hud_data.A_0213_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0213_USERAMOUNT#</span></td>
<td></td>
<td class="bsilver">513. <span class="entry">#get_hud_data.A_0513_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0513_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0513_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">214. <span class="entry">#get_hud_data.A_0214_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0214_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0214_USERAMOUNT#</span></td>
<td></td>
<td class="bsilver">514.  <span class="entry">#get_hud_data.A_0514_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0514_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0514_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">215. <span class="entry">#get_hud_data.A_0215_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0215_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0215_USERAMOUNT#</span></td>
<td></td>
<td class="bsilver">515.  <span class="entry">#get_hud_data.A_0515_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0515_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0515_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">216. <span class="entry">#get_hud_data.A_0216_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0216_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0216_USERAMOUNT#</span></td>
<td></td>
<td class="bsilver">516.  <span class="entry">#get_hud_data.A_0516_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0516_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0516_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">217. <span class="entry">#get_hud_data.A_0217_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0217_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0217_USERAMOUNT#</span></td>
<td></td>
<td class="bsilver">517.  <span class="entry">#get_hud_data.A_0517_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0517_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0517_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">218. <span class="entry">#get_hud_data.A_0218_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0218_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0218_USERAMOUNT#</span></td>
<td></td>
<td class="bsilver">518.  <span class="entry">#get_hud_data.A_0518_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0518_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0518_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">219. <span class="entry">#get_hud_data.A_0219_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0219_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0219_USERAMOUNT#</span></td>
<td></td>
<td class="bsilver">519. <span class="entry">#get_hud_data.A_0519_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0519_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0519_USERAMOUNT#</span></td>
</tr>

<tr>
<td class="bsilver"><br /><b>220. Total Paid by/for Seller</b></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0220_TOTALPAIDBYSELLERAMOUNT#</span></td>
<td></td>
<td class="bsilver"><br /><b>520. Total Reduction Amount Due Seller</b></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0520_REDUCTIONDUESELLERAMOUNT#</span></td>
</tr>

<!-- Cash at Settlement -->

<tr>
<td colspan="2" class="bdarksilver_head">300. Cash at Settlement from/to Borrower</td>
<td></td>
<td colspan="2" class="bdarksilver_head">600. Cash at Settlement to/from Seller</td>
</tr>
<tr>
<td class="bsilver">301. Gross amount due from borrower (line 120)</td>
<td class="bordered"><span class="entry">#get_hud_data.A_0301_GROSSDUEFROMBORROWERAMOUNT#</span></td>
<td></td>
<td class="bsilver">601. Gross amount due to seller (line 420)</td>
<td class="bordered"><span class="entry">#get_hud_data.A_0601_GROSSDUETOSELLERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">302. Less amounts paid by/for borrower (line 220)</td>
<td class="bordered"><span class="entry">#get_hud_data.A_0302_LESSPAIDBYBORROWERAMOUNT#</span></td>
<td></td>
<td class="bsilver">602. Less reductions in amount due seller (line 520)</td>
<td class="bordered"><span class="entry">#get_hud_data.A_0602_LESSREDUCTIONSDUESELLERAMOUNT#</span></td>
</tr>
<tr>
<td height="30" valign="middle" class="bsilver" style="font-weight:bold;">303. Cash
<input type="checkbox" disabled="true" name="A_0303_CASHTOFROM" value="FROM" onclick="document.hud1_form.A_0603_CASHTOFROM[0].checked = true;" <cfif get_hud_data.A_0303_CASHTOFROM eq 'FROM'>CHECKED</cfif> /> From
<input type="checkbox" disabled="true" name="A_0303_CASHTOFROM" value="TO"   onclick="document.hud1_form.A_0603_CASHTOFROM[1].checked = true;" <cfif get_hud_data.A_0303_CASHTOFROM eq 'TO'>CHECKED</cfif> />To Borrower</td>
<td class="bordered"><span class="entry">#get_hud_data.A_0303_CASHAMOUNT#</span></td>
<td></td>
<td height="30" valign="middle" class="bsilver" style="font-weight:bold;">603. Cash
<input type="checkbox" disabled="true" name="A_0603_CASHTOFROM" value="TO"   onclick="document.hud1_form.A_0303_CASHTOFROM[0].checked = true;" <cfif get_hud_data.A_0603_CASHTOFROM eq 'TO' >CHECKED</cfif> />To
<input type="checkbox" disabled="true" name="A_0603_CASHTOFROM" value="FROM" onclick="document.hud1_form.A_0303_CASHTOFROM[1].checked = true;" <cfif get_hud_data.A_0603_CASHTOFROM eq 'FROM' >CHECKED</cfif> />From Seller</td>
<td class="bordered"><span class="entry">#get_hud_data.A_0603_CASHAMOUNT#</span></td>
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
<td class="bsilver">701. $<span class="entry">#get_hud_data.A_0701_COMMISSIONAMOUNT#</span>
to <span class="entry">#get_hud_data.A_0701_COMMISSIONPAYTO#</span></td>
</tr>
<tr>
<td class="bsilver">702. $<span class="entry">#get_hud_data.A_0702_COMMISSIONAMOUNT#</span>
to <span class="entry">#get_hud_data.A_0702_COMMISSIONPAYTO#</span></td>
</tr>
<tr>
<td class="bsilver">703. Commission paid at settlement</td>
<td class="bordered"><span class="entry">#get_hud_data.A_0703_BORROWER_COMMISSIONAMOUNT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0703_SELLER_COMMISSIONAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">704. <span class="entry">#get_hud_data.A_0704_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0704_USERPAYTO#</span> </td>
<td class="bordered"><span class="entry">#get_hud_data.A_0704_BORROWER_USERAMOUNT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0704_SELLER_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">705. <span class="entry">#get_hud_data.A_0705_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0705_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0705_BORROWER_USERAMOUNT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0705_SELLER_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">706. <span class="entry">#get_hud_data.A_0706_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0706_USERPAYTO#</span> </td>
<td class="bordered"><span class="entry">#get_hud_data.A_0706_BORROWER_USERAMOUNT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0706_SELLER_USERAMOUNT#</span></td>
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
<td class="bordered"><span class="entry">#get_hud_data.A_0803_BORROWER_ADJORIGINATIONCHARGE#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0803_SELLER_ADJORIGINATIONCHARGE#</span></td>
</tr>
<tr>
<td class="bsilver">804. Appraisal fee to <span class="entry">#get_hud_data.A_0804_APPRAISALFEEPAYTO#&nbsp;&nbsp;$#get_hud_data.A_0804_APPRAISALFEE_OUTSIDE_AMOUNT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0804_BORROWER_APPRAISALFEE#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0804_SELLER_APPRAISALFEE#</span></td>
</tr>
<tr>
<td class="bsilver">805. Credit report to <span class="entry">#get_hud_data.A_0805_CREDITREPORTPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0805_BORROWER_CREDITREPORT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0805_SELLER_CREDITREPORT#</span></td>
</tr>
<tr>
<td class="bsilver">806. Tax service to <span class="entry">#get_hud_data.A_0806_TAXSERVICEPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0806_BORROWER_TAXSERVICE#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0806_SELLER_TAXSERVICE#</span></td>
</tr>
<tr>
<td class="bsilver">807. Flood certification to <span class="entry">#get_hud_data.A_0807_FLOODCERTPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0807_BORROWER_FLOODCERT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0807_SELLER_FLOODCERT#</span></td>
</tr>
<tr>
<td class="bsilver">808. <span class="entry">#get_hud_data.A_0808_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0808_USERPAYTO#</span> </td>
<td class="bordered"><span class="entry">#get_hud_data.A_0808_BORROWER_USERAMOUNT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0808_SELLER_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">809. <span class="entry">#get_hud_data.A_0809_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0809_USERPAYTO#</span> </td>
<td class="bordered"><span class="entry">#get_hud_data.A_0809_BORROWER_USERAMOUNT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0809_SELLER_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">810.<span class="entry">#get_hud_data.A_0810_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0810_USERPAYTO#</span> </td>
<td class="bordered"><span class="entry">#get_hud_data.A_0810_BORROWER_USERAMOUNT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0810_SELLER_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">811. <span class="entry">#get_hud_data.A_0811_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0811_USERPAYTO#</span> </td>
<td class="bordered"><span class="entry">#get_hud_data.A_0811_BORROWER_USERAMOUNT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0811_SELLER_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">812. <span class="entry">#get_hud_data.A_0812_USERDESC#</span>
to <span class="entry">#get_hud_data.A_0812_USERPAYTO#</span> </td>
<td class="bordered"><span class="entry">#get_hud_data.A_0812_BORROWER_USERAMOUNT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0812_SELLER_USERAMOUNT#</span></td>
</tr>

<!-- 900 -->

<tr><td height="4" colspan="3"></td></tr>
<tr>
<td colspan="3" class="bdarksilver_head">900. Items Required by Lender to Be Paid in Advance</td>
</tr>
<tr>
<td class="bsilver">901. Daily interest charges from
<span class="entry"><cfif get_hud_data.A_0901_DAILYINTERESTDATEFROM NEQ 'NULL'>#get_hud_data.A_0901_DAILYINTERESTDATEFROM#</cfif></span>
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
<td class="bordered"><span class="entry">#get_hud_data.A_0904_BORROWER_USERAMOUNT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_0904_SELLER_USERAMOUNT#</span></td>
</tr>

<!-- 1000 -->

<tr><td height="4" colspan="3"></td></tr>
<tr>
<td colspan="3" class="bdarksilver_head">1000. Reserves Deposited with Lender</td>
</tr>
<tr>
<td class="bsilver">1001. Initial deposit for your escrow account</td>
<td class="bordered"><span class="entry">#get_hud_data.A_1001_BORROWER_INITIALESCROWDEPOSIT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_1001_SELLER_INITIALESCROWDEPOSIT#</span></td>
</tr>
<tr>
<td class="bsilver"><div style="float:left">1002. Homeowner's insurance</div>
<div style="float:right"> <span class="entry">#get_hud_data.A_1002_HOMEOWNERSINSMONTHS#</span> months @
$<span class="entry">#get_hud_data.A_1002_HOMEOWNERSINSPERMONTH#</span> per month
$<span class="entry">#get_hud_data.A_1002_OUTSIDE_HOMEOWNERSINS#</span></div></td>
<td class="bordered"><span class="entry">#get_hud_data.A_1002_BORROWER_HOMEOWNERSINS#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_1002_SELLER_HOMEOWNERSINS#</span></td>
</tr>
<tr>
<td class="bsilver"><div style="float:left">1003. Mortgage insurance</div>
<div style="float:right"> <span class="entry">#get_hud_data.A_1003_MORTGAGEINSMONTHS#</span> months @
$<span class="entry">#get_hud_data.A_1003_MORTGAGEINSPERMONTH#</span> per month
$<span class="entry">#get_hud_data.A_1003_OUTSIDE_MORTGAGEINS#</span></div></td>
<td class="bordered"><span class="entry">#get_hud_data.A_1003_BORROWER_MORTGAGEINS#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_1003_SELLER_MORTGAGEINS#</span></td>
</tr>
<tr>
<td class="bsilver"><div style="float:left">1004. City property tax</div>
<div style="float:right"> <span class="entry">#get_hud_data.A_1004_CITYPROPTAXMONTHS#</span> months @
$<span class="entry">#get_hud_data.A_1004_CITYPROPTAXPERMONTH#</span> per month
$<span class="entry">#get_hud_data.A_1004_OUTSIDE_CITYPROPTAX#</span></div></td>
<td class="bordered"><span class="entry">#get_hud_data.A_1004_BORROWER_CITYPROPTAX#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_1004_SELLER_CITYPROPTAX#</span></td>
</tr>
<tr>
<td class="bsilver"><div style="float:left">1005. County property tax</div>
<div style="float:right"> <span class="entry">#get_hud_data.A_1005_COUNTYPROPTAXMONTHS#</span> months @
$<span class="entry">#get_hud_data.A_1005_COUNTYPROPTAXPERMONTH#</span> per month
$<span class="entry">#get_hud_data.A_1005_OUTSIDE_COUNTYPROPTAX#</span></div></td>
<td class="bordered"><span class="entry">#get_hud_data.A_1005_BORROWER_COUNTYPROPTAX#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_1005_SELLER_COUNTYPROPTAX#</span></td>
</tr>
<tr>
<td class="bsilver"><div style="float:left">1006. Assessments</div>
<div style="float:right"> <span class="entry">#get_hud_data.A_1006_ASSESSMENTSMONTHS#</span> months @
$<span class="entry">#get_hud_data.A_1006_ASSESSMENTSPERMONTH#</span> per month
$<span class="entry">#get_hud_data.A_1006_OUTSIDE_ASSESSMENTS#</span></div></td>
<td class="bordered"><span class="entry">#get_hud_data.A_1006_BORROWER_ASSESSMENTS#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_1006_SELLER_ASSESSMENTS#</span></td>
</tr>
<tr>
<td class="bsilver" valign="top"><div style="float:left">1007. Aggregate Adjustment</div>
<div style="float:right"> <span class="entry">#get_hud_data.A_1007_OUTSIDE_AGGREGATEADJUSTMENT#</span></div></td>
<td class="bordered"><span class="entry">#get_hud_data.A_1007_BORROWER_AGGREGATEADJUSTMENT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_1007_SELLER_AGGREGATEADJUSTMENT#</span></td>
</tr>

<!-- 1100 -->

<tr><td height="4" colspan="3"></td></tr>
<tr>
<td colspan="3" class="bdarksilver_head">1100. Title Charges</td>
</tr>
<tr>
<td class="bsilver">1101. Title services and lender's title insurance</td>
<td class="bordered"><span class="entry">#get_hud_data.A_1101_BORROWER_TITLESERVICES#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_1101_SELLER_TITLESERVICES#</span></td>
</tr>
<tr>
<td class="bsilver">1102. Settlement or closing fee
to <span class="entry">#get_hud_data.A_1102_CLOSINGFEEPAYTO#</span>
$<span class="entry">#get_hud_data.A_1102_OUTSIDE_CLOSINGFEE#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_1102_BORROWER_CLOSINGFEE#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_1102_SELLER_CLOSINGFEE#</span></td>
</tr>
<tr>
<td class="bsilver">1103. Owner's title insurance
to <span class="entry">#get_hud_data.A_1103_OWNERSTITLEINSPAYTO#</span>
$<span class="entry">#get_hud_data.A_1103_OUTSIDE_OWNERSTITLEINS#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_1103_BORROWER_OWNERSTITLEINS#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_1103_SELLER_OWNERSTITLEINS#</span></td>
</tr>
<tr>
<td class="bsilver">1104. Lender's title insurance
to <span class="entry">#get_hud_data.A_1104_LENDERSTITLEINSPAYTO#</span>
$<span class="entry">#get_hud_data.A_1104_OUTSIDE_LENDERSTITLEINS#</span> </td>
<td class="bordered"><span class="entry">#get_hud_data.A_1104_BORROWER_LENDERSTITLEINS#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_1104_SELLER_LENDERSTITLEINS#</span></td>
</tr>
<tr>
<td class="bsilver">1105. Lender's title policy limit
$<span class="entry">#get_hud_data.A_1105_LENDERSTITLEPOLICYLIMIT#</span> </td>
<td class="bordered">&nbsp; </td>
<td class="bordered">&nbsp; </td>
</tr>
<tr>
<td class="bsilver">1106. Owner's title policy limit
$<span class="entry">#get_hud_data.A_1106_OWNERSTITLEPOLICYLIMIT#</span> </td>
<td class="bordered">&nbsp; </td>
<td class="bordered">&nbsp; </td>
</tr>
<tr>
<td class="bsilver">1107. Agent's portion of the total title insurance premium
$<span class="entry">#get_hud_data.A_1107_AGENTPREMIUMPORTION#</span> </td>
<td class="bordered">&nbsp; </td>
<td class="bordered">&nbsp; </td>
</tr>
<tr>
<td class="bsilver">1108. Underwriter's portion of the total title insurance premium
$<span class="entry">#get_hud_data.A_1108_UNDERWRITERPREMIUMPORTION#</span> </td>
<td class="bordered">&nbsp; </td>
<td class="bordered">&nbsp; </td>
</tr>
<tr>
<td class="bsilver">1109. <span class="entry">#get_hud_data.A_1109_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1109_USERPAYTO#</span>
$<span class="entry">#get_hud_data.A_1109_OUTSIDE_USERAMOUNT#</span> </td>
<td class="bordered"><span class="entry">#get_hud_data.A_1109_BORROWER_USERAMOUNT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_1109_SELLER_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">1110. <span class="entry">#get_hud_data.A_1110_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1110_USERPAYTO#</span>
$<span class="entry">#get_hud_data.A_1110_OUTSIDE_USERAMOUNT#</span> </td>
<td class="bordered"><span class="entry">#get_hud_data.A_1110_BORROWER_USERAMOUNT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_1110_SELLER_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">1111. <span class="entry">#get_hud_data.A_1111_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1111_USERPAYTO#</span>
$<span class="entry">#get_hud_data.A_1111_OUTSIDE_USERAMOUNT#</span> </td>
<td class="bordered"><span class="entry">#get_hud_data.A_1111_BORROWER_USERAMOUNT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_1111_SELLER_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">1112. <span class="entry">#get_hud_data.A_1112_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1112_USERPAYTO#</span>
$<span class="entry">#get_hud_data.A_1112_OUTSIDE_USERAMOUNT#</span> </td>
<td class="bordered"><span class="entry">#get_hud_data.A_1112_BORROWER_USERAMOUNT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_1112_SELLER_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">1113. <span class="entry">#get_hud_data.A_1113_USERDESC#</span>
to <span class="entry">#get_hud_data.A_1113_USERPAYTO#</span>
$<span class="entry">#get_hud_data.A_1113_OUTSIDE_USERAMOUNT#</span> </td>
<td class="bordered"><span class="entry">#get_hud_data.A_1113_BORROWER_USERAMOUNT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data.A_1113_SELLER_USERAMOUNT#</span></td>
</tr>

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
<tr>
<td class="bsilver">1206. <span class="entry">#get_hud_data_b.A_1206_USERDESC#</span>
to <span class="entry">#get_hud_data_b.A_1206_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1206_BORROWER_USERAMOUNT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1206_SELLER_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">1207. <span class="entry">#get_hud_data_b.A_1207_USERDESC#</span>
to <span class="entry">#get_hud_data_b.A_1207_USERPAYTO#</span></td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1207_BORROWER_USERAMOUNT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1207_SELLER_USERAMOUNT#</span></td>
</tr>

<!-- 1300 -->

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
$ <span class="entry">#get_hud_data_b.A_1302_OUTSIDE_USERAMOUNT#</span> </td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1302_BORROWER_USERAMOUNT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1302_SELLER_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">1303. <span class="entry">#get_hud_data_b.A_1303_USERDESC#</span>
to <span class="entry">#get_hud_data_b.A_1303_USERPAYTO#</span>
$ <span class="entry">#get_hud_data_b.A_1303_OUTSIDE_USERAMOUNT#</span> </td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1303_BORROWER_USERAMOUNT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1303_SELLER_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">1304. <span class="entry">#get_hud_data_b.A_1304_USERDESC#</span>
to <span class="entry">#get_hud_data_b.A_1304_USERPAYTO#</span>
$ <span class="entry">#get_hud_data_b.A_1304_OUTSIDE_USERAMOUNT#</span> </td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1304_BORROWER_USERAMOUNT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1304_SELLER_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">1305. <span class="entry">#get_hud_data_b.A_1305_USERDESC#</span>
to <span class="entry">#get_hud_data_b.A_1305_USERPAYTO#</span>
$ <span class="entry">#get_hud_data_b.A_1305_OUTSIDE_USERAMOUNT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1305_BORROWER_USERAMOUNT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1305_SELLER_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">1306. <span class="entry">#get_hud_data_b.A_1306_USERDESC#</span>
to <span class="entry">#get_hud_data_b.A_1306_USERPAYTO#</span>
$ <span class="entry">#get_hud_data_b.A_1306_OUTSIDE_USERAMOUNT#</span> </td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1306_BORROWER_USERAMOUNT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1306_SELLER_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">1307. <span class="entry">#get_hud_data_b.A_1307_USERDESC#</span>
to <span class="entry">#get_hud_data_b.A_1307_USERPAYTO#</span>
$ <span class="entry">#get_hud_data_b.A_1307_OUTSIDE_USERAMOUNT#</span> </td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1307_BORROWER_USERAMOUNT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1307_SELLER_USERAMOUNT#</span></td>
</tr>
<tr>
<td class="bsilver">1308. <span class="entry">#get_hud_data_b.A_1308_USERDESC#</span>
to <span class="entry">#get_hud_data_b.A_1308_USERPAYTO#</span>
$ <span class="entry">#get_hud_data_b.A_1308_OUTSIDE_USERAMOUNT#</span> </td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1308_BORROWER_USERAMOUNT#</span></td>
<td class="bordered"><span class="entry">#get_hud_data_b.A_1308_SELLER_USERAMOUNT#</span></td>
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
<td align="center" class="bordered_wleft"><span class="entry">#get_hud_data_b.COMPARE_06_GFE_USERAMOUNT#</span></td>
<td align="center" class="bordered"><span class="entry">#get_hud_data_b.COMPARE_06_HUD_USERAMOUNT#</span></td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left"><span class="entry">#get_hud_data_b.COMPARE_07_USERHUDDESC#</span></div>
<div style="float:right">##<span class="entry">#get_hud_data_b.COMPARE_07_USERHUDLINE#</span>  &nbsp; &nbsp; &nbsp;</div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#get_hud_data_b.COMPARE_07_GFE_USERAMOUNT#</span></td>
<td align="center" class="bordered"><span class="entry">#get_hud_data_b.COMPARE_07_HUD_USERAMOUNT#</span></td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left"><span class="entry">#get_hud_data_b.COMPARE_08_USERHUDDESC#</span></div>
<div style="float:right">##<span class="entry">#get_hud_data_b.COMPARE_08_USERHUDLINE#</span>  &nbsp; &nbsp; &nbsp;</div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#get_hud_data_b.COMPARE_08_GFE_USERAMOUNT#</span></td>
<td align="center" class="bordered"><span class="entry">#get_hud_data_b.COMPARE_08_HUD_USERAMOUNT#</span></td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left"><span class="entry">#get_hud_data_b.COMPARE_09_USERHUDDESC#</span></div>
<div style="float:right">##<span class="entry">#get_hud_data_b.COMPARE_09_USERHUDLINE#</span>  &nbsp; &nbsp; &nbsp;</div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#get_hud_data_b.COMPARE_09_GFE_USERAMOUNT#</span></td>
<td align="center" class="bordered"><span class="entry">#get_hud_data_b.COMPARE_09_HUD_USERAMOUNT#</span></td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left"><span class="entry">#get_hud_data_b.COMPARE_10_USERHUDDESC#</span></div>
<div style="float:right">##<span class="entry">#get_hud_data_b.COMPARE_10_USERHUDLINE#</span>  &nbsp; &nbsp; &nbsp;</div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#get_hud_data_b.COMPARE_10_GFE_USERAMOUNT#</span></td>
<td align="center" class="bordered"><span class="entry">#get_hud_data_b.COMPARE_10_HUD_USERAMOUNT#</span></td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left"><span class="entry">#get_hud_data_b.COMPARE_11_USERHUDDESC#</span></div>
<div style="float:right">##<span class="entry">#get_hud_data_b.COMPARE_11_USERHUDLINE#</span>  &nbsp; &nbsp; &nbsp;</div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#get_hud_data_b.COMPARE_11_GFE_USERAMOUNT#</span></td>
<td align="center" class="bordered"><span class="entry">#get_hud_data_b.COMPARE_11_HUD_USERAMOUNT#</span></td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left"><span class="entry">#get_hud_data_b.COMPARE_12_USERHUDDESC#</span></div>
<div style="float:right">##<span class="entry">#get_hud_data_b.COMPARE_12_USERHUDLINE#</span>  &nbsp; &nbsp; &nbsp;</div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#get_hud_data_b.COMPARE_12_GFE_USERAMOUNT#</span></td>
<td align="center" class="bordered"><span class="entry">#get_hud_data_b.COMPARE_12_HUD_USERAMOUNT#</span></td>
</tr>

<tr><td height="2" colspan="4"></td></tr>

<tr>
<td colspan="2" class="black" align="right">Total</td>
<td>&nbsp;  </td>
<td align="center" class="bordered_wleft" style="border-top:1px solid black;"><span class="entry">#get_hud_data_b.COMPARE_GFE_TOTAL_USERAMOUNT#</span></td>
<td align="center" class="bordered" style="border-top:1px solid black;"><span class="entry">#get_hud_data_b.COMPARE_HUD_TOTAL_USERAMOUNT#</span></td>
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
$<span class="entry">#get_hud_data_b.COMPARE_16_USERAMOUNT#</span></div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#get_hud_data_b.COMPARE_16_GFE_USERAMOUNT#</span></td>
<td align="center" class="bordered"><span class="entry">#get_hud_data_b.COMPARE_16_HUD_USERAMOUNT#</span></td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left"><span class="entry">#get_hud_data_b.COMPARE_17_USERDESC#</span></div>
<div style="float:right">##<span class="entry">#get_hud_data_b.COMPARE_17_USERHUDLINE#</span>
$<span class="entry">#get_hud_data_b.COMPARE_17_USERAMOUNT#</span></div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#get_hud_data_b.COMPARE_17_GFE_USERAMOUNT#</span></td>
<td align="center" class="bordered"><span class="entry">#get_hud_data_b.COMPARE_17_HUD_USERAMOUNT#</span></td>
</tr>
<tr>
<td colspan="2" class="bsilver"><div style="float:left"><span class="entry">#get_hud_data_b.COMPARE_18_USERDESC#</span></div>
<div style="float:right">##<span class="entry">#get_hud_data_b.COMPARE_18_USERHUDLINE#</span>
$<span class="entry">#get_hud_data_b.COMPARE_18_USERAMOUNT#</span></div></td>
<td></td>
<td align="center" class="bordered_wleft"><span class="entry">#get_hud_data_b.COMPARE_18_GFE_USERAMOUNT#</span></td>
<td align="center" class="bordered"><span class="entry">#get_hud_data_b.COMPARE_18_HUD_USERAMOUNT#</span></td>
</tr>

</table><!-- TABLE: Comparison of Good Faith Estimate (GFE) and HUD-1 Charges -->

<br /><br /><br /><br /><br />

<b>Loan Terms</b>

<!-- TABLE: Loan Terms -->
<table width="100%" cellspacing="0" border="0" summary="Loan Terms">
<tr>
<td width="45%" class="bsilver" style="border-top:1px solid black;">Your initial loan amount is</td>
<td width="55%" class="bordered" style="border-top:1px solid black; text-align:left;">$<span class="entry">#get_hud_data_b.TERMS_01_INITIALLOANAMOUNT#</span></td>
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
$<span class="entry">#get_hud_data_b.TERMS_04_MONTHLYAMOUNT#</span> includes <br />
<input type="checkbox" disabled="true" value="1" name="TERMS_04_INCLUDESPRINCIPAL" <cfif get_hud_data_b.TERMS_04_INCLUDESPRINCIPAL eq 1>checked</cfif> /> Principal <br />
<input type="checkbox" disabled="true" value="1" name="TERMS_04_INCLUDESINTEREST" <cfif get_hud_data_b.TERMS_04_INCLUDESINTEREST eq 1>checked</cfif> />Interest <br />
<input type="checkbox" disabled="true" value="1" name="TERMS_04_INCLUDESMORTGAGEINS" <cfif get_hud_data_b.TERMS_04_INCLUDESMORTGAGEINS eq 1>checked</cfif> />Mortgage Insurance
</td>
</tr>
<tr>
<td valign="top" class="bsilver">Can your interest rate rise?</td>
<td class="bordered" style="text-align:left;">
<input type="checkbox" disabled="true" name="TERMS_05_CANINTERESTRISE" value="NO" <cfif get_hud_data_b.TERMS_05_CANINTERESTRISE eq 'NO'>checked</cfif> onclick="document.hud1_form.TERMS_05_MAXINTEREST.value = ''; document.hud1_form.TERMS_05_FIRSTCHANGEDATE.value = ''; document.hud1_form.TERMS_05_CHANGEYEARS.value = ''; document.hud1_form.TERMS_05_AFTERDATE.value = ''; document.hud1_form.TERMS_05_CHANGEPERCENT.value = ''; document.hud1_form.TERMS_05_LOWESTINTEREST.value = ''; document.hud1_form.TERMS_05_HIGHESTINTEREST.value = '';" /> No.
<input type="checkbox" disabled="true" name="TERMS_05_CANINTERESTRISE" value="YES" <cfif get_hud_data_b.TERMS_05_CANINTERESTRISE eq 'YES'>checked</cfif> /> Yes, it can rise to a
maximum of <span class="entry">#get_hud_data_b.TERMS_05_MAXINTEREST#</span>%. The first change will be
on <span class="entry">#get_hud_data_b.TERMS_05_FIRSTCHANGEDATE#</span> and can change again
every <span class="entry">#get_hud_data_b.TERMS_05_CHANGEYEARS#</span> years
after <span class="entry">#get_hud_data_b.TERMS_05_AFTERDATE#</span>. Every change date, your interest rate can increase or decrease
by <span class="entry">#get_hud_data_b.TERMS_05_CHANGEPERCENT#</span>%. Over the life of the loan, your interest rate is guaranteed to never be
lower than <span class="entry">#get_hud_data_b.TERMS_05_LOWESTINTEREST#</span>% or
higher than <span class="entry">#get_hud_data_b.TERMS_05_HIGHESTINTEREST#</span>%.
</td>
</tr>
<tr>
<td valign="top" class="bsilver">Even if you make payments on time, can your loan balance rise?</td>
<td class="bordered" style="text-align:left;">
<input type="checkbox" disabled="true" name="TERMS_06_CANBALANCERISE" value="NO" <cfif get_hud_data_b.TERMS_06_CANBALANCERISE eq 'NO'>checked</cfif> onclick="document.hud1_form.TERMS_06_MAXBALANCE.value = '';" />No.
<input type="checkbox" disabled="true" name="TERMS_06_CANBALANCERISE" value="YES" <cfif get_hud_data_b.TERMS_06_CANBALANCERISE eq 'YES'>checked</cfif> />Yes, it can rise to a
maximum of $<span class="entry">#get_hud_data_b.TERMS_06_MAXBALANCE#</span>.</td>
</tr>
<tr>
<td valign="top" class="bsilver">Even if you make payments on time, can your monthly amount owed for principal, interest, and mortgage insurance rise?</td>
<td class="bordered" style="text-align:left;">
<input type="checkbox" disabled="true" name="TERMS_07_CANMONTHLYRISE" value="NO" <cfif get_hud_data_b.TERMS_07_CANMONTHLYRISE eq 'NO'>checked</cfif> onclick="document.hud1_form.TERMS_07_FIRSTRISEDATE.value = ''; document.hud1_form.TERMS_07_FIRSTRISEDATE.value = ''; document.hud1_form.TERMS_07_FIRSTRISEAMOUNT.value = ''; document.hud1_form.TERMS_07_MAXRISEAMOUNT.value = '';" />No.
<input type="checkbox" disabled="true" name="TERMS_07_CANMONTHLYRISE" value="YES" <cfif get_hud_data_b.TERMS_07_CANMONTHLYRISE eq 'YES'>checked</cfif> />Yes, the
first increase can be on <span class="entry">#get_hud_data_b.TERMS_07_FIRSTRISEDATE#</span> and the
monthly amount owed can rise to $<span class="entry">#get_hud_data_b.TERMS_07_FIRSTRISEAMOUNT#</span>. <br /> The
maximum it can ever rise to is $<span class="entry">#get_hud_data_b.TERMS_07_MAXRISEAMOUNT#</span>. </td>
</tr>
<tr>
<td valign="top" class="bsilver">Does your loan have a prepayment penalty?</td>
<td class="bordered" style="text-align:left;">
<input type="checkbox" disabled="true" name="TERMS_08_PREPAYMENTPENALTY" value="NO" <cfif get_hud_data_b.TERMS_08_PREPAYMENTPENALTY eq 'NO'>checked</cfif>  onclick="document.hud1_form.TERMS_08_MAXPREPAYMENTPENALTY.value = '';" />No.
<input type="checkbox" disabled="true" name="TERMS_08_PREPAYMENTPENALTY" value="YES" <cfif get_hud_data_b.TERMS_08_PREPAYMENTPENALTY eq 'YES'>checked</cfif>  />Yes, your
maximum prepayment penalty is $<span class="entry">#get_hud_data_b.TERMS_08_MAXPREPAYMENTPENALTY#</span> </td>
</tr>
<tr>
<td valign="top" class="bsilver">Does your loan have a balloon payment?</td>
<td class="bordered" style="text-align:left;">
<input type="checkbox" disabled="true" value="NO" name="TERMS_09_BALLOONPAYMENT" <cfif get_hud_data_b.TERMS_09_BALLOONPAYMENT eq 'NO'>checked</cfif> onclick="document.hud1_form.TERMS_09_BALLOONPAYMENTAMOUNT.value = ''; document.hud1_form.TERMS_09_BALLOONPAYMENTDUEYEARS.value = ''; document.hud1_form.TERMS_09_BALLOONPAYMENTDUEDATE.value = '';" />No.
<input type="checkbox" disabled="true" name="TERMS_09_BALLOONPAYMENT" value="YES" <cfif get_hud_data_b.TERMS_09_BALLOONPAYMENT eq 'YES'>checked</cfif> >Yes, you have a
balloon payment of $<span class="entry">#get_hud_data_b.TERMS_09_BALLOONPAYMENTAMOUNT#</span>
due in <span class="entry">#get_hud_data_b.TERMS_09_BALLOONPAYMENTDUEYEARS#</span> years
on <span class="entry">#get_hud_data_b.TERMS_09_BALLOONPAYMENTDUEDATE#</span></td>
</tr>
<tr>
<td valign="top" class="bsilver">Total monthly amount owed including escrow account payments</td>
<td class="bordered" style="text-align:left;">
<input type="checkbox" disabled="true" name="TERMS_10_TOTALESCROW" value="NO" <cfif get_hud_data_b.TERMS_10_TOTALESCROW eq 'NO'>checked</cfif> onclick="document.hud1_form.TERMS_10_ADDTIONALPAYMENT.value = ''; document.hud1_form.TERMS_10_MONTHLYPAYMENT.value = ''; document.hud1_form.TERMS_10_PROPERTYTAX.checked = false; document.hud1_form.TERMS_10_HOMEOWNERSINS.checked = false; document.hud1_form.TERMS_10_FLOODINS.checked = false; document.hud1_form.TERMS_10_USERITEM1.checked = false; document.hud1_form.TERMS_10_USERITEM1_DESC.value = ''; document.hud1_form.TERMS_10_USERITEM2.checked = false; document.hud1_form.TERMS_10_USERITEM2_DESC.value = ''; document.hud1_form.TERMS_10_USERITEM3.checked = false; document.hud1_form.TERMS_10_USERITEM3_DESC.value = '';" /> You do not have a monthly escrow payment for items, such as property taxes and homeowner's insurance. You must pay these items directly yourself.
<br />
<input type="checkbox" disabled="true" name="TERMS_10_TOTALESCROW" value="YES" <cfif get_hud_data_b.TERMS_10_TOTALESCROW eq 'YES'>checked</cfif> /> You have an additional monthly escrow
payment of $<span class="entry">#get_hud_data_b.TERMS_10_ADDTIONALPAYMENT#</span> that results in a total initial
monthly amount owed of $<span class="entry">#get_hud_data_b.TERMS_10_MONTHLYPAYMENT#</span>. This includes principal, interest, any mortgage insurance and any items checked below:
<table width="100%" celpadding="0" cellspacing="0" summary="Other Additional Monthly Escrow Payment Items">
<tr>
<td><input type="checkbox" disabled="true" name="TERMS_10_PROPERTYTAX" value="1" <cfif get_hud_data_b.TERMS_10_PROPERTYTAX eq 1>checked</cfif> />
Property taxes </td>
<td><input type="checkbox" disabled="true" name="TERMS_10_HOMEOWNERSINS" value="1" <cfif get_hud_data_b.TERMS_10_HOMEOWNERSINS eq 1>checked</cfif> />
Homeowner's insurance</td>
</tr>
<tr>
<td><input type="checkbox" disabled="true" name="TERMS_10_FLOODINS" value="1" <cfif get_hud_data_b.TERMS_10_FLOODINS eq 1>checked</cfif> />
Flood insurance </td>
<td><input type="checkbox" disabled="true" name="TERMS_10_USERITEM1" value="1" <cfif get_hud_data_b.TERMS_10_USERITEM1 eq 1>checked</cfif> />
<span class="entry">#get_hud_data_b.TERMS_10_USERITEM1_DESC#</span></td>
</tr>
<tr>
<td><input type="checkbox" disabled="true" name="TERMS_10_USERITEM2" value="1" <cfif get_hud_data_b.TERMS_10_USERITEM2 eq 1>checked</cfif> />
<span class="entry">#get_hud_data_b.TERMS_10_USERITEM2_DESC#</span></td>
<td><input type="checkbox" disabled="true" name="TERMS_10_USERITEM3" value="1" <cfif get_hud_data_b.TERMS_10_USERITEM3 eq 1>checked</cfif> />
<span class="entry">#get_hud_data_b.TERMS_10_USERITEM3_DESC#</span></td>
</tr>
</table>

</td>
</tr>
</table><!-- TABLE: Loan Terms -->


<br /> <br />

<b>Note</b>: If you have any questions about the Settlement Charges and Loan Terms listed on this form, please contact your lender.

</form>

</div> <!-- page_container -->

</body>
</html>

</cfoutput>