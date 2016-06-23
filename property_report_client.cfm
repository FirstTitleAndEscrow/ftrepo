
<CFPARAM NAME="a_trigger" DEFAULT="0">


		<CFQUERY datasource="#request.dsn#" NAME="read_Title">

			SELECT *
			FROM Property
			WHERE prop_ID = #rec_ID#

		</CFQUERY>
			<CFSET Buyer_1 = #read_Title.bfirstname1# & " " & #read_Title.bminame1# & " " & #read_Title.blastname1#>

			<CFSET Buyer_2 = #read_Title.bfirstname2# & " " & #read_Title.bminame2# & " " & #read_Title.blastname2#>

			<CFSET Seller_1 = #read_Title.sfirstname1# & " " & #read_Title.sminame1# & " " & #read_Title.slastname1#>

			<CFSET Seller_2 = #read_Title.sfirstname2# & " " & #read_Title.sminame2# & " " & #read_Title.slastname2#>

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
		FROM  Company_Billing_states
		WHERE company_id = '#read_title.comp_id#' AND a_states = '#read_title.pstate#'

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

<p>

<CFOUTPUT>


<table cellpadding="0" cellspacing="0" align="center" width="98%" border="0">
  <tr>
    <td align="center" valign="bottom" colspan="2"><font size="6"><strong>FIRST
      TITLE & ESCROW, INC.</strong></font></td>
  </tr>
  <tr>
    <td valign="top" colspan="2"><hr size="4" color="000000" noshade width="465"></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif"><br>&nbsp;<br></font></td>
  </tr>
  <tr>
    <td width="50%">Date:  <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#DateFormat(read_Title.check_date, "mm/dd/yyyy")#</font></b>	</td>
    <td>Order No.: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">P-#read_Title.prop_ID#</font></b></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td>Effective Date:<CFQUERY datasource="#request.dsn#" NAME="read_title_update">
				select * from prop_ins_view
				WHERE prop_id = #url.rec_ID# and selectedOrgs is not null
				</cfquery>
					<CFIF #read_title_update.recordcount# GT 0 and #read_title_update.data1# neq "">

				<b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#DateFormat(read_title_update.data37, "mm")#/#DateFormat(read_title_update.data37, "dd")#/#DateFormat(read_title_update.data37, "yyyy")#</font></b>

					 <cfelse>
				</cfif></td>
    <td>Invoice No.:</td>
  </tr>
  <tr>
    <td colspan="2" valign="top"><hr color="000000" size="2"></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" align="center" valign="top"><u><strong>Customer Information</strong></u></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="2" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#Buyer_1#, #Buyer_2#</font></b></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Property Address: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_title.paddress#, #read_title.pcity#, #read_title.pstate#, #read_title.pzip#</font></b></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Municipality/County: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_title.pcounty#</font></b></td>
  </tr>
  <tr>
    <td colspan="2" valign="top"><hr color="000000" size="2"></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" align="center" valign="top"><u><strong>Deed Information</strong></u></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Grantee: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_title_update.data3# #read_title_update.data4#, #read_title_update.data6#</font></b></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Grantor: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_title_update.data1# #read_title_update.data2#</font></b></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Consideration: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_title_update.data16#</font></b></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Instrument No.: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_title_update.data7#</font></b></td>
    <td>Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_title_update.data8#/#read_title_update.data9#</font></b></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#DateFormat(read_title_update.data10, "mm/dd/yyyy")#</font></b></td>
    <td>Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#DateFormat(read_title_update.data11, "mm/dd/yyyy")#</font></b></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Legal Description: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">See attached</font></b></td>
  </tr>
  <tr>
    <td colspan="2" valign="top"><hr color="000000" size="2"></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" align="center" valign="top"><u><strong><font size="3">Tax Information</font></strong></u></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Taxes (year): <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_tax_info.data29#</font></b></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Due Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_tax_info.data30#</font></b></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_tax_info.data28#</font></b></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Tax ID No.: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_tax_info.data19#</font></b></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Status: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_tax_info.data31#</font></b></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">How often: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_tax_info.data37#</font></b></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Additional info: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_tax_info.data34#</font></b></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top"><hr color="000000" size="2"></td>
  </tr>
  </cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_mortgage">
			select * from prop_ins_view
			WHERE prop_id = #url.rec_ID# and selectedOrgs4 = 1
		</cfquery>
		<cfoutput query = "read_mortgage">

  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" align="center" valign="top"><u><strong>Mortgage/Deed of Trust Information</strong></u></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Mortgagee: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage.data1#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Trustee: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage.data10#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Mortgagor: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage.data2#  #read_mortgage.data3#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage.data4#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage.data8#</td>
    <td>Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage.data9# </td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage.data6#/#read_mortgage.data7#</td>
    <td>Document No.: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage.data5#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">&nbsp;</td>
    <td>Open Ended (Y/N) <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage.data33#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Assigned to: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage.data13#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">&nbsp;</td>
    <td>Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage.data17#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage.data20#/#read_mortgage.data21#</td>
    <td>Document No.: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage.data19#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Are there any open assignements or mortgages to Midfirst Bank (y/n):</td>
  </tr>
  <tr>
    <td colspan="2" valign="top"><hr color="000000" size="2"></td>
  </tr>
    <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top"><hr color="000000" size="2"></td>
  </tr>
  </cfoutput>
  <CFQUERY datasource="#request.dsn#" NAME="read_mortgage2">
			select * from prop_ins_view
			WHERE prop_id = #url.rec_ID# and selectedOrgs4 = 2
	</cfquery>

	<cfoutput query = "read_mortgage2">

  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" align="center" valign="top"><u><strong>Mortgage/Deed of Trust Information</strong></u></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Mortgagee: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage2.data1#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Trustee: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage2.data10#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Mortgagor: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage2.data2#  #read_mortgage2.data3#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage2.data4#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage2.data8#</td>
    <td>Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage2.data9# </td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage2.data6#/#read_mortgage2.data7#</td>
    <td>Document No.: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage2.data5#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">&nbsp;</td>
    <td>Open Ended (Y/N) <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage2.data33#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Assigned to: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage2.data13#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">&nbsp;</td>
    <td>Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage2.data17#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage2.data20#/#read_mortgage2.data21#</td>
    <td>Document No.: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage2.data19#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Are there any open assignements or mortgages to Midfirst Bank (y/n):</td>
  </tr>
  <tr>
    <td colspan="2" valign="top"><hr color="000000" size="2"></td>
  </tr>
    <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
	<tr>
    <td colspan="2" valign="top"><hr color="000000" size="2"></td>
  </tr>
	</cfoutput>

  	<CFQUERY datasource="#request.dsn#" NAME="read_mortgage3">
			select * from prop_ins_view
			WHERE prop_id = #url.rec_ID# and selectedOrgs4 = 3
			</cfquery>

			<cfoutput query = "read_mortgage3">


  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" align="center" valign="top"><u><strong>Mortgage/Deed of Trust Information</strong></u></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Mortgagee: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage3.data1#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Trustee: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage3.data10#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Mortgagor: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage3.data2#  #read_mortgage3.data3#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage3.data4#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage3.data8#</td>
    <td>Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage3.data9# </td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage3.data6#/#read_mortgage3.data7#</td>
    <td>Document No.: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage3.data5#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">&nbsp;</td>
    <td>Open Ended (Y/N) <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage3.data33#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Assigned to: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage3.data13#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">&nbsp;</td>
    <td>Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage3.data17#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage3.data20#/#read_mortgage3.data21#</td>
    <td>Document No.: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage3.data19#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Are there any open assignements or mortgages to Midfirst Bank (y/n):</td>
  </tr>
  <tr>
    <td colspan="2" valign="top"><hr color="000000" size="2"></td>
  </tr>
    <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
		<tr>
    <td colspan="2" valign="top"><hr color="000000" size="2"></td>
  </tr>
			</cfoutput>

  <CFQUERY datasource="#request.dsn#" NAME="read_mortgage4">
			select * from prop_ins_view
			WHERE prop_id = #url.rec_ID# and selectedOrgs4 = 4
			</cfquery>

			<cfoutput query = "read_mortgage4">

  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" align="center" valign="top"><u><strong>Mortgage/Deed of Trust Information</strong></u></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Mortgagee: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage4.data1#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Trustee: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage4.data10#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Mortgagor: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage4.data2#  #read_mortgage4.data3#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage4.data4#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage4.data8#</td>
    <td>Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage4.data9# </td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage4.data6#/#read_mortgage4.data7#</td>
    <td>Document No.: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage4.data5#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">&nbsp;</td>
    <td>Open Ended (Y/N) <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage4.data33#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Assigned to: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage4.data13#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">&nbsp;</td>
    <td>Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage4.data17#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage4.data20#/#read_mortgage4.data21#</td>
    <td>Document No.: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage4.data19#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Are there any open assignements or mortgages to Midfirst Bank (y/n):</td>
  </tr>
  <tr>
    <td colspan="2" valign="top"><hr color="000000" size="2"></td>
  </tr>
    <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
			<tr>
    <td colspan="2" valign="top"><hr color="000000" size="2"></td>
  </tr>
			</cfoutput>

  <CFQUERY datasource="#request.dsn#" NAME="read_mortgage5">
			select * from prop_ins_view
			WHERE prop_id = #url.rec_ID# and selectedOrgs4 = 5
			</cfquery>

			<cfoutput query = "read_mortgage5">

  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" align="center" valign="top"><u><strong>Mortgage/Deed of Trust Information</strong></u></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Mortgagee: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage5.data1#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Trustee: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage5.data10#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Mortgagor: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage5.data2#  #read_mortgage5.data3#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage5.data4#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage5.data8#</td>
    <td>Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage5.data9# </td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage5.data6#/#read_mortgage5.data7#</td>
    <td>Document No.: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage5.data5#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">&nbsp;</td>
    <td>Open Ended (Y/N) <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage5.data33#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Assigned to: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage5.data13#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">&nbsp;</td>
    <td>Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage5.data17#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage5.data20#/#read_mortgage5.data21#</td>
    <td>Document No.: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_mortgage5.data19#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Are there any open assignements or mortgages to Midfirst Bank (y/n):</td>
  </tr>
  <tr>
    <td colspan="2" valign="top"><hr color="000000" size="2"></td>
  </tr>
    <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top"><hr color="000000" size="2"></td>
  </tr>
  </cfoutput>
  <CFQUERY datasource="#request.dsn#" NAME="read_lien">
			select * from prop_ins_view
			WHERE prop_id = #url.rec_ID# and selectedOrgs3 = 1
			</cfquery>
			  <CFQUERY datasource="#request.dsn#" NAME="read">
			select * from property
			WHERE prop_id = #url.rec_ID#
			</cfquery>
		<cfoutput query = "read_lien">
  <tr>
    <td colspan="2" align="center" valign="top"><u><strong>Judgment and Lien Information</strong></u></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#  #read.bfirstname2#  #read.blastname2#</td>
    <td>Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien.data1#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">&nbsp;</td>
    <td>Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien.data9#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien.data4#</td>
    <td>Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien.data5#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien.data2#/#read_lien.data3#</td>
  </tr><tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien.data7#</td>
  </tr><tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien.data6#</td>
  </tr>
 <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien.data8#</td>
  </tr>
  <tr>
    <td colspan="2" valign="top"><hr color="000000" size="2"></td>
  </tr>
</cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_lien2">
			select * from prop_ins_view
			WHERE prop_id = #url.rec_ID# and selectedOrgs3 = 2
			</cfquery>
		<cfoutput query = "read_lien2">
		  <tr>
    <td colspan="2" align="center" valign="top"><u><strong>Judgment and Lien Information</strong></u></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#  #read.bfirstname2#  #read.blastname2#</td>
    <td>Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien2.data1#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">&nbsp;</td>
    <td>Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien2.data9#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien2.data4#</td>
    <td>Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien2.data5#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien2.data2#/#read_lien2.data3#</td>
  </tr><tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien2.data7#</td>
  </tr><tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien2.data6#</td>
  </tr>
 <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien2.data8#</td>
  </tr>
  <tr>
    <td colspan="2" valign="top"><hr color="000000" size="2"></td>
  </tr>
		</cfoutput>


			<CFQUERY datasource="#request.dsn#" NAME="read_lien3">
			select * from prop_ins_view
			WHERE prop_id = #url.rec_ID# and selectedOrgs3 = 3
			</cfquery>
		<cfoutput query = "read_lien3">
				  <tr>
    <td colspan="2" align="center" valign="top"><u><strong>Judgment and Lien Information</strong></u></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#  #read.bfirstname2#  #read.blastname2#</td>
    <td>Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien3.data1#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">&nbsp;</td>
    <td>Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien3.data9#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien3.data4#</td>
    <td>Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien3.data5#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien3.data2#/#read_lien3.data3#</td>
  </tr><tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien3.data7#</td>
  </tr><tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien3.data6#</td>
  </tr>
 <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien3.data8#</td>
  </tr>
  <tr>
    <td colspan="2" valign="top"><hr color="000000" size="2"></td>
  </tr>
		</cfoutput>
		<CFQUERY datasource="#request.dsn#" NAME="read_lien4">
			select * from prop_ins_view
			WHERE prop_id = #url.rec_ID# and selectedOrgs3 = 4
			</cfquery>
		<cfoutput query = "read_lien4">
						  <tr>
    <td colspan="2" align="center" valign="top"><u><strong>Judgment and Lien Information</strong></u></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#  #read.bfirstname2#  #read.blastname2#</td>
    <td>Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien4.data1#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">&nbsp;</td>
    <td>Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien4.data9#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien4.data4#</td>
    <td>Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien4.data5#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien4.data2#/#read_lien4.data3#</td>
  </tr><tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien4.data7#</td>
  </tr><tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien4.data6#</td>
  </tr>
 <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien4.data8#</td>
  </tr>
  <tr>
    <td colspan="2" valign="top"><hr color="000000" size="2"></td>
  </tr>
		</cfoutput>
			<CFQUERY datasource="#request.dsn#" NAME="read_lien5">
			select * from prop_ins_view
			WHERE prop_id = #url.rec_ID# and selectedOrgs3 = 5
			</cfquery>
		<cfoutput query = "read_lien5">
								  <tr>
    <td colspan="2" align="center" valign="top"><u><strong>Judgment and Lien Information</strong></u></td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Customer Name: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read.bfirstname1# #read.blastname1#  #read.bfirstname2#  #read.blastname2#</td>
    <td>Case Number: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien5.data1#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">&nbsp;</td>
    <td>Recorded Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien5.data9#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top">Dated Date: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien5.data4#</td>
    <td>Amount: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien5.data5#</td>
  </tr>
  <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Book/Page: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien5.data2#/#read_lien5.data3#</td>
  </tr><tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Defendant: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien5.data7#</td>
  </tr><tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Plaintiff: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien5.data6#</td>
  </tr>
 <tr>
    <td colspan="2" height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td colspan="2" valign="top">Additional Information: <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_lien5.data8#</td>
  </tr>
  <tr>
    <td colspan="2" valign="top"><hr color="000000" size="2"></td>
  </tr>
		</cfoutput>
			<CFQUERY datasource="#request.dsn#" NAME="read_legal">
			select * from prop_ins_view
			WHERE prop_id = #url.rec_ID#
			</cfquery>
		<cfoutput>
								  <tr>
    <td align="center" valign="top"><u><strong>Legal</strong></u></td>
  </tr>
  <tr>
    <td height="10"><font size="1" face="Arial, Helvetica, sans-serif">&nbsp;</font></td>
  </tr>
  <tr>
    <td valign="top"><b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_legal.notes#</td>
  </tr>

  <tr>
    <td colspan="2" valign="top"><hr color="000000" size="2"></td>
  </tr>
		</cfoutput>
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
