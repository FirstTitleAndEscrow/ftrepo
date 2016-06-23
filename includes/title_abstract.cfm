<!---Checking to see if a search has already been done on this property--->
<CFQUERY datasource="#request.dsn#" NAME="check_order">
	SELECT *
	FROM title
	WHERE (paddress = '#trim(paddress)#') and (pcity = '#trim(pcity)#') and (pstate = '#trim(pstate)#') 
</CFQUERY> 

<!---If there is a match get the information from Doc_Abstract_Title--->
<CFIF #check_order.recordcount# gte 1>
	<CFQUERY datasource="#request.dsn#" NAME="check_abstract">
		SELECT *
		FROM Doc_Abstract_Title
		WHERE title_id = #check_order.title_ID# and a_date_completed is not null
	</CFQUERY>
	
	<CFIF #check_abstract.RecordCount# gte 1>
		<CFSET title_abstract = "T-#check_order.title_id#">
	</CFIF>
</CFIF>

<!--- We also need to check the same thing to see if a property order was previously ordered --->
<CFQUERY datasource="#request.dsn#" NAME="check_prop_order">
	SELECT *
	FROM property
	WHERE (paddress = '#paddress#') and (pcity = '#pcity#') and (pstate = '#pstate#') 
</CFQUERY>

<CFIF #check_prop_order.recordcount# gte 1>
	<CFQUERY datasource="#request.dsn#" NAME="check_abstract_prop">
		SELECT *
		FROM Doc_Abstract_Prop
		WHERE prop_id = #check_prop_order.prop_ID# and a_date_completed is not null
	</CFQUERY>
	
	<CFIF #check_abstract_prop.RecordCount# gte 1>
		<CFSET title_abstract = "P-#check_prop_order.prop_id#">
	</CFIF>
</CFIF>