<CFPARAM NAME="a_trigger" DEFAULT="0">
<html>
<head>
<title>Contact Us</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="" link="#FF0000" vlink="#FF0000" alink="#FF0000">




		</td>
		<td bgcolor="FFFFFF" valign="top">
			<!---- body text starts ----->

      <table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
        <tr>
          <td align="center" valign="center">
 <table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
<cfif #a_trigger# eq 1>



			<cfset NumbOfChars=6>
			<CFSET NewPass = "">
			<CFLOOP INDEX="RandAlhpaNumericPass"
			FROM="1" TO="#NumbOfChars#">
			<CFSET NewPass =
				NewPass&Mid(
				'ABCDEFGHIJCLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789'
				,RandRange('1','66'),'1')>
		</CFLOOP>


	<CFQUERY datasource="#request.dsn#" >

			INSERT INTO thirdparty (UID, PWD, FIRST, LAST, COMPANY, BRANCH, STATE, PHONE, FAX, EMAIL, comp_id)
			VALUES('#first##last#', '#NewPass#', '#FIRST#', '#LAST#', '#COMPANY#', '#BRANCH#', '#STATE#', '#PHONE#', '#FAX#', '#EMAIL#', #comp_id#)

		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="third_party">
			SELECT top 1 ID
			FROM thirdparty
			order by ID desc

		</CFQUERY>

<CFQUERY datasource="#request.dsn#">
				INSERT INTO ThirdPartyOrders(ThirdpID, orderid)
				VALUES('#third_party.ID#', #rec_id#)
			</CFQUERY>


<cfoutput>



<tr>
    <td colspan=2 style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=center style='margin-bottom:12.0pt;text-align:center'><font size="2" face="Times New Roman"><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'><br>
        <font size="3">Thank you for adding #First# as a Third Party!<br><br>Would you like to add an additional third party?<br><br>
				<input TYPE="button" VALUE=" Yes " NAME="foo" onClick="window.location='registertp.cfm?comp_id=#comp_id#&uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&a_trigger=0'">&nbsp;&nbsp;<input TYPE="button" VALUE=" No " NAME="foo" onClick="window.location='title_report_modify.cfm?comp_id=#comp_id#&uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=0&company_id=#company_ID#'; window.close(); if (!window.opener.closed) { window.opener.location.reload(); window.opener.focus(); }">&nbsp;&nbsp;

				<o:p></o:p><o:p></o:p><o:p></o:p><o:p></o:p><o:p></o:p></font><o:p></o:p></span></b></font></p></td>
  </tr>








</cfoutput>

<cfelse>



<CFFORM METHOD=POST ACTION="https://#cgi.server_name#/admin_area/registertp.cfm?comp_id=#comp_id#&uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&a_trigger=1">
 <tr>
    <td colspan=2 style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=center style='margin-bottom:12.0pt;text-align:center'><font size="2" face="Times New Roman"><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'><br>
        <font size="3">Please enter the information below to register a third party for this First Title Web Order<o:p></o:p><o:p></o:p><o:p></o:p><o:p></o:p><o:p></o:p></font><o:p></o:p></span></b></font></p></td>
  </tr>






  <tr>
    <td colspan=2 align="center" style='background:D98002;padding:2.25pt 2.25pt 2.25pt 2.25pt'>
      <p class=MsoNormal><font size="2" face="Times New Roman"><b><span style='font-size:7.5pt;font-family:Verdana;
  color:white'>Third Party Contact Information<o:p></o:p></span></b></font></p></td>
  </tr>
  <tr>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>First Name:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'>
        <cfINPUT REQUIRED="Yes" Message="You must enter first name" TYPE="TEXT" MAXLENGTH="20" NAME="First">
        <o:p></o:p></span></font></p></td>
  </tr>
  <tr>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Last Name:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'>
        <cfINPUT REQUIRED="Yes" Message="You must enter last name" TYPE="TEXT" MAXLENGTH="20" NAME="Last">
        <o:p></o:p></span></font></p></td>
  </tr>
  <tr>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Company:<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'>
        <INPUT TYPE="TEXT" MAXLENGTH="20" NAME="Company">
        <o:p></o:p></span></font></p></td>
  </tr>
  <tr>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'> City:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'>
        <INPUT TYPE="TEXT" MAXLENGTH="20" NAME="Branch">
        <o:p></o:p></span></font></p></td>
  </tr>


   <tr>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'> State:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'>
       <SELECT NAME="state">
                  <OPTION SELECTED VALUE="USA">Please Select
                  <OPTION VALUE="USA">----------------------
                  <OPTION VALUE="Alabama">Alabama
                  <OPTION VALUE="Alaska">Alaska
                  <OPTION VALUE="Arizona">Arizona
                  <OPTION VALUE="Arkansas">Arkansas
                  <OPTION VALUE="California">California
                  <OPTION VALUE="Colorado">Colorado
                  <OPTION VALUE="Connecticut">Connecticut
                  <OPTION VALUE="Delaware">Delaware
                  <OPTION VALUE="District">Dist. of Columbia
                  <OPTION VALUE="Florida">Florida
                  <OPTION VALUE="Georgia">Georgia
                  <OPTION VALUE="Hawaii">Hawaii
                  <OPTION VALUE="Idaho">Idaho
                  <OPTION VALUE="Illinois">Illinois
                  <OPTION VALUE="Indiana">Indiana
                  <OPTION VALUE="Iowa">Iowa
                  <OPTION VALUE="Kansas">Kansas
                  <OPTION VALUE="Kentucky">Kentucky
                  <OPTION VALUE="Louisiana">Louisiana
                  <OPTION VALUE="Maine">Maine
                  <OPTION VALUE="Maryland">Maryland
                  <OPTION VALUE="Massachusetts">Massachusetts
                  <OPTION VALUE="Michigan">Michigan
                  <OPTION VALUE="Minnesota">Minnesota
                  <OPTION VALUE="Mississippi">Mississippi
                  <OPTION VALUE="Missouri">Missouri
                  <OPTION VALUE="Montana">Montana
                  <OPTION VALUE="Nebraska">Nebraska
                  <OPTION VALUE="Nevada">Nevada
                  <OPTION VALUE="New_Hampshire">New Hampshire
                  <OPTION VALUE="New_Jersey">New Jersey
                  <OPTION VALUE="New_Mexico">New Mexico
                  <OPTION VALUE="New_York">New York
                  <OPTION VALUE="North_Carolina">North Carolina
                  <OPTION VALUE="North_Dakota">North Dakota
                  <OPTION VALUE="Ohio">Ohio
                  <OPTION VALUE="Oklahoma">Oklahoma
                  <OPTION VALUE="Oregon">Oregon
                  <OPTION VALUE="Pennsylvania">Pennsylvania
                  <OPTION VALUE="Rhode_Island">Rhode Island
                  <OPTION VALUE="South_Carolina">South Carolina
                  <OPTION VALUE="South_Dakota">South Dakota
                  <OPTION VALUE="Tennessee">Tennessee
                  <OPTION VALUE="Texas">Texas
                  <OPTION VALUE="Utah">Utah
                  <OPTION VALUE="Vermont">Vermont
                  <OPTION VALUE="Virginia">Virginia
                  <OPTION VALUE="Washington">Washington
                  <OPTION VALUE="West_Virginia">West Virginia
                  <OPTION VALUE="Wisconsin">Wisconsin
                  <OPTION VALUE="Wyoming">Wyoming
                </SELECT>
        <o:p></o:p></span></font></p></td>
  </tr>

  <tr>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Phone Number:&nbsp;
        <o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'>
        <INPUT TYPE="TEXT" MAXLENGTH="15" NAME="Phone">
        <o:p></o:p></span></font></p></td>
  </tr>
  <tr>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>FAX Number:&nbsp; <o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'>
        <INPUT TYPE="TEXT" MAXLENGTH="15" NAME="FAX">
       <o:p></o:p></span></font></p></td>
  </tr>
  <tr>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Email Address:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'>
        <CFINPUT REQUIRED="Yes" Message="You must enter email address" TYPE="TEXT" MAXLENGTH="50" SIZE="40" NAME="email">
        <o:p></o:p></span></font></p></td>
  </tr>
  <tr>
    <td height="65" colspan=2 style='padding:2.25pt 2.25pt 2.25pt 2.25pt'>
      <div class=MsoNormal align=center style='text-align:center'><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>
        <hr size=1 width="100%" noshade color=black align=center>
        </span><font size="2" face="Times New Roman"><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <cfoutput> <INPUT NAME="B2" TYPE="submit" value="Submit">   <input TYPE="button" VALUE=" Cancel " NAME="foo" onClick="window.location='title_report_modify.cfm?comp_id=#comp_id#&uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#company_ID#'; window.close(); if (!window.opener.closed) { window.opener.location.reload(); window.opener.focus(); }">
       </cfoutput> <o:p></o:p></span></font></div>
      </td>
  </tr>
</cfform>





</cfif>

</table>
		  </td>
        </tr>
  <!---       <tr>
          <td><p>body text</p>
            <p>&nbsp;</p></td>
        </tr> --->
      </table>
			<!---- body text ends ----->
		</td>
	</tr>
</table>
</body>
</html>
