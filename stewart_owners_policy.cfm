<CFQUERY datasource="#request.dsn#" name="check_shapiro">
Select child_ids from companies where ID = 2368 or ID = 3011 or ID = 2372
</CFQUERY>
<cfset children = check_shapiro.child_ids>
<cfloop query="check_shapiro" startrow="2">
<cfif check_shapiro.child_ids neq "" and check_shapiro.child_ids neq 'NULL'>
<cfset children = children & "," & "#check_shapiro.child_ids#">
</cfif>
</cfloop>

<CFQUERY datasource="#request.dsn#" NAME="read_data2">
			SELECT *
			FROM hud_form_title_pg2
			WHERE Title_ID = #rec_id#
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_title_update">
            select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs
            is not null </cfquery>

<CFQUERY datasource="#request.dsn#" NAME="read_deeds">
SELECT     *
FROM         title_ins_view
WHERE     (type = 'DATA') AND (title_id = #url.rec_ID#)
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="read_title_data">
        select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs
        is not null
        </cfquery>


<CFPARAM NAME="a_trigger" DEFAULT="0">
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

<CFQUERY datasource="#request.dsn#" NAME="read_morts">
    SELECT *
	FROM owner_policy_morts
	WHERE Title_ID = #rec_ID#
</CFQUERY>



<CFQUERY datasource="#request.dsn#" NAME="read_FT_company">
    SELECT *
	FROM Companies
	WHERE ID = #read_Title.comp_id#
</CFQUERY>



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
P {page-break-after:always;}
TD {font-family:"Times New Roman", Times, serif; font-size:11pt;}

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
 <b>Please use the print button below to print this page (automatic setting included)</b><BR>
 <span style="font-size:12px; font-family:Arial, Helvetica, sans-serif; color:red">If the buttons below are 'grayed-out', please click <a href="https://www.firsttitleservices.com/smsx.exe">HERE</a> to download and install ScriptX, this will allow you to print the HUD-1 and the Title Commitment</span>

<a href="#" onclick=printWindow();><input disabled type="button" value="Print the page"
 onclick="factory.printing.Print(true)"></a><br>
<br>
<br>
<a href="#"><cfoutput><input disabled type="button" value="Modify Form" onclick="window.location='stewart_owners_policy_modify.cfm?uid=#session.ft_user_id#&al=1&rec_id=#url.rec_id#&a_trigger=0&company_id=0';"></cfoutput></a>

</NOBR>

 <hr size="1" color="dimgray">

</div>





<P>
<IE:DEVICERECT ID="Page1" CLASS="masterstyle" MEDIA="print">

<!----1st page starts ----->
<!----------body table starts---------->
<!--- <table width=98% cellpadding=0 cellspacing=0 border=2 align="center" bordercolor="000000" bordercolordark="000000" bordercolorlight="000000">
<tr><td valign="top" align="center">
====================================================================== --->

<table width="93%" cellpadding=0 cellspacing=0 border=0 >
	<tr>
		<td align="left"><div align="center"><br>
<br>
<br>
<font size="+2"><strong>ALTA Owner's Policy 2006</strong></font><br>
<br>
<strong>OWNER'S POLICY OF TITLE INSURANCE<br>
<br>
Issued by<br>
<br>
<font size="+1">STEWART TITLE GUARANTY COMPANY</font><br>
<br>
SCHEDULE A</strong></div><br>
<br>
<br>
<cfoutput>
File No.: <strong>T-#rec_id#</strong> &nbsp;&nbsp;&nbsp; Policy No.: <strong><cfif #read_title.policy_number# neq "" and #read_title.policy_number# neq 'NULL'>#read_title.policy_number#</cfif></strong><br><br>
Simultaneous Number: <strong><cfif #read_title.simultaneous_number# neq "" and #read_title.simultaneous_number# neq 'NULL'>#read_title.simultaneous_number#</cfif></strong> &nbsp;&nbsp;&nbsp; Loan Number: <strong><cfif #read_title.loan_number_override# neq "" and #read_title.loan_number_override# neq 'NULL'>#read_title.loan_number_override#<cfelse><cfif #read_title.loan_number# neq "" and #read_title.loan_number# neq 'NULL'>#read_title.loan_number#</cfif></cfif></strong></strong><br><br>
Address Reference: <strong><cfif #read_title.paddress_override# neq "" and #read_title.paddress_override# neq 'NULL'>#read_title.paddress_override#<cfelse>#read_title.paddress#, #read_title.pcity#, #read_title.pstate# #read_title.pzip#</cfif></strong><br><br>
Amount of Insurance: $<strong><cfif #read_title.ins_amount_override# neq "" and #read_title.ins_amount_override# neq 'NULL'><cfif IsNumeric(read_title.ins_amount_override)>#NumberFormat(read_title.ins_amount_override,
              "999,999,999.00")#<cfelse>#read_title.ins_amount_override#</cfif><cfelse><cfif IsNumeric(Trim(read_title.purchase)) and #read_title.purchase# neq "" and #read_title.purchase# neq 0 and #read_title.purchase# neq 'NULL'><cfif IsNumeric(read_title.Purchase)>#NumberFormat(read_title.Purchase,
              "999,999,999.00")#<cfelse>#read_title.Purchase#</cfif><cfelse>TBD</cfif></cfif></strong> &nbsp;&nbsp;&nbsp; Premium: $<strong><cfif #read_title.premium_override# neq "" and #read_title.premium_override# neq 'NULL'><cfif IsNumeric(read_title.premium_override)>#NumberFormat(read_title.premium_override,
              "999,999,999.00")#<cfelse>#read_title.premium_override#</cfif><cfelse><cfif isnumeric(read_data2.a_1108_a)>#NumberFormat(read_data2.a_1108_a, "__,___.__")#<cfelse>#read_data2.a_1108_a#</cfif></cfif></strong><br><br>
Date of Policy: <strong><cfif #read_title.policy_date_override# neq "" and #read_title.policy_date_override# neq 'NULL'>#read_title.policy_date_override#<cfelse><CFIF #read_title_update.recordcount# GT 0 and #read_title_update.data1# neq "">
				#DateFormat(read_title_update.data37, "mm")#/#DateFormat(read_title_update.data37, "dd")#/#DateFormat(read_title_update.data37, "yyyy")#</cfif></cfif></strong><br><br>
<br><br>
1. Name of Insured:<br><br>
<strong><cfif #read_title.ins_name_override# neq "" and #read_title.ins_name_override# neq 'NULL'>#read_title.ins_name_override#<cfelse>#Buyer_1#, &nbsp;&nbsp;#Buyer_2#</cfif></strong><br><br>
2. The estate or interest in the Land that is insured by this policy is:<br><br>
<strong><cfif #read_title.interest_override# neq "" and #read_title.interest_override# neq 'NULL'>#read_title.interest_override#<cfelse><CFIF #read_title_update.recordcount# GT 0 and #read_title_update.data38# neq "">
				#read_title_update.data38#</cfif></cfif></strong><br><br>
3. Title Vested in:<br><br>
<strong><cfif #read_title.vested_override# neq "" and #read_title.vested_override# neq 'NULL'>#read_title.vested_override#<cfelse>#Buyer_1#, &nbsp;&nbsp;#Buyer_2#</cfif></strong><br><br>
4. The Land referred to in this policy is described as follows:<br><br>
See attached Legal Description<br><br>
TAX ID NUMBER: <strong><cfif #read_title.tax_id_override# neq "" and #read_title.tax_id_override# neq 'NULL'>#read_title.tax_id_override#<cfelse><cfif #read_tax.acctnum# neq "" and #read_tax.acctnum# neq 'NULL'>#read_tax.acctnum#</cfif></cfif>
</strong><br><br>
<table>
<tr>
<td width="60%" align="left" valign="top"><strong>Stewart Title Guaranty Company</strong><br>
<br>
<br>
<br>
______________________________<br>
<strong>Countersigned Authorized Signature</strong>
</td>
<td width="40%" align="left" valign="top"><strong>Dated this <cfif #read_title.policy_date_override# neq "" and #read_title.policy_date_override# neq 'NULL'>#DateFormat(read_title.policy_date_override, "dd")#<cfelse><CFIF #read_title_update.recordcount# GT 0 and #read_title_update.data1# neq "">#DateFormat(read_title_update.data37, "dd")#</cfif></cfif> Day of <cfif #read_title.policy_date_override# neq "" and #read_title.policy_date_override# neq 'NULL'>#DateFormat(read_title.policy_date_override, "mmmm")#<cfelse><CFIF #read_title_update.recordcount# GT 0 and #read_title_update.data1# neq "">#DateFormat(read_title_update.data37, "mmmm")#</cfif></cfif>, <cfif #read_title.policy_date_override# neq "" and #read_title.policy_date_override# neq 'NULL'>#DateFormat(read_title.policy_date_override, "yyyy")#<cfelse><CFIF #read_title_update.recordcount# GT 0 and #read_title_update.data1# neq "">#DateFormat(read_title_update.data37, "yyyy")#</cfif></cfif><br>
Issued by:<br>
<cfif read_FT_company.streamline_client eq 1>Streamline Title<cfelse>First Title</cfif>
 & Escrow, Inc.<br>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
30 West Gude Drive, Suite 450<br>
Rockville, MD 20850</strong><br>
<cfelse>
7361 Calhoun Place, Suite 200<br>
Rockville, MD 20855</strong><br>
</cfif>

</td>
</tr>
</table>
<br><br>
</cfoutput>
</td>
	</tr>
</table>
<!--- ====================================================================== --->
<!--- =================[ END OF SCHEDULE A         ]======================== --->
<!--- ====================================================================== --->
</IE:DEVICERECT>







<P>
<IE:DEVICERECT ID="Page1" CLASS="masterstyle" MEDIA="print">

<!----2nd page starts ----->
<!----------body table starts---------->
<!--- <table width=98% cellpadding=0 cellspacing=0 border=2 align="center" bordercolor="000000" bordercolordark="000000" bordercolorlight="000000">
<tr><td valign="top" align="center">
====================================================================== --->

<table width="93%" cellpadding=0 cellspacing=0 border=0 >
	<tr>
		<td align="left"><div align="center"><br>
<br>
<br>
<strong>SCHEDULE B</strong><br>
<br>
<br>
<cfoutput>
File No.: <strong>T-#rec_id#</strong> &nbsp;&nbsp;&nbsp; Policy No.: <strong><cfif #read_title.policy_number# neq "" and #read_title.policy_number# neq 'NULL'>#read_title.policy_number#</cfif></strong><br><br><br>
</div>
</cfoutput>

<!--- <CFQUERY datasource="#request.dsn#" NAME="read_mortgage">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 1
			</cfquery>
<cfif read_mortgage.recordcount>
<cfoutput query = "read_mortgage">
1st Deed of Trust dated #DateFormat(read_mortgage.data8, "mm")#/#DateFormat(read_mortgage.data8, "dd")#/#DateFormat(read_mortgage.data8, "yyyy")# from #read_mortgage.data2# <cfif #read_mortgage.data3# neq ""> and #read_mortgage.data3#</cfif> to #read_mortgage.data1#, in the original principal sum of $#read_mortgage.data4# and recorded #DateFormat(read_mortgage.data9, "mm")#/#DateFormat(read_mortgage.data9, "dd")#/#DateFormat(read_mortgage.data9, "yyyy")# in the Land Records of #read_title.pcounty#, <cfif #read_mortgage.data24# eq ""> in Book #read_mortgage.data25#, at Page #read_mortgage.data26# <cfelse> Instrument No.:  #read_mortgage.data24#</cfif>
</cfoutput><br>
<br>
</cfif>



<CFQUERY datasource="#request.dsn#" NAME="read_mortgage2">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 2
			</cfquery>
<cfif read_mortgage2.recordcount>
<cfoutput query = "read_mortgage2">
1st Deed of Trust dated #DateFormat(read_mortgage2.data8, "mm")#/#DateFormat(read_mortgage2.data8, "dd")#/#DateFormat(read_mortgage2.data8, "yyyy")# from #read_mortgage2.data2# <cfif #read_mortgage2.data3# neq ""> and #read_mortgage2.data3#</cfif> to #read_mortgage2.data1#, in the original principal sum of $#read_mortgage2.data4# and recorded #DateFormat(read_mortgage2.data9, "mm")#/#DateFormat(read_mortgage2.data9, "dd")#/#DateFormat(read_mortgage2.data9, "yyyy")# in the Land Records of #read_title.pcounty#, <cfif #read_mortgage2.data24# eq ""> in Book #read_mortgage2.data25#, at Page #read_mortgage2.data26# <cfelse> Instrument No.:  #read_mortgage2.data24#</cfif>
</cfoutput><br>
<br>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_mortgage3">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 3
			</cfquery>
<cfif read_mortgage3.recordcount>
<cfoutput query = "read_mortgage3">
1st Deed of Trust dated #DateFormat(read_mortgage3.data8, "mm")#/#DateFormat(read_mortgage3.data8, "dd")#/#DateFormat(read_mortgage3.data8, "yyyy")# from #read_mortgage3.data2# <cfif #read_mortgage3.data3# neq ""> and #read_mortgage3.data3#</cfif> to #read_mortgage3.data1#, in the original principal sum of $#read_mortgage3.data4# and recorded #DateFormat(read_mortgage3.data9, "mm")#/#DateFormat(read_mortgage3.data9, "dd")#/#DateFormat(read_mortgage3.data9, "yyyy")# in the Land Records of #read_title.pcounty#, <cfif #read_mortgage3.data24# eq ""> in Book #read_mortgage3.data25#, at Page #read_mortgage3.data26# <cfelse> Instrument No.:  #read_mortgage3.data24#</cfif>
</cfoutput><br>
<br>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_mortgage4">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 4
			</cfquery>
<cfif read_mortgage4.recordcount>
<cfoutput query = "read_mortgage4">
1st Deed of Trust dated #DateFormat(read_mortgage4.data8, "mm")#/#DateFormat(read_mortgage4.data8, "dd")#/#DateFormat(read_mortgage4.data8, "yyyy")# from #read_mortgage4.data2# <cfif #read_mortgage4.data3# neq ""> and #read_mortgage4.data3#</cfif> to #read_mortgage4.data1#, in the original principal sum of $#read_mortgage4.data4# and recorded #DateFormat(read_mortgage4.data9, "mm")#/#DateFormat(read_mortgage4.data9, "dd")#/#DateFormat(read_mortgage4.data9, "yyyy")# in the Land Records of #read_title.pcounty#, <cfif #read_mortgage4.data24# eq ""> in Book #read_mortgage4.data25#, at Page #read_mortgage4.data26# <cfelse> Instrument No.:  #read_mortgage4.data24#</cfif>
</cfoutput><br>
<br>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_mortgage5">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 5
			</cfquery>
<cfif read_mortgage5.recordcount>
<cfoutput query = "read_mortgage5">
1st Deed of Trust dated #DateFormat(read_mortgage5.data8, "mm")#/#DateFormat(read_mortgage5.data8, "dd")#/#DateFormat(read_mortgage5.data8, "yyyy")# from #read_mortgage5.data2# <cfif #read_mortgage5.data3# neq ""> and #read_mortgage5.data3#</cfif> to #read_mortgage5.data1#, in the original principal sum of $#read_mortgage5.data4# and recorded #DateFormat(read_mortgage5.data9, "mm")#/#DateFormat(read_mortgage5.data9, "dd")#/#DateFormat(read_mortgage5.data9, "yyyy")# in the Land Records of #read_title.pcounty#, <cfif #read_mortgage5.data24# eq ""> in Book #read_mortgage5.data25#, at Page #read_mortgage5.data26# <cfelse> Instrument No.:  #read_mortgage5.data24#</cfif>
</cfoutput><br>
<br>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_mortgage6">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 6
			</cfquery>
<cfif read_mortgage6.recordcount>
<cfoutput query = "read_mortgage6">
1st Deed of Trust dated #DateFormat(read_mortgage6.data8, "mm")#/#DateFormat(read_mortgage6.data8, "dd")#/#DateFormat(read_mortgage6.data8, "yyyy")# from #read_mortgage6.data2# <cfif #read_mortgage6.data3# neq ""> and #read_mortgage6.data3#</cfif> to #read_mortgage6.data1#, in the original principal sum of $#read_mortgage6.data4# and recorded #DateFormat(read_mortgage6.data9, "mm")#/#DateFormat(read_mortgage6.data9, "dd")#/#DateFormat(read_mortgage6.data9, "yyyy")# in the Land Records of #read_title.pcounty#, <cfif #read_mortgage6.data24# eq ""> in Book #read_mortgage6.data25#, at Page #read_mortgage6.data26# <cfelse> Instrument No.:  #read_mortgage6.data24#</cfif>
</cfoutput><br>
<br>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_mortgage7">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 7
			</cfquery>
<cfif read_mortgage7.recordcount>
<cfoutput query = "read_mortgage7">
1st Deed of Trust dated #DateFormat(read_mortgage7.data8, "mm")#/#DateFormat(read_mortgage7.data8, "dd")#/#DateFormat(read_mortgage7.data8, "yyyy")# from #read_mortgage7.data2# <cfif #read_mortgage7.data3# neq ""> and #read_mortgage7.data3#</cfif> to #read_mortgage7.data1#, in the original principal sum of $#read_mortgage7.data4# and recorded #DateFormat(read_mortgage7.data9, "mm")#/#DateFormat(read_mortgage7.data9, "dd")#/#DateFormat(read_mortgage7.data9, "yyyy")# in the Land Records of #read_title.pcounty#, <cfif #read_mortgage7.data24# eq ""> in Book #read_mortgage7.data25#, at Page #read_mortgage7.data26# <cfelse> Instrument No.:  #read_mortgage7.data24#</cfif>
</cfoutput><br>
<br>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_mortgage8">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 8
			</cfquery>
<cfif read_mortgage8.recordcount>
<cfoutput query = "read_mortgage8">
1st Deed of Trust dated #DateFormat(read_mortgage8.data8, "mm")#/#DateFormat(read_mortgage8.data8, "dd")#/#DateFormat(read_mortgage8.data8, "yyyy")# from #read_mortgage8.data2# <cfif #read_mortgage8.data3# neq ""> and #read_mortgage8.data3#</cfif> to #read_mortgage8.data1#, in the original principal sum of $#read_mortgage8.data4# and recorded #DateFormat(read_mortgage8.data9, "mm")#/#DateFormat(read_mortgage8.data9, "dd")#/#DateFormat(read_mortgage8.data9, "yyyy")# in the Land Records of #read_title.pcounty#, <cfif #read_mortgage8.data24# eq ""> in Book #read_mortgage8.data25#, at Page #read_mortgage8.data26# <cfelse> Instrument No.:  #read_mortgage8.data24#</cfif>
</cfoutput><br>
<br>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_mortgage9">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 9
			</cfquery>
<cfif read_mortgage9.recordcount>
<cfoutput query = "read_mortgage9">
1st Deed of Trust dated #DateFormat(read_mortgage9.data8, "mm")#/#DateFormat(read_mortgage9.data8, "dd")#/#DateFormat(read_mortgage9.data8, "yyyy")# from #read_mortgage9.data2# <cfif #read_mortgage9.data3# neq ""> and #read_mortgage9.data3#</cfif> to #read_mortgage9.data1#, in the original principal sum of $#read_mortgage9.data4# and recorded #DateFormat(read_mortgage9.data9, "mm")#/#DateFormat(read_mortgage9.data9, "dd")#/#DateFormat(read_mortgage9.data9, "yyyy")# in the Land Records of #read_title.pcounty#, <cfif #read_mortgage9.data24# eq ""> in Book #read_mortgage9.data25#, at Page #read_mortgage9.data26# <cfelse> Instrument No.:  #read_mortgage9.data24#</cfif>
</cfoutput><br>
<br>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_mortgage10">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 10
			</cfquery>
<cfif read_mortgage10.recordcount>
<cfoutput query = "read_mortgage10">
1st Deed of Trust dated #DateFormat(read_mortgage10.data8, "mm")#/#DateFormat(read_mortgage10.data8, "dd")#/#DateFormat(read_mortgage10.data8, "yyyy")# from #read_mortgage10.data2# <cfif #read_mortgage10.data3# neq ""> and #read_mortgage10.data3#</cfif> to #read_mortgage10.data1#, in the original principal sum of $#read_mortgage10.data4# and recorded #DateFormat(read_mortgage10.data9, "mm")#/#DateFormat(read_mortgage10.data9, "dd")#/#DateFormat(read_mortgage10.data9, "yyyy")# in the Land Records of #read_title.pcounty#, <cfif #read_mortgage10.data24# eq ""> in Book #read_mortgage10.data25#, at Page #read_mortgage10.data26# <cfelse> Instrument No.:  #read_mortgage10.data24#</cfif>
</cfoutput><br>
<br>
</cfif>

 --->




<div align="center">EXCEPTIONS FROM COVERAGE</div><br>
<br>
<table width="93%" cellpadding=0 cellspacing=0 border=0 >
        <tr>
		  <td width="5%" valign="top">1.</td>
		<td>Property Taxes, which are a lien not yet due and payable, including any assessments collected with taxes to be levied for the fiscal year <cfoutput><cfset current_year = #DateFormat(Now(), "YYYY")#><cfset last_year = #current_year# - 1>#last_year#-#current_Year#</cfoutput>, including increases occasioned by retroactive revaluation, changes in land usage or loss of any homestead exemption status for the insured premises.</td>
	</tr>

<cfoutput><cfif read_morts.recordcount and #read_morts.mort1_1# NEQ "">
		  <tr><td>&nbsp;</td></tr>
		  <tr align="left" valign="top">
            <td>2.</td>
			<td>
<cfif #read_morts.mort1_1# NEQ ""> <cfif read_morts.lienintro1 neq "" and read_morts.lienintro1 neq 'NULL' or Len(read_morts.lienintro1) eq 0>#read_morts.lienintro1#<cfelse>Satisfaction and/or release of</cfif> Mortgage from #read_morts.mort1_2# <cfif #read_morts.mort1_3# neq ""> and #read_morts.mort1_3#</cfif> securing #read_morts.mort1_1# in the original principal amount of #read_morts.amt1#, as dated #read_morts.INST_MON1#/#read_morts.INST_DAY1#/#read_morts.INST_YEAR1# and recorded on #read_morts.rec_mon1#/#read_morts.rec_day1#/#read_morts.rec_year1# among the Land Records of #read_title.pcounty# County, <cfif #read_morts.docnum1# eq ""><cfif #read_morts.book1# neq "">in Book #read_morts.book1# at Page #read_morts.page1# </cfif><cfelse> in Document Number #read_morts.docnum1# </cfif><cfif #read_morts.ass1_1# neq ""> Assigned to #read_morts.ass1_1# recorded on #read_morts.rec_mon1_1#/#read_morts.rec_day1_1#/#read_morts.rec_year1_1#, in Book <cfif #read_morts.doc_num1_1# eq "">#read_morts.book1_1#, at Page #read_morts.page1_1# <cfelse> in Document #read_morts.doc_num1_1#</cfif> </cfif><cfif #read_morts.ass1_2# neq "">Assigned to #read_morts.ass1_2# recorded on #read_morts.rec_mon1_2#/#read_morts.rec_day1_2#/#read_morts.rec_year1_2#, <cfif #read_morts.doc_num1_2# eq "">in Book #read_morts.book1_2#, at Page #read_morts.page1_2# <cfelse> in Document #read_morts.doc_num1_2#</cfif> </cfif><cfif #read_morts.ass1_3# neq "">Assigned to #read_morts.ass1_3# recorded on #read_morts.rec_mon1_3#/#read_morts.rec_day1_3#/#read_morts.rec_year1_3#, <cfif #read_morts.doc_num1_3# eq ""> in Book #read_morts.book1_3#, at Page #read_morts.page1_3# <cfelse> in Document #read_morts.doc_num1_3#</cfif> </cfif><cfif #read_morts.ass1_4# neq "">Assigned to #read_morts.ass1_4# recorded on #read_morts.rec_mon1_4#/#read_morts.rec_day1_4#/#read_morts.rec_year1_4#, <cfif #read_morts.doc_num1_4# EQ ""> in Book #read_morts.book1_4#, at Page #read_morts.page1_4# <cfelse> in Document #read_morts.doc_num1_3#</cfif> </cfif><cfif #read_morts.info1_1# neq "">#read_morts.info1_1#</cfif> <cfif #read_morts.info1_2# neq "">#read_morts.info1_2#</cfif></cfif></td></tr>
</cfif>



<cfif read_morts.recordcount and #read_morts.mort2_1# NEQ "">
		  <tr><td>&nbsp;</td></tr>
		  <tr align="left" valign="top">
            <td>2.</td>
			<td>
<cfif #read_morts.mort2_1# NEQ ""> <cfif read_morts.lienintro2 neq "" and read_morts.lienintro2 neq 'NULL'>#read_morts.lienintro2#<cfelse>Satisfaction and/or release of</cfif> Mortgage from #read_morts.mort2_2# <cfif #read_morts.mort2_3# neq ""> and #read_morts.mort2_3#</cfif> securing #read_morts.mort2_1# in the original principal amount of #read_morts.amt2#, as dated #read_morts.INST_MON2#/#read_morts.INST_DAY2#/#read_morts.INST_YEAR2# and recorded on #read_morts.rec_mon2#/#read_morts.rec_day2#/#read_morts.rec_year2# among the Land Records of #read_title.pcounty# County, <cfif #read_morts.docnum2# eq ""><cfif #read_morts.book2# neq "">in Book #read_morts.book2# at Page #read_morts.page2# </cfif><cfelse> in Document Number #read_morts.docnum2# </cfif><cfif #read_morts.ass2_1# neq ""> Assigned to #read_morts.ass2_1# recorded on #read_morts.rec_mon2_1#/#read_morts.rec_day2_1#/#read_morts.rec_year2_1#, in Book <cfif #read_morts.doc_num2_1# eq "">#read_morts.book2_1#, at Page #read_morts.page2_1# <cfelse> in Document #read_morts.doc_num2_1#</cfif> </cfif><cfif #read_morts.ass2_2# neq "">Assigned to #read_morts.ass2_2# recorded on #read_morts.rec_mon2_2#/#read_morts.rec_day2_2#/#read_morts.rec_year2_2#, <cfif #read_morts.doc_num2_2# eq "">in Book #read_morts.book2_2#, at Page #read_morts.page2_2# <cfelse> in Document #read_morts.doc_num2_2#</cfif> </cfif><cfif #read_morts.ass2_3# neq "">Assigned to #read_morts.ass2_3# recorded on #read_morts.rec_mon2_3#/#read_morts.rec_day2_3#/#read_morts.rec_year2_3#, <cfif #read_morts.doc_num2_3# eq ""> in Book #read_morts.book2_3#, at Page #read_morts.page2_3# <cfelse> in Document #read_morts.doc_num2_3#</cfif> </cfif><cfif #read_morts.ass2_4# neq "">Assigned to #read_morts.ass2_4# recorded on #read_morts.rec_mon2_4#/#read_morts.rec_day2_4#/#read_morts.rec_year2_4#, <cfif #read_morts.doc_num2_4# EQ ""> in Book #read_morts.book2_4#, at Page #read_morts.page2_4# <cfelse> in Document #read_morts.doc_num2_3#</cfif> </cfif><cfif #read_morts.info2_1# neq "">#read_morts.info2_1#</cfif> <cfif #read_morts.info2_2# neq "">#read_morts.info2_2#</cfif></cfif></td></tr>
</cfif>
</cfoutput>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>


	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
</table>



</td>
	</tr>
</table>
<!--- ====================================================================== --->
<!--- =================[ END OF SCHEDULE A         ]======================== --->
<!--- ====================================================================== --->
</IE:DEVICERECT>




<cfif len(read_Title_Data.addex) GT 3000>
<cfset extra_text = Mid(read_Title_Data.addex, 3000, Len(read_Title_Data.addex))>
<cfset stop_number = Find(" ", read_Title_Data.addex, 3000)>
<cfset addex_1 = Mid(read_Title_Data.addex, 1, stop_number)>
<cfset addex_2 = Mid(read_Title_Data.addex, stop_number + 1, Len(read_Title_Data.addex))>
</cfif>




<cfif len(read_Title_Data.addex) LTE 3000>
<P>
<IE:DEVICERECT ID="page7" CLASS="masterstyle" MEDIA="print">
<table width="100%" cellpadding=0 cellspacing=0 border=0 >
        <tr>
		  <td colspan="2" align="center" valign="middle" bgcolor="000000" height="30"><B><font color="FFFFFF" size="4">Schedule
            B</font></B></td>
	</tr>
	</table>
<table width="93%" cellpadding=0 cellspacing=0 border=0 >
	<tr>
		<td width="33%"><!--- ===/ This is the Title_ID from the Title Table \=== --->
						<cfoutput><NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR></td>
		<td align="Center"><NOBR>First American Title Insurance Company</NOBR></td>
    <td align="right"><NOBR>Commitment Number: D-#read_Title.Title_ID#</NOBR></td></cfoutput>
	</tr>
</table>
<!-----C1 starts----->
<style>
.small_font {font-family:"Times New Roman", Times, serif; font-size:8.5pt;}

</style>


<table cellpadding=0 cellspacing=0 border=0 width="93%">
	   <tr>
          <td ALIGN = "CENTER" colspan="3"><br>
<br>
<cfset num_count = 0>
<B>ADDITIONAL EXCEPTIONS</B><br><br></td>
        </tr>
<cfif #read_title_data.addex# neq "">
<cfset num_count = num_count + 1>
        <tr>
		<td width="3%" valign="top"><cfoutput></cfoutput></td>
          <td align = "left" colspan="3" valign="top"><cfoutput><span class="small_font">#read_title_data.addex#</span></cfoutput>
		  <cfif read_title.prop_tax_day neq '' and read_title.prop_tax_month neq '' and read_title.prop_tax_year neq ''>
		  <br>
<br><cfoutput><span class="small_font">24.&nbsp;&nbsp;Property Taxes, subsequent to #DateFormat(read_title.prop_tax_month & '/' & read_title.prop_tax_day & '/' & read_title.prop_tax_year, "long")#,  which are a lien not yet due and payable, including any assessments collected with taxes to be levied; including increases occasioned be retroactive revaluation, changes in land usage or loss of any homestead exemption status for the insured premises.</span></cfoutput>
		  </cfif>
		 </td>
        </tr>

        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
</cfif>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
<!--- <cfoutput>
	<cfif (#read_tax.comments# NEQ "") or #read_tax.data29# EQ "" AND #read_tax.paiddate# NEQ "" AND #read_tax.submitted# NEQ "">
<tr>
<td>&nbsp;</td>
<TD colspan="3" valign="top"><b>Real Estate Tax Information: </b>
		<cfif #read_tax.payto# neq "">Payable to - #read_tax.payto#, </cfif><cfif #read_tax.taxcoll# neq "">Tax Collector - #read_tax.taxcoll#, </cfif><cfif #read_tax.add1# neq "">Address 1 - #read_tax.add1#, </cfif><cfif #read_tax.add1# neq "">Address 2 - #read_tax.add2#, </cfif><cfif #read_tax.city# neq "">City - #read_tax.city#, </cfif><cfif #read_tax.state# neq "">State - #read_tax.state#, </cfif><cfif #read_tax.add1# neq "">Zip code - #read_tax.zip#, </cfif><cfif #read_tax.phone# neq "">Phone - #read_tax.phone#, </cfif><cfif #read_tax.web# neq "">Web address- #read_tax.web#, </cfif><cfif #read_tax.acctnum# neq "">APN/Acct Num - #read_tax.acctnum#, </cfif>
		<cfif #read_tax.taxfreq# neq "">Taxes are paid #read_tax.taxfreq#, </cfif><cfif #read_tax.paiddate# neq "">date paid #read_tax.paiddate#, </cfif><cfif #read_tax.paidto# neq "">which covers from #read_tax.paidfrom# to #read_tax.paidto#, </cfif><cfif #read_tax.lastamt# neq "">in the amount of #read_tax.lastamt#, </cfif><cfif #read_tax.duedate# neq "">Next due date #read_tax.duedate#, </cfif><cfif #read_tax.dueto# neq "">which covers from #read_tax.duefrom# to #read_tax.dueto#, </cfif><cfif #read_tax.dueamt# neq "">in the amount of #read_tax.dueamt#</cfif><br><br>
		<cfif #read_tax.delamt# neq ""><b>Delinquent Information -- </b>Delinquent amount #read_tax.delamt#, </cfif><cfif #read_tax.thrudate# neq "">good through date #read_tax.thrudate#. </cfif> <cfif #read_tax.comments# neq ""> Comments: #read_tax.comments# </cfif>


		<cfelseif #read_tax.data29# NEQ "" AND #read_tax.paiddate# EQ "">
		<cfif #read_tax.data29# NEQ ""> Real Estate Taxes for #Read_tax.data29# are #Read_tax.data31#. They are payable #Read_tax.data37#. The amount paid was $#Read_tax.data28#. #Read_tax.data34#. The due dates are #Read_tax.data30#. The parcel ID number is #Read_tax.data19#.</b><br>
<br>
<br>
</cfif>
</TD>
</tr>
			</cfif>
</cfoutput>	 --->
</table>

</td></tr></table>
</IE:DEVICERECT>


<cfelse>
<P>
<IE:DEVICERECT ID="page7" CLASS="masterstyle" MEDIA="print">
<table width="100%" cellpadding=0 cellspacing=0 border=0 >
        <tr>
		  <td colspan="2" align="center" valign="middle" bgcolor="000000" height="30"><B><font color="FFFFFF" size="4">Schedule
            B</font></B></td>
	</tr>
	</table>
<table width="93%" cellpadding=0 cellspacing=0 border=0 >
	<tr>
		<td width="33%"><!--- ===/ This is the Title_ID from the Title Table \=== --->
						<cfoutput><NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR></td>
		<td align="Center"><NOBR>First American Title Insurance Company</NOBR></td>
    <td align="right"><NOBR>Commitment Number: D-#read_Title.Title_ID#</NOBR></td></cfoutput>
	</tr>
</table>
<!-----C1 starts----->
<style>
.small_font {font-family:"Times New Roman", Times, serif; font-size:8.5pt;}

</style>


<table cellpadding=0 cellspacing=0 border=0 width="93%">
	   <tr>
          <td ALIGN = "CENTER" colspan="3"><br>
<br>
<cfset num_count = 0>
<B>ADDITIONAL EXCEPTIONS</B><br><br></td>
        </tr>
<cfif #addex_1# neq "">
<cfset num_count = num_count + 1>
        <tr>
		<td width="3%" valign="top"><cfoutput></cfoutput></td>
          <td align = "left" colspan="3" valign="top"><cfoutput><span class="small_font">#addex_1#</span></cfoutput>
		 </td>
        </tr>

        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
</cfif>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
<!--- <cfoutput>
	<cfif (#read_tax.comments# NEQ "") or #read_tax.data29# EQ "" AND #read_tax.paiddate# NEQ "" AND #read_tax.submitted# NEQ "">
<tr>
<td>&nbsp;</td>
<TD colspan="3" valign="top"><b>Real Estate Tax Information: </b>
		<cfif #read_tax.payto# neq "">Payable to - #read_tax.payto#, </cfif><cfif #read_tax.taxcoll# neq "">Tax Collector - #read_tax.taxcoll#, </cfif><cfif #read_tax.add1# neq "">Address 1 - #read_tax.add1#, </cfif><cfif #read_tax.add1# neq "">Address 2 - #read_tax.add2#, </cfif><cfif #read_tax.city# neq "">City - #read_tax.city#, </cfif><cfif #read_tax.state# neq "">State - #read_tax.state#, </cfif><cfif #read_tax.add1# neq "">Zip code - #read_tax.zip#, </cfif><cfif #read_tax.phone# neq "">Phone - #read_tax.phone#, </cfif><cfif #read_tax.web# neq "">Web address- #read_tax.web#, </cfif><cfif #read_tax.acctnum# neq "">APN/Acct Num - #read_tax.acctnum#, </cfif>
		<cfif #read_tax.taxfreq# neq "">Taxes are paid #read_tax.taxfreq#, </cfif><cfif #read_tax.paiddate# neq "">date paid #read_tax.paiddate#, </cfif><cfif #read_tax.paidto# neq "">which covers from #read_tax.paidfrom# to #read_tax.paidto#, </cfif><cfif #read_tax.lastamt# neq "">in the amount of #read_tax.lastamt#, </cfif><cfif #read_tax.duedate# neq "">Next due date #read_tax.duedate#, </cfif><cfif #read_tax.dueto# neq "">which covers from #read_tax.duefrom# to #read_tax.dueto#, </cfif><cfif #read_tax.dueamt# neq "">in the amount of #read_tax.dueamt#</cfif><br><br>
		<cfif #read_tax.delamt# neq ""><b>Delinquent Information -- </b>Delinquent amount #read_tax.delamt#, </cfif><cfif #read_tax.thrudate# neq "">good through date #read_tax.thrudate#. </cfif> <cfif #read_tax.comments# neq ""> Comments: #read_tax.comments# </cfif>


		<cfelseif #read_tax.data29# NEQ "" AND #read_tax.paiddate# EQ "">
		<cfif #read_tax.data29# NEQ ""> Real Estate Taxes for #Read_tax.data29# are #Read_tax.data31#. They are payable #Read_tax.data37#. The amount paid was $#Read_tax.data28#. #Read_tax.data34#. The due dates are #Read_tax.data30#. The parcel ID number is #Read_tax.data19#.</b><br>
<br>
<br>
</cfif>
</TD>
</tr>
			</cfif>
</cfoutput>	 --->
</table>

</td></tr></table>
</IE:DEVICERECT>

<P>
<IE:DEVICERECT ID="page7" CLASS="masterstyle" MEDIA="print">
<table width="100%" cellpadding=0 cellspacing=0 border=0 >
        <tr>
		  <td colspan="2" align="center" valign="middle" bgcolor="000000" height="30"><B><font color="FFFFFF" size="4">Schedule
            B</font></B></td>
	</tr>
	</table>
<table width="93%" cellpadding=0 cellspacing=0 border=0 >
	<tr>
		<td width="33%"><!--- ===/ This is the Title_ID from the Title Table \=== --->
						<cfoutput><NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR></td>
		<td align="Center"><NOBR>First American Title Insurance Company</NOBR></td>
    <td align="right"><NOBR>Commitment Number: D-#read_Title.Title_ID#</NOBR></td></cfoutput>
	</tr>
</table>
<!-----C1 starts----->
<style>
.small_font {font-family:"Times New Roman", Times, serif; font-size:8.5pt;}

</style>


<table cellpadding=0 cellspacing=0 border=0 width="93%">
	   <tr>
          <td ALIGN = "CENTER" colspan="3"><br>
<br>
<cfset num_count = 0>
<B>ADDITIONAL EXCEPTIONS</B><br><br></td>
        </tr>
<cfif #addex_2# neq "">
<cfset num_count = num_count + 1>
        <tr>
		<td width="3%" valign="top"><cfoutput></cfoutput></td>
         <td align = "left" colspan="3" valign="top"><cfoutput><span class="small_font">#addex_2#</span></cfoutput>
		  <cfif read_title.prop_tax_day neq '' and read_title.prop_tax_month neq '' and read_title.prop_tax_year neq ''>
		  <br>
<br><cfoutput><span class="small_font">24.&nbsp;&nbsp;Property Taxes, subsequent to #DateFormat(read_title.prop_tax_month & '/' & read_title.prop_tax_day & '/' & read_title.prop_tax_year, "long")#,  which are a lien not yet due and payable, including any assessments collected with taxes to be levied; including increases occasioned be retroactive revaluation, changes in land usage or loss of any homestead exemption status for the insured premises.</span></cfoutput>
		  </cfif>
		 </td>
        </tr>

        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
</cfif>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
<!--- <cfoutput>
	<cfif (#read_tax.comments# NEQ "") or #read_tax.data29# EQ "" AND #read_tax.paiddate# NEQ "" AND #read_tax.submitted# NEQ "">
<tr>
<td>&nbsp;</td>
<TD colspan="3" valign="top"><b>Real Estate Tax Information: </b>
		<cfif #read_tax.payto# neq "">Payable to - #read_tax.payto#, </cfif><cfif #read_tax.taxcoll# neq "">Tax Collector - #read_tax.taxcoll#, </cfif><cfif #read_tax.add1# neq "">Address 1 - #read_tax.add1#, </cfif><cfif #read_tax.add1# neq "">Address 2 - #read_tax.add2#, </cfif><cfif #read_tax.city# neq "">City - #read_tax.city#, </cfif><cfif #read_tax.state# neq "">State - #read_tax.state#, </cfif><cfif #read_tax.add1# neq "">Zip code - #read_tax.zip#, </cfif><cfif #read_tax.phone# neq "">Phone - #read_tax.phone#, </cfif><cfif #read_tax.web# neq "">Web address- #read_tax.web#, </cfif><cfif #read_tax.acctnum# neq "">APN/Acct Num - #read_tax.acctnum#, </cfif>
		<cfif #read_tax.taxfreq# neq "">Taxes are paid #read_tax.taxfreq#, </cfif><cfif #read_tax.paiddate# neq "">date paid #read_tax.paiddate#, </cfif><cfif #read_tax.paidto# neq "">which covers from #read_tax.paidfrom# to #read_tax.paidto#, </cfif><cfif #read_tax.lastamt# neq "">in the amount of #read_tax.lastamt#, </cfif><cfif #read_tax.duedate# neq "">Next due date #read_tax.duedate#, </cfif><cfif #read_tax.dueto# neq "">which covers from #read_tax.duefrom# to #read_tax.dueto#, </cfif><cfif #read_tax.dueamt# neq "">in the amount of #read_tax.dueamt#</cfif><br><br>
		<cfif #read_tax.delamt# neq ""><b>Delinquent Information -- </b>Delinquent amount #read_tax.delamt#, </cfif><cfif #read_tax.thrudate# neq "">good through date #read_tax.thrudate#. </cfif> <cfif #read_tax.comments# neq ""> Comments: #read_tax.comments# </cfif>


		<cfelseif #read_tax.data29# NEQ "" AND #read_tax.paiddate# EQ "">
		<cfif #read_tax.data29# NEQ ""> Real Estate Taxes for #Read_tax.data29# are #Read_tax.data31#. They are payable #Read_tax.data37#. The amount paid was $#Read_tax.data28#. #Read_tax.data34#. The due dates are #Read_tax.data30#. The parcel ID number is #Read_tax.data19#.</b><br>
<br>
<br>
</cfif>
</TD>
</tr>
			</cfif>
</cfoutput>	 --->
</table>

</td></tr></table>
</IE:DEVICERECT>
 </cfif>


<cfif len(read_Title_Data.notes) GT 3000>
<cfset extra_text = Mid(read_Title_Data.notes, 3000, Len(read_Title_Data.notes))>
<cfset stop_number = Find(" ", read_Title_Data.notes, 3000)>
<cfset notes_1 = Mid(read_Title_Data.notes, 1, stop_number)>
<cfset notes_2 = Mid(read_Title_Data.notes, stop_number + 1, Len(read_Title_Data.notes))>
</cfif>

<cfif len(read_Title_Data.notes) LTE 3000>
<P>
<IE:DEVICERECT ID="<CFOUTPUT><CFIF #read_Title.pstate# eq "CA" OR #read_Title.pstate# eq "NV">page3<CFELSE>Page2</CFIF></cfoutput>" CLASS="masterstyle" MEDIA="print">
	  <table width="100%" cellpadding=0 cellspacing=0 border=0 >
        <tr>
		  <td colspan="2" align="center" valign="middle" bgcolor="000000" height="30"><B><font color="FFFFFF" size="4">Exhibit A
           </font></B></td>
	</tr>
	</table>
	   <table width="93%" cellpadding=0 cellspacing=0 border=0>
	         <tr>
          <td width="33%">
             <cfoutput>

		<CFQUERY datasource="#request.dsn#" NAME="read_tax">
			SELECT *
			FROM tax_cert_title
			where title_id = #rec_id#
		</CFQUERY>
            <NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR></td>
            <td align="Center"><NOBR>First American Title Insurance Company</NOBR></td>
          <td align="right"><NOBR>Commitment Number: D-#read_Title.Title_ID#</NOBR></td>
        </tr>

		</table>
		<table width="93%"  cellpadding=10 cellspacing=10 border=0>


				   <tr>
          <td align = "center" COLSPAN = 3 ><b>LEGAL DESCRIPTION</b></td>
        </tr>


				<tr >
          <td     COLSPAN = 2 align = "left" >
		<b>

		<cfif #read_title_data.notes# neq "">#read_title_data.notes#</cfif>
		<cfif #read_title_data.data1# NEQ ""> Being the same property as transferred by #read_title_data.data5# on #DateFormat(read_title_data.data10, "mm")#/#DateFormat(read_title_data.data10, "dd")#/#DateFormat(read_title_data.data10, "yyyy")# and recorded #DateFormat(read_title_data.data11, "mm")#/#DateFormat(read_title_data.data11, "dd")#/#DateFormat(read_title_data.data11, "yyyy")# from #read_title_data.data1#
		<cfif #read_title_data.data2# NEQ ""> and #read_title_data.data2#</CFIF> to #read_title_data.data3#
		<CFIF #read_title_data.data4# NEQ "">and #read_title_data.data4#</CFIF>, #read_title_data.data6#,
		<cfif #read_title_data.data7# eq "">
		<CFIF #read_title_data.data8# NEQ ""> recorded in Book #read_title_data.data8#</cfif>
		<cfif #read_title_data.data9# neq ""> and Page #read_title_data.data9#</cfif>
		<cfelse> recorded in Document Number #read_title_data.data7# </cfif>
		</cfif>
		<br><br>

#read_title_data.data14#<br><br>

		<!--- <b><cfif #read_tax.data29# NEQ ""> Real Estate Taxes to #Read_tax.data35#, #Read_title.pcounty# County, #Read_title.pstate# for #read_tax.data29# were paid #DateFormat(read_tax.data39, "mm")#/#DateFormat(read_tax.data39, "dd")#/#DateFormat(read_tax.data39, "yyyy")# in the amount of #read_tax.data28#. <cfif #read_tax.data31# neq "">The taxes are #read_tax.data31#.</cfif> Actual due date is #read_tax.data30#. Taxes payable #read_tax.data37#. Taxes paid through #DateFormat(read_tax.data36, "mm")#/#DateFormat(read_tax.data36, "dd")#/#DateFormat(read_tax.data36, "yyyy")#. <cfif #read_tax.data32# neq ""> Delinquent Tax Amount #read_tax.data32# for year #read_tax.data33#</cfif>. <cfif #read_tax.data34# neq "">#read_tax.data34#</cfif> </b>
		<p><b>Tax Account Number: #read_tax.data19#</b></cfif> --->
		<b>


		</cfoutput>


		  </b>
		  </td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
     <!---    <tr align="right" valign="top">
          <td COLSPAN = 2><img src="./images/stewart_logo.jpg"></td>
        </tr> --->
      </table>
	   </IE:DEVICERECT>


<cfelse>
<P>
<IE:DEVICERECT ID="<CFOUTPUT><CFIF #read_Title.pstate# eq "CA" OR #read_Title.pstate# eq "NV">page3<CFELSE>Page2</CFIF></cfoutput>" CLASS="masterstyle" MEDIA="print">
	  <table width="100%" cellpadding=0 cellspacing=0 border=0 >
        <tr>
		  <td colspan="2" align="center" valign="middle" bgcolor="000000" height="30"><B><font color="FFFFFF" size="4">Exhibit A
           </font></B></td>
	</tr>
	</table>
	   <table width="93%" cellpadding=0 cellspacing=0 border=0>
	         <tr>
          <td width="33%">
             <cfoutput>

		<CFQUERY datasource="#request.dsn#" NAME="read_tax">
			SELECT *
			FROM tax_cert_title
			where title_id = #rec_id#
		</CFQUERY>
            <NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR></td>
            <td align="Center"><NOBR>First American Title Insurance Company</NOBR></td>
          <td align="right"><NOBR>Commitment Number: D-#read_Title.Title_ID#</NOBR></td>
        </tr>

		</table>
		<table width="93%"  cellpadding=10 cellspacing=10 border=0>


				   <tr>
          <td align = "center" COLSPAN = 3 ><b>LEGAL DESCRIPTION</b></td>
        </tr>


				<tr >
          <td     COLSPAN = 2 align = "left" >
		<b>

		<font size=2>#notes_1#</font>

		</cfoutput>


		  </b>
		  </td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
     <!---    <tr align="right" valign="top">
          <td COLSPAN = 2><img src="./images/stewart_logo.jpg"></td>
        </tr> --->
      </table>
	   </IE:DEVICERECT>



	   <IE:DEVICERECT ID="<CFOUTPUT><CFIF #read_Title.pstate# eq "CA" OR #read_Title.pstate# eq "NV">page3<CFELSE>Page2</CFIF></cfoutput>" CLASS="masterstyle" MEDIA="print">
	  <table width="100%" cellpadding=0 cellspacing=0 border=0 >
        <tr>
		  <td colspan="2" align="center" valign="middle" bgcolor="000000" height="30"><B><font color="FFFFFF" size="4">Exhibit A
           </font></B></td>
	</tr>
	</table>
	   <table width="93%" cellpadding=0 cellspacing=0 border=0>
	         <tr>
          <td width="33%">
             <cfoutput>

		<CFQUERY datasource="#request.dsn#" NAME="read_tax">
			SELECT *
			FROM tax_cert_title
			where title_id = #rec_id#
		</CFQUERY>
            <NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR></td>
            <td align="Center"><NOBR>First American Title Insurance Company</NOBR></td>
          <td align="right"><NOBR>Commitment Number: D-#read_Title.Title_ID#</NOBR></td>
        </tr>

		</table>
		<table width="93%"  cellpadding=10 cellspacing=10 border=0>


				   <tr>
          <td align = "center" COLSPAN = 3 ><b>LEGAL DESCRIPTION</b></td>
        </tr>


				<tr >
          <td     COLSPAN = 2 align = "left" >
		<b>

<cfif #read_title_data.notes# neq "">#notes_2#</cfif>
		<cfif #read_title_data.data1# NEQ ""> Being the same property as transferred by #read_title_data.data5# on #DateFormat(read_title_data.data10, "mm")#/#DateFormat(read_title_data.data10, "dd")#/#DateFormat(read_title_data.data10, "yyyy")# and recorded #DateFormat(read_title_data.data11, "mm")#/#DateFormat(read_title_data.data11, "dd")#/#DateFormat(read_title_data.data11, "yyyy")# from #read_title_data.data1#
		<cfif #read_title_data.data2# NEQ ""> and #read_title_data.data2#</CFIF> to #read_title_data.data3#
		<CFIF #read_title_data.data4# NEQ "">and #read_title_data.data4#</CFIF>, #read_title_data.data6#,
		<cfif #read_title_data.data7# eq "">
		<CFIF #read_title_data.data8# NEQ ""> recorded in Book #read_title_data.data8#</cfif>
		<cfif #read_title_data.data9# neq ""> and Page #read_title_data.data9#</cfif>
		<cfelse> recorded in Document Number #read_title_data.data7# </cfif>
		</cfif>
		<br><br>

#read_title_data.data14#<br><br>
		</cfoutput>


		  </b>
		  </td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
     <!---    <tr align="right" valign="top">
          <td COLSPAN = 2><img src="./images/stewart_logo.jpg"></td>
        </tr> --->
      </table>
	   </IE:DEVICERECT>

	</cfif>

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