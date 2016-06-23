   <CFQUERY datasource="#request.dsn#" NAME="get_titleid">
	   SELECT DISTINCT a.cl_doc_id, a.title_id into temp
FROM         Doc_Closer_Title a INNER JOIN
                       Doc_Closer_Title b ON b.Title_ID = a.Title_ID AND a.cl_doc_id <> b.cl_doc_id
ORDER BY a.Title_ID
    </CFQUERY>		
		
		
		
				   <CFQUERY datasource="#request.dsn#" NAME="get_all_title">
	   SELECT distinct title_id from temp order by title_id
    </CFQUERY>	
		
		
		<cfoutput query="get_all_title">
		
			   
		   <CFQUERY datasource="#request.dsn#" NAME="get_id">
	   SELECT top 1 * from temp where title_id = #title_id#
    </CFQUERY>	
		
		   <CFQUERY datasource="#request.dsn#">
	  delete from   Doc_Closer_Title where cl_doc_id = #get_id.cl_doc_id#
		
		    </CFQUERY>	
		
		
		
		
		</cfoutput>
				   <CFQUERY datasource="#request.dsn#">
	  drop table temp
		
		    </CFQUERY>	