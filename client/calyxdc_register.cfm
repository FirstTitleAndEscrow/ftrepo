<center>
<cfparam name="url.a_trigger" default="0">
<cfparam name="enhanced_coverage" default="1">
<cfset request.dsn = "First_Title_Main_Admin">


<CFPARAM NAME="sales_id" DEFAULT="303">
<!--- <CFPARAM NAME="sales_id" DEFAULT="256"> --->
<cfparam name="url.em" default="">
<cfparam name="url.blast" default="">
<cfif url.em neq "">
<CFQUERY DATASOURCE="#request.dsn#" NAME="delete_it">
		DELETE
		FROM Calyx_Email_Responders
		WHERE email = '#url.em#' and blast = '#url.blast#'
</CFQUERY>
<CFQUERY DATASOURCE="#request.dsn#" NAME="add_it">
		INSERT INTO Calyx_Email_Responders (email, blast) values ('#url.em#', '#url.blast#')
</CFQUERY>
</cfif>

<cfset send_to_email = "spape@firsttitleservices.com">

<cfif url.a_trigger eq 1>
<!--- <cfdump var="#form#"><br> --->

<CFQUERY DATASOURCE="#request.dsn#" NAME="check_companies">
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
<CFPARAM NAME="referred" DEFAULT="">
<cfif referred eq 'Please Select' or referred eq 'Email' or  referred eq 'Other'>
<cfset sales_id = sales_id> <!--- default salesperson Jeff Jurin --->
<cfelse>
<cfset sales_id = 303> 
<!--- <cfset sales_id = referred>  --->
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
<CFPARAM NAME="uid" DEFAULT="">
<CFPARAM NAME="pwd" DEFAULT="">
<CFPARAM NAME="st_abbrev" DEFAULT="">
<CFPARAM NAME="ft_agencies" DEFAULT="">
<CFPARAM NAME="a_comment" DEFAULT="">
<CFPARAM NAME="a_note_1" DEFAULT="">
<CFPARAM NAME="status" DEFAULT="">
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
<CFPARAM NAME="team_id" DEFAULT="16">
<CFPARAM NAME="referred_other" DEFAULT="0">

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
<CFQUERY DATASOURCE="#request.dsn#" name="check_comp">
	Select * from companies where company = '#new_comp_name#'
</CFQUERY>
<cfif check_comp.recordcount>
	<cfset new_comp_name = #company# & " - " & #city# & " - " & #last#>
	<CFQUERY DATASOURCE="#request.dsn#" name="check_comp">
		Select * from companies where company = '#new_comp_name#'
	</CFQUERY>
	<cfif check_comp.recordcount>
		<cfset new_comp_name = #company# & " - " & #city# & " - " & #last# & ", " & #first#>
	</cfif>
</cfif>
	
<CFQUERY DATASOURCE="#request.dsn#">
	INSERT INTO companies(company, contact_fname, contact_lname, phone, fax, addr1, addr2, city, state, zip_code, email, a_time, a_date, a_note_1, a_comment, a_uid, a_status, a_user, a_pass, status,intCustServ,intSales,companies_switch, team_id, prev_team_id, test_account, calyx_refer, calyx_refer_other, sign_up_date, position, extention, enhanced_coverage)
	VALUES('#new_comp_name#', '#FIRST#', '#LAST#', '#phone#', '#fax#', '#addr1#', '#addr2#', '#city#', '#state#', '#zip#', '#email#', '#c_time#', '#c_date#', '#a_note_1#', '#a_comment#', '59', 1, '#uid#', '#PWD#', '#status#','292','#sales_id#',0, #team_id#, #team_id#, 0, '#referred#', '#referred_other#', '#c_date#', '#position#', '#extention#',#enhanced_coverage#)
</CFQUERY>


<CFQUERY DATASOURCE="#request.dsn#" NAME="Read_ID">
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

<CFQUERY DATASOURCE="#request.dsn#" NAME="get_sales">
	SELECT *
	FROM First_admin
	WHERE ID = '#Read_ID.intSales#'
</CFQUERY>
<CFQUERY DATASOURCE="#request.dsn#" NAME="get_team">
	SELECT f.email
	FROM companies c, teams t, first_admin f
	WHERE c.ID = '#Read_ID.ID#'
	and c.team_id = t.id
	and t.Leader_id = f.ID
</CFQUERY>

<!--- TO="#send_to_email#; #get_sales.email#"  --->
 <CFMAIL 
TO="#send_to_email#"
CC="jmoore@firsttitleservices.com"
FROM="sales@firsttitleservices.com"
Subject="#new_comp_name#, New Calyx Direct Connect customer signup" 
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
        <font size="3">The information below is entered by a new user of <cfoutput>#session.site.short_name#</cfoutput>
's Web.<o:p></o:p><o:p></o:p><o:p></o:p><o:p></o:p><o:p></o:p></font><o:p></o:p></span></b></font></p></td>
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
    #referred# #referred_other#
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
TO="#send_to_email#"
CC="jmoore@firsttitleservices.com"
FROM="sales@firsttitleservices.com"
Subject="#new_comp_name#, New Calyx Direct Connect customer signup - TEXT"
SERVER="127.0.0.1"
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
Referred by: #referred# #referred_other#

</cfmail>
<cfinclude template="../auto_emails/new_account.cfm">
<CFQUERY DATASOURCE="#request.dsn#" NAME="Read_ID">
	SELECT *
	FROM companies
	WHERE a_time = '#c_time#' AND a_date = '#c_date#'
</CFQUERY>

<CFINCLUDE TEMPLATE="../client_line_costs_add_submit3.cfm">
<CFINCLUDE TEMPLATE="../client_line_costs_add_submit2010_3.cfm"></cfif>











<CFQUERY DATASOURCE="#request.dsn#" NAME="get_sales">
		SELECT     *
		FROM         First_Admin
		WHERE     ((role_id = '24') AND (status = '1')) OR
                      (ID = '58') OR
                      (ID = '59') OR
                      (ID = '56')
		order by lname
</CFQUERY>

<CFPARAM NAME="a_trigger" DEFAULT="0">
<html>
<head>
<title><cfoutput>#session.site.short_name#</cfoutput>
/Calyx Direct Connect - Getting Started</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}
P {font:bold 11px Courier,Verdana,Tahoma,Arial}
.menu1 {color:#FFFFFF;font:normal bold 13px Arial, Helvetica, sans-serif;text-align:center;font-color:#FFFFFF}
.menu1:link    {text-decoration:none;color:#FFFFFF} 
.menu1:visited {text-decoration:none;color:#FFFFFF} 
.menu1:hover   {font:normal bold 13px Arial, Helvetica, sans-serif;text-decoration:none;color:#000000} 
.menu2 {color:#FFFFFF;font:normal bold 13px Arial, Helvetica, sans-serif;text-align:center;font-color:#FFFFFF}
.menu2:link    {text-decoration:none;color:#000000} 
.menu2:visited {text-decoration:none;color:#000000} 
.menu2:hover   {font:normal bold 14px Arial, Helvetica, sans-serif;text-decoration:none;color:#FFFFFF}
.menu3 {color:#FFFFFF;font:normal bold 10px Verdana, Arial, Helvetica, sans-serif;text-align:center;font-color:#FFFFFF}
.menu3:link    {text-decoration:none;color:#FFFFFF} 
.menu3:visited {text-decoration:none;color:#FFFFFF} 
.menu3:hover   {font:normal bold 11px Verdana, Arial, Helvetica, sans-serif;text-decoration:none;color:#FF3300}

</STYLE> 

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
if (document.register_form.referred.value=='Other' && document.register_form.referred_other.value=='' ) {
message = message + "Referred By Info\n"
valid = false;
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
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#294163" link="#FF0000" vlink="#FF0000" alink="#FF0000">
<table width="780" height="110" border=0 cellpadding=0 cellspacing=0 background="images/banner_black_wout_logo.jpg" valign=top>
  <tr> 
    <td rowspan="2" valign="top" width="220"><cfinclude template="logo_swap_include.cfm"></td>
    <td valign="top" align="right">
	<br>
	<FORM name=formSearch action="javascript:startsearch() //">
	    <table align="right" cellpadding="0" cellspacing=0>
          <tr> 
            <td align="center" valign="middle"><b><font color="96E102" size="2" face="Verdana, Helvetica, sans-serif">Search</font></b>&nbsp;</td>
            <td align="center" valign="center"> 
              <input type="text" name="txtSearch" size=20>&nbsp;</td>
            <td align="right" valign="bottom"><input type="image" src="/client/images/searchgo2.jpg" border=0 alt="Begin your Web search"></td>
			<td width="30">&nbsp;</td>
		  </tr>
		</table>
  </FORM>
</td>
  </tr>
  <tr> 
    <td valign="top" align="center" width="560"><nobr></nobr><br>
      &nbsp;</td>
  </tr>
</table>
<table cellpadding="0" cellspacing="0" border="0" width="780" bgcolor="000000">
			<tr>
				<td width="160" bgcolor="000000">&nbsp;</td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/login.cfm"><img src="images/nav_login.jpg" border="0" alt="LOGIN" onClick="document.location.href='/client/loginb.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/company.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('COMPANY','','images/nav_company_on.jpg',1);" ><img name="COMPANY" src="images/nav_company_off.jpg" border="0" alt="COMPANY" onClick="document.location.href='/client/company.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/services.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('PRODUCTS','','images/nav_products_on.jpg',1);" ><img name="PRODUCTS" src="images/nav_products_off.jpg" alt="PRODUCTS" border="0"  onClick="document.location.href='/client/services.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/vendor.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('VENDORS','','images/nav_vendors_on.jpg',1);" ><img name="VENDORS" src="images/nav_vendors_off.jpg" alt="VENDORS" border="0" onClick="document.location.href='/client/vendor.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/employment.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('CAREERS','','images/nav_careers_on.jpg',1);" ><img name="CAREERS" src="images/nav_careers_off.jpg" alt="CAREERS" border="0" onClick="document.location.href='/client/employment.cfm';return false;"></a></td>
				<td align="left" valign="bottom" bgcolor="000000"><a href="/client/contact.cfm" onMouseOut="MM_swapImgRestore()"  onMouseOver="MM_swapImage('CONTACT','','images/nav_contact_on.jpg',1);" ><img name="CONTACT" src="images/nav_contact_off.jpg" alt="CONTACT US" border="0" onClick="document.location.href='/client/contact.cfm';return false;"></a></td>
				</tr>
			<tr>
				<td width="160"><img src="images/nav_login_bar_left.jpg" border="0"></td>
				<td colspan="6"><img src="images/nav_login_bar_right.jpg" border="0"></td>
			</tr>
	</table>
	<table cellpadding="0" cellspacing="0" border="0" width="780">
	<tr>
		<td bgcolor="FECE62" valign="top" width = "160"><br>
		<table cellpadding="1" cellspacing="1" border="0" width="160">
		   <tr> <td width="89" bgcolor="#FF9900" nowrap onMouseOver="this.bgColor='#FFFF99'" onMouseOut="this.bgColor='#FF9900'" onClick="document.location.href='/client/loginb.cfm';return false;"><a class="menu1" href="/client/loginb.cfm"><nobr>Customer Login</nobr></font></a></td></tr>
         <tr> <td width="89" bgcolor="#FF9900" nowrap onMouseOver="this.bgColor='#FFFF99'" onMouseOut="this.bgColor='#FF9900'" onClick="document.location.href='/client/vlogin.cfm';return false;"><a class="menu1" href="/client/vlogin.cfm"><nobr>Vendor Login</nobr></font></a></td></tr>
          <tr> <td width="89" bgcolor="#FF9900" nowrap onMouseOver="this.bgColor='#FFFF99'" onMouseOut="this.bgColor='#FF9900'" onClick="document.location.href='/client/tlogin.cfm';return false;"><a class="menu1" href="/client/tlogin.cfm"><nobr>Third Party Login</nobr></font></a></td></tr>
       	 <tr> <td width="89" bgcolor="#FF9900" nowrap onMouseOver="this.bgColor='#FFFF99'" onMouseOut="this.bgColor='#FF9900'" onClick="document.location.href='/client/alogin.cfm';return false;"><a class="menu1" href="/client/alogin.cfm"><nobr>Admin Login</nobr></font></a></td></tr>
		<tr> <td width="89" bgcolor="#FF9900" nowrap onMouseOver="this.bgColor='#FFFF99'" onMouseOut="this.bgColor='FF9900'" onClick="document.location.href='/client/calyxdc_register.cfm';return false;"><a class="menu1" href="/client/calyxdc_register.cfm"><nobr>New Customer Signup</nobr></font></a></td></tr>
	<tr> <td width="89" bgcolor="#FF9900" nowrap onMouseOver="this.bgColor='#FFFF99'" onMouseOut="this.bgColor='FF9900'" onClick="document.location.href='/client/vendor.cfm';return false;"><a class="menu1" href="/client/vendor.cfm"><nobr>New Vendor Signup</nobr></font></a></td></tr>
		
					 </table>

					 <BR>
					 <center>
<style>
.label {font-size: 12px; color:black; font-family:Arial, Helvetica, sans-serif;}
.header {font-size: 20px; color:#000066; font-family:Arial, Helvetica, sans-serif; font-weight:bold}
.header2 {font-size: 14px; color:#FF6600; font-family:Arial, Helvetica, sans-serif; font-weight:bold}
.header3 {font-size: 18px; color:#FF6600; font-family:Arial, Helvetica, sans-serif; font-weight:bold}
.smallprint {font-size: 12px; color:black; font-family:Arial, Helvetica, sans-serif;}
.bodytext {font-size: 12px; color:black; font-family:Arial, Helvetica, sans-serif; font-weight:bold}
.alert {font-size: 16px; color:red; font-family:Arial, Helvetica, sans-serif; font-weight:bold}
</style>

					 <span class="header3">Already a Customer?<br></span>
<a href="login.cfm" class="header2">Login Here</a><br>
</center>


		</td>
		<td bgcolor="FFFFFF" valign="top">
			<!---- body text starts ----->
			
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
<td align="left" valign="middle"><img src="images/FT_bug.gif" width="44" height="50"></td>
<td align="center" valign="middle" class="header">Welcome Calyx Point User</td>
<td align="left" valign="middle"><img src="images/Calyx_bug.gif" width="80" height="33"></td>
</tr>
</table>
</td>
  </tr>
  <tr>
    <td align="center" valign="top" class="header3">THANK YOU!!! <br>
<br>
<span class="bodytext">Your registration has been received.  You can now order title and closing cost via Point "Services".  A <cfoutput>#session.site.short_name#</cfoutput>
 representative will contact you shortly to introduce you to the many <cfoutput>#session.site.short_name#</cfoutput>
 services to make your life easier and make you more money.<br>
<br>
<span class="alert">Remember to store your Username and Password in Point for Auto login</span><br>
<img src="images/calyx_login.gif" width="288" height="163"><br>
<br>
<span class="header2">Join us every Tues. at 10 AM and Thurs. at 4 PM EST for  '<cfoutput>#session.site.short_name#</cfoutput>
 Web Training'  - Click <a href="calyx_webdemo_register.cfm">here</a> for show times</span><br>
<br><br>
<a href="https://<cfoutput>#cgi.server_name#</cfoutput>/training/" target="_new">Click here for <cfoutput>#session.site.short_name#</cfoutput>
 web demonstration</a><br>
<a href="http://www.calyxsoftware.com/demo/pointwn5-4.htm" target="_new">Click here for Calyx Point 5.4 demonstration</span></a></td></tr>
</table>
</td></tr></table>


<cfelse>
 <table width="97%" cellpadding="0" cellspacing="0" border="0" align="center" valign="top">

<FORM METHOD=POST ACTION="/client/calyxdc_register.cfm?a_trigger=1" name="register_form">
<table width="100%"  border="0" cellspacing="3" cellpadding="3">
  <tr>
    <td colspan="2" align="center">
<table width="100%">
<tr>
<td align="left" valign="middle"><img src="images/FT_bug.gif" width="44" height="50"></td>
<td align="center" valign="middle" class="header">Welcome Calyx Point User<br>
<span class="header2">Getting Started</span></td>
<td align="left" valign="middle"><img src="images/Calyx_bug.gif" width="80" height="33"></td>
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
			<td class="label">
			<input type="hidden" name="intsales" value="<cfoutput>#sales_ID#</cfoutput>">
			<input type="text" name="referred" value="" maxlength="50"><INPUT TYPE="hidden" MAXLENGTH="50" NAME="referred_other" value="">
			<!--- <select name="referred" onchange="select_other();">
		  <OPTION SELECTED VALUE="Please Select">Please Select</option>
          <OPTION VALUE="Please Select">----------------------</option>
		  <option value="Email">Email Ad</option>
		  <cfoutput query="get_sales">
		 <option value="#ID#" <cfif ID eq 256>selected</cfif>>#fname# #lname#</option>
		  </cfoutput>
		  <option value="Other">Other</option>
		  </select> ---><br>
Referred By</td>
		  </tr>
		  <!--- <tr id="other_block" style="display:none">
			<td class="label"><INPUT TYPE="hidden" MAXLENGTH="50" NAME="referred_other" value=""><br>
Referred by info</td>
		  </tr> --->
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
			<td class="label" colspan="2"><INPUT TYPE="TEXT" MAXLENGTH="50" NAME="BRANCH"><br>
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
			<!---- body text ends ----->
		</td>
	</tr>
	<tr>
		<td bgcolor="D98002">&nbsp;</td>
		<td bgcolor="000000">
			<table cellpadding="0" cellspacing="0" border="0" width="98%" align="center">
				<tr>
				<td width="47%"><font face="Verdana, Arial, Helvetica, sans-serif" color="FFFFFF" size="1"><b><a class="menu3" href="./main.cfm">Home<a> | <a class="menu3" href="./termuse.cfm">Terms of Use<a>  | <a class="menu3" href="./policy.cfm">Privacy Policy<a></b></font></td>
				<td width="43%" align="right"><font face="Verdana, Arial, Helvetica, sans-serif" color="FFFFFF" size="1"><b>© 2003-<cfoutput>#DatePart("yyyy", Now())#</cfoutput> <cfoutput>#session.site.Long_Name#</cfoutput></b></font></td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<script type="text/javascript">

 

  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);

 

  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();

 

</script>
</center>
</body>
</html>
