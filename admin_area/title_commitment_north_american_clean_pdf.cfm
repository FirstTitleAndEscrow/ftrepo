<cfdocument
format="PDF" 
filename="#request.rootdir#\admin_area\tcs\TC-#read_title.title_id#.pdf" 
overwrite="yes" 
unit = "IN" 
marginbottom = ".5" 
marginleft = ".5" 
marginright = ".5" 
margintop = "1.5" 
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

<cfif read_title.loanamt_float neq '' and read_title.loanamt_float neq 'NULL'>
<cfset read_title.loanamt_float = ReplaceNoCase(read_title.loanamt_float, ",", "", "ALL")>
</cfif>

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

<cfparam name="company_id" default="#read_title.comp_id#">


<cfif read_title.comp_id eq 3182 or read_title.comp_id eq 2368 or read_title.comp_id eq 2430  or ListContainsNoCase(children, read_title.comp_id, ",") or read_title.title_id eq 52555>
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
<cfif #read_title.comp_id# eq 5026 or #read_title.comp_id# eq 4177 or read_title.title_id eq 52555>
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
td {font-family:Arial, Helvetica, sans-serif; font-size:10px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:16px}
</style>
</cfdocumentitem >

<cfdocumentitem type="footer">
</cfdocumentitem >

<body style="background-color: #FFFFFF; font-family:Arial, Helvetica, sans-serif; font-size:10px" >
<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:10px}
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
td {font-family:Arial, Helvetica, sans-serif; font-size:10px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:16px}
</style>
</cfdocumentitem >

<cfdocumentitem type="footer">
</cfdocumentitem >

<body style="background-color: #FFFFFF; font-family:Arial, Helvetica, sans-serif; font-size:10px" >

<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:10px}
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




<cfif #read_title.comp_id# eq "254" or read_title.title_id eq 52555>
<cfdocumentsection>
<cfdocumentitem type="header">
<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:10px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:16px}
</style>
</cfdocumentitem >

<cfdocumentitem type="footer">
</cfdocumentitem >

<body style="background-color: #FFFFFF; font-family:Arial, Helvetica, sans-serif; font-size:10px" >

<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:10px}
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







<CFIF #read_Title.pstate# eq "CA"  or read_title.title_id eq 52555>
<cfdocumentsection>
<cfdocumentitem type="header">
<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:10px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:16px}
</style>
</cfdocumentitem >

<cfdocumentitem type="footer">
</cfdocumentitem >

<body style="background-color: #FFFFFF; font-family:Arial, Helvetica, sans-serif; font-size:10px" >

<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:10px}
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
            <a href="https://#cgi.server_name#" target="_blank">#cgi.server_name#</a></B></Center>
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









<!--- =================[ BEGIN SCHEDULE A         ]======================== --->
<!--- ====================================================================== --->
<cfdocumentsection>
<cfdocumentitem type="header">
<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:10px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:16px}

</style>

<table width="100%" cellpadding=0 cellspacing=0 border=0 style="height:40px;">
    <tr>
          <td>
<center><br>
<B><strong><span class="big_header">North American Title Insurance Company</span></strong><BR>
<span="small_header">COMMITMENT FOR TITLE INSURANCE FORM</span></B><br>
<br>
Name and address of Title Insurance Company<br>
<strong>North American Title Insurance Company, 1855 Gateway Blvd., Suite 600, Concord, CA 94520<br>
<br>
<b>SCHEDULE A</b></strong><br><br>
</strong>
</center>
          </td>
    </tr>
</table>
</cfdocumentitem >
<cfdocumentitem type="footer">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left"><font color="black" size="1">ALTA Commitment (6-17-06) Schedule A<br>
Valid only if Schedule B and Cover are attached</font></td>
  </tr>
</table>
</cfdocumentitem >

<body style="background-color: #FFFFFF; font-family:Arial, Helvetica, sans-serif; font-size:10px" >
<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:10px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:16px}

</style>

<table width="100%" cellpadding=0 cellspacing=0 border=0 >
<tr>
		  <td align="left" valign="middle" bgcolor="ffffff"><strong>THIS DOCUMENT CONSTITUTES A STATEMENT OF THE TERMS AND CONDITIONS ON WHICH A TITLE INSURER IS WILLING TO ISSUE A POLICY OF TITLE INSURANCE IF THE TITLE INSURER ACCEPTS THE PREMIUM FOR THE POLICY.  IT IS NOT A REPRESENTATION AS TO THE STATE OF TITLE AND IT DOES NOT CONSTITUTE AN ABSTRACT OF TITLE.</strong></td>
	</tr>
</table>
<br>
<table width="100%" cellpadding=0 cellspacing=0 border=0 >
	<tr>
		  <td  valign="top" align="left" colspan=2>File No. T-<cfoutput>#url.rec_ID#</cfoutput><br></td>

<br>
&nbsp;<br>

        </tr>


		<tr>
          <td width="2%">&nbsp;</td>
          <td width="10%" align="left" valign="top">1. </td>
          <td colspan="2" valign="top">Effective Date:
            <CFQUERY datasource="#request.dsn#" NAME="read_title_update">
            select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs
            is not null </cfquery>
			<CFIF #read_title_update.recordcount# GT 0 and #read_title_update.data1# neq "">
              <cfoutput>
				#DateFormat(read_title_update.data37, "mm")#/#DateFormat(read_title_update.data37, "dd")#/#DateFormat(read_title_update.data37, "yyyy")#
				 </cfoutput>
              <cfelse>
            </cfif> <br></td>
        </tr>
        <!-------- ( 1.) ends --------------->
        <tr>
          <td colspan="4">&nbsp;</td>
        </tr>
        <!-------- ( 2.) starts --------------->
        <CFOUTPUT>
          <tr>
            <td width="2%">&nbsp;</td>
            <td width="10%" align="left" valign="top">2. </td>
            <td width="68%" valign="top">Policy or Policies to be issued:</td>
            <td width="25%" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td valign="top">
			<table width="100%" valign="top" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td align="right" valign="top">(a)</td>
                  <td width="20">&nbsp;</td>
                  <td width="90%">ALTA Owner's Policy (6-17-06)<BR>
Proposed Policy Amount&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$<B> <cfif IsNumeric(Trim(read_title.purchase)) and #read_title.purchase# neq "" and #read_title.purchase# neq 0 and #read_title.purchase# neq 'NULL'>#NumberFormat(read_title.purchase, "999,999,999.00")#<cfelse>TBD</cfif></B><br><br>

Proposed Insured: <cfif #read_title.purchase# neq "" and  #read_title.purchase# neq 0 and  #read_title.purchase# neq "NULL">#Buyer_1#, &nbsp;&nbsp;#Buyer_2#<cfif Len(read_title.blastname3)>, #read_title.bfirstname3# #read_title.blastname3# </cfif><cfif Len(read_title.blastname4)>, #read_title.bfirstname4# #read_title.blastname4# </cfif><cfelse>TBD</cfif><br>
</td>
                </tr>
              </table></td>
            <td align="center" valign="top">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td valign="top"> <table width="100%" valign="top" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td align="right" valign="top">(b)</td>
                  <td width="20">&nbsp;</td>
                  <td width="90%">ALTA Loan Policy (6-17-06)<br>
Proposed Policy Amount&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$<B> <cfif #read_title.loanamt_float# neq "" and #read_title.loanamt_float# neq 0 and #read_title.loanamt_float# neq 'NULL'>#NumberFormat(read_title.loanamt_float, "999,999,999.00")#<cfelse>TBD</cfif></B><br><br>

Proposed Insured: #read_title.insured#, its successors and/or assigns <cfif read_FT_company.company does not contain 'Wells Fargo'>as their interest may appear</cfif>
</td>
                </tr>
              </table></td>
            <td align="center" valign="top">&nbsp;</td>
          </tr>

        <!-------- ( 2.) ends --------------->
        <tr>
          <td colspan="4">&nbsp;</td>
        </tr>

        <tr>
          <td>&nbsp;</td>
          <td align="left" valign="top">3. </td>
          <td colspan="2" valign="top">The estate or interest in the land described or referred to in this Commitment is #read_title_data.data38#.</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="right" valign="top">&nbsp;</td>
          <td colspan="2" align = "center"  valign="top"><b></cfoutput>



        <tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<CFQUERY datasource="#request.dsn#" NAME="read_title_data">
            select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs
            is not null </cfquery>
        <tr>
          <td>&nbsp;</td>
          <td align="left" valign="top">4. </td>
          <td colspan="2" valign="top">Title to the fee simple estate or interest in the land is at the Effective Date hereof vested in:</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="right" valign="top">&nbsp;</td>
          <td colspan="2" valign="top"><cfoutput><cfif read_title.vesting_override neq '' and read_title.vesting_override neq 'NULL'>#read_title.vesting_override#<cfelse>
<cfif read_title.title_id eq 52901>Elizabeth Warren<cfelseif read_title.title_id eq 52914>Julie Konik<cfelseif read_title.title_id eq 44863>Emilio R. Limchoa and Imelda T. Limchoa<cfelseif read_title.title_id eq 52794>The Village Cooperative Homes<cfelseif read_title.title_id eq 44894>Kindra McLeroy Pack, Barbara A. McLeroy and Wayne McLeroy by Barbara A. McLeroy, his heir.<cfelseif read_title.title_id eq 59179>Chang-Tai Hsieh and Sally Jo Hsieh<cfelseif read_title.title_id eq 57411>ALEXANDER MAKRIS<cfelseif read_title.comp_id eq 3943 or read_title.comp_id eq 4043 or read_title.comp_id eq 4042>#read_title.full_vesting#<cfelse>#read_title_data.data3#<cfif #read_title_data.data4# neq "">&nbsp;AND&nbsp;#read_title_data.data4#</cfif><cfif #read_title_data.data6# neq "">,&nbsp;#read_title_data.DATA6#</b></font></cfif></cfif>
</cfif></cfoutput></td>
        </tr>
        <tr>
          <td colspan="4">&nbsp;</td>
        </tr>

        <tr>
          <td>&nbsp;</td>
          <td align="left" valign="top">5. </td>
          <td colspan="2" valign="top">The land referred to in this Commitment is as described on the attached legal description.</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="right" valign="top">&nbsp;</td>
          <td colspan="2" align = "center"  valign="top">



<cfoutput><table width="100%">
<tr>
<td colspan="4"><br>
<br>
<br>
Issuing Entity:
</td>
</tr>

<tr><td colspan="4" style="border-bottom-color:black; border-bottom-style:solid; border-bottom-width:1px;"><br>
Name: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFIF #read_title.comp_ID# eq 324>Superior Title & Escrow, LLC<CFELSE>#title_co_name# & Escrow, Inc.</CFIF> </td>
</tr>
<tr><td colspan="4" style="border-bottom-color:black; border-bottom-style:solid; border-bottom-width:1px;"><br>
Address: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<CFIF #read_title.comp_ID# eq 324><cfif NOT DateDiff("d", Now(), "1/30/2012")>30 West Gude Drive, Rockville, MD 20850<cfelse>7361 Calhoun Place, Suite 200, Rockville, MD 20855</cfif><CFELSE>#read_Title_FT_Agency_company.Addr1#<CFIF #read_Title_FT_Agency_company.Addr2# GT "" OR #read_Title_FT_Agency_company.Addr2# GT " ">,#read_Title_FT_Agency_company.Addr2#</CFIF>, #read_Title_FT_Agency_company.city#, #read_Title_FT_Agency_company.state#&nbsp;&nbsp;&nbsp;#read_Title_FT_Agency_company.zip_code#, Phone - #read_Title_FT_Agency_company.phone#<CFIF #read_Title_FT_Agency_company.fax# GT "" OR #read_Title_FT_Agency_company.fax# GT " ">, Fax - #read_Title_FT_Agency_company.fax#
</CFIF></CFIF></td>
</tr>
<tr><td valign="bottom" colspan="2" style="border-bottom-color:black; border-bottom-style:solid; border-bottom-width:1px;">By: &nbsp;&nbsp;&nbsp;<cfif read_FT_company.ID eq 2632 or read_FT_company.master_co_id eq 2632><img src="https://#cgi.server_name#/images/alan_sig.jpg"><CFELSEIF #read_Title.pstate# eq "CA" or #read_Title.pstate# eq "NV"><img src="https://#cgi.server_name#/images/steve_sig.jpg"><CFELSE><img src="https://#cgi.server_name#/images/steve_sig.jpg"></CFIF>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Authorized Signatory</td>
</tr>
<cfIF #read_Title.pstate# eq "AL">
<tr><td valign="bottom" colspan="2" style="border-bottom-color:black; border-bottom-style:solid; border-bottom-width:1px;">By: &nbsp;&nbsp;&nbsp;<img src="https://#cgi.server_name#/images/seth_sig.jpg">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Authorized Signatory</td>
</tr></cfIF>
</table></cfoutput>
</td></tr>
</table>
</body>
</cfdocumentsection>











<!--- =================[ BEGIN EXHIBIT A LEGAL DESCRIPTION        ]======================== --->
<!--- ====================================================================== --->
<cfdocumentsection>
<cfdocumentitem type="header">
<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:10px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:16px}

</style>

<table width="100%" cellpadding=0 cellspacing=0 border=0 style="height:40px;">
    <tr>
          <td>
<center><br>
<B><strong><span class="big_header">North American Title Insurance Company</span></strong><BR>
<span="small_header">COMMITMENT FOR TITLE INSURANCE FORM</span></B><br>
<br>
<b>SCHEDULE A</b></strong><br><br>
<i>(Continued)</i></strong>
</center>
          </td>
    </tr>
</table>
</cfdocumentitem >
<cfdocumentitem type="footer">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left"><font color="black" size="1">ALTA Commitment (6-17-06) Schedule A<br>
Valid only if Schedule B and Cover are attached</font></td>
  </tr>
</table>
</cfdocumentitem >

<body style="background-color: #FFFFFF; font-family:Arial, Helvetica, sans-serif; font-size:10px" >
<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:10px}
.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:16px}

</style>

<br>
<cfoutput>
<table width="100%" cellpadding=0 cellspacing=0 border=0 >
		<tr>
          <td width="2%">&nbsp;</td>
		  <td  valign="top" align="left" colspan=2>File No. T-#url.rec_ID#<br><br>
<br>
</td>

</tr>
<tr><td colspan=3 align="center"><strong>LEGAL DESCRIPTION</strong><br>
<br>
&nbsp;
<br>
<br>
</td></tr>
				<tr >
				<td width="2%">&nbsp;</td>
          <td     COLSPAN = 2 align = "left" >
		<b>

		<cfif #read_title_data.notes# neq "">#read_title_data.notes#</cfif><br>
<br>

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
</table>
</body>
</cfdocumentsection>












<!--- =================[ BEGIN SCHEDULE B - I       ]======================== --->
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
<b>SCHEDULE B - SECTION I</b></strong><br><br>
REQUIREMENTS
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


<table width="100%" cellpadding=1 cellspacing=1 border=0 valign="top" >
        <!-------- ( 1.) Starts --------------->




		<tr>
          <td width="2%">&nbsp;</td>
		  <td  valign="top" align="left" colspan=2>File No. T-<cfoutput>#url.rec_ID#</cfoutput><br><br>
<br>
</td>

</tr>
	<tr>
		  <td colspan="2" align="center">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2"><b>REQUIREMENTS</b>:</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
</table>
      <table width="100%" cellpadding=0 cellspacing=0 border=0 >
        <tr>
		  <td width="5%" valign="top">1.</td>
		<td>Payment of the full consideration to, or for the account of, the grantors or mortgagor.</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		  <td width="5%" valign="top">2.</td>
		<td>Instruments in insurable form which must be executed, delivered, and duly filed for record, to wit:<br>
<!--- <table>
<tr>
<td align="left" valign="top" width="25">a.</td>
<td><cfoutput>Deed from <cfif read_title.vesting_override neq '' and read_title.vesting_override neq 'NULL'>#read_title.vesting_override#<cfelse>
<cfif read_title.title_id eq 52901>Elizabeth Warren<cfelseif read_title.title_id eq 52914>Julie Konik<cfelseif read_title.title_id eq 44863>Emilio R. Limchoa and Imelda T. Limchoa<cfelseif read_title.title_id eq 52794>The Village Cooperative Homes<cfelseif read_title.title_id eq 44894>Kindra McLeroy Pack, Barbara A. McLeroy and Wayne McLeroy by Barbara A. McLeroy, his heir.<cfelseif read_title.title_id eq 59179>Chang-Tai Hsieh and Sally Jo Hsieh<cfelseif read_title.title_id eq 57411>ALEXANDER MAKRIS<cfelseif read_title.comp_id eq 3943 or read_title.comp_id eq 4043 or read_title.comp_id eq 4042>#read_title.full_vesting#<cfelse>#read_title_data.data3#<cfif #read_title_data.data4# neq "">&nbsp;AND&nbsp;#read_title_data.data4#</cfif><cfif #read_title_data.data6# neq "">,&nbsp;#read_title_data.DATA6#</b></font></cfif></cfif>
</cfif>, conveying the premises described in Schedule A herein, to <cfif #read_title.purchase# neq "" and  #read_title.purchase# neq 0 and  #read_title.purchase# neq "NULL">#Buyer_1#, &nbsp;&nbsp;#Buyer_2#<cfif Len(read_title.blastname3)>, #read_title.bfirstname3# #read_title.blastname3# </cfif><cfif Len(read_title.blastname4)>, #read_title.bfirstname4# #read_title.blastname4# </cfif><cfelse>TBD</cfif>.</cfoutput><br></td>
</tr>
<tr>
<td align="left" valign="top" width="25">b.</td>
<td><cfoutput>Deed of Trust from <cfif #Read_temp_comp_b1.bfirstname1# neq "">#Read_temp_comp_b1.bfirstname1#</cfif>&nbsp;<cfif #Read_temp_comp_b1.bminame1# neq "">#Read_temp_comp_b1.bminame1#.</cfif><cfif #Read_temp_comp_b1.blastname1# neq ""> #Read_temp_comp_b1.blastname1#</cfif><cfif #Read_temp_comp_b1.bfirstname2# neq ""> AND #Read_temp_comp_b1.bfirstname2#</cfif>&nbsp;<cfif #Read_temp_comp_b1.bminame2# neq "">#Read_temp_comp_b1.bminame2#.</cfif><cfif #Read_temp_comp_b1.blastname2# neq ""> #Read_temp_comp_b1.blastname2#</cfif> to <cfif #Read_temp_comp_b1.insured# neq "">#Read_temp_comp_b1.insured#</cfif>, securing the pricipal amount of $#Read_temp_comp_b1.loanamt_float#</cfoutput><br></td>
</tr>
</table>
 ---></td>
</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
        <tr>
		  <td width="5%" valign="top">3.</td>
		<td>Show that restrictions or restrictive covenants have not been violated.
</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
        <tr>
		  <td width="5%" valign="top">4.</td>
		<td>Furnish proof of payment of all bills for labor and material furnished or to be furnished in connection with improvements erected or to be erected.

</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
        <tr>
		  <td width="5%" valign="top">5.</td>
		<td>Pay all general and special taxes now due and payable including the following:<br>
Homeonwers association fees (if applicable)<br>
Condominium fees (if applicable)<br>
Water usage bills (if applicable)<br>
</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
        <tr>
		  <td width="5%" valign="top">6.</td>
		<td><b>Real Estate Tax Information: </b>
		<cfoutput><cfif #read_tax.payto# neq "">Payable to - #read_tax.payto#, </cfif><cfif #read_tax.taxcoll# neq "">Tax Collector - #read_tax.taxcoll#, </cfif><cfif #read_tax.add1# neq "">Address 1 - #read_tax.add1#, </cfif><cfif #read_tax.add1# neq "">Address 2 - #read_tax.add2#, </cfif><cfif #read_tax.city# neq "">City - #read_tax.city#, </cfif><cfif #read_tax.state# neq "">State - #read_tax.state#, </cfif><cfif #read_tax.add1# neq "">Zip code - #read_tax.zip#, </cfif><cfif #read_tax.phone# neq "">Phone - #read_tax.phone#, </cfif><cfif #read_tax.web# neq "">Web address- #read_tax.web#, </cfif><cfif #read_tax.acctnum# neq "">APN/Acct Num - #read_tax.acctnum#, </cfif>
		<cfif #read_tax.taxfreq# neq "">Taxes are paid #read_tax.taxfreq#, </cfif><cfif #read_tax.paiddate# neq "">date paid #read_tax.paiddate#, </cfif><cfif #read_tax.paidto# neq "">which covers from #read_tax.paidfrom# to #read_tax.paidto#, </cfif><cfif #read_tax.lastamt# neq "">in the amount of #read_tax.lastamt#, </cfif><cfif #read_tax.duedate# neq "">Next due date #read_tax.duedate#, </cfif><cfif #read_tax.dueto# neq "">which covers from #read_tax.duefrom# to #read_tax.dueto#, </cfif><cfif #read_tax.dueamt# neq "">in the amount of #read_tax.dueamt#</cfif><br><br>
		<cfif #read_tax.delamt# neq ""><b>Delinquent Information -- </b>Delinquent amount #read_tax.delamt#, </cfif><cfif #read_tax.thrudate# neq "">good through date #read_tax.thrudate#. </cfif>


		<cfif #read_tax.data29# NEQ "" AND #read_tax.paiddate# EQ "">
		<cfif #read_tax.data29# NEQ ""> Real Estate Taxes for #Read_tax.data29# are #Read_tax.data31#. They are payable #Read_tax.data37#. The amount paid was $#Read_tax.data28#. #Read_tax.data34#. The due dates are #Read_tax.data30#. The parcel ID number is #Read_tax.data19#.</b><br>
<br>
<br></cfif>
</cfif></cfoutput>
<cfif #read_tax.comments# neq "">
        <cfoutput>Comments: #read_tax.comments#</cfoutput><br>

</cfif>
</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
<cfif read_title.pstate eq 'DC'>
<tr>
		  <td width="5%" valign="top">7.</td>
		<td>This Company must be furnished with satisfactory proof that caption property is owner occupied,
occupied by the proposed purchaser, or vacant. In the event of sale or lease of caption property, and
if tenant occupied, further proof is required that the requirements of Titles IV and V of D.C. Law 3-86,
"Rental Housing Conversion and Sale Act of 1980," as amended, have been complied with.<br>
</td></tr>
<cfset auto_number = 8>
<cfelse>
<cfset auto_number = 7>
</cfif>






<cfif (read_title.comp_id eq 3182 or read_title.comp_id eq 2368 or read_title.comp_id eq 2430  or ListContainsNoCase(children, read_title.comp_id, ","))>
<cfif read_title.pstate eq 'VA'>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
		    <td><cfoutput>#auto_number#</cfoutput>.</td>
       <td>
Receipt of proper Notice of Sale and evidence of delivery to the borrower and subordinate lien holders as required by Virginia Code §55-59.1.
<br>
<br>

			</td>
		</tr>
<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
		    <td><cfoutput>#auto_number#</cfoutput>.</td>
       <td>
Receipt of Certificate of Publication evidencing advertisement in compliance with Virginia Code §55-59.2 and the terms of the Deed of Trust.
<br>
<br>

			</td>
		</tr>
</cfif>
<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
		    <td><cfoutput>#auto_number#</cfoutput>.</td>
       <td>
Receipt of satisfactory evidence that the borrower foreclosed upon has not filed bankruptcy.
<br>
<br>

			</td>
		</tr>
<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
		   <td><cfoutput>#auto_number#</cfoutput>.</td>
       <td>
Proof of payment of all real estate taxes, penalties and interest, up to the date of the Trustee's sale.
<br>
<br>

			</td>
		</tr>
<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
		    <td><cfoutput>#auto_number#</cfoutput>.</td>
       <td>
Receipt of satisfactory evidence that the borrower is not in possession of the property.
<br>
<br>

			</td>
		</tr>
<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
		   <td><cfoutput>#auto_number#</cfoutput>.</td>
       <td>
Receipt of satisfactory evidence that the borrower in not entitled to relief or protection under the Servicemembers Civil Relief Act, 50 USCS Appx § 501 et seq.  If such evidence is not available, the following exception will appear in any Title Policy issued pursuant to this Commitment: "Any claim based upon the Servicemembers Civil Relief Act, 50 USCS Appx § 501 et seq., which restricts foreclosure, forfeiture and other legal proceedings based upon military service in the uniformed services of the United States."
<br>
<br>

			</td>
		</tr>
</cfif>

<cfif read_title.pstate eq 'DC'>
<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
		   <td><cfoutput>#auto_number#</cfoutput>.</td>
       <td>This Company must be furnished with satisfactory proof that caption property is owner occupied, occupied by the proposed purchaser, or vacant.  In the event of sale or lease of caption property, and if tenant occupied, further proof is required that the requirements of Title IV and V of D.C. Law 3-86, "Rental Housing Conversion and Sale Act of 1980" and as amended, have been complied with.
<br>
<br>

			</td>
		</tr>
</cfif>

<cfset mortgages_liens = 0>
<tr>
		  <td width="5%" valign="top">&nbsp;</td>
		<td><br>
<B>ADDITIONAL REQUIREMENTS</B><br>
<br><br>
&nbsp;<br>
</td>
	</tr>

<CFQUERY datasource="#request.dsn#" NAME="read_mortgage">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 is NOT NULL
			order by selectedOrgs4
		</cfquery>
<cfif read_mortgage.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_mortgage">
		<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
		    <td>#auto_number#.</td>
       <td>
<cfif #read_mortgage.data1# NEQ ""> <cfif read_mortgage.lienintro neq "" and read_mortgage.lienintro neq 'NULL' or Len(read_mortgage.lienintro) eq 0>#read_mortgage.lienintro#<cfelse>Satisfaction and/or release of</cfif> Mortgage from #read_mortgage.data2# <cfif #read_mortgage.data3# neq ""> and #read_mortgage.data3#</cfif> securing #read_mortgage.data1# in the original principal amount of #read_mortgage.data4#, as dated #DateFormat(read_mortgage.data8, "mm")#/#DateFormat(read_mortgage.data8, "dd")#/#DateFormat(read_mortgage.data8, "yyyy")# and recorded on #DateFormat(read_mortgage.data9, "mm")#/#DateFormat(read_mortgage.data9, "dd")#/#DateFormat(read_mortgage.data9, "yyyy")# among the Land Records of #Read_temp_comp_b1.pcounty# County, <cfif #read_mortgage.data5# eq ""><cfif #read_mortgage.data6# neq "">in Book #read_mortgage.data6# at Page #read_mortgage.data7# </cfif><cfelse> in Document Number #read_mortgage.data5# </cfif><cfif #read_mortgage.data13# neq ""> Assigned to #read_mortgage.data13# recorded on #DateFormat(read_mortgage.data17, "mm")#/#DateFormat(read_mortgage.data17, "dd")#/#DateFormat(read_mortgage.data17, "yyyy")#, in Book <cfif #read_mortgage.data14# eq "">#read_mortgage.data15#, at Page #read_mortgage.data16# <cfelse> in Document #read_mortgage.data14#</cfif> </cfif><cfif #read_mortgage.data18# neq "">Assigned to #read_mortgage.data18# recorded on #DateFormat(read_mortgage.data22, "mm")#/#DateFormat(read_mortgage.data22, "dd")#/#DateFormat(read_mortgage.data22, "yyyy")#, <cfif #read_mortgage.data19# eq "">in Book #read_mortgage.data20#, at Page #read_mortgage.data21# <cfelse> in Document #read_mortgage.data19#</cfif> </cfif><cfif #read_mortgage.data23# neq "">Assigned to #read_mortgage.data23# recorded on #DateFormat(read_mortgage.data27, "mm")#/#DateFormat(read_mortgage.data27, "dd")#/#DateFormat(read_mortgage.data27, "yyyy")#, <cfif #read_mortgage.data24# eq ""> in Book #read_mortgage.data25#, at Page #read_mortgage.data26# <cfelse> in Document #read_mortgage.data24#</cfif> </cfif><cfif #read_mortgage.data28# neq "">Assigned to #read_mortgage.data28# recorded on #DateFormat(read_mortgage.data32, "mm")#/#DateFormat(read_mortgage.data32, "dd")#/#DateFormat(read_mortgage.data32, "yyyy")#, <cfif #read_mortgage.data29# EQ ""> in Book #read_mortgage.data30#, at Page #read_mortgage.data31# <cfelse> in Document #read_mortgage.data31#</cfif> </cfif><cfif #read_mortgage.data11# neq "">#read_mortgage.data11#</cfif> <cfif #read_mortgage.data12# neq "">#read_mortgage.data12#</cfif></cfif>
<br>
<br>

			</td>
		</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
</cfoutput>



<cfif #read_mortgage.recordcount# GTE 1>
			<CFQUERY datasource="#request.dsn#" NAME="read_lien">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 is not NULL
			order by selectedOrgs3
			</cfquery>
<cfif read_lien.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
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
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
</cfoutput>



   </cfif>







<cfif read_title_data.addreq neq '' and read_title_data.addreq neq 'NULL'>

<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td><cfoutput>#auto_number#</cfoutput>.</td>
		    <td>
              <cfoutput>#read_title_data.addreq#</cfoutput>
		</td>
	</tr>
</cfif>

	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
<cfif mortgages_liens eq 0 and (#read_title_data.addreq# eq #read_title_data.addreq# eq "NULL")>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		  <td>&nbsp;</td><td colspan="2"><strong>NONE</strong></td>
	</tr>
</cfif>
		<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
<tr>
		  <td>&nbsp;</td><td valign="top"><center><strong>END OF REQUIREMENTS</strong></center></td>
	</tr>
</table>
</body>
</cfdocumentsection>























<!--- =================[ BEGIN SCHEDULE B - II       ]======================== --->
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
<b>SCHEDULE B - SECTION II</b></strong><br><br>
EXCEPTIONS
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

<table width="100%" cellpadding=1 cellspacing=1 border=0 valign="top" >
        <!-------- ( 1.) Starts --------------->




		<tr>
          <td width="2%">&nbsp;</td>
		  <td  valign="top" align="left" colspan=2>File No. T-<cfoutput>#url.rec_ID#</cfoutput><br><br>
<br>
</td>

</tr>		<tr>
		  <td colspan="2" align="center">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="3">The policy or policies to be issued will contain exceptions to the following unless the same are disposed of to the satisfaction of the Company:</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
</table>
      <table width="100%" cellpadding=0 cellspacing=0 border=0 >
        <tr>
		  <td width="5%" valign="top">1.</td>
		<td>Defects, liens, encumbrances, adverse claims or other matters, if any, created, first appearing in the public records or attaching subsequent to the effective date hereof but prior to the date the proposed insured acquires for value of record the estate or interest or mortgage thereon covered by this Commitment.</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
        <tr>
		  <td width="5%" valign="top">2.</td>
		<td>Any encroachment, encumbrance, violation, variation, or adverse circumstance affecting the title including discrepancies, conflicts in boundary lines, shortage in area, or any other facts that would be disclosed by an accurate and complete land survey of the land, and that are not shown in the public records.</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
        <tr>
		  <td width="5%" valign="top">3.</td>
		<td>Rights or claims of parties in possession not shown by the public records.</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
        <tr>
		  <td width="5%" valign="top">4.</td>
		<td>Possible unfiled mechanics' and materialmen's liens.</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		  <td width="5%" valign="top">5.</td>
		<td>Taxes for the year <cfif read_title.pstate eq 'AL'>2014<cfelse><cfoutput>#DateFormat(Now(), "yyyy")#</cfoutput></cfif>, a lien not yet due and payable, and all subsequent years.
</td>
	</tr>


	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		  <td width="5%" valign="top">6.</td>
		<td>State, County and Municipal real estate taxes subsequent to the original levy for the year ending <cfif read_title.pstate eq 'AL'>October 31, 2014<cfelse><cfoutput><cfoutput>June 30, #DateFormat(Now(), "yyyy")#</cfoutput></cfoutput></cfif>, not yet due and payable, plus possible supplemental taxes.
</td>
	</tr>

	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		  <td width="5%" valign="top">7.</td>
		<td>Terms, provisions, conditions, notes and restrictions as shown on plat of subdivision.
</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		  <td width="5%" valign="top">8.</td>
		<td>NOTE: The above exceptions omit any covenant, condition, or restriction based on race, color, religion, sex, handicap, familial status or national origin as provided in 42 U.S.C. Section 2604, unless and only to the extent that the covenant (a) is not in violation of state or federal law, (b) is exempt under 42 U.S.C. Section 3607, or (c) relates to the handicap, but does not discriminate against handicapped people.
</td>
	</tr>

	<!--- <tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		  <td width="5%" valign="top">9.</td>
		<td>No liability is assumed for matters occurring prior to record when owner became vested, entitled and which matters affect the title by virtue of, but not limited to, defects in title, liens, encumbrances, fees charges or assessments, taxes, general or special, ownership, rights of access marketability of or any defense as to matters or claims arising therefrom.
</td>
	</tr> --->

	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
<cfif #read_title.pstate# eq 'DC'>
	<tr>
		  <td width="5%" valign="top">10.</td>
		<td>Rights of tenants under the Rental Housing Conversion and Sale Act of 1980, as amended, and
regulations adopted thereunder.
</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		  <td width="5%" valign="top">7.</td>
		<td>City taxes subsequent to those imposed by the original levy for the (first half of the fiscal year ending March 31, <cfoutput>#DateFormat(Now(),"yyyy")#</cfoutput>) (second half of the fiscal year ending September 30, <cfoutput>#DateFormat(Now(),"yyyy")#</cfoutput>), a lien not
yet due and payable. The Policy does not insure against any public charges, including, without
limitation, taxes or assessments imposed by any office, department, agency or district or other
governmental division of the District of Columbia subsequent to Date of Policy, nor does the Policy
insure against public charges, as defined above, that have been levied or assessed but are not yet
due and payable, nor does the Policy insure against any tax lien filed subsequent to Date of Policy.</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
</cfif>
</table>
</body>
</cfdocumentsection>










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
<B>SCHEDULE B - SECTION II</b></strong><br><br>
ADDITIONAL EXCEPTIONS
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

.big_header {font-family:Arial, Helvetica, sans-serif; font-size:20px}
.small_header {font-family:Arial, Helvetica, sans-serif; font-size:16px}

</style>

<table width="100%" cellpadding=1 cellspacing=1 border=0 valign="top" >
        <!-------- ( 1.) Starts --------------->




		<tr>
          <td width="2%">&nbsp;</td>
		  <td  valign="top" align="left" colspan=2>File No. T-<cfoutput>#url.rec_ID#</cfoutput><br><br>
<br>
</td>

</tr>		<tr>
		  <td colspan="2" align="center">&nbsp;</td>
	</tr>
<cfset num_count = 0>
<table cellpadding=0 cellspacing=0 border=0 width="100%">

<cfif #read_title_data.addex# neq "">
        <tr>
		<td width="3%" valign="top"></td>
          <td align = "left" colspan="3" valign="top"><cfoutput>#read_title_data.addex#</cfoutput>
		 </td>
        </tr>

        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
</cfif>
</table>
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









<!--- =================[ TAX INFO ]======================== --->
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
TAX INFORMATION
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
	<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM tax_cert_title
			where title_id = #rec_id#
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#" NAME="read_title">
			SELECT *
			FROM title
			where title_id = #rec_id#
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#" NAME="read_company">
			SELECT *
			FROM companies
			where id = #read_title.comp_id#
		</CFQUERY>



<table width="100%" cellspacing=0 cellpadding=1 bgcolor="#000000">
<tr><td>
<table width="100%" cellpadding=5 cellspacing=1>
<tr bgcolor="FFFFFF">
<td align="center" valign="top">A</td>
<td align="center" valign="top">B</td>
<td align="center" valign="top">C</td>
<td align="center" valign="top">D</td>
<td align="center" valign="top">E</td>
<td align="center" valign="top">F</td>
<td align="center" valign="top">G</td>
<td align="center" valign="top">H</td>
<td align="center" valign="top">I</td>
<td align="center" valign="top">J</td>
</tr>
<tr bgcolor="FFFFFF">
<td align="center" valign="top">Name and Address<br>
of Taxing Authority</td>
<td align="center" valign="top">Collects for:</td>
<td align="center" valign="top">Parcel<br>
Identification</td>
<td align="center" valign="top">Timing of<br>
Payments</td>
<td align="center" valign="top">Due Date Each<br>
Installment</td>
<td align="center" valign="top">Delinquent<BR>
Date Each<br>
Installment</td>
<td align="center" valign="top">Last $
Amount<br>
Paid</td>
<td align="center" valign="top">Date Last<br>
Amt. Paid</td>
<td align="center" valign="top">Paid Through<br>
Date</td>
<td align="center" valign="top">Next Lender<br>
Payment Due Date</td>
</tr>
<cfoutput>
<tr bgcolor="FFFFFF">
<td align="left" valign="top" class="taxtext">#read_report.payto#<BR>
#read_report.taxcoll#<BR>
#read_report.add1#<cfif Len(read_report.add2)>, #read_report.add2#</cfif><BR>
#read_report.city#, #read_report.state# #read_report.zip#<BR>
#read_report.phone#<BR>
#read_report.web#</td>
<td align="left" valign="top" class="taxtext">#read_report.collects_for#</td>
<td align="left" valign="top" class="taxtext">#read_report.acctnum#</td>
<td align="left" valign="top" class="taxtext">#read_report.taxfreq#</td>
<td align="left" valign="top" class="taxtext">#read_report.tax_dueDate#
<cfif read_report.taxfreq eq 'Semi Annually'><br>
#read_report.tax_dueDateB#
</cfif>
<cfif read_report.taxfreq eq 'Quarterly'><br>
#read_report.tax_dueDateB#<br>
#read_report.tax_dueDateC#<br>
#read_report.tax_dueDateD#<br>
</cfif></td>
<td align="left" valign="top" class="taxtext">#read_report.tax_lateDate#
<cfif read_report.taxfreq eq 'Semi Annually'><br>
#read_report.tax_lateDateB#
</cfif>
<cfif read_report.taxfreq eq 'Quarterly'><br>
#read_report.tax_lateDateB#<br>
#read_report.tax_lateDateC#<br>
#read_report.tax_lateDateD#<br>
</cfif></td>
<td align="left" valign="top" class="taxtext">#read_report.lastamt#</td>
<td align="left" valign="top" class="taxtext">#read_report.paidDate#</td>
<td align="left" valign="top" class="taxtext">#read_report.paidTo#</td>
<td align="left" valign="top" class="taxtext">#read_report.dueDate#</td>
</tr>



<cfif Len(read_report.payto2)>
<tr bgcolor="FFFFFF">
<td align="left" valign="top">#read_report.payto2#<BR>
#read_report.taxcoll2#<BR>
#read_report.add12#<cfif Len(read_report.add22)>, #read_report.add22#</cfif><BR>
#read_report.city2#, #read_report.state2# #read_report.zip2#<BR>
#read_report.phone2#<BR>
#read_report.web2#</td>
<td align="left" valign="top">#read_report.collects_for2#</td>
<td align="left" valign="top">#read_report.acctnum2#</td>
<td align="left" valign="top">#read_report.taxfreq2#</td>
<td align="left" valign="top">#read_report.tax_dueDate2#
<cfif read_report.taxfreq2 eq 'Semi Annually'><br>
#read_report.tax_dueDate2B#
</cfif>
<cfif read_report.taxfreq2 eq 'Quarterly'><br>
#read_report.tax_dueDate2B#<br>
#read_report.tax_dueDate2C#<br>
#read_report.tax_dueDate2D#<br>
</cfif></td>
<td align="left" valign="top">#read_report.tax_lateDate2#
<cfif read_report.taxfreq2 eq 'Semi Annually'><br>
#read_report.tax_lateDate2B#
</cfif>
<cfif read_report.taxfreq2 eq 'Quarterly'><br>
#read_report.tax_lateDate2B#<br>
#read_report.tax_lateDate2C#<br>
#read_report.tax_lateDate2D#<br>
</cfif></td>
<td align="left" valign="top">#read_report.lastamt2#</td>
<td align="left" valign="top">#read_report.paidDate2#</td>
<td align="left" valign="top">#read_report.paidTo2#</td>
<td align="left" valign="top">#read_report.dueDate2#</td>
</tr>
</cfif>

<cfif Len(read_report.payto3)>
<tr bgcolor="FFFFFF">
<td align="left" valign="top">#read_report.payto3#<BR>
#read_report.taxcoll3#<BR>
#read_report.add13#<cfif Len(read_report.add23)>, #read_report.add23#</cfif><BR>
#read_report.city3#, #read_report.state# #read_report.zip3#<BR>
#read_report.phone3#<BR>
#read_report.web3#</td>
<td align="left" valign="top">#read_report.collects_for3#</td>
<td align="left" valign="top">#read_report.acctnum3#</td>
<td align="left" valign="top">#read_report.taxfreq3#</td>
<td align="left" valign="top">#read_report.tax_dueDate3#
<cfif read_report.taxfreq3 eq 'Semi Annually'><br>
#read_report.tax_dueDate3B#
</cfif>
<cfif read_report.taxfreq3 eq 'Quarterly'><br>
#read_report.tax_dueDate3B#<br>
#read_report.tax_dueDate3C#<br>
#read_report.tax_dueDate3D#<br>
</cfif></td>
<td align="left" valign="top">#read_report.tax_lateDate3#
<cfif read_report.taxfreq3 eq 'Semi Annually'><br>
#read_report.tax_lateDate3B#
</cfif>
<cfif read_report.taxfreq3 eq 'Quarterly'><br>
#read_report.tax_lateDate3B#<br>
#read_report.tax_lateDate3C#<br>
#read_report.tax_lateDate3D#<br>
</cfif></td>
<td align="left" valign="top">#read_report.lastamt3#</td>
<td align="left" valign="top">#read_report.paidDate3#</td>
<td align="left" valign="top">#read_report.paidTo3#</td>
<td align="left" valign="top">#read_report.dueDate3#</td>
</tr>
</cfif>

<cfif Len(read_report.payto4)>
<tr bgcolor="FFFFFF">
<td align="left" valign="top">#read_report.payto4#<BR>
#read_report.taxcoll4#<BR>
#read_report.add14#<cfif Len(read_report.add24)>, #read_report.add24#</cfif><BR>
#read_report.city4#, #read_report.state4# #read_report.zip4#<BR>
#read_report.phone4#<BR>
#read_report.web4#</td>
<td align="left" valign="top">#read_report.collects_for4#</td>
<td align="left" valign="top">#read_report.acctnum4#</td>
<td align="left" valign="top">#read_report.taxfreq4#</td>
<td align="left" valign="top">#read_report.tax_dueDate4#
<cfif read_report.taxfreq4 eq 'Semi Annually'><br>
#read_report.tax_dueDate4B#
</cfif>
<cfif read_report.taxfreq4 eq 'Quarterly'><br>
#read_report.tax_dueDate4B#<br>
#read_report.tax_dueDate4C#<br>
#read_report.tax_dueDate4D#<br>
</cfif></td>
<td align="left" valign="top">#read_report.tax_lateDate4#
<cfif read_report.taxfreq4 eq 'Semi Annually'><br>
#read_report.tax_lateDate4B#
</cfif>
<cfif read_report.taxfreq4 eq 'Quarterly'><br>
#read_report.tax_lateDate4B#<br>
#read_report.tax_lateDate4C#<br>
#read_report.tax_lateDate4D#<br>
</cfif></td>
<td align="left" valign="top">#read_report.lastamt4#</td>
<td align="left" valign="top">#read_report.paidDate4#</td>
<td align="left" valign="top">#read_report.paidTo4#</td>
<td align="left" valign="top">#read_report.dueDate4#</td>
</tr>
</cfif>










<cfif Len(read_report.payto5)>
<tr bgcolor="FFFFFF">
<td align="left" valign="top">#read_report.payto5#<BR>
#read_report.taxcoll5#<BR>
#read_report.add15#<cfif Len(read_report.add25)>, #read_report.add25#</cfif><BR>
#read_report.city5#, #read_report.state5# #read_report.zip5#<BR>
#read_report.phone5#<BR>
#read_report.web5#</td>
<td align="left" valign="top">#read_report.collects_for5#</td>
<td align="left" valign="top">#read_report.acctnum5#</td>
<td align="left" valign="top">#read_report.taxfreq5#</td>
<td align="left" valign="top">#read_report.tax_dueDate5#
<cfif read_report.taxfreq5 eq 'Semi Annually'><br>
#read_report.tax_dueDate5B#
</cfif>
<cfif read_report.taxfreq5 eq 'Quarterly'><br>
#read_report.tax_dueDate5B#<br>
#read_report.tax_dueDate5C#<br>
#read_report.tax_dueDate5D#<br>
</cfif></td>
<td align="left" valign="top">#read_report.tax_lateDate5#
<cfif read_report.taxfreq5 eq 'Semi Annually'><br>
#read_report.tax_lateDate5B#
</cfif>
<cfif read_report.taxfreq5 eq 'Quarterly'><br>
#read_report.tax_lateDate5B#<br>
#read_report.tax_lateDate5C#<br>
#read_report.tax_lateDate5D#<br>
</cfif></td>
<td align="left" valign="top">#read_report.lastamt5#</td>
<td align="left" valign="top">#read_report.paidDate5#</td>
<td align="left" valign="top">#read_report.paidTo5#</td>
<td align="left" valign="top">#read_report.dueDate5#</td>
</tr>
</cfif>






<cfif Len(read_report.payto6)>
<tr bgcolor="FFFFFF">
<td align="left" valign="top">#read_report.payto6#<BR>
#read_report.taxcoll6#<BR>
#read_report.add16#<cfif Len(read_report.add26)>, #read_report.add26#</cfif><BR>
#read_report.city6#, #read_report.state6# #read_report.zip6#<BR>
#read_report.phone6#<BR>
#read_report.web6#</td>
<td align="left" valign="top">#read_report.collects_for6#</td>
<td align="left" valign="top">#read_report.acctnum6#</td>
<td align="left" valign="top">#read_report.taxfreq6#</td>
<td align="left" valign="top">#read_report.tax_dueDate6#
<cfif read_report.taxfreq6 eq 'Semi Annually'><br>
#read_report.tax_dueDate6B#
</cfif>
<cfif read_report.taxfreq6 eq 'Quarterly'><br>
#read_report.tax_dueDate6B#<br>
#read_report.tax_dueDate6C#<br>
#read_report.tax_dueDate6D#<br>
</cfif></td>
<td align="left" valign="top">#read_report.tax_lateDate6#
<cfif read_report.taxfreq6 eq 'Semi Annually'><br>
#read_report.tax_lateDate6B#
</cfif>
<cfif read_report.taxfreq6 eq 'Quarterly'><br>
#read_report.tax_lateDate6B#<br>
#read_report.tax_lateDate6C#<br>
#read_report.tax_lateDate6D#<br>
</cfif></td>
<td align="left" valign="top">#read_report.lastamt6#</td>
<td align="left" valign="top">#read_report.paidDate6#</td>
<td align="left" valign="top">#read_report.paidTo6#</td>
<td align="left" valign="top">#read_report.dueDate6#</td>
</tr>
</cfif>
</cfoutput>

</table>
</td></tr></table> 
<br>
<table width="100%">
<tr>
<td align="left" valign="top" width="50%">Closing Agent/Attorney Name:<br>
<cfif read_company.streamline_client eq True>Streamline Title<cfelse>First Title & Escrow, Inc.</cfif></td>
<td align="left" valign="top" width="50%">
Address:<br>
7361 Calhoun Place, Suite 200<br>
Rockville, MD 20855<br>
<br>
Phone: 301-279-0303<br>
<!--- Initials: WC --->

</td>
</tr>
</table>





</body>
</cfdocumentsection>




</cfdocument>