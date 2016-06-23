<cfdocument
format="PDF" 
filename="#request.rootdir#\admin_area\tcs\TC-#read_title.title_id#.pdf" 
overwrite="yes" 
unit = "IN" 
marginbottom = "1.5" 
marginleft = ".5" 
marginright = ".5" 
margintop = "1" 
fontembed = "yes" 
orientation = "portrait"
pagetype = "custom" 
pageHeight = "11"
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

<cfif read_title.loanamt_float neq '' and read_title.loanamt_float neq 'NULL'>
<cfset read_title.loanamt_float = ReplaceNoCase(read_title.loanamt_float, ",", "", "ALL")>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_title_data">
        select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs
        is not null
        </cfquery>

<cfif read_title.comp_id eq 3182 or read_title.comp_id eq 2368 or read_title.comp_id eq 2430  or ListContainsNoCase(children, read_title.comp_id, ",")>
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
	FROM  Company_Billing_states_HUD2010
	WHERE company_id = #read_title.comp_id# AND a_states = '#read_title.pstate#'
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
<cfif #read_title.comp_id# eq 5026 or #read_title.comp_id# eq 4177>
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
td {font-family:"Times New Roman", Times, serif; font-size:10px}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18px}
.small_header {font-family:"Times New Roman", Times, serif; font-size:16px}
</style>
</cfdocumentitem >

<cfdocumentitem type="footer">
</cfdocumentitem >

<body style="background-color: #FFFFFF" >
<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10px}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18px}
.small_header {font-family:"Times New Roman", Times, serif; font-size:16px}
</style>
<cfoutput query="get_all">
<table width="100%" cellpadding=6 cellspacing=0>
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
td {font-family:"Times New Roman", Times, serif; font-size:10px}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18px}
.small_header {font-family:"Times New Roman", Times, serif; font-size:16px}
</style>
</cfdocumentitem >

<cfdocumentitem type="footer">
</cfdocumentitem >

<body style="background-color: #FFFFFF" >
<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10px}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18px}
.small_header {font-family:"Times New Roman", Times, serif; font-size:16px}
</style>
<CFQUERY datasource="#request.dsn#" NAME="get_all" maxrows=10>
SELECT     t.Title_ID, t.loan_number, t.paddress, t.pcity, t.pstate, t.pzip, t.order_date,
           c.company, c.addr1, c.addr2, c.city, c.state, c.zip_code
FROM      Title t INNER JOIN
		  Companies c ON t.comp_id = c.ID
WHERE     (t.title_id = #read_title.title_id#)
</cfquery>

<cfoutput query="get_all">


<table width="100%" cellpadding=6 cellspacing=0>
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




<cfif #read_title.comp_id# eq "254">
<cfdocumentsection>
<cfdocumentitem type="header">
<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10px}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18px}
.small_header {font-family:"Times New Roman", Times, serif; font-size:16px}
</style>
</cfdocumentitem >

<cfdocumentitem type="footer">
</cfdocumentitem >

<body style="background-color: #FFFFFF" >
<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10px}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18px}
.small_header {font-family:"Times New Roman", Times, serif; font-size:16px}
</style>
<table  width="100%" cellpadding="3" cellspacing="0" border="0">
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
        <cfif #DATEDIFF("m", testDate, read_data_info.merge_date)# LT 12>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox">YES&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox">NO
        <cfelse>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox">YES&nbsp;&nbsp;&nbsp;&nbsp;<img src="checked.jpg" height="15" width="15">NO </cfif><font size="1">(if YES, explain in comments below.)</font> </font></strong>
     <strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">2. Are
        there any items that need to be cleared:<br>
         <cfif #read_data_info.cleared# neq "" OR #read_data_info.clear_needed# neq "">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox">YES&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox">NO
         <cfelse>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox">YES&nbsp;&nbsp;&nbsp;&nbsp;<img src="checked.jpg" height="15" width="15">NO </cfif><font size="1">(if YES, explain in comments below.)</font> </font></strong>
   <font size="1">(if YES, explain in comments below.)</font></font></strong>
     <strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">3.
        Are the property taxes up to date?<br>
        <cfif #read_tax_info.data31# eq "Paid">&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox">YES&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox">NO
        <font size="1">(if NO, explain in comments below.)</font></font></strong></td>
 <cfelse>&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox">YES&nbsp;&nbsp;&nbsp;&nbsp;<img src="checked.jpg" height="15" width="15">NO </cfif><font size="1">(if NO, explain in comments below.)</font> </font></strong>

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
</body>
</cfdocumentsection>
</cfif>







<CFIF #read_Title.pstate# eq "CA" >
<cfdocumentsection>
<cfdocumentitem type="header">
<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10px}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18px}
.small_header {font-family:"Times New Roman", Times, serif; font-size:16px}
</style>
</cfdocumentitem >

<cfdocumentitem type="footer">
</cfdocumentitem >

<body style="background-color: #FFFFFF" >
<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10px}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18px}
.small_header {font-family:"Times New Roman", Times, serif; font-size:16px}
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
            <a href="http://machine1.firsttitleservices.com" target="_blank">machine1.firsttitleservices.com</a></B></Center>
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
            commitment is issued through First American Title Insurance Company.
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




   <CFQUERY datasource="#request.dsn#" name="Read_company">
	SELECT company
	FROM COMPANIES
	where ID = #read_title.comp_id# and (COMPANY LIKE 'FLAGSTAR%' or COMPANY LIKE 'MB FINANCIAL%')
	</CFQUERY>

<CFIF #Read_company.recordCount# GT 0>


<!--- =================[ BEGIN Vesting Page        ]======================== --->
<!--- ====================================================================== --->
<cfdocumentsection>
<cfdocumentitem type="header">
<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10px}
.big_header {font-family:"Times New Roman", Times, serif; font-size:24px}
.small_header {font-family:"Times New Roman", Times, serif; font-size:16px}
</style>
<table width="100%" cellpadding=0 cellspacing=0 border=0>
    <tr>
          <td>
<center><br>
<span class="big_header"><i>First American Title Insurance Company</i></span><BR><br>
&nbsp;<br>
<span="small_header">SCHEDULE A</span><br>
</strong>
</center>
          </td>
    </tr>
</table>
</cfdocumentitem >
<cfdocumentitem type="footer">
<table width="100%" cellpadding=0 cellspacing=0 border=0 style="height:40px;">
              <tr>
                <td valign="middle" width="60%" align="left" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="black" size="1">Commitment Schedule A / Dual Form</font></td>
                <td align="center" valign="top">&nbsp;</td>
              </tr>
</table>
</cfdocumentitem >

<body style="background-color: #FFFFFF" >
<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10px}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18px}
.small_header {font-family:"Times New Roman", Times, serif; font-size:16px}
</style>
<cfinclude template="../VestingPage.cfm">
</body>
</cfdocumentsection>

</cfif>






<!--- =================[ BEGIN SCHEDULE A         ]======================== --->
<!--- ====================================================================== --->
<cfdocumentsection>
<cfdocumentitem type="header">
<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10px}
.big_header {font-family:"Times New Roman", Times, serif; font-size:24px}
.small_header {font-family:"Times New Roman", Times, serif; font-size:16px}
</style>
<table width="100%" cellpadding=0 cellspacing=0 border=0>
    <tr>
          <td>
<center><br>
<span class="big_header"><i>First American Title Insurance Company</i></span><BR><br>
&nbsp;<br>
<span="small_header">SCHEDULE A</span><br>
</strong>
</center>
          </td>
    </tr>
</table>
</cfdocumentitem >
<cfdocumentitem type="footer">
<table width="100%" cellpadding=0 cellspacing=0 border=0 style="height:40px;">
              <tr>
                <td valign="middle" width="60%" align="left" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="black" size="1">Commitment Schedule A / Dual Form</font></td>
                <td align="center" valign="top">&nbsp;</td>
              </tr>
</table>
</cfdocumentitem >

<body style="background-color: #FFFFFF" >
<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10px}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18px}
.small_header {font-family:"Times New Roman", Times, serif; font-size:16px}
</style>
<table width="100%" cellpadding=0 cellspacing=0 border=0 >
        <tr>
		  <td colspan="2" align="left" valign="middle" bgcolor="ffffff" height="30"><strong>THIS DOCUMENT CONSTITUTES A STATEMENT OF THE TERMS AND CONDITIONS ON WHICH A TITLE INSURER IS WILLING TO ISSUE A POLICY OF TITLE INSURANCE IF THE TITLE INSURER ACCEPTS THE PREMIUM FOR THE POLICY.  IT IS NOT A REPRESENTATION AS TO THE STATE OF TITLE AND IT DOES NOT CONSTITUTE AN ABSTRACT OF TITLE.</strong></td>
	</tr>
</table><br>


      <table width="100%" cellpadding=1 cellspacing=1 border=0 valign="top" >
        <!-------- ( 1.) Starts --------------->
        <tr><td width="2%">&nbsp;</td><td colspan=2 align="center"><table border=0 cellpadding=1 cellspacing=0 bgcolor=000000 width=600><tr><td><table border=0 cellpadding=1 bgcolor=FFFFFF width=598><tr><td><span class="smallnotice">Please read the exceptions and the terms shown or referred to herein carefully. The exceptions are meant to provide you
with notice of matters which are not covered under the terms of the title insurance policy and should be carefully
considered. It is important to note that this form is not a written representation as to the condition of title and may not list
all liens, defects, and encumbrances affecting title to the land.</span></td></tr></table></td></tr></table>
		<br>
</td></tr>



		<tr>
          <td width="2%">&nbsp;</td>
          <td width="10%" align="left" valign="top">&nbsp;</td>
          <td  valign="top" align="right">Commitment Number: T-<cfoutput>#url.rec_ID#</cfoutput><br>
<br>
</td>
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
            <td valign="top"> <table width="100%" valign="top" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td align="right" valign="top">(a)</td>
                  <td width="20">&nbsp;</td>
                  <td>ALTA Owner's Policy&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Amount of Insurance $<B> <cfif IsNumeric(Trim(read_title.purchase)) and #read_title.purchase# neq "" and #read_title.purchase# neq 0 and #read_title.purchase# neq 'NULL'>#NumberFormat(read_title.Purchase,
              "999,999,999.00")#<cfelse>TBD</cfif></B><br>
<input type="checkbox">&nbsp;ALTA 2006 Policy (Form 1402.06, 6/17/06)<br>
<input type="checkbox">&nbsp;EAGLE Protection Owner's Policy (Form 1490, 6/98)<BR>
<i><font size=-1>(The Company's maximum dollar of liability for those covered risks in Paragraphs 14, 15, 16, and 18 of the EAGLE Protection Owner's Policy to be issued herein are attached hereto as an Exhibit.)</font></i><br>
</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td width="20">&nbsp;</td>
                  <td>Proposed Insured:<br>
<B><cfif Len(read_title.company1) and read_title.company1 neq ''>#read_title.company1#<cfelse><cfif #read_title.purchase# neq "" and  #read_title.purchase# neq 0 and  #read_title.purchase# neq "NULL">#Buyer_1#, &nbsp;&nbsp;#Buyer_2#<cfif Len(read_title.blastname3)>, #read_title.bfirstname3# #read_title.blastname3# </cfif><cfif Len(read_title.blastname4)>, #read_title.bfirstname4# #read_title.blastname4# </cfif><cfelse><cfif read_title.title_id eq 94545>#read_title.insured#<cfelse>TBD</cfif></cfif></cfif></td>
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
                  <td>ALTA Loan Policy&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Amount of Insurance $<B> <cfif #read_title.loanamt_float# neq "" and #read_title.loanamt_float# neq 0 and #read_title.loanamt_float# neq 'NULL'>#NumberFormat(read_title.loanamt_float, "999,999,999.00")#<cfelse>TBD</cfif></B><br>
<cfif read_title.searchtype contains 'Second Mortgage' and read_title.jlp_policy eq 1>
<input type="checkbox">&nbsp;ALTA Junior Loan Policy - Short Form Res. Limited Cov. 1996<br>
<cfelse>
<input type="checkbox">&nbsp;ALTA 2006 Policy (Form 1056.06, 6/17/06)<br>
</cfif>
<input type="checkbox">&nbsp;EAGLE Protection Loan Policy (Form 1056 EAGLE-M)</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td width="20">&nbsp;</td>
                  <td><br>
Proposed Insured:<br>
<B>#read_title.insured#, its successors and/or assigns <cfif read_FT_company.company does not contain 'Wells Fargo'>as their interest may appear</cfif></B><br></td>
                </tr>
              </table></td>
            <td align="center" valign="top">&nbsp;</td>
          </tr>

        <!-------- ( 2.) ends --------------->
        <tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<CFQUERY datasource="#request.dsn#" NAME="read_title_data">
            select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs
            is not null </cfquery>
        <tr>
          <td>&nbsp;</td>
          <td align="left" valign="top">3. </td>
          <td colspan="2" valign="top">The estate or interest in the land described or referred to in this Commitment and covered herein is #read_title_data.data38# and title hereto is at the effective date hereof vested in:</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="right" valign="top">&nbsp;</td>
          <td colspan="2" valign="top"><cfif read_title.vesting_override neq '' and read_title.vesting_override neq 'NULL'>#read_title.vesting_override#<cfelse>
<cfif read_title.title_id eq 52901>Elizabeth Warren<cfelseif read_title.title_id eq 52914>Julie Konik<cfelseif read_title.title_id eq 44863>Emilio R. Limchoa and Imelda T. Limchoa<cfelseif read_title.title_id eq 52794>The Village Cooperative Homes<cfelseif read_title.title_id eq 44894>Kindra McLeroy Pack, Barbara A. McLeroy and Wayne McLeroy by Barbara A. McLeroy, his heir.<cfelseif read_title.title_id eq 59179>Chang-Tai Hsieh and Sally Jo Hsieh<cfelseif read_title.title_id eq 57411>ALEXANDER MAKRIS<cfelseif read_title.comp_id eq 3943 or read_title.comp_id eq 4043 or read_title.comp_id eq 4042>#read_title.full_vesting#<cfelse>#read_title_data.data3#<cfif #read_title_data.data4# neq "">&nbsp;AND&nbsp;#read_title_data.data4#</cfif><cfif #read_title_data.data6# neq "">,&nbsp;#read_title_data.DATA6#</b></font></cfif></cfif>
</cfif></td>
        </tr>
        <tr>
          <td colspan="4">&nbsp;</td>
        </tr>

        <tr>
          <td>&nbsp;</td>
          <td align="left" valign="top">4. </td>
          <td colspan="2" valign="top">The land referred to in this Commitment is as described on the attached legal description.</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="right" valign="top">&nbsp;</td>
          <td colspan="2" align = "center"  valign="top"><b></cfoutput>



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
<tr><td valign="bottom" colspan="2" style="border-bottom-color:black; border-bottom-style:solid; border-bottom-width:1px;">By: &nbsp;&nbsp;&nbsp;<cfif read_FT_company.ID eq 2632 or read_FT_company.master_co_id eq 2632><img src="http://machine1.firsttitleservices.com/images/alan_sig.jpg"><CFELSEIF #read_Title.pstate# eq "CA" or #read_Title.pstate# eq "NV"><img src="http://machine1.firsttitleservices.com/images/steve_sig.jpg"><CFELSE><img src="http://machine1.firsttitleservices.com/images/steve_sig.jpg"></CFIF>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Authorized Signatory</td>
</tr>
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
td {font-family:"Times New Roman", Times, serif; font-size:10px}
.big_header {font-family:"Times New Roman", Times, serif; font-size:24px}
.small_header {font-family:"Times New Roman", Times, serif; font-size:16px}
</style>
<table width="100%" cellpadding=0 cellspacing=0 border=0>
    <tr>
          <td>
<center><br>
<span class="big_header"><i>First American Title Insurance Company</i></span><BR><br>
&nbsp;<br>
<span="small_header">LEGAL DESCRIPTION</span><br>
</strong>
</center>
          </td>
    </tr>
</table>
</cfdocumentitem >
<cfdocumentitem type="footer">
<table width="100%" cellpadding=0 cellspacing=0 border=0 style="height:40px;">
              <tr>
                <td valign="middle" width="60%" align="left" colspan="2">&nbsp;</td>
              </tr>
</table>
</cfdocumentitem >

<body style="background-color: #FFFFFF" >
<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10px}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18px}
.small_header {font-family:"Times New Roman", Times, serif; font-size:16px}
</style>
<br>
<table width="100%" cellpadding=0 cellspacing=0 border=0 >
<tr>
          <td  valign="top" align="right">Commitment Number: T-<cfoutput>#url.rec_ID#</cfoutput><br>
&nbsp;<br>
</td>
        </tr>
</table>
<table width="100%" cellpadding=0 cellspacing=0 border=0 >
    <tr>
          <td width="100%" align=left valign=top><b>
		  <cfoutput>
		  <cfif #read_title_data.notes# neq "">#read_title_data.notes#</cfif><br>
<br>

		<cfif #read_title_data.data1# NEQ ""> Being the same property as transferred by #read_title_data.data5# on #DateFormat(read_title_data.data10, "mm")#/#DateFormat(read_title_data.data10, "dd")#/#DateFormat(read_title_data.data10, "yyyy")# and recorded #DateFormat(read_title_data.data11, "mm")#/#DateFormat(read_title_data.data11, "dd")#/#DateFormat(read_title_data.data11, "yyyy")# from #read_title_data.data1#
			<cfif #read_title_data.data2# NEQ ""> and #read_title_data.data2#</CFIF> to #read_title_data.data3#
			<CFIF #read_title_data.data4# NEQ "">and #read_title_data.data4#</CFIF>, #read_title_data.data6#,
			<cfif #read_title_data.data7# eq "">
				<CFIF #read_title_data.data8# NEQ ""> recorded in Book #read_title_data.data8#</cfif>
				<cfif #read_title_data.data9# neq ""> and Page #read_title_data.data9#</cfif>
			<cfelse> 
				recorded in Document Number #read_title_data.data7# 

				<!---(start) -- Added by Synechron Development for ticket# 454 -------->
				<cfif  #len(read_title_data.data7)# gt 0 AND #len(read_title_data.data8)# gt 0 > ,</cfif>
					<!-- check for book no. and page no. --->
				<cfif #len(read_title_data.data8)# gt 0 AND #len(read_title_data.data9)# gt 0 >
				in Book #read_title_data.data8# at Page #read_title_data.data9# 
				</cfif>	   
				<!---(end) -- Added by Synechron Development for ticket# 454 ------->  


					
			</cfif>
		</cfif>
		<br><br>

#read_title_data.data14#<br><br>
</cfoutput>
 
          </b></td>
    </tr>
</table>
</body>
</cfdocumentsection>












<!--- =================[ BEGIN EXHIBIT PAGE       ]======================== --->
<!--- ====================================================================== --->
<cfdocumentsection>
<cfdocumentitem type="header">
<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10px}
.big_header {font-family:"Times New Roman", Times, serif; font-size:24px}
.small_header {font-family:"Times New Roman", Times, serif; font-size:16px}
</style>
<table width="100%" cellpadding=0 cellspacing=0 border=0>
    <tr>
          <td>
<center><br>
<span class="big_header"><i>First American Title Insurance Company</i></span><BR><br>
&nbsp;<br>
<span="small_header">EXHIBIT</span><br>
</strong>
</center>
          </td>
    </tr>
</table>
</cfdocumentitem >
<cfdocumentitem type="footer">
<table width="100%" cellpadding=0 cellspacing=0 border=0 style="height:40px;">
              <tr>
                <td valign="middle" width="60%" align="left" colspan="2">&nbsp;</td>
              </tr>
</table>
</cfdocumentitem >

<body style="background-color: #FFFFFF" >
<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10px}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18px}
.small_header {font-family:"Times New Roman", Times, serif; font-size:16px}
</style>
<table width="100%" cellpadding=0 cellspacing=0 border=0 >
	<tr>
		<td colspan="3">The following are the maximum dollar limits of liability for the covered risks identified and which will be attached to and made part of the EAGLE Protection Owner's Policy (Form 1490, 6/98) to be issued herein:<br>
<br>
<div align="center">
<table width="600" border=1 cellpadding="12">
<tr>
<td align="center" valign="middle"><strong>Covered Risk Number</strong></td>
<td align="center" valign="middle"><strong>Company's Maximum Dollar<br>
Limit of Liability</strong></td>
</tr>
<tr>
<td align="center" valign="middle">Fourteen<br>
(Subdivision Law Violation)</td>
<td align="center" valign="middle">$10,000</td>
</tr>
<tr>
<td align="center" valign="middle">Fifteen<br>
(Building Permit)</td>
<td align="center" valign="middle">$25,000</td>
</tr>
<tr>
<td align="center" valign="middle">Sixteen<br>
(Zoning)</td>
<td align="center" valign="middle">$25,000</td>
</tr>
<tr>
<td align="center" valign="middle">Eighteen<br>
(Encroachment of Boundary Walls and Fences)</td>
<td align="center" valign="middle">$5,000</td>

</tr>

</table>
</div></td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
</table>
</body>
</cfdocumentsection>

















<!--- =================[ BEGIN B - I      ]======================== --->
<!--- ====================================================================== --->
<cfdocumentsection>
<cfdocumentitem type="header">
<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10px}
.big_header {font-family:"Times New Roman", Times, serif; font-size:24px}
.small_header {font-family:"Times New Roman", Times, serif; font-size:16px}
</style>
<table width="100%" cellpadding=0 cellspacing=0 border=0>
    <tr>
          <td>
<center><br>
<span class="big_header"><i>First American Title Insurance Company</i></span><BR><br>
&nbsp;<br>
<span="small_header">SCHEDULE B - SECTION I</span><br>
</strong>
</center>
          </td>
    </tr>
</table>
</cfdocumentitem >
<cfdocumentitem type="footer">
<table width="100%" cellpadding=0 cellspacing=0 border=0 style="height:40px;">
              <tr>
                <td valign="middle" width="60%" align="left" colspan="2">&nbsp;</td>
              </tr>
</table>
</cfdocumentitem >

<body style="background-color: #FFFFFF" >
<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10px}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18px}
.small_header {font-family:"Times New Roman", Times, serif; font-size:16px}
</style>
<table width="100%" cellpadding=0 cellspacing=0 border=0 >
<tr>
          <td  valign="top" align="right">Commitment Number: T-<cfoutput>#url.rec_ID#</cfoutput><br>
&nbsp;<br>
</td>
        </tr>
</table>
<table width="100%" cellpadding=0 cellspacing=0 border=0 >
	<tr>
		  <td colspan="2" align="center">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2">The following are the requirements to be complied with:</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
</table>
      <table width="93%" cellpadding=0 cellspacing=0 border=0 >
        <tr>
		  <td width="5%" valign="top">1.</td>
		<td>Proof of payment of any and all current liens, assessments and charges prior to the closing.<br>
<br>
Additional documents satisfactory to this Company that create interest in the land to be insured which must be signed, delivered and recorded, such as, but not limited to, any and all recordable loan documents and lender instructions.</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		  <td width="5%" valign="top">2.</td>
		<td>Pay us the premiums, fees and charges for the policy.</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		  <td width="5%" valign="top">3.</td>
		<td>Pay all taxes, charges, assessments, levied and assessed against subject premises, which are due and payable.</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
<CFQUERY datasource="#request.dsn#" NAME="Read_temp_comp_b1">
					SELECT *
					FROM Title
					WHERE Title_ID = #rec_ID#
		</CFQUERY>

<tr>
		  <td width="5%" valign="top">4.</td>
		<td>Provide a survey acceptable to First American Title Insurance Company or Exception 2 will remain on
the Owner's Title Policy.<br>
</td></tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
<tr>
		  <td width="5%" valign="top">5.</td>
		<td>Proper instrument(s) creating the estate or interest to be insured must be executed and duly filed for
record, to wit:<br>
</td></tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
<cfif read_title.pstate eq 'DC'>
<tr>
		  <td width="5%" valign="top">6.</td>
		<td>This Company must be furnished with satisfactory proof that caption property is owner occupied,
occupied by the proposed purchaser, or vacant. In the event of sale or lease of caption property, and
if tenant occupied, further proof is required that the requirements of Titles IV and V of D.C. Law 3-86,
"Rental Housing Conversion and Sale Act of 1980," as amended, have been complied with.<br>
</td></tr>
<cfset auto_number = 6>
<cfelse>
<cfset auto_number = 5>
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
Receipt of proper Notice of Sale and evidence of delivery to the borrower and subordinate lien holders as required by Virginia Code ?55-59.1.
<br>
<br>

			</td>
		</tr>
<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
		    <td><cfoutput>#auto_number#</cfoutput>.</td>
       <td>
Receipt of Certificate of Publication evidencing advertisement in compliance with Virginia Code ?55-59.2 and the terms of the Deed of Trust.
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
Receipt of satisfactory evidence that the borrower in not entitled to relief or protection under the Servicemembers Civil Relief Act, 50 USCS Appx ? 501 et seq.  If such evidence is not available, the following exception will appear in any Title Policy issued pursuant to this Commitment: "Any claim based upon the Servicemembers Civil Relief Act, 50 USCS Appx ? 501 et seq., which restricts foreclosure, forfeiture and other legal proceedings based upon military service in the uniformed services of the United States."
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

<!--- --Edit (Start) Added by Synechron Development for ticket# 761 -------------------------------------------------------------------------- --->
	<cfif read_title.pstate eq 'GA'>
		<cfset auto_number = #auto_number# + 1>
        <tr>
		<td width="3%" valign="top"><cfoutput>#auto_number#.</cfoutput></td>
          <td align = "left" colspan="3" valign="top"><cfoutput> Receipt of proof satisfactory to the Company that no improvements or repairs were made on caption property within ninety-five (95) days preceding the filing for record of the instrument(s) required at Item 1 above, or, in the event such improvements or repairs were made, that they have been completed and all costs incurred in connection therewith, including architect?s fees, if any, have been paid; and that there are not parties in possession or with a right to possession other than Seller / Mortgagor.  In the event that improvements or repairs were made on the property within 95 days preceding the closing and a general contractor was employed in connection therewith, in addition to the owner?s affidavit required as item 4 above, the Company further requires a sworn Affidavit, Lien Subordination and Indemnity of the General Contractor, executed pursuant to Georgia statute, which identifies all subcontractors, material suppliers, and labors, a copy of which must be furnished for our file.  Also the Company must be provided with lien subordinations or Final Lien Waivers from all subcontractors, material suppliers, and labors listed in the General Contractor?s Affidavit. <br><br>

		  Proof satisfactory to the Company, that all taxes or special assessments, including water bills, which are not shown as existing liens on the public record are paid in full at the time of closing.  Upon receipt of such proof, Item (e) of the Standard Exceptions in Part II, Schedule B will be deleted or amended in accordance with the facts shown thereby.</cfoutput>
			</td>
        </tr>      
	</cfif>
<!--- --Edit (End) Added by Synechron Development for ticket# 761 -------------------------------------------------------------------------- --->



<cfset auto_number = auto_number + 1>
        <tr>
		<td valign="top"><cfoutput>#auto_number#</cfoutput></td>
          <td align = "left" colspan="3" valign="top">Property Taxes, which are a lien not yet due and payable, including any assessments collected with taxes to be levied for the fiscal year <cfoutput><cfset current_year = #DateFormat(Now(), "YYYY")#><cfset last_year = #current_year# - 1>#last_year#-#current_Year#</cfoutput>.
		 </td>
        </tr>

        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
<cfset auto_number = auto_number + 1>
        <tr>
		<td valign="top"><cfoutput>#auto_number#</cfoutput></td>
          <td align = "left" colspan="3" valign="top">Property taxes, including any personal property taxes and any assessments collected with taxes.
		 </td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
<!--- Edit (Start) Added by Synechron Development for ticket# 761 --->
		<cfif read_title.pstate eq 'GA'>
		<cfset auto_number = auto_number + 1>
			<tr>
				<td valign="top"><cfoutput>#auto_number#</cfoutput></td>
				<td align = "left" colspan="3" valign="top">Retroactive or additional taxes or assessments, and interest and penalties, which may be imposed by adjustment, reappraisal, reassessment, appeal, amendment to the tax records, or otherwise.</td>
			</tr> 
		<tr>
			<td colspan="2">&nbsp;</td>
        </tr>			
		</cfif>
	<!--- Edit (End) Added by Synechron Development for ticket# 761 --->
	
<cfoutput>
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

			<cfelse>
			</cfif>
</cfoutput>

<cfset mortgages_liens = 0>
<tr>
		  <td width="5%" valign="top">&nbsp;</td>
		<td><br>
<B>ADDITIONAL REQUIREMENTS</B><br>
<br>
<!--- <cfoutput>Deed of Trust from <cfif #Read_temp_comp_b1.bfirstname1# neq "">#Read_temp_comp_b1.bfirstname1#</cfif>&nbsp;<cfif #Read_temp_comp_b1.bminame1# neq "">#Read_temp_comp_b1.bminame1#.</cfif><cfif #Read_temp_comp_b1.blastname1# neq ""> #Read_temp_comp_b1.blastname1#</cfif><cfif #Read_temp_comp_b1.bfirstname2# neq ""> AND #Read_temp_comp_b1.bfirstname2#</cfif>&nbsp;<cfif #Read_temp_comp_b1.bminame2# neq "">#Read_temp_comp_b1.bminame2#.</cfif><cfif #Read_temp_comp_b1.blastname2# neq ""> #Read_temp_comp_b1.blastname2#</cfif>, securing <cfif #Read_temp_comp_b1.insured# neq "">#Read_temp_comp_b1.insured#</cfif> in the amount of $#Read_temp_comp_b1.loanamt_float#<br>
</cfoutput><br> --->
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
		<cfif #read_mortgage.data1# NEQ ""> 
			<cfif read_mortgage.lienintro neq "" and read_mortgage.lienintro neq 'NULL' or Len(read_mortgage.lienintro) eq 0>
				#read_mortgage.lienintro#
			<cfelse>
				Satisfaction and/or release of
			</cfif> 
			Mortgage from #read_mortgage.data2# 
			<cfif #read_mortgage.data3# neq ""> 
				and #read_mortgage.data3#
			</cfif> 
			securing #read_mortgage.data1# in the original principal amount of #read_mortgage.data4#, as dated #DateFormat(read_mortgage.data8, "mm")#/#DateFormat(read_mortgage.data8, "dd")#/#DateFormat(read_mortgage.data8, "yyyy")# and recorded on #DateFormat(read_mortgage.data9, "mm")#/#DateFormat(read_mortgage.data9, "dd")#/#DateFormat(read_mortgage.data9, "yyyy")# among the Land Records of #read_title.pcounty# County, 
			<cfif #read_mortgage.data5# eq "">
				<cfif #read_mortgage.data6# neq "">in Book #read_mortgage.data6# at Page #read_mortgage.data7# </cfif>
			<cfelse> 
				in Document Number #read_mortgage.data5#
				<!---(start) -- Added by Synechron Development for ticket# 454 Dt. 11-27-2013-------->
				<cfif  #len(read_mortgage.data5)# gt 0 AND #len(read_mortgage.data6)# gt 0 > ,</cfif>
					<!-- check for book no. and page no. --->
				<cfif #len(read_mortgage.data6)# gt 0 AND #len(read_mortgage.data7)# gt 0 >
				in Book #read_mortgage.data6# at Page #read_mortgage.data7# 
				</cfif>	   
				<!---(end) -- Added by Synechron Development for ticket# 454 ------->  


				 
			</cfif>
			<cfif #read_mortgage.data13# neq ""> 
				Assigned to #read_mortgage.data13# recorded on #DateFormat(read_mortgage.data17, "mm")#/#DateFormat(read_mortgage.data17, "dd")#/#DateFormat(read_mortgage.data17, "yyyy")#, in Book 
				<cfif #read_mortgage.data14# eq "">
					#read_mortgage.data15#, at Page #read_mortgage.data16# 
				<cfelse> 
					in Document #read_mortgage.data14#
					
				<!---(start) -- Added by Synechron Development for ticket# 454 Dt. 11-27-2013-------->
				<cfif  #len(read_mortgage.data14)# gt 0 AND #len(read_mortgage.data15)# gt 0 > ,</cfif>
					<!-- check for book no. and page no. --->
				<cfif #len(read_mortgage.data15)# gt 0 AND #len(read_mortgage.data16)# gt 0 >
				in Book #read_mortgage.data15# at Page #read_mortgage.data16# 
				</cfif>	   
				<!---(end) -- Added by Synechron Development for ticket# 454 ------->  
					
					
				</cfif> 
			</cfif>
			<cfif #read_mortgage.data18# neq "">
				Assigned to #read_mortgage.data18# recorded on #DateFormat(read_mortgage.data22, "mm")#/#DateFormat(read_mortgage.data22, "dd")#/#DateFormat(read_mortgage.data22, "yyyy")#, 
				<cfif #read_mortgage.data19# eq "">
					in Book #read_mortgage.data20#, at Page #read_mortgage.data21# 
				<cfelse> 
					in Document #read_mortgage.data19# 

					<!---(start) -- Added by Synechron Development for ticket# 454 Dt. 11-27-2013-------->
					
					<cfif  #len(read_mortgage.data19)# gt 0 AND #len(read_mortgage.data20)# gt 0 > ,</cfif>
					<cfif #len(read_mortgage.data20)# gt 0 AND #len(read_mortgage.data21)# gt 0 >
					in Book #read_mortgage.data20# at Page #read_mortgage.data21# 
					</cfif>	   
					
					<!---(end) -- Added by Synechron Development for ticket# 454 ------->  

					
				</cfif> 
			</cfif>
			<cfif #read_mortgage.data23# neq "">
				Assigned to #read_mortgage.data23# recorded on #DateFormat(read_mortgage.data27, "mm")#/#DateFormat(read_mortgage.data27, "dd")#/#DateFormat(read_mortgage.data27, "yyyy")#, 
			<cfif #read_mortgage.data24# eq ""> 
				in Book #read_mortgage.data25#, at Page #read_mortgage.data26# 
			<cfelse> 
				in Document #read_mortgage.data24#
				<!---(start) -- Added by Synechron Development for ticket# 454 Dt. 11-27-2013-------->
				<cfif  #len(read_mortgage.data24)# gt 0 AND #len(read_mortgage.data25)# gt 0 > ,</cfif>
				<cfif #len(read_mortgage.data25)# gt 0 AND #len(read_mortgage.data26)# gt 0 >
				in Book #read_mortgage.data25# at Page #read_mortgage.data26# 
				</cfif>	   
				<!---(end) -- Added by Synechron Development for ticket# 454 ------->  

			</cfif> 
		</cfif>
		<cfif #read_mortgage.data28# neq "">
			Assigned to #read_mortgage.data28# recorded on #DateFormat(read_mortgage.data32, "mm")#/#DateFormat(read_mortgage.data32, "dd")#/#DateFormat(read_mortgage.data32, "yyyy")#, 
			<cfif #read_mortgage.data29# EQ ""> 
				in Book #read_mortgage.data30#, at Page #read_mortgage.data31# 
			<cfelse> 
				in Document #read_mortgage.data29#
				<!---(start) -- Added by Synechron Development for ticket# 454 Dt. 11-27-2013-------->
				<cfif  #len(read_mortgage.data29)# gt 0 AND #len(read_mortgage.data30)# gt 0 > ,</cfif>
				<cfif #len(read_mortgage.data30)# gt 0 AND #len(read_mortgage.data31)# gt 0 >
				in Book #read_mortgage.data30# at Page #read_mortgage.data31# 
				</cfif>	   
				<!---(end) -- Added by Synechron Development for ticket# 454 ------->  
			</cfif> 
		</cfif>
		
		<cfif #read_mortgage.data11# neq "">#read_mortgage.data11#</cfif> <cfif #read_mortgage.data12# neq "">#read_mortgage.data12#</cfif></cfif>
<br>
<br>

			</td>
		</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
</cfoutput>




			<CFQUERY datasource="#request.dsn#" NAME="read_lien">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 is not NULL
			order by selectedOrgs3
			</cfquery>
<cfif read_lien.recordcount GT 0>
<cfset mortgages_liens = 1>

		<cfoutput query = "read_lien">
	<cfset auto_number = #auto_number# + 1>

	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien.data7# NEQ "">
			<cfif #read_lien.lienintro# NEQ "UCC Financing Statement" >#read_lien.lienintro# Judgment <cfelse>#read_lien.lienintro#</cfif> against #read_lien.data7# in favor of #read_lien.data6# in the amount of #read_lien.data5#,
			  dated #DateFormat(read_lien.data4, "mm")#/#DateFormat(read_lien.data4, "dd")#/#DateFormat(read_lien.data4, "yyyy")#
			  and recorded #DateFormat(read_lien.data9, "mm")#/#DateFormat(read_lien.data9, "dd")#/#DateFormat(read_lien.data9, "yyyy")#,
			  <cfif #read_lien.data1# eq ""> 
			  	in Book #read_lien.data2# at Page #read_lien.data3# 
			  <cfelse> 
			  	in Document #read_lien.data1#
				<!---(start) -- Added by Synechron Development for ticket# 454 Dt. 11-27-2013-------->
				<cfif  #len(read_lien.data1)# gt 0 AND #len(read_lien.data2)# gt 0 > ,</cfif>
				<cfif #len(read_lien.data2)# gt 0 AND #len(read_lien.data3)# gt 0 >
				in Book #read_lien.data2# at Page #read_lien.data3# 
				</cfif>	   
				<!---(end) -- Added by Synechron Development for ticket# 454 ------->  

			  </cfif>
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
<cfset auto_number = #auto_number# + 1>
		<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
<cfif read_title.comp_id neq 8417> <!--- removed for Doc Solution, Inc. - DIL.  There will be no new mortgage put on for these deals --->
	      <tr align="left" valign="top">
            <td><cfoutput>#auto_number#</cfoutput>.</td>
		    <td>
              <cfoutput>Recordation of (mortgage/deed of trust) from <cfif Len(read_title.blastname1)>, #read_title.bfirstname1# #read_title.blastname1# </cfif><cfif Len(read_title.blastname2)>, #read_title.bfirstname2# #read_title.blastname2# </cfif><cfif Len(read_title.blastname3)>, #read_title.bfirstname3# #read_title.blastname3# </cfif><cfif Len(read_title.blastname4)>, #read_title.bfirstname4# #read_title.blastname4# </cfif> securing #read_title.insured# in the amount of $<cfif #read_title.loanamt_float# neq "" and #read_title.loanamt_float# neq 0 and #read_title.loanamt_float# neq 'NULL'>#NumberFormat(read_title.loanamt_float, "999,999,999.00")#<cfelse>TBD</cfif> </cfoutput>
		</td>
	</tr>
		<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
</cfif>
<cfif mortgages_liens eq 0 and (#read_title_data.addreq# eq "NULL")>
	<tr>
		  <td>&nbsp;</td><td colspan="2"><strong>NONE</strong></td>
	</tr>
</cfif>
<cfset auto_number = #auto_number# + 1>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		  <td valign="top"><cfoutput>#auto_number#</cfoutput>.</td><td colspan="2">First American Title Insurance Company reserves the right to make additional exceptions and/or requirements upon compliance with the requirements set forth herein.<br>
<br>
<center><strong>END OF REQUIREMENTS</strong></center></td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
</table>

</body>
</cfdocumentsection>























<!--- =================[ BEGIN SCHEDULE B - II       ]======================== --->
<!--- ====================================================================== --->
<cfdocumentsection>
<cfdocumentitem type="header">
<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10px}
.big_header {font-family:"Times New Roman", Times, serif; font-size:24px}
.small_header {font-family:"Times New Roman", Times, serif; font-size:16px}
</style>
<table width="100%" cellpadding=0 cellspacing=0 border=0>
    <tr>
          <td>
<center><br>
<span class="big_header"><i>First American Title Insurance Company</i></span><BR><br>
&nbsp;<br>
<span="small_header">SCHEDULE B - SECTION II</span><br>
</strong>
</center>
          </td>
    </tr>
</table>
</cfdocumentitem >
<cfdocumentitem type="footer">
<table width="100%" cellpadding=0 cellspacing=0 border=0 style="height:40px;">
              <tr>
                <td valign="middle" width="60%" align="left" colspan="2">&nbsp;</td>
              </tr>
</table>
</cfdocumentitem >

<body style="background-color: #FFFFFF" >
<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10px}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18px}
.small_header {font-family:"Times New Roman", Times, serif; font-size:16px}
</style>

<table width="100%" cellpadding=0 cellspacing=0 border=0 >
<tr>
          <td  valign="top" align="right">Commitment Number: T-<cfoutput>#url.rec_ID#</cfoutput><br>
&nbsp;<br>
</td>
        </tr>
</table>

<table width="100%" cellpadding=0 cellspacing=0 border=0 >
        <tr>
		  <td width="5%" valign="top">1.</td>
		<td>Any facts, rights, interests, or claims which are not shown by the public records but which could be
ascertained by an inspection of said land or by making inquiry of persons in possession thereof.</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
        <tr>
		  <td width="5%" valign="top">2.</td>
		<td>Discrepancies, conflicts in boundary lines, shortage in area, encroachments, or any other facts
which a correct survey would disclose, and which are not shown by public records. The coverage
afforded by covered matter 2(c) is hereby deleted.<BR>
<strong>NOTE</strong>: As to issuance of the Eagle Protection Owner's Policy (Form 1490, 6/98), this exception
does not limit the forced removal coverage in Item 12 of Covered Risks.</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
        <tr>
		  <td width="5%" valign="top">3.</td>
		<td>Any lien, or right to a lien, for service, labor or material theretofore or hereafter furnished, imposed
by law and not shown by the public records.<BR>
<strong>NOTE</strong>: As to issuance of the Eagle Protection Owner's Policy (Form 1490, 6/98), this exception
does not limit the coverage in Item 8 of Covered Risks.</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
        <tr>
		  <td width="5%" valign="top">4.</td>
		<td>Roads, ways, streams or easements, if any, not shown of record, riparian rights and the title to any
filled-in lands.</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		  <td width="5%" valign="top">5.</td>
		<td>Defects, liens, encumbrances, adverse claims or other matters, if any, created, first appearing in the
public records or attaching subsequent to the effective date hereof but prior to the date the proposed
insured acquires of record for value the estate or interest or mortgage thereon covered by this
Commitment.
</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
		<tr>
		  <td width="5%" valign="top">6.</td>
		<td>COVENANTS, CONDITIONS AND RESTRICTIONS, IF ANY, APPEARING IN THE PUBLIC RECORDS.</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
		<tr>
		  <td width="5%" valign="top">7.</td>
		<td>ANY EASEMENTS OR SERVITUDES APPEARING IN THE PUBLIC RECORDS.</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
		<tr>
		  <td width="5%" valign="top">8.</td>
		<td>ANY LEASE, GRANT, EXCEPTION OR RESERVATION OF MINERAL RIGHTS APPEARING IN THE PUBLIC RECORDS.</td>
	</tr>	
	<cfset auto_number = 9>
<cfif #read_title.pstate# eq 'DC'>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		  <td width="5%" valign="top">9.</td>
		<td>Rights of tenants under the Rental Housing Conversion and Sale Act of 1980, as amended, and
regulations adopted thereunder.
</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		  <td width="5%" valign="top">10.</td>
		<td>Condominium assessments associated with the Land accruing subsequent to Date of Policy, a lien not yet due and payable and having priority over the Insured Mortgage pursuant to Section 42-1903.13 of the District of Columbia Official Code.
</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		  <td width="5%" valign="top">11.</td>
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
<cfset auto_number = 12>
</cfif>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
    <tr>
		  <td width="5%" valign="top"><cfoutput>#auto_number#</cfoutput>.</td>
		<td>Minerals of whatsoever kind, subsurface and surface substances, including but not limited to coal, lignite, oil, gas, uranium, clay, rock, sand and gravel in, on, under and that may be produced from the Land, together with all rights, privileges and immunities relating thereto, whether or not appearing in the Public Records or listed in Schedule B. The company makes no representation as to the present ownership of any such interests. There may be leases, grants, exceptions or reservation of interest that are not listed.<br>
<br>
The Company makes no representation as to the present ownership of any such interests.  There may be leases, grants, exceptions or reservations of interests that are not listed.<br>
</td>
	</tr>
	
<!--- Edit (Start) Added by Synechron Development for ticket# 633 --->
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	
	<cfif read_title.pstate eq 'IN'>
          <tr align="left" valign="top">
            <td>10.</td>

            <td>The Company assumes no liability for the accuracy of the amount of any exemptions affecting the property or the value of the land and   improvements as shown herein. The property owner/purchaser is responsible for filing any property exemptions, credits or deductions.</td>
  	 </tr>
	
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	
 	 <tr align="left" valign="top">
            <td>11.</td>

            <td>This commitment/policy does not insure against any loss or damage arising out of subsequent assessments or taxes and any penalties and interest, due to any change in the land usage or loss of exemption.</td>
  	 </tr>

	</cfif>
<!--- --Edit (End) Added by Synechron Development for ticket# 633 -------------------------------------------------------------------------- --->
<!--- Edit (Start) Added by Synechron Development for ticket# 566 --->
<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	
	<cfif #read_title.pstate# eq 'SC'>
          <tr>
             <td width="5%" valign="top"><cfoutput>12</cfoutput>.</td>

            <td>Excepting  future taxes assessed as rollback taxes under 12-43-220, Code of Laws of South Carolina (1976), if applicable.</td>
  	 </tr>
	
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
 </cfif>
<!--- --Edit (End) Added by Synechron Development for ticket# 566 -------------------------------------------------------------------------- --->
		
		<!--- Edit (Start) Added by Synechron Development for ticket# 761 --->
			<cfif read_title.pstate eq 'GA'>
				<tr>
					<td width="5%" valign="top"><cfoutput>#auto_number + 1#</cfoutput>.</td>
					<td>Any lien, or right to a lien, for services, labor, or material heretofore or hereafter furnished, imposed by law and not shown by the Public Records.</td>
				</tr>  
				<cfset auto_number = 12>				
			</cfif>
		<!--- Edit (End) Added by Synechron Development for ticket# 761 --->
</table>
</body>
</cfdocumentsection>

<!--- =================[ BEGIN SCHEDULE B - II       ]======================== --->
<!--- ====================================================================== --->
<cfdocumentsection>
<cfdocumentitem type="header">
<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10px}
.big_header {font-family:"Times New Roman", Times, serif; font-size:24px}
.small_header {font-family:"Times New Roman", Times, serif; font-size:16px}
</style>
<table width="100%" cellpadding=0 cellspacing=0 border=0>
    <tr>
          <td>
<center><br>
<span class="big_header"><i>First American Title Insurance Company</i></span><BR><br>
&nbsp;<br>
<span="small_header">SCHEDULE B - ADDITIONAL EXCEPTIONS</span><br>
</strong>
</center>
          </td>
    </tr>
</table>
</cfdocumentitem >
<cfdocumentitem type="footer">
<table width="100%" cellpadding=0 cellspacing=0 border=0 style="height:40px;">
              <tr>
                <td valign="middle" width="60%" align="left" colspan="2">&nbsp;</td>
              </tr>
</table>
</cfdocumentitem >

<body style="background-color: #FFFFFF" >
<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10px}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18px}
.small_header {font-family:"Times New Roman", Times, serif; font-size:16px}
</style>
<cfset num_count = 0>
<table width="100%" cellpadding=0 cellspacing=0 border=0 >
<tr>
          <td  valign="top" align="right">Commitment Number: T-<cfoutput>#url.rec_ID#</cfoutput><br>
&nbsp;<br>
</td>
        </tr>
</table>

<table width="100%" cellpadding=0 cellspacing=0 border=0 >
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

        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
		<!--- <cfif read_title.pstate eq 'MD'>
			<tr>
				<td align = "left" colspan="4" valign="top">This document constitutes a statement of the terms and conditions on which a title insurer is
willing to issue a policy of title insurance if the title insurer accepts the premium for the policy.
It is not a representation as to the state of title and does not constitute an abstract of title.</td>
			</tr> 
		<tr>
			<td colspan="2">&nbsp;</td>
        </tr>			
		</cfif>	 --->
	</table>
</body>
</cfdocumentsection>


<!--- =================[ WIRING INSTRUCTIONS   ]======================== --->
<!--- ====================================================================== --->
<cfdocumentsection>
<cfdocumentitem type="header">
<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10px}
.big_header {font-family:"Times New Roman", Times, serif; font-size:24px}
.small_header {font-family:"Times New Roman", Times, serif; font-size:16px}
</style>
<table width="100%" cellpadding=0 cellspacing=0 border=0>
    <tr>
          <td>
<center><br>
<span class="big_header"><i>First American Title Insurance Company</i></span><BR><br>
&nbsp;<br>
<span="small_header">WIRING INFORMATION</span><br>
</strong>
</center>
          </td>
    </tr>
</table>
</cfdocumentitem >
<cfdocumentitem type="footer">
<table width="100%" cellpadding=0 cellspacing=0 border=0 style="height:40px;">
              <tr>
                <td valign="middle" width="60%" align="left" colspan="2">&nbsp;</td>
              </tr>
</table>
</cfdocumentitem >

<body style="background-color: #FFFFFF" >
<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10px}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18px}
.small_header {font-family:"Times New Roman", Times, serif; font-size:16px}
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
td {font-family:"Times New Roman", Times, serif; font-size:10px}
.big_header {font-family:"Times New Roman", Times, serif; font-size:24px}
.small_header {font-family:"Times New Roman", Times, serif; font-size:16px}
</style>
<table width="100%" cellpadding=0 cellspacing=0 border=0>
    <tr>
          <td>
<center><br>
<span class="big_header"><i>First American Title Insurance Company</i></span><BR><br>
&nbsp;<br>
TAX SHEET<br>
</strong>
</center>
          </td>
    </tr>
</table>
</cfdocumentitem >
<cfdocumentitem type="footer">
<table width="100%" cellpadding=0 cellspacing=0 border=0 style="height:40px;">
              <tr>
                <td valign="middle" width="60%" align="left" colspan="2">&nbsp;</td>
              </tr>
</table>
</cfdocumentitem >

<body style="background-color: #FFFFFF; font-family:Arial, Helvetica, sans-serif; font-size:10px" >
<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10px}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18px}
.small_header {font-family:"Times New Roman", Times, serif; font-size:16px}
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




<cfoutput>
<table width="1100" bgcolor="##FFFFFF">
<tr>
<td align="left" valign="top" width="50%">Borrower(s) Name(s):<br>
#read_title.bfirstname1#<cfif Len(read_title.bminame1)> #read_title.bminame1#</cfif> #read_title.blastname1#<br>
<cfif Len(read_title.bminame2)>#read_title.bfirstname2#<cfif Len(read_title.bminame2)> #read_title.bminame2#</cfif> #read_title.blastname2#<br></cfif>
<cfif Len(read_title.bminame3)>#read_title.bfirstname3#<cfif Len(read_title.bminame3)> #read_title.bminame3#</cfif> #read_title.blastname3#<br></cfif>
<cfif Len(read_title.bminame4)>#read_title.bfirstname4#<cfif Len(read_title.bminame4)> #read_title.bminame4#</cfif> #read_title.blastname4#<br></cfif>
<br>
Loan Number: #read_title.loan_number#<br>
Property Address: <br>
#read_title.paddress#<br>
#read_title.pcity#, #read_title.pstate# #read_title.pzip#<br>
<br>


</td>
<td align="left" valign="top" width="50%">
Lender:
#read_title.insured#</td>
</tr>
</table>
</cfoutput>
<table width="1104" cellspacing=0 cellpadding=1 bgcolor="#000000">
<tr><td>
<table width="1100" cellpadding=5 cellspacing=1>
<tr bgcolor="FFFFFF">
<td align="center" valign="top" width="200">A</td>
<td align="center" valign="top" width="100">B</td>
<td align="center" valign="top" width="100">C</td>
<td align="center" valign="top" width="100">D</td>
<td align="center" valign="top" width="100">E</td>
<td align="center" valign="top" width="100">F</td>
<td align="center" valign="top" width="100">G</td>
<td align="center" valign="top" width="100">H</td>
<td align="center" valign="top" width="100">I</td>
<td align="center" valign="top" width="100">J</td>
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
</cfoutput>

</table>
</td></tr></table> 
<br>
<table width="1100">
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