<cfif IsDefined("Cookie.Cookie_auth")>

The cookie is stored: <cfoutput>'#Cookie.Cookie_auth#'</cfoutput><br />
<br />
<cfelse>

The cookie was not kept

</cfif>

<cfabort>





<!--- <CFQUERY datasource="#request.dsn#" NAME="get_intSales">
Select fname, lname, phone, position, fax, email
FROM First_Admin
where ID = '256'
</cfquery>

<cfmail to="spape@firsttitleservices.com" from="#get_intSales.email#" subject="First Title & Escrow / Test Company" type="html" bcc="rjermain@firsttitleservices.com">
<style type="text/css" media="screen">
<!--
body, TD {
margin: 3;
padding: 3;
font: 12px verdana, arial, sans-serif;
}
.small {
margin: 3;
padding: 3;
font: 9px verdana, arial, sans-serif;
}
input {
margin: 3;
padding: 3;
font: 9px verdana, arial, sans-serif;
}
select, option {
margin: 3;
padding: 3;
font: 9px verdana, arial, sans-serif;
}
.header {

font: 14px verdana, arial, sans-serif;
}
-->
</style>
<table width="544" cellpadding="1" cellspacing="1" bgcolor="##000000">
<tr><td align="left" valign="top">
<table width="100%" cellpadding="0" cellspacing="4" bgcolor="##ffffff" border=0>
<tr>
<td align="left" valign="top" colspan="3"><img src="https://www.firsttitleservices.com/auto_emails/images/header.jpg" width="542" height="85"></td>
</tr>
<tr>
<td width="334" align="left" valign="top"><CENTER><br>
<img src="https://www.firsttitleservices.com/auto_emails/images/misses_you.jpg" width="314" height="79"></CENTER><br>
Remember why you became a First Title customer!<br>
<br>
<ul><li><strong>Title and Closing Coverage</strong> in 41 states nationwide for your purchase, refinance and equity loan transactions</li><br><br>

<li><strong>Web-Based Tools</strong> To Boost Your Productivity, including: </li><br><br>

<ul><li><font color="##000066"><strong>Generation of an Instant Pre-Calculated HUD-1</strong></font> on Order Placement - with all title insurance and state/county recordation fees </li></ul></ul>
</td><td width="165" align="left" valign="top"><img src="https://www.firsttitleservices.com/auto_emails/images/inset.jpg" width="165" height="204">
<table width="160" cellpadding="6" bgcolor="##99CCCC" border=1>
<tr>
<td align="center" valign="top"><font size = -1><strong>QUESTIONS?</strong><br>
Your Sales Acct Mgr:<br>
<strong>#get_intsales.fname# #get_intsales.lname#<br>
#get_intsales.phone#<br>
<A href="mailto:#get_intsales.email#">Click here to Email</A></strong></font></td>
</tr>
</table>

</td>
<td width="20">&nbsp;</td>
</tr>
<tr><td colspan="2">
<ul><ul><li><font color="##000066"><strong>Web-Based Closing Calendar</strong></font> - Choose where and when you want to close 24/7 </li><br><br>

<li><font color="##000066"><strong>Instant Endorsement Generator</strong></font> - Change Investor or Loan Amount on your Title Commitment, Online Instantly!</li><br><br>

<li><font color="##000066"><strong>Closing Cost Calculator</strong></font> - Get actual closing fees, title insurance and recording fees for your transactions 24/7</li><br><br>

<li><font color="##000066"><strong>Dashboard Transaction Manager</strong></font> - View EVERY document, note, and communication related to each of your transactions with us, ONLINE</li><br><br>

</ul></ul><br>
<br>
Contact me below by phone or email, so we can reactivate your account today. For both unparalleled service, and technology tools built to increase your efficiency, First Title is you nationwide title and closing services solution!<br>
<br>
Thank you for being a First Title customer.<br>
<br>
Sincerely,<br>
<br>
<strong>#get_intsales.fname# #get_intsales.lname#</strong> - #get_intsales.position#<br>
Phone: #get_intsales.phone#<br>
Fax: #get_intsales.fax#<br><br>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
First Title & Escrow<br>
30 West Gude Drive, 4th Floor<br>
Rockville, MD 20850<br>
<cfelse>
First Title & Escrow<br>
7361 Calhoun Place, Suite 200<br>
Rockville, MD 20855<br>
</cfif>

Web Address: <a href="https://www.firsttitleservices.com">www.firsttitleservices.com</a>
</blockquote><br>
</td>
</tr>
<tr>
<td align="left" valign="top" colspan="3"><img src="https://www.firsttitleservices.com/auto_emails/images/footer.jpg" width="542" height="49"></td>
</tr>
</table>
</td></tr>
</table>
</cfmail>

DONE!!!xxx --->

<!---
<CFQUERY datasource="#request.dsn#" NAME="read_companies">
		SELECT *
		FROM companies where (intSales = 256 or id = 100)
		ORDER BY ID
	</CFQUERY>

<cfset full_list_comp_ids = "">

<cfoutput query="read_companies">
<cfif NOT ListContainsNoCase(full_list_comp_ids, read_companies.ID, ",")>
<cfset full_list_comp_ids = ListAppend(full_list_comp_ids, read_companies.ID, ",")>
</cfif>
</cfoutput>

<cfoutput>
Total Companies: #read_companies.recordcount#<br>
Total in List: #ListLen(full_list_comp_ids, ",")#<br>
</cfoutput>

<br>
<br>
<br>
<CFQUERY datasource="#request.dsn#" NAME="read_report">
	    SELECT *
		FROM Title
		WHERE cancelled is null
		AND comp_ID IN(#full_list_comp_ids#)
	ORDER BY  order_date asc
</CFQUERY>  <br>
<br>
<cfdump var="#read_report#">
--->

<!--- <CFQUERY datasource="#request.dsn#" NAME="read_companies">
		SELECT Company
		FROM companies where (intSales = 256)
		and a_status = 0
		and test_account = 0
		ORDER BY company
	</CFQUERY> --->


<!--- <CFQUERY datasource="#request.dsn#" NAME="no_emails">
Select *
FROM Do_Not_Email
</cfquery>
<cfset do_not_email_list = "">
<cfloop query="no_emails">
<cfif Not ListFind(do_not_email_list, email_address, ",")>
<cfset do_not_email_list = ListAppend(do_not_email_list, email_address, ",")>
</cfif>
</cfloop>

	<cfdump var="#do_not_email_list#"> --->

	<!---
<CFQUERY datasource="#request.dsn#" NAME="get_states">
SELECT DISTINCT state
FROM         Zip_Info
WHERE     (state NOT IN ('AA', 'AE', 'AP', 'GU', 'FM', 'MH', 'MP', 'PR', 'PW', 'VI', 'AS'))
ORDER BY state
</cfquery>

<table cellpadding="3" cellspacing="3" border="1">
<tr>
<td align="left" valign="top" width="100"><b>STATE</b></td>
<td align="right" valign="top" width="200"><b># Purchases</b></td>
<td align="right" valign="top" width="200"><b># Refinances</b></td>
<td align="right" valign="top" width="200"><b># New 2nd Mortgages</b></td>
</tr>

<CFQUERY datasource="#request.dsn#" NAME="get_all_orders">
SELECT t.*, c.ID, c.a_status, c.test_account from title t, Companies c
where t.comp_id = c.ID
and c.test_account = 0
</cfquery>


<cfoutput query="get_states">

<cfquery dbtype="query" name="get_purchases">
	SELECT *
	FROM get_all_orders
	Where pstate = '#state#' and searchtype = 'Purchase'
</cfquery>



<CFQUERY dbtype="query" NAME="get_refis">
SELECT *
	FROM get_all_orders
	Where pstate = '#state#' and searchtype = 'Refinance'
</cfquery>

<CFQUERY dbtype="query" NAME="get_new_second">
SELECT *
	FROM get_all_orders
	Where pstate = '#state#' and searchtype = 'New Second Mortgage'
</cfquery>
<tr>
<td align="left" valign="top" width="100"><b>#state#</b></td>
<td align="right" valign="top" width="200"><b>#get_purchases.recordcount#</b></td>
<td align="right" valign="top" width="200"><b>#get_refis.recordcount#</b></td>
<td align="right" valign="top" width="200"><b>#get_new_second.recordcount#</b></td>
</tr>
</cfoutput>
<cfflush>
</table> --->

<!---

<CFQUERY datasource="#request.dsn#" NAME="jeff">
SELECT company
	FROM companies
	Where intSales = 256 order by company
</cfquery>
Jeff Jurin:<br>
<cfoutput query="jeff">
#company#<br>
</cfoutput><br>
<hr>
<br>


<CFQUERY datasource="#request.dsn#" NAME="chad">
SELECT company
	FROM companies
	Where intSales = 260 order by company
</cfquery>
Chad Fourman:<br>
<cfoutput query="chad">
#company#<br>
</cfoutput><br>
<hr>
<br>



<CFQUERY datasource="#request.dsn#" NAME="Bruce">
SELECT company
	FROM companies
	Where intSales = 278 order by company
</cfquery>
Bruce Gilbert:<br>
<cfoutput query="bruce">
#company#<br>
</cfoutput><br>
<hr>
<br>



<CFQUERY datasource="#request.dsn#" NAME="Nat">
SELECT company
	FROM companies
	Where intSales = 281 order by company
</cfquery>
Nat Alston:<br>
<cfoutput query="nat">
#company#<br>
</cfoutput><br>
<hr>
<br>
--->
<!---
<cfset sales_ids = "">
<CFQUERY datasource="#request.dsn#" NAME="companies">
SELECT intSales from companies
where test_account = 0
and a_status = 1
</cfquery>



<cfloop query="companies">
<cfif NOT ListFindNocase(sales_ids, companies.IntSales, ",")>
<cfset sales_ids = ListAppend(sales_ids, companies.IntSales, ",")>
</cfif>
</cfloop>

<table cellpadding="4">
<tr>
<cfloop index="intSalesID" list="#sales_ids#" delimiters=",">
<CFQUERY datasource="#request.dsn#" NAME="orders">
SELECT t.comp_id, t.a_insert_date, c.intSales
from title t, companies c
Where a_insert_date = '#DateFormat(DateAdd("d", -1, Now()), "mm-dd-yyyy")#'
and c.ID = t.comp_id
and c.IntSales = #intSalesID#
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="proporders">
SELECT p.comp_id, p.a_insert_date, c.intSales
from Property p, companies c
Where a_insert_date = '#DateFormat(DateAdd("d", -1, Now()), "mm-dd-yyyy")#'
and c.ID = p.comp_id
and c.IntSales = #intSalesID#
</cfquery>
<cfset total_orders = orders.recordcount + proporders.recordcount>
<CFQUERY datasource="#request.dsn#" NAME="get_intSales">
SELECT fname, lname from First_Admin
where ID = '#intSalesID#'
</cfquery>
<cfset sales_person = get_intSales.fname & " " & get_intSales.lname>

<cfoutput>
<tr>
<td align="left" valign="top">#sales_person#</td>
<td align="right" valign="top">#total_orders#</td>
</tr>
</cfoutput>
</cfloop>
</table> --->

<!---
<CFQUERY datasource="#request.dsn#" NAME="tables">
select NAME from SYSOBJECTS
where TYPE = 'U'
and (NAME LIKE 'State%')
order by NAME
</CFQUERY>


<table border=1 cellpadding=3>
<tr>
<td width="250" align="left" valign="top">Table Name</td><td align="left" valign="top">Has Data?</td>
</tr>
<cfoutput query="tables">
<CFQUERY datasource="#request.dsn#" NAME="check">
select * from #Name#
</CFQUERY>
<tr>
<td width="250" align="left" valign="top">#Name#</td><td align="left" valign="top"><cfif check.recordcount>Yes<cfelse>No</cfif></td>
</tr>
</cfoutput>
</tr>
</table> --->

<!--- <CFQUERY datasource="#request.dsn#" NAME="check">
select fname, lname, username, password from first_admin where lname = 'cross'
</CFQUERY>

<cfdump var="#check#"> --->

<!--- <form action="mailto:rjermain@firsttitleservices.com" method="post">
<textarea name="Comments" cols="20" rows="5"></textarea><br>
<input name="Submit" type="submit" value="Submit">
</form> --->

<!--- <cfhttp url="http://www.firsttitleservices.com/title_committment_view_amer_pioneer_ins_all.cfm?uid=59&al=1&rec_id=37220&a_trigger=1&company_id=NONE" method="get" resolveURL="true">
</cfhttp> --->
<!---<cfhttp url="http://www.firsttitleservices.com/title_view_hud_pg1a.cfm?emp=0&comp_id=100&rec_id=37861&user_id_1=0&lo_id=0" method="get" resolveURL="true">
</cfhttp>
<cfdocument format="PDF" pagetype="custom" pageheight="16" pagewidth="8" margintop="0" marginbottom="0" marginleft="0" marginright="0" filename="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\calyxdc\tcs\HUD-ricktest.pdf" overwrite="true">
   <cfoutput>#cfhttp.filecontent#</cfoutput>
</cfdocument>
<cffile action="READ" file="C:\inetpub\wwwroot\clients\firsttitleservices.com\www\calyxdc\tcs\HUD-ricktest.pdf" variable="pdf">
<cfset send_pdf = ToBase64(pdf)>
<cflocation url="https://www.firsttitleservices.com/calyxdc/tcs/HUD-ricktest.pdf" addtoken="no">--->

