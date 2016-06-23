<!--- <cfif not FindNoCase("firsttitleservices.com",cgi.http_referer) AND not FindNoCase("streamline-title.com",cgi.http_referer)>
	<cfabort showerror="request came from invalid domain">
</cfif> --->
<cfparam name="url.a_trigger" default="0">
<cfparam name="enhanced_coverage" default="1">
<CFPARAM NAME="sales_id" DEFAULT="59">
<!--- <CFPARAM NAME="sales_id" DEFAULT="256"> --->
<cfparam name="url.em" default="">
<cfparam name="url.blast" default="">
<cfparam name="form.referred_fname" default="">
<cfparam name="form.referred_lname" default="">


<cfset send_to_email = "spape@firsttitleservices.com">

<cfif url.a_trigger eq 1>
<!--- <cfdump var="#form#"><br> --->

<CFQUERY datasource="#request.dsn#" NAME="check_companies">
		SELECT *
		FROM Companies
		WHERE a_user = '#form.UID#'

</CFQUERY>

<cfif form.email EQ "email" OR NOT Find("@",form.email)>
<script language="javascript">
alert("Please enter a valid email address.");
history.go(-1);
</script>
<cfabort>
</cfif>


<cfif check_companies.recordcount>
<script language="javascript">
alert("That UserName is already in use, please choose another");
history.go(-1);
</script>
<cfabort>
</cfif>




<CFQUERY datasource="#request.dsn#" NAME="check_companies2">
		SELECT *
		FROM Companies
		WHERE email = '#form.email#' and a_status <> '1'

</CFQUERY>


<cfif check_companies2.recordcount>
<script language="javascript">
alert("This email address is already registered, however the account is not yet active. Expect a personal call or email from one of our representatives in the next 30 minutes to verify your information and immediately activate your login for use. Thank You.");
history.go(-1);
</script>
<cfabort>
</cfif>



<SCRIPT LANGUAGE="JavaScript">
<!-- Overture Services Inc. 07/15/2003
var cc_tagVersion = "1.0";
var cc_accountID = "1419082105";
var cc_marketID =  "0";
var cc_protocol="http";
var cc_subdomain = "convctr";
if(location.protocol == "https:")
{
    cc_protocol="https";
     cc_subdomain="convctrs";
}
var cc_queryStr = "?" + "ver=" + cc_tagVersion + "&aID=" + cc_accountID + "&mkt=" + cc_marketID +"&ref=" + escape(document.referrer);
var cc_imageUrl = cc_protocol + "://" + cc_subdomain + ".overture.com/images/cc/cc.gif" + cc_queryStr;
var cc_imageObject = new Image();
cc_imageObject.src = cc_imageUrl;
// -->
</SCRIPT>
<CFPARAM NAME="referred" DEFAULT="">
<cfif Len(form.referred_lname)>
<CFQUERY datasource="#request.dsn#" NAME="find_sales">
		SELECT *
		FROM First_Admin
		WHERE lname like '%#form.referred_lname#%'
		and status = 1
</CFQUERY>
<cfif find_sales.recordcount GTE 1>
<cfset sales_id = #find_sales.id#>
<cfelse>
<cfset sales_id = 59>
</cfif>
<cfelse>
<cfset sales_id = 59>
</cfif>

<CFPARAM NAME="master_co" DEFAULT=0>

<CFPARAM NAME="position" DEFAULT="">
<CFPARAM NAME="extention" DEFAULT="">
<CFPARAM NAME="auto_email_opt_out" DEFAULT=0>
<CFPARAM NAME="phone" DEFAULT="">
<CFPARAM NAME="proposed_monthly_transactions" DEFAULT="">
<CFPARAM NAME="fax" DEFAULT="">
<CFPARAM NAME="referred" DEFAULT="">
<CFPARAM NAME="addr1" DEFAULT="">
<CFPARAM NAME="addr2" DEFAULT="">
<CFPARAM NAME="city" DEFAULT="">
<CFPARAM NAME="state" DEFAULT="">
<CFPARAM NAME="zip_code" DEFAULT="">
<CFPARAM NAME="email" DEFAULT="">
<CFPARAM NAME="a_cost" DEFAULT="">
<CFPARAM NAME="a_user" DEFAULT="">
<CFPARAM NAME="a_pass" DEFAULT="">
<CFPARAM NAME="st_abbrev" DEFAULT="">
<CFPARAM NAME="ft_agencies" DEFAULT="">
<CFPARAM NAME="a_comment" DEFAULT="">
<CFPARAM NAME="a_note_1" DEFAULT="">
<CFPARAM NAME="status" DEFAULT="">
<CFPARAM NAME="uid" DEFAULT="">
<CFPARAM NAME="pwd" DEFAULT="">
<CFPARAM NAME="sales" DEFAULT="InHouse">
<CFPARAM NAME="companies_switch" DEFAULT="0">
<CFPARAM NAME="commit" DEFAULT="off">
<CFPARAM NAME="fullservice" DEFAULT="off">
<CFPARAM NAME="clearc" DEFAULT="off">
<CFPARAM NAME="payoff" DEFAULT="off">
<CFPARAM NAME="disbursements" DEFAULT="off">
<CFPARAM NAME="recording" DEFAULT="off">
<CFPARAM NAME="shipping" DEFAULT="off">
<CFPARAM NAME="appraisal" DEFAULT="off">
<CFPARAM NAME="signing" DEFAULT="off">
<CFPARAM NAME="team_id" DEFAULT="21">
<CFPARAM NAME="referred_other" DEFAULT="0">
<CFPARAM NAME="interested_in_services" DEFAULT="">

<CFPARAM NAME="Infile" DEFAULT="">
<CFPARAM NAME="Reissue" DEFAULT="">
<CFPARAM NAME="Safe" DEFAULT="">
<CFPARAM NAME="Basic" DEFAULT="">
<CFPARAM NAME="Census" DEFAULT="">
<CFPARAM NAME="Life" DEFAULT="">
<CFPARAM NAME="LifeCensus" DEFAULT="">



<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>
<CFSET b_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET b_date = #DateFormat(Now(), "mm/dd/yyyy")#>

	<cfif #uid# eq 92> <!---Noone--->
	<CFSET status = 2>
	<cfelseif #uid# eq 93><!---Cindy Mills--->
	<cfset status = 3>
	<cfelseif #uid# eq 167><!---Nita Farrow--->
	<cfset status = 4>
		<cfelseif #uid# eq 185><!---Cindy Miropol--->
	<cfset status = 5>
	<cfelse>
	<cfset status = 1>
	</cfif>
<!---Set boolean values equal to numerical values--->

<CFIF #commit# eq "ON">
    <CFSet #commit# = "1">
<CFELSE>
    <CFSet #commit# = "0">
</CFIF>
<CFIF #fullservice# eq "ON">
    <CFSet #fullservice# = "1">
<CFELSE>
    <CFSet #fullservice# = "0">
</CFIF>
<CFIF #clearc# eq "ON">
    <CFSet #clearc# = "1">
<CFELSE>
    <CFSet #clearc# = "0">
</CFIF>
<CFIF #payoff# eq "ON">
    <CFSet #payoff# = "1">
<CFELSE>
    <CFSet #payoff# = "0">
</CFIF>
<CFIF #disbursements# eq "ON">
    <CFSet #disbursements# = "1">
<CFELSE>
    <CFSet #disbursements# = "0">
</CFIF>
<CFIF #recording# eq "ON">
    <CFSet #recording# = "1">
    <CFSet #FeeRecording# = "60">
<CFELSE>
    <CFSet #recording# = "0">
    <CFSet #FeeRecording# = "NULL">
</CFIF>
<CFIF #shipping# eq "ON">
    <CFSet #shipping# = "1">
<CFELSE>
    <CFSet #shipping# = "0">
</CFIF>
<CFIF #appraisal# eq "ON">
    <CFSet #appraisal# = "1">
<CFELSE>
    <CFSet #appraisal# = "0">
</CFIF>
<CFIF #signing# eq "ON">
    <CFSet #signing# = "1">
<CFELSE>
    <CFSet #signing# = "0">
</CFIF>

<CFIF #Infile# eq "ON">
    <CFSet #Infile# = "Infile">
<CFELSE>
    <CFSet #Infile# = "">
</CFIF>
<CFIF #Reissue# eq "ON">
    <CFSet #Reissue# = "Reissue">
<CFELSE>
    <CFSet #Reissue# = "">
</CFIF>
<CFIF #Safe# eq "ON">
    <CFSet #Safe# = "Safe">
<CFELSE>
    <CFSet #Safe# = "">
</CFIF>
<CFIF #Basic# eq "ON">
    <CFSet #Basic# = "Basic">
<CFELSE>
    <CFSet #Basic# = "">
</CFIF>
<CFIF #Census# eq "ON">
    <CFSet #Census# = "Census">
<CFELSE>
    <CFSet #Census# = "">
</CFIF>
<CFIF #Life# eq "ON">
    <CFSet #Life# = "Life">
<CFELSE>
    <CFSet #Life# = "">
</CFIF>
<CFIF #LifeCensus# eq "ON">
    <CFSet #LifeCensus# = "LifeCensus">
<CFELSE>
    <CFSet #LifeCensus# = "">
</CFIF>



<!--- <cfoutput>NewName: #NewName#, NewName2: #NewName2#</cfoutput>
<cfabort> --->

<!--- create good company name --->
<cfset new_comp_name = #company# & " - " & #city#>
<CFQUERY datasource="#request.dsn#" name="check_comp">
	Select * from companies where company = '#new_comp_name#'
</CFQUERY>
<cfif check_comp.recordcount>
	<cfset new_comp_name = #company# & " - " & #city# & " - " & #last#>
	<CFQUERY datasource="#request.dsn#" name="check_comp">
		Select * from companies where company = '#new_comp_name#'
	</CFQUERY>
	<cfif check_comp.recordcount>
		<cfset new_comp_name = #company# & " - " & #city# & " - " & #last# & ", " & #first#>
	</cfif>
</cfif>


<cfif Mid(new_comp_name, 1, 6) neq 'google'>
<CFQUERY datasource="#request.dsn#">
	INSERT INTO companies(company, contact_fname, contact_lname, phone, fax, addr1, addr2, city, state, zip_code, email, a_time, a_date, a_note_1, a_comment, a_uid, a_status, a_user, a_pass, status,intCustServ,intSales,companies_switch, team_id, prev_team_id, test_account, refer, refer_other, sign_up_date, position, extention, enhanced_coverage, interested_in_services)
	VALUES('#new_comp_name#', '#FIRST#', '#LAST#', '#phone#', '#fax#', '#addr1#', '#addr2#', '#city#', '#state#', '#zip#', '#email#', '#c_time#', '#c_date#', '#a_note_1#', '#a_comment#', '59', 0, '#uid#', '#PWD#', '#status#','292','#sales_id#',0, #team_id#, #team_id#, 0, '#referred_fname# #referred_lname#', '#referred_other#', '#c_date#', '#position#', '#extention#', #enhanced_coverage#, '#interested_in_services#')
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="Read_ID">
	SELECT *
	FROM companies
	WHERE a_time = '#c_time#' AND a_date = '#c_date#'
</CFQUERY>


<!--- <cfhttp
url="https://#cgi.server_name#/client_line_costs_add_submit3.cfm?read_id=#read_id.ID#&a_trigger=1"
method="get" />
 --->

<cfhttp
url="https://#cgi.server_name#/client_line_costs_add_submit2010_3.cfm?read_id=#read_id.ID#&a_trigger=1"
method="get" />


<CFQUERY datasource="#request.dsn#" NAME="get_sales">
	SELECT *
	FROM First_admin
	WHERE ID = '#Read_ID.intSales#'
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_team">
	SELECT f.email
	FROM companies c, teams t, first_admin f
	WHERE c.ID = '#Read_ID.ID#'
	and c.team_id = t.id
	and t.Leader_id = f.ID
</CFQUERY>

<!--- TO="#send_to_email#; #get_sales.email#"  --->
 <CFMAIL
TO="#get_sales.email#"
CC="jmoore@firsttitleservices.com; sflickinger@firsttitleservices.com"
FROM="sales@firsttitleservices.com"
Subject="#new_comp_name#, New customer signup"
type = "html"

TIMEOUT="600"
>

    <table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
        <tr>
          <td align="center" valign="center">
 <table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">

<tr>
    <td colspan=2 style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=center style='margin-bottom:12.0pt;text-align:center'><font size="2" face="Times New Roman"><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'><br>
        <font size="3">The information below is entered by a new user of <cfoutput>#session.site.short_name#</cfoutput>'s Web.<o:p></o:p><o:p></o:p><o:p></o:p><o:p></o:p><o:p></o:p></font><o:p></o:p></span></b></font></p></td>
  </tr>
  <tr>
    <td colspan=2 align = "center" style='background:D98002;padding:2.25pt 2.25pt 2.25pt 2.25pt'>
      <p class=MsoNormal><font size="2" face="Times New Roman"><b><span style='font-size:7.5pt;font-family:Verdana;
  color:white'>User Information<o:p></o:p></span></b></font></p></td>
  </tr>



  <tr>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Pick a Username:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'>
   <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'>
        #UID# <o:p></o:p></span></font></p>
   </td>
  </tr>

  <tr>
    <td colspan=2 align="center" style='background:D98002;padding:2.25pt 2.25pt 2.25pt 2.25pt'>
      <p class=MsoNormal><font size="2" face="Times New Roman"><b><span style='font-size:7.5pt;font-family:Verdana;
  color:white'>Contact Information<o:p></o:p></span></b></font></p></td>
  </tr>
  <tr>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>First Name:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'>
     #First#
        <o:p></o:p></span></font></p></td>
  </tr>
  <tr>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Last Name:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'>
     #Last#
        <o:p></o:p></span></font></p></td>
  </tr>



  <tr>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Position:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'>
     #position#
        <o:p></o:p></span></font></p></td>
  </tr>


  <tr>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Company:<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'>
      #new_comp_name#
        <o:p></o:p></span></font></p></td>
  </tr>
  <tr>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'> Branch:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'>
      #Branch#
        <o:p></o:p></span></font></p></td>
  </tr>


  <tr>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'> City:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'>
      #City#
        <o:p></o:p></span></font></p></td>
  </tr>


   <tr>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'> State:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'>
      #State#
        <o:p></o:p></span></font></p></td>
  </tr>


  <tr>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'> Zip:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'>
      #Zip#
        <o:p></o:p></span></font></p></td>
  </tr>




  <tr>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Phone Number:&nbsp;
        <o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'>
        #Phone# <cfif extention NEQ ''>x</cfif>#extention#
        <o:p></o:p></span></font></p></td>
  </tr>
  <tr>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>FAX Number:&nbsp; <o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'>
        #Fax#
       <o:p></o:p></span></font></p></td>
  </tr>
  <tr>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Email Address:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'>
    #Email#
        <o:p></o:p></span></font></p></td>
  </tr>




  <tr>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Referred By:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'>
    #referred_fname# #referred_lname# #referred_other#
        <o:p></o:p></span></font></p></td>
  </tr>


    <tr>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Interested in the following services:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'>
    #interested_in_services#
        <o:p></o:p></span></font></p></td>
  </tr>

  <tr>
    <td height="65" colspan=2 style='padding:2.25pt 2.25pt 2.25pt 2.25pt'>
      <div class=MsoNormal align=center style='text-align:center'><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>
        <hr size=1 width="100%" noshade color=black align=center>
        </span><font size="2" face="Times New Roman"><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <o:p></o:p></span></font></div>
      </td>
  </tr>
</table>

   </td>
  </tr>
</table>
</cfmail>


<!--- TO="#send_to_email#; #get_sales.email#" --->

<CFMAIL
TO="#get_sales.email#"
CC="jmoore@firsttitleservices.com"
FROM="sales@firsttitleservices.com"
Subject="#new_comp_name#, New customer signup - TEXT"

TIMEOUT="600"
>
The information below is entered by a new user of #session.site.short_name#'s Web.

Username: #UID#
First Name: #First#
Last Name: #Last#
Position: #position#
Company: #new_comp_name#
Address: #addr1#
Address 2: #addr2#
City: #Branch#
State: #State#
Zip: #Zip#
Phone Number: #Phone# <cfif extention NEQ ''>x</cfif>#extention#
FAX Number: #Fax#
Email Address: #Email#
Referred by: #referred_fname# #referred_lname# #referred_other#
Interested in: #interested_in_services#

</cfmail>
<!--- <cfinclude template="../auto_emails/new_account.cfm"> --->
</cfif>
</cfif>











<CFQUERY datasource="#request.dsn#" NAME="get_sales">
		SELECT     *
		FROM         First_Admin
		WHERE     ((role_id = '24') AND (status = '1')) OR
                      (ID = '58') OR
                      (ID = '59') OR
                      (ID = '56')
		order by lname
</CFQUERY>

<CFPARAM NAME="a_trigger" DEFAULT="0">
<cfinclude template="vendorHeader.cfm">

<script language="JavaScript" type="text/JavaScript">
<!--
function validate_form() {
var valid = true;
var message = "The following fields must be completed before submitting:\n";
if (document.register_form.UID.value=='') {
message = message + "UserName\n"
valid = false;
}

if (document.register_form.UID.value.length<6) {
message = message + "Username must be at least 6 chacters\n"
valid = false;
}

if (document.register_form.FIRST.value=='') {
message = message + "First Name\n"
valid = false;
}
if (document.register_form.LAST.value=='') {
message = message + "Last Name\n"
valid = false;
}
if (document.register_form.COMPANY.value=='') {
message = message + "Company\n"
valid = false;
}
if (document.register_form.POSITION.value=='') {
message = message + "Position\n"
valid = false;
}
if (document.register_form.ADDR1.value=='') {
message = message + "Address\n"
valid = false;
}
if (document.register_form.CITY.value=='') {
message = message + "City\n"
valid = false;
}
if (document.register_form.state.value=='Please Select') {
message = message + "State\n"
valid = false;
}
if (document.register_form.ZIP.value=='') {
message = message + "Zip\n"
valid = false;
}
if (document.register_form.PHONE.value=='') {
message = message + "Phone Number\n"
valid = false;
}
if (document.register_form.EMAIL.value=='') {
message = message + "Email Address\n"
valid = false;
}

if (document.register_form.referred_lname.value=='') {
document.register_form.referred_lname.value = ' ';
}
if (document.register_form.referred_fname.value=='') {
document.register_form.referred_fname.value = ' ';
}

if (valid == false) {
alert(message);
} else {
document.register_form.submit();
}
return valid;
}


function select_other() {
if (document.register_form.referred.value == 'Other') {
document.getElementById("other_block").style.display = 'block';
} else {
document.getElementById("other_block").style.display = 'none';
document.register_form.referred_other.value = '';
}
}

function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
<script language="JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}
//-->
</script>

</head>

			<!---- body text starts ----->
	<cfif a_trigger eq 1>
	

 <table width="50%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
 <tr><td>
<table width="100%"  border="0" cellspacing="3" cellpadding="3">
  <tr>
    <td colspan="2" align="center">
<table width="100%">
<tr>
<td align="left" valign="middle"><img src="images/FT_bug.gif" width="44" height="50"></td>
<td align="center" valign="middle" class="header">Welcome <cfoutput>#session.site.short_name#</cfoutput> User</td>
<td align="right" valign="middle"><img src="images/Calyx_bug.gif" width="80" height="33">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
<img src="images/encompass_logo.jpg"></td>
</tr>
</table>
</td>
  </tr>
  <tr>
    <td align="center" valign="top" class="header3">THANK YOU!!! <br>
<br>
<span class="bodytext">Your registration has been received. <!---  You can now order title and closing cost via Point "Services".   --->Thank you for signing up with <cfoutput>#session.site.short_name#</cfoutput>.! Expect a personal call or email from one of our representatives in the next 30 minutes to verify your information and immediately activate your login for use.
<!--- A <cfoutput>#session.site.short_name#</cfoutput> representative will contact you shortly to introduce you to the many <cfoutput>#session.site.short_name#</cfoutput> services to make your life easier and make you more money.<br> --->
<br />
<br />
<!--- <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/training/" target="_new">Click here for <cfoutput>#session.site.short_name#</cfoutput> web demonstration</a><br>
 ---></td></tr>
</table>
</td></tr></table>


<cfelse>

      <div class="main_area">
		<div class="ctnt_left">

			<form name="register_form" action="https://machine1.firsttitleservices.com/client/registerb.cfm?a_trigger=1" method="POST">
			<div class="login_area2">
				<img src="https://www.firsttitleservices.com/wp-content/themes/firsttitle/images/login2_top.gif" border="0" alt="">
				<div class="login2_bg">
					<h1 align="center">WELCOME FIRST TITLE</h1>
					<div class="start">Getting Started</div>
					<div class="left_sec">
						<img src="https://www.firsttitleservices.com/wp-content/themes/firsttitle/images/login2_left_top.gif" border="0" alt="">

						<div class="grey">
							<p class="orange_title">Automated Signup</p>
							<b>Pick a Username</b><br>
							<input name="UID" type="text" class="loginbox_small"><br>
							<font size="-2">(minimum 6 alpha/numeric characters)</font><br>
							<b>Referred By</b><br>
							<input name="referred_fname" type="text" class="loginbox_small" value="first name" onclick="javascript: this.value='';"> <input name="referred_lname" type="text" class="loginbox_small" value="last name"><br>

							<b>Which services are you interested in? <font size="-2">(check all that apply)</font> </b><br>
							<input name="interested_in_services" type="checkbox" value="Title and Closing Services"> <font size="-1">Title and Closing Services</font><br>
							<input name="interested_in_services" type="checkbox" value="Property Report-Title Information Only"> <font size="-1">Property Report / Title Information Only </font><br>
							<input name="interested_in_services" type="checkbox" value="Appraisal Services"> <font size="-1">Appraisal Services</font>  <br>
							<input name="interested_in_services" type="checkbox" value="Flood, Credit and/or AVM"> <font size="-1">Flood, Credit and/or AVM</font> <br>

							<input name="interested_in_services" type="checkbox" value="Nationwide Closing Calculator-GFE Creator"> <font size="-1">Nationwide Closing Calculator / GFE Creator</font>  <br>
						</div>
						<img src="https://www.firsttitleservices.com/wp-content/themes/firsttitle/images/login2_left_btm.gif" border="0" alt="">
					</div>
					<div class="right_sec">
						<div class="form_set">
							<img src="https://www.firsttitleservices.com/wp-content/themes/firsttitle/images/login2_right_top.gif" border="0" alt="">

							<div class="grey">
								<p class="orange_title">CONTACT INFORMATION</p>
								<input name="FIRST" type="text" class="loginbox_small" value="first name"> <input name="LAST" type="text" class="loginbox_small" value="last name">
							</div>
							<img src="https://www.firsttitleservices.com/wp-content/themes/firsttitle/images/login2_right_btm.gif" border="0" alt="">
						</div>
						<div class="form_set">
							<img src="https://www.firsttitleservices.com/wp-content/themes/firsttitle/images/login2_right_top.gif" border="0" alt="">

							<div class="grey">
								<input name="COMPANY" type="text" class="loginbox_small" value="company"> <input name="POSITION" type="text" class="loginbox_small" value="position">
								<input name="BRANCH" type="text" class="loginbox_small" value="branch ID"> <font size="-2">(if applicable)</font>
							</div>
							<img src="https://www.firsttitleservices.com/wp-content/themes/firsttitle/images/login2_right_btm.gif" border="0" alt="">
						</div>
						<div class="form_set">

							<img src="https://www.firsttitleservices.com/wp-content/themes/firsttitle/images/login2_right_top.gif" border="0" alt="">
							<div class="grey">
								<input name="ADDR1" type="text" class="loginbox_small" value="address"> <input name="ADDR2" type="text" class="loginbox_small" value="address2">
								<input name="CITY" type="text" class="small1" value="city"> <input name="STATE" type="text" class="small1" value="state"> <input name="ZIP" type="text" class="small2" value="zip">
								<input name="PHONE" type="text" class="small1" value="phone"> <input name="EXTENTION" type="text" class="small1" value="ext"> <br>
								<input name="FAX" type="text" class="small1" value="fax"> <input name="EMAIL" type="text" class="small1" value="email">
							</div>

							<img src="https://www.firsttitleservices.com/wp-content/themes/firsttitle/images/login2_right_btm.gif" border="0" alt="">
						</div>
					</div>
					<div class="clear"></div>
					<div style="padding-top:10px; padding-bottom:10px;"><input type="image" src="https://www.firsttitleservices.com/wp-content/themes/firsttitle/images/btn_submit.gif" border="0" alt=""></div>
				</div>
				</form>
				<img src="https://www.firsttitleservices.com/wp-content/themes/firsttitle/images/login2_btm.gif" border="0" alt="">
			</div>

		</div>
		<div class="ctnt_right">
			<div class="right_list_area">
				<img src="https://www.firsttitleservices.com/wp-content/themes/firsttitle/images/right_list_top.gif" border="0" alt="">
				<div class="right_list">
					<ul>
						<li><a href="/index.php/login">Customer Login</a></li>
						<li><a href="/index.php/loginv">Vendor Login</a></li>

						<li><a href="/index.php/logint">Third Party Login</a></li>
						<li><a href="/index.php/logina">Admin Login</a></li>
						<li><a href="/index.php/sign-up">New Customer Signup</a></li>
						<li class="last"><a href="https://machine1.firsttitleservices.com/client/vendor_new2.cfm">New Vendor Signup</a></li>
					</ul>
				</div>
				<img src="https://www.firsttitleservices.com/wp-content/themes/firsttitle/images/right_list_btm.gif" border="0" alt="">

			</div>
		</div>
		</cfif>
			<!---- body text ends ----->
		<cfinclude template="vendorFooter.cfm">