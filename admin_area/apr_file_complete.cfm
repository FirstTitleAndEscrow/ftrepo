<CFQUERY datasource="#request.dsn#" NAME="update_file">
	update apr_files
	set paid_in_full = 1
	where id = #id#
</CFQUERY>

<cflocation url="apr_main.cfm">