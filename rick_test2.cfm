<!--- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>
</head>

<body> --->
<!--- <CFQUERY datasource="#request.dsn#" NAME="all">
SELECT    t.a_insert_date, c.Company, t.pname, t.pphone, t.p_email
FROM Title t, Companies c
where t.oda_year = '2005'
AND t.oda_month >= '1'
and t.oda_day >= '1'
AND c.ID = t.comp_id
and c.ID NOT IN (SELECT  comp_id
FROM Title
where t.oda_year = '2006'
AND t.oda_month = '1'
and t.oda_day >= '1'
and t.oda_day <= '31')
order by c.Company,t.a_insert_date, t.title_id
</cfquery>

<cfdump var="#all#"><br>
<br>
<br> --->
<!--- <CFQUERY datasource="#request.dsn#" NAME="all2">
SELECT ID, a_date FROM Companies
where a_date between '#DateFormat("01/01/2005", "m/d/yyyy")#' AND '#DateFormat("12/31/2005", "m/d/yyyy")#'
</cfquery>
<cfdump var="#all2#"><br>
Hi there!<br> --->








<!---

<CFQUERY datasource="#request.dsn#" NAME="all_companies">
SELECT    a_date, Company, ID
FROM Companies
order by a_date
</cfquery>
<cfset companies_list = "">
<cfoutput query="all_companies">
<cfif DateFormat(a_date, "mm/dd/yyyy") GTE "01/01/2005" AND  DateFormat(a_date, "mm/dd/yyyy") LTE "12/31/2005">
<cfset companies_list = ListAppend(companies_list, ID, ",")>
</cfif>
</cfoutput>


<!--- now we have a list of all companies signed up in 2005, called companies_list --->
<cfloop index="this_comp_id" list="#companies_list#" delimiters=",">
<CFQUERY datasource="#request.dsn#" NAME="get_companies">
SELECT  comp_id
FROM Title
where oda_year = '2006'
AND oda_month >= '1'
and oda_day >= '1'
and oda_day <= '31'
AND comp_id = '#this_comp_id#'
</cfquery>
<cfif get_companies.RecordCount>
<cfset companies_list = ListDeleteAt(companies_list, ListFind(companies_list, this_comp_id, ","), ",")>
</cfif>
</cfloop>

<!--- now we have a list of all companies signed up in 2005, and have NOT placed an order in Jan 06 --->

<br>
<CFQUERY datasource="#request.dsn#" NAME="final">
SELECT    t.comp_id, t.a_insert_date, c.Company, t.pname, t.pphone, t.p_email
FROM Title t, Companies c
where 1=1
<!---
<cfloop index="this_comp_id" list="#companies_list#" delimiters=",">
or t.comp_id = #this_comp_id#
</cfloop>
 --->AND ((t.oda_month >= '1'
and t.oda_month <= '11'
and t.oda_day >= '1'
AND t.oda_year = '2005')
OR (t.oda_month = '12'
and t.oda_day = '1'
and t.oda_year = '2005'))
AND c.ID = t.comp_id
order by c.Company, t.a_insert_date, t.pname
</cfquery>

<table border=0>
<tr>
<td width="200"><strong>Company</strong></td>
<td width="150"><strong>Processor Name</strong></td>
<td width="150"><strong>Processor Phone</strong></td>
<td width="150"><strong>Processor Email</strong></td>
</tr>
<cfset this_company = "">
<cfset this_pname = "">
<cfset this_pphone = "">
<cfset this_p_email = "">
<cfoutput query="final">
<cfif a_insert_date contains '2005' and comp_id neq '729'>
<cfif Company NEQ this_company or pname NEQ this_pname or pphone NEQ this_pphone or p_email NEQ this_p_email>
<tr>
<td><cfif Company NEQ this_company><strong>#Company#</strong><cfelse>&nbsp;</cfif></td>
<td>#pname#</td>
<td>#pphone#</td>
<td>#p_email#</td>
</tr>
</cfif>
</cfif>
<cfset this_company = Company>
<cfset this_pname = pname>
<cfset this_pphone = pphone>
<cfset this_p_email = p_email>
</cfoutput>
</table>
--->
<!--- <CFQUERY datasource="#request.dsn#" NAME="get_abstractors">
SELECT  *
FROM Closer
where survey_completed = 1
</cfquery>

<cfdump var="#get_abstractors#"> --->

<!--- <cfset two_weeks_ago = DateFormat(DateAdd("d", -14, Now()), "mm/dd/yyyy")>
<cfoutput>Two weeks ago: #two_weeks_ago#</cfoutput><br>
<br>
<CFQUERY datasource="#request.dsn#" NAME="get_companies">
SELECT  *
FROM Companies
where a_date = '#two_weeks_ago#'
</cfquery>
<br>
<br>
<cfoutput>Number of companies: #get_companies.RecordCount#</cfoutput><br>
<br>

<cfoutput query="get_companies">
<CFQUERY datasource="#request.dsn#" NAME="get_title_orders">
SELECT  *
FROM Title
where comp_id = '#get_companies.ID#'
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_property_orders">
SELECT  *
FROM Property
where comp_id = '#get_companies.ID#'
</cfquery>
<cfif NOT get_title_orders.recordcount and NOT get_property_orders.recordcount>
<cfmail to="#get_companies.email#" from="spape@firsttitleservices.com" subject="Your FT Account" type="html">
We want to first thank you for your interest in working with First Title & Escrow, the premier title and closing services provider, Nationwide.  A couple of weeks has gone by since we have set your organization up in our system for placing title and closing services with us.  We are here to answer any questions that you may have on ordering, our closing process, or to discuss any special requirements you may have.  Below is the contact list for your single point of contact at our office, coupled with designated back-up contacts responsible for overseeing the smooth flow of your transactions.<br>
<br>
<strong>Main Contact<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;Nicole Holton, x313, <a href="mailto:nholton@firsttitleservices.com">nholton@firsttitleservices.com</a><br>
<br>
Backup Contacts:<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;Tisha Poland, x359, <a href="mailto:tpoland@firsttitleservices.com">tpoland@firsttitleservices.com</a><br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;Teri Ballou, x381, <a href="mailto:tballou@firsttitleservices.com">tballou@firsttitleservices.com</a></strong><br>
<br>
This team can help you anywhere from ordering up, through closing and funding. In that regard, we would appreciate you advising us as to when we can expect that you will place your first transactions with us, so we can alert your team accordingly.   Again, we want to thank you for your interest in First Title, and look forward to building a successful working relationship with one another.<br>
<br>
Stephen J. Papermaster, President<br>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
First Title & Escrow<br>
30 West Gude Drive, 4th Floor<br>
Rockville, MD 20850<br>
<cfelse>
First Title & Escrow<br>
7361 Calhoun Place, Suite 200<br>
Rockville, MD 20855<br>
</cfif>

Main Phone: 301-279-0303<br>
Direct Dial: 301-315-8180<br>
Direct Fax: 301-315-8181<br>
Web Address: <a href="https://www.firsttitleservices.com">www.firsttitleservices.com</a><br>
<br>
</cfmail>
</cfif>
</cfoutput>

 --->
<!--- <CFQUERY datasource="#request.dsn#" NAME="final">
	    SELECT t.a_insert_date, t.p_email, t.pname, c.Company
	    FROM TITLE t, Companies c
	    WHERE t.comp_id = '1474'
		and c.id = t.comp_id
    </CFQUERY>
	<cfset order_type = 'T'>

<cfmail to="rjermain@firsttitleservices.com" from="spape@firsttitleservices.com" subject="First Title & Escrow / #final.Company#" type="html">
<strong>Dear <cfif order_type eq "P">#final.pname# - <cfelse><cfif ListLen(final.pname, ", /") GTE 2 and (final.pname contains ',' OR final.pname contains '/')>#ListGetAt(final.pname, 2, ", /")# #ListGetAt(final.pname, 1, ", /")# - <cfelse>#final.pname# - </cfif></cfif></strong>
Please allow me to take this moment to personally thank you for the recent business you have sent our company, <strong>First Title & Escrow</strong>. We know that you and your borrowers have many choices for a title and closing services provider, and appreciate the trust you have put in us to process your valuable mortgage transactions.<br>
<br>
We hope that since our relationship has started, we have shown you how First Title can make your operation more effective; and hopefully, close more loans as a result. With this in mind, we hope that if you have the ability to commit more of your loan transactions to our company, you would do so. We are committed to making the process smoother for our clients, and hope that it shows in what you have seen from us from so far.<br>
<br>
Please feel free to contact me directly by phone, or send me an email with any suggestions or comments on how we can do things even better. In addition, in the event you have general questions on any other matters, including web ordering and our transaction management system tools, the First Title closing process, or anything else of importance to you, please contact me directly at any time.<br>
<br>
Once again, we thank you for the opportunity to work with your company. I look forward to building a long and prosperous relationship with one another.<br>
<br>
Stephen J. Papermaster, President<br>
<cfif NOT DateDiff("d", Now(), "1/30/2012")>
First Title & Escrow<br>
30 West Gude Drive, 4th Floor<br>
Rockville, MD 20850<br>
<cfelse>
First Title & Escrow<br>
7361 Calhoun Place, Suite 200<br>
Rockville, MD 20855<br>
</cfif>

Main Phone: 301-279-0303<br>
Direct Dial: 301-315-8180<br>
Direct Fax: 301-315-8181<br>
Web Address: <a href="www.firsttitleservices.com">www.firsttitleservices.com</a><br>
<br>
</cfmail>

DOne!!! --->
<!---
<cfset session.test_var = "This is a test">
<cfdump var="#session#"> --->

<!---
<CFQUERY datasource="#request.dsn#" NAME="citi">
SELECT     Title_ID, bfirstname1, blastname1, bfirstname2, blastname2, pname, oname
FROM         Title
WHERE     (comp_id = '1407')
</cfquery>

<table>
<tr>
<td><strong>Order ID</strong></td>
<td><strong>1st Borrower</strong></td>
<td><strong>2nd Borrower</strong></td>
<td><strong>Loan Processor</strong></td>
<td><strong>Loan Officer</strong></td>
</tr>
<cfoutput query="citi">
<tr>
<td>#Title_id#</td>
<td>#bfirstname1# #blastname1#</td>
<td>#bfirstname2# #blastname2#</td>
<td>#pname#</td>
<td>#oname#</td>
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
</html> --->


<cfdocument backgroundvisible = "yes" encryption = "none"   format = "PDF" filename = "test.pdf"   fontembed = "yes" name = "content"   orientation = "portrait" overwrite = "yes" pagetype = "legal" >
PUT SOME CRAP IN HERE
</cfdocument>

<cfoutput><CFcontent type="application/pdf" >
#content#
</cfcontent>
</cfoutput>

<br>
DONE!!!