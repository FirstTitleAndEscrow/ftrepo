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
		<CFQUERY datasource="#request.dsn#" NAME="mods">

			SELECT *
			FROM closing_form_mods
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




<IE:DEVICERECT ID="page1" CLASS="" MEDIA="print">


<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td align="left" valign="top">

<br>
<table border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td align="left" valign="top">REO# <cfoutput><cfif get_titleid.recordcount and Len(get_titleid.fannie_reo_id)>
<INPUT NAME="fannie_reo_id" SIZE=20 MAXLENGTH=20 style="font-size: 10;
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
									clear: none;" value="#get_titleid.fannie_reo_id#"><cfelse>
									<INPUT NAME="fannie_reo_id" SIZE=20 MAXLENGTH=20 style="font-size: 10;
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
THIS WAIVER AND RELEASE IS TO BE EXECUTED ONLY AT CLOSING</strong>
</strong><br></P>
<br></font>


<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This Waiver and Release Regarding Property Condition at Closing is given by <cfoutput>#get_titleid.bfirstname1# <cfif Len(get_titleid.bminame1)>#get_titleid.bminame1#. </cfif>#get_titleid.blastname1#<cfif Len(get_titleid.blastname2)>, #get_titleid.bfirstname2# <cfif Len(get_titleid.bminame2)>#get_titleid.bminame2#. </cfif>#get_titleid.blastname2#</cfif><cfif Len(get_titleid.blastname3)>, #get_titleid.bfirstname3# <cfif Len(get_titleid.bminame3)>#get_titleid.bminame3#. </cfif>#get_titleid.blastname3#</cfif><cfif Len(get_titleid.blastname4)>, #get_titleid.bfirstname4# <cfif Len(get_titleid.bminame4)>#get_titleid.bminame4#. </cfif>#get_titleid.blastname4#</cfif></cfoutput> ("Purchaser") to   FANNIE MAE 	("Seller")
in connection with the purchase of the property located at <cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput> ("Property") pursuant to the contract of sale between Purchaser and Seller with a Verbal Acknowledgment Date of
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
									clear: none;" value="#mods.verbal_ack_date#"><cfelse>
									<INPUT NAME="title_co" SIZE=20 MAXLENGTH=20 style="font-size: 10;
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
</cfif></cfoutput> ("Contract").<br><br>


Purchaser acknowledges that the Property was acquired by Seller by foreclosure, deed in lieu of foreclosure, forfeiture, tax sale, right of eminent domain or similar process. Accordingly Seller has little or no direct knowledge concerning the condition of the property. Purchaser has inspected the Property or was given the right to inspect the Property to determine the condition of the Property and discover any defects. Purchaser acknowledges and accepts the Property in "AS IS" condition at the time of closing, including, without limitation, any hidden defects or environmental conditions affecting the Property (including but not limited to, mold, mildew, microscopic organisms, lead paint, fuel oil, allergens, or other toxic substances of any kind), whether known or unknown and whether or not such defects or conditions were discoverable through inspection. Purchaser acknowledges that Seller, its agents and representatives have not made, and Seller specifically negates and disclaims, any representations, warranties, promises, covenants, agreements or guarantees, implied or express, oral or written in respect to<br>
<br>
<table width="775" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="30" align="left" valign="top">(1)</td>
    <td align="left" valign="top">the physical condition or any other aspect of the Property including the structural integrity or the quality or character of materials used in construction of any improvements, availability and quantity or quality of water, stability of the soil, susceptibility to landslide or flooding, sufficiency of drainage, water leaks, water damage, environmental conditions, or any other matter affecting the stability or integrity of the Property or improvements;</td>
  </tr>
  <tr>
    <td align="left" valign="top">(2)</td>
    <td align="left" valign="top">the conformity of the Property or the improvements to any zoning, land use or building code requirements or compliance with any laws, rules, ordinances or regulations of any federal, state or local governmental authority,
or the granting of any required permits or approvals, if any, of any governmental bodies which had jurisdiction
over the construction of the original structure, any improvements and/or any remodeling of the structure; and</td>
  </tr>
  <tr>
    <td align="left" valign="top">(3)</td>
    <td align="left" valign="top">the habitability, merchantability, marketability, profitability or fitness for a particular purpose of the Property or improvements including redhibitory vices and defects, apparent, non apparent or latent, which now exist or which may hereafter exist and which if known to purchaser, would cause purchaser to refuse to purchase the property./td>
  </tr>
</table>

<br>
Purchaser represents and warrants to Seller the following:<br>
<br>

<table width="775" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="30" align="left" valign="top">(1)</td>
    <td align="left" valign="top">Purchaser is purchasing the Property solely in reliance on its own investigation and inspection of the Property and not on any information, representation or warranty provided or to be provided by Seller, its servicers, representatives, brokers, employees, agents or assigns;</td>
  </tr>
  <tr>
    <td align="left" valign="top">(2)</td>
    <td align="left" valign="top">Neither Seller, nor its servicers, employees, representatives, brokers, agents or assigns, has made any representations or warranties, implied or expressed, relating to the condition of the Property or the contents thereof, except as expressly set forth in the Contract; and</td>
  </tr>
  <tr>
    <td align="left" valign="top">(3)</td>
    <td align="left" valign="top">Purchaser has not relied on any representation or warranty from seller regarding the nature, quality or workmanship of any repairs made by Seller.</td>
  </tr>
  <tr>
    <td align="left" valign="top">(4)</td>
    <td align="left" valign="top">Purchaser has inspected or been given the opportunity to inspect any repairs made by Seller to the Property and accepts the repairs under the terms and conditions of the Contract and such repairs have been performed to the complete satisfaction of Purchaser.</td>
  </tr>
  <tr>
    <td align="left" valign="top">(5)</td>
    <td align="left" valign="top">Purchaser will not occupy or cause or permit others to occupy the Property unless and until any necessary certificate of occupancy, smoke detector certification, septic certification or any similar certification or permit has been obtained from the appropriate governmental entity.</td>
  </tr>
<br>

<strong>AS A MATERIAL PART OF THE CONSIDERATION TO BE RECEIVED BY SELLER, UNDER THE TERMS OF THE CONTRACT AS NEGOTIATED BY PURCHASER AND SELLER, PURCHASER WAIVES</strong><br>
<br>
<table width="775" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="30" align="left" valign="top">(A)</td>
    <td align="left" valign="top">ANY AND ALL CLAIMS ARISING FROM THE ADJUSTMENTS OR PROBATIONS OR ERRORS IN CALCULATING THE ADJUSTMENTS OR PROBATIONS THAT ARE OR MAY BE DISCOVERED AFTER CLOSING;</td>
  </tr>
</table>



<table width="775" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="30" align="left" valign="top">(B)</td>
    <td align="left" valign="top">ANY CLAIMS FOR FAILURE OF CONSIDERATION AND/OR MISTAKE OF FACT AS SUCH CLAMS RELATE TO THE PURCHASE OF THE PROPERTY OR ENTERING INTO OR THE EXECUTION OF AND CLOSING UNDER THIS AGREEMENT;</td>
  </tr>
  <tr>
    <td align="left" valign="top">(C)</td>
    <td align="left" valign="top">ANY REMEDY OF ANY KIND, OTHER THAN AS EXPRESSLY PROVIDED IN THE CONTRACT TO WHICH PURCHASER MIGHT OTHERWISE BE ENTITLED AT LAW OR EQUITY BASED ON MUTUAL MISTAKE OF FACT OR LAW OR OTHERWISE, INCLUDING BUT NOT LIMITED TO RESCISSION OF THIS AGREEMENT;</td>
  </tr>
  <tr>
    <td align="left" valign="top">(D)</td>
    <td align="left" valign="top">TRIAL BY JURY, EXCEPT AS PROHIBITED BY LAW, IN ANY LITIGATION ARISING FROM OR CONNECTED WITH OR RELATED TO THIS AGREEMENT;</td>
  </tr>
  <tr>
    <td align="left" valign="top">(E)</td>
    <td align="left" valign="top">ANY CLAIMS OR LOSSES PURCHASER MAY INCUR AS A RESULT OF CONSTRUCTION OR OTHER DEFECTS, WHICH MAY NOW OR HEREAFTER EXIST WITH RESPECT TO THE PROPERTY; AND</td>
  </tr>
  <tr>
    <td align="left" valign="top">(F)</td>
    <td align="left" valign="top">ANY RIGHT TO AVOID THIS SALE OR REDUCE THE PRICE OR HOLD SELLER RESPONSIBLE FOR DAMAGES ON ACCOUNT OF THE CONDITION OF THE PROPERTY, LACK OF SUITABILITY AND FITNESS, OR REDHIBITORY VICES AND DEFECTS, APPARENT, NONAPPARENT OR LATENT, DISCOVERABLE OR NONDISCOVERABLE.</td>
  </tr>
  <tr>
    <td align="left" valign="top">(G)</td>
    <td align="left" valign="top">ANY CLAIM ARISING FROM ENCROACHMENTS, EASEMENTS, SHORTAGES IN AREA OR ANY OTHER MATTER WHICH WOULD BE DISCLOSED OR REVEALED BY A SURVEY OR INSPECTION OF THE PROPERTY OR SEARCH OF PUBLIC RECORDS.</td>
  </tr>
</table>
<br>
<strong>IF THE PROPERTY IS LOCATED IN CALIFORNIA THE FOLLOWING PARAGRAPHS SHALL APPLY:</strong> It is the intention of Purchaser in executing this release that it shall be effective as a bar to each and every claim, demand and cause of action hereinabove specified and in furtherance of this Purchaser hereby expressly waives any and all rights and benefits conferred by the provisions of Section 1542 of the Civil Code of the State of California, which reads:<br>
<blockquote>
"A general release does not extend to claims which the creditor does not know or suspect to exist in his favor at the time of executing the release, which if known by him must have materially affected his settlement with the debtor."</blockquote>
Purchaser expressly consents that this release shall be given full force and effect as to all of its terms and provisions including as well those relating to unsuspected claims, demands and causes of action hereinabove specified. If any provision of this release be invalid or unenforceable, it is the intention of the Purchaser that all of the other provisions shall be fully valid and enforceable according to their terms.<br>
<br>

The invalidity, illegality or enforceability of any provision of this Addendum shall not affect the validity or enforceability of any other provision of this Addendum, all of which shall remain in full force and effect<br>
<br>

Executed this  _____________	day of __________________________________________, 2009<br>
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

</table>


</td>
	</tr>
</table>
<!--- end of page 1 ---->
</IE:DEVICERECT>




</body>
</html>
