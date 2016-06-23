<cfcomponent>



<!---<cffunction name="getData" access="remote" output="false" returntype="struct">     
    <cfargument name="page"> 
    <cfargument name="pageSize"> 
    <cfargument name="gridsortcolumn" default="Title_ID"> 
	<cfargument name="gridstartdirection" default="ASC"> 
    
    <cfdump var="#Client#" >
    <cfquery name="rpt" datasource="First_Title_Main_Admin"> 
         SELECT TOP 100 Title_ID, blastname1, paddress, pstate, Insured 
		   FROM Title 
		  <!---WHERE	online_docs_to_be_recorded= 1 
		    AND online_docs_recorded = 0--->
         <cfif trim(arguments.gridsortcolumn) neq "" AND trim(arguments.gridstartdirection) neq "">
    	 	order by #arguments.gridsortcolumn# #arguments.gridstartdirection# 
    	 </cfif>
    </cfquery> 
    <cfreturn QueryConvertForGrid(rpt, page, pageSize)> 
</cffunction>


<cffunction name="getExcelData" access="remote" output="false">     
    <!---<cfsetting enablecfoutputonly="yes">--->
    <!---<cfdump var="#Client#" ><cfabort>--->
    <cfquery name="excelRpt" datasource="First_Title_Main_Admin"> 
         SELECT TOP 500 Title_ID, blastname1, paddress, pstate, Insured 
		   FROM Title 
		 <!--- WHERE	online_docs_to_be_recorded= 1 
		    AND online_docs_recorded = 0--->
    </cfquery> 

	<cfsavecontent variable="exportList">
	<cfoutput query="excelRpt">
	<table border="1">
		<cfif excelRpt.currentRow eq 1>
		<tr>
			<th>Title Id</th>
			<th>Blast Name</th>
			<th>Property Address</th>
			<th>State</th>
			<th>Insured</th>
		</tr>
		</cfif>
		<tr>
			<td>#excelRpt.Title_ID#</td>
			<td>#excelRpt.blastname1#</td>
			<td>#excelRpt.paddress#</td>
			<td>#excelRpt.pstate#</td>
			<td>#excelRpt.Insured#</td>
		</tr>
	</table>
	</cfoutput>
	</cfsavecontent> 
	<cfreturn exportList>
</cffunction>
--->

<cffunction name="getSpreadsheetData" access="remote" output="false">     
   <!--- <cfargument name="sortcolumn"  default="title_id">
	<cfargument name="startdirection" default="asc">--->  
    
    <cfquery name="excelRpt" datasource="#request.dsn#"> 		
			
		SELECT Title_ID AS "Title ID" , BLASTNAME1 as "Borrower Last Name" , paddress as "Property Address", pstate as "Property State", insured as Lender, 
		CASE WHEN 
		(online_docs_to_be_recorded =1 AND online_docs_recorded=0) THEN 'X' ELSE '' END as "Online docs Needed",
		
		CASE WHEN 
		(Corporate_Docs_Needed =1 AND Corporate_docs_Received=0) THEN 'X' ELSE '' END as "Corporate docs Needed",
		
		CASE WHEN 
		(Trust_Docs_Needed =1 AND Trust_docs_Received =0) THEN 'X' ELSE '' END as "Trust docs Needed",
		
		CASE WHEN 
		(Surveys_Needed =1 AND Surveys_Received =0) THEN 'X' ELSE '' END as "Surveys Needed"
		FROM Title 
		WHERE online_docs_to_be_recorded = 1 and online_docs_recorded = 0 or
			Corporate_Docs_Needed = 1 and Corporate_docs_Received = 0 or
			Trust_Docs_Needed = 1 and Trust_docs_Received = 0 or
			Surveys_Needed = 1 and Surveys_Received = 0
	
		<!---<cfif session.sortcolumn neq "" AND len(trim(session.startdirection)) > 
    	 	order by #session.sortcolumn#  #session.startdirection# 
    	 </cfif>--->				                 
    </cfquery> 
       <cfreturn excelRpt>
</cffunction>


</cfcomponent>