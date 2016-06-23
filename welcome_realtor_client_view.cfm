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


<table width="500" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
<table>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
<tr>
<td align="left" valign="top" width="450"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/streamline_logo.jpg"></td>
<td align="left" valign="top" width="200"><br>
<br>
30 West Gude Drive, Suite 450<BR>
Rockville, MD 20850<BR>
301-315-8140 phone<BR>
</td>
</tr>
<cfelse>
<tr>
<td align="left" valign="top" width="450"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/streamline_logo.jpg"></td>
<td align="left" valign="top" width="200"><br>
<br>
7361 Calhoun Place, Suite 200<BR>
Rockville, MD 20855<BR>
301-315-8140 phone<BR>
</td>
</tr>
</cfif>
</table>

<br>
<div align="right">
<cfoutput><cfif mods.recordcount and IsDate(mods.welcome_create_date)>#DateFormat(mods.welcome_create_date, 'long')#</cfif></cfoutput>
</div><br>

Realtor name <cfoutput><cfif mods.recordcount and mods.realtor neq ''>#mods.realtor#</cfif></cfoutput> <br>
<br>


Via Email: <cfoutput><cfif mods.recordcount and mods.realtor_email neq ''>#mods.realtor_email#</cfif></cfoutput> <br>
<br>


	Re: Upcoming Closing on <cfoutput>#get_titleid.paddress#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip#</cfoutput><br>
	Buyer Name(s): <cfoutput><cfif get_titleid.company1 neq '' and get_titleid.company1 neq 'NULL'>#get_titleid.company1#<cfelse><cfif get_titleid.bfirstname1 neq '' and get_titleid.bfirstname1 neq 'NULL'>#get_titleid.bfirstname1#</cfif> <cfif get_titleid.bminame1 neq '' and get_titleid.bminame1 neq 'NULL'>#get_titleid.bminame1#.</cfif> <cfif get_titleid.blastname1 neq '' and get_titleid.blastname1 neq 'NULL'>#get_titleid.blastname1#</cfif><cfif get_titleid.bfirstname2 neq '' and get_titleid.bfirstname2 neq 'NULL'> and #get_titleid.bfirstname2#</cfif> <cfif get_titleid.bminame2 neq '' and get_titleid.bminame2 neq 'NULL'>#get_titleid.bminame2#.</cfif> <cfif get_titleid.blastname2 neq '' and get_titleid.blastname2 neq 'NULL'>#get_titleid.blastname2#</cfif> <cfif get_titleid.bfirstname3 neq '' and get_titleid.bfirstname3 neq 'NULL'> and #get_titleid.bfirstname3#</cfif> <cfif get_titleid.bminame3 neq '' and get_titleid.bminame3 neq 'NULL'>#get_titleid.bminame3#.</cfif> <cfif get_titleid.blastname3 neq '' and get_titleid.blastname3 neq 'NULL'>#get_titleid.blastname3#</cfif><cfif get_titleid.bfirstname4 neq '' and get_titleid.bfirstname4 neq 'NULL'> and #get_titleid.bfirstname4#</cfif> <cfif get_titleid.bminame4 neq '' and get_titleid.bminame4 neq 'NULL'>#get_titleid.bminame4#.</cfif> <cfif get_titleid.blastname4 neq '' and get_titleid.blastname4 neq 'NULL'>#get_titleid.blastname4#</cfif></cfif></cfoutput><br>
<br>


Dear <cfoutput><cfif mods.recordcount and mods.realtor_fname neq ''>#mods.realtor_fname#</cfif></cfoutput>:  <br>
<br>


Welcome to Streamline Title! Thank you so much for entrusting your transaction to our company. We look forward to being of service to you and your buyer(s). <BR><BR>

We have received your contract, and look forward to seeing you and your client at closing. We automatically schedule your case on our calendar according to the terms of the contract, however, if you need to move the date up please let us know by contacting your processor directly.<br><br>

Please send the following to the Processing Assistant prior to closing to assist us in a smooth transaction.<br><br>
HOA information - Rekey invoices - Home Warranty Information<br><br>
Water and utilities bills should be brought current prior to settlement so we can record our deed immediately after closing.  <font color="red">Please forward all paid receipts to prevent delays.</font><br><br>

At any time during the process please feel free to reach out to your team at <a href="mailto:fanniemae@streamline-title.com">fanniemae@streamline-title.com</a>.  We look forward to working with you on this transaction and many more in the future.
Very truly yours,  <BR><BR>

<table>
<tr>
<td width=225 align="left" valign="top"><cfoutput>#get_titleid.pname#<br>
Settlement Processor<br>
#get_titleid.p_email#<br>
</cfoutput></td>
<td width=225 align="left" valign="top"><cfoutput>Processing Assistant<br>
Melissa Niosi<br>
mniosi@streamline-title.com<br>
</cfoutput></td>

</tr>
</table><br>
<br>
<i>You may immediately escalate any issues you have to Heidi Kelly - hkelly@streamline-title.com - mobile 301-602-8777; or Pamela Gibbons - pgibb@streamline-title.com - mobile - 301-922-9690 anytime.</i>
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
