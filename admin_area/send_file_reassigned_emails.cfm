<!--- send out Loan Funded Emails --->

<cfquery name="read_comp" datasource="#request.dsn#">

select * from title
where title_id = #rec_id#
</cfquery>


<cfquery name="read_company" datasource="#request.dsn#">
select company, intsales from companies
where id = #read_comp.comp_id#
</cfquery>

<cfquery name="find_sales_email" datasource="#request.dsn#">
select *
from first_admin
where id = #read_company.intSales#
</cfquery>



<!--- contracts@streamline-title.com --->
<cfif find_sales_email.email neq 'spape@firsttitleservices.com' and find_sales_email.email neq 'spape@papewelt.com' and find_sales_email.email neq 'spape@streamline-title.com' and find_sales_email.email neq 'pgibb@streamline-title.com' and find_sales_email.email neq 'pgibb@firsttitleservices.com'>
<cfif IsDefined("find_sales_email.email") and find_sales_email.email neq ''>
<CFMAIL
	    TO="#find_sales_email.email#"
		bcc="rick@jermain.com"
        FROM="webmaster@firsttitleservices.com"
        SERVER="127.0.0.1"
        Subject="File #read_comp.title_id# has been reassigned to you"
        TIMEOUT="600"
        >

File: #read_comp.title_id# has been reassigned to you.

Assigned to company: #read_company.company#

</CFMAIL>
</cfif>
</cfif>