<CFQUERY datasource="#request.dsn#" NAME="get_title">
SELECT     *
FROM        title a INNER JOIN
                      Doc_abstract_Title b ON a.Title_ID = b.Title_ID
WHERE     (abstractor_id = 162) or (abstractor_id = 160) or (abstractor_id = 161) or (abstractor_id = 297) or (abstractor_id = 542)
</cfquery>

<cfoutput query="get_title">

		<cfquery datasource="#request.dsn#">
update Doc_abstract_Title
set 
	a_recieved_by = 60,
	a_date_completed = '6/30/2003',
	a_time_completed = '#TimeFormat(Now(), "HH:mm:ss")#',
	abstractor_doc_upload = 'rest.tif'
where title_id = #title_id#
</cfquery>



</cfoutput>