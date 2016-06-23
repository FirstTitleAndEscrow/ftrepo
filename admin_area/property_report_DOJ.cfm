<CFPARAM NAME="a_trigger" DEFAULT="0">
<cfparam name="create_pdf" default=0>
<cfif isDefined("url.rec_id")>
<cfset rec_id = url.rec_id>
</cfif>
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
TD {font-size:10px; font-family:Arial, Helvetica, sans-serif; vertical-align:top;}
.larger {font-size:12px; font-family:Arial, Helvetica, sans-serif}
.largerstill {font-size:14px; font-family:Arial, Helvetica, sans-serif}
hr {
  border: 0;
  width: 100%;
  color: #000000;
background-color: #000000;
height: 2px;
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

<table width="800">
    <!--- tr for Name Begin--->
    <tr>
    <td colspan="25%">Name:</td>
    <td colspan="75%">#read_deed_info.data3#<cfif read_deed_info.data4 neq '' and read_deed_info.data4 neq 'NULL'> and #read_deed_info.data4#</cfif></td>
    </tr>
    <tr>
    <td colspan="25%">Address:</td>
    <td colspan="75%">#Read_Title.paddress#, #Read_Title.pcity#, #Read_Title.pcounty#, #Read_Title.pstate# #Read_Title.pzip#</td>
    </tr>
    <tr>
    <td colspan="25%">File No:</td>
    <td colspan="75%">#read_title.prop_id#</td>
    </tr>
    <tr>
    <td colspan="25%">Loan No:</td>
    <td colspan="75%">#read_title.loan_number#</td>
    </tr>
    <tr>
    <td colspan="25%">Report Type:</td>
    <td colspan="75%">PROPERTY REPORT <cfif check_if_update.product_ordered eq 'bring_to_date'>UPDATE</cfif></td>
    </tr>
    <tr>
    <td colspan="25%">Plant Cover Date:</td>
    <td colspan="75%">#DateFormat(read_Title_update.data37, "mm/dd/yyyy")#</td>
    </tr>
    <tr>
    <td colspan="25%">Date of Report:</td>
    <td colspan="75%">#DateFormat(read_deed_info.search_date, "mm/dd/yyyy")#</td>
    </tr>
    <tr></tr><tr></tr><tr></tr>
	</table>
    <!--- tr for Name End--->
    <!--- tr for Address Begin--->
<table width="800">
    <tr><td colspan="4"><hr></td></tr>
    <tr><td align="left" colspan="4"><u><strong>LOCATION</strong></u><br>
</td></tr>
    <tr>
        <td colspan=3>SITE ADDRESS: &nbsp;&nbsp;#Read_Title.paddress#, #Read_Title.pcity#, #Read_Title.pstate# #Read_Title.pzip#</td>
        <td >COUNTY: &nbsp;&nbsp;#Read_Title.pcounty#</td>
    </tr>
    <tr>
        <td width="20%">PARCEL ##:</td>
        <td width="20%"></td>
        <td width="30%"></td>
        <td width="30%"></td>
    </tr>
</cfoutput>
<cfif read_deed_info.recordcount eq 0>
    <tr><td colspan="4"><hr></td></tr>


    <tr><td align="left" colspan="4"><u><strong>CURRENT OWNER AND BACK DEEDS</strong></u>:</td></tr>
    <tr><td width="20%">No Current Conveyances found</td></tr>
<cfelse>
<cfoutput query="read_deed_info">
    <tr><td colspan="4"><hr></td></tr>


    <tr><td align="left" colspan="4"><u><strong>CURRENT OWNER AND BACK DEEDS</strong></u>:</td></tr>
    <tr></tr>
    <tr>
        <td width="20%">BUYER/GRANTEE:</td>
        <td colspan="3">#read_deed_info.data3#<br>
<cfif Len(read_deed_info.data2)>#read_deed_info.data4#</cfif></td>
    </tr>
    <tr>
        <td width="20%">SELLER/GRANTOR:</td>
        <td colspan="3">#read_deed_info.data1#<br>
<cfif Len(read_deed_info.data2)>#read_deed_info.data2#</cfif></td>
    </tr>
    <tr>
        <td width="20%">DOC TYPE:</td>
        <td colspan="3">#read_deed_info.data5#</td>
    </tr>
    <tr>
        <td width="20%">TYPE OF VESTING:</td>
        <td colspan="3">#read_deed_info.data38#</td>
    </tr>
    <tr><td>&nbsp;</td></tr>
      <tr>
        <td width="20%" align="left">DATE OF DOCUMENT:</td>
        <td width="20%" align="left">DATE RECORDED:</td>
        <td width="30%" align="left">DOCUMENT NUMBER / BOOK PAGE</td>
        <td width="30%" align="left">CONSIDERATION</td>
    </tr>
      <tr>
        <td width="20%" align="left">#read_deed_info.data10#</td>
        <td width="20%" align="left">#read_deed_info.data11#</td>
        <td width="30%" align="left"><cfif Len(read_deed_info.data7)>Doc: #read_deed_info.data7# </cfif><cfif Len(read_deed_info.data8)>Book: #read_deed_info.data8# </cfif><cfif Len(read_deed_info.data9)>Page: #read_deed_info.data9# </cfif></td>
        <td width="30%" align="left">#read_deed_info.data16#</td>
    </tr>
 </cfoutput> 
 </cfif>
</table>

<cfoutput>
<table width="800">
    <!--- tr for Address Begin--->
    <tr><td colspan="4"><hr></td></tr>
    <tr><td colspan="2" align="left"><u><strong>LEGAL DESCRIPTION</strong></u></td></tr>
    <tr><td colspan="2">#read_deed_info.notes#</td></tr>
</table>
</cfoutput>

<!--- Main table End--->
<!---Table for Mortgages(s)/ Open deed trust --->
    <!--- tr for Address End--->
	<cfif Mortgage_count.recordcount eq 0>
<table width="800">
    <tr><td colspan="4"><hr></td></tr>
    <tr><td align="left" colspan="4"><u><strong>CURRENT MORTGAGE(S) / DEEDS OF TRUST</strong></u></td></tr>
    <tr><td align="left" colspan="4">No Current Mortgages / Deeds of Trust found</td></tr>
</table>
<cfelse>

	<cfoutput query="Mortgage_count">
<table width="800">
    <tr><td colspan="4"><hr></td></tr>
    <cfif mortgage_count.currentrow eq 1>
	<tr><td align="left" colspan="4"><u><strong>CURRENT MORTGAGE(S) / DEEDS OF TRUST</strong></u></td></tr>
	</cfif>
    <tr>
        <td width="20%">BORROWER:</td>
        <td colspan="3">#Mortgage_count.data2#<br>
         <cfif Len(Mortgage_count.data3)>#Mortgage_count.data3#</cfif></td>
    </tr>
    <tr>
        <td width="20%">LENDER:</td>
        <td colspan="3">#Mortgage_count.data1#</td>
    </tr>
    <tr>
        <td width="20%">TRUSTEE:</td>
        <td colspan="3">#Mortgage_count.data10#</td>
    </tr>
    <tr>
        <td width="20%">DOC TYPE:</td>
        <td colspan="3">Deed of Trust</td>
    </tr>
    <tr><td>&nbsp;</td></tr>
      <tr>
        <td width="20%" align="left">DATE OF DOCUMENT:</td>
        <td width="20%" align="left">DATE RECORDED:</td>
        <td width="30%" align="left">DOCUMENT NUMBER / BOOK PAGE</td>
        <td width="30%" align="left">LOAN AMOUNT</td>
    </tr>
      <tr>
        <td width="20%" align="left">#Mortgage_count.data8#</td>
        <td width="20%" align="left">#Mortgage_count.data9#</td>
        <td width="30%" align="left"><cfif Len(Mortgage_count.data5)>Doc: #Mortgage_count.data5# </cfif><cfif Len(Mortgage_count.data6)>Book: #Mortgage_count.data6# </cfif><cfif Len(Mortgage_count.data7)>Page: #Mortgage_count.data7# </cfif></td>
        <td width="30%" align="left">#Mortgage_count.data4# <cfif Len(Mortgage_count.data15) and Len(Mortgage_count.data16)>#Mortgage_count.data15#/#Mortgage_count.data16#</cfif></td>
    </tr>
<cfif Len(Mortgage_count.comments)>
    <tr>
        <td width="20%"><u><strong>COMMENTS</strong></u>:</td>
        <td colspan="3">#Mortgage_count.comments#</td>
    </tr>
</cfif>
<cfif Len(Mortgage_count.data11)>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td  colspan="4"><u><strong>INFORMATION</strong></u>:
    </tr>
    <tr>
        <td  colspan="4">#Mortgage_count.data11#</td>
    </tr>
</cfif>
<cfif Len(Mortgage_count.data12)>
    <tr>
        <td  colspan="4">#Mortgage_count.data12#</td>
    </tr>
</cfif>
<cfif Len(mortgage_count.data13)>
    <tr><td>&nbsp;</td></tr>

    <tr><td colspan="4" align="left"><u><strong>ASSIGNMENT OF MORTGAGE</strong></u></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td width="20%">ASSIGNEE</td>
        <td colspan="3">#Mortgage_count.data13#</td>
    </tr>
    <tr></tr>
    <tr></tr>
    <tr></tr>

    <tr>
        <td width="20%" align="left">DATE OF DOCUMENT:</td>
        <td width="20%" align="left">DATE RECORDED:</td>
        <td width="30%" align="left">DOCUMENT NUMBER / BOOK PAGE</td>
        <td width="30%" align="left">LOAN AMOUNT</td>
    </tr>
    <tr>
        <td width="20%" align="left"></td>
        <td width="20%" align="left">#Mortgage_count.data17#</td>
        <td width="30%" align="left">#Mortgage_count.data14# <cfif Len(Mortgage_count.data15) and Len(Mortgage_count.data16)>#Mortgage_count.data15#/#Mortgage_count.data16#</cfif></td>
        <td width="30%" align="left"></td>
    </tr>
</cfif>	
	
<cfif Len(mortgage_count.data18)>
    <tr><td>&nbsp;</td></tr>
    <tr><td colspan="4" align="left"><u><strong>ASSIGNMENT OF MORTGAGE</strong></u></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td width="20%">ASSIGNEE</td>
        <td colspan="3">#Mortgage_count.data18#</td>
    </tr>
    <tr></tr>
    <tr></tr>
    <tr></tr>

    <tr>
        <td width="20%" align="left">DATE OF DOCUMENT:</td>
        <td width="20%" align="left">DATE RECORDED:</td>
        <td width="30%" align="left">DOCUMENT NUMBER / BOOK PAGE</td>
        <td width="30%" align="left">LOAN AMOUNT</td>
    </tr>
    <tr>
        <td width="20%" align="left"></td>
        <td width="20%" align="left">#Mortgage_count.data22#</td>
        <td width="30%" align="left">#Mortgage_count.data19# <cfif Len(Mortgage_count.data20) and Len(Mortgage_count.data21)>#Mortgage_count.data20#/#Mortgage_count.data21#</cfif></td>
        <td width="30%" align="left"></td>
    </tr>
</cfif>


<cfif Len(mortgage_count.data23)>
    <tr><td>&nbsp;</td></tr>
    <tr><td colspan="4" align="left"><u><strong>ASSIGNMENT OF MORTGAGE</strong></u></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td width="20%">ASSIGNEE</td>
        <td colspan="3">#Mortgage_count.data23#</td>
    </tr>
    <tr></tr>
    <tr></tr>
    <tr></tr>

    <tr>
        <td width="20%" align="left">DATE OF DOCUMENT:</td>
        <td width="20%" align="left">DATE RECORDED:</td>
        <td width="30%" align="left">DOCUMENT NUMBER / BOOK PAGE</td>
        <td width="30%" align="left">LOAN AMOUNT</td>
    </tr>
    <tr>
        <td width="20%" align="left"></td>
        <td width="20%" align="left">#Mortgage_count.data27#</td>
        <td width="30%" align="left">#Mortgage_count.data24# <cfif Len(Mortgage_count.data25) and Len(Mortgage_count.data26)>#Mortgage_count.data25#/#Mortgage_count.data26#</cfif></td>
        <td width="30%" align="left"></td>
    </tr>
</cfif>


<cfif Len(mortgage_count.data28)>
    <tr><td>&nbsp;</td></tr>
    <tr><td colspan="4" align="left"><u><strong>ASSIGNMENT OF MORTGAGE</strong></u></td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td width="20%">ASSIGNEE</td>
        <td colspan="3">#Mortgage_count.data28#</td>
    </tr>
    <tr></tr>
    <tr></tr>
    <tr></tr>

    <tr>
        <td width="20%" align="left">DATE OF DOCUMENT:</td>
        <td width="20%" align="left">DATE RECORDED:</td>
        <td width="30%" align="left">DOCUMENT NUMBER / BOOK PAGE</td>
        <td width="30%" align="left">LOAN AMOUNT</td>
    </tr>
    <tr>
        <td width="20%" align="left"></td>
        <td width="20%" align="left">#Mortgage_count.data32#</td>
        <td width="30%" align="left">#Mortgage_count.data29# <cfif Len(Mortgage_count.data30) and Len(Mortgage_count.data31)>#Mortgage_count.data30#/#Mortgage_count.data31#</cfif></td>
        <td width="30%" align="left"></td>
    </tr>
</cfif>

</table>
</cfoutput>
</cfif>


	<cfif Judgment_count.recordcount eq 0>
<table width="800">
    <tr><td colspan="4"><hr></td></tr>
    <tr><td align="left" colspan="4"><u><strong>LIENS</strong></u></td></tr>
    <tr><td width="20%">No Liens found</td></tr>
<cfelse>

<cfoutput query="Judgment_count">
<table width="800">
    <tr><td colspan="4"><hr></td></tr>
    <tr><td align="left" colspan="4"><u><strong>LIENS</strong></u></td></tr>
       <tr>
              <td width="34%" >DOC NUMBER: #Judgment_count.data1# <cfif Len(Judgment_count.data2) and Len(Judgment_count.data3)>#Judgment_count.data2#/#Judgment_count.data3#</cfif></td>
              <td width="33%" >FILE DATE: #Judgment_count.data4#</td>
              <td width="33%" >AMOUNT: #Judgment_count.data5#</td>
       </tr>
       <tr>
              <td colspan="3" >CREDITOR: #Judgment_count.data6#</td>
       </tr>
       <tr>
              <td colspan="3" >DEBTOR: #Judgment_count.data7#</td>  
       </tr>  
</table>             
</cfoutput>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM tax_cert_prop
			where prop_id = #rec_id#
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#" NAME="read_title">
			SELECT *
			FROM property
			where prop_id = #rec_id#
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#" NAME="read_company">
			SELECT *
			FROM companies
			where id = #read_title.comp_id#
		</CFQUERY>

<cfoutput>
<table width="800">
<tr><td><hr></td></tr>
<tr><td align="left" ><u><strong>TAX INFORMATION</strong></u></td></tr>
<tr>
<td>TAX ID NUMBER: #read_report.data19#<br>

TAX AMOUNT:  #read_report.data28#<br>
TAX RATE AREA: #read_report.tax_rate_area#<br>
ASSESSED VALUE: #read_report.Tax_Accessed_Value#<br>
ASSESSED YEAR: #read_report.Tax_Accessed_Year#<br>
LAND VALUE: #read_report.Tax_Land_Value#<br>  
TAXES PAID: #read_report.data37#<br> 
TAX YEAR: #read_report.data29#<br>     
DUE DATE(S): #read_report.data30#<br>    
TAX STATUS: #read_report.data31#<br> 
MAILING ADDRESS: #read_report.Tax_Address#<br>    
CITY, STATE, ZIP: #read_report.Tax_city#, #read_report.Tax_state# #read_report.Tax_zip#<br>      
ADDITIONAL INFO (including taxes for city, municipal, school, etc)<br>
#read_report.data34# <br>
</td>
       </tr>
</table>             
</cfoutput>

<cfoutput>
<table width="800">
    <!--- tr for Address Begin--->
    <tr><td><hr></td></tr>
       <tr><td  align="center"><strong>***END OF REPORT***</strong></td></tr>
</table>
</cfoutput>
