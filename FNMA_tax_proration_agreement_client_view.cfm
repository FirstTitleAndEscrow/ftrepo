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


<table width="98%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>

<br>
<table border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="400">FANNIE MAE LOAN #: <cfoutput><cfif get_titleid.recordcount and Len(get_titleid.fannie_loan_id)>#get_titleid.fannie_loan_id#</cfif></cfoutput></td>
    <td>REO #: <cfoutput><cfif get_titleid.recordcount and Len(get_titleid.fannie_reo_id)>#get_titleid.fannie_reo_id#</cfif></cfoutput></td>
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
    <td width="200"><cfoutput><cfif mods.recordcount and Len(mods.title_co_gf)>#mods.title_co_gf#</cfif></cfoutput></td>
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
