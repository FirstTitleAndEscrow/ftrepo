
<CFPARAM NAME="a_trigger" DEFAULT="0">
<cfparam name="create_pdf" default=0>
<CFQUERY datasource="#request.dsn#" NAME="read_Title">
	SELECT *
	FROM Property
	WHERE prop_ID = #rec_ID#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_company">
	SELECT *
	FROM companies
	WHERE ID = #read_title.comp_id#
</CFQUERY>

<cfset file_prefix="S&B">
<cfset sd_list="9506,9507,9508,9510,9509,9511,9567">
<!--- if this is S&D or one of their companies (listed above) - then use different email --->
	<cfif ListContains(sd_list,read_title.comp_id,",") or Mid(read_company.company,1,3) eq 'S&D'>
		<cfif read_title.pstate eq 'PA'>
            <cfset file_prefix="S&D">
		<cfelseif read_title.pstate eq 'FL'>
            <cfset file_prefix="SFG">
		</cfif>
	</cfif>



<CFQUERY datasource="#request.dsn#" NAME="check_if_update" maxrows="1">
Select * from vendor_tracker_new where order_id = #rec_ID#
and task = 'Abstract'
order by assign_date desc
</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_vendor_assign">
SELECT *
			FROM Vendor_Tracker_New v, Vendors_STACIE s
			where v.order_id = #rec_ID#
			and v.order_type = 'P'
			and v.task = 'Abstract'
			and s.vendor_id = v.vendor_id
			ORDER BY v.assign_date, assign_time desc
</cfquery>

<cfparam name="read_vendor_assign.company" default="">


<CFQUERY datasource="#request.dsn#" NAME="Mortgage_Count">
	SELECT     *, prop_id AS Expr1
	FROM         dbo.prop_ins_view
	WHERE     (prop_id = #rec_ID#) AND (selectedOrgs4 IS NOT NULL)
</CFQUERY>

<cfquery dbtype="query" name="all_trusts">
	SELECT *
	FROM Mortgage_Count
</cfquery>


<CFQUERY datasource="#request.dsn#" NAME="Judgment_Count">
	SELECT     *, prop_id AS Expr1
	FROM         dbo.prop_ins_view
	WHERE     (prop_id = #rec_ID#) AND (selectedOrgs3 IS NOT NULL)
</CFQUERY>


<CFSET Buyer_1 = #read_Title.bfirstname1# & " " & #read_Title.bminame1# & " " & #read_Title.blastname1#>
<CFSET Buyer_2 = #read_Title.bfirstname2# & " " & #read_Title.bminame2# & " " & #read_Title.blastname2#>
<CFSET Seller_1 = #read_Title.sfirstname1# & " " & #read_Title.sminame1# & " " & #read_Title.slastname1#>
<CFSET Seller_2 = #read_Title.sfirstname2# & " " & #read_Title.sminame2# & " " & #read_Title.slastname2#>

<CFQUERY datasource="#request.dsn#" NAME="Read_Company">
	Select * from companies
	where id =  '#read_title.comp_id#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="Read_Committment_Doc">
	SELECT *
	FROM Doc_Title_Insurance_prop
	WHERE prop_ID = #rec_ID#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_ins_committments">
	SELECT *
	FROM Doc_Title_Insurance_prop
	WHERE prop_ID = #rec_ID#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_billing_states">
	SELECT *
	FROM  Company_Billing_states_HUD2010
	WHERE company_id = '#read_title.comp_id#' AND a_states = '#read_title.pstate#'
</CFQUERY>

<cfif #get_billing_states.recordcount# GT "0">
	<CFQUERY datasource="#request.dsn#" NAME="get_line_costs">
		SELECT *
		FROM Company_Billing_Values_HUD2010
		WHERE company_id = #read_title.comp_id# AND billing_id = #get_billing_states.billing_id#
	</CFQUERY>

	<CFQUERY datasource="#request.dsn#" NAME="read_age">
		SELECT *
		FROM  company_agency_assoc_HUD2010
		WHERE billing_id = '#get_billing_states.billing_id#'
	</CFQUERY>

	<CFQUERY datasource="#request.dsn#" NAME="read_Title_FT_Agency_company">
		SELECT *
		FROM  title_ft_agencies
		WHERE title_ft_agency_id = #read_age.title_ft_agency_id#
	</CFQUERY>
<cfelse>
	<CFQUERY datasource="#request.dsn#" NAME="read_Title_FT_Agency_company">
		SELECT *
		FROM  title_ft_agencies
		WHERE 0 = 1
	</CFQUERY>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="Read_Doc">
	SELECT *
	FROM Doc_Amer_Pioneer_Ins_ALL_prop
	WHERE prop_ID = #rec_ID#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="Read_Committment_Doc">
	SELECT *
	FROM Doc_Amer_Pioneer_Ins_ALL_prop
	WHERE prop_ID = #rec_ID#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_tax_info">
	SELECT *
	FROM tax_cert_prop
	where prop_id = #rec_id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_deed_info">
	SELECT     *
	FROM         prop_ins_view
	WHERE     (prop_id = #rec_id#) AND (type = 'DATA')
	ORDER BY seq_num DESC
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_data_info">
	SELECT     *
	FROM        doc_title_insurance_prop
	WHERE     (prop_id = #rec_id#)
</CFQUERY>


<cfset prop_report_price = 295>

<cfif read_title.search_type eq 'Bankruptcy'>
  <cfif read_title.pstate eq 'MD'>
  <cfset prop_report_price = prop_report_price + read_company.Bankruptcy_md>
  <cfelseif  read_title.pstate eq 'VA'>
  <cfset prop_report_price = prop_report_price + read_company.Bankruptcy_va>
  <cfelseif  read_title.pstate eq 'DC'>
  <cfset prop_report_price = prop_report_price + read_company.Bankruptcy_dc>
  <cfelseif  read_title.pstate eq 'FL'>
  <cfset prop_report_price = prop_report_price + read_company.Bankruptcy_fl>
  <cfelseif  read_title.pstate eq 'PA'>
  <cfset prop_report_price = prop_report_price + read_company.Bankruptcy_pa>
  <cfelse>
  <cfset prop_report_price = prop_report_price + read_company.Bankruptcy_reg>
  </cfif>

<cfelseif read_title.search_type eq 'FHA'>
  <cfif read_title.pstate eq 'MD'>
  <cfset prop_report_price = prop_report_price + read_company.fha_md>
  <cfelseif  read_title.pstate eq 'VA'>
  <cfset prop_report_price = prop_report_price + read_company.fha_va>
  <cfelseif  read_title.pstate eq 'DC'>
  <cfset prop_report_price = prop_report_price + read_company.fha_dc>
  <cfelseif  read_title.pstate eq 'FL'>
  <cfset prop_report_price = prop_report_price + read_company.fha_fl>
  <cfelseif  read_title.pstate eq 'PA'>
  <cfset prop_report_price = prop_report_price + read_company.fha_PA>
  <cfelse>
  <cfset prop_report_price = prop_report_price + read_company.fha_reg>
  </cfif>

<cfelseif read_title.search_type eq 'VA'>
  <cfif read_title.pstate eq 'MD'>
  <cfset prop_report_price = prop_report_price + read_company.VA_md>
  <cfelseif  read_title.pstate eq 'VA'>
  <cfset prop_report_price = prop_report_price + read_company.VA_va>
  <cfelseif  read_title.pstate eq 'DC'>
  <cfset prop_report_price = prop_report_price + read_company.VA_dc>
  <cfelseif  read_title.pstate eq 'FL'>
  <cfset prop_report_price = prop_report_price + read_company.VA_fl>
  <cfelseif  read_title.pstate eq 'PA'>
  <cfset prop_report_price = prop_report_price + read_company.VA_pa>
  <cfelse>
  <cfset prop_report_price = prop_report_price + read_company.VA_reg>
  </cfif>

<cfelseif read_title.search_type eq 'CONV'>
  <cfif read_title.pstate eq 'MD'>
  <cfset prop_report_price = prop_report_price + read_company.CONV_md>
  <cfelseif  read_title.pstate eq 'VA'>
  <cfset prop_report_price = prop_report_price + read_company.CONV_va>
  <cfelseif  read_title.pstate eq 'DC'>
  <cfset prop_report_price = prop_report_price + read_company.CONV_dc>
  <cfelseif  read_title.pstate eq 'FL'>
  <cfset prop_report_price = prop_report_price + read_company.CONV_fl>
  <cfelseif  read_title.pstate eq 'PA'>
  <cfset prop_report_price = prop_report_price + read_company.CONV_pa>
  <cfelse>
  <cfset prop_report_price = prop_report_price + read_company.CONV_reg>
  </cfif>

<cfelseif read_title.search_type eq 'FHLMC'>
  <cfif read_title.pstate eq 'MD'>
  <cfset prop_report_price = prop_report_price + read_company.FHLMC_md>
  <cfelseif  read_title.pstate eq 'VA'>
  <cfset prop_report_price = prop_report_price + read_company.FHLMC_va>
  <cfelseif  read_title.pstate eq 'DC'>
  <cfset prop_report_price = prop_report_price + read_company.FHLMC_dc>
  <cfelseif  read_title.pstate eq 'FL'>
  <cfset prop_report_price = prop_report_price + read_company.FHLMC_fl>
  <cfelseif  read_title.pstate eq 'PA'>
  <cfset prop_report_price = prop_report_price + read_company.FHLMC_pa>
  <cfelse>
  <cfset prop_report_price = prop_report_price + read_company.FHLMC_reg>
  </cfif>

<cfelseif read_title.search_type eq 'FNMA'>
  <cfif read_title.pstate eq 'MD'>
  <cfset prop_report_price = prop_report_price + read_company.FNMA_md>
  <cfelseif  read_title.pstate eq 'VA'>
  <cfset prop_report_price = prop_report_price + read_company.FNMA_va>
  <cfelseif  read_title.pstate eq 'DC'>
  <cfset prop_report_price = prop_report_price + read_company.FNMA_dc>
  <cfelseif  read_title.pstate eq 'FL'>
  <cfset prop_report_price = prop_report_price + read_company.FNMA_fl>
  <cfelseif  read_title.pstate eq 'PA'>
  <cfset prop_report_price = prop_report_price + read_company.FNMA_pa>
  <cfelse>
  <cfset prop_report_price = prop_report_price + read_company.FNMA_reg>
  </cfif>

<cfelseif read_title.search_type eq 'Updates'>
  <cfif read_title.pstate eq 'MD'>
  <cfset prop_report_price = prop_report_price + read_company.Updates_md>
  <cfelseif  read_title.pstate eq 'VA'>
  <cfset prop_report_price = prop_report_price + read_company.Updates_va>
  <cfelseif  read_title.pstate eq 'DC'>
  <cfset prop_report_price = prop_report_price + read_company.Updates_dc>
  <cfelseif  read_title.pstate eq 'FL'>
  <cfset prop_report_price = prop_report_price + read_company.Updates_fl>
  <cfelseif  read_title.pstate eq 'PA'>
  <cfset prop_report_price = prop_report_price + read_company.Updates_pa>
  <cfelse>
  <cfset prop_report_price = prop_report_price + read_company.Updates_reg>
  </cfif>

<cfelseif read_title.search_type eq 'FHA_HUD'>
  <cfif read_title.pstate eq 'MD'>
  <cfset prop_report_price = prop_report_price + read_company.FHA_HUD_md>
  <cfelseif  read_title.pstate eq 'VA'>
  <cfset prop_report_price = prop_report_price + read_company.FHA_HUD_va>
  <cfelseif  read_title.pstate eq 'DC'>
  <cfset prop_report_price = prop_report_price + read_company.FHA_HUD_dc>
  <cfelseif  read_title.pstate eq 'FL'>
  <cfset prop_report_price = prop_report_price + read_company.FHA_HUD_fl>
  <cfelseif  read_title.pstate eq 'PA'>
  <cfset prop_report_price = prop_report_price + read_company.FHA_HUD_pa>
  <cfelse>
  <cfset prop_report_price = prop_report_price + read_company.FHA_HUD_reg>
  </cfif>

<cfelseif read_title.search_type eq 'Vet_Aff'>
  <cfif read_title.pstate eq 'MD'>
  <cfset prop_report_price = prop_report_price + read_company.Vet_Aff_md>
  <cfelseif  read_title.pstate eq 'VA'>
  <cfset prop_report_price = prop_report_price + read_company.Vet_Aff_va>
  <cfelseif  read_title.pstate eq 'DC'>
  <cfset prop_report_price = prop_report_price + read_company.Vet_Aff_dc>
  <cfelseif  read_title.pstate eq 'FL'>
  <cfset prop_report_price = prop_report_price + read_company.Vet_Aff_fl>
  <cfelseif  read_title.pstate eq 'PA'>
  <cfset prop_report_price = prop_report_price + read_company.Vet_Aff_pa>
  <cfelse>
  <cfset prop_report_price = prop_report_price + read_company.Vet_Aff_reg>
  </cfif>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_title_update">
    select *
    from prop_ins_view
	WHERE prop_id = #url.rec_ID# and selectedOrgs is not null
</cfquery>



<cfdocument
format="PDF" 
filename="c:\uploads\P-#read_title.prop_id#_REPORT.pdf" 
overwrite="yes" 
unit = "IN" 
fontembed = "yes" 
orientation = "portrait"
pagetype= "letter" 
pageHeight = "11"
pageWidth = "8.5">


<cfdocumentsection>
<cfdocumentitem type="header">
</cfdocumentitem >

<cfdocumentitem type="footer">
</cfdocumentitem >

<STYLE TYPE="text/css">

TD {font-size:10px; font-family:Arial, Helvetica, sans-serif}
.larger {font-size:12px; font-family:Arial, Helvetica, sans-serif}
.largerstill {font-size:14px; font-family:Arial, Helvetica, sans-serif}
</STYLE>

<cfoutput>
<table with=800 align=left>


<tr>
<td  valign="top" align=Center class="larger"><i>STREAMLINE TITLE & ESCROW, INC.<br>
7361 CALHOUN PLACE, SUITE 200<br>
ROCKVILLE MD 20855<br>
301-279-0303</i><br></td>
</tr>


<cfif check_if_update.product_ordered eq 'bring_to_date'>
<tr>
<td valign="top" align=Center class="largerstill"><strong>UPDATE</strong><br><br></td>
</tr>
<cfelse>
<tr>
<td valign="top" align=Center class="largerstill"><strong>NEW SEARCH</strong><br><br></td>
</tr>
</cfif>

<tr>
<td valign="top" align=left><strong><br><br>FILE NO</strong>: #read_title.prop_id#<br>
<strong>#file_prefix# FILE NO</strong>: #read_title.loan_number#<br></td>
<td valign="top" align=right><br><br><nobr><strong>ORIG BY</strong>: #read_vendor_assign.company#</nobr>
</td>
</tr>

<tr>
<td valign="top" align=left><br><strong><span class="larger"><!--- TYPE OF SEARCH REQUESTED</span></strong>: <cfif read_title.search_Type eq 'A'>Current Owner<cfelseif read_title.search_Type eq 'B'>Full Search<cfelse>#read_title.search_Type#</cfif> --->
SEARCH DATE: #DateFormat(read_deed_info.search_date, "mm/dd/yyyy")#</td>
</tr>
<tr>
<td valign="top" align=left><br><strong><span class="larger"><em>EFFECTIVE DATE</em></span></strong>: #DateFormat(read_Title_update.data37, "mm/dd/yyyy")#</td>
</tr>

<tr>
<td valign="top" align=left><br><strong><em>PRESENT OWNER</em></strong>: <br><br>
#read_deed_info.data3#<cfif read_deed_info.data4 neq '' and read_deed_info.data4 neq 'NULL'> and #read_deed_info.data4#</cfif></td>
</tr>

<tr>
<td valign="top" align=left><br><br><strong>AND BEING: DB/INST##</strong>: <cfif read_title_update.data7 neq '' and read_title_update.data7 neq 'NULL'> #read_title_update.data7#</cfif> <cfif read_title_update.data8 neq '' and read_title_update.data8 neq 'NULL'> Book: #read_title_update.data8#</cfif> <cfif read_title_update.data9 neq '' and read_title_update.data9 neq 'NULL'> Page: #read_title_update.data9#</cfif></td>
</tr>



<tr>
<td valign="top" align=left><br><strong>PROPERTY DESCRIPTION</strong>: See APPENDIX "A"</td>
</tr>


<tr>
<td valign="top" align=left><br><strong><span class="larger">TRUSTS</strong>: #Mortgage_count.recordcount#</span></td>
</tr>
</cfoutput>

<!--- <cfoutput query="subject_trust">
<tr>
<td valign="top" align=left><br><br><strong>SUBJECT TRUST</strong>: DB/INSTRUMENT##: <cfif subject_trust.data5 neq '' and subject_trust.data5 neq 'NULL'> #subject_trust.data5#</cfif> <cfif subject_trust.data6 neq '' and subject_trust.data6 neq 'NULL'> #subject_trust.data6#</cfif><cfif subject_trust.data7 neq '' and subject_trust.data7 neq 'NULL'>-#subject_trust.data7#</cfif>  DATED #Dateformat(subject_trust.data8, "m/d/yyyy")# FROM #subject_trust.data2#<cfif subject_trust.data3 neq '' and subject_trust.data3 neq 'NULL'> and #subject_trust.data3#</cfif> TO #subject_trust.data1# SECURING #subject_trust.data4#. RECORDED #Dateformat(subject_trust.data9, "m/d/yyyy")#. #subject_trust.data11#  #subject_trust.addreq# #subject_trust.addex# #subject_trust.comments# <BR>
<cfif subject_trust.data13 neq '' and subject_trust.data13 neq 'NULL'>
**ASSIGNED TO #subject_trust.data13# IN <cfif subject_trust.data14 neq '' and subject_trust.data14 neq 'NULL'> #subject_trust.data14#</cfif> <cfif subject_trust.data15 neq '' and subject_trust.data15 neq 'NULL'> #subject_trust.data15#</cfif><cfif subject_trust.data16 neq '' and subject_trust.data16 neq 'NULL'>-#subject_trust.data16#</cfif><BR>
</cfif>
<cfif subject_trust.data18 neq '' and subject_trust.data18 neq 'NULL'>
**ASSIGNED TO #subject_trust.data18# IN <cfif subject_trust.data19 neq '' and subject_trust.data19 neq 'NULL'> #subject_trust.data19#</cfif> <cfif subject_trust.data20 neq '' and subject_trust.data20 neq 'NULL'> #subject_trust.data20#</cfif><cfif subject_trust.data21 neq '' and subject_trust.data21 neq 'NULL'>-#subject_trust.data21#</cfif><BR>
</cfif>

<cfif subject_trust.data23 neq '' and subject_trust.data23 neq 'NULL'>
**ASSIGNED TO #subject_trust.data23# IN <cfif subject_trust.data24 neq '' and subject_trust.data24 neq 'NULL'> #subject_trust.data24#</cfif> <cfif subject_trust.data25 neq '' and subject_trust.data25 neq 'NULL'> #subject_trust.data25#</cfif><cfif subject_trust.data26 neq '' and subject_trust.data26 neq 'NULL'>-#subject_trust.data26#</cfif><BR>
</cfif>

<cfif subject_trust.data28 neq '' and subject_trust.data28 neq 'NULL'>
**ASSIGNED TO #subject_trust.data28# IN <cfif subject_trust.data29 neq '' and subject_trust.data29 neq 'NULL'> #subject_trust.data29#</cfif> <cfif subject_trust.data30 neq '' and subject_trust.data30 neq 'NULL'> #subject_trust.data30#</cfif><cfif subject_trust.data31 neq '' and subject_trust.data31 neq 'NULL'>-#subject_trust.data31#</cfif><BR>
</cfif>
</td>
</tr>
</cfoutput> --->

<cfset trust_number = 0>
<cfoutput query="all_trusts">
<cfset trust_number = trust_number + 1>

<tr>
<td valign="top" align=left><br><strong>Trust ###trust_number#: <cfif all_trusts.subject_trust eq 1>Subject Trust, </cfif>DB/INSTRUMENT##</strong>: <cfif all_trusts.data5 neq '' and all_trusts.data5 neq 'NULL'> #all_trusts.data5#</cfif> <cfif all_trusts.data6 neq '' and all_trusts.data6 neq 'NULL'> #all_trusts.data6#</cfif><cfif all_trusts.data7 neq '' and all_trusts.data7 neq 'NULL'>-#all_trusts.data7#</cfif>  DATED #Dateformat(all_trusts.data8, "m/d/yyyy")# FROM #all_trusts.data2#<cfif all_trusts.data3 neq '' and all_trusts.data3 neq 'NULL'> and #all_trusts.data3#</cfif> TO #all_trusts.data1# SECURING #all_trusts.data4#. RECORDED #Dateformat(all_trusts.data9, "m/d/yyyy")#. #all_trusts.data11#  #all_trusts.addreq# #all_trusts.addex# #all_trusts.comments# <BR>
<cfif all_trusts.data13 neq '' and all_trusts.data13 neq 'NULL'>
**ASSIGNED TO #all_trusts.data13# IN <cfif all_trusts.data14 neq '' and all_trusts.data14 neq 'NULL'> #all_trusts.data14#</cfif> <cfif all_trusts.data15 neq '' and all_trusts.data15 neq 'NULL'> #all_trusts.data15#</cfif><cfif all_trusts.data16 neq '' and all_trusts.data16 neq 'NULL'>-#all_trusts.data16#</cfif><BR>
</cfif>
<cfif all_trusts.data18 neq '' and all_trusts.data18 neq 'NULL'>
**ASSIGNED TO #all_trusts.data18# IN <cfif all_trusts.data19 neq '' and all_trusts.data19 neq 'NULL'> #all_trusts.data19#</cfif> <cfif all_trusts.data20 neq '' and all_trusts.data20 neq 'NULL'> #all_trusts.data20#</cfif><cfif all_trusts.data21 neq '' and all_trusts.data21 neq 'NULL'>-#all_trusts.data21#</cfif><BR>
</cfif>

<cfif all_trusts.data23 neq '' and all_trusts.data23 neq 'NULL'>
**ASSIGNED TO #all_trusts.data23# IN <cfif all_trusts.data24 neq '' and all_trusts.data24 neq 'NULL'> #all_trusts.data24#</cfif> <cfif all_trusts.data25 neq '' and all_trusts.data25 neq 'NULL'> #all_trusts.data25#</cfif><cfif all_trusts.data26 neq '' and all_trusts.data26 neq 'NULL'>-#all_trusts.data26#</cfif><BR>
</cfif>

<cfif all_trusts.data28 neq '' and all_trusts.data28 neq 'NULL'>
**ASSIGNED TO #all_trusts.data28# IN <cfif all_trusts.data29 neq '' and all_trusts.data29 neq 'NULL'> #all_trusts.data29#</cfif> <cfif all_trusts.data30 neq '' and all_trusts.data30 neq 'NULL'> #all_trusts.data30#</cfif><cfif all_trusts.data31 neq '' and all_trusts.data31 neq 'NULL'>-#all_trusts.data31#</cfif><BR>
</cfif>

</td>
</tr>
</cfoutput>

<!--- <cfif Mortgage_Count.recordcount GTE 2>
<cfloop query="Mortgage_Count" startrow="2" endrow="2">
<tr>
<td align=left>SECOND TRUST: DB/INSTRUMENT##:  <cfif Mortgage_count.data5 neq '' and Mortgage_count.data5 neq 'NULL'> #Mortgage_count.data5#</cfif> <cfif Mortgage_count.data6 neq '' and Mortgage_count.data6 neq 'NULL'> #Mortgage_count.data6#</cfif><cfif Mortgage_count.data7 neq '' and Mortgage_count.data7 neq 'NULL'>-#Mortgage_count.data7#</cfif><br><br></td>
</tr>
</cfloop>
</cfif>

<cfif Mortgage_Count.recordcount GTE 3>
<cfloop query="Mortgage_Count" startrow="3" endrow="3">

<tr>
<td align=left>THIRD TRUST: DB/INSTRUMENT##:  <cfif Mortgage_count.data5 neq '' and Mortgage_count.data5 neq 'NULL'> #Mortgage_count.data5#</cfif> <cfif Mortgage_count.data6 neq '' and Mortgage_count.data6 neq 'NULL'> #Mortgage_count.data6#</cfif><cfif Mortgage_count.data7 neq '' and Mortgage_count.data7 neq 'NULL'>-#Mortgage_count.data7#</cfif><br><br></td>
</tr>
</cfloop>
</cfif>


<cfif Mortgage_Count.recordcount GTE 4>
<cfloop query="Mortgage_Count" startrow="4" endrow="4">
<tr>
<td align=left>FOURTH TRUST: DB/INSTRUMENT##:  <cfif Mortgage_count.data5 neq '' and Mortgage_count.data5 neq 'NULL'> #Mortgage_count.data5#</cfif> <cfif Mortgage_count.data6 neq '' and Mortgage_count.data6 neq 'NULL'> #Mortgage_count.data6#</cfif><cfif Mortgage_count.data7 neq '' and Mortgage_count.data7 neq 'NULL'>-#Mortgage_count.data7#</cfif><br><br></td>
</tr>
</cfloop>
</cfif>

<cfif Mortgage_Count.recordcount GTE 5>
<cfloop query="Mortgage_Count" startrow="5" endrow="5">
<tr>
<td align=left>FIFTH TRUST: DB/INSTRUMENT##:  <cfif Mortgage_count.data5 neq '' and Mortgage_count.data5 neq 'NULL'> #Mortgage_count.data5#</cfif> <cfif Mortgage_count.data6 neq '' and Mortgage_count.data6 neq 'NULL'> #Mortgage_count.data6#</cfif><cfif Mortgage_count.data7 neq '' and Mortgage_count.data7 neq 'NULL'>-#Mortgage_count.data7#</cfif><br><br></td>
</tr>
</cfloop>
</cfif> --->


<cfset civil_count = 0>
<cfloop query="judgment_count">
<cfif judgment_count.data1 neq '' and judgment_count.data1 neq 'NULL' and judgment_count.data1 neq 'N/A'>
<cfset civil_count = civil_count + 1>
</cfif>
</cfloop>


<tr>
<td valign="top" align=left><br><strong><span class="larger">JUDGMENTS</strong>: <cfoutput>#judgment_count.recordcount#</cfoutput></span></td>
</tr>

<cfoutput query="judgment_count">

<tr>
<td valign="top" align=left><br>#judgment_count.data8#</td>
</tr>

</cfoutput>

<cfoutput>
<tr>
<td valign="top" align=left><br><strong><span class="larger">Property Address</strong>: </span>#Read_Title.paddress#, #Read_Title.pcity#, #Read_Title.pcounty#, #Read_Title.pstate# #Read_Title.pzip#</td>
</tr>


<tr>
<td valign="top" align=left><strong>TAX ID NO</strong>:  #read_tax_info.data19#<BR>
<strong>TAX YEAR</strong>:  #read_tax_info.data29#<br>
<strong>AMOUNT OF</strong>:   #read_tax_info.data28#   #read_tax_info.data37#<br>
<strong>LAND</strong>:  #read_tax_info.Tax_Land_Value#<br>
<strong>IMPRV</strong>:  #read_deed_info.data25#<br>
<strong>TOTAL</strong>:  #read_deed_info.data27#<br>
<strong>TAX INFO STATUS</strong>: #read_tax_info.data31#<br>
<strong>STORM FEES</strong>:<br>
<strong>OTHER FEES</strong>:  #read_deed_info.data26#<br>
<strong>TAX STATUS PROVIDED FOR INFORMATIONAL PURPOSES ONLY</strong><br>
<strong>CONTACT TREASURER PRIOR TO SALE</strong><br>
<strong>COMMENTS</strong>:   #read_tax_info.data34#<br>
</td>
</tr>
</cfoutput>

<cfif Len(read_title.comments_to_appear)>
<tr>
<td align=left><cfoutput><strong><span class="larger">COMMENTS: <font color="red">#read_title.comments_to_appear#</font></span></strong></cfoutput></td>
</tr>
</cfif>
</table>
</cfdocumentsection>




















































































<cfdocumentsection>
<cfdocumentitem type="header">
</cfdocumentitem >

<cfdocumentitem type="footer">
</cfdocumentitem >

<STYLE TYPE="text/css">

TD {font-size:10px; font-family:Arial, Helvetica, sans-serif}
.larger {font-size:12px; font-family:Arial, Helvetica, sans-serif}
.largerstill {font-size:14px; font-family:Arial, Helvetica, sans-serif}
</STYLE>

<cfoutput>
<table width=800 align=left>
<tr>
<td valign="top" align=Center class="larger" colspan=2><i>STREAMLINE TITLE & ESCROW, INC.<br>
7361 CALHOUN PLACE, SUITE 200<br>
ROCKVILLE MD 20855<br>
301-279-0303</i><br><br><br><br></td>
</tr>

<tr>
<td valign="top" align=left><br><br><strong>FILE NO</strong>: #read_title.prop_id#<br><br><br>
<strong>#file_prefix# FILE NO</strong>: #read_title.loan_number#<br><br><br></td>
<td valign="top" align=right><br><br><nobr><strong>ORIG BY</strong>: #read_vendor_assign.company#</nobr><br><br><br></td>
</tr>

<tr>
<td valign="top" align=center colspan=2 ><br>
<br>
<span class="larger"><br><br><strong>APPENDIX A</strong></span><br>
<br><br></td>
</tr>

<tr>
<td valign="top" align=left><strong><span class="larger"><br><br>PROPERTY DESCRIPTION</span></strong>:<br><br><br>
#read_title_update.notes#<br><br><cfif read_title_update.comments neq '' and read_title_update.comments neq 'NULL'>#read_title_update.comments#</cfif>
</td>
</tr>

</table>
</cfoutput>

</cfdocumentsection>



</cfdocument>


<cfinvoke	component = "cfc.FileManagement"	method = "PDFcompress" file2="P-#read_title.prop_id#_REPORT.pdf" filepath="c:\uploads\">
<cfset new_prop_file_name = #fileSys.MoveFromUploadsOverwrite('P-#read_title.prop_id#_REPORT.pdf')#>



<!---

OLD FILE:

<cfparam name="prop_id" default="0">

<cfset request.dsn = "First_Title_Main_Admin">

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_property">
	select * from property
	where prop_id = #prop_id#
</CFQUERY>

<cfset rec_id = #prop_id#>
<cfset url.rec_id = #prop_id#>

<cfdocument fileName="c:\uploads\P-#read_property.prop_id#_REPORT.pdf" format="PDF"
pagetype = "letter" 
pageHeight = "9"
pageWidth = "8.5" 
margintop = ".5" 
marginbottom = ".5" 
marginright = ".5" 
marginleft = ".5" 
orientation = "portrait" unit = "in" overwrite="yes">

<cfset create_pdf = 1>
<cfinclude template="../admin_area/property_report_sb_PDF.cfm">

</cfdocument>


<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfset new_prop_file_name = #fileSys.MoveFromUploadsOverwrite('P-#read_property.prop_id#_REPORT.pdf')#>
--->
