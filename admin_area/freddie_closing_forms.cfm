<CFPARAM NAME="a_trigger" DEFAULT="0">
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
<CFFORM NAME="frm" ACTION="https://machine1.firsttitleservices.com/admin_area/freddie_CLOSING_FORMS_email.cfm?rec_id=#rec_id#" METHOD="POST">
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


<CFFORM NAME="modform" ACTION="./freddie_CLOSING_FORMS_final.cfm?rec_id=#rec_id#" METHOD="POST">
<IE:DEVICERECT ID="page1" CLASS="" MEDIA="print">

<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>

<div >
<p class=MsoBodyTextCxSpMiddle align=center style='text-align:center'><b
style='mso-bidi-font-weight:normal'><span style='mso-bidi-font-size:11.0pt;
font-family:TimesNewRomanPSMT'>STREAMLINE TITLE &amp; ESCROW, LLC</span></b>

<br><span style='font-size:9.0pt;mso-bidi-font-size:
10.0pt;font-family:TimesNewRomanPSMT;color:black'>7361 Calhoun Place, </span></b><b
style='mso-bidi-font-weight:normal'><span style='font-size:9.0pt;mso-bidi-font-size:
10.0pt;font-family:TimesNewRomanPSMT'>Suite 200, Rockville, MD 20850<o:p></o:p></span></b>

<br><b style='mso-bidi-font-weight:normal'><span
style='font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:TimesNewRomanPSMT'>301-315-8140<o:p></o:p></span></b>

<br>
<span style='font-size:9.0pt;mso-bidi-font-size:10.0pt;font-family:
TimesNewRomanPSMT'><a href="http://www.streamline-title.com">www.streamline-title.com</a><span
class=MsoHyperlink><o:p></o:p></span></span></b></p>		
</div>		
		
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
Property Address: <cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput><br>
Buyer(s): <cfoutput>#get_titleid.bfirstname1# <cfif Len(get_titleid.bminame1)>#get_titleid.bminame1#. </cfif>#get_titleid.blastname1#<cfif Len(get_titleid.blastname2)>, #get_titleid.bfirstname2# <cfif Len(get_titleid.bminame2)>#get_titleid.bminame2#. </cfif>#get_titleid.blastname2#</cfif><cfif Len(get_titleid.blastname3)>, #get_titleid.bfirstname3# <cfif Len(get_titleid.bminame3)>#get_titleid.bminame3#. </cfif>#get_titleid.blastname3#</cfif><cfif Len(get_titleid.blastname4)>, #get_titleid.bfirstname4# <cfif Len(get_titleid.bminame4)>#get_titleid.bminame4#. </cfif>#get_titleid.blastname4#</cfif></cfoutput><br>
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
Attention:   <cfoutput><cfif mods.recordcount and Len(mods.attention)>
<INPUT NAME="attention" SIZE=70 MAXLENGTH=70 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="#mods.attention#"><cfelse>
									<INPUT NAME="attention"  SIZE=70 MAXLENGTH=70 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
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
Streamline Title & Escrow, LLC will be representing Federal Home Loan Mortgage Corporation aka Freddie Mac in the above referenced transaction. Please review the following closing instructions CAREFULLY. 
<br><br>


<ol type="1"><li><b><u>REO/FORECLOSURE DOCUMENTS</u></b> are order by Streamline Title and will be forward once received.<br></li>

<li><b><u>TITLE ISSUES</u></b> – A signed title commitments/binder must be forwarded at least 10 business days prior to closing along with any copies of URT/Liens/Judgments that need to be cleared.<br></li>
<li><b><u>WATER/ REPAIRS /TERMITE REPAIRS</u></b> are NOT TO BE COLLECTED ON THE HUD. If the seller has agreed to pay for them, they will be paid outside of closing. If a payment confirmation is needed, please contact the listing agent directly. The buyer is responsible for all their inspection fees including the termite. No escrows are authorized to be collected from Freddie Mac’s proceeds on the HUD.</li>

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
<i>Approval of any delinquent amounts to be collected from the seller MUST be approved by Freddie Mac before a HUD-1 can be submitted for approval.</i>
</li>
</ol>

<center><b>HUD REQUIREMENTS</b></center><br>
<b>
<span style="color:red">FINAL HUDS ARE DUE NO LATER THAN 3:00PM (EST) – 48 HOURS PRIOR TO SETTLEMENT. IF A SELLER CONCESSION HAS BEEN APPROVED, THE FINAL HUD MUST INCLUDE ALL BUYER RELATED FEES (I.E. LENDER FEES). </span> 
</b>

<ol type="1">
<li>The Name and Address for the seller on the final HUD is: Federal Home Loan Mortgage Corporation  5000 Plano Parkway, Carrollton, TX 75010. </li>
<li>Seller is a government entity and is therefore exempt from grantor’s tax (there will be an exemption code on your new deed); seller also does not provide corporate certification, etc. </li>
<li><b>PLEASE CHARGE ON THE HUD</b>
<ol type="a">
<li>	
	Attorney Fee payable to Shapiro, Brown & Alt, LLP in the 1100 or 1300 section of the HUD in the amount of  $<INPUT NAME="attorney_fee" SIZE=20 MAXLENGTH=20 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="<cfoutput>#mods.attorney_fee#</cfoutput>">
	
	( $<INPUT NAME="attorney_fee_charging" SIZE=20 MAXLENGTH=20 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="<cfoutput>#mods.attorney_fee_charging#</cfoutput>">, if you are charging the $25.00 wire fee) . The only title fee the seller will accept is a $25.00(max) wire fee payable to your office for wiring their funds.

<br><br><i>Attorney Fee  checks payable to Shapiro Brown & Alt, LLP are to be forward to Streamline Title & Escrow, 7361 Calhoun Place, Suite 200, Rockville, MD 20855 at the time of disbursement.</i>
<br><br>
</li> 
<li>Total Commission (<INPUT NAME="totalcommissionpct" SIZE=20 MAXLENGTH=20 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="<cfoutput>#mods.totalcommissionpct#</cfoutput>">%): $<INPUT NAME="totalcommissionamt" SIZE=20 MAXLENGTH=20 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="<cfoutput>#mods.totalcommissionamt#</cfoutput>"><br>
	Listing Agent (<INPUT NAME="listingagentpct" SIZE=20 MAXLENGTH=20 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="<cfoutput>#mods.listingagentpct#</cfoutput>">%): $<INPUT NAME="listingagentamt" SIZE=20 MAXLENGTH=20 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
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
	Selling Agent (<INPUT NAME="sellingagentpct" SIZE=20 MAXLENGTH=20 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="<cfoutput>#mods.sellingagentpct#</cfoutput>">%): $<INPUT NAME="sellingagentamt" SIZE=20 MAXLENGTH=20 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
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

</li> 
<li>	Seller Closing Cost Credit: $<INPUT NAME="sellingcostcredit" SIZE=20 MAXLENGTH=20 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="<cfoutput>#mods.sellingcostcredit#</cfoutput>"> (MAX)</li> 
<li>
	Home Warranty: $<INPUT NAME="homewarranty" SIZE=20 MAXLENGTH=20 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="<cfoutput>#mods.homewarranty#</cfoutput>"> (MAX) (HOME WARRANTY MUST BE LISTED IN THE 1300 OF THE HUD on the Seller Side. Invoice to be provided by Buyer and/or agents and MUST be submitted together with the HUD. )
	<br><br>
	Other Fee: <INPUT NAME="otherfee1" SIZE=20 MAXLENGTH=80 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="<cfoutput>#mods.otherfee1#</cfoutput>">
	<br><br>
	Other Fee: <INPUT NAME="otherfee2" SIZE=20 MAXLENGTH=80 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" value="<cfoutput>#mods.otherfee2#</cfoutput>">
</li>
</ol>

</li>
<br><br>
</ol>






<p class=MsoNormal align=center style='text-align:center;line-height:115%'><b><u><span
style='mso-bidi-font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
mso-fareast-font-family:"Arial Unicode MS"'>IMMEDIATELY AFTER SETTLEMENT:<o:p></o:p></span></u></b></p>

<p class=MsoNormal align=center style='text-align:center;line-height:115%'><b><u><span
style='font-size:6.0pt;mso-bidi-font-size:11.0pt;line-height:115%;font-family:
TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS"'><o:p><span
 style='text-decoration:none'>&nbsp;</span></o:p></span></u></b></p>

<p class=MsoNormal style='line-height:115%'><i style='mso-bidi-font-style:normal'><span
style='font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'>THE BUYER SIGNED HUD-1 MUST BE RETURNED TO THIS OFFICE THE SAME DAY OF CLOSING NO LATER THAN 4:00 PM (EST) VIA EMAIL OR FAX.  <o:p></o:p></span></i></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:6.0pt;
mso-bidi-font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-fareast-font-family:"Arial Unicode MS";
mso-bidi-font-weight:bold'>Fax: 301-315-8197 or Email to <a
href="mailto:freddiemac@streamline-title.com">FreddieMac@streamline-title.com</a><o:p></o:p></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:7.0pt;
mso-bidi-font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'><o:p>&nbsp;</o:p></span></p>

<strong><p style="text-align:center">**FUNDING REQUIREMENTS***</p></strong>
You will be required to fund same day of closing in MD - (48 hours if Virginia) or a penalty will be assessed to you at a fee of $25.00 a day which should be sent to seller when funding in a separate wire.<br><br>
<strong>ONCE THIS TRANSACTION HAS FUNDED, A COPY OF THE SELLER WIRE CONFIRMATION (WHICH MUST INCLUDE THE 22 DIGIT FEDERAL REFERENCE NUMBER) AND THE DEED RECORDING RECEIPT or COPY OF THE RECORDED DEED MUST BE SENT TO FREDDIEMAC@STREAMLINE-TITLE.COM.</strong>

<div style="color:red;font-weight:bold">

AS THE BUYER’S REPRESENTATIVE, YOU ARE REQUIRED TO ADHERE TO THE POLICIES AND GUIDELINES WITHIN THE ENCLOSED INSTRUCTIONS. IF YOU ARE UNABLE TO MEET THESES REQUIREMENTS, PLEASE CONTACT THE STREAMLINE TITLE & ESCROW, LLC PROCESSOR ASSIGNED TO THIS TRANSACTION AS SOON AS POSSIBLE.
</div>
<br>
I have read and fully understand and acknowledge that our company will provide the information as requested in a timely manner furthermore we will be responsible for any penalties when funding after 48 hours.<br><br>
_______________________________________<br>
<strong>Printed Name of Title Company/Attorney</strong><br><br>

_______________________________________<br>
<strong>Authorized Signatory for Title Company/Attorney</strong><br><br>

_______________________________________<br>
<strong>Printed Name of Signatory</strong><br><br>


Please email back executed document to: freddiemac@streamline-title.com or fax to 301-315-8197<br><br>
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
font-family:TimesNewRomanPSMT'>STREAMLINE TITLE &amp; ESCROW, LLC<o:p></o:p></span></b>
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
TimesNewRomanPSMT'><a href="http://www.streamline-title.com">www.streamline-title.com</a><span
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
and have the deed executed. <u>PLEASE BE SURE TO ADVISE STREAMLINE IMMEDIATELY
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
style='font-size:11.0pt;font-family:"Arial Narrow","sans-serif"'>FINANCE TYPE: <INPUT NAME="finance_type" SIZE=25 MAXLENGTH=40 style="font-size: 9;
									font-family: verdana;
									font-style: normal;
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
href="mailto:fanniemae@streamline-title.com">freddiemac@streamline-title.com</a>
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
font-family:TimesNewRomanPSMT'>STREAMLINE TITLE &amp; ESCROW, LLC<o:p></o:p></span></b></p>

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
TimesNewRomanPSMT'><a href="http://www.streamline-title.com">www.streamline-title.com</a><span
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
note: Streamline Title &amp; Escrow, LLC will be preparing the Deed into the
buyer for closing. Our office will be releasing the original/executed deed to
your office once the Seller has approved the HUD<span style='color:black'>. </span>The
Deed will only be executed based on the terms of the contract and approval by
the seller- No corrections, mark-ups, and/or written information is to be added
to the deed once received by your office. If any revisions are required, please
contact your Streamline Closer prior to your settlement.<o:p></o:p></span></p>

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
mso-bidi-font-weight:bold'>The seller signed HUD-1 will not be released until our office is provided with the following on the day of closing: <o:p></o:p></span></p>

<ul style='margin-top:0in' type=disc>
 <li class=MsoNormal style='line-height:115%;mso-list:l5 level1 lfo10'><span
     style='font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
     mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'>Fully executed closing instructions<o:p></o:p></span></li>
 <li class=MsoNormal style='line-height:115%;mso-list:l5 level1 lfo10'><span
     style='font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
     mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'>Buyer Signed HUD-1<o:p></o:p></span></li>
 <li class=MsoNormal style='line-height:115%;mso-list:l5 level1 lfo10'><span
     style='font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
     mso-fareast-font-family:"Arial Unicode MS";mso-bidi-font-weight:bold'>Confirmation from buyers title company that <u>ALL</u> closing funds (lender/buyer/etc) have been received<o:p></o:p></span></li>

</ul>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;color:black'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='line-height:115%'><b style='mso-bidi-font-weight:
normal'><span style='font-size:11.0pt;line-height:115%;font-family:TimesNewRomanPSMT;
color:red'>If any issues arise that may create a delay in recordation or
disbursement of proceeds to Fannie Mae, please contact your Streamline Closer
immediately. <o:p></o:p></span></b></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;color:black'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT'>In the event, settlement does
not occur by the closing date per the contract or seller executed addendum; your
office will immediately return the original documents to:<o:p></o:p></span></p>

<p class=MsoNormal style='line-height:115%'><span style='font-size:11.0pt;
line-height:115%;font-family:TimesNewRomanPSMT;mso-no-proof:yes'>Streamline
Title &amp; Escrow, LLC <o:p></o:p></span></p>

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
mso-bidi-font-weight:bold'><a href="mailto:fanniemae@streamline-title.com">freddiemac@streamline-title.com</a>
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
<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td align="left" valign="top">

<p align="center"><img src="images/sb3.jpg" width="700">
</P>

</td>
	</tr>
</table>
<!--- end of page 1 ---->
</IE:DEVICERECT>



<input type=image border=0 src="./images/button_modify.gif"><br>
</IE:DEVICERECT>
</cfform>


</body>
</html>
