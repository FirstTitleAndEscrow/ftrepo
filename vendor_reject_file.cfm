<cfparam name="ordertype" default="title_taxes">
<cfset send_emails_to = "pgibb@firsttitleservices.com">

<cfif ordertype eq 'title_taxes'>


<CFQUERY name="get_file" datasource="#request.dsn#">
SELECT *
FROM doc_abstract_title
WHERE title_id = #form.rec_id#
</CFQUERY>
<CFQUERY name="get_vendor" datasource="#request.dsn#">
SELECT *
FROM abstractors
WHERE abstractor_ID = #get_file.abstractor_tax_id#
</CFQUERY>
<CFQUERY name="update_file" datasource="#request.dsn#">
update doc_abstract_title
set abstractor_tax_id = NULL
WHERE title_id = #form.rec_id#
</CFQUERY>
<CFQUERY name="update_file2" datasource="#request.dsn#">
update tax_cert_title
set a_date_started = NULL
WHERE title_id = #form.rec_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#">
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type)
VALUES('Web', 'System', #form.rec_id#, 'This file was reject by #get_vendor.company# for the following reason: #form.rejection_reason#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T')
</CFQUERY>
<cfmail to="#send_emails_to#" from="webmaster@firsttitleservices.com" subject="Taxes Vendor Order T-#form.rec_id# Rejected" type="html">
<br>
Order T-#form.rec_id# was rejected by #get_vendor.company# for the following reason:<br>
<br>
#form.rejection_reason#<br>
<br>
</cfmail>
<cflocation url="vendor_rep_view.cfm?a_trigger=1&username=#form.username#&password=#form.password#&vendor_type=#get_vendor.type#&reject=1&rejected_file=T-#form.rec_id#">









<cfelseif ordertype eq 'prop_taxes'>


<CFQUERY name="get_file" datasource="#request.dsn#">
SELECT *
FROM doc_abstract_prop
WHERE prop_id = #form.rec_id#
</CFQUERY>
<CFQUERY name="get_vendor" datasource="#request.dsn#">
SELECT *
FROM abstractors
WHERE abstractor_ID = #get_file.abstractor_tax_id#
</CFQUERY>
<CFQUERY name="update_file" datasource="#request.dsn#">
update doc_abstract_prop
set abstractor_tax_id = NULL
WHERE prop_id = #form.rec_id#
</CFQUERY>
<CFQUERY name="update_file2" datasource="#request.dsn#">
update tax_cert_prop
set a_date_started = NULL
WHERE prop_id = #form.rec_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#">
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type)
VALUES('Web', 'System', #form.rec_id#, 'This file was rejected by #get_vendor.company# for the following reason: #form.rejection_reason#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'P')
</CFQUERY>
<cfmail to="#send_emails_to#" from="webmaster@firsttitleservices.com" subject="Taxes Vendor Order P-#form.rec_id# Rejected" type="html">
<br>
Order P-#form.rec_id# was rejected by #get_vendor.company# for the following reason:<br>
<br>
#form.rejection_reason#<br>
<br>
</cfmail>
<cflocation url="vendor_rep_view.cfm?a_trigger=1&username=#form.username#&password=#form.password#&vendor_type=#get_vendor.type#&reject=1&rejected_file=P-#form.rec_id#">






<cfelseif ordertype eq 'title_typing'>


<CFQUERY name="get_file" datasource="#request.dsn#">
SELECT *
FROM doc_abstract_title
WHERE title_id = #form.rec_id#
</CFQUERY>
<CFQUERY name="get_vendor" datasource="#request.dsn#">
SELECT *
FROM abstractors
WHERE abstractor_ID = #get_file.abstractor_id_3#
</CFQUERY>
<CFQUERY name="update_file" datasource="#request.dsn#">
update tblUser_Roles
set Typing_End_Datetime = NULL
WHERE title_id = #form.rec_id#
</CFQUERY>
<CFQUERY name="update_file2" datasource="#request.dsn#">
update doc_abstract_title
set abstractor_id_3 = NULL
WHERE title_id = #form.rec_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#">
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type)
VALUES('Web', 'System', #form.rec_id#, 'This file was rejected by #get_vendor.company# for the following reason: #form.rejection_reason#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T')
</CFQUERY>
<cfmail to="#send_emails_to#" from="webmaster@firsttitleservices.com" subject="Typing Vendor Order T-#form.rec_id# Rejected" type="html">
<br>
Order T-#form.rec_id# was rejected by #get_vendor.company# for the following reason:<br>
<br>
#form.rejection_reason#<br>
<br>
</cfmail>
<cflocation url="vendor_rep_view.cfm?a_trigger=1&username=#form.username#&password=#form.password#&vendor_type=#get_vendor.type#&reject=1&rejected_file=T-#form.rec_id#">


<cfelseif ordertype eq 'prop_typing'>


<CFQUERY name="get_file" datasource="#request.dsn#">
SELECT *
FROM doc_abstract_prop
WHERE prop_id = #form.rec_id#
</CFQUERY>
<CFQUERY name="get_vendor" datasource="#request.dsn#">
SELECT *
FROM abstractors
WHERE abstractor_ID = #get_file.abstractor_id_3#
</CFQUERY>
<CFQUERY name="update_file" datasource="#request.dsn#">
update tblUser_Roles
set Typing_End_Datetime = NULL
WHERE prop_id = #form.rec_id#
</CFQUERY>
<CFQUERY name="update_file2" datasource="#request.dsn#">
update doc_abstract_prop
set abstractor_id_3 = NULL
WHERE prop_id = #form.rec_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#">
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type)
VALUES('Web', 'System', #form.rec_id#, 'This file was rejected by #get_vendor.company# for the following reason: #form.rejection_reason#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'P')
</CFQUERY>
<cfmail to="#send_emails_to#" from="webmaster@firsttitleservices.com" subject="Typing Vendor Order P-#form.rec_id# Rejected" type="html">
<br>
Order P-#form.rec_id# was rejected by #get_vendor.company# for the following reason:<br>
<br>
#form.rejection_reason#<br>
<br>
</cfmail>
<cflocation url="vendor_rep_view.cfm?a_trigger=1&username=#form.username#&password=#form.password#&vendor_type=#get_vendor.type#&reject=1&rejected_file=P-#form.rec_id#">



<cfelseif ordertype eq 'title_abstract'>


<CFQUERY name="get_file" datasource="#request.dsn#">
SELECT *
FROM doc_abstract_title
WHERE title_id = #form.rec_id#
</CFQUERY>
<CFQUERY name="get_vendor" datasource="#request.dsn#">
SELECT *
FROM abstractors
WHERE abstractor_ID = #get_file.abstractor_id#
</CFQUERY>
<CFQUERY name="update_file" datasource="#request.dsn#">
update doc_abstract_title
set abstractor_id = 0,
abstractor_doc_upload = NULL
WHERE title_id = #form.rec_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#">
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type)
VALUES('Web', 'System', #form.rec_id#, 'This file was rejected by #get_vendor.company# for the following reason: #form.rejection_reason#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T')
</CFQUERY>
<cfmail to="#send_emails_to#" from="webmaster@firsttitleservices.com" subject="Abstract Vendor Order T-#form.rec_id# Rejected" type="html">
<br>
Order T-#form.rec_id# was rejected by #get_vendor.company# for the following reason:<br>
<br>
#form.rejection_reason#<br>
<br>
</cfmail>
<cflocation url="vendor_rep_view.cfm?a_trigger=1&username=#form.username#&password=#form.password#&vendor_type=#get_vendor.type#&reject=1&rejected_file=T-#form.rec_id#">


<cfelseif ordertype eq 'prop_abstract'>


<CFQUERY name="get_file" datasource="#request.dsn#">
SELECT *
FROM doc_abstract_prop
WHERE prop_id = #form.rec_id#
</CFQUERY>
<CFQUERY name="get_vendor" datasource="#request.dsn#">
SELECT *
FROM abstractors
WHERE abstractor_ID = #get_file.abstractor_id#
</CFQUERY>
<CFQUERY name="update_file" datasource="#request.dsn#">
update doc_abstract_prop
set abstractor_id = 0,
abstractor_doc_upload = NULL
WHERE prop_id = #form.rec_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#">
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type)
VALUES('Web', 'System', #form.rec_id#, 'This file was rejected by #get_vendor.company# for the following reason: #form.rejection_reason#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'P')
</CFQUERY>
<cfmail to="#send_emails_to#" from="webmaster@firsttitleservices.com" subject="Abstract Vendor Order P-#form.rec_id# Rejected" type="html">
<br>
Order P-#form.rec_id# was rejected by #get_vendor.company# for the following reason:<br>
<br>
#form.rejection_reason#<br>
<br>
</cfmail>
<cflocation url="vendor_rep_view.cfm?a_trigger=1&username=#form.username#&password=#form.password#&vendor_type=#get_vendor.type#&reject=1&rejected_file=P-#form.rec_id#">

<cfelse>

<cflocation url="vendor_rep_view.cfm?a_trigger=1&username=#form.username#&password=#form.password#&vendor_type=#get_vendor.type#">

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