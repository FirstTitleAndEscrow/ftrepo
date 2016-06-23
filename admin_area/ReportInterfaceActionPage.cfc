<cfcomponent displayname="All CRUD operations on Report Interface">

	<!---Assign selected users for accessing the report.--->
	<cffunction name="InsertNewUsers" displayname="Creates new record for users assigned to a report" access="remote" returntype="void">
	<cfargument name="Report_ID" type="numeric" required="true" default="0">
	<cfargument name="get_selected_users" type="string"  default="0"> 
			<cfif isDefined("arguments.get_selected_users") and #arguments.get_selected_users#	eq ''>
				<cfquery datasource="#request.dsn#">
					DELETE FROM Report_Access WHERE Report_Id = <cfqueryparam cfsqltype="cf_sql_integer" value=#Report_ID#>
				</cfquery>
			<cfelse>
				<cfquery datasource="#request.dsn#">
					DELETE FROM Report_Access WHERE User_Id IN (#get_selected_users#) AND Report_Id = <cfqueryparam cfsqltype="cf_sql_integer" value=#Report_ID#>
				</cfquery>
				<cfloop index="UserId" list="#arguments.get_selected_users#" delimiters="," >	
					<cfquery datasource="#request.dsn#">
						INSERT INTO Report_Access VALUES (#Report_ID#,#UserId#)
					</cfquery>	
				</cfloop>			
			</cfif>				
							
	</cffunction>

</cfcomponent>