<cfparam name="al" default="0">
<cfparam name="url.lock" default="">
<cfparam name="emailed" default = "YES">

<cfif url.lock eq 1>
<CFQUERY datasource="#request.dsn#" NAME="hud_lock">
			update title set hud_lock = 1
			WHERE Title_ID = #rec_id#
		</CFQUERY>
<cfelseif url.lock eq 0>
<CFQUERY datasource="#request.dsn#" NAME="hud_lock">
			update title set hud_lock = 0
			WHERE Title_ID = #rec_id#
		</CFQUERY>
</cfif>

<cffunction name="FixDecimals" >
	<cfargument name="input_num">
	<cfif IsNumeric(arguments.input_num)>
		<cfset new_num = NumberFormat(arguments.input_num, "_,___,___,___.__")>
	<cfelse>
		<cfset new_num = arguments.input_num>
	</cfif>
	<cfif arguments.input_num eq 0>
		<cfset new_num = "">
	</cfif>
	<cfreturn new_num>
</cffunction>



<cfparam name="a_trigger" default="0">
<cfparam name="uid" default="">
<cfparam name="lo_id" default="">

<html>
<head>
<title></title>
 <HTML XMLNS:IE>
<HEAD>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="links.css" type="text/css">
<style media="print">
.noprint     { display: none }
</style>

<SCRIPT LANGUAGE="JavaScript">
<!--
    function printWindow(){

		 factory.printing.header = ""
         factory.printing.footer = ""
         factory.printing.leftMargin = 0.25
         factory.printing.topMargin = 0.25
         factory.printing.rightMargin = 0.25
         factory.printing.bottomMargin = 0.25
       	 factory.printing.Print(false,window)
    }

</script>

<SCRIPT LANGUAGE="JavaScript">
<!--
    function Locate(){

		 window.location= "https://<cfoutput>#cgi.server_name#</cfoutput>/title_view_hud_pg1_modify.cfm?uid=<cfoutput>#uid#</cfoutput>&rec_id=<cfoutput>#rec_id#</cfoutput>&a_trigger=2";

    }

</script>
</HEAD>




<CFQUERY datasource="#request.dsn#" NAME="read_data">
			SELECT *
			FROM hud_form_title_pg1
			WHERE Title_ID = #rec_id#
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_data2">
			SELECT *
			FROM hud_form_title_pg2
			WHERE Title_ID = #rec_id#
		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_titleid">
			SELECT *
			FROM title
			WHERE Title_ID = #rec_id#
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_comp_info">
			SELECT *
			FROM Companies
			WHERE ID = #get_titleid.comp_id#
		</CFQUERY>
<cfif get_comp_info.id eq 2632 or get_comp_info.master_co_id eq 2632>
<cfset title_co_name = "Axiom Title">
<cfelse>
<cfset title_co_name = "First Title">
</cfif>
<CFQUERY datasource="#request.dsn#" NAME="get_insurance">
				SELECT * from Doc_Title_Insurance_Title
				where Title_ID = #rec_id#

			</CFQUERY>
			<cfif #get_insurance.recordcount# GT 0>
			<CFQUERY datasource="#request.dsn#" NAME="get_ins">
				SELECT * from title_companies
				where Title_co_ID = '#get_insurance.insurance_co#'

			</CFQUERY>
			<cfelse>
			<CFQUERY datasource="#request.dsn#" NAME="get_ins">
				SELECT * from title_companies
				where 0 = 1

			</CFQUERY>
			</cfif>
<CFQUERY datasource="#request.dsn#" NAME="get_billing_states">
		SELECT *
		FROM  Company_Billing_states
		WHERE company_id = #get_titleid.comp_id# AND a_states = '#get_titleid.pstate#'

</CFQUERY>
<cfif #get_billing_states.recordcount# GT "0">
<CFQUERY datasource="#request.dsn#" NAME="get_line_costs">
		SELECT *
		FROM Company_Billing_Values
		WHERE company_id = #get_titleid.comp_id# AND billing_id = #get_billing_states.billing_id#
	</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_agency">
		SELECT title_ft_agency_name
		FROM  company_agency_assoc
		WHERE billing_id = '#get_billing_states.billing_id#'

</CFQUERY>

<cfelse>
<cfset #read_agency.TITLE_FT_AGENCY_NAME# = "Agency N/A">
<cfset #get_line_costs.A_1111_TEXT# = "">
<cfset #get_line_costs.A_1112_TEXT# = "">
<cfset #get_line_costs.A_1113_TEXT# = "">
<cfset #get_line_costs.A_1113_TEXT# = "">
<cfset #get_line_costs.A_1205_TEXT# = "">
<cfset #get_line_costs.A_1303_TEXT# = "">
<cfset #get_line_costs.A_1304_TEXT# = "">
<cfset #get_line_costs.A_1305_TEXT# = "">
</cfif>
  <cfif #a_trigger# eq 2>
<CFQUERY datasource="#request.dsn#">
		update hud_form_title_pg2
		set print_date = '#DateFormat(Now(), "mmmmm dd, yyyy")#'
		WHERE Title_ID = #rec_id#

</CFQUERY>	</cfif>
<cfif #a_trigger# eq 23>

<cfif #get_titleid.loan_number# neq "">

   <cfset loan_number=", Loan No. -"&#get_titleid.loan_number#>
	 <cfelse>
	  <cfset loan_number="">
</cfif>
<!---  nelli@firsttitleservices.com got rid <cfif #get_titleid.loan_number# neq "">, Loan No. - #get_titleid.loan_number#</cfif>--->


<cfhttp url="https://#cgi.server_name#/rick_tests/hud_spooler/email_hud.cfm" method="post" resolveurl="no">
  <cfhttpparam name="the_list" type="FormField" value="#rec_id#" >
  <cfhttpparam name="file_name" type="FormField" value="" >
  <cfhttpparam name="email" type="FormField" value="#email#" >
</cfhttp>
<cfset emailed = 'yes'>

<!--- <CFMAIL
TO="#email#"
FROM="hudprep@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="#title_co_name# - PRE HUD1 for order #rec_id# - #get_titleid.bfirstname1# #get_titleid.blastname1#"
TIMEOUT="600"
type="HTML"
>

View/Print <A HREF="https://#cgi.server_name#/title_view_hud_pg1.cfm?comp_id=115&user_id_1=723&lo_id=1217&rec_id=#rec_id#&a_trigger=1&company_id=0" target="new">HUD1</a> for order #rec_id#  - #get_titleid.bfirstname1# #get_titleid.blastname1#</B></font><br><br>

#title_co_name# staff
</cfmail> --->
<cfelse>
<cfset emailed = 'no'>
</cfif>
<BODY TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" marginheight=0 marginwidth=0 topmargin=0 leftmargin=0>
<object id="factory" style="display:none" viewastext
classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814"
codebase="https://www.firsttitleservices.com/smsx.exe">
</object>
<!---
<cfoutput>
<object id=idPDF width=50% height=50%
classid="clsid:CA8A9780-280D-11CF-A24D-444553540000">
  <param name="src" value="https://#cgi.server_name#/title_view_hud_pg1.cfm">
</object>
</cfoutput>
 --->
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
 <!--- factory.printing.Print(false,window)

 function Print() {
  factory.printing.Print(false); // no prompt
}
idPrint.disabled = false;

function PrintPDF(url) {
  factory.printing.PrintPDF(idPDF);
} --->
<p>
<div id=lock align="left" class="noprint">
<table>
<tr>
<td align="left" valign="top">
<cfset new_query_string = ReplaceNoCase(cgi.query_string, "&lock=1", "", "ALL")>
<cfset new_query_string = ReplaceNoCase(new_query_string, "&lock=0", "", "ALL")>
<cfoutput>
<cfif isdefined("session.ft_user_id")>
<cfif get_titleid.hud_lock eq 0>
<table width="250">
<tr>
<tr><td align="left" valign="top" width="52"><a href="#cgi.script_name#?#new_query_string#&lock=1"><img src="../images/unlock.gif" alignment="left" border=0></a></td>
<td align="left" valign="top"><font size=2 face="Arial, Helvetica, sans-serif"><font color="green"><strong>HUD UNLOCKED</strong></font><br>
Click the lock to<br>
<font color=red>Lock Down</font> this HUD and<br>
prevent client changes</font></td>
</tr>
</table>
<cfelse>
<table width="250">
<tr>
<tr><td align="left" valign="top" width="52"><a href="#cgi.script_name#?#new_query_string#&lock=0"><img src="../images/locked.gif" alignment="left" border=0></a></td>
<td align="left" valign="top"><font size=2 face="Arial, Helvetica, sans-serif"><font color="red"><strong>HUD LOCKED</strong></font><br>
Click the lock to<br>
<font color=green>Unlock</font> this HUD and<br>
allow client changes</font></td>
</tr>
</table>
</cfif>
</cfif>
</cfoutput>
</td>
<td align="center" valign="top">
<div id=idControls align="center" class="noprint">
 <font color = red face="Arial, Helvetica, sans-serif"><b>**NOTE: Under page setup change the paper size to legal before printing this document</b>

 <p>
 <cfoutput>
 <FORM METHOD=POST ACTION="./title_view_hud_pg1.cfm?uid=#uid#&al=#al#&rec_id=#rec_id#&a_trigger=2&company_id=#get_titleid.comp_ID#" name="frm" ENABLECAB="Yes">
</cfoutput>

 <a href="#" onclick=printWindow();><input disabled type="submit" value="Print the page"
 onclick="factory.printing.Print(true)"></a>
 <input disabled type="button" value="Page Setup..."
 onclick="factory.printing.PageSetup()">
 <input class=ie55 disabled type="button" value="Print Preview..."
 onclick="factory.printing.Preview()">
 <cfif get_titleid.hud_lock eq 0 or IsDefined("session.ft_user_id")>
   <cfoutput><a href="./title_view_hud_pg1_modify.cfm?uid=#uid#&al=#al#&rec_id=#rec_id#&a_trigger=2&company_id=#get_titleid.comp_ID#"><input class=ie55 disabled type="button" value="Modify..." onClick="Locate();"></a></cfoutput>
<cfelse><br><br>
<font color="red">HUD Finalized. Contact First Title team lead to make further changes</font><br>
<br></cfif>
</form>
<cfoutput>
<FORM NAME="Search" METHOD="post" ACTION="./title_view_hud_pg1.cfm">
 <input type="Hidden" name="al" value="#al#">
  <input type="Hidden" name="a_trigger" value="23">
  <input type="Hidden" name="uid" value="#uid#">
 <input type="Hidden" name="rec_id" value="#rec_id#">
 </cfoutput> <FONT FACE=ARIAL SIZE=2 color="black">Enter email to send </font><input disabled type=text name="email" size=20 maxlength=100
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e6e6e6;
								border-color: e6e6e6;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;"
								> <cfoutput><input type="image" src="https://#cgi.server_name#/admin_area/images/button_submit.gif" border=0 alt="send email"></cfoutput>
</FORM> <cfif emailed eq 'yes'><FONT FACE=ARIAL SIZE=2 color="blue">Email sent</cfif></NOBR>
</td>
<td align="right" valign="top"></td>
</tr>

</table>
</div>
<!--- <input id=idPrint disabled type="button" value="Print the PDF"
 onclick="PrintPDF()"> --->

<table align="center" width="98%" cellspacing=0 cellpadding=0>
<CFQUERY datasource="#request.dsn#" NAME="get_all_mods">
			Select * from hud_modify_new
			WHERE title_id = #rec_id#
			order by c_date DESC, c_time, field_num
	</cfquery>



<!--- <cfif cgi.REMOTE_ADDR eq '68.33.102.139'>
<cfdump var="#get_all_mods#"><cfabort>
</cfif>
 ---><cfif get_all_mods.recordcount>
<cfoutput query="get_all_mods">
<tr>
<td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
#DateFormat(c_date, "mm/dd/yyyy")#&nbsp;&nbsp;#TimeFormat(c_time, "hh:mm:ss")#:&nbsp;&nbsp;&nbsp;Line #UCASE(field_num)# was changed from #previous_value# to #current_value# by #lname#<br>
</font></td>
</tr>
</cfoutput>
</cfif>
</table>
<br>
<table align="center" width="98%" cellspacing=0 cellpadding=0>
<CFQUERY datasource="#request.dsn#" NAME="get_all_mods">
			Select * from hud_modify
			WHERE title_id = #rec_id#
			 order by c_date DESC, c_time DESC
	</cfquery>



<!--- <cfif cgi.REMOTE_ADDR eq '68.33.102.139'>
<cfdump var="#get_all_mods#"><cfabort>
</cfif>
 ---><cfif get_all_mods.recordcount>
<cfoutput query="get_all_mods">
<cfif Len(a_103)>
<tr>
<td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
#c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 103 was changed from #a_103# to #a103# by #fname#&nbsp;&nbsp;#lname#<br>
</font></td>
</tr>
<cfelseif Len(a_104_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 104(a) was changed from #a_104_a# to #a104_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_104_b)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 104(b) was changed from #a_104_b# to #a104_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_105_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 105(a) was changed from #a_105_a# to #a105_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_105_b)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 105(b) was changed from #a_105_b# to #a105_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_301)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 301 was changed from #a_301# to #a301# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_302)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 302 was changed from #a_302# to #a302# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_303)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 303 was changed from #a_303# to #a303# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_504)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 504 was changed from #a_504# to #a504# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_505)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 505 was changed from #a_505# to #a505# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>



<cfelseif Len(a_700_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 700(a) was changed from #a_700_a# to #a700_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_700_b)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 700(b) was changed from #a_700_b# to #a700_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_700_c)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 700(c) was changed from #a_700_c# to #a700_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_701_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 701(a) was changed from #a_701_a# to #a701_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_701_b)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 701(b) was changed from #a_701_b# to #a701_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>


<cfelseif Len(a_702_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 702(a) was changed from #a_702_a# to #a702_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_702_b)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 702(b) was changed from #a_702_b# to #a702_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_703_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 703(a) was changed from #a_703_a# to #a703_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_703_b)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 703(b) was changed from #a_703_b# to #a703_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>







<cfelseif Len(a_801_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 801(a) was changed from #a_801_a# to #a801_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_801_b)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 801(b) was changed from #a_801_b# to #a801_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_801_d)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 801(d) was changed from #a_801_d# to #a801_d# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_802_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 802(a) was changed from #a_802_a# to #a802_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_802_b)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 802(b) was changed from #a_802_b# to #a802_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_802_d)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 802(d) was changed from #a_802_d# to #a802_d# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_803_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 803(a) was changed from #a_803_a# to #a803_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_803_b)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 803(b) was changed from #a_803_b# to #a803_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_804_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 804(a) was changed from #a_804_a# to #a804_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_804_b)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 804(b) was changed from #a_804_b# to #a804_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_805_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 805(a) was changed from #a_805_a# to #a805_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_805_b)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 805(b) was changed from #a_805_b# to #a805_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_806_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 806(a) was changed from #a_806_a# to #a806_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_806_b)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 806(6) was changed from #a_806_b# to #a806_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_807_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 807(a) was changed from #a_807_a# to #a807_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_807_b)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 807(b) was changed from #a_807_b# to #a807_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_808_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 808(a) was changed from #a_808_a# to #a808_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_808_b)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 808(b) was changed from #a_808_b# to #a808_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_809_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 809(a) was changed from #a_809_a# to #a809_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_809_b)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 809(b) was changed from #a_809_b# to #a809_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_810_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 810(a) was changed from #a_810_a# to #a810_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_810_b)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 810(b) was changed from #a_810_b# to #a810_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_811_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 811(a) was changed from #a_811_a# to #a811_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_811_b)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 811(b) was changed from #a_811_b# to #a811_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>


<cfelseif Len(a_8)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Mortgage Insurance Case Number was changed from #a_8# to #a8# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

<cfelseif Len(dis_date)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Distribution Date was changed from #dis_date# to #disdate# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>


<cfelseif Len(a_901_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 901(a) was changed from #a_901_a# to #a901_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_901_b)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 901(b) was changed from #a_901_b# to #a901_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_901_c)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 901(c) was changed from #a_901_c# to #a901_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_901_d)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 901(d) was changed from #a_901_d# to #a901_d# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_902_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 902(a) was changed from #a_902_a# to #a902_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_902_b)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 902(b) was changed from #a_902_b# to #a902_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_902_c)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 902(c) was changed from #a_902_c# to #a902_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_903_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 903(a) was changed from #a_903_a# to #a903_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_903_b)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 903(b) was changed from #a_903_b# to #a903_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_903_c)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 903(c) was changed from #a_903_c# to #a903_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_904_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 904(a) was changed from #a_904_a# to #a904_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_904_b)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 904(b) was changed from #a_904_b# to #a904_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_905_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 905(a) was changed from #a_905_a# to #a905_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_1001_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1001(a) was changed from #a_1001_a# to #a1001_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_1001_b)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1001(b) was changed from #a_1001_b# to #a1001_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_1001_c)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1001(c) was changed from #a_1001_c# to #a1001_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_1002_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1002(a) was changed from #a_1002_a# to #a1002_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_1002_b)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1002(b) was changed from #a_1002_b# to #a1002_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_1002_c)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1002(c) was changed from #a_1002_c# to #a1002_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_1003_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1003(a) was changed from #a_1003_a# to #a1003_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_1003_b)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1003(b) was changed from #a_1003_b# to #a1003_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_1003_c)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1003(c) was changed from #a_1003_c# to #a1003_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_1004_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1004(a) was changed from #a_1004_a# to #a1004_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_1004_b)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1004(b) was changed from #a_1004_b# to #a1004_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_1004_c)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1004(c) was changed from #a_1004_c# to #a1004_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_1005_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1005(a) was changed from #a_1005_a# to #a1005_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_1005_b)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1005(b) was changed from #a_1005_b# to #a1005_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
<cfelseif Len(a_1005_c)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1005(c) was changed from #a_1005_c# to #a1005_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

<cfelseif Len(a_1101_a)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1101(a) was changed from #a_1101_a# to #a1101_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1102_a)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1102(a) was changed from #a_1102_a# to #a1102_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>


 <cfelseif Len(a_1103_a)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1103(a) was changed from #a_1103_a# to #a1103_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>


 <cfelseif Len(a_1104_a)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1104(a) was changed from #a_1104_a# to #a1104_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>


 <cfelseif Len(a_1105_a)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1105(a) was changed from #a_1105_a# to #a1105_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1106_a)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1106(a) was changed from #a_1106_a# to #a1106_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1107_a)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1107(a) was changed from #a_1107_a# to #a1107_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1107_c)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1107(c) was changed from #a_1107_c# to #a1107_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1108_a)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1108(a) was changed from #a_1108_a# to #a1108_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1108_c)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1108(c) was changed from #a_1108_c# to #a1108_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1109_a)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1109(a) was changed from #a_1109_a# to #a1109_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1110_a)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1110(a) was changed from #a_1110_a# to #a1110_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1111_a)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1111(a) was changed from #a_1111_a# to #a1111_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1111_c)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1111(c) was changed from #a_1111_c# to #a1111_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1112_a)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1112(a) was changed from #a_1112_a# to #a1112_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1112_c)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1112(c) was changed from #a_1112_c# to #a1112_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1113_a)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1113(a) was changed from #a_1113_a# to #a1113_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1113_c)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1113(c) was changed from #a_1113_c# to #a1113_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1114_a)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1114(a) was changed from #a_1114_a# to #a1114_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1114_c)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1114(c) was changed from #a_1114_c# to #a1114_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1201_a)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1201(a) was changed from #a_1201_a# to #a1201_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1201_b)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1201(b) was changed from #a_1201_b# to #a1201_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1201_c)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1201(c) was changed from #a_1201_c# to #a1201_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1201_d)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1201(d) was changed from #a_1201_d# to #a1201_d# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1202_a)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1202(a) was changed from #a_1202_a# to #a1202_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1202_b)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1202(b) was changed from #a_1202_b# to #a1202_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1202_c)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1202(c) was changed from #a_1202_c# to #a1202_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1202_d)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1202(d) was changed from #a_1202_d# to #a1202_d# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>


 <cfelseif Len(a_1203_a)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1203(a) was changed from #a_1203_a# to #a1203_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1203_b)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1203(b) was changed from #a_1203_b# to #a1203_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1203_c)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1203(c) was changed from #a_1203_c# to #a1203_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1203_d)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1203(d) was changed from #a_1203_d# to #a1203_d# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1204_a)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1204(a) was changed from #a_1204_a# to #a1204_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1204_b)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1204(b) was changed from #a_1204_b# to #a1204_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1205_a)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1205(a) was changed from #a_1205_a# to #a1205_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1301_a)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1301(a) was changed from #a_1301_a# to #a1301_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1301_b)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1301(b) was changed from #a_1301_b# to #a1301_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1301_text)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1301(text) was changed from #a_1301_text# to #a1301_text# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1302_a)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1302(a) was changed from #a_1302_a# to #a1302_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1302_b)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1302(b) was changed from #a_1302_b# to #a1302_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1302_text)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1302(text) was changed from #a_1302_text# to #a1302_text# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1303_a)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1303(a) was changed from #a_1303_a# to #a1303_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1303_b)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1303(b) was changed from #a_1303_b# to #a1303_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1303_text)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1303(text) was changed from #a_1303_text# to #a1303_text# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1304_a)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1304(a) was changed from #a_1304_a# to #a1304_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1304_b)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1304(b) was changed from #a_1304_b# to #a1304_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1304_text)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1304(text) was changed from #a_1304_text# to #a1304_text# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1305_a)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1305(a) was changed from #a_1305_a# to #a1305_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1305_b)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1305(b) was changed from #a_1305_b# to #a1305_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1305_text)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1305(text) was changed from #a_1305_text# to #a1305_text# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1306_a)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1306(a) was changed from #a_1306_a# to #a1306_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1306_b)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1306(b) was changed from #a_1306_b# to #a1306_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1306_c)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1306(c) was changed from #a_1306_c# to #a1306_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1307_a)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1307(a) was changed from #a_1307_a# to #a1307_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1307_b)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1307(b) was changed from #a_1307_b# to #a1307_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

 <cfelseif Len(a_1307_c)>
  <tr>
      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1307(c) was changed from #a_1307_c# to #a1307_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>

<cfelseif Len(a_1400_a)>
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1400(a) was changed from #a_1400_a# to #a1400_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
</cfif>
</cfoutput>
</cfif>

<!---      <CFQUERY datasource="#request.dsn#" NAME="read_mods">
			Select * from hud_modify
			WHERE title_id = #rec_id# and modification_text is not null order by c_date, c_time
	</cfquery>

<cfif read_mods.recordcount>
<cfoutput query = "read_mods">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;#modification_text# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>
</cfif>




    <CFQUERY datasource="#request.dsn#" NAME="read_a_103">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_103 is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_103">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 103 was changed from #a_103# to #a103# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

 <CFQUERY datasource="#request.dsn#" NAME="read_a_104_a">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_104_a is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_104_a">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 104(a) was changed from #a_104_a# to #a104_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

  <CFQUERY datasource="#request.dsn#" NAME="read_a_104_b">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_104_b is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_104_b">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 104(b) was changed from #a_104_b# to #a104_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

  <CFQUERY datasource="#request.dsn#" NAME="read_a_105_a">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_105_a is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_105_a">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 105(a) was changed from #a_105_a# to #a105_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

  <CFQUERY datasource="#request.dsn#" NAME="read_a_105_b">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_105_b is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_105_b">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 105(b) was changed from #a_105_b# to #a105_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

   <CFQUERY datasource="#request.dsn#" NAME="read_a_301">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_301 is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_301">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 301 was changed from #a_301# to #a301# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

  <CFQUERY datasource="#request.dsn#" NAME="read_a_302">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_302 is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_302">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 302 was changed from #a_302# to #a302# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>
  <CFQUERY datasource="#request.dsn#" NAME="read_a_303">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_303 is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_303">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 303 was changed from #a_303# to #a303# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

   <CFQUERY datasource="#request.dsn#" NAME="read_a_504">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_504 is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_504">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 504 was changed from #a_504# to #a504# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

    <CFQUERY datasource="#request.dsn#" NAME="read_a_505">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_505 is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_505">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 505 was changed from #a_505# to #a505# by #fname#&nbsp;&nbsp;#lname#<br>

  </font></td>
   </tr>
 </cfoutput>


  <CFQUERY datasource="#request.dsn#" NAME="read_a_801_a">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_801_a is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_801_a">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 801(a) was changed from #a_801_a# to #a801_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

   <CFQUERY datasource="#request.dsn#" NAME="read_a_801_b">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_801_b is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_801_b">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 801(b) was changed from #a_801_b# to #a801_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>


  <CFQUERY datasource="#request.dsn#" NAME="read_a_801_d">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_801_d is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_801_d">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 801(d) was changed from #a_801_d# to #a801_d# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

   <CFQUERY datasource="#request.dsn#" NAME="read_a_802_a">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_802_a is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_802_a">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 802(a) was changed from #a_802_a# to #a802_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

   <CFQUERY datasource="#request.dsn#" NAME="read_a_802_b">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_802_b is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_802_b">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 802(b) was changed from #a_802_b# to #a802_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>


  <CFQUERY datasource="#request.dsn#" NAME="read_a_802_d">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_802_d is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_802_d">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 802(d) was changed from #a_802_d# to #a802_d# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

   <CFQUERY datasource="#request.dsn#" NAME="read_a_803_a">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_803_a is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_803_a">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 803(a) was changed from #a_803_a# to #a803_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

    <CFQUERY datasource="#request.dsn#" NAME="read_a_803_b">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_803_b is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_803_b">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 803(b) was changed from #a_803_b# to #a803_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

 <CFQUERY datasource="#request.dsn#" NAME="read_a_804_a">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_804_a is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_804_a">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 804(a) was changed from #a_804_a# to #a804_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

    <CFQUERY datasource="#request.dsn#" NAME="read_a_804_b">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_804_b is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_804_b">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 804(b) was changed from #a_804_b# to #a804_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>
 <CFQUERY datasource="#request.dsn#" NAME="read_a_805_a">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_805_a is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_805_a">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 805(a) was changed from #a_805_a# to #a805_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

    <CFQUERY datasource="#request.dsn#" NAME="read_a_805_b">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_805_b is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_805_b">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 805(b) was changed from #a_805_b# to #a805_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

 <CFQUERY datasource="#request.dsn#" NAME="read_a_806_a">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_806_a is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_806_a">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 806(a) was changed from #a_806_a# to #a806_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

    <CFQUERY datasource="#request.dsn#" NAME="read_a_806_b">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_806_b is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_806_b">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 806(6) was changed from #a_806_b# to #a806_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

 <CFQUERY datasource="#request.dsn#" NAME="read_a_807_a">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_807_a is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_807_a">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 807(a) was changed from #a_807_a# to #a807_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

    <CFQUERY datasource="#request.dsn#" NAME="read_a_807_b">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_807_b is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_807_b">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 807(b) was changed from #a_807_b# to #a807_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>


 <CFQUERY datasource="#request.dsn#" NAME="read_a_808_a">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_808_a is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_808_a">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 808(a) was changed from #a_808_a# to #a808_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

    <CFQUERY datasource="#request.dsn#" NAME="read_a_808_b">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_808_b is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_808_b">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 808(b) was changed from #a_808_b# to #a808_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>


 <CFQUERY datasource="#request.dsn#" NAME="read_a_809_a">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_809_a is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_809_a">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 809(a) was changed from #a_809_a# to #a809_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

    <CFQUERY datasource="#request.dsn#" NAME="read_a_809_b">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_809_b is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_809_b">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 809(b) was changed from #a_809_b# to #a809_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>
 <CFQUERY datasource="#request.dsn#" NAME="read_a_810_a">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_810_a is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_810_a">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 810(a) was changed from #a_810_a# to #a810_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

    <CFQUERY datasource="#request.dsn#" NAME="read_a_810_b">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_810_b is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_810_b">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 810(b) was changed from #a_810_b# to #a810_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

 <CFQUERY datasource="#request.dsn#" NAME="read_a_811_a">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_811_a is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_811_a">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 811(a) was changed from #a_811_a# to #a811_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

    <CFQUERY datasource="#request.dsn#" NAME="read_a_811_b">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_811_b is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_810_b">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 811(b) was changed from #a_811_b# to #a811_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>


    <CFQUERY datasource="#request.dsn#" NAME="read_a_901_a">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_901_a is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_901_a">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 901(a) was changed from #a_901_a# to #a901_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

     <CFQUERY datasource="#request.dsn#" NAME="read_a_901_b">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_901_b is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_901_b">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 901(b) was changed from #a_901_b# to #a901_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

    <CFQUERY datasource="#request.dsn#" NAME="read_a_901_c">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_901_c is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_901_c">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 901(c) was changed from #a_901_c# to #a901_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

    <CFQUERY datasource="#request.dsn#" NAME="read_a_901_d">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_901_d is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_901_d">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 901(d) was changed from #a_901_d# to #a901_d# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

 <CFQUERY datasource="#request.dsn#" NAME="read_a_902_a">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_902_a is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_902_a">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 902(a) was changed from #a_902_a# to #a902_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

     <CFQUERY datasource="#request.dsn#" NAME="read_a_902_b">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_902_b is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_902_b">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 902(b) was changed from #a_902_b# to #a902_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

    <CFQUERY datasource="#request.dsn#" NAME="read_a_902_c">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_902_c is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_902_c">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 902(c) was changed from #a_902_c# to #a902_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

 <CFQUERY datasource="#request.dsn#" NAME="read_a_903_a">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_903_a is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_903_a">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 903(a) was changed from #a_903_a# to #a903_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

     <CFQUERY datasource="#request.dsn#" NAME="read_a_903_b">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_903_b is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_903_b">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 903(b) was changed from #a_903_b# to #a903_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

    <CFQUERY datasource="#request.dsn#" NAME="read_a_903_c">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_903_c is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_903_c">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 903(c) was changed from #a_903_c# to #a903_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

  <CFQUERY datasource="#request.dsn#" NAME="read_a_904_a">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_904_a is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_904_a">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 904(a) was changed from #a_904_a# to #a904_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

     <CFQUERY datasource="#request.dsn#" NAME="read_a_904_b">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_904_b is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_904_b">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 904(b) was changed from #a_904_b# to #a904_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

 <CFQUERY datasource="#request.dsn#" NAME="read_a_905_a">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_905_a is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_905_a">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 905(a) was changed from #a_905_a# to #a905_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>


 <CFQUERY datasource="#request.dsn#" NAME="read_a_1001_a">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_1001_a is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_1001_a">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1001(a) was changed from #a_1001_a# to #a1001_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

  <CFQUERY datasource="#request.dsn#" NAME="read_a_1001_b">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_1001_b is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_1001_b">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1001(b) was changed from #a_1001_b# to #a1001_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

 <CFQUERY datasource="#request.dsn#" NAME="read_a_1001_c">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_1001_c is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_1001_c">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1001(c) was changed from #a_1001_c# to #a1001_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>


  <CFQUERY datasource="#request.dsn#" NAME="read_a_1002_a">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_1002_a is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_1002_a">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1002(a) was changed from #a_1002_a# to #a1002_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

  <CFQUERY datasource="#request.dsn#" NAME="read_a_1002_b">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_1002_b is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_1002_b">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1002(b) was changed from #a_1002_b# to #a1002_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

 <CFQUERY datasource="#request.dsn#" NAME="read_a_1002_c">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_1002_c is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_1002_c">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1002(c) was changed from #a_1002_c# to #a1002_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

  <CFQUERY datasource="#request.dsn#" NAME="read_a_1003_a">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_1003_a is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_1003_a">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1003(a) was changed from #a_1003_a# to #a1003_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

  <CFQUERY datasource="#request.dsn#" NAME="read_a_1003_b">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_1003_b is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_1003_b">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1003(b) was changed from #a_1003_b# to #a1003_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

 <CFQUERY datasource="#request.dsn#" NAME="read_a_1003_c">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_1003_c is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_1003_c">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1003(c) was changed from #a_1003_c# to #a1003_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

  <CFQUERY datasource="#request.dsn#" NAME="read_a_1004_a">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_1004_a is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_1004_a">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1004(a) was changed from #a_1004_a# to #a1004_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

  <CFQUERY datasource="#request.dsn#" NAME="read_a_1004_b">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_1004_b is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_1004_b">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1004(b) was changed from #a_1004_b# to #a1004_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

 <CFQUERY datasource="#request.dsn#" NAME="read_a_1004_c">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_1004_c is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_1004_c">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1004(c) was changed from #a_1004_c# to #a1004_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

  <CFQUERY datasource="#request.dsn#" NAME="read_a_1005_a">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_1005_a is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_1005_a">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1005(a) was changed from #a_1005_a# to #a1005_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

  <CFQUERY datasource="#request.dsn#" NAME="read_a_1005_b">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_1005_b is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_1005_b">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1005(b) was changed from #a_1005_b# to #a1005_b# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

 <CFQUERY datasource="#request.dsn#" NAME="read_a_1005_c">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_1005_c is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_1005_c">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1005(c) was changed from #a_1005_c# to #a1005_c# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput>

  <CFQUERY datasource="#request.dsn#" NAME="read_a_1400_a">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_1400_a is not null order by c_date, c_time
	</cfquery>
  <cfoutput query = "read_a_1400_a">
  <tr>

      <td  align = "left" width="98%"><font color = "blue" face="Arial, Helvetica, sans-serif" size="1">
  #c_date#&nbsp;&nbsp;#c_time#:&nbsp;&nbsp;&nbsp;Line 1400(a) was changed from #a_1400_a# to #a1400_a# by #fname#&nbsp;&nbsp;#lname#<br>
  </font></td>
   </tr>
 </cfoutput> --->

 </table>

  <hr size="1" color="dimgray">

</div>

<!--- <a href="#" onclick=printWindow();><input disabled type="button" value="Print the page"></a>
</div> --->
<CFOUTPUT>
<table align="center" width="98%" cellspacing=0 cellpadding=0>
   <tr>
      <td width="56%"><b><font face="Arial, Helvetica, sans-serif" size="1">A.
         </font><font face="Arial, Helvetica, sans-serif">Settlement Statement</font></b></td>
      <td  width="44%"><font face="Arial, Helvetica, sans-serif" size="1">US Department
         of Housing</font></td>
   </tr>
   <tr>
      <td width="56%"><font face="Arial, Helvetica, sans-serif" size="1">B. Type
         of Loan</font></td>
      <td width="44%"><font face="Arial, Helvetica, sans-serif" size="1">and Urban
         Development OMB No. 2502-0265</font></td>
   </tr>
</table>
   <table border="1" cellspacing=0 cellpadding=0 align = "center" width="98%" bordercolordark="666666" bordercolorlight="666666" bordercolor="666666">
      <tr>
         <td align="center">
            <table align="center" width="100%" cellspacing=0 cellpadding=0 border="1">
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">1.
                     <CFIF #read_data.a_1# EQ "FHA">
                     <img src="./images/checkbox_checked.gif">
                     <CFELSE>
                     <img src="./images/checkbox1.gif">
                     </CFIF>
                     FHA&nbsp;&nbsp;&nbsp;&nbsp;2.
                     <CFIF #read_data.a_1# EQ "FmHA">
                     <img src="./images/checkbox_checked.gif">
                     <CFELSE>
                     <img src="./images/checkbox1.gif">
                     </CFIF>
                     FmHA&nbsp;&nbsp;&nbsp;&nbsp;3.
                     <CFIF #read_data.a_1# EQ "Conventional">
                     <img src="./images/checkbox_checked.gif">
                     <CFELSE>
                     <img src="./images/checkbox1.gif">
                     </CFIF>
                     Conv. Unins.<br>
                     4.
                     <CFIF #read_data.a_1# EQ "VA">
                     <img src="./images/checkbox_checked.gif">
                     <CFELSE>
                     <img src="./images/checkbox1.gif">
                     </CFIF>
                     VA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.
                     <CFIF #read_data.a_1# EQ "Conv. Ins.">
                     <img src="./images/checkbox_checked.gif">
                     <CFELSE>
                     <img src="./images/checkbox1.gif">
                     </CFIF>
                     Conv. Ins. </font></td>
                  <td width="17%"><font face="Arial, Helvetica, sans-serif" size="1">
                     6. File Number<br>
                     <b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><cfif get_titleid.comp_id eq 3943 or get_titleid.comp_id eq 4042 or get_titleid.comp_id eq 4043>#get_titleid.title_id#<cfelse>#read_data.a_6#</cfif></font></b></font></td>
                  <td width="19%"><font face="Arial, Helvetica, sans-serif" size="1">7.
                     Loan Number<br>
                     <b><font face="Arial, Helvetica, sans-serif" size="1" color="blue">#get_titleid.loan_number#</font></b></font></td>
                  <td width="27%"><font face="Arial, Helvetica, sans-serif" size="1">8.
                     Mortgage Insurance Case Number<br>
                     <b><font face="Arial, Helvetica, sans-serif" size="1" color="blue">#read_data.a_8#</font></b></font></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
               <tr valign="top">
                  <td width="43"><font face="Arial, Helvetica, sans-serif" size="1">
                     C. Note: </font></td>
                  <td width="671"><font face="Arial, Helvetica, sans-serif" size="1">This
                     form is furnished to give you a statement of the actual settlement
                     costs. Amounts paid by and to the settlement agent are shown.
                     Items marked "(p.o.c)" were paid outside the closing; they
                     are shown here for information purposes and are not included
                     in the totals. WARNING: It is a crime to knowingly make
                     false statements to the United States on this or any other
                     similar form. Penalties upon conviction can include a fine
                     and imprisonment. For details see; Title 18 U.S. Code Section
                     1001 and Section 1010. </font></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
          <tr valign="top">
            <td width="24%"><font size="1" face="Arial, Helvetica, sans-serif">D.
              NAME OF BORROWER:</font></td>
            <td><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><cfif get_titleid.comp_id eq 3943 or get_titleid.comp_id eq 4043 or get_titleid.comp_id eq 4042>#get_titleid.full_vesting#<cfelse><cfif get_titleid.company1 neq '' and get_titleid.company1 neq 'NULL'>#get_titleid.company1#<cfelse><cfif get_titleid.bfirstname1 neq '' and get_titleid.bfirstname1 neq 'NULL'>#get_titleid.bfirstname1#</cfif> <cfif get_titleid.bminame1 neq '' and get_titleid.bminame1 neq 'NULL'>#get_titleid.bminame1#.</cfif> <cfif get_titleid.blastname1 neq '' and get_titleid.blastname1 neq 'NULL'>#get_titleid.blastname1#</cfif><cfif get_titleid.bfirstname2 neq '' and get_titleid.bfirstname2 neq 'NULL'> and #get_titleid.bfirstname2#</cfif> <cfif get_titleid.bminame2 neq '' and get_titleid.bminame2 neq 'NULL'>#get_titleid.bminame2#.</cfif> <cfif get_titleid.blastname2 neq '' and get_titleid.blastname2 neq 'NULL'>#get_titleid.blastname2#</cfif> <cfif get_titleid.bfirstname3 neq '' and get_titleid.bfirstname3 neq 'NULL'> and #get_titleid.bfirstname3#</cfif> <cfif get_titleid.bminame3 neq '' and get_titleid.bminame3 neq 'NULL'>#get_titleid.bminame3#.</cfif> <cfif get_titleid.blastname3 neq '' and get_titleid.blastname3 neq 'NULL'>#get_titleid.blastname3#</cfif><cfif get_titleid.bfirstname4 neq '' and get_titleid.bfirstname4 neq 'NULL'> and #get_titleid.bfirstname4#</cfif> <cfif get_titleid.bminame4 neq '' and get_titleid.bminame4 neq 'NULL'>#get_titleid.bminame4#.</cfif> <cfif get_titleid.blastname4 neq '' and get_titleid.blastname4 neq 'NULL'>#get_titleid.blastname4#</cfif> <cfif (get_titleid.manner_of_title neq '' and get_titleid.manner_of_title neq 'NULL')>(#get_titleid.manner_of_title#)</cfif></cfif></cfif></font></b></td>
          </tr>
          <tr valign="top">
            <td width="24%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;ADDRESS:</font></td>
            <td width="76%"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><cfif get_titleid.mailing_address neq '' and get_titleid.mailing_address neq 'NULL'>#get_titleid.mailing_address#<cfelse>#read_data.g_propaddr#</cfif></font></b></td>
          </tr>
        </table>
         </td>
      </tr>
      <tr>
         <td align="center" height="30">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="1">E.
                     NAME OF SELLER:</font></td>
                  <td width="76%"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><cfif get_titleid.company2 neq '' and get_titleid.company2 neq 'NULL'>#get_titleid.company2#<cfelse><cfif get_titleid.comp_id eq 3943 or get_titleid.comp_id eq 4042 or get_titleid.comp_id eq 4043 and read_data2.a_1114_a neq '' and read_data2.a_1114_a neq 'NULL'><cfif get_titleid.sfirstname1 neq '' and get_titleid.sfirstname1 neq 'NULL'>#get_titleid.sfirstname1#</cfif> <cfif get_titleid.sminame1 neq '' and get_titleid.sminame1 neq 'NULL'>#get_titleid.sminame1#.</cfif> <cfif get_titleid.slastname1 neq '' and get_titleid.slastname1 neq 'NULL'>#get_titleid.slastname1#</cfif><cfif get_titleid.sfirstname2 neq '' and get_titleid.sfirstname2 neq 'NULL'> and #get_titleid.sfirstname2#</cfif> <cfif get_titleid.sminame2 neq '' and get_titleid.sminame2 neq 'NULL'>#get_titleid.sminame2#.</cfif> <cfif get_titleid.slastname2 neq '' and get_titleid.slastname2 neq 'NULL'>#get_titleid.slastname2#</cfif> <cfif get_titleid.sfirstname3 neq '' and get_titleid.sfirstname3 neq 'NULL'> and #get_titleid.sfirstname3#</cfif> <cfif get_titleid.sminame3 neq '' and get_titleid.sminame3 neq 'NULL'>#get_titleid.sminame3#.</cfif> <cfif get_titleid.slastname3 neq '' and get_titleid.slastname3 neq 'NULL'>#get_titleid.slastname3#</cfif><cfelseif get_titleid.comp_id neq 3276>#read_data.e_sname#</cfif></cfif></font></b></td>
               </tr>
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;&nbsp;&nbsp;ADDRESS:</font></td>
                  <td width="76%"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><cfif get_titleid.company2 neq '' and get_titleid.company2 neq 'NULL'>#get_titleid.company2addr#<cfelse>#read_data.e_saddr#</cfif></font></b></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="1">F.
                     NAME OF LENDER:</font></td>
                  <td width="76%"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue">#read_data.f_lname#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_titleid.insured#</font></b></td>
               </tr>
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;&nbsp;&nbsp;ADDRESS:</font></td>
                  <td width="76%"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue">#read_data.f_laddr#</font></b></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="1">G.
                     PROPERTY ADDRESS:</font></td>
                  <td width="76%"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><cfif get_titleid.comp_id eq 3276 or get_titleid.comp_id eq 3943 or get_titleid.comp_id eq 4043 or get_titleid.comp_id eq 4042>#ReplaceNoCase(get_titleid.paddress, ", ", ", Unit ", "ALL")#, #get_titleid.pcity#, #get_titleid.pstate# #get_titleid.pzip# #get_titleid.pcounty#<cfelse>#read_data.g_propaddr#</cfif></font></b></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="1">H.
                     SETTLEMENT AGENT:</font></td>
                  <td width="76%"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue">#read_agency.title_FT_Agency_name#</font></b></td>
               </tr>
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;&nbsp;&nbsp;PLACE
                     OF SETTLEMENT:</font></td>
                  <td width="76%"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><cfif get_comp_info.id eq 2632 or get_comp_info.master_co_id eq 2632>
				  3926 Pender Drive, 1st Floor, Fairfax, VA 22030
				  <cfelse>
				 <cfif NOT DateDiff("d", Now(), "1/30/2012")> 30 W. Gude Dr. Rockville, MD. 20850 - Montgomery County<cfelse> 7361 Calhoun Place, Suite 200. Rockville, MD. 20855 - Montgomery County</cfif>
				  </cfif></font></b></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%">
               <tr valign="top">
                  <td width="24%"><font face="Arial, Helvetica, sans-serif" size="1">I.
                     SETTLEMENT DATE:</font></td>
                  <td><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><cfif get_titleid.comp_id neq 3276>#read_data.i_settlementDate#</cfif></font></b></td>
                   <td><font face="Arial, Helvetica, sans-serif" size="1">
                     DISBURSEMENT DATE:</font></td>
                  <td align="left"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><cfif get_titleid.comp_id neq 3276>&nbsp;&nbsp;#read_data.dis_date#</cfif></font></b></td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td align="center">
            <table align="center" cellspacing=0 cellpadding=0 width="100%" border="1">
               <tr valign="top" align="center">
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1"><b>J.
                     SUMMARY OF BORROWERS TRANSACTIONS:</b></font></td>
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1"><b>K.
                     SUMMARY OF SELLERS TRANSACTIONS:</b></font></td>
               </tr>
               <tr valign="top">
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1">100.
                     GROSS AMOUNT DUE FROM BORROWER</font></td>
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1">400.
                     GROSS AMOUNT DUE TO SELLER: </font></td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">101.
                     Contract Sales Price </font></td>
                  <td width="13%">

                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue"><cfif get_titleid.comp_id neq 3276 and get_titleid.comp_id neq 3943 and get_titleid.comp_id neq 4043 and get_titleid.comp_id neq 4042 and get_titleid.comp_id neq 3722 and get_titleid.comp_id neq 4702 and get_titleid.comp_id neq 4752>#FixDecimals(get_titleid.purchase)#</cfif><cfif (get_titleid.comp_id eq 3943 or get_titleid.comp_id eq 4042 or get_titleid.comp_id eq 4043 or get_titleid.comp_id eq 3722 or get_titleid.comp_id eq 4702 or get_titleid.comp_id eq 4752) and (get_titleid.searchtype neq 'Refinance' and get_titleid.slastname1 neq '' and get_titleid.slastname1 neq 'NULL')>#FixDecimals(get_titleid.purchase)#</cfif></font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">401.
                     Contract Sales Price </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_401)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">102.
                  <cfif read_data.a_102_text neq '' and read_data.a_102_text neq 'NULL'>#read_data.a_102_text#<cfelse>   Personal Property</cfif> </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_102)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">402.
                     Personal Property </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_402)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">103.
                     Settlement charges to buyer (line 1400) </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_103)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">403.
                     #read_data.a_403_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_403_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">104.
                     #read_data.a_104_a# </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_104_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">404.
                     #read_data.a_404_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_404_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">105.
                     <cfif get_titleid.comp_id eq 3943  or get_titleid.comp_id eq 4042 or get_titleid.comp_id eq 4043 and get_titleid.prepay_penalty neq ''>#get_titleid.prepay_penalty_text#<cfelse>#read_data.a_105_a#</cfif> </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue"><cfif get_titleid.comp_id eq 3943  or get_titleid.comp_id eq 4042 or get_titleid.comp_id eq 4043 and get_titleid.prepay_penalty neq ''>#FixDecimals(get_titleid.prepay_penalty)#<cfelse>#FixDecimals(read_data.a_105_b)#</cfif></font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">405.
                     #read_data.a_405_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_405_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
<cfif get_titleid.comp_id eq 3276>
			   <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">106.
                     #get_titleid.prepay_penalty_text# </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_106)#</font></b></font></div>
                  </td>
			   <cfelse>
                  <td colspan="2" align="center"><font face="Arial, Helvetica, sans-serif" size="1">Adjustments
                     for items paid by seller in advance </font></td>
					 </cfif>                  <td colspan="2">
                     <div align="center"><font face="Arial, Helvetica, sans-serif" size="1">Adjustments
                        for items paid by seller in advance </font></div>
                  </td>
               </tr>
               <tr valign="top">
<cfif get_titleid.comp_id eq 3276>
			   <td colspan="2" align="center"><font face="Arial, Helvetica, sans-serif" size="1">Adjustments
                     for items paid by seller in advance </font></td>
			   <cfelse>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">106.
                     City / town taxes </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_106)#</font></b></font></div>
                  </td>
				  </cfif>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">406.
                     City / town taxes </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_406)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">107.
                     County Taxes </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue"><B>#FixDecimals(read_data.a_107)#</B></font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">407.
                     County Taxes </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_407)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">108.
                     Assessments </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue"><B>#FixDecimals(read_data.a_108)#</B></font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">408.
                     Assessments </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_408)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">109.
                     #read_data.a_109_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_109_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">409.
                     #read_data.a_409_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_409_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">110.
                     #read_data.a_110_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_110_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">410.
                     #read_data.a_410_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_410_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">111.
                     #read_data.a_111_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_111_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">411.
                     #read_data.a_411_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_411_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">112.
                     #read_data.a_112_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_112_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">412.
                     #read_data.a_412_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_412_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">120.
                     GROSS AMOUNT DUE FROM BORROWER </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue"><cfif get_titleid.comp_id eq 3276><cfif IsNumeric(get_titleid.purchase)><cfset read_data.a_120 = read_data.a_120 - get_titleid.purchase></cfif><cfset read_data.a_301 = read_data.a_120></cfif>#FixDecimals(read_data.a_120)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">420.
                     GROSS AMOUNT DUE TO SELLER </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data2.a_1400_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1">200.
                     AMOUNTS PAID BY OR ON BEHALF OF BORROWER: </font> </td>
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1">500.
                     REDUCTIONS IN AMOUNT DUE TO SELLER: </font></td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">201.
                     Deposit or earnest money </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_201)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">501.
                     Excess deposit (see instructions) </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_501)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">202.
                     Principal amount of new loan(s) </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(get_titleid.loanamt_float)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">502.
                     Settlement charges to seller (line 1400) </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data2.a_1400_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">203.
                     Existing loan(s) taken subject to </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_203)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">503.
                     Existing loan(s) taken subject to </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_503)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">204.
                     #read_data.a_204_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_204_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">504.
                     Payoff of First Mortgage Loan </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_504)#</font></b></font></div>
                  </td>
               </tr>
               <!-----<tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="1"></font></td>
                  <td width="17%">
                     <div align="right"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="1"></font></font></font></font></b></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1"></font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="1"><font size="1"><font color="blue"><b><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="1"></font></font></font></b></font></font></font></font></font></div>
                  </td>
               </tr>----->
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">205.
                     #read_data.a_205_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_205_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">505.
                     Payoff of Second Mortgage Loan </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_505)#</font></b></font></div>
                  </td>
               </tr>
              <!-----<tr valign="top">
                  <td width="33%"><font face="Arial, Helvetica, sans-serif" size="1"></font></td>
                  <td width="17%">
                     <div align="right"><b><font face="Arial, Helvetica, sans-serif" size="1" color="blue"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="1"></font></font></font></font></b></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1"></font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="1"><font size="1"><font color="blue"><b><font face="Arial, Helvetica, sans-serif"><font face="Arial, Helvetica, sans-serif"><font size="1"></font></font></font></b></font></font></font></font></font></div>
                  </td>
               </tr>----->
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">206.
                     #read_data.a_206_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_206_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">506.
                     #read_data.a_506_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_506_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">207.
                     #read_data.a_207_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_207_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">507.
                     #read_data.a_507_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_507_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">208.
                     #read_data.a_208_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_208_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">508.
                     #read_data.a_508_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_508_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">209.
                     #read_data.a_209_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_209_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">509.
                     #read_data.a_509_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_509_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td colspan="2">
                     <div align="center"><font face="Arial, Helvetica, sans-serif" size="1">Adjustments
                        for items unpaid by seller </font></div>
                  </td>
                  <td colspan="2">
                     <div align="center"><font face="Arial, Helvetica, sans-serif" size="1">
                        Adjustments for items unpaid by seller </font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">210.
                     City / town taxes </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_210)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">510.
                     City / town taxes </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_510)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">211.
                     County Taxes </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_211)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">511.
                     County Taxes </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_511)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">212.
                     Assessments </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_212)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">512.
                     Assessments </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_512)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">213.
                     #read_data.a_213_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_213_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">513.
                     #read_data.a_513_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_513_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">214.
                     #read_data.a_214_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_214_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">514.
                     #read_data.a_514_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_514_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">215.
                     #read_data.a_215_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_215_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">515.
                     #read_data.a_515_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_515_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">216.
                     #read_data.a_216_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_216_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">516.
                     #read_data.a_516_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_516_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">217.
                     #read_data.a_217_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_217_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">517.
                     #read_data.a_517_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_517_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">218.
                     #read_data.a_218_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_218_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">518.
                     #read_data.a_518_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_518_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">219.
                     #read_data.a_219_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_219_b)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">519.
                     #read_data.a_519_a#</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_519_b)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">220.
                     TOTAL PAID BY/FOR BORROWER </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_220)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">520.
                     TOTAL REDUCTION AMOUNT DUE SELLER</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_520)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1">300.
                     CASH AT SETTLEMENT FROM OR TO BORROWER: </font> </td>
                  <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1">600.
                     CASH AT SETTLEMENT TO OR FROM SELLER: </font></td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">301.
                     Gross amount due from borrower (line 120) </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_301)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">601.
                     Gross amount due to seller (line 420) </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_601)#</font></b></font></div>
                  </td>
               </tr>
               <tr valign="top">
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">302.
                     Less amounts paid by/for borrower (line 220) </font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_302)#</font></b></font></div>
                  </td>
                  <td width="37%"><font face="Arial, Helvetica, sans-serif" size="1">602.
                     Less reduction amount due seller (line 520)</font></td>
                  <td width="13%">
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_602)#</font></b></font></div>
                  </td>
               </tr>
			   <cfif get_titleid.comp_id eq 3276>
			   <cfset read_data.a_303 = read_data.a_301 - read_data.a_302>
			   </cfif>
               <tr valign="top">
                  <td width="37%"><br>
                     <font face="Arial, Helvetica, sans-serif" size="1">303. CASH
                     <cfif read_data.a_303 LT 0>TO<cfelse>FROM</cfif> BORROWER </font></td>
                  <td width="13%"><br>
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue"><cfif read_data.a_303 LT 0>#ReplaceNoCase(FixDecimals(read_data.a_303), "-", "")#<cfelse>#FixDecimals(read_data.a_303)#</cfif></font></b></font></div>
                  </td>
                  <td width="37%"><br>
                     <font face="Arial, Helvetica, sans-serif" size="1">603. CASH
                     TO SELLER</font></td>
                  <td width="13%"><br>
                     <div align="right"><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;<b><font color="blue">#FixDecimals(read_data.a_603)#</font></b></font></div>
                  </td>
               </tr>
            </table>
         </td>
      </tr>

      <tr>
         <td ><br><font face="Arial, Helvetica, sans-serif" size="1"> SUBSTITUE FROM
            1099 SELLER STATEMENT: The information contained herein is important
            tax information and is being furnished to the Internal Revenue Service.
            If you are required to file a return, a negligence penalty or other
            sanction will be imposed on you if this item is required to be reported
            and the IRS determines that it has not been reported. The contract
            sales price described on line 401 above constitutes the gross proceeds
            of this transaction. </font></td>
      </tr>
      <tr>
         <td ><br><font face="Arial, Helvetica, sans-serif" size="1">SELLER INSTRUCTIONS:
            If this real estate was your principal residence, file form 2119 ,
            Sale or Exchange of PRincipal Residence, for any gain, with your income
            tax return: for other transactions, complete the applicable parts
            of Form 4797, Form 6252 and/or Schedule D (Form 1040) </font></td>
      </tr>
      <tr>
         <td ><br>
            <font face="Arial, Helvetica, sans-serif" size="1">You are required
            by law to provide the settlement agent (Fed. Tax ID No: <B><font color="blue" size="1">#read_data.Fed_tax_id_no#</font></B>)
            with your correct taxpayer identification number. If you do not provide
            your correct taxpayer identification number, you may be subject to
            civil or criminal penalties imposed by law. Under penalties of purjury,
            I certify that the number shown on this statement is my correct taxpayer
            identification number.</font></td>
      </tr>
      <tr>
         <td ><br>
            <font face="Arial, Helvetica, sans-serif" size="1">TIN: <B><font size="1" face="Arial, Helvetica, sans-serif" color="blue">#read_data.Fed_tax_id_no#</font></B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seller(s)
            Signature(s)____________________________________________________</font></td>
      </tr>
      <tr>
         <td ><br>
            <font face="Arial, Helvetica, sans-serif" size="1">SELLER(S) NEW MAILING
            ADDRESS: </font><B><font face="Arial, Helvetica, sans-serif" size="1" color="blue">#read_data.seller_new_addr#</font></B></td>
      </tr>
      <tr>
         <td ><br>
            <font face="Arial, Helvetica, sans-serif" size="1">SELLER(S)PHONE
            NUMBERS:(H) (W) &nbsp;&nbsp;<B><font color="blue" size="1" face="Arial, Helvetica, sans-serif">#read_data.seller_new_home_phone#</font></B><font size="1">(H)</font>&nbsp;&nbsp;&nbsp;&nbsp;
            <B><font color="blue" size="1" face="Arial, Helvetica, sans-serif">#read_data.seller_new_work_phone#</font></B><font size="1">(W)</font></font></td>
      </tr>
      <tr>
         <td ></td>
      </tr>

   </table>

   <!--------end of first page-------->

 <p>&nbsp;</p> <p>&nbsp;</p><p>&nbsp;</p><p><br>
 <p><hr size="1" color="dimgray" width="98%"></p>
<p>&nbsp;</p>

  <table border="1" cellspacing=0 cellpadding=0 align = "center" width="98%" bordercolordark="666666" bordercolorlight="666666" bordercolor="666666">
<tr><td colspan="3">
  <table align="center" width="100%">
    <tr>
      <td width="56%"><div align="center"><b><font face="Arial, Helvetica, sans-serif" size="1">U.S.
          DEPARTMENT OF HOUSING AND URBAN DEVELOPMENT</font></b></div></td>
      <td  width="44%"><font face="Arial, Helvetica, sans-serif" size="1">File
        Number: <b>#read_data2.title_id#</b></font></td>
    </tr>
    <tr>
      <td width="56%"><div align="center"><b><font face="Arial, Helvetica, sans-serif" size="2">SETTLEMENT
          STATEMENT</font></b></div></td>
      <td  width="44%"><font face="Arial, Helvetica, sans-serif" size="1">PAGE
        2</font> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font face="Arial, Helvetica, sans-serif" size="1">FINAL</font>
      </td>
    </tr>
  </table>
</td>
</tr>
    <tr>
      <td width="70%"><font size="1" face="Arial, Helvetica, sans-serif">L. SETTLEMENT CHARGES</font></td>
         <td width="15%" rowspan="5" align="center"><font size="1" face="Arial, Helvetica, sans-serif">PAID
            FROM BORROWERS FUNDS AT SETTLEMENT</font></td>
         <td width="15%" rowspan="5" align="center"><font size="1" face="Arial, Helvetica, sans-serif">PAID
            FROM SELLERS FUNDS AT SETTLEMENT</font></td>
    </tr>
    <tr>
      <td><font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif">700. TOTAL SALES/BROKER'S COMMISSION based on price &nbsp;&nbsp;&nbsp;&nbsp;$
        <b>#FixDecimals(read_data2.a_700_a)#</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@&nbsp;&nbsp;&nbsp;
        <b>#FixDecimals(read_data2.a_700_b)#</b> <b>#read_data2.a_700_c#</b></font></td>
    </tr>
    <tr>
      <td><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Division
        of commission (line 700) as follows:</font></td>
    </tr>
    <tr>
      <td><font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">701. &nbsp;&nbsp;$<font color=blue><b>#FixDecimals(read_data2.a_701_a)#</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>to
        <font color=blue> <b>#read_data2.a_701_b#</b></font></font></td>
    </tr>
    <tr>
      <td><font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">702. &nbsp;&nbsp;$<font color=blue> <b>#FixDecimals(read_data2.a_702_a)#</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>to
        <font color=blue> <b>#read_data2.a_702_b#</b></font></font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">703. Commission paid at settlement </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_703_a)#</b> </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_703_b)#</b> </font></td>
    </tr>
    <tr>
      <td colspan=3> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">800. ITEMS PAYABLE IN CONNECTION WITH LOAN </font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">
            801. Loan Origination Fee&nbsp;&nbsp;<b>#FixDecimals(read_data2.a_801_a)#</b>%
            <font color=blue>&nbsp;&nbsp;
            <b>#FixDecimals(read_data2.a_801_d)#</b>
            </font>
            </font>
      </td>
      <td align="right">
        <font size="1" face="Arial, Helvetica, sans-serif">
        <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_801_b)#</b> </font>
      </td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_801_c)#</b> </font></td>
    </tr>
    <tr>
      <td>
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=black face="Arial, Helvetica, sans-serif">
            802. Loan Discount &nbsp;&nbsp;<b>#FixDecimals(read_data2.a_802_a)#</b>%
            <font color=blue>&nbsp;&nbsp;
            <b>#FixDecimals(read_data2.a_802_d)#</b>
            </font>
            </font>
      </td>
      <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;<b>#FixDecimals(read_data2.a_802_b)#</b>
            </font>
      </td>
      <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_802_c)#</b> </font></td>
    </tr>
    <tr>
        <td>
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=black face="Arial, Helvetica, sans-serif">
            803. <cfif read_data2.a_803_a neq ''><b>#FixDecimals(read_data2.a_803_a)#</b><cfelse>Appraisal Fee</cfif></font>&nbsp;&nbsp;<font size=1 color=blue face="Arial, Helvetica, sans-serif">&nbsp;
            </font>
        </td>
        <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;
            <b><cfif read_data2.a_803_b neq '' and read_data2.a_803_b neq 0>#FixDecimals(read_data2.a_803_b)#</cfif></b></font>
        </td>
        <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;
            <b><cfif read_data2.a_803_c neq '' and read_data2.a_803_c neq 0>#FixDecimals(read_data2.a_803_c)#</cfif></b>
            </font>
        </td>
    </tr>
    <tr>
        <td>
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=black face="Arial, Helvetica, sans-serif">
            804. <cfif read_data2.a_804_a neq ''><b>#FixDecimals(read_data2.a_804_a)#</b><cfelse>Credit Report</cfif>&nbsp;&nbsp; </font><font size=1 color=blue face="Arial, Helvetica, sans-serif">&nbsp;
            </font>
       </td>
        <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;<b><cfif read_data2.a_804_b neq '' and read_data2.a_804_b neq 0>#FixDecimals(read_data2.a_804_b)#</cfif></b>
            </font>
        </td>
        <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;
            <b><cfif read_data2.a_804_c neq '' and read_data2.a_804_c neq 0>#FixDecimals(read_data2.a_804_c)#</cfif></b></font>
        </td>
    </tr>
    <tr>
      <td>
        <font size="1" face="Arial, Helvetica, sans-serif">
        <font size=1 color=black face="Arial, Helvetica, sans-serif">
        805. <cfif read_data2.a_805_a neq '' and read_data2.a_805_a neq 'NULL'><b>#FixDecimals(read_data2.a_805_a)#</b></cfif> &nbsp;&nbsp; <cfif read_data2.a_805_c neq '' and read_data2.a_805_c neq 'NULL'><b>#FixDecimals(read_data2.a_805_c)#</b></cfif>
        </font>
      </td>
         <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;<b><cfif read_data2.a_805_b neq '' and read_data2.a_805_b neq 0>#FixDecimals(read_data2.a_805_b)#</cfif></b>
            </font>
        </td>
        <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;
            <b><cfif read_data2.a_805_d neq '' and read_data2.a_805_d neq 0>#FixDecimals(read_data2.a_805_d)#</cfif></b></font>
        </td>
    </tr>
    <tr>
        <td>
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=black face="Arial, Helvetica, sans-serif">
            806. <cfif read_data2.a_806_a neq '' and read_data2.a_806_a neq 'NULL'><b>#FixDecimals(read_data2.a_806_a)#</b></cfif> &nbsp;&nbsp; <cfif read_data2.a_806_c neq '' and read_data2.a_806_c neq 'NULL'><b>#FixDecimals(read_data2.a_806_c)#</b></cfif>
            </font>
        </td>
         <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;<b><cfif read_data2.a_806_b neq '' and read_data2.a_806_b neq 0>#FixDecimals(read_data2.a_806_b)#</cfif></b>
            </font>
        </td>
        <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;
            <b><cfif read_data2.a_806_d neq '' and read_data2.a_806_d neq 0>#FixDecimals(read_data2.a_806_d)#</cfif></b></font>
        </td>
    </tr>
    <tr>
        <td>
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=black face="Arial, Helvetica, sans-serif">
            807. <cfif read_data2.a_807_a neq '' and read_data2.a_807_a neq 'NULL'><b>#FixDecimals(read_data2.a_807_a)#</b></cfif> &nbsp;&nbsp; <cfif read_data2.a_807_c neq '' and read_data2.a_807_c neq 'NULL'><b>#FixDecimals(read_data2.a_807_c)#</b></cfif>
            </font>
        </td>
         <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;<b><cfif read_data2.a_807_b neq '' and read_data2.a_807_b neq 0>#FixDecimals(read_data2.a_807_b)#</cfif></b>
            </font>
        </td>
        <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;
            <b><cfif read_data2.a_807_d neq '' and read_data2.a_807_d neq 0>#FixDecimals(read_data2.a_807_d)#</cfif></b></font>
        </td>
    </tr>
    <tr>
        <td>
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=black face="Arial, Helvetica, sans-serif">
            808. <cfif read_data2.a_808_a neq '' and read_data2.a_808_a neq 'NULL'><b>#FixDecimals(read_data2.a_808_a)#</b></cfif> &nbsp;&nbsp; <cfif read_data2.a_808_c neq '' and read_data2.a_808_c neq 'NULL'><b>#FixDecimals(read_data2.a_808_c)#</b></cfif>
            </font>
        </td>
        <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;<b><cfif read_data2.a_808_b neq '' and read_data2.a_808_b neq 0>#FixDecimals(read_data2.a_808_b)#</cfif></b>
            </font>
        </td>
        <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;
            <b><cfif read_data2.a_808_d neq '' and read_data2.a_808_d neq 0>#FixDecimals(read_data2.a_808_d)#</cfif></b></font>
        </td>
    </tr>
    <tr>
        <td>
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=black face="Arial, Helvetica, sans-serif">
            809. <cfif read_data2.a_809_a neq '' and read_data2.a_809_a neq 'NULL'><b>#FixDecimals(read_data2.a_809_a)#</b></cfif> &nbsp;&nbsp; <cfif read_data2.a_809_c neq '' and read_data2.a_809_c neq 'NULL'><b>#FixDecimals(read_data2.a_809_c)#</b></cfif>
            </font>
        </td>
         <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;<b><cfif read_data2.a_809_b neq '' and read_data2.a_809_b neq 0>#FixDecimals(read_data2.a_809_b)#</cfif></b>
            </font>
        </td>
        <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;
            <b><cfif read_data2.a_809_d neq '' and read_data2.a_809_d neq 0>#FixDecimals(read_data2.a_809_d)#</cfif></b></font>
        </td>
    </tr>
    <tr>
        <td>
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=black face="Arial, Helvetica, sans-serif">
            810. <cfif read_data2.a_810_a neq '' and read_data2.a_810_a neq 'NULL'><b>#FixDecimals(read_data2.a_810_a)#</b></cfif> &nbsp;&nbsp; <cfif read_data2.a_810_c neq '' and read_data2.a_810_c neq 'NULL'><b>#FixDecimals(read_data2.a_810_c)#</b></cfif>
            </font>
        </td>
         <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;<b><cfif read_data2.a_810_b neq '' and read_data2.a_810_b neq 0>#FixDecimals(read_data2.a_810_b)#</cfif></b>
            </font>
        </td>
        <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;
            <b><cfif read_data2.a_810_d neq '' and read_data2.a_810_d neq 0>#FixDecimals(read_data2.a_810_d)#</cfif></b></font>
        </td>
    </tr>
    <tr>
        <td>
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=black face="Arial, Helvetica, sans-serif">
            811. <cfif read_data2.a_811_a neq '' and read_data2.a_811_a neq 'NULL'><b>#FixDecimals(read_data2.a_811_a)#</b></cfif> &nbsp;&nbsp; <cfif read_data2.a_811_c neq '' and read_data2.a_811_c neq 'NULL'><b>#FixDecimals(read_data2.a_811_c)#</b></cfif>
            </font>
        </td>
        <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;<b><cfif read_data2.a_811_b neq '' and read_data2.a_811_b neq 0>#FixDecimals(read_data2.a_811_b)#</cfif></b>
            </font>
        </td>
        <td align="right">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size=1 color=blue face="Arial, Helvetica, sans-serif">
            &nbsp;
            <b><cfif read_data2.a_811_d neq '' and read_data2.a_811_d neq 0>#FixDecimals(read_data2.a_811_d)#</cfif></b></font>
        </td>
    </tr>
    <tr>
      <td colspan=3> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">900. ITEMS REQUIRED BY LENDER TO BE PAID IN ADVANCE </font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">901. Interest From&nbsp;&nbsp;<font color=blue> <b>#read_data2.a_901_a#</b></font>&nbsp;&nbsp;&nbsp;to
        &nbsp;&nbsp;<font color=blue> <b>#read_data2.a_901_b#</b></font>&nbsp;&nbsp;
        @ $ <font color=blue> <b>#FixDecimals(read_data2.a_901)#</b> </font></font> <font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;/day
        </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_901_d)#</b> </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_901_e)#</b> </font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">902. Mortgage Insurance Premium for&nbsp;&nbsp;<font color=blue><b>#read_data2.a_902_a#</b>
        </font>&nbsp;&nbsp;&nbsp; to <font color=blue> <b>#read_data2.a_902_b#</b>
        </font></font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_902_c)#</b> </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_902_d)#</b> </font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif">903. Hazard
        Insurance Premium for &nbsp;&nbsp;<font color="blue"> <b>#read_data2.a_903_a#</b>&nbsp;&nbsp;&nbsp;<font color="##000000">
        to</font> <b>#read_data2.a_903_b#</b></font> </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_903_c)#</b> </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_903_d)#</b> </font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">904. #read_data2.a_904_a# &nbsp;&nbsp;&nbsp;&nbsp;#read_data2.a_904_c#</font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_904_b)#</b> </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_904_d)#</b> </font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">905. Lender's Inspection Fee </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_905_a)#</b> </font></td>
      <td align="right"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_905_b)#</b> </font></td>
    </tr>
    <tr>
      <td colspan="3"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">1000. RESERVES DEPOSITED WITH LENDER FOR </font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">1001. Hazard Insurance&nbsp;&nbsp; <font color=blue> <b>#read_data2.a_1001_a#</b></font>mo.
        @ $&nbsp;&nbsp;<font color=blue> <b>#read_data2.a_1001_b#</b></font>&nbsp;&nbsp;/mo
        </font></td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_1001_c)#</b></font> </td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_1001_d)#</b></font> </td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">1002. Mortgage Insurance&nbsp;&nbsp; <font color=blue> <b>#read_data2.a_1002_a#</b></font>mo.
        @ $&nbsp;&nbsp;<font color=blue> <b>#FixDecimals(read_data2.a_1002_b)#</b></font>&nbsp;&nbsp;/mo
        </font></td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_1002_c)#</b></font> </td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_1002_d)#</b></font> </td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">1003. City Property Taxes&nbsp;&nbsp; <font color=blue> <b>#read_data2.a_1003_a#</b></font>mo.
        @ $&nbsp;&nbsp;<font color=blue> <b>#read_data2.a_1003_b#</b></font>&nbsp;&nbsp;/mo
        </font></td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_1003_c)#</b></font> </td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_1003_d)#</b></font> </td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">1004. County Property Taxes&nbsp;&nbsp; <font color=blue> <b><cfif read_data2.a_1004_a neq '' and read_data2.a_1004_a neq 'NULL'>#read_data2.a_1004_a#</cfif></b></font>mo.
        @ $&nbsp;&nbsp;<font color=blue><b>#read_data2.a_1004_b#</b></font>&nbsp;&nbsp;/mo</font></td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_1004_c)#</b></font> </td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_1004_d)#</b></font> </td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">1005. Annual Assessments&nbsp;&nbsp; <font color=blue> <b>#read_data2.a_1005_a#</b></font>mo.
        @ $&nbsp;&nbsp;<font color=blue> <b>#read_data2.a_1005_b#</b></font>&nbsp;&nbsp;/mo
        </font></td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_1005_c)#</b></font> </td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_1005_d)#</b></font> </td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">1006. Aggragate Analysis Adjustment &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to</font></td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_1006_a)#</b></font> </td>
      <td align="right"> <font size=1 color=blue face="Arial, Helvetica, sans-serif">
        &nbsp;<b>#FixDecimals(read_data2.a_1006_b)#</b></font> </td>
    </tr>
    <tr>
      <td colspan="3"> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 color=black face="Arial, Helvetica, sans-serif">1100. TITLE CHARGES </font></td>
    </tr>
    <tr>
      <td><font size="1" face="Arial, Helvetica, sans-serif">1101. Settlement
        or closing fee&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to
		<cfif (read_data2.a_1101_a neq '' and read_data2.a_1101_a neq 'NULL') or (read_data2.a_1101_f neq '' and read_data2.a_1101_f neq 'NULL')>
        <font color=blue><cfif #read_data2.a_1101_c# neq "0" AND #read_data2.a_1101_c# neq ""> <b>#read_data2.a_1101_c#</b><cfelse> <b>#read_agency.title_ft_agency_name#</b></cfif></font></font></cfif></td>
      <td align="right"><font size=1 color=blue face="Arial, Helvetica, sans-serif"><cfif #read_data2.a_1101_a# neq "0">
        &nbsp;<b>#FixDecimals(read_data2.a_1101_a)#</b></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
      <td align="right"><font size=1 color=blue face="Arial, Helvetica, sans-serif"><cfif #read_data2.a_1101_f# neq "0">
        &nbsp;<b>#FixDecimals(read_data2.a_1101_f)#</b></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
    </tr>
    <tr>
      <td><font size="1" face="Arial, Helvetica, sans-serif">1102. Abstract or Title Search&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to
        <cfif #read_data2.a_1102_a# neq "0" or #read_data2.a_1102_b# neq "0"><cfif get_comp_info.ID eq 202><b>ESS Solutions, LLC</b><cfelse><b>Abstracts USA, LLC</b></cfif></cfif></font></td>
      <td align="right">
<cfif #read_data2.a_1102_a# neq "0">&nbsp;
          <b><font color="##0000FF" size="1" face="Arial, Helvetica, sans-serif">#FixDecimals(read_data2.a_1102_a)#</font></b>
        </cfif></td>
      <td align="right">
<cfif #read_data2.a_1102_b# neq "0">&nbsp;
          <b><font color="##0000FF" size="1" face="Arial, Helvetica, sans-serif">#FixDecimals(read_data2.a_1102_b)#</font></b>
        </cfif></td>
    </tr>
    <tr valign="top">
      <td> <font size="1" face="Arial, Helvetica, sans-serif">1103. Title
        Examination&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to <cfif (read_data2.a_1103_a neq '' and read_data2.a_1103_a neq 'NULL') or (read_data2.a_1103_b neq '' and read_data2.a_1103_b neq 'NULL')>
        <font color=blue><cfif #read_data2.a_1103_c# neq "0" AND #read_data2.a_1103_c# neq ""> <b>#read_data2.a_1103_c#</b><cfelse> <b>#read_agency.title_ft_agency_name#</b></cfif></font></font></cfif></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1103_a# neq "0">
        <b>#FixDecimals(read_data2.a_1103_a)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1103_b# neq "0">
        <b>#FixDecimals(read_data2.a_1103_b)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif">1104. Title
        Insurance Binder&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to
        <cfif (read_data2.a_1104_a neq '' and read_data2.a_1104_a neq 'NULL') or (read_data2.a_1104_b neq '' and read_data2.a_1104_b neq 'NULL')>
        <font color=blue><cfif #read_data2.a_1104_c# neq "0" AND #read_data2.a_1104_c# neq ""> <b>#read_data2.a_1104_c#</b><cfelse> <CFIF #get_titleid.pstate# eq "CA">
                <b>#title_co_name# & Escrow, inc.</b>
            <CFELSEIF #get_titleid.pstate# eq "NV">
                <b>#title_co_name# & Escrow, inc.</b>
            <CFELSE>
                <b>#read_agency.title_ft_agency_name#</b>
            </CFIF> </cfif></font></font></cfif>
      </td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1104_a# neq "0">
        <b>#FixDecimals(read_data2.a_1104_a)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1104_b# neq "0">
        <b>#FixDecimals(read_data2.a_1104_b)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif">1105. Document
        Preparation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to
 <cfif (read_data2.a_1105_a neq '' and read_data2.a_1105_a neq 'NULL') or (read_data2.a_1105_b neq '' and read_data2.a_1105_b neq 'NULL')>
        <font color=blue><cfif #read_data2.a_1105_c# neq "0" AND #read_data2.a_1105_c# neq ""> <b>#read_data2.a_1105_c#</b><cfelse> <CFIF #get_titleid.pstate# eq "CA">
                <b>#title_co_name# & Escrow, inc.</b>
            <CFELSEIF #get_titleid.pstate# eq "NV">
                <b>#title_co_name# & Escrow, inc.</b>
            <CFELSE>
                <b>#read_agency.title_ft_agency_name#</b>
            </CFIF> </cfif></font></font></cfif>
      </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1105_a# neq "0">
        <b>#FixDecimals(read_data2.a_1105_a)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1105_b# neq "0">
        <b>#FixDecimals(read_data2.a_1105_b)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
    </tr>
    <tr >
      <td> <font size="1" face="Arial, Helvetica, sans-serif">1106. Notary Fees&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to

        <cfif (read_data2.a_1106_a neq '' and read_data2.a_1106_a neq 'NULL') or (read_data2.a_1106_b neq '' and read_data2.a_1106_b neq 'NULL')>
        <font color=blue><cfif #read_data2.a_1106_c# neq "0" AND #read_data2.a_1106_c# neq ""> <b>#read_data2.a_1106_c#</b><cfelse> <CFIF #get_titleid.pstate# eq "CA">
                <b>#title_co_name# & Escrow, inc.</b>
            <CFELSEIF #get_titleid.pstate# eq "NV">
                <b>#title_co_name# & Escrow, inc.</b>
            <CFELSE>
                <b>#read_agency.title_ft_agency_name#</b>
            </CFIF> </cfif></font></font></cfif>
      </td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1106_a# neq "0">
        <b>#FixDecimals(read_data2.a_1106_a)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1106_b# neq "0">
        <b>#FixDecimals(read_data2.a_1106_b)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1107. Attorney's Fees </font></font> &nbsp;&nbsp;&nbsp;to
	  <cfif (read_data2.a_1107_a neq '' and read_data2.a_1107_a neq 'NULL') or (read_data2.a_1107_b neq '' and read_data2.a_1107_b neq 'NULL')>
        <font color=blue><cfif #read_data2.a_1107_d# neq "0" AND #read_data2.a_1107_d# neq ""> <b>#read_data2.a_1107_d#</b><cfelse> <CFIF #get_titleid.pstate# eq "CA">
                <b>#title_co_name# & Escrow, inc.</b>
            <CFELSEIF #get_titleid.pstate# eq "NV">
                <b>#title_co_name# & Escrow, inc.</b>
            <CFELSE>
                <b>#read_agency.title_ft_agency_name#</b>
            </CFIF> </cfif></font></font></cfif>
			</td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1107_a# neq "0">
        <b>#FixDecimals(read_data2.a_1107_a)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1107_b# neq "0">
        <b>#FixDecimals(read_data2.a_1107_b)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
    </tr>
    <tr >
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(includes above items No.&nbsp;&nbsp;<font color=blue>
        <b>#read_data2.a_1107_c#</b></font>) </font></font></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
    </tr>
    <tr >
        <td>
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font color=black>
            1108. Title Insurance
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to
            <font color=blue>
            <cfif #read_data2.a_1108_a# neq "0" OR #read_data2.a_1108_b# neq "">
                <CFIF #get_titleid.pstate# eq "CA">
                    <b>Placer Title Company</b>
                <CFELSEIF #get_titleid.pstate# eq "NV">
                    <b>Stewart Title Guaranty Company</b>
                <CFELSEIF #get_titleid.comp_id# eq 3704 or #get_titleid.comp_id# eq 3746 or  #get_titleid.comp_id# eq 3747 or  #get_titleid.comp_id# eq 3748>
                    <b>Worldwide Abstract</b>
                <CFELSE>
                    <b>#title_co_name#/#get_ins.company#</b>
                </CFIF>
            </cfif>
            </font>
            </font>
        </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1108_a# neq "0">
        <b><cfif get_titleid.pstate eq 'TX' and get_titleid.searchType NEQ 'Purchase'>Call us for R-8 credit<cfelse><cfif isnumeric(read_data2.a_1108_a)>#NumberFormat(read_data2.a_1108_a, "_____.__")#<cfelse>#read_data2.a_1108_a#</cfif></cfif></b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1108_b# neq "0">
        <b>#FixDecimals(read_data2.a_1108_b)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
    </tr>
    <tr >
      <td > <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(includes above items No.&nbsp;&nbsp;<font color=blue><b>#FixDecimals(read_data2.a_1108_c)#</b></font>)
        </font></font></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
    </tr>
    <tr >
      <td > <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1109. Lender's Coverage $ <font color=blue>
        <cfif #read_data2.a_1109_a# neq "0">
          <b>#FixDecimals(read_data2.a_1109_a)#</b>
        </cfif>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<cfif #read_data.a_206_b# neq "" and #read_data.a_206_b# neq "0" and #read_data.a_206_b# neq "NULL">#read_data2.first_ins_premium#(1st) + #read_data2.second_ins_premium#(2nd)</cfif>
        </font></font></font> </td>
      <td rowspan="2" align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
      <td rowspan="2" align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
    </tr>
    <tr >
      <td > <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1110. Owner's Coverage $ <font color=blue>
        <cfif #read_data2.a_1110_a# neq "0">
          <b>#FixDecimals(read_data2.a_1110_a)#</b>
        </cfif>
        </font></font></font> </td>
    </tr>
    <tr>
      <td ><font size="1" face="Arial, Helvetica, sans-serif">1111. <font color=blue>
        <cfif (read_data2.a_1111_a neq '' and read_data2.a_1111_a neq 'NULL') or (read_data2.a_1111_b neq '' and read_data2.a_1111_b neq 'NULL')>
        <font color=blue><cfif #read_data2.a_1111_c# neq "0" AND #read_data2.a_1111_c# neq ""> <b>#read_data2.a_1111_c#</b><cfelse> <b>#read_agency.title_ft_agency_name#</b></cfif></font></font></cfif>
      </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1111_a# neq "0">
        <b>#FixDecimals(read_data2.a_1111_a)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1111_b# neq "0">
        <b>#FixDecimals(read_data2.a_1111_b)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
    </tr>
    <tr >
      <td > <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1112.  <cfif (IsNumeric(read_data2.a_1112_a) or IsNumeric(read_data2.a_1112_b))>
        <font color=blue><cfif #read_data2.a_1112_c# neq "0" AND #read_data2.a_1112_c# neq ""> <b>#read_data2.a_1112_c#</b><cfelse><cfif (IsNumeric(FixDecimals(read_data2.a_1112_a))) or (IsNumeric(FixDecimals(read_data2.a_1112_b)))>&nbsp;&nbsp;<b>#read_agency.title_ft_agency_name#</b></cfif></cfif></font></font></cfif></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;
	  <font color=blue> <cfif #read_data2.a_1112_a# neq "0">
        <b>#FixDecimals(read_data2.a_1112_a)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue><cfif #read_data2.a_1112_b# neq "0"><b>#FixDecimals(read_data2.a_1112_b)#</b></font></font>
        <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
    </tr>
    <tr >
      <td > <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1113.  <cfif (IsNumeric(read_data2.a_1113_a) or IsNumeric(read_data2.a_1113_b))>
        <font color=blue><cfif #read_data2.a_1113_c# neq "0" AND #read_data2.a_1113_c# neq ""> <b>#read_data2.a_1113_c#</b><cfelse><cfif (IsNumeric(FixDecimals(read_data2.a_1113_a))) or (IsNumeric(FixDecimals(read_data2.a_1113_b)))>&nbsp;&nbsp;<b>#read_agency.title_ft_agency_name#</b></cfif></cfif></font></font></cfif></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;
	  <font color=blue> <cfif #read_data2.a_1113_a# neq "0">
        <b>#FixDecimals(read_data2.a_1113_a)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue><cfif #read_data2.a_1113_b# neq "0"><b>#FixDecimals(read_data2.a_1113_b)#</b></font></font>
        <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
    </tr>
	<tr >
      <td > <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1114. <font color=blue> <cfif (FixDecimals(read_data2.a_1114_a) neq '' and FixDecimals(read_data2.a_1114_a) neq 'NULL') or (FixDecimals(read_data2.a_1114_b) neq '' and FixDecimals(read_data2.a_1114_b) neq 'NULL')>
        <font color=blue><cfif #read_data2.a_1114_c# neq "0" AND #read_data2.a_1114_c# neq ""> <b>#read_data2.a_1114_c#</b><cfelse> <b>#read_agency.title_ft_agency_name#</b></cfif></font></font></cfif>
      </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1114_a# neq "0">
        <b>#FixDecimals(read_data2.a_1114_a)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1114_b# neq "0">
        <b>#FixDecimals(read_data2.a_1114_b)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
    </tr>
    <tr >
      <td colspan="3"> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1200. GOVERNMENT RECORDING AND TRANSFER CHARGES </font></font></td>
    </tr>
    <tr >
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1201. Recording Fees Deed $ &nbsp;&nbsp;<font color=blue>
        <cfif #read_data2.a_1201_a# neq "0">
          <b>#FixDecimals(read_data2.a_1201_a)#</b>
        </cfif>
        </font>&nbsp;&nbsp; Mortgage $ &nbsp;&nbsp;<font color=blue>
        <cfif #read_data2.a_1201_b# neq "0">
          <b>#FixDecimals(read_data2.a_1201_b)#</b>
        </cfif>
        </font>&nbsp;&nbsp;&nbsp;: Release $ <font color=blue>
        <cfif #read_data2.a_1201_c# neq "0">
          <b>#FixDecimals(read_data2.a_1201_c)#</b>
        </cfif>
        </font></font></font> </td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1201_d# neq "0">
        &nbsp;<b>#FixDecimals(read_data2.a_1201_d)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue> <cfif #read_data2.a_1201_e# neq "0">
        &nbsp;<b>#FixDecimals(read_data2.a_1201_e)#</b></font></font> <font size="1" face="Arial, Helvetica, sans-serif"></cfif></font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1202. City/County tax/Stamps: &nbsp;&nbsp;<font color=blue>
        <cfif #read_data2.a_1202_a# neq "0">
          <b>#FixDecimals(read_data2.a_1202_a)#</b>
        </cfif>
        </font>&nbsp;&nbsp;Deed $ &nbsp;&nbsp;<font color=blue>
        <cfif #read_data2.a_1202_b# neq "0">
          <b>#FixDecimals(read_data2.a_1202_b)#</b>
        </cfif>
        </font>&nbsp;&nbsp;: Mortgage $ <font color=blue>
        <cfif #read_data2.a_1202_c# neq "0">
          <b>#FixDecimals(read_data2.a_1202_c)#</b>
        </cfif>
        </font></font></font> </td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1202_d# neq "0">
          <b>#FixDecimals(read_data2.a_1202_d)#</b>
        </cfif>
        </font></font> </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1202_e# neq "0">
          <b>#FixDecimals(read_data2.a_1202_e)#</b>
        </cfif>
        </font></font> </td>
    </tr>
    <tr >
      <td > <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1203. State tax/Stamps: &nbsp;&nbsp;<font color=blue>
        <cfif #read_data2.a_1203_a# neq "0">
          <b>#FixDecimals(read_data2.a_1203_a)#</b>
        </cfif>
        </font>&nbsp;&nbsp;Deed $ &nbsp;&nbsp;<font color=blue>
        <cfif #read_data2.a_1203_b# neq "0">
          <b>#FixDecimals(read_data2.a_1203_b)#</b>
        </cfif>
        </font>&nbsp;&nbsp;: Mortgage $ <font color=blue>
        <cfif #read_data2.a_1203_c# neq "0">
          <b>#FixDecimals(read_data2.a_1203_c)#</b>
        </cfif>
        </font></font></font> </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1203_d# neq "0">
          <b>#FixDecimals(read_data2.a_1203_d)#</b>
        </cfif>
        </font></font> </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1203_e# neq "0">
          <b>#FixDecimals(read_data2.a_1203_e)#</b>
        </cfif>
        </font></font> </td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1204. <font color=blue>
       <cfif #read_data2.a_1204_b# neq "0" or #read_data2.a_1204_c# neq "0">
          <b>#FixDecimals(read_data2.a_1204_a)#</b>
        </cfif>
        </font></font></font> </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1204_b# neq "0">
          <b>#FixDecimals(read_data2.a_1204_b)#</b>
        </cfif>
        </font></font> </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1204_c# neq "0">
          <b>#FixDecimals(read_data2.a_1204_c)#</b>
        </cfif>
        </font></font> </td>
    </tr>
    <tr >
        <td>
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font size="1" face="Arial, Helvetica, sans-serif">
            <font color=black>1205.
            <font color=blue> <cfif #get_titleid.pstate# eq "NV" or #get_titleid.pstate# eq "CA">Procurement Releases<cfelse>
                #get_line_costs.a_1205_text#</cfif>
                <cfif #read_data2.a_1205_a# neq "0" OR #read_data2.a_1205_b# neq "">
                    <CFIF #get_titleid.pstate# eq "CA">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>#title_co_name# & Escrow</b>
                <CFELSEIF #get_titleid.pstate# eq "NV">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>#title_co_name# & Escrow</b>
                <CFELSE>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>#read_agency.title_ft_agency_name#</b>
                </CFIF>
                </font></font></font>
                </cfif>
        </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1205_a# neq "0">
          <b>#FixDecimals(read_data2.a_1205_a)#</b>
        </cfif>
        </font></font> </td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1205_b# neq "0">
          <b>#FixDecimals(read_data2.a_1205_b)#</b>
        </cfif>
        </font></font> </td>
    </tr>
    <tr>
      <td colspan=3 > <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1300. ADDITIONAL SETTLEMENT CHARGES </font></font></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1301. <cfif (read_data2.a_1301_a neq '' and read_data2.a_1301_a neq 0) or (read_data2.a_1301_b neq '' and read_data2.a_1301_b neq 0)><cfif (read_data2.a_1301_text neq '' and read_data2.a_1301_text neq 'NULL')>#read_data2.a_1301_text#<cfelse>Survey </cfif></cfif></font></font></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1301_a# neq "0">
          <b>#FixDecimals(read_data2.a_1301_a)#</b>
        </cfif>
        </font></font> </td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1301_b# neq "0">
          <b>#FixDecimals(read_data2.a_1301_b)#</b>
        </cfif>
        </font></font> </td>
    </tr>
	<tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1302. <cfif (read_data2.a_1302_a neq '' and read_data2.a_1302_a neq 0) or (read_data2.a_1302_b neq '' and read_data2.a_1302_b neq 0)><cfif (read_data2.a_1302_text neq '' and read_data2.a_1302_text neq 'NULL')>#read_data2.a_1302_text#<cfelse>Pest Inspection </cfif></cfif></font></font></td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1302_a# neq "0">
          <b>#FixDecimals(read_data2.a_1302_a)#</b>
        </cfif>
        </font></font> </td>
      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1302_b# neq "0">
          <b>#FixDecimals(read_data2.a_1302_b)#</b>
        </cfif>
        </font></font> </td>
    </tr>
    <tr >
      	<td><font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1303.
	  		<font color=blue><cfif (read_data2.a_1303_a neq '' and read_data2.a_1303_a neq 0) or (read_data2.a_1303_b neq '' and read_data2.a_1303_b neq 0)>
			<CFIF #Len(read_data2.a_1303_text)# gt 0>
				#read_data2.a_1303_text#
			<CFELSE>
				#get_line_costs.a_1303_text#
			</CFIF>
			<CFIF #Len(read_data2.a_1303_text)# eq 0>
				<cfif #read_data2.a_1303_a# neq "0" OR #read_data2.a_1303_b# neq "">
					&nbsp;&nbsp;&nbsp;<b>#read_agency.title_ft_agency_name#</b></font></font></font>
				</cfif>
			</CFIF>
			</cfif>
		</td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1303_a# neq "0">
          <b>#FixDecimals(read_data2.a_1303_a)#</b>
        </cfif>
        </font></font> </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1303_b# neq "0">
          <b>#FixDecimals(read_data2.a_1303_b)#</b>
        </cfif>
        </font></font> </td>
    </tr>
    <tr >
    	<td>
			<font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>1304.
	  	  	<font color=blue><cfif (read_data2.a_1304_a neq '' and read_data2.a_1304_a neq 0) or (read_data2.a_1304_b neq '' and read_data2.a_1304_b neq 0)>
			<CFIF #Len(read_data2.a_1304_text)# gt 0>
				#read_data2.a_1304_text#
			<CFELSE>
				#get_line_costs.a_1304_text#
			</CFIF>
			<CFIF #Len(read_data2.a_1303_text)# eq 0>
		  		<cfif #read_data2.a_1304_a# neq "0" OR #read_data2.a_1304_b# neq "">
		  			&nbsp;&nbsp;
        			<b>#read_agency.title_ft_agency_name#</b></font></font></font>
				</CFIF>
			</cfif>
			</cfif>
	 	</td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1304_a# neq "0">
          <b>#FixDecimals(read_data2.a_1304_a)#</b>
        </cfif>
        </font></font> </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1304_b# neq "0">
          <b>#FixDecimals(read_data2.a_1304_b)#</b>
        </cfif>
        </font></font> </td>
    </tr>
    <tr>
      	<td>
			<font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif">
	  		<font color=black>
			1305. <font color=blue><cfif (read_data2.a_1305_a neq '' and read_data2.a_1305_a neq 0) or (read_data2.a_1305_b neq '' and read_data2.a_1305_b neq 0)>
			<CFIF #Len(read_data2.a_1305_text)# gt 0>
				#read_data2.a_1305_text#
			<CFELSE>
				#get_line_costs.a_1305_text#
			</CFIF>
			<CFIF #Len(read_data2.a_1305_text)# eq 0>
				<cfif #read_data2.a_1305_a# neq "0" OR #read_data2.a_1305_b# neq "">
					&nbsp;&nbsp;<cfif get_titleid.comp_id neq 3276> <b>#read_agency.title_ft_agency_name#</b></cfif></font></font></font>
				</cfif>
			</CFIF>
			</cfif>
		</td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1305_a# neq "0">
          <b>#FixDecimals(read_data2.a_1305_a)#</b>
        </cfif>
        </font></font> </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1305_b# neq "0">
          <b>#FixDecimals(read_data2.a_1305_b)#</b>
        </cfif>
        </font></font> </td>
    </tr>
    <tr>
      	<td>
			<font size="1" face="Arial, Helvetica, sans-serif">
			<font size="1" face="Arial, Helvetica, sans-serif">
			<font color=black>1306.
			<font color=blue> <cfif (read_data2.a_1306_c neq '' and read_data2.a_1306_c neq 0) or (read_data2.a_1306_b neq '' and read_data2.a_1306_b neq 0)>
			<CFIF #Len(read_data2.a_1306_text)# gt 0>
				#read_data2.a_1306_text#
			<CFELSE>
				<cfif #read_data2.a_1306_a# neq "0">
					#read_data2.a_1306_a#</font>
				</cfif>
			</CFIF>
			</cfif>
        	</font>
			</font>
		</td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1306_b# neq "0">
          <b>#FixDecimals(read_data2.a_1306_b)#</b>
        </cfif>
        </font></font> </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1306_c# neq "0">
          <b>#FixDecimals(read_data2.a_1306_c)#</b>
        </cfif>
        </font></font> </td>
    </tr>
    <tr >
      <td ><font size="1" face="Arial, Helvetica, sans-serif">1307. <cfif (read_data2.a_1307_c neq '' and read_data2.a_1307_c neq 0) or (read_data2.a_1307_b neq '' and read_data2.a_1307_b neq 0)>
        <CFIF #Len(read_data2.a_1307_text)# gt 0>
				#read_data2.a_1307_text#
		<CFELSE>
			<cfif #read_data2.a_1307_a# neq "0">
          		<font color="blue">#read_data2.a_1307_a#</font>
        	</cfif>
		</CFIF>
		</cfif>
        </font></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color="blue">
        <cfif #read_data2.a_1307_b# neq "0">
          <b>#FixDecimals(read_data2.a_1307_b)#</b>
        </cfif>
        </font></font></td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color="blue">
        <cfif #read_data2.a_1307_c# neq "0">
          <b>#FixDecimals(read_data2.a_1307_c)#</b>
        </cfif>
        </font></font></td>
    </tr>
    <tr >
      	<td>
			<font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif">
	  		<font color=black>1308. Subtotal from line 1520
			</font></font>
		</td>
      <td align="right" > <font size=1 color=blue face="Arial, Helvetica, sans-serif"> <cfif #read_data2.a_1308_b# neq "0">
        &nbsp;<b>#FixDecimals(read_data2.a_1308_b)#</b></font><font size="1" face="Arial, Helvetica, sans-serif"></cfif>
        </font></td>
      <td align="right" > <font size=1 color=blue face="Arial, Helvetica, sans-serif"> <cfif #read_data2.a_1308_c# neq "0">
        &nbsp;<b>#FixDecimals(read_data2.a_1308_c)#</b></font><font size="1" face="Arial, Helvetica, sans-serif"></cfif>
        </font></td>
    </tr>
    <tr>
      <td><font size="1" face="Arial, Helvetica, sans-serif"><br><font size="1" face="Arial, Helvetica, sans-serif">
        <font color=black>1400. TOTAL SETTLEMENT CHARGES &nbsp;&nbsp;&nbsp;&nbsp;(enter
        on lines 103, Section J and 502 Section K) </font></font></td>

      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif"><br>
        <font color=blue> <b>#FixDecimals(read_data2.a_1400_a)#</b></font></font> </td>
      <td align="right" ><font size="1" face="Arial, Helvetica, sans-serif"><br>
        <font color=blue> <b>#FixDecimals(read_data2.a_1400_b)#</b></font></font> </td>
    </tr>
  </table>

  <table align="center" width="98%" cellspacing=0 cellpadding=0>
    <tr valign="center">
      <td align="center" valign="middle"><br><!--- <p>&nbsp;</p> ---> <strong><font size=1 face="Arial, Helvetica, sans-serif">
        HUD CERTIFICATION OF BUYER AND SELLER <br></font></strong></td>
    </tr>
    <tr>
      <td> <font size="1" face="Arial, Helvetica, sans-serif"><font size=1 face="Arial, Helvetica, sans-serif">I
        have carefully reviewed the HUD-1 Settlement Statement and to the best
        of my knowledge and belief, it is a true and accurate statement of all
        reciepts and disbursements made on my account or by me in this transaction.
        I further certify that I have recieved a copy of the HUD-1 Settlement
        Statement. I agree to further adjustments in the event of any errors or
        omissions and indemnify and hold harmless Settlement Agent against any
        such error or omissions </font></td>
    </tr>
    <tr>
      <td> <table align="center" width="100%" cellspacing=0 cellpadding=0>
          <tr>
            <td valign="middle" height="50">
              ________________________________________</td>
            <td valign="middle" height="50">
              ________________________________________</td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td> <table align="center" width="100%" cellspacing=0 cellpadding=0>
          <tr>
            <td valign="middle" height="35">
              ________________________________________</td>
          </tr>
        </table></td>
    </tr>
	    <tr> <td>&nbsp;</td></tr>
    <tr>
      <td> <table>
          <tr>
            <td width="62%" align=left valign=top> <font size=1 face="Arial, Helvetica, sans-serif">WARNING:
              IT IS A CRIME TO KNOWINGLY MAKE FALSE STATEMENTS TO THE UNITED
              STATES ON THIS OR ANY OTHER SIMILAR FORM. PENALTIES UPON CONVICTION
              CAN INCLUDE A FINE AND IMPRISONMENT. FOR DETAILS SEE; TITLE 18 U.S.
              CODE SECTION 1001 AND SECTION 1010.</font> </td>
            <td width="2%">&nbsp;</td>
            <td width="36%" align=left valign=top><font size="1" face="Arial, Helvetica, sans-serif">
              The HUD-1 Settlement Statement which I have prepared is a true and
              accurate account of this transaction. I have caused or will cause
              the funds to be dispersed in accordance with this statement.</font></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td valign=top> <table align="center" width="100%" cellspacing=0 cellpadding=0>
          <tr valign="bottom">
            <td width="45%"><font size="1" face="Arial, Helvetica, sans-serif"><br>
              #title_co_name# and Escrow, Inc. -- <font color="FF0000">Printed <b>
           <cfif #read_data2.print_date# neq ""> #read_data2.print_date# </cfif><!--- June 21, 2001 at 14:30 ---></b></font></font></td>
            <td width="40%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">By:______________________________________<br>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DATE </font></td>
            <td width="15%"><font size="1" face="Arial, Helvetica, sans-serif">REV.
              HUD-1 (3/86)</font></td>
          </tr>
        </table></td>
    </tr>
  </table>
<cfif #read_data2.a_1520# neq "">
  <!-------LAST PAGE ---->
  <p>&nbsp;</p>
<table border="0" cellspacing=0 cellpadding=0 align = "center" width="98%" bordercolordark="666666" bordercolorlight="666666" bordercolor="666666">
<tr><td colspan="3">
  <table align="center" width="100%" cellspacing=0 cellpadding=0>
          <tr>
            <td width="54%" align="left"> <b><font face="Arial, Helvetica, sans-serif" size="1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;U.S.
              DEPARTMENT OF HOUSING AND URBAN DEVELOPMENT</font></b></td>
            <td  width="27%"><font face="Arial, Helvetica, sans-serif" size="1">File
              Number: <b>#read_data2.title_id#</b></font></td>
            <td  width="19%" align="right"><font size="1" face="Arial, Helvetica, sans-serif">PAGE
              3</font></td>
          </tr>
          <tr>
            <td width="54%" align="left"> <b><font face="Arial, Helvetica, sans-serif" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SETTLEMENT
              STATEMENT</font></b></td>
            <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="1">TitleExpress
              Settlement System Printed 09/15/2005 at 17:13 SJP</font></td>
          </tr>
        </table>
</td>
</tr>

<tr><td colspan="3" valign="top">
<table border="1" cellspacing=0 cellpadding=0 align = "center" width="100%" bordercolordark="666666" bordercolorlight="666666" bordercolor="666666">
          <tr>
            <td colspan="3"><p>&nbsp;</p>
              <br></td>
          </tr>
          <tr>
            <td align="center" colspan="3"><font face="Arial, Helvetica, sans-serif"><strong>ITEMIZATION
              OF HUD LINE 1308</strong></font></td>
          </tr>
          <tr>
            <td colspan="3"><p>&nbsp;</p>
              <br></td>
          </tr>
          <tr>
            <td><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1500.
              SCHEDULE OF DISBURSEMENTS</font></strong></td>
            <td align="center"><strong><font size="2" face="Arial, Helvetica, sans-serif">BUYER</font></strong></td>
            <td align="center"><strong><font size="2" face="Arial, Helvetica, sans-serif">SELLER</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1501. #read_data2.a_1501_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1501_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1501_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1502. #read_data2.a_1502_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1502_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1502_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1503. #read_data2.a_1503_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1503_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1503_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1504. #read_data2.a_1504_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1504_b#</font></strong></td>

            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1504_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1505. #read_data2.a_1505_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1505_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1505_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1506. #read_data2.a_1506_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1506_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1506_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1507. #read_data2.a_1507_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1507_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1507_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1508. #read_data2.a_1508_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1508_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1508_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1509. #read_data2.a_1509_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1509_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1509_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1510. #read_data2.a_1510_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1510_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1510_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1511. #read_data2.a_1511_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1511_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1511_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1512. #read_data2.a_1512_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1512_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1512_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1513. #read_data2.a_1513_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1513_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1513_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1514. #read_data2.a_1514_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1514_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1514_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1515. #read_data2.a_1515_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1515_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1515_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1516. #read_data2.a_1516_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1516_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1516_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1517. #read_data2.a_1517_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1517_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1517_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1518. #read_data2.a_1518_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1518_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1518_c#</font></strong></td>
          </tr>
		  <tr>
            <td><font size="2" face="Arial, Helvetica, sans-serif"><br>
              &nbsp;&nbsp;1519. #read_data2.a_1519_a#</font></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1519_b#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1519_c#</font></strong></td>
          </tr>
		  <tr>
            <td><p>&nbsp;</p><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1520.
              TOTAL HUD LINE 1208 EXPENSE:</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1520#</font></strong></td>
            <td align="right" valign="bottom"><strong><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1520_b#</font></strong></td>
          </tr>

        </table>
</td></tr></table></cfif>

</CFOUTPUT>
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