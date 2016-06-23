<CFPARAM NAME="a_trigger" DEFAULT="0">


		<CFQUERY datasource="#request.dsn#" NAME="read_Title">

			SELECT *
			FROM Title
			WHERE Title_ID = #rec_ID#

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
<CFQUERY datasource="#request.dsn#" NAME="read_Title_FT_Agency_company">
		SELECT *
		FROM  title_ft_agencies
		WHERE title_ft_agency_id = '#read_age.title_ft_agency_id#'

</CFQUERY>
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
<CFMAIL
TO="#email#"
FROM="titlereview@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="First Title - Utah Insurance Committment for order #rec_id#. Loan No: #read_title.loan_number# - #read_title.bfirstname1# #read_title.blastname1#"
TIMEOUT="600"
type="HTML"
>

View/Print <A HREF="https://#cgi.server_name#/title_committment_view_ins_ut.cfm?comp_id=115&user_id_1=723&lo_id=1217&rec_id=#rec_id#&a_trigger=1&company_id=0" target="new">Utah Insurance Committment</a> for order #rec_id# - #read_title.bfirstname1# #read_title.blastname1#</B></font><br><br>

First Title staff
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

<p>

<div id=idControls align="center" class="noprint">


<table width="100%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
<cfoutput>
<FORM action="./Title_committment_submit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#company_ID#&a_trigger=7"  ENCTYPE="multipart/form-data" method="post">
</cfoutput>
<tr>
<td width="100%" align=center valign=top bgcolor=yellow>
			<b><font face=verdana size=3 color=red>Click this button to complete </font></b><INPUT TYPE=IMAGE SRC="./images/button_mark_as_sent.gif" border=0>
</td>	</tr>
</form>
</table>

<hr size="1" color="dimgray">
</div>


<IE:DEVICERECT ID="page1" CLASS="masterstyle" MEDIA="print">
<!----1st page starts ----->
<table cellpadding=1 cellspacing=1 border=0 width="100%">
  <tr>

    <td align="center" valign="middle"><IMG width=800 height=36 style="display:block; float:none" src="images/Title_Commitment_Utah_img_0.jpg"></td>
	</tr></table>

	<table cellpadding=1 cellspacing=1 border=0 width="100%">
  <tr>

    <td align="left" valign="middle">

		<P>
<SPAN style="font-family:'sans-serif', 'Arial', sans-serif; font-size:8.9pt; font-weight:normal; color:#000000"
>State: </SPAN
><SPAN style="font-family:'sans-serif', 'Arial', sans-serif; font-size:8.9pt; font-weight:bold; color:#000000"
><cfoutput><B>#read_Title.pstate#</b></cfoutput></SPAN
><SPAN style="font-family:'sans-serif', 'Arial', sans-serif; font-size:8.9pt; font-weight:normal; color:#000000"
> County: </SPAN
><SPAN style="font-family:'sans-serif', 'Arial', sans-serif; font-size:8.9pt; font-weight:bold; color:#000000"
><cfoutput><B>#read_Title.pcounty#</b> </cfoutput></SPAN
><br><SPAN style="font-family:'sans-serif', 'Arial', sans-serif; font-size:8.9pt; font-weight:normal; color:#000000"
>Order #: </SPAN
><SPAN style="font-family:'sans-serif', 'Arial', sans-serif; font-size:8.9pt; font-weight:bold; color:#000000"
><cfoutput><B>#read_Title.Title_ID#</B></cfoutput></SPAN
></P>

		</td>
	</tr></table>


	<table cellpadding=1 cellspacing=1 border=0 width="93%">
	<tr><td>&nbsp;</td></tr>
<!----A1 starts ---->
	<TR>
		<TD align=center valign=top>
		<TABLE border="1" cellpadding="1" cellspacing="1"  width = "100%">
<TR >
<Td align="right" width = "20%">
Escrow #:
</Td>

<Td align="right" width = "20%">
Commitment #:
</Td>

<Td align="right" width = "20%">Effective Date:
</Td>

<Td align="right" width = "20%">Reinsurance #:
</Td><Td align="right" width = "20%">Agent #:
</Td>

</tr>

<TR >
<Td align="right" width = "20%">&nbsp;
</Td>

<Td align="right" width = "20%">
<cfoutput> <b>D-#read_Title.Title_ID#</b></cfoutput>
</Td>

<Td align="right" width = "20%"> <CFQUERY datasource="#request.dsn#" NAME="read_title_update">
            select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs
            is not null </cfquery>
			<CFIF #read_title_update.recordcount# GT 0 and #read_title_update.data1# neq "">
              <cfoutput>
				<b>#DateFormat(read_title_update.data37, "mm")#/#DateFormat(read_title_update.data37, "dd")#/#DateFormat(read_title_update.data37, "yyyy")#
				</b> </cfoutput>
              <cfelse>
            </cfif>
</Td>

<Td align="right" width = "20%">&nbsp;
</Td><Td align="right" width = "20%">&nbsp;
</Td>

</tr>

</table>

<table cellpadding=1 cellspacing=1 border=0 width="100%">
  <tr>

    <td align="center" valign="middle">
		<font size="6" face="Verdana, Arial, Helvetica, sans-serif"><strong>
        Schedule A</strong></font>

		</td>
	</tr></table>


</td></tr>
<!----A 2 ends ----->
<tr><td>&nbsp;</td></tr>
<!---- A 3 starts ---->
<tr><td><CFOUTPUT>
	<table width="100%" align="center">
		<tr>

          <td width="3%">1.</td>
			<td width="66%"><font color="gray">Policy or Policies to be issued: (Lender)</font></td>
			<td width="31%">&nbsp;</td>
		</tr>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr>
			<td>&nbsp;</td>
			<td><font face="Verdana, Arial, Helvetica, sans-serif" size="2">ALTA LOAN - 1992 (10-17-92)</font></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td><font color="gray">Proposed Insured: (Lender)</font></td>
			<td><font color="gray">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Amount</font></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td><table width="80%" cellpadding="0" cellspacing="0" align="right"><tr><td><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>#read_title.insured#, it's successors and/or assigns, as their interests may appear.</b></font></td></tr></table></td>
			<td>$&nbsp;&nbsp;&nbsp;<font face="Verdana, Arial, Helvetica, sans-serif" size="2">#NumberFormat(read_title.loanamt_float, "999,999,999.00")#</font></td>
		</tr>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr>
			<td>&nbsp;</td>
			<td><font color="gray">Policy or Policies to be issued: (Owner)</font></td>
			<td></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td><font face="Verdana, Arial, Helvetica, sans-serif" size="2">ALTA OWNER'S - 1992 (10-17-92)</font></td>
			<td>&nbsp;</td>
		</tr>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr>
			<td>&nbsp;</td>
			<td><font color="gray">Proposed Insured: (Owner)</font></td>
			<td><font color="gray">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Amount</font></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><cfif #read_title.purchase# neq "">#Buyer_1#, #Buyer_2#</CFIF></font></td>
			<td>$&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="Verdana, Arial, Helvetica, sans-serif" size="2"><cfif #read_title.purchase# neq "">#NumberFormat(read_title.Purchase_Price, "999,999,999.00")#</CFIF></font></td>
		</tr>
		<tr><td colspan="3">&nbsp;</td></tr>
</CFOUTPUT>
		<tr>
			<td>2.</td>
			<td colspan="2">The estate or interest in the land described or referred to in the committment and covered herein is:</td>

		</tr>
			<CFQUERY datasource="#request.dsn#" NAME="read_title_data">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs is not null
			</cfquery>

			<cfoutput>
		<tr>
			<td>&nbsp;</td>
			<td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>

			#read_title_data.data38#</b></font></td>
		</tr>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr>
			<td>&nbsp;</td>
			<td colspan="2">and is at the effective date hereof vested in:</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td colspan="2">
				<font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>

				#read_title_data.data3#<cfif #read_title_data.data4# neq "">&nbsp;AND&nbsp;#read_title_data.data4#</cfif><cfif #read_title_data.data6# neq "">,&nbsp;#read_title_data.DATA6#</b></font></cfif>

			</td>
		</tr>
		<tr><td colspan="3">&nbsp;</td></tr>
		<tr>
			<td>3.</td>
			<td colspan="2">The land is described as follows:</td>
		</tr>
		<tr>
		<td>&nbsp;</td>
		<td colspan="2"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>
		See Exhibit A<br><br><br><br><br><br><br>
		</b></font>
		</td></tr>
		</cfoutput>
	</table>
</td></tr>
<!----A 3 ends ---->
<tr><td>&nbsp;</td></tr>
<tr><td>&nbsp;</td></tr>
<!----- A 4 starts ---->
<CFOUTPUT>
	<tr>
		<td>
			<table width="100%" align="center">
        <tr>
          <td width="60%"></td>
          <td width="40%" rowspan="2" valign="middle">
		  <font face="Verdana, Arial, Helvetica, sans-serif" size="2">
		  Issued By:<br> <B>#read_Title_FT_Agency_company.Company#<br>
            #read_Title_FT_Agency_company.Addr1#<br> <CFIF #read_Title_FT_Agency_company.Addr2# GT "" OR #read_Title_FT_Agency_company.Addr2# GT " ">
              #read_Title_FT_Agency_company.Addr2#<br>
            </CFIF> #read_Title_FT_Agency_company.city#, #read_Title_FT_Agency_company.state#&nbsp;&nbsp;&nbsp;#read_Title_FT_Agency_company.zip_code#</NOBR><br>
            Phone - #read_Title_FT_Agency_company.phone#<br> <CFIF #read_Title_FT_Agency_company.fax# GT "" OR #read_Title_FT_Agency_company.fax# GT " ">
              Fax - #read_Title_FT_Agency_company.fax#</CFIF>
			  </B></font>
			  </td>
        </tr>
        <tr>
          <td><img src="./images/sign4.gif" border="0" alt="Stephen Papermaster"><br>
           <font color="gray"> Countersigned Authorized Signatory</font></td>
        </tr>
        <tr>
          <td colspan="2"><table width="90%" align="center"><tr>
                <td><br><br><font color="gray">NOTE: This committment consists of insert pages labeled as
                  Schedule A, Schedule B, Section 1, and Schedule B Section 2.
                  This committment is of no force and effect unless all schedules
                  are included, along with any Rider pages incorporated by reference
                  in the insert page.</font></td>
              </tr></table> </td>
        </tr>

				   <tr>
          <td colspan="2"><table width="90%" align="left"><tr>
                <td><br><font color="gray">Underwriter: American Pioneer Title Insurance Company</font></td>
              </tr></table> </td>
        </tr>

      </table>
	</td>
</tr>


</cfoutput><!---A4 ends ----->
</table><!----1st page ends ----->
<table cellpadding=1 cellspacing=1 border=0 width="100%">
  <tr><cfoutput>
    <td align="left" valign="middle" width="50%"><font color="gray">Commitment - #read_Title.Title_ID#</font></td>
		<td align="right" valign="middle" width="50%"><font color="gray">File - #read_Title.Title_ID#</font></td></cfoutput>
	</tr></table>
</IE:DEVICERECT>

<IE:DEVICERECT ID="page2" CLASS="masterstyle" MEDIA="print">
<!----2nd page starts ----->
<table cellpadding=1 cellspacing=1 border=0 width="100%">
  <tr>

    <td align="center" valign="middle"><IMG width=800 height=36 style="display:block; float:none" src="images/Title_Commitment_Utah_img_0.jpg"></td>
	</tr></table>

	<table cellpadding=1 cellspacing=1 border=0 width="100%">
  <tr>

    <td align="center" valign="middle">
		<font size="6" face="Verdana, Arial, Helvetica, sans-serif"><strong>
        Schedule B - Section 1</strong></font>

		</td>
	</tr></table>



	<table cellpadding=1 cellspacing=1 border=0 width="93%">
	<tr><td>&nbsp;</td></tr>
<!----B1 starts ---->
<!-----B1 ends------>
<!-----B2 starts----->
<tr>
	<td>

		<CFQUERY datasource="#request.dsn#" NAME="Read_temp_comp_b1">
					SELECT *
					FROM Title
					WHERE Title_ID = #rec_ID#
		</CFQUERY>
		<CFSET a_section_code_for_this_section = "B1">

		<CFOUTPUT>
		<table width="100%" align="center" cellpadding="1" cellspacing="10">
        <tr>
				<td colspan="2">The following are requirements to be complied with:</td>
			</tr>

        <tr align="left" valign="top">
          <td width="5%">1</td>

          <td>Instrument(s) creating the estate or interest to be insured must
            be approved, executed and filed for record, to wit:
			<table width="100%" cellpadding="0" cellspacing="0" valign="middle">
			<tr><td colspan="2" height="10"></td></tr>
              <tr>
                <td width="4%" align="left" valign="top">a.</td>
                <td>
			Deed of Trust from <cfif #Read_temp_comp_b1.bfirstname1# neq "">#Read_temp_comp_b1.bfirstname1#</cfif><cfif #Read_temp_comp_b1.blastname1# neq ""> #Read_temp_comp_b1.blastname1#</cfif><cfif #Read_temp_comp_b1.bfirstname2# neq ""> AND #Read_temp_comp_b1.bfirstname2#</cfif><cfif #Read_temp_comp_b1.blastname2# neq ""> #Read_temp_comp_b1.blastname2#</cfif>, securing <cfif #Read_temp_comp_b1.insured# neq "">#Read_temp_comp_b1.insured#</cfif> in the amount of $#Read_temp_comp_b1.loanamt_float#<br></td></tr></table>
		</tr>

		<tr align="left" valign="top">
          <td>2</td>

          <td>Payment of the full consideration to, or for the account of, the
            grantors or mortgagors.</td>
		</tr>
		<tr align="left" valign="top">
          <td>3</td>
			<CFQUERY datasource="#request.dsn#" NAME="read_tax">

			SELECT *
			FROM tax_cert_title
			where title_id = #rec_id#
		</CFQUERY>
          <td>Payment of all taxes, charges, assessments, levied and assessed
            against subject premises, which are due and payable.
            <p>
		<b><cfif #read_tax.data29# NEQ ""> Real Estate Taxes for #Read_tax.data29# are #Read_tax.data31#. They are payable #Read_tax.data37#. The amount paid was $#Read_tax.data28#. #Read_tax.data34#. The due dates are #Read_tax.data30#. The parcel ID number is #Read_tax.data19#.</b></cfif>

		<!--- <b><cfif #read_tax.data29# NEQ ""> Real Estate Taxes to #Read_tax.data35#, #Read_temp_comp_b1.pcounty# County, #Read_temp_comp_b1.pstate# for #read_tax.data29# were paid #DateFormat(read_tax.data39, "mm")#/#DateFormat(read_tax.data39, "dd")#/#DateFormat(read_tax.data39, "yyyy")# in the amount of #read_tax.data28#. <cfif #read_tax.data31# neq "">The taxes are #read_tax.data31#.</cfif> Actual due date is #read_tax.data30#. Taxes payable #read_tax.data37#. Taxes paid through #DateFormat(read_tax.data36, "mm")#/#DateFormat(read_tax.data36, "dd")#/#DateFormat(read_tax.data36, "yyyy")#. <cfif #read_tax.data32# neq ""> Delinquent Tax Amount #read_tax.data32# for year #read_tax.data33#</cfif>. <cfif #read_tax.data34# neq "">#read_tax.data34#</cfif> </b>
		<p><b>Tax Account Number: #read_tax.data19#</b></cfif> --->
			</td>
		</tr>
		<tr align="left" valign="top">
          <td>4</td>

          <td>Satisfactory evidence should be had that improvements and/or repairs
            or alterations thereto are completed; that contractor, subcontractors,
            labor and materialmen are all paid. </td>
		</tr>
		<tr align="left" valign="top">
          <td>5</td>

          <td>Exceptions 3 and 4 of Schedule B - Section 2 of this committment
            may be amended in, or deleted from the policy to be issued if a survey,
            satisfactory to the company, is furnished to the company. </td>
		</tr>
		<tr align="left" valign="top">
          <td>6</td>

          <td>The Company requires receipt in writing of the name of anyone not
            reffered to in this committment who will acquire an interest in the
            land or who will execute a deed of trust encumbering the land. Additional
            requirements and/or exceptions may then be added.</td>
		</tr>
		<tr align="left" valign="top">
          <td>7</td>

          <td>Satisfactory evidence should be had that improvements and/or repairs
            or alterations thereto are completed; that contractor, sub-contractors,
            labor and materialmen are all paid and have released of record all
            liens or notice of intent to perfect a lien of labor or material.
          </td>
		</tr>
		</cfoutput>
		<cfset auto_number = 7>

		<CFQUERY datasource="#request.dsn#" NAME="read_mortgage">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 1
		</cfquery>
		<cfoutput query = "read_mortgage">
		<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
		    <td>#auto_number#.</td>
       <td>
<cfif #read_mortgage.data1# NEQ ""> Satisfaction and/or release of Mortgage from #read_mortgage.data2# <cfif #read_mortgage.data3# neq ""> and #read_mortgage.data3#</cfif> securing #read_mortgage.data1# in the original principal amount of #read_mortgage.data4#, as dated #DateFormat(read_mortgage.data8, "mm")#/#DateFormat(read_mortgage.data8, "dd")#/#DateFormat(read_mortgage.data8, "yyyy")# and recorded on #DateFormat(read_mortgage.data9, "mm")#/#DateFormat(read_mortgage.data9, "dd")#/#DateFormat(read_mortgage.data9, "yyyy")# among the Land Records of #Read_temp_comp_b1.pcounty# County, <cfif #read_mortgage.data5# eq ""><cfif #read_mortgage.data6# neq "">in Book #read_mortgage.data6# at Page #read_mortgage.data7# </cfif><cfelse> in Document Number #read_mortgage.data5# </cfif><cfif #read_mortgage.data13# neq ""> Assigned to #read_mortgage.data13# recorded on #DateFormat(read_mortgage.data17, "mm")#/#DateFormat(read_mortgage.data17, "dd")#/#DateFormat(read_mortgage.data17, "yyyy")#, in Book <cfif #read_mortgage.data14# eq "">#read_mortgage.data15#, at Page #read_mortgage.data16# <cfelse> in Document #read_mortgage.data14#</cfif> </cfif><cfif #read_mortgage.data18# neq "">Assigned to #read_mortgage.data18# recorded on #DateFormat(read_mortgage.data22, "mm")#/#DateFormat(read_mortgage.data22, "dd")#/#DateFormat(read_mortgage.data22, "yyyy")#, <cfif #read_mortgage.data19# eq "">in Book #read_mortgage.data20#, at Page #read_mortgage.data21# <cfelse> in Document #read_mortgage.data19#</cfif> </cfif><cfif #read_mortgage.data23# neq "">Assigned to #read_mortgage.data23# recorded on #DateFormat(read_mortgage.data27, "mm")#/#DateFormat(read_mortgage.data27, "dd")#/#DateFormat(read_mortgage.data27, "yyyy")#, <cfif #read_mortgage.data24# eq ""> in Book #read_mortgage.data25#, at Page #read_mortgage.data26# <cfelse> in Document #read_mortgage.data24#</cfif> </cfif><cfif #read_mortgage.data28# neq "">Assigned to #read_mortgage.data28# recorded on #DateFormat(read_mortgage.data32, "mm")#/#DateFormat(read_mortgage.data32, "dd")#/#DateFormat(read_mortgage.data32, "yyyy")#, <cfif #read_mortgage.data29# EQ ""> in Book #read_mortgage.data30#, at Page #read_mortgage.data31# <cfelse> in Document #read_mortgage.data31#</cfif> </cfif><cfif #read_mortgage.data11# neq "">#read_mortgage.data11#</cfif> <cfif #read_mortgage.data12# neq "">#read_mortgage.data12#</cfif></cfif>

			</td>
		</tr>
</cfoutput>

<CFQUERY datasource="#request.dsn#" NAME="read_mortgage2">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 2
	</cfquery>

	<cfoutput query = "read_mortgage2">
	<cfset auto_number = #auto_number# + 1>
		  <tr align="left" valign="top">
            <td>#auto_number#.</td>
			<td>
            <cfif #read_mortgage2.data1# NEQ ""> Satisfaction and/or release of Mortgage from #read_mortgage2.data2# <cfif #read_mortgage2.data3# neq ""> and #read_mortgage2.data3#</cfif> securing #read_mortgage2.data1# in the original principal amount of #read_mortgage2.data4#, as dated #DateFormat(read_mortgage2.data8, "mm")#/#DateFormat(read_mortgage2.data8, "dd")#/#DateFormat(read_mortgage2.data8, "yyyy")# and recorded on #DateFormat(read_mortgage2.data9, "mm")#/#DateFormat(read_mortgage2.data9, "dd")#/#DateFormat(read_mortgage2.data9, "yyyy")# among the Land Records of #Read_temp_comp_b1.pcounty# County, <cfif #read_mortgage2.data5# eq ""><cfif #read_mortgage2.data6# neq "">in Book #read_mortgage2.data6# at Page #read_mortgage2.data7# </cfif><cfelse> in Document Number #read_mortgage2.data5# </cfif><cfif #read_mortgage2.data13# neq ""> Assigned to #read_mortgage2.data13# recorded on #DateFormat(read_mortgage2.data17, "mm")#/#DateFormat(read_mortgage2.data17, "dd")#/#DateFormat(read_mortgage2.data17, "yyyy")#, in Book <cfif #read_mortgage2.data14# eq "">#read_mortgage2.data15#, at Page #read_mortgage2.data16# <cfelse> in Document #read_mortgage2.data14#</cfif> </cfif><cfif #read_mortgage2.data18# neq "">Assigned to #read_mortgage2.data18# recorded on #DateFormat(read_mortgage2.data22, "mm")#/#DateFormat(read_mortgage2.data22, "dd")#/#DateFormat(read_mortgage2.data22, "yyyy")#, <cfif #read_mortgage2.data19# eq "">in Book #read_mortgage2.data20#, at Page #read_mortgage2.data21# <cfelse> in Document #read_mortgage2.data19#</cfif> </cfif><cfif #read_mortgage2.data23# neq "">Assigned to #read_mortgage2.data23# recorded on #DateFormat(read_mortgage2.data27, "mm")#/#DateFormat(read_mortgage2.data27, "dd")#/#DateFormat(read_mortgage2.data27, "yyyy")#, <cfif #read_mortgage2.data24# eq ""> in Book #read_mortgage2.data25#, at Page #read_mortgage2.data26# <cfelse> in Document #read_mortgage2.data24#</cfif> </cfif><cfif #read_mortgage2.data28# neq "">Assigned to #read_mortgage2.data28# recorded on #DateFormat(read_mortgage2.data32, "mm")#/#DateFormat(read_mortgage2.data32, "dd")#/#DateFormat(read_mortgage2.data32, "yyyy")#, <cfif #read_mortgage2.data29# EQ ""> in Book #read_mortgage2.data30#, at Page #read_mortgage2.data31# <cfelse> in Document #read_mortgage2.data31#</cfif> </cfif><cfif #read_mortgage2.data11# neq "">#read_mortgage2.data11#</cfif> <cfif #read_mortgage2.data12# neq "">#read_mortgage2.data12#</cfif></cfif>
		</td>
	</tr>
</cfoutput>

	<CFQUERY datasource="#request.dsn#" NAME="read_mortgage3">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 3
			</cfquery>

			<cfoutput query = "read_mortgage3">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
           <cfif #read_mortgage3.data1# NEQ ""> Satisfaction and/or release of Mortgage from #read_mortgage3.data2# <cfif #read_mortgage3.data3# neq ""> and #read_mortgage3.data3#</cfif> securing #read_mortgage3.data1# in the original principal amount of #read_mortgage3.data4#, as dated #DateFormat(read_mortgage3.data8, "mm")#/#DateFormat(read_mortgage3.data8, "dd")#/#DateFormat(read_mortgage3.data8, "yyyy")# and recorded on #DateFormat(read_mortgage3.data9, "mm")#/#DateFormat(read_mortgage3.data9, "dd")#/#DateFormat(read_mortgage3.data9, "yyyy")# among the Land Records of #Read_temp_comp_b1.pcounty# County, <cfif #read_mortgage3.data5# eq ""><cfif #read_mortgage3.data6# neq "">in Book #read_mortgage3.data6# at Page #read_mortgage3.data7# </cfif><cfelse> in Document Number #read_mortgage3.data5# </cfif><cfif #read_mortgage3.data13# neq ""> Assigned to #read_mortgage3.data13# recorded on #DateFormat(read_mortgage3.data17, "mm")#/#DateFormat(read_mortgage3.data17, "dd")#/#DateFormat(read_mortgage3.data17, "yyyy")#, in Book <cfif #read_mortgage3.data14# eq "">#read_mortgage3.data15#, at Page #read_mortgage3.data16# <cfelse> in Document #read_mortgage3.data14#</cfif> </cfif><cfif #read_mortgage3.data18# neq "">Assigned to #read_mortgage3.data18# recorded on #DateFormat(read_mortgage3.data22, "mm")#/#DateFormat(read_mortgage3.data22, "dd")#/#DateFormat(read_mortgage3.data22, "yyyy")#, <cfif #read_mortgage3.data19# eq "">in Book #read_mortgage3.data20#, at Page #read_mortgage3.data21# <cfelse> in Document #read_mortgage3.data19#</cfif> </cfif><cfif #read_mortgage3.data23# neq "">Assigned to #read_mortgage3.data23# recorded on #DateFormat(read_mortgage3.data27, "mm")#/#DateFormat(read_mortgage3.data27, "dd")#/#DateFormat(read_mortgage3.data27, "yyyy")#, <cfif #read_mortgage3.data24# eq ""> in Book #read_mortgage3.data25#, at Page #read_mortgage3.data26# <cfelse> in Document #read_mortgage3.data24#</cfif> </cfif><cfif #read_mortgage3.data28# neq "">Assigned to #read_mortgage3.data28# recorded on #DateFormat(read_mortgage3.data32, "mm")#/#DateFormat(read_mortgage3.data32, "dd")#/#DateFormat(read_mortgage3.data32, "yyyy")#, <cfif #read_mortgage3.data29# EQ ""> in Book #read_mortgage3.data30#, at Page #read_mortgage3.data31# <cfelse> in Document #read_mortgage3.data31#</cfif> </cfif><cfif #read_mortgage3.data11# neq "">#read_mortgage3.data11#</cfif> <cfif #read_mortgage3.data12# neq "">#read_mortgage3.data12#</cfif></cfif>
			</td>
	</tr>
</cfoutput>

<CFQUERY datasource="#request.dsn#" NAME="read_mortgage4">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 4
			</cfquery>

			<cfoutput query = "read_mortgage4">
	<cfset auto_number = #auto_number# + 1>

	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
           <cfif #read_mortgage4.data1# NEQ ""> Satisfaction and/or release of Mortgage from #read_mortgage4.data2# <cfif #read_mortgage4.data3# neq ""> and #read_mortgage4.data3#</cfif> securing #read_mortgage4.data1# in the original principal amount of #read_mortgage4.data4#, as dated #DateFormat(read_mortgage4.data8, "mm")#/#DateFormat(read_mortgage4.data8, "dd")#/#DateFormat(read_mortgage4.data8, "yyyy")# and recorded on #DateFormat(read_mortgage4.data9, "mm")#/#DateFormat(read_mortgage4.data9, "dd")#/#DateFormat(read_mortgage4.data9, "yyyy")# among the Land Records of #Read_temp_comp_b1.pcounty# County, <cfif #read_mortgage4.data5# eq ""><cfif #read_mortgage4.data6# neq "">in Book #read_mortgage4.data6# at Page #read_mortgage4.data7# </cfif><cfelse> in Document Number #read_mortgage4.data5# </cfif><cfif #read_mortgage4.data13# neq ""> Assigned to #read_mortgage4.data13# recorded on #DateFormat(read_mortgage4.data17, "mm")#/#DateFormat(read_mortgage4.data17, "dd")#/#DateFormat(read_mortgage4.data17, "yyyy")#, in Book <cfif #read_mortgage4.data14# eq "">#read_mortgage4.data15#, at Page #read_mortgage4.data16# <cfelse> in Document #read_mortgage4.data14#</cfif> </cfif><cfif #read_mortgage4.data18# neq "">Assigned to #read_mortgage4.data18# recorded on #DateFormat(read_mortgage4.data22, "mm")#/#DateFormat(read_mortgage4.data22, "dd")#/#DateFormat(read_mortgage4.data22, "yyyy")#, <cfif #read_mortgage4.data19# eq "">in Book #read_mortgage4.data20#, at Page #read_mortgage4.data21# <cfelse> in Document #read_mortgage4.data19#</cfif> </cfif><cfif #read_mortgage4.data23# neq "">Assigned to #read_mortgage4.data23# recorded on #DateFormat(read_mortgage4.data27, "mm")#/#DateFormat(read_mortgage4.data27, "dd")#/#DateFormat(read_mortgage4.data27, "yyyy")#, <cfif #read_mortgage4.data24# eq ""> in Book #read_mortgage4.data25#, at Page #read_mortgage4.data26# <cfelse> in Document #read_mortgage4.data24#</cfif> </cfif><cfif #read_mortgage4.data28# neq "">Assigned to #read_mortgage4.data28# recorded on #DateFormat(read_mortgage4.data32, "mm")#/#DateFormat(read_mortgag4.data32, "dd")#/#DateFormat(read_mortgage4.data32, "yyyy")#, <cfif #read_mortgage4.data29# EQ ""> in Book #read_mortgage4.data30#, at Page #read_mortgage4.data31# <cfelse> in Document #read_mortgage4.data31#</cfif> </cfif><cfif #read_mortgage4.data11# neq "">#read_mortgage4.data11#</cfif> <cfif #read_mortgage4.data12# neq "">#read_mortgage4.data12#</cfif></cfif>
	</td>
	</tr>
</cfoutput>



<CFQUERY datasource="#request.dsn#" NAME="read_mortgage5">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 5
			</cfquery>

			<cfoutput query = "read_mortgage5">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
             <cfif #read_mortgage5.data1# NEQ ""> Satisfaction and/or release of Mortgage from #read_mortgage5.data2# <cfif #read_mortgage5.data3# neq ""> and #read_mortgage5.data3#</cfif> securing #read_mortgage5.data1# in the original principal amount of #read_mortgage5.data4#, as dated #DateFormat(read_mortgage5.data8, "mm")#/#DateFormat(read_mortgage5.data8, "dd")#/#DateFormat(read_mortgage5.data8, "yyyy")# and recorded on #DateFormat(read_mortgage5.data9, "mm")#/#DateFormat(read_mortgage5.data9, "dd")#/#DateFormat(read_mortgage5.data9, "yyyy")# among the Land Records of #Read_temp_comp_b1.pcounty# County, <cfif #read_mortgage5.data5# eq ""><cfif #read_mortgage5.data6# neq "">in Book #read_mortgage5.data6# at Page #read_mortgage5.data7# </cfif><cfelse> in Document Number #read_mortgage5.data5# </cfif><cfif #read_mortgage5.data13# neq ""> Assigned to #read_mortgage5.data13# recorded on #DateFormat(read_mortgage5.data17, "mm")#/#DateFormat(read_mortgage5.data17, "dd")#/#DateFormat(read_mortgage5.data17, "yyyy")#, in Book <cfif #read_mortgage5.data14# eq "">#read_mortgage5.data15#, at Page #read_mortgage5.data16# <cfelse> in Document #read_mortgage5.data14#</cfif> </cfif><cfif #read_mortgage5.data18# neq "">Assigned to #read_mortgage5.data18# recorded on #DateFormat(read_mortgage5.data22, "mm")#/#DateFormat(read_mortgage5.data22, "dd")#/#DateFormat(read_mortgage5.data22, "yyyy")#, <cfif #read_mortgage5.data19# eq "">in Book #read_mortgage5.data20#, at Page #read_mortgage5.data21# <cfelse> in Document #read_mortgage5.data19#</cfif> </cfif><cfif #read_mortgage5.data23# neq "">Assigned to #read_mortgage5.data23# recorded on #DateFormat(read_mortgage5.data27, "mm")#/#DateFormat(read_mortgage5.data27, "dd")#/#DateFormat(read_mortgage5.data27, "yyyy")#, <cfif #read_mortgage5.data24# eq ""> in Book #read_mortgage5.data25#, at Page #read_mortgage5.data26# <cfelse> in Document #read_mortgage5.data24#</cfif> </cfif><cfif #read_mortgage5.data28# neq "">Assigned to #read_mortgage5.data28# recorded on #DateFormat(read_mortgage5.data32, "mm")#/#DateFormat(read_mortgage5.data32, "dd")#/#DateFormat(read_mortgage5.data32, "yyyy")#, <cfif #read_mortgage5.data29# EQ ""> in Book #read_mortgage5.data30#, at Page #read_mortgage5.data31# <cfelse> in Document #read_mortgage5.data31#</cfif> </cfif><cfif #read_mortgage5.data11# neq "">#read_mortgage5.data11#</cfif> <cfif #read_mortgage5.data12# neq "">#read_mortgage5.data12#</cfif></cfif>
	</td>
	</tr>
</cfoutput>

<CFQUERY datasource="#request.dsn#" NAME="read_mortgage6">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 6
			</cfquery>

			<cfoutput query = "read_mortgage6">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
          <cfif #read_mortgage6.data1# NEQ ""> Satisfaction and/or release of Mortgage from #read_mortgage6.data2# <cfif #read_mortgage6.data3# neq ""> and #read_mortgage6.data3#</cfif> securing #read_mortgage6.data1# in the original principal amount of #read_mortgage6.data4#, as dated #DateFormat(read_mortgage6.data8, "mm")#/#DateFormat(read_mortgage6.data8, "dd")#/#DateFormat(read_mortgage6.data8, "yyyy")# and recorded on #DateFormat(read_mortgage6.data9, "mm")#/#DateFormat(read_mortgage6.data9, "dd")#/#DateFormat(read_mortgage6.data9, "yyyy")# among the Land Records of #Read_temp_comp_b1.pcounty# County, <cfif #read_mortgage6.data5# eq ""><cfif #read_mortgage6.data6# neq "">in Book #read_mortgage6.data6# at Page #read_mortgage6.data7# </cfif><cfelse> in Document Number #read_mortgage6.data5# </cfif><cfif #read_mortgage6.data13# neq ""> Assigned to #read_mortgage6.data13# recorded on #DateFormat(read_mortgage6.data17, "mm")#/#DateFormat(read_mortgage6.data17, "dd")#/#DateFormat(read_mortgage6.data17, "yyyy")#, in Book <cfif #read_mortgage6.data14# eq "">#read_mortgage6.data15#, at Page #read_mortgage6.data16# <cfelse> in Document #read_mortgage6.data14#</cfif> </cfif><cfif #read_mortgage6.data18# neq "">Assigned to #read_mortgage6.data18# recorded on #DateFormat(read_mortgage6.data22, "mm")#/#DateFormat(read_mortgage6.data22, "dd")#/#DateFormat(read_mortgage6.data22, "yyyy")#, <cfif #read_mortgage6.data19# eq "">in Book #read_mortgage6.data20#, at Page #read_mortgage6.data21# <cfelse> in Document #read_mortgage6.data19#</cfif> </cfif><cfif #read_mortgage6.data23# neq "">Assigned to #read_mortgage6.data23# recorded on #DateFormat(read_mortgage6.data27, "mm")#/#DateFormat(read_mortgage6.data27, "dd")#/#DateFormat(read_mortgage6.data27, "yyyy")#, <cfif #read_mortgage6.data24# eq ""> in Book #read_mortgage6.data25#, at Page #read_mortgage6.data26# <cfelse> in Document #read_mortgage6.data24#</cfif> </cfif><cfif #read_mortgage6.data28# neq "">Assigned to #read_mortgage6.data28# recorded on #DateFormat(read_mortgage6.data32, "mm")#/#DateFormat(read_mortgage6.data32, "dd")#/#DateFormat(read_mortgage6.data32, "yyyy")#, <cfif #read_mortgage6.data29# EQ ""> in Book #read_mortgage6.data30#, at Page #read_mortgage6.data31# <cfelse> in Document #read_mortgage6.data31#</cfif> </cfif><cfif #read_mortgage6.data11# neq "">#read_mortgage6.data11#</cfif> <cfif #read_mortgage6.data12# neq "">#read_mortgage6.data12#</cfif></cfif>
	</td>
	</tr>
</cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_mortgage7">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 7
			</cfquery>

			<cfoutput query = "read_mortgage7">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
           <cfif #read_mortgage7.data1# NEQ ""> Satisfaction and/or release of Mortgage from #read_mortgage7.data2# <cfif #read_mortgage7.data3# neq ""> and #read_mortgage7.data3#</cfif> securing #read_mortgage7.data1# in the original principal amount of #read_mortgage7.data4#, as dated #DateFormat(read_mortgage7.data8, "mm")#/#DateFormat(read_mortgage7.data8, "dd")#/#DateFormat(read_mortgage7.data8, "yyyy")# and recorded on #DateFormat(read_mortgage7.data9, "mm")#/#DateFormat(read_mortgage7.data9, "dd")#/#DateFormat(read_mortgage7.data9, "yyyy")# among the Land Records of #Read_temp_comp_b1.pcounty# County, <cfif #read_mortgage7.data5# eq ""><cfif #read_mortgage7.data6# neq "">in Book #read_mortgage7.data6# at Page #read_mortgage7.data7# </cfif><cfelse> in Document Number #read_mortgage7.data5# </cfif><cfif #read_mortgage7.data13# neq ""> Assigned to #read_mortgage7.data13# recorded on #DateFormat(read_mortgage7.data17, "mm")#/#DateFormat(read_mortgage7.data17, "dd")#/#DateFormat(read_mortgage7.data17, "yyyy")#, in Book <cfif #read_mortgage7.data14# eq "">#read_mortgage7.data15#, at Page #read_mortgage7.data16# <cfelse> in Document #read_mortgage7.data14#</cfif> </cfif><cfif #read_mortgage7.data18# neq "">Assigned to #read_mortgage7.data18# recorded on #DateFormat(read_mortgage7.data22, "mm")#/#DateFormat(read_mortgage7.data22, "dd")#/#DateFormat(read_mortgage7.data22, "yyyy")#, <cfif #read_mortgage7.data19# eq "">in Book #read_mortgage7.data20#, at Page #read_mortgage7.data21# <cfelse> in Document #read_mortgage7.data19#</cfif> </cfif><cfif #read_mortgage7.data23# neq "">Assigned to #read_mortgage7.data23# recorded on #DateFormat(read_mortgage7.data27, "mm")#/#DateFormat(read_mortgage7.data27, "dd")#/#DateFormat(read_mortgage7.data27, "yyyy")#, <cfif #read_mortgage7.data24# eq ""> in Book #read_mortgage7.data25#, at Page #read_mortgage7.data26# <cfelse> in Document #read_mortgage7.data24#</cfif> </cfif><cfif #read_mortgage7.data28# neq "">Assigned to #read_mortgage7.data28# recorded on #DateFormat(read_mortgage7.data32, "mm")#/#DateFormat(read_mortgage7.data32, "dd")#/#DateFormat(read_mortgage7.data32, "yyyy")#, <cfif #read_mortgage7.data29# EQ ""> in Book #read_mortgage7.data30#, at Page #read_mortgage7.data31# <cfelse> in Document #read_mortgage7.data31#</cfif> </cfif><cfif #read_mortgage7.data11# neq "">#read_mortgage7.data11#</cfif> <cfif #read_mortgage7.data12# neq "">#read_mortgage7.data12#</cfif></cfif>
	</td>
	</tr>
</cfoutput>

<CFQUERY datasource="#request.dsn#" NAME="read_mortgage8">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 8
			</cfquery>

			<cfoutput query = "read_mortgage8">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
             <cfif #read_mortgage8.data1# NEQ ""> Satisfaction and/or release of Mortgage from #read_mortgage8.data2# <cfif #read_mortgage8.data3# neq ""> and #read_mortgage8.data3#</cfif> securing #read_mortgage8.data1# in the original principal amount of #read_mortgage8.data4#, as dated #DateFormat(read_mortgage8.data8, "mm")#/#DateFormat(read_mortgage8.data8, "dd")#/#DateFormat(read_mortgage8.data8, "yyyy")# and recorded on #DateFormat(read_mortgage8.data9, "mm")#/#DateFormat(read_mortgage8.data9, "dd")#/#DateFormat(read_mortgage8.data9, "yyyy")# among the Land Records of #Read_temp_comp_b1.pcounty# County, <cfif #read_mortgage8.data5# eq ""><cfif #read_mortgage10.data6# neq "">in Book #read_mortgage8.data6# at Page #read_mortgage8.data7# </cfif><cfelse> in Document Number #read_mortgage8.data5# </cfif><cfif #read_mortgage8.data13# neq ""> Assigned to #read_mortgage8.data13# recorded on #DateFormat(read_mortgage8.data17, "mm")#/#DateFormat(read_mortgage8.data17, "dd")#/#DateFormat(read_mortgage8.data17, "yyyy")#, in Book <cfif #read_mortgage8.data14# eq "">#read_mortgage8.data15#, at Page #read_mortgage8.data16# <cfelse> in Document #read_mortgage8.data14#</cfif> </cfif><cfif #read_mortgage8.data18# neq "">Assigned to #read_mortgage8.data18# recorded on #DateFormat(read_mortgage8.data22, "mm")#/#DateFormat(read_mortgage8.data22, "dd")#/#DateFormat(read_mortgage8.data22, "yyyy")#, <cfif #read_mortgage8.data19# eq "">in Book #read_mortgage8.data20#, at Page #read_mortgage8.data21# <cfelse> in Document #read_mortgage8.data19#</cfif> </cfif><cfif #read_mortgage8.data23# neq "">Assigned to #read_mortgage8.data23# recorded on #DateFormat(read_mortgage8.data27, "mm")#/#DateFormat(read_mortgage8.data27, "dd")#/#DateFormat(read_mortgage8.data27, "yyyy")#, <cfif #read_mortgage8.data24# eq ""> in Book #read_mortgage8.data25#, at Page #read_mortgage8.data26# <cfelse> in Document #read_mortgage8.data24#</cfif> </cfif><cfif #read_mortgage8.data28# neq "">Assigned to #read_mortgage8.data28# recorded on #DateFormat(read_mortgage8.data32, "mm")#/#DateFormat(read_mortgage8.data32, "dd")#/#DateFormat(read_mortgage8.data32, "yyyy")#, <cfif #read_mortgage8.data29# EQ ""> in Book #read_mortgage8.data30#, at Page #read_mortgage8.data31# <cfelse> in Document #read_mortgage8.data31#</cfif> </cfif><cfif #read_mortgage8.data11# neq "">#read_mortgage8.data11#</cfif> <cfif #read_mortgage8.data12# neq "">#read_mortgage8.data12#</cfif></cfif>
	</td>
	</tr>
</cfoutput>

<CFQUERY datasource="#request.dsn#" NAME="read_mortgage9">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 9
			</cfquery>

			<cfoutput query = "read_mortgage9">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
                       <cfif #read_mortgage9.data1# NEQ ""> Satisfaction and/or release of Mortgage from #read_mortgage9.data2# <cfif #read_mortgage9.data3# neq ""> and #read_mortgage9.data3#</cfif> securing #read_mortgage9.data1# in the original principal amount of #read_mortgage9.data4#, as dated #DateFormat(read_mortgage9.data8, "mm")#/#DateFormat(read_mortgage9.data8, "dd")#/#DateFormat(read_mortgage9.data8, "yyyy")# and recorded on #DateFormat(read_mortgage9.data9, "mm")#/#DateFormat(read_mortgage9.data9, "dd")#/#DateFormat(read_mortgage9.data9, "yyyy")# among the Land Records of #Read_temp_comp_b1.pcounty# County, <cfif #read_mortgage9.data5# eq ""><cfif #read_mortgage9.data6# neq "">in Book #read_mortgage9.data6# at Page #read_mortgage9.data7# </cfif><cfelse> in Document Number #read_mortgage9.data5# </cfif><cfif #read_mortgage9.data13# neq ""> Assigned to #read_mortgage9.data13# recorded on #DateFormat(read_mortgage9.data17, "mm")#/#DateFormat(read_mortgage9.data17, "dd")#/#DateFormat(read_mortgage9.data17, "yyyy")#, in Book <cfif #read_mortgage9.data14# eq "">#read_mortgage9.data15#, at Page #read_mortgage9.data16# <cfelse> in Document #read_mortgage9.data14#</cfif> </cfif><cfif #read_mortgage9.data18# neq "">Assigned to #read_mortgage9.data18# recorded on #DateFormat(read_mortgage9.data22, "mm")#/#DateFormat(read_mortgage9.data22, "dd")#/#DateFormat(read_mortgage9.data22, "yyyy")#, <cfif #read_mortgage9.data19# eq "">in Book #read_mortgage9.data20#, at Page #read_mortgage9.data21# <cfelse> in Document #read_mortgage9.data19#</cfif> </cfif><cfif #read_mortgage9.data23# neq "">Assigned to #read_mortgage9.data23# recorded on #DateFormat(read_mortgage9.data27, "mm")#/#DateFormat(read_mortgage9.data27, "dd")#/#DateFormat(read_mortgage9.data27, "yyyy")#, <cfif #read_mortgage9.data24# eq ""> in Book #read_mortgage9.data25#, at Page #read_mortgage9.data26# <cfelse> in Document #read_mortgage9.data24#</cfif> </cfif><cfif #read_mortgage9.data28# neq "">Assigned to #read_mortgage9.data28# recorded on #DateFormat(read_mortgage9.data32, "mm")#/#DateFormat(read_mortgage9.data32, "dd")#/#DateFormat(read_mortgage9.data32, "yyyy")#, <cfif #read_mortgage9.data29# EQ ""> in Book #read_mortgage9.data30#, at Page #read_mortgage9.data31# <cfelse> in Document #read_mortgage9.data31#</cfif> </cfif><cfif #read_mortgage9.data11# neq "">#read_mortgage9.data11#</cfif> <cfif #read_mortgage9.data12# neq "">#read_mortgage9.data12#</cfif></cfif>
	</td>
	</tr>
</cfoutput>

<CFQUERY datasource="#request.dsn#" NAME="read_mortgage10">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 10
			</cfquery>

			<cfoutput query = "read_mortgage10">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
          <cfif #read_mortgage10.data1# NEQ ""> Satisfaction and/or release of Mortgage from #read_mortgage10.data2# <cfif #read_mortgage10.data3# neq ""> and #read_mortgage10.data3#</cfif> securing #read_mortgage10.data1# in the original principal amount of #read_mortgage10.data4#, as dated #DateFormat(read_mortgage10.data8, "mm")#/#DateFormat(read_mortgage10.data8, "dd")#/#DateFormat(read_mortgage10.data8, "yyyy")# and recorded on #DateFormat(read_mortgage10.data9, "mm")#/#DateFormat(read_mortgage10.data9, "dd")#/#DateFormat(read_mortgage10.data9, "yyyy")# among the Land Records of #Read_temp_comp_b1.pcounty# County, <cfif #read_mortgage10.data5# eq ""><cfif #read_mortgage10.data6# neq "">in Book #read_mortgage10.data6# at Page #read_mortgage10.data7# </cfif><cfelse> in Document Number #read_mortgage10.data5# </cfif><cfif #read_mortgage10.data13# neq ""> Assigned to #read_mortgage10.data13# recorded on #DateFormat(read_mortgage10.data17, "mm")#/#DateFormat(read_mortgage10.data17, "dd")#/#DateFormat(read_mortgage10.data17, "yyyy")#, in Book <cfif #read_mortgage10.data14# eq "">#read_mortgage10.data15#, at Page #read_mortgage10.data16# <cfelse> in Document #read_mortgage10.data14#</cfif> </cfif><cfif #read_mortgage10.data18# neq "">Assigned to #read_mortgage10.data18# recorded on #DateFormat(read_mortgage10.data22, "mm")#/#DateFormat(read_mortgage10.data22, "dd")#/#DateFormat(read_mortgage10.data22, "yyyy")#, <cfif #read_mortgage10.data19# eq "">in Book #read_mortgage10.data20#, at Page #read_mortgage10.data21# <cfelse> in Document #read_mortgage10.data19#</cfif> </cfif><cfif #read_mortgage10.data23# neq "">Assigned to #read_mortgage10.data23# recorded on #DateFormat(read_mortgage10.data27, "mm")#/#DateFormat(read_mortgage10.data27, "dd")#/#DateFormat(read_mortgage10.data27, "yyyy")#, <cfif #read_mortgage10.data24# eq ""> in Book #read_mortgage10.data25#, at Page #read_mortgage10.data26# <cfelse> in Document #read_mortgage10.data24#</cfif> </cfif><cfif #read_mortgage10.data28# neq "">Assigned to #read_mortgage10.data28# recorded on #DateFormat(read_mortgage10.data32, "mm")#/#DateFormat(read_mortgage10.data32, "dd")#/#DateFormat(read_mortgage10.data32, "yyyy")#, <cfif #read_mortgage10.data29# EQ ""> in Book #read_mortgage10.data30#, at Page #read_mortgage10.data31# <cfelse> in Document #read_mortgage10.data31#</cfif> </cfif><cfif #read_mortgage10.data11# neq "">#read_mortgage10.data11#</cfif> <cfif #read_mortgage10.data12# neq "">#read_mortgage10.data12#</cfif></cfif>
	</td>
	</tr>
</cfoutput>

			<CFQUERY datasource="#request.dsn#" NAME="read_lien">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 1
			</cfquery>
		<cfoutput query = "read_lien">
	<cfset auto_number = #auto_number# + 1>

	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien.data7# NEQ "">
			#read_lien.lienintro# Judgment against #read_lien.data7# in favor of #read_lien.data6# in the amount of #read_lien.data5#,
			  dated #DateFormat(read_lien.data4, "mm")#/#DateFormat(read_lien.data4, "dd")#/#DateFormat(read_lien.data4, "yyyy")#
			  and recorded #DateFormat(read_lien.data9, "mm")#/#DateFormat(read_lien.data9, "dd")#/#DateFormat(read_lien.data9, "yyyy")#,
			  <cfif #read_lien.data1# eq ""> in Book #read_lien.data2# at Page #read_lien.data3# <cfelse> in Document #read_lien.data1# </cfif>
			  #read_lien.data8#</cfif>
		</td>
	</tr>
</cfoutput>

		<CFQUERY datasource="#request.dsn#" NAME="read_lien2">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 2
			</cfquery>
		<cfoutput query = "read_lien2">
		<cfset auto_number = #auto_number# + 1>

	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien2.data7# NEQ ""> #read_lien2.lienintro# Judgment against #read_lien2.data7# in favor of #read_lien2.data6# in the amount of #read_lien2.data5#, dated #DateFormat(read_lien2.data4, "mm")#/#DateFormat(read_lien2.data4, "dd")#/#DateFormat(read_lien2.data4, "yyyy")#
			   and recorded #DateFormat(read_lien2.data9, "mm")#/#DateFormat(read_lien2.data9, "dd")#/#DateFormat(read_lien2.data9, "yyyy")#
			     <cfif #read_lien2.data1# eq ""> in Book #read_lien2.data2# at Page #read_lien2.data3# <cfelse> in Document #read_lien2.data1# </cfif> #read_lien2.data8#</cfif>

		</td>
	</tr>
</cfoutput>



			<CFQUERY datasource="#request.dsn#" NAME="read_lien3">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 3
			</cfquery>
		<cfoutput query = "read_lien3">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien3.data7# NEQ ""> #read_lien3.lienintro# Judgment against #read_lien3.data7# in favor of #read_lien3.data6# in the amount of #read_lien3.data5#, dated #DateFormat(read_lien3.data4, "mm")#/#DateFormat(read_lien3.data4, "dd")#/#DateFormat(read_lien3.data4, "yyyy")#
			  and recorded #DateFormat(read_lien3.data9, "mm")#/#DateFormat(read_lien3.data9, "dd")#/#DateFormat(read_lien3.data9, "yyyy")#
			    <cfif #read_lien3.data1# eq ""> in Book #read_lien3.data2# at Page #read_lien3.data3# <cfelse> in Document #read_lien3.data1# </cfif> #read_lien3.data8#</cfif>

		</td>
	</tr>
</cfoutput>


<CFQUERY datasource="#request.dsn#" NAME="read_lien4">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 4
			</cfquery>
		<cfoutput query = "read_lien4">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien4.data7# NEQ ""> #read_lien4.lienintro# Judgment against #read_lien4.data7# in favor of #read_lien4.data6# in the amount of #read_lien4.data5#, dated #DateFormat(read_lien4.data4, "mm")#/#DateFormat(read_lien4.data4, "dd")#/#DateFormat(read_lien4.data4, "yyyy")#
			  and recorded #DateFormat(read_lien4.data9, "mm")#/#DateFormat(read_lien4.data9, "dd")#/#DateFormat(read_lien4.data9, "yyyy")#
			    <cfif #read_lien4.data1# eq ""> in Book #read_lien4.data2# at Page #read_lien4.data3# <cfelse> in Document #read_lien4.data1# </cfif> #read_lien4.data8#</cfif>

		</td>
	</tr>

</cfoutput>

		<CFQUERY datasource="#request.dsn#" NAME="read_lien5">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 5
			</cfquery>
		<cfoutput query = "read_lien5">
	<cfset auto_number = #auto_number# + 1>

	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien5.data7# NEQ ""> #read_lien5.lienintro# Judgment against #read_lien5.data7# in favor of #read_lien5.data6# in the amount of #read_lien5.data5#, dated #DateFormat(read_lien5.data4, "mm")#/#DateFormat(read_lien5.data4, "dd")#/#DateFormat(read_lien5.data4, "yyyy")#
			  and recorded #DateFormat(read_lien5.data9, "mm")#/#DateFormat(read_lien5.data9, "dd")#/#DateFormat(read_lien5.data9, "yyyy")#
			    <cfif #read_lien5.data1# eq ""> in Book #read_lien5.data2# at Page #read_lien5.data3# <cfelse> in Document #read_lien5.data1# </cfif> #read_lien5.data8#</cfif>

		</td>
	</tr>
</cfoutput>
		<CFQUERY datasource="#request.dsn#" NAME="read_lien6">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 6
			</cfquery>
		<cfoutput query = "read_lien6">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien6.data7# NEQ ""> #read_lien6.lienintro# Judgment against #read_lien6.data7# in favor of #read_lien6.data6# in the amount of #read_lien6.data5#, dated #DateFormat(read_lien6.data4, "mm")#/#DateFormat(read_lien6.data4, "dd")#/#DateFormat(read_lien6.data4, "yyyy")#
			  and recorded #DateFormat(read_lien6.data9, "mm")#/#DateFormat(read_lien6.data9, "dd")#/#DateFormat(read_lien6.data9, "yyyy")#
			    <cfif #read_lien6.data1# eq ""> in Book #read_lien6.data2# at Page #read_lien6.data3# <cfelse> in Document #read_lien6.data1# </cfif> #read_lien6.data8#</cfif>

		</td>
	</tr>
</cfoutput>

		<CFQUERY datasource="#request.dsn#" NAME="read_lien7">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 7
			</cfquery>
		<cfoutput query = "read_lien7">
		<cfset auto_number = #auto_number# + 1>

	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien7.data7# NEQ ""> #read_lien7.lienintro# Judgment against #read_lien7.data7# in favor of #read_lien7.data6# in the amount of #read_lien7.data5#, dated #DateFormat(read_lien7.data4, "mm")#/#DateFormat(read_lien7.data4, "dd")#/#DateFormat(read_lien7.data4, "yyyy")#
			  and recorded #DateFormat(read_lien7.data9, "mm")#/#DateFormat(read_lien7.data9, "dd")#/#DateFormat(read_lien7.data9, "yyyy")#
			<cfif #read_lien7.data1# eq ""> in Book #read_lien7.data2# at Page #read_lien7.data3# <cfelse> in Document #read_lien7.data1# </cfif> #read_lien7.data8#</cfif>

		</td>

	</tr>

</cfoutput>

<CFQUERY datasource="#request.dsn#" NAME="read_lien8">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 8
			</cfquery>
		<cfoutput query = "read_lien8">
	<cfset auto_number = #auto_number# + 1>

	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien8.data7# NEQ ""> #read_lien8.lienintro# Judgment against #read_lien8.data7# in favor of #read_lien8.data6# in the amount of #read_lien8.data5#, dated #DateFormat(read_lien8.data4, "mm")#/#DateFormat(read_lien8.data4, "dd")#/#DateFormat(read_lien8.data4, "yyyy")#
			  and recorded #DateFormat(read_lien8.data9, "mm")#/#DateFormat(read_lien8.data9, "dd")#/#DateFormat(read_lien8.data9, "yyyy")#
			    <cfif #read_lien8.data1# eq ""> in Book #read_lien8.data2# at Page #read_lien8.data3# <cfelse> in Document #read_lien8.data1# </cfif> #read_lien8.data8#</cfif>

		</td>
	</tr>
</cfoutput>

	<CFQUERY datasource="#request.dsn#" NAME="read_lien9">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 9
			</cfquery>
		<cfoutput query = "read_lien9">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien9.data7# NEQ ""> #read_lien9.lienintro# Judgment against #read_lien9.data7# in favor of #read_lien9.data6# in the amount of #read_lien9.data5#, dated #DateFormat(read_lien9.data4, "mm")#/#DateFormat(read_lien9.data4, "dd")#/#DateFormat(read_lien9.data4, "yyyy")#
			   and recorded #DateFormat(read_lien9.data9, "mm")#/#DateFormat(read_lien9.data9, "dd")#/#DateFormat(read_lien9.data9, "yyyy")#
			     <cfif #read_lien.data1# eq ""> in Book #read_lien9.data2# at Page #read_lien9.data3# <cfelse> in Document #read_lien9.data1# </cfif> #read_lien9.data8#</cfif>

		</td>
	</tr>
</cfoutput>
					<CFQUERY datasource="#request.dsn#" NAME="read_lien10">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 10
			</cfquery>
		<cfoutput query = "read_lien10">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien10.data7# NEQ ""> #read_lien10.lienintro# Judgment against #read_lien10.data7# in favor of #read_lien10.data6# in the amount of #read_lien10.data5#, dated #DateFormat(read_lien10.data4, "mm")#/#DateFormat(read_lien10.data4, "dd")#/#DateFormat(read_lien10.data4, "yyyy")# and recorded #DateFormat(read_lien10.data9, "mm")#/#DateFormat(read_lien10.data9, "dd")#/#DateFormat(read_lien10.data9, "yyyy")#
			    <cfif #read_lien10.data1# eq ""> in Book #read_lien10.data2# at Page #read_lien10.data3# <cfelse> in Document #read_lien10.data1# </cfif> #read_lien10.data8#</cfif>

		</td>
	</tr>
</cfoutput>
</table>

</td></tr><!------B2 ends------>
</table>
<table cellpadding=1 cellspacing=1 border=0 width="100%">
  <tr><cfoutput>
    <td align="left" valign="middle" width="50%"><font color="gray">Commitment - #read_Title.Title_ID#</font></td>
		<td align="right" valign="middle" width="50%"><font color="gray">File - #read_Title.Title_ID#</font></td></cfoutput>
	</tr></table><!----2nd page ends---->
</IE:DEVICERECT>
<cfif #read_title_data.addreq# neq "">
<IE:DEVICERECT ID="page6" CLASS="masterstyle" MEDIA="print">

<!-----C1 starts----->
<table cellpadding=1 cellspacing=1 border=0 width="100%">
  <tr>

    <td align="center" valign="middle"><IMG width=800 height=36 style="display:block; float:none" src="images/Title_Commitment_Utah_img_0.jpg"></td>
	</tr></table>

	<table cellpadding=1 cellspacing=1 border=0 width="100%">
  <tr>

    <td align="center" valign="middle">
		<font size="6" face="Verdana, Arial, Helvetica, sans-serif"><strong>
        Schedule B - Section 1 (Cont'd)</strong></font>

		</td>
	</tr></table>
	  <table cellpadding=1 cellspacing=1 border=0 width="100%">

		 <tr>
          <td ALIGN = "CENTER"><p><B>ADDITIONAL REQUIREMENT</p></B><br><br></td>
        </tr>
        <tr>
          <td align = "left"><p><B><cfoutput>
<cfif #read_title_data.addreq# neq "">#read_title_data.addreq#</cfif>
		</cfoutput>
		 </b><P></td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>

      </table>

</td></tr></table>
<table cellpadding=1 cellspacing=1 border=0 width="100%">
  <tr><cfoutput>
    <td align="left" valign="middle" width="50%"><font color="gray">Commitment - #read_Title.Title_ID#</font></td>
		<td align="right" valign="middle" width="50%"><font color="gray">File - #read_Title.Title_ID#</font></td></cfoutput>
	</tr></table>
</IE:DEVICERECT>
</cfif>
<IE:DEVICERECT ID="page3" CLASS="masterstyle" MEDIA="print">
<!------ 3rd page starts ------>
<table cellpadding=1 cellspacing=1 border=0 width="100%">
  <tr>

    <td align="center" valign="middle"><IMG width=800 height=36 style="display:block; float:none" src="images/Title_Commitment_Utah_img_0.jpg"></td>
	</tr></table>

	<table cellpadding=1 cellspacing=1 border=0 width="100%">
  <tr>

    <td align="center" valign="middle">
		<font size="6" face="Verdana, Arial, Helvetica, sans-serif"><strong>
        Schedule B - Section 2</strong></font>

		</td>
	</tr></table>
<table cellpadding=1 cellspacing=1 border=0 width="100%">
<!----C1 ends----->
<tr><td>
<b>Exceptions</b>
<CFOUTPUT>
<p>Schedule of the policy or policies to be issued will contain exceptions to the following matters unless the same are disposed of to the satisfaction of the company.</p>
        <table width="100%" align="center" cellpadding="1" cellspacing="10">
          <tr align="left" valign="top">
            <td>1.</td>

            <td>Defects, liens, encumbrances, adverse claims or other matters,
              if any, created, first appearing in the public records or attaching
              subsequent to the effective date hereof but prior to the date the
              proposed Insured acquires for value of record the estate or interest
              or mortgage thereon covered by this committment. </td>
			</tr>
		  <tr align="left" valign="top">
            <td>2.</td>
			<td>Rights or claims of parties in possession not shown by the public
              records.</td>
		</tr>
		  <tr align="left" valign="top">
            <td>3.</td>
			<td>Encroachments, overlaps, boundary line disputes, and other matters
              which would be disclosed by an accurate survey and inspection of
              the premises.</td>
		</tr>
		  <tr align="left" valign="top">
            <td>4.</td>
			<td>Easements or claims of easements not shown by the public records.</td>
		</tr>
		  <tr align="left" valign="top">
            <td>5.</td>
			<td>Any lien, or right to a lien, for services, labor or material
              heretofore or after furnished, imposed by law and not shown by the
              public records.</td>
		</tr>
		  <tr align="left" valign="top">
            <td>6.</td>
			<td>Taxes or special assessments which are not shown as existing liens
              by the public records.</td>
		</tr>
<!--- 		  <tr align="left" valign="top">
            <td>7.</td>
			<td>Taxes and assessments for the year #read_tax.data29#, and
              subsequent years, which are not yet due and payable.</td>
		</tr>
		  <tr align="left" valign="top">
            <td>8.</td>
			<td>Taxes and other public charges (including assessments by any County,
              Municipality, Metropolitan District or Commission) nor now due and
              payable. Note, this policy specifically insures the insured herein
              as follows:
              <table width="100%" cellpadding="0" cellspacing="0">
			  	<tr><td colspan="2">&nbsp;</td></tr>
				<tr>
					<td width="4%">a.</td>
					<td>If taxes are payable on an annual basis, taxes have been paid through the fiscal year ending June 30, 2002.</td>
				</tr>
				<tr>
					<td width="4%">b.</td>
					<td>If taxes are payable on a semi-annual basis, taxes have been paid through #read_tax.data36#, first following the effective date of this policy, whichever of said dates is the first to occur.</td></tr></table></td>
		</tr>
		  <tr align="left" valign="top">
            <td>9.</td>
			<td>Real estate taxes, other public charges (including assessments
              by any County, Municipality, Metropolitan District or Commission)
              and the balance of any such charges payable on an annual basis which
              are not yet due or payable.</td>
		</tr> --->
		  <tr align="left" valign="top">
            <td>7.</td>
			<td>State, County, and Municipal real estate taxes subsequent to the
              original levy for the year ending #read_tax.data36#, not yet due and
              payable, plus possible supplemental taxes.</td>
		</tr>
		  <tr align="left" valign="top">
            <td>8.</td>
			<td>Terms, provisions, conditions, notes and restrictions as shown
              on plat of subdivision.</td>
		</tr>
		  <tr align="left" valign="top">
            <td>9.</td>
			<td>NOTE: The above exceptions omit any covenant, condition, or restriction
              based on race, color, religion, sex, handicap, familial status or
              national origin as provided in 42 U.S.C. Section 3604, unless and
              only to the extent that the covenant (a) is not in violation of
              state or federal law, (b) is exempt under 42 U.S.C. Section 3607,
              or (c) relates to a handicap, but does not discriminate against
              handicapped people.</td>
			</tr>

          <tr align="left" valign="top">
            <td>10.</td>

            <td>No liability is assumed for matter occurring prior tp record an
              owner became vested, entitled and which matters affect the title
              by virtue of, but not limited to, defects in title, liens encumbrances,
              fees charges or assessments, taxes, general or special, ownership,
              rights of access marketability of or any defense as to matters or
              claims arising therefrom.</td>
			</tr>
			<tr>
				<td colspan="2">
All recorded documents referred to herein are recorded among the Land Records of the City of #Read_temp_comp_b1.pcity#, County of #Read_temp_comp_b1.pcounty#, State of #Read_temp_comp_b1.pstate#.</td>
			</tr>
		</table>
</CFOUTPUT>		</tr></td></table>
<table cellpadding=1 cellspacing=1 border=0 width="100%">
  <tr><cfoutput>
    <td align="left" valign="middle" width="50%"><font color="gray">Commitment - #read_Title.Title_ID#</font></td>
		<td align="right" valign="middle" width="50%"><font color="gray">File - #read_Title.Title_ID#</font></td></cfoutput>
	</tr></table>
</IE:DEVICERECT>
<cfif #read_title_data.addex# neq "">
<IE:DEVICERECT ID="page7" CLASS="masterstyle" MEDIA="print">
<table cellpadding=1 cellspacing=1 border=0 width="100%">
  <tr>

    <td align="center" valign="middle"><IMG width=800 height=36 style="display:block; float:none" src="images/Title_Commitment_Utah_img_0.jpg"></td>
	</tr></table>

	<table cellpadding=1 cellspacing=1 border=0 width="100%">
  <tr>

    <td align="center" valign="middle">
		<font size="6" face="Verdana, Arial, Helvetica, sans-serif"><strong>
        Schedule B - Section 2 (Cont'd)</strong></font>

		</td>
	</tr></table>

	<table cellpadding=1 cellspacing=1 border=0 width="100%">
	   <tr>
          <td ALIGN = "CENTER"><p><B>ADDITIONAL EXCEPTIONS</p></B><br><br></td>
        </tr>
        <tr>
          <td align = "left"><p><B><cfoutput>
<cfif #read_title_data.addex# neq "">#read_title_data.addex#</cfif>
		</cfoutput>
		 </b><P></td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>

      </table>

</td></tr></table>
<table cellpadding=1 cellspacing=1 border=0 width="100%">
  <tr><cfoutput>
    <td align="left" valign="middle" width="50%"><font color="gray">Commitment - #read_Title.Title_ID#</font></td>
		<td align="right" valign="middle" width="50%"><font color="gray">File - #read_Title.Title_ID#</font></td></cfoutput>
	</tr></table>
</IE:DEVICERECT>
</cfif>
<IE:DEVICERECT ID="page4" CLASS="masterstyle" MEDIA="print">
<table cellpadding=1 cellspacing=1 border=0 width="100%">
  <tr>

    <td align="center" valign="middle"><IMG width=800 height=36 style="display:block; float:none" src="images/Title_Commitment_Utah_img_0.jpg"></td>
	</tr></table>

	<table cellpadding=1 cellspacing=1 border=0 width="100%">
  <tr>

    <td align="center" valign="middle">
		<font size="6" face="Verdana, Arial, Helvetica, sans-serif"><strong>
        Schedule A (cont'd)</strong></font>

		</td>
	</tr></table>


	<table cellpadding=1 cellspacing=1 border=0 width="100%">
	   <tr>
          <td ALIGN = "CENTER"><p><B>LEGAL DESCRIPTION</p></B><br><br></td>
        </tr>
        <tr>
          <td align = "left"><p><B><cfoutput>
<cfif #Read_Committment_Doc.deed_status# eq ""><cfif #read_title_data.notes# neq "">#read_title_data.notes#</cfif><cfif #read_title_data.data1# NEQ ""> Being the same property as transferred by #read_title_data.data5# on #DateFormat(read_title_data.data10, "mm")#/#DateFormat(read_title_data.data10, "dd")#/#DateFormat(read_title_data.data10, "yyyy")# and recorded #DateFormat(read_title_data.data11, "mm")#/#DateFormat(read_title_data.data11, "dd")#/#DateFormat(read_title_data.data11, "yyyy")# from #read_title_data.data1#<cfif #read_title_data.data2# NEQ ""> and #read_title_data.data2#</CFIF> to #read_title_data.data3# <CFIF #read_title_data.data4# NEQ "">and #read_title_data.data4#</CFIF>, #read_title_data.data6#, <cfif #read_title_data.data7# eq ""><CFIF #read_title_data.data8# NEQ ""> recorded in Book #read_title_data.data8#</cfif><cfif #read_title_data.data9# neq ""> and Page #read_title_data.data9#</cfif><cfelse> recorded in Document Number #read_title_data.data7# </cfif></cfif><cfelse><cfif #Read_Committment_Doc.a_comments# neq "">#read_committment_doc.a_comments#</cfif></cfif>
		</cfoutput>
		 </b><P></td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>

      </table>

</td></tr></table>
<table cellpadding=1 cellspacing=1 border=0 width="100%">
  <tr><cfoutput>
    <td align="left" valign="middle" width="50%"><font color="gray">Commitment - #read_Title.Title_ID#</font></td>
		<td align="right" valign="middle" width="50%"><font color="gray">File - #read_Title.Title_ID#</font></td></cfoutput>
	</tr></table>
</IE:DEVICERECT>

<IE:DEVICERECT ID="page5" CLASS="masterstyle" MEDIA="print">
<table cellpadding=1 cellspacing=1 border=0 width="100%">
  <tr>

    <td align="center" valign="middle"><IMG width=800 height=36 style="display:block; float:none" src="images/Title_Commitment_Utah_img_0.jpg"></td>
	</tr></table>

	<table cellpadding=1 cellspacing=1 border=0 width="100%">
  <tr>

    <td align="center" valign="middle">
		<font size="6" face="Verdana, Arial, Helvetica, sans-serif"><strong>
        </strong></font>

		</td>
	</tr></table>

	<table cellpadding=1 cellspacing=1 border=0 width="100%">
        <tr>
          <td align = "center"><p>
		  <B>
		<U>WIRING INSTRUCTIONS</U>  <br><br>

				 FOR ALL PROPERTIES EXCEPT <br>
FLORIDA AND VIRGINIA<br><br>

CITIBANK<br>
ABA # 254070116<br>
ACCOUNT # 15218279<br><br>


FOR VIRGINIA PROPERTIES<br><br>

CITIBANK<br>
ABA # 254070116<br>
ACCOUNT # 15158551<br><br>


FOR FLORIDA PROPERTIES<br><br>

CITIBANK<br>
ABA # 254070116<br>
ACCOUNT # 15158535<br></b>
		  </p>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		  </td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr align="left" valign="top">
          <td><B></b></td>
        </tr>
      </table>

</td></tr></table><!------3rd page ends ------>
<table cellpadding=1 cellspacing=1 border=0 width="100%">
  <tr><cfoutput>
    <td align="left" valign="middle" width="50%"><font color="gray">Commitment - #read_Title.Title_ID#</font></td>
		<td align="right" valign="middle" width="50%"><font color="gray">File - #read_Title.Title_ID#</font></td></cfoutput>
	</tr></table>
</IE:DEVICERECT>

</body>
</html>
