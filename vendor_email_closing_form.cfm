<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="a_flag" DEFAULT="0">
<CFPARAM NAME="email" DEFAULT="">

<CFQUERY datasource="#request.dsn#" NAME="get_id">
SELECT *
FROM title
WHERE title_id = #URL.rec_id#
</CFQUERY>


<CFQUERY name="get" datasource="#request.dsn#">
SELECT *
FROM title
WHERE title_id = #URL.rec_id#
</CFQUERY>



<cfquery name="get_file" datasource="#request.dsn#">
SELECT closing_form_upload
FROM doc_closer_title
WHERE title_id = #get.title_ID#
</CFQUERY>


<cfif #email# neq "">


<CFMAIL
TO="#email#"
FROM="hudprep@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="First Title - Closing Package for order #rec_id# - #get_id.bfirstname1# #get_id.blastname1#   Loan No. - #get_id.loan_number#"
TIMEOUT="600"
type="HTML"
>

View/Print Closing Form 1 <A HREF="#fileSys.FindFilePath('#get_file.closing_form_upload#', 'url')#" target="new">#get_file.closing_form_upload#</a> for order #rec_id#  - #get_id.bfirstname1# #get_id.blastname1#</B></font><br><br>

First Title staff
</cfmail>
<CFLOCATION URL="https://#cgi.server_name#/vendor_view_closing_form.cfm?user=#url.user#&pass=#url.pass#&rec_id=#rec_id#&a_trigger=20&company_id=#company_ID#">

</cfif>
