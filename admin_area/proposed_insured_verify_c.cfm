

			<CFQUERY datasource="#request.dsn#" NAME="read_title">

				SELECT *
				FROM title
				WHERE title_ID = #rec_id# 

			</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_titleid">
			SELECT *
			FROM title
			WHERE Title_ID = #rec_id#
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_billing_states">
		SELECT *
		FROM  Company_Billing_states 
		WHERE company_id = #get_titleid.comp_id# AND a_states = '#get_titleid.pstate#'
	
</CFQUERY>	


<CFQUERY datasource="#request.dsn#" NAME="read_agency">
		SELECT title_ft_agency_name
		FROM  company_agency_assoc
		WHERE billing_id = '#get_billing_states.billing_id#'
	
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
        <font size="4"><b>Chicago Title Insurance Company</b></font> 
      <p> 
    </td>
  </tr>
 <CFOUTPUT QUERY="read_title">
  <tr> 
    <td colspan="3" valign="top"> 
      <p>&nbsp;</p>
      <p>The above referenced commitment is amended as set out hereinbelow: </p>
      <p>Change Proposed Insured to Schedule A and Schedule B-Section 1a to read:<br><br>
<FONT FACE=verdana SIZE=1 color="blue"><b>#Insured#</b> 
						
	  <P>&nbsp;
      <P>&nbsp; 
      <P>&nbsp; 
      <P>&nbsp; 
      <P><u>Note:</u> This endorsement shall not be valid or binding until countersigned 
        by an authorized signatory. 
      <P>&nbsp;
    </td>
 
</tr> 
 </cfoutput>
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
    <td valign="top" width="22%"> <b><font size="4">Chicago Title Insurance Company </font></b></td>
	  <td colspan="2">
	   
      <p>Dated <b>August 26, 2002</b> and Issued By: </p>
       <cfoutput><p>#read_agency.title_FT_Agency_name# </p></cfoutput>
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
      <p><table width="267" >
        <tr><td align="center"><img src="images/sign4.gif"></td></tr>
	  <tr><td align="center">Authorized Signatory</td></tr>
	  </table>   </td>
  </tr>
</table>

</body>
</html>

