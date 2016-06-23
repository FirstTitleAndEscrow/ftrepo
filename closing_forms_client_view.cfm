<CFQUERY datasource="#request.dsn#" NAME="get_titleid">
			SELECT *
			FROM title
			WHERE Title_ID = #rec_id#
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_Title">

			SELECT *
			FROM Title
			WHERE Title_ID = #rec_ID#

		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_hud">

			SELECT *
			FROM HUD_form_title_pg1
			WHERE Title_ID = #rec_ID#

		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_hud1">

			SELECT *
			FROM Doc_Title_Insurance_Title
			WHERE Title_ID = #rec_ID#

		</CFQUERY>

	<CFQUERY datasource="#request.dsn#" NAME="get_titleid">
			SELECT *
			FROM title
			WHERE Title_ID = #rec_id#
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_billing_states">
		SELECT *
		FROM  Company_Billing_states
		WHERE company_id = #get_titleid.comp_id# AND a_states = '#get_titleid.pstate#'

</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_agency">
		SELECT title_ft_agency_name
		FROM  company_agency_assoc
		WHERE billing_id = '#get_billing_states.billing_id#'

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
 <b>Please use the print button below to print this page (automatic setting included)</b>

 <p><input disabled type="button" value="Print the page"
 onclick="factory.printing.Print(true)">
 <hr size="1" color="dimgray">
</div>

<IE:DEVICERECT ID="page1" CLASS="masterstyle" MEDIA="print">
<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
		<p align="center"><strong><u>ATTORNEY REPRESENTATION NOTICE</u></strong></p>
<p>The Borrower(s) acknowledge(s) that <cfoutput>#session.site.long_name#</cfoutput>, has acted only as a representative of the Lender.  It has not assisted or rendered legal advice to the Borrower(s) with respect to the Loan or the Property securing it to the documents executed in connection with it.  Borrower(s) may retain personal legal counsel for advice in this transaction.</p>

<p>DISCLAIMER OF REPRESENTATION OR WARRANTY.  Borrower(s) understand(s) that has not conducted a title search on the Property, and makes no representation or warranty about condition of the Property or any other matters that might be revealed from am examination by Borrower(s), of a survey or the Property itself.  The Borrower(s) is/are cautioned to make sure the Deed to Borrower(s) conveys what the Borrower(s) has/have contracted to purchase (if applicable).</p>

<p>RESPONSIBILITY FOR PAYMENT OF FEES.  As part of the obligation of the Borrower(s) to pay expenses of the Lender in connection with the preparation of the legal documentation, the Borrower(s) agree(s) to pay, directly to <cfoutput>#session.site.long_name#</cfoutput>, at Loan closing, the amount indicated on the Settlement Statement (HUD-1).</p>

<p>BASIS FOR FEES.  The Borrower(s) acknowledge that of the fee collected for the closing on line 1101 of the HUD Settlement Statement, a portion of it may be shared with an attorney who may have attended your settlement (that was licensed to practice law in the state in which your property is located).   The document preparation fee charged by <cfoutput>#session.site.long_name#</cfoutput>, is based a per transaction charge rather than an hourly fee.  This fee is intended to provide fair compensation for the above-described services taking into consideration the time and labor required, the complexities of the questions involved, and the skill required to perform said services.  Other considerations include the expertise of <cfoutput>#session.site.long_name#</cfoutput>, in the complexities of the real estate practice, the necessary overhead associated with the rendering of the said services and the assumption of risk by <cfoutput>#session.site.long_name#</cfoutput>, in the rendering of said services.  There has been no charge made for any disclosures required by the Real Estate Settlement and Procedures Act and/or Truth-In-Lending Act.</p>

<p>Each Borrower and Seller (if applicable) hereby acknowledges receiving and reading a copy of the Notice, and by her/her/its signature affirms his/her/its acknowledgment of the accuracy of the above statements.</p>

<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr>
		<td>_________________________________</td>
		<td width="50">&nbsp;</td>
		<td>____________________________________</td>
	</tr>
	<tr>
		<td><cfoutput>#read_title.bfirstname1#&nbsp;#read_title.blastname1#</cfoutput></td>
		<td width="50">&nbsp;</td>
		<td><cfoutput>#read_title.sfirstname1#&nbsp;#read_title.slastname1#</cfoutput></td>
	</tr>
	<tr><td colspan="3"><br>&nbsp;<br></td></tr>
	<tr>
		<td>_________________________________</td>
		<td width="50">&nbsp;</td>
		<td>____________________________________</td>
	</tr>
	<tr>
		<td><cfoutput>#read_title.bfirstname2#&nbsp;#read_title.blastname2#</cfoutput></td>
		<td width="50">&nbsp;</td>
		<td><cfoutput>#read_title.sfirstname2#&nbsp;#read_title.slastname2#</cfoutput></td>
	</tr>
	<tr><td colspan="3"><p>&nbsp;</p></td></tr>
<tr><td colspan="3">
<p>ACKNOWLEDGED, SWORN and SUBSCRIBED to before me this _______  day of ______________,
  2003.</p></td></tr>
<tr><td colspan="3"><p>&nbsp;</p></td></tr>
<tr><td colspan="3">&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
		<td width="50">&nbsp;</td>
		<td>____________________________________</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td width="50">&nbsp;</td>
		<td>Notary Public</td>
	</tr>
<tr><td colspan="3">&nbsp;</td></tr>
<tr><td colspan="3">&nbsp;</td></tr>
<tr><td colspan="3">My commission expires: ____________</td></tr>
</table>


		</td>
	</tr>
</table>
<!--- end of page 1 - attorney presentation notice ---->
</IE:DEVICERECT>

<IE:DEVICERECT ID="page2" CLASS="masterstyle" MEDIA="print">


<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
		<p align="center"><strong><u>CORRECTION AGREEMENT - LIMITED POWER OF ATTORNEY</u></strong></p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The undersigned Borrower(s), for and in consideration of Zero Dollars, agree that if requested by Papermaster & Weltmann, P.C., <cfoutput>#session.site.long_name#</cfoutput>, to cooperate, adjust and correct all TYPOGRAPHICAL OR CLERICAL ERRORS discovered in any or all of the closing documentation executed by the undersigned at settlement.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The undersigned appoint Papermaster & Weltmann, P.C., <cfoutput>#session.site.long_name#</cfoutput>, and/or its designee as their attorney-in fact to correct such errors, place our initials on documents where changes are made, and/or sign our names to acknowledge any modification agreement or other document of form correcting such errors.  In the event this procedure is utilized, the party(ies) involved shall be notified and receive a corrected copy of the changes document(s) from Papermaster & Weltmann, P.C., <cfoutput>#session.site.long_name#</cfoutput></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This Power of Attorney is coupled with an interest and shall be irrevokable until the loan is satisfied and shall survive the disability of the undersigned.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AS WITNESS our execution hereof, this _____day  of  ____________________, 2003.</p>


<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr><td colspan="3">&nbsp;</td></tr>
	<tr>
		<td>_________________________________</td>
		<td width="50">&nbsp;</td>
		<td>____________________________________</td>
	</tr>
	<tr><td colspan="3"><br>&nbsp;<br></td></tr>
	<tr>
		<td>_________________________________</td>
		<td width="50">&nbsp;</td>
		<td>____________________________________</td>
	</tr>
<tr><td colspan="3">&nbsp;</td></tr>
<tr><td colspan="3">&nbsp;</td></tr>
	<tr>
		<td>STATE OF</td>
		<td width="50">&nbsp;</td>
		<td>COUNTY, to wit:</td>
	</tr>
<tr><td colspan="3"><p>&nbsp;</p></td></tr>
<tr><td colspan="3">
<p>I HEREBY CERTIFY, that on this _____ day of ________________________ , 2002,
  before me, an officer duly authorized in the state and county aforesaid to
  take acknowledgments, personally appeared and , known to me or has/have proven
  to be the person(s) described in and who executed the foregoing instrument
  and acknowledged that he/she/they executed the same for the purposes therein
  expressed.</p></td></tr>


<tr><td colspan="3"><p>&nbsp;</p></td></tr>
<tr><td colspan="3">WITNESS MY HAND AND OFFICIAL SEAL this _____ day of __________________
    , 2003.</td></tr>
<tr><td colspan="3"><p>&nbsp;</p></td></tr>
	<tr>
		<td>________________________________________</td>
		<td width="50">&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Notary Public</td>
		<td width="50">&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
<tr><td colspan="3">&nbsp;</td></tr>
<tr><td colspan="3">&nbsp;</td></tr>
<tr><td colspan="3">My Commission Expires:____________________</td></tr>
</table>
</td>
	</tr>
</table>
<!--- end of page 2 ---->
</IE:DEVICERECT>

<IE:DEVICERECT ID="page3" CLASS="masterstyle" MEDIA="print">

<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
		<p align="center"><strong><u>FINAL DISBURSEMENT<br>and<br>RECONCILIATION AGREEMENT</u></strong></p>
<p>Borrower:</p>
<p>The borrower(s) herein agree that this loan and its final disbursement are expressly contingent on Papermaster & Weltmann, P.C./<cfoutput>#session.site.long_name#</cfoutput>, receiving an updated title report which reflects no liens or encumbrances which have occurred within six (6) months of the date of settlement.  I/we fully understand that if the title report reveals any such lien, judgment, or encumbrance which would be subordinate and this loan has not already funded, this Deed of Trust/Mortgage would be declared null and void and final disbursement of this loan and any proceeds thereof may not occur.</p>

<p>This loan is to be a first trust mortgage  (  )
<br>This loan is to be a second trust mortgage  (  )
</p>

<p>Whereas, the undersigned, jointly and severally, promises to pay to the order of Papermaster & Weltmann, P.C./<cfoutput>#session.site.long_name#</cfoutput>, (Its assignees and successors in interest) the principal sum equal to the total amount of any Shortages on Mortgages and/or Judgment payoffs.  The Borrower hereby understands that this debt is their sole responsibility.</p>

<p>Real Estate tax information is provided to Papermaster & Weltmann, P.C./<cfoutput>#session.site.long_name#</cfoutput>, from the Tax Assessment Office.  Papermaster & Weltmann, P.C./<cfoutput>#session.site.long_name#</cfoutput>, relies upon this information.  If, in the event this information is not true and correct the borrower will be held responsible to pay any and all taxes due.</p>

<p>Stopped payments on checks and/or checks being returned for insufficient funds, and/or reasons of similar nature.  The terms of the Agreement shall be on demand.</p>

<p>The undersigned severally waives presentment, protest and demand, notice of protest, demand, dishonor and nonpayment of the Agreement and agrees to pay all costs of collection, including the aforesaid reasonable attorneys fees and to perform and comply with each of the covenants, provisions and agreements of the undersigned contained in every Instrument evidencing or securing Indebtedness.  No extension of time for the payments of this Agreement made by agreement with any person now or hereafter liable for the payment of the agreement shall operate to release, discharge, modify, change, or effect the original liability under this Agreement, either in whole or in part.</p>


<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr><td colspan="3">&nbsp;</td></tr>
	<tr>
		<td>_________________________________</td>
		<td width="50">&nbsp;</td>
		<td>____________________________________</td>
	</tr>
	<tr><td colspan="3"><br>&nbsp;<br></td></tr>
	<tr>
		<td>_________________________________</td>
		<td width="50">&nbsp;</td>
		<td>____________________________________</td>
	</tr>
<tr><td colspan="3">&nbsp;</td></tr>
<tr><td colspan="3">&nbsp;</td></tr>
	<tr>
		<td>STATE OF</td>
		<td width="50">&nbsp;</td>
		<td>COUNTY, to wit:</td>
	</tr>
<tr><td colspan="3"><p>&nbsp;</p></td></tr>
<tr><td colspan="3">
<p>I HEREBY CERTIFY, that on this ______ day of _________________ , 2003, before
  me, an officer duly authorized in the state and county aforesaid to take acknowledgments,
  personally appeared and , known to me or has/have proven to be the person(s)
  described in and who executed the foregoing instrument and acknowledged that
  they executed the same for the purposes therein expressed.</p></td></tr>


<tr><td colspan="3"><p>&nbsp;</p></td></tr>
<tr><td colspan="3">WIT NESS MY HAND AND OFFICIAL SEAL this ______ day of _______________,
    2003.</td>
</tr>
<tr><td colspan="3"><p>&nbsp;</p></td></tr>
	<tr>
		<td>&nbsp;</td>
		<td width="50">&nbsp;</td>
		<td>______________________________________________ </td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td width="50">&nbsp;</td>
		<td>Notary Public</td>
	</tr>
<tr><td colspan="3">&nbsp;</td></tr>
<tr><td colspan="3">&nbsp;</td></tr>
<tr><td colspan="3">My Commission Expires:____________________</td></tr>
</table>





</td>
	</tr>
</table>
	<!--- end of page 3 ---->
</IE:DEVICERECT>

<IE:DEVICERECT ID="page4" CLASS="masterstyle" MEDIA="print">

<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
		<p align="center"><strong><u>OWNER/SELLER AFFIDAVIT</u></strong></p>
		<P align="center">(To induce sale of and/or loan on premises and title insurance coverage)</P>
<p>STATE OF __________________________________________________</p>

<p>CITY/COUNTY OF____________________________________________</p>

<p>The undersigned, being first duly sworn on oath, depose(s) and say(s):</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.  THAT Affiant(s) is/are the record titleholder(s) of the property known and described as follows:</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.  As to Mechanics liens: THAT at no time within 120 days of the date hereof has any
work, services, or labor been done, or any fixtures, apparatus or material been furnished in
connection with, or to, the said premises, except such material, fixtures, work, apparatus, labor,
or services as have been fully and completely paid for; that there is no indebtedness to anyone
for any labor, fixtures, apparatus, material, services, or in connection with, the said premises;
that there is no claim or indebtedness; that there is no mechanics lien claim against said
premises, whether of record or otherwise;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.  As to contracts & conveyances: THAT no agreement or contract for conveyance, or deed, conveyance, written lease, or writing whatsoever, is in existence, adversely affecting the title to premises, except that in connection with which this affidavit is given;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.  As to possession: THAT there are no parties in possession of said premises other than the undersigned;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.  As to judgments: THAT no judgment or decree has been entered in any court of the state of the United States against said Affiant(s) and which remains unsatisfied; THAT no proceedings in bankruptcy have ever been instituted by or against the Deponent(s) in any court, or before any office of any state;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.  As to marital status: THAT the undersigned is/are single/married (if married and spouse is joining in subject deed/deed of trust, spouse must also join herein);</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.  As to taxes and assessments: THAT there are no unpaid of delinquent real estate taxes or assessments against said premises; further, that there is no unpaid of delinquent water or<br>
sewer service charges against said premises;</p>

     <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Also, that the undersigned has not/have not received notice, nor known of any recent or future planned improvements (such as street paving, sidewalks, street lighting, surface drainage, etc.)   that will or might result in a special assessment against this property;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8.  THAT this Affidavit is made to induce the purchase and/or a loan secured by the premises described herein and to the issuance of a title insurance policy relating to the same;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;9.  THAT Affiant(s) further state(s) that he/she/they is/are each familiar with the nature of an oath; and with the penalties as provided by the laws of the state aforesaid for falsely swearing to statements made in an instrument of this nature, Affiant(s) further certify that he/she/they has/have heard/read to the Affiant(s) the full facts of this Affidavit, and understand its contents.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FURTHER YOUR AFFIANT(S) SAYETH NAUGHT</p>


<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr><td colspan="3">&nbsp;</td></tr>
	<tr>
		<td>_________________________________</td>
		<td width="50">&nbsp;</td>
		<td>____________________________________</td>
	</tr>
	<tr><td colspan="3"><br>&nbsp;<br></td></tr>
	<tr>
		<td>_________________________________</td>
		<td width="50">&nbsp;</td>
		<td>____________________________________</td>
	</tr>
<tr><td colspan="3">&nbsp;</td></tr>


<tr><td colspan="3"><p>&nbsp;</p></td></tr>
<tr><td colspan="3">ACKNOWLEDGED, SUBSCRIBED and SWORN TO before me this _____
    day of _________________, 2003.</td>
</tr>
<tr><td colspan="3"><p>&nbsp;</p></td></tr>
	<tr>
		<td>&nbsp;</td>
		<td width="50">&nbsp;</td>
		<td>______________________________________________ </td>
	</tr>
	<tr>
		<td>My commission expires:</td>
		<td width="50">&nbsp;</td>
		<td>Notary Public</td>
	</tr>

</table>

		</td>
	</tr>
</table>

	<!--- end of page 4 ---->
</IE:DEVICERECT>

<IE:DEVICERECT ID="page5" CLASS="masterstyle" MEDIA="print">

<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
		<p align="center"><strong><font size="4"><cfoutput>#UCase(session.site.long_name)#</cfoutput><br>
  Papermaster & Weltmann, P.C.<br>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
30 West Gude Drive, Suite 450<BR>
ROCKVILLE, MARYLAND 20850<BR>
<cfelse>
7361 Calhoun Place, Suite 200<BR>
ROCKVILLE, MARYLAND 20855<BR>
</cfif>866-484-8537<br>
FAX: 866-484-853</font>8
</strong></p>
		<P align="center">&nbsp;</P><P align="center">June 19, 2003</P>
<p>PayoffLender1Name<br>
PayoffLender1Address1, PayoffLender1Address2<br>
PayoffLender1C/S/Z
</p>
<table>
  <tr><td valign="top">Re:	</td>
<td width="15">&nbsp;</td>
<td>PAYOFF LETTER AND REQUEST FOR RELEASE OF LIEN<br>
	Loan Number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PayoffLender1LoanNumber<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Borrowers:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seller1Name, Seller2Name, Error! AutoText entry not defined. and Error! Au<br>
	Premises:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PropertyAddressCSZ
</td></tr></table>
<p>Dear Sir or Madam:</p>

<p>Enclosed is a check in the amount of $<cfoutput><cfif #read_hud.a_104_b# neq "" OR #read_hud.a_105_b# neq "">#read_hud.a_104_b#-#read_hud.a_105_b#<cfelse>#read_hud.a_504#-#read_hud.a_505#</cfif></cfoutput> Amount made payable to your institution and which represents the full and final payment of the above-reference loan. Please cancel the loan immediately and promptly execute and forward the Paid and Canceled Note to the undersigned.</p>

<p>The Borrowers, by signing their names below, acknowledge that the loan is to be paid in full and consent to its cancellation and satisfaction.</p>

<p>Please forward the Release to our office at the above listed address attention to Release Recording Department.  Please notify this office at once if the amount enclosed is insufficient to satisfy the loan in full.</p>

<p>Sincerely,</p>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr><td colspan="3">&nbsp;</td></tr>
	<tr>
		<td><cfoutput>#session.site.long_name#</cfoutput></td>
		<td width="50">&nbsp;</td>
		<td>Agreed to and acknowledged by:</td>
	</tr>
	<tr><td colspan="3">&nbsp;</td></tr>
	<tr><td colspan="3">&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
		<td width="50">&nbsp;</td>
		<td>______________________________________________ </td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td width="50">&nbsp;</td>
		<td>Seller1Name</td>
	</tr>
	<tr><td colspan="3">&nbsp;</td></tr>
	<tr><td colspan="3">&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
		<td width="50">&nbsp;</td>
		<td>______________________________________________ </td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td width="50">&nbsp;</td>
		<td>Seller2Name</td>
	</tr>	<tr><td colspan="3">&nbsp;</td></tr>
	<tr><td colspan="3">&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
		<td width="50">&nbsp;</td>
		<td>______________________________________________ </td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td width="50">&nbsp;</td>
		<td>Seller3Name</td>
	</tr>	<tr><td colspan="3">&nbsp;</td></tr>
	<tr><td colspan="3">&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
		<td width="50">&nbsp;</td>
		<td>______________________________________________ </td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td width="50">&nbsp;</td>
		<td>Seller4Name</td>
	</tr>
</table>

		</td>
	</tr>
</table>
	<!--- end of page 5 ---->
</IE:DEVICERECT>

<IE:DEVICERECT ID="page6" CLASS="masterstyle" MEDIA="print">

<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
		<p align="center"><strong><font size="4"><cfoutput>#UCase(session.site.long_name)#</cfoutput><br>
Papermaster & Weltmann, P.C.<br>
51 MONROE STREET, SUITE 1107<br>
ROCKVILLE, MD 20850<br>
(301) 279-0303<br>
FAX: (301) 279-7930<br>
</font>
</strong></p>
		<P align="center">&nbsp;</P><P align="center">&nbsp;</P>
<p>Telefax:<br>
</p>
<table align="center" width="95%">
  <tr><td valign="top">Re:	</td>
<td width="15">&nbsp;</td>
<td><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Our
    Case No.<br>
	  Loan No.<br>
  Borrowers:<br>
	  </p>
  <p>Property:<br>
    <strong><u>REQUEST TO CANCEL REVOLVING CREDIT LOAN</u></strong> </p></td>
  </tr></table>
<p>Ladies/Gentlemen:</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please freeze the loan amount to include obligations incurred or draws I have
  made prior to and including the date of this letter under terms and condition
  of the above-numbered loan secured by the above-numbered mortgage or the surety
  instrument, recorded in the Land Records of <cfoutput>#read_title.pcounty#</cfoutput> County, Maryland and cancel the
  revolving credit loan for future advances.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;I agree to cease signing all checks and/or credit cards and/or drafts. I enclose
  all of the above which I have in my possession.</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This is also a notice that I intend to sell or execute a new mortgage on the
  property. Under the laws of some States, future advances may be subordinate
  to the right of a new lender or buyer.</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Your cooperation in this matter is essential to completing the real estate
  transaction contemplated with referenced to the mortgaged property.<br>
</p>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr>
		<td width="35%">&nbsp;</td>
		<td width="50">&nbsp;</td>
		<td>Sincerely, </td>
	</tr>
	<tr><td colspan="3">&nbsp;</td></tr>
	<tr><td colspan="3">&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
		<td width="50">&nbsp;</td>
		<td>______________________________________________ </td>
	</tr>
	<tr><td colspan="3">&nbsp;</td></tr>
	<tr><td colspan="3">&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
		<td width="50">&nbsp;</td>
		<td>______________________________________________ </td>
	</tr>	<tr><td colspan="3">&nbsp;</td></tr>
	<tr><td colspan="3">&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
		<td width="50">&nbsp;</td>
		<td>______________________________________________ </td>
	</tr>	<tr><td colspan="3">&nbsp;</td></tr>
	<tr><td colspan="3">&nbsp;</td></tr>
	<tr>
		<td>&nbsp;</td>
		<td width="50">&nbsp;</td>
		<td>______________________________________________ </td>
	</tr>
	<tr><td colspan="3">&nbsp;</td></tr>
	<tr><td colspan="3">&nbsp;</td></tr>
	<tr>
		<td colspan="3" align="center">
		<table>
		  <tr><Td width="100" valign="top"><strong>** NOTE: </strong></td>
		<td width=20></td><td valign="top"><strong>THE ORIGINAL RELEASE/SATISFACTION
		    DOCUMENTS MUST BE SENT TO <cfoutput>#UCase(session.site.long_name)#</cfoutput>, FOR RECORDING.  PLEASE
		    REMIT TO THE ADDRESS BELOW.</strong></Td>
		  </tr></table>

<br><br>
<strong><cfoutput>#UCase(session.site.long_name)#</cfoutput><br>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
30 WEST GUDE DRIVE SUITE 450<br>
ROCKVILLE, MD 20850<br>
<cfelse>
7361 CALHOUN PLACE,  SUITE 200<br>
ROCKVILLE, MD 20855<br>
</cfif>
ATTN: RELEASE RECORDING DEPT.</strong><br>
</td>
	</tr>
</table>

		</td>
	</tr>
</table>
	<!--- end of page 5 ---->
</IE:DEVICERECT>

<IE:DEVICERECT ID="page7" CLASS="masterstyle" MEDIA="print">


<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
		<p align="center">Joint Notice of Privacy Policy<br>
		<cfoutput>#session.site.long_name#</cfoutput>*<br>
		And<br>
		<cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif></p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<cfoutput>#session.site.long_name#</cfoutput>, and <cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif> value their customers
		  and are committed to protecting the privacy of personal information. In keeping
		  with that philosophy, we each have developed a Privacy Policy, set out below,
		  that will ensure the continued protection of your nonpublic personal information
		  and inform you about the measures <cfoutput>#session.site.long_name#</cfoutput>, and <cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif>
		  take to safe-guard that private information. This notice is issued jointly
		  as a means of paperwork reduction and is not intended to create a joint privacy
		  policy. Each company&#8217;s privacy policy is separately instituted, executed
		  and maintained.</p>
		<p><strong><u>WHO IS COVERED</u></strong></p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;We provide our Privacy Policy to each customer when they purchase a <cfoutput>#session.site.long_name#</cfoutput>, title insurance policy. Generally, this means that
		  the privacy policy is provided to the customer at the closing of the real
		  estate transaction.</p>
		<p><strong><u>INFORMATION COLLECTED</u></strong> </p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;In the normal course of business and to provide the necessary services to
		  our customers, we may obtain nonpublic personal information directly from
		  the customer, from customer-related transactions, or from third parties such
		  as our title insurance agents, lenders, appraisers, surveyors or other similar
		  entities.</p>
		<p><strong><u>ACCESS TO INFORMATION</u></strong> </p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Access to all nonpublic personal information is limited to those employees
		  who have a need to know in order to perform their jobs. These employees include,
		  but are not limited to, those in departments such as closing, legal, underwriting,
		  claims administration and accounting. </p>
		<p><strong><u>INFORMATION SHARING</u></strong> <br>
            <br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Generally, neither <cfoutput>#session.site.long_name#</cfoutput>, nor <cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif> shares
  nonpublic personal information that it collects anyone other than those individuals
  necessary needed to complete the real estate settlement services and issue
  its title insurance policy as requested by the consumer. <cfoutput><p>#read_agency.title_FT_Agency_name# </p></cfoutput>, or UnderwriterName may share nonpublic personal information
  as permitted by law with entities with who <cfoutput>#session.site.long_name#</cfoutput>,
  or <cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif> has a joint marketing agreement. Entities with whom <cfoutput>#session.site.long_name#</cfoutput>, or <cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif> have a joint marketing agreement
  have agreed to protect the privacy of our customer&#8217;s nonpublic personal
  information by utilizing similar precautions and security measures as <cfoutput>#session.site.long_name#</cfoutput>, and <cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif> use to protect this information
  and to use the information for lawful purpose. <cfoutput>#session.site.long_name#</cfoutput>,
  or <cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif>, however, may share information as required by law in response
  to a subpoena, to a government regulatory agency or to prevent fraud.</p>
		<p><strong><u>INFORMATION SECURITY</u></strong> </p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<cfoutput>#session.site.long_name#</cfoutput>, and <cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif>, at all times, strive
		  to maintain the confidentiality and integrity of the personal information
		  in its possession and has instituted measures to guard against its unauthorized
		  access. We maintain physical, electronic and procedural safeguards in compliance
		  with federal standards to protect that information.
          <ul><li>
            Affiliated entities and individuals associated with <cfoutput>#session.site.long_name#</cfoutput>, are also covered under this notice. Those include: First Title &amp; Escrow,
            Inc., 1st Title and Escrow, Inc., First Title Agency and Escrow,
            First Title of NEVADA INC., First Settlement and Escrow, Inc. and
            Stephen J. Papermaster.</li></ul>

</td></tr></table></IE:DEVICERECT>

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
