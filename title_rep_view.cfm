<CFSET r_count = "0">
<!---=========================================== --->
<!--- ===/ Get a list of all of the Clients \=== --->
<cfif #url.uid# eq "92">
  <CFQUERY datasource="#request.dsn#" NAME="read_companies">
  SELECT * FROM companies where ID = 128 or ID = 115 or company like 'Homeowners%' or ID = 210 or ID = 213 or ID = 141 ORDER BY company ASC
  </CFQUERY>
  <cfelseif #url.uid# eq "93">
  <CFQUERY datasource="#request.dsn#" NAME="read_companies">
  SELECT * FROM companies where ID = 211 or ID = 174 or ID = 208 ORDER BY company ASC
  </CFQUERY>
  <cfelse>
  <CFQUERY datasource="#request.dsn#" NAME="read_companies">
  SELECT * FROM companies ORDER BY company ASC
  </CFQUERY>
</cfif>
<CFSET c_count = "1">
<CFSET a_company_name = ArrayNew(1)>
<CFSET a_company_id   = ArrayNew(1)>
<CFOUTPUT QUERY="read_companies">
  <CFSET a_company_name[c_count] = #company#>
  <CFSET   a_company_id[c_count] = #ID#>
  <CFSET c_count = #c_count# + "1">
</CFOUTPUT>
<!---=========================================== --->
<!---===================================================================== --->
<!--- ===/ Use the list of companies to get a list of all their users \=== --->
<CFSET    users_fname = ArrayNew(2)>
<CFSET    users_lname = ArrayNew(2)>
<CFSET       users_id = ArrayNew(2)>
<CFSET    a_rec_count = ArrayNew(1)>
<CFSET a_count = "1">
<CFSET b_count = "1">
<CFLOOP FROM="1" TO="#ArrayLen(a_company_id)#" INDEX="CCC">
  <CFQUERY datasource="#request.dsn#" NAME="read_users">
  SELECT * FROM users Where comp_id = #a_company_id[CCC]# ORDER BY lp_lname ASC, lp_fname ASC
  </CFQUERY>
  <CFOUTPUT QUERY="read_users">
    <CFSET users_fname[CCC][b_count] = #lp_fname#>
    <CFSET users_lname[CCC][b_count] = #lp_lname#>
    <CFSET    users_id[CCC][b_count] = #ID#>
    <CFSET b_count = #b_count# + "1">
  </CFOUTPUT>
  <CFSET a_rec_count[CCC] = #read_users.recordcount#>
  <CFSET b_count = "1">
</CFLOOP>
<!---===================================================================== --->
<CFQUERY datasource="#request.dsn#" NAME="read_date">
SELECT oda_month FROM title ORDER BY oda_month
</CFQUERY>
<cfif #url.uid# eq "92">
  <CFQUERY datasource="#request.dsn#" NAME="read_titleid">
  SELECT title_id FROM title where comp_ID = 128 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id eq 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or = comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197 or comp_id = 198 or comp_id = 199 or comp_id = 200 or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141 ORDER BY Title_id
  </CFQUERY>
  <cfelseif #url.uid# eq "93">
  <CFQUERY datasource="#request.dsn#" NAME="read_titleid">
  SELECT title_id FROM title where comp_ID = 211 or comp_ID = 174 or comp_ID = 208 ORDER BY Title_id
  </CFQUERY>
  <cfelse>
  <CFQUERY datasource="#request.dsn#" NAME="read_titleid">
  SELECT title_id FROM title ORDER BY Title_id
  </CFQUERY>
</cfif>
<CFQUERY datasource="#request.dsn#" NAME="read_date">
SELECT oda_month, title_id FROM title ORDER BY oda_month, Title_id
</CFQUERY>
<!--- <CFQUERY datasource="#request.dsn#" NAME="read_status">

			SELECT DISTINCT appraisal_status
			FROM title
			ORDER BY appraisal_status

		</CFQUERY> --->
<CFQUERY datasource="#request.dsn#" NAME="read_Comments">
SELECT DISTINCT comments FROM title ORDER BY comments
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_date_p">
SELECT oda_month FROM property ORDER BY oda_month
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_titleid_p">
SELECT prop_id FROM property ORDER BY prop_id
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_date_p">
SELECT oda_month, prop_id FROM property ORDER BY oda_month, prop_id
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_titleid_a">
SELECT app_id FROM appraisal ORDER BY app_id
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_titleid_anc">
SELECT anc_id FROM ancillary where codeFlood is not null ORDER BY anc_id
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_titleid_cr">
SELECT anc_id FROM ancillary where codeCR is not null ORDER BY anc_id
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_titleid_avm">
SELECT anc_id FROM ancillary where codeAVM is not null ORDER BY anc_id
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_titleid_sn">
SELECT anc_id FROM ancillary where codeSigning is not null ORDER BY anc_id
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_titleid_anc">
SELECT anc_id FROM ancillary ORDER BY anc_id
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_titleid_c">
SELECT * FROM Title C, Title_Closing_Order_Request O WHERE C.title_id = O.title_id AND O.a_Req_closing_month IS NOT NULL ORDER BY o.Title_id
</CFQUERY>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>1st Title&Escrow, Inc.</title>
<script type="text/javascript">
function prodSelect() {
var frm;
frm = document.frm;


if (frm.product.value == 'appraisal') {
location.href="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/title_rep_view.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_trigger=3&company_id=0";
  }
else if (frm.product.value == 'property') {
location.href="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/title_rep_view.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_trigger=2&company_id=0";

}
else if (frm.product.value == 'flood') {
location.href="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/title_rep_view.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_trigger=4&company_id=0";

}
else if (frm.product.value == 'avm') {
location.href="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/title_rep_view.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_trigger=9&company_id=0";

}
else if (frm.product.value == 'credit') {
location.href="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/title_rep_view.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_trigger=8&company_id=0";

}
else if (frm.product.value == 'signing') {
location.href="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/title_rep_view.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_trigger=7&company_id=0";

}
else if (frm.product.value == 'title') {
location.href="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/title_rep_view.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_trigger=1&company_id=0";

}

else if (frm.product.value == 'closing') {
location.href="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/title_rep_view.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_trigger=5&company_id=0";
}


else {
location.href="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/title_rep_view.cfm?uid=<cfoutput>#url.uid#</cfoutput>&al=<cfoutput>#url.al#</cfoutput>&a_trigger=6&company_id=0";


}
}
</script>
</head>
<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>
<CENTER>
<CENTER>
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
  <tr>
    <td width=780 align=center valign=top><table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
        <tr>
          <td width=780 align=center valign=top bgcolor=e1e1e1><!--- =================================== --->
            <!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
            <!--- =================================== --->
            <cfif #url.a_trigger# eq "1">
              <table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
              <tr>
                <td width=780 align=left valign=top bgcolor=green><FONT FACE=ARIAL SIZE=2 color="white">
                  <CENTER>
                    <B>Title Commitment Report Search</B>
                  </CENTER></TD>
              </TR>
              <cfform name="frm" action="./title_rep_display.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" method="post">
              <INPUT type="hidden" name="update" value="no">
              <INPUT type="hidden" name="uid" value="URL.uid">
              <INPUT type="hidden" name="al" value="URL.al">
              <tr>
              <td width=780 align=center valign=top background="d3d3d3">
              <table width=350 cellpadding=1 cellspacing=1 border=0>
              <tr>
                <td background="d3d3d3" width=350 align=center valign=top><br>
                  <FONT FACE=verdana SIZE=1 color="blUE"> <B>SELECT A PRODUCT</b> </td>
              </tr>
              <td background="d3d3d3" width=350 align=center valign=top>
                <SELECT NAME="product"	onchange="prodSelect()"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
            </cfif>
            <cfif #url.a_trigger# eq "1">
              <OPTION VALUE="title" selected>Title</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "2">
              <OPTION VALUE="property" selected>Property</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "3">
              <OPTION VALUE="appraisal" selected>Appraisal</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "4">
              <OPTION VALUE="flood" selected>Flood</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "8">
              <OPTION VALUE="credit" selected>Credit</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "9">
              <OPTION VALUE="avm" selected>AVM</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "7">
              <OPTION VALUE="signing" selected>Signing</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "5">
              <OPTION VALUE="closing" selected>Closing</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <cfelse>
              <OPTION VALUE="all" selected>All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
            </cfif>
            </SELECT>
          </td>
        </tr>
      </table>
      <table width=350 cellpadding=1 cellspacing=1 border=0>
        <tr> <nobr>
          <td background="d3d3d3" width=350 align=center valign=top><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT FACE=verdana SIZE=1 color="black"> Month
            <SELECT NAME="oda_month"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
              <OPTION VALUE="NONE">N/A</OPTION>
              <option value="1">January</option>
              <option value="2">February</option>
              <option value="3">March</option>
              <option value="4">April</option>
              <option value="5">May</option>
              <option value="6">June</option>
              <option value="7">July</option>
              <option value="8">August</option>
              <option value="9">September</option>
              <option value="10">October</option>
              <option value="11">November</option>
              <option value="12">December</option>
            </SELECT>
            <FONT FACE=verdana SIZE=1 color="black"> Day
            <SELECT NAME="oda_day"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
              <OPTION VALUE="NONE">N/A</OPTION>
              <OPTION VALUE="1">01</OPTION>
              <OPTION VALUE="2">02</OPTION>
              <OPTION VALUE="3">03</OPTION>
              <OPTION VALUE="4">04</OPTION>
              <OPTION VALUE="5">05</OPTION>
              <OPTION VALUE="6">06</OPTION>
              <OPTION VALUE="7">07</OPTION>
              <OPTION VALUE="8">08</OPTION>
              <OPTION VALUE="9">09</OPTION>
              <OPTION VALUE="10">10</OPTION>
              <OPTION VALUE="11">11</OPTION>
              <OPTION VALUE="12">12</OPTION>
              <OPTION VALUE="13">13</OPTION>
              <OPTION VALUE="14">14</OPTION>
              <OPTION VALUE="15">15</OPTION>
              <OPTION VALUE="16">16</OPTION>
              <OPTION VALUE="17">17</OPTION>
              <OPTION VALUE="18">18</OPTION>
              <OPTION VALUE="19">19</OPTION>
              <OPTION VALUE="20">20</OPTION>
              <OPTION VALUE="21">21</OPTION>
              <OPTION VALUE="22">22</OPTION>
              <OPTION VALUE="23">23</OPTION>
              <OPTION VALUE="24">24</OPTION>
              <OPTION VALUE="25">25</OPTION>
              <OPTION VALUE="26">26</OPTION>
              <OPTION VALUE="27">27</OPTION>
              <OPTION VALUE="28">28</OPTION>
              <OPTION VALUE="29">29</OPTION>
              <OPTION VALUE="30">30</OPTION>
              <OPTION VALUE="31">31</OPTION>
            </SELECT>
            <FONT FACE=verdana SIZE=1 color="black"> Year
            <SELECT NAME="oda_year"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
              <OPTION VALUE="NONE">N/A</OPTION>
              <option value="2000">2000</option>
              <option value="2001">2001</option>
              <option value="2002">2002</option>
              <option value="2003">2003</option>
              <option value="2004">2004</option>
              <option value="2005">2005</option>
              <option value="2006">2006</option>
              <option value="2007">2007</option>
              <option value="2008">2008</option>
              <option value="2009">2009</option>
              <option value="2010">2010</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
		<OPTION VALUE="2016">2016</OPTION>
		<OPTION VALUE="2017">2017</OPTION>
		<OPTION VALUE="2018">2018</OPTION>
		<OPTION VALUE="2019">2019</OPTION>
		<OPTION VALUE="2020">2020</OPTION>
            </SELECT>
          </td>
          </nobr> </tr>
      </table>
      <table width=650 cellpadding=1 cellspacing=1 border=0>
        <tr>
          <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Title Number </td>
          <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="Title_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
              <OPTION VALUE="NONE">N/A</OPTION>
              <CFOUTPUT QUERY="read_titleid">
                <OPTION VALUE="#Title_ID#">#Title_ID#</OPTION>
              </CFOUTPUT>
            </SELECT>
          </td>
        </tr>
        <tr>
          <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Clients </td>
          <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="company_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
              <OPTION VALUE="NONE">N/A</OPTION>
              <CFOUTPUT QUERY="read_companies">
                <OPTION VALUE="#ID#">#Company#</OPTION>
              </CFOUTPUT>
            </SELECT>
          </td>
        </tr>
        <!--- ================================================== --->
        <tr>
          <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Loan Number - </td>
          <td background="d3d3d3" width=400 align=left valign=top><input type=text name="loan_number" size=15 maxlength=15
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
								>
          </td>
        </tr>
        <tr>
          <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Loan Processors </td>
          <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="user_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
              <OPTION VALUE="NONE">N/A</OPTION>
              <CFOUTPUT>
                <CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
                  <CFIF #a_rec_count[AAA]# NEQ "0">
                    <OPTION VALUE="NONE">------------------------------------</OPTION>
                    <OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
                    <CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
                      <cfset user_id = #users_id[AAA][BBB]#>
                      <OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#, #users_fname[AAA][BBB]#</OPTION>
                    </CFLOOP>
                    <OPTION VALUE="NONE"></OPTION>
                  </CFIF>
                </CFLOOP>
              </CFOUTPUT>
            </SELECT>
          </td>
        </tr>
        <!--- ================================================== --->
        <td bgcolor="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Status </td>
          <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="Appraisal_status"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
              <OPTION VALUE="NONE">N/A</OPTION>
              <option value="In Process" style="thin">In Process</OPTION>
              <option value="In Typing">In Typing</OPTION>
              <option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
              <option value="Report Faxed" style="thin" >Report Faxed</OPTION>
              <option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
            </SELECT>
          </td>
        </tr>
        <tr>
          <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Comments </td>
          <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="comments"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
              <OPTION VALUE="NONE">N/A</OPTION>
              <option value="Court House Closed">Court House Closed</OPTION>
              <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
              <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
              <option value="Call for Detail">Call for Detail</OPTION>
              <option value="Judgments Exist">Judgments Exist</OPTION>
              <option value="Subordination Needed">Subordination Needed</OPTION>
              <option value="Subordination Received">Subordination Received</OPTION>
              <option value="Vesting Issue">Vesting Issue</OPTION>
              <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
              <option value="Clear to Close">Clear to Close</OPTION>
              <option value="Cancelled per client">Cancelled per client</OPTION>
              <option value="Name/Address found not matching order">Name/Address found not matching order</OPTION>
            </SELECT>
          </td>
        </tr>
        <tr>
          <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Buyer First Name - </td>
          <td background="d3d3d3" width=400 align=left valign=top><input type=text name="buyer_fname" size=25 maxlength=15
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
								clear: none;" >
          </td>
        </tr>
        <!--- ================================================== --->
        <tr>
          <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Buyer Last Name - </td>
          <td background="d3d3d3" width=400 align=left valign=top><input type=text name="buyer_lname"  size=25 maxlength=25
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
								clear: none;" >
          </td>
        </tr>
        <tr>
          <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Sort By </td>
          <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="sortorder"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
              <OPTION VALUE="NONE">N/A</OPTION>
              <OPTION VALUE="check_date">Order Date</OPTION>
              <OPTION VALUE="Title_id">Order Number</OPTION>
              <OPTION VALUE="appraisal_status">Status</OPTION>
              <OPTION VALUE="User_ID">Loan Processor</OPTION>
            </SELECT>
          </td>
        </tr>
        <tr>
          <td background="d3d3d3" colspan=2 width=650 align=right valign=top><INPUT TYPE=image src="./images/button_search.gif" border=0>
          </td>
        </tr>
        </cfform>

        <!--- ======================================================================== --->
      </table></TD>
  </TR>
  <!--- ====================================================================== --->
  <!--- ====================================================================== --->
  <!--- ====================================================================== --->
  </TD>

  </TR>

</table>
<cfelseif #a_trigger# eq "5">
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
  <tr>
    <td width=780 align=left valign=top bgcolor=blue><FONT FACE=ARIAL SIZE=2 color="white">
      <CENTER>
        <B>Closing Request Search</B>
      </CENTER></TD>
  </TR>
  <CFFORM NAME="frm" ACTION="./title_rep_display.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=5" METHOD=POST>
    <INPUT type="hidden" name="update" value="no">
    <INPUT type="hidden" name="uid" value="URL.uid">
    <INPUT type="hidden" name="al" value="URL.al">
    <tr>

    <td width=780 align=center valign=top background="d3d3d3">

    <table width=350 cellpadding=1 cellspacing=1 border=0>
      <tr>
        <td background="d3d3d3" width=350 align=center valign=top><br>
          <FONT FACE=verdana SIZE=1 color="blUE"> <B>SELECT A PRODUCT</b> </td>
      </tr>
      <td background="d3d3d3" width=350 align=center valign=top><SELECT NAME="product"	onchange="prodSelect()"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
            <cfif #url.a_trigger# eq "1">
              <OPTION VALUE="title" selected>Title</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "2">
              <OPTION VALUE="property" selected>Property</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "3">
              <OPTION VALUE="appraisal" selected>Appraisal</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "4">
              <OPTION VALUE="flood" selected>Flood</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "8">
              <OPTION VALUE="credit" selected>Credit</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "9">
              <OPTION VALUE="avm" selected>AVM</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "7">
              <OPTION VALUE="signing" selected>Signing</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "5">
              <OPTION VALUE="closing" selected>Closing</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <cfelse>
              <OPTION VALUE="all" selected>All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
            </cfif>
          </SELECT>
        </td>
      </tr>
    </table>
    <table width=350 cellpadding=1 cellspacing=1 border=0>
      <tr> <nobr>
        <td background="d3d3d3" width=350 align=center valign=top><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT FACE=verdana SIZE=1 color="black"> Month
          <SELECT NAME="oda_month"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
            <OPTION VALUE="NONE">N/A</OPTION>
            <option value="1">January</option>
            <option value="2">February</option>
            <option value="3">March</option>
            <option value="4">April</option>
            <option value="5">May</option>
            <option value="6">June</option>
            <option value="7">July</option>
            <option value="8">August</option>
            <option value="9">September</option>
            <option value="10">October</option>
            <option value="11">November</option>
            <option value="12">December</option>
          </SELECT>
          <FONT FACE=verdana SIZE=1 color="black"> Day
          <SELECT NAME="oda_day"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
            <OPTION VALUE="NONE">N/A</OPTION>
            <OPTION VALUE="1">01</OPTION>
            <OPTION VALUE="2">02</OPTION>
            <OPTION VALUE="3">03</OPTION>
            <OPTION VALUE="4">04</OPTION>
            <OPTION VALUE="5">05</OPTION>
            <OPTION VALUE="6">06</OPTION>
            <OPTION VALUE="7">07</OPTION>
            <OPTION VALUE="8">08</OPTION>
            <OPTION VALUE="9">09</OPTION>
            <OPTION VALUE="10">10</OPTION>
            <OPTION VALUE="11">11</OPTION>
            <OPTION VALUE="12">12</OPTION>
            <OPTION VALUE="13">13</OPTION>
            <OPTION VALUE="14">14</OPTION>
            <OPTION VALUE="15">15</OPTION>
            <OPTION VALUE="16">16</OPTION>
            <OPTION VALUE="17">17</OPTION>
            <OPTION VALUE="18">18</OPTION>
            <OPTION VALUE="19">19</OPTION>
            <OPTION VALUE="20">20</OPTION>
            <OPTION VALUE="21">21</OPTION>
            <OPTION VALUE="22">22</OPTION>
            <OPTION VALUE="23">23</OPTION>
            <OPTION VALUE="24">24</OPTION>
            <OPTION VALUE="25">25</OPTION>
            <OPTION VALUE="26">26</OPTION>
            <OPTION VALUE="27">27</OPTION>
            <OPTION VALUE="28">28</OPTION>
            <OPTION VALUE="29">29</OPTION>
            <OPTION VALUE="30">30</OPTION>
            <OPTION VALUE="31">31</OPTION>
          </SELECT>
          <FONT FACE=verdana SIZE=1 color="black"> Year
          <SELECT NAME="oda_year"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
            <OPTION VALUE="NONE">N/A</OPTION>
            <option value="2000">2000</option>
            <option value="2001">2001</option>
            <option value="2002">2002</option>
            <option value="2003">2003</option>
            <option value="2004">2004</option>
            <option value="2005">2005</option>
            <option value="2006">2006</option>
            <option value="2007">2007</option>
            <option value="2008">2008</option>
            <option value="2009">2009</option>
            <option value="2010">2010</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
		<OPTION VALUE="2016">2016</OPTION>
		<OPTION VALUE="2017">2017</OPTION>
		<OPTION VALUE="2018">2018</OPTION>
		<OPTION VALUE="2019">2019</OPTION>
		<OPTION VALUE="2020">2020</OPTION>
          </SELECT>
        </td>
        </nobr> </tr>
    </table>
    <table width=650 cellpadding=1 cellspacing=1 border=0>

    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Title Closing Number </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="Title_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <CFOUTPUT QUERY="read_titleid_c">
            <OPTION VALUE="#Title_ID#">#Title_ID#</OPTION>
          </CFOUTPUT>
        </SELECT>
      </td>
    </tr>
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Loan Number - </td>
      <td background="d3d3d3" width=400 align=left valign=top><input type=text name="loan_number" size=15 maxlength=15
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
								>
      </td>
    </tr>
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Clients </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="company_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <CFOUTPUT QUERY="read_companies">
            <OPTION VALUE="#ID#">#Company#</OPTION>
          </CFOUTPUT>
        </SELECT>
      </td>
    </tr>
    <!--- ================================================== --->
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Loan Processors </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="user_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <CFOUTPUT>
            <CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
              <CFIF #a_rec_count[AAA]# NEQ "0">
                <OPTION VALUE="NONE">------------------------------------</OPTION>
                <OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
                <CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
                  <cfset user_id = #users_id[AAA][BBB]#>
                  <OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#, #users_fname[AAA][BBB]#</OPTION>
                </CFLOOP>
                <OPTION VALUE="NONE"></OPTION>
              </CFIF>
            </CFLOOP>
          </CFOUTPUT>
        </SELECT>
      </td>
    </tr>
    <!--- ================================================== --->
    <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Status </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="Appraisal_status"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <option value="Closing Requested" style="thin">Closing Requested</OPTION>
          <option value="Closer Assigned" style="thin">Closer Assigned</OPTION>
          <option value="Closing Submitted" style="thin">Closing Submitted</OPTION>
          <option value="Closing Scheduled" style="thin">Closing Scheduled</OPTION>
          <option value="Loan Closed" style="thin"> Loan Closed</OPTION>
          <option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
        </SELECT>
      </td>
    </tr>
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Comments </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="comments"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <option value="Court House Closed">Court House Closed</OPTION>
          <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
          <option value="In Typing">In Typing</OPTION>
          <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
          <option value="Call for Detail">Call for Detail</OPTION>
          <option value="Judgments Exist">Judgments Exist</OPTION>
          <option value="Subordination Needed">Subordination Needed</OPTION>
          <option value="Subordination Received">Subordination Received</OPTION>
          <option value="Vesting Issue">Vesting Issue</OPTION>
          <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
          <option value="Clear to Close">Clear to Close</OPTION>
          <option value="Name/Address found not matching order">Name/Address found not matching order</OPTION>
        </SELECT>
      </td>
    </tr>
    <tr>
      <!--- <td background="d3d3d3" width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Unfulfilled Events
						</td>

						<td background="d3d3d3" width=400 align=left valign=top>
							<SELECT NAME="events"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<OPTION VALUE="Abstracts Not Assigned">Abstracts Not Assigned</OPTION>
								<OPTION VALUE="Abstracts Not Received">Abstracts Not Received</OPTION>
								<OPTION VALUE="Payoffs Not Ordered">Payoffs Not Ordered</OPTION>
								<OPTION VALUE="Payoffs Not Received">Payoffs Not Received</OPTION>
								<OPTION VALUE="Title Ins Uncompleted">Title Ins Uncompleted</OPTION>
								<OPTION VALUE="Tax Cert Not Ordered">Tax Cert Not Ordered</OPTION>
								<OPTION VALUE="Tax Cert Not Completed">Tax Cert Not Completed</OPTION>
								<OPTION VALUE="Closing Req Not Ordered">Closing Req Not Ordered</OPTION>
								<OPTION VALUE="Closing Info Not Submitted">Closing Info Not Submitted</OPTION>

							</SELECT>
						</td> --->
    </tr>
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Buyer First Name - </td>
      <td background="d3d3d3" width=400 align=left valign=top><input type=text name="buyer_fname" size=25 maxlength=15
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
								clear: none;" >
      </td>
    </tr>
    <!--- ================================================== --->
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Buyer Last Name - </td>
      <td background="d3d3d3" width=400 align=left valign=top><input type=text name="buyer_lname"  size=25 maxlength=25
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
								clear: none;" >
      </td>
    </tr>
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Sort By </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="sortorder"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <OPTION VALUE="check_date">Order Date</OPTION>
          <OPTION VALUE="title_id">Order Number</OPTION>
          <OPTION VALUE="appraisal_status">Status</OPTION>
          <OPTION VALUE="User_ID">Loan Processor</OPTION>
        </SELECT>
      </td>
    </tr>
    <tr>
      <td background="d3d3d3" colspan=2 width=650 align=right valign=top><INPUT TYPE=image src="./images/button_search.gif" border=0>
      </td>
    </tr>
  </CFFORM>
  <!--- ======================================================================== --->
</table>
</TD>
</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
</TD>
</TR>
</table>
<cfelseif #a_trigger# eq 2>
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
  <tr>
    <td width=780 align=left valign=top bgcolor=purple><FONT FACE=ARIAL SIZE=2 color="white">
      <CENTER>
        <B>Property Report Search</B>
      </CENTER></TD>
  </TR>
  <CFFORM NAME="frm" ACTION="./title_rep_display.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=2" METHOD=POST>
    <INPUT type="hidden" name="update" value="no">
    <INPUT type="hidden" name="uid" value="URL.uid">
    <INPUT type="hidden" name="al" value="URL.al">
    <tr>

    <td width=780 align=center valign=top background="d3d3d3">

    <table width=350 cellpadding=1 cellspacing=1 border=0>
      <tr>
        <td background="d3d3d3" width=350 align=center valign=top><br>
          <FONT FACE=verdana SIZE=1 color="blUE"> <B>SELECT A PRODUCT</b> </td>
      </tr>
      <td background="d3d3d3" width=350 align=center valign=top><SELECT NAME="product"	onchange="prodSelect()"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
            <cfif #url.a_trigger# eq "1">
              <OPTION VALUE="title" selected>Title</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "2">
              <OPTION VALUE="property" selected>Property</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "3">
              <OPTION VALUE="appraisal" selected>Appraisal</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "4">
              <OPTION VALUE="flood" selected>Flood</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "8">
              <OPTION VALUE="credit" selected>Credit</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "9">
              <OPTION VALUE="avm" selected>AVM</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "7">
              <OPTION VALUE="signing" selected>Signing</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "5">
              <OPTION VALUE="closing" selected>Closing</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <cfelse>
              <OPTION VALUE="all" selected>All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
            </cfif>
          </SELECT>
        </td>
      </tr>
    </table>
    <table width=350 cellpadding=1 cellspacing=1 border=0>
      <tr> <nobr>
        <td background="d3d3d3" width=350 align=center valign=top><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT FACE=verdana SIZE=1 color="black"> Month
          <SELECT NAME="oda_month"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
            <OPTION VALUE="NONE">N/A</OPTION>
            <option value="1">January</option>
            <option value="2">February</option>
            <option value="3">March</option>
            <option value="4">April</option>
            <option value="5">May</option>
            <option value="6">June</option>
            <option value="7">July</option>
            <option value="8">August</option>
            <option value="9">September</option>
            <option value="10">October</option>
            <option value="11">November</option>
            <option value="12">December</option>
          </SELECT>
          <FONT FACE=verdana SIZE=1 color="black"> Day
          <SELECT NAME="oda_day"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
            <OPTION VALUE="NONE">N/A</OPTION>
            <OPTION VALUE="1">01</OPTION>
            <OPTION VALUE="2">02</OPTION>
            <OPTION VALUE="3">03</OPTION>
            <OPTION VALUE="4">04</OPTION>
            <OPTION VALUE="5">05</OPTION>
            <OPTION VALUE="6">06</OPTION>
            <OPTION VALUE="7">07</OPTION>
            <OPTION VALUE="8">08</OPTION>
            <OPTION VALUE="9">09</OPTION>
            <OPTION VALUE="10">10</OPTION>
            <OPTION VALUE="11">11</OPTION>
            <OPTION VALUE="12">12</OPTION>
            <OPTION VALUE="13">13</OPTION>
            <OPTION VALUE="14">14</OPTION>
            <OPTION VALUE="15">15</OPTION>
            <OPTION VALUE="16">16</OPTION>
            <OPTION VALUE="17">17</OPTION>
            <OPTION VALUE="18">18</OPTION>
            <OPTION VALUE="19">19</OPTION>
            <OPTION VALUE="20">20</OPTION>
            <OPTION VALUE="21">21</OPTION>
            <OPTION VALUE="22">22</OPTION>
            <OPTION VALUE="23">23</OPTION>
            <OPTION VALUE="24">24</OPTION>
            <OPTION VALUE="25">25</OPTION>
            <OPTION VALUE="26">26</OPTION>
            <OPTION VALUE="27">27</OPTION>
            <OPTION VALUE="28">28</OPTION>
            <OPTION VALUE="29">29</OPTION>
            <OPTION VALUE="30">30</OPTION>
            <OPTION VALUE="31">31</OPTION>
          </SELECT>
          <FONT FACE=verdana SIZE=1 color="black"> Year
          <SELECT NAME="oda_year"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
            <OPTION VALUE="NONE">N/A</OPTION>
            <option value="2000">2000</option>
            <option value="2001">2001</option>
            <option value="2002">2002</option>
            <option value="2003">2003</option>
            <option value="2004">2004</option>
            <option value="2005">2005</option>
            <option value="2006">2006</option>
            <option value="2007">2007</option>
            <option value="2008">2008</option>
            <option value="2009">2009</option>
<option value="2010">2010</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
		<OPTION VALUE="2016">2016</OPTION>
		<OPTION VALUE="2017">2017</OPTION>
		<OPTION VALUE="2018">2018</OPTION>
		<OPTION VALUE="2019">2019</OPTION>
		<OPTION VALUE="2020">2020</OPTION>
         </SELECT>
        </td>
        </nobr> </tr>
    </table>
    <table width=650 cellpadding=1 cellspacing=1 border=0>

    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Property Number </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="prop_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <CFOUTPUT QUERY="read_titleid_p">
            <OPTION VALUE="#prop_ID#">#prop_ID#</OPTION>
          </CFOUTPUT>
        </SELECT>
      </td>
    </tr>
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Loan Number - </td>
      <td background="d3d3d3" width=400 align=left valign=top><input type=text name="loan_number" size=15 maxlength=15
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
								>
      </td>
    </tr>
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Clients </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="company_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <CFOUTPUT QUERY="read_companies">
            <OPTION VALUE="#ID#">#Company#</OPTION>
          </CFOUTPUT>
        </SELECT>
      </td>
    </tr>
    <!--- ================================================== --->
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Loan Processors </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="user_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <CFOUTPUT>
            <CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
              <CFIF #a_rec_count[AAA]# NEQ "0">
                <OPTION VALUE="NONE">------------------------------------</OPTION>
                <OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
                <CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
                  <cfset user_id = #users_id[AAA][BBB]#>
                  <OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#, #users_fname[AAA][BBB]#</OPTION>
                </CFLOOP>
                <OPTION VALUE="NONE"></OPTION>
              </CFIF>
            </CFLOOP>
          </CFOUTPUT>
        </SELECT>
      </td>
    </tr>
    <!--- ================================================== --->
    <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Status </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="Appraisal_status"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <option value="In Process" style="thin">In Process</OPTION>
          <option value="In Typing">In Typing</OPTION>
          <option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
          <option value="Report Faxed" style="thin" >Report Faxed</OPTION>
          <option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
        </SELECT>
      </td>
    </tr>
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Comments </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="comments"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <option value="Court House Closed">Court House Closed</OPTION>
          <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
          <option value="In Typing">In Typing</OPTION>
          <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
          <option value="Call for Detail">Call for Detail</OPTION>
          <option value="Judgments Exist">Judgments Exist</OPTION>
          <option value="Subordination Needed">Subordination Needed</OPTION>
          <option value="Subordination Received">Subordination Received</OPTION>
          <option value="Vesting Issue">Vesting Issue</OPTION>
          <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
          <option value="Clear to Close">Clear to Close</OPTION>
          <option value="Name/Address found not matching order">Name/Address found not matching order</OPTION>
        </SELECT>
      </td>
    </tr>
    <tr>
      <!--- <td background="d3d3d3" width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Unfulfilled Events
						</td>

						<td background="d3d3d3" width=400 align=left valign=top>
							<SELECT NAME="events"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<OPTION VALUE="Abstracts Not Assigned">Abstracts Not Assigned</OPTION>
								<OPTION VALUE="Abstracts Not Received">Abstracts Not Received</OPTION>
								<OPTION VALUE="Payoffs Not Ordered">Payoffs Not Ordered</OPTION>
								<OPTION VALUE="Payoffs Not Received">Payoffs Not Received</OPTION>
								<OPTION VALUE="Title Ins Uncompleted">Title Ins Uncompleted</OPTION>
								<OPTION VALUE="Tax Cert Not Ordered">Tax Cert Not Ordered</OPTION>
								<OPTION VALUE="Tax Cert Not Completed">Tax Cert Not Completed</OPTION>
								<OPTION VALUE="Closing Req Not Ordered">Closing Req Not Ordered</OPTION>
								<OPTION VALUE="Closing Info Not Submitted">Closing Info Not Submitted</OPTION>

							</SELECT>
						</td> --->
    </tr>
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Buyer First Name - </td>
      <td background="d3d3d3" width=400 align=left valign=top><input type=text name="buyer_fname" size=25 maxlength=15
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
								clear: none;" >
      </td>
    </tr>
    <!--- ================================================== --->
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Buyer Last Name - </td>
      <td background="d3d3d3" width=400 align=left valign=top><input type=text name="buyer_lname"  size=25 maxlength=25
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
								clear: none;" >
      </td>
    </tr>
    </tr>

    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Sort By </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="sortorder"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <OPTION VALUE="check_date">Order Date</OPTION>
          <OPTION VALUE="prop_id">Order Number</OPTION>
          <OPTION VALUE="appraisal_status">Status</OPTION>
          <OPTION VALUE="User_ID">Loan Processor</OPTION>
        </SELECT>
      </td>
    </tr>
    <tr>
      <td background="d3d3d3" colspan=2 width=650 align=right valign=top><INPUT TYPE=image src="./images/button_search.gif" border=0>
      </td>
    </tr>
  </CFFORM>
  <!--- ======================================================================== --->
</table>
</TD>
</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
</TD>
</TR>
</table>
<cfelseif #a_trigger# eq 3>
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
  <tr>
    <td width=780 align=left valign=top bgcolor=navy><FONT FACE=ARIAL SIZE=2 color="white">
      <CENTER>
        <B>Appraisal Report Search</B>
      </CENTER></TD>
  </TR>
  <CFFORM NAME="frm" ACTION="./title_rep_display.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=3" METHOD=POST>
    <INPUT type="hidden" name="update" value="no">
    <INPUT type="hidden" name="uid" value="URL.uid">
    <INPUT type="hidden" name="al" value="URL.al">
    <tr>

    <td width=780 align=center valign=top background="d3d3d3">

    <table width=350 cellpadding=1 cellspacing=1 border=0>
      <tr>
        <td background="d3d3d3" width=350 align=center valign=top><br>
          <FONT FACE=verdana SIZE=1 color="blUE"> <B>SELECT A PRODUCT</b> </td>
      </tr>
      <td background="d3d3d3" width=350 align=center valign=top><SELECT NAME="product"	onchange="prodSelect()"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
            <cfif #url.a_trigger# eq "1">
              <OPTION VALUE="title" selected>Title</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "2">
              <OPTION VALUE="property" selected>Property</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "3">
              <OPTION VALUE="appraisal" selected>Appraisal</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "4">
              <OPTION VALUE="flood" selected>Flood</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "8">
              <OPTION VALUE="credit" selected>Credit</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "9">
              <OPTION VALUE="avm" selected>AVM</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "7">
              <OPTION VALUE="signing" selected>Signing</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "5">
              <OPTION VALUE="closing" selected>Closing</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <cfelse>
              <OPTION VALUE="all" selected>All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
            </cfif>
          </SELECT>
        </td>
      </tr>
    </table>
    <table width=350 cellpadding=1 cellspacing=1 border=0>
      <tr> <nobr>
        <td background="d3d3d3" width=350 align=center valign=top><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT FACE=verdana SIZE=1 color="black"> Month
          <SELECT NAME="oda_month"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
            <OPTION VALUE="NONE">N/A</OPTION>
            <option value="1">January</option>
            <option value="2">February</option>
            <option value="3">March</option>
            <option value="4">April</option>
            <option value="5">May</option>
            <option value="6">June</option>
            <option value="7">July</option>
            <option value="8">August</option>
            <option value="9">September</option>
            <option value="10">October</option>
            <option value="11">November</option>
            <option value="12">December</option>
          </SELECT>
          <FONT FACE=verdana SIZE=1 color="black"> Day
          <SELECT NAME="oda_day"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
            <OPTION VALUE="NONE">N/A</OPTION>
            <OPTION VALUE="1">01</OPTION>
            <OPTION VALUE="2">02</OPTION>
            <OPTION VALUE="3">03</OPTION>
            <OPTION VALUE="4">04</OPTION>
            <OPTION VALUE="5">05</OPTION>
            <OPTION VALUE="6">06</OPTION>
            <OPTION VALUE="7">07</OPTION>
            <OPTION VALUE="8">08</OPTION>
            <OPTION VALUE="9">09</OPTION>
            <OPTION VALUE="10">10</OPTION>
            <OPTION VALUE="11">11</OPTION>
            <OPTION VALUE="12">12</OPTION>
            <OPTION VALUE="13">13</OPTION>
            <OPTION VALUE="14">14</OPTION>
            <OPTION VALUE="15">15</OPTION>
            <OPTION VALUE="16">16</OPTION>
            <OPTION VALUE="17">17</OPTION>
            <OPTION VALUE="18">18</OPTION>
            <OPTION VALUE="19">19</OPTION>
            <OPTION VALUE="20">20</OPTION>
            <OPTION VALUE="21">21</OPTION>
            <OPTION VALUE="22">22</OPTION>
            <OPTION VALUE="23">23</OPTION>
            <OPTION VALUE="24">24</OPTION>
            <OPTION VALUE="25">25</OPTION>
            <OPTION VALUE="26">26</OPTION>
            <OPTION VALUE="27">27</OPTION>
            <OPTION VALUE="28">28</OPTION>
            <OPTION VALUE="29">29</OPTION>
            <OPTION VALUE="30">30</OPTION>
            <OPTION VALUE="31">31</OPTION>
          </SELECT>
          <FONT FACE=verdana SIZE=1 color="black"> Year
          <SELECT NAME="oda_year"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
            <OPTION VALUE="NONE">N/A</OPTION>
            <option value="2000">2000</option>
            <option value="2001">2001</option>
            <option value="2002">2002</option>
            <option value="2003">2003</option>
            <option value="2004">2004</option>
            <option value="2005">2005</option>
            <option value="2006">2006</option>
            <option value="2007">2007</option>
            <option value="2008">2008</option>
            <option value="2009">2009</option>
            <option value="2010">2010</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
		<OPTION VALUE="2016">2016</OPTION>
		<OPTION VALUE="2017">2017</OPTION>
		<OPTION VALUE="2018">2018</OPTION>
		<OPTION VALUE="2019">2019</OPTION>
		<OPTION VALUE="2020">2020</OPTION>
          </SELECT>
        </td>
        </nobr> </tr>
    </table>
    <table width=650 cellpadding=1 cellspacing=1 border=0>

    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Appraisal Number </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="app_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <CFOUTPUT QUERY="read_titleid_a">
            <OPTION VALUE="#app_ID#">#app_ID#</OPTION>
          </CFOUTPUT>
        </SELECT>
      </td>
    </tr>
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Loan Number - </td>
      <td background="d3d3d3" width=400 align=left valign=top><input type=text name="loan_number" size=15 maxlength=15
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
								>
      </td>
    </tr>
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Clients </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="company_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <CFOUTPUT QUERY="read_companies">
            <OPTION VALUE="#ID#">#Company#</OPTION>
          </CFOUTPUT>
        </SELECT>
      </td>
    </tr>
    <!--- ================================================== --->
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Loan Processors </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="user_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <CFOUTPUT>
            <CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
              <CFIF #a_rec_count[AAA]# NEQ "0">
                <OPTION VALUE="NONE">------------------------------------</OPTION>
                <OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
                <CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
                  <cfset user_id = #users_id[AAA][BBB]#>
                  <OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#, #users_fname[AAA][BBB]#</OPTION>
                </CFLOOP>
                <OPTION VALUE="NONE"></OPTION>
              </CFIF>
            </CFLOOP>
          </CFOUTPUT>
        </SELECT>
      </td>
    </tr>
    <!--- ================================================== --->
    <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Status </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="Appraisal_status"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <option value="In Process" style="thin">In Process</OPTION>
          <option value="In Typing">In Typing</OPTION>
          <option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
          <option value="Report Faxed" style="thin" >Report Faxed</OPTION>
          <option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
        </SELECT>
      </td>
    </tr>
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Comments </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="comments"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <option value="Court House Closed">Court House Closed</OPTION>
          <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
          <option value="In Typing">In Typing</OPTION>
          <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
          <option value="Call for Detail">Call for Detail</OPTION>
          <option value="Judgments Exist">Judgments Exist</OPTION>
          <option value="Subordination Needed">Subordination Needed</OPTION>
          <option value="Subordination Received">Subordination Received</OPTION>
          <option value="Vesting Issue">Vesting Issue</OPTION>
          <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
          <option value="Clear to Close">Clear to Close</OPTION>
          <option value="Name/Address found not matching order">Name/Address found not matching order</OPTION>
        </SELECT>
      </td>
    </tr>
    <tr> </tr>
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Buyer First Name - </td>
      <td background="d3d3d3" width=400 align=left valign=top><input type=text name="buyer_fname" size=25 maxlength=15
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
								clear: none;" >
      </td>
    </tr>
    <!--- ================================================== --->
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Buyer Last Name - </td>
      <td background="d3d3d3" width=400 align=left valign=top><input type=text name="buyer_lname"  size=25 maxlength=25
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
								clear: none;" >
      </td>
    </tr>
    </tr>

    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Sort By </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="sortorder"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <OPTION VALUE="check_date">Order Date</OPTION>
          <OPTION VALUE="app_id">Order Number</OPTION>
          <OPTION VALUE="appraisal_status">Status</OPTION>
          <OPTION VALUE="User_ID">Loan Processor</OPTION>
        </SELECT>
      </td>
    </tr>
    <tr>
      <td background="d3d3d3" colspan=2 width=650 align=right valign=top><INPUT TYPE=image src="./images/button_search.gif" border=0>
      </td>
    </tr>
  </CFFORM>
  <!--- ======================================================================== --->
</table>
</TD>
</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
</TD>
</TR>
</table>
<cfelseif #a_trigger# eq 4>
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
  <tr>
    <td width=780 align=left valign=top bgcolor=black><FONT FACE=ARIAL SIZE=2 color="white">
      <CENTER>
        <B>Flood Report Search</B>
      </CENTER></TD>
  </TR>
  <CFFORM NAME="frm" ACTION="./title_rep_display.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=4" METHOD=POST>
    <INPUT type="hidden" name="update" value="no">
    <INPUT type="hidden" name="uid" value="URL.uid">
    <INPUT type="hidden" name="al" value="URL.al">
    <tr>

    <td width=780 align=center valign=top background="d3d3d3">

    <table width=350 cellpadding=1 cellspacing=1 border=0>
      <tr>
        <td background="d3d3d3" width=350 align=center valign=top><br>
          <FONT FACE=verdana SIZE=1 color="blUE"> <B>SELECT A PRODUCT</b> </td>
      </tr>
      <td background="d3d3d3" width=350 align=center valign=top><SELECT NAME="product"	onchange="prodSelect()"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
            <cfif #url.a_trigger# eq "1">
              <OPTION VALUE="title" selected>Title</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "2">
              <OPTION VALUE="property" selected>Property</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "3">
              <OPTION VALUE="appraisal" selected>Appraisal</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "4">
              <OPTION VALUE="flood" selected>Flood</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "8">
              <OPTION VALUE="credit" selected>Credit</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "9">
              <OPTION VALUE="avm" selected>AVM</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "7">
              <OPTION VALUE="signing" selected>Signing</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "5">
              <OPTION VALUE="closing" selected>Closing</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <cfelse>
              <OPTION VALUE="all" selected>All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
            </cfif>
          </SELECT>
        </td>
      </tr>
    </table>
    <table width=350 cellpadding=1 cellspacing=1 border=0>
      <tr> <nobr>
        <td background="d3d3d3" width=350 align=center valign=top><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT FACE=verdana SIZE=1 color="black"> Month
          <SELECT NAME="oda_month"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
            <OPTION VALUE="NONE">N/A</OPTION>
            <option value="1">January</option>
            <option value="2">February</option>
            <option value="3">March</option>
            <option value="4">April</option>
            <option value="5">May</option>
            <option value="6">June</option>
            <option value="7">July</option>
            <option value="8">August</option>
            <option value="9">September</option>
            <option value="10">October</option>
            <option value="11">November</option>
            <option value="12">December</option>
          </SELECT>
          <FONT FACE=verdana SIZE=1 color="black"> Day
          <SELECT NAME="oda_day"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
            <OPTION VALUE="NONE">N/A</OPTION>
            <OPTION VALUE="1">01</OPTION>
            <OPTION VALUE="2">02</OPTION>
            <OPTION VALUE="3">03</OPTION>
            <OPTION VALUE="4">04</OPTION>
            <OPTION VALUE="5">05</OPTION>
            <OPTION VALUE="6">06</OPTION>
            <OPTION VALUE="7">07</OPTION>
            <OPTION VALUE="8">08</OPTION>
            <OPTION VALUE="9">09</OPTION>
            <OPTION VALUE="10">10</OPTION>
            <OPTION VALUE="11">11</OPTION>
            <OPTION VALUE="12">12</OPTION>
            <OPTION VALUE="13">13</OPTION>
            <OPTION VALUE="14">14</OPTION>
            <OPTION VALUE="15">15</OPTION>
            <OPTION VALUE="16">16</OPTION>
            <OPTION VALUE="17">17</OPTION>
            <OPTION VALUE="18">18</OPTION>
            <OPTION VALUE="19">19</OPTION>
            <OPTION VALUE="20">20</OPTION>
            <OPTION VALUE="21">21</OPTION>
            <OPTION VALUE="22">22</OPTION>
            <OPTION VALUE="23">23</OPTION>
            <OPTION VALUE="24">24</OPTION>
            <OPTION VALUE="25">25</OPTION>
            <OPTION VALUE="26">26</OPTION>
            <OPTION VALUE="27">27</OPTION>
            <OPTION VALUE="28">28</OPTION>
            <OPTION VALUE="29">29</OPTION>
            <OPTION VALUE="30">30</OPTION>
            <OPTION VALUE="31">31</OPTION>
          </SELECT>
          <FONT FACE=verdana SIZE=1 color="black"> Year
          <SELECT NAME="oda_year"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
            <OPTION VALUE="NONE">N/A</OPTION>
            <option value="2000">2000</option>
            <option value="2001">2001</option>
            <option value="2002">2002</option>
            <option value="2003">2003</option>
            <option value="2004">2004</option>
            <option value="2005">2005</option>
            <option value="2006">2006</option>
            <option value="2007">2007</option>
            <option value="2008">2008</option>
            <option value="2009">2009</option>
            <option value="2010">2010</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
		<OPTION VALUE="2016">2016</OPTION>
		<OPTION VALUE="2017">2017</OPTION>
		<OPTION VALUE="2018">2018</OPTION>
		<OPTION VALUE="2019">2019</OPTION>
		<OPTION VALUE="2020">2020</OPTION>
          </SELECT>
        </td>
        </nobr> </tr>
    </table>
    <table width=650 cellpadding=1 cellspacing=1 border=0>

    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Flood Number </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="anc_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <CFOUTPUT QUERY="read_titleid_anc">
            <OPTION VALUE="#anc_ID#">#anc_ID#</OPTION>
          </CFOUTPUT>
        </SELECT>
      </td>
    </tr>
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Loan Number - </td>
      <td background="d3d3d3" width=400 align=left valign=top><input type=text name="loan_number" size=15 maxlength=15
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
								>
      </td>
    </tr>
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Clients </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="company_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <CFOUTPUT QUERY="read_companies">
            <OPTION VALUE="#ID#">#Company#</OPTION>
          </CFOUTPUT>
        </SELECT>
      </td>
    </tr>
    <!--- ================================================== --->
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Loan Processors </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="user_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <CFOUTPUT>
            <CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
              <CFIF #a_rec_count[AAA]# NEQ "0">
                <OPTION VALUE="NONE">------------------------------------</OPTION>
                <OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
                <CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
                  <cfset user_id = #users_id[AAA][BBB]#>
                  <OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#, #users_fname[AAA][BBB]#</OPTION>
                </CFLOOP>
                <OPTION VALUE="NONE"></OPTION>
              </CFIF>
            </CFLOOP>
          </CFOUTPUT>
        </SELECT>
      </td>
    </tr>
    <!--- ================================================== --->
    <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Status </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="Appraisal_status"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <option value="In Process" style="thin">In Process</OPTION>
          <option value="In Typing">In Typing</OPTION>
          <option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
          <option value="Report Faxed" style="thin" >Report Faxed</OPTION>
          <option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
        </SELECT>
      </td>
    </tr>
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Comments </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="comments"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <option value="Court House Closed">Court House Closed</OPTION>
          <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
          <option value="In Typing">In Typing</OPTION>
          <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
          <option value="Call for Detail">Call for Detail</OPTION>
          <option value="Judgments Exist">Judgments Exist</OPTION>
          <option value="Subordination Needed">Subordination Needed</OPTION>
          <option value="Subordination Received">Subordination Received</OPTION>
          <option value="Vesting Issue">Vesting Issue</OPTION>
          <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
          <option value="Clear to Close">Clear to Close</OPTION>
          <option value="Name/Address found not matching order">Name/Address found not matching order</OPTION>
        </SELECT>
      </td>
    </tr>
    <tr> </tr>
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Buyer First Name - </td>
      <td background="d3d3d3" width=400 align=left valign=top><input type=text name="buyer_fname" size=25 maxlength=15
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
								clear: none;" >
      </td>
    </tr>
    <!--- ================================================== --->
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Buyer Last Name - </td>
      <td background="d3d3d3" width=400 align=left valign=top><input type=text name="buyer_lname"  size=25 maxlength=25
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
								clear: none;" >
      </td>
    </tr>
    </tr>

    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Sort By </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="sortorder"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <OPTION VALUE="check_date">Order Date</OPTION>
          <OPTION VALUE="anc_id">Order Number</OPTION>
          <OPTION VALUE="appraisal_status">Status</OPTION>
          <OPTION VALUE="User_ID">Loan Processor</OPTION>
        </SELECT>
      </td>
    </tr>
    <tr>
      <td background="d3d3d3" colspan=2 width=650 align=right valign=top><INPUT TYPE=image src="./images/button_search.gif" border=0>
      </td>
    </tr>
  </CFFORM>
  <!--- ======================================================================== --->
</table>
</TD>
</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
</TD>
</TR>
</table>
<cfelseif #a_trigger# eq 9>
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
  <tr>
    <td width=780 align=left valign=top bgcolor=red><FONT FACE=ARIAL SIZE=2 color="white">
      <CENTER>
        <B>AVM Report Search</B>
      </CENTER></TD>
  </TR>
  <CFFORM NAME="frm" ACTION="./title_rep_display.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=9" METHOD=POST>
    <INPUT type="hidden" name="update" value="no">
    <INPUT type="hidden" name="uid" value="URL.uid">
    <INPUT type="hidden" name="al" value="URL.al">
    <tr>

    <td width=780 align=center valign=top background="d3d3d3">

    <table width=350 cellpadding=1 cellspacing=1 border=0>
      <tr>
        <td background="d3d3d3" width=350 align=center valign=top><br>
          <FONT FACE=verdana SIZE=1 color="blUE"> <B>SELECT A PRODUCT</b> </td>
      </tr>
      <td background="d3d3d3" width=350 align=center valign=top><SELECT NAME="product"	onchange="prodSelect()"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
            <cfif #url.a_trigger# eq "1">
              <OPTION VALUE="title" selected>Title</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "2">
              <OPTION VALUE="property" selected>Property</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "3">
              <OPTION VALUE="appraisal" selected>Appraisal</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "4">
              <OPTION VALUE="flood" selected>Flood</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "8">
              <OPTION VALUE="credit" selected>Credit</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "9">
              <OPTION VALUE="avm" selected>AVM</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "7">
              <OPTION VALUE="signing" selected>Signing</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "5">
              <OPTION VALUE="closing" selected>Closing</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <cfelse>
              <OPTION VALUE="all" selected>All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
            </cfif>
          </SELECT>
        </td>
      </tr>
    </table>
    <table width=350 cellpadding=1 cellspacing=1 border=0>
      <tr> <nobr>
        <td background="d3d3d3" width=350 align=center valign=top><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT FACE=verdana SIZE=1 color="black"> Month
          <SELECT NAME="oda_month"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
            <OPTION VALUE="NONE">N/A</OPTION>
            <option value="1">January</option>
            <option value="2">February</option>
            <option value="3">March</option>
            <option value="4">April</option>
            <option value="5">May</option>
            <option value="6">June</option>
            <option value="7">July</option>
            <option value="8">August</option>
            <option value="9">September</option>
            <option value="10">October</option>
            <option value="11">November</option>
            <option value="12">December</option>
          </SELECT>
          <FONT FACE=verdana SIZE=1 color="black"> Day
          <SELECT NAME="oda_day"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
            <OPTION VALUE="NONE">N/A</OPTION>
            <OPTION VALUE="1">01</OPTION>
            <OPTION VALUE="2">02</OPTION>
            <OPTION VALUE="3">03</OPTION>
            <OPTION VALUE="4">04</OPTION>
            <OPTION VALUE="5">05</OPTION>
            <OPTION VALUE="6">06</OPTION>
            <OPTION VALUE="7">07</OPTION>
            <OPTION VALUE="8">08</OPTION>
            <OPTION VALUE="9">09</OPTION>
            <OPTION VALUE="10">10</OPTION>
            <OPTION VALUE="11">11</OPTION>
            <OPTION VALUE="12">12</OPTION>
            <OPTION VALUE="13">13</OPTION>
            <OPTION VALUE="14">14</OPTION>
            <OPTION VALUE="15">15</OPTION>
            <OPTION VALUE="16">16</OPTION>
            <OPTION VALUE="17">17</OPTION>
            <OPTION VALUE="18">18</OPTION>
            <OPTION VALUE="19">19</OPTION>
            <OPTION VALUE="20">20</OPTION>
            <OPTION VALUE="21">21</OPTION>
            <OPTION VALUE="22">22</OPTION>
            <OPTION VALUE="23">23</OPTION>
            <OPTION VALUE="24">24</OPTION>
            <OPTION VALUE="25">25</OPTION>
            <OPTION VALUE="26">26</OPTION>
            <OPTION VALUE="27">27</OPTION>
            <OPTION VALUE="28">28</OPTION>
            <OPTION VALUE="29">29</OPTION>
            <OPTION VALUE="30">30</OPTION>
            <OPTION VALUE="31">31</OPTION>
          </SELECT>
          <FONT FACE=verdana SIZE=1 color="black"> Year
          <SELECT NAME="oda_year"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
            <OPTION VALUE="NONE">N/A</OPTION>
            <option value="2000">2000</option>
            <option value="2001">2001</option>
            <option value="2002">2002</option>
            <option value="2003">2003</option>
            <option value="2004">2004</option>
            <option value="2005">2005</option>
            <option value="2006">2006</option>
            <option value="2007">2007</option>
            <option value="2008">2008</option>
            <option value="2009">2009</option>
            <option value="2010">2010</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
		<OPTION VALUE="2016">2016</OPTION>
		<OPTION VALUE="2017">2017</OPTION>
		<OPTION VALUE="2018">2018</OPTION>
		<OPTION VALUE="2019">2019</OPTION>
		<OPTION VALUE="2020">2020</OPTION>
          </SELECT>
        </td>
        </nobr> </tr>
    </table>
    <table width=650 cellpadding=1 cellspacing=1 border=0>

    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> AVM Number </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="avm_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <CFOUTPUT QUERY="read_titleid_avm">
            <OPTION VALUE="#anc_ID#">#anc_ID#</OPTION>
          </CFOUTPUT>
        </SELECT>
      </td>
    </tr>
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Loan Number - </td>
      <td background="d3d3d3" width=400 align=left valign=top><input type=text name="loan_number" size=15 maxlength=15
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
								>
      </td>
    </tr>
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Clients </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="company_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <CFOUTPUT QUERY="read_companies">
            <OPTION VALUE="#ID#">#Company#</OPTION>
          </CFOUTPUT>
        </SELECT>
      </td>
    </tr>
    <!--- ================================================== --->
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Loan Processors </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="user_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <CFOUTPUT>
            <CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
              <CFIF #a_rec_count[AAA]# NEQ "0">
                <OPTION VALUE="NONE">------------------------------------</OPTION>
                <OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
                <CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
                  <cfset user_id = #users_id[AAA][BBB]#>
                  <OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#, #users_fname[AAA][BBB]#</OPTION>
                </CFLOOP>
                <OPTION VALUE="NONE"></OPTION>
              </CFIF>
            </CFLOOP>
          </CFOUTPUT>
        </SELECT>
      </td>
    </tr>
    <!--- ================================================== --->
    <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Status </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="Appraisal_status"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <option value="In Process" style="thin">In Process</OPTION>
          <option value="In Typing">In Typing</OPTION>
          <option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
          <option value="Report Faxed" style="thin" >Report Faxed</OPTION>
          <option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
        </SELECT>
      </td>
    </tr>
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Comments </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="comments"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <option value="Court House Closed">Court House Closed</OPTION>
          <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
          <option value="In Typing">In Typing</OPTION>
          <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
          <option value="Call for Detail">Call for Detail</OPTION>
          <option value="Judgments Exist">Judgments Exist</OPTION>
          <option value="Subordination Needed">Subordination Needed</OPTION>
          <option value="Subordination Received">Subordination Received</OPTION>
          <option value="Vesting Issue">Vesting Issue</OPTION>
          <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
          <option value="Clear to Close">Clear to Close</OPTION>
          <option value="Name/Address found not matching order">Name/Address found not matching order</OPTION>
        </SELECT>
      </td>
    </tr>
    <tr> </tr>
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Buyer First Name - </td>
      <td background="d3d3d3" width=400 align=left valign=top><input type=text name="buyer_fname" size=25 maxlength=15
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
								clear: none;" >
      </td>
    </tr>
    <!--- ================================================== --->
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Buyer Last Name - </td>
      <td background="d3d3d3" width=400 align=left valign=top><input type=text name="buyer_lname"  size=25 maxlength=25
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
								clear: none;" >
      </td>
    </tr>
    </tr>

    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Sort By </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="sortorder"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <OPTION VALUE="check_date">Order Date</OPTION>
          <OPTION VALUE="anc_id">Order Number</OPTION>
          <OPTION VALUE="appraisal_status">Status</OPTION>
          <OPTION VALUE="User_ID">Loan Processor</OPTION>
        </SELECT>
      </td>
    </tr>
    <tr>
      <td background="d3d3d3" colspan=2 width=650 align=right valign=top><INPUT TYPE=image src="./images/button_search.gif" border=0>
      </td>
    </tr>
  </CFFORM>
  <!--- ======================================================================== --->
</table>
</TD>
</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
</TD>
</TR>
</table>
<cfelseif #a_trigger# eq 8>
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
  <tr>
    <td width=780 align=left valign=top bgcolor=brown><FONT FACE=ARIAL SIZE=2 color="white">
      <CENTER>
        <B>Credit Report Search</B>
      </CENTER></TD>
  </TR>
  <CFFORM NAME="frm" ACTION="./title_rep_display.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=8" METHOD=POST>
    <INPUT type="hidden" name="update" value="no">
    <INPUT type="hidden" name="uid" value="URL.uid">
    <INPUT type="hidden" name="al" value="URL.al">
    <tr>

    <td width=780 align=center valign=top background="d3d3d3">

    <table width=350 cellpadding=1 cellspacing=1 border=0>
      <tr>
        <td background="d3d3d3" width=350 align=center valign=top><br>
          <FONT FACE=verdana SIZE=1 color="blUE"> <B>SELECT A PRODUCT</b> </td>
      </tr>
      <td background="d3d3d3" width=350 align=center valign=top><SELECT NAME="product"	onchange="prodSelect()"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
            <cfif #url.a_trigger# eq "1">
              <OPTION VALUE="title" selected>Title</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "2">
              <OPTION VALUE="property" selected>Property</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "3">
              <OPTION VALUE="appraisal" selected>Appraisal</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "4">
              <OPTION VALUE="flood" selected>Flood</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "8">
              <OPTION VALUE="credit" selected>Credit</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "9">
              <OPTION VALUE="avm" selected>AVM</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "7">
              <OPTION VALUE="signing" selected>Signing</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "5">
              <OPTION VALUE="closing" selected>Closing</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <cfelse>
              <OPTION VALUE="all" selected>All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
            </cfif>
          </SELECT>
        </td>
      </tr>
    </table>
    <table width=350 cellpadding=1 cellspacing=1 border=0>
      <tr> <nobr>
        <td background="d3d3d3" width=350 align=center valign=top><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT FACE=verdana SIZE=1 color="black"> Month
          <SELECT NAME="oda_month"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
            <OPTION VALUE="NONE">N/A</OPTION>
            <option value="1">January</option>
            <option value="2">February</option>
            <option value="3">March</option>
            <option value="4">April</option>
            <option value="5">May</option>
            <option value="6">June</option>
            <option value="7">July</option>
            <option value="8">August</option>
            <option value="9">September</option>
            <option value="10">October</option>
            <option value="11">November</option>
            <option value="12">December</option>
          </SELECT>
          <FONT FACE=verdana SIZE=1 color="black"> Day
          <SELECT NAME="oda_day"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
            <OPTION VALUE="NONE">N/A</OPTION>
            <OPTION VALUE="1">01</OPTION>
            <OPTION VALUE="2">02</OPTION>
            <OPTION VALUE="3">03</OPTION>
            <OPTION VALUE="4">04</OPTION>
            <OPTION VALUE="5">05</OPTION>
            <OPTION VALUE="6">06</OPTION>
            <OPTION VALUE="7">07</OPTION>
            <OPTION VALUE="8">08</OPTION>
            <OPTION VALUE="9">09</OPTION>
            <OPTION VALUE="10">10</OPTION>
            <OPTION VALUE="11">11</OPTION>
            <OPTION VALUE="12">12</OPTION>
            <OPTION VALUE="13">13</OPTION>
            <OPTION VALUE="14">14</OPTION>
            <OPTION VALUE="15">15</OPTION>
            <OPTION VALUE="16">16</OPTION>
            <OPTION VALUE="17">17</OPTION>
            <OPTION VALUE="18">18</OPTION>
            <OPTION VALUE="19">19</OPTION>
            <OPTION VALUE="20">20</OPTION>
            <OPTION VALUE="21">21</OPTION>
            <OPTION VALUE="22">22</OPTION>
            <OPTION VALUE="23">23</OPTION>
            <OPTION VALUE="24">24</OPTION>
            <OPTION VALUE="25">25</OPTION>
            <OPTION VALUE="26">26</OPTION>
            <OPTION VALUE="27">27</OPTION>
            <OPTION VALUE="28">28</OPTION>
            <OPTION VALUE="29">29</OPTION>
            <OPTION VALUE="30">30</OPTION>
            <OPTION VALUE="31">31</OPTION>
          </SELECT>
          <FONT FACE=verdana SIZE=1 color="black"> Year
          <SELECT NAME="oda_year"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
            <OPTION VALUE="NONE">N/A</OPTION>
            <option value="2000">2000</option>
            <option value="2001">2001</option>
            <option value="2002">2002</option>
            <option value="2003">2003</option>
            <option value="2004">2004</option>
            <option value="2005">2005</option>
            <option value="2006">2006</option>
            <option value="2007">2007</option>
            <option value="2008">2008</option>
            <option value="2009">2009</option>
            <option value="2010">2010</option>
		    <option value="2011">2011</option>
		    <option value="2012">2012</option>
		    <option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
		<OPTION VALUE="2016">2016</OPTION>
		<OPTION VALUE="2017">2017</OPTION>
		<OPTION VALUE="2018">2018</OPTION>
		<OPTION VALUE="2019">2019</OPTION>
		<OPTION VALUE="2020">2020</OPTION>
          </SELECT>
        </td>
        </nobr> </tr>
    </table>
    <table width=650 cellpadding=1 cellspacing=1 border=0>

    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Credit Number </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="cr_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <CFOUTPUT QUERY="read_titleid_cr">
            <OPTION VALUE="#anc_ID#">#anc_ID#</OPTION>
          </CFOUTPUT>
        </SELECT>
      </td>
    </tr>
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Loan Number - </td>
      <td background="d3d3d3" width=400 align=left valign=top><input type=text name="loan_number" size=15 maxlength=15
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
								>
      </td>
    </tr>
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Clients </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="company_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <CFOUTPUT QUERY="read_companies">
            <OPTION VALUE="#ID#">#Company#</OPTION>
          </CFOUTPUT>
        </SELECT>
      </td>
    </tr>
    <!--- ================================================== --->
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Loan Processors </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="user_id"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <CFOUTPUT>
            <CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
              <CFIF #a_rec_count[AAA]# NEQ "0">
                <OPTION VALUE="NONE">------------------------------------</OPTION>
                <OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
                <CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
                  <cfset user_id = #users_id[AAA][BBB]#>
                  <OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#, #users_fname[AAA][BBB]#</OPTION>
                </CFLOOP>
                <OPTION VALUE="NONE"></OPTION>
              </CFIF>
            </CFLOOP>
          </CFOUTPUT>
        </SELECT>
      </td>
    </tr>
    <!--- ================================================== --->
    <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Status </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="Appraisal_status"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <option value="In Process" style="thin">In Process</OPTION>
          <option value="In Typing">In Typing</OPTION>
          <option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
          <option value="Report Faxed" style="thin" >Report Faxed</OPTION>
          <option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
        </SELECT>
      </td>
    </tr>
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Comments </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="comments"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <option value="Court House Closed">Court House Closed</OPTION>
          <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
          <option value="In Typing">In Typing</OPTION>
          <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
          <option value="Call for Detail">Call for Detail</OPTION>
          <option value="Judgments Exist">Judgments Exist</OPTION>
          <option value="Subordination Needed">Subordination Needed</OPTION>
          <option value="Subordination Received">Subordination Received</OPTION>
          <option value="Vesting Issue">Vesting Issue</OPTION>
          <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
          <option value="Clear to Close">Clear to Close</OPTION>
          <option value="Name/Address found not matching order">Name/Address found not matching order</OPTION>
        </SELECT>
      </td>
    </tr>
    <tr> </tr>
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Buyer First Name - </td>
      <td background="d3d3d3" width=400 align=left valign=top><input type=text name="buyer_fname" size=25 maxlength=15
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
								clear: none;" >
      </td>
    </tr>
    <!--- ================================================== --->
    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Buyer Last Name - </td>
      <td background="d3d3d3" width=400 align=left valign=top><input type=text name="buyer_lname"  size=25 maxlength=25
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
								clear: none;" >
      </td>
    </tr>
    </tr>

    <tr>
      <td background="d3d3d3" width=250 align=right valign=top><FONT FACE=verdana SIZE=1 color="black"> Sort By </td>
      <td background="d3d3d3" width=400 align=left valign=top><SELECT NAME="sortorder"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <OPTION VALUE="check_date">Order Date</OPTION>
          <OPTION VALUE="anc_id">Order Number</OPTION>
          <OPTION VALUE="appraisal_status">Status</OPTION>
          <OPTION VALUE="User_ID">Loan Processor</OPTION>
        </SELECT>
      </td>
    </tr>
    <tr>
      <td background="d3d3d3" colspan=2 width=650 align=right valign=top><INPUT TYPE=image src="./images/button_search.gif" border=0>
      </td>
    </tr>
  </CFFORM>
  <!--- ======================================================================== --->
</table>
</TD>
</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->
</TD>
</TR>
</table>
<cfelseif #a_trigger# eq 7>
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
<tr>
  <td width=780 align=left valign=top bgcolor=orange><FONT FACE=ARIAL SIZE=2 color="white">
    <CENTER>
      <B>Signing Report Search</B>
    </CENTER></TD>
</TR>
<CFFORM NAME="frm" ACTION="./title_rep_display.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=7" METHOD=POST>
<INPUT type="hidden" name="update" value="no">
<INPUT type="hidden" name="uid" value="URL.uid">
<INPUT type="hidden" name="al" value="URL.al">
<tr>
  <td width=780 align=center valign=top background="d3d3d3"><table width=350 cellpadding=1 cellspacing=1 border=0>
      <tr>
        <td background="d3d3d3" width=350 align=center valign=top><br>
          <FONT FACE=verdana SIZE=1 color="blUE"> <B>SELECT A PRODUCT</b> </td>
      </tr>
      <td background="d3d3d3" width=350 align=center valign=top><SELECT NAME="product"	onchange="prodSelect()"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
            <cfif #url.a_trigger# eq "1">
              <OPTION VALUE="title" selected>Title</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "2">
              <OPTION VALUE="property" selected>Property</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "3">
              <OPTION VALUE="appraisal" selected>Appraisal</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "4">
              <OPTION VALUE="flood" selected>Flood</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "8">
              <OPTION VALUE="credit" selected>Credit</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "9">
              <OPTION VALUE="avm" selected>AVM</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "7">
              <OPTION VALUE="signing" selected>Signing</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
              <cfelseif #url.a_trigger# eq "5">
              <OPTION VALUE="closing" selected>Closing</OPTION>
              <OPTION VALUE="all">All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <cfelse>
              <OPTION VALUE="all" selected>All</OPTION>
              <OPTION VALUE="title">Title</OPTION>
              <OPTION VALUE="property">Property</OPTION>
              <OPTION VALUE="appraisal">Appraisal</OPTION>
              <OPTION VALUE="flood">Flood</OPTION>
              <OPTION VALUE="credit">Credit</OPTION>
              <OPTION VALUE="avm">AVM</OPTION>
              <OPTION VALUE="signing">Signing</OPTION>
              <OPTION VALUE="closing">Closing</OPTION>
            </cfif>
          </SELECT>
        </td>
      </tr>
    </table>
	</cfform>
    <table width=350 cellpadding=1 cellspacing=1 border=0>
    <tr> <nobr>
      <td background="d3d3d3" width=350 align=center valign=top><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT FACE=verdana SIZE=1 color="black"> Month
        <SELECT NAME="oda_month"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <option value="1">January</option>
          <option value="2">February</option>
          <option value="3">March</option>
          <option value="4">April</option>
          <option value="5">May</option>
          <option value="6">June</option>
          <option value="7">July</option>
          <option value="8">August</option>
          <option value="9">September</option>
          <option value="10">October</option>
          <option value="11">November</option>
          <option value="12">December</option>
        </SELECT>
        <FONT FACE=verdana SIZE=1 color="black"> Day
        <SELECT NAME="oda_day"
								size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45"
								>
          <OPTION VALUE="NONE">N/A</OPTION>
          <OPTION VALUE="1">01</OPTION>
          <OPTION VALUE="2">02</OPTION>
          <OPTION VALUE="3">03</OPTION>
          <OPTION VALUE="4">04</OPTION>
          <OPTION VALUE="5">05</OPTION>
          <OPTION VALUE="6">06</OPTION>
          <OPTION VALUE="7">07</OPTION>
          <OPTION VALUE="8">08</OPTION>
          <OPTION VALUE="9">09</OPTION>
          <OPTION VALUE="10">10</OPTION>
          <OPTION VALUE="11">11</OPTION>
          <OPTION VALUE="12">12</OPTION>
          <OPTION VALUE="13">13</OPTION>
          <OPTION VALUE="14">14</OPTION>
          <OPTION VALUE="15">15</OPTION>
          <OPTION VALUE="16">16</OPTION>
          <OPTION VALUE="17">17</OPTION>
          <OPTION VALUE="18">18</OPTION>
          <OPTION VALUE="19">19</OPTION>
          <OPTION VALUE="20">20</OPTION>
          <OPTION VALUE="21">21</OPTION>
          <OPTION VALUE="22">22</OPTION>
          <OPTION VALUE="23">23</OPTION>
          <OPTION VALUE="24">24</OPTION>
          <OPTION VALUE="25">25</OPTION>
          <OPTION VALUE="26">26</OPTION>
          <OPTION VALUE="27">27</OPTION>
          <OPTION VALUE="28">28</OPTION>
          <OPTION VALUE="29">29</OPTION>
          <OPTION VALUE="30">30</OPTION>
          <OPTION VALUE="31">31</OPTION>
        </SELECT>
        <FONT FACE=verdana SIZE=1 color="black"> Year <SELECT NAME="oda_yea