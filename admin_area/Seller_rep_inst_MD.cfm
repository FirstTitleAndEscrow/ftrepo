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
<CFQUERY datasource="#request.dsn#" NAME="get_user">
			SELECT *
			FROM first_admin
			WHERE ID = #session.ft_user_id#
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
<CFFORM NAME="frm" ACTION="./Seller_rep_inst_MD_email.cfm?rec_id=#rec_id#" METHOD="POST">
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


<CFFORM NAME="modform" ACTION="./seller_rep_inst_MD_final.cfm?rec_id=#rec_id#" METHOD="POST">
<IE:DEVICERECT ID="page1" CLASS="" MEDIA="print">

<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
		<p align="center"><br>
<strong><u>SELLER CLOSING INSTRUCTIONS</u></strong></p>
<br>
<br>
<strong>Date: <cfoutput><cfif mods.recordcount and Len(mods.doc_date)>
<INPUT NAME="doc_date" SIZE=20 MAXLENGTH=20 style="font-size: 9;
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
									clear: none;" value="#DateFormat(mods.doc_date, 'm/d/yyyy')#"><cfelse>
									<INPUT NAME="doc_date" SIZE=20 MAXLENGTH=20 style="font-size: 9;
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
									clear: none;" value="#DateFormat(Now(), 'm/d/yyyy')#">
</cfif></cfoutput><br>
Re: <cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput><br>
Purchasers: <cfoutput>#get_titleid.bfirstname1# <cfif Len(get_titleid.bminame1)>#get_titleid.bminame1#. </cfif>#get_titleid.blastname1#<cfif Len(get_titleid.blastname2)>, #get_titleid.bfirstname2# <cfif Len(get_titleid.bminame2)>#get_titleid.bminame2#. </cfif>#get_titleid.blastname2#</cfif><cfif Len(get_titleid.blastname3)>, #get_titleid.bfirstname3# <cfif Len(get_titleid.bminame3)>#get_titleid.bminame3#. </cfif>#get_titleid.blastname3#</cfif><cfif Len(get_titleid.blastname4)>, #get_titleid.bfirstname4# <cfif Len(get_titleid.bminame4)>#get_titleid.bminame4#. </cfif>#get_titleid.blastname4#</cfif></cfoutput><br>
To:   <cfoutput><cfif mods.recordcount and Len(mods.title_co)>
<INPUT NAME="title_co" SIZE=70 MAXLENGTH=70 style="font-size: 9;
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
									clear: none;" value="#mods.title_co#"><cfelse>
									<INPUT NAME="title_co" SIZE=70 MAXLENGTH=70 style="font-size: 9;
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
</cfif></cfoutput></strong><br><br><br>

To Whom It May Concern:<br>
<br>
We are acting as the seller representative on the above referenced closing. <strong>PLEASE REVIEW THESE INSTRUCTIONS CAREFULLY.</strong> YOU MUST SIGN AND RETURN TO OUR OFFICE AS EVIDENCE THAT YOU HAVE REVIEWED THE INSTRUCTIONS AND FULLY UNDERSTAND THE PENALTIES IF NOT FOLLOWED. We want to insure a smooth transaction and hope that you will enjoy working with our office.<br><br>

<strong>Couple of pointers:<br>
<ol type="1"><li>Address for seller for final HUD is 5000 Plano Parkway, Carrollton, TX 75010<br></li>

<li>Seller is a government entity and is therefore exempt from grantor's tax (there will be an exemption code on your new deed); seller also does not provide corporate certification, etc.<br></li>

<li>If there is an HOA involved, seller will only pay from the date of foreclosure, which in this case is  <cfoutput><cfif mods.recordcount and Len(mods.foreclosure_date)>
<INPUT NAME="foreclosure_date" SIZE=20 MAXLENGTH=20 style="font-size: 9;
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
									clear: none;" value="#DateFormat(mods.foreclosure_date, 'm/d/yyyy')#"><cfelse>
									<INPUT NAME="doc_date" SIZE=20 MAXLENGTH=20 style="font-size: 9;
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
</cfif></cfoutput><br></li>

<li>The only title fee the seller will accept is a $25.00 wire fee<br></li>
</strong>
<br><br>
PLEASE CHARGE an Attorney Fee payable to Shapiro and Burson, LLP in the amount of $800.00.(<font color="red">775.00 if you are charging the 25.00 wire Fee</font>)  <strong>This check should be forwarded to Streamline Title & Escrow, <cfif NOT DateDiff("d", Now(), "1/30/2012")>30 W. Gude Drive, Suite 450, Rockville, MD 20850<cfelse>7361 Calhoun Place, Suite 200, Rockville, MD 20855</cfif>

 at the time of disbursement.</strong><br><br>

If you have any title clearance issues that require my assistance you will notify me in advance and provide a copy of your binder along with copies to assist me in the clearance if needed.<br><br>

For closing I will need a copy of your FINAL HUD (including all lender fees) and any payoffs for HOA dues, taxes etc. We will need WRITTEN DOCUMENTATION from the parties from the date of the foreclosure forward. This information is provided in bold above.  The final HUD, seller documents and invoices must be sent to us <strong><em><font color="red">48 hours in advance for approval along with these instructions</em></strong>.<br><br>

You will be required to send back a final hud 1 the DAY OF CLOSING or may be required to re close.  You will be required to fund <strong><em>within 48 hours of closing or a penalty will be assessed to you at a fee of $25.00 a day which should be sent to seller when funding in a separate wire</em></strong>.<br><br></font>

<strong>Please sign the below acknowledging receipt of my instructions and agreeing to the terms and return to me asap.</strong><br><br>

I have read and fully understand and acknowledge that our company will provide the information as requested in a timely manner furthermore we will be responsible for any penalties when funding after 48 hours.<br><br>

Thank you<br>
<br>
<cfoutput>#get_user.fname# #get_user.lname#<br>
Streamline Title<br>
#get_user.phone#<br>
#ReplaceNoCase(get_user.email, "firsttitleservices", "streamline-title", "All")#<br><br>
</cfoutput>

_______________________________________<br>
<strong>Authorized Signatory for Title Company</strong><br><br>

_______________________________________<br>
<strong>Printed Name of Signatory</strong><br><br>

_______________________________________<br>
<strong>Printed Name of Title Company</strong><br><br>

<input type=image border=0 src="./images/button_modify.gif">
</td>
	</tr>
</table>
<!--- end of page 1 ---->
</IE:DEVICERECT>
</cfform>


</body>
</html>
