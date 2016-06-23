<cfparam name="create_pdf" default=0>
<CFPARAM NAME="a_trigger" DEFAULT="0">
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
	WHERE     (prop_id = #rec_ID#) AND (selectedOrgs3 IS NOT NULL) order by seq_num
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

<CFQUERY datasource="#request.dsn#" NAME="read_vendor_assign">
SELECT *
			FROM Vendor_Tracker_New v, Vendors_STACIE s
			where v.order_id = #url.rec_ID#
			and v.order_type = 'P'
			and v.task = 'Abstract'
			and s.vendor_id = v.vendor_id
			ORDER BY v.assign_date, assign_time desc
</cfquery>

<cfparam name="read_vendor_assign.company" default="">


<cfif #a_trigger# eq 21>
<cfset prop_id = #rec_id#>
<cfinclude template="../includes/sb_prop_report_create_pdf.cfm">

<!---<cfset temp = #fileSys.MoveFromUploadsOverwrite('P-#rec_id#_REPORT.pdf')#>--->


<cfif Len(read_title.LOGSTransactionID)>

<cfsetting enableCFoutputOnly = "yes">
<cfinvoke	component = "cfc.LOGS"	method = "sendPropReportProduct" order_id="#rec_ID#" filename="P-#rec_id#_REPORT.pdf">
<cfsetting enableCFoutputOnly = "no">

<cfelse>


<!--- if this is S&B OTHER (company ID 6415) - then use different emails depending on the state ---> 
<cfquery name="get_file1" datasource="#request.dsn#">
SELECT abstractor_doc_upload
FROM  doc_abstract_prop
WHERE prop_id = #prop_ID#
</CFQUERY>
<cfquery name="get_updates" datasource="#request.dsn#">
SELECT *
FROM  abstractor_uploads
WHERE order_id = #prop_ID#
</CFQUERY>


<CFMAIL
TO="#email#"
bcc="rick@jermain.com"
FROM="vendormgr@streamline-title.com"
SERVER="127.0.0.1"
Subject="Streamline Title - Property Report for Property Order 0232#rec_id# - #read_title.bfirstname1# #read_title.blastname1#"
TIMEOUT="600"
type="HTML"
>


<cfset totalkb = 0>
<cfif Len(fileSys.FindFilePath('#new_prop_file_name#', 'file'))>
<cfset this_file = GetFileInfo(fileSys.FindFilePath('#new_prop_file_name#', 'file'))>
<cfset totalkb = totalkb + this_file.size>
</cfif>
<cfif Len(fileSys.FindFilePath('P-#rec_id#_INVOICE.PDF', 'file'))>
<cfset this_file = GetFileInfo(fileSys.FindFilePath('P-#rec_id#_INVOICE.PDF', 'file'))>
<cfset totalkb = totalkb + this_file.size>
</cfif>
<cfif Len(fileSys.FindFilePath('#get_file1.abstractor_doc_upload#', 'file'))>
<cfset this_file = GetFileInfo(fileSys.FindFilePath('#get_file1.abstractor_doc_upload#', 'file'))>
<cfset totalkb = totalkb + this_file.size>
</cfif>

<cfoutput>

<cfif totalkb GT 9500000>

Follow these links to download your files.
(Click to open, right-click to save)<br>
<br>
<cfif Len(fileSys.FindFilePath('#new_prop_file_name#', 'file'))>
<cfset new_url = fileSys.FindFilePath('#new_prop_file_name#', 'url')>
<cfset new_url = ReplaceNoCase(new_url, "\", "/", "ALL")>
<cfset new_url = ReplaceNoCase(new_url, "http:", "https:", "ALL")>
Property Report<BR>
<a href="#new_url#" target="new">#new_prop_file_name#</a><br>
<br>
</cfif>

<cfif Len(fileSys.FindFilePath('P-#rec_id#_INVOICE.PDF', 'file'))>
<cfset new_url = fileSys.FindFilePath('P-#rec_id#_INVOICE.PDF', 'url')>
<cfset new_url = ReplaceNoCase(new_url, "\", "/", "ALL")>
<cfset new_url = ReplaceNoCase(new_url, "http:", "https:", "ALL")>
Invoice<BR>
<a href="#new_url#" target="new">P-#rec_id#_INVOICE.PDF</a><br>
<br>
</cfif>

<cfif Len(fileSys.FindFilePath('#get_file1.abstractor_doc_upload#', 'file'))>
<cfset new_url = fileSys.FindFilePath('#get_file1.abstractor_doc_upload#', 'url')>
<cfset new_url = ReplaceNoCase(new_url, "\", "/", "ALL")>
<cfset new_url = ReplaceNoCase(new_url, "http:", "https:", "ALL")>
Original Search<BR>
<a href="#new_url#" target="new">#get_file1.abstractor_doc_upload#</a><br>
<br>
</cfif>


<cfelse>
Your files have been included as attachments to this email.
(Click to open, right-click to save)<br>
<br>
<cfif Len(fileSys.FindFilePath('#new_prop_file_name#', 'file'))>
<cfset temp = #fileSys.FindFilePath('#new_prop_file_name#', 'file')#>
<cfmailparam
file="#temp#"
disposition="attachment; filename=""#new_prop_file_name#""">
</cfif>
<cfif Len(fileSys.FindFilePath('P-#rec_id#_INVOICE.PDF', 'file'))>
<cfset temp = #fileSys.FindFilePath('P-#rec_id#_INVOICE.PDF', 'file')#>
<cfmailparam
file="#temp#"
disposition="attachment; filename=""P-#rec_id#_INVOICE.PDF""">
</cfif>
<cfif Len(fileSys.FindFilePath('#get_file1.abstractor_doc_upload#', 'file'))>
<cfset temp = #fileSys.FindFilePath('#get_file1.abstractor_doc_upload#', 'file')#>
<cfmailparam
file="#temp#"
disposition="attachment; filename=""#get_file1.abstractor_doc_upload#""">
</cfif>


</cfif>

<!--- <cfif Len(fileSys.FindFilePath('P-#rec_id#_REPORT.PDF', 'file'))>
<cfset temp = #fileSys.FindFilePath('P-#rec_id#_REPORT.PDF', 'file')#>
<cfmailparam
file="#temp#"
disposition="attachment; filename=""P-#rec_id#_REPORT.PDF""">
</cfif>

<cfif Len(fileSys.FindFilePath('P-#rec_id#_INVOICE.PDF', 'file'))>
<cfset temp = #fileSys.FindFilePath('P-#rec_id#_INVOICE.PDF', 'file')#>
<cfmailparam
file="#temp#"
disposition="attachment; filename=""P-#rec_id#_INVOICE.PDF""">
</cfif>

<cfif Len(fileSys.FindFilePath('#get_file1.abstractor_doc_upload#', 'file'))>
<cfset temp = #fileSys.FindFilePath('#get_file1.abstractor_doc_upload#', 'file')#>
<cfmailparam
file="#temp#"
disposition="attachment; filename=""#get_file1.abstractor_doc_upload#""">
</cfif> --->




The Property Report has been completed for order number #rec_id#, and is included as a link in this email.<br>
<br>
The original Search: '#get_file1.abstractor_doc_upload#' has also been linked:<br>
<!--- <A HREF="#fileSys.FindFilePath('#get_file1.abstractor_doc_upload#', 'url', 'st')#" target="new">#get_file1.abstractor_doc_upload#</a><BR> --->
<br>
<cfif get_updates.recordcount>
Additional Updates to the Search are available here:<Br>


<cfloop query="get_updates">
<cfif Len(fileSys.FindFilePath('#get_updates.filename#', 'file'))>
<cfset new_url = fileSys.FindFilePath('#get_updates.filename#', 'url')>
<cfset new_url = ReplaceNoCase(new_url, "\", "/", "ALL")>
<cfset new_url = ReplaceNoCase(new_url, "http:", "https:", "ALL")>
Original Search<BR>
<a href="#new_url#" target="new">#get_updates.filename#</a><br>
<br>
</cfif>
</cfloop>
</cfif>

</cfoutput>

Thank you,<br><br>

Streamline Title staff

<!--- 
<cfif Len(fileSys.FindFilePath('P-#rec_id#_REPORT.PDF', 'file'))>
<cfset temp = #fileSys.FindFilePath('P-#rec_id#_REPORT.PDF', 'file')#>
<cfmailparam 
file="#temp#" 
disposition="attachment; filename=""P-#rec_id#_REPORT.PDF""">
</cfif>


Property Report for order 0232#rec_id# - #read_title.bfirstname1# #read_title.blastname1#</B></font><br><br>

Attachment included.

Streamline Title staff --->
</cfmail>
</cfif>
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
<table width="100%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
<cfoutput>
<FORM action="./Prop_report_sb_submit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#company_ID#&a_trigger=7"  ENCTYPE="multipart/form-data" method="post">
</cfoutput>
<tr>
<td width="100%" align=center valign=top bgcolor=yellow>
			<b><font face=verdana size=3 color=red>Click this button to complete </font></b><INPUT TYPE=IMAGE SRC="./images/button_mark_as_sent.gif" border=0>
</td>	</tr>
</form>
</table>
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

 <p><a href="#" onclick=printWindow();><input type="button" value="Print the page"
 onclick="factory.printing.Print(true)"></a>
<!---adding email section Harry 11/8/04  , g.rid 07/12/05 N disabled print & disabled mail --->
<cfFORM NAME="Search" METHOD="Post" ACTION="./property_report_sb_submit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=21&company_ID=#read_Title.comp_id#">
  <FONT FACE=ARIAL SIZE=2 color="black">Enter email to send </font><input  type=text name="email" size=20 maxlength=100
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
								> <input type="image" src="./images/button_submit.gif" border=0 alt="send email">
</cfFORM> <cfif #a_trigger# eq 21><FONT FACE=ARIAL SIZE=2 color="blue">Email sent</cfif></NOBR>
<!---end--->
  <hr size="1" color="dimgray">

</div>
<IE:DEVICERECT ID="page1" CLASS="masterstyle" MEDIA="print">
<cfoutput>
<table with=800 align=left>


<tr>
<td align=Center class="larger"><i>STREAMLINE TITLE & ESCROW, INC.<br>
7361 CALHOUN PLACE, SUITE 200<br>
ROCKVILLE MD 20855<br>
301-279-0303</i><br><br><br></td>
</tr>


<cfif check_if_update.product_ordered eq 'bring_to_date'>
<tr>
<td align=Center class="largerstill"><strong>UPDATE</strong><br><br></td>
</tr>
<cfelse>
<tr>
<td align=Center class="largerstill"><strong>NEW SEARCH</strong><br><br></td>
</tr>
</cfif>

<tr>
<td align=left><strong>FILE NO</strong>: #read_title.prop_id#<br><br>

<strong>S&B FILE NO</strong>: #read_title.loan_number#</td>
<td align=right><nobr><strong>ORIG BY</strong>: #read_vendor_assign.company#</nobr><br><br>
</td>
</tr>
<cfquery name="getMaxSearchDate" dbType="query">
	select max(search_date) as maxsearchdate
	from read_deed_info
</cfquery>
<tr>
<td align=left><strong><span class="larger"><!--- TYPE OF SEARCH REQUESTED</span></strong>: <cfif read_title.search_Type eq 'A'>Current Owner<cfelseif read_title.search_Type eq 'B'>Full Search<cfelse>#read_title.search_Type#</cfif> ---><br><br>

SEARCH DATE: #DateFormat(getMaxSearchDate.maxsearchdate, "mm/dd/yyyy")#<br><br></td>
</tr>
<tr>
<td align=left><strong><span class="larger"><em>EFFECTIVE DATE</em></span></strong>: #DateFormat(read_Title_update.data37, "mm/dd/yyyy")#<br><br></td>
</tr>

<tr>
<td align=left><strong><em>PRESENT OWNER</em></strong>: <br>
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
<td align=left><strong><span class="larger">TRUSTS</strong>: #Mortgage_count.recordcount#</span><br><br></td>
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
<td align=left><strong>Trust ###trust_number#: <cfif all_trusts.subject_trust eq 1>Subject Trust, </cfif>DB/INSTRUMENT##</strong>: <cfif all_trusts.data5 neq '' and all_trusts.data5 neq 'NULL'> #all_trusts.data5#</cfif> <cfif all_trusts.data6 neq '' and all_trusts.data6 neq 'NULL'> #all_trusts.data6#</cfif><cfif all_trusts.data7 neq '' and all_trusts.data7 neq 'NULL'>-#all_trusts.data7#</cfif>  DATED #Dateformat(all_trusts.data8, "m/d/yyyy")# FROM #all_trusts.data2#<cfif all_trusts.data3 neq '' and all_trusts.data3 neq 'NULL'> and #all_trusts.data3#</cfif> TO #all_trusts.data1# SECURING #all_trusts.data4#. RECORDED #Dateformat(all_trusts.data9, "m/d/yyyy")#. #all_trusts.data11#  #all_trusts.addreq# #all_trusts.addex# #all_trusts.comments# <BR>
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
<td align=left>###judgment_count.seq_num# #judgment_count.data8#<br><br>
</td>
</tr>

</cfoutput>

<cfoutput>
<tr>
<td align=left><strong><span class="larger">Property Address</strong>: </span>#Read_Title.paddress#, #Read_Title.pcity#, #Read_Title.pcounty#, #Read_Title.pstate# #Read_Title.pzip#<br><br></td>
</tr>


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
<table width=800 align=left>
<tr>
<td align=Center class="larger" colspan=2><i>STREAMLINE TITLE & ESCROW, INC.<br>
7361 CALHOUN PLACE, SUITE 200<br>
ROCKVILLE MD 20855<br>
301-279-0303</i><br><br><br></td>
</tr>

<tr>
<td align=left><strong>FILE NO</strong>: #read_title.prop_id#<br>
<strong>S&B FILE NO</strong>: #read_title.loan_number#</td>
<td align=right><nobr><strong>ORIG BY</strong>: #read_vendor_assign.company#</nobr><br></td>
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
