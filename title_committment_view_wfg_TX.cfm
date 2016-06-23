<cfparam name="url.uid" default="0">
<cfparam name="url.al" default="0">
<cfparam name="url.pdf" default="0">
<cfparam name="text_1" default="">
<cfparam name="text_2" default="">
<cfparam name="text_3" default="">
<CFQUERY datasource="#request.dsn#" name="check_shapiro">
Select child_ids from companies where ID = 2368 or ID = 3011 or ID = 2372
</CFQUERY>
<cfset children = check_shapiro.child_ids>
<cfloop query="check_shapiro" startrow="2">
<cfif check_shapiro.child_ids neq "" and check_shapiro.child_ids neq 'NULL'>
<cfset children = children & "," & "#check_shapiro.child_ids#">
</cfif>
</cfloop>


<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFQUERY datasource="#request.dsn#" NAME="read_tax">
			SELECT *
			FROM tax_cert_title
			where title_id = #rec_id#
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_title_update">
			SELECT *
			FROM doc_abstract_title
			where title_id = #rec_id# and title_update = 'True'
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_Title">
    SELECT *
	FROM Title
	WHERE Title_ID = #rec_ID#
</CFQUERY>

<cfquery DATASOURCE="#request.dsn#" name="get_hud" >
	SELECT *
	FROM  HUD2010_TITLE_DATA
	WHERE title_id = #read_title.title_ID#
</CFQUERY>


<cfset find_list = "EPA (T-36),NOT YET DUE AND PAYABLE,PUD (T-17),SURVEY (T-19),MINERAL (T-19.2),ARM (T-33),BALLOON,(T-42),(T-42.1),TAX DELETION (T-30),(T-19.1),33.1,Variable Rate Mortgage-Negative Amortization (T-33.1)">
<cfset endorsement_total = 0>

<cfif ListFindNoCase(find_list, get_hud.A_1109_USERDESC, ",") and get_hud.A_1109_OUTSIDE_USERAMOUNT neq ''>
<cfset endorsement_total = endorsement_total + #get_hud.A_1109_OUTSIDE_USERAMOUNT#>
</cfif>
<cfif ListFindNoCase(find_list, get_hud.A_1110_USERDESC, ",") and get_hud.A_1110_OUTSIDE_USERAMOUNT neq ''>
<cfset endorsement_total = endorsement_total + #get_hud.A_1110_OUTSIDE_USERAMOUNT#>
</cfif>
<cfif ListFindNoCase(find_list, get_hud.A_1111_USERDESC, ",") and get_hud.A_1111_OUTSIDE_USERAMOUNT neq ''>
<cfset endorsement_total = endorsement_total + #get_hud.A_1111_OUTSIDE_USERAMOUNT#>
</cfif>
<cfif ListFindNoCase(find_list, get_hud.A_1112_USERDESC, ",") and get_hud.A_1112_OUTSIDE_USERAMOUNT neq ''>
<cfset endorsement_total = endorsement_total + #get_hud.A_1112_OUTSIDE_USERAMOUNT#>
</cfif>
<cfif ListFindNoCase(find_list, get_hud.A_1113_USERDESC, ",") and get_hud.A_1113_OUTSIDE_USERAMOUNT neq ''>
<cfset endorsement_total = endorsement_total + #get_hud.A_1113_OUTSIDE_USERAMOUNT#>
</cfif>
<cfif ListFindNoCase(find_list, get_hud.A_1114_USERDESC, ",") and get_hud.A_1114_OUTSIDE_USERAMOUNT neq ''>
<cfset endorsement_total = endorsement_total + #get_hud.A_1114_OUTSIDE_USERAMOUNT#>
</cfif>
<cfif ListFindNoCase(find_list, get_hud.A_1115_USERDESC, ",") and get_hud.A_1115_OUTSIDE_USERAMOUNT neq ''>
<cfset endorsement_total = endorsement_total + #get_hud.A_1115_OUTSIDE_USERAMOUNT#>
</cfif>
<cfif ListFindNoCase(find_list, get_hud.A_1116_USERDESC, ",") and get_hud.A_1116_OUTSIDE_USERAMOUNT neq ''>
<cfset endorsement_total = endorsement_total + #get_hud.A_1116_OUTSIDE_USERAMOUNT#>
</cfif>
<cfif ListFindNoCase(find_list, get_hud.A_1117_USERDESC, ",") and get_hud.A_1117_OUTSIDE_USERAMOUNT neq ''>
<cfset endorsement_total = endorsement_total + #get_hud.A_1117_OUTSIDE_USERAMOUNT#>
</cfif>
<cfif ListFindNoCase(find_list, get_hud.A_1118_USERDESC, ",") and get_hud.A_1118_OUTSIDE_USERAMOUNT neq ''>
<cfset endorsement_total = endorsement_total + #get_hud.A_1118_OUTSIDE_USERAMOUNT#>
</cfif>
<cfif ListFindNoCase(find_list, get_hud.A_1119_USERDESC, ",") and get_hud.A_1119_OUTSIDE_USERAMOUNT neq ''>
<cfset endorsement_total = endorsement_total + #get_hud.A_1119_OUTSIDE_USERAMOUNT#>
</cfif>
<cfif ListFindNoCase(find_list, get_hud.A_1120_USERDESC, ",") and get_hud.A_1120_OUTSIDE_USERAMOUNT neq ''>
<cfset endorsement_total = endorsement_total + #get_hud.A_1120_OUTSIDE_USERAMOUNT#>
</cfif>
<cfif ListFindNoCase(find_list, get_hud.A_1121_USERDESC, ",") and get_hud.A_1121_OUTSIDE_USERAMOUNT neq ''>
<cfset endorsement_total = endorsement_total + #get_hud.A_1121_OUTSIDE_USERAMOUNT#>
</cfif>
<cfif ListFindNoCase(find_list, get_hud.A_1122_USERDESC, ",") and get_hud.A_1122_OUTSIDE_USERAMOUNT neq ''>
<cfset endorsement_total = endorsement_total + #get_hud.A_1122_OUTSIDE_USERAMOUNT#>
</cfif>


<cfquery DATASOURCE="#request.dsn#" name="get_hud_b" >
	SELECT *
	FROM  HUD2010_TITLE_DATA_B
	WHERE title_id = #read_title.title_ID#
</CFQUERY>


<cfif ListFindNoCase(find_list, get_hud_b.A_1101_ITEM_DESCRIPTION_01, ",") and get_hud_b.A_1101_ITEM_AMOUNT_01 neq ''>
<cfset endorsement_total = endorsement_total + #get_hud_b.A_1101_ITEM_AMOUNT_01#>
</cfif>

<cfif ListFindNoCase(find_list, get_hud_b.A_1101_ITEM_DESCRIPTION_02, ",") and get_hud_b.A_1101_ITEM_AMOUNT_02 neq ''>
<cfset endorsement_total = endorsement_total + #get_hud_b.A_1101_ITEM_AMOUNT_02#>
</cfif>

<cfif ListFindNoCase(find_list, get_hud_b.A_1101_ITEM_DESCRIPTION_03, ",") and get_hud_b.A_1101_ITEM_AMOUNT_03 neq ''>
<cfset endorsement_total = endorsement_total + #get_hud_b.A_1101_ITEM_AMOUNT_03#>
</cfif>

<cfif ListFindNoCase(find_list, get_hud_b.A_1101_ITEM_DESCRIPTION_04, ",") and get_hud_b.A_1101_ITEM_AMOUNT_04 neq ''>
<cfset endorsement_total = endorsement_total + #get_hud_b.A_1101_ITEM_AMOUNT_04#>
</cfif>

<cfif ListFindNoCase(find_list, get_hud_b.A_1101_ITEM_DESCRIPTION_05, ",") and get_hud_b.A_1101_ITEM_AMOUNT_05 neq ''>
<cfset endorsement_total = endorsement_total + #get_hud_b.A_1101_ITEM_AMOUNT_05#>
</cfif>

<cfif ListFindNoCase(find_list, get_hud_b.A_1101_ITEM_DESCRIPTION_06, ",") and get_hud_b.A_1101_ITEM_AMOUNT_06 neq ''>
<cfset endorsement_total = endorsement_total + #get_hud_b.A_1101_ITEM_AMOUNT_06#>
</cfif>

<cfif ListFindNoCase(find_list, get_hud_b.A_1101_ITEM_DESCRIPTION_07, ",") and get_hud_b.A_1101_ITEM_AMOUNT_07 neq ''>
<cfset endorsement_total = endorsement_total + #get_hud_b.A_1101_ITEM_AMOUNT_07#>
</cfif>

<cfif ListFindNoCase(find_list, get_hud_b.A_1101_ITEM_DESCRIPTION_08, ",") and get_hud_b.A_1101_ITEM_AMOUNT_08 neq ''>
<cfset endorsement_total = endorsement_total + #get_hud_b.A_1101_ITEM_AMOUNT_08#>
</cfif>

<cfif ListFindNoCase(find_list, get_hud_b.A_1101_ITEM_DESCRIPTION_09, ",") and get_hud_b.A_1101_ITEM_AMOUNT_09 neq ''>
<cfset endorsement_total = endorsement_total + #get_hud_b.A_1101_ITEM_AMOUNT_09#>
</cfif>

<cfif ListFindNoCase(find_list, get_hud_b.A_1101_ITEM_DESCRIPTION_10, ",") and get_hud_b.A_1101_ITEM_AMOUNT_10 neq ''>
<cfset endorsement_total = endorsement_total + #get_hud_b.A_1101_ITEM_AMOUNT_10#>
</cfif>

<cfif ListFindNoCase(find_list, get_hud_b.A_1101_ITEM_DESCRIPTION_11, ",") and get_hud_b.A_1101_ITEM_AMOUNT_11 neq ''>
<cfset endorsement_total = endorsement_total + #get_hud_b.A_1101_ITEM_AMOUNT_11#>
</cfif>

<cfif ListFindNoCase(find_list, get_hud_b.A_1101_ITEM_DESCRIPTION_12, ",") and get_hud_b.A_1101_ITEM_AMOUNT_12 neq ''>
<cfset endorsement_total = endorsement_total + #get_hud_b.A_1101_ITEM_AMOUNT_12#>
</cfif>

<cfif ListFindNoCase(find_list, get_hud_b.A_1101_ITEM_DESCRIPTION_13, ",") and get_hud_b.A_1101_ITEM_AMOUNT_13 neq ''>
<cfset endorsement_total = endorsement_total + #get_hud_b.A_1101_ITEM_AMOUNT_13#>
</cfif>

<cfif ListFindNoCase(find_list, get_hud_b.A_1101_ITEM_DESCRIPTION_14, ",") and get_hud_b.A_1101_ITEM_AMOUNT_14 neq ''>
<cfset endorsement_total = endorsement_total + #get_hud_b.A_1101_ITEM_AMOUNT_14#>
</cfif>

<cfif ListFindNoCase(find_list, get_hud_b.A_1101_ITEM_DESCRIPTION_15, ",") and get_hud_b.A_1101_ITEM_AMOUNT_15 neq ''>
<cfset endorsement_total = endorsement_total + #get_hud_b.A_1101_ITEM_AMOUNT_15#>
</cfif>

<cfif ListFindNoCase(find_list, get_hud_b.A_1101_ITEM_DESCRIPTION_16, ",") and get_hud_b.A_1101_ITEM_AMOUNT_16 neq ''>
<cfset endorsement_total = endorsement_total + #get_hud_b.A_1101_ITEM_AMOUNT_16#>
</cfif>

<cfif ListFindNoCase(find_list, get_hud_b.A_1101_ITEM_DESCRIPTION_17, ",") and get_hud_b.A_1101_ITEM_AMOUNT_17 neq ''>
<cfset endorsement_total = endorsement_total + #get_hud_b.A_1101_ITEM_AMOUNT_17#>
</cfif>

<cfif ListFindNoCase(find_list, get_hud_b.A_1101_ITEM_DESCRIPTION_18, ",") and get_hud_b.A_1101_ITEM_AMOUNT_18 neq ''>
<cfset endorsement_total = endorsement_total + #get_hud_b.A_1101_ITEM_AMOUNT_18#>
</cfif>

<cfif ListFindNoCase(find_list, get_hud_b.A_1101_ITEM_DESCRIPTION_19, ",") and get_hud_b.A_1101_ITEM_AMOUNT_19 neq ''>
<cfset endorsement_total = endorsement_total + #get_hud_b.A_1101_ITEM_AMOUNT_19#>
</cfif>

<cfif ListFindNoCase(find_list, get_hud_b.A_1101_ITEM_DESCRIPTION_20, ",") and get_hud_b.A_1101_ITEM_AMOUNT_20 neq ''>
<cfset endorsement_total = endorsement_total + #get_hud_b.A_1101_ITEM_AMOUNT_20#>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_hud_data">
        select A_1103_OUTSIDE_OWNERSTITLEINS, A_1104_OUTSIDE_LENDERSTITLEINS, A_1103_BORROWER_OWNERSTITLEINS from HUD2010_TITLE_DATA WHERE title_id = #url.rec_ID#
        </cfquery>


<cfif read_title.loanamt_float neq '' and read_title.loanamt_float neq 'NULL'>
<cfset read_title.loanamt_float = ReplaceNoCase(read_title.loanamt_float, ",", "", "ALL")>
</cfif>

<cfparam name="company_id" default="#read_title.comp_id#">
<CFQUERY datasource="#request.dsn#" NAME="read_title_data">
        select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs
        is not null
        </cfquery>

<CFQUERY datasource="#request.dsn#" NAME="read_deed">
		SELECT     *
FROM         title_ins_view
WHERE     (title_id = #rec_id#) AND (type = 'DATA')
ORDER BY insert_date, insert_time DESC
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="Read_temp_comp_b1">
			SELECT *
			FROM title
			where title_id = #rec_id#
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_tax">
			SELECT *
			FROM tax_cert_title
			where title_id = #rec_id#
		</CFQUERY>

<cfif read_title.comp_id eq 3182 or read_title.comp_id eq 2368 or read_title.comp_id eq 2430  or ListContainsNoCase(children, read_title.comp_id, ",")>
<CFQUERY datasource="#request.dsn#" NAME="read_rosicki">
    SELECT *
	FROM Rosicki
	WHERE Order_ID = #rec_ID#
</CFQUERY>
</cfif>

<cfif read_title.comp_id eq 3251 or read_title.comp_id eq 3444>
<CFQUERY datasource="#request.dsn#" NAME="read_keystone">
    SELECT *
	FROM Keystone
	WHERE Order_ID = #rec_ID#
</CFQUERY>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_FT_company">
    SELECT *
	FROM Companies
	WHERE ID = #read_Title.comp_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="check_if_richmond_office">
SELECT *
FROM First_admin where id = #read_FT_company.intSales#
</cfquery>
<cfset this_email = 'loandocs@firsttitleservices.com'>
<cfif check_if_richmond_office.va_employee eq 'True'>
<cfset this_email = 'richmond@firsttitleservices.com'>
<cfelseif read_FT_company.streamline_client eq 'True'>
<cfset this_email = 'loandocs@streamline-title.com'>
<cfelseif read_FT_company.company contains 'Chase/RealEC'>
<cfset this_email = 'ChaseTeam@firsttitleservices.com'>
<cfelseif read_FT_company.company contains 'Chase'>
<cfset this_email = 'chase@firsttitleservices.com'>
<cfelseif read_FT_company.company contains 'Flagstar'>
<cfset this_email = 'flagstar@firsttitleservices.com'>
<cfelseif read_FT_company.ID eq 3943 or read_FT_company.ID eq 4042 or read_FT_company.ID eq 4043>
<cfset this_email = 'vdocs@firsttitleservices.com'>
</cfif>

<cftry>
<cfinvoke component = "cfc.team_info"	method = "getTeamEmail"	returnVariable = "team_email" team_id="#read_FT_company.team_id#">
<cfcatch type="Any">
		<cfoutput>
		<cfmail from="rjermain@firsttitleservices.com" to="rjermain@firsttitleservices.com" subject="Team Email Failure">
		<hr>
			<h1>Other Error: #cfcatch.Type#</h1>
			<ul>
				<li><b>Message:</b> #cfcatch.Message#
				<li><b>Detail:</b> #cfcatch.Detail#
				<li><B>Page:</B> #GetBaseTemplatePath()#
			</ul>
		</cfmail>
        </cfoutput>
	</cfcatch>
</cftry>



<CFSET Buyer_1 = #read_Title.bfirstname1# & " " & #read_Title.bminame1# & " " & #read_Title.blastname1#>
<CFSET Buyer_2 = #read_Title.bfirstname2# & " " & #read_Title.bminame2# & " " & #read_Title.blastname2#>
<CFSET Seller_1 = #read_Title.sfirstname1# & " " & #read_Title.sminame1# & " " & #read_Title.slastname1#>
<CFSET Seller_2 = #read_Title.sfirstname2# & " " & #read_Title.sminame2# & " " & #read_Title.slastname2#>

<CFQUERY datasource="#request.dsn#" NAME="Read_Committment_Doc">
    SELECT *
	FROM Doc_Title_Insurance_Title
	WHERE Title_ID = #rec_ID# and Insurance_co = 16
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_ins_committments">
    SELECT *
	FROM Doc_Title_Insurance_Title
	WHERE Title_ID = #rec_ID#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_billing_states">
    SELECT *
	FROM  Company_Billing_states
	WHERE company_id = #read_title.comp_id# AND a_states = '#read_title.pstate#'
</CFQUERY>

<cfif #get_billing_states.recordcount# GT "0">
    <CFQUERY datasource="#request.dsn#" NAME="get_line_costs">
		SELECT *
		FROM Company_Billing_Values
		WHERE company_id = #read_title.comp_id# AND billing_id = #get_billing_states.billing_id#
	</CFQUERY>

    <CFQUERY datasource="#request.dsn#" NAME="read_age">
		SELECT *
		FROM  company_agency_assoc
		WHERE billing_id = '#get_billing_states.billing_id#'
    </CFQUERY>

<cfif #read_age.recordcount# gt "0">

      <!---If the State is California or Nevada then they need to be the company 21 which is E-Title--->
      <CFIF #read_title.pstate# eq "CA">
          <CFSET 	title_ft_agency_id = "21">
      <CFELSEIF #read_title.pstate# eq "NV">
              <CFSET 	title_ft_agency_id = "21">
      <CFELSE>
          <CFSET 	title_ft_agency_id = "#read_age.title_ft_agency_id#">
      </CFIF>

      <CFQUERY datasource="#request.dsn#" NAME="read_Title_FT_Agency_company">
          SELECT *
      	FROM  title_ft_agencies
      	WHERE title_ft_agency_id = #title_ft_agency_id#
      </CFQUERY>

      <cfset FT_Agency = #trim(read_Title_FT_Agency_company.Company)#>
<cfelse>
        <CFQUERY datasource="#request.dsn#" NAME="read_Title_FT_Agency_company">
		    SELECT *
		    FROM  title_ft_agencies
		    WHERE 0=1
	    </CFQUERY>
</cfif>

<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="read_Title_FT_Agency_company">
		SELECT *
		FROM  title_ft_agencies
		WHERE 0 = 1

</CFQUERY>

</cfif>



	<CFQUERY datasource="#request.dsn#" NAME="Read_Doc">
			SELECT *
			FROM Doc_Amer_Pioneer_Ins_ALL_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_company">
			SELECT *
			FROM Title_Companies
			WHERE Title_Co_ID = 16
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="Read_Committment_Doc">
			SELECT *
			FROM Doc_Amer_Pioneer_Ins_ALL_Title
			WHERE Title_ID = #rec_ID#
		</CFQUERY>

<cfif #a_trigger# eq 22>
<cfif read_FT_company.streamline_client eq 1>
<cfset from_email = "titledelivery@streamline-title.com">
<cfset this_company = "Streamline Title & Escrow">
<cfelse>
<cfset from_email = "titledelivery@firsttitleservices.com">
<cfset this_company = "First Title & Escrow">
</cfif>

<CFMAIL
TO="#email#"
FROM="#from_email#"
SERVER="127.0.0.1"
Subject="Stewart Title Insurance Commitment for order #rec_id# - #read_title.bfirstname1# #read_title.blastname1#, Loan No: #read_title.loan_number#"
TIMEOUT="600"
type="HTML"
>
<cfoutput>
View/Print <A HREF="https://#cgi.server_name#/title_committment_view_wfg_TX.cfm?comp_id=115&user_id_1=723&lo_id=1217&rec_id=#rec_id#&a_trigger=1&company_id=0">Stewart Title Insurance Commitment</a> for order #rec_id# - #read_title.bfirstname1# #read_title.blastname1#</B></font><br><br>

#this_company# staff
</cfoutput>
</cfmail>
		</cfif>





		<CFQUERY datasource="#request.dsn#" NAME="read_tax_info">

			SELECT *
			FROM tax_cert_title
			where title_id = #rec_id#
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_deed_info">
		SELECT     *
FROM         title_ins_view
WHERE     (title_id = #rec_id#) AND (type = 'DATA')
ORDER BY insert_date, insert_time DESC
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_data_info">
		SELECT     *
FROM        doc_title_insurance_title
WHERE     (title_id = #rec_id#)
</CFQUERY>

<HTML XMLNS:IE>
<HEAD>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<?IMPORT NAMESPACE="IE" IMPLEMENTATION="#default">
<STYLE TYPE="text/css">

TD {font-family:Arial, Helvetica, sans-serif; font-size:12px;}

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
codebase="https://machine1.firsttitleservices.com/smsx.exe">
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



<div id=idControls align="center" class="noprint">
 <b>Please use the print button below to print this page (automatic setting included)</b><BR>
 <span style="font-size:12px; font-family:Arial, Helvetica, sans-serif; color:red">If the buttons below are 'grayed-out', please click <a href="https://machine1.firsttitleservices.com/smsx.exe">HERE</a> to download and install ScriptX, this will allow you to print the HUD-1 and the Title Commitment</span>

<a href="#" onclick=printWindow();><input disabled type="button" value="Print the page"
 onclick="factory.printing.Print(true)"></a>
 <cfFORM NAME="Search" METHOD="post" ACTION="https://#cgi.server_name#/admin_area/Title_committment_submit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#company_ID#&a_trigger=7&from_page=commitment">
  <FONT FACE=ARIAL SIZE=2 color="black">Enter email to send </font><input type=text name="email" size=20 maxlength=100
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
								> <input type="image" src="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/images/button_submit.gif" border=0 alt="send email">
</cfFORM> <cfif #a_trigger# eq 22>
    <FONT FACE=ARIAL SIZE=2 color="blue">Email sent
</cfif>
</NOBR>

 <hr size="1" color="dimgray">

</div>


<!---  special Checklist for STIFEL orders --->
<cfif #read_title.comp_id# eq 5026 or #read_title.comp_id# eq 4177>
<cfinclude template="stifel_checklist.cfm">
</cfif>
<!--- END special Checklist for STIFEL orders --->



<!--- special invoice page for Vanderbilt orders --->
<cfif #read_title.comp_id# eq 2818>
<cfset IE_pagenum = 0>

<IE:DEVICERECT ID="page0" CLASS="masterstyle" MEDIA="print">
<CFQUERY datasource="#request.dsn#" NAME="get_all" maxrows=10>
SELECT     t.Title_ID, t.loan_number, t.paddress, t.pcity, t.pstate, t.pzip, t.order_date,
           c.company, c.addr1, c.addr2, c.city, c.state, c.zip_code
FROM      Title t INNER JOIN
		  Companies c ON t.comp_id = c.ID
WHERE     (t.title_id = #read_title.title_id#)
</cfquery>

<cfoutput query="get_all">

<style>
TD {font-family:Arial, Helvetica, sans-serif; font-size:12px;}
.topleft {border-top-color:##6E0064;
          border-top-width:1px;
		  border-top-style:solid;
		  border-left-color:##6E0064;
          border-left-width:1px;
		  border-left-style:solid;}
.topright {border-top-color:##6E0064;
          border-top-width:1px;
		  border-top-style:solid;
		  border-right-color:##6E0064;
          border-right-width:1px;
		  border-right-style:solid;
		  border-left-color:##6E0064;
          border-left-width:1px;
		  border-left-style:solid;}

.bottomleft {border-top-color:##6E0064;
          border-top-width:1px;
		  border-top-style:solid;
		  border-bottom-color:##6E0064;
          border-bottom-width:1px;
		  border-bottom-style:solid;
		  border-left-color:##6E0064;
          border-left-width:1px;
		  border-left-style:solid;}
.bottomright {border-top-color:##6E0064;
          border-top-width:1px;
		  border-top-style:solid;
		  border-right-color:##6E0064;
          border-right-width:1px;
		  border-right-style:solid;
		  border-bottom-color:##6E0064;
          border-bottom-width:1px;
		  border-bottom-style:solid;
		  border-left-color:##6E0064;
          border-left-width:1px;
		  border-left-style:solid;}
.bottom { border-right-color:##6E0064;
          border-right-width:1px;
		  border-right-style:solid;
		  border-bottom-color:##6E0064;
          border-bottom-width:1px;
		  border-bottom-style:solid;
		  border-left-color:##6E0064;
          border-left-width:1px;
		  border-left-style:solid;}
</style>
<table width="600" cellpadding=6 cellspacing=0>
<tr>
<td align="center" valign="top" colspan="5"><cfif NOT DateDiff("d", Now(), "1/30/2012")><strong><font size=4>FIRST TITLE & ESCROW</font></strong><BR>
7361 Calhoun Place Suite 200

Rockville, MD 20850<br>
<cfelse><strong><font size=4>FIRST TITLE & ESCROW</font></strong><BR>
7361 Calhoun Place, Suite 200
Rockville, MD 20855<br>
</cfif>
<br>
<br>
<H1>INVOICE</H1>
<br>
</td>
</tr>
<tr>
<td align="left" valign="top" colspan="3">

<font size=2><strong>Bill To:</strong><BR>
#get_all.company#<BR>
#get_all.addr1#<BR>
#get_all.city#, #get_all.state# #get_all.zip_code#<BR><br></font>
<br>
</div></td>
<td colspan="2" align="right" valign="top">
<table cellpadding=6 cellspacing=0>
<tr>
<td align="center" valign="top" width="150" class="topleft"><strong>Invoice Date</strong></td>
<td align="center" valign="top" width="150" class="topright"><strong>Invoice Number</strong></td>
</tr>
<tr>
<td align="center" valign="top" width="150" class="bottomleft">#DateFormat(get_all.order_date, "mm/dd/yyyy")#</td>
<td align="center" valign="top" width="150" class="bottomright">100#get_all.title_id#</td>
</tr>
<tr>
<td align="center" valign="top" colspan="2" class="bottom">DUE UPON RECEIPT</td>
</tr>
</table><br><br><br>
</td>
</tr>
<tr>
<td align="Left" valign="top" width="65" class="topleft"><strong>Order ID</strong></td>
<td align="left" valign="top"  width="60" class="topleft"><strong>Order&nbsp;Date</strong></td>
<td align="left" valign="top" class="topleft" width="550" ><strong>Property Address</strong></td>
<td align="right" valign="top" class="topleft" width="200"><strong>Loan Number</strong></td>
<td align="right" valign="top" class="topright" width="200"><strong>Amount</strong></td>
</tr>
<tr>
<td align="Left" valign="top" class="bottomleft">T-#get_all.title_id#</td>
<td align="Left" valign="top" class="bottomleft">#DateFormat(get_all.order_date, "mm/dd/yyyy")#</td>
<td align="Left" valign="top" class="bottomleft">#get_all.paddress#, #get_all.pcity#, #get_all.pstate# #get_all.pzip#</td>
<td align="right" valign="top" class="topleft"><cfif get_all.loan_number neq '' and get_all.loan_number neq 'NULL'>#get_all.loan_number#<cfelse>Not Provided</cfif></td>
<td align="right" valign="top" class="topright"><cfif DateDiff("d", "02/01/2008", get_all.order_date) LT 0>225.00<cfelse>250.00</cfif></td>
</tr>
<cfif read_title_update.recordcount GTE 1>
<tr>
<td align="Left" valign="top" class="bottomleft">T-#get_all.title_id#</td>
<td align="Left" valign="top" class="bottomleft">#DateFormat(read_title_update.a_date_assigned, "mm/dd/yyyy")#</td>
<td align="Left" valign="top" class="bottomleft" colspan="2">Title Report Update</td>
<!--- charge for a title update is $60 --->
<td align="right" valign="top" class="topright">60.00</td>
</tr>
</cfif>
<tr>
<td align="Left" valign="top" colspan="3">&nbsp;</td>
<td align="right" valign="top" class="bottomleft"><strong>TOTAL</strong></td>
<td align="right" valign="top" class="bottomright"><strong><cfif DateDiff("d", "02/01/2008", get_all.order_date) LT 0>285.00<cfelse>310.00</cfif></strong></td>
</tr>



</table>
<br>
<br>
<br>
<br>
<br>
</cfoutput>
</IE:DEVICERECT>
</cfif>
<!--- end special invoice page for vanderbilt orders --->

<!--- end special invoice page for FIDELITY NATIONAL TITLE (452) orders --->
<cfif #read_title.comp_id# eq 452>
<cfset IE_pagenum = 0>

<IE:DEVICERECT ID="page0" CLASS="masterstyle" MEDIA="print">
<CFQUERY datasource="#request.dsn#" NAME="get_all" maxrows=10>
SELECT     t.Title_ID, t.loan_number, t.paddress, t.pcity, t.pstate, t.pzip, t.order_date,
           c.company, c.addr1, c.addr2, c.city, c.state, c.zip_code
FROM      Title t INNER JOIN
		  Companies c ON t.comp_id = c.ID
WHERE     (t.title_id = #read_title.title_id#)
</cfquery>

<cfoutput query="get_all">

<style>
TD {font-family:Arial, Helvetica, sans-serif; font-size:12px;}
.topleft {border-top-color:##6E0064;
          border-top-width:1px;
		  border-top-style:solid;
		  border-left-color:##6E0064;
          border-left-width:1px;
		  border-left-style:solid;}
.topright {border-top-color:##6E0064;
          border-top-width:1px;
		  border-top-style:solid;
		  border-right-color:##6E0064;
          border-right-width:1px;
		  border-right-style:solid;
		  border-left-color:##6E0064;
          border-left-width:1px;
		  border-left-style:solid;}

.bottomleft {border-top-color:##6E0064;
          border-top-width:1px;
		  border-top-style:solid;
		  border-bottom-color:##6E0064;
          border-bottom-width:1px;
		  border-bottom-style:solid;
		  border-left-color:##6E0064;
          border-left-width:1px;
		  border-left-style:solid;}
.bottomright {border-top-color:##6E0064;
          border-top-width:1px;
		  border-top-style:solid;
		  border-right-color:##6E0064;
          border-right-width:1px;
		  border-right-style:solid;
		  border-bottom-color:##6E0064;
          border-bottom-width:1px;
		  border-bottom-style:solid;
		  border-left-color:##6E0064;
          border-left-width:1px;
		  border-left-style:solid;}
.bottom { border-right-color:##6E0064;
          border-right-width:1px;
		  border-right-style:solid;
		  border-bottom-color:##6E0064;
          border-bottom-width:1px;
		  border-bottom-style:solid;
		  border-left-color:##6E0064;
          border-left-width:1px;
		  border-left-style:solid;}
</style>
<table width="600" cellpadding=6 cellspacing=0>
<tr>

<td align="center" valign="top" colspan="5"><strong><font size=4>STREAMLINE TITLE & ESCROW</font></strong><BR>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
7361 Calhoun Place Suite 200

Rockville, MD 20850<br>
<cfelse>
7361 Calhoun Place, Suite 200
Rockville, MD 20855<br>
</cfif>

<br>
<br>
<H1>INVOICE</H1>
<br>
</td>
</tr>
<tr>
<td align="left" valign="top" colspan="3">

<font size=2><strong>Bill To:</strong><BR>
#get_all.company#<BR>
#get_all.addr1#<BR>
#get_all.city#, #get_all.state# #get_all.zip_code#<BR><br></font>
<br>
</div></td>
<td colspan="2" align="right" valign="top">
<table cellpadding=6 cellspacing=0>
<tr>
<td align="center" valign="top" width="150" class="topleft"><strong>Invoice Date</strong></td>
<td align="center" valign="top" width="150" class="topright"><strong>Invoice Number</strong></td>
</tr>
<tr>
<td align="center" valign="top" width="150" class="bottomleft">#DateFormat(get_all.order_date, "mm/dd/yyyy")#</td>
<td align="center" valign="top" width="150" class="bottomright">100#get_all.title_id#</td>
</tr>
<tr>
<td align="center" valign="top" colspan="2" class="bottom">DUE UPON RECEIPT</td>
</tr>
</table><br><br><br>
</td>
</tr>
<tr>
<td align="Left" valign="top" width="65" class="topleft"><strong>Order ID</strong></td>
<td align="left" valign="top"  width="60" class="topleft"><strong>Order&nbsp;Date</strong></td>
<td align="left" valign="top" class="topleft" width="550" ><strong>Property Address</strong></td>
<td align="right" valign="top" class="topleft" width="200"><strong>Loan Number</strong></td>
<td align="right" valign="top" class="topright" width="200"><strong>Amount</strong></td>
</tr>
<tr>
<td align="Left" valign="top" class="bottomleft">T-#get_all.title_id#</td>
<td align="Left" valign="top" class="bottomleft">#DateFormat(get_all.order_date, "mm/dd/yyyy")#</td>
<td align="Left" valign="top" class="bottomleft">#get_all.paddress#, #get_all.pcity#, #get_all.pstate# #get_all.pzip#</td>
<td align="right" valign="top" class="topleft"><cfif get_all.loan_number neq '' and get_all.loan_number neq 'NULL'>#get_all.loan_number#<cfelse>Not Provided</cfif></td>
<td align="right" valign="top" class="topright">295.00</td>
</tr>
<cfif read_title_update.recordcount GTE 1>
<tr>
<td align="Left" valign="top" class="bottomleft">T-#get_all.title_id#</td>
<td align="Left" valign="top" class="bottomleft">#DateFormat(read_title_update.a_date_assigned, "mm/dd/yyyy")#</td>
<td align="Left" valign="top" class="bottomleft" colspan="2">Title Report Update</td>
<!--- charge for a title update is $60 --->
<td align="right" valign="top" class="topright">60.00</td>
</tr>
</cfif>
<tr>
<td align="Left" valign="top" colspan="3">&nbsp;</td>
<td align="right" valign="top" class="bottomleft"><strong>TOTAL</strong></td>
<td align="right" valign="top" class="bottomright"><strong><cfif read_title_update.recordcount GTE 1>355.00<cfelse>295.00</cfif></strong></td>
</tr>



</table>
<br>
<br>
<br>
<br>
<br>
</cfoutput>
</IE:DEVICERECT>
</cfif>
<!--- end special invoice page for FIDELITY NATIONAL TITLE (452) orders --->



<cfif #read_title.comp_id# eq "254">

<!--- <p style="page-break-after:always;">&nbsp;</p> --->
<IE:DEVICERECT ID="<CFOUTPUT><CFIF #read_Title.pstate# eq "CA" OR #read_Title.pstate# eq "NV">page98<CFELSE>Page97</CFIF></cfoutput>" CLASS="masterstyle" MEDIA="print">
<table  width="98%" cellpadding="3" cellspacing="0" border="0">
  <tr>
    <td align="center" valign="middle" colspan="3"><font size="4" face="Verdana, Arial, Helvetica, sans-serif"><strong>First
        Title Commitment Review Sheet</strong></font></td>
  </tr>
  <tr>
    <td colspan="3"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr align="left" valign="top">
    <td width="45%"><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><strong>Title
      Company Name:</strong></font><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><br>
      <strong>Title Company Contact:</strong>&nbsp;</font></td>
    <td width="15%"><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><strong><font size="2"><br>
      Name:&nbsp;&nbsp;</font></strong><font size="2"> <br>
      </font><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><font size="2"><strong>Phone:&nbsp;&nbsp;</strong>
      <br>
      </font><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><font size="2"><strong>E-mail:&nbsp;&nbsp;</strong>
      </font></font><font size="2"> </font></font><font size="2"> </font></font></td>
    <td width="40%"><strong><font size="3" face="Verdana, Arial, Helvetica, sans-serif">First
      Title & Escrow, Inc.<br>
      <font size="2">Customer Relations Department<br>
      301-279-0303 x0<br>
      <cfoutput>#team_email#</cfoutput></font></font></strong></td>
  </tr>
  <tr align="left" valign="top">
    <td><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><strong>File
      Number:<br>
      Legal Address:<br><br>
      Tax ID info:</strong></font></td>
    <td>&nbsp;</td>
    <td><strong><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><cfoutput>#read_title.loan_number#<br>
      #read_title.paddress#,<br> #read_title.pcity#, #read_title.pstate# #read_title.pzip#<br>
      #read_tax_info.data19#</font></strong></td>
  </tr>
  <tr align="left" valign="top">
    <td colspan="2"> <table border="1" bordercolor="333333" bordercolordark="333333" bordercolorlight="333333" cellpadding="5" cellspacing="0" width="100%">
        <tr>
          <td valign="top"><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><strong>Who
            is on title to the property?:</strong><br>
            <strong><font size="1">(include middle name or initial as it appears
            on title)</font></strong></font></td>
        </tr>
      </table></td>
    <td><strong><font size="3" face="Verdana, Arial, Helvetica, sans-serif">#read_deed_info.data3# <cfif #read_deed_info.data4# neq "">AND #read_deed_info.data4#</cfif></font></strong></td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr align="left" valign="top">
    <td colspan="3"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">1.
        Have there been any changes in title in the past 12 months (someone added
        or taken off title, etc.)<br><cfset testDate = #DateFormat(CreateODBCDate(read_deed_info.data11), "m/d/yyyy")#>
        <cfif #DATEDIFF("m", testDate, read_data_info.merge_date)# LT 12>&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/checked.jpg">YES&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/unchecked.jpg" width="73" height="23">NO
        <cfelse>&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/unchecked.jpg">YES&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/checked.jpg" width="73" height="23">NO </cfif><font size="1">(if YES, explain in comments below.)</font> </font></strong>
     <strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">2. Are
        there any items that need to be cleared:<br>
         <cfif #read_data_info.cleared# neq "" OR #read_data_info.clear_needed# neq "">&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/checked.jpg">YES&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/unchecked.jpg" width="73" height="23">NO
         <cfelse>&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/unchecked.jpg">YES&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/checked.jpg" width="73" height="23">NO </cfif><font size="1">(if YES, explain in comments below.)</font> </font></strong>
   <font size="1">(if YES, explain in comments below.)</font></font></strong>
     <strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">3.
        Are the property taxes up to date?<br>
        <cfif #read_tax_info.data31# eq "Paid">&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/checked.jpg">YES&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/unchecked.jpg" width="73" height="23">NO
        <font size="1">(if NO, explain in comments below.)</font></font></strong></td>
 <cfelse>&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/unchecked.jpg">YES&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/checked.jpg" width="73" height="23">NO </cfif><font size="1">(if NO, explain in comments below.)</font> </font></strong>

  </tr>
  <tr>
    <td colspan="3"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td align="center" valign="middle" colspan="3"> <table border="1" bordercolor="333333" bordercolordark="333333" bordercolorlight="333333" cellpadding="4" cellspacing="0" width="100%" align="center">
        <tr valign="middle">
          <td width="50%"><strong><font size="3" face="Verdana, Arial, Helvetica, sans-serif">Items
            to be cleared:</font></strong></td>
          <td width="50%"><strong><font size="3" face="Verdana, Arial, Helvetica, sans-serif">What
            is needed to clear issue:</font></strong></td>
        </tr>
       <tr valign="top">
          <td width="50%"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">
			 <cfif #read_data_info.cleared# neq ""> #read_data_info.cleared# <cfelse>NONE</cfif>
					</font></td>
          <td width="50%"> <font size="2" face="Verdana, Arial, Helvetica, sans-serif">
			 <CFIF #read_data_info.clear_needed# NEQ "">#read_data_info.clear_needed#<CFELSE>NONE</cfif>
			  </font></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td valign="middle" colspan="3"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Comments:</strong></font></td>
  </tr>
  <tr>
    <td valign="middle" colspan="3"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><cfif #DATEDIFF("m", testDate, read_data_info.merge_date)# LT 12>-- #read_deed_info.data5# recorded on #read_deed_info.data11# from #read_deed_info.data1# #read_deed_info.data2# to #read_deed_info.data3# #read_deed_info.data4#<br></cfif><cfif #read_tax_info.data31# neq "Paid">-- Tax status: #read_tax_info.data31#, amount due: #read_tax_info.data28#</cfif></font></td>
  </tr></cfoutput>
  <tr>
    <td colspan="3"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="middle" colspan="3"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">This
      title review sheet must be filled out and included with every commitment
      sent to Champion Mortgage. A commitment received without this cover sheet
      will be considered incomplete.</font></strong></td>
  </tr>
</table>
</IE:DEVICERECT>




<CFELSEIF #READ_TITLE.COMP_ID# EQ 729>

<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM title
			where title_id = #rec_id#

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_comp">

			SELECT *
			FROM companies
			where ID = #read_title.comp_id#

		</CFQUERY>
	<CFQUERY datasource="#request.dsn#" NAME="read_hud">

			SELECT a_1108_a
			FROM hud_form_title_pg2
			where title_id = #rec_id#

		</CFQUERY>					<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
					SELECT *
					FROM recording_fees
					WHERE state = '#read_title.pstate#'


				</CFQUERY>
					<CFIF #read_rec_fees.recordcount# gt "0">
						<CFIF #read_rec_fees.mort_stamps# NEQ "0">
								<CFSET city_mort_stamps = #round(read_title.loanamt_float)# * #read_rec_fees.mort_stamps#>
			<cfelse>
			<CFSET city_mort_stamps = "0">
			</cfif>

	<cfif #read_title.searchType# eq "Purchase">
	<CFIF #read_rec_fees.transfer_tax# NEQ "0">
	<CFSET state_deed_1 = #read_title.loanamt_float# * #read_rec_fees.transfer_tax#>
		<cfelse>
			<CFSET state_deed_1 = "0">   <!-- 1203 total -->
			</cfif>
	<cfelse>
	<CFSET state_deed_1 = "0">
	</cfif>

	<CFIF #read_rec_fees.mort_rec_fee# NEQ "">
<Cfset rec_fee = #read_rec_fees.mort_rec_fee#>
<CFELSE>
<Cfset rec_fee = "0">
</cfif>


	<CFIF #read_rec_fees.release_rec_fee# NEQ "">
<Cfset rel_fee = #read_rec_fees.release_rec_fee#>
<CFELSE>
<Cfset rel_fee = "0">
</cfif>


	<CFIF #read_rec_fees.release_rec_fee# NEQ "" and #read_rec_fees.mort_rec_fee# neq "">
		<CFSET a_fee_total = "0">
		<cfelse>
			<CFSET a_fee_total = "0">
			</cfif>


		<CFIF #read_rec_fees.intangible_tax# NEQ "0" and  #read_rec_fees.intangible_tax# NEQ "">
	<CFSET intang_tax = #round(read_title.loanamt_float)# * #read_rec_fees.intangible_tax#>
		<cfelse>
			<CFSET intang_tax = "0">
			</cfif>




		<cfelse>
			<CFSET rec_fee = "0">
		<CFSET rel_fee = "0">
			<CFSET city_mort_stamps = "0">
				<CFSET a_fee_total = "0">
				<CFSET state_deed_1 = "0">
				<CFSET intang_tax = "0">
			</cfif>




			<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">

			SELECT *
			FROM company_billing_states
			WHERE company_id = '#read_title.comp_id#' and a_states = '#read_title.pstate#'

		</CFQUERY>

<cfoutput query="read_this_sets_billing_states">
		<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">

			SELECT *
			FROM company_billing_values
			WHERE billing_id = #read_this_sets_billing_states.billing_id#

		</CFQUERY>		</CFOUTPUT><CFOUTPUT>

<!--- <p style="page-break-after:always;">&nbsp;</p> --->
<IE:DEVICERECT ID="page100" CLASS="masterstyle" MEDIA="print">


	<table summary="" align="center" border="0" cellpadding="1" cellspacing="1" width="99%">


<tr><td align="left">
<cfif #read_comp.id# eq "729">

<cfif NOT DateDiff("d", Now(), "1/30/2012")>
FIRST TITLE & ESCROW, INC<BR>
7361 Calhoun Place Suite 200
<br>
Rockville, MD 20850<br><br>
<cfelse>
FIRST TITLE & ESCROW, INC<BR>
7361 Calhoun Place, Suite 200<br>
Rockville, MD 20855<br><br>
</cfif>
<CFELSE>

To: #read_comp.company#<br>
From: First Title<br>
</cfif>
Borrower: #read_title.bfirstname1# #read_title.blastname1# <cfif (read_title.manner_of_title neq '' and read_title.manner_of_title neq 'NULL')>(#read_title.manner_of_title#)</cfif><br>
Order Number: #read_title.title_id#<br>
Loan Amount: #read_title.loanamt_float#<br><br>
</td>
</tr>
</table>





				<table width="93%" cellpadding=0 cellspacing=0 border=0 >
    <TR>
        <td>


			<table width="93%" cellpadding=0 cellspacing=0 border=0 >

		<tr>
		<td width="50%"   background="e6e6e6">
		<cfif #read_title.searchType# eq "Refinance">


		<table width="100%" cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
  <tr>

		<td width="50%" colspan = 2   background="e6e6e6">
		<center><font size=2 color=blue face=arial><b>Refinance</b></font></center>
		</td>
		</tr>
	<cfif #read_this_sets_billing_values.a_1101# neq "">
	<tr>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1101. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width="50%" background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101#

		        </td>
	</tr>

	</cfif>
	<cfif #read_this_sets_billing_values.a_1102# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1102. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102#
				 </td>
			</tr>
			</cfif>
			<cfif #read_this_sets_billing_values.a_1103# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1103. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103#
					 </td>
			</tr>
			</cfif>
				<cfif #read_this_sets_billing_values.a_1104# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1104. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104#
		 </td>
	</tr>
	</cfif>
		<cfif #read_this_sets_billing_values.a_1105# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1105. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105#

		 </td>
	</tr>
	</cfif>
		<cfif #read_this_sets_billing_values.a_1106# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1106. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106#
	 </td>
	</tr>
	</cfif>
	<cfif #read_this_sets_billing_values.a_1107# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1107. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107#

		</td>
	</tr>
	</cfif>
	<cfif #read_hud.a_1108_a# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1109. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#read_hud.a_1108_a#

		</td>
	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1111# neq "">
		<tr>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1111.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">

		#read_this_sets_billing_values.a_1111_text#

		</td>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111#



		</td>


	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1112# neq "">

		<tr>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1112. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1112_text#
		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1113# neq "">
		<tr>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1113.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1113_text#
		</td>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113#

		</td>

	</tr>
</cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1201. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1201. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1201. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1202. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1203. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>
	#NumberFormat(state_deed_1, '_____.__')#


		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1204. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Intagible Tax">
Intagible Tax

		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>
  	#NumberFormat(intang_tax, '_____.__')#


		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1205# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1205.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1205_text#
		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1303.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_text#
		</td>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1304.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1304_text#
		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1305. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
			#read_this_sets_billing_values.a_1305_text#

		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305#




		</td>
	</tr>
</cfif>




	</table>


	<cfelseif #read_title.searchtype# eq "purchase">
	<table width="100%" cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>


<tr>

		<td width="50%" colspan = 2   background="e6e6e6">
		<center><font size=2  color=blue face=arial><b>Purchase</b></font></center>
		</td>
		</tr>
		<cfif #read_this_sets_billing_values.a_1101b# neq "">
	<tr>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1101. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101b#

		        </td>
	</tr>

	</cfif>
	<cfif #read_this_sets_billing_values.a_1102b# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1102. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102b#
				 </td>
			</tr>
			</cfif>
			<cfif #read_this_sets_billing_values.a_1103b# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1103. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103b#
					 </td>
			</tr>
			</cfif>
				<cfif #read_this_sets_billing_values.a_1104b# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1104. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104b#
		 </td>
	</tr>
	</cfif>
		<cfif #read_this_sets_billing_values.a_1105b# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1105. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105b#

		 </td>
	</tr>
	</cfif>
		<cfif #read_this_sets_billing_values.a_1106b# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1106. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106b#
	 </td>
	</tr>
	</cfif>
	<cfif #read_this_sets_billing_values.a_1107# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1107. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107b#

		</td>
	</tr>
	</cfif>
	<cfif #read_hud.a_1108_a# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1109. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#read_hud.a_1108_a#

		</td>
	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1111b# neq "">
		<tr>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1111.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">

			#read_this_sets_billing_values.a_1111_textb#

		</td>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111b#



		</td>


	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1112b# neq "">

		<tr>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1112. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1112_textb#
		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1113b# neq "">
		<tr>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1113.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1113_textb#
		</td>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113b#

		</td>

	</tr>
</cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1201. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1201. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1201. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1202. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1203. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>
	#NumberFormat(state_deed_1, '_____.__')#


		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1204. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Intagible Tax">
Intagible Tax

		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>
  	#NumberFormat(intang_tax, '_____.__')#


		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1205b# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1205.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1205_textb#
		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303b# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1303.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_textb#
		</td>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304b# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1304.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1304_textb#
		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304b#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305b# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1305. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">

		#read_this_sets_billing_values.a_1305_textb#
		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305b#




		</td>
	</tr>
</cfif>

	</table>
	<!---
	</td>

		<td width="50%"   background="e6e6e6">	--->
			<cfelse>
		<table width="100%" cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
		<!--- <tr>
		<td width="50%"   background="e6e6e6">	 --->
<tr>

		<td width="100%" colspan = 2   background="e6e6e6">
		<center><font size=2 color=blue face=arial><b>Second Mortgage<b></font></center>
		</td>
		</tr>
<cfif #read_this_sets_billing_values.a_1101c# neq "">
	<tr>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1101. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101c#

		        </td>
	</tr>

	</cfif>
	<cfif #read_this_sets_billing_values.a_1102c# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1102. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102c#
				 </td>
			</tr>
			</cfif>
			<cfif #read_this_sets_billing_values.a_1103c# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1103. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103c#
					 </td>
			</tr>
			</cfif>
				<cfif #read_this_sets_billing_values.a_1104c# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1104. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104c#
		 </td>
	</tr>
	</cfif>
		<cfif #read_this_sets_billing_values.a_1105c# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1105. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105c#

		 </td>
	</tr>
	</cfif>
		<cfif #read_this_sets_billing_values.a_1106c# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1106. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106c#
	 </td>
	</tr>
	</cfif>
	<cfif #read_this_sets_billing_values.a_1107c# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1107. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107c#

		</td>
	</tr>
	</cfif>
	<cfif #read_hud.a_1108_a# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1109. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#read_hud.a_1108_a#

		</td>
	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1111c# neq "">
		<tr>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1111.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">

			#read_this_sets_billing_values.a_1111_textc#

		</td>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111c#



		</td>


	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1112c# neq "">

		<tr>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1112. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1112_textc#
		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112c#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1113c# neq "">
		<tr>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1113.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1113_textc#
		</td>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113c#

		</td>

	</tr>
</cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1201. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1201. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1201. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1202. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1203. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>
	#NumberFormat(state_deed_1, '_____.__')#


		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1204. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Intagible Tax">
Intagible Tax

		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>
  	#NumberFormat(intang_tax, '_____.__')#


		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1205c# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1205.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1205_textc#
		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205c#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303c# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1303.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_textc#
		</td>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303c#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304c# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1304.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1304_textc#
		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304c#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305c# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1305. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
				#read_this_sets_billing_values.a_1305_textc#

		</td>
			<td width="50%"  background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305c#




		</td>
	</tr>
</cfif>
</table></cfif>
		</td></tr></table >	</td></tr></table >


		<cfif #read_comp.id# eq "729">
<table  border="0" cellpadding="1" cellspacing="1" width="99%">
<tr>
<td align="left"><br><br>
Please forward all recording packages to the address below, and make payment of all clerk's charges to:<br><br></td>
</tr>
<tr>
<td  align="left">
Abstracts USA, LLC.<br>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
7361 Calhoun Place Suite 200
<br>
4th Floor<br>
Rockville, MD 20850
<br><br>
<cfelse>
7361 Calhoun Place<br>
Suite 200<br>
Rockville, MD 20855
<br><br>
</cfif></td></tr><tr>
<td align="left">
IN ORDER TO BEST SERVE YOU PLEASE PROVIDE THE FOLLOW DOCUMENTS AT THE TIME OF RECORDING FOR FINAL POLICY:<br><br>


1. CLOSING INSTRUCTIONS AND ANY AMENDMENTS<br>
2. SIGNED CERTIFIED COPY OF THE HUD-1<br>
3. RECORDING ORIGINALS OR EVIDENCE OF THE RECORDED DOCUMENT<br>
4. PAYOFF DEMANDS<br>
5. COPY OF THE DISBURSEMENT LEDGER<br>
6. OWNERS AFFIDAVITS<br>
7. LIEN POSITION  1ST ____________  2ND __________________<br>
8. ANY CHANGES TO THE OWNERSHIP INTEREST: YES ___________ NO __________<br><br>


PLEASE NOTE:  CHECKS MUST BE PAYABLE TO FIRST TITLE AND ESCROW, INC. FOR RECORDING AND POLICIES, ANY OVERAGES WILL BE REFUNDED WITHIN 10 BUSINESS DAYS.  FOR ALL SHORTAGES WE WILL CONTACT YOUR OFFICE WITHIN 48 HOURS FOR THE CORRECTIONS.<br><br>

ANY SHORTAGES IN THE RECORDING OR POLICY PREMIUM MAY DELAY THE RECORDING OR POLICY BEING ISSUED.<br>

<br><br>
</td>
</tr>
</table>
<CFELSE>
<table  border="0" cellpadding="1" cellspacing="1" width="99%">
<tr>
<td align="left"><br><br>
These fees above do not include any charges for title endorsements unless indicated above.  Please contact your First Title representative for pricing.
</td>
</tr>
<tr>
<td align="left">
If the loan amount on this sheet differs from the current loan amount,
please call our office or email at <cfoutput>#team_email#</cfoutput>
to have a new fee sheet created.<br><br>
</td>
</tr>
</table>
</cfif>


</IE:DEVICERECT>
</cfoutput>

</cfif>


<!---Harry Travis 11/23/2004
Adding a very special letter if this is California or Nevada --->
<CFIF #read_Title.pstate# eq "CA" >
<!--- <p style="page-break-after:always;">&nbsp;</p> --->
<IE:DEVICERECT ID="page1" CLASS="masterstyle" MEDIA="print">
<table width="93%" cellpadding=0 cellspacing=0 border=0 >
    <TR>
        <td><BR></td>
    </tr>
    <tr>
        <td>
            <B>First Title & Escrow</B></Center>
        </td>
    </tr><cfif NOT DateDiff("d", Now(), "1/30/2012")>
    <tr>
        <td>
            <B>7361 Calhoun Place Suite 200
</B></Center>
        </td>
    </tr>
        <tr>
        <td>
            <B>Rockville, MD 20850</B></Center>
        </td>
    </tr>
<cfelse>
    <tr>
        <td>
            <B>7361 Calhoun Place, Suite 200</B></Center>
        </td>
    </tr>
        <tr>
        <td>
            <B>Rockville, MD 20855</B></Center>
        </td>
    </tr>
</cfif>


<cfoutput>
<tr>
        <td>
            <B>Main Phone 301-279-0303</B></Center>
        </td>
    </tr>
    <tr>
        <td>
            <a href="https://#cgi.server_name#" target="_blank">#cgi.server_name#</a></B></Center>
        </td>
    </tr>
</cfoutput>
    <tr>
        <td>
            <BR><BR>
        </td>
    </tr>
    <CFOUTPUT>
    <TR>
        <td>Attention:  #read_title.oname#</td>
    </tr>
    <TR>
        <td>#read_FT_company.company#</td>
    </tr>
    <tr>
        <td>Property Address:&nbsp;&nbsp;#read_title.paddress#,&nbsp;#read_title.pcity#,&nbsp;#read_title.pstate#&nbsp;#read_title.pzip#
        </td>
    </tr>
    </CFOUTPUT>
    <tr>
        <td>
            <BR><BR><BR>
        </td>
    </tr>
    <tr>
        <td>
            <HR>
        </td>
    </tr>
    <TR>
        <td>
            Attached please find your Title Insurance Commitment requested on the above referenced property.  The<BR>
            commitment is issued through Stewart Title Guaranty Company.
            <B>Please contact your <U>client services representative</U> or <U>customer service team</U> at <U>First Title</U> should you <BR>have any questions on the commitment.</B>

Thank you for entrusting us with your business.

        </td>
    </TR>
    <tr>
        <td>
            <BR><BR><BR>
        </td>
    </tr>
    <tr>
        <td>
            Very truly yours,
        </td>
    </tr>
    <tr>
        <td>
            <BR><BR><BR>
        </td>
    </tr>
    <tr>
        <td>
            First Title & Escrow, Inc.
        </td>
    </tr>
     <tr>
        <td>
            <BR><BR><BR>
        </td>
    </tr>
</table>
</IE:DEVICERECT>
</CFIF>
<!---End of Very Special Letter--->


<!--- <cfif (read_title.comp_id eq 3182  or read_title.comp_id eq 2368 or ListContainsNoCase(children, read_title.comp_id, ",")) and Not GetBaseTemplatePath() contains 'rosicki_form.cfm' and read_rosicki.recordcount and read_title.comp_id neq 3444>
<cfinclude template="admin_area/rosicki_stewart_form_display.cfm">
</cfif>
<cfif (read_title.comp_id eq 3251 or read_title.comp_id eq 3444) and Not GetBaseTemplatePath() contains 'keystone_form.cfm' and read_keystone.recordcount>
<cfinclude template="admin_area/keystone_stewart_form_display.cfm">
</cfif> --->




<IE:DEVICERECT ID="<CFOUTPUT><CFIF #read_Title.pstate# eq "CA" OR #read_Title.pstate# eq "NV">page2<CFELSE>Page1</CFIF></cfoutput>" CLASS="masterstyle" MEDIA="print">

<!----1st page starts ----->
<!----------body table starts---------->
<!--- <table width=98% cellpadding=0 cellspacing=0 border=2 align="center" bordercolor="000000" bordercolordark="000000" bordercolorlight="000000">
<tr><td valign="top" align="center">
====================================================================== --->
<!--- =================[ BEGIN SCHEDULE A         ]======================== --->
<!--- ====================================================================== --->

<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:12px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:14px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:12px}
</style>

<table width="83%" cellpadding=0 cellspacing=0 border=0 >
    <tr>
          <td><strong><!---THE FOLLOWING COMMITMENT FOR TITLE INSURANCE IS NOT VALID UNLESS YOUR NAME AND THE POLICY AMOUNT ARE SHOWN IN SCHEDULE A, AND OUR AUTHORIZED REPRESENTATIVE HAS COUNTERSIGNED BELOW.</strong>
		  <br>
<br><br><br>

		 ISSUED BY:<BR>--->
		 <div align="left">
<img src="http://<cfoutput>#cgi.server_name#</cfoutput>/images/wfg_logo.jpg">
			<br></div>
		 <div align="center">
<strong>TEXAS<br>
COMMITMENT FOR TITLE INSURANCE (T-7)<br>
ISSUED BY<br>
WFG NATIONAL TITLE INSURANCE COMPANY</strong><br><br />
THE FOLLOWING COMMITMENT FOR TITLE INSURANCE IS NOT VALID UNLESS YOUR NAME AND THE POLICY AMOUNT ARE SHOWN IN SCHEDULE A,<br />
AND OUR AUTHORIZED REPRESENTATIVE HAS COUNTERSIGNED BELOW.</div>
            <BR><BR>
  
We, WFG NATIONAL TITLE INSURANCE COMPANY, will issue our title insurance policy or policies (the Policy) to You (the proposed insured) upon payment of the premium and other charges due, and compliance with the requirements in Schedule C. Our Policy will be in the form approved by the Texas Department of Insurance at the date of issuance, and will insure your interest in the land described in Schedule A. The estimated premium for our Policy and applicable endorsements is shown on Schedule D. There may be additional charges such as recording fees, and expedited delivery expenses. <br />
<br />

This Commitment ends ninety (90) days from the effective date, unless the Policy is issued sooner, or failure to issue the Policy is our fault. Our liability and obligations to you are under the express terms of this Commitment and end when this Commitment expires. 
<BR><BR>


In witness whereof, the Company has caused this commitment to be signed and sealed as of the effective date of commitment as shown in Schedule A, the commitment to become valid and binding only when countersigned by an authorized signatory.<BR><BR><BR><BR>
					<div align="center">
                     <img src="http://<cfoutput>#cgi.server_name#</cfoutput>/images/wfg_sigs.jpg"><br><BR></div>
		 </td>
    </tr>
    <tr>
    <td><BR /><BR />
    <strong>FIRST TITLE & ESCROW, INC.</strong><br />
<br />
<br />
<br />
<br />
<strong>By: ____________________________________________________</strong><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Authorized Signature</strong><br />
<br />
<br />
<br />
<center><strong>CONDITIONS AND STIPULATIONS</strong></center><br /><BR />
<ol><li>If you have actual knowledge of any matter which may affect the title or mortgage covered by this Commitment, that is not shown in Schedule B, you must notify us in writing. If you do not notify us in writing, our liability to you is ended or reduced to the extent that your failure to notify us affects our liability. If you do notify us, or we learn of such matter, we may amend Schedule B, but we will not be relieved of liability already incurred.<BR /><BR /></li> 
<li>Our liability is only to you, and others who are included in the definition of Insured in the Policy to be issued. Our liability is only for actual loss incurred in your reliance on this Commitment to comply with its requirements, or to acquire the interest in the land. Our liability is limited to the amount shown in Schedule A of this Commitment and will be subject to the following terms of the Policy: Insuring Provisions, Conditions and Stipulations, and Exclusions.</li>
</ol> 

    
    </td>
    </tr>
</table><br>
<br>
<table width="83%" cellpadding=0 cellspacing=0 border=0 >
<tr>
<td><font size="-2" color="gray">Texas Form T-7: Commitment for Title Insurance (1/3/14)<BR>
WFG National Form No. 3166748</font>
</td>
</tr></table>
<br>
<br>
<HR>
<br>
<br>
<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:11px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:14px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:12px}
</style>

<table width="93%" cellpadding=0 cellspacing=0 border=0 >
    <tr>
          <td>
		 <div align="center">
<strong>WFG NATIONAL TITLE INSURANCE COMPANY<br />
<br />
TEXAS TITLE INSURANCE INFORMATION</strong>
</div>
          </td>
    </tr>
</table><br>

<br>
<table width="93%" cellpadding=1 cellspacing=2 border=0 bgcolor="#000000">
<tr>
<td>
<table width="100%" cellpadding=2 cellspacing=1 border=0 bgcolor="#ffffff">
<tr>
<td width="50%" align="left" valign"top">
Title insurance insures you against loss resulting from certain risks to your title. <br><br>

The commitment for Title Insurance is the title insurance company's promise to issue the title insurance policy. The commitment is a legal document. You should review it carefully to completely understand it before your closing date.


</td>
<td width="1" bgcolor="#000000">&nbsp;</td>
<td width="50%" align="left" valign"top">
El seguro de titulo le asegura en relacion a perdidas resultantes de ciertos riesgos que pueden afectar el titulo de su propiedad. <BR><BR>

El Compromiso para Seguro de Titulo es la promesa de la compania aseguradora de titulos de emitir la poliza de seguro de titulo. El Compromiso es un documento legal. Usted debe leerlo cuidadosamente y entenderlo completamente antes de la fecha para finalizar su transaccion.

</td>
</tr>
</table>
</td>
</tr>
</table>
<br>
<table width="93%" cellpadding=0 cellspacing=0 border=0 >
    <tr>
          <td align="left" valign="top">
Your commitment for Title Insurance is a legal contract between you and us. The Commitment is not an opinion or report of your title. It is a contract to issue you a policy subject to the Commitment's terms and requirements. <BR><BR>

Before issuing a Commitment for Title Insurance (the Commitment) or a Title Insurance Policy (the Policy), the title insurance Company (the Company) determines whether the title is insurable. This determination has already been made. Part of that determination involves the Company's decision to insure the title except for certain risks that will not be covered by the Policy. Some of these risks are listed in Schedule B of the attached Commitment as Exceptions. Other risks are stated in the Policy as Exclusions. These risks will not be covered by the Policy. The Policy is not an abstract of title nor does a Company have an obligation to determine the ownership of any mineral interest.<BR><BR>

<strong>MINERALS AND MINERAL RIGHTS</strong> may not be covered by the Policy. The Company may be unwilling to insure title unless there is an exclusion or an exception as to Minerals and Mineral Rights in the Policy.  Optional endorsements insuring certain risks involving minerals, and the use of improvements (excluding lawns, shrubbery and trees) and permanent buildings may be available for purchase.  If the title insurer issues the title policy with an exclusion or exception to the minerals and mineral rights, neither this Policy, nor the optional endorsements, ensure that the purchaser has title to the mineral rights related to the surface estate.<BR><BR>

Another part of the determination involves whether the promise to insure is conditioned upon certain requirements being met. Schedule C of the Commitment lists these requirements that must be satisfied or the Company will refuse to cover them. You may want to discuss any matters shown in Schedules B and C of the Commitment with an attorney. These matters will affect your title and your use of the land. <BR><BR>

When your Policy is issued, the coverage will be limited by the Policy's Exceptions, Exclusions and Conditions, defined below. <BR><BR>

<ul type="-">
<li><strong>EXCEPTIONS</strong> are title risks that a Policy generally covers but does not cover in a particular instance. Exceptions are shown on Schedule B or discussed in Schedule C of the Commitment. They can also be added if you do not comply with the Conditions section of the Commitment. When the Policy is issued, all Exceptions will be on Schedule B of the Policy.</li><BR>

<li><strong>EXCLUSIONS</strong> are title risks that a Policy generally does not cover. Exclusions are contained in the Policy but not shown or discussed in the Commitment.</li> <BR>

<li><strong>CONDITIONS</strong> are additional provisions that qualify or limit your coverage. Conditions include your responsibilities and those of the Company. They are contained in the Policy but not shown or discussed in the Commitment. The Policy Conditions are not the same as the Commitment Conditions.</li><BR>
</ul>

You can get a copy of the policy form approved by the Texas Department of Insurance by calling the Title Insurance Company at 1-800-729-1902 or by calling the title insurance agent that issued the Commitment. The Texas Department of Insurance may revise the policy form from time to time. <BR><BR>

You can also get a brochure that explains the policy from the Texas Department of Insurance by calling 1-800-252-3439. <BR><BR>

Before the Policy is issued, you may request changes in the Policy. Some of the changes to consider are: <BR><BR>

<ul type="-">
<li>Request amendment of the "area and boundary" exception (Schedule B, paragraph 2). To get this amendment, you must furnish a survey and comply with other requirements of the Company. On the Owner Policy, you must pay an additional premium for the amendment. If the survey is acceptable to the Company and if the Company's other requirements are met, your Policy will insure you against loss because of discrepancies or conflicts in boundary lines, encroachments or protrusions, or overlapping of improvements. The Company may then decide not to insure against specific boundary or survey problems by making special exceptions in the Policy. Whether or not you request amendment of the "area and boundary" exception, you should determine whether you want to purchase and review a survey if a survey is not being provided to you.</li><BR>

<li>Allow the Company to add an exception to "rights of parties in possession". If you refuse this exception, the Company or the title insurance agent may inspect the property. The Company may except to and not insure you against the rights of specific persons, such as renters, adverse owners or easement holders who occupy the land. The Company may charge you for the inspection. If you want to make your own inspection, you must sign a Waiver of Inspection form and allow the Company to add this exception to your Policy.</li><BR>
</ul>
The entire premium for a Policy must be paid when the Policy is issued. You will not owe any additional premiums unless you want to increase your coverage at a later date and the Company agrees to add an Increased Value Endorsement. <BR><BR>
</td>
	</tr>
</table>
</td>
	</tr>
</table>
<br>
<br>
<table width="83%" cellpadding=0 cellspacing=0 border=0 >
<tr>
<td><font size="-2" color="gray">Texas Form T-7: Commitment for Title Insurance (1/3/14)<BR>
WFG National Form No. 3166748</font>
</td>
</tr></table>
<br>
<br>
<HR>
<br>
<br>


<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size: 12px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20pt}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:12pt}
.medium_header {font-family:Arial, Helvetica, sans-serif; font-size:18pt}
</style>
<cfoutput>
<center>

<table width="93%" cellpadding=0 cellspacing=0 border=0 >
    <tr>
          <td>
		 <div align="center">
<strong>DELETION OF ARBITRATION PROVISION</strong><br />
(Not applicable to the Texas Residential Owner Policy)<br />
</div>
          </td>
    </tr>
</table><br>


<table width="93%" cellpadding=0 cellspacing=0 border=0 >
    <tr>
          <td>
ARBITRATION is a common form of alternative dispute resolution. It can be a quicker and cheaper means to settle a dispute with your Title Insurance Company. However, if you agree to arbitrate, you give up your right to take the Title Insurance Company to court and your rights to discovery of evidence may be limited in the arbitration process. In addition, you cannot usually appeal an arbitrator's award.<br /><br />

<strong>Your policy contains an arbitration provision (shown below). It allows you or the Company to require arbitration if the amount of insurance is $2,000,000 or less. If you want to retain your right to sue the Company in case of a dispute over a claim, you must request deletion of the arbitration provision before the policy is issued. You can do this by signing this form and returning it to the Company at or before the closing of your real estate transaction or by writing to the Company.</strong><br /><br />

The arbitration provision in the Policy is as follows:<br /><br />

“Either the Company or the Insured may demand that the claim or controversy shall be submitted to arbitration pursuant to the Title Insurance Arbitration Rules of the American Land Title Association (“Rules”).  Except as provided in the Rules, there shall be no joinder or consolidation with claims or controversies of other persons.  Arbitrable matters may include, but are not limited to, any controversy or claim between the Company and the Insured arising out of or relating to this policy, any service in connection with its issuance or the breach of a policy provision, or to any other controversy or claim arising out of the transaction giving rise to this policy.  All arbitrable matters when the Amount of Insurance is $2,000,000 or less shall be arbitrated at the option of either the Company or the Insured, unless the Insured is an individual person (as distinguished from an Entity).  All arbitrable matters when the Amount of Insurance is in excess of $2,000,000 shall be arbitrated only when agreed to by both the Company and the Insured.  Arbitration pursuant to this policy and under the Rules shall be binding upon the parties.  Judgment upon the award rendered by the Arbitrator(s) may be entered in any court of competent jurisdiction.”<br /><br />

<table width="93%" cellpadding=0 cellspacing=0 border=0 >
    <tr>
          <td>______________________________________________</td>
          <td>______________________________________________</td>
    </tr>
    <tr>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Signature<br /><br /><br /><br /></td>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date<br /><br /><br /><br /></td>
    </tr>
    <tr>
          <td>______________________________________________</td>
          <td>______________________________________________</td>
    </tr>
    <tr>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Signature</td>
          <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date</td>
    </tr>
</table><br>

          </td>
    </tr>
</table><br>

<table width="93%" cellpadding=0 cellspacing=0 border=0 >
    <tr>
          <td>
		 <div align="center">
<strong>IMPORTANT INFORMATION</strong><br />
</div>
          </td>
    </tr>
</table><br>

<table width="93%" cellpadding=0 cellspacing=0 border=0 >
    <tr>
          <td>
		 FOR INFORMATION, OR TO MAKE A COMPLAINT CALL OUR TOLL-FREE TELEPHONE NUMBER 1-800-257-2842. ALSO YOU MAY CONTACT THE TEXAS DEPARTMENT OF INSURANCE AT 1-800-252-3439 to obtain information on: <br />
<ol>
<li>Filing a complaint against an insurance company or agent,</li> 
<li>Whether an insurance company or agent is licensed, </li>
<li>Complaints received against an insurance company or agent, </li>
<li>Policyholder rights, and</li> 
<li>A list of consumer publications and services available through the Department.</li> 
</ol>
YOU MAY ALSO WRITE TO THE TEXAS DEPARTMENT OF INSURANCE, P.O. BOX 149104, AUSTIN, TEXAS 78714-9104. FAX NO. (512) 475-1771.<br /><br />
<strong>AVISO IMPORTANTE</strong><BR /><BR />
PARA INFORMACION, O PARA SOMETER UNA QUEJA LLAME AL NUMERO GRATIS 1-800-257-2842. TAMBIEN PUEDE COMUNICARSE CON EL DEPARTMENTO DE SEGUROS DE TEXAS AL 1-800-252-3439 para obtener informacion sobre: 
<ol>
<li>Como someter una queja en contra de una compania de seguros o agente de seguros,</li> 
<li>Si una compania de seguros o agente de seguros tiene licencia,</li> 
<li>Quejas recibidas en contra de una compania de seguros o agente de seguros,</li> 
<li>Los derechos del asegurado, y </li>
<li>Una lista de publicaciones y servicios para consumidores disponibles a traves del Departmento.</li>
</ol> 

TAMBIEN PUEDE ESCRIBIR AL DEPARTMENTO DE SEGUROS DE TEXAS, P.O. BOX 149104, AUSTIN, TEXAS 78714-9104. FAX NO. (512) 475-1771.
 


          </td>
    </tr>
</table><br>
<table width="83%" cellpadding=0 cellspacing=0 border=0 >
<tr>
<td><font size="-2" color="gray">Texas Form T-7: Commitment for Title Insurance (1/3/14)<BR>
WFG National Form No. 3166748</font>
</td>
</tr></table>

</cfoutput>
</CENTER>



<hr>


<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size: 12px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20pt}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:12pt}
.medium_header {font-family:Arial, Helvetica, sans-serif; font-size:18pt}
</style>
<cfoutput>
<center>
		 <div align="center">
<strong>SCHEDULE A</strong><br />
</div>




	<table align="center" width="93%">
<tr>
<td align"left" valign="top" width="50%">Effective Date: <strong>#DateFormat(read_deed.data37, "mm/dd/yyyy")#</strong></td>
<td align"right" valign="top" width="50%">GF No.: <strong>#read_title.title_id# T</strong></td>
</tr>
</table>
<br>

<table align="center" width="93%" cellpadding="2">
<tr>
<td align"left" valign="top" colspan="2">Issued <strong>#DateFormat(Now(), "long")# #TimeFormat(Now(), "medium")#</strong></td>
</tr>
<tr>
<td align"left" valign="top" width="40">1.</td>
<td align"left" valign="top">
The policy or policies to be issued are:<BR>
<ol type="a">
<cfif read_title.title_id eq 119766 or read_title.title_id eq 117883 or read_title.title_id eq 120304 or read_title.title_id eq 119718 or read_title.title_id eq 123154 or read_title.title_id eq 137434>
<li>OWNER'S POLICY OF TITLE INSURANCE (Form T-1)<BR>
(Not applicable for improved one-to-four family residential real estate)<BR>
Policy Amount: $<cfif IsNumeric(Trim(read_title.purchase)) and #read_title.purchase# neq "" and #read_title.purchase# neq 0 and #read_title.purchase# neq 'NULL'>#NumberFormat(read_title.purchase, "999,999,999.00")#<cfelse></cfif><BR>
PROPOSED INSURED:<cfif read_title.searchType eq 'Purchase'><cfif Len(read_title.company1)>#read_title.company1#<cfelse><cfif Len(read_title.blastname1)>#read_title.bfirstname1# #read_title.blastname1# <cfif Len(read_title.blastname2)>, #read_title.bfirstname2# #read_title.blastname2# </cfif><cfif Len(read_title.blastname3)>, #read_title.bfirstname3# #read_title.blastname3# </cfif><cfif Len(read_title.blastname4)>, #read_title.bfirstname4# #read_title.blastname4# </cfif><cfelse></cfif></cfif></cfif><BR><BR></li>
<li>TEXAS RESIDENTIAL OWNER'S POLICY OF TITLE INSURANCE<BR>
- ONE-TO-FOUR FAMILY RESIDENCES (Form T-1R)<BR>

Policy Amount: $<B> </B><BR>
PROPOSED INSURED:	<BR><BR></li>
<cfelse>
<li>OWNER'S POLICY OF TITLE INSURANCE (Form T-1)<BR>
(Not applicable for improved one-to-four family residential real estate)<BR>
Policy Amount: $<BR>
PROPOSED INSURED:<BR><BR></li>
<li>TEXAS RESIDENTIAL OWNER'S POLICY OF TITLE INSURANCE<BR>
- ONE-TO-FOUR FAMILY RESIDENCES (Form T-1R)<BR>

Policy Amount: $<B> <cfif IsNumeric(Trim(read_title.purchase)) and #read_title.purchase# neq "" and #read_title.purchase# neq 0 and #read_title.purchase# neq 'NULL'>#NumberFormat(read_title.purchase, "999,999,999.00")#<cfelse></cfif></B><BR>
PROPOSED INSURED:	<cfif read_title.searchType eq 'Purchase'><cfif Len(read_title.company1)>#read_title.company1#<cfelse><cfif Len(read_title.blastname1)>#read_title.bfirstname1# #read_title.blastname1# <cfif Len(read_title.blastname2)>, #read_title.bfirstname2# #read_title.blastname2# </cfif><cfif Len(read_title.blastname3)>, #read_title.bfirstname3# #read_title.blastname3# </cfif><cfif Len(read_title.blastname4)>, #read_title.bfirstname4# #read_title.blastname4# </cfif><cfelse></cfif></cfif></cfif><BR><BR></li>
</cfif>

<li>MORTGAGE POLICY OF TITLE INSURANCE (Form T-2)<BR>
Policy Amount:  $<B> <cfif #read_title.loanamt_float# neq "" and #read_title.loanamt_float# neq 0 and #read_title.loanamt_float# neq 'NULL'>#NumberFormat(read_title.loanamt_float, "999,999,999.00")#<cfelse>&nbsp;</cfif></B><BR>
PROPOSED INSURED:	<cfif #read_title.loanamt_float# neq "" and #read_title.loanamt_float# neq 0 and #read_title.loanamt_float# neq 'NULL'>#read_title.insured#, and each successor in ownership of the indebtedness secured by the insured mortgage, except a successor who is an obligor under the provisions of Section 12(c) of the Conditions.<cfelse>&nbsp;</cfif><BR>
Proposed Borrower:	<cfif #read_title.loanamt_float# neq "" and #read_title.loanamt_float# neq 0 and #read_title.loanamt_float# neq 'NULL'><cfif Len(read_title.blastname1)>#read_title.bfirstname1# #read_title.blastname1# <cfif Len(read_title.blastname2)>, #read_title.bfirstname2# #read_title.blastname2# </cfif><cfif Len(read_title.blastname3)>, #read_title.bfirstname3# #read_title.blastname3# </cfif><cfif Len(read_title.blastname4)>, #read_title.bfirstname4# #read_title.blastname4# </cfif><cfelse></cfif><cfelse>&nbsp;</cfif><BR><BR></li>
<li>TEXAS SHORT FORM RESIDENTIAL MORTGAGEE POLICY OF TITLE INSURANCE (Form T 2R)<BR>
Policy Amount:  $ <BR>
PROPOSED INSURED:	<BR>
Proposed Borrower:	<BR><BR></li>
<cfif read_title.title_id eq '134843'>
<li>MORTGAGE POLICY OF TITLE INSURANCE (Form T-2): <BR>
Policy Amount:  $30,000 <BR>
PROPOSED INSURED:	Achieva Mortgage Funding, LLC Lending, and each successor in ownership of the indebtedness secured by the insured mortgage, except a successor who is an obligor under the provisions of Section 12(c) of the Conditions.
<BR>
Proposed Borrower: Michael R Hughes, Valerie J. Hughes<BR><BR></li>
<cfelse>
<li>OTHER: <BR>
Policy Amount:  $ <BR>
PROPOSED INSURED:	<BR>
Proposed Borrower:<BR><BR></li>
</cfif>
</ol></td>
</tr>

<tr>
<td align"left" valign="top" width="40">2.</td>
<td align"left" valign="top">The interest in the land covered by this Commitment is:<br>
<cfif read_title.title_id eq 127888>
Tract 1: Fee Simple&nbsp;&nbsp;&nbsp;Tract 2: Easement Estate
<cfelse>
#read_deed.data38#
</cfif></td>
</tr>


<tr>
<td align"left" valign="top" width="40">3.</td>
<td align"left" valign="top">Record title to the land on the Effective Date appears to be vested in:<br>
<cfif read_title.vesting_override neq '' and read_title.vesting_override neq 'NULL'>#read_title.vesting_override#<cfelse>
<cfif read_title.title_id eq 52901>Elizabeth Warren<cfelseif read_title.title_id eq 52914>Julie Konik<cfelseif read_title.title_id eq 44863>Emilio R. Limchoa and Imelda T. Limchoa<cfelseif read_title.title_id eq 52794>The Village Cooperative Homes<cfelseif read_title.title_id eq 44894>Kindra McLeroy Pack, Barbara A. McLeroy and Wayne McLeroy by Barbara A. McLeroy, his heir.<cfelseif read_title.title_id eq 59179>Chang-Tai Hsieh and Sally Jo Hsieh<cfelseif read_title.title_id eq 57411>ALEXANDER MAKRIS<cfelseif read_title.comp_id eq 3943 or read_title.comp_id eq 4043 or read_title.comp_id eq 4042>#read_title.full_vesting#<cfelse>#read_title_data.data3#<cfif #read_title_data.data4# neq "">&nbsp;AND&nbsp;#read_title_data.data4#</cfif><cfif #read_title_data.data6# neq "">,&nbsp;#read_title_data.DATA6#</b></font></cfif></cfif>
</cfif></td>
</tr>

<tr>
<td align"left" valign="top" width="40">4.</td>
<td align"left" valign="top">Legal description of land:<br>
See continuation of Schedule A.<br>
</td>
</tr>
<tr>
<td align"left" valign="top" colspan="2">&nbsp;&nbsp;
</td>
</tr>


<tr>
<td align"left" valign="top" colspan="2">Countersigned:<BR>
Title & Escrow of Texas, Inc.<BR><BR><br><br>
<br>




By  <cfif ListFind("524,529",session.ft_user_id) ><img src="/images/nathan_sig2.jpg" width="300"><cfelseif ListFind("632",session.ft_user_id) ><img src="http://<cfoutput>#cgi.server_name#</cfoutput>/images/sarah_sig2.jpg"  width="300"><cfelseif ListFind("633",session.ft_user_id) ><img src="http://<cfoutput>#cgi.server_name#</cfoutput>/images/sherry_sig2.jpg"  width="300"><cfelse>______________________________________________</cfif><BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Authorized Signatory</td>
</tr>
</table>
</cfoutput>
</CENTER>
<table width="83%" cellpadding=0 cellspacing=0 border=0 >
<tr>
<td><font size="-2" color="gray">Texas Form T-7: Commitment for Title Insurance (1/3/14)<BR>
WFG National Form No. 3166748</font>
</td>
</tr></table>
</body>




<hr>





<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size: 12px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20pt}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:12pt}
.medium_header {font-family:Arial, Helvetica, sans-serif; font-size:18pt}
</style>
<cfoutput><table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left"><font color="black" size="1">G.F. No.: #read_title.title_id# T</font></td>
  </tr>
</table></cfoutput>
<center>
		 <div align="center">
<strong>SCHEDULE A</strong> (continued)<br />
</div>
		 <div align="center">
<strong>Legal Description</strong><br />
</div>



<table align="center" width="93%" cellpadding="2">
<tr>
<td align"left" valign="top">
<cfoutput>
		<cfif #read_title_data.notes# neq "">#read_title_data.notes#</cfif><br>
<br>

		<!--- <cfif #read_title_data.data1# NEQ ""> Being the same property as transferred by #read_title_data.data5# on #DateFormat(read_title_data.data10, "mm")#/#DateFormat(read_title_data.data10, "dd")#/#DateFormat(read_title_data.data10, "yyyy")# and recorded #DateFormat(read_title_data.data11, "mm")#/#DateFormat(read_title_data.data11, "dd")#/#DateFormat(read_title_data.data11, "yyyy")# from #read_title_data.data1#
		<cfif #read_title_data.data2# NEQ ""> and #read_title_data.data2#</CFIF> to #read_title_data.data3#
		<CFIF #read_title_data.data4# NEQ "">and #read_title_data.data4#</CFIF>, #read_title_data.data6#,
		<cfif #read_title_data.data7# eq "">
		<CFIF #read_title_data.data8# NEQ ""> recorded in Book #read_title_data.data8#</cfif>
		<cfif #read_title_data.data9# neq ""> and Page #read_title_data.data9#</cfif>
		<cfelse>
			recorded in Document Number #read_title_data.data7#

			<!---(start) -- Added by Synechron Development for ticket# 454 Dt. 11-27-2013-------->
			<cfif  #len(read_title_data.data7)# gt 0 AND #len(read_title_data.data8)# gt 0 > ,</cfif>
			<cfif #len(read_title_data.data8)# gt 0 AND #len(read_title_data.data9)# gt 0 >
			in Book #read_title_data.data8# at Page #read_title_data.data9#
			</cfif>
			<!---(end) -- Added by Synechron Development for ticket# 454 ------->
		</cfif>
		</cfif>
		<br><br> --->

#read_title_data.data14#<br><br>
</cfoutput></td>
</tr>
</table>
<table width="83%" cellpadding=0 cellspacing=0 border=0 >
<tr>
<td><font size="-2" color="gray">Texas Form T-7: Commitment for Title Insurance (1/3/14)<BR>
WFG National Form No. 3166748</font>
</td>
</tr></table>
</CENTER>




<hr>

<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:10pt}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:18pt}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:12pt}
.medium_header {font-family:Arial, Helvetica, sans-serif; font-size:14pt}
</style>

<cfoutput><table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left"><font color="black" size="1">G.F. No.: #read_title.title_id# T</font></td>
  </tr>
</table></cfoutput>

<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size: 12px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20pt}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:12pt}
.medium_header {font-family:Arial, Helvetica, sans-serif; font-size:18pt}
</style>
<center>
<cfoutput>
		 <div align="center">
<strong>SCHEDULE B</strong><br />
Exceptions from Coverage<br />
</div>

<table align="center" width="93%" cellpadding="2">

<tr>
<td align"left" valign="top">
In addition to the Exclusions and Conditions and Stipulations, your Policy will not cover loss, costs, attorney’s fees, and expenses resulting from:<BR>

<ol>
<li>The following restrictive covenants of record itemized below: <cfif Len(read_deed.covenants)><BR>#read_deed.covenants#</cfif></li><BR>

<li>Any discrepancies, conflicts, or shortages in area or boundary lines, or any encroachments or protrusions, or any overlapping of improvements.</li><BR>
<li>Homestead or community property or survivorship rights, if any, of any spouse of any insured. (Applies to the Owner Policy only.)</li><BR>
<li>Any titles or rights asserted by anyone, including, but not limited to, persons, the public, corporations, governments or other entities,</li><BR>
<ol type="a">
<li>to tidelands, or lands comprising the shores or beds of navigable or perennial rivers and streams, lakes, bays, gulfs or oceans, or</li><BR>
<li>to lands beyond the line of the harbor or bulkhead lines as established or changed by any government, or</li><BR>
<li>to filled-in lands, or artificial islands, or</li><BR>
<li>to statutory water rights, including riparian rights, or</li><BR>
<li>to the area extending from the line of mean low tide to the line of vegetation, or the rights of access to that area or easement along and across that area.
(Applies to the Owner Policy only.)</li><BR>
</ol>
<li>Standby fees, taxes and assessments by any taxing authority for the year #DateFormat(Now(), "yyyy")#, and subsequent years; and subsequent taxes and assessments by any taxing authority for prior years due to change in land usage or ownership, but not those taxes or assessments for prior years because of an exemption granted to a previous owner of the property under Section 11.13, Texas Tax Code, or because of improvements not assessed for a previous tax year. (If Texas Short Form Residential Mortgagee Policy of Title Insurance (T-2R) is issued, that policy will substitute “which become due and payable subsequent to Date of Policy“ in lieu of “for the year #DateFormat(Now(), "yyyy")# and subsequent years.”)</li><BR>
<li>The terms and conditions of the documents creating your interest in the land.</li><BR>
<li>Materials furnished or labor performed in connection with planned construction before signing and delivering the lien document described in Schedule A, if the land is part of the homestead of the owner. (Applies to the Mortgagee Title Policy binder on Interim Construction Loan only, and may be deleted if satisfactory evidence is furnished to us before a binder is issued.)</li><BR>
<li>Liens and leases that affect the title to the land, but that are subordinate to the lien of the insured mortgage. (Applies to Mortgagee Policy (T 2) only.)</li><BR>
<li>The Exceptions from Coverage and Express Insurance in Schedule B of the Texas Short Form Residential Mortgagee Policy of Title Insurance (T 2R). (Applies to Texas Short Form Residential Mortgagee Policy of Title Insurance (T-2R) only. Separate exceptions 1 through 8 of this Schedule B do not apply to the Texas Short Form Residential Mortgagee Policy of Title Insurance (T-2R).</li><BR>

<li>The following matters and all terms of the documents creating or offering evidence of the matters: </li>







<ol type="a">
<li>Any and all liens, covenants, conditions, reservations, or other matters affecting title to the real property described in Schedule A hereof, which are recognized or created in the deed to the insured.</li><BR>

<li>Easements or claims of easements which are not recorded in the public records of <cfoutput>#read_title.pcounty#</cfoutput> County, Texas. (To be amended after receipt of an acceptable survey)</li><BR>

<li>Any visible or apparent easements over and across the property herein described.</li><BR>

<li>All, leases, grants, exceptions or reservations of coal, lignite, oil, gas and other minerals, together with all rights, privileges, and immunities relating thereto, appearing in the Public Records whether listed in Schedule B or not.  There may be leases, grants, exceptions or reservations of mineral interest that are not listed.</li><BR>

<li>Rights of parties in possession. (Owner's Policy Only)</li><BR>

<li>Any encroachment, encumbrance, violation, variation, or adverse circumstance affecting the title that would be disclosed by an accurate and complete land survey of the land.</li><BR>

<li>Any portion of the property herein described which falls within the boundaries of a road or roadway.</li><BR>


<cfif read_title_data.addex neq '' and read_title_data.addex neq 'NULL'>
<cfoutput>#read_title_data.addex#</cfoutput><BR><BR>
</cfif>
</ol>
</ol>
</td>
</tr>
</table>

</cfoutput>
<table width="83%" cellpadding=0 cellspacing=0 border=0 >
<tr>
<td><font size="-2" color="gray">Texas Form T-7: Commitment for Title Insurance (1/3/14)<BR>
WFG National Form No. 3166748</font>
</td>
</tr></table>

</CENTER>


<hr>



<cfoutput><table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left"><font color="black" size="1">G.F. No.: #read_title.title_id# T</font></td>
  </tr>
</table></cfoutput>

<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size: 12px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20pt}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:12pt}
.medium_header {font-family:Arial, Helvetica, sans-serif; font-size:18pt}
</style>
<center>
<cfoutput>
		 <div align="center">
<strong>SCHEDULE C</strong><br />
</div>
<br>

<table align="center" width="93%" cellpadding="2">

<tr>
<td align"left" valign="top">
<ol type="a">
Your Policy will not cover loss, costs, attorneys fees, and expenses resulting from the following requirements that will appear as Exceptions in Schedule B of the Policy, unless you dispose of these matters to our satisfaction, before the date the Policy is issued:<BR><BR>

<ol>
<li>Documents creating your title or interest must be approved by us and must be signed, notarized and filed for record.</li><BR>
<li>Satisfactory evidence must be provided that:<BR>
<UL>
<li>no person occupying the land claims any interest in that land against the persons named in paragraph 3 of Schedule A,</li><BR>
<li>all standby fees, taxes, assessments and charges against the property have been paid,</li><BR>
<li>all improvements or repairs to the property are completed and accepted by the owner, and that all contractors, sub-contractors, laborers and suppliers have been fully paid, and that no mechanic's, laborer's or materialmen's liens have attached to the property,</li><BR>
<li>there is legal right of access to and from the land,</li><BR>
<li>(on a Mortgagee Policy only) restrictions have not been and will not be violated that affect the validity and priority of the insured mortgage.</li><BR>
</UL>
<li>You must pay the sellerSellerSNoun or borrowerBuyerSNoun the agreed amount for your property or interest.</li><BR>
<li>Any defect, lien or other mater that may affect title to the land or interest insured, that arises or is filed after the effective date of this Commitment.</li><BR>
</cfoutput>

<CFQUERY datasource="#request.dsn#" NAME="read_mortgage">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 is NOT NULL
			order by selectedOrgs4
		</cfquery>
<cfif read_mortgage.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>

<cfoutput query = "read_mortgage">
<li><cfif #read_mortgage.data1# NEQ ""> <cfif read_mortgage.lienintro neq "" and read_mortgage.lienintro neq 'NULL' or Len(read_mortgage.lienintro) eq 0>#read_mortgage.lienintro#<cfelse>Satisfaction and/or release of</cfif> Mortgage from #read_mortgage.data2# <cfif #read_mortgage.data3# neq ""> and #read_mortgage.data3#</cfif> securing #read_mortgage.data1# in the original principal amount of #read_mortgage.data4#, as dated #DateFormat(read_mortgage.data8, "mm")#/#DateFormat(read_mortgage.data8, "dd")#/#DateFormat(read_mortgage.data8, "yyyy")# and recorded on #DateFormat(read_mortgage.data9, "mm")#/#DateFormat(read_mortgage.data9, "dd")#/#DateFormat(read_mortgage.data9, "yyyy")# among the Land Records of #Read_temp_comp_b1.pcounty# County, <cfif #read_mortgage.data5# eq ""><cfif #read_mortgage.data6# neq "">in Book #read_mortgage.data6# at Page #read_mortgage.data7# </cfif>
<cfelse>
	in Document Number #read_mortgage.data5#

	<!---(start) -- Added by Synechron Development for ticket# 454 Dt. 11-27-2013-------->
	<cfif  #len(read_mortgage.data5)# gt 0 AND #len(read_mortgage.data6)# gt 0 > ,</cfif>
	<cfif #len(read_mortgage.data6)# gt 0 AND #len(read_mortgage.data7)# gt 0 >
	in Book #read_mortgage.data6# at Page #read_mortgage.data7#
	</cfif>
	<!---(end) -- Added by Synechron Development for ticket# 454 ------->



</cfif>
<cfif #read_mortgage.data13# neq ""> Assigned to #read_mortgage.data13# recorded on #DateFormat(read_mortgage.data17, "mm")#/#DateFormat(read_mortgage.data17, "dd")#/#DateFormat(read_mortgage.data17, "yyyy")#, in Book
	<cfif #read_mortgage.data14# eq "">
		#read_mortgage.data15#, at Page #read_mortgage.data16#
	<cfelse>
		 in Document #read_mortgage.data14#
		<!---(start) -- Added by Synechron Development for ticket# 454 Dt. 11-27-2013-------->
		<cfif  #len(read_mortgage.data14)# gt 0 AND #len(read_mortgage.data15)# gt 0 > ,</cfif>
		<cfif #len(read_mortgage.data15)# gt 0 AND #len(read_mortgage.data16)# gt 0 >
		in Book #read_mortgage.data15# at Page #read_mortgage.data16#
		</cfif>
		<!---(end) -- Added by Synechron Development for ticket# 454 ------->

	</cfif>
</cfif>
<cfif #read_mortgage.data18# neq "">Assigned to #read_mortgage.data18# recorded on #DateFormat(read_mortgage.data22, "mm")#/#DateFormat(read_mortgage.data22, "dd")#/#DateFormat(read_mortgage.data22, "yyyy")#,
	<cfif #read_mortgage.data19# eq "">
		in Book #read_mortgage.data20#, at Page #read_mortgage.data21#
	<cfelse>
		in Document #read_mortgage.data19# <!---in Book #read_mortgage.data20#, at Page #read_mortgage.data21#--->

		<!---(start) -- Added by Synechron Development for ticket# 454 Dt. 11-27-2013-------->
		<cfif  #len(read_mortgage.data19)# gt 0 AND #len(read_mortgage.data20)# gt 0 > ,</cfif>
		<cfif #len(read_mortgage.data20)# gt 0 AND #len(read_mortgage.data21)# gt 0 >
		in Book #read_mortgage.data20# at Page #read_mortgage.data21#
		</cfif>
		<!---(end) -- Added by Synechron Development for ticket# 454 ------->
	</cfif>
</cfif>
<cfif #read_mortgage.data23# neq "">Assigned to #read_mortgage.data23# recorded on #DateFormat(read_mortgage.data27, "mm")#/#DateFormat(read_mortgage.data27, "dd")#/#DateFormat(read_mortgage.data27, "yyyy")#,
	<cfif #read_mortgage.data24# eq "">
		in Book #read_mortgage.data25#, at Page #read_mortgage.data26#
	<cfelse>
		in Document #read_mortgage.data24#<!--- in Book #read_mortgage.data25#, at Page #read_mortgage.data26#--->
		<!---(start) -- Added by Synechron Development for ticket# 454 Dt. 11-27-2013-------->
		<cfif  #len(read_mortgage.data24)# gt 0 AND #len(read_mortgage.data25)# gt 0 > ,</cfif>
		<cfif #len(read_mortgage.data25)# gt 0 AND #len(read_mortgage.data26)# gt 0 >
		in Book #read_mortgage.data25# at Page #read_mortgage.data26#
		</cfif>
		<!---(end) -- Added by Synechron Development for ticket# 454 ------->
	</cfif>
</cfif><cfif #read_mortgage.data28# neq "">Assigned to #read_mortgage.data28# recorded on #DateFormat(read_mortgage.data32, "mm")#/#DateFormat(read_mortgag4.data32, "dd")#/#DateFormat(read_mortgage.data32, "yyyy")#,
	<cfif #read_mortgage.data29# EQ "">
		 in Book #read_mortgage.data30#, at Page #read_mortgage.data31#
	<cfelse>
		 in Document #read_mortgage.data29# in Book #read_mortgage.data30#, at Page #read_mortgage.data31#
		<!---(start) -- Added by Synechron Development for ticket# 454 Dt. 11-27-2013-------->
		<cfif  #len(read_mortgage.data29)# gt 0 AND #len(read_mortgage.data30)# gt 0 > ,</cfif>
		<cfif #len(read_mortgage.data30)# gt 0 AND #len(read_mortgage.data31)# gt 0 >
		in Book #read_mortgage.data30# at Page #read_mortgage.data31#
		</cfif>
		<!---(end) -- Added by Synechron Development for ticket# 454 ------->
	</cfif>
</cfif><cfif #read_mortgage.data11# neq "">#read_mortgage.data11#</cfif> <cfif #read_mortgage.data12# neq "">#read_mortgage.data12#</cfif></cfif></li><BR><BR>
</cfoutput>

<cfif #read_title.loanamt_float# neq "" and #read_title.loanamt_float# neq 0 and #read_title.loanamt_float# neq 'NULL'><cfoutput><li>Recordation of (mortgage/deed of trust) from <cfif Len(read_title.blastname1)>, #read_title.bfirstname1# #read_title.blastname1# </cfif><cfif Len(read_title.blastname2)>, #read_title.bfirstname2# #read_title.blastname2# </cfif><cfif Len(read_title.blastname3)>, #read_title.bfirstname3# #read_title.blastname3# </cfif><cfif Len(read_title.blastname4)>, #read_title.bfirstname4# #read_title.blastname4# </cfif> securing #read_title.insured# in the amount of $<cfif #read_title.loanamt_float# neq "" and #read_title.loanamt_float# neq 0 and #read_title.loanamt_float# neq 'NULL'>#NumberFormat(read_title.loanamt_float, "999,999,999.00")#<cfelse>TBD</cfif></li><BR><BR></cfoutput><cfelse>&nbsp;</cfif>
<cfif read_title_data.addreq neq '' and read_title_data.addreq neq 'NULL'>
<cfoutput>#read_title_data.addreq#</cfoutput><BR><BR>
</cfif>
</ol>
</td>
</tr>
</table>
</CENTER>
<table width="83%" cellpadding=0 cellspacing=0 border=0 >
<tr>
<td><font size="-2" color="gray">Texas Form T-7: Commitment for Title Insurance (1/3/14)<BR>
WFG National Form No. 3166748</font>
</td>
</tr></table>


<hr>


<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size: 12px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20pt}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:12pt}
.medium_header {font-family:Arial, Helvetica, sans-serif; font-size:18pt}
</style>

		 <div align="left">
<img src="http://<cfoutput>#cgi.server_name#</cfoutput>/images/wfg_logo.jpg">
			<br></div>


<center>
		 <div align="center">
<strong>SCHEDULE D</strong><br />
</div>
<!---<cfoutput><table align="center" width="93%">
<tr>
<td align"left" valign="top" width="50%">Policy Commitment No.: #read_title.title_id# T</td>
<td align"right" valign="top" width="50%"><!---Effective Date: #DateFormat(read_deed.data37, "mm/dd/yyyy")#---></td>
</tr>
</table></cfoutput>--->
<br>

<cfoutput>
<table align="center" width="93%">
<tr>
<td align"left" valign="top">The information contained in this Schedule (D) does not affect title to or the lien upon the land described in Schedule A hereof, to be insured in any policy(ies) of title insurance to be issued in accordance with this Commitment. <BR><BR>

Pursuant to the requirement of Rule P-21, Basic Manual of Rules, Rates and Forms for the Writing of Title Insurance in the State of Texas, the following disclosures are made:<BR><BR>
<table>
<tr>
<td width="45" align"left" valign="top" >1.</td>
<td align"left" valign="top" >The following individuals are directors and/or officers, as indicated, of WFG National Title Insurance Company:<BR><BR>

<table>
<tr>
<td width="250" align="left" valign="top">DIRECTORS:<br />
Patrick F. Stone<br />
A. Steven Ozonian<br />
Michael T. Gallaher<br />
Joseph V. McCabe<br />
John R. Wooldridge<br />
Cynthia L. Tucker</td>
<td width="550" align="left" valign="top">OFFICERS:	<br />
Patrick F. Stone, Chief Executive Officer and Chairman<br />
A. Steven Ozonian, Chief Operating Officer and President<br />
Michael T. Gallaher, Executive Vice President, Chief Financial Officer and Treasurer<br />
Joseph V. McCabe, Executive Vice President, General Counsel and Secretary<br />
John R. Wooldridge, Senior Vice President and Controller<br />
Cynthia Lee Tucker, Executive Vice President<br />
</td>
</tr>
</table><br />
<br />

Williston Financial Group LLC owns 100% of the stock of WFG National Title Insurance Company. Williston Holdings LLC owns 100% of the LLC interests in Williston Financial Group LLC.
</td></tr>
<tr>
<td width="45" align"left" valign="top" >2.</td>
<td align"left" valign="top" >The following disclosures are made by the Title Insurance Agent issuing this Commitment: First Title & Escrow, Inc. dba Title & Escrow of Texas, Inc.
<ol type="a">
<li>The names of each shareholder, owner, partner or other person having, owning or controlling one percent (1%) or more of the Title Insurance Agent that will receive a portion of the premium are as follows:    Steve Papermaster, Pamela Gibbons</li>
<li>Each shareholder, owner, partner or other person having, owning or controlling ten percent (10%) or more of an entity that has, owns, or controls one percent (1%) or more of the Title Insurance Agent that will receive a portion of the premium are as follows: N/A</li> 
<li>If the Agent is a corporation, the following persons are officers and directors of the Title Insurance Agent:</li>

<br />


<table>
<tr>
<td width="250" align="left" valign="top">DIRECTORS:<br />
Steve Papermaster<br />
Pamela Gibbons<br />
</td>
<td width="550" align="left" valign="top">OFFICERS:	<br />
Steve Papermaster, President
<br />
Pamela Gibbons, Senior Vice President
<br />
<br />
</td>
</tr>
</table>

<li>The names of any person who is not a full-time employee of the Title Insurance Agent and who receives any portion of the title insurance premium for services performed on behalf of the Title Insurance Agent in connection with the issuance of a title insurance form; and, the amount of premium that any such person shall receive: N/A</li>

<li>For purposes of this paragraph 2, “having, owning or controlling: includes the right to receipt of a percentage of net income, gross income, or cash flow of the Agent or entity in the percentage stated in subparagraphs (a) or (b): N/A</li>

</ol>

</td></tr>
</table>
<table>
<tr>
<td width="45" align"left" valign="top" >3.</td>
<td align"left" valign="top" >You are entitled to receive advance disclosure of settlement charges in connection with the proposed transaction to which this Commitment relates. Upon your request, such disclosure will be made to you. Additionally, the name of any person, firm or corporation receiving a portion of the premium from the settlement of this transaction will be disclosed on the closing or settlement statement.<br />
<br />

<cfset total = 0>
<table width="400">
<cfif read_title.pstate eq 'TX' and read_title.searchType eq 'Purchase' and read_title.loanamt_float gt 0>

<tr>
<td align="left" valign="top" width="50%">Owner's Policy</td>
<td align="right" valign="top" width="50%">$<B> <cfif #read_hud_data.A_1104_OUTSIDE_LENDERSTITLEINS# neq "" and #read_hud_data.A_1104_OUTSIDE_LENDERSTITLEINS# neq 0 and #read_hud_data.A_1104_OUTSIDE_LENDERSTITLEINS# neq 'NULL'>#NumberFormat(round(read_hud_data.A_1104_OUTSIDE_LENDERSTITLEINS), "999,999,999.00")#<cfelse>&nbsp;</cfif>
</td>
</tr>
<cfif Len("read_hud_data.A_1104_OUTSIDE_LENDERSTITLEINS") and read_hud_data.A_1104_OUTSIDE_LENDERSTITLEINS neq 'TBD' and read_hud_data.A_1104_OUTSIDE_LENDERSTITLEINS neq ''>
<cfset total = total + round(read_hud_data.A_1104_OUTSIDE_LENDERSTITLEINS)>
</cfif>
<tr>
<td align="left" valign="top" width="50%">Mortgagee Policy</td>
<td align="right" valign="top" width="50%"><cfif #read_hud_data.A_1103_BORROWER_OWNERSTITLEINS# neq "" and #read_hud_data.A_1103_BORROWER_OWNERSTITLEINS# neq 0 and #read_hud_data.A_1103_BORROWER_OWNERSTITLEINS# neq 'NULL'>$<B> #NumberFormat(round(read_hud_data.A_1103_BORROWER_OWNERSTITLEINS), "999,999,999.00")#</B><cfelse>&nbsp;</cfif></td>
</tr>
<cfif Len("read_hud_data.A_1103_BORROWER_OWNERSTITLEINS") and read_hud_data.A_1103_BORROWER_OWNERSTITLEINS neq 'TBD' and read_hud_data.A_1103_BORROWER_OWNERSTITLEINS neq ''>
<cfset total = total + round(read_hud_data.A_1103_BORROWER_OWNERSTITLEINS)>
</cfif>
<cfelse>
<tr>
<td align="left" valign="top" width="50%">Owner’s Policy</td>
<td align="right" valign="top" width="50%"><cfif #read_hud_data.A_1103_BORROWER_OWNERSTITLEINS# neq "" and #read_hud_data.A_1103_BORROWER_OWNERSTITLEINS# neq 0 and #read_hud_data.A_1103_BORROWER_OWNERSTITLEINS# neq 'NULL'>$<B> #NumberFormat(round(read_hud_data.A_1103_BORROWER_OWNERSTITLEINS), "999,999,999.00")#</B><cfelse>&nbsp;</cfif></td>
</tr>
<cfif Len("read_hud_data.A_1103_BORROWER_OWNERSTITLEINS") and read_hud_data.A_1103_BORROWER_OWNERSTITLEINS neq 'TBD' and read_hud_data.A_1103_BORROWER_OWNERSTITLEINS neq ''>
<cfset total = total + round(read_hud_data.A_1103_BORROWER_OWNERSTITLEINS)>
</cfif>
<tr>
<td align="left" valign="top" width="50%">Mortgagee Policy</td>
<td align="right" valign="top" width="50%">$<B> <cfif #read_hud_data.A_1104_OUTSIDE_LENDERSTITLEINS# neq "" and #read_hud_data.A_1104_OUTSIDE_LENDERSTITLEINS# neq 0 and #read_hud_data.A_1104_OUTSIDE_LENDERSTITLEINS# neq 'NULL'>#NumberFormat(round(read_hud_data.A_1104_OUTSIDE_LENDERSTITLEINS), "999,999,999.00")#<cfelse>&nbsp;</cfif>
</td>
</tr>
<cfif Len("read_hud_data.A_1104_OUTSIDE_LENDERSTITLEINS") and read_hud_data.A_1104_OUTSIDE_LENDERSTITLEINS neq 'TBD' and read_hud_data.A_1104_OUTSIDE_LENDERSTITLEINS neq ''>
<cfset total = total + round(read_hud_data.A_1104_OUTSIDE_LENDERSTITLEINS)>
</cfif>
</cfif>
<tr>
<td align="left" valign="top" width="50%">Endorsement Charges</td>
<td align="right" valign="top" width="50%"><cfif endorsement_total neq 0><cfset total = total + endorsement_total>#endorsement_total#<cfelse>&nbsp'</cfif>
</td>
</tr>
<tr>
<td align="left" valign="top" width="50%">Other</td>
<td align="right" valign="top" width="50%">&nbsp;</td>
</tr>
<tr>
<td align="left" valign="top" width="50%">Total</td>
<td align="right" valign="top" width="50%">$<b>#NumberFormat(total, "999,999,999.00")#</b></td>
</tr>
</table>

<br>
Of this total amount $_________________________(or___________________________%) will be paid to the policy issuing Title Insurance Company; $_________________________
(or_________________________%) will be retained by the issuing Title Insurance Agent; and the remainder of the estimated premium will be paid to other parties as follows:
<br />
<br>

<CFQUERY DATASOURCE="#request.dsn#" NAME="check_abstract">
			Select * from
			Doc_abstract_title where title_id = #read_title.title_id# and abstractor_doc_upload IS NOT NULL
</CFQUERY>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_assigned_abstract" maxrows="1">
			Select * from Vendor_Tracker_new v, Vendors_Stacie s
			where v.order_id = #read_title.title_id#
			and v.task = 'Abstract'
			and v.vendor_id = s.vendor_id
			order by v.assign_date desc, ID desc
</CFQUERY>
<table width="93%">
<tr>
<td align="center" valign="top" width="31%">Amount</td>
<td align="center" valign="top" width="31%">To Whom</td>
<td align="center" valign="top" width="31%">Services</td>
</tr>
<tr>
<td align="center" valign="top" width="31%">$______(or %)______</td>
<cfif check_abstract.recordcount and read_assigned_abstract.recordcount>
<td align="center" valign="top" width="31%"><u>#read_assigned_abstract.company#</u></td>
<td align="center" valign="top" width="31%"><u>Title Evidence</u></td>
<cfelse>
<td align="center" valign="top" width="31%">___________________________________</td>
<td align="center" valign="top" width="31%">__________________________</td>
</cfif>
</tr>
<tr>
<td align="center" valign="top" width="31%">$______(or %)______</td>
<td align="center" valign="top" width="31%">___________________________________</td>
<td align="center" valign="top" width="31%">__________________________</td>
</tr>
<tr>
<td align="center" valign="top" width="31%">$______(or %)______</td>
<td align="center" valign="top" width="31%">___________________________________</td>
<td align="center" valign="top" width="31%">__________________________</td>
</tr>
</table><br>
<br>
<font size="-1">*The estimated premium is based upon information furnished to us of the date of this Commitment for Title Insurance. Final determination of the amount of the premium will be made at closing in accordance with the Rules and Regulations adopted by the State Board of Insurance.</font><br>
<br>
</cfoutput>



</td></tr></table>

</CENTER>





<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size: 12px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20pt}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:12pt}
.medium_header {font-family:Arial, Helvetica, sans-serif; font-size:18pt}
</style>
<cfoutput>
<center>

		 <div align="left">
<img src="http://<cfoutput>#cgi.server_name#</cfoutput>/images/wfg_logo.jpg">
			<br></div>
		 <div align="center">
<table width="93%" cellpadding=0 cellspacing=0 border=0 >
    <tr>
          <td>
		 <div align="center">
<strong>PURPOSE OF THIS NOTICE</strong><br />
</div>
          </td>
    </tr>
</table><br>
<table width="93%" cellpadding=0 cellspacing=0 border=0 >
    <tr>
          <td>
Title V of the Gramm-Leach-Bliley Act (GLBA) generally prohibits any financial institution, directly or through its affiliates, from sharing nonpublic personal information about you with a nonaffiliated third party unless the institution provides you with a notice of its privacy policies and practices, such as the type of information that it collects about you and the categories of persons or entities to whom it may be disclosed.  In compliance with the GLBA, we are providing you with this document, which notifies you of the privacy policies and practices of WFG.<BR /><BR />

We may collect nonpublic personal information about you from the following sources:<BR /><BR />

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Information we receive from you such as on applications or other forms.<BR />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Information about your transactions we secure from our files, or from our affiliates or others.<BR />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Information we receive from a consumer reporting agency.<BR />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Information that we receive from others involved in your transaction, such as the real estate agent or lender.<BR /><BR />

Unless it is specifically stated otherwise in an amended Privacy Policy Notice, no additional nonpublic personal information will be collected about you.<BR /><BR />

We may disclose any of the above information that we collect about our customers or former customers to our affiliates or to nonaffiliated third parties as permitted by law.<BR /><BR />

We also may disclose this information about our customers or former customers to the following types of nonaffiliated companies that perform marketing services on our behalf or with whom we have joint marketing agreements:<BR /><BR />

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Financial service providers such as companies engaged in banking, consumer finance, securities and insurance.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Non-financial companies such as envelope stuffers and other fulfillment service providers.<BR /><BR />

WE DO NOT DISCLOSE ANY NONPUBLIC PERSONAL INFORMATION ABOUT YOU WITH ANYONE FOR ANY PURPOSE THAT IS NOT SPECIFICALLY PERMITTED BY LAW.<BR /><BR />

We restrict access to nonpublic personal information about you to those employees who need to know that information in order to provide products or services to you.  We maintain physical, electronic, and procedural safeguards that comply with federal regulations to guard your nonpublic personal information.<BR /><BR />

If you have any questions about this Privacy Policy Notice, please contact us by writing to:<BR /><BR />

WFG National Title Insurance Company<BR />
12909 SW 68th Parkway, Suite 350<BR />
Portland, Oregon 97223<BR /><BR />


          </td>
    </tr>
</table><br>
<br />
<br />
<table width="83%" cellpadding=0 cellspacing=0 border=0 >
<tr>
<td><font size="-2" color="gray">Texas Form T-7: Commitment for Title Insurance (1/3/14)<BR>
WFG National Form No. 3166748</font>
</td>
</tr></table>
<hr>
<br />
<br />


</cfoutput>



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
</HTML>