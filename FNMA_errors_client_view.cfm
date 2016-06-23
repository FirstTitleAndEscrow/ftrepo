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


<table width="800" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>

<br>

<p align="center"><font size="+1"><strong><strong>ERRORS AND OMISSIONS CORRECTION AGREEMENT</strong>
</strong><br></P>
<br></font>

<table width="775" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="150" align="left" valign="top">LENDER:</td>
    <td width="225" align="left" valign="top"><cfoutput><cfif get_titleid.recordcount and Len(mods.lender)>#mods.lender#</cfif></cfoutput></td>
    <td width="150" align="left" valign="top">&nbsp;</td>
    <td width="200" align="left" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td>BORROWER(S):</td>
    <td><cfoutput>#get_titleid.bfirstname1# <cfif Len(get_titleid.bminame1)>#get_titleid.bminame1#. </cfif>#get_titleid.blastname1#<cfif Len(get_titleid.blastname2)>, #get_titleid.bfirstname2# <cfif Len(get_titleid.bminame2)>#get_titleid.bminame2#. </cfif>#get_titleid.blastname2#</cfif><cfif Len(get_titleid.blastname3)>, #get_titleid.bfirstname3# <cfif Len(get_titleid.bminame3)>#get_titleid.bminame3#. </cfif>#get_titleid.blastname3#</cfif><cfif Len(get_titleid.blastname4)>, #get_titleid.bfirstname4# <cfif Len(get_titleid.bminame4)>#get_titleid.bminame4#. </cfif>#get_titleid.blastname4#</cfif></cfoutput></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>LOAN NO:</td>
    <td><cfoutput><cfif get_titleid.recordcount and Len(get_titleid.fannie_loan_id)>#get_titleid.fannie_loan_id#</cfif></cfoutput></td>
    <td ALIGN="RIGHT">REO CASE NO:&nbsp;&nbsp;</td>
    <td><cfoutput><cfif get_titleid.recordcount and Len(get_titleid.fannie_reo_id)>#get_titleid.fannie_reo_id#
</cfif></cfoutput></td>
  </tr>
  <tr>
    <td>PROPERTY:</td>
    <td colspan=3><cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput></td>
  </tr>
</table>
<br>
<br>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;For a good and valuable consideration, and as a condition of the extension of credit evidenced by the above referenced loan, the Borrower(s) and Seller(s) [if any] agree, if requested by the Note Holder, Lender, Representative or Agent for Lender and/or Mortgage Broker (herein "Lender"), to cooperate as hereinafter set forth.<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;In the event any of the documents evidencing and/or securing the above referenced loan misstate or inaccurately reflect the true and correct terms and provisions of the loan, Borrower(s) and any Seller(s) shall upon request by Lender and in order to correct such misstatement and inaccuracy, execute such new documents or initial such corrected original documents as Lender may deem necessary to remedy said inaccuracy or mistake.
<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The agreements contained herein shall apply whether said misstatement or inaccuracy is due to unilateral mistake on the part of the Lender or Borrower(s) or any Seller(s), mutual mistake on the part of Lender and Borrower(s) and any Seller(s) or clerical error on the part of any party to the transaction.
<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Failure by the party to initial or execute such documents as and when requested hereunder shall constitute a breach of the contractual agreement evidenced hereby and shall also constitute a default under the Note evidencing and Deed of Trust or other security instrument securing the loan.
<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This Agreement shall be binding on the signatories hereto, their heirs and assigns and shall inure to the benefit of Lender, it successor, and assigns.
<br>
<br>
Time is of the essence concerning all agreements contained herein.<br>
<br>
<br>
Dated the ______________________ day of _____________________________________ , <cfoutput>#Year(Now())#</cfoutput><br>
<br>
<br>
<br>
<table width="775" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="400" align="left" valign="top">X______________________________________<br>
<cfoutput>#get_titleid.bfirstname1# <cfif Len(get_titleid.bminame1)>#get_titleid.bminame1#. </cfif>#get_titleid.blastname1#</cfoutput><br>
<br>
<br>
<cfif Len(get_titleid.blastname2)>
X______________________________________<br>
#get_titleid.bfirstname2# <cfif Len(get_titleid.bminame2)>#get_titleid.bminame2#. </cfif>#get_titleid.blastname2#<br>
<br>
<br>
</cfif>
<cfif Len(get_titleid.blastname3)>
X______________________________________<br>
#get_titleid.bfirstname3# <cfif Len(get_titleid.bminame3)>#get_titleid.bminame3#. </cfif>#get_titleid.blastname3#<br>
<br>
<br>
</cfif>
<cfif Len(get_titleid.blastname4)>
X______________________________________<br>
#get_titleid.bfirstname4# <cfif Len(get_titleid.bminame4)>#get_titleid.bminame4#. </cfif>#get_titleid.blastname4#<br>
<br>
<br>
</cfif>
</td>
    <td width="375" align="left" valign="top">Steve Sacks Signature here<br><br>
Seller: Steve E. Sacks<br><br>
<em><strong>Attorney in Fact</strong></em></td>
  </tr>
</table>
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


<div align="right">EXHIBIT D&nbsp;&nbsp;&nbsp;</div>


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
