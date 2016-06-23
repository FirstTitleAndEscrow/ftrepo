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
			SELECT *
			FROM First_title_states
			WHERE st_abbrev = '#get_titleid.pstate#'
</CFQUERY>
<cfset full_state_name = get_state.st_name>


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
<CFFORM NAME="frm" ACTION="./FNMA_VA_deed_email.cfm?rec_id=#rec_id#" METHOD="POST">
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
<HR></div>

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


<CFFORM NAME="modform" ACTION="./FNMA_VA_deed_final.cfm?rec_id=#rec_id#" METHOD="POST">
<IE:DEVICERECT ID="page1" CLASS="" MEDIA="print">


<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>

<br>

<table border="0" cellspacing="2" cellpadding="2">
<tr>
    <td>Considertaion: <cfoutput><cfif get_titleid.recordcount and Len(get_titleid.purchase)>#DollarFormat(get_titleid.purchase)#</cfif></cfoutput></td>
  </tr>
  <tr>
    <td>Tax ID: <cfoutput><cfif mods.recordcount and Len(mods.prop_tax_id)>
<INPUT NAME="prop_tax_id" SIZE=20 MAXLENGTH=20 style="font-size: 10;
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
									clear: none;" value="#mods.prop_tax_id#"><cfelse>
									<INPUT NAME="prop_tax_id" SIZE=20 MAXLENGTH=20 style="font-size: 10;
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
</cfif></cfoutput></td></tr>

  <tr>
    <td>File: T-<cfoutput>#get_titleid.title_id#</cfoutput></td></tr>


  <tr>
    <td>Assessed Value: <cfoutput><cfif mods.recordcount and Len(mods.assessed_value)>
<INPUT NAME="assessed_value" SIZE=20 MAXLENGTH=20 style="font-size: 10;
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
									clear: none;" value="#mods.assessed_value#"><cfelse>
									<INPUT NAME="assessed_value" SIZE=20 MAXLENGTH=20 style="font-size: 10;
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
</cfif></cfoutput></td></tr>
  <tr>
    <td>EXEMPT FROM TRANSFER TAXES PER 12 U.S. CODE SECTION 1452(e)</td></tr>
  <tr>
    <td>Title Insurer: Stewart Title</td></tr>

</table>



<br>
<center><B><u>SPECIAL WARRANTY DEED</u></B></center><br><br>


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>THIS DEED, made this __<u><cfoutput>#dateFormat(get_titleid.a_insert_date, "d")#</cfoutput> day of <cfoutput>#UCase(dateFormat(get_titleid.a_insert_date, "mmmm"))#</cfoutput>, <cfoutput>#dateFormat(get_titleid.a_insert_date, "yyyy")#</cfoutput></u>__, by and between FANNIE MAE, A/K/A FEDERAL NATIONAL MORTGAGE ASSOCIATION, a federal chartered corporation organized and existing under the laws of the United States of America, Grantor, Purchaser(s), Grantees, purchasing property known as <cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput></strong><br>
<br>
<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM title_ins_add
			where title_id = #url.rec_id# and type = 'DATA' AND seq_num = 1
		</CFQUERY>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;WITNESSETH, that in consideration of the sum of __________________________________________ (<cfoutput>#DollarFormat(get_titleid.purchase)#</cfoutput>) <br>
cash in hand paid and other good and valuable consideration, the receipt and sufficiency of which is herby acknowledged, the Grantor does grant and convey unto <cfoutput>#get_titleid.bfirstname1# <cfif Len(get_titleid.bminame1)>#get_titleid.bminame1#. </cfif>#get_titleid.blastname1#<cfif Len(get_titleid.blastname2)>, #get_titleid.bfirstname2# <cfif Len(get_titleid.bminame2)>#get_titleid.bminame2#. </cfif>#get_titleid.blastname2#</cfif><cfif Len(get_titleid.blastname3)>, #get_titleid.bfirstname3# <cfif Len(get_titleid.bminame3)>#get_titleid.bminame3#. </cfif>#get_titleid.blastname3#</cfif><cfif Len(get_titleid.blastname4)>, #get_titleid.bfirstname4# <cfif Len(get_titleid.bminame4)>#get_titleid.bminame4#. </cfif>#get_titleid.blastname4#</cfif></cfoutput>, the Grantee(s), his/her/their successors and assigns, in <cfoutput>#read_report.data5#</cfoutput>, Tenancy being taken by Purchaser(s) AS <cfoutput>#UCase(read_report.data6)#</cfoutput>, any and all right, title and interest it may possess in and to all of that certain lot, piece or parcel of real property, together with all rights of way, easements, improvements, buildings and appurtenances, thereunto belonging, lying and being in the CITY OF <cfoutput>#Ucase(get_titleid.pcity)#</cfoutput>, COUNTY OF <cfoutput>#Ucase(get_titleid.pcounty)#</cfoutput>, described as follows to wit:<br>
<br>

		<strong><blockquote>Legal Description: <cfoutput>#read_report.notes#</cfoutput><BR><BR>

Also known as:  <cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput><BR>
This conveyance is made expressly subject to all restrictions, conditions, rights-of-way and easements, if any, contained in the instruments constituting the chain of title to the property herein conveyed.</blockquote></strong>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The Grantor covenants that it will warranty specially the property hereby conveyed; and that it will execute such further assurances of said land as may be requisite.<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IN WITNESS WHEREOF, the Grantor, <strong>FEDERAL NATIONAL MORTGAGE ASSOCIATION</strong> has on this __<u><cfoutput>#dateFormat(get_titleid.a_insert_date, "d")#</cfoutput> day of <cfoutput>#UCase(dateFormat(get_titleid.a_insert_date, "mmmm"))#</cfoutput>, <cfoutput>#dateFormat(get_titleid.a_insert_date, "yyyy")#</cfoutput></u>__ caused these presents to be signed by SHAPIRO & BURSON, LLP, its Attorney in Fact, pursuant to that certain Power of Attorney recorded <cfoutput><cfif mods.recordcount and Len(mods.poa_info)>
<INPUT NAME="poa_info" SIZE=70 MAXLENGTH=70 style="font-size: 9;
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
									clear: none;" value="#mods.poa_info#"><cfelse>
									<INPUT NAME="poa_info" SIZE=70 MAXLENGTH=70 style="font-size: 9;
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
</cfif></cfoutput> among the Land Records of City: <cfoutput>#Ucase(get_titleid.pcity)#</cfoutput>, County:  <cfoutput>#Ucase(get_titleid.pcounty)#</cfoutput>.  The undersigned Attorney in Fact has no actual knowledge or notice of the revocation or termination of the aforementioned Power of Attorney.<br>
<br>

<center>
<strong>FEDERAL NATIONAL MORTGAGE ASSOCIATION</strong><BR>
BY: SHAPIRO & BURSON, LLP, ATTORNEY-IN-FACT
</center><br>
<br>
<table width="800" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width=500 align="right">BY:</td>
    <td>____________________________________________</td>
  </tr>
  <tr>
    <td width=500 align="right">Name:</td>
    <td>Steve E. Sacks</td>
  </tr>
  <tr>
    <td width=500 align="right">Title:</td>
    <td>Authorized Agent</td>
  </tr>
</table>
<br>
<br>


<cfoutput>STATE OF #Ucase(full_state_name)#<BR>
COUNTY OF #UCase(get_titleid.pcounty)#<br>
</cfoutput><br>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;I, Tina L. Taylor, a Notary Public in and for the jurisdiction aforesaid, do hereby certify that Steve E. Sacks, authorized agent on behalf of Shapiro & Burson, LLP, attorney-in-fact for FEDERAL NATIONAL MORTGAGE ASSOCIATION, who is personally well known to me as the person named in capacity to execute the foregoing and annexed deed, bearing date on the __<u><cfoutput>#dateFormat(get_titleid.a_insert_date, "d")#</cfoutput> day of <cfoutput>#UCase(dateFormat(get_titleid.a_insert_date, "mmmm"))#</cfoutput>, <cfoutput>#dateFormat(get_titleid.a_insert_date, "yyyy")#</cfoutput></u>__, personally appeared before me in the said jurisdiction and by virtue of the power vested in him/her acknowledged the same to be the act and deed of FEDERAL NATIONAL MORTGAGE ASSOCIATION.

<table width="800" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width=500 align="right">&nbsp;</td>
    <td>____________________________________________</td>
  </tr>
  <tr>
    <td width=500 align="right">&nbsp;</td>
    <td>Notary Public: Tina L. Taylor</td>
  </tr>
  <tr>
    <td width=500 align="right">&nbsp;</td>
    <td>My Commission Expires: 01-11-2010</td>
  </tr>
</table><br>
<br>

<strong>GRANTEE ADDRESS:  <cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput><br></strong>
<br>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;THIS IS TO CERTIFY that the within Deed was prepared by, or under the supervision of the undersigned, an Attorney duly admitted to practice before the Court of Appeals of Maryland.<br>
<br>

<table width="800" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width=500 align="right">&nbsp;</td>
    <td>____________________________________________</td>
  </tr>
  <tr>
    <td width=500 align="right">&nbsp;</td>
    <td>&nbsp;Attorney   Steve E. Sacks</td>
  </tr>
</table>

<cfif NOT DateDiff("d", Now(), "1/30/2012")>
<strong>RETURN TO:<br>
Streamline Title & Escrow<br>
30 W. Gude Drive<br>
Suite 450<br>
Rockville, Maryland 20850<br>
T-<cfoutput>#get_titleid.title_id#</cfoutput><br></strong>
<cfelse>
<strong>RETURN TO:<br>
Streamline Title & Escrow<br>
7361 Calhoun Place<br>
Suite 200<br>
Rockville, Maryland 20855<br>
T-<cfoutput>#get_titleid.title_id#</cfoutput><br></strong>
</cfif>

<br>

<br>
<br>
<input type=image border=0 src="./images/button_modify.gif"><br>
</td>
	</tr>
</table>
<!--- end of page 1 ---->
</IE:DEVICERECT>

</cfform>


</body>
</html>
