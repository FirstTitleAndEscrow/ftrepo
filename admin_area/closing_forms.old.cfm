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
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:w="urn:schemas-microsoft-com:office:word"
xmlns:dt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882"
xmlns="https://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=windows-1252">
<meta name=ProgId content=Word.Document>
<meta name=Generator content="Microsoft Word 10">
<meta name=Originator content="Microsoft Word 10">
<link rel=File-List href="First%20Title%20Forms_files/filelist.xml">
<title>Title Express Word Processing Template</title>
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>First Title &amp; Escrow</o:Author>
  <o:Description>Copyright© 2001, Title Support Services, Inc.&#13;&#10;TSS TitleExpress for Microsoft Word&#13;&#10;All rights reserved.</o:Description>
  <o:Template>FORM</o:Template>
  <o:LastAuthor>fm9fytmf7qkckctv9t29tbbbg</o:LastAuthor>
  <o:Revision>2</o:Revision>
  <o:TotalTime>6</o:TotalTime>
  <o:Created>2003-05-28T02:26:00Z</o:Created>
  <o:LastSaved>2003-05-28T02:26:00Z</o:LastSaved>
  <o:Pages>2</o:Pages>
  <o:Words>3499</o:Words>
  <o:Characters>20120</o:Characters>
  <o:Company>Title Support Services, Inc. 888-268-0422</o:Company>
  <o:Bytes>89088</o:Bytes>
  <o:Lines>574</o:Lines>
  <o:Paragraphs>218</o:Paragraphs>
  <o:CharactersWithSpaces>23401</o:CharactersWithSpaces>
  <o:Version>10.2625</o:Version>
 </o:DocumentProperties>
 <o:CustomDocumentProperties>
  <o:Date_x0020_completed dt:dt="string">03-13-01</o:Date_x0020_completed>
 </o:CustomDocumentProperties>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEvery>
  <w:DisplayVerticalDrawingGridEvery>0</w:DisplayVerticalDrawingGridEvery>
  <w:UseMarginsForDrawingGridOrigin/>
  <w:Compatibility>
   <w:FootnoteLayoutLikeWW8/>
   <w:ShapeLayoutLikeWW8/>
   <w:AlignTablesRowByRow/>
   <w:ForgetLastTabAlignment/>
   <w:LayoutRawTableWidth/>
   <w:LayoutTableRowsApart/>
   <w:UseWord97LineBreakingRules/>
  </w:Compatibility>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
 </w:WordDocument>
</xml><![endif]-->
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;
	mso-font-charset:2;
	mso-generic-font-family:auto;
	mso-font-pitch:variable;
	mso-font-signature:0 268435456 0 0 -2147483648 0;}
@font-face
	{font-family:"Arial Narrow";
	panose-1:2 11 5 6 2 2 2 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:647 0 0 0 159 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-parent:"";
	margin:0in;
	margin-bottom:.0001pt;
	text-align:justify;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
h3
	{mso-style-next:Normal;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.25in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	page-break-after:avoid;
	mso-outline-level:3;
	font-size:8.0pt;
	mso-bidi-font-size:12.0pt;
	font-family:"Times New Roman";
	font-variant:small-caps;
	color:black;
	mso-bidi-font-weight:normal;
	font-style:italic;
	mso-bidi-font-style:normal;
	text-decoration:underline;
	text-underline:single;}
p.MsoHeader, li.MsoHeader, div.MsoHeader
	{margin:0in;
	margin-bottom:.0001pt;
	text-align:justify;
	mso-pagination:widow-orphan;
	tab-stops:center 3.0in right 6.0in;
	font-size:11.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
p.MsoFooter, li.MsoFooter, div.MsoFooter
	{margin:0in;
	margin-bottom:.0001pt;
	text-align:justify;
	mso-pagination:widow-orphan;
	tab-stops:center 3.0in right 6.0in;
	font-size:11.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
p.MsoCaption, li.MsoCaption, div.MsoCaption
	{mso-style-noshow:yes;
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan lines-together;
	page-break-after:avoid;
	tab-stops:right 7.0in;
	font-size:11.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-weight:bold;}
p.MsoTitle, li.MsoTitle, div.MsoTitle
	{margin:0in;
	margin-bottom:.0001pt;
	text-align:center;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	mso-bidi-font-size:16.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:Arial;
	mso-bidi-font-weight:bold;}
p.MsoSignature, li.MsoSignature, div.MsoSignature
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:3.0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan lines-together;
	page-break-after:avoid;
	tab-stops:right 7.0in;
	font-size:11.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
p.MsoBodyText, li.MsoBodyText, div.MsoBodyText
	{margin:0in;
	margin-bottom:.0001pt;
	text-align:justify;
	line-height:150%;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
p.MsoBodyTextIndent2, li.MsoBodyTextIndent2, div.MsoBodyTextIndent2
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.25in;
	margin-bottom:.0001pt;
	text-align:justify;
	text-indent:.25in;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:Arial;
	mso-fareast-font-family:"Times New Roman";}
p.OMClauses, li.OMClauses, div.OMClauses
	{mso-style-name:"OM Clauses";
	margin-top:0in;
	margin-right:0in;
	margin-bottom:6.0pt;
	margin-left:.5in;
	text-align:justify;
	text-indent:-.5in;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
p.OMClausesIndent, li.OMClausesIndent, div.OMClausesIndent
	{mso-style-name:"OM Clauses Indent";
	mso-style-parent:"OM Clauses";
	margin-top:0in;
	margin-right:1.0in;
	margin-bottom:6.0pt;
	margin-left:1.0in;
	text-align:justify;
	text-indent:-.5in;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
p.OMInstruments, li.OMInstruments, div.OMInstruments
	{mso-style-name:"OM Instruments";
	mso-style-parent:"OM Clauses";
	margin-top:0in;
	margin-right:1.0in;
	margin-bottom:6.0pt;
	margin-left:1.0in;
	text-align:justify;
	text-indent:-.5in;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
p.Legal, li.Legal, div.Legal
	{mso-style-name:Legal;
	margin:0in;
	margin-bottom:.0001pt;
	text-align:justify;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
p.Recital, li.Recital, div.Recital
	{mso-style-name:Recital;
	mso-style-parent:Legal;
	margin:0in;
	margin-bottom:.0001pt;
	text-align:justify;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
p.Being, li.Being, div.Being
	{mso-style-name:Being;
	mso-style-parent:Recital;
	margin:0in;
	margin-bottom:.0001pt;
	text-align:justify;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
span.Bold
	{mso-style-name:Bold;
	font-weight:bold;
	mso-bidi-font-weight:normal;}
p.Signatures, li.Signatures, div.Signatures
	{mso-style-name:Signatures;
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	tab-stops:.3in right 225.35pt;
	font-size:12.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";}
@page Section1
	{size:8.5in 11.0in;
	margin:.5in .5in .5in .5in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-paper-source:0;}
div.Section1
	{page:Section1;}
@page Section2
	{size:8.5in 14.0in;
	margin:.8in .5in .5in .5in;
	mso-header-margin:1.0in;
	mso-footer-margin:1.0in;
	mso-paper-source:0;}
div.Section2
	{page:Section2;}
@page Section3
	{size:8.5in 14.0in;
	margin:.8in .5in .5in .5in;
	mso-header-margin:1.0in;
	mso-footer-margin:.5in;
	mso-paper-source:0;}
div.Section3
	{page:Section3;}
@page Section4
	{size:8.5in 14.0in;
	margin:.7in .5in .5in .5in;
	mso-header-margin:1.0in;
	mso-footer-margin:.5in;
	mso-paper-source:0;}
div.Section4
	{page:Section4;}
@page Section5
	{size:8.5in 14.0in;
	margin:.7in .5in .5in .5in;
	mso-header-margin:67.7pt;
	mso-footer-margin:.5in;
	mso-paper-source:0;}
div.Section5
	{page:Section5;}
 /* List Definitions */
 @list l0
	{mso-list-id:798188361;
	mso-list-type:hybrid;
	mso-list-template-ids:1282936264 205541854 67698691 67698693 67698689 67698691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.75in;
	mso-level-number-position:left;
	margin-left:.75in;
	text-indent:-.25in;
	font-family:Symbol;
	mso-fareast-font-family:"Times New Roman";
	mso-bidi-font-family:Arial;
	mso-ansi-font-weight:bold;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
-->
</style>
<!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman";}
</style>
<![endif]-->


</head>

<body lang=EN-US style='tab-interval:.5in'>
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
}
</script>
<p>

<div id=idControls align="center" class="noprint">
 <b>Please use the print button below to print this page (automatic setting included)</b>

 <p><a href="#" onclick=printWindow();><input disabled type="button" value="Print the page"
 onclick="factory.printing.Print(true)"></a>
 <input disabled type="button" value="Page Setup..."
 onclick="factory.printing.PageSetup()">
 <input class=ie55 disabled type="button" value="Print Preview..."
 onclick="factory.printing.Preview()">
<hr size="1" color="dimgray">

</div>

<div class=Section1>

<p class=MsoNormal align=center style='text-align:center'><b><u>ATTORNEY
REPRESENTATION NOTICE</u></b></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal>The Borrower(s) acknowledge(s) that First Title &amp;
Escrow, Inc., has acted only as a representative of the Lender.<span
style='mso-spacerun:yes'>  </span>It has not assisted or rendered legal advice
to the Borrower(s) with respect to the Loan or the Property securing it to the
documents executed in connection with it.<span style='mso-spacerun:yes'>
</span>Borrower(s) may retain personal legal counsel for advice in this
transaction.</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal>DISCLAIMER OF REPRESENTATION OR WARRANTY.<span
style='mso-spacerun:yes'>  </span>Borrower(s) understand(s) that has not
conducted a title search on the Property, and makes no representation or
warranty about condition of the Property or any other matters that might be
revealed from am examination by Borrower(s), of a survey or the Property
itself.<span style='mso-spacerun:yes'>  </span>The Borrower(s) is/are cautioned
to make sure the Deed to Borrower(s) conveys what the Borrower(s) has/have
contracted to purchase (if applicable).</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal>RESPONSIBILITY FOR PAYMENT OF FEES.<span
style='mso-spacerun:yes'>  </span>As part of the obligation of the Borrower(s)
to pay expenses of the Lender in connection with the preparation of the legal
documentation, the Borrower(s) agree(s) to pay, directly to First Title &amp;
Escrow, Inc., at Loan closing, the amount indicated on the Settlement Statement
(HUD-1).</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal>BASIS FOR FEES.<span style='mso-spacerun:yes'>  </span>The
Borrower(s) acknowledge that of the fee collected for the closing on line 1101
of the HUD Settlement Statement, a portion of it may be shared with an attorney
who may have attended your settlement (that was licensed to practice law in the
state in which your property is located).<span style='mso-spacerun:yes'>
</span>The document preparation fee charged by First Title &amp; Escrow, Inc.,
is based a per transaction charge rather than an hourly fee.<span
style='mso-spacerun:yes'>  </span>This fee is intended to provide fair
compensation for the above-described services taking into consideration the
time and labor required, the complexities of the questions involved, and the
skill required to perform said services.<span style='mso-spacerun:yes'>
</span>Other considerations include the expertise of First Title &amp; Escrow,
Inc., in the complexities of the real estate practice, the necessary overhead
associated with the rendering of the said services and the assumption of risk
by First Title &amp; Escrow, Inc., in the rendering of said services.<span
style='mso-spacerun:yes'>  </span>There has been no charge made for any
disclosures required by the Real Estate Settlement and Procedures Act and/or
Truth-In-Lending Act.</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal>Each Borrower and Seller (if applicable) hereby acknowledges
receiving and reading a copy of the Notice, and by her/her/its signature
affirms his/her/its acknowledgment of the accuracy of the above statements.</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='margin-left:3.5in;text-indent:-3.5in;tab-stops:-1.0in'><u><cfoutput>#read_title.bfirstname1#&nbsp;#read_title.blastname1#</cfoutput></u><span
style='mso-tab-count:2'>                              </span><cfif #read_title.slastname1# neq ""><cfoutput>#read_title.sfirstname1#&nbsp;#read_title.slastname1#</cfoutput></u><cfelse>___________________________________</cfif><span
style='mso-tab-count:1'>  </span></p>

<p class=MsoNormal><span style='mso-field-code:" AUTOTEXT Buyer1Name "'>Buyer1Name</span><span
style='mso-tab-count:7'>                                                                            </span><span
style='mso-field-code:" AUTOTEXT Seller1Name "'>Seller1Name</span></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='margin-left:3.5in;text-indent:-3.5in;tab-stops:-1.0in'><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='margin-left:3.5in;text-indent:-3.5in;tab-stops:-1.0in'><cfif #read_title.blastname2# neq ""><cfoutput>#read_title.bfirstname2#&nbsp;#read_title.blastname2#</cfoutput></u><cfelse>___________________________________</cfif><span
style='mso-tab-count:2'>                              </span><cfif #read_title.slastname2# neq ""><cfoutput>#read_title.sfirstname2#&nbsp;#read_title.slastname2#</cfoutput></u><cfelse>___________________________________</cfif></p>

<p class=MsoNormal style='margin-left:3.5in;text-indent:-3.5in;tab-stops:-1.0in'><span
style='mso-field-code:" AUTOTEXT Buyer2Name "'>Buyer2Name</span><span
style='mso-tab-count:2'>                                                                            </span><span
style='mso-field-code:" AUTOTEXT Seller2Name "'>Seller2Name</span></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal>ACKNOWLEDGED, SWORN and SUBSCRIBED to before me this
_______<span style='mso-spacerun:yes'>  </span>day of ______________ , 2003.</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='text-indent:3.5in'>____________________________________</p>

<p class=MsoNormal style='text-indent:3.5in'>Notary Public</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal>My commission expires: ____________</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

</div>

<span style='font-size:11.0pt;mso-bidi-font-size:10.0pt;font-family:"Times New Roman";
mso-fareast-font-family:"Times New Roman";mso-ansi-language:EN-US;mso-fareast-language:
EN-US;mso-bidi-language:AR-SA'><br clear=all style='page-break-before:always;
mso-break-type:section-break'>
</span>

<div class=Section2>

<p class=MsoNormal align=center style='text-align:center'><b><u>CORRECTION
AGREEMENT - LIMITED POWER OF ATTORNEY</u></b></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='text-indent:.5in'>The undersigned Borrower(s), for
and in consideration of Zero Dollars, agree that if requested by Papermaster
&amp; Weltmann, P.C., First Title &amp; Escrow, Inc., to cooperate, adjust and
correct all TYPOGRAPHICAL OR CLERICAL ERRORS discovered in any or all of the
closing documentation executed by the undersigned at settlement.</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='text-indent:.5in'>The undersigned appoint Papermaster
&amp; Weltmann, P.C., First Title &amp; Escrow, Inc., and/or its designee as
their attorney-in fact to correct such errors, place our initials on documents
where changes are made, and/or sign our names to acknowledge any modification
agreement or other document of form correcting such errors.<span
style='mso-spacerun:yes'>  </span>In the event this procedure is utilized, the
party(ies) involved shall be notified and receive a corrected copy of the
changes document(s) from Papermaster &amp; Weltmann, P.C., First Title &amp;
Escrow, Inc.</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='text-indent:.5in'>This Power of Attorney is coupled
with an interest and shall be irrevokable until the loan is satisfied and shall
survive the disability of the undersigned.</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='text-indent:.5in'>AS WITNESS our execution hereof,
this _____day<span style='mso-spacerun:yes'>  </span>of<span
style='mso-spacerun:yes'>  </span>____________________, 2003.</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='text-indent:2.0in'><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='margin-left:3.5in;text-indent:-3.5in;tab-stops:-1.0in'>___________________________________<span
style='mso-tab-count:1'>              </span>____________________________________</p>

<p class=MsoNormal style='margin-left:3.0in'><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='margin-left:3.5in;text-indent:-3.5in;tab-stops:-1.0in'>___________________________________<span
style='mso-tab-count:1'>              </span>____________________________________</p>

<p class=MsoNormal style='margin-left:3.0in'><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal>STATE OF<span
style='mso-spacerun:yes'>
</span>COUNTY, to wit:</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal>I HEREBY CERTIFY, that on this _____ day of
________________________ , 2003, before me, an officer duly authorized in the
state and county aforesaid to take acknowledgments, personally appeared<span
style='mso-spacerun:yes'>  </span>and , known to me or has/have proven to be
the person(s) described in and who executed the foregoing instrument and
acknowledged that he/she/they executed the same for the purposes therein
expressed.</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal>WITNESS MY HAND AND OFFICIAL SEAL this _____ day of<span
style='mso-spacerun:yes'>  </span>__________________ , 2003.</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal>________________________________________</p>

<p class=MsoNormal><span
style='mso-spacerun:yes'>
</span>Notary Public</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal>My Commission Expires:____________________</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

</div>

<span style='font-size:11.0pt;mso-bidi-font-size:10.0pt;font-family:"Times New Roman";
mso-fareast-font-family:"Times New Roman";mso-ansi-language:EN-US;mso-fareast-language:
EN-US;mso-bidi-language:AR-SA'><br clear=all style='page-break-before:always;
mso-break-type:section-break'>
</span>

<div class=Section3>

<p class=MsoNormal align=center style='text-align:center'><b><u><span
style='font-size:12.5pt'>FINAL DISBURSEMENT<o:p></o:p></span></u></b></p>

<p class=MsoNormal align=center style='text-align:center'><b><u><span
style='font-size:12.5pt'>and<o:p></o:p></span></u></b></p>

<p class=MsoNormal align=center style='text-align:center'><b><u><span
style='font-size:12.5pt'>RECONCILIATION AGREEMENT</span></u></b><span
style='font-size:12.5pt'><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:12.5pt'>Borrower:<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:12.5pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:12.5pt'>The borrower(s) herein agree
that this loan and its final disbursement are expressly contingent on
Papermaster &amp; Weltmann, P.C./First Title &amp; Escrow, Inc., receiving an
updated title report which reflects no liens or encumbrances which have
occurred within six (6) months of the date of settlement.<span
style='mso-spacerun:yes'>  </span>I/we fully understand that if the title
report reveals any such lien, judgment, or encumbrance which would be
subordinate and this loan has not already funded, this Deed of Trust/Mortgage
would be declared null and void and final disbursement of this loan and any
proceeds thereof may not occur.<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:12.5pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:12.5pt'>This loan is to be a first
trust mortgage<span style='mso-spacerun:yes'>  </span>(<span
style='mso-spacerun:yes'>  </span>)<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:12.5pt'>This loan is to be a second
trust mortgage<span style='mso-spacerun:yes'>  </span>(<span
style='mso-spacerun:yes'>  </span>)<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:12.5pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:12.5pt'>Whereas, the undersigned,
jointly and severally, promises to pay to the order of Papermaster &amp;
Weltmann, P.C./First Title &amp; Escrow, Inc., (Its assignees and successors in
interest) the principal sum equal to the total amount of any Shortages on
Mortgages and/or Judgment payoffs.<span style='mso-spacerun:yes'>  </span>The
Borrower hereby understands that this debt is their sole responsibility.<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:12.5pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:12.5pt'>Real Estate tax information
is provided to Papermaster &amp; Weltmann, P.C./First Title &amp; Escrow, Inc.,
from the Tax Assessment Office.<span style='mso-spacerun:yes'>
</span>Papermaster &amp; Weltmann, P.C./First Title &amp; Escrow, Inc., relies
upon this information.<span style='mso-spacerun:yes'>  </span>If, in the event
this information is not true and correct the borrower will be held responsible
to pay any and all taxes due.<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:12.5pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:12.5pt'>Stopped payments on checks
and/or checks being returned for insufficient funds, and/or reasons of similar
nature.<span style='mso-spacerun:yes'>  </span>The terms of the Agreement shall
be on demand.<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:12.5pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:12.5pt'>The undersigned severally
waives presentment, protest and demand, notice of protest, demand, dishonor and
nonpayment of the Agreement and agrees to pay all costs of collection,
including the aforesaid reasonable attorneys fees and to perform and comply
with each of the covenants, provisions and agreements of the undersigned
contained in every Instrument evidencing or securing Indebtedness.<span
style='mso-spacerun:yes'>  </span>No extension of time for the payments of this
Agreement made by agreement with any person now or hereafter liable for the
payment of the agreement shall operate to release, discharge, modify, change,
or effect the original liability under this Agreement, either in whole or in
part.<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:12.5pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='margin-left:3.5in;text-indent:-3.5in;tab-stops:-1.0in'><span
style='font-size:12.5pt'>______________________________<span style='mso-tab-count:
1'>                 </span>__________________________________<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:3.0in;text-indent:-1.0in;tab-stops:-1.0in'><span
style='font-size:12.5pt'><span style='mso-spacerun:yes'> </span><span
style='mso-tab-count:1'>                       </span><span
style='mso-spacerun:yes'>            </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:12.5pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='margin-left:3.5in;text-indent:-3.5in;tab-stops:-1.0in'><span
style='font-size:12.5pt'>______________________________<span style='mso-tab-count:
1'>                 </span>__________________________________<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:3.0in;text-indent:-1.0in;tab-stops:-1.0in'><span
style='font-size:12.5pt'><span style='mso-spacerun:yes'> </span><span
style='mso-tab-count:1'>                       </span><span
style='mso-spacerun:yes'>            </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:12.5pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:12.5pt'>State of<span
style='mso-spacerun:yes'>
</span>County, to wit:<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:12.5pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:12.5pt'>I HEREBY CERTIFY, that on
this ______ day of _________________ , 2001, before me, an officer duly
authorized in the state and county aforesaid to take acknowledgments,
personally appeared<span style='mso-spacerun:yes'>  </span>and , known to me or
has/have proven to be the person(s) described in and who executed the foregoing
instrument and acknowledged that they executed the same for the purposes
therein expressed.<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:12.5pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:12.5pt'>WIT NESS MY HAND AND OFFICIAL
SEAL this ______ day of<span style='mso-spacerun:yes'>  </span>_______________,
2003.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:2.5in;text-indent:-.5in'><span
style='font-size:12.5pt'><span
style='mso-spacerun:yes'>
</span>______________________________________________<span
style='mso-spacerun:yes'>
</span><span style='mso-spacerun:yes'>          </span>Notary Public<o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:12.5pt'>My commission expires:</span></p>

</div>

<span style='font-size:11.0pt;mso-bidi-font-size:10.0pt;font-family:"Times New Roman";
mso-fareast-font-family:"Times New Roman";mso-ansi-language:EN-US;mso-fareast-language:
EN-US;mso-bidi-language:AR-SA'><br clear=all style='page-break-before:always;
mso-break-type:section-break'>
</span>

<div class=Section4>

<p class=MsoNormal align=center style='text-align:center'><b><u>OWNER/SELLER
AFFIDAVIT</u></b><u><o:p></o:p></u></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal align=center style='text-align:center'>(To induce sale of
and/or loan on premises and title insurance coverage)</p>

<p class=MsoNormal align=center style='text-align:center'><o:p>&nbsp;</o:p></p>

<p class=MsoNormal>STATE OF __________________________________________________</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal>CITY/COUNTY OF____________________________________________</p>

<p class=MsoNormal align=center style='text-align:center'><o:p>&nbsp;</o:p></p>

<p class=MsoNormal>The undersigned, being first duly sworn on oath, depose(s)
and say(s):</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='text-indent:.5in'>1.<span style='mso-spacerun:yes'>
</span>THAT Affiant(s) is/are the record titleholder(s) of the property known
and described as follows:<span style='mso-spacerun:yes'>       </span></p>

<p class=MsoNormal style='text-indent:1.0in'><span
style='mso-spacerun:yes'>     </span></p>

<p class=MsoNormal style='text-indent:.5in'>2.<span style='mso-spacerun:yes'>
</span><u>As to Mechanics liens:</u> THAT at no time within 120 days of the
date hereof has any</p>

<p class=MsoNormal>work, services, or labor been done, or any fixtures,
apparatus or material been furnished in</p>

<p class=MsoNormal>connection with, or to, the said premises, except such
material, fixtures, work, apparatus, labor,</p>

<p class=MsoNormal>or services as have been fully and completely paid for; that
there is no indebtedness to anyone </p>

<p class=MsoNormal>for any labor, fixtures, apparatus, material, services, or
in connection with, the said premises;</p>

<p class=MsoNormal>that there is no claim or indebtedness; that there is no
mechanics lien claim against said</p>

<p class=MsoNormal>premises, whether of record or otherwise;</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='text-indent:.5in'>3.<span style='mso-spacerun:yes'>
</span><u>As to contracts &amp; conveyances:</u> THAT no agreement or contract
for conveyance, or deed, conveyance, written lease, or writing whatsoever, is
in existence, adversely affecting the title to premises, except that in connection
with which this affidavit is given;</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='text-indent:.5in'>4.<span style='mso-spacerun:yes'>
</span><u>As to possession:</u> THAT there are no parties in possession of said
premises other than the undersigned;</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='text-indent:.5in'>5.<span style='mso-spacerun:yes'>
</span><u>As to judgments:</u> THAT no judgment or decree has been entered in
any court of the state of the United States against said Affiant(s) and which
remains unsatisfied; THAT no proceedings in bankruptcy have ever been
instituted by or against the Deponent(s) in any court, or before any office of
any state;</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='text-indent:.5in'>6.<span style='mso-spacerun:yes'>
</span><u>As to marital status:</u> THAT the undersigned is/are single/married
(if married and spouse is joining in subject deed/deed of trust, spouse must
also join herein);</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='text-indent:.5in'>7.<span style='mso-spacerun:yes'>
</span><u>As to taxes and assessments:</u> THAT there are no unpaid of
delinquent real estate taxes or assessments against said premises; further,
that there is no unpaid of delinquent water or</p>

<p class=MsoNormal>sewer service charges against said premises;</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='text-indent:.5in'><span style='mso-spacerun:yes'>
</span>Also, that the undersigned has not/have not received notice, nor known
of any recent or future planned improvements (such as street paving, sidewalks,
street lighting, surface drainage, etc.)<span style='mso-spacerun:yes'>
</span>that will or might result in a special assessment against this property;</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='text-indent:.5in'>8.<span style='mso-spacerun:yes'>
</span>THAT this Affidavit is made to induce the purchase and/or a loan secured
by the premises described herein and to the issuance of a title insurance policy
relating to the same;</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='text-indent:.5in'>9.<span style='mso-spacerun:yes'>
</span>THAT Affiant(s) further state(s) that he/she/they is/are each familiar
with the nature of an oath; and with the penalties as provided by the laws of
the state aforesaid for falsely swearing to statements made in an instrument of
this nature, Affiant(s) further certify that he/she/they has/have heard/read to
the Affiant(s) the full facts of this Affidavit, and understand its
contents.<span style='mso-spacerun:yes'>   </span></p>

<p class=MsoNormal style='text-indent:.5in'>FURTHER YOUR AFFIANT(S) SAYETH
NAUGHT</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='margin-left:3.5in;text-indent:-3.5in;tab-stops:-1.0in'>______________________________________<span
style='mso-tab-count:1'>        </span>___________________________________</p>

<p class=MsoNormal style='margin-left:3.0in'><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='margin-left:3.5in;text-indent:-3.5in;tab-stops:-1.0in'>_______________________________________<span
style='mso-tab-count:1'>      </span>____________________________________</p>

<p class=MsoNormal style='margin-left:3.0in'><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='text-indent:1.0in'><span
style='mso-spacerun:yes'>      </span></p>

<p class=MsoNormal>ACKNOWLEDGED, SUBSCRIBED and SWORN TO before me this _____
day of _________________, 2003.</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal>My commission expires:<span
style='mso-spacerun:yes'>                  </span>____________________________________________</p>

<p class=MsoNormal><span style='mso-spacerun:yes'>       </span><span
style='mso-tab-count:5'>                                                     </span><span
style='mso-spacerun:yes'> </span>Notary Public</p>

</div>

<span style='font-size:11.0pt;mso-bidi-font-size:10.0pt;font-family:"Times New Roman";
mso-fareast-font-family:"Times New Roman";mso-ansi-language:EN-US;mso-fareast-language:
EN-US;mso-bidi-language:AR-SA'><br clear=all style='page-break-before:always;
mso-break-type:section-break'>
</span>

<div class=Section5>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal align=center style='margin-right:-27.0pt;text-align:center'><b><span
style='font-size:14.0pt'>FIRST TITLE &amp; ESCROW, INC.<o:p></o:p></span></b></p>

<p class=MsoNormal align=center style='margin-right:-27.0pt;text-align:center'><b><span
style='font-size:14.0pt'>Papermaster &amp; Weltmann, P.C.<o:p></o:p></span></b></p>

<cfif NOT DateDiff("d", Now(), "1/30/2012")>
<p class=MsoNormal align=center style='margin-right:-27.0pt;text-align:center'><b><span
style='font-size:14.0pt'>30 West Gude Drive, suite 450<o:p></o:p></span></b></p>

<p class=MsoNormal align=center style='margin-right:-27.0pt;text-align:center'><b><span
style='font-size:14.0pt'>ROCKVILLE, MARYLAND 20850<o:p></o:p></span></b></p>
<cfelse>
<p class=MsoNormal align=center style='margin-right:-27.0pt;text-align:center'><b><span
style='font-size:14.0pt'>7361 Calhoun Place, Suite 200<o:p></o:p></span></b></p>

<p class=MsoNormal align=center style='margin-right:-27.0pt;text-align:center'><b><span
style='font-size:14.0pt'>ROCKVILLE, MARYLAND 20855<o:p></o:p></span></b></p>
</cfif>
<p class=MsoNormal align=center style='margin-right:-27.0pt;text-align:center'><b><span
style='font-size:14.0pt'>866-484-8537<o:p></o:p></span></b></p>

<p class=MsoNormal align=center style='margin-right:-27.0pt;text-align:center'><b><span
style='font-size:14.0pt'>FAX: 866-484-8538<o:p></o:p></span></b></p>

<p class=MsoNormal style='margin-right:-27.0pt'><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='margin-right:-27.0pt;tab-stops:center 247.5pt'><span
style='mso-tab-count:1'>                                                                                   </span></p>

<p class=MsoNormal style='margin-right:-27.0pt'><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='margin-right:-27.0pt'><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='margin-right:-27.0pt'><b><o:p>&nbsp;</o:p></b></p>

<p class=MsoNormal style='margin-right:-27.0pt'><b><o:p>&nbsp;</o:p></b></p>

<p class=MsoNormal style='margin-right:-27.0pt'><b><span style='font-family:
"Arial Narrow"'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='margin-top:0in;margin-right:-27.0pt;margin-bottom:
0in;margin-left:3.0in;margin-bottom:.0001pt'><span style='font-family:"Arial Narrow"'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=center style='text-align:center'><span
style='mso-field-code:"date \\\@ \0022MMMM d\, yyyy\0022"'><span
style='mso-no-proof:yes'>May 27, 2003</span></span></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><!--[if supportFields]><b style='mso-bidi-font-weight:normal'><span
style='color:red'><span style='mso-element:field-begin'></span><span
style='mso-spacerun:yes'> </span>ASK Which &quot;PAYOFF TO:<span
style='mso-spacerun:yes'>
</span>1&nbsp;=&nbsp;<span style='mso-field-code:" AUTOTEXT PayoffLender1Name "'>PayoffLender1Name</span><span
style='mso-spacerun:yes'>    </span>2&nbsp;=&nbsp;<span style='mso-field-code:
" AUTOTEXT PayoffLender2Name "'>PayoffLender2Name</span>&quot; <span
style='mso-element:field-separator'></span><span style='mso-bookmark:Which'>1</span></span></b><![endif]--><b
style='mso-bidi-font-weight:normal'><span style='color:red'><![if !supportNestedAnchors]><a
name=Which></a><![endif]></span></b><!--[if supportFields]><b style='mso-bidi-font-weight:
normal'><span style='color:red'><span style='mso-element:field-end'></span></span></b><![endif]--><!--[if supportFields]><b
style='mso-bidi-font-weight:normal'><span style='mso-element:field-begin'></span>
<o:p></o:p></b></p>

<p class=MsoNormal><b style='mso-bidi-font-weight:normal'><span
style='mso-spacerun:yes'> </span></b><![endif]--><!--[if supportFields]><b
style='mso-bidi-font-weight:normal'><span style='mso-element:field-end'></span></b><![endif]--><!--[if supportFields]><span
style='mso-element:field-begin'></span><span
style='mso-spacerun:yes'> </span>if <span style='mso-field-code:" REF Which  "'><b
style='mso-bidi-font-weight:normal'><span style='color:red'>1</span></b></span>=&quot;1&quot;
&quot;<span style='mso-field-code:" AUTOTEXT PayoffLender1Name "'>PayoffLender1Name</span></p>

<p class=MsoNormal><span style='mso-field-code:" AUTOTEXT PayoffLender1Address1 "'>PayoffLender1Address1</span><span
style='mso-element:field-begin'></span> IF<span style='mso-field-code:" AUTOTEXT PayoffLender1Address2 "'>PayoffLender1Address2</span>&lt;&gt;
&quot;&quot; &quot;, <span style='mso-field-code:" AUTOTEXT PayoffLender1Address2 "'>PayoffLender1Address2</span>&quot;
<span style='mso-element:field-separator'></span><span style='mso-no-proof:
yes'>, <span style='mso-field-code:" AUTOTEXT PayoffLender1Address2 "'>PayoffLender1Address2</span></span><span
style='mso-element:field-end'></span></p>

<p class=MsoNormal><span style='mso-field-code:" AUTOTEXT PayoffLender1C\/S\/Z "'>PayoffLender1C/S/Z</span>&quot;
&quot;<span style='mso-element:field-begin'></span> if <span style='mso-field-code:
" REF Which  "'><b style='mso-bidi-font-weight:normal'>&nbsp;</b></span>=&quot;2&quot;
&quot;<span style='mso-field-code:" AUTOTEXT PayoffLender2Name "'>PayoffLender1Name</span></p>

<p class=MsoNormal><span style='mso-field-code:" AUTOTEXT PayoffLender2Address1 "'>PayoffLender1Address1</span><span
style='mso-element:field-begin'></span> IF<span style='mso-field-code:" AUTOTEXT PayoffLender2Address2 "'>PayoffLender1Address2</span>&lt;&gt;
&quot;&quot; &quot;, <span style='mso-field-code:" AUTOTEXT PayoffLender2Address2 "'>PayoffLender1Address2</span>&quot;
<span style='mso-element:field-separator'></span><span style='mso-no-proof:
yes'>PayoffLender1Address2</span><span style='mso-element:field-end'></span></p>

<p class=MsoNormal><span style='mso-field-code:" AUTOTEXT PayoffLender2C\/S\/Z "'>PayoffLender1C/S/Z</span>&quot;
&quot;<span style='mso-field-code:" REF Which \\* charformat "'>&nbsp;</span>&quot;
<span style='mso-element:field-separator'></span><span style='mso-no-proof:
yes'>&nbsp;</span><span style='mso-element:field-end'></span>&quot; <![endif]--><!--[if supportFields]><span
style='mso-element:field-end'></span><![endif]--><b style='mso-bidi-font-weight:
normal'><o:p></o:p></b></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal>Re:<b style='mso-bidi-font-weight:normal'><span
style='mso-tab-count:1'>       </span></b><b style='mso-bidi-font-weight:normal'><span
style='font-size:10.0pt'>PAYOFF LETTER AND REQUEST FOR RELEASE OF LIEN</span></b><span
style='font-size:10.0pt'><o:p></o:p></span></p>

<p class=MsoNormal><span style='mso-tab-count:1'>            </span>Loan
Number:<span style='mso-tab-count:1'>   </span><!--[if supportFields]><span
style='mso-element:field-begin'></span> if <span style='mso-field-code:" REF Which  "'><b
style='mso-bidi-font-weight:normal'><span style='color:red'>1</span></b></span>=&quot;1&quot;
&quot;<span style='mso-field-code:" AUTOTEXT PayoffLender1LoanNumber "'>PayoffLender1LoanNumber</span>&quot;
&quot;<span style='mso-element:field-begin'></span> if <span style='mso-field-code:
" REF Which  "'><b style='mso-bidi-font-weight:normal'>&nbsp;</b></span>=&quot;2&quot;
&quot;<span style='mso-field-code:" AUTOTEXT PayoffLender2LoanNumber "'>PayoffLender1LoanNumber</span>&quot;
&quot;@&quot; <span style='mso-element:field-separator'></span><span
style='mso-no-proof:yes'>@</span><span style='mso-element:field-end'></span>&quot;
<span style='mso-element:field-separator'></span><![endif]--><span
style='mso-no-proof:yes'>PayoffLender1LoanNumber</span><!--[if supportFields]><span
style='mso-element:field-end'></span><![endif]--></p>

<p class=MsoNormal style='margin-left:2.0in;text-indent:-1.0in'>Borrower<!--[if supportFields]><span
style='mso-element:field-begin'></span> IF <span style='mso-field-code:" AUTOTEXT Seller1Name "'>Seller1Name</span>=&quot;&quot;
&quot;<span style='mso-element:field-begin'></span> IF <span style='mso-field-code:
" AUTOTEXT Buyer2Name "'>Betty Brown</span>=&quot;&quot; &quot;&quot;
&quot;s&quot;<span style='mso-element:field-separator'></span>(Deponents)<span
style='mso-element:field-end'></span>&quot; &quot;<span style='mso-element:
field-begin'></span> IF <span style='mso-field-code:" AUTOTEXT Seller2Name "'>Seller2Name</span>=&quot;&quot;
&quot;&quot; &quot;s&quot; <span style='mso-element:field-separator'></span><span
style='mso-no-proof:yes'>s</span><span style='mso-element:field-end'></span>&quot;
<span style='mso-element:field-separator'></span><![endif]--><span
style='mso-no-proof:yes'>s</span><!--[if supportFields]><span style='mso-element:
field-end'></span><![endif]-->:<span style='mso-tab-count:1'>        </span><!--[if supportFields]><span
style='mso-element:field-begin'></span> IF <span style='mso-field-code:" AUTOTEXT Seller1Name "'>Seller1Name</span>=&quot;&quot;
&quot;<span style='mso-field-code:" AUTOTEXT Buyer1Name "'>Buyer1Name</span><span
style='mso-element:field-begin'></span> if <span style='mso-field-code:" autotext Buyer3Name "'>Buyer3Name</span>=&quot;&quot;
&quot;<span style='mso-element:field-begin'></span> if <span style='mso-element:
field-begin'></span><span style='mso-spacerun:yes'> </span>autotext Buyer2Name <span
style='mso-element:field-end'></span>=&quot;&quot; &quot;&quot; &quot; and
&quot; <span style='mso-element:field-end'></span>&quot; &quot;, &quot; <span
style='mso-element:field-separator'></span><span style='mso-no-proof:yes'>, </span><span
style='mso-element:field-end'></span><span style='mso-field-code:" autotext Buyer2Name "'>Buyer2Name</span><span
style='mso-element:field-begin'></span> if <span style='mso-field-code:" autotext Buyer4Name "'>Buyer4Name</span>=&quot;&quot;
&quot;<span style='mso-element:field-begin'></span> if <span style='mso-field-code:
" autotext Buyer3Name "'>Buyer4Name</span>=&quot;&quot; &quot;&quot; &quot; and
&quot; <span style='mso-element:field-separator'></span><span style='mso-no-proof:
yes'><span style='mso-spacerun:yes'> </span></span><span style='mso-element:
field-end'></span>&quot; &quot;, &quot; <span style='mso-element:field-separator'></span><span
style='mso-no-proof:yes'>, </span><span style='mso-element:field-end'></span><span
style='mso-field-code:" autotext Buyer3name "'>Buyer3Name</span><span
style='mso-element:field-begin'></span> if <span style='mso-field-code:" autotext Buyer4Name "'>Buyer4Name</span>=&quot;&quot;
&quot;&quot; &quot; and <span style='mso-field-code:" autotext Buyer4Name "'>Buyer4Name</span>&quot;
<span style='mso-element:field-separator'></span><span style='mso-no-proof:
yes'><span style='mso-spacerun:yes'> </span>and <span style='mso-field-code:
" autotext Buyer4Name "'>Buyer4Name</span></span><span style='mso-element:field-end'></span>&quot;
&quot;<span style='mso-field-code:" AUTOTEXT Seller1Name "'>Seller1Name</span><span
style='mso-element:field-begin'></span> if <span style='mso-field-code:" autotext Seller3Name "'>Seller3Name</span>=&quot;&quot;
&quot;<span style='mso-element:field-begin'></span> if <span style='mso-element:
field-begin'></span><span style='mso-spacerun:yes'> </span>autotext Seller2Name
<span style='mso-element:field-end'></span>=&quot;&quot; &quot;&quot; &quot;
and &quot; <span style='mso-element:field-end'></span>&quot; &quot;, &quot; <span
style='mso-element:field-separator'></span><span style='mso-no-proof:yes'>, </span><span
style='mso-element:field-end'></span><span style='mso-field-code:" autotext Seller2Name "'>Seller2Name</span><span
style='mso-element:field-begin'></span> if <span style='mso-field-code:" autotext Seller4Name "'>Seller4Name</span>=&quot;&quot;
&quot;<span style='mso-element:field-begin'></span> if <span style='mso-field-code:
" autotext Seller3Name "'>Buyer4Name</span>=&quot;&quot; &quot;&quot; &quot;
and &quot; <span style='mso-element:field-separator'></span><span
style='mso-no-proof:yes'><span style='mso-spacerun:yes'> </span></span><span
style='mso-element:field-end'></span>&quot; &quot;, &quot; <span
style='mso-element:field-separator'></span><span style='mso-no-proof:yes'>, </span><span
style='mso-element:field-end'></span><span style='mso-field-code:" autotext Seller3name "'><b>Error!
AutoText entry not defined.</b></span><span style='mso-element:field-begin'></span>
if <span style='mso-field-code:" autotext Seller4Name "'><b>Error! AutoText
entry not defined.</b></span>=&quot;&quot; &quot;&quot; &quot; and <span
style='mso-field-code:" autotext Seller4Name "'><b>Error! AutoText entry not
defined.</b></span>&quot; <span style='mso-element:field-separator'></span><span
style='mso-no-proof:yes'><span style='mso-spacerun:yes'> </span>and <b>Error!
Au</b></span><span style='mso-element:field-end'></span>&quot;<![endif]--><!--[if supportFields]><span
style='mso-element:field-end'></span><![endif]--></p>

<p class=MsoNormal><span style='mso-tab-count:1'>            </span>Premises:<span
style='mso-tab-count:1'>          </span><span style='mso-field-code:" AUTOTEXT PropertyAddressCSZ "'>PropertyAddressCSZ</span></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal>Dear Sir or Madam:</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal>Enclosed is a check in the amount of $<!--[if supportFields]><span
class=Bold><span style='mso-element:field-begin'></span> if <span
style='mso-element:field-begin'></span><span
style='mso-spacerun:yes'> </span>REF Which<span style='mso-spacerun:yes'>
</span><span style='mso-element:field-separator'></span></span><b
style='mso-bidi-font-weight:normal'><span style='color:red'>1</span><span
class=Bold><span style='mso-element:field-end'></span>=&quot;1&quot; &quot;<span
style='mso-element:field-begin'></span> if <span style='mso-element:field-begin'></span><span
style='mso-spacerun:yes'> </span>AUTOTEXT PayoffLender1Amount <span
style='mso-element:field-separator'></span>PayoffLender1Amount<span
style='mso-element:field-end'></span>=&quot;.00&quot; &quot;<span
style='mso-element:field-begin'></span> ASK A &quot;Amount of Check
Enclosed<span style='mso-spacerun:yes'>
</span>(w/o&nbsp;$&nbsp;symbol)&quot; \d &quot;&quot;<span style='mso-element:
field-end'></span><span style='mso-element:field-begin'></span> REF A \*
charformat<span style='mso-spacerun:yes'>  </span><span style='mso-element:
field-separator'></span>Error! Reference source not found.<span
style='mso-element:field-end'></span>&quot; &quot;<span style='mso-element:
field-begin'></span> AUTOTEXT PayoffLender1Amount <span style='mso-element:
field-separator'></span>PayoffLender1Amount<span style='mso-element:field-end'></span>&quot;
<span style='mso-element:field-separator'></span><span style='mso-no-proof:
yes'>PayoffLender1Amount</span><span style='mso-element:field-end'></span>&quot;
&quot;<span style='mso-element:field-begin'></span> if <span style='mso-element:
field-begin'></span><span style='mso-spacerun:yes'> </span>AUTOTEXT
PayoffLender2Amount <span style='mso-element:field-separator'></span>PayoffLender1Amount<span
style='mso-element:field-end'></span>=&quot;.00&quot; &quot;<span
style='mso-element:field-begin'></span> ASK A2 &quot;Amount of Check
Enclosed<span style='mso-spacerun:yes'>
</span>(w/o&nbsp;$&nbsp;symbol)&quot; \d &quot;&quot;<span style='mso-element:
field-end'></span><span style='mso-element:field-begin'></span> REF A2 \*
charformat<span style='mso-spacerun:yes'>  </span><span style='mso-element:
field-separator'></span>Error! Reference source not found.<span
style='mso-element:field-end'></span>&quot; &quot;<span style='mso-element:
field-begin'></span> AUTOTEXT PayoffLender2Amount <span style='mso-element:
field-separator'></span>PayoffLender1Amount<span style='mso-element:field-end'></span>&quot;
<span style='mso-element:field-separator'></span>PayoffLender1Amount<span
style='mso-element:field-end'></span>&quot; <span style='mso-element:field-separator'></span></span></b><![endif]--><span
class=Bold><span style='mso-no-proof:yes'><cfoutput><cfif #read_hud.a_104_b# neq "" OR #read_hud.a_105_b#>#read_hud.a_104_b#-#read_hud.a_105_b#<cfelse>#read_hud.a_504#-#read_hud.a_505#</cfif></cfoutput> Amount</span></span><!--[if supportFields]><span
class=Bold><span style='mso-element:field-end'></span></span><![endif]--> made
payable to your institution and which represents the full and final payment of
the above-reference loan. Please cancel the loan immediately and promptly
execute and forward the Paid and Canceled Note to the undersigned.</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal>The Borrower<!--[if supportFields]><span style='mso-element:
field-begin'></span> IF <span style='mso-field-code:" AUTOTEXT Seller1Name "'>Seller1Name</span>=&quot;&quot;
&quot;<span style='mso-element:field-begin'></span> IF <span style='mso-field-code:
" AUTOTEXT Buyer2Name "'>Betty Brown</span>=&quot;&quot; &quot;&quot;
&quot;s&quot;<span style='mso-element:field-separator'></span>(Deponents)<span
style='mso-element:field-end'></span>&quot; &quot;<span style='mso-element:
field-begin'></span> IF <span style='mso-field-code:" AUTOTEXT Seller2Name "'>Seller2Name</span>=&quot;&quot;
&quot;&quot; &quot;s&quot; <span style='mso-element:field-separator'></span><span
style='mso-no-proof:yes'>s</span><span style='mso-element:field-end'></span>&quot;
<span style='mso-element:field-separator'></span><![endif]--><span
style='mso-no-proof:yes'>s</span><!--[if supportFields]><span style='mso-element:
field-end'></span><![endif]-->, by signing <!--[if supportFields]><span
style='mso-element:field-begin'></span><span
style='mso-spacerun:yes'> </span>IF <span style='mso-field-code:" AUTOTEXT Seller1Name "'>Seller1Name</span>=&quot;&quot;
&quot;<span style='mso-element:field-begin'></span> IF <span style='mso-field-code:
" AUTOTEXT Buyer2Name "'>Betty Brown</span>=&quot;&quot; &quot;<span
style='mso-element:field-begin'></span> IF <span style='mso-field-code:" AUTOTEXT Buyer1Type "'>M</span>=&quot;C&quot;
&quot;its&quot; &quot;<span style='mso-element:field-begin'></span> IF <span
style='mso-field-code:" AUTOTEXT Buyer1Type "'>M</span>=&quot;M&quot;
&quot;his&quot; &quot;her&quot; <span style='mso-element:field-separator'></span>he<span
style='mso-element:field-end'></span>&quot; <span style='mso-element:field-separator'></span>he<span
style='mso-element:field-end'></span>&quot; &quot;their&quot; <span
style='mso-element:field-separator'></span>they<span style='mso-element:field-end'></span>&quot;
&quot;<span style='mso-element:field-begin'></span> IF <span style='mso-field-code:
" AUTOTEXT Seller2Name "'>Seller2Name</span>=&quot;&quot; &quot;<span
style='mso-element:field-begin'></span> IF <span style='mso-field-code:" AUTOTEXT Seller1Type "'>F</span>=&quot;C&quot;
&quot;its&quot; &quot;<span style='mso-element:field-begin'></span> IF <span
style='mso-field-code:" AUTOTEXT Seller1Type "'>F</span>=&quot;M&quot;
&quot;his&quot; &quot;her&quot; <span style='mso-element:field-separator'></span>she<span
style='mso-element:field-end'></span>&quot; <span style='mso-element:field-separator'></span>she<span
style='mso-element:field-end'></span>&quot; &quot;their&quot; <span
style='mso-element:field-separator'></span><span style='mso-no-proof:yes'>their</span><span
style='mso-element:field-end'></span>&quot; <span style='mso-element:field-separator'></span><![endif]--><span
style='mso-no-proof:yes'>their</span><!--[if supportFields]><span
style='mso-element:field-end'></span><![endif]--> name<!--[if supportFields]><span
style='mso-element:field-begin'></span> IF <span style='mso-field-code:" AUTOTEXT Seller1Name "'>Seller1Name</span>=&quot;&quot;
&quot;<span style='mso-element:field-begin'></span> IF <span style='mso-field-code:
" AUTOTEXT Buyer2Name "'>Betty Brown</span>=&quot;&quot; &quot;&quot;
&quot;s&quot;<span style='mso-element:field-separator'></span>(Deponents)<span
style='mso-element:field-end'></span>&quot; &quot;<span style='mso-element:
field-begin'></span> IF <span style='mso-field-code:" AUTOTEXT Seller2Name "'>Seller2Name</span>=&quot;&quot;
&quot;&quot; &quot;s&quot; <span style='mso-element:field-separator'></span><span
style='mso-no-proof:yes'>s</span><span style='mso-element:field-end'></span>&quot;
<span style='mso-element:field-separator'></span><![endif]--><span
style='mso-no-proof:yes'>s</span><!--[if supportFields]><span style='mso-element:
field-end'></span><![endif]--> below, acknowledge<!--[if supportFields]><span
style='mso-element:field-begin'></span> IF <span style='mso-field-code:" AUTOTEXT Seller1Name "'>Seller1Name</span>=&quot;&quot;
&quot;<span style='mso-element:field-begin'></span> IF <span style='mso-field-code:
" AUTOTEXT Buyer2Name "'>Betty Brown</span>=&quot;&quot; &quot;s&quot;
&quot;&quot;<span style='mso-element:field-separator'></span>(Deponents)<span
style='mso-element:field-end'></span>&quot; &quot;<span style='mso-element:
field-begin'></span> IF <span style='mso-field-code:" AUTOTEXT Seller2Name "'>Seller2Name</span>=&quot;&quot;
&quot;s&quot; &quot;&quot; <span style='mso-element:field-end'></span>&quot; <![endif]--><!--[if supportFields]><span
style='mso-element:field-end'></span><![endif]--><span
style='mso-spacerun:yes'> </span>that the loan is to be paid in full and
consent<!--[if supportFields]><span style='mso-element:field-begin'></span> IF <span
style='mso-field-code:" AUTOTEXT Seller1Name "'>Seller1Name</span>=&quot;&quot;
&quot;<span style='mso-element:field-begin'></span> IF <span style='mso-field-code:
" AUTOTEXT Buyer2Name "'>Betty Brown</span>=&quot;&quot; &quot;s&quot;
&quot;&quot;<span style='mso-element:field-separator'></span>(Deponents)<span
style='mso-element:field-end'></span>&quot; &quot;<span style='mso-element:
field-begin'></span> IF <span style='mso-field-code:" AUTOTEXT Seller2Name "'>Seller2Name</span>=&quot;&quot;
&quot;s&quot; &quot;&quot; <span style='mso-element:field-end'></span>&quot; <![endif]--><!--[if supportFields]><span
style='mso-element:field-end'></span><![endif]--><span
style='mso-spacerun:yes'> </span>to its cancellation and satisfaction.</p>

<p class=MsoNormal style='mso-pagination:none'><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='mso-pagination:none'>Please forward the Release to
our office at the above listed address attention to Release Recording
Department.<span style='mso-spacerun:yes'>  </span>Please notify this office at
once if the amount enclosed is insufficient to satisfy the loan in full.</p>

<p class=MsoNormal style='mso-pagination:none'><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='mso-pagination:none;tab-stops:3.5in right 472.5pt'>Sincerely,</p>

<p class=MsoNormal style='mso-pagination:none;tab-stops:3.5in right 472.5pt'><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='mso-pagination:none;tab-stops:3.5in right 472.5pt'>First
Title &amp; Escrow, Inc.<span style='mso-tab-count:1'>                                              </span>Agreed
to and acknowledged by:</p>

<p class=MsoNormal style='mso-pagination:none;tab-stops:right 472.5pt'><!--[if supportFields]><span
style='mso-element:field-begin'></span><span
style='mso-spacerun:yes'> </span>if <span style='mso-field-code:" Autotext Seller1Name "'>Seller1Name</span>
=&quot;&quot; &quot;</p>

<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
 style='margin-left:.5in;border-collapse:collapse;mso-padding-alt:0in 0in 0in 0in'>
 <tr style='mso-yfti-lastrow:yes'>
  <td width=210 valign=top style='width:157.5pt;padding:0in 0in 0in 0in'>
  <p class=Signatures style='mso-pagination:none'><o:p>&nbsp;</o:p></p>
  </td>
  <td width=78 valign=top style='width:58.5pt;padding:0in 0in 0in 0in'>
  <p class=Signatures style='mso-pagination:none'><o:p>&nbsp;</o:p></p>
  </td>
  <td width=302 valign=top style='width:3.15in;padding:0in 0in 0in 0in'>
  <p class=Signatures style='mso-pagination:none'><span style='mso-element:
  field-begin'></span><span style='mso-spacerun:yes'> </span>IF <span
  style='mso-field-code:" autotext Buyer1Type "'>Seller1Type</span>=&quot;C&quot;
  &quot;<span style='mso-element:field-begin'></span> autotext Buyer1Name<span
  style='mso-spacerun:yes'>  </span>\* Upper<span style='mso-element:field-end'></span></p>
  <p class=Signatures style='mso-pagination:none'><o:p>&nbsp;</o:p></p>
  <p class=Signatures style='mso-pagination:none'>By: 	<u>	</u></p>
  <p class=Signatures style='mso-pagination:none'>	<span style='mso-element:
  field-begin'></span> autotext Buyer1Agent1NameTitle <span style='mso-element:
  field-end'></span>&quot; &quot;</p>
  <p class=Signatures style='mso-pagination:none'><u>		</u></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-field-code:
  " autotext Buyer1name "'>Seller1Name</span>&quot; <span style='mso-element:
  field-separator'></span><span style='mso-no-proof:yes'><o:p></o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-no-proof:
  yes'><o:p>&nbsp;</o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><u><span style='mso-no-proof:
  yes'>		</span></u><span style='mso-no-proof:yes'>{SEAL}<o:p></o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-no-proof:
  yes'><span style='mso-field-code:" autotext Seller1name "'>Seller1Name</span></span><span
  style='mso-element:field-end'></span><span style='mso-element:field-begin'></span>
  </p>
  <p class=Signatures style='mso-pagination:none'><span
  style='mso-spacerun:yes'> </span><span style='mso-element:field-end'></span><span
  style='mso-element:field-begin'></span><span
  style='mso-spacerun:yes'> </span>If <span style='mso-field-code:" autotext Buyer2Name "'>Seller2Name</span>=&quot;&quot;
  &quot;&quot; &quot;<span style='mso-element:field-begin'></span> IF <span
  style='mso-field-code:" autotext Buyer2Type "'>Seller2Type</span>=&quot;C&quot;
  &quot;</p>
  <p class=Signatures style='mso-pagination:none'><o:p>&nbsp;</o:p></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-element:
  field-begin'></span><span style='mso-spacerun:yes'> </span>autotext
  Buyer2Name<span style='mso-spacerun:yes'>  </span>\* Upper <span
  style='mso-element:field-end'></span></p>
  <p class=Signatures style='mso-pagination:none'><o:p>&nbsp;</o:p></p>
  <p class=Signatures style='mso-pagination:none'>By: 	<u>	</u></p>
  <p class=Signatures style='mso-pagination:none'>	<span style='mso-element:
  field-begin'></span> autotext Buyer2Agent1NameTitle <span style='mso-element:
  field-end'></span>&quot; &quot;</p>
  <p class=Signatures style='mso-pagination:none'><o:p>&nbsp;</o:p></p>
  <p class=Signatures style='mso-pagination:none'><u>		</u></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-field-code:
  " autotext Buyer2name "'>Seller2Name</span>&quot; <span style='mso-element:
  field-separator'></span><span style='mso-no-proof:yes'><o:p></o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-no-proof:
  yes'><o:p>&nbsp;</o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-no-proof:
  yes'><o:p>&nbsp;</o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><u><span style='mso-no-proof:
  yes'>		</span></u><span style='mso-no-proof:yes'>{SEAL}<o:p></o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-no-proof:
  yes'><span style='mso-field-code:" autotext Seller2name "'>Seller2Name</span></span><span
  style='mso-element:field-end'></span>&quot; <span style='mso-element:field-separator'></span><span
  style='mso-no-proof:yes'><o:p></o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-no-proof:
  yes'><o:p>&nbsp;</o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-no-proof:
  yes'><o:p>&nbsp;</o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><u><span style='mso-no-proof:
  yes'>		</span></u><span style='mso-no-proof:yes'>{SEAL}<o:p></o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-no-proof:
  yes'><span style='mso-field-code:" autotext Seller2name "'>Seller2Name</span></span><span
  style='mso-element:field-end'></span><span style='mso-element:field-begin'></span>
  </p>
  <p class=Signatures style='mso-pagination:none'><span
  style='mso-spacerun:yes'> </span><span style='mso-element:field-end'></span><span
  style='mso-element:field-begin'></span><span
  style='mso-spacerun:yes'> </span>If <span style='mso-field-code:" autotext Buyer3Name "'>Seller3Name</span>=&quot;&quot;
  &quot;&quot; &quot;</p>
  <p class=Signatures style='mso-pagination:none'><o:p>&nbsp;</o:p></p>
  <p class=Signatures style='mso-pagination:none'><u>		</u></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-field-code:
  " autotext Buyer3name "'>Seller3Name</span>&quot;<span style='mso-element:
  field-separator'></span><span style='mso-no-proof:yes'><o:p></o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-no-proof:
  yes'><o:p>&nbsp;</o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-no-proof:
  yes'><o:p>&nbsp;</o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><u><span style='mso-no-proof:
  yes'>		</span></u><span style='mso-no-proof:yes'>{SEAL}<o:p></o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-no-proof:
  yes'><span style='mso-field-code:" autotext Seller3name "'>Seller3Name</span></span><span
  style='mso-element:field-end'></span><span style='mso-element:field-begin'></span>
  </p>
  <p class=Signatures style='mso-pagination:none'><span
  style='mso-spacerun:yes'> </span><span style='mso-element:field-end'></span><span
  style='mso-element:field-begin'></span><span
  style='mso-spacerun:yes'> </span>If <span style='mso-field-code:" autotext Buyer4Name "'>Seller4Name</span>=&quot;&quot;
  &quot;&quot; &quot;</p>
  <p class=Signatures style='mso-pagination:none'><o:p>&nbsp;</o:p></p>
  <p class=Signatures style='mso-pagination:none'><u>		</u></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-field-code:
  " autotext Buyer4Name "'>Seller4Name</span></p>
  <p class=Signatures style='mso-pagination:none'>&quot;<span style='mso-element:
  field-separator'></span><span style='mso-no-proof:yes'><o:p></o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-no-proof:
  yes'><o:p>&nbsp;</o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-no-proof:
  yes'><o:p>&nbsp;</o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><u><span style='mso-no-proof:
  yes'>		</span></u><span style='mso-no-proof:yes'>{SEAL}<o:p></o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-no-proof:
  yes'><span style='mso-field-code:" autotext Seller4Name "'>Seller4Name</span></span><span
  style='mso-element:field-end'></span></p>
  </td>
 </tr>
</table>

<p class=Signatures style='mso-pagination:none'>&quot; &quot;</p>

<table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0
 style='margin-left:.5in;border-collapse:collapse;mso-padding-alt:0in 0in 0in 0in'>
 <tr style='mso-yfti-lastrow:yes'>
  <td width=210 valign=top style='width:157.5pt;padding:0in 0in 0in 0in'>
  <p class=Signatures style='mso-pagination:none'><o:p>&nbsp;</o:p></p>
  </td>
  <td width=78 valign=top style='width:58.5pt;padding:0in 0in 0in 0in'>
  <p class=Signatures style='mso-pagination:none'><o:p>&nbsp;</o:p></p>
  </td>
  <td width=302 valign=top style='width:3.15in;padding:0in 0in 0in 0in'>
  <p class=Signatures style='mso-pagination:none'><span style='mso-element:
  field-begin'></span><span style='mso-spacerun:yes'> </span>IF <span
  style='mso-field-code:" autotext Seller1Type "'>Seller1Type</span>=&quot;C&quot;
  &quot;<span style='mso-element:field-begin'></span> autotext Seller1Name<span
  style='mso-spacerun:yes'>  </span>\* Upper<span style='mso-element:field-end'></span></p>
  <p class=Signatures style='mso-pagination:none'><o:p>&nbsp;</o:p></p>
  <p class=Signatures style='mso-pagination:none'>By: 	<u>	</u></p>
  <p class=Signatures style='mso-pagination:none'>	<span style='mso-element:
  field-begin'></span> autotext Seller1Agent1NameTitle <span style='mso-element:
  field-end'></span>&quot; &quot;</p>
  <p class=Signatures style='mso-pagination:none'><u>		</u></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-field-code:
  " autotext Seller1name "'>Seller1Name</span>&quot; <span style='mso-element:
  field-separator'></span><span style='mso-no-proof:yes'><o:p></o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><u><span style='mso-no-proof:
  yes'>		</span></u><span style='mso-no-proof:yes'><o:p></o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-no-proof:
  yes'><span style='mso-field-code:" autotext Seller1name "'>Seller1Name</span></span><span
  style='mso-element:field-end'></span><span style='mso-element:field-begin'></span>
  </p>
  <p class=Signatures style='mso-pagination:none'><span
  style='mso-spacerun:yes'> </span><span style='mso-element:field-end'></span><span
  style='mso-element:field-begin'></span><span
  style='mso-spacerun:yes'> </span>If <span style='mso-field-code:" autotext Seller2Name "'>Seller2Name</span>=&quot;&quot;
  &quot;&quot; &quot;<span style='mso-element:field-begin'></span> IF <span
  style='mso-field-code:" autotext Seller2Type "'>Seller2Type</span>=&quot;C&quot;
  &quot;</p>
  <p class=Signatures style='mso-pagination:none'><o:p>&nbsp;</o:p></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-element:
  field-begin'></span><span style='mso-spacerun:yes'> </span>autotext
  Seller2Name<span style='mso-spacerun:yes'>  </span>\* Upper <span
  style='mso-element:field-end'></span></p>
  <p class=Signatures style='mso-pagination:none'><o:p>&nbsp;</o:p></p>
  <p class=Signatures style='mso-pagination:none'>By: 	<u>	</u></p>
  <p class=Signatures style='mso-pagination:none'>	<span style='mso-element:
  field-begin'></span> autotext Seller2Agent1NameTitle <span style='mso-element:
  field-end'></span>&quot; &quot;</p>
  <p class=Signatures style='mso-pagination:none'><o:p>&nbsp;</o:p></p>
  <p class=Signatures style='mso-pagination:none'><u>		</u></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-field-code:
  " autotext Seller2name "'>Seller2Name</span>&quot; <span style='mso-element:
  field-separator'></span><span style='mso-no-proof:yes'><o:p></o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-no-proof:
  yes'><o:p>&nbsp;</o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><u><span style='mso-no-proof:
  yes'>		</span></u><span style='mso-no-proof:yes'><o:p></o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-no-proof:
  yes'><span style='mso-field-code:" autotext Seller2name "'>Seller2Name</span></span><span
  style='mso-element:field-end'></span>&quot; <span style='mso-element:field-separator'></span><span
  style='mso-no-proof:yes'><o:p></o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-no-proof:
  yes'><o:p>&nbsp;</o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><u><span style='mso-no-proof:
  yes'>		</span></u><span style='mso-no-proof:yes'><o:p></o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-no-proof:
  yes'><span style='mso-field-code:" autotext Seller2name "'>Seller2Name</span></span><span
  style='mso-element:field-end'></span><span style='mso-element:field-begin'></span>
  </p>
  <p class=Signatures style='mso-pagination:none'><span
  style='mso-spacerun:yes'> </span><span style='mso-element:field-end'></span><span
  style='mso-element:field-begin'></span><span
  style='mso-spacerun:yes'> </span>If <span style='mso-field-code:" autotext Seller3Name "'>Seller3Name</span>=&quot;&quot;
  &quot;&quot; &quot;</p>
  <p class=Signatures style='mso-pagination:none'><o:p>&nbsp;</o:p></p>
  <p class=Signatures style='mso-pagination:none'><u>		</u></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-field-code:
  " autotext Seller3name "'>Seller3Name</span>&quot;<span style='mso-element:
  field-separator'></span><span style='mso-no-proof:yes'><o:p></o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-no-proof:
  yes'><o:p>&nbsp;</o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><u><span style='mso-no-proof:
  yes'>		</span></u><span style='mso-no-proof:yes'><o:p></o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-no-proof:
  yes'><span style='mso-field-code:" autotext Seller3name "'>Seller3Name</span></span><span
  style='mso-element:field-end'></span><span style='mso-element:field-begin'></span>
  </p>
  <p class=Signatures style='mso-pagination:none'><span
  style='mso-spacerun:yes'> </span><span style='mso-element:field-end'></span><span
  style='mso-element:field-begin'></span><span
  style='mso-spacerun:yes'> </span>If <span style='mso-field-code:" autotext Seller4Name "'>Seller4Name</span>=&quot;&quot;
  &quot;&quot; &quot;</p>
  <p class=Signatures style='mso-pagination:none'><o:p>&nbsp;</o:p></p>
  <p class=Signatures style='mso-pagination:none'><u>		</u></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-field-code:
  " autotext Seller4Name "'>Seller4Name</span></p>
  <p class=Signatures style='mso-pagination:none'>&quot;<span style='mso-element:
  field-separator'></span><span style='mso-no-proof:yes'><o:p></o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-no-proof:
  yes'><o:p>&nbsp;</o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><u><span style='mso-no-proof:
  yes'>		</span></u><span style='mso-no-proof:yes'><o:p></o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-no-proof:
  yes'><span style='mso-field-code:" autotext Seller4Name "'>Seller4Name</span><o:p></o:p></span></p>
  <p class=Signatures style='mso-pagination:none'><span style='mso-element:
  field-end'></span></p>
  </td>
 </tr>
</table>

<p class=MsoNormal style='margin-right:-27.0pt;text-indent:2.5in;tab-stops:
right 495.0pt'>&quot;<![endif]--><!--[if supportFields]><span style='mso-element:
field-end'></span><![endif]--><span style='font-family:"Arial Narrow"'><span
style='mso-tab-count:1'>                                                                                                                                          </span><o:p></o:p></span></p>

<p class=MsoNormal style='margin-top:0in;margin-right:-27.0pt;margin-bottom:
0in;margin-left:3.0in;margin-bottom:.0001pt'><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='margin-right:-27.0pt'><o:p>&nbsp;</o:p></p>

<p class=MsoNormal align=center style='text-align:center'><b><span
style='font-size:14.0pt'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center'><b><span
style='font-size:14.0pt'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center'><b><span
style='font-size:14.0pt'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center'><b><span
style='font-size:14.0pt'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center'><b><span
style='font-size:14.0pt'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center'><b><span
style='font-size:14.0pt'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center'><b><span
style='font-size:14.0pt'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center'><b><span
style='font-size:14.0pt'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center'><b><span
style='font-size:14.0pt'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center'><b><span
style='font-size:14.0pt'>FIRST TITLE &amp; ESCROW, INC.<o:p></o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center'><b><span
style='font-size:14.0pt'>Papermaster &amp; Weltmann, P.C.<o:p></o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center'><b><span
style='font-size:14.0pt'>51 MONROE STREET, SUITE 1107<o:p></o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center'><b><span
style='font-size:14.0pt'>ROCKVILLE, MD 20850<o:p></o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center'><b><span
style='font-size:14.0pt'>(301) 279-0303<o:p></o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center'><b><span
style='font-size:14.0pt'>FAX: (301) 279-7930<o:p></o:p></span></b></p>

<p class=MsoNormal><span style='font-size:14.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='tab-stops:center 3.5in'><span style='font-size:14.0pt'><span
style='mso-tab-count:1'>                                                                   </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-size:14.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-size:14.0pt'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><b><o:p>&nbsp;</o:p></b></p>

<p class=MsoNormal><b><o:p>&nbsp;</o:p></b></p>

<p class=MsoNormal><b><o:p>&nbsp;</o:p></b></p>

<p class=MsoNormal><b><o:p>&nbsp;</o:p></b></p>

<p class=MsoNormal>Telefax: </p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='margin-left:2.0in;text-indent:-1.5in;tab-stops:-1.0in'>Re:<span
style='mso-tab-count:1'>                               </span>Our Case No.<span
style='mso-tab-count:1'>   </span></p>

<p class=MsoNormal style='margin-left:2.0in;text-indent:-1.0in;tab-stops:-1.0in'>Loan
No.<span style='mso-tab-count:1'>          </span></p>

<p class=MsoNormal style='margin-left:2.0in;text-indent:-1.0in;tab-stops:-1.0in'>Borrower:<span
style='mso-tab-count:1'>         </span><b><o:p></o:p></b></p>

<p class=MsoNormal style='margin-left:2.0in'><b><o:p>&nbsp;</o:p></b></p>

<p class=MsoNormal style='margin-left:2.0in'><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='margin-left:2.0in;text-indent:-1.0in;tab-stops:-1.0in'>Property:<span
style='mso-tab-count:1'>           </span></p>

<p class=MsoNormal style='text-indent:1.0in'><b><u>REQUEST TO CANCEL REVOLVING
CREDIT LOAN</u></b></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal>Ladies/Gentlemen:</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='text-indent:.5in'>Please freeze the loan amount to
include obligations incurred or draws I have made prior to and including the
date of this letter under terms and condition of the above-numbered loan
secured by the above-numbered mortgage or the surety instrument, recorded in
the Land Records of<cfoutput>#read_title.pcounty#</cfoutput>County, Maryland and cancel the revolving credit loan for future
advances.</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='text-indent:.5in'>I agree to cease signing all checks
and/or credit cards and/or drafts. I enclose all of the above which I have in
my possession.</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='text-indent:.5in'>This is also a notice that I intend
to sell or execute a new mortgage on the property. Under the laws of some
States, future advances may be subordinate to the right of a new lender or
buyer.</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='text-indent:.5in'>Your cooperation in this matter is
essential to completing the real estate transaction contemplated with
referenced to the mortgaged property.</p>

<p class=MsoNormal style='text-indent:3.5in'>Sincerely,</p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='text-indent:3.0in;tab-stops:right 7.0in'><u>_______________________________________________</u><span
style='mso-tab-count:1'>  </span></p>

<p class=MsoNormal style='margin-left:3.0in'><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='text-indent:3.0in;tab-stops:right 7.0in'><u>_______________________________________________</u><span
style='mso-tab-count:1'>  </span></p>

<p class=MsoNormal style='margin-left:3.0in'><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='text-indent:3.0in'><u>________________________________________________</u></p>

<p class=MsoNormal style='margin-left:3.0in'><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='text-indent:3.0in'><u>_______________________________________________</u></p>

<p class=MsoNormal style='margin-left:3.0in'><o:p>&nbsp;</o:p></p>

<p class=MsoNormal><o:p>&nbsp;</o:p></p>

<p class=MsoNormal style='margin-left:1.0in;text-indent:-1.0in;tab-stops:-1.0in'><b><span
style='font-size:14.0pt;font-family:"Arial Narrow"'>** NOTE: <span
style='mso-tab-count:1'>       </span>THE ORIGINAL RELEASE/SATISFACTION
DOCUMENTS MUST BE SENT TO FIRST TITLE &amp; ESCROW, INC., FOR RECORDING.<span
style='mso-spacerun:yes'>  </span>PLEASE REMIT TO THE ADDRESS BELOW.</span></b><span
style='font-family:"Arial Narrow"'><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-family:"Arial Narrow"'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=center style='text-align:center'><b><span
style='font-family:"Arial Narrow"'>FIRST TITLE &amp; ESCROW, INC.<o:p></o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center'><b><span
style='font-family:"Arial Narrow"'>7361 CALHOUN PLACE, SUITE 200<o:p></o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center'><b><span
style='font-family:"Arial Narrow"'>ROCKVILLE, MD 20855<o:p></o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center'><b><span
style='font-family:"Arial Narrow"'>ATTN: RELEASE RECORDING DEPT.<o:p></o:p></span></b></p>

<p class=MsoNormal align=center style='text-align:center'><span
style='font-family:Arial'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=center style='text-align:center'><span
style='font-family:Arial'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=center style='text-align:center'><span
style='font-family:Arial'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=center style='text-align:center'><span
style='font-family:Arial'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=center style='text-align:center'><span
style='font-family:Arial'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=center style='text-align:center'><span
style='font-family:Arial'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=center style='text-align:center'><span
style='font-family:Arial'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=center style='text-align:center'><span
style='font-family:Arial'>Joint Notice of Privacy Policy<o:p></o:p></span></p>

<p class=MsoNormal align=center style='text-align:center'><span
style='font-family:Arial'>First Title &amp; Escrow, Inc.<b>*</b><o:p></o:p></span></p>

<p class=MsoNormal align=center style='text-align:center'><span
style='font-family:Arial'>And<o:p></o:p></span></p>

<p class=MsoNormal align=center style='text-align:center'><span
style='font-family:Arial'><span style='mso-field-code:" AUTOTEXT UnderwriterName "'><cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif></span><o:p></o:p></span></p>

<p class=MsoNormal><b><span style='font-family:Arial'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='text-indent:.5in'><b><span style='font-family:Arial'><o:p>&nbsp;</o:p></span></b></p>

<p class=MsoNormal style='margin-left:.25in;text-indent:.25in'><span
style='font-family:Arial'>First Title &amp; Escrow, Inc., and <span
style='mso-field-code:" AUTOTEXT UnderwriterName "'><cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif></span>
value their customers and are committed to protecting the privacy of personal
information.<span style='mso-spacerun:yes'>  </span>In keeping with that
philosophy, we each have developed a Privacy Policy, set out below, that will
ensure the continued protection of your nonpublic personal information and
inform you about the measures First Title &amp; Escrow, Inc., and <span
style='mso-field-code:" AUTOTEXT UnderwriterName "'><cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif></span> take
to safe-guard that private information.<span style='mso-spacerun:yes'>
</span>This notice is issued jointly as a means of paperwork reduction and is
not intended to create a joint privacy policy.<span style='mso-spacerun:yes'>
</span>Each company’s privacy policy is separately instituted, executed and
maintained.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:.25in'><span style='font-family:Arial'><o:p>&nbsp;</o:p></span></p>

<h3><span style='font-size:12.0pt;font-family:Arial;font-variant:normal !important;
text-transform:uppercase;mso-bidi-font-weight:bold;font-style:normal'>who is
covered<o:p></o:p></span></h3>

<p class=MsoNormal style='margin-left:.25in'><u><span style='font-family:Arial'><o:p><span
 style='text-decoration:none'>&nbsp;</span></o:p></span></u></p>

<p class=MsoNormal style='margin-left:.25in'><span style='font-family:Arial'><span
style='mso-tab-count:1'>      </span><span style='mso-spacerun:yes'>
</span>We provide our Privacy Policy to each customer when they purchase a
First Title &amp; Escrow, Inc, title insurance policy.<span
style='mso-spacerun:yes'>  </span>Generally, this means that the privacy policy
is provided to the customer at the closing of the real estate transaction.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:.25in'><span style='font-family:Arial'><o:p>&nbsp;</o:p></span></p>

<h3><span style='font-size:12.0pt;font-family:Arial;font-variant:normal !important;
text-transform:uppercase;mso-bidi-font-weight:bold;font-style:normal'>Information
Collected <o:p></o:p></span></h3>

<p class=MsoNormal style='margin-left:.25in'><u><span style='font-family:Arial'><o:p><span
 style='text-decoration:none'>&nbsp;</span></o:p></span></u></p>

<p class=MsoBodyTextIndent2><span style='font-size:12.0pt;mso-bidi-font-size:
10.0pt'>In the normal course of business and to provide the necessary services
to our customers, we may obtain nonpublic personal information directly from
the customer, from customer-related transactions, or from third parties such as
our title insurance agents, lenders, appraisers, surveyors or other similar
entities.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:.25in'><span style='font-family:Arial'><o:p>&nbsp;</o:p></span></p>

<h3><span style='font-size:12.0pt;font-family:Arial;font-variant:normal !important;
text-transform:uppercase;mso-bidi-font-weight:bold;font-style:normal'>Access to
Information <o:p></o:p></span></h3>

<p class=MsoNormal style='margin-left:.25in'><u><span style='font-family:Arial'><o:p><span
 style='text-decoration:none'>&nbsp;</span></o:p></span></u></p>

<p class=MsoNormal style='margin-left:.25in;text-indent:.25in'><span
style='font-family:Arial'>Access to all nonpublic personal information is
limited to those employees who have a need to know in order to perform their
jobs.<span style='mso-spacerun:yes'>  </span>These employees include, but are
not limited to, those in departments such as closing, legal, underwriting,
claims administration and accounting. <o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:.25in'><span style='font-family:Arial'><o:p>&nbsp;</o:p></span></p>

<h3><span style='font-size:12.0pt;font-family:Arial;font-variant:normal !important;
text-transform:uppercase;mso-bidi-font-weight:bold;font-style:normal'>Information
Sharing<span style='mso-spacerun:yes'>    </span><o:p></o:p></span></h3>

<p class=MsoNormal><span style='font-family:Arial'><span style='mso-tab-count:
1'>            </span><o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:.25in'><span style='font-family:Arial'><span
style='mso-tab-count:1'>      </span>Generally, neither First Title &amp;
Escrow, Inc, nor <span style='mso-field-code:" AUTOTEXT UnderwriterName "'><cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif></span>
shares nonpublic personal information that it collects anyone other than those
individuals necessary needed to complete the real estate settlement services
and issue its title insurance policy as requested by the consumer. <cfoutput><p>#read_agency.title_FT_Agency_name# </p></cfoutput> or <span style='mso-field-code:" AUTOTEXT UnderwriterName "'><cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif></span>
may share nonpublic personal information as permitted by law with entities with
who First Title &amp; Escrow, Inc., or <span style='mso-field-code:" AUTOTEXT UnderwriterName "'><cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif></span>
has a joint marketing agreement. <span
style='mso-spacerun:yes'> </span>Entities with whom First Title &amp; Escrow,
Inc, or <span style='mso-field-code:" AUTOTEXT UnderwriterName "'><cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif></span>
have a joint marketing agreement have agreed to protect the privacy of our
customer’s nonpublic personal information by utilizing similar precautions and
security measures as First Title &amp; Escrow, Inc., and <span
style='mso-field-code:" AUTOTEXT UnderwriterName "'><cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif></span> use
to protect this information and to use the information for lawful purpose.<span
style='mso-spacerun:yes'>  </span>First Title &amp; Escrow, Inc., or <span
style='mso-field-code:" AUTOTEXT UnderwriterName "'><cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif></span>,
however, may share information as required by law in response to a subpoena, to
a government regulatory agency or to prevent fraud.<o:p></o:p></span></p>

<p class=MsoNormal style='margin-left:.25in'><span style='font-family:Arial'><o:p>&nbsp;</o:p></span></p>

<h3 style='margin-left:0in;text-indent:.25in'><span style='font-size:12.0pt;
font-family:Arial;font-variant:normal !important;text-transform:uppercase;
mso-bidi-font-weight:bold;font-style:normal'>Information Security <o:p></o:p></span></h3>

<p class=MsoNormal style='margin-left:.25in'><span style='font-family:Arial'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='margin-left:.25in'><span style='font-family:Arial'><span
style='mso-tab-count:1'>      </span>First Title &amp; Escrow, Inc., and <span
style='mso-field-code:" AUTOTEXT UnderwriterName "'><cfif #read_hud1.insurance_co# eq 15>American Pioneer<cfelse>Stewart</cfif></span>, at
all times, strive to maintain the confidentiality and integrity of the personal
information in its possession and has instituted measures to guard against its
unauthorized access.<span style='mso-spacerun:yes'>  </span>We maintain
physical, electronic and procedural safeguards in compliance with federal
standards to protect that information.<span
style='mso-spacerun:yes'>                  </span><span style='mso-tab-count:
1'> </span><span style='mso-spacerun:yes'>   </span><o:p></o:p></span></p>

<p class=MsoNormal><span style='font-family:Arial'><span style='mso-tab-count:
1'>            </span><o:p></o:p></span></p>

<p class=MsoNormal align=left style='margin-left:.75in;text-align:left;
text-indent:-.25in;mso-list:l0 level1 lfo1;tab-stops:list .75in'><![if !supportLists]><span
style='font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:
Symbol'><span style='mso-list:Ignore'>·<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style='font-family:Arial'>Affiliated
entities and individuals associated with First Title &amp; Escrow, Inc., are
also covered under this notice.<span style='mso-spacerun:yes'>  </span>Those
include: First Title &amp; Escrow, Inc., Alabama First Tilte & Escrow, First Title, Inc., <sup>st</sup> Title and Escrow, Inc.,
First Title Agency and Escrow, First Title of NEVADA INC., First Settlement and
Escrow, Inc. and Stephen J. Papermaster.<o:p></o:p></span></p>

<p class=MsoNormal align=left style='text-align:left'><span style='font-family:
Arial'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='text-align:left'><span style='font-family:
Arial'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal align=left style='text-align:left'><span style='font-family:
Arial'><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><b><u><span style='font-size:14.0pt'><o:p><span
 style='text-decoration:none'>&nbsp;</span></o:p></span></u></b></p>

<p class=MsoNormal><b><u><span style='font-size:14.0pt'><o:p><span
 style='text-decoration:none'>&nbsp;</span></o:p></span></u></b></p>

<p class=MsoNormal><b><u><span style='font-size:14.0pt'><o:p><span
 style='text-decoration:none'>&nbsp;</span></o:p></span></u></b></p>

<p class=MsoNormal><b><u><span style='font-size:14.0pt'><o:p><span
 style='text-decoration:none'>&nbsp;</span></o:p></span></u></b></p>

<p class=MsoNormal><b><u><span style='font-size:14.0pt'><o:p><span
 style='text-decoration:none'>&nbsp;</span></o:p></span></u></b></p>

<p class=MsoNormal><b><u><span style='font-size:14.0pt'><o:p><span
 style='text-decoration:none'>&nbsp;</span></o:p></span></u></b></p>

<p class=MsoNormal><b><u><span style='font-size:14.0pt'><o:p><span
 style='text-decoration:none'>&nbsp;</span></o:p></span></u></b></p>

<p class=MsoNormal><b><u><span style='font-size:14.0pt'><o:p><span
 style='text-decoration:none'>&nbsp;</span></o:p></span></u></b></p>

</div>

</body>

</html>
