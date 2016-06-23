<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Title
			WHERE title_ID = #URL.rec_ID#


		</CFQUERY>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">

<table align="center" width="95%" border="0">
  <tr valign="middle">
    <td align="left" width="22%"><font size="1">Agent/Branch Id #</font> </td>
    <td align="center" width="64%"><!--- <font size="1">Agent/Branch Office File # C-7059-02DJA
      <br>
      Endorsement # C-5555-02 </font> ---></td>
    <td align="right" width="14%"><font size="1">Lender's File # </font></td>
  </tr>
  <tr>
    <td colspan="3" align="center"> <font size="5">GENERAL ENDORSEMENT</font><br>
      <font size="1">ATTACHED TO AND FORMING A PART OF</font><br>
      <b>COMMITMENT  </b>
      <p> <font size="1">ISSUED BY</font><br>
        <font size="4"><b>American Pioneer Title Insurance Company</b></font>
      <p>
    </td>
  </tr>
<CFFORM NAME="frm" ACTION="./loan_amount_verify.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=0&company_id=0" METHOD="POST">
<CFOUTPUT QUERY="read_title">

  <tr>
    <td colspan="3" valign="top">
      <p>&nbsp;</p>
      <p>The above referenced commitment is amended as set out hereinbelow: </p>
      <p>Change Loan amount to Schedule A and Schedule B-Section 1a to read: <br>


						<INPUT NAME="loanamt_float" SIZE=40 MAXLENGTH=120 value="#loanamt_float#"
									style="font-size: 9;
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
					<input type=image border=0 src="./images/button_modify.gif">


      <P>
      <P>
      <P>
      <P><u>Note:</u> This endorsement shall not be valid or binding until countersigned
        by an authorized signatory.
      <P>
    </td>
  </tr></cfoutput> </CFFORM>
  <tr>
    <td><font size="1"> GENERAL ENDORSEMENT - 1986 </font></td>
	<td></td>
    <td align="right" width="14%"><font size="1"> EN-1 (11/92)</font></td>
  <tr>
  <tr>
    <td colspan="3">
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>This endorsement is made a part of the policy or commitment and is subject
        to all the terms and provisions thereof and of any prior endorsements
        thereto. Except to the extent expressly stated, it neither modifies any
        of the terms and provisions of the policy or commitment and prior endorsements,
        if any, nor does it extend the effective date of the policy or commitment
        and prior endorsements or increase the face amount thereof. <br>
        <br>
      </p>
      <p>&nbsp;</p>
      <p>
	  </td></tr>
	  <tr>
    <td valign="top" width="22%"> <b><font size="4">American Pioneer Title Insurance
      Company </font></b></td>
	  <td colspan="2">

      <p>Dated <b>August 26, 2002</b> and Issued By: </p>
      <p>AMERICAN TITLE SERVICES, LLC </p>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
      <p>30 West Gude Drive </p>
      <p>Suite 400 </p>
      <p>Rockville, MD 20850 </p>
<cfelse>
      <p>7361 Calhoun Place </p>
      <p>Suite 200 </p>
      <p>Rockville, MD 20855 </p>
</cfif>

      <p>&nbsp;</p>
      <p>__________________________________________<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Authorized Signatory </p>
    </td>
  </tr>
</table>

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
