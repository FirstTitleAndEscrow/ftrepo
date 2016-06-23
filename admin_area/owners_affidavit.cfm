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
<CFQUERY datasource="#request.dsn#" NAME="get_state">
			SELECT st_name
			FROM First_Title_States_all
			WHERE st_abbrev = '#get_titleid.pstate#'
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
<CFFORM NAME="frm" ACTION="./owners_affidavit_email.cfm?rec_id=#rec_id#" METHOD="POST">
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


<CFFORM NAME="modform" ACTION="./st_settlement_and_disclosure_final.cfm?rec_id=#rec_id#" METHOD="POST">


<IE:DEVICERECT ID="page1" CLASS="masterstyle" MEDIA="print">

<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
		<p align="center"><strong><font size="4">OWNER'S AFFIDAVIT<BR>
AND ENHANCED<BR>
OWNER'S POLICY IF<BR>
APPLICABLE<br>
</font>
</strong></p>



<p><cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput><BR><BR></p>

<p>STATE OF <cfoutput>#Ucase(get_state.st_name)#</cfoutput>, to wit:<BR><BR>

THIS DAY, there personally appeared before the undersigned, a Notary Public in and for the State of<BR>
<cfoutput>#get_state.st_name#</cfoutput>, duly commissioned, the undersigned Owner(s) of the captioned property, who, being<BR>
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

<IE:DEVICERECT ID="page2" CLASS="masterstyle" MEDIA="print">


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


<IE:DEVICERECT ID="page3" CLASS="masterstyle" MEDIA="print">


<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
<br>
<br>
<table border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="350" align="left">_______________________________________________________________<br>
<cfoutput>#get_titleid.bfirstname1# <cfif Len(get_titleid.bminame1)>#get_titleid.bminame1#. </cfif>#get_titleid.blastname1#</cfoutput><br>
<br>
</td>
  </tr>
</table>

<cfif Len(get_titleid.blastname2)>
<table border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="350" align="left">_______________________________________________________________<br>
<cfoutput>#get_titleid.bfirstname2# <cfif Len(get_titleid.bminame2)>#get_titleid.bminame2#. </cfif>#get_titleid.blastname2#</cfoutput><br>
<br>
</td>
  </tr>
 </table>
  <cfelse>
  <table border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="350" align="left">&nbsp;<br><br>
<br>
</td>
  </tr>
 </table>
 </cfif>

 <cfif Len(get_titleid.blastname3)>
<table border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="350" align="left">_______________________________________________________________<br>
<cfoutput>#get_titleid.bfirstname3# <cfif Len(get_titleid.bminame3)>#get_titleid.bminame3#. </cfif>#get_titleid.blastname3#</cfoutput><br>
<br>
</td>
  </tr>
 </table>
  <cfelse>
    <table border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="350" align="left">&nbsp;<br><br>
<br>
</td>
  </tr>
 </table>
</cfif>

  <cfif Len(get_titleid.blastname4)>
<table border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="350" align="left">_______________________________________________________________<br>
<cfoutput>#get_titleid.bfirstname4# <cfif Len(get_titleid.bminame4)>#get_titleid.bminame4#. </cfif>#get_titleid.blastname4#</cfoutput><br>
<br>
</td>
  </tr>
  </table>
<cfelse>
  <table border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="350" align="left">&nbsp;<br><br>
<br>
</td>
  </tr>
 </table>
 </cfif>

 <br>
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
T-<cfoutput>#get_titleid.title_id#</cfoutput><br>


</td></tr></table></IE:DEVICERECT>
</cfform>


</body>
</html>
