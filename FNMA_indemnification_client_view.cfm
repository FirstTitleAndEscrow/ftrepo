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
<center><B>AFFIDAVIT AND INDEMNIFICATION AS TO DEBTS AND LIENS</B></center><br>

<table border="0" cellspacing="2" cellpadding="2">
<tr>
    <td>REO CASE #: <cfoutput><cfif get_titleid.recordcount and Len(get_titleid.fannie_reo_id)>#get_titleid.fannie_reo_id#</cfif></cfoutput></td>
  </tr>
  <tr>
    <td>FANNIE MAE LOAN #: <cfoutput><cfif get_titleid.recordcount and Len(get_titleid.fannie_loan_id)>#get_titleid.fannie_loan_id#</cfif></cfoutput></td></tr>

  <tr>
    <td>Subject Property: <cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput></td></tr>
</table>

<br>
<center><B>AFFIDAVIT</B></center><br><br>


STATE OF <cfoutput>#get_titleid.pstate#</cfoutput> <br>
<br>

COUNTY OF <cfoutput>#get_titleid.pcounty#</cfoutput><br>
<br>


Upon oath, on this day of <cfoutput>#dateformat(get_titleid.a_insert_date, "mm/dd/yyyy")#</cfoutput>, Fannie Mae deposes, says and represents that, to the best of its knowledge, all debts for plumbing fixtures, water heaters, floor fences, air conditioners, radio or television antenna, carpeting, rugs, lawn sprinkling systems, venetian blinds, window shades, draperies, electrical appliances, fences, street paving, any construction management services, rental equipment, appliances and tools or any personal property or fixtures that are located on the subject property or for labor and material used in the construction, alteration, repair or removal of improvements on the subject property have now or will be paid.<br>
<br>

FANNIE MAE <br>
<br>

By:____________________________<br>
<br>

Title:   Attorney in Fact

<br>
<br>

SUBSCRIBED AND SWORN TO BEFORE ME on this ____________________________________day of <cfoutput>#Year(Now())#</cfoutput>.<br>
<br>
<br>
<table width="800" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="400">&nbsp;</td>
    <td>______________________________________<br>
Notary Public in and for the State of Maryland<br>
Tina L. Taylor<BR>
Exp 01/11/2010<br></td>
  </tr>
</table>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>

<center><B>INDEMNIFICATION</B></center><br>
<br>

In consideration of	____________________________________________________________________. having an address of
______________________________________________________ ("Title Company") issuing a title insurance policy without exception<br>
for any debts, presently existing, for unrecorded lien or right to a lien for services, labor or material and for other good and valuable<br>
consideration, receipt of which is hereby acknowledged, Fannie Mae agrees to indemnify, defend and hold Title Company harmless from <br>
and against any and all claims, demands, or causes of action, of any kind or nature, arising as a result of the existence of <br>
such debts or liens.<br>
<br>

FANNIE MAE <br>
<br>

By:____________________________<br>
<br>

Title:   Attorney in Fact

<br>
<br>
<table>
<tr>
<td wdith=400><cfoutput>#get_titleid.sfirstname1# <cfif Len(get_titleid.sminame1)>#get_titleid.sminame1#. </cfif>#get_titleid.slastname1#</cfoutput></td>
<td wdith=400>___________________________________________________</td>
</tr>
<cfif Len(get_titleid.slastname2)>
<tr>
<td wdith=400><cfoutput>#get_titleid.sfirstname2# <cfif Len(get_titleid.sminame2)>#get_titleid.sminame2#. </cfif>#get_titleid.slastname2#</cfoutput></td>
<td wdith=400>___________________________________________________</td>
</tr>
</cfif>
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
