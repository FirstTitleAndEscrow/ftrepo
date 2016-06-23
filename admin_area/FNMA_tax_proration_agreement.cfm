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
<CFFORM NAME="frm" ACTION="./FNMA_TC_wire_inst_email.cfm?rec_id=#rec_id#" METHOD="POST">
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


<CFFORM NAME="modform" ACTION="./FNMA_TC_wire_inst_final.cfm?rec_id=#rec_id#" METHOD="POST">
<IE:DEVICERECT ID="page1" CLASS="" MEDIA="print">


<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>

<br>
<table border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="400">FANNIE MAE LOAN #: <cfoutput><cfif get_titleid.recordcount and Len(get_titleid.fannie_loan_id)>
<INPUT NAME="fannie_loan_id" SIZE=20 MAXLENGTH=20 style="font-size: 10;
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
									clear: none;" value="#get_titleid.fannie_loan_id#"><cfelse>
									<INPUT NAME="fannie_loan_id" SIZE=20 MAXLENGTH=20 style="font-size: 10;
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
    <td>REO #: <cfoutput><cfif get_titleid.recordcount and Len(get_titleid.fannie_reo_id)>
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

<br><br>


<p align="center"><font size="+2"><strong>TAX PRORATION AGREEMENT</strong><br>
<br></font>
____________________<br>
(DATE)</p><br>
<br>

<table border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="50">RE:</td>
    <td width="200">Title Company GF #:</td>
    <td width="200"><cfoutput><cfif mods.recordcount and Len(mods.title_co_gf)>
<INPUT NAME="title_co_gf" SIZE=20 MAXLENGTH=20 style="font-size: 9;
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
									clear: none;" value="#mods.title_co_gf#"><cfelse>
									<INPUT NAME="title_co_gf" SIZE=20 MAXLENGTH=20 style="font-size: 9;
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
  <tr>
    <td>&nbsp;</td>
    <td>Seller:</td>
    <td><cfoutput>#get_titleid.sfirstname1# <cfif Len(get_titleid.sminame1)>#get_titleid.sminame1#. </cfif>#get_titleid.slastname1#<cfif Len(get_titleid.slastname2)>, #get_titleid.sfirstname2# <cfif Len(get_titleid.sminame2)>#get_titleid.sminame2#. </cfif>#get_titleid.slastname2#</cfif></cfoutput></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Purchaser:</td>
    <td><cfoutput>#get_titleid.bfirstname1# <cfif Len(get_titleid.bminame1)>#get_titleid.bminame1#. </cfif>#get_titleid.blastname1#<cfif Len(get_titleid.blastname2)>, #get_titleid.bfirstname2# <cfif Len(get_titleid.bminame2)>#get_titleid.bminame2#. </cfif>#get_titleid.blastname2#</cfif><cfif Len(get_titleid.blastname3)>, #get_titleid.bfirstname3# <cfif Len(get_titleid.bminame3)>#get_titleid.bminame3#. </cfif>#get_titleid.blastname3#</cfif><cfif Len(get_titleid.blastname4)>, #get_titleid.bfirstname4# <cfif Len(get_titleid.bminame4)>#get_titleid.bminame4#. </cfif>#get_titleid.blastname4#</cfif></cfoutput></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>Property Address:</td>
    <td><cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput></td>
  </tr>
</table>
<br>
<br>
The undersigned Purchaser(s) and Seller of the above referenced property acknowledge that they have been advised that the tax rolls may carry said property within a larger tract of land and/or as unimproved or partially improved property.<br>
<br>

The undersigned agree to the proration of taxes based on an estimate or actual taxes from the previous year on the above referenced property. Further, the undersigned hereby agree that the prorations are final and any difference will not be adjusted by the Seller after closing.<br>
<br>

Sincerely,<br>
<br>
<table border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="200">Seller:</td>
    <td width="500">FANNIE MAE</td>
  </tr>
  <tr>
    <td width="200">By:</td>
    <td width="500">Steve Sacks Signature</td>
  </tr>
  <tr>
    <td width="200">Title:</td>
    <td width="500">Attorney in Fact</td>
  </tr>
  <tr>
    <td width="200">Purchaser(s):</td>
    <td width="500">______________________________&nbsp;<cfoutput>#get_titleid.sfirstname1# <cfif Len(get_titleid.sminame1)>#get_titleid.sminame1#. </cfif>#get_titleid.slastname1#</cfoutput></td>
  </tr>
<cfif Len(get_titleid.slastname2)>
  <tr>
    <td width="200">&nbsp;</td>
    <td width="500">______________________________ &nbsp;, #get_titleid.sfirstname2# <cfif Len(get_titleid.sminame2)>#get_titleid.sminame2#. </cfif>#get_titleid.slastname2#</td>
  </tr>
</cfif>
  <tr>
    <td width="200">Title Company Closer:</td>
    <td width="500">______________________________ </td>
  </tr>
</table>

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
