<CFPARAM NAME="a_trigger" DEFAULT="0">
<cfparam name="create_pdf" default=0>
<CFQUERY datasource="#request.dsn#" NAME="read_Title">
	SELECT *
	FROM Property
	WHERE prop_ID = #rec_ID#
</CFQUERY>


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
  <cfelse>
  <cfset prop_report_price = prop_report_price + read_company.Vet_Aff_reg>
  </cfif>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_title_update">
    select *
    from prop_ins_view
	WHERE prop_id = #url.rec_ID# and selectedOrgs is not null
</cfquery>
<HTML XMLNS:IE>
<HEAD>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<?IMPORT NAMESPACE="IE" IMPLEMENTATION="#default">
<STYLE TYPE="text/css">
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
TD {font-size:10px; font-family:Arial, Helvetica, sans-serif}
.larger {font-size:12px; font-family:Arial, Helvetica, sans-serif}
.largerstill {font-size:14px; font-family:Arial, Helvetica, sans-serif}
</STYLE>
<link rel="stylesheet" href="links.css" type="text/css">
<style media="print">
.noprint     { display: none }
</style>

</head>
<BODY>
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



<div id=idControls align="center" class="noprint">
 <b>Please use the print button below to print this page (automatic setting included)</b>

 <p><a href="#" onclick=printWindow();><input disabled type="button" value="Print the page"
 onclick="factory.printing.Print(true)"></a>

  <hr size="1" color="dimgray">

</div>
<IE:DEVICERECT ID="page1" CLASS="masterstyle" MEDIA="print">
<cfoutput>
<table with=800 align=center>


<tr>
<td align=Center class="larger" colspan=2><i>FIRST TITLE & ESCROW, INC.<br>
7361 CALHOUN PLACE, SUITE 200<br>
ROCKVILLE MD 20855<br>
301-279-0303</i><br><br><br></td>
</tr>


<cfif check_if_update.product_ordered eq 'bring_to_date'>
<tr>
<td align=Center class="largerstill"><strong>PROPERTY REPORT - UPDATE</strong><br><br></td>
</tr>
<cfelse>
<tr>
<td align=Center class="largerstill"><strong>PROPERTY REPORT</strong><br><br></td>
</tr>
</cfif>
</table>

<table with=800 align=left>
<tr>
<td align=left><strong>FILE NO</strong>: #read_title.prop_id#<br><br>

<strong>LOAN NO</strong>: #read_title.loan_number#</td>
<!--- <td align=right><nobr><strong>ORIG BY</strong>: #read_vendor_assign.company#</nobr><br><br>
</td>
 ---></tr>

<tr>
<td align=left><strong><span class="larger"><!--- TYPE OF SEARCH REQUESTED</span></strong>: <cfif read_title.search_Type eq 'A'>Current Owner<cfelseif read_title.search_Type eq 'B'>Full Search<cfelse>#read_title.search_Type#</cfif> ---><br><br>

SEARCH DATE: #DateFormat(read_deed_info.search_date, "mm/dd/yyyy")#<br><br></td>
</tr>
<tr>
<td align=left><strong><span class="larger"><em>EFFECTIVE DATE</em></span></strong>: #DateFormat(read_Title_update.data37, "mm/dd/yyyy")#<br><br></td>
</tr>

<tr>
<td align=left><strong>PRESENT OWNER</strong>: <br>
<br>
#read_deed_info.data3#<cfif read_deed_info.data4 neq '' and read_deed_info.data4 neq 'NULL'> and #read_deed_info.data4#</cfif><br><br></td>
</tr>

<tr>
<td align=left><strong>AND BEING: DB/INST##</strong>: <cfif read_title_update.data7 neq '' and read_title_update.data7 neq 'NULL'> #read_title_update.data7#</cfif> <cfif read_title_update.data8 neq '' and read_title_update.data8 neq 'NULL'> Book: #read_title_update.data8#</cfif> <cfif read_title_update.data9 neq '' and read_title_update.data9 neq 'NULL'> Page: #read_title_update.data9#</cfif>
			<br><br></td>
</tr>



<tr>
<td align=left><strong>PROPERTY DESCRIPTION</strong>: See APPENDIX "A"<BR><BR></td>
</tr>


<tr>
<td align=left><strong><span class="larger">DEEDS OF TRUSTS/MORTGAGES</strong>: #Mortgage_count.recordcount#</span><br><br></td>
</tr>
</cfoutput>

<!--- <cfoutput query="subject_trust">
<tr>
<td align=left><strong>SUBJECT TRUST</strong>: DB/INSTRUMENT##: <cfif subject_trust.data5 neq '' and subject_trust.data5 neq 'NULL'> #subject_trust.data5#</cfif> <cfif subject_trust.data6 neq '' and subject_trust.data6 neq 'NULL'> #subject_trust.data6#</cfif><cfif subject_trust.data7 neq '' and subject_trust.data7 neq 'NULL'>-#subject_trust.data7#</cfif>  DATED #Dateformat(subject_trust.data8, "m/d/yyyy")# FROM #subject_trust.data2#<cfif subject_trust.data3 neq '' and subject_trust.data3 neq 'NULL'> and #subject_trust.data3#</cfif> TO #subject_trust.data1# SECURING #subject_trust.data4#. RECORDED #Dateformat(subject_trust.data9, "m/d/yyyy")#. #subject_trust.data11#  #subject_trust.addreq# #subject_trust.addex# #subject_trust.comments# <BR>
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
<br>
</td>
</tr>
</cfoutput> --->

<cfset trust_number = 0>
<cfoutput query="all_trusts">
<cfset trust_number = trust_number + 1>
<tr>
<td align=left><strong>D/T/Mortgage ###trust_number#: <cfif all_trusts.subject_trust eq 1>Subject Trust, </cfif>Bk / Pg /Instrument##</strong>: <cfif all_trusts.data5 neq '' and all_trusts.data5 neq 'NULL'> #all_trusts.data5#</cfif> <cfif all_trusts.data6 neq '' and all_trusts.data6 neq 'NULL'> #all_trusts.data6#</cfif><cfif all_trusts.data7 neq '' and all_trusts.data7 neq 'NULL'>-#all_trusts.data7#</cfif>  DATED #Dateformat(all_trusts.data8, "m/d/yyyy")# FROM #all_trusts.data2#<cfif all_trusts.data3 neq '' and all_trusts.data3 neq 'NULL'> and #all_trusts.data3#</cfif> TO #all_trusts.data1# SECURING #all_trusts.data4#. RECORDED #Dateformat(all_trusts.data9, "m/d/yyyy")#. #all_trusts.data11#  #all_trusts.addreq# #all_trusts.addex# #all_trusts.comments# <BR>
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
<br>
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
<td align=left><strong><span class="larger">JUDGMENTS</strong>: <cfoutput>#judgment_count.recordcount#</cfoutput></span><br><br></td>
</tr>

<cfoutput query="judgment_count">

<tr>
<td align=left width=500 valign=top>
<strong>Customer Name:</strong> #read_deed_info.data3#<cfif read_deed_info.data4 neq '' and read_deed_info.data4 neq 'NULL'> and #read_deed_info.data4#</cfif><br>
<strong>Recorded Date:</strong> #judgment_count.data9#<BR>
<strong>Dated Date:</strong> #judgment_count.data4#<BR>
<strong>Book/Page:</strong> #judgment_count.data2# / #judgment_count.data3#<BR>
<strong>Defendant:</strong> #judgment_count.data7#<BR>
<strong>Plaintiff:</strong> #judgment_count.data6#<BR>
<strong>Additional Info:</strong> #judgment_count.data8#<br>
<br>

</td>
<td align=left valign=top><strong>Case Number:</strong> #judgment_count.data1#<br>
<strong>Amount:</strong> #judgment_count.data5#<br>
</td>
</tr>

</cfoutput>

<cfoutput>
<tr>
<td align=left><strong><span class="larger">Property Address</strong>: </span>#Read_Title.paddress#, #Read_Title.pcity#, #Read_Title.pcounty#, #Read_Title.pstate# #Read_Title.pzip#<br><br></td>
</tr>

<tr>
<td align=left><strong>TAX INFORMATION</strong>:</td></tr>
<tr>
<td align=left><strong>TAX ID NO</strong>:  #read_tax_info.data19#<BR>
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

</IE:DEVICERECT>


<IE:DEVICERECT ID="page2" CLASS="masterstyle" MEDIA="print">

<cfoutput>
<cfif create_pdf eq 1><P></P>
<cfdocumentitem type="pagebreak" />
</cfif>

<table width=800 align=left>
<tr>
<td align=Center class="larger" colspan=2><i>FIRST TITLE & ESCROW, INC.<br>
7361 CALHOUN PLACE, SUITE 200<br>
ROCKVILLE MD 20855<br>
301-279-0303</i><br><br><br></td>
</tr>

<tr>
<td align=left><strong>FILE NO</strong>: #read_title.prop_id#<br>
<strong>LOAN NO</strong>: #read_title.loan_number#</td>
<!--- <td align=right><nobr><strong>ORIG BY</strong>: #read_vendor_assign.company#</nobr><br></td> --->
</tr>

<tr>
<td align=center colspan=2 class="larger" ><br>
<br>
<strong>APPENDIX A</strong>
<br><br></td>
</tr>

<tr>
<td align=left><strong><span class="larger">PROPERTY DESCRIPTION</span></strong>:<br>
<br>
#read_title_update.notes#<br><br><cfif read_title_update.comments neq '' and read_title_update.comments neq 'NULL'>#read_title_update.comments#</cfif></td>
</tr>


</cfoutput>


</IE:DEVICERECT>


</BODY>
</html>


























<!---
<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFQUERY datasource="#request.dsn#" NAME="read_Title">
	SELECT *
	FROM Property
	WHERE prop_ID = #rec_ID#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="Mortgage_Count">
	SELECT     prop_id AS Expr1, selectedOrgs4
	FROM         dbo.prop_ins_view
	WHERE     (prop_id = #rec_ID#) AND (selectedOrgs4 IS NOT NULL) OR
                      (prop_id = #rec_ID#) AND (selectedOrgs4 IS NOT NULL) OR
                      (prop_id = #rec_ID#) AND (selectedOrgs4 IS NOT NULL) OR
                      (prop_id = #rec_ID#) AND (selectedOrgs4 IS NOT NULL) OR
                      (prop_id = #rec_ID#) AND (selectedOrgs4 IS NOT NULL)
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="Judgment_Count">
	SELECT     prop_id AS Expr1, selectedOrgs3
	FROM         dbo.prop_ins_view
	WHERE     (prop_id = #rec_ID#) AND (selectedOrgs3 IS NOT NULL) OR
                      (prop_id = #rec_ID#) AND (selectedOrgs3 IS NOT NULL) OR
                      (prop_id = #rec_ID#) AND (selectedOrgs3 IS NOT NULL) OR
                      (prop_id = #rec_ID#) AND (selectedOrgs3 IS NOT NULL) OR
                      (prop_id = #rec_ID#) AND (selectedOrgs3 IS NOT NULL)
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
	ORDER BY insert_date, insert_time DESC
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_data_info">
	SELECT     *
	FROM        doc_title_insurance_prop
	WHERE     (prop_id = #rec_id#)
</CFQUERY>

<cfset prop_report_price = 295>

<!--- <cfif read_title.search_type eq 'A'>
<cfset prop_report_price = prop_report_price + read_company.FeeCurrentOwner>
<cfelseif read_title.search_type eq 'B'>
<cfset prop_report_price = prop_report_price + read_company.FeeFullSearch>
<cfelseif read_title.search_type eq 'D'>
<cfset prop_report_price = prop_report_price + read_company.FeeVestingLegal>
</cfif>
 --->

<cfif read_title.search_type eq 'A'>
<cfset prop_report_price = read_company.FeeCurrentOwner>
<cfelseif read_title.search_type eq 'B'>
<cfset prop_report_price = read_company.FeeFullSearch>
<cfelseif read_title.search_type eq 'D'>
<cfset prop_report_price = read_company.FeeVestingLegal>
</cfif>



<HTML XMLNS:IE>
<HEAD>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<?IMPORT NAMESPACE="IE" IMPLEMENTATION="#default">
<STYLE TYPE="text/css">
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



<div id=idControls align="center" class="noprint">
 <b>Please use the print button below to print this page (automatic setting included)</b>

 <p><a href="#" onclick=printWindow();><input disabled type="button" value="Print the page"
 onclick="factory.printing.Print(true)"></a>

  <hr size="1" color="dimgray">

</div>
<IE:DEVICERECT ID="page1" CLASS="masterstyle" MEDIA="print">

<table  width="90%" cellpadding="3" cellspacing="0" border="0">
    <p>
<CFOUTPUT>
    <tr>
		<td>
			<BR>
		</td>
	</tr>
	<tr>
    	<td align="middle" valign="bottom" colspan="2">
      		<table width="100%"><tr>
			<td align="left" valign="top" width="75%">
      		<P align=left><strong><FONT size=5>
			REAL ESTATE PROPERTY REPORT</FONT>
        	</strong></P>
	 	</td>
  	<td align="left" valign="top" width="25%">
      		<P align=left><FONT size=3>

			Fee: <cfif read_title.comp_id eq 452 >$295.00<cfelse>$<cfoutput>#NumberFormat(prop_report_price, "____")#</cfoutput>.00</cfif><br>
<cfif read_title.loan_number NEQ '' and read_title.loan_number NEQ 'NULL'>Loan Number: #read_title.loan_number#<cfelse>File Number: #read_title.prop_id#</cfif><br>
Due Upon Receipt</FONT>
        	</P>
	 	</td>
		</tr></table>
	 	</td></tr>
  	<tr>
		<td valign="top" colspan="2">
			<!---First Title &amp; Escrow, Inc.
            Changed 12/8/04 Harry per Pam
            ---><cfif read_title.comp_id eq 452>First Title & Escrow<cfelse>Abstracts USA</cfif>
		</td>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
	<TR>
		<td valign="top" colspan="2">30 West Gude Dr, Rockville,
      		MD 20850
	 	</td>
	</TR>
<cfelse>
	<TR>
		<td valign="top" colspan="2">7361 Calhoun Place, Suite 200, Rockville, MD 20855
	 	</td>
	</TR>
</cfif>

	<TR>
		<td valign="top" colspan="2">
			Phone: (866) 484-8537
		</td>
	</TR>
  	<tr>
		<td>
			<br>
		</td>
	</tr>
	<tr>
  		<td colspan="2" height="10"><font size="2" face="Arial, Helvetica, sans-serif">
			<B>ATTENTION:</B> #Read_Title.pname#</font>
		</td>
  	</tr>
	<tr>
  		<td colspan="2" height="10"><font size="2" face="Arial, Helvetica, sans-serif">
			#Read_company.company#</font>
		</td>
  	</tr>
	<tr>
  		<td colspan="2" height="10"><B>Email:</B>  <font size="2" face="Arial, Helvetica, sans-serif">
			#Read_Title.p_email#</font>
		</td>
  	</tr>
	<tr>
		<td colspan="2" height="10"><B>Phone:  </B><font size="2" face="Arial, Helvetica, sans-serif">
			#Read_Title.pphone#
		</td>
  	<tr>
	<tr>
  		<td colspan="2" height="10"><B>Fax:  </B><font size="2" face="Arial, Helvetica, sans-serif">
			#Read_Title.pfax#</font>
		</td>
  	</tr>
	<TR>
  		<td valign="top" colspan="2">
			<B>Re:</B>
		</td>
	</tr>
	<tr>
		<td valign="top">
			#Read_Title.blastname1#, #Read_Title.bfirstname1#
		</td>
<CFQUERY datasource="#request.dsn#" NAME="read_title_update">
    select *
    from prop_ins_view
	WHERE prop_id = #url.rec_ID# and selectedOrgs is not null
</cfquery>
		<td>
      		<P><STRONG>Date of Search</STRONG>:<b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif"> #DateFormat(read_Title_update.search_date, "mm/dd/yyyy")#&nbsp;</font></b></P>
      	</td>
	</tr>
	<tr>
		<td valign="top">
			<CFIF #Len(Read_Title.blastname2)# gte 1>
			#Read_Title.blastname2#, #Read_Title.bfirstname2#
			</CFIF>
		</td>
		<td>
			<STRONG>Search As Of</STRONG>:
			<CFIF #read_title_update.recordcount# GT 0 and #read_title_update.data1# neq "">
					<b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">
                    #DateFormat(read_title_update.data37, "mm")#/#DateFormat(read_title_update.data37, "dd")#/#DateFormat(read_title_update.data37, "yyyy")#
                    </font>
                    </b>
			<cfelse>
			</cfif>
		</td>
	</tr>
	<tr>
		<td valign="top">
			 #Read_Title.paddress#
		</td>
		<td>
      		<P align=left><STRONG>Order No.</STRONG>  <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">P-#read_Title.prop_ID#</font></b></P>
		</td>
	</tr>
	<tr>
		<td valign="top" colspan="2">
			#Read_Title.pcity#, #Read_Title.pstate# #Read_Title.pzip#
		</td>
	</tr>
  	<tr>
    	<td width = "50%" valign = "top" ><STRONG>County
      		</STRONG>#Read_Title.pcounty#
		</td>
	</tr>
  	<TR>
  		<td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;
		</font>
		</td>
	</TR>
  	<tr>
		<td valign = "top" colspan="2"><STRONG>Vesting Info:
      		</STRONG>#read_title_update.data3#
			<CFIF #Len(read_title_update.data4)# gte 1>
				&amp;
			</CFIF>
			#read_title_update.data4#
		</td>
	</tr>
	<tr>
		<td>
			<br>
		</td>
	</tr>
    <tr>
    	<td colspan="2" align="middle" valign="top">
			<u><strong>Deed Record</strong></u>
		</td>
  	</tr>
  	<tr>
    	<td>
			<BR>
		</td>
  	</tr>
  	<tr>
    <tr>
        <td valign="top" colspan="2">
            Type of Deed:  <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_title_update.data5#</font></b>
        </td>
    </tr>
    	<td  valign="top">
			Grantor: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_title_update.data1# #read_title_update.data2#</font></b>
		</td>
		<td  valign="top">
			Grantee: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_title_update.data3#
			<CFIF #Len(read_title_update.data4)# gte 1>
				&amp;
			</CFIF>
			#read_title_update.data4#
			<CFIF #Len(read_title_update.data6)# gte 1>
			,<BR>
			</CFIF>
			<CFIF #Len(read_title_update.data6)# gte 1>
			#read_title_update.data6#
			<!---Tenancy Not Stated--->
			</CFIF>
			</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#DateFormat(read_title_update.data10, "mm/dd/yyyy")#</font></b>
		</td>
    	<td>
			Recorded: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#DateFormat(read_title_update.data11, "mm/dd/yyyy")#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td valign="top">
			Liber &amp; Page:
			<!---Harry 06/30/2004--->
			<!---Either show Instrument Number or Book/Page --->
			<CFIF #Len(read_title_update.data7)# gte 1>
				Instrument No:<b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_title_update.data7#</font></b>
      		<CFELSE>
				Liber &amp; Page:<b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_title_update.data8#/#read_title_update.data9#</font></b>
			</CFIF>
		</td>
    	<td>
			Consideration: <B><FONT
      		face="Arial, Helvetica, sans-serif" color=blue
      		size=2>#read_title_update.data16#</FONT></B>
		</td>
 	</tr>
  	<tr>
    	<td>
			<BR>
		</td>
  	</tr>
  	<!---Mortgage Deed of Trust --->
  	</CFOUTPUT>
	<CFIF #Mortgage_Count.RecordCount# eq 0>
      	<tr>
          	<td colspan="2" align="middle" valign="top"><u><strong>
      			MORTGAGE/DEED OF TRUST</strong></u>
      		</td>
        	</tr>
      	<tr>
      		<td>
      			<br>
      		</td>
      	</tr>
      	<tr>
      		<td>
      			None
      		</td>
      	</tr>
    </CFIF>

<CFQUERY NAME="read_mortgage" datasource="#request.dsn#">
    select *
	from prop_ins_view
    WHERE prop_id = #url.rec_ID# and selectedOrgs4 = 1
</CFQUERY>

<cfoutput query = "read_mortgage">
	<tr>
    	<td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  	</tr>
  	<tr>
    	<td colspan="2" align="middle" valign="top"><strong>MORTGAGE/DEED OF TRUST
      		CONTAINED IN THIS REPORT</strong></td>
  	</tr>
  	<tr>
    	<td>
			<BR>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top"><b><u>MORTGAGE/DEED OF TRUST</u></b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
            Holder: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage.data1#</font></b>
        </td>
  	</tr>
    <tr>
    	<td colspan="2" valign="top">
            Mortgagor: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage.data2#<CFIF #LEN(read_mortgage.data3)# gt "1"> and #read_mortgage.data3#</CFIF></font></b>
        </td>
  	</tr>
  	<tr>
    	<CFIF #Len(read_mortgage.data6)# gte 1>
    	    <td>Deed Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage.data6#/#read_mortgage.data7#</font></b></td>
		<CFELSE>
		    <td>Document No: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage.data5#</font></b></td>
		</CFIF>
        <td>
			Recorded:
			<b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#DateFormat(read_mortgage.data8, "mm/dd/yyyy")#</font></b>
		</td>
    	<td>
			Open End:&nbsp; <STRONG><FONT size=2><FONT face=Arial>#read_mortgage.data33#</FONT></FONT></STRONG>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">Amount:
			<FONT face="Arial, Helvetica, sans-serif" color=blue size=2><STRONG>#read_mortgage.data4#</STRONG></FONT>
		</td>
    	<td valign="top">
			Assigned to: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">
			#read_mortgage.data13#
            <CFIF LEN(#read_mortgage.data13#) gte 1>
      		    <CFIF #len(read_mortgage.data20)# gte 1>
				    ,#read_mortgage.data20#/#read_mortgage.data21#
			    </CFIF>
			    <CFIF #len(read_mortgage.data17)# gte 1>
			        on #read_mortgage.data17#&nbsp;
			    </CFIF>
			    <CFIF #Len(read_mortgage.data16)# gte 1>
      		        Deed Book and Page #read_mortgage.data15#/#read_mortgage.data16#
                <CFELSE>
                    Document No #read_mortgage.data14#
                </CFIF>
		    </CFIF>	<bR>
			#read_mortgage.data18#
            <CFIF LEN(#read_mortgage.data18#) gte 1>
      		    <CFIF #len(read_mortgage.data25)# gte 1>
				    ,#read_mortgage.data25#/#read_mortgage.data26#
			    </CFIF>
			    <CFIF #len(read_mortgage.data22)# gte 1>
			        on #read_mortgage.data22#&nbsp;
			    </CFIF>
			    <CFIF #Len(read_mortgage.data21)# gte 1>
      		        Deed Book and Page #read_mortgage.data20#/#read_mortgage.data21#
                <CFELSE>
                    Document No #read_mortgage.data19#
                </CFIF>
		    </CFIF><br>
            #read_mortgage.data23#
			<CFIF LEN(#read_mortgage.data23#) gte 1>
      		    <CFIF #len(read_mortgage.data30)# gte 1>
				    ,#read_mortgage.data30#/#read_mortgage.data31#
			    </CFIF>
			    <CFIF #len(read_mortgage.data27)# gte 1>
			        on #read_mortgage.data27#&nbsp;
			    </CFIF>
			    <CFIF #Len(read_mortgage.data26)# gte 1>
      		        Deed Book and Page #read_mortgage.data25#/#read_mortgage.data26#
                <CFELSE>
                    Document No #read_mortgage.data24#
                </CFIF>
		    </CFIF>

			</font></b>
			</td>
  	</tr>
	<tr>
    	<td>&nbsp;

        </td>

  	</tr>
  	<tr>
    	<td>
			<BR>
		</td>
  	</tr>
      	</CFOUTPUT>
</table>
</IE:DEVICERECT>
<IE:DEVICERECT ID="page2" CLASS="masterstyle" MEDIA="print">
<table  width="90%" cellpadding="3" cellspacing="0" border="0">
<CFQUERY NAME="read_mortgage2" datasource="#request.dsn#">
    select * from
    prop_ins_view
    WHERE prop_id = #url.rec_ID# and selectedOrgs4 = 2
</CFQUERY>
	<cfoutput query = "read_mortgage2">
	<tr>
    	<td colspan="2" valign="top"><b><u>MORTGAGE/DEED OF TRUST</u></b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">Holder: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage2.data1#</font></b></td>
  	</tr>
    <tr>
    	<td colspan="2" valign="top">
            Mortgagor: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage2.data2#<CFIF #LEN(read_mortgage2.data3)# gt "1"> and #read_mortgage2.data3#</CFIF></font></b>
        </td>
  	</tr>
  	<tr>
    	<CFIF #Len(read_mortgage2.data6)# gte 1>
    	<td>Deed Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage2.data6#/#read_mortgage2.data7#</font></b></td>
		<CFELSE>
		<td>Document No: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage2.data5#</font></b></td>
		</CFIF>
        <td>
			Recorded:
			<b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage2.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#DateFormat(read_mortgage2.data8, "mm/dd/yyyy")#</font></b>
		</td>
    	<td>
			Open End:&nbsp; <STRONG><FONT size=2><FONT face=Arial>#read_mortgage2.data33#</FONT></FONT></STRONG>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">Amount:
			<FONT face="Arial, Helvetica, sans-serif" color=blue size=2><STRONG>#read_mortgage2.data4#</STRONG></FONT>
		</td>
    	<td valign="top">
			Assigned to: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">
			#read_mortgage2.data13#
      		<CFIF LEN(#read_mortgage2.data13#) gte 1>
                  <CFIF #len(read_mortgage2.data20)# gte 1>
      				,#read_mortgage2.data20#/#read_mortgage.data21#
      			  </CFIF>
      			  <CFIF #len(read_mortgage2.data17)# gte 1>
      			    on #read_mortgage2.data17#&nbsp;
      			  </CFIF>
      			  <CFIF #Len(read_mortgage2.data16)# gte 1>
            		    Deed Book and Page #read_mortgage2.data15#/#read_mortgage2.data16#
                  <CFELSE>
                      Document No #read_mortgage2.data14#
                  </CFIF>
            </CFIF><bR>
			#read_mortgage2.data18#
            <CFIF LEN(#read_mortgage2.data18#) gte 1>
      		    <CFIF #len(read_mortgage2.data25)# gte 1>
				    ,#read_mortgage2.data25#/#read_mortgage2.data26#
			    </CFIF>
			    <CFIF #len(read_mortgage2.data22)# gte 1>
			        on #read_mortgage2.data22#&nbsp;
			    </CFIF>
			    <CFIF #Len(read_mortgage2.data21)# gte 1>
      		        Deed Book and Page #read_mortgage2.data20#/#read_mortgage2.data21#
                <CFELSE>
                    Document No #read_mortgage2.data19#
                </CFIF>
		    </CFIF>
			</font></b>
			</td>
  	</tr>
	<tr>
        <td>&nbsp;

        </td>

  	</tr>
  	<tr>
    	<td>
			<BR>
		</td>
  	</tr>

</CFOUTPUT>
<CFQUERY NAME="read_mortgage3" datasource="#request.dsn#">
			select * from prop_ins_view WHERE prop_id
  			= #url.rec_ID# and selectedOrgs4 = 3
</CFQUERY>

<cfoutput query = "read_mortgage3">
	<tr>
    	<td colspan="2" valign="top"><b><u>MORTGAGE/DEED OF TRUST</u></b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">Holder: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage3.data1#</font></b></td>
  	</tr>
    <tr>
    	<td colspan="2" valign="top">
            Mortgagor: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage3.data2#<CFIF #LEN(read_mortgage3.data3)# gt "1"> and #read_mortgage3.data3#</CFIF></font></b>
        </td>
  	</tr>
  	<tr>
    	<CFIF #Len(read_mortgage3.data6)# gte 1>
    	<td>Deed Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage3.data6#/#read_mortgage3.data7#</font></b></td>
		<CFELSE>
		<td>Document No: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage3.data5#</font></b></td>
		</CFIF>
        <td>
			Recorded:
			<b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage3.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#DateFormat(read_mortgage3.data8, "mm/dd/yyyy")#</font></b>
		</td>
    	<td>
			Open End:&nbsp; <STRONG><FONT size=2><FONT face=Arial>#read_mortgage3.data33#</FONT></FONT></STRONG>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">Amount:
			<FONT face="Arial, Helvetica, sans-serif" color=blue size=2><STRONG>#read_mortgage3.data4#</STRONG></FONT>
		</td>
    	<td  valign="top">
			Assigned to: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">
			#read_mortgage3.data13#
            <CFIF LEN(#read_mortgage3.data13#) gte 1>
              		<CFIF #len(read_mortgage3.data20)# gte 1>
        				,#read_mortgage3.data20#/#read_mortgage3.data21#
        			</CFIF>
        			<CFIF #len(read_mortgage3.data17)# gte 1>
        			    on #read_mortgage3.data17#&nbsp;
        			</CFIF>
        			<CFIF #Len(read_mortgage3.data16)# gte 1>
              		    Deed Book and Page #read_mortgage3.data15#/#read_mortgage3.data16#
                    <CFELSE>
                        Document No #read_mortgage3.data14#
                    </CFIF>
            </CFIF><bR>
			#read_mortgage3.data18#
            <CFIF LEN(#read_mortgage3.data18#) gte 1>
      		    <CFIF #len(read_mortgage3.data25)# gte 1>
				    ,#read_mortgage.data25#/#read_mortgage3.data26#
			    </CFIF>
			    <CFIF #len(read_mortgage3.data22)# gte 1>
			        on #read_mortgage3.data22#&nbsp;
			    </CFIF>
			    <CFIF #Len(read_mortgage3.data21)# gte 1>
      		        Deed Book and Page #read_mortgage3.data20#/#read_mortgage3.data21#
                <CFELSE>
                    Document No #read_mortgage3.data19#
                </CFIF>
		    </CFIF>
			</font></b>
			</td>
  	</tr>
	<tr>
        <td>&nbsp;

        </td>

  	</tr>
  	<tr>
    	<td>
			<BR>
		</td>
  	</tr>
</CFOUTPUT>

<CFQUERY NAME="read_mortgage4" datasource="#request.dsn#">
			select * from prop_ins_view WHERE prop_id
  			= #url.rec_ID# and selectedOrgs4 = 4 </CFQUERY>
<cfoutput query = "read_mortgage4">
	<tr>
    	<td colspan="2" valign="top"><b><u>MORTGAGE/DEED OF TRUST</u></b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">Holder: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage4.data1#</font></b></td>
  	</tr>
    <tr>
    	<td colspan="2" valign="top">
            Mortgagor: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage4.data2#<CFIF #LEN(read_mortgage4.data3)# gt "1"> and #read_mortgage4.data3#</CFIF></font></b>
        </td>
  	</tr>
  	<tr>
    	<CFIF #Len(read_mortgage4.data6)# gte 1>
    	<td>Deed Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage4.data6#/#read_mortgage4.data7#</font></b></td>
		<CFELSE>
		<td>Document No: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage4.data5#</font></b></td>
		</CFIF>
        <td>
			Recorded:
			<b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage4.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#DateFormat(read_mortgage4.data8, "mm/dd/yyyy")#</font></b>
		</td>
    	<td>
			Open End:&nbsp; <STRONG><FONT size=2><FONT face=Arial>#read_mortgage4.data33#</FONT></FONT></STRONG>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">Amount:
			<FONT face="Arial, Helvetica, sans-serif" color=blue size=2><STRONG>#read_mortgage4.data4#</STRONG></FONT>
		</td>
    	<td valign="top">
			Assigned to: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">
			#read_mortgage4.data13#
      		<CFIF LEN(#read_mortgage4.data13#) gte 1>
                  <CFIF #len(read_mortgage4.data20)# gte 1>
      				,#read_mortgage4.data20#/#read_mortgage4.data21#
      			  </CFIF>
      			  <CFIF #len(read_mortgage4.data17)# gte 1>
      			    on #read_mortgage4.data17#&nbsp;
      			  </CFIF>
      			  <CFIF #Len(read_mortgage4.data16)# gte 1>
            		    Deed Book and Page #read_mortgage4.data15#/#read_mortgage4.data16#
                  <CFELSE>
                      Document No #read_mortgage4.data14#
                  </CFIF>
            </CFIF><bR>
			#read_mortgage4.data18#
            <CFIF LEN(#read_mortgage4.data18#) gte 1>
      		    <CFIF #len(read_mortgage4.data25)# gte 1>
				    ,#read_mortgage4.data25#/#read_mortgage4.data26#
			    </CFIF>
			    <CFIF #len(read_mortgage4.data22)# gte 1>
			        on #read_mortgage4.data22#&nbsp;
			    </CFIF>
			    <CFIF #Len(read_mortgage4.data21)# gte 1>
      		        Deed Book and Page #read_mortgage4.data20#/#read_mortgage4.data21#
                <CFELSE>
                    Document No #read_mortgage4.data19#
                </CFIF>
		    </CFIF>
			</font></b>
			</td>
  	</tr>
	<tr>
        <td>&nbsp;

        </td>

  	</tr>
  	<tr>
    	<td>
			<BR>
		</td>
  	</tr>
</CFOUTPUT>
<CFQUERY NAME="read_mortgage5" datasource="#request.dsn#">
			select * from prop_ins_view WHERE prop_id
  			= #url.rec_ID# and selectedOrgs4 = 5
</CFQUERY>

<cfoutput query = "read_mortgage5">
<tr>
    	<td colspan="2" valign="top"><b><u>MORTGAGE/DEED OF TRUST</u></b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">Holder: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage5.data1#</font></b></td>
  	</tr>
    <tr>
    	<td colspan="2" valign="top">
            Mortgagor: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage5.data2#<CFIF #LEN(read_mortgage5.data3)# gt "1"> and #read_mortgage5.data3#</CFIF></font></b>
        </td>
  	</tr>
  	<tr>
    	<CFIF #Len(read_mortgage5.data6)# gte 1>
    	<td>Deed Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage5.data6#/#read_mortgage5.data7#</font></b></td>
		<CFELSE>
		<td>Document No: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage5.data5#</font></b></td>
		</CFIF>
        <td>
			Recorded:
			<b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage5.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#DateFormat(read_mortgage5.data8, "mm/dd/yyyy")#</font></b>
		</td>
    	<td>
			Open End:&nbsp; <STRONG><FONT size=2><FONT face=Arial>#read_mortgage5.data33#</FONT></FONT></STRONG>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">Amount:
			<FONT face="Arial, Helvetica, sans-serif" color=blue size=2><STRONG>#read_mortgage5.data4#</STRONG></FONT>
		</td>
    	<td valign="top">
			Assigned to: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">
			#read_mortgage5.data13#
            <CFIF LEN(#read_mortgage5.data13#) gte 1>
          		<CFIF #len(read_mortgage5.data20)# gte 1>
    				,#read_mortgage5.data20#/#read_mortgage5.data21#
    			</CFIF>
    			<CFIF #len(read_mortgage5.data17)# gte 1>
    			    on #read_mortgage5.data17#&nbsp;
    			</CFIF>
    			<CFIF #Len(read_mortgage5.data16)# gte 1>
          		    Deed Book and Page #read_mortgage5.data15#/#read_mortgage5.data16#
                <CFELSE>
                    Document No #read_mortgage5.data14#
                </CFIF>
            </CFIF><bR>
			#read_mortgage5.data18#
            <CFIF LEN(#read_mortgage5.data18#) gte 1>
      		    <CFIF #len(read_mortgage5.data25)# gte 1>
				    ,#read_mortgage5.data25#/#read_mortgage5.data26#
			    </CFIF>
			    <CFIF #len(read_mortgage5.data22)# gte 1>
			        on #read_mortgage5.data22#&nbsp;
			    </CFIF>
			    <CFIF #Len(read_mortgage5.data21)# gte 1>
      		        Deed Book and Page #read_mortgage5.data20#/#read_mortgage5.data21#
                <CFELSE>
                    Document No #read_mortgage5.data19#
                </CFIF>
		    </CFIF>
			</font></b>
			</td>
  	</tr>
	<tr>
        <td>&nbsp;

        </td>

  	</tr>
  	<tr>
    	<td>
			<BR>
		</td>
  	</tr>
</CFOUTPUT>
<CFQUERY NAME="read_mortgage6" datasource="#request.dsn#">
			select * from prop_ins_view WHERE prop_id
  			= #url.rec_ID# and selectedOrgs4 = 6
</CFQUERY>

<cfoutput query = "read_mortgage6">
<tr>
    	<td colspan="2" valign="top"><b><u>MORTGAGE/DEED OF TRUST</u></b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">Holder: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage6.data1#</font></b></td>
  	</tr>
    <tr>
    	<td colspan="2" valign="top">
            Mortgagor: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage6.data2#<CFIF #LEN(read_mortgage6.data3)# gt "1"> and #read_mortgage6.data3#</CFIF></font></b>
        </td>
  	</tr>
  	<tr>
    	<CFIF #Len(read_mortgage6.data6)# gte 1>
    	<td>Deed Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage6.data6#/#read_mortgage6.data7#</font></b></td>
		<CFELSE>
		<td>Document No: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage6.data5#</font></b></td>
		</CFIF>
        <td>
			Recorded:
			<b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage6.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#DateFormat(read_mortgage6.data8, "mm/dd/yyyy")#</font></b>
		</td>
    	<td>
			Open End:&nbsp; <STRONG><FONT size=2><FONT face=Arial>#read_mortgage6.data33#</FONT></FONT></STRONG>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">Amount:
			<FONT face="Arial, Helvetica, sans-serif" color=blue size=2><STRONG>#read_mortgage6.data4#</STRONG></FONT>
		</td>
    	<td valign="top">
			Assigned to: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">
			#read_mortgage6.data13#
            <CFIF LEN(#read_mortgage6.data13#) gte 1>
          		<CFIF #len(read_mortgage6.data20)# gte 1>
    				,#read_mortgage6.data20#/#read_mortgage6.data21#
    			</CFIF>
    			<CFIF #len(read_mortgage6.data17)# gte 1>
    			    on #read_mortgage6.data17#&nbsp;
    			</CFIF>
    			<CFIF #Len(read_mortgage6.data16)# gte 1>
          		    Deed Book and Page #read_mortgage6.data15#/#read_mortgage6.data16#
                <CFELSE>
                    Document No #read_mortgage6.data14#
                </CFIF>
            </CFIF><bR>
			#read_mortgage6.data18#
            <CFIF LEN(#read_mortgage6.data18#) gte 1>
      		    <CFIF #len(read_mortgage6.data25)# gte 1>
				    ,#read_mortgage6.data25#/#read_mortgage6.data26#
			    </CFIF>
			    <CFIF #len(read_mortgage6.data22)# gte 1>
			        on #read_mortgage6.data22#&nbsp;
			    </CFIF>
			    <CFIF #Len(read_mortgage6.data21)# gte 1>
      		        Deed Book and Page #read_mortgage6.data20#/#read_mortgage6.data21#
                <CFELSE>
                    Document No #read_mortgage6.data19#
                </CFIF>
		    </CFIF>
			</font></b>
			</td>
  	</tr>
	<tr>
        <td>&nbsp;

        </td>

  	</tr>
  	<tr>
    	<td>
			<BR>
		</td>
  	</tr>
</CFOUTPUT>
<CFQUERY NAME="read_mortgage7" datasource="#request.dsn#">
			select * from prop_ins_view WHERE prop_id
  			= #url.rec_ID# and selectedOrgs4 = 7
</CFQUERY>

<cfoutput query = "read_mortgage7">
<tr>
    	<td colspan="2" valign="top"><b><u>MORTGAGE/DEED OF TRUST</u></b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">Holder: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage7.data1#</font></b></td>
  	</tr>
    <tr>
    	<td colspan="2" valign="top">
            Mortgagor: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage7.data2#<CFIF #LEN(read_mortgage7.data3)# gt "1"> and #read_mortgage7.data3#</CFIF></font></b>
        </td>
  	</tr>
  	<tr>
    	<CFIF #Len(read_mortgage7.data6)# gte 1>
    	<td>Deed Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage7.data6#/#read_mortgage7.data7#</font></b></td>
		<CFELSE>
		<td>Document No: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage7.data5#</font></b></td>
		</CFIF>
        <td>
			Recorded:
			<b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage7.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#DateFormat(read_mortgage7.data8, "mm/dd/yyyy")#</font></b>
		</td>
    	<td>
			Open End:&nbsp; <STRONG><FONT size=2><FONT face=Arial>#read_mortgage7.data33#</FONT></FONT></STRONG>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">Amount:
			<FONT face="Arial, Helvetica, sans-serif" color=blue size=2><STRONG>#read_mortgage7.data4#</STRONG></FONT>
		</td>
    	<td valign="top">
			Assigned to: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">
			#read_mortgage7.data13#
            <CFIF LEN(#read_mortgage7.data13#) gte 1>
          		<CFIF #len(read_mortgage7.data20)# gte 1>
    				,#read_mortgage7.data20#/#read_mortgage7.data21#
    			</CFIF>
    			<CFIF #len(read_mortgage7.data17)# gte 1>
    			    on #read_mortgage7.data17#&nbsp;
    			</CFIF>
    			<CFIF #Len(read_mortgage7.data16)# gte 1>
          		    Deed Book and Page #read_mortgage7.data15#/#read_mortgage7.data16#
                <CFELSE>
                    Document No #read_mortgage7.data14#
                </CFIF>
            </CFIF><bR>
			#read_mortgage7.data18#
            <CFIF LEN(#read_mortgage7.data18#) gte 1>
      		    <CFIF #len(read_mortgage7.data25)# gte 1>
				    ,#read_mortgage7.data25#/#read_mortgage7.data26#
			    </CFIF>
			    <CFIF #len(read_mortgage7.data22)# gte 1>
			        on #read_mortgage7.data22#&nbsp;
			    </CFIF>
			    <CFIF #Len(read_mortgage7.data21)# gte 1>
      		        Deed Book and Page #read_mortgage7.data20#/#read_mortgage7.data21#
                <CFELSE>
                    Document No #read_mortgage7.data19#
                </CFIF>
		    </CFIF>
			</font></b>
			</td>
  	</tr>
	<tr>
        <td>&nbsp;

        </td>

  	</tr>
  	<tr>
    	<td>
			<BR>
		</td>
  	</tr>
</CFOUTPUT>
<CFQUERY NAME="read_mortgage8" datasource="#request.dsn#">
			select * from prop_ins_view WHERE prop_id
  			= #url.rec_ID# and selectedOrgs4 = 8
</CFQUERY>

<cfoutput query = "read_mortgage8">
<tr>
    	<td colspan="2" valign="top"><b><u>MORTGAGE/DEED OF TRUST</u></b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">Holder: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage8.data1#</font></b></td>
  	</tr>
    <tr>
    	<td colspan="2" valign="top">
            Mortgagor: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage8.data2#<CFIF #LEN(read_mortgage8.data3)# gt "1"> and #read_mortgage8.data3#</CFIF></font></b>
        </td>
  	</tr>
  	<tr>
    	<CFIF #Len(read_mortgage8.data6)# gte 1>
    	<td>Deed Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage8.data6#/#read_mortgage8.data7#</font></b></td>
		<CFELSE>
		<td>Document No: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage8.data5#</font></b></td>
		</CFIF>
        <td>
			Recorded:
			<b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage8.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#DateFormat(read_mortgage8.data8, "mm/dd/yyyy")#</font></b>
		</td>
    	<td>
			Open End:&nbsp; <STRONG><FONT size=2><FONT face=Arial>#read_mortgage8.data33#</FONT></FONT></STRONG>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">Amount:
			<FONT face="Arial, Helvetica, sans-serif" color=blue size=2><STRONG>#read_mortgage8.data4#</STRONG></FONT>
		</td>
    	<td valign="top">
			Assigned to: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">
			#read_mortgage8.data13#
            <CFIF LEN(#read_mortgage8.data13#) gte 1>
          		<CFIF #len(read_mortgage8.data20)# gte 1>
    				,#read_mortgage8.data20#/#read_mortgage8.data21#
    			</CFIF>
    			<CFIF #len(read_mortgage8.data17)# gte 1>
    			    on #read_mortgage8.data17#&nbsp;
    			</CFIF>
    			<CFIF #Len(read_mortgage8.data16)# gte 1>
          		    Deed Book and Page #read_mortgage8.data15#/#read_mortgage8.data16#
                <CFELSE>
                    Document No #read_mortgage8.data14#
                </CFIF>
            </CFIF><bR>
			#read_mortgage8.data18#
            <CFIF LEN(#read_mortgage8.data18#) gte 1>
      		    <CFIF #len(read_mortgage8.data25)# gte 1>
				    ,#read_mortgage8.data25#/#read_mortgage8.data26#
			    </CFIF>
			    <CFIF #len(read_mortgage8.data22)# gte 1>
			        on #read_mortgage8.data22#&nbsp;
			    </CFIF>
			    <CFIF #Len(read_mortgage8.data21)# gte 1>
      		        Deed Book and Page #read_mortgage8.data20#/#read_mortgage8.data21#
                <CFELSE>
                    Document No #read_mortgage8.data19#
                </CFIF>
		    </CFIF>
			</font></b>
			</td>
  	</tr>
	<tr>
        <td>&nbsp;

        </td>

  	</tr>
  	<tr>
    	<td>
			<BR>
		</td>
  	</tr>
</CFOUTPUT>
<CFQUERY NAME="read_mortgage9" datasource="#request.dsn#">
			select * from prop_ins_view WHERE prop_id
  			= #url.rec_ID# and selectedOrgs4 = 9
</CFQUERY>

<cfoutput query = "read_mortgage9">
<tr>
    	<td colspan="2" valign="top"><b><u>MORTGAGE/DEED OF TRUST</u></b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">Holder: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage9.data1#</font></b></td>
  	</tr>
    <tr>
    	<td colspan="2" valign="top">
            Mortgagor: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage9.data2#<CFIF #LEN(read_mortgage9.data3)# gt "1"> and #read_mortgage9.data3#</CFIF></font></b>
        </td>
  	</tr>
  	<tr>
    	<CFIF #Len(read_mortgage9.data6)# gte 1>
    	<td>Deed Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage9.data6#/#read_mortgage9.data7#</font></b></td>
		<CFELSE>
		<td>Document No: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage9.data5#</font></b></td>
		</CFIF>
        <td>
			Recorded:
			<b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage9.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#DateFormat(read_mortgage9.data8, "mm/dd/yyyy")#</font></b>
		</td>
    	<td>
			Open End:&nbsp; <STRONG><FONT size=2><FONT face=Arial>#read_mortgage9.data33#</FONT></FONT></STRONG>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">Amount:
			<FONT face="Arial, Helvetica, sans-serif" color=blue size=2><STRONG>#read_mortgage9.data4#</STRONG></FONT>
		</td>
    	<td valign="top">
			Assigned to: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">
			#read_mortgage9.data13#
            <CFIF LEN(#read_mortgage9.data13#) gte 1>
          		<CFIF #len(read_mortgage9.data20)# gte 1>
    				,#read_mortgage9.data20#/#read_mortgage9.data21#
    			</CFIF>
    			<CFIF #len(read_mortgage9.data17)# gte 1>
    			    on #read_mortgage9.data17#&nbsp;
    			</CFIF>
    			<CFIF #Len(read_mortgage9.data16)# gte 1>
          		    Deed Book and Page #read_mortgage9.data15#/#read_mortgage9.data16#
                <CFELSE>
                    Document No #read_mortgage9.data14#
                </CFIF>
            </CFIF><bR>
			#read_mortgage9.data18#
            <CFIF LEN(#read_mortgage9.data18#) gte 1>
      		    <CFIF #len(read_mortgage9.data25)# gte 1>
				    ,#read_mortgage9.data25#/#read_mortgage9.data26#
			    </CFIF>
			    <CFIF #len(read_mortgage9.data22)# gte 1>
			        on #read_mortgage9.data22#&nbsp;
			    </CFIF>
			    <CFIF #Len(read_mortgage9.data21)# gte 1>
      		        Deed Book and Page #read_mortgage9.data20#/#read_mortgage9.data21#
                <CFELSE>
                    Document No #read_mortgage9.data19#
                </CFIF>
		    </CFIF>
			</font></b>
			</td>
  	</tr>
	<tr>
        <td>&nbsp;

        </td>

  	</tr>
  	<tr>
    	<td>
			<BR>
		</td>
  	</tr>
</CFOUTPUT>
<CFQUERY NAME="read_mortgage10" datasource="#request.dsn#">
			select * from prop_ins_view WHERE prop_id
  			= #url.rec_ID# and selectedOrgs4 = 10
</CFQUERY>

<cfoutput query = "read_mortgage10">
<tr>
    	<td colspan="2" valign="top"><b><u>MORTGAGE/DEED OF TRUST</u></b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">Holder: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage10.data1#</font></b></td>
  	</tr>
    <tr>
    	<td colspan="2" valign="top">
            Mortgagor: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage10.data2#<CFIF #LEN(read_mortgage10.data3)# gt "1"> and #read_mortgage10.data3#</CFIF></font></b>
        </td>
  	</tr>
  	<tr>
    	<CFIF #Len(read_mortgage10.data6)# gte 1>
    	<td>Deed Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage10.data6#/#read_mortgage10.data7#</font></b></td>
		<CFELSE>
		<td>Document No: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage10.data5#</font></b></td>
		</CFIF>
        <td>
			Recorded:
			<b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage10.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#DateFormat(read_mortgage10.data8, "mm/dd/yyyy")#</font></b>
		</td>
    	<td>
			Open End:&nbsp; <STRONG><FONT size=2><FONT face=Arial>#read_mortgage10.data33#</FONT></FONT></STRONG>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">Amount:
			<FONT face="Arial, Helvetica, sans-serif" color=blue size=2><STRONG>#read_mortgage10.data4#</STRONG></FONT>
		</td>
    	<td valign="top">
			Assigned to: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">
			#read_mortgage10.data13#
            <CFIF LEN(#read_mortgage10.data13#) gte 1>
          		<CFIF #len(read_mortgage10.data20)# gte 1>
    				,#read_mortgage10.data20#/#read_mortgage10.data21#
    			</CFIF>
    			<CFIF #len(read_mortgage10.data17)# gte 1>
    			    on #read_mortgage10.data17#&nbsp;
    			</CFIF>
    			<CFIF #Len(read_mortgage10.data16)# gte 1>
          		    Deed Book and Page #read_mortgage10.data15#/#read_mortgage10.data16#
                <CFELSE>
                    Document No #read_mortgage10.data14#
                </CFIF>
            </CFIF><bR>
			#read_mortgage10.data18#
            <CFIF LEN(#read_mortgage10.data18#) gte 1>
      		    <CFIF #len(read_mortgage10.data25)# gte 1>
				    ,#read_mortgage10.data25#/#read_mortgage10.data26#
			    </CFIF>
			    <CFIF #len(read_mortgage10.data22)# gte 1>
			        on #read_mortgage10.data22#&nbsp;
			    </CFIF>
			    <CFIF #Len(read_mortgage10.data21)# gte 1>
      		        Deed Book and Page #read_mortgage10.data20#/#read_mortgage10.data21#
                <CFELSE>
                    Document No #read_mortgage10.data19#
                </CFIF>
		    </CFIF>
			</font></b>
			</td>
  	</tr>
	<tr>
        <td>&nbsp;

        </td>

  	</tr>
  	<tr>
    	<td>
			<BR>
		</td>
  	</tr>
</CFOUTPUT>
<!---Legal Description --->
<CFQUERY NAME="read_legal" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# AND (type = 'DATA') ORDER BY insert_date, insert_time DESC
 </CFQUERY>
<cfoutput>
	<tr>
    	<td align="middle" valign="top" colspan=2><u><strong>Legal
      		Description</strong></u>
		</td>
  	</tr>
  	<tr>
    	<td height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;
			</font>
		</td>
  	</tr>
  	<tr>
    	<td valign="top" colspan=2><table   cellspacing="0" border="0">
			<tr>
                <td>
                    <b>
                        <font size="2" color = "black" face="Arial, Helvetica, sans-serif">
                        See Appendix A
                        </font>
                    </b>
	     </td>
     </tr>
     </table>
		</td>
  	</tr>
</CFOUTPUT>

<!---Judgment --->
<CFIF #Judgment_Count.RecordCount# eq 0>
	<tr>
    	<td colspan="2" align="middle" valign="top"><u><strong>
			Judgment Record</strong></u>
		</td>
  	</tr>
	<tr>
		<td>
			<br>
		</td>
	</tr>
	<tr>
		<td>
			None
		</td>
	</tr>
</CFIF>
<CFQUERY NAME="read_lien" datasource="#request.dsn#">
			select * from prop_ins_view WHERE prop_id
  			= #url.rec_ID# and selectedOrgs3 = 1
</CFQUERY>
<CFQUERY NAME="read" datasource="#request.dsn#">
			select * from property WHERE
  			prop_id = #url.rec_ID# </CFQUERY>
<cfoutput query = "read_lien">
  	<tr>
    	<td colspan="2" align="middle" valign="top"><u><strong>
			Judgment Record</strong></u>
		</td>
  	</tr>
  	<tr>
    	<td>
			<BR>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien.data2#/#read_lien.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">
			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien.data8#</font></b>
		</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>
<CFQUERY NAME="read_lien2" datasource="#request.dsn#">
			select * from prop_ins_view WHERE prop_id
  			= #url.rec_ID# and selectedOrgs3 = 2 </CFQUERY>
<cfoutput query = "read_lien2">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien2.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien2.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien2.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien2.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien2.data2#/#read_lien2.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien2.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien2.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">
			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien2.data8#</font></b>
		</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>
</table>
<!---
</IE:DEVICERECT>
<IE:DEVICERECT ID="page2" CLASS="masterstyle" MEDIA="print">
--->
<table  width="90%" cellpadding="3" cellspacing="0" border="0">
<CFQUERY NAME="read_lien3" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 3 </CFQUERY>
<cfoutput query = "read_lien3">


<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien3.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien3.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien3.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien3.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien3.data2#/#read_lien.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien3.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien3.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">
			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien3.data8#</font></b>
		</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>
<CFQUERY NAME="read_lien4" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 4
</CFQUERY>
<cfoutput query = "read_lien4">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien4.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien4.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien4.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien4.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien4.data2#/#read_lien4.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien4.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien4.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">
			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien4.data8#</font></b>
		</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>
<CFQUERY NAME="read_lien5" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 5 </CFQUERY>
<cfoutput query = "read_lien5">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien5.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien5.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien5.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien5.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien5.data2#/#read_lien5.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien5.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien5.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien5.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>
</table>
</IE:DEVICERECT>
<IE:DEVICERECT ID="page3" CLASS="masterstyle" MEDIA="print"><br>
<br>
<br>
<br>

<table  width="90%" cellpadding="3" cellspacing="0" border="0">

<CFQUERY NAME="read_lien9" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 9 </CFQUERY>
<cfoutput query = "read_lien9">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien9.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien9.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien9.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien9.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien9.data2#/#read_lien9.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien9.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien9.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien9.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien6" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 6 </CFQUERY>
<cfoutput query = "read_lien6">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien6.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien6.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien6.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien6.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien6.data2#/#read_lien6.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien6.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien6.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien6.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien7" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 7 </CFQUERY>
<cfoutput query = "read_lien7">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien7.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien7.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien7.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien7.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien7.data2#/#read_lien7.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien7.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien7.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien7.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>



<CFQUERY NAME="read_lien8" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 8 </CFQUERY>
<cfoutput query = "read_lien8">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien8.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien8.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien8.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien8.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien8.data2#/#read_lien8.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien8.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien8.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien8.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>



<CFQUERY NAME="read_lien9" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 9 </CFQUERY>
<cfoutput query = "read_lien9">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien9.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien9.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien9.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien9.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien9.data2#/#read_lien9.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien9.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien9.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien9.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>

<CFQUERY NAME="read_lien10" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 10 </CFQUERY>
<cfoutput query = "read_lien10">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien10.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien10.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien10.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien10.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien10.data2#/#read_lien10.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien10.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien10.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien10.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>

<CFQUERY NAME="read_lien11" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 11 </CFQUERY>
<cfoutput query = "read_lien11">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien11.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien11.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien11.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien11.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien11.data2#/#read_lien11.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien11.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien11.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien11.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>

<CFQUERY NAME="read_lien12" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 12 </CFQUERY>
<cfoutput query = "read_lien12">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien12.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien12.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien12.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien12.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien12.data2#/#read_lien12.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien12.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien12.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien12.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>

<CFQUERY NAME="read_lien13" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 13 </CFQUERY>
<cfoutput query = "read_lien13">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien13.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien13.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien13.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien13.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien13.data2#/#read_lien13.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien13.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien13.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien13.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>

<CFQUERY NAME="read_lien14" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 14 </CFQUERY>
<cfoutput query = "read_lien14">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien14.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien14.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien14.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien14.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien14.data2#/#read_lien14.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien14.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien14.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien14.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>

<CFQUERY NAME="read_lien15" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 15 </CFQUERY>
<cfoutput query = "read_lien15">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien15.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien15.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien15.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien15.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien15.data2#/#read_lien15.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien15.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien15.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien15.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>

<CFQUERY NAME="read_lien16" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 16 </CFQUERY>
<cfoutput query = "read_lien16">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien16.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien16.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien16.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien16.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien16.data2#/#read_lien16.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien16.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien16.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien16.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>

<CFQUERY NAME="read_lien17" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 17 </CFQUERY>
<cfoutput query = "read_lien17">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien17.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien17.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien17.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien17.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien17.data2#/#read_lien17.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien17.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien17.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien17.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>

<CFQUERY NAME="read_lien18" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 18 </CFQUERY>
<cfoutput query = "read_lien18">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien18.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien18.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien18.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien18.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien18.data2#/#read_lien18.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien18.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien18.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien18.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>

<CFQUERY NAME="read_lien19" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 19 </CFQUERY>
<cfoutput query = "read_lien19">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien19.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien19.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien19.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien19.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien19.data2#/#read_lien19.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien19.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien19.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien19.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>

<CFQUERY NAME="read_lien20" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 20 </CFQUERY>
<cfoutput query = "read_lien20">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien20.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien20.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien20.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien20.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien20.data2#/#read_lien20.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien20.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien20.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien20.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>

<CFQUERY NAME="read_lien21" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 21 </CFQUERY>
<cfoutput query = "read_lien21">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien21.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien21.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien21.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien21.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien21.data2#/#read_lien21.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien21.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien21.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien21.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>

<CFQUERY NAME="read_lien22" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 22 </CFQUERY>
<cfoutput query = "read_lien22">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien22.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien22.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien22.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien22.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien22.data2#/#read_lien22.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien22.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien22.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien22.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>

<CFQUERY NAME="read_lien23" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 23 </CFQUERY>
<cfoutput query = "read_lien23">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien23.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien23.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien23.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien23.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien23.data2#/#read_lien23.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien23.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien23.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien23.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>

<CFQUERY NAME="read_lien24" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 24 </CFQUERY>
<cfoutput query = "read_lien24">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien24.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien24.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien24.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien24.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien24.data2#/#read_lien24.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien24.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien24.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien24.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>

<CFQUERY NAME="read_lien25" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 25 </CFQUERY>
<cfoutput query = "read_lien25">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien25.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien25.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien25.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien25.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien25.data2#/#read_lien25.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien25.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien25.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien25.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>

<CFQUERY NAME="read_lien26" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 26 </CFQUERY>
<cfoutput query = "read_lien26">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien26.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien26.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien26.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien26.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien26.data2#/#read_lien26.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien26.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien26.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien26.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>

<CFQUERY NAME="read_lien27" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 27 </CFQUERY>
<cfoutput query = "read_lien27">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien27.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien27.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien27.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien27.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien27.data2#/#read_lien27.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien27.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien27.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien27.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>

<CFQUERY NAME="read_lien28" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 28 </CFQUERY>
<cfoutput query = "read_lien28">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien28.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien28.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien28.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien28.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien28.data2#/#read_lien28.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien28.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien28.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien28.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>

<CFQUERY NAME="read_lien29" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 29 </CFQUERY>
<cfoutput query = "read_lien29">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien29.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien29.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien29.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien29.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien29.data2#/#read_lien29.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien29.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien29.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien29.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>

</CFOUTPUT>

<CFQUERY NAME="read_lien30" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 30 </CFQUERY>
<cfoutput query = "read_lien30">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien30.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien30.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien30.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien30.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien30.data2#/#read_lien30.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien30.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien30.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien30.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>

<CFQUERY NAME="read_lien31" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 31 </CFQUERY>
<cfoutput query = "read_lien31">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien31.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien31.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien31.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien31.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien31.data2#/#read_lien31.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien31.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien31.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien31.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien32" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 32 </CFQUERY>
<cfoutput query = "read_lien32">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien32.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien32.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien32.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien32.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien32.data2#/#read_lien32.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien32.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien32.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien32.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien33" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 33 </CFQUERY>
<cfoutput query = "read_lien33">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien33.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien33.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien33.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien33.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien33.data2#/#read_lien33.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien33.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien33.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien33.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien34" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 34 </CFQUERY>
<cfoutput query = "read_lien34">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien34.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien34.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien34.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien34.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien34.data2#/#read_lien34.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien34.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien34.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien34.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien35" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 35 </CFQUERY>
<cfoutput query = "read_lien35">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien35.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien35.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien35.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien35.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien35.data2#/#read_lien35.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien35.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien35.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien35.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien36" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 36 </CFQUERY>
<cfoutput query = "read_lien36">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien36.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien36.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien36.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien36.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien36.data2#/#read_lien36.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien36.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien36.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien36.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien37" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 37 </CFQUERY>
<cfoutput query = "read_lien37">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien37.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien37.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien37.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien37.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien37.data2#/#read_lien37.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien37.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien37.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien37.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien38" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 38 </CFQUERY>
<cfoutput query = "read_lien38">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien38.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien38.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien38.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien38.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien38.data2#/#read_lien38.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien38.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien38.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien38.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien39" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 39 </CFQUERY>
<cfoutput query = "read_lien39">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien39.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien39.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien39.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien39.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien39.data2#/#read_lien39.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien39.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien39.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien39.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien40" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 40 </CFQUERY>
<cfoutput query = "read_lien40">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien40.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien40.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien40.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien40.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien40.data2#/#read_lien40.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien40.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien40.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien40.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien41" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 41 </CFQUERY>
<cfoutput query = "read_lien41">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien41.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien41.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien41.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien41.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien41.data2#/#read_lien41.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien41.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien41.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien41.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien42" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 42 </CFQUERY>
<cfoutput query = "read_lien42">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien42.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien42.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien42.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien42.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien42.data2#/#read_lien42.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien42.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien42.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien42.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien43" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 43 </CFQUERY>
<cfoutput query = "read_lien43">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien43.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien43.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien43.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien43.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien43.data2#/#read_lien43.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien43.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien43.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien43.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien44" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 44 </CFQUERY>
<cfoutput query = "read_lien44">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien44.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien44.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien44.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien44.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien44.data2#/#read_lien44.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien44.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien44.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien44.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien45" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 45 </CFQUERY>
<cfoutput query = "read_lien45">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien45.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien45.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien45.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien45.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien45.data2#/#read_lien45.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien45.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien45.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien45.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien46" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 46 </CFQUERY>
<cfoutput query = "read_lien46">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien46.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien46.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien46.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien46.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien46.data2#/#read_lien46.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien46.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien46.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien46.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien47" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 47 </CFQUERY>
<cfoutput query = "read_lien47">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien47.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien47.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien47.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien47.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien47.data2#/#read_lien47.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien47.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien47.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien47.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien48" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 48 </CFQUERY>
<cfoutput query = "read_lien48">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien48.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien48.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien48.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien48.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien48.data2#/#read_lien48.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien48.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien48.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien48.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien49" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 49 </CFQUERY>
<cfoutput query = "read_lien49">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien49.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien49.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien49.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien49.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien49.data2#/#read_lien49.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien49.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien49.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien49.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien50" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 50 </CFQUERY>
<cfoutput query = "read_lien50">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien50.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien50.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien50.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien50.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien50.data2#/#read_lien50.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien50.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien50.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien50.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien51" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 51 </CFQUERY>
<cfoutput query = "read_lien51">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien51.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien51.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien51.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien51.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien51.data2#/#read_lien51.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien51.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien51.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien51.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien52" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 52 </CFQUERY>
<cfoutput query = "read_lien52">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien52.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien52.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien52.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien52.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien52.data2#/#read_lien52.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien52.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien52.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien52.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien53" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 53 </CFQUERY>
<cfoutput query = "read_lien53">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien53.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien53.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien53.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien53.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien53.data2#/#read_lien53.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien53.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien53.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien53.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien54" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 54 </CFQUERY>
<cfoutput query = "read_lien54">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien54.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien54.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien54.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien54.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien54.data2#/#read_lien54.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien54.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien54.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien54.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien55" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 55 </CFQUERY>
<cfoutput query = "read_lien55">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien55.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien55.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien55.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien55.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien55.data2#/#read_lien55.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien55.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien55.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien55.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien56" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 56 </CFQUERY>
<cfoutput query = "read_lien56">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien56.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien56.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien56.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien56.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien56.data2#/#read_lien56.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien56.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien56.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien56.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien57" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 57 </CFQUERY>
<cfoutput query = "read_lien57">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien57.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien57.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien57.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien57.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien57.data2#/#read_lien57.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien57.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien57.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien57.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien58" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 58 </CFQUERY>
<cfoutput query = "read_lien58">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien58.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien58.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien58.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien58.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien58.data2#/#read_lien58.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien58.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien58.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien58.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien59" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 59 </CFQUERY>
<cfoutput query = "read_lien59">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien59.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien59.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien59.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien59.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien59.data2#/#read_lien59.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien59.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien59.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien59.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien60" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 60 </CFQUERY>
<cfoutput query = "read_lien60">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien60.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien60.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien60.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien60.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien60.data2#/#read_lien60.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien60.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien60.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien60.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien61" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 61 </CFQUERY>
<cfoutput query = "read_lien61">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien61.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien61.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien61.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien61.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien61.data2#/#read_lien61.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien61.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien61.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien61.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien62" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 62 </CFQUERY>
<cfoutput query = "read_lien62">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien62.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien62.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien62.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien62.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien62.data2#/#read_lien62.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien62.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien62.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien62.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien63" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 63 </CFQUERY>
<cfoutput query = "read_lien63">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien63.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien63.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien63.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien63.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien63.data2#/#read_lien63.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien63.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien63.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien63.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien64" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 64 </CFQUERY>
<cfoutput query = "read_lien64">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien64.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien64.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien64.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien64.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien64.data2#/#read_lien64.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien64.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien64.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien64.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien65" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 65 </CFQUERY>
<cfoutput query = "read_lien65">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien65.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien65.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien65.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien65.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien65.data2#/#read_lien65.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien65.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien65.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien65.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>

<CFQUERY NAME="read_lien66" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 66 </CFQUERY>
<cfoutput query = "read_lien66">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien66.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien66.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien66.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien66.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien66.data2#/#read_lien66.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien66.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien66.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien66.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien67" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 67 </CFQUERY>
<cfoutput query = "read_lien67">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien67.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien67.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien67.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien67.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien67.data2#/#read_lien67.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien67.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien67.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien67.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>



<CFQUERY NAME="read_lien68" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 68 </CFQUERY>
<cfoutput query = "read_lien68">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien68.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien68.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien68.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien68.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien68.data2#/#read_lien68.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien68.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien68.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien68.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien69" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 69 </CFQUERY>
<cfoutput query = "read_lien69">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien69.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien69.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien69.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien69.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien69.data2#/#read_lien69.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien69.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien69.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien69.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


<CFQUERY NAME="read_lien70" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and selectedOrgs3 = 70 </CFQUERY>
<cfoutput query = "read_lien70">
	<tr>
    	<td valign="top">
			Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#
      		#read.bfirstname2# #read.blastname2#</font></b>
		</td>
    	<td>
			Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien70.data1#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td>
			Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien70.data9#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td valign="top">
			Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien70.data4#</font></b>
		</td>
    	<td>
			Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien70.data5#</font></b>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien70.data2#/#read_lien70.data3#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien70.data7#</font></b>
		</td>
  	</tr>
	<tr>
    	<td colspan="2" valign="top">
			Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien70.data6#</font></b>
		</td>
  	</tr>
 	<tr>
    	<td colspan="2" valign="top">

			Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien70.data8#</font></b>
	</td>
  	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
</CFOUTPUT>


</table>


<table  width="90%" cellpadding="3" cellspacing="0" border="0">
<CFOUTPUT>


<tr>
    	<td colspan="2" align="middle" valign="top"><u><strong><font size="3">
			Tax Record</font></strong></u>
		</td>
  	</tr>
  	<tr>
    	<td>
			<BR>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" valign="top">
			#read_tax_info.data29# #read_tax_info.data31# <cfif #read_tax_info.data28# neq "">#read_tax_info.data28#</cfif>
		</td>
  	</tr>
  	<tr>
    	<td colspan="2" height="10">
			TAXES ARE PAID <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_tax_info.data37#</font></b>
		</td>
  	</tr>
  	<tr>
		<td colspan="2" height="10">
		DUE DATE <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_tax_info.data30#</font></b>
		</td>
	</tr>
	<tr>
    	<td colspan="2" valign="top">
			TAX ID <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_tax_info.data19#</font></b>
 		</td>
  	</tr>
	<CFIF #Len(read_tax_info.data34)# gt 1>
		<tr>
			<td colspan="2" height="10"><table><tr><td>
				ADDITIONAL INFORMATION <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_tax_info.data34#</font></b>
				</td>
		</tr></table></td>
		</tr>
	</CFIF>
</CFOUTPUT>




	<tr>
		<td>
			<BR>
		</td>
	</tr>
	<tr>
		<td>
			<BR>
		</td>
	</tr>
	<tr>
		<td valign="top">
			THANK YOU, <cfif read_title.comp_id eq 452>First Title & Escrow<cfelse>Abstracts USA</cfif>
		</td>
		<td valign="right">
	<CFOUTPUT>		#DateFormat(read_Title.check_date, "mm/dd/yyyy")#</CFOUTPUT>
		</td>
	</TR>

<TR>
	<TD>
		<br>
	</td>
</TR>
<tr>
    	<td colspan="2" valign="top"><size="2">
      		<FONT size=1>Notice:&nbsp; The following information is provided from
      		researching Public Records and should not be considered as an opinion of
      		Title, Title Guarantee, or Title Insurance Policy.&nbsp; This information
      		is not intended nor should it be construed to create any rights in any
      		third party.&nbsp; It is recommended that the information reported be kept
      		confidential.&nbsp; Professional Liability for errors and omissions associated with this
					report will be limited to the cost paid for
					the search.</FONT>
      	</td>
  	</tr>

</table></p>
</IE:DEVICERECT>
<IE:DEVICERECT ID="page3" CLASS="masterstyle" MEDIA="print">


<CFQUERY NAME="read_legal" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# and (type = 'DATA') ORDER BY  insert_date DESC, insert_time
 </CFQUERY>
<cfoutput>
<table  width="90%" cellpadding="3" cellspacing="0" border="0">
	<tr bgcolor="black">
    	<td align="middle" valign="top" colspan=2>
            <strong>
                <font color = "white">
                Appendix A
      		</strong>
		</td>
  	</tr>
  	<tr>
</table>
<table  width="90%" cellpadding="3" cellspacing="0" border="0">
	<tr>
    	<td align="middle" valign="top" colspan=2><u><strong>Legal
      		Description</strong></u>
		</td>
  	</tr>
  	<tr>
    	<td height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;
			</font>
		</td>
  	</tr>
  	<tr>
    	<td valign="top" colspan=2><table   cellspacing="0" border="0">
			<tr><td><b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_legal.notes#</font></b>
		</td></tr></table></td>
  	</tr>
</CFOUTPUT>

</IE:DEVICERECT>
</BODY>
</html>
--->