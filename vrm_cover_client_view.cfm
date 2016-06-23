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


<h2>VRM Deed Cover Sheet</h2>
<br><br>
<table  cellpadding="5" cellspacing="0" border="0">
	<tr>
		<td><b>VRM Asset #:</b></td>
		<td><cfoutput>#get_titleid.reo_number#</cfoutput></td>
	</tr>
	<tr>
		<td><b>VRM Loan #:</b></td>
		<td><cfoutput>#get_titleid.loan_number#</cfoutput></td>
	</tr>
	<tr>
		<td><b>Closing Vendor:</b></td>
		<td>First Title and Escrow</td>
	</tr>
	<tr>
		<td><b>Type of Deed:</b></td>
		<td><cfoutput>#mods.type_of_deed#</cfoutput></td>
	</tr>
	<tr>
		<td valign="top"><b>Property Address:</b></td>
		<td><cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput></td>
	</tr>
	<tr><td colspan="2"><b>State Specific (Deed) or Special Instructions<br> (i.e. deed needs overnighting directly to buyers closing vendor, please provide overnight label):</b></td></tr>
	<tr><td colspan="2">
	<cfoutput>#mods.state_specific_deed#</cfoutput>
	</td></tr>
	
</table>
<!--- end of page 1 ---->
</IE:DEVICERECT>


</body>
</html>
