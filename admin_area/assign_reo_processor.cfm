<cfparam name="form.reo_processor" default="0">
<cfparam name="form.title_id" default="0">

<CFQUERY name="update_reo" datasource="#request.dsn#">
update title
set reo_processor = #form.reo_processor#
where title_id = #form.assign_title_id#
</CFQUERY>	


<cflocation url="title_upload_reo_data.cfm?#cgi.QUERY_STRING#&processor_assigned=1">
