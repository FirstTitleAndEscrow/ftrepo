<cfparam name="url.sid" default="59">
<cfparam name="enhanced_coverage" default="1">
<cfparam name="url.a_trigger" default="0">
<cfparam name="form.confirm" default="0">
<CFPARAM NAME="form.sales_id" DEFAULT="#URL.SID#">
<cfparam name="url.em" default="">
<cfparam name="url.blast" default="">
<cfparam name="form.pwd" default="">


<CFQUERY datasource="#request.dsn#" NAME="lookup_sales">
		SELECT *
		FROM First_Admin
		WHERE ID = #form.sales_id#
</CFQUERY>




<cfset send_to_email = #lookup_sales.email#>

<cfif url.a_trigger eq 1>
<!--- <cfdump var="#form#"><br> --->

<CFQUERY datasource="#request.dsn#" NAME="check_companies">
		SELECT *
		FROM Companies
		WHERE a_user = '#form.UID#'
		and a_pass = '#form.PWD#'
</CFQUERY>

<cfif check_companies.recordcount>
<script language="javascript">
alert("That UserName is already in use, please choose another");
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
<CFPARAM NAME="uid" DEFAULT="">
<CFPARAM NAME="pwd" DEFAULT="">
<CFPARAM NAME="st_abbrev" DEFAULT="">
<CFPARAM NAME="ft_agencies" DEFAULT="">
<CFPARAM NAME="a_comment" DEFAULT="">
<CFPARAM NAME="a_note_1" DEFAULT="">
<CFPARAM NAME="status" DEFAULT="">
<CFPARAM NAME="a_status" DEFAULT="0">
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
<CFPARAM NAME="branch_id" DEFAULT="">

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

	<cfset status = 1>
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

	<CFQUERY datasource="#request.dsn#" name="get_salesperson">
		Select * from First_admin where ID = '#form.intSales#'
	</CFQUERY>

<cfif get_salesperson.va_employee eq 'True'>
<cfset team_id = 36><!--- Team R --->
<cfset a_status = 1>
</cfif>

<cfif form.intSales eq 440>
<!--- Team R --->
<cfset a_status = 1>
</cfif>

<!--- <cfif form.intSales eq 256>
<cfset team_id eq 8><!--- Team D, Kiya --->
<cfelse>
<cfset team_id eq 6><!--- Team B, Sonja --->
</cfif> --->


<CFQUERY datasource="#request.dsn#">
	INSERT INTO companies(company, contact_fname, contact_lname, phone, fax, addr1, addr2, city, state, zip_code, email, a_time, a_date, a_note_1, a_comment, a_uid, a_status, a_user, a_pass, status,intCustServ,intSales,companies_switch, team_id, prev_team_id, test_account, sign_up_date, position, extention, branch_id, enhanced_coverage)
	VALUES('#new_comp_name#', '#FIRST#', '#LAST#', '#phone#', '#fax#', '#addr1#', '#addr2#', '#city#', '#state#', '#zip#', '#email#', '#c_time#', '#c_date#', '#a_note_1#', '#a_comment#', '59', '#a_status#', '#uid#', '#PWD#', '#status#','292','#form.intsales#',0, '#team_id#', '#team_id#', '0', '#c_date#', '#position#', '#extention#', '#branch_id#', #enhanced_coverage#)
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="Read_ID">
	SELECT *
	FROM companies
	WHERE a_time = '#c_time#' AND a_date = '#c_date#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" >
insert into Loan_Officers (a_status, lo_ext, comp_id, lo_phone, lo_fax, lo_fname, lo_lname, lo_email, oname)
values
(1, '#extention#', '#Read_ID.ID#', '#phone#', '#fax#', '#FIRST#', '#LAST#', '#email#', '#FIRST# #LAST#')
</CFQUERY>

<CFQUERY datasource="#request.dsn#" >
insert into Users (a_status, lp_ext, comp_id, lp_phone, lp_fax, lp_fname, lp_lname, lp_email, pname)
values
(1, '#extention#', '#Read_ID.ID#', '#phone#', '#fax#', '#FIRST#', '#LAST#', '#email#', '#FIRST# #LAST#')
</CFQUERY>

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
BCC="rjermain@firsttitleservices.com"
FROM="sales@firsttitleservices.com"
Subject="#new_comp_name#, New Sales Referral customer signup"
type = "html"
SERVER="127.0.0.1"
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
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Pick a Password:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'>
   <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'>
        #PWD# <o:p></o:p></span></font></p>
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
      #Branch_id#
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
   #get_sales.fname# #get_sales.lname#
        <o:p></o:p></span></font></p></td>
  </tr>

  <tr>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal align=right style='text-align:right'><font size="2" face="Times New Roman"><span class=redtext1><b><span
  style='font-size:7.5pt;font-family:Verdana'></span></b></span><b><span
  style='font-size:7.5pt;font-family:Verdana;color:black'>Assigned To:&nbsp;<o:p></o:p></span></b></font></p></td>
    <td style='padding:2.25pt 2.25pt 2.25pt 2.25pt'> <p class=MsoNormal><font size="2" face="Times New Roman"><span style='font-size:7.5pt;font-family:Verdana;
  color:black'>
    #get_sales.fname# #get_sales.lname#
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
Subject="#new_comp_name#, New Sales Referral customer signup - TEXT"
SERVER="127.0.0.1"
TIMEOUT="600"
>
The information below is entered by a new user of #session.site.short_name#'s Web.

Username: #UID#
Password: #PWD#
First Name: #First#
Last Name: #Last#
Position: #position#
Company: #new_comp_name#
Branch: #branch_id#
Address: #addr1#
Address 2: #addr2#
City: #City#
State: #State#
Zip: #Zip#
Phone Number: #Phone# <cfif extention NEQ ''>x</cfif>#extention#
FAX Number: #Fax#
Email Address: #Email#
Referred by: #get_sales.fname# #get_sales.lname#
Assigned to: #get_sales.fname# #get_sales.lname#

</cfmail>
<CFINCLUDE TEMPLATE="../client_line_costs_add_submit3.cfm">
<CFINCLUDE TEMPLATE="../client_line_costs_add_submit2010_3.cfm">
<cfinclude template="../auto_emails/new_account.cfm">
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
if (valid == false) {
alert(message);
} else {
document.register_form.submit();
}
return valid;
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

<cfinclude template="vendorheader.cfm">

      <table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
        <tr>
          <td align="center" valign="center">


<cfif a_trigger eq 1>

 <table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">
 <tr><td>
<table width="100%"  border="0" cellspacing="3" cellpadding="3">
  <tr>
    <td colspan="2" align="center">
<table width="100%">
<tr>
<td align="left" valign="middle"></td>
<td align="center" valign="middle" class="header">Welcome <cfoutput>#session.site.short_name#</cfoutput> User</td>
<td align="left" valign="middle"></td>
</tr>
</table>
</td>
  </tr>
  <tr>
    <td align="center" valign="top" class="header3">THANK YOU!!! <br>
<br>
<span class="bodytext">Your registration has been received.  You can now order title and closing cost via the <cfoutput>#session.site.short_name#</cfoutput> website.  A <cfoutput>#session.site.short_name#</cfoutput> representative will contact you shortly to introduce you to the many <cfoutput>#session.site.short_name#</cfoutput> services to make your life easier and make you more money.<br>
<br>
<span class="header2">

<a href="https://<cfoutput>#cgi.server_name#</cfoutput>/training/" target="_new">Click here for <cfoutput>#session.site.short_name#</cfoutput> web demonstration</a><br><br>
<br>
<br>
<br>
<br>
<br>

<!--- <a href="https://www.calyxsoftware.com/demo/pointwn5-4.htm" target="_new">Click here for Calyx Point 5.4 demonstration</a> ---></span></td></tr>
</table>
</td></tr></table>


<cfelse>
 <table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">

<FORM METHOD=POST ACTION="/client/referral_register.cfm?a_trigger=1" name="register_form">
<table width="100%"  border="0" cellspacing="3" cellpadding="3">
  <tr>
    <td colspan="2" align="center">
<table width="100%">
<tr>
<td align="left" valign="middle"></td>
<td align="center" valign="middle" class="header">Welcome <cfoutput>#session.site.short_name#</cfoutput> User<br>
<span class="header2">Getting Started</span></td>
<td align="left" valign="middle"></td>
</tr>
</table>
</td>
  </tr>
  <tr>
    <td align="left" valign="top">
		<table width="100%"  border="0" cellspacing="3" cellpadding="3">
		  <tr>
			<td align="left" class="header2">Automated Sign-Up<br>
			<span class="smallprint"><nobr>minimum 6 alpha/numeric characters</nobr></span></td>
		  </tr>
		  <tr>
			<td class="label"><INPUT TYPE="TEXT" MAXLENGTH="20" NAME="UID"><br>
Pick a Username</td>
		  </tr>
		  <tr>
			<td class="label"><INPUT TYPE="TEXT" MAXLENGTH="20" NAME="PWD"><br>
Pick a Password</td>
		  </tr>
		  <tr>
			<td class="label">
			<input type="hidden" name="intsales" value="<cfoutput>#sales_ID#</cfoutput>"></td>
		  </tr>
		</table>
		</td>
		<td align="left" valign="top">
		<table width="100%"  border="0" cellspacing="3" cellpadding="3">
		  <tr>
			<td colspan="3" class="header2" align="left">Contact Information<br>
			<span class="smallprint">&nbsp;</span></td>
		  </tr>
		  <tr>
			<td class="label"><INPUT TYPE="TEXT" MAXLENGTH="50" NAME="FIRST"><br>
First Name</td>
			<td class="label" colspan="2"><INPUT TYPE="TEXT" MAXLENGTH="50" NAME="LAST"><br>
Last Name</td>
		  </tr>
		  <tr>
			<td class="label" colspan="2"><INPUT TYPE="TEXT" MAXLENGTH="50" NAME="POSITION"><br>
Position</td>
		  </tr>
		  <tr>
			<td class="label"><INPUT TYPE="TEXT" MAXLENGTH="50" NAME="COMPANY"><br>
Company</td>
			<td class="label" colspan="2"><INPUT TYPE="TEXT" MAXLENGTH="50" NAME="BRANCH_ID"><br>
Branch ID</td>
		  </tr>
		  <tr>
			<td class="label" colspan="2"><INPUT TYPE="TEXT" MAXLENGTH="50" NAME="ADDR1"><br>
Address</td>
		  </tr>
		  <tr>
			<td class="label" colspan="2"><INPUT TYPE="TEXT" MAXLENGTH="50" NAME="ADDR2"><br>
Address 2</td>
		  </tr>
		  <tr>
			<td class="label"><INPUT TYPE="TEXT" MAXLENGTH="50" NAME="CITY"><br>
City</td>
			<td class="label"><SELECT NAME="state">
                  <OPTION SELECTED VALUE="Please Select">Please Select
                  <OPTION VALUE="Please Select">----------------------
                  <OPTION VALUE="AL">Alabama
                  <OPTION VALUE="AK">Alaska
                  <OPTION VALUE="AZ">Arizona
                  <OPTION VALUE="AR">Arkansas
                  <OPTION VALUE="CA">California
                  <OPTION VALUE="CO">Colorado
                  <OPTION VALUE="CT">Connecticut
                  <OPTION VALUE="DE">Delaware
                  <OPTION VALUE="DC">Dist. of Columbia
                  <OPTION VALUE="FL">Florida
                  <OPTION VALUE="GA">Georgia
                  <OPTION VALUE="HI">Hawaii
                  <OPTION VALUE="ID">Idaho
                  <OPTION VALUE="IL">Illinois
                  <OPTION VALUE="IN">Indiana
                  <OPTION VALUE="IA">Iowa
                  <OPTION VALUE="KS">Kansas
                  <OPTION VALUE="KY">Kentucky
                  <OPTION VALUE="LA">Louisiana
                  <OPTION VALUE="ME">Maine
                  <OPTION VALUE="MD">Maryland
                  <OPTION VALUE="MA">Massachusetts
                  <OPTION VALUE="MI">Michigan
                  <OPTION VALUE="MN">Minnesota
                  <OPTION VALUE="MS">Mississippi
                  <OPTION VALUE="MO">Missouri
                  <OPTION VALUE="MT">Montana
                  <OPTION VALUE="NE">Nebraska
                  <OPTION VALUE="NV">Nevada
                  <OPTION VALUE="NH">New Hampshire
                  <OPTION VALUE="NJ">New Jersey
                  <OPTION VALUE="NM">New Mexico
                  <OPTION VALUE="NY">New York
                  <OPTION VALUE="NC">North Carolina
                  <OPTION VALUE="ND">North Dakota
                  <OPTION VALUE="OH">Ohio
                  <OPTION VALUE="OK">Oklahoma
                  <OPTION VALUE="OR">Oregon
                  <OPTION VALUE="PA">Pennsylvania
                  <OPTION VALUE="RI">Rhode Island
                  <OPTION VALUE="SC">South Carolina
                  <OPTION VALUE="SD">South Dakota
                  <OPTION VALUE="TN">Tennessee
                  <OPTION VALUE="TX">Texas
                  <OPTION VALUE="UT">Utah
                  <OPTION VALUE="VT">Vermont
                  <OPTION VALUE="VA">Virginia
                  <OPTION VALUE="WA">Washington
                  <OPTION VALUE="WV">West Virginia
                  <OPTION VALUE="WI">Wisconsin
                  <OPTION VALUE="WY">Wyoming
                </SELECT><br>
State</td>
<td class="label"><INPUT TYPE="TEXT" MAXLENGTH="10" NAME="ZIP" SIZE="5"><br>
Zip</td>
		  </tr>
  		  <tr>
			<td class="label"><INPUT TYPE="TEXT" MAXLENGTH="20" NAME="PHONE"><br>
Phone</td>
			<td class="label" colspan="2"><INPUT TYPE="TEXT" MAXLENGTH="20" SIZE="5" NAME="EXTENTION"><br>
Ext.</td>
		  </tr>
		  <tr>
			<td class="label" colspan="2"><INPUT TYPE="TEXT" MAXLENGTH="20" NAME="FAX"><br>
Fax</td>
		  </tr>
		  <tr>
			<td class="label"><INPUT TYPE="TEXT" MAXLENGTH="50" NAME="EMAIL"><br>
Email</td>
		  </tr>

		</table></td>
		  </tr>
		 <tr><td colspan="2"><INPUT NAME="B2" TYPE="button" value="Submit" onClick="return validate_form();">   <INPUT NAME="B2" TYPE="reset" value="reset"></td></tr>
		</table>
</form>
</cfif>
		  </td>
        </tr>
      </table>
			<cfinclude template="vendorFooter.cfm">