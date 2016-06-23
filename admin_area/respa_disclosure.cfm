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
<CFFORM NAME="frm" ACTION="./respa_disclosure_email.cfm?rec_id=#rec_id#" METHOD="POST">
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
		<p align="center"><br>
<strong><font size="4"><u>RESPA DISCLOSURE REGARDING AFFILIATED ENTITIES</u></font>
</strong></p>

<p><strong>To:  <cfoutput>#get_titleid.bfirstname1# <cfif Len(get_titleid.bminame1)>#get_titleid.bminame1#. </cfif>#get_titleid.blastname1#<cfif Len(get_titleid.blastname2)>, #get_titleid.bfirstname2# <cfif Len(get_titleid.bminame2)>#get_titleid.bminame2#. </cfif>#get_titleid.blastname2#</cfif><cfif Len(get_titleid.blastname3)>, #get_titleid.bfirstname3# <cfif Len(get_titleid.bminame3)>#get_titleid.bminame3#. </cfif>#get_titleid.blastname3#</cfif><cfif Len(get_titleid.blastname4)>, #get_titleid.bfirstname4# <cfif Len(get_titleid.bminame4)>#get_titleid.bminame4#. </cfif>#get_titleid.blastname4#</cfif></cfoutput><BR><BR>

Property:  <cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput><BR><BR>

From: Shapiro & Burson, LLP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date: _________________________<BR><BR></strong>

This is to give you notice that Shapiro & Burson, LLP, has a business relationship with Streamline Title & Escrow Services, LLC. Shapiro & Burson, LLP owns an interest in this affiliate and therefore has a financial interest in their business services. We'd also like you to know that some of the owners of Streamline Title & Escrow Services, LLC own an interest in First Title & Escrow, Inc., to whom some closing functions are contracted. Because of this relationship, this referral may provide Referring Company a financial or other benefit.<BR><BR>

Set forth below is the estimated charge or range of charges offered by Streamline Title & Escrow Services, L.L.C., for the following settlement services-<BR><BR>

<strong>$325 Closing Fee<br>
$150 Title Examination</strong><br>


<br>
You are not required to use Streamline Title & Escrow Services, L.L.C. or First Title & Escrow, Inc. as a condition for settlement of your loan on (or purchase, sale, or refinance of) the subject property. THERE ARE FREQUENTLY OTHER SETTLEMENT SERVICE PROVIDERS AVAILABLE WITH SIMILAR SERVICES. YOU ARE FREE TO SHOP AROUND TO DETERMINE THAT YOU ARE RECEIVING THE BEST SERVICES AND THE BEST RATE FOR THESE SERVICES.<br><br>

Please note: Title company charges shown above do not include "personal service fees" or other charges payable to outside vendors for services such as surveys, title abstracts, courier, wire transfers, termite reports, or home inspections, etc.<br><br><br>

<strong><u>ACKNOWLEDGMENT</u></strong><br><br>

I/we have read this disclosure form, and understand that Shapiro & Burson, LLP, may be referring me/us to purchase the above-described settlement services from Streamline Title & Escrow Services, LLC, and may receive a financial or other benefit as the result of this referral.<br><br>
<br>
<br>

<table border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="150" align="left"><cfoutput>#get_titleid.bfirstname1# <cfif Len(get_titleid.bminame1)>#get_titleid.bminame1#. </cfif>#get_titleid.blastname1#</cfoutput>:</td>
    <td width="200">______________________________</td>
    <td width="25">&nbsp;&nbsp;&nbsp;</td>
    <td width="300">Date: ______________________________</td>
  </tr>
</table>

<cfif Len(get_titleid.blastname2)>
<table border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="150" align="left"><cfoutput>#get_titleid.bfirstname2# <cfif Len(get_titleid.bminame2)>#get_titleid.bminame2#. </cfif>#get_titleid.blastname2#</cfoutput>:</td>
    <td width="200">______________________________</td>
    <td width="25">&nbsp;&nbsp;&nbsp;</td>
    <td width="300">Date: ______________________________</td>
  </tr>
 </table>
  <cfelse><br>

 </cfif>

 <cfif Len(get_titleid.blastname3)>
<table border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="150" align="left"><cfoutput>#get_titleid.bfirstname3# <cfif Len(get_titleid.bminame3)>#get_titleid.bminame3#. </cfif>#get_titleid.blastname3#</cfoutput>:</td>
    <td width="200">______________________________</td>
    <td width="25">&nbsp;&nbsp;&nbsp;</td>
    <td width="300">Date: ______________________________</td>
  </tr>
</table>
<cfelse><br>

</cfif>

  <cfif Len(get_titleid.blastname4)>
<table border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="150" align="left"><cfoutput>#get_titleid.bfirstname4# <cfif Len(get_titleid.bminame4)>#get_titleid.bminame4#. </cfif>#get_titleid.blastname4#</cfoutput>:</td>
    <td width="200">______________________________</td>
    <td width="25">&nbsp;&nbsp;&nbsp;</td>
    <td width="300">Date: ______________________________</td>
  </tr>
  </table>
<cfelse><br>

 </cfif>


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


		</td>
	</tr>
</table>
	<!--- end of page 5 ---->
</IE:DEVICERECT>
</cfform>


</body>
</html>