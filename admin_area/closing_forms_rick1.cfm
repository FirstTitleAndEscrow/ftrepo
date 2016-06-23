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
		</td>
	</tr>
</table>
<!--- end of page 1 - attorney presentation notice ---->
</IE:DEVICERECT>

<IE:DEVICERECT ID="page2" CLASS="masterstyle" MEDIA="print">


<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
		<p align="center"><br>
<strong><u>- Page 2 -</u></strong></p>
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
</td>
	</tr>
</table>
<!--- end of page 2 ---->
</IE:DEVICERECT>

<IE:DEVICERECT ID="page3" CLASS="masterstyle" MEDIA="print">

<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
		<p align="center"><br>
<br>
<strong><u>- Page 3 -</u></strong></p>
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
<br>
<br>
_______________________________________<br>
<br>
<br>
STATE/DISTRICT OF COUNTY/CITY OF<br>
to wit:<br>
<br>
<br>
On this_______day of______________,________, before me, the undersigned, a Notary for the State/District of<br>
________________________________County/City of_________________________________, personally appeared<br>
______________________________, known to me (or satisfactorily proven) to be the person(s) whose name(s) is/are<br> subscribed to the within instrument bearing the date of________________, and acknowledged that he/she/they have<br>
executed the same for the purpose therein contained.<br>
<br>
<br>
In Witness Whereof, I have hereunto set my hand and official seal.<br>
<br>
<br>
_____________________________<BR>
Notary Public<br>
My Commission Expires:<br>

</td>
	</tr>
</table>
	<!--- end of page 3 ---->
</IE:DEVICERECT>

<IE:DEVICERECT ID="page4" CLASS="masterstyle" MEDIA="print">

<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
		<p align="center"><br>
<br>
<strong><u>- Page 4 -</u></strong></p>


<p>Buyer's or Borrower's Forwarding Address:<br>
<br>
_______________________________________________________________<br>
<br>
Buyer's Email Address:<br>
<br>
______________________________________________________________<br>
<br>
Buyer's or Borrower's phone numbers:<br>
<br>
Work:________________________<br>
<br>
Home: ________________________<br>
<br>
Cell: ________________________<br>
<br>
Attached is Certified To Be a True and Correct Copy of the Original Settlement Statement.<br>
<br>
STREAMLINE TITLE & ESCROW SERVICES, LLC<br><br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
T-<cfoutput>#get_titleid.title_id#</cfoutput>

		</td>
	</tr>
</table>

	<!--- end of page 4 ---->
</IE:DEVICERECT>

<IE:DEVICERECT ID="page5" CLASS="masterstyle" MEDIA="print">

<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
		<p align="center"><br>
<strong><font size="4"><u>RESPA DISCLOSURE REGARDING AFFILIATED ENTITIES</u></font>
</strong></p>

<p><strong>To:  Purchaser/Borrower<BR><BR>

Property:  Property Address<BR><BR>

From: Shapiro & Burson, LLP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date:   Closing Date<BR><BR></strong>

This is to give you notice that Shapiro & Burson, LLP, has a business relationship with Streamline Title & Escrow Services, LLC. Shapiro & Burson, LLP owns an interest in this affiliate and therefore has a financial interest in their business services. We'd also like you to know that some of the owners of Streamline Title & Escrow Services, LLC own an interest in First Title & Escrow, Inc., to whom some closing functions are contracted. Because of this relationship, this referral may provide Referring Company a financial or other benefit.<BR><BR>

Set forth below is the estimated charge or range of charges offered by Streamline Title & Escrow Services, L.L.C., for the following settlement services-<BR><BR>

<strong>Closing fees             <cfif get_titleid.pstate eq 'MD'>$250.00<cfelse>$450.00</cfif><br></strong>
<br>
You are not required to use Streamline Title & Escrow Services, L.L.C. or First Title & Escrow, Inc. as a condition for settlement of your loan on (or purchase, sale, or refinance of) the subject property. THERE ARE FREQUENTLY OTHER SETTLEMENT SERVICE PROVIDERS AVAILABLE WITH SIMILAR SERVICES. YOU ARE FREE TO SHOP AROUND TO DETERMINE THAT YOU ARE RECEIVING THE BEST SERVICES AND THE BEST RATE FOR THESE SERVICES.<br><br>

Please note: Title company charges shown above do not include "personal service fees" or other charges payable to outside vendors for services such as surveys, title abstracts, courier, wire transfers, termite reports, or home inspections, etc.<br><br><br>

<strong><u>ACKNOWLEDGMENT</u></strong><br><br>

I/we have read this disclosure form, and understand that Shapiro & Burson, LLP, may be referring me/us to purchase the above-described settlement services from Streamline Title & Escrow Services, LLC, and may receive a financial or other benefit as the result of this referral.<br><br>
<br>
<br>

Buyer/Borrower:____________________________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date:____________________<br><br><br>

Buyer/Borrower:____________________________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date:____________________<br><br><br>

Buyer/Borrower:____________________________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date:____________________<br><br><br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
T-<cfoutput>#get_titleid.title_id#</cfoutput><br>


		</td>
	</tr>
</table>
	<!--- end of page 5 ---->
</IE:DEVICERECT>

<IE:DEVICERECT ID="page6" CLASS="masterstyle" MEDIA="print">

<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
		<p align="center"><strong><font size="4">OWNER'S AFFIDAVIT<BR>
AND ENHANCED<BR>
OWNER'S POLICY IF<BR>
APPLICABLE<br>
</font>
</strong></p>



<p>FULL PROPERTY ADDRESS</p>

<p>STATE OF ____________________________, to wit:<BR><BR>

THIS DAY, there personally appeared before the undersigned, a Notary Public in and for the State of<BR>
______________, duly commissioned, the undersigned Owner(s) of the captioned property, who, being<BR>
first duly sworn, depose(s) and say(s) as follows:<BR><BR>

<ol><LI>That I/we are a) of legal age, b) have legal capacity to act for myself/ourselves, c) are all of the owners of the subject property, d) are the same persons named in the title Deed, and e) are citizens of the United States.<BR><BR></li>

<LI>The property is currently used as a residence or investment<BR><BR></li>

<LI>The street address of the property is correct as shown at the heading of this Affidavit<BR><BR></li>

<LI>No one has ever questioned or disputed my/our ownership of the property.<BR><BR></li>

<LI>That there are no disputes with any adjoining property owners or with any parties or persons as to use or location of any improvements (including fences, driveways, structures, etc.) nor disputes regarding location of property lines.<BR><BR></li>

<LI>Our access to and from a public street has never been questioned or limited in any way.<BR><BR></li>

<LI>That I/we are not a party to any pending lawsuits in any Court.<BR><BR></li>

<LI>That no proceedings in bankruptcy have been instituted by or against the undersigned in any Court<BR><BR></li>

<LI>That there are no liens or encumbrances (Mortgages, Deeds of Trust, Judgments, Tax Liens, Mechanic's Liens, Unpaid Homeowners or Condominium Association Dues or Assessments, etc.) known to me/us which are not being paid or adjusted for in this current transaction.<BR><BR></li>

<LI>That all labor and materials used in construction of improvements, repairs, or modifications to this property have been paid for, and there are now no unpaid bills for labor or material against the improvements or property. I/we have not received notice of any mechanic's lien claim.<BR><BR></li>

<LI>That there are no unrecorded and/or outstanding leases, contracts, options or agreements affecting this property (other than the contract or option which is the subject of the present transaction) which have not been disclosed to all parties and/or its agent in writing.<BR><BR></li>


<LI>That I/we know of no violations of subdivision or lot division laws, nor do we know of any violations of any zoning laws regarding this property. Includes use and occupancy.<BR><BR></li>


<LI>That all taxes, charges, dues, water and sewer bills and charges, and other assessments payable in connection with this property have been paid through the date of the herein affidavit unless payment has been provided for on the HUD-1 Settlement Statement used in the current transaction; and the undersigned have not received notice from any Governmental agency that work is required to be done to the subject property which will result in future charges.<BR><BR></li></ol>



		</td>
	</tr>
</table>
	<!--- end of page 5 ---->
</IE:DEVICERECT>

<IE:DEVICERECT ID="page7" CLASS="masterstyle" MEDIA="print">


<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
<br>
<br>

<p><ol type="1" start="14"><li>That I/we are not receiving the benefit of any real property tax credits or preferential assessments,
                 which may not continue as credits, or preferential assessments to any purchaser of this property.<BR><BR></li>

<li>That no Governmental authority has notified me/us of any violations, abatement notices, or
                 condemnations.<BR><BR></li>

<li>That I/we have no knowledge of any violations of neighborhood restrictions and/or homeowners
                 or condominium association restrictions or by-laws with respect to this property.<BR><BR></li>

<li>That I/we are not aware of any problems regarding the issuance of a building permit or failure to
                obtain a building permit regarding this property.<BR><BR></li>

<li>That this property is occupied by the undersigned and undersigned's family. No other persons are
                in possession of this property.<BR><BR></li>

<li>That the marital status of the undersigned is:<strong> Single </strong>______or<strong> Married </strong>_____ .   (NOTE:
                If______ married, the undersigned have not been divorced (even if remarried), unless this fact
                previously has been made known to or its Agent)<BR><BR></li>

<li>That none of the improvements to this property are a mobile home or trailer.<BR><BR></li>

<li>There are no bodies of water (including ponds, marshlands, or streams) located on or abutting the
                property.<BR><BR></li>

<li>OTHER:  _________________________________________________________________________<BR><BR>
_________________________________________________________________________________<BR><BR></li>
<li>OTHER:  _________________________________________________________________________<BR><BR>
_________________________________________________________________________________<BR><BR></li></ol>
<br>
<br>

Wherever used in this Affidavit, the singular shall be construed to mean the plural, and the plural shall be construed to mean the singular, as the case may be.<BR><BR>

<strong>NOTE: If any of the statements above are incomplete, inaccurate, or require further explanation or comments, it is the responsibility of the undersigned to place an "X" in the box below and to provide detailed explanation(s) on an additional page.</strong><BR><BR>


THE PURPOSE OF THIS AFFIDAVIT is to induce Underwriter or its Agent to make and complete settlement on the subject property, and to issue its Policy(ies) of Title Insurance, and we understand that Underwriter and/or its Agent will rely upon the accuracy of the statements contained herein. I/we affirm and state under the penalties of perjury that unless I/we have made written notations on this Affidavit to the contrary, all of the foregoing statements are true and correct to the best of my/our knowledge and belief.<BR><BR>


</td></tr></table></IE:DEVICERECT>


<IE:DEVICERECT ID="page8" CLASS="masterstyle" MEDIA="print">


<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
<br>
<br>
________________________________________________________________<br>
Borrower1 Name<br>
<br>
<br>
________________________________________________________________<br>
Borrower2 Name<br>
<br>
<br>
________________________________________________________________<br>
Borrower3 Name<br>
<br>
<br>
<br>
STATE/DISTRICT OF COUNTY/CITY OF<br>
to wit:<br>
<br>
<br>
On this_______day of______________,________, before me, the undersigned, a Notary for the State/District of<br>
________________________________County/City of_________________________________, personally appeared<br>
______________________________, known to me (or satisfactorily proven) to be the person(s) whose name(s) is/are<br> subscribed to the within instrument bearing the date of________________, and acknowledged that he/she/they have<br>
executed the same for the purpose therein contained.<br>
<br>
<br>
In Witness Whereof, I have hereunto set my hand and official seal.<br>
<br>
<br>
_____________________________<BR>
Notary Public<br>
My Commission Expires:<br><br>
<br>
<br>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
T-<cfoutput>#get_titleid.title_id#</cfoutput><br>


</td></tr></table></IE:DEVICERECT>

</body>
</html>
