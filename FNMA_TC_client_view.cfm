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

<CFQUERY datasource="#request.dsn#" NAME="read_title_closer">

			SELECT *
			FROM Doc_closer_Title
			WHERE title_ID = #rec_id#

		</CFQUERY>
 <CFQUERY datasource="#request.dsn#" NAME="read_assigned_closer">

			SELECT *
			FROM closer
			WHERE closer_ID = '#read_title_closer.closer_ID#' and closer.status is null

		</CFQUERY>

<cfparam name="read_assigned_closer.company" default="">
<cfparam name="read_assigned_closer.fname" default="">
<cfparam name="read_assigned_closer.lname" default="">


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
		<font size=+3><p align="center"><br>
<strong><u>VERY IMPORTANT<BR><BR>
FANNIE MAE CAN VOID ANY TRANSACTION IF YOUR COMPANY DOES NOT COMPLY WITH THE FOLLOWING:</u></strong></P><BR>
<P><ol><li>PLEASE HAVE THE BUYER(S) SIGN THE ATTACHED FANNIE MAE DOCUMENTS WHERE INDICATED.<BR><BR></li>
<li>IMMEDIATLEY AFTER CLOSING EMAIL AND OR FAX A <u>COPY OF THE SIGNED DOCUMENTS AND THE BUYER SIGNED HUD THIS IS A 'MUST PER FANNIE MAE RULES'</u>.<BR><BR></li>
<li>MAIL ALL ORIGINALS ALONG WITH OUR SELLER REP. FEE CHECK TO THE ADDRESS BELOW.<BR><BR></li></ol>
</P>
<p align="center"><br>Thank you, <cfoutput>#read_assigned_closer.company#</cfoutput><BR>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
30 West Gude Drive, Suite 450<BR>
Rockville, MD 20850<BR>
<cfelse>
7361 Calhoun Place, Suite 200<BR>
Rockville, MD 20855<BR>
</cfif>
P: 301-315-81.40 EXT.<cfoutput> #read_assigned_closer.fname# #read_assigned_closer.lname# <cfif read_assigned_closer.fname eq 'Ana'>361<cfelseif read_assigned_closer.fname eq 'Ricarda'>392</cfif></cfoutput>.<BR>
F: 301-315-8153<BR>
<cfoutput>#read_assigned_closer.email#</cfoutput><BR><BR>

</td>
	</tr>
</table>
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
