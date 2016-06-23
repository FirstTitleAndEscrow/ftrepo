<CFPARAM NAME="a_trigger" DEFAULT="0">
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
<cfif #a_trigger# neq 2>
<CFFORM NAME="frm" ACTION="./closing_form_email.cfm?rec_id=#rec_id#" METHOD="POST">
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
<font color = blue><b>Closing Form email was sent</b></font></cfif>
</div>

<IE:DEVICERECT ID="page1" CLASS="masterstyle" MEDIA="print">
<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
		<p align="center"><strong><font size=+3><u>STREAMLINE TITLE & ESCROW SERVICES, LLC</u></font></strong></p>
<font size=3><p align="center"><strong><u>SETTLEMENT AGREEMENT AND DISCLOSURE</u></strong></p>
<p>Buyers/Br: Buyer/Borrower</p>
<p>SeIler(s)/Owner(s): Seller</p>
<p>Property: Full Property Address</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;In reference to this case, the undersigned does agree, understand and affirm to the best of his/her knowledge that:<BR><BR>

1)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>ACKNOWLEDGEMT OF RECEIPT</strong>: The Purchaser(s)/Borrower(s) and Seller(s)/Owner(s) do hereby acknowledge receipt of a copy of the settlement statement and do approve and accept the same as a correct representation of the agreement. Streamline Title & Escrow Services, LLC ("Settlement Agent") has no liability for matters not appearing of record subsequent to the date of the title examination. The parties hereby acknowledge notification that Streamline Title & Escrow Services, LLC, as the title insurance agent, receives a commission on the title insurance premium.<BR>
2)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>SETTLEMENT STATEMENT</strong>: The Seller(s) or Owner(s) state that there are no unpaid obligations affecting the property other than those shown on the settlement statement. The parties further state that those matters listed on the settlement statement are true and correct The Seller(s)/Owner(s) further guarantee the prompt and immediate payment, release and full satisfaction of all unpaid liens/bills affecting said property not shown on the settlement statement and hereby indemnifies and holds harmless the Settlement Agent from the same.<BR>
3)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>THIRD PARTY INFORMATION</strong>: The parties understand and agree that the accuracy of third-party information furnished to Streamline Title & Escrow Services, LLC as to contract provisions, water and sewer charges, taxes, assessments, balances on notes secured by mortgages, deeds of trust and other evidences of indebtedness, as well as the amount of escrow funds, lender charges and similar items are not guaranteed by Streamline Title & Escrow Services, LLC Streamline Title & Escrow Services, LLC does not guarantee the accuracy of this information and the parties acknowledge that they will be responsible as to any discrepancies affecting them.<BR>
4)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>LIABILITY</strong>: It is understood and agreed that Streamline Title & Escrow Services, LLC has no liability, express or implied, for notices of and/or actual violations of governmental orders or requirements, if any, issued by any department, office or other authority of local, state, county or federal government as to occupancy, zoning and/or similar laws, truth-in-lending or consumer protection regulations and/or ordinances.<BR>
5)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>FDIC WAIVER</strong>: The undersigned does hereby understand and agree that the Federal Deposit Insurance Corporation ("FDIC") coverages apply only to a maximum amount of $100,000 for each individual depositor. The funds for this settlement are being deposited in Sandy Spring, Potomac Valley n/k/a PNC or Citibank for disbursement We understand that the Settlement Agent assumes no responsibility for, nor will we hold the same liable for, loss occurring which arises from the fact that the amount of the above account may cause the aggregate amount of any individual depositor's account to exceed $100,000 and that the excess amount is not insured by the FDIC or that FDIC insurance is not available on certain types of bank instruments.<BR>
6)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>CLOSING CONDITIONS</strong>: The Purchaser(s)/Borrower(s) and Seller(s)/Owner(s) agree that settlement is not complete until the following conditions have been met:<BR>
&nbsp;&nbsp;&nbsp;a)&nbsp;&nbsp;&nbsp;All funds in the form of certified funds have been received and have cleared our escrow account;<BR>
&nbsp;&nbsp;&nbsp;b)&nbsp;&nbsp;&nbsp;All checks (including assignment of funds check) are received and have cleared our escrow account;<BR>
&nbsp;&nbsp;&nbsp;c)&nbsp;&nbsp;&nbsp;All documents [both Purchaser(s)/Eorrower(s) and Seller(s)/Owner(s)] have been properly executed and delivered;<BR>
&nbsp;&nbsp;&nbsp;d)&nbsp;&nbsp;&nbsp;All lender's requirements have been fulfilled; and, the title search to the property has been brought current to the<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;time of recordation.<BR>
7)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>ACKNOWLEDGEMENT OF LEGAL REPRESENTATION</strong>: In the event that attorney of the Law Firm has been requested to conduct the settlement, the undersigned Purchaser(s)/Borrower(s) and/or Seller(s)/Owner(s) acknowledge that such attorney is not representing either Purchaser(s)/Borrower(s) or Seller(s)/Owner(s) and that no attorney-client relationship is being created as a result of such attorney conducting the settlement.<BR>
8)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>ADJUSTMENTS</strong>: The parties understand and agree that Streamline Title & Escrow Services, LLC may make any subsequent corrections and proper adjustments in the event any information and/or items on the settlement statement are incorrect, or if funds collected for any item prove to be insufficient, and agree to pay and/or reimburse Streamline Title & Escrow Services, LLC any further sums found to be due since all computations and entries on this settlement statement are subject to final audit If any legal action is required to collect any such sums, the parties agree to pay all costs and reasonable attorney's fees directly resulting from necessary collection actions.<BR>
9)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>CORRECTION AGREEMENT - LIMITED POWER OF ATTORNEY</strong>: The undersigned Purchasers)/Borrower(s) and Seller(s)/Owner(s), for and in consideration of the Lender funding the closing of the loan and the Settlement Agent closing this transaction, agree that, if requested by the Lender or Streamline Title & Escrow Services, LLC, to fully cooperate and adjust all typographical or clerical errors discovered in any or all of the closing documentation presented at settlement.<BR>
10)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The undersigned appoint Streamline Title & Escrow Services, LLC and its authorized representatives as their attorney-in-fact, to correct any such errors, place our initials on documents where changes are made, and/or sign our names to any document or form. In the event this procedure is utilized, the party involved shall be notified and receive a copy of the amended document.<BR>
11)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>CERTIFICATE OF TRUE IDENTITY</strong>: The undersigned does certify and agree that they are the actual parties of record to this transaction and that the representations made to the Settlement Agent with regard to identity are true and correct.<BR>
12)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>CERTIFICATION</strong>: I have carefully reviewed the HUD-1 SETTLEMENT STATEMENT and to the best of my knowledge and belief, it is a true and accurate statement of all receipts and disbursements made on my account or by me in this transaction. I further certify that I have received a copy of the HUD-1 SETTLEMENT STATEMENT.<BR>
13)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>TENANCY FOR TITLE DEED</strong>: Please confirm your selection<br>

<table>
<tr>
<td align="left" valign="top" width="45">&nbsp;</td>
<td align="left" valign="top" width="60">_______</td>
<td align="left" valign="top"><strong>JOINT TENANTS</strong>: Each owner obtains an undivided, equal interest in the property and each has reciprocal rights of survivorship.</td>
</tr>
<tr>
<td align="left" valign="top" width="45">&nbsp;</td>
<td align="left" valign="top" width="60">_______</td>
<td align="left" valign="top"><strong>TENANTS IN COMMON</strong>: Each owner obtains a certain undivided percentage interest in the property (the interests may be split in equal or unequal portions, for example: two owners may have a 50/50% split or 60/40%, or 90/10%, etc.). Unlike a joint tenancy, tenants in common do not have reciprocal rights of survivorship. If a tenant in common dies, his or her interest will pass according to the terms of his or her Last Will and Testament, or under the laws of intestate succession if he/she dies without a Will. Unless otherwise set forth, a tenancy in common is presumed to create equal undivided interests. Purchasers may indicate a different breakdown as follows:</td>
</tr>
<tr>
<td align="left" valign="top" width="45">&nbsp;</td>
<td align="left" valign="top" width="60">_______</td>
<td align="left" valign="top"><strong>SOLE OWNERSHIP</strong>: 100% title vested in Grantee.</td>
</tr>
<tr>
<td align="left" valign="top" width="45">&nbsp;</td>
<td align="left" valign="top" width="60">_______</td>
<td align="left" valign="top"><strong>TRUST OWNERSHIP</strong>: Title vested in Grantee(s) Trust</td>
</tr>
</table>

<br>
14)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>SURVEY REVIEW ACKNOWLEDGEMENT</strong>: I/We, the undersigned Purchaser(s), hereby acknowledge receipt of a copy of this survey and acknowledge that all house locations, lot lines, building restriction lines, easements, rights of way, encroachments and fence lines, if any, have been explained to us at settlement.<br>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;We, the undersigned, have agreed to the foregoing as a condition for settlement by Streamline Title & Escrow Services, LLC. If applicable:<br>

15)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>PRIVACY POLICY</strong>: The Financial Services Modernization Act recently enacted by Congress has brought many changes to the financial services industry, which includes title insurance companies and companies that conduct closings. The new law requires that Streamline Title & Escrow Services, LLC, provide our privacy policy to all buyers, borrowers and sellers. The new law also requires that all purchasers purchasing an owners title insurance policy receive the privacy policy of the title insurance underwriter, which provides such policy.<br>
<br>
Below is our Privacy Policy. Attached in a separate form is our underwriter's policy.<br>
<br>
We collect nonpublic personal information about you from the following sources:<br>

<ul><li>Information we receive from your agent, such as your name, address, phone number, or social security number;</li>
<li>Information about your transactions with our affiliates, others, or us. We receive this information from your lender, attorney, real estate broker, etc; and
<li>Information from public records</li></ul>

We do not disclose any nonpublic personal information about our customers or former customers to anyone, except as permitted by law.<br>
<br>
We restrict access to nonpublic personal information about you to those employees who need to know that information to provide the products or services requested by you or your lender.<br>
<br>
We maintain physical, electronic, and procedural safeguards that comply with appropriate federal and state regulations.<br>

</IE:DEVICERECT>

<IE:DEVICERECT ID="page2" CLASS="masterstyle" MEDIA="print">


<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The undersigned Borrower(s), for and in consideration of Zero Dollars, agree that if requested by Papermaster & Weltmann, P.C., First Title & Escrow, Inc., to cooperate, adjust and correct all TYPOGRAPHICAL OR CLERICAL ERRORS discovered in any or all of the closing documentation executed by the undersigned at settlement.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The undersigned appoint Papermaster & Weltmann, P.C., First Title & Escrow, Inc., and/or its designee as their attorney-in fact to correct such errors, place our initials on documents where changes are made, and/or sign our names to acknowledge any modification agreement or other document of form correcting such errors.  In the event this procedure is utilized, the party(ies) involved shall be notified and receive a corrected copy of the changes document(s) from Papermaster & Weltmann, P.C., First Title & Escrow, Inc.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This Power of Attorney is coupled with an interest and shall be irrevokable until the loan is satisfied and shall survive the disability of the undersigned.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AS WITNESS our execution hereof, this _____day  of  ____________________, 2003.</p>


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
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Notary Public</td>
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
<p>The borrower(s) herein agree that this loan and its final disbursement are expressly contingent on Papermaster & Weltmann, P.C./First Title & Escrow, Inc., receiving an updated title report which reflects no liens or encumbrances which have occurred within six (6) months of the date of settlement.  I/we fully understand that if the title report reveals any such lien, judgment, or encumbrance which would be subordinate and this loan has not already funded, this Deed of Trust/Mortgage would be declared null and void and final disbursement of this loan and any proceeds thereof may not occur.</p>

<p>This loan is to be a first trust mortgage  (  )
<br>This loan is to be a second trust mortgage  (  )
</p>

<p>Whereas, the undersigned, jointly and severally, promises to pay to the order of Papermaster & Weltmann, P.C./First Title & Escrow, Inc., (Its assignees and successors in interest) the principal sum equal to the total amount of any Shortages on Mortgages and/or Judgment payoffs.  The Borrower hereby understands that this debt is their sole responsibility.</p>

<p>Real Estate tax information is provided to Papermaster & Weltmann, P.C./First Title & Escrow, Inc., from the Tax Assessment Office.  Papermaster & Weltmann, P.C./First Title & Escrow, Inc., relies upon this information.  If, in the event this information is not true and correct the borrower will be held responsible to pay any and all taxes due.</p>

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
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.  THAT Affiant(s) is/are the record titleholder(s) of the property known and described as follows:</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.  As to Mechanics liens: THAT at no time within 120 days of the date hereof has any
work, services, or labor been done, or any fixtures, apparatus or material been furnished in
connection with, or to, the said premises, except such material, fixtures, work, apparatus, labor,
or services as have been fully and completely paid for; that there is no indebtedness to anyone
for any labor, fixtures, apparatus, material, services, or in connection with, the said premises;
that there is no claim or indebtedness; that there is no mechanics lien claim against said
premises, whether of record or otherwise;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.  As to contracts & conveyances: THAT no agreement or contract for conveyance, or deed, conveyance, written lease, or writing whatsoever, is in existence, adversely affecting the title to premises, except that in connection with which this affidavit is given;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.  As to possession: THAT there are no parties in possession of said premises other than the undersigned;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.  As to judgments: THAT no judgment or decree has been entered in any court of the state of the United States against said Affiant(s) and which remains unsatisfied; THAT no proceedings in bankruptcy have ever been instituted by or against the Deponent(s) in any court, or before any office of any state;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6.  As to marital status: THAT the undersigned is/are single/married (if married and spouse is joining in subject deed/deed of trust, spouse must also join herein);</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7.  As to taxes and assessments: THAT there are no unpaid of delinquent real estate taxes or assessments against said premises; further, that there is no unpaid of delinquent water or<br>
sewer service charges against said premises;</p>

     <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Also, that the undersigned has not/have not received notice, nor known of any recent or future planned improvements (such as street paving, sidewalks, street lighting, surface drainage, etc.)   that will or might result in a special assessment against this property;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8.  THAT this Affidavit is made to induce the purchase and/or a loan secured by the premises described herein and to the issuance of a title insurance policy relating to the same;</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;9.  THAT Affiant(s) further state(s) that he/she/they is/are each familiar with the nature of an oath; and with the penalties as provided by the laws of the state aforesaid for falsely swearing to statements made in an instrument of this nature, Affiant(s) further certify that he/she/they has/have heard/read to the Affiant(s) the full facts of this Affidavit, and understand its contents.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FURTHER YOUR AFFIANT(S) SAYETH NAUGHT</p>


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
		<cfif NOT DateDiff("d", Now(), "1/30/2012")>
<p align="center"><strong><font size="4">FIRST TITLE & ESCROW, INC.<br>
  Papermaster & Weltmann, P.C.<br>
30 West Gude Drive, suite 450<br>
ROCKVILLE, MARYLAND 20850<br>
866-484-8537<br>
FAX: 866-484-853</font>8
</strong></p>
<cfelse>
<p align="center"><strong><font size="4">FIRST TITLE & ESCROW, INC.<br>
  Papermaster & Weltmann, P.C.<br>
7361 Calhoun Place, Suite 200<br>
ROCKVILLE, MARYLAND 20855<br>
866-484-8537<br>
FAX: 866-484-853</font>8
</strong></p>
</cfif>


		<P align="center">&nbsp;</P><P align="center">June 19, 2003</P>
<p>PayoffLender1Name<br>
PayoffLender1Address1, PayoffLender1Address2<br>
PayoffLender1C/S/Z
</p>
<table>
  <tr><td valign="top">Re:	</td>
<td width="15">&nbsp;</td>
<td>PAYOFF LETTER AND REQUEST FOR RELEASE OF LIEN<br>
	Loan Number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PayoffLender1LoanNumber<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Borrowers:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seller1Name, Seller2Name, Error! AutoText entry not defined. and Error! Au<br>
	Premises:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PropertyAddressCSZ
</td></tr></table>
<p>Dear Sir or Madam:</p>

<p>Enclosed is a check in the amount of $<cfoutput><cfif #read_hud.a_104_b# neq "" OR #read_hud.a_105_b# neq "">#read_hud.a_104_b#-#read_hud.a_105_b#<cfelse>#read_hud.a_504#-#read_hud.a_505#</cfif></cfoutput> Amount made payable to your institution and which represents the full and final payment of the above-reference loan. Please cancel the loan immediately and promptly execute and forward the Paid and Canceled Note to the undersigned.</p>

<p>The Borrowers, by signing their names below, acknowledge that the loan is to be paid in full and consent to its cancellation and satisfaction.</p>

<p>Please forward the Release to our office at the above listed address attention to Release Recording Department.  Please notify this office at once if the amount enclosed is insufficient to satisfy the loan in full.</p>

<p>Sincerely,</p>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr><td colspan="3">&nbsp;</td></tr>
	<tr>
		<td>First Title & Escrow, Inc</td>
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
		<p align="center"><strong><font size="4">FIRST TITLE & ESCROW, INC.<br>
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
<td><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Our
    Case No.<br>
	  Loan No.<br>
  Borrowers:<br>
	  </p>
  <p>Property:<br>
    <strong><u>REQUEST TO CANCEL REVOLVING CREDIT LOAN</u></strong> </p></td>
  </tr></table>
<p>Ladies/Gentlemen:</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please freeze the loan amount to include obligations incurred or draws I have
  made prior to and including the date of this letter under terms and condition
  of the above-numbered loan secured by the above-numbered mortgage or the surety
  instrument, recorded in the Land Records of <cfoutput>#read_title.pcounty#</cfoutput> County, Maryland and cancel the
  revolving credit loan for future advances.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;I agree to cease signing all checks and/or credit cards and/or drafts. I enclose
  all of the above which I have in my possession.</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This is also a notice that I intend to sell or execute a new mortgage on the
  property. Under the laws of some States, future advances may be subordinate
  to the right of a new lender or buyer.</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Your cooperation in this matter is essential to completing the real estate
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
		    DOCUMENTS MUST BE SENT TO FIRST TITLE & ESCROW, INC., FOR RECORDING.  PLEASE
		    REMIT TO THE ADDRESS BELOW.</strong></Td>
		  </tr></table>

<br><br>
<strong>FIRST TITLE & ESCROW, INC.<br>
7361 CALHOUN PLACE, SUITE 200<br>
ROCKVILLE MD 20855<br>
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
		First Title &amp; Escrow, Inc.*<br>
		And<br>
		<cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif></p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;First Title &amp; Escrow, Inc., and <cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif> value their customers
		  and are committed to protecting the privacy of personal information. In keeping
		  with that philosophy, we each have developed a Privacy Policy, set out below,
		  that will ensure the continued protection of your nonpublic personal information
		  and inform you about the measures First Title &amp; Escrow, Inc., and <cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif>
		  take to safe-guard that private information. This notice is issued jointly
		  as a means of paperwork reduction and is not intended to create a joint privacy
		  policy. Each company&#8217;s privacy policy is separately instituted, executed
		  and maintained.</p>
		<p><strong><u>WHO IS COVERED</u></strong></p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;We provide our Privacy Policy to each customer when they purchase a First
		  Title &amp; Escrow, Inc, title insurance policy. Generally, this means that
		  the privacy policy is provided to the customer at the closing of the real
		  estate transaction.</p>
		<p><strong><u>INFORMATION COLLECTED</u></strong> </p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;In the normal course of business and to provide the necessary services to
		  our customers, we may obtain nonpublic personal information directly from
		  the customer, from customer-related transactions, or from third parties such
		  as our title insurance agents, lenders, appraisers, surveyors or other similar
		  entities.</p>
		<p><strong><u>ACCESS TO INFORMATION</u></strong> </p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Access to all nonpublic personal information is limited to those employees
		  who have a need to know in order to perform their jobs. These employees include,
		  but are not limited to, those in departments such as closing, legal, underwriting,
		  claims administration and accounting. </p>
		<p><strong><u>INFORMATION SHARING</u></strong> <br>
            <br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Generally, neither First Title &amp; Escrow, Inc, nor <cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif> shares
  nonpublic personal information that it collects anyone other than those individuals
  necessary needed to complete the real estate settlement services and issue
  its title insurance policy as requested by the consumer. <cfoutput><p>#read_agency.title_FT_Agency_name# </p></cfoutput>, or UnderwriterName may share nonpublic personal information
  as permitted by law with entities with who First Title &amp; Escrow, Inc.,
  or <cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif> has a joint marketing agreement. Entities with whom First
  Title &amp; Escrow, Inc, or <cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif> have a joint marketing agreement
  have agreed to protect the privacy of our customer&#8217;s nonpublic personal
  information by utilizing similar precautions and security measures as First
  Title &amp; Escrow, Inc., and <cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif> use to protect this information
  and to use the information for lawful purpose. First Title &amp; Escrow, Inc.,
  or <cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif>, however, may share information as required by law in response
  to a subpoena, to a government regulatory agency or to prevent fraud.</p>
		<p><strong><u>INFORMATION SECURITY</u></strong> </p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;First Title &amp; Escrow, Inc., and <cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif>, at all times, strive
		  to maintain the confidentiality and integrity of the personal information
		  in its possession and has instituted measures to guard against its unauthorized
		  access. We maintain physical, electronic and procedural safeguards in compliance
		  with federal standards to protect that information.
          <ul><li>
            Affiliated entities and individuals associated with First Title &amp; Escrow,
            Inc., are also covered under this notice. Those include: First Title &amp; Escrow,
            Inc., 1st Title and Escrow, Inc., First Title Agency and Escrow,
            First Title of NEVADA INC., First Settlement and Escrow, Inc. and
            Stephen J. Papermaster.</li></ul>

</td></tr></table></IE:DEVICERECT>

</body>
</html>
