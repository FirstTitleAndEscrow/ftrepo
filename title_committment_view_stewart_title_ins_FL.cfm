<cfparam name="url.uid" default="0">
<cfparam name="url.al" default="0">
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

<cfparam name="company_id" default="#read_title.comp_id#">
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
<cfif read_FT_company.streamline_client eq 1>
<cfset from_email = "titledelivery@streamline-title.com">
<cfset this_company = "Streamline Title & Escrow">
<cfelse>
<cfset from_email = "titledelivery@firsttitleservices.com">
<cfset this_company = "First Title & Escrow">
</cfif>

<CFMAIL
TO="#email#"
FROM="#from_email#"
SERVER="127.0.0.1"
Subject="Stewart Title Insurance Commitment for order #rec_id# - #read_title.bfirstname1# #read_title.blastname1#, Loan No: #read_title.loan_number#"
TIMEOUT="600"
type="HTML"
>
<cfoutput>
View/Print <A HREF="https://#cgi.server_name#/title_committment_view_stewart_title_ins.cfm?comp_id=115&user_id_1=723&lo_id=1217&rec_id=#rec_id#&a_trigger=1&company_id=0">Stewart Title Insurance Commitment</a> for order #rec_id# - #read_title.bfirstname1# #read_title.blastname1#</B></font><br><br>

#this_company# staff
</cfoutput>
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

TD {font-family:"Times New Roman", Times, serif; font-size:12px;}

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
 onclick="factory.printing.Print(true)"></a>
 <cfFORM NAME="Search" METHOD="post" ACTION="https://#cgi.server_name#/admin_area/Title_committment_submit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&company_id=#company_ID#&a_trigger=7&from_page=commitment">
  <FONT FACE=ARIAL SIZE=2 color="black">Enter email to send </font><input type=text name="email" size=20 maxlength=100
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
								> <input type="image" src="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/images/button_submit.gif" border=0 alt="send email">
</cfFORM> <cfif #a_trigger# eq 22>
    <FONT FACE=ARIAL SIZE=2 color="blue">Email sent
</cfif>
</NOBR>

 <hr size="1" color="dimgray">

</div>
<!--- #read_title.comp_id# eq 5026 or #read_title.comp_id# eq 4177 or  --->
<!---  special Checklist for STIFEL orders --->
<cfif #read_title.comp_id# eq 5026 or #read_title.comp_id# eq 4177>
<cfinclude template="stifel_checklist.cfm">
</cfif>
<!--- END special Checklist for STIFEL orders --->


<!--- special invoice page for Vanderbilt orders --->
<cfif #read_title.comp_id# eq 2818>
<cfset IE_pagenum = 0>

<IE:DEVICERECT ID="page0" CLASS="masterstyle" MEDIA="print">
<CFQUERY datasource="#request.dsn#" NAME="get_all" maxrows=10>
SELECT     t.Title_ID, t.loan_number, t.paddress, t.pcity, t.pstate, t.pzip, t.order_date,
           c.company, c.addr1, c.addr2, c.city, c.state, c.zip_code
FROM      Title t INNER JOIN
		  Companies c ON t.comp_id = c.ID
WHERE     (t.title_id = #read_title.title_id#)
</cfquery>

<cfoutput query="get_all">

<style>
TD {font-family:Arial, Helvetica, sans-serif; font-size:12px;}
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
</style>
<table width="600" cellpadding=6 cellspacing=0>
<tr>
<td align="center" valign="top" colspan="5"><strong><font size=4>FIRST TITLE & ESCROW</font></strong><BR>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
7361 Calhoun Place Suite 200

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
<br>
<br>
<br>
<br>
<br>
</cfoutput>
</IE:DEVICERECT>
</cfif>
<!--- end special invoice page for vanderbilt orders --->

<!--- end special invoice page for FIDELITY NATIONAL TITLE (452) orders --->
<cfif #read_title.comp_id# eq 452>
<cfset IE_pagenum = 0>

<IE:DEVICERECT ID="page0" CLASS="masterstyle" MEDIA="print">
<CFQUERY datasource="#request.dsn#" NAME="get_all" maxrows=10>
SELECT     t.Title_ID, t.loan_number, t.paddress, t.pcity, t.pstate, t.pzip, t.order_date,
           c.company, c.addr1, c.addr2, c.city, c.state, c.zip_code
FROM      Title t INNER JOIN
		  Companies c ON t.comp_id = c.ID
WHERE     (t.title_id = #read_title.title_id#)
</cfquery>

<cfoutput query="get_all">

<style>
TD {font-family:Arial, Helvetica, sans-serif; font-size:12px;}
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
</style>
<table width="600" cellpadding=6 cellspacing=0>
<tr>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
<td align="center" valign="top" colspan="5"><strong><font size=4>STREAMLINE TITLE & ESCROW</font></strong><BR>
7361 Calhoun Place Suite 200

Rockville, MD 20850<br>
<cfelse>
<td align="center" valign="top" colspan="5"><strong><font size=4>STREAMLINE TITLE & ESCROW</font></strong><BR>
7361 Calhoun Place, Suite 200
Rockville, MD 20855<br></cfif><br>
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
<br>
<br>
<br>
<br>
<br>
</cfoutput>
</IE:DEVICERECT>
</cfif>
<!--- end special invoice page for FIDELITY NATIONAL TITLE (452) orders --->

<cfif #read_title.comp_id# eq "254">

<!--- <p style="page-break-after:always;">&nbsp;</p> --->
<IE:DEVICERECT ID="<CFOUTPUT><CFIF #read_Title.pstate# eq "CA" OR #read_Title.pstate# eq "NV">page98<CFELSE>Page97</CFIF></cfoutput>" CLASS="masterstyle" MEDIA="print">
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
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr align="left" valign="top">
    <td colspan="3"><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">1.
        Have there been any changes in title in the past 12 months (someone added
        or taken off title, etc.)<br><cfset testDate = #DateFormat(CreateODBCDate(read_deed_info.data11), "m/d/yyyy")#>
        <cfif #DATEDIFF("m", testDate, read_data_info.merge_date)# LT 12>&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/checked.jpg">YES&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/unchecked.jpg" width="73" height="23">NO
        <cfelse>&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/unchecked.jpg">YES&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/checked.jpg" width="73" height="23">NO </cfif><font size="1">(if YES, explain in comments below.)</font> </font></strong>
     <strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">2. Are
        there any items that need to be cleared:<br>
         <cfif #read_data_info.cleared# neq "" OR #read_data_info.clear_needed# neq "">&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/checked.jpg">YES&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/unchecked.jpg" width="73" height="23">NO
         <cfelse>&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/unchecked.jpg">YES&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/checked.jpg" width="73" height="23">NO </cfif><font size="1">(if YES, explain in comments below.)</font> </font></strong>
   <font size="1">(if YES, explain in comments below.)</font></font></strong>
     <strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif">3.
        Are the property taxes up to date?<br>
        <cfif #read_tax_info.data31# eq "Paid">&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/checked.jpg">YES&nbsp;&nbsp;&nbsp;&nbsp;<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/unchecked.jpg" width="73" height="23">NO
        <font size="1">(if NO, explain in comments below.)</font></font></strong></td>
 <cfelse>&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/unchecked.jpg">YES&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/checked.jpg" width="73" height="23">NO </cfif><font size="1">(if NO, explain in comments below.)</font> </font></strong>

  </tr>
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
</IE:DEVICERECT>




<CFELSEIF #READ_TITLE.COMP_ID# EQ 729>

<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM title
			where title_id = #rec_id#

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_comp">

			SELECT *
			FROM companies
			where ID = #read_title.comp_id#

		</CFQUERY>
	<CFQUERY datasource="#request.dsn#" NAME="read_hud">

			SELECT a_1108_a
			FROM hud_form_title_pg2
			where title_id = #rec_id#

		</CFQUERY>					<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
					SELECT *
					FROM recording_fees
					WHERE state = '#read_title.pstate#'


				</CFQUERY>
					<CFIF #read_rec_fees.recordcount# gt "0">
						<CFIF #read_rec_fees.mort_stamps# NEQ "0">
								<CFSET city_mort_stamps = #round(read_title.loanamt_float)# * #read_rec_fees.mort_stamps#>
			<cfelse>
			<CFSET city_mort_stamps = "0">
			</cfif>

	<cfif #read_title.searchType# eq "Purchase">
	<CFIF #read_rec_fees.transfer_tax# NEQ "0">
	<CFSET state_deed_1 = #read_title.loanamt_float# * #read_rec_fees.transfer_tax#>
		<cfelse>
			<CFSET state_deed_1 = "0">   <!-- 1203 total -->
			</cfif>
	<cfelse>
	<CFSET state_deed_1 = "0">
	</cfif>

	<CFIF #read_rec_fees.mort_rec_fee# NEQ "">
<Cfset rec_fee = #read_rec_fees.mort_rec_fee#>
<CFELSE>
<Cfset rec_fee = "0">
</cfif>


	<CFIF #read_rec_fees.release_rec_fee# NEQ "">
<Cfset rel_fee = #read_rec_fees.release_rec_fee#>
<CFELSE>
<Cfset rel_fee = "0">
</cfif>


	<CFIF #read_rec_fees.release_rec_fee# NEQ "" and #read_rec_fees.mort_rec_fee# neq "">
		<CFSET a_fee_total = "0">
		<cfelse>
			<CFSET a_fee_total = "0">
			</cfif>


		<CFIF #read_rec_fees.intangible_tax# NEQ "0" and  #read_rec_fees.intangible_tax# NEQ "">
	<CFSET intang_tax = #round(read_title.loanamt_float)# * #read_rec_fees.intangible_tax#>
		<cfelse>
			<CFSET intang_tax = "0">
			</cfif>




		<cfelse>
			<CFSET rec_fee = "0">
		<CFSET rel_fee = "0">
			<CFSET city_mort_stamps = "0">
				<CFSET a_fee_total = "0">
				<CFSET state_deed_1 = "0">
				<CFSET intang_tax = "0">
			</cfif>




			<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">

			SELECT *
			FROM company_billing_states
			WHERE company_id = '#read_title.comp_id#' and a_states = '#read_title.pstate#'

		</CFQUERY>

<cfoutput query="read_this_sets_billing_states">
		<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">

			SELECT *
			FROM company_billing_values
			WHERE billing_id = #read_this_sets_billing_states.billing_id#

		</CFQUERY>		</CFOUTPUT><CFOUTPUT>

<!--- <p style="page-break-after:always;">&nbsp;</p> --->
<IE:DEVICERECT ID="page100" CLASS="masterstyle" MEDIA="print">


	<table summary="" align="center" border="0" cellpadding="1" cellspacing="1" width="99%">


<tr><td align="left">
<cfif #read_comp.id# eq "729">

<cfif NOT DateDiff("d", Now(), "1/30/2012")>
FIRST TITLE & ESCROW, INC<BR>
7361 Calhoun Place Suite 200
<br>
Rockville, MD 20850<br><br>
<cfelse>
FIRST TITLE & ESCROW, INC<BR>
7361 Calhoun Place, Suite 200<br>
Rockville, MD 20855<br><br>
</cfif>
<CFELSE>

To: #read_comp.company#<br>
From: First Title<br>
</cfif>
Borrower: #read_title.bfirstname1# #read_title.blastname1# <cfif (read_title.manner_of_title neq '' and read_title.manner_of_title neq 'NULL')>(#read_title.manner_of_title#)</cfif><br>
Order Number: #read_title.title_id#<br>
Loan Amount: #read_title.loanamt_float#<br><br>
</td>
</tr>
</table>





				<table width="93%" cellpadding=0 cellspacing=0 border=0 >
    <TR>
        <td>


			<table width="93%" cellpadding=0 cellspacing=0 border=0 >

		<tr>
		<td width="50%"   background="e6e6e6">
		<cfif #read_title.searchType# eq "Refinance">


		<table width="100%" cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
  <tr>

		<td width="50%" colspan = 2   background="e6e6e6">
		<center><font size=2 color=blue face=arial><b>Refinance</b></font></center>
		</td>
		</tr>
	<cfif #read_this_sets_billing_values.a_1101# neq "">
	<tr>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1101. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width="50%" background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101#

		        </td>
	</tr>

	</cfif>
	<cfif #read_this_sets_billing_values.a_1102# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1102. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102#
				 </td>
			</tr>
			</cfif>
			<cfif #read_this_sets_billing_values.a_1103# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1103. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103#
					 </td>
			</tr>
			</cfif>
				<cfif #read_this_sets_billing_values.a_1104# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1104. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104#
		 </td>
	</tr>
	</cfif>
		<cfif #read_this_sets_billing_values.a_1105# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1105. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105#

		 </td>
	</tr>
	</cfif>
		<cfif #read_this_sets_billing_values.a_1106# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1106. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106#
	 </td>
	</tr>
	</cfif>
	<cfif #read_this_sets_billing_values.a_1107# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1107. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107#

		</td>
	</tr>
	</cfif>
	<cfif #read_hud.a_1108_a# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1109. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#read_hud.a_1108_a#

		</td>
	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1111# neq "">
		<tr>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1111.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">

		#read_this_sets_billing_values.a_1111_text#

		</td>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111#



		</td>


	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1112# neq "">

		<tr>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1112. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1112_text#
		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1113# neq "">
		<tr>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1113.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1113_text#
		</td>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113#

		</td>

	</tr>
</cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1201. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1201. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1201. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1202. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1203. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>
	#NumberFormat(state_deed_1, '_____.__')#


		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1204. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Intagible Tax">
Intagible Tax

		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>
  	#NumberFormat(intang_tax, '_____.__')#


		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1205# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1205.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1205_text#
		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1303.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_text#
		</td>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1304.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1304_text#
		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1305. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
			#read_this_sets_billing_values.a_1305_text#

		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305#




		</td>
	</tr>
</cfif>




	</table>


	<cfelseif #read_title.searchtype# eq "purchase">
	<table width="100%" cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>


<tr>

		<td width="50%" colspan = 2   background="e6e6e6">
		<center><font size=2  color=blue face=arial><b>Purchase</b></font></center>
		</td>
		</tr>
		<cfif #read_this_sets_billing_values.a_1101b# neq "">
	<tr>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1101. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101b#

		        </td>
	</tr>

	</cfif>
	<cfif #read_this_sets_billing_values.a_1102b# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1102. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102b#
				 </td>
			</tr>
			</cfif>
			<cfif #read_this_sets_billing_values.a_1103b# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1103. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103b#
					 </td>
			</tr>
			</cfif>
				<cfif #read_this_sets_billing_values.a_1104b# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1104. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104b#
		 </td>
	</tr>
	</cfif>
		<cfif #read_this_sets_billing_values.a_1105b# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1105. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105b#

		 </td>
	</tr>
	</cfif>
		<cfif #read_this_sets_billing_values.a_1106b# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1106. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106b#
	 </td>
	</tr>
	</cfif>
	<cfif #read_this_sets_billing_values.a_1107# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1107. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107b#

		</td>
	</tr>
	</cfif>
	<cfif #read_hud.a_1108_a# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1109. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#read_hud.a_1108_a#

		</td>
	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1111b# neq "">
		<tr>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1111.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">

			#read_this_sets_billing_values.a_1111_textb#

		</td>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111b#



		</td>


	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1112b# neq "">

		<tr>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1112. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1112_textb#
		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1113b# neq "">
		<tr>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1113.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1113_textb#
		</td>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113b#

		</td>

	</tr>
</cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1201. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1201. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1201. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1202. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1203. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>
	#NumberFormat(state_deed_1, '_____.__')#


		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1204. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Intagible Tax">
Intagible Tax

		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>
  	#NumberFormat(intang_tax, '_____.__')#


		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1205b# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1205.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1205_textb#
		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303b# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1303.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_textb#
		</td>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303b#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304b# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1304.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1304_textb#
		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304b#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305b# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1305. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">

		#read_this_sets_billing_values.a_1305_textb#
		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305b#




		</td>
	</tr>
</cfif>

	</table>
	<!---
	</td>

		<td width="50%"   background="e6e6e6">	--->
			<cfelse>
		<table width="100%" cellpadding=0 cellspacing=0 border=1 bgcolor=e3e3e3>
		<!--- <tr>
		<td width="50%"   background="e6e6e6">	 --->
<tr>

		<td width="100%" colspan = 2   background="e6e6e6">
		<center><font size=2 color=blue face=arial><b>Second Mortgage<b></font></center>
		</td>
		</tr>
<cfif #read_this_sets_billing_values.a_1101c# neq "">
	<tr>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1101. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Settlement or Closing Fee">
		Settlement or Closing Fee

		        </td>

						<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1101c#

		        </td>
	</tr>

	</cfif>
	<cfif #read_this_sets_billing_values.a_1102c# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1102. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Abstract or Title Search">
		Abstract or Title Search
				 </td>
<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1102c#
				 </td>
			</tr>
			</cfif>
			<cfif #read_this_sets_billing_values.a_1103c# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1103. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Title Examination">
Title Examination
					 </td>
<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

#read_this_sets_billing_values.a_1103c#
					 </td>
			</tr>
			</cfif>
				<cfif #read_this_sets_billing_values.a_1104c# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1104. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Title Insurance Binder">
Title Insurance Binder
		 </td>
		 	<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1104c#
		 </td>
	</tr>
	</cfif>
		<cfif #read_this_sets_billing_values.a_1105c# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1105. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Document Preparation">
	Document Preparation

		 </td>
		 	<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#read_this_sets_billing_values.a_1105c#

		 </td>
	</tr>
	</cfif>
		<cfif #read_this_sets_billing_values.a_1106c# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1106. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Notary Fees">
		Notary Fees
	 </td>
	 	<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1106c#
	 </td>
	</tr>
	</cfif>
	<cfif #read_this_sets_billing_values.a_1107c# neq "">
	<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1107. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Attorney's Fees">
		Attorney's Fees

		</td>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1107c#

		</td>
	</tr>
	</cfif>
	<cfif #read_hud.a_1108_a# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1109. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Title Insurance Premium">

					Title Insurance Premium
		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#read_hud.a_1108_a#

		</td>
	</tr>
</cfif>
	<cfif #read_this_sets_billing_values.a_1111c# neq "">
		<tr>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1111.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">

			#read_this_sets_billing_values.a_1111_textc#

		</td>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1111c#



		</td>


	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1112c# neq "">

		<tr>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1112. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1112_textc#
		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1112c#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1113c# neq "">
		<tr>

		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1113.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1113_textc#
		</td>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1113c#

		</td>

	</tr>
</cfif>


<cfif #rec_fee# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1201. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Recording fee">

					Recording Fee
		</td>
				<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#rec_fee#

		</td>
	</tr>
</cfif>

<cfif #rel_fee# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1201. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Release Fee">
Release Fee

		</td>
				<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#rel_fee#

		</td>
	</tr>
</cfif>

<cfif #a_fee_total# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1201. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Total Recording Fee">
Total Recording Fee

		</td>
				<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>
	#a_fee_total#

		</td>
	</tr>
</cfif>

<cfif #city_mort_stamps# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1202. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="	City Mortgage Stamps">
	City Mortgage Stamps

		</td>
				<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

	#NumberFormat(city_mort_stamps, '_____.__')#

		</td>
	</tr>
</cfif>
<cfif #state_deed_1# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1203. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="State Deed">
State Deed

		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>
	#NumberFormat(state_deed_1, '_____.__')#


		</td>
	</tr>
</cfif>
<cfif #intang_tax# neq "0">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1204. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Intagible Tax">
Intagible Tax

		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>
  	#NumberFormat(intang_tax, '_____.__')#


		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1205c# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1205.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1205_textc#
		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1205c#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1303c# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1303.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
#read_this_sets_billing_values.a_1303_textc#
		</td>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1303c#

		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1304c# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1304.  <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
	#read_this_sets_billing_values.a_1304_textc#
		</td>
			<td width="50%"   background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1304c#



		</td>
	</tr>
</cfif>

	<cfif #read_this_sets_billing_values.a_1305c# neq "">
		<tr>
		<td width="50%"   background="e6e6e6">
			<font size=2 color=black face=arial>
			1305. <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/info-01.gif" ALT="Data on this line is variable">
				#read_this_sets_billing_values.a_1305_textc#

		</td>
			<td width="50%"  background="e6e6e6">
			<font size=2 color=blue face=arial>

		#read_this_sets_billing_values.a_1305c#




		</td>
	</tr>
</cfif>
</table></cfif>
		</td></tr></table >	</td></tr></table >


		<cfif #read_comp.id# eq "729" or #read_comp.id# eq "100">
<table  border="0" cellpadding="1" cellspacing="1" width="99%">
<tr>
<td align="left"><br><br>
Please forward all recording packages to the address below, and make payment of all clerk's charges to:<br><br></td>
</tr>
<tr>
<td  align="left">
Abstracts USA, LLC.<br>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
7361 Calhoun Place Suite 200
<br>
4th Floor<br>
Rockville, MD 20850
<br><br>
<cfelse>
7361 Calhoun Place<br>
Suite 200<br>
Rockville, MD 20855
<br><br>
</cfif></td></tr><tr>
<td align="left">
IN ORDER TO BEST SERVE YOU PLEASE PROVIDE THE FOLLOW DOCUMENTS AT THE TIME OF RECORDING FOR FINAL POLICY:<br><br>


1. CLOSING INSTRUCTIONS AND ANY AMENDMENTS<br>
2. SIGNED CERTIFIED COPY OF THE HUD-1<br>
3. RECORDING ORIGINALS OR EVIDENCE OF THE RECORDED DOCUMENT<br>
4. PAYOFF DEMANDS<br>
5. COPY OF THE DISBURSEMENT LEDGER<br>
6. OWNERS AFFIDAVITS<br>
7. LIEN POSITION  1ST ____________  2ND __________________<br>
8. ANY CHANGES TO THE OWNERSHIP INTEREST: YES ___________ NO __________<br><br>


PLEASE NOTE:  CHECKS MUST BE PAYABLE TO FIRST TITLE AND ESCROW, INC. FOR RECORDING AND POLICIES, ANY OVERAGES WILL BE REFUNDED WITHIN 10 BUSINESS DAYS.  FOR ALL SHORTAGES WE WILL CONTACT YOUR OFFICE WITHIN 48 HOURS FOR THE CORRECTIONS.<br><br>

ANY SHORTAGES IN THE RECORDING OR POLICY PREMIUM MAY DELAY THE RECORDING OR POLICY BEING ISSUED.<br>

<br><br>
</td>
</tr>
</table>
<CFELSE>
<table  border="0" cellpadding="1" cellspacing="1" width="99%">
<tr>
<td align="left"><br><br>
These fees above do not include any charges for title endorsements unless indicated above.  Please contact your First Title representative for pricing.
</td>
</tr>
<tr>
<td align="left">
If the loan amount on this sheet differs from the current loan amount,
please call our office or email at <cfoutput>#team_email#</cfoutput>
to have a new fee sheet created.<br><br>
</td>
</tr>
</table>
</cfif>


</IE:DEVICERECT>
</cfoutput>

</cfif>





<IE:DEVICERECT ID="<CFOUTPUT><CFIF #read_Title.pstate# eq "CA" OR #read_Title.pstate# eq "NV">page2<CFELSE>Page1</CFIF></cfoutput>" CLASS="masterstyle" MEDIA="print">

<!----1st page starts ----->
<!----------body table starts---------->
<!--- <table width=98% cellpadding=0 cellspacing=0 border=2 align="center" bordercolor="000000" bordercolordark="000000" bordercolorlight="000000">
<tr><td valign="top" align="center">
====================================================================== --->
<!--- =================[ BEGIN SCHEDULE A         ]======================== --->
<!--- ====================================================================== --->
<table width="100%" cellpadding=0 cellspacing=0 border=0 >
        <tr>
		  <td colspan="2" align="center" valign="middle" bgcolor="000000" height="30"><B><font color="FFFFFF" size="4">&nbsp;</font></B></td>
	</tr>
</table>
<table width="93%" cellpadding=0 cellspacing=0 border=0 >
	<tr>
		<td width="33%"><!--- ===/ This is the Title_ID from the Title Table \=== --->
						<cfoutput><NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR></td>
		<td align="Center">
            <NOBR>Stewart Title Guaranty Company</NOBR>
         </td>
    <td align="right"><NOBR>Commitment Number: D-#read_Title.Title_ID# </NOBR></td></cfoutput>
	</tr>
</table>
<table width="93%" cellpadding=0 cellspacing=0 border=0 >
    <tr>
          <td><br>
<br>

		 <div align="center"><strong>ALTA Commitment Form<br>
COMMITMENT FOR TITLE INSURANCE</strong><br>
Issued by<br>
<cfif read_title.comp_id eq 2818>

<table>
<tr>
<td align="right" width="445"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/stewart_logo.jpg"></td>
<td width="40">&nbsp;</td>
<td align="left">Fee: $250.00<br>
<cfif read_title.loan_number NEQ '' and read_title.loan_number NEQ 'NULL'>Loan Number: <cfoutput>#read_title.loan_number#</cfoutput><cfelse>File Number: <cfoutput>#read_title.title_id#</cfoutput></cfif><br>
Due Upon Receipt</FONT>
</td>
</tr>
</table>

			<cfelse>
<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/stewart_logo.jpg">
			</cfif><br></div>
            <BR><BR>
			Stewart Title Guaranty Company, a Texas Corporation ("Company"), for a valuable consideration, commits to issue its policy or policies of title insurance, as identified in Schedule A, in favor of the Proposed Insured named in Schedule A, as owner or mortgagee of the estate or interest in the land described or referred to in Schedule A, upon payment of the premiums and charges and compliance with the Requirements; all subject to the provisions of Schedules A and B and to the Conditions of this Commitment.<br>
<br>
This Commitment shall be effective only when the identity of the Proposed Insured and the amount of the policy or policies committed for have been inserted in Schedule A by the Company.<br>
<br>
All liability and obligation under this Commitment shall cease and terminate six months after the Effective Date or when the policy or policies committed for shall issue, whichever first occurs, provided that the failure to issue the policy or policies is not the fault of the Company.<br>
<br>
The Company will provide a sample of the policy form upon request. <br>
<br>
This commitment shall not be valid or binding until countersigned by a validating officer or authorized signatory.<br>
<br>
<br>
<br>
IN WITNESS WHEREOF, Stewart Title Guaranty Company has caused its corporate name and seal to be affixed by its duly authorized officers on the date shown in Schedule A. <br>
<br>

<cfif read_FT_company.ID eq 2632 or read_FT_company.master_co_id eq 2632>
					<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/stewart_sigs_alan.jpg"><br>
<cfelseif read_FT_company.ID eq 99999>
					<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/community_sigs.jpg"><br>

				   <CFELSEIF #read_Title.pstate# eq "CA" or #read_Title.pstate# eq "NV">
                     <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/stewart_sigs_onfile.jpg"><br>
                    <CFELSE>
                        <img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/stewart_sigs.jpg"><br>
                    </CFIF>
<br>
<br><br>
<br>
<br>

<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left">004-UN ALTA Commitment (6/17/06)</td>
    <td align="right">File No: <cfoutput>#read_Title.Title_ID#</cfoutput></td>
  </tr>
</table>



          </td>
    </tr>
</table>
<p>


			  </td>
        </tr>



      </table>
<!--- ====================================================================== --->
<!--- =================[ END OF SCHEDULE A         ]======================== --->
<!--- ====================================================================== --->
</IE:DEVICERECT>

<!--- <cfif cgi.REMOTE_ADDR eq '68.48.156.15'>
<cfoutput>#Len(read_title_data.notes)#</cfoutput><br>
<cfabort>
</cfif>
 --->


<!--- <p style="page-break-after:always;">&nbsp;</p> --->
<IE:DEVICERECT ID="<CFOUTPUT><CFIF #read_Title.pstate# eq "CA" OR #read_Title.pstate# eq "NV">page2<CFELSE>Page1</CFIF></cfoutput>" CLASS="masterstyle" MEDIA="print">

<!----1st page starts ----->
<!----------body table starts---------->
<!--- <table width=98% cellpadding=0 cellspacing=0 border=2 align="center" bordercolor="000000" bordercolordark="000000" bordercolorlight="000000">
<tr><td valign="top" align="center">
====================================================================== --->
<!--- =================[ BEGIN SCHEDULE A         ]======================== --->
<!--- ====================================================================== --->
<table width="100%" cellpadding=0 cellspacing=0 border=0 >
        <tr>
		  <td colspan="2" align="center" valign="middle" bgcolor="000000" height="30"><B><font color="FFFFFF" size="4">Schedule
            A</font></B></td>
	</tr>
</table>
<table width="93%" cellpadding=0 cellspacing=0 border=0 >
	<tr>
		<td width="33%"><!--- ===/ This is the Title_ID from the Title Table \=== --->
						<cfoutput><NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR></td>
		<td align="Center">
            <NOBR>Stewart Title Guaranty Company</NOBR>
         </td>
    <td align="right"><NOBR>Commitment Number: D-#read_Title.Title_ID# </NOBR></td></cfoutput>
	</tr>
</table>
<table width="93%" cellpadding=0 cellspacing=0 border=0 >
    <tr>
          <td>
            <BR><BR>
          </td>
    </tr>
    <tr>
          <td width="100%" align=left valign=top><font color="gray">
            <CFOUTPUT>Property known as:</font>  <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><U>#read_title.paddress#, #read_title.pcity#, #read_title.pstate# #read_title.pzip#</U><BR><BR></font></cfoutput>
          </td>

    </tr>
</table>
<p>
      <table width="93%" cellpadding=1 cellspacing=1 border=0 valign="top" >
        <!-------- ( 1.) Starts --------------->
        <tr>
          <td width="2%">&nbsp;</td>
          <td width="10%" align="left" valign="top">( 1.) </td>
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
            <td width="10%" align="left" valign="top">( 2.) </td>
            <td width="68%" valign="top">Policy or Policies to be issued:</td>
            <td width="25%" align="center">Amount of Insurance</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td valign="top"> <table width="100%" valign="top" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td align="right">(a)</td>
                  <td width="20">&nbsp;</td>
                  <td>ALTA Owner's Form B</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td width="20">&nbsp;</td>
                  <td>Proposed Insured:</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td width="20">&nbsp;</td>
                  <td><B><cfif read_title.comp_id eq 3943 or read_title.comp_id eq 4043 or read_title.comp_id eq 4042 or read_title.comp_id eq 4702  or read_title.comp_id eq 4752  or read_title.comp_id eq 3722 or read_title.title_id eq 44907>#read_title.full_vesting#<cfelse><cfif #read_title.purchase# neq ""><cfif Len(read_title.company1)>#read_title.company1#<cfelse>#Buyer_1#<cfif Len(Trim(Buyer_2))>, &nbsp;&nbsp;#Buyer_2#</cfif><cfif Len(read_title.blastname3)>, &nbsp;&nbsp;#read_title.bfirstname3# #read_title.blastname3#</cfif><cfif read_title.manner_of_title neq ''>, #read_title.manner_of_title#</cfif></cfif></cfif></cfif></td>
                </tr>
              </table></td>
            <td align="center" valign="top">$<B> <cfif #trim(read_title.purchase)# neq "">#NumberFormat(read_title.Purchase,
              "999,999,999.00")#</cfif></B></td>
          </tr>
          <tr>
            <td colspan="4">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td valign="top"> <table width="100%" valign="top" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td align="right">(b)</td>
                  <td width="20">&nbsp;</td>
				  <cfif read_title.searchtype contains 'Second Mortgage' and read_title.jlp_policy eq 1>                  <td>ALTA Junior Loan Policy - Short Form Res. Limited Cov. 1996</td>
				  <cfelse>
				  <td>ALTA Mortgagee's</td>
				  </cfif>

                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td width="20">&nbsp;</td>
                  <td>Proposed Insured:</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td width="20">&nbsp;</td>
                  <td><B><cfif read_title.comp_id eq 3943 or read_title.comp_id eq 4043 or read_title.comp_id eq 4042>#ReplaceNoCase(read_title.insured, "RHF/", "", "ALL")#<cfelse>#read_title.insured#</cfif>, its successors and/or assigns <cfif read_FT_company.company does not contain 'Wells Fargo'>as their interest may appear</cfif></B><br></td>
                </tr>
              </table></td>
            <td align="center" valign="top">$ <B>#NumberFormat(read_title.loanamt_float, "999,999,999.00")#</B></td>
          </tr>
        </CFOUTPUT>
        <!-------- ( 2.) ends --------------->
        <tr>
          <td colspan="4">&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="left" valign="top">( 3.) </td>
          <td colspan="2" valign="top">The estate or interest in the land described
            or referred to in the committment and covered herein is:</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="right" valign="top">&nbsp;</td>
          <td colspan="2" valign="top"><CFQUERY datasource="#request.dsn#" NAME="read_title_data">
            select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs
            is not null </cfquery> <cfoutput>
			#read_title_data.data38# </td>
        </tr>
        <tr>
          <td colspan="4">&nbsp;</td>
        </tr>
        <CFQUERY datasource="#request.dsn#" NAME="read_title_data">
        select * from title_ins_view WHERE title_id = #url.rec_ID# and selectedOrgs
        is not null
        </cfquery>
        <tr>
          <td>&nbsp;</td>
          <td align="left" valign="top">( 4.) </td>
          <td colspan="2" valign="top">Title to the estate or interest in the land is at effective date hereof vested
            in:</td>
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
          <td align="left" valign="top">( 5.) </td>
          <td colspan="2" valign="top">The land referred to in this Committment
            is described as follows:</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="right" valign="top">&nbsp;</td>
          <td colspan="2" align = "center"  valign="top"><b> See Exhibit "A"<br>Attached Hereto </cfoutput>
        <tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>
		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>

		<tr>
          <td colspan="4">&nbsp;</td>
        </tr>


        <tr>
          <td colspan="4" valign="top"> <table cellpadding="0" cellspacing="0" border="0" width="100%">
              <tr>
                <td width="60%" valign="bottom">
				<table cellpadding=0 cellspacing=0 border=0><tr><td width="10%">&nbsp;</td>
                <td align="center">
                    <!---Nevada and California should have Sig On File--->
					&nbsp;
                </td>
				</tr><tr>
                  <td width="10%">&nbsp;</td><td align="center"> <strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">&nbsp;</font></strong>
				  </td></tr></table>
				  </td>
                <td width = "90%" align = "center">&nbsp;</td>
              </tr>
              <tr>
                <td valign="bottom" colspan="2" align="center">&nbsp;</td>
              </tr>
              <tr>
                <td valign="bottom" colspan="2" align="center">&nbsp;</td>
              </tr>
              <tr>
                <td valign="bottom" colspan="2" align="center">&nbsp;</td>
              </tr>
              <tr>
                <td valign="middle" width="60%" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="black" size="1">This policy is invalid unless the Cover Sheet and Schedule B are attached.</font></td>
                <td align="center" valign="top">&nbsp;</td>
              </tr>
            </table>

			  </td>
        </tr>



      </table>
<!--- ====================================================================== --->
<!--- =================[ END OF SCHEDULE A         ]======================== --->
<!--- ====================================================================== --->
</IE:DEVICERECT>





<cfif len(read_Title_Data.notes) GT 3000>
<cfset extra_text = Mid(read_Title_Data.notes, 3000, Len(read_Title_Data.notes))>
<cfset stop_number = Find(" ", read_Title_Data.notes, 3000)>
<cfset notes_1 = Mid(read_Title_Data.notes, 1, stop_number)>
<cfset notes_2 = Mid(read_Title_Data.notes, stop_number + 1, Len(read_Title_Data.notes))>
</cfif>

<cfif len(read_Title_Data.notes) LTE 3000>
<!--- <p style="page-break-after:always;">&nbsp;</p> --->
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
            <td align="Center"><NOBR>Stewart Title Guaranty Company</NOBR></td>
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
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
     <!---    <tr align="right" valign="top">
          <td COLSPAN = 2><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/stewart_logo.jpg"></td>
        </tr> --->
      </table>
	   </IE:DEVICERECT>


<cfelse>
<!--- <p style="page-break-after:always;">&nbsp;</p> --->
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
            <td align="Center"><NOBR>Stewart Title Guaranty Company</NOBR></td>
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
          <td COLSPAN = 2><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/stewart_logo.jpg"></td>
        </tr> --->
      </table>
	   </IE:DEVICERECT>



<!--- <p style="page-break-after:always;">&nbsp;</p> --->
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
            <td align="Center"><NOBR>Stewart Title Guaranty Company</NOBR></td>
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
          <td COLSPAN = 2><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/stewart_logo.jpg"></td>
        </tr> --->
      </table>
	   </IE:DEVICERECT>

	</cfif>




<!--- <p style="page-break-after:always;">&nbsp;</p> --->
<IE:DEVICERECT ID="<CFOUTPUT><CFIF #read_Title.pstate# eq "CA" OR #read_Title.pstate# eq "NV">page5<CFELSE>Page4</CFIF></cfoutput>" CLASS="masterstyle" MEDIA="print">
<!--- ====================================================================== --->
<!--- =================[ BEGIN SCHEDULE C         ]======================== --->
<!--- ====================================================================== --->
<table width="100%" cellpadding=0 cellspacing=0 border=0 >
        <tr>
		  <td colspan="2" align="center" valign="middle" bgcolor="000000" height="30"><B><font color="FFFFFF" size="4">Schedule
            <cfif read_title.pstate eq 'MI'>B-I<cfelse>B-I</cfif></font></B></td>
	</tr>
	</table>
<table width="93%" cellpadding=0 cellspacing=0 border=0 >
	<tr>
		<td width="33%"><!--- ===/ This is the Title_ID from the Title Table \=== --->
						<cfoutput><NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR></td>
		<td align="Center"><NOBR>Stewart Title Guaranty Company</NOBR></td>
    <td align="right"><NOBR>Commitment Number: D-#read_Title.Title_ID#</NOBR></td></cfoutput>
	</tr>
	<tr>
		  <td colspan="2" align="center">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2">The following requirements must be met and completed to the satisfaction of the Company before its <cfif read_title.comp_id eq 3343>Secondary Market Short Form Residential Loan Policy<cfelse>policy of title insurance</cfif> will be issued:</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
</table>
      <table width="93%" cellpadding=0 cellspacing=0 border=0 >
    <tr>
		  <td width="5%" valign="top">1.</td>
		<td>Pay us the premiums, fees and charges for the policy.</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
    <tr>
		  <td width="5%" valign="top">2.</td>
		<td>Payment to or for the account of the grantors or mortgagors of the full consideration for the estate or interest, mortgage or lien to be insured.</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
    <tr>
		  <td width="5%" valign="top">3.</td>
		<td>Instruments necessary to create the estate or interest to be insured must be approved, properly executed, delivered and duly filed for record:</td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
    <tr>
		  <td width="5%" valign="top">4.</td>
		<td>Pay all general and special taxes now due and payable including the following:<br><BR>
homeowners association fees (if applicable)<BR>
condominium fees (if applicable)<BR>
water usage bills (if applicable)<BR></td>
	</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
<cfif read_title.pstate eq 'MI'>
    <tr>
		  <td width="5%" valign="top">6.</td>
		<td>Taxes and assessments that become a lien against the property after date of closing. The Company assumes no liability for tax increases occasioned by retroactive revaluation, changes in the land usage or loss of any principal residence exemption status for the insured premises.</td>
	</tr>
<cfset auto_number = 6>
<cfelse>
<cfset auto_number = 5>
</cfif>
<CFOUTPUT><cfif (#read_tax.comments# NEQ "") or #read_tax.data29# EQ "" AND #read_tax.paiddate# NEQ "" AND #read_tax.submitted# NEQ "">
<cfset auto_number = #auto_number# + 1>
        <tr>
         <td width="5%" valign="top">#auto_number#</td>
<td><b>Real Estate Tax Information: </b>
		<cfif #read_tax.payto# neq "">Payable to - #read_tax.payto#, </cfif><cfif #read_tax.taxcoll# neq "">Tax Collector - #read_tax.taxcoll#, </cfif><cfif #read_tax.add1# neq "">Address 1 - #read_tax.add1#, </cfif><cfif #read_tax.add1# neq "">Address 2 - #read_tax.add2#, </cfif><cfif #read_tax.city# neq "">City - #read_tax.city#, </cfif><cfif #read_tax.state# neq "">State - #read_tax.state#, </cfif><cfif #read_tax.add1# neq "">Zip code - #read_tax.zip#, </cfif><cfif #read_tax.phone# neq "">Phone - #read_tax.phone#, </cfif><cfif #read_tax.web# neq "">Web address- #read_tax.web#, </cfif><cfif #read_tax.acctnum# neq "">APN/Acct Num - #read_tax.acctnum#, </cfif>
		<cfif #read_tax.taxfreq# neq "">Taxes are paid #read_tax.taxfreq#, </cfif><cfif #read_tax.paiddate# neq "">date paid #read_tax.paiddate#, </cfif><cfif #read_tax.paidto# neq "">which covers from #read_tax.paidfrom# to #read_tax.paidto#, </cfif><cfif #read_tax.lastamt# neq "">in the amount of #read_tax.lastamt#, </cfif><cfif #read_tax.duedate# neq "">Next due date #read_tax.duedate#, </cfif><cfif #read_tax.dueto# neq "">which covers from #read_tax.duefrom# to #read_tax.dueto#, </cfif><cfif #read_tax.dueamt# neq "">in the amount of #read_tax.dueamt#</cfif><br><br>
		<cfif #read_tax.delamt# neq ""><b>Delinquent Information -- </b>Delinquent amount #read_tax.delamt#, </cfif><cfif #read_tax.thrudate# neq "">good through date #read_tax.thrudate#. </cfif> <cfif #trim(read_tax.comments)# neq "" and #read_tax.comments# neq 'NULL'> Comments: #read_tax.comments# </cfif>


		<cfelseif #read_tax.data29# NEQ "" AND #read_tax.paiddate# EQ "">
		<cfif #read_tax.data29# NEQ ""> Real Estate Taxes for #Read_tax.data29# are #Read_tax.data31#. They are payable #Read_tax.data37#. The amount paid was $#Read_tax.data28#. #Read_tax.data34#. The due dates are #Read_tax.data30#. The parcel ID number is #Read_tax.data19#.</b></cfif>
			</td>
        </tr>
		<cfelse>
			</cfif></CFOUTPUT>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	<cfset auto_number = #auto_number# + 1>
	<tr>
		  <td width="5%" valign="top"><cfoutput>#auto_number#</cfoutput></td>
		<td>Record instrument conveying or encumbering the estate or interest to be insured, briefly described:</td>
	</tr>
<cfif read_title.pstate eq 'DC'>
	<cfset auto_number = #auto_number# + 1>
	<tr>
		  <td width="5%" valign="top"><cfoutput>#auto_number#</cfoutput></td>
		<td>This Company must be furnished with satisfactory proof that caption property is owner occupied, occupied by the proposed purchaser, or vacant.  In the event of sale or lease of caption property, and if tenant occupied, further proof is required that the requirements of Title IV and V of D.C. Law 3-86, "Rental Housing Conversion and Sale Act of 1980" and as amended, have been complied with.</td>
	</tr>
</cfif>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>


<CFQUERY datasource="#request.dsn#" NAME="read_mortgage">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 1
		</cfquery>
<cfif read_mortgage.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_mortgage">
		<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
		    <td>#auto_number#.</td>
       <td>
<cfif #read_mortgage.data1# NEQ ""> <cfif read_mortgage.lienintro neq "" and read_mortgage.lienintro neq 'NULL' or Len(read_mortgage.lienintro) eq 0>#read_mortgage.lienintro#<cfelse>Satisfaction and/or release of</cfif> Mortgage from #read_mortgage.data2# <cfif #read_mortgage.data3# neq ""> and #read_mortgage.data3#</cfif> securing #read_mortgage.data1# in the original principal amount of #read_mortgage.data4#, as dated #DateFormat(read_mortgage.data8, "mm")#/#DateFormat(read_mortgage.data8, "dd")#/#DateFormat(read_mortgage.data8, "yyyy")# and recorded on #DateFormat(read_mortgage.data9, "mm")#/#DateFormat(read_mortgage.data9, "dd")#/#DateFormat(read_mortgage.data9, "yyyy")# among the Land Records of #read_title.pcounty# County, <cfif #read_mortgage.data5# eq ""><cfif #read_mortgage.data6# neq "">in Book #read_mortgage.data6# at Page #read_mortgage.data7# </cfif><cfelse> in Document Number #read_mortgage.data5# </cfif><cfif #read_mortgage.data13# neq ""> Assigned to #read_mortgage.data13# recorded on #DateFormat(read_mortgage.data17, "mm")#/#DateFormat(read_mortgage.data17, "dd")#/#DateFormat(read_mortgage.data17, "yyyy")#, in Book <cfif #read_mortgage.data14# eq "">#read_mortgage.data15#, at Page #read_mortgage.data16# <cfelse> in Document #read_mortgage.data14#</cfif> </cfif><cfif #read_mortgage.data18# neq "">Assigned to #read_mortgage.data18# recorded on #DateFormat(read_mortgage.data22, "mm")#/#DateFormat(read_mortgage.data22, "dd")#/#DateFormat(read_mortgage.data22, "yyyy")#, <cfif #read_mortgage.data19# eq "">in Book #read_mortgage.data20#, at Page #read_mortgage.data21# <cfelse> in Document #read_mortgage.data19#</cfif> </cfif><cfif #read_mortgage.data23# neq "">Assigned to #read_mortgage.data23# recorded on #DateFormat(read_mortgage.data27, "mm")#/#DateFormat(read_mortgage.data27, "dd")#/#DateFormat(read_mortgage.data27, "yyyy")#, <cfif #read_mortgage.data24# eq ""> in Book #read_mortgage.data25#, at Page #read_mortgage.data26# <cfelse> in Document #read_mortgage.data24#</cfif> </cfif><cfif #read_mortgage.data28# neq "">Assigned to #read_mortgage.data28# recorded on #DateFormat(read_mortgage.data32, "mm")#/#DateFormat(read_mortgage.data32, "dd")#/#DateFormat(read_mortgage.data32, "yyyy")#, <cfif #read_mortgage.data29# EQ ""> in Book #read_mortgage.data30#, at Page #read_mortgage.data31# <cfelse> in Document #read_mortgage.data31#</cfif> </cfif><cfif #read_mortgage.data11# neq "">#read_mortgage.data11#</cfif> <cfif #read_mortgage.data12# neq "">#read_mortgage.data12#</cfif></cfif>
<br>
<br>

			</td>
		</tr>
</cfoutput>


<CFQUERY datasource="#request.dsn#" NAME="read_mortgage2">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 2
	</cfquery>
<cfif read_mortgage2.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
	<cfoutput query = "read_mortgage2">
	<cfset auto_number = #auto_number# + 1>
		  <tr align="left" valign="top">
            <td>#auto_number#.</td>
			<td>
            <cfif #read_mortgage2.data1# NEQ ""> <cfif read_mortgage2.lienintro neq "" and read_mortgage2.lienintro neq 'NULL'>#read_mortgage2.lienintro#<cfelse>Satisfaction and/or release of</cfif> Mortgage from #read_mortgage2.data2# <cfif #read_mortgage2.data3# neq ""> and #read_mortgage2.data3#</cfif> securing #read_mortgage2.data1# in the original principal amount of #read_mortgage2.data4#, as dated #DateFormat(read_mortgage2.data8, "mm")#/#DateFormat(read_mortgage2.data8, "dd")#/#DateFormat(read_mortgage2.data8, "yyyy")# and recorded on #DateFormat(read_mortgage2.data9, "mm")#/#DateFormat(read_mortgage2.data9, "dd")#/#DateFormat(read_mortgage2.data9, "yyyy")# among the Land Records of #read_title.pcounty# County, <cfif #read_mortgage2.data5# eq ""><cfif #read_mortgage2.data6# neq "">in Book #read_mortgage2.data6# at Page #read_mortgage2.data7# </cfif><cfelse> in Document Number #read_mortgage2.data5# </cfif><cfif #read_mortgage2.data13# neq ""> Assigned to #read_mortgage2.data13# recorded on #DateFormat(read_mortgage2.data17, "mm")#/#DateFormat(read_mortgage2.data17, "dd")#/#DateFormat(read_mortgage2.data17, "yyyy")#, in Book <cfif #read_mortgage2.data14# eq "">#read_mortgage2.data15#, at Page #read_mortgage2.data16# <cfelse> in Document #read_mortgage2.data14#</cfif> </cfif><cfif #read_mortgage2.data18# neq "">Assigned to #read_mortgage2.data18# recorded on #DateFormat(read_mortgage2.data22, "mm")#/#DateFormat(read_mortgage2.data22, "dd")#/#DateFormat(read_mortgage2.data22, "yyyy")#, <cfif #read_mortgage2.data19# eq "">in Book #read_mortgage2.data20#, at Page #read_mortgage2.data21# <cfelse> in Document #read_mortgage2.data19#</cfif> </cfif><cfif #read_mortgage2.data23# neq "">Assigned to #read_mortgage2.data23# recorded on #DateFormat(read_mortgage2.data27, "mm")#/#DateFormat(read_mortgage2.data27, "dd")#/#DateFormat(read_mortgage2.data27, "yyyy")#, <cfif #read_mortgage2.data24# eq ""> in Book #read_mortgage2.data25#, at Page #read_mortgage2.data26# <cfelse> in Document #read_mortgage2.data24#</cfif> </cfif><cfif #read_mortgage2.data28# neq "">Assigned to #read_mortgage2.data28# recorded on #DateFormat(read_mortgage2.data32, "mm")#/#DateFormat(read_mortgage2.data32, "dd")#/#DateFormat(read_mortgage2.data32, "yyyy")#, <cfif #read_mortgage2.data29# EQ ""> in Book #read_mortgage2.data30#, at Page #read_mortgage2.data31# <cfelse> in Document #read_mortgage2.data31#</cfif> </cfif><cfif #read_mortgage2.data11# neq "">#read_mortgage2.data11#</cfif> <cfif #read_mortgage2.data12# neq "">#read_mortgage2.data12#</cfif></cfif><br><br>

		</td>
	</tr>
</cfoutput>


<cfif #read_mortgage2.recordcount# EQ 0>
<CFQUERY datasource="#request.dsn#" NAME="read_lien">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 1
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
			  #read_lien.data8#</cfif><br>
<br>

		</td>
	</tr>
</cfoutput>

</cfif>



<CFQUERY datasource="#request.dsn#" NAME="read_mortgage3">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 3
			</cfquery>
<cfif read_mortgage3.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>

			<cfoutput query = "read_mortgage3">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
           <cfif #read_mortgage3.data1# NEQ ""> <cfif read_mortgage3.lienintro neq "" and read_mortgage3.lienintro neq 'NULL' or Len(read_mortgage3.lienintro) eq 0>#read_mortgage3.lienintro#<cfelse>Satisfaction and/or release of</cfif> Mortgage from #read_mortgage3.data2# <cfif #read_mortgage3.data3# neq ""> and #read_mortgage3.data3#</cfif> securing #read_mortgage3.data1# in the original principal amount of #read_mortgage3.data4#, as dated #DateFormat(read_mortgage3.data8, "mm")#/#DateFormat(read_mortgage3.data8, "dd")#/#DateFormat(read_mortgage3.data8, "yyyy")# and recorded on #DateFormat(read_mortgage3.data9, "mm")#/#DateFormat(read_mortgage3.data9, "dd")#/#DateFormat(read_mortgage3.data9, "yyyy")# among the Land Records of #read_title.pcounty# County, <cfif #read_mortgage3.data5# eq ""><cfif #read_mortgage3.data6# neq "">in Book #read_mortgage3.data6# at Page #read_mortgage3.data7# </cfif><cfelse> in Document Number #read_mortgage3.data5# </cfif><cfif #read_mortgage3.data13# neq ""> Assigned to #read_mortgage3.data13# recorded on #DateFormat(read_mortgage3.data17, "mm")#/#DateFormat(read_mortgage3.data17, "dd")#/#DateFormat(read_mortgage3.data17, "yyyy")#, in Book <cfif #read_mortgage3.data14# eq "">#read_mortgage3.data15#, at Page #read_mortgage3.data16# <cfelse> in Document #read_mortgage3.data14#</cfif> </cfif><cfif #read_mortgage3.data18# neq "">Assigned to #read_mortgage3.data18# recorded on #DateFormat(read_mortgage3.data22, "mm")#/#DateFormat(read_mortgage3.data22, "dd")#/#DateFormat(read_mortgage3.data22, "yyyy")#, <cfif #read_mortgage3.data19# eq "">in Book #read_mortgage3.data20#, at Page #read_mortgage3.data21# <cfelse> in Document #read_mortgage3.data19#</cfif> </cfif><cfif #read_mortgage3.data23# neq "">Assigned to #read_mortgage3.data23# recorded on #DateFormat(read_mortgage3.data27, "mm")#/#DateFormat(read_mortgage3.data27, "dd")#/#DateFormat(read_mortgage3.data27, "yyyy")#, <cfif #read_mortgage3.data24# eq ""> in Book #read_mortgage3.data25#, at Page #read_mortgage3.data26# <cfelse> in Document #read_mortgage3.data24#</cfif> </cfif><cfif #read_mortgage3.data28# neq "">Assigned to #read_mortgage3.data28# recorded on #DateFormat(read_mortgage3.data32, "mm")#/#DateFormat(read_mortgage3.data32, "dd")#/#DateFormat(read_mortgage3.data32, "yyyy")#, <cfif #read_mortgage3.data29# EQ ""> in Book #read_mortgage3.data30#, at Page #read_mortgage3.data31# <cfelse> in Document #read_mortgage3.data31#</cfif> </cfif><cfif #read_mortgage3.data11# neq "">#read_mortgage3.data11#</cfif> <cfif #read_mortgage3.data12# neq "">#read_mortgage3.data12#</cfif></cfif><br>
<br>

			</td>
	</tr>
</cfoutput>

<CFQUERY datasource="#request.dsn#" NAME="read_mortgage4">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 4
			</cfquery>
<cfif read_mortgage4.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>

			<cfoutput query = "read_mortgage4">
	<cfset auto_number = #auto_number# + 1>

	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
           <cfif #read_mortgage4.data1# NEQ ""> <cfif read_mortgage4.lienintro neq "" and read_mortgage4.lienintro neq 'NULL' or Len(read_mortgage4.lienintro) eq 0>#read_mortgage4.lienintro#<cfelse>Satisfaction and/or release of</cfif> Mortgage from #read_mortgage4.data2# <cfif #read_mortgage4.data3# neq ""> and #read_mortgage4.data3#</cfif> securing #read_mortgage4.data1# in the original principal amount of #read_mortgage4.data4#, as dated #DateFormat(read_mortgage4.data8, "mm")#/#DateFormat(read_mortgage4.data8, "dd")#/#DateFormat(read_mortgage4.data8, "yyyy")# and recorded on #DateFormat(read_mortgage4.data9, "mm")#/#DateFormat(read_mortgage4.data9, "dd")#/#DateFormat(read_mortgage4.data9, "yyyy")# among the Land Records of #read_title.pcounty# County, <cfif #read_mortgage4.data5# eq ""><cfif #read_mortgage4.data6# neq "">in Book #read_mortgage4.data6# at Page #read_mortgage4.data7# </cfif><cfelse> in Document Number #read_mortgage4.data5# </cfif><cfif #read_mortgage4.data13# neq ""> Assigned to #read_mortgage4.data13# recorded on #DateFormat(read_mortgage4.data17, "mm")#/#DateFormat(read_mortgage4.data17, "dd")#/#DateFormat(read_mortgage4.data17, "yyyy")#, in Book <cfif #read_mortgage4.data14# eq "">#read_mortgage4.data15#, at Page #read_mortgage4.data16# <cfelse> in Document #read_mortgage4.data14#</cfif> </cfif><cfif #read_mortgage4.data18# neq "">Assigned to #read_mortgage4.data18# recorded on #DateFormat(read_mortgage4.data22, "mm")#/#DateFormat(read_mortgage4.data22, "dd")#/#DateFormat(read_mortgage4.data22, "yyyy")#, <cfif #read_mortgage4.data19# eq "">in Book #read_mortgage4.data20#, at Page #read_mortgage4.data21# <cfelse> in Document #read_mortgage4.data19#</cfif> </cfif><cfif #read_mortgage4.data23# neq "">Assigned to #read_mortgage4.data23# recorded on #DateFormat(read_mortgage4.data27, "mm")#/#DateFormat(read_mortgage4.data27, "dd")#/#DateFormat(read_mortgage4.data27, "yyyy")#, <cfif #read_mortgage4.data24# eq ""> in Book #read_mortgage4.data25#, at Page #read_mortgage4.data26# <cfelse> in Document #read_mortgage4.data24#</cfif> </cfif><cfif #read_mortgage4.data28# neq "">Assigned to #read_mortgage4.data28# recorded on #DateFormat(read_mortgage4.data32, "mm")#/#DateFormat(read_mortgag4.data32, "dd")#/#DateFormat(read_mortgage4.data32, "yyyy")#, <cfif #read_mortgage4.data29# EQ ""> in Book #read_mortgage4.data30#, at Page #read_mortgage4.data31# <cfelse> in Document #read_mortgage4.data31#</cfif> </cfif><cfif #read_mortgage4.data11# neq "">#read_mortgage4.data11#</cfif> <cfif #read_mortgage4.data12# neq "">#read_mortgage4.data12#</cfif></cfif><br>
<br>

	</td>
	</tr>
</cfoutput>



<CFQUERY datasource="#request.dsn#" NAME="read_mortgage5">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 5
			</cfquery>
<cfif read_mortgage5.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>

			<cfoutput query = "read_mortgage5">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
             <cfif #read_mortgage5.data1# NEQ ""> <cfif read_mortgage5.lienintro neq "" and read_mortgage5.lienintro neq 'NULL' or Len(read_mortgage5.lienintro) eq 0>#read_mortgage5.lienintro#<cfelse>Satisfaction and/or release of</cfif> Mortgage from #read_mortgage5.data2# <cfif #read_mortgage5.data3# neq ""> and #read_mortgage5.data3#</cfif> securing #read_mortgage5.data1# in the original principal amount of #read_mortgage5.data4#, as dated #DateFormat(read_mortgage5.data8, "mm")#/#DateFormat(read_mortgage5.data8, "dd")#/#DateFormat(read_mortgage5.data8, "yyyy")# and recorded on #DateFormat(read_mortgage5.data9, "mm")#/#DateFormat(read_mortgage5.data9, "dd")#/#DateFormat(read_mortgage5.data9, "yyyy")# among the Land Records of #read_title.pcounty# County, <cfif #read_mortgage5.data5# eq ""><cfif #read_mortgage5.data6# neq "">in Book #read_mortgage5.data6# at Page #read_mortgage5.data7# </cfif><cfelse> in Document Number #read_mortgage5.data5# </cfif><cfif #read_mortgage5.data13# neq ""> Assigned to #read_mortgage5.data13# recorded on #DateFormat(read_mortgage5.data17, "mm")#/#DateFormat(read_mortgage5.data17, "dd")#/#DateFormat(read_mortgage5.data17, "yyyy")#, in Book <cfif #read_mortgage5.data14# eq "">#read_mortgage5.data15#, at Page #read_mortgage5.data16# <cfelse> in Document #read_mortgage5.data14#</cfif> </cfif><cfif #read_mortgage5.data18# neq "">Assigned to #read_mortgage5.data18# recorded on #DateFormat(read_mortgage5.data22, "mm")#/#DateFormat(read_mortgage5.data22, "dd")#/#DateFormat(read_mortgage5.data22, "yyyy")#, <cfif #read_mortgage5.data19# eq "">in Book #read_mortgage5.data20#, at Page #read_mortgage5.data21# <cfelse> in Document #read_mortgage5.data19#</cfif> </cfif><cfif #read_mortgage5.data23# neq "">Assigned to #read_mortgage5.data23# recorded on #DateFormat(read_mortgage5.data27, "mm")#/#DateFormat(read_mortgage5.data27, "dd")#/#DateFormat(read_mortgage5.data27, "yyyy")#, <cfif #read_mortgage5.data24# eq ""> in Book #read_mortgage5.data25#, at Page #read_mortgage5.data26# <cfelse> in Document #read_mortgage5.data24#</cfif> </cfif><cfif #read_mortgage5.data28# neq "">Assigned to #read_mortgage5.data28# recorded on #DateFormat(read_mortgage5.data32, "mm")#/#DateFormat(read_mortgage5.data32, "dd")#/#DateFormat(read_mortgage5.data32, "yyyy")#, <cfif #read_mortgage5.data29# EQ ""> in Book #read_mortgage5.data30#, at Page #read_mortgage5.data31# <cfelse> in Document #read_mortgage5.data31#</cfif> </cfif><cfif #read_mortgage5.data11# neq "">#read_mortgage5.data11#</cfif> <cfif #read_mortgage5.data12# neq "">#read_mortgage5.data12#</cfif></cfif><br>
<br>

	</td>
	</tr>
</cfoutput>

<CFQUERY datasource="#request.dsn#" NAME="read_mortgage6">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 6
			</cfquery>
<cfif read_mortgage6.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>

			<cfoutput query = "read_mortgage6">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
          <cfif #read_mortgage6.data1# NEQ ""> <cfif read_mortgage6.lienintro neq "" and read_mortgage6.lienintro neq 'NULL' or Len(read_mortgage6.lienintro) eq 0>#read_mortgage6.lienintro#<cfelse>Satisfaction and/or release of</cfif> Mortgage from #read_mortgage6.data2# <cfif #read_mortgage6.data3# neq ""> and #read_mortgage6.data3#</cfif> securing #read_mortgage6.data1# in the original principal amount of #read_mortgage6.data4#, as dated #DateFormat(read_mortgage6.data8, "mm")#/#DateFormat(read_mortgage6.data8, "dd")#/#DateFormat(read_mortgage6.data8, "yyyy")# and recorded on #DateFormat(read_mortgage6.data9, "mm")#/#DateFormat(read_mortgage6.data9, "dd")#/#DateFormat(read_mortgage6.data9, "yyyy")# among the Land Records of #read_title.pcounty# County, <cfif #read_mortgage6.data5# eq ""><cfif #read_mortgage6.data6# neq "">in Book #read_mortgage6.data6# at Page #read_mortgage6.data7# </cfif><cfelse> in Document Number #read_mortgage6.data5# </cfif><cfif #read_mortgage6.data13# neq ""> Assigned to #read_mortgage6.data13# recorded on #DateFormat(read_mortgage6.data17, "mm")#/#DateFormat(read_mortgage6.data17, "dd")#/#DateFormat(read_mortgage6.data17, "yyyy")#, in Book <cfif #read_mortgage6.data14# eq "">#read_mortgage6.data15#, at Page #read_mortgage6.data16# <cfelse> in Document #read_mortgage6.data14#</cfif> </cfif><cfif #read_mortgage6.data18# neq "">Assigned to #read_mortgage6.data18# recorded on #DateFormat(read_mortgage6.data22, "mm")#/#DateFormat(read_mortgage6.data22, "dd")#/#DateFormat(read_mortgage6.data22, "yyyy")#, <cfif #read_mortgage6.data19# eq "">in Book #read_mortgage6.data20#, at Page #read_mortgage6.data21# <cfelse> in Document #read_mortgage6.data19#</cfif> </cfif><cfif #read_mortgage6.data23# neq "">Assigned to #read_mortgage6.data23# recorded on #DateFormat(read_mortgage6.data27, "mm")#/#DateFormat(read_mortgage6.data27, "dd")#/#DateFormat(read_mortgage6.data27, "yyyy")#, <cfif #read_mortgage6.data24# eq ""> in Book #read_mortgage6.data25#, at Page #read_mortgage6.data26# <cfelse> in Document #read_mortgage6.data24#</cfif> </cfif><cfif #read_mortgage6.data28# neq "">Assigned to #read_mortgage6.data28# recorded on #DateFormat(read_mortgage6.data32, "mm")#/#DateFormat(read_mortgage6.data32, "dd")#/#DateFormat(read_mortgage6.data32, "yyyy")#, <cfif #read_mortgage6.data29# EQ ""> in Book #read_mortgage6.data30#, at Page #read_mortgage6.data31# <cfelse> in Document #read_mortgage6.data31#</cfif> </cfif><cfif #read_mortgage6.data11# neq "">#read_mortgage6.data11#</cfif> <cfif #read_mortgage6.data12# neq "">#read_mortgage6.data12#</cfif></cfif><br>
<br>

	</td>
	</tr>
</cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_mortgage7">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 7
			</cfquery>
<cfif read_mortgage7.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>

			<cfoutput query = "read_mortgage7">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
           <cfif #read_mortgage7.data1# NEQ ""> <cfif read_mortgage7.lienintro neq "" and read_mortgage7.lienintro neq 'NULL' or Len(read_mortgage7.lienintro) eq 0>#read_mortgage7.lienintro#<cfelse>Satisfaction and/or release of</cfif> Mortgage from #read_mortgage7.data2# <cfif #read_mortgage7.data3# neq ""> and #read_mortgage7.data3#</cfif> securing #read_mortgage7.data1# in the original principal amount of #read_mortgage7.data4#, as dated #DateFormat(read_mortgage7.data8, "mm")#/#DateFormat(read_mortgage7.data8, "dd")#/#DateFormat(read_mortgage7.data8, "yyyy")# and recorded on #DateFormat(read_mortgage7.data9, "mm")#/#DateFormat(read_mortgage7.data9, "dd")#/#DateFormat(read_mortgage7.data9, "yyyy")# among the Land Records of #read_title.pcounty# County, <cfif #read_mortgage7.data5# eq ""><cfif #read_mortgage7.data6# neq "">in Book #read_mortgage7.data6# at Page #read_mortgage7.data7# </cfif><cfelse> in Document Number #read_mortgage7.data5# </cfif><cfif #read_mortgage7.data13# neq ""> Assigned to #read_mortgage7.data13# recorded on #DateFormat(read_mortgage7.data17, "mm")#/#DateFormat(read_mortgage7.data17, "dd")#/#DateFormat(read_mortgage7.data17, "yyyy")#, in Book <cfif #read_mortgage7.data14# eq "">#read_mortgage7.data15#, at Page #read_mortgage7.data16# <cfelse> in Document #read_mortgage7.data14#</cfif> </cfif><cfif #read_mortgage7.data18# neq "">Assigned to #read_mortgage7.data18# recorded on #DateFormat(read_mortgage7.data22, "mm")#/#DateFormat(read_mortgage7.data22, "dd")#/#DateFormat(read_mortgage7.data22, "yyyy")#, <cfif #read_mortgage7.data19# eq "">in Book #read_mortgage7.data20#, at Page #read_mortgage7.data21# <cfelse> in Document #read_mortgage7.data19#</cfif> </cfif><cfif #read_mortgage7.data23# neq "">Assigned to #read_mortgage7.data23# recorded on #DateFormat(read_mortgage7.data27, "mm")#/#DateFormat(read_mortgage7.data27, "dd")#/#DateFormat(read_mortgage7.data27, "yyyy")#, <cfif #read_mortgage7.data24# eq ""> in Book #read_mortgage7.data25#, at Page #read_mortgage7.data26# <cfelse> in Document #read_mortgage7.data24#</cfif> </cfif><cfif #read_mortgage7.data28# neq "">Assigned to #read_mortgage7.data28# recorded on #DateFormat(read_mortgage7.data32, "mm")#/#DateFormat(read_mortgage7.data32, "dd")#/#DateFormat(read_mortgage7.data32, "yyyy")#, <cfif #read_mortgage7.data29# EQ ""> in Book #read_mortgage7.data30#, at Page #read_mortgage7.data31# <cfelse> in Document #read_mortgage7.data31#</cfif> </cfif><cfif #read_mortgage7.data11# neq "">#read_mortgage7.data11#</cfif> <cfif #read_mortgage7.data12# neq "">#read_mortgage7.data12#</cfif></cfif><br>
<br>

	</td>

	</tr>
</cfoutput>

<CFQUERY datasource="#request.dsn#" NAME="read_mortgage8">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 8
			</cfquery>
<cfif read_mortgage8.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>

			<cfoutput query = "read_mortgage8">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
             <cfif #read_mortgage8.data1# NEQ ""> <cfif read_mortgage8.lienintro neq "" and read_mortgage8.lienintro neq 'NULL' or Len(read_mortgage8.lienintro) eq 0>#read_mortgage8.lienintro#<cfelse>Satisfaction and/or release of</cfif> Mortgage from #read_mortgage8.data2# <cfif #read_mortgage8.data3# neq ""> and #read_mortgage8.data3#</cfif> securing #read_mortgage8.data1# in the original principal amount of #read_mortgage8.data4#, as dated #DateFormat(read_mortgage8.data8, "mm")#/#DateFormat(read_mortgage8.data8, "dd")#/#DateFormat(read_mortgage8.data8, "yyyy")# and recorded on #DateFormat(read_mortgage8.data9, "mm")#/#DateFormat(read_mortgage8.data9, "dd")#/#DateFormat(read_mortgage8.data9, "yyyy")# among the Land Records of #read_title.pcounty# County, <cfif #read_mortgage8.data5# eq ""><cfif #read_mortgage10.data6# neq "">in Book #read_mortgage8.data6# at Page #read_mortgage8.data7# </cfif><cfelse> in Document Number #read_mortgage8.data5# </cfif><cfif #read_mortgage8.data13# neq ""> Assigned to #read_mortgage8.data13# recorded on #DateFormat(read_mortgage8.data17, "mm")#/#DateFormat(read_mortgage8.data17, "dd")#/#DateFormat(read_mortgage8.data17, "yyyy")#, in Book <cfif #read_mortgage8.data14# eq "">#read_mortgage8.data15#, at Page #read_mortgage8.data16# <cfelse> in Document #read_mortgage8.data14#</cfif> </cfif><cfif #read_mortgage8.data18# neq "">Assigned to #read_mortgage8.data18# recorded on #DateFormat(read_mortgage8.data22, "mm")#/#DateFormat(read_mortgage8.data22, "dd")#/#DateFormat(read_mortgage8.data22, "yyyy")#, <cfif #read_mortgage8.data19# eq "">in Book #read_mortgage8.data20#, at Page #read_mortgage8.data21# <cfelse> in Document #read_mortgage8.data19#</cfif> </cfif><cfif #read_mortgage8.data23# neq "">Assigned to #read_mortgage8.data23# recorded on #DateFormat(read_mortgage8.data27, "mm")#/#DateFormat(read_mortgage8.data27, "dd")#/#DateFormat(read_mortgage8.data27, "yyyy")#, <cfif #read_mortgage8.data24# eq ""> in Book #read_mortgage8.data25#, at Page #read_mortgage8.data26# <cfelse> in Document #read_mortgage8.data24#</cfif> </cfif><cfif #read_mortgage8.data28# neq "">Assigned to #read_mortgage8.data28# recorded on #DateFormat(read_mortgage8.data32, "mm")#/#DateFormat(read_mortgage8.data32, "dd")#/#DateFormat(read_mortgage8.data32, "yyyy")#, <cfif #read_mortgage8.data29# EQ ""> in Book #read_mortgage8.data30#, at Page #read_mortgage8.data31# <cfelse> in Document #read_mortgage8.data31#</cfif> </cfif><cfif #read_mortgage8.data11# neq "">#read_mortgage8.data11#</cfif> <cfif #read_mortgage8.data12# neq "">#read_mortgage8.data12#</cfif></cfif><br>
<br>

	</td>
	</tr>
</cfoutput>

<CFQUERY datasource="#request.dsn#" NAME="read_mortgage9">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 9
			</cfquery>
<cfif read_mortgage9.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>

			<cfoutput query = "read_mortgage9">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
                       <cfif #read_mortgage9.data1# NEQ ""> <cfif read_mortgage9.lienintro neq "" and read_mortgage9.lienintro neq 'NULL' or Len(read_mortgage9.lienintro) eq 0>#read_mortgage9.lienintro#<cfelse>Satisfaction and/or release of</cfif> Mortgage from #read_mortgage9.data2# <cfif #read_mortgage9.data3# neq ""> and #read_mortgage9.data3#</cfif> securing #read_mortgage9.data1# in the original principal amount of #read_mortgage9.data4#, as dated #DateFormat(read_mortgage9.data8, "mm")#/#DateFormat(read_mortgage9.data8, "dd")#/#DateFormat(read_mortgage9.data8, "yyyy")# and recorded on #DateFormat(read_mortgage9.data9, "mm")#/#DateFormat(read_mortgage9.data9, "dd")#/#DateFormat(read_mortgage9.data9, "yyyy")# among the Land Records of #read_title.pcounty# County, <cfif #read_mortgage9.data5# eq ""><cfif #read_mortgage9.data6# neq "">in Book #read_mortgage9.data6# at Page #read_mortgage9.data7# </cfif><cfelse> in Document Number #read_mortgage9.data5# </cfif><cfif #read_mortgage9.data13# neq ""> Assigned to #read_mortgage9.data13# recorded on #DateFormat(read_mortgage9.data17, "mm")#/#DateFormat(read_mortgage9.data17, "dd")#/#DateFormat(read_mortgage9.data17, "yyyy")#, in Book <cfif #read_mortgage9.data14# eq "">#read_mortgage9.data15#, at Page #read_mortgage9.data16# <cfelse> in Document #read_mortgage9.data14#</cfif> </cfif><cfif #read_mortgage9.data18# neq "">Assigned to #read_mortgage9.data18# recorded on #DateFormat(read_mortgage9.data22, "mm")#/#DateFormat(read_mortgage9.data22, "dd")#/#DateFormat(read_mortgage9.data22, "yyyy")#, <cfif #read_mortgage9.data19# eq "">in Book #read_mortgage9.data20#, at Page #read_mortgage9.data21# <cfelse> in Document #read_mortgage9.data19#</cfif> </cfif><cfif #read_mortgage9.data23# neq "">Assigned to #read_mortgage9.data23# recorded on #DateFormat(read_mortgage9.data27, "mm")#/#DateFormat(read_mortgage9.data27, "dd")#/#DateFormat(read_mortgage9.data27, "yyyy")#, <cfif #read_mortgage9.data24# eq ""> in Book #read_mortgage9.data25#, at Page #read_mortgage9.data26# <cfelse> in Document #read_mortgage9.data24#</cfif> </cfif><cfif #read_mortgage9.data28# neq "">Assigned to #read_mortgage9.data28# recorded on #DateFormat(read_mortgage9.data32, "mm")#/#DateFormat(read_mortgage9.data32, "dd")#/#DateFormat(read_mortgage9.data32, "yyyy")#, <cfif #read_mortgage9.data29# EQ ""> in Book #read_mortgage9.data30#, at Page #read_mortgage9.data31# <cfelse> in Document #read_mortgage9.data31#</cfif> </cfif><cfif #read_mortgage9.data11# neq "">#read_mortgage9.data11#</cfif> <cfif #read_mortgage9.data12# neq "">#read_mortgage9.data12#</cfif></cfif><br>
<br>

	</td>
	</tr>
</cfoutput>

<CFQUERY datasource="#request.dsn#" NAME="read_mortgage10">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 10
			</cfquery>
<cfif read_mortgage10.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>

			<cfoutput query = "read_mortgage10">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
          <cfif #read_mortgage10.data1# NEQ ""> <cfif read_mortgage10.lienintro neq "" and read_mortgage10.lienintro neq 'NULL' or Len(read_mortgage10.lienintro) eq 0>#read_mortgage10.lienintro#<cfelse>Satisfaction and/or release of</cfif> Mortgage from #read_mortgage10.data2# <cfif #read_mortgage10.data3# neq ""> and #read_mortgage10.data3#</cfif> securing #read_mortgage10.data1# in the original principal amount of #read_mortgage10.data4#, as dated #DateFormat(read_mortgage10.data8, "mm")#/#DateFormat(read_mortgage10.data8, "dd")#/#DateFormat(read_mortgage10.data8, "yyyy")# and recorded on #DateFormat(read_mortgage10.data9, "mm")#/#DateFormat(read_mortgage10.data9, "dd")#/#DateFormat(read_mortgage10.data9, "yyyy")# among the Land Records of #read_title.pcounty# County, <cfif #read_mortgage10.data5# eq ""><cfif #read_mortgage10.data6# neq "">in Book #read_mortgage10.data6# at Page #read_mortgage10.data7# </cfif><cfelse> in Document Number #read_mortgage10.data5# </cfif><cfif #read_mortgage10.data13# neq ""> Assigned to #read_mortgage10.data13# recorded on #DateFormat(read_mortgage10.data17, "mm")#/#DateFormat(read_mortgage10.data17, "dd")#/#DateFormat(read_mortgage10.data17, "yyyy")#, in Book <cfif #read_mortgage10.data14# eq "">#read_mortgage10.data15#, at Page #read_mortgage10.data16# <cfelse> in Document #read_mortgage10.data14#</cfif> </cfif><cfif #read_mortgage10.data18# neq "">Assigned to #read_mortgage10.data18# recorded on #DateFormat(read_mortgage10.data22, "mm")#/#DateFormat(read_mortgage10.data22, "dd")#/#DateFormat(read_mortgage10.data22, "yyyy")#, <cfif #read_mortgage10.data19# eq "">in Book #read_mortgage10.data20#, at Page #read_mortgage10.data21# <cfelse> in Document #read_mortgage10.data19#</cfif> </cfif><cfif #read_mortgage10.data23# neq "">Assigned to #read_mortgage10.data23# recorded on #DateFormat(read_mortgage10.data27, "mm")#/#DateFormat(read_mortgage10.data27, "dd")#/#DateFormat(read_mortgage10.data27, "yyyy")#, <cfif #read_mortgage10.data24# eq ""> in Book #read_mortgage10.data25#, at Page #read_mortgage10.data26# <cfelse> in Document #read_mortgage10.data24#</cfif> </cfif><cfif #read_mortgage10.data28# neq "">Assigned to #read_mortgage10.data28# recorded on #DateFormat(read_mortgage10.data32, "mm")#/#DateFormat(read_mortgage10.data32, "dd")#/#DateFormat(read_mortgage10.data32, "yyyy")#, <cfif #read_mortgage10.data29# EQ ""> in Book #read_mortgage10.data30#, at Page #read_mortgage10.data31# <cfelse> in Document #read_mortgage10.data31#</cfif> </cfif><cfif #read_mortgage10.data11# neq "">#read_mortgage10.data11#</cfif> <cfif #read_mortgage10.data12# neq "">#read_mortgage10.data12#</cfif></cfif>
<br>
<br>
	</td>
	</tr>
</cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_mortgage11">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 11
			</cfquery>
<cfif read_mortgage11.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>

			<cfoutput query = "read_mortgage11">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
          <cfif #read_mortgage11.data1# NEQ ""> <cfif read_mortgage11.lienintro neq "" and read_mortgage11.lienintro neq 'NULL' or Len(read_mortgage11.lienintro) eq 0>#read_mortgage11.lienintro#<cfelse>Satisfaction and/or release of</cfif> Mortgage from #read_mortgage11.data2# <cfif #read_mortgage11.data3# neq ""> and #read_mortgage11.data3#</cfif> securing #read_mortgage11.data1# in the original principal amount of #read_mortgage11.data4#, as dated #DateFormat(read_mortgage11.data8, "mm")#/#DateFormat(read_mortgage11.data8, "dd")#/#DateFormat(read_mortgage11.data8, "yyyy")# and recorded on #DateFormat(read_mortgage11.data9, "mm")#/#DateFormat(read_mortgage11.data9, "dd")#/#DateFormat(read_mortgage11.data9, "yyyy")# among the Land Records of #read_title.pcounty# County, <cfif #read_mortgage11.data5# eq ""><cfif #read_mortgage11.data6# neq "">in Book #read_mortgage11.data6# at Page #read_mortgage11.data7# </cfif><cfelse> in Document Number #read_mortgage11.data5# </cfif><cfif #read_mortgage11.data13# neq ""> Assigned to #read_mortgage11.data13# recorded on #DateFormat(read_mortgage11.data17, "mm")#/#DateFormat(read_mortgage11.data17, "dd")#/#DateFormat(read_mortgage11.data17, "yyyy")#, in Book <cfif #read_mortgage11.data14# eq "">#read_mortgage11.data15#, at Page #read_mortgage11.data16# <cfelse> in Document #read_mortgage11.data14#</cfif> </cfif><cfif #read_mortgage11.data18# neq "">Assigned to #read_mortgage11.data18# recorded on #DateFormat(read_mortgage11.data22, "mm")#/#DateFormat(read_mortgage11.data22, "dd")#/#DateFormat(read_mortgage11.data22, "yyyy")#, <cfif #read_mortgage11.data19# eq "">in Book #read_mortgage11.data20#, at Page #read_mortgage11.data21# <cfelse> in Document #read_mortgage11.data19#</cfif> </cfif><cfif #read_mortgage11.data23# neq "">Assigned to #read_mortgage11.data23# recorded on #DateFormat(read_mortgage11.data27, "mm")#/#DateFormat(read_mortgage11.data27, "dd")#/#DateFormat(read_mortgage11.data27, "yyyy")#, <cfif #read_mortgage11.data24# eq ""> in Book #read_mortgage11.data25#, at Page #read_mortgage11.data26# <cfelse> in Document #read_mortgage11.data24#</cfif> </cfif><cfif #read_mortgage11.data28# neq "">Assigned to #read_mortgage11.data28# recorded on #DateFormat(read_mortgage11.data32, "mm")#/#DateFormat(read_mortgage11.data32, "dd")#/#DateFormat(read_mortgage11.data32, "yyyy")#, <cfif #read_mortgage11.data29# EQ ""> in Book #read_mortgage11.data30#, at Page #read_mortgage11.data31# <cfelse> in Document #read_mortgage11.data31#</cfif> </cfif><cfif #read_mortgage11.data11# neq "">#read_mortgage11.data11#</cfif> <cfif #read_mortgage11.data12# neq "">#read_mortgage11.data12#</cfif></cfif>
<br>
<br>
	</td>
	</tr>
</cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_mortgage12">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 12
			</cfquery>
<cfif read_mortgage12.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>

			<cfoutput query = "read_mortgage12">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
          <cfif #read_mortgage12.data1# NEQ ""> <cfif read_mortgage12.lienintro neq "" and read_mortgage12.lienintro neq 'NULL' or Len(read_mortgage12.lienintro) eq 0>#read_mortgage12.lienintro#<cfelse>Satisfaction and/or release of</cfif> Mortgage from #read_mortgage12.data2# <cfif #read_mortgage12.data3# neq ""> and #read_mortgage12.data3#</cfif> securing #read_mortgage12.data1# in the original principal amount of #read_mortgage12.data4#, as dated #DateFormat(read_mortgage12.data8, "mm")#/#DateFormat(read_mortgage12.data8, "dd")#/#DateFormat(read_mortgage12.data8, "yyyy")# and recorded on #DateFormat(read_mortgage12.data9, "mm")#/#DateFormat(read_mortgage12.data9, "dd")#/#DateFormat(read_mortgage12.data9, "yyyy")# among the Land Records of #read_title.pcounty# County, <cfif #read_mortgage12.data5# eq ""><cfif #read_mortgage12.data6# neq "">in Book #read_mortgage12.data6# at Page #read_mortgage12.data7# </cfif><cfelse> in Document Number #read_mortgage12.data5# </cfif><cfif #read_mortgage12.data13# neq ""> Assigned to #read_mortgage12.data13# recorded on #DateFormat(read_mortgage12.data17, "mm")#/#DateFormat(read_mortgage12.data17, "dd")#/#DateFormat(read_mortgage12.data17, "yyyy")#, in Book <cfif #read_mortgage12.data14# eq "">#read_mortgage12.data15#, at Page #read_mortgage12.data16# <cfelse> in Document #read_mortgage12.data14#</cfif> </cfif><cfif #read_mortgage12.data18# neq "">Assigned to #read_mortgage12.data18# recorded on #DateFormat(read_mortgage12.data22, "mm")#/#DateFormat(read_mortgage12.data22, "dd")#/#DateFormat(read_mortgage12.data22, "yyyy")#, <cfif #read_mortgage12.data19# eq "">in Book #read_mortgage12.data20#, at Page #read_mortgage12.data21# <cfelse> in Document #read_mortgage12.data19#</cfif> </cfif><cfif #read_mortgage12.data23# neq "">Assigned to #read_mortgage12.data23# recorded on #DateFormat(read_mortgage12.data27, "mm")#/#DateFormat(read_mortgage12.data27, "dd")#/#DateFormat(read_mortgage12.data27, "yyyy")#, <cfif #read_mortgage12.data24# eq ""> in Book #read_mortgage12.data25#, at Page #read_mortgage12.data26# <cfelse> in Document #read_mortgage12.data24#</cfif> </cfif><cfif #read_mortgage12.data28# neq "">Assigned to #read_mortgage12.data28# recorded on #DateFormat(read_mortgage12.data32, "mm")#/#DateFormat(read_mortgage12.data32, "dd")#/#DateFormat(read_mortgage12.data32, "yyyy")#, <cfif #read_mortgage12.data29# EQ ""> in Book #read_mortgage12.data30#, at Page #read_mortgage12.data31# <cfelse> in Document #read_mortgage12.data31#</cfif> </cfif><cfif #read_mortgage12.data11# neq "">#read_mortgage12.data11#</cfif> <cfif #read_mortgage12.data12# neq "">#read_mortgage12.data12#</cfif></cfif>
<br>
<br>
	</td>
	</tr>
</cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_mortgage13">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 13
			</cfquery>
<cfif read_mortgage13.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>

			<cfoutput query = "read_mortgage13">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
          <cfif #read_mortgage13.data1# NEQ ""> <cfif read_mortgage13.lienintro neq "" and read_mortgage13.lienintro neq 'NULL' or Len(read_mortgage13.lienintro) eq 0>#read_mortgage13.lienintro#<cfelse>Satisfaction and/or release of</cfif> Mortgage from #read_mortgage13.data2# <cfif #read_mortgage13.data3# neq ""> and #read_mortgage13.data3#</cfif> securing #read_mortgage13.data1# in the original principal amount of #read_mortgage13.data4#, as dated #DateFormat(read_mortgage13.data8, "mm")#/#DateFormat(read_mortgage13.data8, "dd")#/#DateFormat(read_mortgage13.data8, "yyyy")# and recorded on #DateFormat(read_mortgage13.data9, "mm")#/#DateFormat(read_mortgage13.data9, "dd")#/#DateFormat(read_mortgage13.data9, "yyyy")# among the Land Records of #read_title.pcounty# County, <cfif #read_mortgage13.data5# eq ""><cfif #read_mortgage13.data6# neq "">in Book #read_mortgage13.data6# at Page #read_mortgage13.data7# </cfif><cfelse> in Document Number #read_mortgage13.data5# </cfif><cfif #read_mortgage13.data13# neq ""> Assigned to #read_mortgage13.data13# recorded on #DateFormat(read_mortgage13.data17, "mm")#/#DateFormat(read_mortgage13.data17, "dd")#/#DateFormat(read_mortgage13.data17, "yyyy")#, in Book <cfif #read_mortgage13.data14# eq "">#read_mortgage13.data15#, at Page #read_mortgage13.data16# <cfelse> in Document #read_mortgage13.data14#</cfif> </cfif><cfif #read_mortgage13.data18# neq "">Assigned to #read_mortgage13.data18# recorded on #DateFormat(read_mortgage13.data22, "mm")#/#DateFormat(read_mortgage13.data22, "dd")#/#DateFormat(read_mortgage13.data22, "yyyy")#, <cfif #read_mortgage13.data19# eq "">in Book #read_mortgage13.data20#, at Page #read_mortgage13.data21# <cfelse> in Document #read_mortgage13.data19#</cfif> </cfif><cfif #read_mortgage13.data23# neq "">Assigned to #read_mortgage13.data23# recorded on #DateFormat(read_mortgage13.data27, "mm")#/#DateFormat(read_mortgage13.data27, "dd")#/#DateFormat(read_mortgage13.data27, "yyyy")#, <cfif #read_mortgage13.data24# eq ""> in Book #read_mortgage13.data25#, at Page #read_mortgage13.data26# <cfelse> in Document #read_mortgage13.data24#</cfif> </cfif><cfif #read_mortgage13.data28# neq "">Assigned to #read_mortgage13.data28# recorded on #DateFormat(read_mortgage13.data32, "mm")#/#DateFormat(read_mortgage13.data32, "dd")#/#DateFormat(read_mortgage13.data32, "yyyy")#, <cfif #read_mortgage13.data29# EQ ""> in Book #read_mortgage13.data30#, at Page #read_mortgage13.data31# <cfelse> in Document #read_mortgage13.data31#</cfif> </cfif><cfif #read_mortgage13.data11# neq "">#read_mortgage13.data11#</cfif> <cfif #read_mortgage13.data12# neq "">#read_mortgage13.data12#</cfif></cfif>
<br>
<br>
	</td>
	</tr>
</cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_mortgage14">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 14
			</cfquery>
<cfif read_mortgage14.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>

			<cfoutput query = "read_mortgage14">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
          <cfif #read_mortgage14.data1# NEQ ""> <cfif read_mortgage14.lienintro neq "" and read_mortgage14.lienintro neq 'NULL' or Len(read_mortgage14.lienintro) eq 0>#read_mortgage14.lienintro#<cfelse>Satisfaction and/or release of</cfif> Mortgage from #read_mortgage14.data2# <cfif #read_mortgage14.data3# neq ""> and #read_mortgage14.data3#</cfif> securing #read_mortgage14.data1# in the original principal amount of #read_mortgage14.data4#, as dated #DateFormat(read_mortgage14.data8, "mm")#/#DateFormat(read_mortgage14.data8, "dd")#/#DateFormat(read_mortgage14.data8, "yyyy")# and recorded on #DateFormat(read_mortgage14.data9, "mm")#/#DateFormat(read_mortgage14.data9, "dd")#/#DateFormat(read_mortgage14.data9, "yyyy")# among the Land Records of #read_title.pcounty# County, <cfif #read_mortgage14.data5# eq ""><cfif #read_mortgage14.data6# neq "">in Book #read_mortgage14.data6# at Page #read_mortgage14.data7# </cfif><cfelse> in Document Number #read_mortgage14.data5# </cfif><cfif #read_mortgage14.data13# neq ""> Assigned to #read_mortgage14.data13# recorded on #DateFormat(read_mortgage14.data17, "mm")#/#DateFormat(read_mortgage14.data17, "dd")#/#DateFormat(read_mortgage14.data17, "yyyy")#, in Book <cfif #read_mortgage14.data14# eq "">#read_mortgage14.data15#, at Page #read_mortgage14.data16# <cfelse> in Document #read_mortgage14.data14#</cfif> </cfif><cfif #read_mortgage14.data18# neq "">Assigned to #read_mortgage14.data18# recorded on #DateFormat(read_mortgage14.data22, "mm")#/#DateFormat(read_mortgage14.data22, "dd")#/#DateFormat(read_mortgage14.data22, "yyyy")#, <cfif #read_mortgage14.data19# eq "">in Book #read_mortgage14.data20#, at Page #read_mortgage14.data21# <cfelse> in Document #read_mortgage14.data19#</cfif> </cfif><cfif #read_mortgage14.data23# neq "">Assigned to #read_mortgage14.data23# recorded on #DateFormat(read_mortgage14.data27, "mm")#/#DateFormat(read_mortgage14.data27, "dd")#/#DateFormat(read_mortgage14.data27, "yyyy")#, <cfif #read_mortgage14.data24# eq ""> in Book #read_mortgage14.data25#, at Page #read_mortgage14.data26# <cfelse> in Document #read_mortgage14.data24#</cfif> </cfif><cfif #read_mortgage14.data28# neq "">Assigned to #read_mortgage14.data28# recorded on #DateFormat(read_mortgage14.data32, "mm")#/#DateFormat(read_mortgage14.data32, "dd")#/#DateFormat(read_mortgage14.data32, "yyyy")#, <cfif #read_mortgage14.data29# EQ ""> in Book #read_mortgage14.data30#, at Page #read_mortgage14.data31# <cfelse> in Document #read_mortgage14.data31#</cfif> </cfif><cfif #read_mortgage14.data11# neq "">#read_mortgage14.data11#</cfif> <cfif #read_mortgage14.data12# neq "">#read_mortgage14.data12#</cfif></cfif>
	<br>
<br>
</td>
	</tr>
</cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_mortgage15">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 15
			</cfquery>
<cfif read_mortgage15.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>

			<cfoutput query = "read_mortgage15">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
          <cfif #read_mortgage15.data1# NEQ ""> <cfif read_mortgage15.lienintro neq "" and read_mortgage15.lienintro neq 'NULL' or Len(read_mortgage15.lienintro) eq 0>#read_mortgage15.lienintro#<cfelse>Satisfaction and/or release of</cfif> Mortgage from #read_mortgage15.data2# <cfif #read_mortgage15.data3# neq ""> and #read_mortgage15.data3#</cfif> securing #read_mortgage15.data1# in the original principal amount of #read_mortgage15.data4#, as dated #DateFormat(read_mortgage15.data8, "mm")#/#DateFormat(read_mortgage15.data8, "dd")#/#DateFormat(read_mortgage15.data8, "yyyy")# and recorded on #DateFormat(read_mortgage15.data9, "mm")#/#DateFormat(read_mortgage15.data9, "dd")#/#DateFormat(read_mortgage15.data9, "yyyy")# among the Land Records of #read_title.pcounty# County, <cfif #read_mortgage15.data5# eq ""><cfif #read_mortgage15.data6# neq "">in Book #read_mortgage15.data6# at Page #read_mortgage15.data7# </cfif><cfelse> in Document Number #read_mortgage15.data5# </cfif><cfif #read_mortgage15.data13# neq ""> Assigned to #read_mortgage15.data13# recorded on #DateFormat(read_mortgage15.data17, "mm")#/#DateFormat(read_mortgage15.data17, "dd")#/#DateFormat(read_mortgage15.data17, "yyyy")#, in Book <cfif #read_mortgage15.data14# eq "">#read_mortgage15.data15#, at Page #read_mortgage15.data16# <cfelse> in Document #read_mortgage15.data14#</cfif> </cfif><cfif #read_mortgage15.data18# neq "">Assigned to #read_mortgage15.data18# recorded on #DateFormat(read_mortgage15.data22, "mm")#/#DateFormat(read_mortgage15.data22, "dd")#/#DateFormat(read_mortgage15.data22, "yyyy")#, <cfif #read_mortgage15.data19# eq "">in Book #read_mortgage15.data20#, at Page #read_mortgage15.data21# <cfelse> in Document #read_mortgage15.data19#</cfif> </cfif><cfif #read_mortgage15.data23# neq "">Assigned to #read_mortgage15.data23# recorded on #DateFormat(read_mortgage15.data27, "mm")#/#DateFormat(read_mortgage15.data27, "dd")#/#DateFormat(read_mortgage15.data27, "yyyy")#, <cfif #read_mortgage15.data24# eq ""> in Book #read_mortgage15.data25#, at Page #read_mortgage15.data26# <cfelse> in Document #read_mortgage15.data24#</cfif> </cfif><cfif #read_mortgage15.data28# neq "">Assigned to #read_mortgage15.data28# recorded on #DateFormat(read_mortgage15.data32, "mm")#/#DateFormat(read_mortgage15.data32, "dd")#/#DateFormat(read_mortgage15.data32, "yyyy")#, <cfif #read_mortgage15.data29# EQ ""> in Book #read_mortgage15.data30#, at Page #read_mortgage15.data31# <cfelse> in Document #read_mortgage15.data31#</cfif> </cfif><cfif #read_mortgage15.data11# neq "">#read_mortgage15.data11#</cfif> <cfif #read_mortgage15.data12# neq "">#read_mortgage15.data12#</cfif></cfif>
<br>
<br>
	</td>
	</tr>
</cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_mortgage16">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 16
			</cfquery>
<cfif read_mortgage16.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>

			<cfoutput query = "read_mortgage16">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
          <cfif #read_mortgage16.data1# NEQ ""> <cfif read_mortgage16.lienintro neq "" and read_mortgage16.lienintro neq 'NULL' or Len(read_mortgage16.lienintro) eq 0>#read_mortgage16.lienintro#<cfelse>Satisfaction and/or release of</cfif> Mortgage from #read_mortgage16.data2# <cfif #read_mortgage16.data3# neq ""> and #read_mortgage16.data3#</cfif> securing #read_mortgage16.data1# in the original principal amount of #read_mortgage16.data4#, as dated #DateFormat(read_mortgage16.data8, "mm")#/#DateFormat(read_mortgage16.data8, "dd")#/#DateFormat(read_mortgage16.data8, "yyyy")# and recorded on #DateFormat(read_mortgage16.data9, "mm")#/#DateFormat(read_mortgage16.data9, "dd")#/#DateFormat(read_mortgage16.data9, "yyyy")# among the Land Records of #read_title.pcounty# County, <cfif #read_mortgage16.data5# eq ""><cfif #read_mortgage16.data6# neq "">in Book #read_mortgage16.data6# at Page #read_mortgage16.data7# </cfif><cfelse> in Document Number #read_mortgage16.data5# </cfif><cfif #read_mortgage16.data13# neq ""> Assigned to #read_mortgage16.data13# recorded on #DateFormat(read_mortgage16.data17, "mm")#/#DateFormat(read_mortgage16.data17, "dd")#/#DateFormat(read_mortgage16.data17, "yyyy")#, in Book <cfif #read_mortgage16.data14# eq "">#read_mortgage16.data15#, at Page #read_mortgage16.data16# <cfelse> in Document #read_mortgage16.data14#</cfif> </cfif><cfif #read_mortgage16.data18# neq "">Assigned to #read_mortgage16.data18# recorded on #DateFormat(read_mortgage16.data22, "mm")#/#DateFormat(read_mortgage16.data22, "dd")#/#DateFormat(read_mortgage16.data22, "yyyy")#, <cfif #read_mortgage16.data19# eq "">in Book #read_mortgage16.data20#, at Page #read_mortgage16.data21# <cfelse> in Document #read_mortgage16.data19#</cfif> </cfif><cfif #read_mortgage16.data23# neq "">Assigned to #read_mortgage16.data23# recorded on #DateFormat(read_mortgage16.data27, "mm")#/#DateFormat(read_mortgage16.data27, "dd")#/#DateFormat(read_mortgage16.data27, "yyyy")#, <cfif #read_mortgage16.data24# eq ""> in Book #read_mortgage16.data25#, at Page #read_mortgage16.data26# <cfelse> in Document #read_mortgage16.data24#</cfif> </cfif><cfif #read_mortgage16.data28# neq "">Assigned to #read_mortgage16.data28# recorded on #DateFormat(read_mortgage16.data32, "mm")#/#DateFormat(read_mortgage16.data32, "dd")#/#DateFormat(read_mortgage16.data32, "yyyy")#, <cfif #read_mortgage16.data29# EQ ""> in Book #read_mortgage16.data30#, at Page #read_mortgage16.data31# <cfelse> in Document #read_mortgage16.data31#</cfif> </cfif><cfif #read_mortgage16.data11# neq "">#read_mortgage16.data11#</cfif> <cfif #read_mortgage16.data12# neq "">#read_mortgage16.data12#</cfif></cfif>
<br>
	</td>
	</tr>
</cfoutput>
<cfif #read_mortgage2.recordcount# neq "0">
			<CFQUERY datasource="#request.dsn#" NAME="read_lien">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 1
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
<br>
<br>
		</td>
	</tr>
</cfoutput>



   </cfif>



	 	<CFQUERY datasource="#request.dsn#" NAME="read_lien2">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 2
			</cfquery>
<cfif read_lien2.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien2">
		<cfset auto_number = #auto_number# + 1>

	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien2.data7# NEQ ""> #read_lien2.lienintro# Judgment against #read_lien2.data7# in favor of #read_lien2.data6# in the amount of #read_lien2.data5#, dated #DateFormat(read_lien2.data4, "mm")#/#DateFormat(read_lien2.data4, "dd")#/#DateFormat(read_lien2.data4, "yyyy")#
			   and recorded #DateFormat(read_lien2.data9, "mm")#/#DateFormat(read_lien2.data9, "dd")#/#DateFormat(read_lien2.data9, "yyyy")#
			     <cfif #read_lien2.data1# eq ""> in Book #read_lien2.data2# at Page #read_lien2.data3# <cfelse> in Document #read_lien2.data1# </cfif> #read_lien2.data8#</cfif>
	<br>
<br>

		</td>
	</tr>
</cfoutput>

		<CFQUERY datasource="#request.dsn#" NAME="read_lien3">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 3
			</cfquery>
<cfif read_lien3.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien3">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien3.data7# NEQ ""> #read_lien3.lienintro# Judgment against #read_lien3.data7# in favor of #read_lien3.data6# in the amount of #read_lien3.data5#, dated #DateFormat(read_lien3.data4, "mm")#/#DateFormat(read_lien3.data4, "dd")#/#DateFormat(read_lien3.data4, "yyyy")#
			  and recorded #DateFormat(read_lien3.data9, "mm")#/#DateFormat(read_lien3.data9, "dd")#/#DateFormat(read_lien3.data9, "yyyy")#
			    <cfif #read_lien3.data1# eq ""> in Book #read_lien3.data2# at Page #read_lien3.data3# <cfelse> in Document #read_lien3.data1# </cfif> #read_lien3.data8#</cfif>
		<BR><BR>
		</td>
	</tr>
</cfoutput>


<CFQUERY datasource="#request.dsn#" NAME="read_lien4">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 4
			</cfquery>
<cfif read_lien4.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien4">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien4.data7# NEQ ""> #read_lien4.lienintro# Judgment against #read_lien4.data7# in favor of #read_lien4.data6# in the amount of #read_lien4.data5#, dated #DateFormat(read_lien4.data4, "mm")#/#DateFormat(read_lien4.data4, "dd")#/#DateFormat(read_lien4.data4, "yyyy")#
			  and recorded #DateFormat(read_lien4.data9, "mm")#/#DateFormat(read_lien4.data9, "dd")#/#DateFormat(read_lien4.data9, "yyyy")#
			    <cfif #read_lien4.data1# eq ""> in Book #read_lien4.data2# at Page #read_lien4.data3# <cfelse> in Document #read_lien4.data1# </cfif> #read_lien4.data8#</cfif>
		<BR><BR>
		</td>
	</tr>

</cfoutput>

		<CFQUERY datasource="#request.dsn#" NAME="read_lien5">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 5
			</cfquery>
<cfif read_lien5.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien5">
	<cfset auto_number = #auto_number# + 1>

	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien5.data7# NEQ ""> #read_lien5.lienintro# Judgment against #read_lien5.data7# in favor of #read_lien5.data6# in the amount of #read_lien5.data5#, dated #DateFormat(read_lien5.data4, "mm")#/#DateFormat(read_lien5.data4, "dd")#/#DateFormat(read_lien5.data4, "yyyy")#
			  and recorded #DateFormat(read_lien5.data9, "mm")#/#DateFormat(read_lien5.data9, "dd")#/#DateFormat(read_lien5.data9, "yyyy")#
			    <cfif #read_lien5.data1# eq ""> in Book #read_lien5.data2# at Page #read_lien5.data3# <cfelse> in Document #read_lien5.data1# </cfif> #read_lien5.data8#</cfif>
		<BR><BR>
		</td>
	</tr>
</cfoutput>
		<CFQUERY datasource="#request.dsn#" NAME="read_lien6">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 6
			</cfquery>
<cfif read_lien6.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien6">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien6.data7# NEQ ""> #read_lien6.lienintro# Judgment against #read_lien6.data7# in favor of #read_lien6.data6# in the amount of #read_lien6.data5#, dated #DateFormat(read_lien6.data4, "mm")#/#DateFormat(read_lien6.data4, "dd")#/#DateFormat(read_lien6.data4, "yyyy")#
			  and recorded #DateFormat(read_lien6.data9, "mm")#/#DateFormat(read_lien6.data9, "dd")#/#DateFormat(read_lien6.data9, "yyyy")#
			    <cfif #read_lien6.data1# eq ""> in Book #read_lien6.data2# at Page #read_lien6.data3# <cfelse> in Document #read_lien6.data1# </cfif> #read_lien6.data8#</cfif>
					<BR><BR>
		</td>
	</tr>
</cfoutput>

		<CFQUERY datasource="#request.dsn#" NAME="read_lien7">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 7
			</cfquery>
<cfif read_lien7.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien7">
		<cfset auto_number = #auto_number# + 1>

	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien7.data7# NEQ ""> #read_lien7.lienintro# Judgment against #read_lien7.data7# in favor of #read_lien7.data6# in the amount of #read_lien7.data5#, dated #DateFormat(read_lien7.data4, "mm")#/#DateFormat(read_lien7.data4, "dd")#/#DateFormat(read_lien7.data4, "yyyy")#
			  and recorded #DateFormat(read_lien7.data9, "mm")#/#DateFormat(read_lien7.data9, "dd")#/#DateFormat(read_lien7.data9, "yyyy")#
			<cfif #read_lien7.data1# eq ""> in Book #read_lien7.data2# at Page #read_lien7.data3# <cfelse> in Document #read_lien7.data1# </cfif> #read_lien7.data8#</cfif>
	<BR><BR>
		</td>

	</tr>

</cfoutput>

<CFQUERY datasource="#request.dsn#" NAME="read_lien8">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 8
			</cfquery>
<cfif read_lien8.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien8">
	<cfset auto_number = #auto_number# + 1>

	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien8.data7# NEQ ""> #read_lien8.lienintro# Judgment against #read_lien8.data7# in favor of #read_lien8.data6# in the amount of #read_lien8.data5#, dated #DateFormat(read_lien8.data4, "mm")#/#DateFormat(read_lien8.data4, "dd")#/#DateFormat(read_lien8.data4, "yyyy")#
			  and recorded #DateFormat(read_lien8.data9, "mm")#/#DateFormat(read_lien8.data9, "dd")#/#DateFormat(read_lien8.data9, "yyyy")#
			    <cfif #read_lien8.data1# eq ""> in Book #read_lien8.data2# at Page #read_lien8.data3# <cfelse> in Document #read_lien8.data1# </cfif> #read_lien8.data8#</cfif>
	<BR><BR>
		</td>
	</tr>
</cfoutput>

	<CFQUERY datasource="#request.dsn#" NAME="read_lien9">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 9
			</cfquery>
<cfif read_lien9.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien9">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien9.data7# NEQ ""> #read_lien9.lienintro# Judgment against #read_lien9.data7# in favor of #read_lien9.data6# in the amount of #read_lien9.data5#, dated #DateFormat(read_lien9.data4, "mm")#/#DateFormat(read_lien9.data4, "dd")#/#DateFormat(read_lien9.data4, "yyyy")#
			   and recorded #DateFormat(read_lien9.data9, "mm")#/#DateFormat(read_lien9.data9, "dd")#/#DateFormat(read_lien9.data9, "yyyy")#
			     <cfif #read_lien.data1# eq ""> in Book #read_lien9.data2# at Page #read_lien9.data3# <cfelse> in Document #read_lien9.data1# </cfif> #read_lien9.data8#</cfif>
		<BR><BR>
		</td>
	</tr>
</cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_lien10">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 10
			</cfquery>
<cfif read_lien10.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien10">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien10.data7# NEQ ""> #read_lien10.lienintro# Judgment against #read_lien10.data7# in favor of #read_lien10.data6# in the amount of #read_lien10.data5#, dated #DateFormat(read_lien10.data4, "mm")#/#DateFormat(read_lien10.data4, "dd")#/#DateFormat(read_lien10.data4, "yyyy")# and recorded #DateFormat(read_lien10.data9, "mm")#/#DateFormat(read_lien10.data9, "dd")#/#DateFormat(read_lien10.data9, "yyyy")#
			    <cfif #read_lien10.data1# eq ""> in Book #read_lien10.data2# at Page #read_lien10.data3# <cfelse> in Document #read_lien10.data1# </cfif> #read_lien10.data8#</cfif>
	<BR><BR>
		</td>
	</tr>
</cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_lien11">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 11
			</cfquery>
<cfif read_lien11.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien11">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien11.data7# NEQ ""> #read_lien11.lienintro# Judgment against #read_lien11.data7# in favor of #read_lien11.data6# in the amount of #read_lien11.data5#, dated #DateFormat(read_lien11.data4, "mm")#/#DateFormat(read_lien11.data4, "dd")#/#DateFormat(read_lien11.data4, "yyyy")# and recorded #DateFormat(read_lien11.data9, "mm")#/#DateFormat(read_lien11.data9, "dd")#/#DateFormat(read_lien11.data9, "yyyy")#
			    <cfif #read_lien11.data1# eq ""> in Book #read_lien11.data2# at Page #read_lien11.data3# <cfelse> in Document #read_lien11.data1# </cfif> #read_lien11.data8#</cfif>
<BR><BR>
		</td>
	</tr>
</cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_lien12">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 12
			</cfquery>
<cfif read_lien12.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien12">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien12.data7# NEQ ""> #read_lien12.lienintro# Judgment against #read_lien12.data7# in favor of #read_lien12.data6# in the amount of #read_lien12.data5#, dated #DateFormat(read_lien12.data4, "mm")#/#DateFormat(read_lien12.data4, "dd")#/#DateFormat(read_lien12.data4, "yyyy")# and recorded #DateFormat(read_lien12.data9, "mm")#/#DateFormat(read_lien12.data9, "dd")#/#DateFormat(read_lien12.data9, "yyyy")#
			    <cfif #read_lien12.data1# eq ""> in Book #read_lien12.data2# at Page #read_lien12.data3# <cfelse> in Document #read_lien12.data1# </cfif> #read_lien12.data8#</cfif>
<BR><BR>
		</td>
	</tr>
</cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_lien13">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 13
			</cfquery>
<cfif read_lien13.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien13">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien13.data7# NEQ ""> #read_lien13.lienintro# Judgment against #read_lien13.data7# in favor of #read_lien13.data6# in the amount of #read_lien13.data5#, dated #DateFormat(read_lien13.data4, "mm")#/#DateFormat(read_lien13.data4, "dd")#/#DateFormat(read_lien13.data4, "yyyy")# and recorded #DateFormat(read_lien13.data9, "mm")#/#DateFormat(read_lien13.data9, "dd")#/#DateFormat(read_lien13.data9, "yyyy")#
			    <cfif #read_lien13.data1# eq ""> in Book #read_lien13.data2# at Page #read_lien13.data3# <cfelse> in Document #read_lien13.data1# </cfif> #read_lien13.data8#</cfif>
	<BR><BR>
		</td>
	</tr>
</cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_lien14">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 14
			</cfquery>
<cfif read_lien14.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien14">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien14.data7# NEQ ""> #read_lien14.lienintro# Judgment against #read_lien14.data7# in favor of #read_lien14.data6# in the amount of #read_lien14.data5#, dated #DateFormat(read_lien14.data4, "mm")#/#DateFormat(read_lien14.data4, "dd")#/#DateFormat(read_lien14.data4, "yyyy")# and recorded #DateFormat(read_lien14.data9, "mm")#/#DateFormat(read_lien14.data9, "dd")#/#DateFormat(read_lien14.data9, "yyyy")#
			    <cfif #read_lien14.data1# eq ""> in Book #read_lien14.data2# at Page #read_lien14.data3# <cfelse> in Document #read_lien14.data1# </cfif> #read_lien14.data8#</cfif>
<BR><BR>
		</td>
	</tr>
</cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_lien15">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 15
			</cfquery>
<cfif read_lien15.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien15">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien15.data7# NEQ ""> #read_lien15.lienintro# Judgment against #read_lien15.data7# in favor of #read_lien15.data6# in the amount of #read_lien15.data5#, dated #DateFormat(read_lien15.data4, "mm")#/#DateFormat(read_lien15.data4, "dd")#/#DateFormat(read_lien15.data4, "yyyy")# and recorded #DateFormat(read_lien15.data9, "mm")#/#DateFormat(read_lien15.data9, "dd")#/#DateFormat(read_lien15.data9, "yyyy")#
			    <cfif #read_lien15.data1# eq ""> in Book #read_lien15.data2# at Page #read_lien15.data3# <cfelse> in Document #read_lien15.data1# </cfif> #read_lien15.data8#</cfif>
<BR><BR>
		</td>
	</tr>
</cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_lien16">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 16
			</cfquery>
<cfif read_lien16.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien16">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien16.data7# NEQ ""> #read_lien16.lienintro# Judgment against #read_lien16.data7# in favor of #read_lien16.data6# in the amount of #read_lien16.data5#, dated #DateFormat(read_lien16.data4, "mm")#/#DateFormat(read_lien16.data4, "dd")#/#DateFormat(read_lien16.data4, "yyyy")# and recorded #DateFormat(read_lien16.data9, "mm")#/#DateFormat(read_lien16.data9, "dd")#/#DateFormat(read_lien16.data9, "yyyy")#
			    <cfif #read_lien16.data1# eq ""> in Book #read_lien16.data2# at Page #read_lien16.data3# <cfelse> in Document #read_lien16.data1# </cfif> #read_lien16.data8#</cfif>
<BR><BR>
		</td>
	</tr>
</cfoutput>

<CFQUERY datasource="#request.dsn#" NAME="read_lien17">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 17</cfquery>
<cfif read_lien17.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien17">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien17.data7# NEQ ""> #read_lien17.lienintro# Judgment against #read_lien17.data7# in favor of #read_lien17.data6# in the amount of #read_lien17.data5#, dated #DateFormat(read_lien17.data4, "mm")#/#DateFormat(read_lien17.data4, "dd")#/#DateFormat(read_lien17.data4, "yyyy")# and recorded #DateFormat(read_lien17.data9, "mm")#/#DateFormat(read_lien17.data9, "dd")#/#DateFormat(read_lien17.data9, "yyyy")#
			    <cfif #read_lien17.data1# eq ""> in Book #read_lien17.data2# at Page #read_lien17.data3# <cfelse> in Document #read_lien17.data1# </cfif> #read_lien17.data8#</cfif>
<BR><BR>
		</td>
	</tr>
</cfoutput>

<CFQUERY datasource="#request.dsn#" NAME="read_lien18">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 18
			</cfquery>
<cfif read_lien18.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien18">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien18.data7# NEQ ""> #read_lien18.lienintro# Judgment against #read_lien18.data7# in favor of #read_lien18.data6# in the amount of #read_lien18.data5#, dated #DateFormat(read_lien18.data4, "mm")#/#DateFormat(read_lien18.data4, "dd")#/#DateFormat(read_lien18.data4, "yyyy")# and recorded #DateFormat(read_lien18.data9, "mm")#/#DateFormat(read_lien18.data9, "dd")#/#DateFormat(read_lien18.data9, "yyyy")#
			    <cfif #read_lien18.data1# eq ""> in Book #read_lien18.data2# at Page #read_lien18.data3# <cfelse> in Document #read_lien18.data1# </cfif> #read_lien18.data8#</cfif>
<BR><BR>
		</td>
	</tr>
</cfoutput>


<CFQUERY datasource="#request.dsn#" NAME="read_lien19">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 19
			</cfquery>
<cfif read_lien19.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien19">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien19.data7# NEQ ""> #read_lien19.lienintro# Judgment against #read_lien19.data7# in favor of #read_lien19.data6# in the amount of #read_lien19.data5#, dated #DateFormat(read_lien19.data4, "mm")#/#DateFormat(read_lien19.data4, "dd")#/#DateFormat(read_lien19.data4, "yyyy")# and recorded #DateFormat(read_lien19.data9, "mm")#/#DateFormat(read_lien19.data9, "dd")#/#DateFormat(read_lien19.data9, "yyyy")#
			    <cfif #read_lien19.data1# eq ""> in Book #read_lien19.data2# at Page #read_lien19.data3# <cfelse> in Document #read_lien19.data1# </cfif> #read_lien19.data8#</cfif>
<BR><BR>
		</td>
	</tr>
</cfoutput>


<CFQUERY datasource="#request.dsn#" NAME="read_lien20">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 20
			</cfquery>
<cfif read_lien20.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien20">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien20.data7# NEQ ""> #read_lien20.lienintro# Judgment against #read_lien20.data7# in favor of #read_lien20.data6# in the amount of #read_lien20.data5#, dated #DateFormat(read_lien20.data4, "mm")#/#DateFormat(read_lien20.data4, "dd")#/#DateFormat(read_lien20.data4, "yyyy")# and recorded #DateFormat(read_lien20.data9, "mm")#/#DateFormat(read_lien20.data9, "dd")#/#DateFormat(read_lien20.data9, "yyyy")#
			    <cfif #read_lien20.data1# eq ""> in Book #read_lien20.data2# at Page #read_lien20.data3# <cfelse> in Document #read_lien20.data1# </cfif> #read_lien20.data8#</cfif>
<BR><BR>
		</td>
	</tr>
</cfoutput>

<CFQUERY datasource="#request.dsn#" NAME="read_lien21">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 21
			</cfquery>
<cfif read_lien21.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien21">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien21.data7# NEQ ""> #read_lien21.lienintro# Judgment against #read_lien21.data7# in favor of #read_lien21.data6# in the amount of #read_lien21.data5#, dated #DateFormat(read_lien21.data4, "mm")#/#DateFormat(read_lien21.data4, "dd")#/#DateFormat(read_lien21.data4, "yyyy")# and recorded #DateFormat(read_lien21.data9, "mm")#/#DateFormat(read_lien21.data9, "dd")#/#DateFormat(read_lien21.data9, "yyyy")#
			    <cfif #read_lien21.data1# eq ""> in Book #read_lien21.data2# at Page #read_lien21.data3# <cfelse> in Document #read_lien21.data1# </cfif> #read_lien21.data8#</cfif>
<BR><BR>
		</td>
	</tr>
</cfoutput>

<CFQUERY datasource="#request.dsn#" NAME="read_lien22">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 22
			</cfquery>
<cfif read_lien22.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien22">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien22.data7# NEQ ""> #read_lien22.lienintro# Judgment against #read_lien22.data7# in favor of #read_lien22.data6# in the amount of #read_lien22.data5#, dated #DateFormat(read_lien22.data4, "mm")#/#DateFormat(read_lien22.data4, "dd")#/#DateFormat(read_lien22.data4, "yyyy")# and recorded #DateFormat(read_lien22.data9, "mm")#/#DateFormat(read_lien22.data9, "dd")#/#DateFormat(read_lien22.data9, "yyyy")#
			    <cfif #read_lien22.data1# eq ""> in Book #read_lien22.data2# at Page #read_lien22.data3# <cfelse> in Document #read_lien22.data1# </cfif> #read_lien22.data8#</cfif>
<BR><BR>
		</td>
	</tr>
</cfoutput>

<CFQUERY datasource="#request.dsn#" NAME="read_lien23">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 23
			</cfquery>
<cfif read_lien23.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien23">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien23.data7# NEQ ""> #read_lien23.lienintro# Judgment against #read_lien23.data7# in favor of #read_lien23.data6# in the amount of #read_lien23.data5#, dated #DateFormat(read_lien23.data4, "mm")#/#DateFormat(read_lien23.data4, "dd")#/#DateFormat(read_lien23.data4, "yyyy")# and recorded #DateFormat(read_lien23.data9, "mm")#/#DateFormat(read_lien23.data9, "dd")#/#DateFormat(read_lien23.data9, "yyyy")#
			    <cfif #read_lien23.data1# eq ""> in Book #read_lien23.data2# at Page #read_lien23.data3# <cfelse> in Document #read_lien23.data1# </cfif> #read_lien23.data8#</cfif>
<BR><BR>
		</td>
	</tr>
</cfoutput>

<CFQUERY datasource="#request.dsn#" NAME="read_lien24">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 24
			</cfquery>
<cfif read_lien24.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien24">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien24.data7# NEQ ""> #read_lien24.lienintro# Judgment against #read_lien24.data7# in favor of #read_lien24.data6# in the amount of #read_lien24.data5#, dated #DateFormat(read_lien24.data4, "mm")#/#DateFormat(read_lien24.data4, "dd")#/#DateFormat(read_lien24.data4, "yyyy")# and recorded #DateFormat(read_lien24.data9, "mm")#/#DateFormat(read_lien24.data9, "dd")#/#DateFormat(read_lien24.data9, "yyyy")#
			    <cfif #read_lien24.data1# eq ""> in Book #read_lien24.data2# at Page #read_lien24.data3# <cfelse> in Document #read_lien24.data1# </cfif> #read_lien24.data8#</cfif>
<BR><BR>
		</td>
	</tr>
</cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_lien25">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 25
			</cfquery>
<cfif read_lien25.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien25">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien25.data7# NEQ ""> #read_lien25.lienintro# Judgment against #read_lien25.data7# in favor of #read_lien25.data6# in the amount of #read_lien25.data5#, dated #DateFormat(read_lien25.data4, "mm")#/#DateFormat(read_lien25.data4, "dd")#/#DateFormat(read_lien25.data4, "yyyy")# and recorded #DateFormat(read_lien25.data9, "mm")#/#DateFormat(read_lien25.data9, "dd")#/#DateFormat(read_lien25.data9, "yyyy")#
			    <cfif #read_lien25.data1# eq ""> in Book #read_lien25.data2# at Page #read_lien25.data3# <cfelse> in Document #read_lien25.data1# </cfif> #read_lien25.data8#</cfif>
<BR><BR>
		</td>
	</tr>
</cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_lien26">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 26
			</cfquery>
<cfif read_lien26.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien26">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien26.data7# NEQ ""> #read_lien26.lienintro# Judgment against #read_lien26.data7# in favor of #read_lien26.data6# in the amount of #read_lien26.data5#, dated #DateFormat(read_lien26.data4, "mm")#/#DateFormat(read_lien26.data4, "dd")#/#DateFormat(read_lien26.data4, "yyyy")# and recorded #DateFormat(read_lien26.data9, "mm")#/#DateFormat(read_lien26.data9, "dd")#/#DateFormat(read_lien26.data9, "yyyy")#
			    <cfif #read_lien26.data1# eq ""> in Book #read_lien26.data2# at Page #read_lien26.data3# <cfelse> in Document #read_lien26.data1# </cfif> #read_lien26.data8#</cfif>
<BR><BR>
		</td>
	</tr>
</cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_lien27">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 27
			</cfquery>
<cfif read_lien27.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien27">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien27.data7# NEQ ""> #read_lien27.lienintro# Judgment against #read_lien27.data7# in favor of #read_lien27.data6# in the amount of #read_lien27.data5#, dated #DateFormat(read_lien27.data4, "mm")#/#DateFormat(read_lien27.data4, "dd")#/#DateFormat(read_lien27.data4, "yyyy")# and recorded #DateFormat(read_lien27.data9, "mm")#/#DateFormat(read_lien27.data9, "dd")#/#DateFormat(read_lien27.data9, "yyyy")#
			    <cfif #read_lien27.data1# eq ""> in Book #read_lien27.data2# at Page #read_lien27.data3# <cfelse> in Document #read_lien27.data1# </cfif> #read_lien27.data8#</cfif>
<BR><BR>
		</td>
	</tr>
</cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_lien28">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 28
			</cfquery>
<cfif read_lien28.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien28">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien28.data7# NEQ ""> #read_lien28.lienintro# Judgment against #read_lien28.data7# in favor of #read_lien28.data6# in the amount of #read_lien28.data5#, dated #DateFormat(read_lien28.data4, "mm")#/#DateFormat(read_lien28.data4, "dd")#/#DateFormat(read_lien28.data4, "yyyy")# and recorded #DateFormat(read_lien28.data9, "mm")#/#DateFormat(read_lien28.data9, "dd")#/#DateFormat(read_lien28.data9, "yyyy")#
			    <cfif #read_lien28.data1# eq ""> in Book #read_lien28.data2# at Page #read_lien28.data3# <cfelse> in Document #read_lien28.data1# </cfif> #read_lien28.data8#</cfif>
<BR><BR>
		</td>
	</tr>
</cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_lien29">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 29
			</cfquery>
<cfif read_lien29.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien29">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien29.data7# NEQ ""> #read_lien29.lienintro# Judgment against #read_lien29.data7# in favor of #read_lien29.data6# in the amount of #read_lien29.data5#, dated #DateFormat(read_lien29.data4, "mm")#/#DateFormat(read_lien29.data4, "dd")#/#DateFormat(read_lien29.data4, "yyyy")# and recorded #DateFormat(read_lien29.data9, "mm")#/#DateFormat(read_lien29.data9, "dd")#/#DateFormat(read_lien29.data9, "yyyy")#
			    <cfif #read_lien29.data1# eq ""> in Book #read_lien29.data2# at Page #read_lien29.data3# <cfelse> in Document #read_lien29.data1# </cfif> #read_lien29.data8#</cfif>
<BR><BR>
		</td>
	</tr>
</cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_lien30">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 30
			</cfquery>
<cfif read_lien30.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
		<cfoutput query = "read_lien30">
	<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td>#auto_number#.</td>
		    <td>
              <cfif #read_lien30.data7# NEQ ""> #read_lien30.lienintro# Judgment against #read_lien30.data7# in favor of #read_lien30.data6# in the amount of #read_lien30.data5#, dated #DateFormat(read_lien30.data4, "mm")#/#DateFormat(read_lien30.data4, "dd")#/#DateFormat(read_lien30.data4, "yyyy")# and recorded #DateFormat(read_lien30.data9, "mm")#/#DateFormat(read_lien30.data9, "dd")#/#DateFormat(read_lien30.data9, "yyyy")#
			    <cfif #read_lien30.data1# eq ""> in Book #read_lien30.data2# at Page #read_lien30.data3# <cfelse> in Document #read_lien30.data1# </cfif> #read_lien30.data8#</cfif>
<BR><BR>
		</td>
	</tr>
</cfoutput>


<cfif read_title.pstate eq 'MD'>
<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
		    <td><cfoutput>#auto_number#</cfoutput>.</td>
       <td>
The Trustee(s) on the trust deed creating the interest sought to be insured must be a natural person or persons and must be identified by individual name(s) on said trust deed. Trust deeds containing and/or identifying a corporate trustee or the failure to identify a trustee on said trust deed will result in an exception being inserted in the policy for loss or damage resulting therefrom.
<br>
<br>

			</td>
		</tr>
</cfif>


<!--- new language for all Shaprio and Rosicki files --->
<cfif read_title.comp_id eq 3182 or read_title.comp_id eq 2368 or read_title.comp_id eq 2430  or read_FT_company.streamline_client eq 'True' and read_title.searchtype eq 'Purchase'>
<cfif read_title.pstate eq 'VA'>
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
<!--- end new Shapiro Rosicki language --->


<cfif read_title.comp_id eq 3943 or read_title.comp_id eq 4043 or read_title.comp_id eq 4042 and read_title.line_102 neq '' and read_title.line_102 neq 'NULL' and read_title.line_102 neq 0>

<cfset auto_number = #auto_number# + 1>
	      <tr align="left" valign="top">
            <td><cfoutput>#auto_number#</cfoutput>.</td>
		    <td>
              <cfoutput>Satisfaction and/or release of UCC with #read_title.share_loan_lender#<br>
<br>
</cfoutput>
		</td>
	</tr>

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
<cfif read_title.comp_id neq 8417 and read_title.comp_id neq 8534> <!--- removed for Doc Solution, Inc. - DIL, and NITA Solutions.  There will be no new mortgage put on for these deals --->
	      <tr align="left" valign="top">
            <td><cfoutput>#auto_number#</cfoutput>.</td>
		    <td>
              <cfoutput>Recordation of (mortgage/deed of trust) from <cfif Len(read_title.blastname1)>, #read_title.bfirstname1# #read_title.blastname1# </cfif><cfif Len(read_title.blastname2)>, #read_title.bfirstname2# #read_title.blastname2# </cfif><cfif Len(read_title.blastname3)>, #read_title.bfirstname3# #read_title.blastname3# </cfif><cfif Len(read_title.blastname4)>, #read_title.bfirstname4# #read_title.blastname4# </cfif> securing #read_title.insured# in the amount of $<cfif #read_title.loanamt_float# neq "" and #read_title.loanamt_float# neq 0 and #read_title.loanamt_float# neq 'NULL'>#NumberFormat(read_title.loanamt_float, "999,999,999.00")#<cfelse>TBD</cfif> </cfoutput>
		</td>
	</tr>
</cfif>
		<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
</table>
 <cfif read_title.pstate eq 'IN'>
<table width="100%" >
        <tr align="center" valign="top">
          <td align="left" valign="top">By virtue of I.C. 27-7-3.6, a fee of $5.00 payable to the title insurance underwriter will be collected from the purchaser of the policy for each policy issued in conjunction with any closing occurring on or after July 1, 2006.  The fee should be designated in the 1100 or 1300 series of the HUD-1 or HUD-1A Settlement Statement as TIEFF (Title Insurance Enforcement Fund Fee) charge.</td>
		  </tr>
</table>
</cfif>

<!--- ====================================================================== --->
<!--- =================[ END OF SCHEDULE C         ]======================== --->
<!--- ====================================================================== --->
	</IE:DEVICERECT>


<!--- <p style="page-break-after:always;">&nbsp;</p> --->
<IE:DEVICERECT ID="<CFOUTPUT><CFIF #read_Title.pstate# eq "CA" OR #read_Title.pstate# eq "NV">page4<CFELSE>Page3</CFIF></cfoutput>" CLASS="masterstyle" MEDIA="print">
<!--- ====================================================================== --->
<!--- =================[ BEGIN SCHEDULE B         ]======================== --->
<!--- ====================================================================== --->

<table width="100%" cellpadding=0 cellspacing=0 border=0 >
        <tr>
		  <td colspan="2" align="center" valign="middle" bgcolor="000000" height="30"><B><font color="FFFFFF" size="4">Schedule
            B-II</font></B></td>
	</tr>
	</table>
<table width="93%" cellpadding=0 cellspacing=0 border=0 >
	<tr>
		<td width="33%"><!--- ===/ This is the Title_ID from the Title Table \=== --->
						<cfoutput><NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR></td>
		<td align="Center"><NOBR>Stewart Title Guaranty Company</NOBR></td>
    <td align="right"><NOBR>Commitment Number: D-#read_Title.Title_ID#</NOBR></td></cfoutput>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
</table>
      <table width="93%" cellpadding=0 cellspacing=0 border=0>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	  <tr>
		<td colspan="2">Showing matters, which will be excepted in the Policy unless the same are disposed of to the satisfaction of the Company.</td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="2"><strong>General Exceptions:</strong></td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
        <tr>
		  <td width="5%" valign="top">1.</td>
		  <td>Defects, liens, encumbrances, adverse claims or other matters, if any, created first appearing in the public records or attaching subsequent to the effective date hereof but prior to the date the proposed insured acquires for value of record the estate or interest or mortgage thereon covered by this Commitment.</td>
		</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
        <tr>
		  <td width="5%" valign="top">2.</td>
		  <td>Taxes for the current year and any supplemental taxes that may have been assessed or to be assessed.</td>
		</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
        <tr>
		  <td width="5%" valign="top">3.</td>
		  <td>Any discrepancies, conflicts, or shortages in area or boundary lines, or any encroachments or any overlapping of improvements or other boundary or location disputes (can be eliminated or amended in mortgagee's policy upon proper evidence being furnished).</td>
		</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
        <tr>
		  <td width="5%" valign="top">4.</td>
		  <td>Restrictive covenants affecting the property described in Schedule "A."</td>
		</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
        <tr>
		  <td width="5%" valign="top">5.</td>
		  <td>Rights or claims of parties in possession, and not of record in the public records; liens for labor, services or material or claims to same which are not of record in said records.</td>
		</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
        <tr>
		  <td width="5%" valign="top">6.</td>
		  <td>Any roadway or easement, similar or dissimilar, on, under, over or across said property, or any part thereof and not of record in said records.</td>
		</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
        <tr>
		  <td width="5%" valign="top">7.</td>
		  <td>Any titles or rights asserted by anyone, including but not limited to persons, corporations, governments, or other entities, to tidelands, or lands comprising the shores or bottoms of navigable rivers, lakes, bays, ocean or gulf, or lands beyond the line of the harbor or bulkhead lines as established or changed by the United States Government or riparian rights, if any.</td>
		</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
<cfif read_title.pstate eq 'FL'>
          <tr align="left" valign="top">
            <td>8.</td>

            <td>Title to the estate or interest described in Schedule A being vested other than as stated therein;</td>
			</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>

          <tr align="left" valign="top">
            <td>9.</td>

            <td>Unmarketability of the title;</td>
			</tr>
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>

          <tr align="left" valign="top">
            <td>10.</td>

            <td>Lack of a right of access to and from the land;</td>
			</tr>
	<!--- <tr>
		  <td colspan="2">&nbsp;</td>
	</tr>

          <tr align="left" valign="top">
            <td>11.</td>

            <td>No liability is assumed for matters occurring prior to record owner becoming vested, entitled, and which affects the title by virtue of items, including, but not limited to, defects in title, liens, encumbrances, fees, charges, assessments, taxes, general or special ownership rights, marketability of title, or any defense as to matters or claims arising there from.</td>
			</tr> --->



<cfelseif read_title.searchtype NEQ 'Purchase' and read_title.pstate neq 'MI'>
<!--- <cfif read_FT_company.id neq 1920 and read_FT_company.master_co_id neq 1920>
          <tr align="left" valign="top">
            <td>8.</td>

            <td>No liability is assumed for matters occurring prior to record owner becoming vested, entitled, and which affects the title by virtue of items, including, but not limited to, defects in title, liens, encumbrances, fees, charges, assessments, taxes, general or special ownership rights, marketability of title, or any defense as to matters or claims arising there from.</td>
			</tr>
			</cfif> --->

<cfelseif read_title.pstate eq 'DC'>
          <tr align="left" valign="top">
            <td>8.</td>

            <td>Rights of tenants under the Rental Housing Conversion and Sale Act of 1980, as amended, and regulations adopted there under.</td>
			</tr>
<cfset auto_num=9>
</cfif>
<cfparam name="auto_num" default="8">
	<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
    <tr>
		  <td width="5%" valign="top"><cfoutput>#auto_num#</cfoutput>.</td>
		<td>Minerals of whatsoever kind, subsurface and surface substances, including but not limited to coal, lignite, oil, gas, uranium, clay, rock, sand and gravel in, on, under and that may be produced from the Land, together with all rights, privileges and immunities relating thereto, whether or not appearing in the Public Records or listed in Schedule B. The company makes no representation as to the present ownership of any such interests. There may be leases, grants, exceptions or reservation of interest that are not listed.<br>
<br>
The Company makes no representation as to the present ownership of any such interests.  There may be leases, grants, exceptions or reservations of interests that are not listed.<br>
</td>
	</tr>
<tr>
		  <td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		  <td colspan="2">The following matters will be excepted in Schedule "B" of the policy to be issued:</td>
	</tr>
        <tr>
		  <td width="5%" valign="top">&nbsp;</td>
		  <td></td>
		</tr>
		<tr align="left" valign="top">
            <td>1.</td>

            <td>Taxes and other public charges (including assessments by any County, Municipality, Metropolitan District or Commission) payable on an annual basis have been paid through the fiscal year<cfif read_title.title_id eq 68713> ending June 30, 2011</cfif>.  This policy does not insure against the balance of any public charges (including assessments by any County, Municipality, Metropolitan District or Commission) payable on an annual basis subsequent to the current fiscal year. Nor does this policy insure against possible future tax levies nor against possible public charges as defined above that have not been levied or assessed.</td>
			</tr>
			<tr>
		  <td width="5%" valign="top">&nbsp;</td>
		  <td></td>
		</tr>
		<tr align="left" valign="top">
            <td>2.</td>

            <td>AS TO MORTGAGEE ONLY:  This Company specifically guarantees that any past, present, or future violations of the restrictions, covenants, building setback lines, easement areas, widening strips, partition walls or other limitations and restrictions will not work a forfeiture or reverter of the title or result in a lien superior to the interest of the mortgage to be insured herein and that same have not been violated as of the date of this policy</td>
			</tr>
			<tr>
		  <td width="5%" valign="top">&nbsp;</td>
		  <td></td>
		</tr>
		<tr align="left" valign="top">
            <td>3.</td>

            <td>AS TO MORTGAGEE ONLY:  General Exceptions (l) through (7) are hereby deleted.</td>
			</tr>
			<tr>
		  <td width="5%" valign="top">&nbsp;</td>
		  <td></td>
		</tr>
		<tr align="left" valign="top">
            <td colspan=2><em>The mortgage policy when issued will include the following endorsements:</em>
<BR><BR>
<cfif read_title.opt_alta_4 eq 1>
&nbsp;&nbsp;&nbsp;&nbsp;ALTA 4 Endorsement Fee<BR>
</cfif>
<cfif read_title.opt_alta_4_1 eq 1>
&nbsp;&nbsp;&nbsp;&nbsp;ALTA 4.1 Endorsement Fee<BR>
</cfif>
<cfif read_title.opt_alta_5 eq 1>
&nbsp;&nbsp;&nbsp;&nbsp;ALTA 5 Endorsement Fee<BR>
</cfif>
<cfif read_title.opt_alta_5_1 eq 1>
&nbsp;&nbsp;&nbsp;&nbsp;ALTA 5.1 Endorsement Fee<BR>
</cfif>
<cfif read_title.opt_alta_6 eq 1>
&nbsp;&nbsp;&nbsp;&nbsp;ALTA 6 Endorsement Fee<BR>
</cfif>
<cfif read_title.opt_alta_6_1 eq 1>
&nbsp;&nbsp;&nbsp;&nbsp;ALTA 6.1 Endorsement Fee<BR>
</cfif>
<cfif read_title.opt_alta_6_2 eq 1>
&nbsp;&nbsp;&nbsp;&nbsp;ALTA 6.2 Endorsement Fee<BR>
</cfif>
<cfif read_title.opt_alta_7 eq 1>
&nbsp;&nbsp;&nbsp;&nbsp;ALTA 7 Endorsement Fee<BR>
</cfif>
<cfif read_title.opt_alta_8_1 eq 1>
&nbsp;&nbsp;&nbsp;&nbsp;ALTA 8.1 Endorsement Fee<BR>
</cfif>
<cfif read_title.opt_alta_9 eq 1>
&nbsp;&nbsp;&nbsp;&nbsp;ALTA 9 Endorsement Fee<BR>
</cfif>
<br>
</td>
			</tr>
			<cfif #read_title_data.addex# neq "">
			<cfif len(read_Title_Data.addex) GT 900>
<cfset extra_text = Mid(read_Title_Data.addex, 900, Len(read_Title_Data.addex))>
<cfset stop_number = FindNoCase(" ", read_Title_Data.addex, 900)>

<cfset stop_number = stop_number -1 >
<cfif stop_number lt 1><cfset stop_number = 0></cfif>
<cfset text_1 = Mid(read_Title_Data.addex, 1, stop_number)>
<cfset text_2 = Mid(read_Title_Data.addex, stop_number + 1, Len(read_Title_Data.addex))>
</cfif>

<cfif len(text_2) GT 2000>
<cfset temp = text_2>
<cfset extra_text = Mid(text_2, 2000, Len(text_2))>
<cfset stop_number = FindNoCase(" ", text_2, 2000)>
<cfset stop_number = stop_number -1 >
<cfif stop_number lt 1><cfset stop_number = 0></cfif>
<cfset text_2 = Mid(text_2, 1, stop_number)>
<cfset text_3 = Mid(temp, stop_number + 1, Len(temp))>
</cfif>
			<tr>
		  <td width="5%" valign="top">&nbsp;</td>
		  <td></td>
		</tr><tr>
          <td ALIGN = "CENTER" colspan="2"><p><B>ADDITIONAL EXCEPTIONS</p></B><br></td>
        </tr>
        <tr>
          <td align = "left" colspan=2><p><B><cfoutput>
		  <cfif len(read_Title_Data.addex) LTE 900>
#read_title_data.addex#
<cfelse>
#text_1#
</cfif>
		</cfoutput>
		 </b></td>
        </tr></cfif>
		 <cfif len(read_Title_Data.addex) LTE 900>
		         <tr>
          <td colspan="2">&nbsp;</td>
        </tr>

		<tr>
		  <td width="5%" valign="top">&nbsp;</td>
		  <td></td>
		</tr>
	    <tr align="right" valign="top">
          <td colspan="2"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/stewart_logo.jpg"></td>
	</tr>
	</cfif>
	</table>
<!--- ====================================================================== --->
<!--- =================[ END OF SCHEDULE B         ]======================== --->
<!--- ====================================================================== --->
	</IE:DEVICERECT>















<cfif text_2 neq ''>
<!--- <p style="page-break-after:always;">&nbsp;</p> --->
<IE:DEVICERECT ID="<CFOUTPUT><CFIF #read_Title.pstate# eq "CA" OR #read_Title.pstate# eq "NV">page4<CFELSE>Page3</CFIF></cfoutput>" CLASS="masterstyle" MEDIA="print">
<!--- ====================================================================== --->
<!--- =================[ BEGIN SCHEDULE B         ]======================== --->
<!--- ====================================================================== --->

<table width="100%" cellpadding=0 cellspacing=0 border=0 >
        <tr>
		  <td colspan="2" align="center" valign="middle" bgcolor="000000" height="30"><B><font color="FFFFFF" size="4">Schedule
            B-II</font></B></td>
	</tr>
	</table>
<table width="93%" cellpadding=0 cellspacing=0 border=0 >
	<tr>
		<td width="33%"><!--- ===/ This is the Title_ID from the Title Table \=== --->
						<cfoutput><NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR></td>
		<td align="Center"><NOBR>Stewart Title Guaranty Company</NOBR></td>
    <td align="right"><NOBR>Commitment Number: D-#read_Title.Title_ID#</NOBR></td></cfoutput>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
</table>
      <table width="93%" cellpadding=0 cellspacing=0 border=0>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>


		<tr>
          <td ALIGN = "CENTER" colspan="2"><p><B>ADDITIONAL EXCEPTIONS (CONT'D)</p></B><br></td>
        </tr>
        <tr>
          <td align = "left" colspan=2><p><B><cfoutput>
#text_2#
		</cfoutput>
		 </b></td>
        </tr>
 <cfif len(text_2) LTE 850>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
		<tr>
		  <td width="5%" valign="top">&nbsp;</td>
		  <td></td>
		</tr>
	    <tr align="right" valign="top">
          <td colspan="2"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/stewart_logo.jpg"></td>
	</tr>
	</cfif>
	</table>


<!--- ====================================================================== --->
<!--- =================[ END OF SCHEDULE B         ]======================== --->
<!--- ====================================================================== --->
	</IE:DEVICERECT>
</cfif>

<cfif text_3 neq ''>
<!--- <p style="page-break-after:always;">&nbsp;</p> --->
<IE:DEVICERECT ID="<CFOUTPUT><CFIF #read_Title.pstate# eq "CA" OR #read_Title.pstate# eq "NV">page5<CFELSE>Page6</CFIF></cfoutput>" CLASS="masterstyle" MEDIA="print">
<!--- ====================================================================== --->
<!--- =================[ BEGIN SCHEDULE B         ]======================== --->
<!--- ====================================================================== --->

<table width="100%" cellpadding=0 cellspacing=0 border=0 >
        <tr>
		  <td colspan="2" align="center" valign="middle" bgcolor="000000" height="30"><B><font color="FFFFFF" size="4">Schedule
            B-II</font></B></td>
	</tr>
	</table>
<table width="93%" cellpadding=0 cellspacing=0 border=0 >
	<tr>
		<td width="33%"><!--- ===/ This is the Title_ID from the Title Table \=== --->
						<cfoutput><NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR></td>
		<td align="Center"><NOBR>Stewart Title Guaranty Company</NOBR></td>
    <td align="right"><NOBR>Commitment Number: D-#read_Title.Title_ID#</NOBR></td></cfoutput>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
</table>
      <table width="93%" cellpadding=0 cellspacing=0 border=0>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>


		<tr>
          <td ALIGN = "CENTER" colspan="2"><p><B>ADDITIONAL EXCEPTIONS (CONT'D)</p></B><br></td>
        </tr>
        <tr>
          <td align = "left" colspan=2><p><B><cfoutput>
#text_3#
		</cfoutput>
		 </b></td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
		<tr>
		  <td width="5%" valign="top">&nbsp;</td>
		  <td></td>
		</tr>
	    <tr align="right" valign="top">
          <td colspan="2"><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/stewart_logo.jpg"></td>
	</tr>
	</table>


<!--- ====================================================================== --->
<!--- =================[ END OF SCHEDULE B         ]======================== --->
<!--- ====================================================================== --->
	</IE:DEVICERECT>
</cfif>





<!--- <p style="page-break-after:always;">&nbsp;</p> --->
<IE:DEVICERECT ID="<CFOUTPUT><CFIF #read_Title.pstate# eq "CA" OR #read_Title.pstate# eq "NV">page6<CFELSE>Page5</CFIF></cfoutput>" CLASS="masterstyle" MEDIA="print">
	    <table width="100%" cellpadding=0 cellspacing=0 border=0 >

	    <tr>
		  <td colspan="2" align="center" valign="middle" bgcolor="000000" height="30"><B><font color="FFFFFF" size="4">Exhibit A
           </font></B></td>
	</tr>
	</table>
	   <table width="93%" cellpadding=0 cellspacing=0 border=0 >
	   <tr>
          <td width="33%">
         <cfoutput>   <!--- ===/ This is the Title_ID from the Title Table \=== --->
            <NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR></td>
            <td align="Center"><!--- <NOBR>Stewart Title Guaranty Company</NOBR> --->&nbsp;</td>
          <td align="right"><NOBR>Commitment Number: D-#read_Title.Title_ID#</NOBR></td></cfoutput>
        </tr>
	   <tr>
          <td COLSPAN = 3><p>&nbsp;</p></td>
        </tr>
        <tr>
          <td colspan = 3 align = "center"><p>
		                <B><U>WIRING INFORMATION</U></B>
		                <br><br>

<cfinclude template="title_committment_wire_instructions.cfm">


		  </td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr align="right" valign="top">
          <td COLSPAN = 2><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/stewart_logo.jpg"></td>
        </tr>
      </table>
	</IE:DEVICERECT>




<!--- <p style="page-break-after:always;">&nbsp;</p> --->
<IE:DEVICERECT ID="<CFOUTPUT><CFIF #read_Title.pstate# eq "CA" OR #read_Title.pstate# eq "NV">page6<CFELSE>Page5</CFIF></cfoutput>" CLASS="masterstyle" MEDIA="print">
	    <table width="100%" cellpadding=0 cellspacing=0 border=0 >

	    <tr>
		  <td colspan="2" align="center" valign="middle" bgcolor="000000" height="30"><B><font color="FFFFFF" size="4">&nbsp;</font></B></td>
	</tr>
	</table>
	   <table width="93%" cellpadding=0 cellspacing=0 border=0 >
	   <tr>
          <td width="33%">
         <cfoutput>   <!--- ===/ This is the Title_ID from the Title Table \=== --->
            <NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR></td>
            <td align="Center"><!--- <NOBR>Stewart Title Guaranty Company</NOBR> --->&nbsp;</td>
          <td align="right"><NOBR>Commitment Number: D-#read_Title.Title_ID#</NOBR></td></cfoutput>
        </tr>
	   <tr>
          <td COLSPAN = 3><p>&nbsp;</p></td>
        </tr>
        <tr>
          <td colspan = 3 align = "center"><p>
		                <B><U>TAX INFORMATION</U></B>
		                <br><br>

<cfinclude template="title_committment_tax_box_stewart.cfm">


		  </td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
      </table>
	</IE:DEVICERECT>



<!--- this next bit is the ICL to be included with all Chase/Stewart files --->
<CFQUERY datasource="#request.dsn#" NAME="check_states">
SELECT     title_co_id
FROM         Title_Companies_States
WHERE     (st_abbrev = '#read_title.pstate#')
</CFQUERY>

<cfif (read_FT_Company.attach_icl eq 'True' or (read_ft_company.ID eq 3889 and read_title.insured contains "Anderson Financial Group")) and check_states.title_co_id neq "19" and read_title.pstate neq "NY"  and read_title.pstate neq "MA"  and read_title.pstate neq "GA"  and read_title.pstate neq "WV"  and read_title.pstate neq "NC">
<cfif read_title.pstate eq 'VA' and read_title.searchType eq 'Purchase'>
<font size="-1">
<!--- <cfinclude template="icl_VA_purch_1.cfm"> --->
</font>
<cfelse>
<font size="-1">
<!--- <cfinclude template="icl_default_1.cfm"> --->
</font>
</cfif>
</cfif>















<!--- ====================================================================== --->
<!--- =================[ END OF SCHEDULE C         ]======================== --->
<!--- ====================================================================== --->
<!--- end body table --->
</td></tr></table><DIV ID="devicecontainer">
<!-- Pages created on the fly go here. -->


<cfif (read_FT_Company.attach_icl eq 'True' or (read_ft_company.ID eq 3889 and read_title.insured contains "Anderson Financial Group")) and check_states.title_co_id neq "19" and read_title.pstate neq "NY"  and read_title.pstate neq "MA"  and read_title.pstate neq "GA"  and read_title.pstate neq "WV"  and read_title.pstate neq "NC">
<!--- <p style="page-break-after:always;">&nbsp;</p> --->
<cfif read_title.pstate eq 'VA' and read_title.searchType eq 'Purchase'>
<font size="-1">
<!--- <cfinclude template="icl_VA_purch_2.cfm"> --->
</font>
<cfelse>
<font size="-1">
<!--- <cfinclude template="icl_default_2.cfm"> --->
</font>
</cfif>
</cfif>
</div></div></div></div></div></div></div></tr></tr></tr></tr></tr></tr></tr></tr></tr>
</table></table></table></table></table></table></table></table></table>


<cfif read_FT_Company.attach_eando eq 'True'>
<cfinclude template="eando.cfm">
</cfif>




<cfif read_Title.pstate eq "PA">

<!--- <p style="page-break-after:always;">&nbsp;</p> --->
<IE:DEVICERECT ID="<CFOUTPUT>Page8</cfoutput>" CLASS="masterstyle" MEDIA="print">
	    <table width="100%" cellpadding=0 cellspacing=0 border=0 >

	    <tr>
		  <td colspan="2" align="center" valign="middle" bgcolor="000000" height="30"><B><font color="FFFFFF" size="4">&nbsp;</font></B></td>
	</tr>
	</table>
	   <table width="93%" cellpadding=0 cellspacing=0 border=0 >
	   <tr>
          <td width="33%">
         <cfoutput>   <!--- ===/ This is the Title_ID from the Title Table \=== --->
            <NOBR>Order Number: <B>#read_Title.Title_ID#</B></NOBR></td>
            <td align="Center"><NOBR>Stewart Title Guaranty Company</NOBR></td>
          <td align="right"><NOBR>Commitment Number: D-#read_Title.Title_ID#</NOBR></td></cfoutput>
        </tr>
	   <tr>
          <td COLSPAN = 3><p>&nbsp;</p></td>
        </tr>
        <tr>
          <td colspan = 3 align = "left">


	<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/stewart_icl.jpg"><BR>


<table width="90%" style="font-family:Arial, Helvetica, sans-serif; font-size:13px;">
<tr>
<td align="left" valign="top" width-"60%">&nbsp;</td>
<td align="left" valign="top" width-"40%">&nbsp;
</td>
</tr>

<tr>
<td align="left" valign="top" colspan="2">
<blockquote>Dear Applicant:<BR><BR>

Please be advised that the Notice set forth below is intended for the consumer(s)/party(ies) who will be financially responsible for any additional closing service fee in connection with the real estate closing. If you are not that person or party, please forward a copy of the Notice to the consumer(s)/party(ies) who may be affected. Thank you.<BR><BR>

<div align="center">NOTICE</div><BR><BR>

The title insurance fee includes the cost of the closing on the insured real estate property if it takes place during regular business hours and at the office of the title insurance agent or underwriter.<BR><BR>

If your closing takes place at another location or a time of your choosing, or that of your attorney, lender or realtor, the title insurance agent or underwriter may impose an additional charge for this special service. You may determine the amount of this additional charge, if any, by calling the title insurances representative at:<BR><BR>

Pam Gibbons<BR>
<cfif read_FT_company.streamline_client eq 1>
Streamline Title & Escrow<br>
<cfelse>
First Title & Escrow<BR>
</cfif>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
7361 Calhoun Place Suite 200
<BR>
Rockville, MD 20850<BR>
301-279-0303<BR>
<BR><BR>
<cfelse>
7361 Calhoun Place, Suite 200<BR>
Rockville, MD 20855<BR>
301-279-0303<BR>
<BR><BR>
</cfif>
<BR><BR>
	</blockquote>



		  </td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr align="right" valign="top">
          <td COLSPAN = 2><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/stewart_logo.jpg"></td>
        </tr>
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