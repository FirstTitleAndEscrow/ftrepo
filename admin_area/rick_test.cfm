<CFQUERY NAME="read_legal" datasource="#request.dsn#">
	select ID, notes from prop_ins_view WHERE prop_id 
  	= 1823 AND (type = 'DATA') ORDER BY insert_date, insert_time DESC 
 </CFQUERY> 



