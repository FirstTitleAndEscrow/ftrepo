<cfcomponent  displayname="Automatic Routing Interface Action Page">

	<cffunction name="IsCombinationPresent" access="private" displayname="Searches the unique combination of CompID/State values" returntype="any">
		<cfargument name="compid" type="numeric" required="true" > 
		<cfargument name="state" type="string" required="true">
		<cfquery name="Getcombination" datasource="#request.dsn#" result="Records" >
				SELECT ID FROM Companies_Routing WHERE Comp_ID = <cfqueryparam  cfsqltype="cf_sql_varchar" value="#arguments.compid#"> AND
				State=<cfqueryparam  cfsqltype="cf_sql_varchar" value="#arguments.state#">
		</cfquery>					
					<cfset CombinationPresent=0>
					
					<cfif Records.recordcount eq 1>					
						<cfset CombinationPresent=1>					
					</cfif>				
			<cfreturn CombinationPresent>				
	</cffunction>
	
	<cffunction name="CheckRecordForCompanyState" access="private" displayname="Check to see if any existing records for any company or state exists and delete them">
		<cfargument name="compid" type="numeric" required="true" > <cfargument name="state" type="string" required="true">
		
			<cfif #compid# eq 0 and #state# eq '0'>
				<cfquery datasource="#request.dsn#" >
						Delete from Companies_Routing
				</cfquery>
			</cfif>
			
			<cfif #compid# neq 0 and #state# eq '0'>
					<cfquery datasource="#request.dsn#" >
						Delete from Companies_Routing WHERE Comp_ID =<cfqueryparam cfsqltype="cf_sql_integer" value="#compid#">
					</cfquery>
			</cfif>
			
			<cfif #compid# eq 0 and #state# neq '0'>
					<cfquery datasource="#request.dsn#" >
						Delete from Companies_Routing WHERE state =<cfqueryparam cfsqltype="cf_sql_varchar" value="#state#">
					</cfquery>
			</cfif>			
			
	</cffunction>
	
	<cffunction name="DeleteSelectedRow" displayname="Delete the selected row" access="public">
		<cfargument name="RecordID" displayName="Unique Id of the selected row" type="numeric" required="true" />		
			<cfquery datasource="#request.dsn#" >
				DELETE FROM COMPANIES_ROUTING WHERE ID = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.RecordID#">
			</cfquery>		
	</cffunction>

	<cffunction name="InsertNewRow" displayname="Inserts New Record" description="Inserts new record in the database with user entered values" access="public" returntype="array">
		<cfargument name="ListOfCompids" displayName="List of different Company IDs"  type="any" required="true" /> 
		<cfargument name="File_Type" displayName="File Type" type="string" required="true" />
		<cfargument name="ListOfStates" displayName="Name of different states" type="any" required="true" />
		<cfargument name="Trigger_Point" displayName="Trigger Point" type="string" required="true" />
		<cfargument name="Event_Name" displayName="Event Name" type="string" required="true" />
		
		<!---Check conditions for all combinations of selected companies and states --->
			<cfset array1=ArrayNew(1)>			
				<cfloop list="#arguments.ListOfCompids#" index="compId" delimiters="," >
				  <cfloop list="#arguments.ListOfStates#" index="state" delimiters="," >
					<!---Check and delete all records if exists, when all combinations of company and state are selected --->
					<cfset CheckRecordForCompanyState(compid,state)>
					
					<cfset InsertStatus= StructNew()>
					
				   <cfif IscombinationPresent(#compId#,#state#) eq 'false'>
							<cfquery datasource="#request.dsn#">
								INSERT INTO Companies_Routing VALUES (								
								<cfqueryparam  cfsqltype="cf_sql_varchar" value="#compId#" />,
								<cfqueryparam  cfsqltype="cf_sql_char"    value="#arguments.File_Type#" />,
								<cfqueryparam  cfsqltype="cf_sql_varchar" value="#state#" />,
								<cfqueryparam  cfsqltype="cf_sql_varchar" value="#arguments.Trigger_Point#" />,
								<cfqueryparam  cfsqltype="cf_sql_varchar" value="#arguments.Event_Name#" />)
							</cfquery>
								<cfset InsertStatus.compid=compid>
								<cfset InsertStatus.state=state>
								<cfset InsertStatus.status=1>						
					  <cfelse>							
							<cfset InsertStatus.compid=compid>
								<cfset InsertStatus.state=state>
								<cfset InsertStatus.status=0>
				   </cfif>
				   <cfset ArrayAppend(array1,InsertStatus) >
				</cfloop>								
			</cfloop>
		   <cfreturn array1 >
	</cffunction>
</cfcomponent>