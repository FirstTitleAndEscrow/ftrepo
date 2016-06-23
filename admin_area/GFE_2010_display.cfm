<cfsetting enablecfoutputonly="true">

<cfparam name="url.rec_id" type="integer" default="0">
<cfparam name="form.rec_id" type="integer" default="#url.rec_id#">

<cfparam name="url.strEmailAddress" default="">
<cfparam name="form.strEmailAddress" default="#url.strEmailAddress#">

<cfset variables.pdffilename = "T-#form.rec_id#-GFE.pdf">

<cfif IsDefined('form.submit')>
	<cfdocument format="pdf" name="PDF_OUT" pagetype="legal">
		<cfinclude template="GFE_2010_PDF.cfm">
	</cfdocument>
</cfif>

<cfif Len(Trim(form.strEmailAddress))>

	<cfset variables.boundary = CreateUUID()>

		<cfmail to="#Trim(form.strEmailAddress)#"
				from="noreply@firsttitleservices.com"
				subject="T-#form.rec_id# : GFE Form">

  			<cfmailpart type="multipart/mixed; boundary=#CHR(34)##variables.boundary##CHR(34)#">
This is a multi-part message in MIME format.

--#boundary#
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Your GFE for file: T-#rec_id# is attached. To get the latest PDF viewer, visit https://www.adobe.com

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

<!--- Get and massage data for the preview display --->
<cfset variables.placeholder = "________">

<CFQUERY datasource="#request.dsn#" NAME="get_gfe_data">
	SELECT *
	FROM GFE_DATA
	WHERE Title_ID = #form.rec_id#
</CFQUERY>

<cfloop query="get_gfe_data">
	<cfset r = get_gfe_data.currentrow>
	<cfloop list="#get_gfe_data.columnlist#" index="c">
		<cfset t = Evaluate(c)>
		<cfif NOT Len(Trim(t))>
			<cfset get_gfe_data['#c#'][#r#] = variables.placeholder>
		<cfelseif NOT IsNumeric(t) AND IsDate(t)>
			<cfset get_gfe_data['#c#'][#r#] = DateFormat(t,'m/d/yyyy')>
		</cfif>
	</cfloop>
</cfloop>

<cfoutput>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"https://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Good Faith Estimate (GFE)</title>
<style type="text/css">
<!--
body { margin:0px;padding:0px;font-family:arial,sans-serif;font-size:10px;}
table { font-size:10px; }
P.pagebreak {page-break-before:always;}
.spacer { clear:both; }
.page_container { width:670px; }
.float_left { float:left; }
.silver { background-color:silver; }
.bsilver { border:1px solid black; background-color:silver; }
.black { background-color:black; color:white; }
.bordered { border:1px solid black; }
.left_text { font-size:14px; }
.left_text_italic { font-style:italic; }
.SC_header { font-weight:bold; font-style:italic; }
.table_header { background-color:black; color:white; }
.table_data { border:1px solid black; }
.page_title{font-size:20px;}
-->
</style>
	</head>
	<body>

</center>
	<h2>My 2010 GFE for T-#form.rec_id#</h2>
<hr />
My GFE Options
<hr />

	<cfform name="gfeoutput" id="gfeoutput" action="#cgi.SCRIPT_NAME#" method="post">
		<input name="rec_id" type="hidden" value="#form.rec_id#">
	1. Return to <a href="GFE_2010_modify.cfm?rec_id=#form.rec_id#">Edit my GFE</a>
		<br / >
		2. Print or Download a PDF of my GFE (Click the Button Below - Email Address field must be empty)
		<br />
		3. Email a PDF of my GFE (Enter an email address, then click the button below)
		<br /><br />
		<cfinput name="submit"
			type="submit"
			value="Download or Email PDF" />


		Email Address (Optional):
		<cfinput name = "strEmailAddress"
   			type = "Text"
  		 	message = "Enter a valid e-mail address of the form: name@server.domain"
   			validate = "email"
			required = "no"
			>

	</cfform>
<hr />
My GFE Preview
<hr />
<div class="page_container">

<form>

<!-- HEADER
<img alt="HUD Logo" src="HUD%20Logo.png" height="75" width="80" />
<div style="position:absolute;top:24;left:82"><span class="page_title">Good Faith Estimate (GFE)</span></div>
<div style="position:absolute;top:23;left:518"><span>OMB Approval No. 2502-0265</span></div>

-->

<!-- Originator Information -->
<div class="float_left" style="position:relative;left:0px;">
<table class="table_data" border="1" width="330" cellpadding="0" cellspacing="0" summary="Originator Information">
<tr><td>Name of Originator</td><td>#get_gfe_data.P1_ORIGINATOR#</td></tr>
<tr><td>Originator <br /> Address</td><td>#get_gfe_data.P1_ORIGINATORADDY#</td></tr>
<tr><td>Originator Phone Num</td><td>#get_gfe_data.P1_ORIGINATORPHONE#</td></tr>
<tr><td>Originator Email</td><td>#get_gfe_data.P1_ORIGINATOREMAIL#</td></tr>
</table>
</div>

<!-- Borrower Information -->
<div class="float_left" style="position:relative;left:10px;">
<table class="table_data"  border="1" width="330" cellpadding="0" cellspacing="0" summary="Borrower Information">
<tr><td>Borrower  </td><td>#get_gfe_data.P1_BORROWER#</td></tr>
<tr><td> Property Address: </td><td>
#get_gfe_data.P1_PROPERTYSTREET#<br />
#get_gfe_data.P1_PROPERTYSTREET2# <br />
#get_gfe_data.P1_PROPERTYCITY#, #get_gfe_data.P1_PROPERTYSTATE# #get_gfe_data.P1_PROPERTYZIP#
</td></tr>
<tr><td>Date of GFE</td><td>#get_gfe_data.P1_GFEDATE#</td></tr>
</table>
</div>

<div class="spacer"><br /></div>

<!-- Settlement Charges Form (This table contains the rest of the form) -->
<table class="table_outer" border="0" width="100%" summary="Settlement Charges Form">

<!-- Purpose -->
<tr>
<td valign="top" class="left_text" width="150">Purpose</td>
<td>This GFE gives you an estimate of your settlement charges and loan terms if you are approved for
this loan. For more information, see HUD's Special Information Booklet on settlement charges, your
Truth-in-Lending Disclosures, and other consumer information at www.hud.gov/respa. If you decide
you would like to proceed with this loan, contact us.
<hr size="1" />
</td>
</tr>

<!-- Shopping -->
<tr>
<td valign="top" class="left_text">Shopping for <br /> your loan</td>
<td>Only you can shop for the best loan for you. Compare this GFE with other loan offers, so you can find
the best loan. Use the shopping chart on page 3 to compare all the offers you receive.
<hr size="1" />
</td>
</tr>

<!-- Dates -->
<tr>
<td valign="top" class="left_text">Important dates</td>
<td>
<ol>
<li>The interest rate for this GFE is available through
#get_gfe_data.P1_INTERESTAVAILABLEDATE#.
After this time, the interest rate, some of your loan Origination Charges, and the monthly payment shown below can change until you lock your interest rate.</li>
<li>This estimate for all other settlement charges is available through
#get_gfe_data.P1_ESTIMATEAVAILABLEDATE#.</li>
<li>After you lock your interest rate, you must go to settlement within
#get_gfe_data.P1_AFTERLOCKMINDAYS# days (your rate lock period) to receive the locked interest rate.</li>
<li>You must lock the interest rate at least
#get_gfe_data.P1_INTERESTLOCKMINDAYS# days before settlement.</li>
</ol>
<hr size="1" />
</td>
</tr>

<!-- Loan Summary -->
<tr>
<td valign="top" class="left_text">Summary of <br /> your loan</td>
<td>
<table class="table_data" width="100%" border="1" summary="Summary of your loan">
<tr>
<td width="50%">Your initial loan amount is</td>
<td width="50%" colspan="2"><cfif IsNumeric(get_gfe_data.P1_LOANAMOUNT)>#DollarFormat(get_gfe_data.P1_LOANAMOUNT)#<cfelse>$#get_gfe_data.P1_LOANAMOUNT#</cfif></td>
</tr>
<tr>
<td width="50%">Your loan term is</td>
<td width="50%" colspan="2">#get_gfe_data.P1_LOANTERM# years</td>
</tr>
<tr>
<td width="50%">Your initial interest rate is</td>
<td width="50%" colspan="2">#get_gfe_data.P1_INTERESTRATE#%</td>
</tr>
<tr>
<td width="50%">Your initial monthly amount owed for principal,interest, and any mortgage insurance is</td>
<td width="50%" colspan="2"><cfif IsNumeric(get_gfe_data.P1_OWEDMONTHLY)>#DollarFormat(get_gfe_data.P1_OWEDMONTHLY)#<cfelse>$#get_gfe_data.P1_OWEDMONTHLY#</cfif> per month</td>
</tr>
<tr>
<td width="50%">Can your interest rate rise?</td>
<td><input disabled type="checkbox" name="P1_INTERESTCANRISE" VALUE="NO" <cfif get_gfe_data.P1_INTERESTCANRISE EQ "NO">checked</cfif> />No</td>
<td width="40%"><input disabled type="checkbox" name="P1_INTERESTCANRISE" VALUE="YES" <cfif get_gfe_data.P1_INTERESTCANRISE EQ "YES">checked</cfif> />Yes, it can rise to a maximum of
#get_gfe_data.P1_INTERESTCANRISE_MAX#%. The first change will be in
#get_gfe_data.P1_INTERESTCANRISE_FIRSTDATE#.</td>
</tr>
<tr>
<td width="50%">Even if you make payments on time, can your loan balance rise?</td>
<td><input disabled type="checkbox" name="P1_BALANCECANRISE" VALUE="NO" <cfif get_gfe_data.P1_BALANCECANRISE EQ "NO">checked</cfif>  />No</td>
<td width="40%"><input disabled type="checkbox" name="P1_BALANCECANRISE" VALUE="YES" <cfif get_gfe_data.P1_BALANCECANRISE EQ "YES">checked</cfif> />
Yes, it can rise to a maximum of <cfif IsNumeric(get_gfe_data.P1_BALANCECANRISE_MAX)>#DollarFormat(get_gfe_data.P1_BALANCECANRISE_MAX)#<cfelse>$#get_gfe_data.P1_BALANCECANRISE_MAX#</cfif>.</td>
</tr>
<tr>
<td width="50%">Even if you make payments on time, can your monthly amount owed for principal, interest, and any mortgage insurance rise</td>
<td><input disabled type="checkbox" name="P1_MONTHLYCANRISE" VALUE="NO" <cfif get_gfe_data.P1_MONTHLYCANRISE EQ "NO">checked</cfif> />No</td>
<td width="40%"><input disabled type="checkbox" name="P1_MONTHLYCANRISE" VALUE="YES" <cfif get_gfe_data.P1_MONTHLYCANRISE EQ "YES">checked</cfif> />Yes, the first increase can be in
#get_gfe_data.P1_MONTHLYCANRISE_FIRSTDATE# and the monthly amount owed can rise to
<cfif IsNumeric(get_gfe_data.P1_MONTHLYCANRISE_FIRSTMAX)>#DollarFormat(get_gfe_data.P1_MONTHLYCANRISE_FIRSTMAX)#<cfelse>$#get_gfe_data.P1_MONTHLYCANRISE_FIRSTMAX#</cfif>. The maximum it can ever rise to is
<cfif IsNumeric(get_gfe_data.P1_MONTHLYCANRISE_MAX)>#DollarFormat(get_gfe_data.P1_MONTHLYCANRISE_MAX)#<cfelse>$#get_gfe_data.P1_MONTHLYCANRISE_MAX#</cfif>.</td>
</tr>
<tr>
<td width="50%">Does your loan have a prepayment penalty?</td>
<td><input disabled type="checkbox" name="P1_PREPAYMENTPENALTY" VALUE="NO" <cfif get_gfe_data.P1_PREPAYMENTPENALTY EQ "NO">checked</cfif> />No</td>
<td width="40%"><input disabled type="checkbox" name="P1_PREPAYMENTPENALTY" VALUE="YES" <cfif get_gfe_data.P1_PREPAYMENTPENALTY EQ "YES">checked</cfif> />Yes, your maximum prepayment penalty is
<cfif IsNumeric(get_gfe_data.P1_PREPAYMENTPENALTY_MAX)>#DollarFormat(get_gfe_data.P1_PREPAYMENTPENALTY_MAX)#<cfelse>$#get_gfe_data.P1_PREPAYMENTPENALTY_MAX#</cfif>.</td>
</tr>
<tr>
<td width="50%">Does your loan have a balloon payment?</td>
<td><input disabled type="checkbox" name="P1_BALLOONPAYMENT" VALUE="NO" <cfif get_gfe_data.P1_BALLOONPAYMENT EQ "NO">checked</cfif> />No</td>
<td width="40%"><input disabled type="checkbox" name="P1_BALLOONPAYMENT" VALUE="YES" <cfif get_gfe_data.P1_BALLOONPAYMENT EQ "YES">checked</cfif> />Yes, you have a balloon payment of
<cfif IsNumeric(get_gfe_data.P1_BALLOONPAYMENT_AMOUNT)>#DollarFormat(get_gfe_data.P1_BALLOONPAYMENT_AMOUNT)#<cfelse>$#get_gfe_data.P1_BALLOONPAYMENT_AMOUNT#</cfif>
due in #get_gfe_data.P1_BALLOONPAYMENT_YEARSUNTIL# years.</td>
</tr>
</table>
</td>
</tr>

<!-- Escrow -->
<tr>
<td valign="top" class="left_text">Escrow account <br /> information</td>
<td class="table_data">Some lenders require an escrow account to hold funds for paying
 property taxes or other property related charges in addition to your monthly amount owed of
 <cfif IsNumeric(get_gfe_data.P1_OWEDMONTHLY)>#DollarFormat(get_gfe_data.P1_OWEDMONTHLY)#<cfelse>$#get_gfe_data.P1_OWEDMONTHLY#</cfif>. <br />
 Do we require you to have an escrow account for your loan? <br />
  <input disabled type="checkbox" name="P1_ESCROWREQUIRED" VALUE="NO" <cfif get_gfe_data.P1_ESCROWREQUIRED EQ "NO">checked</cfif> />No, you do not have an escrow account. <br />
  <input disabled type="checkbox" name="P1_ESCROWREQUIRED" VALUE="YES" <cfif get_gfe_data.P1_ESCROWREQUIRED EQ "YES">checked</cfif> />You must pay these charges directly when due. <br /> </td>
</tr>

<!-- Settlement Summary -->
<tr>
<td valign="top" class="left_text">Summary of your <br /> settlement charges</td>
<td>
<table border="0" summary="Summary of your settlement charges">
<tr>
<td><img alt="A (1K)" src="A.png" height="30" width="30" /></td>
<td class="bsilver" width="100%">Your Adjusted Origination Charges</td>
<td class="bordered" valign="bottom">
 <cfif IsNumeric(get_gfe_data.P2_ADJUSTED_ORIGINATION_CHARGES)>#DollarFormat(get_gfe_data.P2_ADJUSTED_ORIGINATION_CHARGES)#<cfelse>&nbsp;</cfif></td>
</tr>
<tr>
<td><img alt="B (1K)" src="B.png" height="30" width="30" /></td>
<td class="bsilver" width="100%">Your Charges for All Other Settlement Services</td>
<td class="bordered">
<cfif IsNumeric(get_gfe_data.P2_B_TOTAL)>#DollarFormat(get_gfe_data.P2_B_TOTAL)#<cfelse>&nbsp;</cfif>
</td>
</tr>
</table>
<table border="0" summary="Total of your settlement charges">
<tr>
<td><img alt="AplusB (1K)" src="AplusB.png" height="31" width="76" /></td>
<td class="black" width="100%">Total Estimated Settlement Charges</td>
<td class="bordered">
<cfif IsNumeric(get_gfe_data.P2_AB_TOTAL)>#DollarFormat(get_gfe_data.P2_AB_TOTAL)#<cfelse>&nbsp;</cfif>
</td>
</tr>
</table>

<P CLASS="pagebreak"> <!-- PAGE BREAK (printing) -->

</td>
</tr>

<!-- Understanding -->
<tr>
<td valign="top" class="left_text">Understanding your <br /> estimated settlement <br /> charges</td>
<td>
<!-- TABLE: Your Adjusted Origination Charges -->
<table border="1" class="table_data" summary="Your Adjusted Origination Charges" width="100%">
<tr>
<td colspan="3" bgcolor="black" ><span style="color:white;">Your Adjusted Origination Charges</span></td>
</tr>
<tr>
<td colspan="2" width="100%">1. Our origination charge <br /> This charge is for getting this loan for you.</td>
<td valign="bottom">
<cfif IsNumeric(get_gfe_data.P2_01_ORIGINATIONCHARGE)>#DollarFormat(get_gfe_data.P2_01_ORIGINATIONCHARGE)#<cfelse>&nbsp;</cfif></td>
</tr>
<tr>
<td colspan="2">
<!-- TABLE: Your credit or charge -->
<table class="table_data" summary="Your credit or charge">
<tr>
<td colspan="2"> 2.  Your credit or charge (points) for the specific interest rate chosen</td>
</tr>
<tr>
<td><input disabled type="checkbox" name="P2_02_POINTS" value="INC" <cfif get_gfe_data.P2_02_POINTS EQ "INC">checked</cfif> /></td>
<td>The credit or charge for the interest rate of
  #get_gfe_data.P2_02_POINTSINCRATE#% is included in "Our origination charge."  (See item 1 above.)</td>
</tr>
<tr><td><input disabled type="checkbox" name="P2_02_POINTS" value="REC" <cfif get_gfe_data.P2_02_POINTS EQ "REC">checked</cfif> /></td>
<td>You receive a credit of
<cfif IsNumeric(get_gfe_data.P2_02_POINTSRECAMOUNT)>#DollarFormat(get_gfe_data.P2_02_POINTSRECAMOUNT)#<cfelse>$#get_gfe_data.P2_02_POINTSRECAMOUNT#</cfif>
for this interest rate of #get_gfe_data.P2_02_POINTSRECRATE#%.  This credit reduces your settlement charges.</td>
</tr>
<tr>
<td><input disabled type="checkbox" name="P2_02_POINTS" value="PAY" <cfif get_gfe_data.P2_02_POINTS EQ "PAY">checked</cfif> /></td>
<td>You pay a charge of
<cfif IsNumeric(get_gfe_data.P2_02_POINTSPAYAMOUNT)>#DollarFormat(get_gfe_data.P2_02_POINTSPAYAMOUNT)#<cfelse>$#get_gfe_data.P2_02_POINTSPAYAMOUNT#</cfif>
for this interest rate of #get_gfe_data.P2_02_POINTSPAYRATE#%.
This charge (points) increases your total settlement charges.</td></tr>
<tr>
<td colspan="2">The tradeoff table on page 3 shows that you can change your total settlement charges by choosing a different interest rate for this loan.</td>
</tr>
</table><!-- TABLE: Your credit or charge -->
</td>
<td valign="bottom">
<cfif IsNumeric(get_gfe_data.P2_02_POINTSAMOUNT)>#DollarFormat(get_gfe_data.P2_02_POINTSAMOUNT)#<cfelse>&nbsp;</cfif></td>
</tr>
</table><!-- TABLE: Your Adjusted Origination Charges -->
<table border="0" summary="Summary of your settlement charges">
<tr>
<td><img alt="A (1K)" src="A.png" height="30" width="30" /></td>
<td class="bsilver" width="100%">Your Adjusted Origination Charges</td>
<td class="bordered" valign="bottom">
<cfif IsNumeric(get_gfe_data.P2_ADJUSTED_ORIGINATION_CHARGES)>#DollarFormat(get_gfe_data.P2_ADJUSTED_ORIGINATION_CHARGES)#<cfelse>&nbsp;</cfif>
</td>
</tr>
</table>
</td>
</tr>

<!-- Other Settlement Services -->
<tr>
<td valign="top" class="left_text_italic">Some of these charges can  <br /> change at settlement.  See<br /> the instructions section for <br /> more information.</td>
<td>
<!-- TABLE: Your Charges for All Other Settlement Services -->
<table border="1" class="table_data" summary="Your Charges for All Other Settlement Services" width="100%">
<tr>
<td colspan="2" bgcolor="black" ><span style="color:white;">Your Charges for All Other Settlement Services</span></td>
</tr>
<tr>
<td>3.  Required services that we select <br /> These charges are for services we require to complete your settlement. <br /> We will choose the providers of these services.
<table width="100%" class="table_outer" border="1" summary="Required services that we select">
<tr><td class="SC_header">Service</td><td class="SC_header">Charge</td></tr>

<tr><td>#get_gfe_data.P2_03_USERSERVICE1_DESC#</td>
<td>
<cfif IsNumeric(get_gfe_data.P2_03_USERSERVICE1_AMOUNT)>#DollarFormat(get_gfe_data.P2_03_USERSERVICE1_AMOUNT)#<cfelse>&nbsp;</cfif>
</td></tr>

<tr><td>#get_gfe_data.P2_03_USERSERVICE2_DESC#</td>
<td>
<cfif IsNumeric(get_gfe_data.P2_03_USERSERVICE2_AMOUNT)>#DollarFormat(get_gfe_data.P2_03_USERSERVICE2_AMOUNT)#<cfelse>&nbsp;</cfif>
</td></tr>

<cfif get_gfe_data.P2_03_USERSERVICE3_DESC NEQ variables.placeholder>
<tr><td>#get_gfe_data.P2_03_USERSERVICE3_DESC#</td>
<td>
<cfif IsNumeric(get_gfe_data.P2_03_USERSERVICE3_AMOUNT)>#DollarFormat(get_gfe_data.P2_03_USERSERVICE3_AMOUNT)#<cfelse>&nbsp;</cfif>
</td></tr>
</cfif>

<cfif get_gfe_data.P2_03_USERSERVICE4_DESC NEQ variables.placeholder>
<tr><td>#get_gfe_data.P2_03_USERSERVICE4_DESC#</td>
<td>
<cfif IsNumeric(get_gfe_data.P2_03_USERSERVICE4_AMOUNT)>#DollarFormat(get_gfe_data.P2_03_USERSERVICE4_AMOUNT)#<cfelse>&nbsp;</cfif>
</td></tr>
</cfif>

<cfif get_gfe_data.P2_03_USERSERVICE5_DESC NEQ variables.placeholder>
<tr><td>#get_gfe_data.P2_03_USERSERVICE5_DESC#</td>
<td>
<cfif IsNumeric(get_gfe_data.P2_03_USERSERVICE5_AMOUNT)>#DollarFormat(get_gfe_data.P2_03_USERSERVICE5_AMOUNT)#<cfelse>&nbsp;</cfif>
</td></tr>
</cfif>

</table>
</td>
<td valign="bottom">
<cfif IsNumeric(get_gfe_data.P2_03_TOTAL)>#DollarFormat(get_gfe_data.P2_03_TOTAL)#<cfelse>&nbsp;</cfif>
</td>
</tr>
<tr>
<td>4.  Title services and lender's title insurance <br /> This charge includes the services of a title or settlement agent, for example, and title insurance to protect the lender, if required.</td>
<td valign="bottom">
<cfif IsNumeric(get_gfe_data.P2_04_TITLESERVICES)>#DollarFormat(get_gfe_data.P2_04_TITLESERVICES)#<cfelse>&nbsp;</cfif>
</td>
</tr>
<tr>
<td>5.  Owner's title insurance <br /> You may purchase an owner's title insurance policy to protect your interest in the property.</td>
<td valign="bottom">
<cfif IsNumeric(get_gfe_data.P2_05_OWNERSTITLEINS)>#DollarFormat(get_gfe_data.P2_05_OWNERSTITLEINS)#<cfelse>&nbsp;</cfif>
</td>
</tr>
<tr>
<td>6.  Required services that you can shop for <br /> These charges are for other services that are required to complete your settlement.  We can identify providers of these services or you can shop for them yourself.  Our estimates for providing these services are below.
<table width="100%" class="table_outer" border="1" summary="Required services that we select">
<tr><td class="SC_header">Service</td><td class="SC_header">Charge</td></tr>

<tr><td>#get_gfe_data.P2_06_USERSERVICE1_DESC#</td>
<td>
<cfif IsNumeric(get_gfe_data.P2_06_USERSERVICE1_AMOUNT)>#DollarFormat(get_gfe_data.P2_06_USERSERVICE1_AMOUNT)#<cfelse>&nbsp;</cfif>
</td></tr>

<tr><td>#get_gfe_data.P2_06_USERSERVICE2_DESC#</td>
<td>
<cfif IsNumeric(get_gfe_data.P2_06_USERSERVICE2_AMOUNT)>#DollarFormat(get_gfe_data.P2_06_USERSERVICE2_AMOUNT)#<cfelse>&nbsp;</cfif>
</td></tr>

<cfif get_gfe_data.P2_06_USERSERVICE3_DESC NEQ variables.placeholder>
<tr><td>#get_gfe_data.P2_06_USERSERVICE3_DESC#</td>
<td>
<cfif IsNumeric(get_gfe_data.P2_06_USERSERVICE3_AMOUNT)>#DollarFormat(get_gfe_data.P2_06_USERSERVICE3_AMOUNT)#<cfelse>&nbsp;</cfif>
</td></tr>
</cfif>

<cfif get_gfe_data.P2_06_USERSERVICE4_DESC NEQ variables.placeholder>
<tr><td>#get_gfe_data.P2_06_USERSERVICE4_DESC#</td>
<td>
<cfif IsNumeric(get_gfe_data.P2_06_USERSERVICE4_AMOUNT)>#DollarFormat(get_gfe_data.P2_06_USERSERVICE4_AMOUNT)#<cfelse>&nbsp;</cfif>
</td></tr>
</cfif>

<cfif get_gfe_data.P2_06_USERSERVICE5_DESC NEQ variables.placeholder>
<tr><td>#get_gfe_data.P2_06_USERSERVICE5_DESC#</td>
<td>
<cfif IsNumeric(get_gfe_data.P2_06_USERSERVICE5_AMOUNT)>#DollarFormat(get_gfe_data.P2_06_USERSERVICE5_AMOUNT)#<cfelse>&nbsp;</cfif>
</td></tr>
</cfif>

<cfif get_gfe_data.P2_06_USERSERVICE6_DESC NEQ variables.placeholder>
<tr><td>#get_gfe_data.P2_06_USERSERVICE6_DESC#</td>
<td>
<cfif IsNumeric(get_gfe_data.P2_06_USERSERVICE6_AMOUNT)>#DollarFormat(get_gfe_data.P2_06_USERSERVICE6_AMOUNT)#<cfelse>&nbsp;</cfif>
</td></tr>
</cfif>

<cfif get_gfe_data.P2_06_USERSERVICE7_DESC NEQ variables.placeholder>
<tr><td>#get_gfe_data.P2_06_USERSERVICE7_DESC#</td>
<td>
<cfif IsNumeric(get_gfe_data.P2_06_USERSERVICE7_AMOUNT)>#DollarFormat(get_gfe_data.P2_06_USERSERVICE7_AMOUNT)#<cfelse>&nbsp;</cfif>
</td></tr>
</cfif>

</table>
</td>
<td valign="bottom">
<cfif IsNumeric(get_gfe_data.P2_06_TOTAL)>#DollarFormat(get_gfe_data.P2_06_TOTAL)#<cfelse>&nbsp;</cfif>
</td>
</tr>
<tr>
<td>7.  Government recording charges <br /> These charges are for state and local fees to record your loan and title documents. </td>
<td valign="bottom">
<cfif IsNumeric(get_gfe_data.P2_07_GOVTRECCHARGE)>#DollarFormat(get_gfe_data.P2_07_GOVTRECCHARGE)#<cfelse>&nbsp;</cfif>
</td>
</tr>
<tr>
<td>8.  Transfer taxes <br /> These charges are for state and local fees on mortgages and home sales.</td>
<td valign="bottom">
<cfif IsNumeric(get_gfe_data.P2_08_TRANSFERTAX)>#DollarFormat(get_gfe_data.P2_08_TRANSFERTAX)#<cfelse>&nbsp;</cfif>
</td>
</tr>
<tr>
<td>9.  Initial deposit for your escrow account <br /> This charge is held in an escrow
account to pay future recurring charges on your property and includes
<input disabled type="checkbox" name="P2_09_INCLUDEPROPTAX" <cfif get_gfe_data.P2_02_POINTS EQ 1>P2_09_INCLUDEPROPTAX</cfif> /> all property taxes,
<input disabled type="checkbox" name="P2_09_INCLUDEINS" <cfif get_gfe_data.P2_02_POINTS EQ 1>P2_09_INCLUDEINS</cfif> /> all insurance, and
<input disabled type="checkbox" name="P2_09_INCLUDEOTHER" <cfif get_gfe_data.P2_02_POINTS EQ 1>P2_09_INCLUDEOTHER</cfif> /> other. </td>
<td valign="bottom">
<cfif IsNumeric(get_gfe_data.P2_09_ESCROWDEPOSIT)>#DollarFormat(get_gfe_data.P2_09_ESCROWDEPOSIT)#<cfelse>&nbsp;</cfif>
</td>
</tr>
<tr>
<td>10.  Daily interest charges <br /> This charge is for the daily interest
on your loan from the day of your settlement until the first day of the next
month or the first day of your normal mortgage payment cycle.  This amount is
<cfif IsNumeric(get_gfe_data.P2_10_INTERESTPERDAY)>#DollarFormat(get_gfe_data.P2_10_INTERESTPERDAY)#<cfelse>$#get_gfe_data.P2_10_INTERESTPERDAY#</cfif>
per day for #get_gfe_data.P2_10_INTERESTDAYS#days (if your settlement is
#get_gfe_data.P2_10_SETTLEMENTDATE#). </td>
<td valign="bottom">
<cfif IsNumeric(get_gfe_data.P2_09_ESCROWDEPOSIT)>#DollarFormat(get_gfe_data.P2_09_ESCROWDEPOSIT)#<cfelse>&nbsp;</cfif>
</td>
</tr>
<tr>
<td>11.  Homeowner's insurance <br /> This charge is for the insurance you must buy for the property to protect from a loss, such as fire.
<table width="100%" class="table_outer" border="1" summary="Required services that we select">
<tr><td class="SC_header">Service</td><td class="SC_header">Charge</td></tr>
<tr><td>#get_gfe_data.P2_11_USERSERVICE1_DESC#</td>
<td>
<cfif IsNumeric(get_gfe_data.P2_11_USERSERVICE1_AMOUNT)>#DollarFormat(get_gfe_data.P2_11_USERSERVICE1_AMOUNT)#<cfelse>&nbsp;</cfif>
</td></tr>

<tr><td>#get_gfe_data.P2_11_USERSERVICE2_DESC#</td>
<td>
<cfif IsNumeric(get_gfe_data.P2_11_USERSERVICE2_AMOUNT)>#DollarFormat(get_gfe_data.P2_11_USERSERVICE2_AMOUNT)#<cfelse>&nbsp;</cfif>
</td></tr>
</table>
</td>
<td valign="bottom">
<cfif IsNumeric(get_gfe_data.P2_11_TOTAL)>#DollarFormat(get_gfe_data.P2_11_TOTAL)#<cfelse>&nbsp;</cfif>
</td>
</tr>
</table><!-- TABLE: Your Charges for All Other Settlement Services -->
<table border="0" summary="Summary of your settlement charges">
<tr>
<td><img alt="B (1K)" src="B.png" height="30" width="30" /></td>
<td class="bsilver" width="100%">Your Charges for All Other Settlement Services</td>
<td class="bordered">
<cfif IsNumeric(get_gfe_data.P2_B_TOTAL)>#DollarFormat(get_gfe_data.P2_B_TOTAL)#<cfelse>&nbsp;</cfif>
</td>
</tr>
</table>
<table border="0" summary="Total of your settlement charges">
<tr>
<td><img alt="AplusB (1K)" src="AplusB.png" height="31" width="76" /></td>
<td class="black" width="100%">Total Estimated Settlement Charges</td>
<td class="bordered">
<cfif IsNumeric(get_gfe_data.P2_AB_TOTAL)>#DollarFormat(get_gfe_data.P2_AB_TOTAL)#<cfelse>&nbsp;</cfif>
</td>
</tr>
</table>

<P CLASS="pagebreak"> <!-- PAGE BREAK (printing) -->

</td>
</tr>

<!-- Instructions -->
<tr>
<td valign="top" class="left_text"><b>Instructions</b> <br /> Understanding <br /> which charges <br /> can change <br /> at settlement <br /> </td>
<td>This GFE estimates your settlement charges.  At your settlement, you will receive a HUD-1, a form that lists your actual costs.  Compare the charges on the HUD-1 with the charges on this GFE.  Charges can change if you select your own provider and do not use the companies we identify.  (See below for details.)
<!-- TABLE: Understanding which charges can change at settlement -->
<table border="1" class="table_data" summary="Understanding which charges can change at settlement.">
<tr>
<td width="33%" class="table_header">These charges
cannot increase
at settlement:</td>
<td width="33%" class="table_header">The total of these charges
can increase up to 10%
at settlement:</td>
<td width="33%" class="table_header">These charges
can change
at settlement:</td>
</tr>
<tr>
<td valign="top">
<li>Our origination charge</li>
<li>Your credit or charge (points) for the specific interest rate chosen (after you lock in your interest rate)</li>
<li>Your adjusted origination charges (after you lock in your interest rate)</li>
<li>Transfer taxes</li>
</td>
<td valign="top">
<li>Required services that we select</li>
<li>Title services and lender's title insurance (if we select them or you use companies we identify)</li>
Owner's title insurance (if you use companies we identify)</li>
Required services that you can shop for (if you use companies we identify)</li>
<li>Government recording charges</li>
</td>
<td valign="top">
<li>Required services that you can shop for (if you do not use companies we identify)</li>
<li>Title services and lender's title insurance (if you do not use companies we identify)</li>
<li>Owner's title insurance (if you do not use companies we identify)</li>
<li>Initial deposit for your escrow account</li>
<li>Daily interest charges</li>
<li>Homeowner's insurance</li>
</td>
</tr>
</table><!-- TABLE: Understanding which charges can change at settlement -->
</td>
</tr>

<!-- Tradeoff Table -->
<tr>
<td valign="top" class="left_text">Using the <br /> tradeoff table </td>
<td>In this GFE, we offered you this loan with a particular interest rate and estimated settlement charges.  However:
If you want to choose this same loan with lower settlement charges, then you will have a higher interest rate.
If you want to choose this same loan with a lower interest rate, then you will have higher settlement charge
If you would like to choose an available option, you must ask us for a new GFE.
Loan originators have the option to complete this table.  Please ask for additional information if the table is not completed.
<table class="table_outer" border="1" summary="Tradeoff Table">
<tr>
<td>&nbsp;</td>
<td class="table_header">The loan in this GFE</td>
<td class="table_header">The same loan with lower settlement charges</td>
<td class="table_header">The same loan with a lower interest rate</td>
</tr>
<tr>
<td>Your initial loan amount</td>
<td>
<cfif IsNumeric(get_gfe_data.P1_LOANAMOUNT)>#DollarFormat(get_gfe_data.P1_LOANAMOUNT)#<cfelse>$</cfif>
</td>
<td>$</td>
<td>$</td>
</tr>
<tr>
<td>Your initial interest rate*</td>
<td>#get_gfe_data.P1_INTERESTRATE#%</td>
<td align="right">%</td>
<td align="right">%</td>
</tr>
<tr>
<td>Your initial monthly amount owed</td>
<td>
<cfif IsNumeric(get_gfe_data.P1_OWEDMONTHLY)>#DollarFormat(get_gfe_data.P1_OWEDMONTHLY)#<cfelse>$</cfif>
</td>
<td>$</td>
<td>$</td>
</tr>
<tr>
<td>Change in the monthly amount owed from
this GFE</td>
<td>No change</td>
<td>You will pay $ _________ more every month</td>
<td>You will pay $ _________ less every month</td>
</tr>
<tr>
<td>Change in the amount you will pay at settlement with this interest rate</td>
<td>No change</td>
<td>Your settlement charges will be reduced by $_________</td>
<td>Your settlement charges will increase by $_________</td>
</tr>
<tr>
<td>How much your total estimated settlement charges will be</td>
<td>
<cfif IsNumeric(get_gfe_data.P2_AB_TOTAL)>#DollarFormat(get_gfe_data.P2_AB_TOTAL)#<cfelse>$</cfif>
</td>
<td>$</td>
<td>$</td>
</tr>
</table>
*For an adjustable rate loan, the comparisons above are for the initial interest rate before adjustments are made.
<hr size="1">
</td>
</tr>

<!-- Shopping Cart -->
<tr>
<td valign="top" class="left_text">Using the <br /> shopping cart </td>
<td>Use this chart to compare GFEs from different loan originators.  Fill in the information by using a different column for each GFE you receive.  By comparing loan offers, you can shop for the best loan.
<table class="table_outer" border="1" width="100%" summary="Shopping Cart">
<tr>
<td></td>
<td class="table_header">This loan</td>
<td class="table_header">Loan 2</td>
<td class="table_header">Loan 3</td>
<td class="table_header">Loan 4</td>
</tr>
<tr>
<td>Loan originator name</td>
<td>#get_gfe_data.P1_ORIGINATOR#</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Initial loan amount</td>
<td>
<cfif IsNumeric(get_gfe_data.P1_LOANAMOUNT)>#DollarFormat(get_gfe_data.P1_LOANAMOUNT)#<cfelse>$</cfif>
</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Loan term</td>
<td>#get_gfe_data.P1_LOANTERM# years</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Initial interest rate</td>
<td>#get_gfe_data.P1_INTERESTRATE#%</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Initial monthly amount owed</td>
<td>
<cfif IsNumeric(get_gfe_data.P1_OWEDMONTHLY)>#DollarFormat(get_gfe_data.P1_OWEDMONTHLY)#<cfelse>$</cfif>
</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Rate lock period</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Can interest rate rise?</td>
<td>#get_gfe_data.P1_INTERESTCANRISE#</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Can loan balance rise?</td>
<td>#get_gfe_data.P1_BALANCECANRISE#</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Can monthly amount owed rise?</td>
<td>#get_gfe_data.P1_MONTHLYCANRISE#</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Prepayment penalty?</td>
<td>#get_gfe_data.P1_PREPAYMENTPENALTY#</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Balloon payment?</td>
<td>#get_gfe_data.P1_BALLOONPAYMENT#</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td class="table_header">Total Estimated Settlement Charges</td>
<td>
<cfif IsNumeric(get_gfe_data.P2_AB_TOTAL)>#DollarFormat(get_gfe_data.P2_AB_TOTAL)#<cfelse>$</cfif>
</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
</table>
</td>
</tr>

<!-- Sold Loans -->
<tr>
<td valign="top" class="left_text">If your loan is <br /> sold in the future </td>
<td>Some lenders may sell your loan after settlement.  Any fees lenders receive in the future cannot change the loan you receive or the charges you paid at settlement.</td>
</tr>

</table> <!-- Settlement Charges Form -->

</form>

</div> <!-- page_container -->

</body>
</html>
</cfoutput>