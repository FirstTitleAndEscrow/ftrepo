<cfset dateCalendarStart = "01/01/2010">
<cfset dateCalendarEnd = "12/31/2012">
<cfoutput>
<html>
<head>
<title>Good Faith Estimate (GFE)</title>
<script type="text/javascript" language="javascript" src="https://www.firsttitleservices.com/admin_area/calendar/calendar.js"></script>
<style type="text/css">
<!--
body { margin:0px;padding:0px;font-family:arial,sans-serif;font-size:10px;}
table { font-size:10px;}
textarea { font-family:arial,sans-serif; font-size:10px; }
input.text, input.date, input.two_digit, input.four_digit { font-size:10px; width:180px;  }
input.user { font-size:10px; width:160px;  }
.calculated {font-size:10px; width:160px; color:##804000; background:##ffff80; border:1px dotted ##400000;  }
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

<cfif isDefined('form.populatevarnames')>
.page_container { width:1000px; }
textarea { font-family:arial,sans-serif; font-size:10px; color:##004000; background:##cdfed0; border:1px dotted ##004000; }
input.text, input.date, input.two_digit, input.four_digit { font-size:10px; width:180px; color:##004000;background:##cdfed0; border:1px dotted ##004000; }
input.user { font-size:10px; width:180px; color:##400000; background:##ffdfdf; border:1px dotted ##400000; }
input.two_digit { width:180px}
input.date { width:180px; }
-->
</style>
	<cfset fieldlist=form.fieldnames>
	<cfset fieldlist=ListDeleteAt(fieldlist,ListFindNoCase(fieldlist,'POPULATEVARNAMES'))>
	<script type="text/javascript" language="JavaScript"><!--
		function writeName() {
		<cfloop list="#fieldlist#" index="i">document.gfe_form.#i#.value = '#i#';
		</cfloop> }
	//--></script>
	</head>
	<body onload="writeName();">
<cfelse>
-->
</style>
	</head>
	<body>
</cfif>

<IFRAME STYLE="display:none;position:absolute;width:157;height:158;z-index=100" ID="CalFrame" MARGINHEIGHT=0 MARGINWIDTH=0 NORESIZE FRAMEBORDER=0 SCROLLING=NO SRC="https://www.firsttitleservices.com/calendar/popup_calendar.html"></IFRAME>

<div class="page_container">

<form action="GFE_2010_Template.cfm" method="post" name="gfe_form">
<br /><br /><br />
<input type="submit" name="populatevarnames" value="Populate Variable Names" >
<input type="submit" name="clearvarnames" value="Clear Variable Names" >
<br /><br /><br />

	<cfif isDefined('form.fieldnames')>
		<span class="page_title">#ListLen(form.fieldnames)# Form Fields Found</span>
		<br />
		<span class="left_text"><em>click below for details</em></span>
		<cfset structVarList=StructCopy(#form#)>
		<cfset boolDeleteSuccess=StructDelete(structVarList, "FIELDNAMES")>
		<cfdump var="#structVarList#" expand="false" label="Form Scope Dump (FORM.FIELDNAMES removed)">
	<cfelse>
		<span class="page_title">Press the button to populate the variable names. </span>
	</cfif>

<br /><br /><br />




<!-- HEADER
<img alt="HUD Logo" src="HUD%20Logo.png" height="75" width="80" />
<div style="position:absolute;top:24;left:82"><span class="page_title">Good Faith Estimate (GFE)</span></div>
<div style="position:absolute;top:23;left:518"><span>OMB Approval No. 2502-0265</span></div>

-->

<!-- Originator Information -->
<div class="float_left" style="position:relative;left:80px;">
<table class="table_data" border="1" width="330" cellpadding="0" cellspacing="0" summary="Originator Information">
<tr><td>Name of Originator</td><td><input type="text" class="text" name="P1_ORIGINATOR" /></td></tr>
<tr><td>Originator <br /> Address</td><td><textarea rows="2" cols="40" name="P1_ORIGINATORADDY">	</textarea></td></tr>
<tr><td>Originator Phone Num</td><td><input type="text" class="text" name="P1_ORIGINATORPHONE" /></td></tr>
<tr><td>Originator Email</td><td><input type="text" class="text" name="P1_ORIGINATOREMAIL" /></td></tr>
</table>
</div>

<!-- Borrower Information -->
<div class="float_left" style="position:relative;left:200px;">
<table class="table_data"  border="1" width="330" cellpadding="0" cellspacing="0" summary="Borrower Information">
<tr><td>Borrower  </td><td> <input type="text" class="text" name="P1_BORROWER" /></td></tr>
<tr><td> Property Address: </td><td>
<input type="text" class="text" name="P1_PROPERTYSTREET" /> <br />
<input type="text" class="text" name="P1_PROPERTYSTREET2" /> <br />
<input type="text" class="text" name="P1_PROPERTYCOUNTY" /> <br />
<input type="text" class="text" name="P1_PROPERTYCITY" /> <br />
<input type="text" class="text" name="P1_PROPERTYSTATE" /> <br />
<input type="text" class="text" name="P1_PROPERTYZIP" />

</td></tr>

<tr><td>Date of GFE</td><td><input type="text" class="text" name="P1_GFEDATE" />
<A href="javascript:ShowCalendar(document.all('calpic'),document.all('P1_GFEDATE'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://www.firsttitleservices.com/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic" style="POSITION: relative"></A>
</td></tr>
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
<input type="text" class="text" name="P1_INTERESTAVAILABLEDATE" /><A href="javascript:ShowCalendar(document.all('calpic5'),document.all('P1_INTERESTAVAILABLEDATE'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://www.firsttitleservices.com/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic5" style="POSITION: relative"></A>.
After this time, the interest rate, some of your loan Origination Charges, and the monthly payment shown below can change until you lock your interest rate.</li>
<li>This estimate for all other settlement charges is available through
<input type="text" class="text" name="P1_ESTIMATEAVAILABLEDATE" /><A href="javascript:ShowCalendar(document.all('calpic6'),document.all('P1_ESTIMATEAVAILABLEDATE'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://www.firsttitleservices.com/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic6" style="POSITION: relative"></A>.</li>
<li>After you lock your interest rate, you must go to settlement within
<input type="text" class="text" name="P1_AFTERLOCKMINDAYS" /> days (your rate lock period)to receive the locked interest rate.</li>
<li>You must lock the interest rate at least
<input type="text" class="text" name="P1_INTERESTLOCKMINDAYS" /> days before settlement.</li>
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
<td width="50%" colspan="2">$<input type="text" class="text" name="P1_LOANAMOUNT" /></td>
</tr>
<tr>
<td width="50%">Your loan term is</td>
<td width="50%" colspan="2"><input type="text" class="text" name="P1_LOANTERM" /> years</td>
</tr>
<tr>
<td width="50%">Your initial interest rate is</td>
<td width="50%" colspan="2"><input type="text" class="text" name="P1_INTERESTRATE" />%</td>
</tr>
<tr>
<td width="50%">Your initial monthly amount owed for principal,interest, and any mortgage insurance is</td>
<td width="50%" colspan="2">$<input type="text" class="text" name="P1_OWEDMONTHLY" /> per month</td>
</tr>
<tr>
<td width="50%">Can your interest rate rise?</td>
<td><input type="radio" name="P1_INTERESTCANRISE" VALUE="NO" checked />No</td>
<td width="40%"><input type="radio" name="P1_INTERESTCANRISE" VALUE="YES" />Yes, it can rise to a maximum of
<input type="text" class="text" name="P1_INTERESTCANRISE_MAX" />%. The first change will be in
<input type="text" class="text" name="P1_INTERESTCANRISE_FIRSTDATE" /><A href="javascript:ShowCalendar(document.all('calpic2'),document.all('P1_INTERESTCANRISE_FIRSTDATE'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://www.firsttitleservices.com/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic2" style="POSITION: relative"></A>.</td>
</tr>
<tr>
<td width="50%">Even if you make payments on time, can your loan balance rise?</td>
<td><input type="radio" name="P1_BALANCECANRISE" VALUE="NO"  />No</td>
<td width="40%"><input type="radio" name="P1_BALANCECANRISE" VALUE="YES" checked  />Yes, it can rise to a maximum of
$<input type="text" class="text" name="P1_BALANCECANRISE_MAX" />.</td>
</tr>
<tr>
<td width="50%">Even if you make payments on time, can your monthly amount owed for principal, interest, and any mortgage insurance rise</td>
<td><input type="radio" name="P1_MONTHLYCANRISE" VALUE="NO" checked />No</td>
<td width="40%"><input type="radio" name="P1_MONTHLYCANRISE" VALUE="YES" />Yes, the first increase can be in
<input type="text" class="text" name="P1_MONTHLYCANRISE_FIRSTDATE" /><A href="javascript:ShowCalendar(document.all('calpic3'),document.all('P1_MONTHLYCANRISE_FIRSTDATE'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://www.firsttitleservices.com/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic3" style="POSITION: relative"></A> and the monthly amount owed can rise to
$<input type="text" class="text" name="P1_MONTHLYCANRISE_FIRSTMAX" /> . The maximum it can ever rise to is
$<input type="text" class="text" name="P1_MONTHLYCANRISE_MAX" /> .</td>
</tr>
<tr>
<td width="50%">Does your loan have a prepayment penalty?</td>
<td><input type="radio" name="P1_PREPAYMENTPENALTY" VALUE="NO" />No</td>
<td width="40%"><input type="radio" name="P1_PREPAYMENTPENALTY" VALUE="YES" checked />Yes, your maximum prepayment penalty is
$<input type="text" class="text" name="P1_PREPAYMENTPENALTY_MAX" />.</td>
</tr>
<tr>
<td width="50%">Does your loan have a balloon payment?</td>
<td><input type="radio" name="P1_BALLOONPAYMENT" VALUE="NO" checked />No</td>
<td width="40%"><input type="radio" name="P1_BALLOONPAYMENT" VALUE="YES" />Yes, you have a balloon payment of
$<input type="text" class="text" name="P1_BALLOONPAYMENT_AMOUNT" /> due in
<input type="text" class="text" name="P1_BALLOONPAYMENT_YEARSUNTIL" />years.</td>
</tr>
</table>
</td>
</tr>

<!-- Escrow -->
<tr>
<td valign="top" class="left_text">Escrow account <br /> information</td>
<td class="table_data">Some lenders require an escrow account to hold funds for paying
 property taxes or other property related charges in addition to your monthly amount owed of
 $  <span class="calculated">calculated</span>. <br />
 Do we require you to have an escrow account for your loan? <br />
  <input type="radio" name="P1_ESCROWREQUIRED" VALUE="NO" />No, you do not have an escrow account. <br />
  <input type="radio" name="P1_ESCROWREQUIRED" VALUE="YES" checked />You must pay these charges directly when due. <br /> </td>
</tr>

<!-- Settlement Summary -->
<tr>
<td valign="top" class="left_text">Summary of your <br /> settlement charges</td>
<td>
<table border="0" summary="Summary of your settlement charges">
<tr>
<td><img alt="A (1K)" src="A.png" height="30" width="30" /></td>
<td class="bsilver" width="100%">Your Adjusted Origination Charges</td>
<td class="bordered"> <span class="calculated">calculated</span></td>
</tr>
<tr>
<td><img alt="B (1K)" src="B.png" height="30" width="30" /></td>
<td class="bsilver" width="100%">Your Charges for All Other Settlement Services</td>
<td class="bordered"><span class="calculated">calculated</span> </td>
</tr>
</table>
<table border="0" summary="Total of your settlement charges">
<tr>
<td><img alt="AplusB (1K)" src="AplusB.png" height="31" width="76" /></td>
<td class="black" width="100%">Total Estimated Settlement Charges</td>
<td class="bordered"> <span class="calculated">calculated</span> </td>
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
<td><input type="text" class="text" name="P2_01_ORIGINATIONCHARGE" /></td>
</tr>
<tr>
<td colspan="2">
<!-- TABLE: Your credit or charge -->
<table class="table_data" summary="Your credit or charge">
<tr>
<td colspan="2"> 2.  Your credit or charge (points) for the specific interest rate chosen</td>
</tr>
<tr>
<td><input type="radio" name="P2_02_POINTS" value="INC" /></td>
<td>The credit or charge for the interest rate of
 <input type="text" class="text" name="P2_02_POINTSINCRATE" />% is included in "Our origination charge."  (See item 1 above.)</td>
</tr>
<tr><td><input type="radio" name="P2_02_POINTS" value="REC" /></td>
<td>You receive a credit of
$<input type="text" class="text" name="P2_02_POINTSRECAMOUNT" /> for this interest rate of
<input type="text" class="text" name="P2_02_POINTSRECRATE" />%.  This credit reduces your settlement charges.</td>
</tr>
<tr>
<td><input type="radio" name="P2_02_POINTS" value="PAY" checked /></td>
<td>You pay a charge of
$<input type="text" class="text" name="P2_02_POINTSPAYAMOUNT" /> for this interest rate of
<input type="text" class="text" name="P2_02_POINTSPAYRATE" />%. 		 This charge (points) increases your total settlement charges.</td></tr>
<tr>
<td colspan="2">The tradeoff table on page 3 shows that you can change your total settlement charges by choosing a different interest rate for this loan.</td>
</tr>
</table><!-- TABLE: Your credit or charge -->
</td>
<td valign="bottom"><input type="text" class="text" name="P2_02_POINTSAMOUNT" /></td>
</tr>
</table><!-- TABLE: Your Adjusted Origination Charges -->
<table border="0" summary="Summary of your settlement charges">
<tr>
<td><img alt="A (1K)" src="A.png" height="30" width="30" /></td>
<td class="bsilver" width="100%">Your Adjusted Origination Charges</td>
<td class="bordered"> <span class="calculated">calculated</span> </td>
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
<tr><td><input type="text" class="user" name="P2_03_USERSERVICE1_DESC" /></td>
<td><input type="text" class="user" name="P2_03_USERSERVICE1_AMOUNT" /></td></tr>
<tr><td><input type="text" class="user" name="P2_03_USERSERVICE2_DESC" /></td>
<td><input type="text" class="user" name="P2_03_USERSERVICE2_AMOUNT" /></td></tr>
<tr><td><input type="text" class="user" name="P2_03_USERSERVICE3_DESC" /></td>
<td><input type="text" class="user" name="P2_03_USERSERVICE3_AMOUNT" /></td></tr>
<tr><td><input type="text" class="user" name="P2_03_USERSERVICE4_DESC" /></td>
<td><input type="text" class="user" name="P2_03_USERSERVICE4_AMOUNT" /></td></tr>
</table>
</td>
<td valign="bottom"><span class="calculated">calculated</span>  </td>
</tr>
<tr>
<td>4.  Title services and lender's title insurance <br /> This charge includes the services of a title or settlement agent, for example, and title insurance to protect the lender, if required.</td>
<td valign="bottom"><input type="text" class="text" name="P2_04_TITLESERVICES" /></td>
</tr>
<tr>
<td>5.  Owner's title insurance <br /> You may purchase an owner's title insurance policy to protect your interest in the property.</td>
<td valign="bottom"><input type="text" class="text" name="P2_05_OWNERSTITLEINS" /></td>
</tr>
<tr>
<td>6.  Required services that you can shop for <br /> These charges are for other services that are required to complete your settlement.  We can identify providers of these services or you can shop for them yourself.  Our estimates for providing these services are below.
<table width="100%" class="table_outer" border="1" summary="Required services that we select">
<tr><td class="SC_header">Service</td><td class="SC_header">Charge</td></tr>
<tr><td><input type="text" class="user" name="P2_06_USERSERVICE1_DESC" /></td>
<td><input type="text" class="user" name="P2_06_USERSERVICE1_AMOUNT" /></td></tr>
<tr><td><input type="text" class="user" name="P2_06_USERSERVICE2_DESC" /></td>
<td><input type="text" class="user" name="P2_06_USERSERVICE2_AMOUNT" /></td></tr>
<tr><td><input type="text" class="user" name="P2_06_USERSERVICE3_DESC" /></td>
<td><input type="text" class="user" name="P2_06_USERSERVICE3_AMOUNT" /></td></tr>
<tr><td><input type="text" class="user" name="P2_06_USERSERVICE4_DESC" /></td>
<td><input type="text" class="user" name="P2_06_USERSERVICE4_AMOUNT" /></td></tr>
</table>
</td>
<td valign="bottom"><span class="calculated">calculated</span> </td>
</tr>
<tr>
<td>7.  Government recording charges <br /> These charges are for state and local fees to record your loan and title documents. </td>
<td valign="bottom"><input type="text" class="text" name="P2_07_GOVTRECCHARGE" /></td>
</tr>
<tr>
<td>8.  Transfer taxes <br /> These charges are for state and local fees on mortgages and home sales.</td>
<td valign="bottom"><input type="text" class="text" name="P2_08_TRANSFERTAX" /></td>
</tr>
<tr>
<td>9.  Initial deposit for your escrow account <br /> This charge is held in an escrow
account to pay future recurring charges on your property and includes
<input type="checkbox" name="P2_09_INCLUDEPROPTAX" CHECKED /> all property taxes,
<input type="checkbox" name="P2_09_INCLUDEINS" CHECKED /> all insurance, and
<input type="checkbox" name="P2_09_INCLUDEOTHER" CHECKED /> other. </td>
<td valign="bottom"><input type="text" class="text" name="P2_09_ESCROWDEPOSIT" /></td>
</tr>
<tr>
<td>10.  Daily interest charges <br /> This charge is for the daily interest
on your loan from the day of your settlement until the first day of the next
month or the first day of your normal mortgage payment cycle.  This amount is
$<input type="text" class="text" name="P2_10_INTERESTPERDAY" /> per day for
<input type="text" class="text" name="P2_10_INTERESTDAYS" />days (if your settlement is
<input type="text" class="text" name="P2_10_SETTLEMENTDATE" /><A href="javascript:ShowCalendar(document.all('calpic4'),document.all('P2_10_SETTLEMENTDATE'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://www.firsttitleservices.com/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic4" style="POSITION: relative"></A>). </td>
<td valign="bottom"><span class="calculated">calculated</span> </td>
</tr>
<tr>
<td>11.  Homeowner's insurance <br /> This charge is for the insurance you must buy for the property to protect from a loss, such as fire.
<table width="100%" class="table_outer" border="1" summary="Required services that we select">
<tr><td class="SC_header">Service</td><td class="SC_header">Charge</td></tr>
<tr><td><input type="text" class="user" name="P2_11_USERSERVICE1_DESC" /></td>
<td><input type="text" class="user" name="P2_11_USERSERVICE1_AMOUNT" /></td></tr>
<tr><td><input type="text" class="user" name="P2_11_USERSERVICE2_DESC" /></td>
<td><input type="text" class="user" name="P2_11_USERSERVICE2_AMOUNT" /></td></tr>
</table>
</td>
<td valign="bottom"><span class="calculated">calculated</span> </td>
</tr>
</table><!-- TABLE: Your Charges for All Other Settlement Services -->
<table border="0" summary="Summary of your settlement charges">
<tr>
<td><img alt="B (1K)" src="B.png" height="30" width="30" /></td>
<td class="bsilver" width="100%">Your Charges for All Other Settlement Services</td>
<td class="bordered"> <span class="calculated">calculated</span> </td>
</tr>
</table>
<table border="0" summary="Total of your settlement charges">
<tr>
<td><img alt="AplusB (1K)" src="AplusB.png" height="31" width="76" /></td>
<td class="black" width="100%">Total Estimated Settlement Charges</td>
<td class="bordered"> <span class="calculated">calculated</span> </td>
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
<td>$ <span class="calculated">calculated</span> </td>
<td>$</td>
<td>$</td>
</tr>
<tr>
<td>Your initial interest rate*</td>
<td> <span class="calculated">calculated</span> %</td>
<td align="right">%</td>
<td align="right">%</td>
</tr>
<tr>
<td>Your initial monthly amount owed</td>
<td>$ <span class="calculated">calculated</span> </td>
<td>$</td>
<td>$</td>
</tr>
<tr>
<td>Change in the monthly amount owed from
this GFE</td>
<td>No change</td>
<td>You will pay $<input type="text" /> more every month</td>
<td>You will pay $<input type="text" /> less every month</td>
</tr>
<tr>
<td>Change in the amount you will pay at settlement with this interest rate</td>
<td>No change</td>
<td>Your settlement charges will be reduced by $<input type="text" /></td>
<td>Your settlement charges will increase by $<input type="text" /></td>
</tr>
<tr>
<td>How much your total estimated settlement charges will be</td>
<td> <span class="calculated">calculated</span></td>
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
<td><span class="calculated">calculated</span></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Initial loan amount</td>
<td><span class="calculated">calculated</span></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Loan term</td>
<td><span class="calculated">calculated</span></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Initial interest rate</td>
<td><span class="calculated">calculated</span></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Initial monthly amount owed</td>
<td><span class="calculated">calculated</span></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Rate lock period</td>
<td><span class="calculated">calculated</span></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Can interest rate rise?</td>
<td><span class="calculated">calculated</span></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Can loan balance rise?</td>
<td><span class="calculated">calculated</span></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Can monthly amount owed rise?</td>
<td><span class="calculated">calculated</span></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Prepayment penalty?</td>
<td><span class="calculated">calculated</span></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Balloon payment?</td>
<td><span class="calculated">calculated</span></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td class="table_header">Total Estimated Settlement Charges</td>
<td><span class="calculated">calculated</span></td>
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

</FORM>

</div> <!-- page_container -->

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
</html>
</cfoutput>