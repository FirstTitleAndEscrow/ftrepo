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
<CFFORM NAME="frm" ACTION="https://machine1.firsttitleservices.com/admin_area/vrm_CLOSING_FORMS_email.cfm?rec_id=#rec_id#" METHOD="POST">
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


<CFFORM NAME="modform" ACTION="./vrm_CLOSING_FORMS_final.cfm?rec_id=#rec_id#" METHOD="POST">
<IE:DEVICERECT ID="page1" CLASS="" MEDIA="print">

<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>



<div class=WordSection1>

<p class=MsoNormal align=center style='text-align:center'><b style='mso-bidi-font-weight:
normal'><u><span style='font-size:14.0pt;line-height:107%;font-family:"Segoe UI","sans-serif"'>Asset
Information Sheet<o:p></o:p></span></u></b></p>

<p class=MsoNormal><u><span style='font-family:"Segoe UI","sans-serif"'><o:p><span
 style='text-decoration:none'>&nbsp;</span></o:p></span></u></p>

<p class=MsoNormal><u><span style='font-family:"Segoe UI","sans-serif"'>Property
Address:</u> <cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput><o:p></o:p></span></p>

<p class=MsoNormal><u><span style='font-family:"Segoe UI","sans-serif"'>Asset:</span></u>  <cfoutput>#get_titleid.reo_number#</cfoutput></p>

<p class=MsoNormal><span style='font-size:12.0pt;line-height:107%;font-family:
"Segoe UI","sans-serif"'>First Title will be your point of contact for all questions and concerns pertaining to the seller for this transaction. Feel free to contact your closing team at any point in the transaction.<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:12.0pt;line-height:107%;font-family:
"Segoe UI","sans-serif"'><o:p><u>Contact Information:</u></o:p></span></p>

<p class=MsoNormal><span style='font-size:12.0pt;line-height:107%;font-family:
"Segoe UI","sans-serif"'>Name:<span style='mso-tab-count:2'>             </span><o:p><cfoutput>#get_titleid.ipname#</cfoutput></o:p></span></p>

<p class=MsoNormal><span style='font-size:12.0pt;line-height:107%;font-family:
"Segoe UI","sans-serif"'>Address:<span style='mso-tab-count:1'>         </span>First
Title &amp; Escrow, Inc.<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:12.0pt;line-height:107%;font-family:
"Segoe UI","sans-serif"'>7361 Calhoun Pl., <span class=SpellE>Ste</span> 200,
Rockville, MD 20855<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:12.0pt;line-height:107%;font-family:
"Segoe UI","sans-serif"'>Email: <span style='mso-tab-count:2'>             </span><cfoutput>#get_titleid.ip_email#</cfoutput><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:12.0pt;line-height:107%;font-family:
"Segoe UI","sans-serif"'>Phone:<span style='mso-tab-count:1'>            </span><cfoutput>#get_titleid.ipphone#</cfoutput><span style='mso-tab-count:1'>  </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:12.0pt;line-height:107%;font-family:
"Segoe UI","sans-serif"'>Fax: <span style='mso-tab-count:2'>                </span><cfoutput>#get_titleid.ipfax#</cfoutput><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:12.0pt;line-height:107%;font-family:
"Segoe UI","sans-serif"'>Team email: <span style='mso-tab-count:2'>   </span>vrm@firsttitleservices.com<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:12.0pt;line-height:107%;font-family:
"Segoe UI","sans-serif"'><o:p>&nbsp;</o:p></span></p>
<!---
<p class=MsoNormal><u><span style='font-size:12.0pt;line-height:107%;
font-family:"Segoe UI","sans-serif";mso-bidi-font-weight:bold'>Deed Prep
Company<o:p></o:p></span></u></p>

<p class=MsoNormal><span style='font-size:12.0pt;line-height:107%;font-family:
"Segoe UI","sans-serif";mso-bidi-font-weight:bold'>Name for <span class=SpellE><span
class=GramE>hud</span></span> payment: Juris Doc Prep<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:12.0pt;line-height:107%;font-family:
"Segoe UI","sans-serif";mso-bidi-font-weight:bold'>Address: 801 Forest Ridge
Drive, Suite 108, Bedford, TX 76022<o:p></o:p></span></p>
--->


<p class=MsoNormal><u><span style='font-size:12.0pt;line-height:107%;
font-family:"Segoe UI","sans-serif";mso-bidi-font-weight:bold'>Attached please
find the following:<o:p></o:p></span></u></p>

<ol style='margin-top:0in' start=1 type=1>
 
 <li class=MsoNormal style='margin-bottom:0in;margin-bottom:.0001pt;line-height:
     normal;mso-list:l0 level1 lfo1'><span style='font-size:12.0pt;font-family:
     "Segoe UI","sans-serif";mso-bidi-font-weight:bold'>VRM Closing Instructions<o:p></o:p></span></li>
 <li class=MsoNormal style='margin-bottom:0in;margin-bottom:.0001pt;line-height:
     normal;mso-list:l0 level1 lfo1'><span style='font-size:12.0pt;font-family:
     "Segoe UI","sans-serif";mso-bidi-font-weight:bold'>HUD Prep Checklist (It is for your reference when completing your HUD for review)<o:p></o:p></span></li>
<li class=MsoNormal style='margin-bottom:0in;margin-bottom:.0001pt;line-height:
     normal;mso-list:l0 level1 lfo1'><span style='font-size:12.0pt;font-family:
     "Segoe UI","sans-serif";mso-bidi-font-weight:bold'>Tax worksheet (Please complete this form showing the calculation details for your tax proration’s and return it with your HUD submission)<o:p></o:p></span></li>
 <li class=MsoNormal style='margin-bottom:0in;margin-bottom:.0001pt;line-height:
     normal;mso-list:l0 level1 lfo1'><span style='font-size:12.0pt;font-family:
     "Segoe UI","sans-serif";mso-bidi-font-weight:bold'>Deed Order Form<o:p></o:p></span></li>
<li class=MsoNormal style='margin-bottom:0in;margin-bottom:.0001pt;line-height:
     normal;mso-list:l0 level1 lfo1'><span style='font-size:12.0pt;font-family:
     "Segoe UI","sans-serif";mso-bidi-font-weight:bold'>Sample HUD/Seller CD/ALTA<o:p></o:p></span></li>
<li class=MsoNormal style='margin-bottom:0in;margin-bottom:.0001pt;line-height:
     normal;mso-list:l0 level1 lfo1'><span style='font-size:12.0pt;font-family:
     "Segoe UI","sans-serif";mso-bidi-font-weight:bold'>Contract<o:p></o:p></span></li>
 
</ol>



<p class=MsoNormal><span style='font-size:12.0pt;line-height:107%;font-family:
"Segoe UI","sans-serif"'>PLEASE NOTE: We must request the deed as soon as
possible to avoid any delays with settlement – please be sure to forward your
completed <b style='mso-bidi-font-weight:normal'>Title Binder/Commitment or Attorney Opinion Letter</b> as
soon as possible.<o:p></o:p></span></p>

<p><b>Delinquent payables are not to be collected on the HUD.  This includes HOA, TAXES, WATER/SEWER, and Utilities.  Please forward all outstanding amounts, including a ledger breaking down the amounts and coverage periods to your closer.</b></p>

<p class=MsoNormal><span style='font-size:12.0pt;line-height:107%;font-family:
"Segoe UI","sans-serif"'>**NO ESCROWS allowed on hud.  Any Repairs that the seller has agree to pay must be paid outside of closing – please contact the listing agent to confirm payment is made.<o:p></o:p></span></p>

<h2>
Please <span style="color:red">DO NOT submit the HUD-1</span> unless it matches these instructions <span style="color:red">100%</span>.<br>

It WILL be rejected if not accurate and this may cause a delay in Closing.

</h2>
<p class=MsoNormal><span style='font-size:12.0pt;line-height:107%;font-family:
"Segoe UI","sans-serif"'>**The reference to "HUD" is in reference to HUD/SELLER CD/SELLER ALTA.<o:p></o:p></span></p>


</div>




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

<p class=MsoNormal><b style='mso-bidi-font-weight:normal'>Asset#: <span
style='mso-tab-count:1'>                </span><span
style='mso-spacerun:yes'>      </span><span
style='mso-spacerun:yes'>             </span><span style='mso-tab-count:11'>                                                                                                                                                                             </span></b><span
style='font-size:12.0pt'><o:p></o:p></span></p>

<p class=MsoNormal align=center style='text-align:center'><b style='mso-bidi-font-weight:
normal'><u>CLOSING INSTRUCTIONS<o:p></o:p></u></b></p>

<p class=MsoNormal><b style='mso-bidi-font-weight:normal'>PLEASE REVIEW THESE
INSTRUCTIONS CAREFULLY. <span style='mso-spacerun:yes'> </span>These
instructions are provided to assist you in closing the transaction and
anticipate the sellers and our clients’ needs.<o:p></o:p></b></p>

<p class=MsoNormal><b><u>Email the following to the contact on the Asset
Information Sheet:</u><o:p></o:p></b></p>

<ol style='margin-top:0in' start=1 type=1>
 <li class=MsoNormal style='mso-list:l10 level1 lfo8'><b>Earnest Money Receipt
     within 24 hours of receiving contract (must be held by Buyer’s Closing
     Co., not the real estate agent)<o:p></o:p></b></li>
 <li class=MsoNormal style='mso-list:l10 level1 lfo8'><b>Please submit the
     following items to order the deed: (the Deed will be sent to you&nbsp; 5-7
     business days after all of the items below are received)<o:p></o:p></b></li>
 <ol style='margin-top:0in' start=1 type=a>
  <li class=MsoNormal style='mso-list:l10 level2 lfo8'><b>Preliminary Title
      Report<o:p></o:p></b></li>
  <li class=MsoNormal style='mso-list:l10 level2 lfo8'><b>Copy of <u>recorded
      Deed</u> Vesting VA into Title<o:p></o:p></b></li>
  <li class=MsoNormal style='mso-list:l10 level2 lfo8'><b>Completed attached
      Deed Cover Sheet – <u>ALL</u> fields must be complete<o:p></o:p></b></li>
 </ol>
 <li class=MsoNormal style='mso-list:l10 level1 lfo8'><b>HUD and ALL other
     documents needing the seller’s signature (<u>ALL</u> documents must include
     complete seller signature block)<o:p></o:p></b></li>
 <ol style='margin-top:0in' start=1 type=a>
  <li class=MsoNormal style='mso-list:l10 level2 lfo8'><b>Please send HUD
      package as separate PDF package for review. (Please do not send combined
      with above preliminary docs i.e. title, deed coversheet and vesting
      deed).<span style='mso-spacerun:yes'>  </span><o:p></o:p></b></li>
  <li class=MsoNormal style='mso-list:l10 level2 lfo8'><b>We require 24 hours
      to review your HUD and send necessary revisions (Please be advised that
      this 24 hour review period applies to <u>each</u> HUD submission).<o:p></o:p></b></li>
  <li class=MsoNormal style='mso-list:l10 level2 lfo8'><b>Upon receipt of a HUD
      requiring no further revisions, we will upload it for seller approval. <o:p></o:p></b></li>
  <li class=MsoNormal style='mso-list:l10 level2 lfo8'><b>Seller requires 48
      hours to approve and return the closing documents<o:p></o:p></b></li>
 </ol>
 <li class=MsoNormal style='mso-list:l10 level1 lfo8'><b>Seller Approved HUD
     signed by Buyer (within 24 Hours after Closing) – <u>HUD CANNOT BE ALTERED</u><o:p></o:p></b></li>
 <li class=MsoNormal style='mso-list:l10 level1 lfo8'><b>Wire Confirmations
     showing Wire Amount, Fed Reference # and property address (within 24 Hours
     after Closing)<o:p></o:p></b></li>
 <li class=MsoNormal style='mso-list:l10 level1 lfo8'><b>Please include VA REO
     ID#, Property Address and, subject (i.e. HUD, Deed, question, etc.) in
     your emails subject line to allow a faster response.&nbsp;&nbsp; <o:p></o:p></b></li>
 <li class=MsoNormal style='mso-list:l10 level1 lfo8'><b>You are not permitted
     to close without Seller signed HUD and DEED. <o:p></o:p></b></li>
 <li class=MsoNormal style='mso-list:l10 level1 lfo8'><b>Final HUD Package:<o:p></o:p></b></li>
 <ol style='margin-top:0in' start=1 type=a>
  <li class=MsoNormal style='mso-list:l10 level2 lfo8'><b>Seller Approved HUD
      signed by Buyer (all figures must match seller approved HUD)<o:p></o:p></b></li>
  <li class=MsoNormal style='mso-list:l10 level2 lfo8'><b>Wire Confirmation for
      funds wired to Seller (they must be computer generated and not hand
      written)<o:p></o:p></b></li>
  <li class=MsoNormal style='mso-list:l10 level2 lfo8'><b>Email of all of the
      above within 24 hours of closing to contact listed on the Asset
      Information Sheet<o:p></o:p></b></li>
 </ol>
</ol>

<p class=MsoNormal><b>***If you cannot make any of the above timelines please
notify us immediately***<o:p></o:p></b></p>

<p class=MsoNormal><b>Seller Disbursement Instructions:<o:p></o:p></b></p>

<p class=MsoListParagraphCxSpFirst style='text-indent:-.25in;mso-list:l7 level1 lfo15'><![if !supportLists]><span
style='mso-bidi-font-family:Calibri;mso-bidi-font-weight:bold'><span
style='mso-list:Ignore'>-<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><b>Seller Proceeds to Secretary of Veterans
Affairs (Wire amount must match the Approved HUD)<o:p></o:p></b></p>

<p class=MsoListParagraphCxSpMiddle style='margin-left:1.0in;mso-add-space:
auto;text-indent:-.25in;mso-list:l7 level2 lfo15'><![if !supportLists]><span
style='font-family:"Courier New";mso-fareast-font-family:"Courier New";
mso-bidi-font-weight:bold'><span style='mso-list:Ignore'>o<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp; </span></span></span><![endif]><span
style='mso-bidi-font-weight:bold'>Please be sure to properly reference the wire
with the VA Loan # and the Property Address. Wires that are not referenced may
be rejected. Seller will not be responsible for a return wire fee due to the
wire not being correctly reference.<b><o:p></o:p></b></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-left:1.0in;mso-add-space:
auto'><b>Financial Institution:</b><span style='mso-bidi-font-weight:bold'>
Treasury of New York City<b><o:p></o:p></b></span>
<br>
<b>Financial <span class=SpellE>Instution’s</span> Address: </b><span
style='mso-bidi-font-weight:bold'>33 Liberty Street, New York, NY 10045 (212)
720-5000<b><o:p></o:p></b></span>
<br>
<b>Account Holder: </b><span style='mso-bidi-font-weight:bold'>Secretary
of Veterans Affairs<b><o:p></o:p></b></span>
<br>
<b>ABA #: </b><span style='mso-bidi-font-weight:bold'>021030004<o:p></o:p></span>
<br>
<b>Account #: </b><span style='mso-bidi-font-weight:bold'>36001200<o:p></o:p></span>
<br>
<b>Reference # (this must appear alone): </b><span style='mso-bidi-font-weight:
bold'>105 15-"VA Loan Number"<b> (ex. 105 15-999999999999)<o:p></o:p></b></span><br>
<b>Also reference VA REO ID#: <o:p></o:p></b></p>



<p class=MsoListParagraphCxSpMiddle style='text-indent:-.25in;mso-list:l7 level1 lfo15'><![if !supportLists]><span
style='mso-bidi-font-family:Calibri;mso-bidi-font-weight:bold'><span
style='mso-list:Ignore'>-<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><b>VRM Technology Fee (This is ONLY for the $200
VRM Technology Fee referenced on line 704 of HUD)<o:p></o:p></b></p>

<p class=MsoListParagraphCxSpMiddle style='margin-left:1.0in;mso-add-space:
auto;text-indent:-.25in;mso-list:l7 level2 lfo15'><![if !supportLists]><span
style='font-family:"Courier New";mso-fareast-font-family:"Courier New";
mso-bidi-font-weight:bold'><span style='mso-list:Ignore'>o<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp; </span></span></span><![endif]><span
style='mso-bidi-font-weight:bold'>Vendor Resource Management, Inc.<o:p></o:p></span>
<br>
<span style='mso-bidi-font-weight:bold'>740 Corporate Center Dr., Suite
#200, Pomona, CA 91768 (909) 623-4001<o:p></o:p></span><br>
<span style='mso-bidi-font-weight:bold'>Attn: Accounting<o:p></o:p></span><br><span
style='mso-bidi-font-weight:bold'>Ref: VA Loan Number and Property Address <o:p></o:p></span></p>
<P><b><u>Deed Prep Company</u><br>
Name for HUD payment: Juris Doc Prep<br>
Address: 801 Forest Ridge Drive, Suite 108, Bedford, TX 76022
</b></P>

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
		<td align="left" valign="top" style="padding-left:30px">

<p class=MsoNormal align=center style='text-align:center'><u><span
style='font-size:16.0pt'>HUD Prep Checklist:</span></u></p>

<p class=MsoNormal align=center style='text-align:center'><b><u><span
style='color:red'>You are not permitted to close without a Seller signed HUD
and Deed<o:p></o:p></span></u></b></p>


<p class=MsoListParagraphCxSpFirst style='margin-bottom:8.0pt;mso-add-space:
auto;text-indent:-.25in;line-height:115%;mso-list:l6 level1 lfo12'><![if !supportLists]><span
style='font-size:10.0pt;line-height:115%;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings'><span style='mso-list:Ignore'>¨<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;line-height:115%'>Tax cert/bill must be attached with
the HUD and dated within 5 days of the closing date (<span class=SpellE>prorations</span>
for taxes charged to seller must be in 500 section of the HUD)<u><o:p></o:p></u></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;text-indent:-.25in;line-height:115%;mso-list:l6 level1 lfo12'><![if !supportLists]><span
style='font-size:10.0pt;line-height:115%;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings'><span style='mso-list:Ignore'>¨<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;line-height:115%'>HOA statement showing dues are paid
current if applicable<u><o:p></o:p></u></span></p>

<p class=MsoListParagraphCxSpMiddle><b><span style='font-size:9.0pt'>*No
delinquencies/penalties or interest can show on the HUD to either party. If
there are Delinquent Taxes or HOA dues, please contact the Listing Agent to
communicate with the Asset&nbsp;Manager to have these resolved prior to closing.
If the HOA is payable by the buyer, please submit a current HOA
statement/estoppel. Buyer is not allowed to pay delinquencies or penalties on
the HUD<u><o:p></o:p></u></span></b></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;text-indent:-.25in;line-height:115%;mso-list:l6 level1 lfo12'><![if !supportLists]><span
style='font-size:10.0pt;line-height:115%;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings'><span style='mso-list:Ignore'>¨<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;line-height:115%'>HUD cannot say “Estimated” anywhere on
it and must include both the buyer’s and seller’s figures<u><o:p></o:p></u></span></p>

<p class=MsoListParagraphCxSpMiddle><u><span style='font-size:9.0pt'>Boxes A-I
must be completed:<o:p></o:p></span></u></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;text-indent:-.25in;line-height:115%;mso-list:l6 level1 lfo12'><![if !supportLists]><span
style='font-size:10.0pt;line-height:115%;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings'><span style='mso-list:Ignore'>¨<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;line-height:115%'>Box B 1-5, please check the Type of
Loan or type in “Other” if your system allows<u><o:p></o:p></u></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;text-indent:-.25in;line-height:115%;mso-list:l6 level1 lfo12'><![if !supportLists]><span
style='font-size:10.0pt;line-height:115%;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings'><span style='mso-list:Ignore'>¨<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;line-height:115%'>Boxes 6-8, please enter the
information or type in “N/A”<u><o:p></o:p></u></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;text-indent:-.25in;line-height:115%;mso-list:l6 level1 lfo12'><![if !supportLists]><span
style='font-size:10.0pt;line-height:115%;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings'><span style='mso-list:Ignore'>¨<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;line-height:115%'>Box D, Buyer name must match the VA
Addendum to Purchase and Contract of Sale or an Amendment is required. Please
provide the buyer’s current address, it cannot be the same as the property
address<u><o:p></o:p></u></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;text-indent:-.25in;line-height:115%;mso-list:l6 level1 lfo12'><![if !supportLists]><span
style='font-size:10.0pt;line-height:115%;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings'><span style='mso-list:Ignore'>¨<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;line-height:115%'>Box E, please be sure the Name and
Address of the Seller is exactly as follows:<u><o:p></o:p></u></span></p>

<p class=MsoListParagraphCxSpMiddle><b style='mso-bidi-font-weight:normal'><span
style='font-size:10.0pt;mso-bidi-font-style:italic'>Secretary of Veterans
Affairs, 810 Vermont Ave NW, Washington, DC 20420<o:p></o:p></span></b></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;text-indent:-.25in;line-height:115%;mso-list:l6 level1 lfo12'><![if !supportLists]><span
style='font-size:10.0pt;line-height:115%;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings'><span style='mso-list:Ignore'>¨<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;line-height:115%'>Box F, please enter the lender’s information
or type in “Cash” for all cash sales<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;text-indent:-.25in;line-height:115%;mso-list:l6 level1 lfo12'><![if !supportLists]><span
style='font-size:10.0pt;line-height:115%;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings'><span style='mso-list:Ignore'>¨<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;line-height:115%'>Box G, Property Address must match the
VA Addendum to Purchase and Contract of Sale exactly or an Amendment is
required (Please make sure the zip code is included)<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;text-indent:-.25in;line-height:115%;mso-list:l6 level1 lfo12'><![if !supportLists]><span
style='font-size:10.0pt;line-height:115%;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings'><span style='mso-list:Ignore'>¨<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;line-height:115%'>Box H, Settlement Agent’s address and
the Place of Settlement must match<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;text-indent:-.25in;line-height:115%;mso-list:l6 level1 lfo12'><![if !supportLists]><span
style='font-size:10.0pt;line-height:115%;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings'><span style='mso-list:Ignore'>¨<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;line-height:115%'>Box I, must be within contract or an
Amendment for extension is required (Closing can occur on or before this date)<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;text-indent:-.25in;line-height:115%;mso-list:l6 level1 lfo12'><![if !supportLists]><span
style='font-size:10.0pt;line-height:115%;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings'><span style='mso-list:Ignore'>¨<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;line-height:115%'>Sales Price must match the VA Addendum
to Purchase and Contract of Sale on lines 101 and 401 or Amendment is required.<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;text-indent:-.25in;line-height:115%;mso-list:l6 level1 lfo12'><![if !supportLists]><span
style='font-size:10.0pt;line-height:115%;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings'><span style='mso-list:Ignore'>¨<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;line-height:115%'>Earnest Money must appear on Line 201only.
Any additional deposits must be entered on Line 206.(cannot be deducted from
agent’s commission)<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;text-indent:-.25in;line-height:115%;mso-list:l6 level1 lfo12'><![if !supportLists]><span
style='font-size:10.0pt;line-height:115%;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings'><span style='mso-list:Ignore'>¨<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;line-height:115%'>Please be sure that the proration
dates match the Settlement Date <o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;text-indent:-.25in;line-height:115%;mso-list:l6 level1 lfo12'><![if !supportLists]><span
style='font-size:10.0pt;line-height:115%;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings'><span style='mso-list:Ignore'>¨<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;line-height:115%'>Please reference the coverage dates
for <span class=SpellE>prorations</span> as mm/<span class=SpellE>dd</span>/<span
class=SpellE>yy</span> to mm/<span class=SpellE>dd</span>/<span class=SpellE>yy</span><o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;text-indent:-.25in;line-height:115%;mso-list:l6 level1 lfo12'><![if !supportLists]><span
style='font-size:10.0pt;line-height:115%;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings'><span style='mso-list:Ignore'>¨<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;line-height:115%'>Seller Concession: must appear as one
amount on Lines 209/509 and the verbiage must read “Seller Paid Closing Costs”
and this figure may not exceed Line 103. VA/FHA non allowable fees are to be
included as part of the Seller Paid Closing Costs.<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle><u><span style='font-size:9.0pt'>700
section must show as follows (6% of the Sales Price - $3,000.00 is the minimum
commission amount) (If the same office represents both sides, commissions still
need to be split on the HUD):<o:p></o:p></span></u></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;text-indent:-.25in;line-height:115%;mso-list:l9 level1 lfo13'><![if !supportLists]><span
style='font-size:9.0pt;line-height:115%;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings'><span style='mso-list:Ignore'>¨<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;line-height:115%'>Line 700, please list total amount of
commissions being paid (including $200 Technology Fee to VRM)<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;text-indent:-.25in;line-height:115%;mso-list:l9 level1 lfo13'><![if !supportLists]><span
style='font-size:9.0pt;line-height:115%;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings'><span style='mso-list:Ignore'>¨<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;line-height:115%'>Line 701, please enter the Listing
Agent’s commission (less $200.00 for the Technology Fee to VRM)(do not add any
additional Verbiage or notes to this line)<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;text-indent:-.25in;line-height:115%;mso-list:l9 level1 lfo13'><![if !supportLists]><span
style='font-size:9.0pt;line-height:115%;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings'><span style='mso-list:Ignore'>¨<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;line-height:115%'>Line 702, please enter the Selling
Agent’s commission (do not add any additional Verbiage or notes to this line)<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;text-indent:-.25in;line-height:115%;mso-list:l9 level1 lfo13'><![if !supportLists]><span
style='font-size:9.0pt;line-height:115%;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings'><span style='mso-list:Ignore'>¨<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;line-height:115%'>Line 703, please enter the Commission
Paid at Settlement (Total Commission amount less $200.00 for the Technology Fee
to VRM) )(do not add any additional Verbiage or notes to this line)<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;text-indent:-.25in;line-height:115%;mso-list:l9 level1 lfo13'><![if !supportLists]><span
style='font-size:9.0pt;line-height:115%;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings'><span style='mso-list:Ignore'>¨<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;line-height:115%'>Line 704, please enter “Technology Fee
to <b style='mso-bidi-font-weight:normal'>VRM</b>” of $200.00 in the seller’s
charge column (not payable to VRMS or broker)<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;text-indent:-.25in;line-height:115%;mso-list:l9 level1 lfo13'><![if !supportLists]><span
style='font-size:9.0pt;line-height:115%;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings'><span style='mso-list:Ignore'>¨<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;line-height:115%'>Please enter “Deed Prep Fee ” of $150 in
the seller’s charge column in the 1300 section (Co. listed on Asset Info Sheet)<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;text-indent:-.25in;line-height:115%;mso-list:l9 level1 lfo13'><![if !supportLists]><span
style='font-size:9.0pt;line-height:115%;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings'><span style='mso-list:Ignore'>¨<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;line-height:115%'>Please enter “Closing Coordination
Fee” of $450.00 in the seller’s charge column in the 1300 section (Co. listed
on Asset Info Sheet)<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;text-indent:-.25in;line-height:115%;mso-list:l9 level1 lfo13'><![if !supportLists]><span
style='font-size:9.0pt;line-height:115%;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings'><span style='mso-list:Ignore'>¨<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;line-height:115%'>Cash back to the buyer cannot exceed
the Earnest Money Deposit<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;text-indent:-.25in;line-height:115%;mso-list:l9 level1 lfo13'><![if !supportLists]><span
style='font-size:9.0pt;line-height:115%;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings'><span style='mso-list:Ignore'>¨<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;line-height:115%'>Seller will not pay the following on
the HUD:<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle><span style='font-size:9.0pt'>Wire Fees,
Courier Fees, Escrow, Title, Excise/Transfer Taxes, Utilities (Water and
Sewer), Repairs, HOA dues, Pest, or Home Warranties. Buyer is to pay Tax
Stamp/Transfer Tax if any. VA should be exempt from this fee so check with your
county <o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;text-indent:-.25in;line-height:115%;mso-list:l9 level1 lfo13'><![if !supportLists]><span
style='font-size:9.0pt;line-height:115%;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings'><span style='mso-list:Ignore'>¨<span
style='font:7.0pt "Times New Roman"'>&nbsp; </span></span></span><![endif]><span
style='font-size:9.0pt;line-height:115%'>Please be sure to add the Seller’s
signature block on ALL documents requiring the seller’s signature (including
lender documents) exactly as follows:<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;line-height:115%'><span style='font-size:9.0pt;line-height:115%'>THE
SECRETARY OF VETERANS AFFAIRS, <o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;line-height:115%'><span style='font-size:9.0pt;line-height:115%'>An
officer of the United States of America <o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;line-height:115%'><span style='font-size:9.0pt;line-height:115%'>By the
Secretary’s duly authorized property <o:p></o:p></span></p>

<p class=MsoListParagraphCxSpMiddle style='margin-bottom:8.0pt;mso-add-space:
auto;line-height:115%'><span style='font-size:9.0pt;line-height:115%'>Management
contractor, Vendor Resource Management<o:p></o:p></span></p>

<p class=MsoListParagraphCxSpLast style='margin-bottom:8.0pt;mso-add-space:
auto;line-height:115%'><span class=GramE><span style='font-size:9.0pt;
line-height:115%'>pursuant</span></span><span style='font-size:9.0pt;
line-height:115%'> to a delegation of authority found at 38 C.F.R. 36.4345(f)<b>&nbsp;</b><o:p></o:p></span></p>

<p class=MsoNoSpacing style='margin-left:.75in;text-indent:-.25in;mso-list:
l1 level1 lfo14'><![if !supportLists]><span style='font-size:9.0pt;font-family:
Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:Symbol;mso-bidi-font-weight:
bold'><span style='mso-list:Ignore'>·<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><b><span style='font-size:9.0pt'>Any
discrepancies from the contract must be clarified with an Addendum. <o:p></o:p></span></b></p>

<p class=MsoNoSpacing style='margin-left:.75in;text-indent:-.25in;mso-list:
l1 level1 lfo14'><![if !supportLists]><span style='font-size:9.0pt;font-family:
Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:Symbol;mso-bidi-font-weight:
bold'><span style='mso-list:Ignore'>·<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><b><span style='font-size:9.0pt'>Buyer and
Seller must sign the combined HUD that has been approved by the seller.
Signatures in counterpart are acceptable.<o:p></o:p></span></b></p>

<p class=MsoNoSpacing style='margin-left:.75in;text-indent:-.25in;mso-list:
l1 level1 lfo14'><![if !supportLists]><span style='font-size:9.0pt;font-family:
Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:Symbol;mso-bidi-font-weight:
bold'><span style='mso-list:Ignore'>·<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><b><span style='font-size:9.0pt'>Once the HUD is
approved by the seller, the figures cannot be changed.<o:p></o:p></span></b></p>

<p class=MsoListParagraph style='margin-left:.75in;mso-add-space:auto'><u>You
are not permitted to close without a Seller signed HUD and Deed<o:p></o:p></u></p>
<!---
<p class=MsoNormal><b><span style='font-size:9.0pt'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal><span style='font-size:10.0pt;mso-bidi-font-weight:bold'>Continued
from <span class=SpellE><span class=GramE>hud</span></span> prep checklist<o:p></o:p></span></p>

<p class=MsoNormal><b><span style='font-size:9.0pt'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal><b>Agents’ Commissions are to be listed as follows:<o:p></o:p></b></p>

<p class=MsoNormal><b><o:p>&nbsp;</o:p></b></p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l3 level1 lfo16'><![if !supportLists]><b><span
style='mso-bidi-font-family:Calibri'><span style='mso-list:Ignore'>A.<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span></b><![endif]><b>Line
700 must show the total 6% commission or the minimum commission of 3000.00<o:p></o:p></b></p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l3 level1 lfo16'><![if !supportLists]><b><span
style='mso-bidi-font-family:Calibri'><span style='mso-list:Ignore'>B.<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span></b><![endif]><b>Line
701 must be Listing Agent 3% less the $200.00 tech fee<o:p></o:p></b></p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l3 level1 lfo16'><![if !supportLists]><b><span
style='mso-bidi-font-family:Calibri'><span style='mso-list:Ignore'>C.<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span></b><![endif]><b>Line
702 must be Selling Agent 3%<o:p></o:p></b></p>

<p class=MsoNormal style='margin-left:.75in;text-indent:-.25in;mso-list:l3 level1 lfo16'><![if !supportLists]><b><span
style='mso-bidi-font-family:Calibri'><span style='mso-list:Ignore'>D.<span
style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span></b><![endif]><b>Line
704 must be Technology fee of $200.00 to VRM – see payment address on closing
instructions.<o:p></o:p></b></p>

<p class=MsoNormal><b><span style='font-size:9.0pt'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='margin-left:.25in;'><b><span style='font-size:12.0pt'>
Important fees:<br>
Please enter "Deed Prep Fee" of $200 in the seller’s charge column in the 1300 section (Co. listed on Asset Info Sheet)<br>
Please enter "Closing Coordination Fee" of $450.00 in the seller’s charge column in the 1300 section (Co. listed on Asset Info Sheet)<br>
</span></b></p>
<p class=MsoNormal><b><span style='font-size:9.0pt'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal><b><span style='font-size:14.0pt'>Delinquent payables are
not to be collected on the HUD.<span style='mso-spacerun:yes'>  </span>This
includes HOA, TAXES, WATER/SEWER, and Utilities.<span
style='mso-spacerun:yes'>  </span>Please forward all outstanding amounts,
including a ledger breaking down the amounts and coverage periods to <a
href="mailto:vrm@firsttitleservices.com">vrm@firsttitleservices.com</a><o:p></o:p></span></b></p>

<p class=MsoNormal><b><span style='font-size:12.0pt'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal><span style='font-size:12.0pt'>**NO ESCROWS allowed on <span
class=SpellE><span class=GramE>hud</span></span>.<span
style='mso-spacerun:yes'>  </span>Any Repairs that the seller has agree to pay
must be paid outside of closing – please contact the listing agent to confirm payment
is made.<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:12.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:12.0pt'>**VA SIGNATURE BLOCK listed
on the HUD PREP CHECKLIST must be on all documents that the seller is to sign
including the HUD.<span style='mso-spacerun:yes'>  </span>NO EXCEPTIONS.<o:p></o:p></span></p>
--->
</IE:DEVICERECT>
<br>
<hr>
<br>
<p style="page-break-after:always;">&nbsp;</p>



<IE:DEVICERECT ID="page2" CLASS="" MEDIA="print">
<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td align="left" valign="top">

<img src="/admin_area/images/taxworksheet2.jpg" width="850">

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

<img src="/admin_area/images/deedorderform.jpg" width="850">

</td>
	</tr>
</table>
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

<img src="/admin_area/images/deedprepheader.jpg">

<span style='font-size:11.0pt;line-height:115%;font-family:"Calibri","sans-serif";
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:Calibri;mso-fareast-theme-font:
minor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-font-family:"Times New Roman";
mso-bidi-theme-font:minor-bidi;mso-ansi-language:EN-US;mso-fareast-language:
EN-US;mso-bidi-language:AR-SA'><br clear=all style='page-break-before:auto;
mso-break-type:section-break'>
</span>

<div class=WordSection2>

<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
 style='margin-left:5.6pt;border-collapse:collapse;mso-table-layout-alt:fixed;
 mso-yfti-tbllook:480;mso-padding-alt:0in 0in 0in 0in'>
 <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;height:26.45pt;mso-height-rule:
  exactly'>
  <td width=85 valign=top style='width:64.0pt;padding:0in 0in 0in 0in;
  height:26.45pt;mso-height-rule:exactly'>
  <p class=MsoNormal style='margin-top:.05pt;margin-right:0in;margin-bottom:
  0in;margin-left:0in;margin-bottom:.0001pt;line-height:10.0pt;mso-line-height-rule:
  exactly'><span style='font-size:10.0pt'><o:p>&nbsp;</o:p></span></p>
  <p class=MsoNormal style='margin-top:0in;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:2.0pt;margin-bottom:.0001pt;line-height:normal'><b><span
  style='font-family:"Times New Roman","serif";mso-fareast-font-family:"Times New Roman"'>Requestor:</span></b><span
  style='font-family:"Times New Roman","serif";mso-fareast-font-family:"Times New Roman"'><o:p></o:p></span></p>
  </td>
  <td width=381 valign=top style='width:285.8pt;padding:0in 0in 0in 0in;
  height:26.45pt;mso-height-rule:exactly'>
  <p class=MsoNormal style='margin-top:0in;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:3.75pt;margin-bottom:.0001pt;line-height:normal;tab-stops:
  268.0pt'><b><u style='text-underline:black'><span style='font-family:"Times New Roman","serif";
  mso-fareast-font-family:"Times New Roman";mso-font-width:99%'><o:p><span
   style='text-decoration:none'>&nbsp;</span></o:p></span></u></b></p>
  <p class=MsoNormal style='margin-top:0in;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:3.75pt;margin-bottom:.0001pt;line-height:normal;tab-stops:
  268.0pt'><b><u style='text-underline:black'><span style='font-family:"Times New Roman","serif";
  mso-fareast-font-family:"Times New Roman"'><span style='mso-tab-count:1'>                                                                                        </span></span></u></b><span
  style='font-family:"Times New Roman","serif";mso-fareast-font-family:"Times New Roman"'><o:p></o:p></span></p>
  </td>
  <td width=83 valign=top style='width:62.05pt;padding:0in 0in 0in 0in;
  height:26.45pt;mso-height-rule:exactly'>
  <p class=MsoNormal style='margin-top:0in;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:17.05pt;margin-bottom:.0001pt;line-height:normal'><b><span
  style='font-family:"Times New Roman","serif";mso-fareast-font-family:"Times New Roman";
  letter-spacing:.05pt'><o:p>&nbsp;</o:p></span></b></p>
  <p class=MsoNormal style='margin-top:0in;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:17.05pt;margin-bottom:.0001pt;line-height:normal'><b><span
  style='font-family:"Times New Roman","serif";mso-fareast-font-family:"Times New Roman";
  letter-spacing:.05pt'>Phon</span></b><b><span style='font-family:"Times New Roman","serif";
  mso-fareast-font-family:"Times New Roman"'>e<span style='letter-spacing:-.25pt'>
  </span><span style='letter-spacing:.05pt'>#:</span></span></b><span
  style='font-family:"Times New Roman","serif";mso-fareast-font-family:"Times New Roman"'><o:p></o:p></span></p>
  </td>
  <td width=179 valign=top style='width:134.5pt;padding:0in 0in 0in 0in;
  height:26.45pt;mso-height-rule:exactly'>
  <p class=MsoNormal style='margin-top:0in;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:3.75pt;margin-bottom:.0001pt;line-height:normal;tab-stops:
  168.0pt'><b><u style='text-underline:black'><span style='font-family:"Times New Roman","serif";
  mso-fareast-font-family:"Times New Roman";mso-font-width:99%'><o:p><span
   style='text-decoration:none'>&nbsp;</span></o:p></span></u></b></p>
  <p class=MsoNormal style='margin-top:2.55pt;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:3.65pt;margin-bottom:.0001pt;line-height:normal;tab-stops:
  103.0pt'><b><u style='text-underline:black'><span style='font-family:"Times New Roman","serif";
  mso-fareast-font-family:"Times New Roman"'><span style='mso-tab-count:1'>                                 </span></span></u></b><span
  style='font-family:"Times New Roman","serif";mso-fareast-font-family:"Times New Roman"'><o:p></o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:1;height:18.95pt;mso-height-rule:exactly'>
  <td width=85 valign=top style='width:64.0pt;padding:0in 0in 0in 0in;
  height:18.95pt;mso-height-rule:exactly'>
  <p class=MsoNormal style='margin-top:2.55pt;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:2.0pt;margin-bottom:.0001pt;line-height:normal'><b><span
  style='font-family:"Times New Roman","serif";mso-fareast-font-family:"Times New Roman"'>Firm<span
  style='letter-spacing:-.25pt'> </span>N<span style='letter-spacing:.1pt'>a</span>me:</span></b><span
  style='font-family:"Times New Roman","serif";mso-fareast-font-family:"Times New Roman"'><o:p></o:p></span></p>
  </td>
  <td width=381 valign=top style='width:285.8pt;padding:0in 0in 0in 0in;
  height:18.95pt;mso-height-rule:exactly'>
  <p class=MsoNormal style='margin-top:2.55pt;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:3.75pt;margin-bottom:.0001pt;line-height:normal;tab-stops:
  268.0pt'><b><u style='text-underline:black'><span style='font-family:"Times New Roman","serif";
  mso-fareast-font-family:"Times New Roman"'><span style='mso-tab-count:1'>                                                                                        </span></span></u></b><span
  style='font-family:"Times New Roman","serif";mso-fareast-font-family:"Times New Roman"'><o:p></o:p></span></p>
  </td>
  <td width=83 valign=top style='width:62.05pt;padding:0in 0in 0in 0in;
  height:18.95pt;mso-height-rule:exactly'>
  <p class=MsoNormal style='margin-top:2.55pt;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:17.05pt;margin-bottom:.0001pt;line-height:normal'><b><span
  style='font-family:"Times New Roman","serif";mso-fareast-font-family:"Times New Roman";
  letter-spacing:.05pt'>Fa</span></b><b><span style='font-family:"Times New Roman","serif";
  mso-fareast-font-family:"Times New Roman"'>x<span style='letter-spacing:-.15pt'>
  </span><span style='letter-spacing:.05pt'>#:</span></span></b><span
  style='font-family:"Times New Roman","serif";mso-fareast-font-family:"Times New Roman"'><o:p></o:p></span></p>
  </td>
  <td width=179 valign=top style='width:134.5pt;padding:0in 0in 0in 0in;
  height:18.95pt;mso-height-rule:exactly'>
  <p class=MsoNormal style='margin-top:2.55pt;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:3.65pt;margin-bottom:.0001pt;line-height:normal;tab-stops:
  103.0pt'><b><u style='text-underline:black'><span style='font-family:"Times New Roman","serif";
  mso-fareast-font-family:"Times New Roman"'><span style='mso-tab-count:1'>                                 </span></span></u></b><span
  style='font-family:"Times New Roman","serif";mso-fareast-font-family:"Times New Roman"'><o:p></o:p></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:2;mso-yfti-lastrow:yes;height:33.55pt;mso-height-rule:
  exactly'>
  <td width=85 valign=top style='width:64.0pt;padding:0in 0in 0in 0in;
  height:33.55pt;mso-height-rule:exactly'>
  <p class=MsoNormal style='margin-top:2.55pt;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:2.0pt;margin-bottom:.0001pt;line-height:normal'><b><span
  style='font-family:"Times New Roman","serif";mso-fareast-font-family:"Times New Roman"'>Property
  Address</span></b><span style='font-family:"Times New Roman","serif";
  mso-fareast-font-family:"Times New Roman"'><o:p></o:p></span></p>
  </td>
  <td width=381 valign=top style='width:285.8pt;padding:0in 0in 0in 0in;
  height:33.55pt;mso-height-rule:exactly'>
  <p class=MsoNormal style='margin-top:2.55pt;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:3.75pt;margin-bottom:.0001pt;line-height:normal;tab-stops:
  268.0pt'><b><u style='text-underline:black'><span style='font-family:"Times New Roman","serif";
  mso-fareast-font-family:"Times New Roman"'><span style='mso-tab-count:1'>                                                                                        </span></span></u></b><span
  style='font-family:"Times New Roman","serif";mso-fareast-font-family:"Times New Roman"'><o:p></o:p></span></p>
  </td>
  <td width=83 valign=top style='width:62.05pt;padding:0in 0in 0in 0in;
  height:33.55pt;mso-height-rule:exactly'>
  <p class=MsoNormal style='margin-top:2.55pt;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:17.05pt;margin-bottom:.0001pt;line-height:normal'><b><span
  style='font-family:"Times New Roman","serif";mso-fareast-font-family:"Times New Roman"'>E-Mail:</span></b><span
  style='font-family:"Times New Roman","serif";mso-fareast-font-family:"Times New Roman"'><o:p></o:p></span></p>
  </td>
  <td width=179 valign=top style='width:134.5pt;padding:0in 0in 0in 0in;
  height:33.55pt;mso-height-rule:exactly'>
  <p class=MsoNormal style='margin-top:2.55pt;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:3.65pt;margin-bottom:.0001pt;line-height:normal;tab-stops:
  103.0pt'><b><u style='text-underline:black'><span style='font-family:"Times New Roman","serif";
  mso-fareast-font-family:"Times New Roman"'><span style='mso-tab-count:1'>                                 </span></span></u></b><span
  style='font-family:"Times New Roman","serif";mso-fareast-font-family:"Times New Roman"'><o:p></o:p></span></p>
  </td>
 </tr>
</table>

<p class=MsoNormal style='margin-top:1.7pt;margin-right:40.3pt;margin-bottom:
0in;margin-left:9.0pt;margin-bottom:.0001pt;line-height:12.4pt;mso-line-height-rule:
exactly'><!--[if gte vml 1]><v:line id="Straight_x0020_Connector_x0020_7"
 o:spid="_x0000_s1069" style='position:absolute;left:0;text-align:left;
 z-index:251677184;visibility:visible;mso-wrap-style:square;
 mso-width-percent:0;mso-height-percent:0;mso-wrap-distance-left:9pt;
 mso-wrap-distance-top:0;mso-wrap-distance-right:9pt;
 mso-wrap-distance-bottom:0;mso-position-horizontal:absolute;
 mso-position-horizontal-relative:text;mso-position-vertical:absolute;
 mso-position-vertical-relative:text;mso-width-percent:0;mso-height-percent:0;
 mso-width-relative:margin;mso-height-relative:margin' from="220.05pt,11.8pt"
 to="293.3pt,11.8pt" o:gfxdata="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
" strokecolor="black [3213]"/><![endif]--><!--[if gte vml 1]><v:line
 id="Straight_x0020_Connector_x0020_6" o:spid="_x0000_s1068" style='position:absolute;
 left:0;text-align:left;z-index:251675136;visibility:visible;mso-wrap-style:square;
 mso-width-percent:0;mso-height-percent:0;mso-wrap-distance-left:9pt;
 mso-wrap-distance-top:0;mso-wrap-distance-right:9pt;
 mso-wrap-distance-bottom:0;mso-position-horizontal:absolute;
 mso-position-horizontal-relative:text;mso-position-vertical:absolute;
 mso-position-vertical-relative:text;mso-width-percent:0;mso-height-percent:0;
 mso-width-relative:margin;mso-height-relative:margin' from="49.05pt,11.7pt"
 to="122.3pt,11.7pt" o:gfxdata="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
" strokecolor="black [3213]"/><![endif]--><b
style='mso-bidi-font-weight:normal'><span style='font-family:"Times New Roman","serif";
mso-fareast-font-family:"Times New Roman"'>Asset #</span></b><span
style='font-family:"Times New Roman","serif";mso-fareast-font-family:"Times New Roman"'>:  <cfoutput>#get_titleid.reo_number#</cfoutput><span
style='mso-tab-count:1'>        </span><b style='mso-bidi-font-weight:normal'><span
style='mso-tab-count:1'>            </span><span style='mso-tab-count:2'>                        </span>County:</b> <cfoutput>#get_titleid.pcounty#</cfoutput><span style='mso-tab-count:
1'>            </span><o:p></o:p></span>
<br><br>
<b
style='mso-bidi-font-weight:normal'><span style='font-family:"Times New Roman","serif";
mso-fareast-font-family:"Times New Roman"'>Owner Occupied</span></b><span
style='font-family:"Times New Roman","serif";mso-fareast-font-family:"Times New Roman"'>:  <span
style='mso-tab-count:1'>        </span><b style='mso-bidi-font-weight:normal'><span
style='mso-tab-count:1'>            </span><span style='mso-tab-count:2'>                  </span>Investor Purchase:</b> <span style='mso-tab-count:
1'>            </span><o:p></o:p></span></p>
<br><br>
<img src="/admin_area/images/deedform2.jpg">

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


</IE:DEVICERECT>
</cfform>


</body>
</html>
