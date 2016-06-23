<cfparam name="a_trigger" default="0">
<cfparam name="user_id_1" default="">
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

		 window.location= "https://<cfoutput>#cgi.server_name#</cfoutput>/prop_view_hud_A_modify.cfm?user_id_1=<cfoutput>#user_id_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&rec_id=<cfoutput>#rec_id#</cfoutput>&a_trigger=2";

    }

</script>
</HEAD>




<CFQUERY datasource="#request.dsn#" NAME="read_data">
			SELECT *
			FROM hud_form_prop_pg1
			WHERE prop_ID = #rec_id#
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_data2">
			SELECT *
			FROM hud_form_prop_pg2
			WHERE prop_ID = #rec_id#
		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_titleid">
			SELECT *
			FROM Property
			WHERE prop_ID = #rec_id#
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_insurance">
				SELECT * from Doc_Title_Insurance_prop
				where prop_ID = #rec_id#

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
		update hud_form_prop_pg2
		set print_date = '#DateFormat(Now(), "mmmmm dd, yyyy")#'
		WHERE prop_ID = #rec_id#

</CFQUERY>	</cfif>

<BODY TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" marginheight=0 marginwidth=0 topmargin=0 leftmargin=0>
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
 <!--- factory.printing.Print(false,window)

 function Print() {
  factory.printing.Print(false); // no prompt
}
idPrint.disabled = false;

function PrintPDF(url) {
  factory.printing.PrintPDF(idPDF);
} --->
 <p>

<div id=idControls align="center" class="noprint">
 <font color = red face="Arial, Helvetica, sans-serif"><b>**NOTE: Under page setup change the paper size to legal before printing this document</b>

 <p>
 <cfoutput>
 <FORM METHOD=POST ACTION="./prop_view_hudA.cfm?user_id_1=0&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=2&company_id=#get_titleid.comp_ID#" name="frm" ENABLECAB="Yes">
</cfoutput>

 <a href="#" onclick=printWindow();><input disabled type="submit" value="Print the page"
 onclick="factory.printing.Print(true)"></a>
 <input disabled type="button" value="Page Setup..."
 onclick="factory.printing.PageSetup()">
 <input class=ie55 disabled type="button" value="Print Preview..."
 onclick="factory.printing.Preview()">
   <a href="./prop_view_hud_A_modify.cfm?user_id_1=0&lo_id=#lo_id#&rec_id=#rec_id#&a_trigger=2&company_id=#get_titleid.comp_ID#"><input class=ie55 disabled type="button" value="Modify..." onclick="Locate();"></a>
</form>

  <table align="center" width="98%" cellspacing=0 cellpadding=0>

    <CFQUERY datasource="#request.dsn#" NAME="read_a_103">
			Select * from hud_modify
			WHERE title_id = #rec_id# and a_103 is not null order by c_date, c_time
	</cfquery>



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
 </cfoutput>

 </table>

 <hr size="1" color="dimgray">

</div>


 <CFOUTPUT>
<table width="100%" align="center" border="0" cellpadding="1" cellspacing="0">
  <tr>
    <td width="33%"><font size="2" face="Arial, Helvetica, sans-serif"><strong>SETTLEMENT
      STATEMENT</strong></font></td>
    <td width="33%"><font size="1" face="Arial, Helvetica, sans-serif">U.S. DEPARTMENT
      OF HOUSING</font></td>
    <td width="33%"><font size="1" face="Arial, Helvetica, sans-serif">File Number:
      &nbsp;&nbsp;<b>#get_titleid.prop_id#</b></font></td>
  </tr>
  <tr>
    <td><font size="1" face="Arial, Helvetica, sans-serif">Optional Form for</font></td>
    <td><font size="1" face="Arial, Helvetica, sans-serif">AND URBAN DEVELOPMENT</font></td>
    <td><font size="1" face="Arial, Helvetica, sans-serif">Loan Number: &nbsp;&nbsp;<b>#get_titleid.loan_number#</b></font></td>
  </tr>
  <tr>
    <td><font size="1" face="Arial, Helvetica, sans-serif">Transactions without
      Sellers</font></td>
    <td><font size="1" face="Arial, Helvetica, sans-serif">OMB Approval No. 2502-0491</font></td>
    <td><font size="1" face="Arial, Helvetica, sans-serif">Mtg. Ins. Case Number:
      &nbsp;&nbsp;<b>#read_data.a_8#</b></font></td>
  </tr>
</table>
<table width="100%" align="center" border="2" cellpadding="1" cellspacing="0" bordercolordark="333333" bordercolorlight="333333" bordercolor="333333">
  <tr>
    <td colspan="4"> <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
          <td width="19%"> <font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;NAME
            OF BORROWER:&nbsp;&nbsp;&nbsp;<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ADDRESS:&nbsp;&nbsp;&nbsp;</font></td>
          <td width="81%"><strong><font size="1" face="Arial, Helvetica, sans-serif">#read_data.d_bname#<br>
            #read_data.g_propaddr#</font></strong></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td colspan="4"> <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
          <td width="19%"> <font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;NAME
            OF LENDER:&nbsp;&nbsp;&nbsp;<b></b>&nbsp;&nbsp;&nbsp;<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ADDRESS:&nbsp;&nbsp;&nbsp;</font></td>
          <td width="81%"><strong><font size="1" face="Arial, Helvetica, sans-serif">#read_data.f_lname#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#get_titleid.insured#<br>
            #read_data.f_laddr#</font></strong></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td colspan="4"> <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
          <td width="19%"> <font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;PROPERTY
            ADDRESS:&nbsp;&nbsp;&nbsp;&nbsp;</font></td>
          <td width="81%"><font size="1" face="Arial, Helvetica, sans-serif"><strong>#read_data.g_propaddr#</strong></font></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td colspan="4"> <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
          <td width="19%"> <font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;SETTLEMENT
            AGENT:&nbsp;&nbsp;&nbsp;<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PLACE OF SETTLEMENT:&nbsp;&nbsp;&nbsp;</font></td>
          <td width="81%"><strong><font size="1" face="Arial, Helvetica, sans-serif">First
            <cfif NOT DateDiff("d", Now(), "1/30/2012")>Title and Escrow, Inc.<br>
            30 West Gude Drive, suite 450, Rockville, MD 20850</font></strong><cfelse>Title and Escrow, Inc.<br>
            7361 Calhoun Place, Suite 200, Rockville, MD 20855</font></strong></cfif></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td colspan="4"> <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="23%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;Loan
            Number:&nbsp;&nbsp;&nbsp;<b>#get_titleid.loan_number#</b></font></td>
          <td width="77%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;SETTLEMENT
            DATE:&nbsp;&nbsp;&nbsp;<b>#read_data.i_settlementDate#</b></font></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td colspan="2"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;L.
      Settlement Charges</strong></font></td>
    <td colspan="2"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;M.
      Disbursement to Others </strong></font></td>
  </tr>
  <tr>
    <td width="46%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;800.
      Items Payable In Connection with Loan </strong></font></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;</strong></font></td>
    <td width="38%" rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1501.&nbsp;&nbsp;#read_data2.a_1501_a#</font></td>
    <td width="8%" rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1501_b#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;801.
      Loan Origination Fee #read_data2.a_801_a#% to #read_data2.a_801_d#</font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_801_b#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;802.
      Loan Discount #read_data2.a_802_a#% to #read_data2.a_801_d#</font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_802_b#</strong></font></td>
    <td rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1502.&nbsp;&nbsp;#read_data2.a_1502_a#</font></td>
    <td rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1502_b#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;803.
      Appraisal Fee #read_data2.a_803_a#</font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_803_b#</strong></font></td>
  </tr>
  <tr>
    <td width="46%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;804.
      Credit Report #read_data2.a_804_a#</font></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_804_b#</strong></font></td>
    <td width="38%" rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1503.&nbsp;&nbsp;#read_data2.a_1503_a#</font></td>
    <td width="8%" rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1503_b#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;805.
      #read_data2.a_805_a# #read_data2.a_805_c#</font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_805_b#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;806.
      #read_data2.a_806_c# #read_data2.a_806_c#</font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_806_b#</strong></font></td>
    <td rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1504.&nbsp;&nbsp;#read_data2.a_1504_a#</font></td>
    <td rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1504_b#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;807.
      #read_data2.a_807_a# #read_data2.a_807_c#</font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_807_b#</strong></font></td>
  </tr>
  <tr>
    <td width="46%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;808. #read_data2.a_808_a#
      #read_data2.a_808_c#</font></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_808_b#</strong></font></td>
    <td width="38%" rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1505.&nbsp;&nbsp;#read_data2.a_1505_a#</font></td>
    <td width="8%" rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1505_b#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;809. #read_data2.a_809_a#
      #read_data2.a_809_c#</font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_809_b#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;810. #read_data2.a_810_a#
      #read_data2.a_810_c#</font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;<cfif #read_data2.a_810_b# neq 0>#read_data2.a_810_b#</cfif></strong></font></td>
    <td rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1506.&nbsp;&nbsp;#read_data2.a_1506_a#</font></td>
    <td rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1506_b#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;811. #read_data2.a_811_a#
     #read_data2.a_811_c# </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;<cfif #read_data2.a_811_b# neq 0>#read_data2.a_811_b#</cfif></strong></font></td>
  </tr>
  <tr>
    <td width="46%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;900.
      Items Required by Lender to be Paid in Advance </strong></font></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;</strong></font></td>
    <td width="38%" rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1507.&nbsp;&nbsp;#read_data2.a_1507_a#</font></td>
    <td width="8%" rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1507_b#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;901.
      Interest From #read_data2.a_901_a# to #read_data2.a_901_b# @$#read_data2.a_901_c# per day </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_901_d#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;902.
      Mortgage Insurance Premium for #read_data2.a_902_a# to #read_data2.a_902_b#</font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_902_c#</strong></font></td>
    <td rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1508. #read_data2.a_1508_a#</font></td>
    <td rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1508_b#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;903.
      Hazard Insurance Premium for #read_data2.a_903_a# to #read_data2.a_903_b#</font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_903_c#</strong></font></td>
  </tr>
  <tr>
    <td width="46%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;904. #read_data2.a_904_a#
      </font></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_904_b#</strong></font></td>
    <td width="38%" rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1509. #read_data2.a_1509_a#
      </font></td>
    <td width="8%" rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1509_b#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;1000.
      Reserves Deposited with Lender </strong></font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;</strong></font></td>
  </tr>
  <tr>
    <td valign="top"> <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td width="47%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1001.
            Hazard Insurance</font></td>
          <td width="12%"><font size="1" face="Arial, Helvetica, sans-serif">#read_data2.a_1001_a# mo.@
            $</font></td>
          <td width="20%"><strong><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1001_a#</font></strong></td>
          <td width="21%"><font size="1" face="Arial, Helvetica, sans-serif">per
            month</font></td>
        </tr>
      </table></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1001_c#</strong></font></td>
    <td rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1510. #read_data2.a_1510_a#</font></td>
    <td rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1510_b#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"> <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td width="47%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1002.
            Mortgage Insurance</font></td>
          <td width="12%"><font size="1" face="Arial, Helvetica, sans-serif"> #read_data2.a_1002_a# mo.@
            $</font></td>
          <td width="20%"><strong><font size="1" face="Arial, Helvetica, sans-serif">&nbsp; #read_data2.a_1002_b#</font></strong></td>
          <td width="21%"><font size="1" face="Arial, Helvetica, sans-serif">per
            month</font></td>
        </tr>
      </table></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1002_c#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"> <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td width="47%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1003.
            City Property Taxes</font></td>
          <td width="12%"><font size="1" face="Arial, Helvetica, sans-serif"> #read_data2.a_1003_a# mo.@
            $</font></td>
          <td width="20%"><strong><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1003_b#</font></strong></td>
          <td width="21%"><font size="1" face="Arial, Helvetica, sans-serif">per
            month</font></td>
        </tr>
      </table></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1003_c#</strong></font></td>
    <td width="38%" rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1511. #read_data2.a_1511_a#
      </font></td>
    <td width="8%" rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1511_b#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"> <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td width="47%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1004.
            County Property Taxes </font></td>
          <td width="12%"><font size="1" face="Arial, Helvetica, sans-serif">#read_data2.a_1004_a# mo.@
            $</font></td>
          <td width="20%"><strong><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1004_b#</font></strong></td>
          <td width="21%"><font size="1" face="Arial, Helvetica, sans-serif">per
            month</font></td>
        </tr>
      </table></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1004_c#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"> <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td width="47%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1005.
            Annual Assessments</font></td>
          <td width="12%"><font size="1" face="Arial, Helvetica, sans-serif">#read_data2.a_1005_a# mo.@
            $</font></td>
          <td width="20%"><strong><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;#read_data2.a_1005_b#</font></strong></td>
          <td width="21%"><font size="1" face="Arial, Helvetica, sans-serif">per
            month</font></td>
        </tr>
      </table></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1005_c#</strong></font></td>
    <td rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1512. #read_data2.a_1512_a#</font></td>
    <td rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp; #read_data2.a_1512_b#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"> <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td width="47%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1006. Aggragate Analysis Adjustment
            </font></td>
          <td width="12%"><font size="1" face="Arial, Helvetica, sans-serif">#read_data2.a_1006_a#</font></td>
          <td width="20%"><strong><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></strong></td>
          <td width="21%"><font size="1" face="Arial, Helvetica, sans-serif">
            </font></td>
        </tr>
      </table></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1006_b#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"> <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td width="47%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1007.
            </font></td>
          <td width="12%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;
           </font></td>
          <td width="20%"><strong><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></strong></td>
          <td width="21%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
        </tr>
      </table></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;</strong></font></td>
    <td width="38%" rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1513. #read_data2.a_1513_a#
      </font></td>
    <td width="8%" rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1513_b#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"> <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
          <td width="47%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1008.
            </font></td>
          <td width="12%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;
            </font></td>
          <td width="20%"><strong><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></strong></td>
          <td width="21%"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
        </tr>
      </table></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;1100.
      Title Charges </strong></font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;</strong></font></td>
    <td rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1514. #read_data2.a_1514_a#</font></td>
    <td rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1514_b#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1101.
      Closing Fee to <cfif #read_data2.a_1101_a# neq "0" OR #read_data2.a_1101_b# neq ""> <b>#read_agency.title_ft_agency_name#</b> </cfif></font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1101_a#</strong></font></td>
  </tr>
  <tr>
    <td width="46%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1102.
      Abstract to Abstracts USA, LLC </font></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><cfif #read_data2.a_1102_a# neq "0">&nbsp;&nbsp;
          <b>#read_data2.a_1102_a#</b>
        </cfif></font></td>
    <td width="38%" rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1515. #read_data2.a_1515_a#
      </font></td>
    <td width="8%" rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1515_b#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1103.
      Title Examination to <cfif #read_data2.a_1103_a# neq "0" OR #read_data2.a_1103_b# neq "">#read_agency.title_ft_agency_name#</b> </cfif> </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;<cfif #read_data2.a_1103_a# neq "0">
        <b>#read_data2.a_1103_a#</b></cfif></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1104.
      Title insurance binder </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;<cfif #read_data2.a_1104_a# neq "0">
        <b>#read_data2.a_1104_a#</b></cfif></font></td>
    <td rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1516. #read_data2.a_1516_a#</font></td>
    <td rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1516_b#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1105.
      Document Preparation </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;<cfif #read_data2.a_1105_a# neq "0">
        <b>#read_data2.a_1105_a#</b></cfif></strong></font></td>
  </tr>
  <tr>
    <td width="46%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1106.
      Notary Fees </font></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;<cfif #read_data2.a_1106_a# neq "0">
        <b>#read_data2.a_1106_a#</b></cfif></strong></font></td>
    <td width="38%" rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1517. #read_data2.a_1517_a#
      </font></td>
    <td width="8%" rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1517_b#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1107.
      Attorney's fees<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(includes
      above items No. ) </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;<cfif #read_data2.a_1107_a# neq "0">
        <b>#read_data2.a_1107_a#</b></cfif></strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1108.
      Title Insurance to <cfif #read_data2.a_1108_a# neq "0" OR #read_data2.a_1108_b# neq ""><b>First Title/#get_ins.company#</b> </cfif><br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(includes
      above items No. ) </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;<cfif #read_data2.a_1108_a# neq "0">
        <b>#read_data2.a_1108_a#</b></cfif></strong></font></td>
    <td rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1518. #read_data2.a_1518_a#</font></td>
    <td rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1518_b#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1109.
      Lender's coverage $  <cfif #read_data2.a_1109_a# neq "0">
          <b>#read_data2.a_1109_a#</b>
        </cfif> </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;</strong></font></td>
  </tr>
  <tr>
    <td width="46%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1110.
      Owner's coverage $ -  <cfif #read_data2.a_1110_a# neq "0">
          <b>#read_data2.a_1110_a#</b>
        </cfif></font></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;</strong></font></td>
    <td width="38%" rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1519. #read_data2.a_1519_a#
      </font></td>
    <td width="8%" rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1519_b#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1111. #get_line_costs.a_1111_text# <cfif #read_data2.a_1111_a# neq "0" OR #read_data2.a_1111_b# neq "">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>#read_agency.title_ft_agency_name#</b>
        </cfif>
      </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;<cfif #read_data2.a_1111_a# neq "0">
        <b>#read_data2.a_1111_a#</b></cfif></strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1112. #get_line_costs.a_1112_text# <cfif #read_data2.a_1112_a# neq "0">
        <b>#read_data2.a_1112_a#</b></cfif>
      </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;<cfif #read_data2.a_1112_b# neq "0"><b>#read_data2.a_1112_b#</b>
       </cfif></strong></font></td>
    <td rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;1520.
      TOTAL DISBURSED <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(enter
      on line 1603) </strong></font></td>
    <td rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1520#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1113. #get_line_costs.a_1113_text#<cfif #read_data2.a_1113_a# neq "0" OR #read_data2.a_1113_b# neq "">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>#read_agency.title_ft_agency_name#</b>
       </cfif> </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;</strong></font></td>
  </tr>
  <tr>
    <td width="46%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;1200.
      Government Recording and Transfer Charges </strong></font></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;</strong></font></td>
    <td width="38%" rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;N.
      NET SETTLEMENT </strong></font></td>
    <td width="8%" rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1201.
     <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>Recording Fees Deed $ &nbsp;&nbsp;<font color=blue>
        <cfif #read_data2.a_1201_a# neq "0">
          <b>#read_data2.a_1201_a#</b>
        </cfif>
        </font>&nbsp;&nbsp; Mortgage $ &nbsp;&nbsp;<font color=blue>
        <cfif #read_data2.a_1201_b# neq "0">
          <b>#read_data2.a_1201_b#</b>
        </cfif>
        </font>&nbsp;&nbsp;&nbsp;: Release $ <font color=blue>
        <cfif #read_data2.a_1201_c# neq "0">
          <b>#read_data2.a_1201_c#</b>
        </cfif>
        </font></font></font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;<cfif #read_data2.a_1201_d# neq "0">
        &nbsp;<b>#read_data2.a_1201_d#</b></cfif></strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1202.
      <font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>City/County tax/Stamps: &nbsp;&nbsp;<font color=blue>
        <cfif #read_data2.a_1202_a# neq "0">
          <b>#read_data2.a_1202_a#</b>
        </cfif>
        </font>&nbsp;&nbsp;Deed $ &nbsp;&nbsp;<font color=blue>
        <cfif #read_data2.a_1202_b# neq "0">
          <b>#read_data2.a_1202_b#</b>
        </cfif>
        </font>&nbsp;&nbsp;: Mortgage $ <font color=blue>
        <cfif #read_data2.a_1202_c# neq "0">
          <b>#read_data2.a_1202_c#</b>
        </cfif>
        </font></font></font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;<font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1202_d# neq "0">
          <b>#read_data2.a_1202_d#</b>
        </cfif>
        </font></font></strong></font></td>
    <td rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1600.
      <strong>Loan Amount</strong></font></td>
    <td rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#get_titleid.loanamt_float#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1203.
</font><font size="1" face="Arial, Helvetica, sans-serif"><font size="1" face="Arial, Helvetica, sans-serif"><font color=black>State tax/Stamps: &nbsp;&nbsp;<font color=blue>
        <cfif #read_data2.a_1203_a# neq "0">
          <b>#read_data2.a_1203_a#</b>
        </cfif>
        </font>&nbsp;&nbsp;Deed $ &nbsp;&nbsp;<font color=blue>
        <cfif #read_data2.a_1203_b# neq "0">
          <b>#read_data2.a_1203_b#</b>
        </cfif>
        </font>&nbsp;&nbsp;: Mortgage $ <font color=blue>
        <cfif #read_data2.a_1203_c# neq "0">
          <b>#read_data2.a_1203_c#</b>
        </cfif>
        </font></font></font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>
	<font size="1" face="Arial, Helvetica, sans-serif">&nbsp;<font color=blue>
        <cfif #read_data2.a_1203_d# neq "0">
          <b>#read_data2.a_1203_d#</b>
        </cfif>
        </font></font> </strong></font></td>
  </tr>
  <tr>
    <td width="46%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1204.
      </font></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;</strong></font></td>
    <td width="38%" rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;
      1601. <strong>PLUS</strong> Cash/Check from Borrower </font></td>
    <td width="8%" rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data.a_1601#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1205. #get_line_costs.a_1205_text#<cfif #read_data2.a_1205_a# neq "0" OR #read_data2.a_1205_b# neq "">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <b>#read_agency.title_ft_agency_name#</b> </cfif>
      </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;<cfif #read_data2.a_1205_a# neq "0">
          <b>#read_data2.a_1205_a#</b>
        </cfif></strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;1300.
      Additional Settlement Charges </strong></font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;</strong></font></td>
    <td rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1602.
      <strong>MINUS</strong> Total Settlement Charges<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(line
      1400) </font></td>
    <td rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data.a_103#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1301.
      Survey </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;<cfif #read_data2.a_1301_a# neq "0">
          <b>#read_data2.a_1301_a#</b>
        </cfif></strong></font></td>
  </tr>
  <tr>
    <td width="46%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1302.
      Pest Inspection </font></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;<cfif #read_data2.a_1302_a# neq "0">
          <b>#read_data2.a_1302_a#</b>
        </cfif></strong></font></td>
    <td width="38%" rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1603.
      <strong>MINUS</strong> Total Disbursements to Others<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(line
      1520) </font></td>
    <td width="8%" rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1308_b#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1303. #get_line_costs.a_1303_text#<cfif #read_data2.a_1303_a# neq "0" OR #read_data2.a_1303_b# neq "">&nbsp;&nbsp;&nbsp;<b>#read_agency.title_ft_agency_name#</b></cfif>
      </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;  <cfif #read_data2.a_1303_a# neq "0">
          <b>#read_data2.a_1303_a#</b>
        </cfif></strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1304. #get_line_costs.a_1304_text#<cfif #read_data2.a_1304_a# neq "0" OR #read_data2.a_1304_b# neq "">&nbsp;&nbsp;
        <b>#read_agency.title_ft_agency_name#</b></cfif>
      </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp; <cfif #read_data2.a_1304_a# neq "0">
          <b>#read_data2.a_1304_a#</b>
        </cfif></strong></font></td>
    <td rowspan="2" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1604.
      <strong>EQUALS</strong> Disbursements to Borrower<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(after
      expiration of any applicable <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;rescission
      period required by law) </font></td>
    <td rowspan="2" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data.a_303#</strong></font></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1305. #get_line_costs.a_1305_text#<cfif #read_data2.a_1305_a# neq "0" OR #read_data2.a_1305_b# neq "">&nbsp;&nbsp;<b>#read_agency.title_ft_agency_name#</b></cfif></font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp; <cfif #read_data2.a_1305_a# neq "0">
          <b>#read_data2.a_1305_a#</b>
        </cfif></strong></font></td>
  </tr>
  <tr>
    <td width="46%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1306. <cfif #read_data2.a_1306_a# neq "0"> #read_data2.a_1306_a#</cfif>
      </font></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;<cfif #read_data2.a_1306_b# neq "0"> #read_data2.a_1306_b#</cfif></strong></font></td>
    <td width="38%" rowspan="2" valign="top"></td>
    <td width="8%" rowspan="2" valign="top"></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1307.  <cfif #read_data2.a_1307_a# neq "0">
          #read_data2.a_1307_a#
        </cfif>
      </font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp; <cfif #read_data2.a_1307_b# neq "0">
          <b>#read_data2.a_1307_b#</b>
        </cfif></strong></font></td>
  </tr>
  <tr>
    <td width="46%" valign="top"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;&nbsp;1308. &nbsp;
      </font></td>
    <td width="8%" align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;</strong></font></td>
    <td width="38%" rowspan="2" valign="top"></td>
    <td width="8%" rowspan="2" valign="top"></td>
  </tr>
  <tr>
    <td valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;1400.
      Total Settlement Charges (enter on line 1602) </strong></font></td>
    <td align="right" valign="top"><font size="1" face="Arial, Helvetica, sans-serif"><strong>&nbsp;&nbsp;#read_data2.a_1400_a#</strong></font></td>
  </tr>
</table>
<p>
<table border="0" cellpadding="0" cellspacing="0" width="95%" align="center">
  <tr>
    <td><font face="Arial, Helvetica, sans-serif" size="1"> I have carefully reviewed the
      HUD-1A Settlement Statement and to the best of my knowledge and belief,
      it is a true and accurate statement of all receipts and disbursements made
      on my account or by me in this transaction. I further certify that I have
      received a copy of the HUD-1A Settlement Statement. <br>
      &nbsp;
      <p>_________________________________________________________________<br>
        Fees
      <p>The HUD-1A Settlement Statement which I have prepared is a true and accurate
        account of this transaction. I have caused or will cause the funds to
        be disbursed in accordance with this statement. </font> <table border="0" cellpadding="0" cellspacing="0" width="75%" align="center">
        <tr>
          <td align="left"><font face="Arial, Helvetica, sans-serif" size="1">SETTLEMENT
            AGENT By:</font></td>
        </tr>
        <tr>
          <td align="right"><font face="Arial, Helvetica, sans-serif" size="1">_____________________________________DATE</font></td>
        </tr>
      </table>
     <br> <!--- &nbsp; --->
      <table border="0" cellpadding="0" cellspacing="0" width="95%" align="center">
        <tr>
          <td align="left"><strong><font face="Arial, Helvetica, sans-serif" size="1">First Title
            Settlement System Printed 11/05/2003 at 17:14 HEI</font></strong></td>
          <td align="right"><strong><font face="Arial, Helvetica, sans-serif" size="1">form
            HUD-1A (2/94) ref. RESPA</font></strong></td>
        </tr>
      </table></td>
  </tr></CFOUTPUT>
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
