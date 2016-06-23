<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="md" DEFAULT="0">
<CFQUERY datasource="#request.dsn#" NAME="get_titleid">
			SELECT *
			FROM title
			WHERE Title_ID = #rec_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="mods">
			SELECT *
			FROM closing_form_mods
			WHERE Title_ID = #rec_id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_events">
			SELECT *
			FROM eventlist
			WHERE Title_ID = #rec_id#
</CFQUERY>

<HTML XMLNS:IE>
<HEAD>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<?IMPORT NAMESPACE="IE" IMPLEMENTATION="#default">
<STYLE TYPE="text/css">
.contentstyle
{
  width:5.5in;
  height:8in;
  margin:1in;
  background:white;
  border:1 dashed gray;
}
.masterstyle
{
  width:8.5in;
  height:11in;
  background:#FFFFFF;
  border-left:0 solid black;
  border-top:1 solid black;
  border-right:4 solid black;
  border-bottom:4 solid black;
  margin:10px;
}
.unmasterstyle
{
  width:8.5in;
  height:11in;
  background:#FFFFFF;
  border-left:0 solid black;
  border-top:1 solid black;
  border-right:4 solid black;
  border-bottom:4 solid black;
  margin:10px;
}
</STYLE>
<link rel="stylesheet" href="links.css" type="text/css">
<style media="print">
.noprint     { display: none }
</style>

</head>
<BODY>
<object id="factory" style="display:none" viewastext
classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814"
codebase="https://www.firsttitleservices.com/smsx.exe">
</object>

<script defer>
function window.onload() {


  // enable control buttons
  var templateSupported = factory.printing.IsTemplateSupported();
  var controls = idControls.all.tags("input");
  for ( i = 0; i < controls.length; i++ ) {
    controls[i].disabled = false;
    if ( templateSupported && controls[i].className == "ie55" )
      controls[i].style.display = "inline";
  }



 factory.printing.header = ""
 factory.printing.footer = ""
 factory.printing.leftMargin = 0.25
 factory.printing.topMargin = 0.25
 factory.printing.rightMargin = 0.25
 factory.printing.bottomMargin = 0.25
}

</script>

<p>

<div id=idControls align="center" class="noprint">
 <!--- <b>Please use the print button below to print this page (automatic setting included)</b>

 <p><input disabled type="button" value="Print the page"
 onclick="factory.printing.Print(true)">
 <hr size="1" color="dimgray"> --->
<cfif #a_trigger# neq 2>
<CFFORM NAME="frm" ACTION="https://machine1.firsttitleservices.com/admin_area/FNMA_CLOSING_FORMS_email.cfm?rec_id=#rec_id#&md=#md#" METHOD="POST">
Click submit to send this page to processor. You may also enter an additional email here - <INPUT NAME="email" SIZE=20 MAXLENGTH=40 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" >
<input type=image border=0 src="./images/button_submit.gif"></cfform><cfelse>
<font color = blue><b>Closing Form email was sent</b></font><br><br></cfif>
</div>

<CFQUERY datasource="#request.dsn#" NAME="mods">
			SELECT *
			FROM closing_form_mods
			WHERE Title_ID = #rec_id#
</CFQUERY>
<!---
<cfset borrower_fillin = ''>
	<cfif mods.recordcount and len(mods.borrowers)>
		<cfset borrower_fillin = mods.borrowers>
	<cfelse>
		<cfset borrower_fillin = get_titleid.bfirstname1>
		<cfif Len(get_titleid.bminame1)>
			<cfset borrower_fillin = borrower_fillin & ' ' & get_titleid.bminame1 & '. '>
		</cfif>
		<cfset borrower_fillin = borrower_fillin & ' ' & get_titleid.blastname1>
		<cfif Len(get_titleid.blastname2)>
		<cfset borrower_fillin = borrower_fillin & ', ' & get_titleid.bfirstname2>
			<cfif Len(get_titleid.bminame2)>
			<cfset borrower_fillin = borrower_fillin & ' ' & get_titleid.bminame2 & '. '>
			</cfif>
		<cfset borrower_fillin = borrower_fillin & ' ' & get_titleid.blastname2>
		</cfif>
		<cfif Len(get_titleid.blastname3)>
		<cfset borrower_fillin = borrower_fillin & ', ' & get_titleid.bfirstname3>
			<cfif Len(get_titleid.bminame3)>
			<cfset borrower_fillin = borrower_fillin & ' ' & get_titleid.bminame3 & '. '>
			</cfif>
		<cfset borrower_fillin = borrower_fillin & ' ' & get_titleid.blastname3>
		</cfif>
		<cfif Len(get_titleid.blastname4)>
		<cfset borrower_fillin = borrower_fillin & ', ' & get_titleid.bfirstname4>
			<cfif Len(get_titleid.bminame3)>
			<cfset borrower_fillin = borrower_fillin & ' ' & get_titleid.bminame4 & '. '>
			</cfif>
		<cfset borrower_fillin = borrower_fillin & ' ' & get_titleid.blastname4>
		</cfif>
	</cfif>
--->
<!--- <cfset seller_fillin = ''>
	<cfif mods.recordcount and len(mods.sellers)>
		<cfset seller_fillin = mods.sellers>
	<cfelse>
		<cfset seller_fillin = get_titleid.sfirstname1>
		<cfif Len(get_titleid.sminame1)>
			<cfset seller_fillin = seller_fillin & ' ' & get_titleid.sminame1 & '. '>
		</cfif>
		<cfset seller_fillin = seller_fillin & ' ' & get_titleid.slastname1>
		<cfif Len(get_titleid.slastname2)>
		<cfset seller_fillin = seller_fillin & ', ' & get_titleid.sfirstname2>
			<cfif Len(get_titleid.sminame2)>
			<cfset seller_fillin = seller_fillin & ' ' & get_titleid.sminame2 & '. '>
			</cfif>
		<cfset seller_fillin = seller_fillin & ' ' & get_titleid.slastname2>
		</cfif>
	</cfif> --->


<CFFORM NAME="modform" ACTION="./FNMA_CLOSING_FORMS_final.cfm?rec_id=#rec_id#&md=#md#" METHOD="POST">
<!---
<IE:DEVICERECT ID="page1" CLASS="" MEDIA="print">
<CENTER>
<H1><U>VERY IMPORTANT</U></H1></CENTER>
<span style="color:red"><B><U><i>PRELIMINARY HUDS ARE DUE 7 BUSINESS DAYS PRIOR TO SETTLEMENT;</i></U><br>
FANNIE MAE REQUIRES YOUR OFFICE TO PROVIDE A PRELIMINARY HUD AT LEAST 7 BUSINESS DAYS PRIOR TO SETTLEMENT. <u>Your settlement will be delayed if this task is not completed</u>.
</B><br>
<br>
</span>
<B><U><i>Title Committments are due as soon as possible:</i></U></B><br>
<br>
TITLE ISSUES - <u>signed</u> title commitments/binders with title issues must be forwarded at least 5 business days <u>prior</u> to closing along with any copies of URT/Liens/Judgments that need to be cleared. <br>
<br>
<B><U><i>DELINQUENT INVOICES ARE DUE 7 BUSINESS DAYS PRIOR TO SETTLEMENT OR BEFORE:</i></U></B><br>
<br>
DELINQUENT HOA / CONDO FEES / TAXES / WATER / GROUND RENT with written documentation must be submitted to this office at least 5 business days prior to settlement. The seller will not approve the HUD-1 without first approving any delinquent items that will be listed on the HUD-1. Settlement will be DELAYED if amounts are not approved on the HUD to be collected.  
<br>
<br>
<B><U><i>FINAL HUD DUE 3 BUSINESS DAYS PRIOR TO SETTLEMENT:</i></U></B><br>
<br>
FANNIE MAE REQUIRES ALL HUDS TO BE DELIVERED 3 BUSINESS DAYS PRIOR TO SETTLEMENT NO LATER THAN 2:00 PM (EST). The original deed will not be sent to you until we have received an approved HUD-1. <u>The final HUD must include ALL buyer related costs if a seller concession is being given.</u><br>
<br>
<B><U><i>IMMEDIATELY AFTER SETTLEMENT:<br>
BUYER SIGNED HUD AND ALL REQUIRED FANNIE MAE CLOSING DOCUMENTS MUST BE BACK TO THIS OFFICE THE SAME DAY OF CLOSING BEFORE 4:00PM (EST).</i></U></B><br>
<br>
<table width="600" border=0>

<tr>
<td align="left" valign="top" colspan=2>Fax or email the signed HUD-1 and Fannie Mae Documents to this office immediately after settlement.</td>
</tr>
<tr>
<td align="left" valign="top" width="250">Fax to:  301-315-8197</td>
<td align="left" valign="top" width="350">email to: fanniemae1@firsttitleservices.com</td>
</tr>
</table><br>




<B><U><i>FUNDING REQUIREMENTS:</i></U></B><br>
<br>
You will be required to wire seller proceeds immediately after settlement - (48 hours if property is in Virginia).  <span style="color:red">ONCE THIS TRANSACTION HAS FUNDED, A COPY OF THE THE SELLER WIRE CONFIRMATION (WHICH MUST INCLUDE THE FEDERAL REFERENCE NUMBER) AND THE DEED RECORDING RECEIPT MUST BE SENT TO FANNIEMAE1@FIRSTTITLESERVICES.COM.</span> 

<br>
<br>
I have read and fully understand and acknowledge that our company will abide by the above requirements.  Furthermore we will be responsible for any penalties imposed by late funding.<br>
<br>
<table width="600" border=0>
<tr>
<td align="left" valign="top" width="250">x_________________________________</td>
<td align="left" valign="top" width="100">&nbsp;</td>
<td align="left" valign="top" width="250">x____________________________________________</td>
</tr>
<tr>
<td align="left" valign="top" width="250">Authorized Signatory for Title Company</td>
<td align="left" valign="top" width="100">&nbsp;</td>
<td align="left" valign="top" width="250"><nobr>Printed Name of Signatory & Title Company</nobr></td>
</tr>
<tr>
<td align="left" valign="top" colspan=3><br>
<br>
Property Address:_______________________________________________________</td>
</tr>
<tr>
<td align="left" valign="top" colspan=3><br>
<br>
Return this signed acknowledgement with the approved HUD to: fanniemae1@firsttitleservices.com</td>
</tr>
<tr>
<td align="left" valign="top" colspan=3>

REO#_______________________________________________________</td>
</tr>
<tr>
<td align="left" valign="top" colspan=3>

LN#_______________________________________________________</td>
</tr>
</table><br>

</IE:DEVICERECT>



<br>
<hr>
<br>


<p style="page-break-after:always;">&nbsp;</p>
--->

<IE:DEVICERECT ID="page1" CLASS="" MEDIA="print">

<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
<div style="float:right">REO#: <cfoutput>#get_titleid.reo_number#</cfoutput><br>
LN#: <cfoutput>#get_titleid.loan_number#</cfoutput><br></div><div style="clear:both"></div>
<div style="margin-top:-80px">
<p class=MsoBodyTextCxSpMiddle align=center style='text-align:center'><b
style='mso-bidi-font-weight:normal'><span style='mso-bidi-font-size:11.0pt;
font-family:TimesNewRomanPSMT'>FIRST TITLE &amp; ESCROW, Inc.</span></b>

<br><span style='font-size:9.0pt;mso-bidi-font-size:
10.0pt;font-family:TimesNewRomanPSMT;color:black'>7361 Calhoun Place, </span></b><b
style='mso-bidi-font-weight:normal'><span style='font-size:9.0pt;mso-bidi-font-size:
10.0pt;font-family:TimesNewRomanPSMT'>Suite 200, Rockville, MD 20850<o:p></o:p></span></b>

<br><b style='mso-bidi-font-weight:normal'><span
style='font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:TimesNewRomanPSMT'>301-315-8140<o:p></o:p></span></b>

<br>
<span style='font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:
TimesNewRomanPSMT'><a href="http://www.firsttitleservices.com">www.firsttitleservices.com</a><span
class=MsoHyperlink><o:p></o:p></span></span></b></p>		
</div>		
		<p align="center">
<strong><u>SELLER CLOSING INSTRUCTIONS</u></strong></p>
<br>
<strong>Date: <cfoutput><cfif mods.recordcount and Len(mods.doc_date)>
<INPUT NAME="doc_date" SIZE=20 MAXLENGTH=20 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="#DateFormat(mods.doc_date, 'm/d/yyyy')#"><cfelse>
									<INPUT NAME="doc_date" SIZE=20 MAXLENGTH=20 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="#DateFormat(Now(), 'm/d/yyyy')#">
</cfif></cfoutput><br>
Re: <cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput><br>
Purchasers: <cfoutput>#get_titleid.bfirstname1# <cfif Len(get_titleid.bminame1)>#get_titleid.bminame1#. </cfif>#get_titleid.blastname1#<cfif Len(get_titleid.blastname2)>, #get_titleid.bfirstname2# <cfif Len(get_titleid.bminame2)>#get_titleid.bminame2#. </cfif>#get_titleid.blastname2#</cfif><cfif Len(get_titleid.blastname3)>, #get_titleid.bfirstname3# <cfif Len(get_titleid.bminame3)>#get_titleid.bminame3#. </cfif>#get_titleid.blastname3#</cfif><cfif Len(get_titleid.blastname4)>, #get_titleid.bfirstname4# <cfif Len(get_titleid.bminame4)>#get_titleid.bminame4#. </cfif>#get_titleid.blastname4#</cfif></cfoutput><br>
Contract Closing Date: <INPUT NAME="contract_closing_date" SIZE=70 MAXLENGTH=70 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="<cfoutput>#Dateformat(mods.contract_closing_date,'mm/dd/yyyy')#</cfoutput>"><br>
To:   <cfoutput><cfif mods.recordcount and Len(mods.title_co)>
<INPUT NAME="title_co" SIZE=70 MAXLENGTH=70 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="#mods.title_co#"><cfelse>
									<INPUT NAME="title_co"  SIZE=70 MAXLENGTH=70 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="">
</cfif></cfoutput></strong><br>

To Whom It May Concern:
<br><br>
First Title & Escrow, Inc. will be representing Fannie Mae in the above referenced transaction. Please review the following closing instructions CAREFULLY. 
<br><br>


<ol type="1"><li><b><u>REO/FORECLOSURE DOCUMENTS</u></b> are order by First Title and will be forward once received.<br></li>

<li><b><u>TITLE ISSUES</u></b> – A signed title commitments/binder must be forwarded at least 10 business days prior to closing along with any copies of URT/Liens/Judgments that need to be cleared.<br></li>
<li><b><u>WATER/ REPAIRS /TERMITE REPAIRS</u></b> are NOT TO BE COLLECTED ON THE HUD. If the seller has agreed to pay for them, they will be paid outside of closing. If a payment confirmation is needed, please contact the listing agent directly. The buyer is responsible for all their inspection fees including the termite. No escrows are authorized to be collected from Fannie Mae’s proceeds on the HUD.</li>
<li><b><u>REKEY FEE</u></b> – A rekey fee must be charged to the buyer on the HUD-1 pursuant to paragraph 23 of the Fannie Mae addendum. Please be sure to request the invoice from the listing agent in advanced. If the listing agent confirms that no rekey is needed, Please be sure to forward us that correspondence.  
</li>
<li><b><u>HOA / CONDO FEES / TAXES / GROUND RENT</u></b> – It is the responsibility of the insuring party to request any payoffs associated with the transfer of title. All delinquent payoffs must be submitted to our office at least 7 business days prior to settlement (or sooner) together with a clear ledger providing a breakdown of the amounts due. If the property is subject to association dues, the seller is only responsible for dues from the date of foreclosure sale forward. <b>FORECLOSURE SALE DATE, which is</b>  <cfoutput><cfif mods.recordcount and Len(mods.foreclosure_date)>
<INPUT NAME="foreclosure_date" SIZE=20 MAXLENGTH=20 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="#DateFormat(mods.foreclosure_date, 'm/d/yyyy')#"><cfelse>
									<INPUT NAME="foreclosure_date" SIZE=20 MAXLENGTH=20 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="">
</cfif></cfoutput><br>
<i>Any delinquent amounts to be collected from the seller MUST be approved by Fannie Mae before a HUD-1 can be submitted for approval.</i>
</li>
</ol>

<center><b>HUD REQUIREMENTS</b></center><br>
<b>
<span style="color:red">FANNIE MAE REQUIRES ALL FINAL HUDS TO BE DELIVERED NO LATER THAN 2:00 PM (EST) -
3 BUSINESS DAYS PRIOR TO SETTLEMENT.</span>  IF A SELLER CONCESSION HAS BEEN APPROVED, THE FINAL HUD MUST INCLUDE ALL BUYER RELATED FEES (i.e. lender fees). 
</b>

<ol type="1">
<li>The <u>Name and Address</u> for the seller on the final HUD is: Fannie Mae, A/K/A Federal National Mortgage Association 14221 Dallas Parkway, Suite 1000, Dallas TX 75254. </li>
<li>Seller is a government entity and is therefore <b>exempt from grantor's tax</b> (there will be an exemption code on your new deed that our office will prepare and have executed by the seller). </li>
<li><b>PLEASE CHARGE ON THE HUD</b>
<ol type="a">
<cfif md EQ 0>
<li>	Seller Settlement Fee payable to First Title & Escrow, Inc., in the amount of $550.00 (Virginia) on the seller side of the CD/ALTA/HUD. </li> 
<cfelse>
<li>	Seller Settlement Fee payable to First Title & Escrow, Inc., in the amount of $450.00 (Maryland), $500.00 (District of Columbia), on the seller side of the CD/ALTA/HUD.</li> 
</cfif>
<li>	Seller Abstract Title Fee payable to First Title & Escrow, Inc., in the amount of $175.00 on the seller side of the CD/ALTA/HUD. **</li> 
<li>	Seller will ONLY pay a $25.00 wire fee payable to your office as their funds must be wired.</li> 
</ol>

</li>
<br><br>
</ol>


<i>**Seller Settlement & Abstract Title Fee checks payable to First Title & Escrow are to be forward to First Title & Escrow, 7361 Calhoun Place, Suite 200, Rockville, MD 20855 at the time of disbursement.</i><br><br>


<p>
Agents Commissions are to be listed as follow:<br>
A. Listing Agent 2.5% = $<INPUT NAME="listingagentamt" SIZE=20 MAXLENGTH=20 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="<cfoutput>#mods.listingagentamt#</cfoutput>"><br>
B. Selling Agent 3.0% = $<INPUT NAME="sellingagentamt" SIZE=20 MAXLENGTH=20 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="<cfoutput>#mods.sellingagentamt#</cfoutput>"><br>
C. Tech Fee* Credit on Line 403. (The Tech Fee only applies to closings where the listing agent’s commission is a minimum of $1,125.00). The Tech Fee of $125.00 is to be reduced from the listing agent commission once you disburse. DO NOT SHOW THE CREDIT OR CHANGE COMMISSION AMOUNTS in the 700 section of the HUD. 

</p>

<!---
<div style="color:red">
<b>
FANNIE MAE REQUIRES YOUR OFFICE TO PROVIDE A PRELIMINARY HUD AT LEAST 7 BUSINESS DAYS PRIOR TO SETTLEMENT. <u>YOUR SETTLEMENT WILL BE DELAYED IF THIS TASK IS NOT COMPLETED.</u>
</b>
</div>
<br>
<li>Rekey Fee is required to be collected on the HUD from the buyer per the Fannie Mae contract addendum. The listing agent is able to provide the invoice for your office. </li>
<li>Water/Repairs/Termite Repairs are NOT TO BE COLLECTED ON THE HUD if the seller has agreed to pay for them. You may need to contact the listing agent to determine if this is the case as they are paid outside of settlement. Buyer is responsible for all their inspection fees including the termite. No Escrows authorized on the HUD or Water Fees.</li>
<li><span style="color:blue;font-weight:bold"><u>THE DEED AND HUD MUST MATCH THE PURCHASER(S) NAME(S) AND FINANCE TYPE EXACTLY AS LISTED IN THE FANNIE MAE CONTRACT ADDENDUM.</u></span> If the purchaser(s) name(s) is incorrect or requires any other variation of name(s) an addendum must be submitted to the seller prior to submitting a HUD for approval in order to have the name(s) modified. Addendums submitted with HUD(s) or at the closing will not be accepted.</li>

</ol>


<strong><u>FANNIE MAE REQUIRES ALL HUDS TO BE DELIVERED 2 BUSINESS DAYS PRIOR TO SETTLEMENT.</u> I will need a copy of your FINAL HUD (including all lender fees) and any invoices 2 business days PRIOR to settlement before 3PM (EST) along with these instructions.</strong><br><br>
--->
<p class=MsoNormal style='line-height:115%'><span style='font-size:10.0pt;
mso-bidi-font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'>Example: </span><span
style='font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'><o:p></o:p></span></p>

<table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0
 style='border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;
 mso-yfti-tbllook:1184;mso-padding-alt:0in 5.4pt 0in 5.4pt;mso-border-insideh:
 .5pt solid windowtext;mso-border-insidev:.5pt solid windowtext'>
 <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes'>
  <td width=333 colspan=2 style='width:249.5pt;border:solid windowtext 1.0pt;
  mso-border-alt:solid windowtext .5pt;background:#A6A6A6;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='line-height:115%'><span style='font-size:8.0pt;
  mso-bidi-font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
  mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'>K. Summary
  of Seller Transactions<o:p></o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:1'>
  <td width=333 colspan=2 style='width:249.5pt;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='line-height:115%'><span style='font-size:8.0pt;
  mso-bidi-font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
  mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'>400.
  Gross Amount Due to Seller<o:p></o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:2'>
  <td width=265 style='width:198.9pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='line-height:115%'><span style='font-size:8.0pt;
  mso-bidi-font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
  mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'>401.
  Contract Sales Price<o:p></o:p></span></p>
  </td>
  <td width=67 style='width:50.6pt;border-top:none;border-left:none;border-bottom:
  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
  solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='line-height:115%'><span style='font-size:8.0pt;
  mso-bidi-font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
  mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:3'>
  <td width=265 style='width:198.9pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='line-height:115%'><span style='font-size:8.0pt;
  mso-bidi-font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
  mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'>402.
  Personal Property<o:p></o:p></span></p>
  </td>
  <td width=67 style='width:50.6pt;border-top:none;border-left:none;border-bottom:
  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
  solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='line-height:115%'><span style='font-size:8.0pt;
  mso-bidi-font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
  mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:4;height:11.65pt'>
  <td width=265 style='width:198.9pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt;height:11.65pt'>
  <p class=MsoNormal style='line-height:115%'><b><i style='mso-bidi-font-style:
  normal'><span style='font-size:8.0pt;mso-bidi-font-size:11.0pt;line-height:
  115%;font-family:TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS";
  color:red'>403: Technology Fee to Fannie Mae from LA<o:p></o:p></span></i></b></p>
  </td>
  <td width=67 style='width:50.6pt;border-top:none;border-left:none;border-bottom:
  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
  solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt;height:11.65pt'>
  <p class=MsoNormal style='line-height:115%'><b><i style='mso-bidi-font-style:
  normal'><span style='font-size:8.0pt;mso-bidi-font-size:11.0pt;line-height:
  115%;font-family:TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS";
  color:red'>$125.00<o:p></o:p></span></i></b></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:5;mso-yfti-lastrow:yes'>
  <td width=265 style='width:198.9pt;border:solid windowtext 1.0pt;border-top:
  none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='line-height:115%'><span style='font-size:8.0pt;
  mso-bidi-font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
  mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'>404.<o:p></o:p></span></p>
  </td>
  <td width=67 style='width:50.6pt;border-top:none;border-left:none;border-bottom:
  solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;mso-border-top-alt:
  solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='line-height:115%'><span style='font-size:8.0pt;
  mso-bidi-font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
  mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>
  </td>
 </tr>
</table>

<p class=MsoNormal align=center style='text-align:center;line-height:115%'><b><u><span
style='mso-bidi-font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
mso-fareast-font-family:"Arial Unicode MS"'>IMMEDIATELY AFTER SETTLEMENT:<o:p></o:p></span></u></b></p>

<p class=MsoNormal align=center style='text-align:center;line-height:115%'><b><u><span
style='font-size:6.0pt;mso-bidi-font-size:11.0pt;line-height:115%;font-family:
TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS"'><o:p><span
 style='text-decoration:none'>&nbsp;</span></o:p></span></u></b></p>

<p class=MsoNormal style='line-height:115%'><i style='mso-bidi-font-style:normal'><span
style='font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'>THE BUYER
SIGNED HUD-1 AND ALL REQUIRED FANNIE MAE CLOSING DOCUMENTS MUST BE RETURNED TO
THIS OFFICE THE SAME DAY OF CLOSING NO LATER THAN 4:00 PM (EST) VIA EMAIL OR
FAX. <o:p></o:p></span></i></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:6.0pt;
mso-bidi-font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS";
mso-bidi-font-weight:bold'>Fax: 301-315-8197 or Email to <a
href="mailto:fanniemae1@firsttitleservices.com">fanniemae1@firsttitleservices.com</a><o:p></o:p></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:7.0pt;
mso-bidi-font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>

<strong><p style="text-align:center">**FUNDING REQUIREMENTS***</p></strong>
You will be required to wire seller proceeds immediately after settlement - (48 hours if property is in Virginia). <br><br>
<strong>ONCE THIS TRANSACTION HAS FUNDED, A COPY OF THE SELLER WIRE CONFIRMATION (WHICH MUST INCLUDE THE 22 DIGIT FEDERAL REFERENCE NUMBER) AND THE DEED RECORDING RECEIPT or COPY OF THE RECORDED DEED MUST BE SENT TO FANNIEMAE1@FIRSTTITLESERVICES.COM.</strong>

<div style="color:red;font-weight:bold">

AS THE BUYER’S REPRESENTATIVE, YOU ARE REQUIRED TO ADHERE TO THE POLICIES AND GUIDELINES WITHIN THE ENCLOSED INSTRUCTIONS. IF YOU ARE UNABLE TO MEET THESES REQUIREMENTS, PLEASE CONTACT THE FIRST TITLE & ESCROW, INC. PROCESSOR ASSIGNED TO THIS TRANSACTION AS SOON AS POSSIBLE.
</div>
<br>
I have read and fully understand and acknowledge that our company will provide the information as requested in a timely manner furthermore we will be responsible for any penalties when funding after 48 hours.<br><br>
_______________________________________<br>
<strong>Printed Name of Title Company/Attorney</strong><br><br>

_______________________________________<br>
<strong>Authorized Signatory for Title Company/Attorney</strong><br><br>

_______________________________________<br>
<strong>Printed Name of Signatory</strong><br><br>


Please email back executed document to: fanniemae1@firsttitleservices.com or fax to 301-315-8197<br><br>
Property Address: <cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput>


</td>
	</tr>
</table>
<!--- end of page 1 ---->
</IE:DEVICERECT>
<br>
<hr>
<br>

<p style="page-break-after:always;">&nbsp;</p>
<input type="hidden" name="mustcloseon" value="">
<!---
<IE:DEVICERECT ID="page2" CLASS="" MEDIA="print">
<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td align="left" valign="top">

<p align="center"><font size="+1"><strong><strong>ADDITIONAL FANNIE MAE INSTRUCTIONS</font>

</strong><br></P>
<ol>
<li>MUST CLOSE ON OR BEFORE PER THE CONTRACT ON: <INPUT NAME="mustcloseon" SIZE=20 MAXLENGTH=20 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="<cfoutput>#DateFormat(mods.mustcloseon, 'm/d/yyyy')#</cfoutput>"><br><br></li>

<li>Agents Commissions are to be listed as follow:
<ol type="A">
<li>Listing Agent 2.5% = $<INPUT NAME="listingagentamt" SIZE=20 MAXLENGTH=20 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="<cfoutput>#mods.listingagentamt#</cfoutput>"></li>		
<li>Selling Agent 3.0% = $<INPUT NAME="sellingagentamt" SIZE=20 MAXLENGTH=20 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="<cfoutput>#mods.sellingagentamt#</cfoutput>"></li>		
            <li>Tech Fee* Credit on Line 704/705. 
            *PLEASE REVIEW THE TECH FEE EXAMPLE ATTACHED TO SHOW IT PROPERLY ON YOUR HUD.
Please be sure to include the Seller’s Settlement Fee and Wire Fee listed on the original closing instructions that have been emailed to your office.
Rekey Fee is required to be collected on the HUD from the buyer. The listing agent is able to provide the invoice for your office.
Fannie Mae is exempt from Grantor Tax (for the exception of the City of Norfolk and Goochland County, Virginia.)
</li></ol>
<br><br>
YOUR HUD IS DUE NO LATER THAN 48 HOURS PRIOR TO SETTLEMENT. NO EXCEPTION. THE DEED WILL NOT BE RELEASED UNTIL WE HAVE RECEIVED A CORRECT HUD. 
<br><br>
</li>
<li><u style="color:red">DELINQUENT INVOICES ARE DUE NO LATER 5 DAYS (OR SOONER) PRIOR TO SUBMITTING A HUD FOR APPROVAL</u>. This includes items such as HOA (which must include the ledger/accounting breakdown. The seller will only pay from the SALE DATE of the foreclosure forward not the date showing on the Trustee Deed), Taxes, Water/Sewer Fees, Utility Fees, etc.. All outstanding amounts MUST be approved in order to be collected on the HUD. No exception. Settlement will be DELAYED if amounts are not approved on the HUD to be collected.  
<br><br>
</li>
<li>Water/Repairs/Termite Repairs are NOT TO BE COLLECTED ON THE HUD if the seller has agreed to pay for them. You may need to contact the listing agent to determine if this is the case as they are paid oustide of settlement. Buyer is responsidle for all their inspection fees including the termite. No Escrows authorized on the HUD or Water Fees. 
<br><br>
</li>
<li><u>Title Commitments are DUE AS SOON AS POSSIBLE</u>. Should there be any title issues please eliminate what you can and forward with the binder/commitment <u>together</u> with copies of any and all liens/judgments/unreleased trusts etc. so we may assist. PLEASE BE SURE TO ADVISE AS SOON AS POSSIBLE IF THERE IS ANY TITLE ISSUES. 
</li>


</ol>
</td>
	</tr>
</table>
<!--- end of page 1 ---->
</IE:DEVICERECT>




<br>
<hr>
<br>
<p style="page-break-after:always;">&nbsp;</p>
--->
<!---
<IE:DEVICERECT ID="page2" CLASS="" MEDIA="print">
<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td align="left" valign="top">
<h1>TECH FEE INSTRUCTIONS:</h1>
(The Tech Fee is required on the HUDs where the listing agent’s commission is a minimum of $1,125.00)
Please contact your Streamline Closer if you have any questions regarding the Tech Fee.

<p align="center"><img src="images/closingform.jpg" width="1100">
<br>
<img src="images/closingformoption2.jpg" width="700">
</strong><br></P>

</td>
	</tr>
</table>
<!--- end of page 1 ---->
</IE:DEVICERECT>

--->


<IE:DEVICERECT ID="page2" CLASS="" MEDIA="print">
<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td align="left" valign="top">

<p class=MsoBodyTextCxSpMiddle align=center style='text-align:center'><b
style='mso-bidi-font-weight:normal'><span style='mso-bidi-font-size:11.0pt;
font-family:TimesNewRomanPSMT'>FIRST TITLE &amp; ESCROW, INC.<o:p></o:p></span></b>
<br>
<b
style='mso-bidi-font-weight:normal'><span style='font-size:9.0pt;mso-bidi-font-size:
10.0pt;font-family:TimesNewRomanPSMT;color:black'>7361 Calhoun Place, </span></b><b
style='mso-bidi-font-weight:normal'><span style='font-size:9.0pt;mso-bidi-font-size:
10.0pt;font-family:TimesNewRomanPSMT'>Suite 200, Rockville, MD 20850<o:p></o:p></span></b>
<br>
<b style='mso-bidi-font-weight:normal'><span
style='font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:TimesNewRomanPSMT'>301-315-8140<o:p></o:p></span></b>
<br>
<span style='font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:
TimesNewRomanPSMT'><a href="http://www.firsttitleservices.com">www.firsttitleservices.com</a><span
class=MsoHyperlink><o:p></o:p></span></span></b></p>


<p class=MsoNormal align=center style='text-align:center'><b style='mso-bidi-font-weight:
normal'><span style='font-size:15.0pt;mso-bidi-font-size:12.0pt;font-family:
TimesNewRomanPSMT'>DEED FORM REQUEST<o:p></o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center'><b style='mso-bidi-font-weight:
normal'><span style='font-size:16.0pt;mso-bidi-font-size:12.0pt;font-family:
TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='text-align:justify'><span style='font-size:11.0pt;
font-family:"Arial Narrow","sans-serif"'>This form is to be completed by your
office and forward <u>TOGETHER</u> with your title binder in order to prepare
and have the deed executed. <u>PLEASE BE SURE TO ADVISE FIRST TITLE IMMEDIATELY
IF ANY INFORMATION LISTED BELOW IS INCORRECT<b style='mso-bidi-font-weight:
normal'>.</b></u><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:11.0pt;font-family:"Arial Narrow","sans-serif"'>Property
address: <cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput><span style='mso-spacerun:yes'> </span><u><span style='mso-tab-count:
12'>                                                                                                                                                                                              </span><span
style='mso-tab-count:2'>                                </span></u><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:11.0pt;font-family:"Arial Narrow","sans-serif"'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:11.0pt;font-family:"Arial Narrow","sans-serif"'>Sales
Price: <cfoutput>#get_titleid.purchase#</cfoutput><u><span style='mso-tab-count:13'>                                                                                                                                                                                                         </span><span
style='mso-tab-count:2'>                                </span></u><o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify'><b style='mso-bidi-font-weight:
normal'><span style='font-size:11.0pt;font-family:"Arial Narrow","sans-serif"'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='text-align:justify'><b style='mso-bidi-font-weight:
normal'><span style='font-size:11.0pt;font-family:"Arial Narrow","sans-serif"'>THE
DEED AND HUD MUST MATCH THE PURCHASER(S) NAME(S) AND FINANCE EXACTLY AS LISTED
IN THE FANNIE MAE CONTRACT ADDENDUM WHICH IS:<br> <cfoutput>#get_titleid.bfirstname1# #get_titleid.blastname1#</cfoutput><o:p></o:p></span></b></p>

<p class=MsoNormal style='margin-left:9.5pt;text-align:justify'><b
style='mso-bidi-font-weight:normal'><span style='font-size:11.0pt;font-family:
"Arial Narrow","sans-serif"'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='text-align:justify'><b style='mso-bidi-font-weight:
normal'><u><span style='font-size:11.0pt;font-family:"Arial Narrow","sans-serif"'><span
style='mso-tab-count:14'>                                                                                                                                                                                                                                </span><span
style='mso-tab-count:2'>                                </span><o:p></o:p></span></u></b></p>

<p class=MsoNormal style='margin-left:9.5pt'><b style='mso-bidi-font-weight:
normal'><span style='font-size:11.0pt;font-family:"Arial Narrow","sans-serif"'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal><b style='mso-bidi-font-weight:normal'><span
style='font-size:11.0pt;font-family:"Arial Narrow","sans-serif"'>FINANCE TYPE: <INPUT NAME="finance_type" SIZE=25 MAXLENGTH=20 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="<cfoutput>#mods.finance_type#</cfoutput>"><u><span
style='mso-tab-count:12'>                                                                                                                                                                                                </span><span
style='mso-tab-count:3'>                                                </span><o:p></o:p></u></span></b></p>


<div style='mso-element:para-border-div;border:none;border-bottom:solid windowtext 1.0pt;
mso-border-bottom-alt:solid windowtext .5pt;padding:0in 0in 1.0pt 0in'>

<p class=MsoNormal style='border:none;mso-border-bottom-alt:solid windowtext .5pt;
padding:0in;mso-padding-alt:0in 0in 1.0pt 0in'><u><span style='font-size:11.0pt;
font-family:"Arial Narrow","sans-serif";background:yellow;mso-highlight:yellow'>PLEASE
NOTE: IF THE PURCHASER(S) NAME(S) IS INCORRECT OR REQUIRES ANY OTHER VARIATION
OF NAME(S) AND/OR THE FINANCE TYPE IS ANY DIFFERENT—AN ADDENDUM MUST BE
SUBMITTED TO THE SELLER PRIOR TO SUBMITTING A HUD FOR APPROVAL IN ORDER TO HAVE
THE NAME(S) AND/OR LOAN TYPE MODIFIED. ADDENDUMS SUBMITTED WITH HUD(S) OR AT
THE CLOSING WILL NOT BE ACCEPTED.</span></u><span style='font-size:11.0pt;
font-family:"Arial Narrow","sans-serif"'> <o:p></o:p></span></p>

<p class=MsoNormal style='border:none;mso-border-bottom-alt:solid windowtext .5pt;
padding:0in;mso-padding-alt:0in 0in 1.0pt 0in'><span style='font-size:11.0pt;
font-family:"Arial Narrow","sans-serif"'><o:p>&nbsp;</o:p></span></p>

</div>

<p class=MsoNormal><span style='font-size:11.0pt;font-family:"Arial Narrow","sans-serif"'>Please
verify/provide the following information: <o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:11.0pt;font-family:"Arial Narrow","sans-serif"'><o:p>&nbsp;</o:p></span></p>

<p class=MsoListParagraph style='margin-left:0in;line-height:150%'><span
style='font-size:11.0pt;line-height:150%;font-family:"Arial Narrow","sans-serif";
mso-bidi-font-weight:bold'>1. Assessed Value:
________________________________________________________<span style='mso-tab-count:
1'>          </span> <o:p></o:p></span></p>

<p class=MsoListParagraph style='margin-left:0in;line-height:150%'><span
style='font-size:11.0pt;line-height:150%;font-family:"Arial Narrow","sans-serif";
mso-bidi-font-weight:bold'>2. G-PIN/MAP/TAX
ACCOUNT#:_____________________________________________<span
style='mso-spacerun:yes'>      </span></span><span style='font-size:11.0pt;
line-height:150%;font-family:"Arial Narrow","sans-serif"'><o:p></o:p></span></p>

<p class=MsoListParagraph style='margin-left:0in;line-height:150%'><span
style='font-size:11.0pt;line-height:150%;font-family:"Arial Narrow","sans-serif"'>3.
Title Insurer: ____________________________________________________________ <span
style='mso-tab-count:1'>       </span><o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:5.45pt'><span style='font-size:11.0pt;
font-family:"Arial Narrow","sans-serif"'>Please confirm tenancy to appear on
title:<o:p></o:p></span></p>

<p class=MsoListParagraph style='margin-left:.25in;text-align:justify;
line-height:115%'><span style='font-size:11.0pt;line-height:115%;font-family:
"Arial Narrow","sans-serif"'>____ Sole Owner <o:p></o:p></span></p>

<p class=MsoListParagraph style='margin-left:.25in;text-align:justify;
line-height:115%'><span style='font-size:11.0pt;line-height:115%;font-family:
"Arial Narrow","sans-serif"'>____ Joint Tenants with the Full Common Law Right
Of Survivorship<o:p></o:p></span></p>

<p class=MsoListParagraph style='margin-left:.25in;line-height:115%'><span
style='font-size:11.0pt;line-height:115%;font-family:"Arial Narrow","sans-serif"'>____
Tenants in Common (Please be sure to advise the interest amount for each
grantee.)<o:p></o:p></span></p>

<p class=MsoListParagraph style='margin-left:.25in;line-height:115%'><span
style='font-size:11.0pt;line-height:115%;font-family:"Arial Narrow","sans-serif"'>____
Husband and Wife, Tenants By the Entirety with Full Common Law Right of
Survivorship<span style='mso-spacerun:yes'>      </span><o:p></o:p></span></p>

<p class=MsoListParagraph style='margin-left:.25in;line-height:115%'><span
style='font-size:11.0pt;line-height:115%;font-family:"Arial Narrow","sans-serif"'>____
NO TENANCY: <span style='mso-spacerun:yes'> </span>Entity purchasing this
property is registered in the State of ________________. <o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify'><span style='font-size:7.0pt;
mso-bidi-font-size:11.0pt;font-family:"Arial Narrow","sans-serif"'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:11.0pt;font-family:"Arial Narrow","sans-serif"'>4.
Grantee Address: <o:p></o:p></span></p>

<p class=MsoNormal style='line-height:150%'><span style='font-size:11.0pt;
line-height:150%;font-family:"Arial Narrow","sans-serif"'><span
style='mso-spacerun:yes'>      </span>____ Same as Property Address above<o:p></o:p></span></p>

<p class=MsoNormal style='line-height:150%'><span style='font-size:11.0pt;
line-height:150%;font-family:"Arial Narrow","sans-serif"'><span
style='mso-spacerun:yes'>      </span>____ Other: ___________________________________________________________________________________________________<o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify'><span style='font-size:4.0pt;
mso-bidi-font-size:11.0pt;font-family:"Arial Narrow","sans-serif"'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:11.0pt;font-family:"Arial Narrow","sans-serif"'>5.
After Recording, Return to Address: ______________________________________________________________<o:p></o:p></span></p>

<div style='mso-element:para-border-div;border:none;border-bottom:solid windowtext 1.0pt;
mso-border-bottom-alt:solid windowtext .5pt;padding:0in 0in 1.0pt 0in'>

<p class=MsoNormal style='border:none;mso-border-bottom-alt:solid windowtext .5pt;
padding:0in;mso-padding-alt:0in 0in 1.0pt 0in'><span style='font-size:11.0pt;
font-family:"Arial Narrow","sans-serif"'><o:p>&nbsp;</o:p></span></p>

</div>

<p class=MsoNormal><span style='font-size:11.0pt;font-family:"Arial Narrow","sans-serif"'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:11.0pt;font-family:"Arial Narrow","sans-serif"'>Completed
By: ________________________________<span
style='mso-spacerun:yes'>                            </span><span
style='mso-spacerun:yes'>             </span>Date: _______________________________________<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:11.0pt;font-family:"Arial Narrow","sans-serif"'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS";
mso-bidi-font-weight:bold'>Please email back executed document to: <a
href="mailto:fanniemae1@firsttitleservices.com">fanniemae1@firsttitleservices.com</a>
or fax to 301-315-8197<o:p></o:p></span></p>


</td>
	</tr>
</table>
<!--- end of page 1 ---->
</IE:DEVICERECT>
<br>
<hr>
<br>
<p style="page-break-after:always;">&nbsp;</p>

<IE:DEVICERECT ID="page2" CLASS="" MEDIA="print">
<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td align="left" valign="top">

<p class=MsoBodyTextCxSpMiddle align=center style='text-align:center'><b
style='mso-bidi-font-weight:normal'><span style='mso-bidi-font-size:11.0pt;
font-family:TimesNewRomanPSMT'>FIRST TITLE &amp; ESCROW, INC.<o:p></o:p></span></b></p>

<p class=MsoBodyTextCxSpMiddle align=center style='text-align:center'><b
style='mso-bidi-font-weight:normal'><span style='font-size:9.0pt;mso-bidi-font-size:
10.0pt;font-family:TimesNewRomanPSMT;color:black'>7361 Calhoun Place, </span></b><b
style='mso-bidi-font-weight:normal'><span style='font-size:9.0pt;mso-bidi-font-size:
10.0pt;font-family:TimesNewRomanPSMT'>Suite 200, Rockville, MD 20850<o:p></o:p></span></b></p>

<p class=MsoBodyText align=center style='margin-bottom:0in;margin-bottom:.0001pt;
text-align:center'><b style='mso-bidi-font-weight:normal'><span
style='font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:TimesNewRomanPSMT'>301-315-8140<o:p></o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center'><b style='mso-bidi-font-weight:
normal'><span style='font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:
TimesNewRomanPSMT'><a href="http://www.firsttitleservices.com">www.firsttitleservices.com</a><span
class=MsoHyperlink><o:p></o:p></span></span></b></p>

<p class=MsoNormal align=center style='text-align:center'><span
style='font-family:TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=center style='text-align:center;line-height:115%'><b><span
style='font-family:TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS"'>CLOSING
ACKNOWLEDGEMENT<o:p></o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center;line-height:115%'><b><span
style='font-size:5.0pt;mso-bidi-font-size:12.0pt;line-height:115%;font-family:
TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS"'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center;line-height:115%'><span
style='font-family:TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS";
mso-bidi-font-weight:bold'>THIS DOCUMENT MUST BE SIGNED AND RETURN TOGETHER
WITH YOUR HUD FOR APPROVAL.<o:p></o:p></span></p>

<p class=MsoNormal align=center style='text-align:center;line-height:115%'><b><span
style='font-size:11.0pt;line-height:115%;font-family:"Arial Narrow","sans-serif";
mso-fareast-font-family:"Arial Unicode MS"'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='text-align:justify;line-height:115%'><span
style='font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'>Please
note: First Title &amp; Escrow, Inc. will be preparing the Deed into the
buyer for closing. Our office will be releasing the original/executed deed to
your office once the Seller has approved the HUD<span style='color:black'>. </span>The
Deed will only be executed based on the terms of the contract and approval by
the seller- No corrections, mark-ups, and/or written information is to be added
to the deed once received by your office. If any revisions are required, please
contact your First Title Closer prior to your settlement.<o:p></o:p></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS";
mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='line-height:115%'><u><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;color:black'>You hereby agree
and acknowledge that your office will NOT RECORD THE DEED AND/OR POA UNTIL YOUR
OFFICE IS IN RECEIPT OF THE SELLER SIGNED HUD. <o:p></o:p></span></u></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;color:black'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS";
mso-bidi-font-weight:bold'>The seller signed HUD-1 will not be released until
our office is provided with the following on the day of closing: <o:p></o:p></span></p>

<ul style='margin-top:0in' type=disc>
 <li class=MsoNormal style='line-height:115%;mso-list:l5 level1 lfo10'><span
     style='font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
     mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'>Fully
     executed closing instructions<o:p></o:p></span></li>
 <li class=MsoNormal style='line-height:115%;mso-list:l5 level1 lfo10'><span
     style='font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
     mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'>Buyer
     Signed HUD-1 <o:p></o:p></span></li>
 <li class=MsoNormal style='line-height:115%;mso-list:l5 level1 lfo10'><span
     style='font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
     mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'>Buyer
     signed Waiver &amp; Release<o:p></o:p></span></li>
 <li class=MsoNormal style='line-height:115%;mso-list:l5 level1 lfo10'><span
     style='font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
     mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'>Buyer
     signed Tax Proration<o:p></o:p></span></li>
 <li class=MsoNormal style='line-height:115%;mso-list:l5 level1 lfo10'><span
     style='font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
     mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'>Buyer
     signed Errors &amp; Omission Correction Agreement<o:p></o:p></span></li>
 <li class=MsoNormal style='line-height:115%;mso-list:l5 level1 lfo10'><span
     style='font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
     mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'>Confirmation
     from buyers title company that <u>ALL</u> closing funds (lender/buyer/etc)
     have been received<o:p></o:p></span></li>
</ul>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;color:black'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='line-height:115%'><b style='mso-bidi-font-weight:
normal'><span style='font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
color:red'>If any issues arise that may create a delay in recordation or
disbursement of proceeds to Fannie Mae, please contact your First Title Closer
immediately. <o:p></o:p></span></b></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;color:black'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT'>In the event, settlement does
not occur by the closing date per the contract or seller executed addendum; your
office will immediately return the original documents to:<o:p></o:p></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-no-proof:yes'>First
Title &amp; Escrow, Inc. <o:p></o:p></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-no-proof:yes'>Attn: Seller
Rep Dept.<o:p></o:p></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-no-proof:yes'>7361 Calhoun
Place, Suite 200, Rockville, MD 20855<o:p></o:p></span></p>

<p class=MsoBodyText style='margin-bottom:0in;margin-bottom:.0001pt;text-align:
justify'><i style='mso-bidi-font-style:normal'><span style='font-size:11.0pt;
font-family:TimesNewRomanPSMT;mso-fareast-font-family:"Times New Roman";
mso-no-proof:yes'><o:p>&nbsp;</o:p></span></i></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS";
mso-bidi-font-weight:bold'>I have read and fully understand and acknowledge
that our company will abide by the above requirements. Furthermore we will be
responsible for any penalties, cost or others fees that are imposed by not
adhering to these requirements.<o:p></o:p></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS";
mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS";
mso-bidi-font-weight:bold'>Date: <u><span style='mso-tab-count:4'>                                      </span><o:p></o:p></u></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS";
mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS";
mso-bidi-font-weight:bold'>__________________________________________ <span
style='mso-tab-count:1'>           </span><span
style='mso-spacerun:yes'>     </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_______________________________________<o:p></o:p></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS";
mso-bidi-font-weight:bold'>Printed Name of Title Company/Attorney<span
style='mso-spacerun:yes'>                                  </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Authorized
Signatory for Title Company/Attorney<o:p></o:p></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS";
mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS";
mso-bidi-font-weight:bold'>_______________________________________<span
style='mso-spacerun:yes'>  </span><o:p></o:p></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS";
mso-bidi-font-weight:bold'>Printed Name of Signatory<o:p></o:p></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS";
mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS";
mso-bidi-font-weight:bold'>Property Address:
<cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput><o:p></o:p></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS";
mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS";
mso-bidi-font-weight:bold'>Please email back executed document together with
the HUD for approval to: <o:p></o:p></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS";
mso-bidi-font-weight:bold'><a href="mailto:fanniemae1@firsttitleservices.com">fanniemae1@firsttitleservices.com</a>
or fax to 301-315-8197<o:p></o:p></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:9.0pt;
mso-bidi-font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>

</IE:DEVICERECT>
<br>
<hr>
<br>
<p style="page-break-after:always;">&nbsp;</p>

<IE:DEVICERECT ID="page2" CLASS="" MEDIA="print">

<p class=MsoNormal style='tab-stops:89.25pt'><span style='font-size:11.0pt;
font-family:TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS"'><o:p>&nbsp;</o:p></span></p>

<p class=Default><b><span style='font-size:11.5pt'>REO #: <cfoutput>#get_titleid.reo_number#</cfoutput> </span></b><span style='font-size:11.5pt'><o:p></o:p></span></p>

<p class=Default><b><span style='font-size:11.0pt'><o:p>&nbsp;</o:p></span></b></p>

<p class=Default align=center style='text-align:center'><b><span
style='font-size:11.0pt'>WAIVER AND RELEASE REGARDING PROPERTY CONDITION AT
CLOSING</span></b><span style='font-size:11.0pt'><o:p></o:p></span></p>

<p class=Default align=center style='text-align:center'><b><span
style='font-size:13.0pt'>THIS WAIVER AND RELEASE IS TO BE EXECUTED ONLY AT
CLOSING</span></b><span style='font-size:13.0pt'><o:p></o:p></span></p>

<p class=Default><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='text-align:justify;line-height:115%'><span
style='font-size:13.0pt;line-height:115%'>This Waiver and Release Regarding
Property Condition at Closing is given by </span><span style='font-size:13.0pt;line-height:115%'><cfoutput>#get_titleid.bfirstname1# #get_titleid.blastname1# #get_titleid.bfirstname2# #get_titleid.blastname2#</cfoutput></span><span
style='font-size:13.0pt;line-height:115%'> (“Purchaser”) to FANNIE MAE A/K/A
FEDERAL NATIONAL MORTGAGE ASSOCIATION (“Seller”) in connection with the
purchase of the property located at </span><span style='font-size:13.0pt;line-height:115%'><cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput>
</span><span style='font-size:13.0pt;line-height:115%'>(“Property”) pursuant to
the contract of sale between Purchaser and Seller with an Effective Date
of ______________, 201__ (“Contract”). <o:p></o:p></span></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'>Purchaser
acknowledges that the Property was acquired by Seller by foreclosure, deed in
lieu of foreclosure, forfeiture, tax sale, right of eminent domain or similar
process. Purchaser has inspected the Property or was given the right to inspect
the Property to determine the condition of the Property and discover any
defects<b>. Purchaser acknowledges and accepts the Property in &quot;AS
IS&quot; condition at the time of closing, including, without limitation, any
hidden defects or environmental conditions affecting the Property (including
but not limited to, drywall, mold, mildew, microscopic organisms, lead paint,
fuel oil, allergens, or other toxic substances of any kind), whether known or
unknown and whether or not such defects or conditions were discoverable through
inspection. </b>Purchaser acknowledges that Seller, its agents and
representatives have not made, and Seller specifically negates and disclaims, any
representations, warranties, promises, covenants, agreements or guarantees,
implied or express, oral or written in respect to <o:p></o:p></span></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='margin-left:.5in;text-align:justify;text-indent:-.25in;
mso-list:l2 level1 lfo7'><![if !supportLists]><span style='font-size:13.0pt'><span
style='mso-list:Ignore'>(1)<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='font-size:13.0pt'>the physical
condition or any other aspect of the Property including the structural
integrity or the quality or character of materials used in construction of any
improvements, availability and quantity or quality of water, stability of the
soil, susceptibility to landslide or flooding, sufficiency of drainage, water
leaks, water damage, environmental conditions, or any other matter affecting
the stability or integrity of the Property or improvements; <o:p></o:p></span></p>

<p class=Default style='margin-left:.5in;text-align:justify'><span
style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='margin-left:.5in;text-align:justify;text-indent:-.25in;
mso-list:l2 level1 lfo7'><![if !supportLists]><span style='font-size:13.0pt'><span
style='mso-list:Ignore'>(2)<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='font-size:13.0pt'>the conformity of
the Property or the improvements to any zoning, land use or building code
requirements or compliance with any laws, rules, ordinances or regulations of
any federal, state or local governmental authority, or the granting of any
required permits or approvals, if any, of any governmental bodies which had
jurisdiction over the construction of the original structure, any improvements
and/or any remodeling of the structure; and <o:p></o:p></span></p>

<p class=Default style='margin-left:.5in;text-align:justify'><span
style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='margin-left:.5in;text-align:justify;text-indent:-.25in;
mso-list:l2 level1 lfo7'><![if !supportLists]><span style='font-size:13.0pt'><span
style='mso-list:Ignore'>(3)<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='font-size:13.0pt'>the habitability,
merchantability, marketability, profitability or fitness for a particular
purpose of the Property or improvements including redhibitory vices and
defects, apparent, non apparent or latent, which now exist or which may hereafter
exist and which if known to purchaser, would cause purchaser to refuse to
purchase the property. <o:p></o:p></span></p>
<p class=Default style='margin-left:.5in;text-align:justify'><span
style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>
<p class=Default style='margin-left:.5in;text-align:justify'><span
style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>
<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:13.0pt'>Waiver and Release 2012&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Revised<o:p></o:p></span></p>

<p class=MsoNormal align=center style='text-align:center;mso-layout-grid-align:
none;text-autospace:none'><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<!---<p align="center">Page 2 of 4</p>--->

</IE:DEVICERECT>
<br>
<hr>
<br>
<p style="page-break-after:always;">&nbsp;</p>

<IE:DEVICERECT ID="page2" CLASS="" MEDIA="print">

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'>Purchaser
represents and warrants to Seller the following: <o:p></o:p></span></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='margin-left:27.0pt;text-align:justify;text-indent:-.25in;
mso-list:l1 level1 lfo8'><![if !supportLists]><span style='font-size:13.0pt'><span
style='mso-list:Ignore'>(1)<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='font-size:13.0pt'>Purchaser is
purchasing the Property solely in reliance on its own investigation and inspection
of the Property and not on any information, representation or warranty provided
or to be provided by Seller, its servicers, representatives, brokers,
employees, agents or assigns; <o:p></o:p></span></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='margin-left:27.0pt;text-align:justify;text-indent:-.25in;
mso-list:l1 level1 lfo8'><![if !supportLists]><span style='font-size:13.0pt'><span
style='mso-list:Ignore'>(2)<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='font-size:13.0pt'>Neither Seller,
nor its servicers, employees, representatives, brokers, agents or assigns, has
made any representations or warranties, implied or expressed, relating to the
condition of the Property or the contents thereof, except as expressly set
forth in the Contract; and <o:p></o:p></span></p>

<p class=MsoListParagraph><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='margin-left:27.0pt;text-align:justify;text-indent:-.25in;
mso-list:l1 level1 lfo8'><![if !supportLists]><span style='font-size:13.0pt'><span
style='mso-list:Ignore'>(3)<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='font-size:13.0pt'>Purchaser has not
relied on any representation or warranty from seller regarding the nature,
quality or workmanship of any repairs made by Seller.<span
style='mso-spacerun:yes'>  </span><o:p></o:p></span></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='margin-left:27.0pt;text-align:justify;text-indent:-.25in;
mso-list:l1 level1 lfo8'><![if !supportLists]><span style='font-size:13.0pt'><span
style='mso-list:Ignore'>(4)<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='font-size:13.0pt'>Purchaser has
inspected or been given the opportunity to inspect any repairs made by Seller
to the Property and accepts the repairs under the terms and conditions of the
Contract and such repairs have been performed to the complete satisfaction of
Purchaser. <o:p></o:p></span></p>

<p class=MsoListParagraph><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='margin-left:27.0pt;text-align:justify;text-indent:-.25in;
mso-list:l1 level1 lfo8'><![if !supportLists]><span style='font-size:13.0pt'><span
style='mso-list:Ignore'>(5)<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='font-size:13.0pt'>Purchaser will
not occupy or cause or permit others to occupy the Property unless and until
any necessary certificate of occupancy, smoke detector certification, septic
certification or any similar certification or permit has been obtained from the
appropriate governmental entity. <o:p></o:p></span></p>

<p class=Default style='margin-left:.5in;text-align:justify'><span
style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>



<p class=Default style='text-align:justify;tab-stops:242.2pt'><span
style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='text-align:justify'><b><span style='font-size:13.0pt'>AS
A MATERIAL PART OF THE CONSIDERATION TO BE RECEIVED BY SELLER, UNDER THE TERMS
OF THE CONTRACT AS NEGOTIATED BY PURCHASER AND SELLER, PURCHASER WAIVES <o:p></o:p></span></b></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='margin-left:32.25pt;text-align:justify;text-indent:
-18.75pt;mso-list:l9 level1 lfo9'><![if !supportLists]><b><span
style='font-size:13.0pt'><span style='mso-list:Ignore'>(A)<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span></b><![endif]><b><span
style='font-size:13.0pt'>ANY AND ALL CLAIMS ARISING FROM THE ADJUSTMENTS OR
PRORATIONS OR ERRORS IN CALCULATING THE ADJUSTMENTS OR PRORATIONS THAT ARE OR
MAY BE DISCOVERED AFTER CLOSING; <o:p></o:p></span></b></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='margin-left:32.25pt;text-align:justify;text-indent:
-18.75pt;mso-list:l9 level1 lfo9'><![if !supportLists]><b><span
style='font-size:13.0pt'><span style='mso-list:Ignore'>(B)<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span></b><![endif]><b><span
style='font-size:13.0pt'>ANY CLAIMS FOR FAILURE OF CONSIDERATION AND/OR MISTAKE
OF FACT AS SUCH CLAIMS RELATE TO THE PURCHASE OF THE PROPERTY OR ENTERING INTO
OR THE EXECUTION OF AND CLOSING UNDER THIS AGREEMENT; <o:p></o:p></span></b></p>

<p class=MsoListParagraph><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='margin-left:32.25pt;text-align:justify;text-indent:
-18.75pt;mso-list:l9 level1 lfo9'><![if !supportLists]><b><span
style='font-size:13.0pt'><span style='mso-list:Ignore'>(C)<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span></b><![endif]><b><span
style='font-size:13.0pt'>ANY REMEDY OF ANY KIND, OTHER THAN AS EXPRESSLY
PROVIDED IN THE CONTRACT TO WHICH PURCHASER MIGHT OTHERWISE BE ENTITLED AT LAW
OR EQUITY BASED ON MUTUAL MISTAKE OF FACT OR LAW OR OTHERWISE, INCLUDING BUT
NOT LIMITED TO RESCISSION OF THIS AGREEMENT; <o:p></o:p></span></b></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='margin-left:32.25pt;text-align:justify;text-indent:
-18.75pt;mso-list:l9 level1 lfo9'><![if !supportLists]><b><span
style='font-size:13.0pt'><span style='mso-list:Ignore'>(D)<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span></b><![endif]><b><span
style='font-size:13.0pt'>TRIAL BY JURY, EXCEPT AS PROHIBITED BY LAW, IN ANY
LITIGATION ARISING FROM OR CONNECTED WITH OR RELATED TO THIS AGREEMENT; <o:p></o:p></span></b></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='margin-left:32.25pt;text-align:justify;text-indent:
-18.75pt;mso-list:l9 level1 lfo9'><![if !supportLists]><b><span
style='font-size:13.0pt'><span style='mso-list:Ignore'>(E)<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span></b><![endif]><b><span
style='font-size:13.0pt'>ANY CLAIMS OR LOSSES PURCHASER MAY INCUR AS A RESULT
OF CONSTRUCTION OR OTHER DEFECTS, WHICH MAY NOW OR HEREAFTER EXIST WITH RESPECT
TO THE PROPERTY; <o:p></o:p></span></b></p>
<p class=Default style='margin-left:.5in;text-align:justify'><span
style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>
<p class=Default style='margin-left:.5in;text-align:justify'><span
style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>
<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:13.0pt'>Waiver and Release 2012&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Revised<o:p></o:p></span></p>

<p class=MsoNormal align=center style='text-align:center;mso-layout-grid-align:
none;text-autospace:none'><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<!---<p align="center">Page 2 of 4</p>--->

</IE:DEVICERECT>
<br>
<hr>
<br>
<p style="page-break-after:always;">&nbsp;</p>

<IE:DEVICERECT ID="page2" CLASS="" MEDIA="print">

<p class=Default style='margin-left:32.25pt;text-align:justify;text-indent:
-18.75pt;mso-list:l9 level1 lfo9'><![if !supportLists]><b><span
style='font-size:13.0pt'><span style='mso-list:Ignore'>(F)<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span></b><![endif]><b><span
style='font-size:13.0pt'>ANY RIGHT TO AVOID THIS SALE OR REDUCE THE PRICE OR
HOLD SELLER RESPONSIBLE FOR DAMAGES ON ACCOUNT OF THE CONDITION OF THE
PROPERTY, LACK OF SUITABILITY AND FITNESS, OR REDHIBITORY VICES AND DEFECTS,
APPARENT, NONAPPARENT OR LATENT, DISCOVERABLE OR NONDISCOVERABLE; <o:p></o:p></span></b></p>

<p class=MsoListParagraph><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='margin-left:32.25pt;text-align:justify;text-indent:
-18.75pt;mso-list:l9 level1 lfo9'><![if !supportLists]><b style='mso-bidi-font-weight:
normal'><span style='font-size:13.0pt'><span style='mso-list:Ignore'>(G)<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span></b><![endif]><b><span
style='font-size:13.0pt'>ANY CLAIM ARISING FROM ENCROACHMENTS, EASEMENTS, SHORTAGES
IN AREA OR ANY OTHER MATTER WHICH WOULD BE DISCLOSED OR REVEALED BY A SURVEY OR
INSPECTION OF THE PROPERTY OR SEARCH OF PUBLIC RECORDS; AND</span></b><span
style='font-size:13.0pt'><o:p></o:p></span></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='margin-left:32.25pt;text-align:justify;text-indent:
-18.75pt;mso-list:l9 level1 lfo9'><![if !supportLists]><b><span
style='font-size:13.0pt'><span style='mso-list:Ignore'>(H)<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp; </span></span></span></b><![endif]><b><span
style='font-size:13.0pt'>ANY RIGHT TO MEDIATION OR ARBITRATION RELATING TO OR
ARISING UNDER OR FROM THIS AGREEMENT, EXCEPT AS PROHIBITED BY LAW. <o:p></o:p></span></b></p>

<p class=Default style='margin-left:36.75pt;text-align:justify'><span
style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='text-align:justify'><b><span style='font-size:13.0pt'>IF
THE PROPERTY IS LOCATED IN CALIFORNIA THE FOLLOWING PARAGRAPHS SHALL APPLY: <o:p></o:p></span></b></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'>It
is the intention of Purchaser in executing this release that it shall be
effective as a bar to each and every claim, demand and cause of action
hereinabove specified and in furtherance of this Purchaser hereby expressly
waives any and all rights and benefits conferred by the provisions of Section
1542 of the Civil Code of the State of California, which reads: <o:p></o:p></span></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='text-align:justify'><b><span style='font-size:13.0pt'>“A
general release does not extend to claims which the creditor does not know or
suspect to exist in his favor at the time of executing the release, which if
known by him must have materially affected his settlement with the debtor.” <o:p></o:p></span></b></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'>Purchaser
expressly consents that this release shall be given full force and effect as to
all of its terms and provisions including as well those relating to unsuspected
claims, demands and causes of action hereinabove specified. If any provision of
this release be invalid or unenforceable, it is the intention of the Purchaser
that all of the other provisions shall be fully valid and enforceable according
to their terms.<span style='mso-spacerun:yes'>  </span><o:p></o:p></span></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'>The
invalidity, illegality or enforceability of any provision of this Addendum
shall not affect the validity or enforceability of any other provision of this
Addendum, all of which shall remain in full force and effect. <o:p></o:p></span></p>

<p class=Default style='text-align:justify;line-height:150%'><span
style='font-size:13.0pt;line-height:150%'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='text-align:justify;line-height:150%'><span
style='font-size:13.0pt;line-height:150%'>Executed this __________day of
__________________________, 201__. <o:p></o:p></span></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'>Witnesses:
Purchaser: <o:p></o:p></span></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'><o:p>_______________________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_______________________</o:p></span></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<cfoutput>#get_titleid.bfirstname1# #get_titleid.blastname1#</cfoutput></span></p>


<p class=MsoNormal style='text-align:justify'><span style='font-size:13.0pt'><o:p>_______________________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_______________________</o:p></span></p>

<p class=Default style='text-align:justify'><span style='font-size:13.0pt'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<cfoutput>#get_titleid.bfirstname2# #get_titleid.blastname2#</cfoutput></span></p>


<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRoman;mso-bidi-font-family:TimesNewRoman;
color:#EE2024'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRoman;mso-bidi-font-family:TimesNewRoman;
color:#EE2024'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRoman;mso-bidi-font-family:TimesNewRoman;
color:#EE2024'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:13.0pt'>Waiver and Release 2012&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Revised<o:p></o:p></span></p>

<p class=MsoNormal align=center style='text-align:center;mso-layout-grid-align:
none;text-autospace:none'><span style='font-size:13.0pt'><o:p>&nbsp;</o:p></span></p>

<!---<p align="center">Page 2 of 4</p>--->

</IE:DEVICERECT>
<br>
<hr>
<br>
<p style="page-break-after:always;">&nbsp;</p>

<IE:DEVICERECT ID="page2" CLASS="" MEDIA="print">

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'>FANNIE MAE LOAN #: <cfoutput>#get_titleid.loan_number#</cfoutput><u><span style='mso-tab-count:4'>                                             </span><o:p></o:p></u></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'>REO #: <cfoutput>#get_titleid.reo_number#</cfoutput><u><span style='mso-tab-count:6'>                                                                       </span><o:p></o:p></u></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=center style='text-align:center;mso-layout-grid-align:
none;text-autospace:none'><b><span style='font-size:16.0pt;font-family:TimesNewRomanPS-BoldMT;
mso-bidi-font-family:TimesNewRomanPS-BoldMT'>TAX PRORATION AGREEMENT<o:p></o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center;mso-layout-grid-align:
none;text-autospace:none'><b><span style='font-size:16.0pt;font-family:TimesNewRomanPS-BoldMT;
mso-bidi-font-family:TimesNewRomanPS-BoldMT'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center;mso-layout-grid-align:
none;text-autospace:none'><span style='font-size:11.0pt;font-family:TimesNewRomanPSMT;
mso-bidi-font-family:TimesNewRomanPSMT'>____________________<o:p></o:p></span></p>

<p class=MsoNormal align=center style='text-align:center;mso-layout-grid-align:
none;text-autospace:none'><span style='font-size:11.0pt;font-family:TimesNewRomanPSMT;
mso-bidi-font-family:TimesNewRomanPSMT'>(DATE)<o:p></o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='line-height:200%;mso-layout-grid-align:none;
text-autospace:none'><span style='font-size:11.0pt;line-height:200%;font-family:
TimesNewRomanPSMT;mso-bidi-font-family:TimesNewRomanPSMT'>RE: <span
style='mso-tab-count:1'>     </span>Title Company GF #:<span style='mso-tab-count:
1'>  </span>TR139932X<o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:.5in;line-height:200%;mso-layout-grid-align:
none;text-autospace:none'><span style='font-size:11.0pt;line-height:200%;
font-family:TimesNewRomanPSMT;mso-bidi-font-family:TimesNewRomanPSMT'>Seller: <span
style='mso-tab-count:3'>                         </span>FANNIE MAE<o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:.5in;line-height:200%;mso-layout-grid-align:
none;text-autospace:none'><span style='font-size:11.0pt;line-height:200%;
font-family:TimesNewRomanPSMT;mso-bidi-font-family:TimesNewRomanPSMT'>Purchaser(s):
<span style='mso-tab-count:2'>             </span><cfoutput>#get_titleid.bfirstname1# #get_titleid.blastname1#</cfoutput><o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:.5in;line-height:200%;mso-layout-grid-align:
none;text-autospace:none'><span style='font-size:11.0pt;line-height:200%;
font-family:TimesNewRomanPSMT;mso-bidi-font-family:TimesNewRomanPSMT'>Property
Address: <span style='mso-tab-count:1'>      </span><cfoutput>#get_titleid.paddress# #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput><o:p></o:p></span></p>



<p class=MsoNormal style='text-align:justify;mso-layout-grid-align:none;
text-autospace:none'><span style='font-size:11.0pt;font-family:TimesNewRomanPSMT;
mso-bidi-font-family:TimesNewRomanPSMT'>The undersigned Purchaser(s) and Seller
of the above referenced property acknowledge that they have been advised that
the tax rolls may carry said property within a larger tract of land and/or as
unimproved or partially improved property.<o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;mso-layout-grid-align:none;
text-autospace:none'><span style='font-size:11.0pt;font-family:TimesNewRomanPSMT;
mso-bidi-font-family:TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='text-align:justify;mso-layout-grid-align:none;
text-autospace:none'><span style='font-size:11.0pt;font-family:TimesNewRomanPSMT;
mso-bidi-font-family:TimesNewRomanPSMT'>The undersigned agree to the proration
of taxes based on an estimate or actual taxes from the previous year on the
above referenced property. Further, the undersigned hereby agree that the
prorations are final and any difference will not be adjusted by the Seller
after closing.<o:p></o:p></span></p>

<p class=MsoNormal style='text-align:justify;mso-layout-grid-align:none;
text-autospace:none'><span style='font-size:11.0pt;font-family:TimesNewRomanPSMT;
mso-bidi-font-family:TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none;text-align:left'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'>Sincerely,<o:p></o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='margin-left:1.0in;text-indent:-1.0in;mso-layout-grid-align:
none;text-autospace:none'><span style='font-size:11.0pt;font-family:TimesNewRomanPSMT;
mso-bidi-font-family:TimesNewRomanPSMT'>Seller: <span style='mso-tab-count:
1'>             </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FANNIE MAE<o:p></o:p></span></p>


<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='margin-left:.5in;text-indent:.5in;mso-layout-grid-align:
none;text-autospace:none'><span style='font-size:11.0pt;font-family:TimesNewRomanPSMT;
mso-bidi-font-family:TimesNewRomanPSMT'>_____________________________________________<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:.5in;text-indent:.5in;line-height:115%;
mso-layout-grid-align:none;text-autospace:none'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-bidi-font-family:TimesNewRomanPSMT'>By:
First Title & Escrow, Inc., dba 1ST Title & Escrow as Attorney in Fact<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:.5in;text-indent:.5in;line-height:115%;
mso-layout-grid-align:none;text-autospace:none'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-bidi-font-family:TimesNewRomanPSMT'>Name:
__________________________________________<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:.5in;text-indent:.5in;line-height:115%;
mso-layout-grid-align:none;text-autospace:none'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-bidi-font-family:TimesNewRomanPSMT'>Title:
Authorized Agent<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:.5in;text-indent:.5in;line-height:115%;
mso-layout-grid-align:none;text-autospace:none'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-bidi-font-family:TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'>Purchaser(s):&nbsp;&nbsp;&nbsp;
_________________________________________<br>
 <span style='mso-tab-count:1'> </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<cfoutput>#get_titleid.blastname1#, #get_titleid.bfirstname1#</cfoutput><o:p></o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>


<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'><span style='mso-tab-count:2'>                        </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_________________________________________<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<cfoutput>#get_titleid.blastname2#, #get_titleid.bfirstname2#</cfoutput>
<o:p></o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:11.0pt;font-family:TimesNewRomanPSMT;
mso-bidi-font-family:TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:11.0pt;font-family:TimesNewRomanPSMT;
mso-bidi-font-family:TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:11.0pt;font-family:TimesNewRomanPSMT;
mso-bidi-font-family:TimesNewRomanPSMT'>Title Company Closer:
______________________________<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:11.0pt;font-family:TimesNewRomanPSMT;
mso-bidi-font-family:TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>
<!---<p align="center">Page 3 of 4</p>--->

</IE:DEVICERECT>
<br>
<hr>
<br>
<p style="page-break-after:always;">&nbsp;</p>

<IE:DEVICERECT ID="page2" CLASS="" MEDIA="print">

<p class=MsoNormal align=center style='text-align:center;mso-layout-grid-align:
none;text-autospace:none'><b><span style='font-size:13.0pt;font-family:TimesNewRomanPS-BoldMT;
mso-bidi-font-family:TimesNewRomanPS-BoldMT'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center;mso-layout-grid-align:
none;text-autospace:none'><b><span style='font-size:13.0pt;font-family:TimesNewRomanPS-BoldMT;
mso-bidi-font-family:TimesNewRomanPS-BoldMT'>ERRORS AND OMISSIONS CORRECTION
AGREEMENT<o:p></o:p></span></b></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'>LENDER: <u><span style='mso-tab-count:13'>                                                                                                                                                       </span><span
style='mso-tab-count:2'>                        </span><o:p></o:p></u></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'>BORROWER(S): <u><span style='mso-tab-count:12'>                                                                                                                                          </span><span
style='mso-tab-count:2'><cfoutput>#get_titleid.blastname1#, #get_titleid.bfirstname1#   #get_titleid.blastname2#, #get_titleid.bfirstname2#</cfoutput>                        </span><o:p></o:p></u></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'>LOAN NO: <u><span style='mso-tab-count:8'><cfoutput>#get_titleid.loan_number#</cfoutput>                                                                                         </span></u><span
style='mso-spacerun:yes'> </span> REO CASE NO:<u><span style='mso-tab-count:
3'> <cfoutput>#get_titleid.reo_number#</cfoutput>                               </span><span style='mso-tab-count:2'>                        </span><o:p></o:p></u></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'>PROPERTY: <u><span style='mso-tab-count:13'>                                                                                                                                                 </span><span
style='mso-tab-count:2'> <cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput>                       </span><o:p></o:p></u></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='text-indent:.5in;mso-layout-grid-align:none;
text-autospace:none'><span style='font-size:11.0pt;font-family:TimesNewRomanPSMT;
mso-bidi-font-family:TimesNewRomanPSMT'>For a good and valuable consideration,
and as a condition of the extension of credit evidenced by the above referenced
loan, the Borrower(s) and Seller(s) [if any] agree, if requested by the Note
Holder, Lender, Representative or Agent for Lender and/or Mortgage Broker
(herein &quot;Lender&quot;), to cooperate as hereinafter set forth.<o:p></o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='text-indent:.5in;mso-layout-grid-align:none;
text-autospace:none'><span style='font-size:11.0pt;font-family:TimesNewRomanPSMT;
mso-bidi-font-family:TimesNewRomanPSMT'>In the event any of the documents
evidencing and/or securing the above referenced loan misstate or inaccurately
reflect the true and correct terms and provisions of the loan, Borrower(s) and
any Seller(s) shall upon request by Lender and in order to correct such
misstatement and inaccuracy, execute such new documents or initial such
corrected original documents as Lender may deem necessary to remedy said
inaccuracy or mistake.<o:p></o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='text-indent:.5in;mso-layout-grid-align:none;
text-autospace:none'><span style='font-size:11.0pt;font-family:TimesNewRomanPSMT;
mso-bidi-font-family:TimesNewRomanPSMT'>The agreements contained herein shall
apply whether said misstatement or inaccuracy is due to unilateral mistake on
the part of the Lender or Borrower(s) or any Seller(s), mutual mistake on the
part of Lender and Borrower(s) and any Seller(s) or clerical error on the part
of any party to the transaction.<o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:.5in;mso-layout-grid-align:none;
text-autospace:none'><span style='font-size:11.0pt;font-family:TimesNewRomanPSMT;
mso-bidi-font-family:TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='text-indent:.5in;mso-layout-grid-align:none;
text-autospace:none'><span style='font-size:11.0pt;font-family:TimesNewRomanPSMT;
mso-bidi-font-family:TimesNewRomanPSMT'>Failure by the party to initial or
execute such documents as and when requested hereunder shall constitute a
breach of the contractual agreement evidenced hereby and shall also constitute
a default under the Note evidencing and Deed of Trust or other security
instrument securing the loan. <o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:.5in;mso-layout-grid-align:none;
text-autospace:none'><span style='font-size:11.0pt;font-family:TimesNewRomanPSMT;
mso-bidi-font-family:TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='text-indent:.5in;mso-layout-grid-align:none;
text-autospace:none'><span style='font-size:11.0pt;font-family:TimesNewRomanPSMT;
mso-bidi-font-family:TimesNewRomanPSMT'>This Agreement shall be binding on the
signatories hereto, their heirs and assigns and shall inure to the benefit of
Lender, it successor, and assigns.<o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:.5in;mso-layout-grid-align:none;
text-autospace:none'><span style='font-size:11.0pt;font-family:TimesNewRomanPSMT;
mso-bidi-font-family:TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'>Time is of the essence concerning all agreements contained
herein.<o:p></o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'>Dated the ______________________ day of
_________________________________________________, 201_<o:p></o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'>X____________________________________________________<o:p></o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'><span style='mso-spacerun:yes'>  </span>Purchaser – <cfoutput>#get_titleid.bfirstname1# #get_titleid.blastname1#</cfoutput><o:p></o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='mso-layout-grid-align:none;text-autospace:none'><span
style='font-size:11.0pt;font-family:TimesNewRomanPSMT;mso-bidi-font-family:
TimesNewRomanPSMT'>X____________________________________________________<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:11.0pt;font-family:TimesNewRomanPSMT;
mso-bidi-font-family:TimesNewRomanPSMT'><span style='mso-spacerun:yes'>  
</span>Purchaser – <cfoutput>#get_titleid.bfirstname2# #get_titleid.blastname2#</cfoutput><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:11.0pt;font-family:TimesNewRomanPSMT;
mso-bidi-font-family:TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:11.0pt;font-family:TimesNewRomanPSMT;
mso-bidi-font-family:TimesNewRomanPSMT'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:11.0pt;font-family:TimesNewRomanPSMT;
mso-bidi-font-family:TimesNewRomanPSMT'>x____________________________________________________<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:11.0pt;font-family:TimesNewRomanPSMT;
mso-bidi-font-family:TimesNewRomanPSMT'><span style='mso-spacerun:yes'> 
</span>Seller: Fannie Mae a/k/a Federal National Mortgage Association <o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:.5in;text-indent:.5in;line-height:115%;
mso-layout-grid-align:none;text-autospace:none'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-bidi-font-family:TimesNewRomanPSMT'><span
style='mso-spacerun:yes'> </span>By: First Title &amp; Escrow, Inc., LLP, as Attorney
in Fact<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:.5in;text-indent:.5in;line-height:115%;
mso-layout-grid-align:none;text-autospace:none'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-bidi-font-family:TimesNewRomanPSMT'><span
style='mso-spacerun:yes'> </span>Name: __________________________________________<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:.5in;text-indent:.5in;line-height:115%;
mso-layout-grid-align:none;text-autospace:none'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-bidi-font-family:TimesNewRomanPSMT'><span
style='mso-spacerun:yes'> </span>Title: Authorized Agent<o:p></o:p></span></p>

<p class=MsoNormal style='text-indent:.5in'><span style='font-size:11.0pt;
font-family:TimesNewRomanPSMT'><span style='mso-tab-count:2'>                        </span><o:p></o:p></span></p>


</td>
	</tr>
</table>
<!---<p align="center">Page 4 of 4</p>--->
<!--- end of page 1 ---->
</IE:DEVICERECT>




<!---
<br>
<hr>
<br>

<p style="page-break-after:always;">&nbsp;</p>

<IE:DEVICERECT ID="page2" CLASS="" MEDIA="print">
<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td align="left" valign="top">

<br>
<table border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td align="left" valign="top">REO# <cfoutput><cfif get_titleid.recordcount and Len(get_titleid.reo_number)>
<INPUT NAME="reo_number" SIZE=20 MAXLENGTH=20 style="font-size: 10;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="#get_titleid.reo_number#"><cfelse>
									<INPUT NAME="reo_number" SIZE=20 MAXLENGTH=20 style="font-size: 10;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="">
</cfif></cfoutput></td>
  </tr>
</table>

<br>

<p align="center"><font size="+1"><strong><strong>WAIVER AND RELEASE REGARDING PROPERTY CONDITION AT CLOSING<BR>
THIS WAIVER AND RELEASE IS TO BE EXECUTED ONLY AT CLOSING
</strong>
</strong><br></P>
<br></font>


<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This Waiver and Release Regarding Property Condition at Closing is given by <cfoutput>#get_titleid.bfirstname1# <cfif Len(get_titleid.bminame1)>#get_titleid.bminame1#. </cfif>#get_titleid.blastname1#<cfif Len(get_titleid.blastname2)>, #get_titleid.bfirstname2# <cfif Len(get_titleid.bminame2)>#get_titleid.bminame2#. </cfif>#get_titleid.blastname2#</cfif><cfif Len(get_titleid.blastname3)>, #get_titleid.bfirstname3# <cfif Len(get_titleid.bminame3)>#get_titleid.bminame3#. </cfif>#get_titleid.blastname3#</cfif><cfif Len(get_titleid.blastname4)>, #get_titleid.bfirstname4# <cfif Len(get_titleid.bminame4)>#get_titleid.bminame4#. </cfif>#get_titleid.blastname4#</cfif></cfoutput> ("Purchaser") to
   FANNIE MAE A/K/A FEDERAL NATIONAL MORTGAGE ASSOCIATION ("Seller") in connection with the purchase of the property located at <cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput> ("Property") pursuant to the contract of sale between Purchaser and Seller with an Acknowledgment Date of
<cfoutput><cfif mods.recordcount and Len(mods.verbal_ack_date)>
<INPUT NAME="verbal_ack_date" SIZE=20 MAXLENGTH=20 style="font-size: 10;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="#DateFormat(mods.verbal_ack_date, 'm/d/yyyy')#"><cfelse>
									<INPUT NAME="verbal_ack_date" SIZE=20 MAXLENGTH=20 style="font-size: 10;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="">
</cfif></cfoutput> ("Agreement").<br><br>


Purchaser acknowledges that the Property was acquired by Seller by foreclosure, deed in lieu of
foreclosure, forfeiture, tax sale, right of eminent domain or similar process. Purchaser has inspected the
Property or was given the right to inspect the Property to determine the condition of the Property and
discover any defects. <strong>Purchaser acknowledges and accepts the Property in "AS IS" condition at the
time of closing, including, without limitation, any hidden defects or environmental conditions affecting
the Property (including but not limited to, drywall, mold, mildew, microscopic organisms, lead paint,
fuel oil, allergens, or other toxic substances of any kind), whether known or unknown and whether or
not such defects or conditions were discoverable through inspection.</strong> Purchaser acknowledges that Seller,
its agents and representatives have not made, and Seller specifically negates and disclaims, any
representations, warranties, promises, covenants, agreements or guarantees, implied or express, oral or written
in respect to
<br>
<br>
<table width="775" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="30" align="left" valign="top">(1)</td>
    <td align="left" valign="top">the physical condition or any other aspect of the Property including the structural integrity or the quality
or character of materials used in construction of any improvements, availability and quantity or quality of
water, stability of the soil, susceptibility to landslide or flooding, sufficiency of drainage, water leaks,
water damage, environmental conditions, or any other matter affecting the stability or integrity of the
Property or improvements;
</td>
  </tr>
  <tr>
    <td align="left" valign="top">(2)</td>
    <td align="left" valign="top">the conformity of the Property or the improvements to any zoning, land use or building code
requirements or compliance with any laws, rules, ordinances or regulations of any federal, state or
local governmental authority, or the granting of any required permits or approvals, if any, of any
governmental bodies which had jurisdiction over the construction of the original structure, any
improvements and/or any remodeling of the structure; and
</td>
  </tr>
  <tr>
    <td align="left" valign="top">(3)</td>
    <td align="left" valign="top">the habitability, merchantability, marketability, profitability or fitness for a particular purpose of the
Property or improvements including redhibitory vices and defects, apparent, non apparent or latent,
which now exist or which may hereafter exist and which if known to purchaser, would cause purchaser
to refuse to purchase the property.
</td>
  </tr>
</table>

<br>
Purchaser represents and warrants to Seller the following:<br>
<br>

<table width="775" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="30" align="left" valign="top">(1)</td>
    <td align="left" valign="top">Purchaser is purchasing the Property solely in reliance on its own investigation and inspection of the
Property and not on any information, representation or warranty provided or to be provided by Seller,
its servicers, representatives, brokers, employees, agents or assigns;
</td>
  </tr>
  <tr>
    <td align="left" valign="top">(2)</td>
    <td align="left" valign="top">Neither Seller, nor its servicers, employees, representatives, brokers, agents or assigns, has made any
representations or warranties, implied or expressed, relating to the condition of the Property or the
contents thereof, except as expressly set forth in the Contract; and
</td>
  </tr>
  <tr>
    <td align="left" valign="top">(3)</td>
    <td align="left" valign="top">Purchaser has not relied on any representation or warranty from seller regarding the nature, quality or
workmanship of any repairs made by Seller.
</td>
  </tr>
  <tr>
    <td align="left" valign="top">(4)</td>
    <td align="left" valign="top">Purchaser has inspected or been given the opportunity to inspect any repairs made by Seller to the
Property and accepts the repairs under the terms and conditions of the Contract and such repairs have
been performed to the complete satisfaction of Purchaser.
</td>
  </tr>
  <tr>
    <td align="left" valign="top">(5)</td>
    <td align="left" valign="top">Purchaser will not occupy or cause or permit others to occupy the Property unless and until any
necessary certificate of occupancy, smoke detector certification, septic certification or any similar
certification or permit has been obtained from the appropriate governmental entity.
</td>
  </tr>
  </table>
<br>

<strong>AS A MATERIAL PART OF THE CONSIDERATION TO BE RECEIVED BY SELLER, UNDER
THE TERMS OF THE CONTRACT AS NEGOTIATED BY PURCHASER AND SELLER,
PURCHASER WAIVES
</strong><br>
<br>
<table width="775" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="30" align="left" valign="top">(A)</td>
    <td align="left" valign="top">ANY AND ALL CLAIMS ARISING FROM THE ADJUSTMENTS OR PRORATIONS OR
ERRORS IN CALCULATING THE ADJUSTMENTS OR PRORATIONS THAT ARE OR MAY
BE DISCOVERED AFTER CLOSING;
</td>
  </tr>
</table>
</IE:DEVICERECT>




<br>
<hr>
<br>


<p style="page-break-after:always;">&nbsp;</p>


<IE:DEVICERECT ID="page3" CLASS="" MEDIA="print">


<table width="775" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="30" align="left" valign="top">(B)</td>
    <td align="left" valign="top">ANY CLAIMS FOR FAILURE OF CONSIDERATION AND/OR MISTAKE OF FACT AS
SUCH CLAIMS RELATE TO THE PURCHASE OF THE PROPERTY OR ENTERING INTO
OR THE EXECUTION OF AND CLOSING UNDER THIS AGREEMENT;
</td>
  </tr>
  <tr>
    <td align="left" valign="top">(C)</td>
    <td align="left" valign="top">ANY REMEDY OF ANY KIND, OTHER THAN AS EXPRESSLY PROVIDED IN THE
CONTRACT TO WHICH PURCHASER MIGHT OTHERWISE BE ENTITLED AT LAW OR
EQUITY BASED ON MUTUAL MISTAKE OF FACT OR LAW OR OTHERWISE,
INCLUDING BUT NOT LIMITED TO RESCISSION OF THIS AGREEMENT;
</td>
  </tr>
  <tr>
    <td align="left" valign="top">(D)</td>
    <td align="left" valign="top">TRIAL BY JURY, EXCEPT AS PROHIBITED BY LAW, IN ANY LITIGATION ARISING
FROM OR CONNECTED WITH OR RELATED TO THIS AGREEMENT;
</td>
  </tr>
  <tr>
    <td align="left" valign="top">(E)</td>
    <td align="left" valign="top">ANY CLAIMS OR LOSSES PURCHASER MAY INCUR AS A RESULT OF CONSTRUCTION
OR OTHER DEFECTS, WHICH MAY NOW OR HEREAFTER EXIST WITH RESPECT TO
THE PROPERTY;
</td>
  </tr>
  <tr>
    <td align="left" valign="top">(F)</td>
    <td align="left" valign="top">ANY RIGHT TO AVOID THIS SALE OR REDUCE THE PRICE OR HOLD SELLER
RESPONSIBLE FOR DAMAGES ON ACCOUNT OF THE CONDITION OF THE PROPERTY,
LACK OF SUITABILITY AND FITNESS, OR REDHIBITORY VICES AND DEFECTS,
APPARENT, NONAPPARENT OR LATENT, DISCOVERABLE OR NONDISCOVERABLE;
</td>
  </tr>
  <tr>
    <td align="left" valign="top">(G)</td>
    <td align="left" valign="top">ANY CLAIM ARISING FROM ENCROACHMENTS, EASEMENTS, SHORTAGES IN AREA
OR ANY OTHER MATTER WHICH WOULD BE DISCLOSED OR REVEALED BY A
SURVEY OR INSPECTION OF THE PROPERTY OR SEARCH OF PUBLIC RECORDS; AND
</td>
  </tr>
  <tr>
    <td align="left" valign="top">(H)</td>
    <td align="left" valign="top">ANY RIGHT TO MEDIATION OR ARBITRATION RELATING TO OR ARISING UNDER OR
FROM THIS AGREEMENT, EXCEPT AS PROHIBITED BY LAW.
</td>
  </tr>
</table>
<br>
<strong>IF THE PROPERTY IS LOCATED IN CALIFORNIA THE FOLLOWING PARAGRAPHS SHALL APPLY:</strong><br>
It is the intention of Purchaser in executing this release that it shall be effective as a bar to each and every
claim, demand and cause of action hereinabove specified and in furtherance of this Purchaser hereby
expressly waives any and all rights and benefits conferred by the provisions of Section 1542 of the Civil
Code of the State of California, which reads:
<br>
<blockquote>
"A general release does not extend to claims which the creditor does not know
or suspect to exist in his favor at the time of executing the release, which if
known by him must have materially affected his settlement with the debtor.
"</blockquote>
Purchaser expressly consents that this release shall be given full force and effect as to all of its terms and
provisions including as well those relating to unsuspected claims, demands and causes of action
hereinabove specified. If any provision of this release be invalid or unenforceable, it is the intention of the
Purchaser that all of the other provisions shall be fully valid and enforceable according to their terms.
<br>
<br>

The invalidity, illegality or enforceability of any provision of this Addendum shall not affect the validity or
enforceability of any other provision of this Addendum, all of which shall remain in full force and effect.
<br>
<br>

Executed this  _____________	day of __________________________________________, <cfoutput>#Year(Now())#</cfoutput><br>
<br>
<table width="775" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td align="left" valign="top" width="400">Witness</td>
    <td align="left" valign="top" width="400">Purchaser(s)</td>
  </tr>
  <tr>
    <td align="left" valign="top" width="400">_________________________________________</td>
    <td align="left" valign="top" width="400">_________________________________________</td>
  </tr>
  <tr>
    <td align="left" valign="top" width="400">_________________________________________</td>
    <td align="left" valign="top" width="400"><cfoutput>#get_titleid.bfirstname1# <cfif Len(get_titleid.bminame1)>#get_titleid.bminame1#. </cfif>#get_titleid.blastname1#</cfoutput></td>
  </tr>
<cfif Len(get_titleid.blastname2)>
  <tr>
    <td align="left" valign="top" width="400">&nbsp;</td>
    <td align="left" valign="top" width="400">_________________________________________</td>
  </tr>
  <tr>
    <td align="left" valign="top" width="400">&nbsp;</td>
    <td align="left" valign="top" width="400"><cfoutput>#get_titleid.bfirstname2# <cfif Len(get_titleid.bminame2)>#get_titleid.bminame2#. </cfif>#get_titleid.blastname2#</cfoutput></td>
  </tr>
</cfif>
<cfif Len(get_titleid.blastname3)>
  <tr>
    <td align="left" valign="top" width="400">&nbsp;</td>
    <td align="left" valign="top" width="400">_________________________________________</td>
  </tr>
  <tr>
    <td align="left" valign="top" width="400">&nbsp;</td>
    <td align="left" valign="top" width="400"><cfoutput>#get_titleid.bfirstname3# <cfif Len(get_titleid.bminame3)>#get_titleid.bminame3#. </cfif>#get_titleid.blastname3#</cfoutput></td>
  </tr>
</cfif>
<cfif Len(get_titleid.blastname4)>
  <tr>
    <td align="left" valign="top" width="400">&nbsp;</td>
    <td align="left" valign="top" width="400">_________________________________________</td>
  </tr>
  <tr>
    <td align="left" valign="top" width="400">&nbsp;</td>
    <td align="left" valign="top" width="400"><cfoutput>#get_titleid.bfirstname4# <cfif Len(get_titleid.bminame4)>#get_titleid.bminame4#. </cfif>#get_titleid.blastname4#</cfoutput></td>
  </tr>
</cfif>

</table><br>

<br>

<br>
<hr>
<br>


<br>
<br>
<table width="800" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>

<br>

<p align="center"><font size="+1"><strong><strong>ERRORS AND OMISSIONS CORRECTION AGREEMENT</strong>
</strong><br></P>
<br></font>

<table width="775" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="150" align="left" valign="top">LENDER:</td>
    <td width="225" align="left" valign="top"><cfoutput><cfif get_titleid.recordcount and Len(mods.lender)>
<INPUT NAME="lender" SIZE=20 MAXLENGTH=20 style="font-size: 10;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="#mods.lender#"><cfelse>
									<INPUT NAME="lender" SIZE=20 MAXLENGTH=20 style="font-size: 10;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="">
</cfif></cfoutput></td>
    <td width="150" align="left" valign="top">&nbsp;</td>
    <td width="200" align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td>BORROWER(S):</td>
    <td><cfoutput>#get_titleid.bfirstname1# <cfif Len(get_titleid.bminame1)>#get_titleid.bminame1#. </cfif>#get_titleid.blastname1#<cfif Len(get_titleid.blastname2)>, #get_titleid.bfirstname2# <cfif Len(get_titleid.bminame2)>#get_titleid.bminame2#. </cfif>#get_titleid.blastname2#</cfif><cfif Len(get_titleid.blastname3)>, #get_titleid.bfirstname3# <cfif Len(get_titleid.bminame3)>#get_titleid.bminame3#. </cfif>#get_titleid.blastname3#</cfif><cfif Len(get_titleid.blastname4)>, #get_titleid.bfirstname4# <cfif Len(get_titleid.bminame4)>#get_titleid.bminame4#. </cfif>#get_titleid.blastname4#</cfif></cfoutput></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>LOAN NO:</td>
    <td><cfoutput><cfif get_titleid.recordcount and Len(get_titleid.fannie_loan_id)>
<INPUT NAME="fannie_loan_id" onChange="document.modform.fannie_loan_id2.value=document.modform.fannie_loan_id.value; document.modform.fannie_loan_id3.value=document.modform.fannie_loan_id.value;" SIZE=20 MAXLENGTH=20 style="font-size: 10;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="#get_titleid.fannie_loan_id#"><cfelse>
									<INPUT  onChange="document.modform.fannie_loan_id2.value=document.modform.fannie_loan_id.value; document.modform.fannie_loan_id3.value=document.modform.fannie_loan_id.value;" NAME="fannie_loan_id" SIZE=20 MAXLENGTH=20 style="font-size: 10;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="">
</cfif></cfoutput></td>
    <td ALIGN="RIGHT">REO CASE NO:&nbsp;&nbsp;</td>
    <td><cfoutput><cfif get_titleid.recordcount and Len(get_titleid.reo_number)>#get_titleid.reo_number#</cfif></cfoutput></td>
  </tr>
  <tr>
    <td>PROPERTY:</td>
    <td colspan=3><cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput></td>
  </tr>
</table>
<br>
<br>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For a good and valuable consideration, and as a condition of the extension of credit evidenced by the above referenced loan, the Borrower(s) and Seller(s) [if any] agree, if requested by the Note Holder, Lender, Representative or Agent for Lender and/or Mortgage Broker (herein "Lender"), to cooperate as hereinafter set forth.<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;In the event any of the documents evidencing and/or securing the above referenced loan misstate or inaccurately reflect the true and correct terms and provisions of the loan, Borrower(s) and any Seller(s) shall upon request by Lender and in order to correct such misstatement and inaccuracy, execute such new documents or initial such corrected original documents as Lender may deem necessary to remedy said inaccuracy or mistake.
<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The agreements contained herein shall apply whether said misstatement or inaccuracy is due to unilateral mistake on the part of the Lender or Borrower(s) or any Seller(s), mutual mistake on the part of Lender and Borrower(s) and any Seller(s) or clerical error on the part of any party to the transaction.
<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Failure by the party to initial or execute such documents as and when requested hereunder shall constitute a breach of the contractual agreement evidenced hereby and shall also constitute a default under the Note evidencing and Deed of Trust or other security instrument securing the loan.
<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This Agreement shall be binding on the signatories hereto, their heirs and assigns and shall inure to the benefit of Lender, it successor, and assigns.
<br>
<br>
Time is of the essence concerning all agreements contained herein.<br>
<br>
<br>
Dated the ______________________ day of ___________________________________________________ , <cfoutput>#Year(Now())#</cfoutput><br>
<br>
<br>
<br>
<table width="775" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="400" align="left" valign="top">X______________________________________<br>
<cfoutput>#get_titleid.bfirstname1# <cfif Len(get_titleid.bminame1)>#get_titleid.bminame1#. </cfif>#get_titleid.blastname1#</cfoutput><br>
<br>
<br>
<cfif Len(get_titleid.blastname2)>
X______________________________________<br>
<cfoutput>#get_titleid.bfirstname2# <cfif Len(get_titleid.bminame2)>#get_titleid.bminame2#. </cfif>#get_titleid.blastname2#</cfoutput><br>
<br>
<br>
</cfif>
<cfif Len(get_titleid.blastname3)>
X______________________________________<br>
<cfoutput>#get_titleid.bfirstname3# <cfif Len(get_titleid.bminame3)>#get_titleid.bminame3#. </cfif>#get_titleid.blastname3#</cfoutput><br>
<br>
<br>
</cfif>
<cfif Len(get_titleid.blastname4)>
X______________________________________<br>
<cfoutput>#get_titleid.bfirstname4# <cfif Len(get_titleid.bminame4)>#get_titleid.bminame4#. </cfif>#get_titleid.blastname4#</cfoutput><br>
<br>
<br>
</cfif>
X______________________________________<br>
Seller<br><br>
By: ______________________________________<br>
Authorized Agent
</td>
<!---
    <td width="375" align="left" valign="top"><img src="../images/ss_sig.jpg"><br>
Seller: Steve E. Sacks<br><br>
<em><strong>Attorney in Fact</strong></em></td>
--->
  </tr>
</table>
<br>
<br>
<br>
<br>







<div align="right">EXHIBIT D</div>


</td>
	</tr>
</table>
<!--- end of page 1 ---->
</IE:DEVICERECT>


<br>
<hr>
<br>

<p style="page-break-after:always;">&nbsp;</p>

<IE:DEVICERECT ID="page4" CLASS="" MEDIA="print">


<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>

<br>
<table border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="400">FANNIE MAE LOAN #: <cfoutput><cfif get_titleid.recordcount and Len(get_titleid.fannie_loan_id)>
<INPUT NAME="fannie_loan_id2" onChange="document.modform.fannie_loan_id.value=document.modform.fannie_loan_id2.value; document.modform.fannie_loan_id3.value=document.modform.fannie_loan_id2.value;" SIZE=20 MAXLENGTH=20 style="font-size: 10;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="#get_titleid.fannie_loan_id#"><cfelse>
									<INPUT NAME="fannie_loan_id2" onChange="document.modform.fannie_loan_id.value=document.modform.fannie_loan_id2.value; document.modform.fannie_loan_id3.value=document.modform.fannie_loan_id2.value;"  SIZE=20 MAXLENGTH=20 style="font-size: 10;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="">
</cfif></cfoutput></td>
    <td>REO #: <cfoutput><cfif get_titleid.recordcount and Len(get_titleid.reo_number)>#get_titleid.reo_number#</cfif></cfoutput></td>
  </tr>
</table>

<br><br>


<p align="center"><font size="+2"><strong>TAX PRORATION AGREEMENT</strong><br>
<br></font>
____________________<br>
(DATE)</p><br>
<br>

<table border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="50">RE:</td>
    <td width="200">Title Company GF #:</td>
    <td width="200"><cfoutput><cfif mods.recordcount and Len(mods.title_co_gf)>
<INPUT NAME="title_co_gf" SIZE=20 MAXLENGTH=20 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="#mods.title_co_gf#"><cfelse>
									<INPUT NAME="title_co_gf" SIZE=20 MAXLENGTH=20 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="">
</cfif></cfoutput></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Seller:</td>
    <td>FANNIE MAE</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Purchaser:</td>
    <td><cfoutput>#get_titleid.bfirstname1# <cfif Len(get_titleid.bminame1)>#get_titleid.bminame1#. </cfif>#get_titleid.blastname1#<cfif Len(get_titleid.blastname2)>, #get_titleid.bfirstname2# <cfif Len(get_titleid.bminame2)>#get_titleid.bminame2#. </cfif>#get_titleid.blastname2#</cfif><cfif Len(get_titleid.blastname3)>, #get_titleid.bfirstname3# <cfif Len(get_titleid.bminame3)>#get_titleid.bminame3#. </cfif>#get_titleid.blastname3#</cfif><cfif Len(get_titleid.blastname4)>, #get_titleid.bfirstname4# <cfif Len(get_titleid.bminame4)>#get_titleid.bminame4#. </cfif>#get_titleid.blastname4#</cfif></cfoutput></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Property Address:</td>
    <td><cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput></td>
  </tr>
</table>
<br>
<br>
The undersigned Purchaser(s) and Seller of the above referenced property acknowledge that they
have been advised that the tax rolls may carry said property within a larger tract of land and/or as
unimproved or partially improved property.
<br>
<br>

The undersigned agree to the proration of taxes based on an estimate or actual taxes from the
previous year on the above referenced property. Further, the undersigned hereby agree that the
prorations are final and any difference will not be adjusted by the Seller after closing.
<br>
<br>

Sincerely,<br>
<br>
<table border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="200">Seller:</td>
    <td width="500">FANNIE MAE</td>
  </tr>
  <tr>
    <td width="200">By:</td>
    <td width="500">______________________________&nbsp;</td>
  </tr>
  <tr>
    <td width="200">Title:</td>
    <td width="500">Authorized Agent</td>
  </tr>
  <tr>
    <td width="200">Purchaser(s):</td>
    <td width="500">______________________________&nbsp;<!---<cfoutput>#get_titleid.sfirstname1# <cfif Len(get_titleid.sminame1)>#get_titleid.sminame1#. </cfif>#get_titleid.slastname1#</cfoutput>---></td>
  </tr>
<cfif Len(get_titleid.slastname2)>
  <tr>
    <td width="200">&nbsp;</td>
    <td width="500">______________________________ &nbsp;, #get_titleid.sfirstname2# <cfif Len(get_titleid.sminame2)>#get_titleid.sminame2#. </cfif>#get_titleid.slastname2#</td>
  </tr>
</cfif>
  <tr>
    <td width="200">Title Company Closer:</td>
    <td width="500">______________________________ </td>
  </tr>
</table>

</IE:DEVICERECT>


<br>
<hr>
<br>
--->


<!--- <IE:DEVICERECT ID="page5" CLASS="" MEDIA="print">


<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>

<br>
<center><B>AFFIDAVIT AND INDEMNIFICATION AS TO DEBTS AND LIENS</B></center><br>

<table border="0" cellspacing="2" cellpadding="2">
<tr>
    <td>REO CASE #: <cfoutput><cfif get_titleid.recordcount and Len(get_titleid.reo_number)>#get_titleid.reo_number#</cfif></cfoutput></td>
  </tr>
  <tr>
    <td>FANNIE MAE LOAN #: <cfoutput><cfif get_titleid.recordcount and Len(get_titleid.fannie_loan_id)>
<INPUT NAME="fannie_loan_id3" onChange="document.modform.fannie_loan_id.value=document.modform.fannie_loan_id3.value; document.modform.fannie_loan_id2.value=document.modform.fannie_loan_id3.value;" SIZE=20 MAXLENGTH=20 style="font-size: 10;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="#get_titleid.fannie_loan_id#"><cfelse>
									<INPUT onChange="document.modform.fannie_loan_id.value=document.modform.fannie_loan_id3.value; document.modform.fannie_loan_id2.value=document.modform.fannie_loan_id3.value;" NAME="fannie_loan_id3" SIZE=20 MAXLENGTH=20 style="font-size: 10;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="">
</cfif></cfoutput></td></tr>

  <tr>
    <td>Subject Property: <cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput></td></tr>
</table>

<br>
<center><B>AFFIDAVIT</B></center><br><br>


STATE OF <cfoutput>#get_titleid.pstate#</cfoutput> <br>
<br>

COUNTY OF <cfoutput>#get_titleid.pcounty#</cfoutput><br>
<br>


Upon oath, on this day of <cfoutput>#dateformat(get_titleid.a_insert_date, "mm/dd/yyyy")#</cfoutput>, Fannie Mae deposes, says and represents that, to the best of its knowledge, all debts for plumbing fixtures, water heaters, floor fences, air conditioners, radio or television antenna, carpeting, rugs, lawn sprinkling systems, venetian blinds, window shades, draperies, electrical appliances, fences, street paving, any construction management services, rental equipment, appliances and tools or any personal property or fixtures that are located on the subject property or for labor and material used in the construction, alteration, repair or removal of improvements on the subject property have now or will be paid.<br>
<br>

FANNIE MAE <br>
<br>

By: <img src="../images/ss_sig.jpg"><br>


Steve E. Sacks<br>
Title:   Attorney in Fact

<br>
<br>

SUBSCRIBED AND SWORN TO BEFORE ME on this ____________day of ________________________________ <cfoutput>#Year(Now())#</cfoutput>.<br>
<br>
<br>
<table width="800" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="400">&nbsp;</td>
    <td><img src="../images/tt_sig.jpg"><br>
Notary Public in and for the State of Maryland<br>
Tina L. Taylor<BR>
Exp 01/11/2010<br></td>
  </tr>
</table>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br><br>
<br>


<center><B>INDEMNIFICATION</B></center><br>
<br>

In consideration of	____________________________________________________________________. having an address of
______________________________________________________ ("Title Company") issuing a title insurance policy without exception<br>
for any debts, presently existing, for unrecorded lien or right to a lien for services, labor or material and for other good and valuable<br>
consideration, receipt of which is hereby acknowledged, Fannie Mae agrees to indemnify, defend and hold Title Company harmless from <br>
and against any and all claims, demands, or causes of action, of any kind or nature, arising as a result of the existence of <br>
such debts or liens.<br>
<br>

FANNIE MAE <br>
<br>

By: <img src="../images/ss_sig.jpg">
<br>

Steven E. Sacks<br>
Title:   Attorney in Fact
<br>
<br>
FANNIE MAE<br>
X&nbsp;___________________________________________________<br>
<br>

</IE:DEVICERECT>

<br>
<hr>
<br> --->

<!---
<p style="page-break-after:always;">&nbsp;</p>
<IE:DEVICERECT ID="page6" CLASS="" MEDIA="print">
<img src="../images/PartnershipResolution1.png"><br>

</IE:DEVICERECT>

<br>
<hr>
<br>

<p style="page-break-after:always;">&nbsp;</p>

<IE:DEVICERECT ID="page7" CLASS="" MEDIA="print">
<img src="images/PartnershipResolution3.jpg" width="700"><br>

</IE:DEVICERECT>

<br>
<hr>
<br>
--->
<!---
<p style="page-break-after:always;">&nbsp;</p>
<IE:DEVICERECT ID="page8" CLASS="" MEDIA="print">
<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
		<p align="center"><!--- <br>
<strong><u><font size=+1>HOW TO WIRE SALES PROCEEDS AND POST CLOSING
INSTRUCTIONS</font></u></strong> ---></p>
<!--- All <U><strong>Sales Proceeds</strong></U> should be wired to Fannie Mae by <U><strong>12:00 noon (CST)</strong></U> the following business day. Fannie Mae reserves the right to assess a $100.00 penalty per day for any delay in receipt of funds. When wiring, please use the following instructions:<BR><BR>

<table>
<tr>
<td>For the account of:</td><td>FNMA NYC VIA FEDERAL RESERVE BK OF NY</td>
</tr>
<tr>
<td>ABA Routing Number:</td><td>021039500</td>
</tr>
<tr>
<td>Required Reference:</td><td>Category: GR420 (Very Important)<br>
Attn: REO Sales     proceeds</td>
</tr>
<tr>
<td colspan=2>Fannie Mae <em><strong>10-Digit</strong></em> Loan Number or ROE # <cfoutput><cfif get_titleid.recordcount and Len(get_titleid.reo_number)>#get_titleid.reo_number#</cfif></cfoutput></td>
</tr>
<tr>
<td>Property Address:</td><td><cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput></td>
</tr>

</table>

<br>
Funds from each closing should be wired individually.<br>
<br>
<u><strong>No bank name, address or account number</strong></u> is required because this is a Fannie Mae Federal Reserve Bank account and the ABA Routing Number is Fannie Mae's. To obtain the required 10 digit Fannie Mae loan number, please contact Fannie Mae's listing agent. A maximum of Ten dollars ($10.00) may be charged to Fannie Mae on the HUD-1/Settlement Statement for wiring ONLY IF you are charged to wire proceeds.<br>
<br> --->

<style type="text/css">
<!--

.plaintext { font-size:12px;  color:#000000; }

-->
</style><table width="700" border="0" cellpadding=0 cellspacing=0>
  <tr bgcolor=000000>
    <td align="left" valign="top"><table width="800" border="0" cellpadding=3 cellspacing=2>
  <tr bgcolor=000000>
    <td align="center" valign="top" colspan="2"><font color="WHITE" size=+1><strong>2013 FANNIE MAE</strong><BR>
<strong>REO WIRE TRANSFER INSTRUCTIONS</strong><BR></font>
<font color="RED" size=+1><strong>FOR CLOSING USE ONLY</strong><BR></font></td>
  </tr>
  <tr bgcolor=ffffff>
    <td align="left" valign="top" colspan="2" class="plaintext"><font color="black"><strong>NOTE:</font> <font color="red">Please include all required information in the requested field format, failure to do so will delay the<BR>
processing of the remitted payment or result in the rejection of funds.</font></strong><br><br>
</td>
  </tr>
  <tr bgcolor=navy>
    <td align="left" valign="top" colspan="2">&nbsp;</td>
  </tr>
  <tr bgcolor=white>
    <td align="left" valign="top" colspan="2" class="plaintext">ACCOUNT INFORMATION<BR>
</td>
  </tr>
  <tr bgcolor=white>
    <td align="left" valign="top" width="50%" class="plaintext">ACCOUNT NAME</td>
    <td align="left" valign="top" width="50%" class="plaintext">FNMA Federal Reserve Bank</td>
  </tr>
  <tr bgcolor=white>
    <td align="left" valign="top" width="50%" class="plaintext"><br>
ABA ROUTING NUMBER<br>
(ABA Number and Account Number are the same)<br>
A Bank Name and Address Is Not Required.
</td>
    <td align="left" valign="top" width="50%" class="plaintext"><br>
021039500<br>
<br>
</td>
  </tr>
   <tr bgcolor=navy>
    <td align="left" valign="top" colspan="2">&nbsp;</td>
  </tr>
  <tr bgcolor=white>
    <td align="left" valign="top" width="50%" class="plaintext"><strong>REQUIRED FEDWIRE FIELDS</strong><br>
<font color="red"><em>(Please be sure to provide data in the correct fields)</em></font></td>
    <td align="left" valign="top" width="50%" class="plaintext"><strong>REQUIRED INFORMATION</strong><br>
<font color="red"><em>(Please be sure to include all required information)</em></font></td>
  </tr>
  <tr bgcolor=white>
    <td align="left" valign="top" width="50%" class="plaintext">OBI row 1 - Originator to Beneficiary Information<BR>
(35 characters limitation)</td>
    <td align="left" valign="top" width="50%" class="plaintext">169232420 (category code to denote Dallas) &amp; Receipt<br>Code (3 numeric digits - see code below)<br>
</td>
  </tr>
  <tr bgcolor=white>
    <td align="left" valign="top" width="50%" class="plaintext">OBI row 2 (35 characters limitation)<BR>
</td>
    <td align="left" valign="top" width="50%" class="plaintext">Ten Digit FannieMae Loan Number<BR>
and REO Case Id <cfoutput><cfif get_titleid.recordcount and Len(get_titleid.reo_number)>#get_titleid.reo_number#</cfif></cfoutput></td>
  </tr>
  <tr bgcolor=white>
    <td align="left" valign="top" width="50%" class="plaintext">OBI row 3 (35 characters limitation)<BR>
</td>
    <td align="left" valign="top" width="50%" class="plaintext"><BR>Property Address and Zip: <cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput></td>
  </tr>
  <tr bgcolor=white>
    <td align="left" valign="top" width="50%" class="plaintext">OBI row 4 (35 characters limitation)<BR>
</td>
    <td align="left" valign="top" width="50%" class="plaintext"><BR>Remitter Contact Information (Name and Phone#) </td>
  </tr>
  <tr bgcolor=white>
    <td align="left" valign="top" colspan="2" class="plaintext"><strong>RECEIPT CODE:</strong><BR><BR>
310 = Sales Proceeds HUD1<BR><BR>
317 = Taxes, Escrow<BR><BR>
322 = Reimbursement of Advances<BR><BR>
370 = Earnest Money<BR><BR></td>
  </tr>
  <tr bgcolor=navy>
    <td align="left" valign="top" colspan="2">&nbsp;</td>
  </tr>
  <tr bgcolor=white>
    <td align="left" valign="top" colspan="2">&nbsp;</td>
  </tr>
  <tr bgcolor=white>
    <td align="left" valign="top" colspan="2" class="plaintext"><strong>NOTE:<BR>
<font>When sending multiple payments on a wire, you must email the payment detail breakdown in Excel format. Failure to do<BR>
so will delay the processing or result in a return of the remitted payment.<BR>
Email the detail to FannieMae_REO_Receipts@fanniemae.com</font></strong><br>
<br>
If you receive a refund check payable directly to Fannie Mae, please forward the check to:<br>
P.O. Box 277672 Atlanta, GA 30384-7672
<br> or 1075 Loop Road LB 277672 College Park, GA 30337<br>
 
The check remittance should include the ten digit loan number, case number, property address and receipt code.
</td>
  </tr>
<tr bgcolor=white>
    <td align="left" valign="top" colspan="2" class="plaintext"><strong>Inquiries regarding funds sent in error, duplicate wires or over-remittances:<BR>
<font color="red">For Title/Closing Companies not directly representing Fannie Mae, please direct inquiries to the Fannie Mae Seller-Representative Title/Closing Vendor.<br><br>
For Fannie Mae Seller-Representative Title/Closing Vendors, please contact your designated Fannie Mae Closing Analyst.</font></strong><br>
<br>
</td>
  </tr>
</table></td></tr>
<tr><td><br><strong><u>International Plaza II - 14221 Dallas Parkway Suite #1000 Dallas, TX 75254-2916</u></strong></td></tr>
</table><br>
<br>

<input type=image border=0 src="./images/button_modify.gif"><br>


</td>
	</tr>
</table>
--->
<!--- end of page 1 ---->
<input type=image border=0 src="./images/button_modify.gif"><br>
</IE:DEVICERECT>
</cfform>


</body>
</html>
