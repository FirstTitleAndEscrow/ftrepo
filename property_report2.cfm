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
			<cfif read_title.comp_id eq 2818>
			Fee: $250.00<br>
<cfif read_title.loan_number NEQ '' and read_title.loan_number NEQ 'NULL'>Loan Number: #read_title.loan_number#<cfelse>File Number: #read_title.prop_id#</cfif><br>
Due Upon Receipt</FONT>
        	</P>
			<cfelse>
			&nbsp;
			</cfif>
	 	</td> 	</tr>
  	<tr>
		<td valign="top" colspan="2">
			<!---First Title &amp; Escrow, Inc.
            Changed 12/8/04 Harry per Pam
            --->Abstracts USA
		</td>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
	<TR>
		<td valign="top" colspan="2">30 West Gude Dr, Rockville,
      		MD 20850
	 	</td>

	</TR>
<cfelse>
	<TR>
		<td valign="top" colspan="2">7361 Calhoun Place, Suite 200, Rockville,
      		MD 20855
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
	<CFQUERY datasource="#request.dsn#" NAME="read_title_update">
    select *
    from prop_ins_view
	WHERE prop_id = #url.rec_ID# and selectedOrgs is not null
    </cfquery>
    <tr>
		<td valign="top">
			#Read_Title.blastname1#, #Read_Title.bfirstname1#
		</td>
		<td>
      		<P><STRONG>Date of Search</STRONG>:<b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">  #DateFormat(read_Title_update.search_date, "mm/dd/yyyy")#&nbsp;</font></b></P>
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
    	<td valign = "top" width="50%"><STRONG>County
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
        <td valign="top" colspan="2">
            Type of Deed:  <b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">#read_title_update.data5#</font></b>
        </td>
    </tr>
    <tr>
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
			<!---#read_title_update.data6#--->
			Tenancy Not Stated
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
			from prop_ins_view WHERE prop_id
  			= #url.rec_ID# and selectedOrgs4 = 1
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
</td></tr></table>
</IE:DEVICERECT>




<IE:DEVICERECT ID="page2" CLASS="masterstyle" MEDIA="print">
<table  width="90%" cellpadding="3" cellspacing="0" border="0">
  	<CFQUERY NAME="read_mortgage2" datasource="#request.dsn#">
			select * from prop_ins_view WHERE prop_id
  			= #url.rec_ID# and selectedOrgs4 = 2
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
    	<td>
    </tr>
   <tr>
    	<td valign="top">Amount:
			<FONT face="Arial, Helvetica, sans-serif" color=blue size=2><STRONG>#read_mortgage2.data4#</STRONG></FONT>
		</td>
        <td>
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
    	<td valign="top">
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

</IE:DEVICERECT>


<IE:DEVICERECT ID="page3" CLASS="masterstyle" MEDIA="print">

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
		</tr></table></td>			</td>
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
			THANK YOU, Abstracts USA
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

</table>
</p>
</IE:DEVICERECT>



<IE:DEVICERECT ID="page4" CLASS="masterstyle" MEDIA="print">


<CFQUERY NAME="read_legal" datasource="#request.dsn#">
	select * from prop_ins_view WHERE prop_id
  	= #url.rec_ID# AND (type = 'DATA') ORDER BY insert_date, insert_time DESC
 </CFQUERY>
<cfoutput>


<table  width="90%" cellpadding="3" cellspacing="0" border="0">
	<tr bgcolor="black">
    	<td align="middle" valign="top" colspan=2><strong><font color = "white">Appendix A
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
