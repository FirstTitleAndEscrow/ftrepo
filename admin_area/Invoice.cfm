<!--Group By to seperate companies--->
<CFQUERY datasource="#request.dsn#" NAME="Read_billing_company">
    SELECT     Billing_Company_ID
    FROM         Billing
    GROUP BY Billing_Company_ID
    Order By Billing_Company_ID
</CFQUERY>



<CFLOOP QUERY="Read_billing_company">
    <!---Set Variables --->
    <CFSET TitleTotal = 0 >
    <CFSET PropTotal = 0 >
    <CFSET AppraisalTotal = 0 >
    <CFSET SigningTotal = 0 >
    <CFSET GrandTotal = 0>

    <CFQUERY datasource="#request.dsn#" NAME="Read_company">
        Select * from companies where id = #Read_billing_company.Billing_Company_ID#
    </CFQUERY>

    <CFQUERY datasource="#request.dsn#" NAME="Read_billing_title">
        SELECT      Billing.Billing_Type, Billing.Billing_Order_ID,
                    Billing_Detail.Billing_Description, Billing_Detail.Billing_Charge,
                    Billing.Billing_Company_ID, Billing.Billing_Borrower
        FROM        Billing INNER JOIN
                    Billing_Detail ON Billing.Billing_Order_ID = Billing_Detail.Billing_Order_ID
                    AND Billing.Billing_Type = Billing_Detail.Billing_Type
        Where       Billing.Billing_Type = 'T' AND (Billing.Billing_Company_ID = #Read_company.ID#)
    </CFQUERY>

    <CFQUERY datasource="#request.dsn#" NAME="Read_Billing_property">
         SELECT     Billing.Billing_Type, Billing.Billing_Order_ID,
                    Billing_Detail.Billing_Description, Billing_Detail.Billing_Charge,
                    Billing.Billing_Company_ID, Billing.Billing_Borrower
        FROM        Billing INNER JOIN
                    Billing_Detail ON Billing.Billing_Order_ID = Billing_Detail.Billing_Order_ID
                    AND Billing.Billing_Type = Billing_Detail.Billing_Type
        Where       Billing.Billing_Type = 'P' AND (Billing.Billing_Company_ID = #Read_company.ID#)
    </CFQUERY>

    <CFQUERY datasource="#request.dsn#" NAME="Read_Billing_appraisal">
         SELECT     Billing.Billing_Type, Billing.Billing_Order_ID,
                    Billing_Detail.Billing_Description, Billing_Detail.Billing_Charge,
                    Billing.Billing_Company_ID, Billing.Billing_Borrower
        FROM        Billing INNER JOIN
                    Billing_Detail ON Billing.Billing_Order_ID = Billing_Detail.Billing_Order_ID
                    AND Billing.Billing_Type = Billing_Detail.Billing_Type
        Where       Billing.Billing_Type = 'A' AND (Billing.Billing_Company_ID = #Read_company.ID#)
    </CFQUERY>

    <CFQUERY datasource="#request.dsn#" NAME="Read_Billing_Signing">
        SELECT      Billing.Billing_Type, Billing.Billing_Order_ID,
                    Billing_Detail.Billing_Description, Billing_Detail.Billing_Charge,
                    Billing.Billing_Company_ID, Billing.Billing_Borrower
        FROM        Billing INNER JOIN
                    Billing_Detail ON Billing.Billing_Order_ID = Billing_Detail.Billing_Order_ID
                    AND Billing.Billing_Type = Billing_Detail.Billing_Type
        Where       Billing.Billing_Type = 'S' AND (Billing.Billing_Company_ID = #Read_company.ID#)
    </CFQUERY>

<!---
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

</div>--->
<!---<IE:DEVICERECT ID="page1" CLASS="masterstyle" MEDIA="print">--->

<!---Checking the Record Counts--->
<CFSET #Flag# = "0">

<CFIF #Read_Billing_title.RecordCount# gte "1">
    <CFSET Flag = "1">
<CFELSEIF #Read_Billing_property.RecordCount# gte "1">
    <CFSET Flag = "1">
<CFELSEIF #Read_Billing_appraisal.RecordCount# gte "1">
    <CFSET Flag = "1">
<CFELSEIF #Read_Billing_signing.RecordCount# gte "1" >
    <CFSET Flag = "1">
<CFELSE>
    <CFSET Flag = "0">
</CFIF>

<CFIF #Flag# eq "1">
<p>
<table cellpadding="0" cellspacing="0" width="80%"  border="0">
<CFOUTPUT>
    <tr>
        <td>
	        <BR>
	    </td>
    </tr>
	<tr>
    	<td align="middle" valign="bottom" colspan="2">
      		<P align=left><strong><FONT size=5>
			INVOICE<br><br></FONT>
        	</strong></P>
	 	</td>
  	</tr>
  	<tr>
		<td valign="top" colspan="2">
			First Title &amp; Escrow, Inc.
		</td>
	</tr>
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
			#Read_company.company#</font>
		</td>
  	</tr>
    <tr>
  		<td colspan="2" height="10"><font size="2" face="Arial, Helvetica, sans-serif">
			#Read_company.addr1#</font>
		</td>
  	</tr>
    <CFIF #len(read_company.addr2)# gt 1>
        <tr>
  		    <td colspan="2" height="10"><font size="2" face="Arial, Helvetica, sans-serif">
			    #Read_company.addr2#</font>
		    </td>
  	    </tr>
	</CFIF>
    <tr>
        <td colspan="2" height="10"><font size="2" face="Arial, Helvetica, sans-serif">
            #read_company.city#, #read_company.state# #read_company.zip_code#
        </td>
    </tr>
    <tr>
  		<td colspan="2" height="10"><B>Email:</B>  <font size="2" face="Arial, Helvetica, sans-serif">
			#Read_company.email#</font>
		</td>
  	</tr>
	<tr>
		<td colspan="2" height="10"><B>Phone:  </B><font size="2" face="Arial, Helvetica, sans-serif">
			#Read_company.phone#
		</td>
  	</tr>
    <tr>
  		<td colspan="2" height="10"><B>Fax:  </B><font size="2" face="Arial, Helvetica, sans-serif">
			#Read_company.fax#</font><br><br>
		</td>
  	</tr>
	<TR>
  		<td valign="top" colspan="2">
			<B>Re</B>
		</td>
	</tr>
	<tr>
		<td valign="top">

		</td>
		<td>
      		<P><STRONG>Date</STRONG>:<b><font size="2" color = "blue" face="Arial, Helvetica, sans-serif">  #DateFormat(Now(),"mm/dd/yyyy")#&nbsp;</font></b></P>
      	</td>
	</tr>
</CFOUTPUT>
	<tr>
        <td colspan="3">
        <B>Services Rendered</B><br><br>
        </td>
    </tr>
    <TR>
        <td colspan="4">
            <HR>
        </td>
        </tr>
    <CFIF #Read_Billing_title.RecordCount# gte "1" >
        <tr>
            <td>
                <b>Title Services</b>
            </td>
        </tr>
        <tr>
            <td>
                <b>Borrower Name</b>
            </td>
            <td>
                <b>Order Number</B>
            </td>
            <td>
                <b>Charges</B>
            </td>
        </tr>
        <CFOUTPUT QUERY="Read_Billing_title" StartRow="1" MAXROWS="10000">
            <tr>
                <td>
                    #Read_Billing_title.billing_borrower#
                </td>

                <td>
                    T-#Read_Billing_title.billing_order_ID#<BR><br>
                </td>
            </tr>
            <tr>
                    <td colspan="3" align="center">
                       #Read_Billing_title.billing_description#
                    </td>
                    <td colspan="1">
                        #dollarformat(read_billing_title.Billing_Charge)#
                    </td>
            </tr>
            <CFSET TitleTotal = #TitleTotal# + #read_billing_title.Billing_Charge# >
        </CFOUTPUT>
        <tr>
            <td colspan = "3" align="right">
                <B><CFOUTPUT>Total Title Service Charges #dollarformat(TitleTotal)#</CFOUTPUT></B>
            </td>
        </tr>
        <TR>
            <td colspan="4">
                <HR>
            </td>
        </tr>
    </CFIF>
    <!---Property Orders--->
    <CFIF #Read_Billing_property.RecordCount# gte "1" >
        <tr>
            <td>
                <b>Property Orders</b>
            </td>
        </tr>
        <tr>
            <td>
                <b>Borrower Name</b>
            </td>
            <td>
                <b>Order Number</B>
            </td>
            <td>
                <b>Charges</B>
            </td>
        </tr>
        <CFOUTPUT QUERY="Read_Billing_Property" StartRow="1" MAXROWS="10000">
            <tr>
                <td>
                    #Read_Billing_property.billing_borrower#
                </td>
                <td>
                    P-0232#Read_Billing_property.billing_order_ID#<BR><br>
                </td>
            </tr>
            <tr>
                    <td colspan="3" align="center">
                       #Read_Billing_property.Billing_Description#
                    </td>
                    <td colspan="1">
                        #dollarformat(read_billing_property.Billing_Charge)#
                    </td>
                </tr>
                <CFSET PropTotal = #PropTotal# + #read_billing_property.Billing_Charge# >
        </CFOUTPUT>
        <tr>
            <td colspan = "3" align="right">
                <B><CFOUTPUT>Total Property Service Charges #dollarformat(PropTotal)#</CFOUTPUT></B>
            </td>
        </TR>
        <TR>
            <td colspan="4">
                <HR>
            </td>
        </tr>
    </CFIF>
<!---Appraisal Services --->
    <CFIF #Read_Billing_appraisal.RecordCount# gte "1" >
        <tr>
            <td>
                <b>Appraisal Services</b>
            </td>
        </tr>
        <tr>
            <td>
                <b>Borrower Name</b>
            </td>
            <td>
                <b>Order Number</B>
            </td>
            <td>
                <b>Charges</B>
            </td>
        </tr>
         <CFOUTPUT QUERY="Read_Billing_Appraisal" StartRow="1" MAXROWS="10000">
            <tr>
                <td>
                    #Read_Billing_appraisal.billing_borrower#
                </td>
                <td>
                    A-#Read_Billing_appraisal.billing_order_ID#<BR><br>
                </td>
            </tr>

                <tr>
                    <td colspan="3" align="center">
                        #Read_Billing_appraisal.Billing_Description#
                    </td>
                    <td colspan="1">
                        #dollarformat(read_billing_appraisal.Billing_Charge)#
                    </td>
                </tr>
                <CFSET AppraisalTotal = #AppraisalTotal# + #read_billing_appraisal.Billing_Charge# >

        </CFOUTPUT>
        <tr>
            <td colspan = "3" align="right">
                <B><CFOUTPUT>Total Appraisal Charges #dollarformat(AppraisalTotal)#</CFOUTPUT></B>
            </td>
        </TR>
        <TR>
            <td colspan="4">
                <HR>
            </td>
        </tr>
    </CFIF>
    <!---Signing Services --->
    <CFIF #Read_Billing_signing.RecordCount# gte "1" >
        <tr>
            <td>
                <b>Signing Services</b>
            </td>
        </tr>
        <tr>
            <td>
                <b>Borrower Name</b>
            </td>
            <td>
                <b>Order Number</B>
            </td>
            <td>
                <b>Charges</B>
            </td>
        </tr>
        <CFOUTPUT QUERY="Read_Billing_Signing" StartRow="1" MAXROWS="10000">
            <tr>
                <td>
                    #Read_Billing_signing.billing_borrower#
                </td>
                <td>
                    S-#Read_Billing_signing.billing_order_ID#<BR><br>
                </td>
            </tr>
            <tr>
                    <td colspan="3" align="center">
                        #Read_Billing_signing.Billing_Description#
                    </td>
                    <td colspan="1">
                        #dollarformat(read_billing_signing.Billing_charge)#
                    </td>
                </tr>
                <CFSET SigningTotal = #SigningTotal# + #read_billing_Signing.Billing_Charge# >

        </CFOUTPUT>
        <tr>
            <td colspan = "3" align="right">
                <B><CFOUTPUT>Total Signing Charges #dollarformat(SigningTotal)#</CFOUTPUT></B>
            </td>
        </TR>
        <TR>
            <td colspan="4">
                <HR>
            </td>
        </tr>
    </CFIF>
    <CFOUTPUT>
        <CFSET GrandTotal = #TitleTotal# + #PropTotal# + #AppraisalTotal# + #SigningTotal#>
        <tr>
            <td colspan = "3" align="right">
                <b>Grand Total #DollarFOrmat(GrandTotal)#</b>
            </td>
        <tr>
    </CFOUTPUT>
</table>
</CFIF>
</p>
<!---</IE:DEVICERECT>--->
</BODY>
</html>
</CFLOOP>
