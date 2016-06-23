<cfdocument
format="PDF" 
filename="#request.rootdir#\admin_area\tcs\TC-#read_title.title_id#.pdf" 
overwrite="yes" 
unit = "IN" 
marginbottom = ".5" 
marginleft = ".5" 
marginright = ".5" 
margintop = ".5" 
fontembed = "yes" 
orientation = "portrait"
pagetype = "custom" 
pageHeight = "9"
pageWidth = "8.5">

<STYLE TYPE="text/css">
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
</STYLE>

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


<cfif read_title.loanamt_float neq '' and read_title.loanamt_float neq 'NULL'>
<cfset read_title.loanamt_float = ReplaceNoCase(read_title.loanamt_float, ",", "", "ALL")>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_hud_data">
        select A_1103_OUTSIDE_OWNERSTITLEINS, A_1104_OUTSIDE_LENDERSTITLEINS, A_1103_BORROWER_OWNERSTITLEINS from HUD2010_TITLE_DATA WHERE title_id = #url.rec_ID# 
        </cfquery>






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


<CFPARAM NAME="a_trigger" DEFAULT="0">
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
<CFQUERY datasource="#request.dsn#" NAME="read_Title">
    SELECT *
	FROM Title
	WHERE Title_ID = #rec_ID#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_comp_info">
    SELECT *
	FROM companies
	WHERE ID = #read_title.comp_id#
</CFQUERY>

<cfif get_comp_info.streamline_client eq 'true'>
<cfset title_co_name = 'Streamline Title'>
<cfelse>
<cfset title_co_name = 'First Title'>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_comp">		
				SELECT *
				FROM Companies
				Where ID = #read_title.comp_id#
			</CFQUERY>	
<CFQUERY datasource="#request.dsn#" NAME="check_if_richmond_office">
SELECT *
FROM First_admin where id = #read_comp.intSales#
</cfquery>			
<cfset this_email = 'loandocs@firsttitleservices.com'>
<cfif check_if_richmond_office.va_employee eq 'True'>
<cfset this_email = 'richmond@firsttitleservices.com'>
<cfelseif read_comp.streamline_client eq 'True'>
<cfset this_email = 'loandocs@streamline-title.com'>
<cfelseif read_comp.company contains 'Chase/RealEC'>
<cfset this_email = 'ChaseTeam@firsttitleservices.com'>
<cfelseif read_comp.company contains 'Chase'>
<cfset this_email = 'chase@firsttitleservices.com'>
<cfelseif read_comp.company contains 'Flagstar'>
<cfset this_email = 'flagstar@firsttitleservices.com'>
<cfelseif read_comp.ID eq 3943 or read_comp.ID eq 4042 or read_comp.ID eq 4043>
<cfset this_email = 'vdocs@firsttitleservices.com'>
</cfif> 

<cfparam name="company_id" default="#read_title.comp_id#">


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




<!---  special Checklist for STIFEL orders --->
<cfif #read_title.comp_id# eq 5026 or #read_title.comp_id# eq 4177>
<cfinclude template="stifel_checklist.cfm">
</cfif>
<!--- END special Checklist for STIFEL orders --->



<!--- special invoice page for Vanderbilt orders --->
<cfif #read_title.comp_id# eq 2818>

<CFQUERY datasource="#request.dsn#" NAME="get_all" maxrows=10>
SELECT     t.Title_ID, t.loan_number, t.paddress, t.pcity, t.pstate, t.pzip, t.order_date,
           c.company, c.addr1, c.addr2, c.city, c.state, c.zip_code
FROM      Title t INNER JOIN
		  Companies c ON t.comp_id = c.ID
WHERE     (t.title_id = #read_title.title_id#)
</cfquery>

<cfdocumentsection>
<cfdocumentitem type="header">
<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:9pt}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:16px}
</style>
</cfdocumentitem >

<cfdocumentitem type="footer">
</cfdocumentitem >

<body style="background-color: #FFFFFF; font-family:Arial, Helvetica, sans-serif; font-size:9pt" >
<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:9pt}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:16px}
</style>

<cfoutput query="get_all">

<table width="600" cellpadding=6 cellspacing=0>
<tr>
<td align="center" valign="top" colspan="5"><cfif NOT DateDiff("d", Now(), "1/30/2012")><strong><font size=4>FIRST TITLE & ESCROW</font></strong><BR>
30 W. Gude Drive, Suite 450
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
</cfoutput>
</body>

</cfdocumentsection>
<!--- end special invoice page for vanderbilt orders --->
</cfif>





<!--- special invoice page for FIDELITY NATIONAL TITLE (452) orders --->
<cfif #read_title.comp_id# eq 452>
<cfdocumentsection>
<cfdocumentitem type="header">
<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:9pt}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:16px}
</style>
</cfdocumentitem >

<cfdocumentitem type="footer">
</cfdocumentitem >

<body style="background-color: #FFFFFF; font-family:Arial, Helvetica, sans-serif; font-size:9pt" >

<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:9pt}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:16px}
</style>

<CFQUERY datasource="#request.dsn#" NAME="get_all" maxrows=10>
SELECT     t.Title_ID, t.loan_number, t.paddress, t.pcity, t.pstate, t.pzip, t.order_date,
           c.company, c.addr1, c.addr2, c.city, c.state, c.zip_code
FROM      Title t INNER JOIN
		  Companies c ON t.comp_id = c.ID
WHERE     (t.title_id = #read_title.title_id#)
</cfquery>

<cfoutput query="get_all">


<table width="600" cellpadding=6 cellspacing=0>
<tr>

<td align="center" valign="top" colspan="5"><strong><font size=4>STREAMLINE TITLE & ESCROW</font></strong><BR>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
30 W. Gude Drive, Suite 450
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
</cfoutput>
</body>

</cfdocumentsection>
</cfif>
<!--- end special invoice page for FIDELITY NATIONAL TITLE (452) orders --->




<cfif #read_title.comp_id# eq "254">
<cfdocumentsection>
<cfdocumentitem type="header">
<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:9pt}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:16px}
</style>
</cfdocumentitem >

<cfdocumentitem type="footer">
</cfdocumentitem >

<body style="background-color: #FFFFFF; font-family:Arial, Helvetica, sans-serif; font-size:9pt" >

<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:9pt}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:16px}
</style>

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
</cfoutput>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr align="left" valign="top">
    <td colspan="3"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">1.
        Have there been any changes in title in the past 12 months (someone added
        or taken off title, etc.)<br><cfset testDate = #DateFormat(CreateODBCDate(read_deed_info.data11), "m/d/yyyy")#>
        <cfif #DATEDIFF("m", testDate, read_data_info.merge_date)# LT 12>&nbsp;&nbsp;&nbsp;&nbsp;<img src="checked.jpg" height="15" width="15">YES&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" >NO
        <cfelse>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox">YES&nbsp;&nbsp;&nbsp;&nbsp;<img src="checked.jpg" height="15" width="15">NO </cfif><font size="1">(if YES, explain in comments below.)</font> </font></strong>
     <strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">2. Are
        there any items that need to be cleared:<br>
         <cfif #read_data_info.cleared# neq "" OR #read_data_info.clear_needed# neq "">&nbsp;&nbsp;&nbsp;&nbsp;<img src="checked.jpg" height="15" width="15">YES&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" >NO
         <cfelse>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox">YES&nbsp;&nbsp;&nbsp;&nbsp;<img src="checked.jpg" height="15" width="15">NO </cfif><font size="1">(if YES, explain in comments below.)</font> </font></strong>
   <font size="1">(if YES, explain in comments below.)</font></font></strong>
     <strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">3.
        Are the property taxes up to date?<br>
        <cfif #read_tax_info.data31# eq "Paid">&nbsp;&nbsp;&nbsp;&nbsp;<img src="checked.jpg" height="15" width="15">YES&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" >NO
        <font size="1">(if NO, explain in comments below.)</font></font></strong></td>
 <cfelse>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox">YES&nbsp;&nbsp;&nbsp;&nbsp;<<img src="checked.jpg" height="15" width="15">NO </cfif><font size="1">(if NO, explain in comments below.)</font> </font></strong>

  </tr>
 <cfoutput>
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
</font></font></font></font></font></font></font></font></font></font></font>
</body>
</cfdocumentsection>
</cfif>







<CFIF #read_Title.pstate# eq "CA">
<cfdocumentsection>
<cfdocumentitem type="header">
<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:9pt}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:16px}
</style>
</cfdocumentitem >

<cfdocumentitem type="footer">
</cfdocumentitem >

<body style="background-color: #FFFFFF; font-family:Arial, Helvetica, sans-serif; font-size:9pt" >

<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:9pt}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:16px}
</style>

<table width="100%" cellpadding=0 cellspacing=0 border=0 >
    <TR>
        <td><BR></td>
    </tr>
    <tr>
        <td>
            <B>First Title & Escrow</B></Center>
        </td>
    </tr>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
    <tr>
        <td>
            <B>30 West Gude Drive, 4th Floor</B></Center>
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
            <a href="http://machine1.firsttitleservices.com" target="_blank">machine1.firsttitleservices.com</a></B></Center>
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
            commitment is issued through North American Title Insurance Company.
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
</body>
</cfdocumentsection>
</CFIF>


<!--- MAIN START PAGE BEGINS HERE --->


































<!--- MAIN START PAGE BEGINS HERE --->
<cfdocumentsection>
<!--- <cfdocumentitem type="footer">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left">Rev 11/1/09</td>
  </tr>
</table>
</cfdocumentitem > --->

<body style="background-color: #FFFFFF" >
<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:9px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:14px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:10px}
</style>
<br>
<table width="100%" cellpadding=0 cellspacing=4 border=0 bgcolor="#000000">
<tr>
<td>
<table width="100%" cellpadding=20 cellspacing=0 border=0 >
    <tr bgcolor="white">
          <td bgcolor="white"><strong>THE FOLLOWING COMMITMENT FOR TITLE INSURANCE IS NOT VALID UNLESS YOUR NAME AND THE POLICY AMOUNT ARE SHOWN IN SCHEDULE A, AND OUR AUTHORIZED REPRESENTATIVE HAS COUNTERSIGNED BELOW.</strong>
		  <br>
<br>

		 <center><strong>COMMITMENT FOR TITLE INSURANCE</strong><br>
		 ISSUED BY:<BR>
<img src="http://<cfoutput>machine1.firsttitleservices.com</cfoutput>/images/natic_logo.jpg" height="54" width="162">
			<br>
			1855 Gateway Boulevard, Suite 600, Concord, California 94520 (800) 374-8475 or (800) 869-3434</center>
            <BR><BR>
We, <strong>North American Title Insurance Company</strong>, a California corporation, will issue our title insurance policy or policies (the Policy) to You (the proposed insured) upon payment of the premium and other charges due, and compliance with the requirements in Schedule B and Schedule C. Our Policy will be the form approved by the Texas Department of Insurance at the date of issuance, and will insure your interest in the land described in Schedule A. The estimated premium for our Policy and applicable endorsements is shown on Schedule D. There may be additional charges such as recording fees, and expedited delivery expenses.<br>
<br>

This Commitment ends ninety (90) days from the effective date, unless the Policy is issued sooner, or failure to issue the Policy is our fault. Our liability and obligations to you are under the express terms of this Commitment and end when this Commitment expires
In witness whereof, North American Title Insurance Company has caused its corporate name and seal to be hereunto affixed by its duly authorized officers, the Commitment to become valid when countersigned by an authorized officer or agent of the Company.<br>
<br>

                     <center>
						<cfif ListFind("524,529",session.ft_user_id) >
							<img src="http://<cfoutput>machine1.firsttitleservices.com</cfoutput>/images/natic_sigs_nathan.jpg" height="178" width="387">
					    
						<cfelseif ListFind("632",session.ft_user_id) >
							<img src="http://<cfoutput>machine1.firsttitleservices.com</cfoutput>/images/natic_sigs_sarah.jpg" height="178" width="387">
					    
						<cfelseif ListFind("633",session.ft_user_id) >
							<img src="http://<cfoutput>machine1.firsttitleservices.com</cfoutput>/images/natic_sigs_sherry.jpg" height="178" width="387">
					    
						<cfelse>
							<img src="http://<cfoutput>machine1.firsttitleservices.com</cfoutput>/images/natic_sigs.jpg" height="178" width="387">
					    </cfif>
					</center><br>
<br>

		<center><strong>CONDITIONS AND STIPULATIONS</strong><br></center>
		 <BR>
            
<ol>
<li>If you have actual knowledge of any matter which may affect the title or mortgage covered by this Commitment that is not shown in Schedule B you must notify us in writing. If you do not notify us in writing, our liability to you is ended or reduced to the extent that your failure to notify us affects our liability. If you do notify us, or we learn of such matter, we may amend Schedule B, but we will not be relieved of liability already incurred.</li><BR>


<li>Our liability is only to you, and others who are included in the definition of Insured in the Policy to be issued. Our liability is only for actual loss incurred in your reliance on this Commitment to comply with its requirements or to acquire the interest in the land. Our liability is limited to the amount shown in Schedule A of this commitment and will be subject to the following terms of the Policy: Insuring Provisions, Conditions and Stipulations, and Exclusions.</li><BR>
</ol>
<br>
<br>
<br>


<div align="center">(THIS COMMITMENT IS INVALID UNLESS SCHEDULES A, B, C AND D ARE ATTACHED HERETO.)</div><BR><BR>
          </td>
    </tr>
</table>
</td>
</tr>
</table>
</body>
</cfdocumentsection>



















<!--- MAIN START PAGE BEGINS HERE --->
<cfdocumentsection>
<!--- <cfdocumentitem type="footer">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left">Rev 11/1/09</td>
  </tr>
</table>
</cfdocumentitem > --->

<body style="background-color: #FFFFFF" >
<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:10px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:14px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:12px}
</style>

<table width="93%" cellpadding=0 cellspacing=0 border=0 >
    <tr>
          <td>
<div align="center"><strong>TEXAS TITLE INSURANCE INFORMATION</strong></div><br>
<br>

Title insurance insures you against loss resulting from certain risks to your title.<br><br>

The Commitment for Title Insurance is the title insurance company's promise to issue the title insurance policy. The commitment is a legal document. You should review it carefully to completely understand it before your closing date.<br><br>
	
El seguro de titulo le asegura en relacion a perdidas resultantes de ciertos riesgos que pueden afectar el titulo de su propiedad.<br><br>

El compromiso para Seguro de Titulo es la promesa de la compania aseguradora de titulos de emitir la poliza de seguro de titulo. El Compromiso es un documento legal. Usted debe leerlo cuidadosamente y entenderlo completamente antes de la fecha para finalizar su transaccion.<br><br>
	
Your commitment for Title Insurance is a legal contract between you and us. The Commitment is not an opinion or report of your title. It is a contract to issue you a policy subject to the Commitment's terms and requirements.<br>

Before issuing a Commitment for Title Insurance (the Commitment) or a Title Insurance Policy (the Policy), the Title Insurance Company (the Company) determines whether the title is insurable. This determination has already been made. Part of that determination involves the Company's decision to insure the title except for certain risks that will not be covered by the Policy. Some of these risks are listed in Schedule B of the attached Commitment as Exceptions. Other risks are stated in the policy as Exclusions. These risks will not be covered by the Policy. The Policy is not an abstract of title nor does a Company have an obligation to determine the ownership of any mineral interest.<br>

MINERALS AND MINERAL RIGHTS may not be covered by the Policy. The Company may be unwilling to insure title unless there is exclusion or an exception as to the Mineral and Mineral Rights in the Policy. Optional endorsements insuring certain risks involving minerals, and the use of improvements (excluding lawns, shrubbery and trees) and permanent buildings may be available for purchase. If the title insurer issues the title policy with an exclusion or exception to the minerals and mineral rights, neither this policy nor the optional endorsements, ensure that he purchaser has title to the mineral rights related to the surface estate.<br>

Another part of the determination involves whether the promise to insure is conditioned upon certain requirements being met. Schedule C of the Commitment lists these requirements that must be satisfied or the Company will refuse to cover them. You may want to discuss any matters shown in Schedules B and C of the Commitment with an attorney. These matters will affect your title and your use of the land.<br>

When your Policy is issued, the coverage will be limited by the Policy's Exceptions, Exclusions and Conditions, defined below.<br>
<ul>
<li>EXCEPTIONS are title risks that a Policy generally covers but does not cover in a particular instance. Exceptions are shown on Schedule B or discussed in Schedule C of the Commitment. They can also be added if you do not comply with the Illnesses section of the Commitment. When the Policy is issued, all Exceptions will be on Schedule B of the Policy.</li>
<li>EXCLUSIONS are title risks that a Policy generally does not cover. Exclusions are contained in the Policy but not shown or discussed in the Commitment.</li>
<li>CONDITIONS are additional provisions that qualify or limit your coverage. Conditions include your responsibilities and those of the Company. They are contained in the Policy but not shown or discussed in the Commitment. The Policy Conditions are not the same as the Commitment Conditions.</li>
</ul>
	
	
You can get a copy of the policy form approved by the State Board of Insurance by calling the North American Title Insurance Company at      1-800-374-8475 (Eastern States) or 1- (800) 869-3434 (Western States) or by calling the title insurance agent that issued the Commitment. The Texas Department of Insurance may revise the policy form from time to time.<br>

You can also get a brochure that explains the policy from the Texas Department of Insurance by calling 1-800-252-3439.<br>

Before the policy is issued, you may request changes in the Policy. Some of the changes to consider are:<br>

Request amendment of the "area and boundary" exception (Schedule B, paragraph 2). To get this amendment, you must furnish a survey and comply with other requirements of the Company. On the Owner’s Policy, you must pay an additional premium for the amendment. If the survey is acceptable to the Company, and if the Company’s other requirements are met, your Policy will insure you against loss because of discrepancies or conflicts in boundary lines, encroachments or protrusions, or overlapping of improvements. The Company may then decide not to insure against specific boundary or survey problems by making special exceptions in the Policy. Whether or not you request amendment of the “area and boundary” exception, you should determine whether you want to purchase and review a survey is a survey is not being provided to you.<br>


          </td>
    </tr>
</table>
</body>
</cfdocumentsection>









<!--- MAIN START PAGE BEGINS HERE --->
<cfdocumentsection>
<!--- <cfdocumentitem type="footer">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left">Rev 11/1/09</td>
  </tr>
</table>
</cfdocumentitem > --->

<body style="background-color: #FFFFFF" >
<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:10px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:14px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:12px}
</style>

<table width="93%" cellpadding=0 cellspacing=0 border=0 >
    <tr>
          <td>
Allow the Company to add an exception to "rights of parties in possession". If you refuse this exception, the Company or the Title insurance agent may inspect the property. The Company may except to and not insure you against the rights of specific persons, such as renters, adverse owners or easement holders who occupy the land. The Company may charge you for the inspection. If you want to make your own inspection, you must sign a Waiver of Inspection form and allow the Company to add this exception to your Policy.<BR><BR>

The entire premium for a Policy must be paid when the Policy is issued. You will not owe any additional premiums unless you want to increase your coverage at a later date and the Company agrees to add an Increased Value Endorsement.

          </td>
    </tr>
</table>
<br>
<br>
<table width="93%" cellpadding=1 cellspacing=2 border=0 bgcolor="#000000">
<tr>
<td>
<table width="100%" cellpadding=0 cellspacing=10 border=0 bgcolor="#ffffff">
<tr>
<td width="50%" align="left" valign"top"><center>IMPORTANT NOTICE</center>
<BR>

FOR INFORMATION, OR TO MAKE A COMPLAINT<BR><BR>
CALL OUR TOLL-FREE TELEPHONE NUMBER<BR><BR>
1-800-374-8475 (TEXAS and Eastern States)<BR><BR>
1-800-369-3434 (Western States)<BR><BR>
<br>

ALSO YOU MAY CONTACT THE TEXAS DEPARTMENT OF INSURANCE AT<BR><BR>
1-800-252-3439<BR><BR>

to obtain information on:<BR><BR>

1. filing a complaint against an insurance company or agent,<BR><BR>

2. whether an insurance company or agent is licensed<BR><BR>



</td>
<td width="1" bgcolor="#000000">&nbsp;</td>
<td width="50%" align="left" valign"top"><br>
<br>
<center>AVISO IMPORTANTE</center><br>
<br>


PARA INFORMACION, O PARA SOMETER UNA QUEJA LLAME AL NUMERO GRATIS<BR><BR>
1-800-374-8475 (TEXAS and Eastern States)<BR><BR>
1-800-869-3434 (Western States)<BR><BR>
<br>

TAMBIEN PUEDE COMUNICARSE CON
EL DEPARTMENTO DE SEGUROS DE TEXAS AL<BR><BR>
1-800-252-3439<BR><BR>

para obtener informacion sobre:<BR><BR>

1. como someter una queja en contra de una compania de seguros o agente de seguros,<BR><BR>

2. si una compania de seguros o agente de
seguros tiene licencia<BR><BR>

</td>
</tr>
</table>
</td>
</tr>
</table>
<table width="93%" cellpadding=0 cellspacing=0 border=0 >
    <tr>
          <td>
		 <div align="center">
		 <BR>
<img src="http://<cfoutput>machine1.firsttitleservices.com</cfoutput>/images/natic_logo.jpg">
			<br>
1855 Gateway Blvd, Suite 600<BR>
Concord, CA 94520
</div>
          </td>
    </tr>
</table>
</body>
</cfdocumentsection>
















<!--- MAIN START PAGE BEGINS HERE --->
<cfdocumentsection>
<!--- <cfdocumentitem type="footer">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left">Rev 11/1/09</td>
  </tr>
</table>
</cfdocumentitem > --->

<body style="background-color: #FFFFFF" >
<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:10px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:14px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:12px}
</style>

<table width="100%" cellpadding=0 cellspacing=0 border=0 >
    <tr>
          <td>
		 <div align="left">
		 <BR>
<img src="http://<cfoutput>machine1.firsttitleservices.com</cfoutput>/images/natic_logo.jpg">
			<br></div>
          </td>
    </tr>
</table><br>
<table width="100%" cellpadding=10 cellspacing=1 border=0 bgcolor="#ffffff">
<tr>
<td width="50%" align="left" valign"top">
File Number: T-<cfoutput>#read_title.title_id#</cfoutput><BR>
Attached and made a part of Policy Number:<BR><BR>



<div align="center"><strong>DELETION OF ARBITRATION PROVISION</strong><BR>
(Not applicable to the Texas Residential Owner’s Policy)</div><BR><BR>


&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ARBITRATION is a common form of alternative dispute resolution. It can be a quicker and cheaper means to settle a dispute with your Title Insurance Company. However, if you agree to arbitrate, you give up your right to take the Title Insurance Company to court and your rights to discovery of evidence may be limited in the arbitration process. In addition, you cannot usually appeal an arbitrator’s award.
<BR><BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Your policy contains an arbitration provision (shown below). It allows you or the Company to require arbitration if the amount of insurance is $2,000,000 or less. If you want to retain your right to sue the Company in case of a dispute over a claim, you must request deletion of the arbitration provision before the policy is issued. You can do this by signing this form and returning it to the Company at or before the closing of your real estate transaction or by writing to the Company.
<BR><BR>
<BR><BR>The arbitration provision in the Policy is as follows:

<blockquote>“Either the Company or the Insured may demand that the claim or controversy shall be submitted to arbitration pursuant to the Title Insurance Arbitration Rules of the American Land Title Association (“Rules”). Except as provided in the Rules, there shall be no joinder or consolidation with claims or controversies of other persons. Arbitrable matters may include, but are not limited to, any controversy or claim between the Company and the Insured arising out of or relating to this policy, any service in connection with its issuance or the breach of a policy provision, or to any other controversy or claim arising out of the transaction giving rise to this policy. All arbitrable matters when the Amount of Insurance is $2,000,000 or less shall be arbitrated at the option of either the Company or the Insured, unless the Insured is an individual person (as distinguished from an Entity). All arbitrable matters when the Amount of Insurance is in excess of $2,000,000 shall be arbitrated only when agreed to by both the Company and the Insured. Arbitration pursuant to this policy and under the Rules shall be binding upon parties. Judgment upon the award rendered by the Arbitrator(s) may be entered in any court of competent jurisdiction.” </blockquote>

</td>
</tr>
</table>
</body>
</cfdocumentsection>







<!--- =================[ BEGIN SCHEDULE A         ]======================== --->
<!--- ====================================================================== --->
<cfdocumentsection>

<!--- <cfdocumentitem type="footer">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left"><font color="black" size="1">FORM T-7: COMMITMENT FOR TITLE INSURANCE (11/01/2009)</font></td>
  </tr>
</table>
</cfdocumentitem > --->

<body style="background-color: #FFFFFF; font-family:Arial, Helvetica, sans-serif; font-size:9px" background="frame_background.gif">
<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:10px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:14px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:12px}
</style><br>

<style>
.bordered { border:1px solid black; }
</style>


<table cellpadding=6 cellspacing=3 class="bordered">
<tr>
<td width="250" bgcolor="#000000"><font color="#FFFFFF" size=+2><strong>FACTS</strong></font></td>
<td width="1000" bgcolor="#FFFFFF"><font color="#000000"><strong>WHAT DOES NORTH AMERICAN TITLE GROUP, INC. FAMILY OF COMPANIES DO WITH YOUR PERSONAL INFORMATION?</strong> </font></td>
</tr>
</table>
<table cellpadding=6 cellspacing=3 class="bordered">
<tr>
<td width="250" bgcolor="#999999"><font color="#FFFFFF" size=+2><strong>Why?</strong></font></td>
<td width="1000" bgcolor="#FFFFFF"><font color="#000000">Financial companies choose how they share your personal information.  Federal law gives consumers the right to limit some, but not all, sharing.  Federal law also requires us to tell you how we collect, share, and protect your personal information.  Please read this notice carefully to understand what we do.</font></td>
</tr>
</table>
<table cellpadding=6 cellspacing=3 class="bordered">
<tr>
<td width="250" bgcolor="#999999"><font color="#FFFFFF" size=+2><strong>What?</strong></font></td>
<td width="1000" bgcolor="#FFFFFF"><font color="#000000">The types of personal information we collect and share depend on the product or service you have with us.  This information can include: 
<ul>
<li>Social Security number and income</li>
<li>transaction history and payment history </li>
<li>purchase history and account balances </li>
</ul>
When you are no longer our customer, we continue to share your information as described in this notice.</font></td>
</tr>
</table>
<table cellpadding=6 cellspacing=3 class="bordered">
<tr>
<td width="250" bgcolor="#999999"><font color="#FFFFFF" size=+2><strong>How?</strong></font></td>
<td width="1000" bgcolor="#FFFFFF"><font color="#000000">All financial companies need to share customers’ personal information to run their everyday business.  In the section below, we list the reasons financial companies can share their customers’ personal information; the reasons North American Title Group, Inc. Family of Companies (“NATG”) choose to share; and whether you can limit this sharing.</font></td>
</tr>
</table>
<br>
<br>

<table cellpadding=6 cellspacing=1 class="bordered" bgcolor="#000000">
<tr>
<td width="33%" bgcolor="#000000"><font color="#FFFFFF"><strong>Reasons we can share your personal information</strong></font></td>
<td width="33%" bgcolor="#000000"><font color="#FFFFFF"><strong>Does NATG share?</strong></font></td>
<td width="33%" bgcolor="#000000"><font color="#FFFFFF"><strong>Can you limit this sharing?</strong></font></td>
</tr>

<tr>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><strong>For our everyday business purposes—</strong><br>
such as to process your transactions, maintain your account(s), respond to court orders and legal investigations, or report to credit bureaus</</font></td>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><center>Yes</center></font></td>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><center>No</center></font></td>
</tr>


<tr>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><strong>For our marketing purposes—</strong><br>
to offer our products and services to you</</font></td>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><center>Yes</center></font></td>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><center>No</center></font></td>
</tr>


<tr>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><strong>For joint marketing with other financial companies—</strong><br>
</font></td>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><center>No</center></font></td>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><center>We don’t share</center></font></td>
</tr>



<tr>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><strong>For our affiliates’ everyday business purposes—</strong><br>
information about your transactions and experiences</font></td>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><center>Yes</center></font></td>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><center>No</center></font></td>
</tr>

<tr>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><strong>For our affiliates’ everyday business purposes—</strong><br>
information about your creditworthiness</font></td>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><center>No</center></font></td>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><center>We don’t share</center></font></td>
</tr>

<tr>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><strong>For our affiliates to market to you—</strong><br>
</font></td>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><center>No</center></font></td>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><center>We don’t share</center></font></td>
</tr>

<tr>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><strong>For nonaffiliates to market to you—</strong><br>
</font></td>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><center>No</center></font></td>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><center>We don’t share</center></font></td>
</tr>

</table>
<br>
<br>
<table cellpadding=6 cellspacing=3 class="bordered">
<tr>
<td width="250" bgcolor="#000000"><font color="#FFFFFF" size=+2><strong>Questions?</strong></font></td>
<td width="1000" bgcolor="#FFFFFF"><font color="#000000">Call 1 (888) 444-7766, extension 6585 </font></td>
</tr>
</table>

<br>
<br>
<br>
<br>
<br>
<table cellpadding=6 cellspacing=1 class="bordered" bgcolor="#000000">
<tr>
<td width="250" bgcolor="#000000" colspan="2"><font color="#ffffff">Who are we?</font></td>
</tr>
<tr>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><strong>Who is providing this notice?</strong></font></td>
<td width="64%" bgcolor="#FFFFFF"><font color="#000000">The North American Title Group, Inc. Family of Companies (identified below), such as home owners insurance and home mortgage companies.</font></td>
</tr>


<tr>
<td width="250" bgcolor="#000000" colspan="2"><font color="#ffffff">What we do</font></td>
</tr>
<tr>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><strong>How does NATG protect my personal information?</strong></font></td>
<td width="64%" bgcolor="#FFFFFF"><font color="#000000">To protect your personal information from unauthorized access and use, we use security measures that comply with federal law.  These measures include computer safeguards and secured files and buildings.</font></td>
</tr>


<tr>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><strong>How does NATG collect my personal information?</strong></font></td>
<td width="64%" bgcolor="#FFFFFF"><font color="#000000">We collect your personal information, for example, when you 
<UL>
<LI>apply for financing or provide employment information</LI> 
<LI>provide account information or show your government issued ID </LI>
<LI>give us your contact information </LI> 
</UL>
We also collect your personal information from others, such as credit bureaus, affiliates or other companies.</font></td>
</tr>


<tr>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><strong>Why can’t I limit all sharing?</strong></font></td>
<td width="64%" bgcolor="#FFFFFF"><font color="#000000">Federal law gives you the right to limit only 
<UL>
<LI>sharing for affiliates’ everyday business purposes—information about your creditworthiness</LI> 
<LI>affiliates from using your information to market to you </LI>
<LI>sharing for nonaffiliates to market to you</LI> 
</UL>
</tr>



<tr>
<td width="250" bgcolor="#000000" colspan="2"><font color="#ffffff">Definitions</font></td>
</tr>
<tr>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><strong>Affiliates</strong></font></td>
<td width="64%" bgcolor="#FFFFFF"><font color="#000000">Companies related by common ownership or control.  They can be financial and nonfinancial companies.
<ul>
<li><em>Our affiliates include the companies listed below.</em></li>
</ul></font></td>
</tr>


<tr>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><strong>Nonaffiliates</strong></font></td>
<td width="64%" bgcolor="#FFFFFF"><font color="#000000">Companies not related by common ownership or control.  They can be financial and nonfinancial companies.
<ul>
<li><em>Nonaffiliates we share with can include collection agencies, IT service providers, companies that perform marketing services on our or their own behalf, consumer reporting agencies, and others.</em></li>
<li><em>NATG does not share with nonaffiliates so they can market to you.
Joint marketing	A formal agreement between nonaffiliated financial companies that together market financial products or services to you.</em></li>
</ul></font></td>
</tr>



<tr>
<td width="33%" bgcolor="#FFFFFF"><font color="#000000"><strong>Joint marketing</strong></font></td>
<td width="64%" bgcolor="#FFFFFF"><font color="#000000">A formal agreement between nonaffiliated financial companies that together market financial products or services to you.
<ul>
<li><em>NATG doesn’t jointly market.</em></li>
</ul></font></td>
</tr>
</table>


<br>
<br>

<br>
<table>
<tr>
<td align="left" valign="top" colspan="2">
<strong>Our Affiliates</strong>. The North American Title Group, Inc. Family of Companies is:<br><br>

</td>
</tr>
<tr>
<td align="left" valign="top" width="400">
North American Title Company <BR>
North American Title Insurance Company<BR>
North American Title Alliance, LLC<BR>
North American Title Florida Alliance, LLC<BR>
North American Services, LLC<BR>
North American Title Agency<BR>
</td>
<td align="left" valign="top" width="400">
North American Abstract Agency<BR>
NASSA, LLC<BR>
North American Title, LLC<BR>
North American Advantage Insurance Services, LLC<BR>
North American National Title Solutions, LLC<BR>
North American Exchange Company<BR>
</td>
</tr>
</table>

</CENTER>
</body>
</cfdocumentsection>







<!--- =================[ BEGIN SCHEDULE A         ]======================== --->
<!--- ====================================================================== --->
<cfdocumentsection>

<!--- <cfdocumentitem type="header">
<cfoutput><table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left"><font color="black" size="1">G.F. No.: #read_title.title_id# T</font></td>
  </tr>
</table></cfoutput>
</cfdocumentitem > --->

<cfdocumentitem type="footer">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left"><font color="black" size="1">FORM T-7: COMMITMENT FOR TITLE INSURANCE (11/01/2009)</font></td>
  </tr>
</table>
</cfdocumentitem >

<body style="background-color: #FFFFFF; font-family:Arial, Helvetica, sans-serif; font-size:9px" background="frame_background.gif">
<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size: 10px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20pt}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:12pt}
.medium_header {font-family:Arial, Helvetica, sans-serif; font-size:18pt}
</style>
<cfoutput>
<center>
<span class="small_header">SCHEDULE A</span><br><br>



<br>
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
<cfif read_title.title_id eq 119766 or read_title.title_id eq 117883 or read_title.title_id eq 120304 or read_title.title_id eq 119718 or read_title.title_id eq 131996>
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
<li>OTHER: <BR>
Policy Amount:  $ <BR>
PROPOSED INSURED:	<BR>
Proposed Borrower:<BR><BR></li>
</ol></td>
</tr>

<tr>
<td align"left" valign="top" width="40">2.</td>
<td align"left" valign="top">The interest in the land covered by this Commitment is:<br>
<cfif read_title.title_id eq 123821>
Tract 1: Fee Simple: Tract 2: Easement Estate.
<cfelseif read_title.title_id eq 128651>
Fee Simple as to Tract I and Easement as to Tract II
<cfelse>
#read_deed.data38#</cfif></td>
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
<tr>
<td align"left" valign="top" colspan="2">Countersigned:<BR>
Title & Escrow of Texas, Inc.<BR><BR><br><br>
<br>




By  <cfif ListFind("524,529",session.ft_user_id) ><img src="/images/nathan_sig2.jpg" width="200"><cfelseif ListFind("632",session.ft_user_id) ><img src="http://<cfoutput>#cgi.server_name#</cfoutput>/images/sarah_sig2.jpg"  width="200"><cfelseif ListFind("633",session.ft_user_id) ><img src="http://<cfoutput>#cgi.server_name#</cfoutput>/images/sherry_sig2.jpg"  width="200"><cfelse>______________________________________________</cfif><BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Authorized Signatory</td>
</tr>
</table>
</cfoutput>
</CENTER>
</body>
</cfdocumentsection>










<!--- =================[ BEGIN SCHEDULE A         ]======================== --->
<!--- ====================================================================== --->
<cfdocumentsection>

<!--- <cfdocumentitem type="header">
<cfoutput><table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left"><font color="black" size="1">G.F. No.: #read_title.title_id# T</font></td>
  </tr>
</table></cfoutput>
</cfdocumentitem > --->

<cfdocumentitem type="footer">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left"><font color="black" size="1">FORM T-7: COMMITMENT FOR TITLE INSURANCE (11/01/2009)</font></td>
  </tr>
</table>
</cfdocumentitem >

<body style="background-color: #FFFFFF; font-family:Arial, Helvetica, sans-serif; font-size:9px" background="frame_background.gif">
<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size: 10px}
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
<span class="small_header">SCHEDULE A</span><br>
(continued)<br>
<br>
<strong>LEGAL DESCRIPTION</strong><br>
<br>



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
</CENTER>
</body>
</cfdocumentsection>








<!--- =================[ BEGIN SCHEDULE A         ]======================== --->
<!--- ====================================================================== --->
<cfdocumentsection>

<!--- <cfdocumentitem type="header">
<cfoutput><table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left"><font color="black" size="1">G.F. No.: #read_title.title_id# T</font></td>
  </tr>
</table></cfoutput>
</cfdocumentitem > --->

<cfdocumentitem type="footer">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left"><font color="black" size="1">FORM T-7: COMMITMENT FOR TITLE INSURANCE (11/01/2009)</font></td>
  </tr>
</table>
</cfdocumentitem >

<body style="background-color: #FFFFFF; font-family:Arial, Helvetica, sans-serif; font-size:9px" background="frame_background.gif">
<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10pt}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18pt}
.small_header {font-family:"Times New Roman", Times, serif; font-size:12pt}
.medium_header {font-family:"Times New Roman", Times, serif; font-size:14pt}
</style>

<cfoutput><table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left"><font color="black" size="1"><!--- G.F. No.: #read_title.title_id# T ---></font></td>
  </tr>
</table></cfoutput>

<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size: 10px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20pt}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:12pt}
.medium_header {font-family:Arial, Helvetica, sans-serif; font-size:18pt}
</style>
<center>
<cfoutput>
<span class="small_header">SCHEDULE B</span><br>
<strong>EXCEPTIONS FROM COVERAGE</strong><br>
<br>

<table align="center" width="93%" cellpadding="2">

<tr>
<td align"left" valign="top">
In addition to the Exclusions and Conditions and Stipulations, your Policy will not cover loss, costs, attorney’s fees, and expenses resulting from:<BR>
<ol>


<cfif Len(read_deed.covenants)><LI>The following restrictive covenants of record itemized below::<BR>#read_deed.covenants#</LI><BR></cfif>
<li>Any discrepancies, conflicts, or shortages in area or boundary lines, or any encroachments or protrusions, or any overlapping of improvements.</li><BR>
<li>Homestead or community property or survivorship rights, if any, of any spouse of any insured. (Applies to the Owner Policy only.)</li><BR>
<li>Any titles or rights asserted by anyone, including, but not limited to, persons, the public, corporations, governments or other entities,</li>
<BR>
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

</CENTER>
</body>
</cfdocumentsection>





<!--- =================[ BEGIN SCHEDULE A         ]======================== --->
<!--- ====================================================================== --->
<cfdocumentsection>

<cfdocumentitem type="footer">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left"><font color="black" size="1">FORM T-7: COMMITMENT FOR TITLE INSURANCE (11/01/2009)</font></td>
  </tr>
</table>
</cfdocumentitem >


<body style="background-color: #FFFFFF; font-family:Arial, Helvetica, sans-serif; font-size:9px" background="frame_background.gif">
<cfoutput><table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left"><font color="black" size="1">G.F. No.: #read_title.title_id# T</font></td>
  </tr>
</table></cfoutput>

<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size: 10px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20pt}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:12pt}
.medium_header {font-family:Arial, Helvetica, sans-serif; font-size:18pt}
</style>
<center>
<cfoutput>
<span class="small_header">SCHEDULE C</span><br>
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
<li>You must pay the seller or borrower the agreed amount for your property or interest.</li><BR>
<li>Any defect, lien or other mater that may affect title to the land or interest insured, that arises or is filed after the effective date of this Commitment.<BR>

This commitment was prepared for the issuance of a Loan Policy only which renews and extends the mortgage listed above.  If the character of the current transaction changes and an Owner's Title is to be issued, we require that the order be resubmitted to the exam department for additional underwriting and / or requirements and exceptions.</li><BR>

<li>On a refinance transaction wherein the amount of the new loan is greater than the legally acceptable statutory amounts, Company requires the following language be inserted in the Note and Deed of Trust after the description of the Note being secured:  "In the event that any portion of the lien is found to be invalid against homestead property, all payments made under the Note shall be first applied to that portion of the lien which is found to be invalid against the homestead".  (DOES NOT APPLY TO FHA AND/OR VA REFINANCE LOANS).</li><BR>

<li>We require evidence of the marital / homestead status of the record owner(s) and/or borrower(s), from the date of acquisitions of the property to the date of the closing of this transaction.  If title is held by a married person, we will require the joinder of both spouses on any conveyance.  Any loan transaction may require an affidavit acceptable to Company to designate and disclaim the residence or business homestead of borrower(s). Title & Escrow of Texas, Inc. reserves the right to make further requirements based on said evidence and/or affidavit.</li><BR>

<li>If we are to amend the standard survey exception to read "Shortages in area" and upon payment of the applicable premium (if any), we will require a Category 1A survey from a Registered Public Surveyor acceptable to this Company showing:<BR><BR>
	<ol type="a">
	<li>The location of all improvements and the exact location of all building lines in relation to the property lines;</li><BR>
	<li>Easements and/or rights-of-way, dedicated or not, that a physical inspection of the premises would disclose, and</li><BR>
	<li>Indicating and labeling all encroachments, or on the face of the survey stating "NO ENCROACHMENTS."</li></ol></li><BR><BR>


<li>Procedural Rule P-27 as provided for in Article 9.39 of the Texas Insurance Code requires that "Good Funds" be received and deposited before a Title Agent may disburse from its trust fund account.  If monies in excess of $1,500.00 are required to the paid by the Borrower or Seller, Title Agent must be provided with Certified Funds or a Cashier's Check.</li><BR>

<li>Copies of Borrowers and Sellers Driver's License are to be sent to the Title Company for ID.</li><BR>

<li>House Bill 2061, effective March 29, 2007, requires that a specific notice set forth in the bill be on the top of the first page of every deed and deed of trust transferring an interest in property to or from an individual:	<br><BR>

NOTICE OF CONFIDENTIALITY RIGHTS: IF YOU ARE A NATURAL PERSON, YOU MAY REMOVE OR STRIKE ANY OR ALL OF THE FOLLOWING INFORMATION FROM ANY INSTRUMENT THAT TRANSFERS AN INTEREST IN REAL PROPERTY BEFORE IT IS FILED FOR RECORD IN THE PUBLIC RECORDS: YOUR SOCIAL SECURITY NUMBER OR YOUR DRIVER'S LICENSE NUMBER.</li><BR>

<li>NOTICE:  The title insurance policy being issued to you contains an arbitration provision.  It allows you or the Company to require arbitration if the amount of insurance is $2,000,000 or less.  If you want to retain your right to sue the Company in case of a dispute over a claim, you must request deletion of the arbitration provision before the policy is issued.  If you are the purchaser in the transaction and elect deletion of the arbitration provision, a form will be presented to you at closing for execution.  If you are the lender in the transaction and desire deletion of the Arbitration provision, please inform us through your Loan Closing Instructions.  APPLIES TO LOAN POLICY ONLY.</li><BR></cfoutput>

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
		
</body>
</cfdocumentsection>






<!--- =================[ BEGIN SCHEDULE A         ]======================== --->
<!--- ====================================================================== --->
<cfdocumentsection>

<cfdocumentitem type="footer">
<cfoutput><table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left" valign="bottom"><font color="black" size="1">Texas Commitment T-7<br>
Schedule D</font></td>
    <td align="right" valign="bottom"><font color="black" size="1">Schedule D	Valid only if Schedules A, B and C and Cover Page are attached</font></td>
  </tr>
</table></cfoutput>

</cfdocumentitem >

<body style="background-color: #FFFFFF; font-family:Arial, Helvetica, sans-serif; font-size:9px" background="frame_background.gif">
<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size: 10px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20pt}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:12pt}
.medium_header {font-family:Arial, Helvetica, sans-serif; font-size:18pt}
</style>
<center>
<span class="small_header"><strong>Committment for Title Insurance<br>
Schedule D</strong></span><br><br>
<cfoutput><table align="center" width="93%">
<tr>
<td align"left" valign="top" width="50%">GF No.: #read_title.title_id# T</td>
<td align"right" valign="top" width="50%">Effective Date: #DateFormat(read_deed.data37, "mm/dd/yyyy")#</td>
</tr>
</table></cfoutput>	
<br>

<cfoutput>
<table align="center" width="93%">
<tr>
<td align"left" valign="top">The following disclosures are made pursuant to Procedural Rule P-21 promulgated by the Texas Department of Insurance: <BR><BR>

<table>
<tr>
<td width="45" align"left" valign="top" >1.</td>
<td align"left" valign="top" colspan=2>UNDERWRITER:  North American Title Insurance Company<BR><BR></td></tr>
<tr>
<td width="45" align"left" valign="top" >&nbsp;</td><td width="45" align"left" valign="top">a.</td>
<td align"left" valign="top" >Shareholder(s)/Members owning or controlling, directly, ten percent or more of the shares of the Underwriter:<br><br>

North American Title Insurance Company, a California corporation, is a wholly owned subsidiary of North American Asset Development Corporation, a California corporation, which is a wholly owned subsidiary of North American Title Group, Inc., a Florida corporation which is a wholly-owned subsidiary of Lennar Financial Services, Inc., a Florida corporation. Lennar Financial Services, Inc. is a wholly owned subsidiary of Lennar Corporation, a Delaware corporation, whose securities are publicly traded on the New York Stock Exchange.</td></tr>
<tr>
<td width="45" align"left" valign="top" >&nbsp;</td><td width="45" align"left" valign="top">b.</td>
<td align"left" valign="top" >Officers (with titles)/ Directors of the Underwriter:<br>
<br>
Emilio Fernandez, President, Director<br>
Linda Reed, Executive Vice President, Director<br>
Clotilde Keller, Chief Financial Officer, Senior Vice President, Assistant Secretary, Director<br>
Jefferson E. Howeth, Executive Vice President, Secretary, General Counsel<br>
John Fries, Executive Vice President, Chief Underwriting Counsel<br>
Margery Q. Lee, Executive Vice President<br>
Donnis L. Benson, Vice President, Treasurer<br>
Beverly S. Akins, Vice President, Agency Operations Manager<br>
Virginia Abiassi, Vice President, Regional Underwriting Counsel<br>
Linda Sowell-Forbes, Assistant Secretary<br>
Elizabeth Wallace, Assistant Secretary  <BR><BR>
</td></tr>

<tr>
<td width="45" align"left" valign="top" >2.</td>
<td align"left" valign="top" colspan=2>AGENT:<BR><BR></td></tr>
<tr>
<td width="45" align"left" valign="top" >&nbsp;</td><td width="45" align"left" valign="top">a.</td>
<td align"left" valign="top" >Shareholders, owners, partners, or other persons having, owning or controlling one percent (1%) or more of the Title Insurance Agent are:<br>
&nbsp;&nbsp;&nbsp;&nbsp;Stephen J. Papermaster<br>
&nbsp;&nbsp;&nbsp;&nbsp;Pamela Gibbons</td></tr>
<tr>
<td width="45" align"left" valign="top" >&nbsp;</td><td width="45" align"left" valign="top">b.</td>
<td align"left" valign="top" >Shareholders, owners, partners, or other persons having, owning or controlling ten percent (10%) or more of an entity that has, owns or controls one percent (1%) or more of the Title Insurance Agent are: <BR><BR>
</td></tr>
<tr>
<td width="45" align"left" valign="top" >&nbsp;</td><td width="45" align"left" valign="top">c.</td>
<td align"left" valign="top" >If the Title Insurance Agent is a corporation, an LLC, an LP or an LLP, the following is a list of its officers, directors, and/or managers and/or managing partner(s) (with titles):<br>
&nbsp;&nbsp;&nbsp;&nbsp;Stephen J. Papermaster<br>
&nbsp;&nbsp;&nbsp;&nbsp;Pamela Gibbons<BR><BR>
</td></tr>
<tr>
<td width="45" align"left" valign="top" >3.</td>
<td align"left" valign="top" colspan=2>You are entitled to receive advance disclosure of settlement charges in connection with the proposed transaction to which this commitment relates.  Upon your request, such disclosure will be made to you.  Additionally, the name of any person, firm or corporation receiving a portion of the premium from the settlement of this transaction will be disclosed on the closing or settlement statement.<BR><BR></td></tr>
<tr>
<td colspan="3" align"left" valign="top" >You are further advised that the estimated title premium* is:<BR><BR><br>
</td></tr></table>
<br>
<center>
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
</center>
<br>
Of this total amount: 15% will be paid to the policy issuing Title Insurance Company; 85% will be retained by the issuing Title Insurance Agent; and the remainder of the estimated premium will be paid to other parties as follows:<br>
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
*The estimated premium is based upon information furnished to us of the date of this Commitment for Title Insurance. Final determination of the amount of the premium will be made at closing in accordance with the Rules and Regulations adopted by the State Board of Insurance.<br>
<br>
</cfoutput>



</td></tr></table>

</CENTER>

</body>
</cfdocumentsection>





<!--- =================[ BEGIN SCHEDULE A         ]======================== --->
<!--- ====================================================================== --->
<cfdocumentsection>

<!--- <cfdocumentitem type="footer">
<cfoutput><table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left" valign="bottom"><font color="black" size="1">Texas Commitment T-7<br>
Schedule D</font></td>
    <td align="right" valign="bottom"><font color="black" size="1">Schedule D	Valid only if Schedules A, B and C and Cover Page are attached</font></td>
  </tr>
</table></cfoutput>
</cfdocumentitem > --->

<body style="background-color: #FFFFFF; font-family:Arial, Helvetica, sans-serif; font-size:9px" background="frame_background.gif">
<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:10px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:14px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:12px}
</style>

<table width="93%" cellpadding=0 cellspacing=0 border=0 >
    <tr>
          <td>
		 <div align="center">
		 <BR>
<img src="http://<cfoutput>machine1.firsttitleservices.com</cfoutput>/images/natic_logo.jpg" width="288" height="74">
			<br></div>
          </td>
    </tr>
</table><br>

<br>
<table width="93%" cellpadding=1 cellspacing=2 border=0 bgcolor="#000000">
<tr>
<td>
<table width="100%" cellpadding=10 cellspacing=0 border=0 bgcolor="#ffffff">
<tr>
<td width="100%" align="left" valign"top">
<br>
<em>This translation of the Privacy Policy Notice is furnished to you in order to assist you in understanding its terms.  This translation is not an official form promulgated by the Texas Department of Insurance.  It is not a report or opinion of title, an agreement to insure, or a representation of the insurance you may receive.  If this translation conflicts with the form promulgated by the Texas Department of Insurance, the promulgated form will control in all respects.</em><br>
<br>
</td>
</tr>
</table>


</td>
</tr>
</table>
<table cellpadding="24">
<tr>
<td><br>
<br>

<center>
<strong><span class="big_header"><font size=+1>Privacy Policy Notice</font><BR></span>
<span class="small_header">PURPOSE OF THIS NOTICE</span></strong>
</center>
</center>
</center>
</center>
<br>
<br>
Title V of the Gramm-Leach-Bliley Act (GLBA) generally prohibits any financial institution, directly or through its affiliates, from sharing nonpublic personal information about you with a nonaffiliated third party unless the institution provides you with a notice of its privacy policies and practices, such as the type of information that it collects about you and the categories of persons or entities to whom it may be disclosed. In compliance with the GLBA, we are providing you with this document, which notifies you of the privacy policies and practices of North American Title Insurance Company.<br>
<br>
We may collect nonpublic personal information about you from the following sources:<br>
<ul>
<li>Information we receive from you, such as on applications or other forms. </li>
<li>Information about your transactions we secure from our files, or from our affiliates or others. </li>
<li>Information we receive from a consumer reporting agency. </li>
<li>Information that we receive from others involved in your transaction, such as the real estate agent or lender. </li>
</ul>

Unless it is specifically stated otherwise in an amended Privacy Policy Notice, no additional nonpublic personal information will be collected about you. <br>
<br>

We may disclose any of the above information that we collect about our customers or former customers to our affiliates or to nonaffiliated third parties as permitted by law. <br>
<br>

We also may disclose this information about our customers or former customers to the following types of nonaffiliated companies that perform marketing services on our behalf or with whom we have joint marketing agreements: <br>
<ul>
<li>Financial service providers such as companies engaged in banking, consumer finance, securities and insurance.</li>
<li>Non-financial companies such as envelope stuffers and other fulfillment service providers. </li>
</ul>

WE DO NOT DISCLOSE ANY NONPUBLIC PERSONAL INFORMATION ABOUT YOU WITH ANYONE FOR ANY PURPOSE THAT IS NOT SPECIFICALLY PERMITTED BY LAW. 
We restrict access to nonpublic personal information about you to those employees who need to know that information in order to provide products or services to you. We maintain physical, electronic, and procedural safeguards that comply with federal regulations to guard your nonpublic personal information.<br>
<br>
</td></tr></table>

</body>
</cfdocumentsection>




<!--- =================[ WIRING INSTRUCTIONS   ]======================== --->
<!--- ====================================================================== --->
<cfdocumentsection>
<cfdocumentitem type="header">
<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:10px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:16px}

</style>

<table width="100%" cellpadding=0 cellspacing=0 border=0 >
    <tr>
          <td>
<center><br>
<B><strong><span class="big_header">North American Title Insurance Company</span></strong><BR>
<span="small_header">COMMITMENT FOR TITLE INSURANCE FORM</span></B><br>
<br>
<B>&nbsp;</b></strong><br><br>
WIRING INSTRUCTIONS
</center>
          </td>
    </tr>
</table>
</cfdocumentitem >
<cfdocumentitem type="footer">
</cfdocumentitem >


<body style="background-color: #FFFFFF; font-family:Arial, Helvetica, sans-serif; font-size:10px" >
<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:10px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:16px}

</style>

<table width="100%" cellpadding=5 cellspacing=0 border=0 >
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
	<cfinclude template="../title_committment_wire_instructions.cfm">	
		</td>
	</tr>

	</table>
</body>
</cfdocumentsection>





</cfdocument>


