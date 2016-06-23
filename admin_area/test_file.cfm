	
<CFQUERY datasource="#request.dsn#" NAME="read">
SELECT *
FROM title
WHERE  (appraisal_status = 'Loan Closed')
</CFQUERY>
			
<cfoutput query = "read">

<CFQUERY datasource="#request.dsn#" NAME="read_s">
SELECT *
FROM title_closing_order_request
WHERE  title_id = #title_id#
</CFQUERY>
<cfif #read_s.request_date# eq "">
<CFQUERY datasource="#request.dsn#" NAME="read">
update title_closing_order_request
set a_req_closing_day = 22,
a_filled_out_by = 60,
a_filled_out_date = '7/22/2003',
a_filled_out_time = '1/1/1900 4:05:36 PM',
request_date = '7/22/2003'
WHERE title_id = #title_id# and request_date is null
</CFQUERY>

</cfif>



</cfoutput>