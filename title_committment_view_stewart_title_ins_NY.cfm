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
<CFQUERY datasource="#request.dsn#" NAME="check_if_richmond_office">
SELECT *
FROM First_admin where id = #read_FT_company.intSales#
</cfquery>			
<cfset this_email = 'loandocs@firsttitleservices.com'>
<cfif check_if_richmond_office.va_employee eq 'True'>
<cfset this_email = 'richmond@firsttitleservices.com'>
<cfelseif read_FT_company.streamline_client eq 'True'>
<cfset this_email = 'loandocs@streamline-title.com'>
<cfelseif read_FT_company.company contains 'Chase/RealEC'>
<cfset this_email = 'ChaseTeam@firsttitleservices.com'>
<cfelseif read_FT_company.company contains 'Chase'>
<cfset this_email = 'chase@firsttitleservices.com'>
<cfelseif read_FT_company.company contains 'Flagstar'>
<cfset this_email = 'flagstar@firsttitleservices.com'>
<cfelseif read_FT_company.ID eq 3943 or read_FT_company.ID eq 4042 or read_FT_company.ID eq 4043>
<cfset this_email = 'vdocs@firsttitleservices.com'>
</cfif> 

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
codebase="https://machine1.firsttitleservices.com/smsx.exe">
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
 <span style="font-size:12px; font-family:Arial, Helvetica, sans-serif; color:red">If the buttons below are 'grayed-out', please click <a href="https://machine1.firsttitleservices.com/smsx.exe">HERE</a> to download and install ScriptX, this will allow you to print the HUD-1 and the Title Commitment</span>

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
<td align="center" valign="top" colspan="5"><cfif NOT DateDiff("d", Now(), "1/30/2012")><strong><font size=4>FIRST TITLE & ESCROW</font></strong><BR>
7361 Calhoun Place Suite 200

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

<td align="center" valign="top" colspan="5"><strong><font size=4>STREAMLINE TITLE & ESCROW</font></strong><BR>
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


		<cfif #read_comp.id# eq "729">
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


<!---Harry Travis 11/23/2004
Adding a very special letter if this is California or Nevada --->
<CFIF #read_Title.pstate# eq "CA" >
<!--- <p style="page-break-after:always;">&nbsp;</p> --->
<IE:DEVICERECT ID="page1" CLASS="masterstyle" MEDIA="print">
<table width="93%" cellpadding=0 cellspacing=0 border=0 >
    <TR>
        <td><BR></td>
    </tr>
    <tr>
        <td>
            <B>First Title & Escrow</B></Center>
        </td>
    </tr><cfif NOT DateDiff("d", Now(), "1/30/2012")>
    <tr>
        <td>
            <B>7361 Calhoun Place Suite 200
</B></Center>
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
            commitment is issued through Stewart Title Guaranty Company.
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
</IE:DEVICERECT>
</CFIF>
<!---End of Very Special Letter--->


<!--- <cfif (read_title.comp_id eq 3182  or read_title.comp_id eq 2368 or ListContainsNoCase(children, read_title.comp_id, ",")) and Not GetBaseTemplatePath() contains 'rosicki_form.cfm' and read_rosicki.recordcount and read_title.comp_id neq 3444>
<cfinclude template="admin_area/rosicki_stewart_form_display.cfm">
</cfif>
<cfif (read_title.comp_id eq 3251 or read_title.comp_id eq 3444) and Not GetBaseTemplatePath() contains 'keystone_form.cfm' and read_keystone.recordcount>
<cfinclude template="admin_area/keystone_stewart_form_display.cfm">
</cfif> --->




<IE:DEVICERECT ID="<CFOUTPUT><CFIF #read_Title.pstate# eq "CA" OR #read_Title.pstate# eq "NV">page2<CFELSE>Page1</CFIF></cfoutput>" CLASS="masterstyle" MEDIA="print">

<!----1st page starts ----->
<!----------body table starts---------->
<!--- <table width=98% cellpadding=0 cellspacing=0 border=2 align="center" bordercolor="000000" bordercolordark="000000" bordercolorlight="000000">
<tr><td valign="top" align="center">
====================================================================== --->
<!--- =================[ BEGIN SCHEDULE A         ]======================== --->
<!--- ====================================================================== --->



<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10pt}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18pt}
.small_header {font-family:"Times New Roman", Times, serif; font-size:10pt}
.medium_header {font-family:"Times New Roman", Times, serif; font-size:14pt}
</style>
<center>
<span class="small_header">CERTIFICATE OF TITLE ISSUED BY</span><BR>
<span class="big_header"><strong>S T E W A R T &nbsp; T I T L E</strong></span><br>
<span class="medium_header">I N S U R A N C E  &nbsp; C O M P A N Y </span><br>
<br>


	<table align="center" width=600> 
		<tr width="80%" >
			<td>
			<blockquote>
			Certifies to the proposed insured named in Schedule A that an Examination of title to the premises 
			described in Schedule A has been made in accordance with its usual procedure and agrees to issue its 
			standard form of title insurance policy in favor of the proposed insured, covering premises described 
			in Schedule A, in the amounts hereinafter set forth, insuring the fee and/or mortgage and the 
			marketability thereof, after the closing of the transaction in conformance with procedures approved by 
			the Company excepting (a) all loss or damage by reason of the estates, interests, defects, objections, 
			liens, encumbrances and other matters set forth herein that are not disposed of to the satisfaction of the 
			Company prior to such closing or issuance of the policy (b) any question or objection coming to the 
			attention of the Company before the date of closing, or if there be no closing, before the issuance of 
			said policy.
<br>
<br>
<br>
<br>

					This Certificate shall be null and void (1) if the fees therefor are not paid (2) if the prospective insured,
					 his attorney or agent makes any untrue statement with respect to any material fact or suppresses
					 or fails to disclose any material fact or if any untrue answers are given to material inquiries by or on 
					 behalf of the Company (3) upon delivery of the policy.  Any claim arising by reason of the issuance 
					 hereof shall be restricted to the terms and conditions of the standard form of insurance policy.  If title,
					  interest or lien to be insured was acquired by the prospective insured prior to delivery hereof, the 
					  Company assumes no liability except under its policy when issued.
</blockquote>
</td>		
		</tr>

		<tr width="80%" align="left">
			<td align="center" width="445"><br>
<br>
<br>
				<img src="http://<cfoutput>#cgi.server_name#</cfoutput>/images/stewart_NY_sigs.jpg">
			</td>		
		</tr>		
	</table>
	<center>
	<table width="80" cellspacing=0 cellpadding=1 bgcolor="#000000">
<tr><td>
<table width="78" cellpadding=1 cellspacing=1 bgcolor="#ffffff">
<tr><td align="center"><cfoutput>T-#read_title.title_id#</cfoutput></td></tr></table></td></tr></table>
</CENTER>


<hr>

<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10pt}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18pt}
.small_header {font-family:"Times New Roman", Times, serif; font-size:12pt}
.medium_header {font-family:"Times New Roman", Times, serif; font-size:14pt}
</style>

<table width="100%" cellpadding=0 cellspacing=0 border=0>
    <tr>
          <td>
<center>
<span class="big_header"><strong>S T E W A R T &nbsp; T I T L E</strong></span><br>
<span class="medium_header">I N S U R A N C E  &nbsp; C O M P A N Y </span></center>
</td>
</tr>
</table>

<body style="background-color: #FFFFFF; font-family:Arial, Helvetica, sans-serif; font-size:9pt" >
<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:9pt}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18pt}
.small_header {font-family:"Times New Roman", Times, serif; font-size:12pt}
.medium_header {font-family:"Times New Roman", Times, serif; font-size:14pt}
</style>
<cfoutput>

		<table width="93%" cellpadding=1 cellspacing=1 border=0 >
			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">&nbsp;</td>
				<td width="50%" align="Right" valign="top">Title No:</td>
				<td width="13%">T-#read_title.title_id#</td>
			</tr>
			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">&nbsp;</td>
				<td width="50%" align="Right" valign="top">Effective Date:    </td>
				<td width="13%">#DateFormat(read_deed_info.data37, "mm/dd/yyyy")#</td>
			</tr>
			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%"><strong><U>Proposed Insured:</U></strong></td>
				<td width="60%" align="Right" valign="top">Redated: </td>
				<td width="13%"> _____________</td>
			</tr>		
			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">&nbsp;</strong></td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>	
			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">&nbsp;</strong></td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>			
			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">Borrower/Purchaser: <cfif Len(read_title.blastname1)>, #read_title.bfirstname1# #read_title.blastname1# <cfif Len(read_title.blastname2)>, #read_title.bfirstname2# #read_title.blastname2# </cfif><cfif Len(read_title.blastname3)>, #read_title.bfirstname3# #read_title.blastname3# </cfif><cfif Len(read_title.blastname4)>, #read_title.bfirstname4# #read_title.blastname4# </cfif><cfelse>TBD</cfif></td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>	
			
			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">&nbsp;</td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>	
			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">&nbsp;</td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>	
			<tr>
				<td width="2%">&nbsp;</td>

				<td width="25%">Mortgagee: #read_title.insured#</td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>			
			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">&nbsp;</td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>	
			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">&nbsp;</td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>			
			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%"><strong><U>Amount of Insurance:</U></strong> $<B> <cfif #read_title.loanamt_float# neq "" and #read_title.loanamt_float# neq 0 and #read_title.loanamt_float# neq 'NULL'>#NumberFormat(read_title.loanamt_float, "999,999,999.00")#<cfelse>TBD</cfif></B></td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>		
			
			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">&nbsp;</td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>	
			<tr>
				<td width="17%">&nbsp;</td>
				<td width="55%">Fee:</td>
				<td width="15%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>	
			
			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">&nbsp;</td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>	
			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">&nbsp;</td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>	
			<tr>
				<td width="2%">&nbsp;</td>
				<td width="40%">Mortage:</td>
				<td width="15%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>	
			
			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">&nbsp;</td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>
			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">&nbsp;</td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>
			

			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">&nbsp;</td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>
			<tr>
				<td width="2%">&nbsp;</td>
				<td colspan="3"><i><strong>THIS COMPANY CERTIFIES </strong>that a good and marketable title to the premises described <br>
				in Schedule A, Description (subject to the liens, encumbrances and other matters, if any, set forth in<br>
			 	this certificate) may be conveyed and/or mortgaged by:</i>
				</td>
			</tr>			

			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">&nbsp;</td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>			
			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%"><strong><U>TITLE VESTED IN:</U></strong></td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>	
			
			<tr>
				<td width="2%">&nbsp;</td>
				<td colspan="3"><cfif read_title.vesting_override neq '' and read_title.vesting_override neq 'NULL'>#read_title.vesting_override#<cfelse>
<cfif read_title.title_id eq 52901>Elizabeth Warren<cfelseif read_title.title_id eq 52914>Julie Konik<cfelseif read_title.title_id eq 44863>Emilio R. Limchoa and Imelda T. Limchoa<cfelseif read_title.title_id eq 52794>The Village Cooperative Homes<cfelseif read_title.title_id eq 44894>Kindra McLeroy Pack, Barbara A. McLeroy and Wayne McLeroy by Barbara A. McLeroy, his heir.<cfelseif read_title.title_id eq 59179>Chang-Tai Hsieh and Sally Jo Hsieh<cfelseif read_title.title_id eq 57411>ALEXANDER MAKRIS<cfelseif read_title.comp_id eq 3943 or read_title.comp_id eq 4043 or read_title.comp_id eq 4042>#read_title.full_vesting#<cfelse>#read_title_data.data3#<cfif #read_title_data.data4# neq "">&nbsp;AND&nbsp;#read_title_data.data4#</cfif><cfif #read_title_data.data6# neq "">,&nbsp;#read_title_data.DATA6#</b></font></cfif></cfif>
</cfif></td>
			</tr>

			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">&nbsp;</td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>
						
			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">Premises described herein are known as: </td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>
			 			
			<tr>
				<td width="2%">&nbsp;</td>
				<td colspan="2">#read_title.paddress#, #read_title.pcity#, #read_title.pstate# #read_title.pzip# </td>
				<td width="13%">&nbsp;</td>
			</tr>

			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">&nbsp;</td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>			
			
			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">County: #read_title.pcounty#</td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>

			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">Town/City: #read_title.pcity#</td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>
			
			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">Incorporated Village: </td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>
			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">District: #read_deed_info.district#</td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>

			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">Section: #read_deed_info.section#</td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>
			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">Block: #read_deed_info.block#</td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>

			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">Lot: #read_deed_info.lot#</td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>

			<tr>
				<td width="2%">&nbsp;</td>
				<td width="25%">&nbsp;</td>
				<td width="60%">&nbsp;</td>
				<td width="13%">&nbsp;</td>
			</tr>	
			<tr>
				<td width="2%">&nbsp;</td>
				<td colspan="3"><i><strong>Any questions regarding this report, please contact : #this_email#</strong></i>
				</td>
			</tr>	
		</table>
</cfoutput>

<hr>

<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10pt}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18pt}
.small_header {font-family:"Times New Roman", Times, serif; font-size:12pt}
.medium_header {font-family:"Times New Roman", Times, serif; font-size:14pt}
</style>

<table width="100%" cellpadding=0 cellspacing=0 border=0>
    <tr>
          <td>
<center>
<span class="big_header"><strong>S T E W A R T &nbsp; T I T L E</strong></span><br>
<span class="medium_header">I N S U R A N C E  &nbsp; C O M P A N Y </span></center>
</td>
</tr>
</table>

<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:9pt}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18pt}
.small_header {font-family:"Times New Roman", Times, serif; font-size:12pt}
.medium_header {font-family:"Times New Roman", Times, serif; font-size:14pt}
</style>
<cfoutput>

		<table width="93%" cellpadding=1 cellspacing=1 border=0 >
			<tr>
				<td width="40%" valign="top">Title No: T-#read_title.title_id#</td>
				<td width="53%" align="Right" valign="top">&nbsp;  </td>
			</tr>
		</table>
<br>
<br>
<br>
		<table width="93%" cellpadding=1 cellspacing=1 border=0 >
			<tr>
				<td colspan="4" align="center" valign="top"><span class="small_header"><strong>Schedule A Description</strong></span></td>
			</tr>
		</table>
<br>

		<table width="93%" cellpadding=1 cellspacing=1 border=0 >
			<tr>
				<td align="left" valign="top">
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

			<!---(start) -- Added by Synechron Development for ticket# 454 Dt. 11-27-2013-------->
			<cfif  #len(read_title_data.data7)# gt 0 AND #len(read_title_data.data8)# gt 0 > ,</cfif>
			<cfif #len(read_title_data.data8)# gt 0 AND #len(read_title_data.data9)# gt 0 >
			in Book #read_title_data.data8# at Page #read_title_data.data9# 
			</cfif>	   
			<!---(end) -- Added by Synechron Development for ticket# 454 ------->  
		</cfif>
		</cfif>
		<br><br>

#read_title_data.data14#<br><br>
</td>
			</tr>
		</table>
		
		
</cfoutput>


<hr>



<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10pt}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18pt}
.small_header {font-family:"Times New Roman", Times, serif; font-size:12pt}
.medium_header {font-family:"Times New Roman", Times, serif; font-size:14pt}
</style>

<table width="100%" cellpadding=0 cellspacing=0 border=0>
    <tr>
          <td>
<center>
<span class="big_header"><strong>S T E W A R T &nbsp; T I T L E</strong></span><br>
<span class="medium_header">I N S U R A N C E  &nbsp; C O M P A N Y </span></center>
</td>
</tr>
</table>

<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:9pt}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18pt}
.small_header {font-family:"Times New Roman", Times, serif; font-size:12pt}
.medium_header {font-family:"Times New Roman", Times, serif; font-size:14pt}
</style>
<cfoutput>

		<table width="93%" cellpadding=1 cellspacing=1 border=0 >
			<tr>
				<td width="40%" valign="top">Title No: T-#read_title.title_id#</td>
				<td width="53%" align="Right" valign="top">&nbsp;  </td>
			</tr>
		</table>
<br>
<br>
<br>
		<table width="93%" cellpadding=1 cellspacing=1 border=0 >
			<tr>
				<td colspan="4" align="center" valign="top"><span class="small_header"><strong>Schedule B</strong></span></td>
			</tr>
		</table>
</cfoutput>
<br>
		<table width="93%" cellpadding=1 cellspacing=1 border=0 >
			<tr>
				<td align="left" valign="top">
Hereinafter set forth are additional matters which will appear in the policy as exceptions from coverage, unless disposed of to our satisfaction prior to the closing or delivery of the policy.<BR><BR>


<strong>DISPOSITION</strong><BR><BR>
 
<OL>
<li>Rights of tenants or parties in possession, if any.</li><BR><BR>
<li>Taxes, tax liens, tax sales, water rates, sewer rents and assessments set forth in schedule herein.</li><BR><BR>
<li>Mortgage(s) () held by: SEE ATTACHED MORTGAGE SCHEDULE</li><BR><BR>
<li>Covenants, conditions, easements, leases, agreements of record as follows:</li><BR><BR>

<CFQUERY datasource="#request.dsn#" NAME="read_lien">
select * from title_ins_view
WHERE title_id = #url.rec_ID# and selectedOrgs3 is not NULL
order by selectedOrgs3
</cfquery>
<cfif read_lien.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>

<cfoutput query = "read_lien">
<li><cfif #read_lien.data7# NEQ "">
			<cfif #read_lien.lienintro# NEQ "UCC Financing Statement" >#read_lien.lienintro# Judgment <cfelse>#read_lien.lienintro#</cfif> against #read_lien.data7# in favor of #read_lien.data6# in the amount of #read_lien.data5#,
			  dated #DateFormat(read_lien.data4, "mm")#/#DateFormat(read_lien.data4, "dd")#/#DateFormat(read_lien.data4, "yyyy")#
			  and recorded #DateFormat(read_lien.data9, "mm")#/#DateFormat(read_lien.data9, "dd")#/#DateFormat(read_lien.data9, "yyyy")#,
			  <cfif #read_lien.data1# eq "">
			  	 in Book #read_lien.data2# at Page #read_lien.data3# 
			  <cfelse>
			  	 in Document #read_lien.data1# <!---in Book #read_lien.data2# at Page #read_lien.data3#--->
				<!---(start) -- Added by Synechron Development for ticket# 454 Dt. 11-27-2013-------->
				<cfif  #len(read_lien.data1)# gt 0 AND #len(read_lien.data2)# gt 0 > ,</cfif>
				<cfif #len(read_lien.data2)# gt 0 AND #len(read_lien.data3)# gt 0 >
				in Book #read_lien.data2# at Page #read_lien.data3# 
				</cfif>	   
				<!---(end) -- Added by Synechron Development for ticket# 454 ------->  
			  </cfif>
			  #read_lien.data8#</cfif></li><BR><BR>
</cfoutput>

<cfif read_title_data.addreq neq '' and read_title_data.addreq neq 'NULL'>
<li><cfoutput>#read_title_data.addreq#</cfoutput></li><BR><BR>
</cfif>


<cfif read_title_data.addex neq '' and read_title_data.addex neq 'NULL'>
<li><cfoutput>#read_title_data.addex#</cfoutput></li><BR><BR>
</cfif>

</OL>
</td>
			</tr>
		</table>
		
		

<hr>


<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10pt}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18pt}
.small_header {font-family:"Times New Roman", Times, serif; font-size:12pt}
.medium_header {font-family:"Times New Roman", Times, serif; font-size:14pt}
</style>

<table width="100%" cellpadding=0 cellspacing=0 border=0>
    <tr>
          <td>
<center>
<span class="big_header"><strong>S T E W A R T &nbsp; T I T L E</strong></span><br>
<span class="medium_header">I N S U R A N C E  &nbsp; C O M P A N Y </span></center>
</td>
</tr>
</table>

<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:9pt}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18pt}
.small_header {font-family:"Times New Roman", Times, serif; font-size:12pt}
.medium_header {font-family:"Times New Roman", Times, serif; font-size:14pt}
</style>
<cfoutput>

		<table width="93%" cellpadding=1 cellspacing=1 border=0 >
			<tr>
				<td width="40%" valign="top">Title No: T-#read_title.title_id#</td>
				<td width="53%" align="Right" valign="top">&nbsp;  </td>
			</tr>
		</table>
<br>
<br>
<br>

		<table width="93%" cellpadding=1 cellspacing=1 border=0 >
			<tr>
				<td colspan="4" align="center" valign="top"><span class="small_header"><strong>Mortgage Schedule</strong></span></td>
			</tr>
		</table>
</cfoutput>
<br>

		<table width="93%" cellpadding=1 cellspacing=1 border=0 >
			<tr>
				<td align="left" valign="top">



<CFQUERY datasource="#request.dsn#" NAME="read_mortgage">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 is NOT NULL
			order by selectedOrgs4
		</cfquery>
<cfif read_mortgage.recordcount GT 0>
<cfset mortgages_liens = 1>
</cfif>
<ol>
<cfoutput query = "read_mortgage">
<li><cfif #read_mortgage.data1# NEQ ""> <cfif read_mortgage.lienintro neq "" and read_mortgage.lienintro neq 'NULL' or Len(read_mortgage.lienintro) eq 0>#read_mortgage.lienintro#<cfelse>Satisfaction and/or release of</cfif> Mortgage from #read_mortgage.data2# <cfif #read_mortgage.data3# neq ""> and #read_mortgage.data3#</cfif> securing #read_mortgage.data1# in the original principal amount of #read_mortgage.data4#, as dated #DateFormat(read_mortgage.data8, "mm")#/#DateFormat(read_mortgage.data8, "dd")#/#DateFormat(read_mortgage.data8, "yyyy")# and recorded on #DateFormat(read_mortgage.data9, "mm")#/#DateFormat(read_mortgage.data9, "dd")#/#DateFormat(read_mortgage.data9, "yyyy")# among the Land Records of #read_title.pcounty# County, <cfif #read_mortgage.data5# eq ""><cfif #read_mortgage.data6# neq "">in Book #read_mortgage.data6# at Page #read_mortgage.data7# </cfif>
<cfelse> 
	in Document Number #read_mortgage.data5# 

	<!---(start) -- Added by Synechron Development for ticket# 454 Dt. 11-27-2013-------->
	<cfif  #len(read_mortgage.data5)# gt 0 AND #len(read_mortgage.data6)# gt 0 > ,</cfif>
	<cfif #len(read_mortgage.data6)# gt 0 AND #len(read_mortgage.data7)# gt 0 >
	in Book #read_mortgage.data6# at Page #read_mortgage.data7# 
	</cfif>	   
	<!---(end) -- Added by Synechron Development for ticket# 454 ------->  



</cfif>
<cfif #read_mortgage.data13# neq ""> Assigned to #read_mortgage.data13# recorded on #DateFormat(read_mortgage.data17, "mm")#/#DateFormat(read_mortgage.data17, "dd")#/#DateFormat(read_mortgage.data17, "yyyy")#, in Book 
	<cfif #read_mortgage.data14# eq "">
		#read_mortgage.data15#, at Page #read_mortgage.data16# 
	<cfelse>
		 in Document #read_mortgage.data14#
		<!---(start) -- Added by Synechron Development for ticket# 454 Dt. 11-27-2013-------->
		<cfif  #len(read_mortgage.data14)# gt 0 AND #len(read_mortgage.data15)# gt 0 > ,</cfif>
		<cfif #len(read_mortgage.data15)# gt 0 AND #len(read_mortgage.data16)# gt 0 >
		in Book #read_mortgage.data15# at Page #read_mortgage.data16# 
		</cfif>	   
		<!---(end) -- Added by Synechron Development for ticket# 454 ------->  

	</cfif> 
</cfif>
<cfif #read_mortgage.data18# neq "">Assigned to #read_mortgage.data18# recorded on #DateFormat(read_mortgage.data22, "mm")#/#DateFormat(read_mortgage.data22, "dd")#/#DateFormat(read_mortgage.data22, "yyyy")#, 
	<cfif #read_mortgage.data19# eq "">
		in Book #read_mortgage.data20#, at Page #read_mortgage.data21# 
	<cfelse> 
		in Document #read_mortgage.data19# <!---in Book #read_mortgage.data20#, at Page #read_mortgage.data21#--->

		<!---(start) -- Added by Synechron Development for ticket# 454 Dt. 11-27-2013-------->
		<cfif  #len(read_mortgage.data19)# gt 0 AND #len(read_mortgage.data20)# gt 0 > ,</cfif>
		<cfif #len(read_mortgage.data20)# gt 0 AND #len(read_mortgage.data21)# gt 0 >
		in Book #read_mortgage.data20# at Page #read_mortgage.data21# 
		</cfif>	   
		<!---(end) -- Added by Synechron Development for ticket# 454 ------->  
	</cfif> 
</cfif>
<cfif #read_mortgage.data23# neq "">Assigned to #read_mortgage.data23# recorded on #DateFormat(read_mortgage.data27, "mm")#/#DateFormat(read_mortgage.data27, "dd")#/#DateFormat(read_mortgage.data27, "yyyy")#, 
	<cfif #read_mortgage.data24# eq ""> 
		in Book #read_mortgage.data25#, at Page #read_mortgage.data26# 
	<cfelse> 
		in Document #read_mortgage.data24#<!--- in Book #read_mortgage.data25#, at Page #read_mortgage.data26#--->
		<!---(start) -- Added by Synechron Development for ticket# 454 Dt. 11-27-2013-------->
		<cfif  #len(read_mortgage.data24)# gt 0 AND #len(read_mortgage.data25)# gt 0 > ,</cfif>
		<cfif #len(read_mortgage.data25)# gt 0 AND #len(read_mortgage.data26)# gt 0 >
		in Book #read_mortgage.data25# at Page #read_mortgage.data26# 
		</cfif>	   
		<!---(end) -- Added by Synechron Development for ticket# 454 ------->  
	</cfif> 
</cfif><cfif #read_mortgage.data28# neq "">Assigned to #read_mortgage.data28# recorded on #DateFormat(read_mortgage.data32, "mm")#/#DateFormat(read_mortgage.data32, "dd")#/#DateFormat(read_mortgage.data32, "yyyy")#, 
	<cfif #read_mortgage.data29# EQ "">
		 in Book #read_mortgage.data30#, at Page #read_mortgage.data31# 
	<cfelse>
		 in Document #read_mortgage.data29# in Book #read_mortgage.data30#, at Page #read_mortgage.data31#
		<!---(start) -- Added by Synechron Development for ticket# 454 Dt. 11-27-2013-------->
		<cfif  #len(read_mortgage.data29)# gt 0 AND #len(read_mortgage.data30)# gt 0 > ,</cfif>
		<cfif #len(read_mortgage.data30)# gt 0 AND #len(read_mortgage.data31)# gt 0 >
		in Book #read_mortgage.data30# at Page #read_mortgage.data31# 
		</cfif>	   
		<!---(end) -- Added by Synechron Development for ticket# 454 ------->  
	</cfif> 
</cfif><cfif #read_mortgage.data11# neq "">#read_mortgage.data11#</cfif> <cfif #read_mortgage.data12# neq "">#read_mortgage.data12#</cfif></cfif></li><BR><BR>
</cfoutput>

<cfoutput><li>Recordation of (mortgage/deed of trust) from <cfif Len(read_title.blastname1)>, #read_title.bfirstname1# #read_title.blastname1# </cfif><cfif Len(read_title.blastname2)>, #read_title.bfirstname2# #read_title.blastname2# </cfif><cfif Len(read_title.blastname3)>, #read_title.bfirstname3# #read_title.blastname3# </cfif><cfif Len(read_title.blastname4)>, #read_title.bfirstname4# #read_title.blastname4# </cfif> securing #read_title.insured# in the amount of $<cfif #read_title.loanamt_float# neq "" and #read_title.loanamt_float# neq 0 and #read_title.loanamt_float# neq 'NULL'>#NumberFormat(read_title.loanamt_float, "999,999,999.00")#<cfelse>TBD</cfif></li></cfoutput>
</ol>


<hr>


<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:10pt}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18pt}
.small_header {font-family:"Times New Roman", Times, serif; font-size:12pt}
.medium_header {font-family:"Times New Roman", Times, serif; font-size:14pt}
</style>

<table width="100%" cellpadding=0 cellspacing=0 border=0>
    <tr>
          <td>
<center>
<span class="big_header"><strong>S T E W A R T &nbsp; T I T L E</strong></span><br>
<span class="medium_header">I N S U R A N C E  &nbsp; C O M P A N Y </span></center>
</td>
</tr>
</table>

<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:9pt}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18pt}
.small_header {font-family:"Times New Roman", Times, serif; font-size:12pt}
.medium_header {font-family:"Times New Roman", Times, serif; font-size:14pt}
</style>
<cfoutput>

		<table width="93%" cellpadding=1 cellspacing=1 border=0 >
			<tr>
				<td width="40%" valign="top">Title No: T-#read_title.title_id#</td>
				<td width="53%" align="Right" valign="top">&nbsp;  </td>
			</tr>
		</table>
<br>
<br>
<br>

		<table width="93%" cellpadding=1 cellspacing=1 border=0 >
			<tr>
				<td colspan="4" align="center" valign="top"><span class="small_header"><strong>Municipal Department Searches and Bankruptcy Searches</strong></span></td>
			</tr>
		</table>
</cfoutput>
<br>

		<table width="93%" cellpadding=1 cellspacing=1 border=0 >
			<tr>
				<td align="left" valign="top">

Any searches or returns herein are furnished FOR INFORMATION ONLY.  They will not be insured and the company assumes no liability for the accuracy thereof.  They will NOT BE CONTINUED to the date of closing.<BR><BR>

The following searches are attached:<BR><BR>

Tax Search<BR>
Municipals (if applicable)<BR><BR>



In New York City, if there is a STREET VAULT, it is suggested that applicant investigate possible unpaid license fees by the City of New York for the use of such vault, because the right to maintain IT IS NOT INSURED, nor does the Company insure that the vault charges have been paid.<BR><BR>


</td></tr></table>
</ol>



<hr>




<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:14pt}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18pt}
.small_header {font-family:"Times New Roman", Times, serif; font-size:12pt}
.medium_header {font-family:"Times New Roman", Times, serif; font-size:14pt}
</style>

<table width="100%" cellpadding=0 cellspacing=0 border=0>
    <tr>
          <td>
<center>
<span class="big_header"><strong>S T E W A R T &nbsp; T I T L E</strong></span><br>
<span class="medium_header">I N S U R A N C E  &nbsp; C O M P A N Y </span></center>
</td>
</tr>
</table>

<style type="text/css">
td {font-family:"Times New Roman", Times, serif; font-size:9pt}
.big_header {font-family:"Times New Roman", Times, serif; font-size:18pt}
.small_header {font-family:"Times New Roman", Times, serif; font-size:12pt}
.medium_header {font-family:"Times New Roman", Times, serif; font-size:14pt}
</style>
<cfoutput>

		<table width="93%" cellpadding=1 cellspacing=1 border=0 >
			<tr>
				<td width="40%" valign="top">Title No: T-#read_title.title_id#</td>
				<td width="53%" align="Right" valign="top">&nbsp;  </td>
			</tr>
		</table>
<br>
<br>
<br>

		<table width="93%" cellpadding=1 cellspacing=1 border=0 >
			<tr>
				<td colspan="4" align="center" valign="top"><span class="small_header"><strong>Tax Search</strong></span></td>
			</tr>
		</table>
</cfoutput>
<br>

		<table width="93%" cellpadding=1 cellspacing=1 border=0 >
			<tr>
				<td align="left" valign="top">

Some item returned herein may have been paid but payment not officially posted. Receipted bills shoul d be produced on closing. Policy does not insure against items not a lien up to the date of the policy, not for installments for assessments due after date of this policy. Policy does not insure against pending assignments.<Br><Br>

If premises are benefited by a Real Estate Tax Abatement, personal to an exempt owner, additional taxes may accrue or may have accrued due to a change in ownership or possession. Any restored taxes from the date of transfer of title or possession from the exempt owner, must be fixed and paid prior to closing of title. <Br><Br>



<cfoutput>Tax Map No.: #read_tax.tax_map_num#<BR>
Class Code: #read_tax.class_code#<BR>
Total Assessed Value: #read_tax.total_assessed_value#<BR>
School District: #read_tax.school_district#<BR>
Exemptions: #read_tax.exemptions#<BR></cfoutput>

<BR>


A. Unpaid water and/or sewer charges, if any.<BR><BR>



</td></tr></table>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<table valign="bottom">
<tr>
<td>
<font color="#666666">The policy does not insure against water meter and sewer rental charges accruing since date of last reading, nor charge which may have accrued prior thereto which charges are entered subsequent to the date of closing.<Br><Br>

The policy does not insure against building purpose, water frontage charges or sewer charges entered subsequent to the date of policy which may have been reassessed for period prior to the date of closing.</font><Br>
</td>
</tr>
</table>
</ol>




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