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
			FROM Closing_Form_mods
			WHERE Title_ID = #rec_ID#

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
</div>

<IE:DEVICERECT ID="page1" CLASS="masterstyle" MEDIA="print">


<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>

<br>

<table border="0" cellspacing="2" cellpadding="2">
<tr>
    <td>Considertaion: <cfoutput><cfif get_titleid.recordcount and Len(get_titleid.purchase)>#DollarFormat(get_titleid.purchase)#</cfif></cfoutput></td>
  </tr>
  <tr>
    <td>G-PIN/MAP/TAX ACCOUNT: <cfoutput><cfif mods.recordcount and Len(mods.prop_tax_id)>#mods.prop_tax_id#</cfif></cfoutput></td></tr>

  <tr>
    <td>File: T-<cfoutput>#get_titleid.title_id#</cfoutput></td></tr>


  <tr>
    <td>Assessed Value: <cfoutput><cfif mods.recordcount and Len(mods.assessed_value)>#mods.assessed_value#</cfif></cfoutput></td></tr>
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
cash in hand paid and other good and valuable consideration, the receipt and sufficiency of which is herby acknowledged, the Grantor does grant and convey unto <cfoutput>#get_titleid.bfirstname1# <cfif Len(get_titleid.bminame1)>#get_titleid.bminame1#. </cfif>#get_titleid.blastname1#<cfif Len(get_titleid.blastname2)>, #get_titleid.bfirstname2# <cfif Len(get_titleid.bminame2)>#get_titleid.bminame2#. </cfif>#get_titleid.blastname2#</cfif><cfif Len(get_titleid.blastname3)>, #get_titleid.bfirstname3# <cfif Len(get_titleid.bminame3)>#get_titleid.bminame3#. </cfif>#get_titleid.blastname3#</cfif><cfif Len(get_titleid.blastname4)>, #get_titleid.bfirstname4# <cfif Len(get_titleid.bminame4)>#get_titleid.bminame4#. </cfif>#get_titleid.blastname4#</cfif></cfoutput>, the Grantee(s), his/her/their successors and assigns, in <cfoutput>#read_report.data5#</cfoutput>, Tenancy being taken by Purchaser(s) AS <cfoutput>#UCase(read_report.data6)#</cfoutput>, any and all right, title and interest it may possess in and to all of that certain lot, piece or parcel of real property, together with all rights of way, easements, improvements, buildings and appurtenances, thereunto belonging, lying and being in the COUNTY OF <cfoutput>#Ucase(get_titleid.pcounty)#</cfoutput>, COMMONWEALTH OF <cfoutput>#Ucase(full_state_name)#</cfoutput>, described as follows to wit:<br>
<br>

		<strong><blockquote>Legal Description: <cfoutput>#read_report.notes#</cfoutput><BR><BR>

Also known as:  <cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput><BR>
This conveyance is made expressly subject to all restrictions, conditions, rights-of-way and easements, if any, contained in the instruments constituting the chain of title to the property herein conveyed.</blockquote></strong>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The Grantor covenants that it will warranty specially the property hereby conveyed; and that it will execute such further assurances of said land as may be requisite.<br>
<br><br>
<br>
</td></tr></table>
</IE:DEVICERECT>


<IE:DEVICERECT ID="page2" CLASS="masterstyle" MEDIA="print">


<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>

<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;IN WITNESS WHEREOF, the Grantor, <strong>FEDERAL NATIONAL MORTGAGE ASSOCIATION</strong> has on this __<u><cfoutput>#dateFormat(get_titleid.a_insert_date, "d")#</cfoutput> day of <cfoutput>#UCase(dateFormat(get_titleid.a_insert_date, "mmmm"))#</cfoutput>, <cfoutput>#dateFormat(get_titleid.a_insert_date, "yyyy")#</cfoutput></u>__ caused these presents to be signed by SHAPIRO & BURSON, LLP, its Attorney in Fact, pursuant to that certain Power of Attorney recorded <cfoutput><cfif mods.recordcount and Len(mods.poa_info)>#mods.poa_info#</cfif></cfoutput> among the Land Records of County: <cfoutput>#Ucase(get_titleid.pcounty)#, #Ucase(full_state_name)#</cfoutput>.  The undersigned Attorney in Fact has no actual knowledge or notice of the revocation or termination of the aforementioned Power of Attorney.<br>
<br>

<center>
<strong>FEDERAL NATIONAL MORTGAGE ASSOCIATION</strong><BR>
BY: SHAPIRO & BURSON, LLP, ATTORNEY-IN-FACT
</center><br>
<br>
<table width="800" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width=400 align="right">BY:</td>
    <td>____________________________________________</td>
  </tr>
  <tr>
    <td width=400 align="right">Name:</td>
    <td>Steve E. Sacks</td>
  </tr>
  <tr>
    <td width=400 align="right">Title:</td>
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
    <td width=400 align="right">&nbsp;</td>
    <td>____________________________________________</td>
  </tr>
  <tr>
    <td width=400 align="right">&nbsp;</td>
    <td>Notary Public: Tina L. Taylor</td>
  </tr>
  <tr>
    <td width=400 align="right">&nbsp;</td>
    <td>My Commission Expires: 01-11-2010</td>
  </tr>
</table><br>
<br>

<strong>GRANTEE ADDRESS:  <cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput><br>
<br>


Prepared by:<br>
Steven E. Sacks<br>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
30 W. Gude Drive, Suite 450<br>
Rockville, Maryland 20850<br><br>
<cfelse>
7361 Calhoun Place, Suite 200<br>
Rockville, Maryland 20855<br><br>
</cfif>RETURN TO:<br>
Streamline Title & Escrow<br>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
30 W. Gude Drive<br>
Suite 450<br>
Rockville, Maryland 20850<br>
<cfelse>
7361 Calhoun Place<br>
Suite 200<br>
Rockville, Maryland 20855<br>
</cfif>T-<cfoutput>#get_titleid.title_id#</cfoutput><br></strong>
<br>


</td>
	</tr>
</table>
<!--- end of page 1 ---->
</IE:DEVICERECT>

<script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body>
</html>
