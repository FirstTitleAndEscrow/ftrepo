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
		<p align="center"><br>
<strong><u>SELLER CLOSING INSTRUCTIONS</u></strong></p>
<br>
<br>
<strong>Date: Document Date<br>
Re: Property Address<br>
Purchasers: Purchaser(s)<br>
To:  Sarah Spiers-Legacy Law Group ( Title Company this will be a fill in)</strong><br><br><br>

We are acting as the seller representative on the above referenced closing. <strong>PLEASE REVIEW THESE INSTRUCTIONS CAREFULLY.</strong> YOU MUST SIGN AND RETURN THESE INSTRUCTIONS TO OUR OFFICE AS EVIDENCE THAT YOU HAVE REVIEWED THE INSTRUCTIONS AND FULLY UNDERSTAND THE PENALTIES IF NOT FOLLOWED. We want to insure a smooth transaction and hope that you will enjoy working with our office.<br><br>

<strong>**PLEASE NOTE:<br>
<ol type="1"><li>The Name and Address for the seller on the final HUD is:
Fannie Mae, A/K/A, Federal National Mortgage Association
14221 Dallas Parkway, Suite 1000, Dallas TX 75254<br></li>

<li>Seller is a government entity and is therefore exempt from grantor's tax (there will be an exemption code on your new deed that our office will prepare and have executed by the seller), seller also does not provide corporate certification, etc.<br></li>

<li>If there is an HOA involved, seller will only pay beginning from the date of foreclosure, which is Fill in.<br></li>

<li>The only title fee the seller will accept to pay is a $10.00 wire fee.<br></li>

<li>Please note that wiring instructions will ONLY be provided after final HUD approval.<br></li>

<li>Please note that the original DEED will be sent after receipt of final HUD for review.<br></li>

<li>Forward Wire Confirmation after wire has been sent to Closer from Web<br><br></li></ol>
<br><br>
PLEASE CHARGE a Seller Rep. fee payable to Streamline Title & Escrow in the amount of <em>$450.00</em> on the seller side of the HUD on line 1111 or below.  The check for this fee should be forwarded to Streamline Title & Escrow, <cfif NOT DateDiff("d", Now(), "1/30/2012")>30 W. Gude Drive, Suite 450, Rockville, MD 20850<cfelse>7361 Calhoun Place, Suite 200, Rockville, MD 20855</cfif>

 at the time of disbursement.<br><br>

If you have any title clearance issues that require my assistance you will notify me in advance and provide a copy of your binder along with copies to assist me in the clearance if needed.<br><br></strong>

For closing I will need a copy of your <strong>FINAL HUD (including all lender fees)</strong> and any payoffs for HOA dues, taxes etc. We will need <strong>WRITTEN DOCUMENTATION</strong> from the parties from the date of the foreclosure forward. This information is provided in bold above.  The final HUD, seller documents and invoices must be sent to us <em><strong>48 hours in advance for approval along with these instructions</strong></em>.<br><br>

<strong>You will be required to fund <em>within 48 hours of closing or a penalty will be assessed to you at a fee of $100.00 a day which should be sent to seller when funding in a <u>separate wire</u></em>.</strong><br><br>

I have read and fully understand and acknowledge that our company will provide the information as requested in a timely manner furthermore we will be responsible for any penalties when funding after 48 hours.<br><br>
_______________________________________<br>
<strong>Authorized Signatory for Title Company</strong><br><br>

_______________________________________<br>
<strong>Printed Name of Signatory</strong><br><br>

_______________________________________<br>
<strong>Printed Name of Title Company</strong><br><br>

Please email back executed document to: Closer from Web<br><br>

</td>
	</tr>
</table>
<!--- end of page 1 ---->
</IE:DEVICERECT>




</body>
</html>
