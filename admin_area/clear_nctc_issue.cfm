<CFQUERY DATASOURCE="#request.dsn#" NAME="read_id">
	update title_notes
    set nctc_cleared = 'True'
    where Note_id = '#url.note_id#'
</CFQUERY>


<cflocation url="#cgi.HTTP_REFERER#">
