<cfcomponent>

	<cffunction name="getUsersList" displayname="List of Users" description="This functions list users for a particular report id" access="remote" returnFormat="JSON" returntype="any">
		<cfargument name="Report_Id" type="numeric" default="0" required="true" />
			<cfquery name="GetUsers" datasource="#request.dsn#">
				 SELECT fname as firstname, lname as lastname
				  FROM dbo.Report_Access 
				  join First_Admin on First_Admin.ID =Report_Access.User_Id where Report_Id=#ARGUMENTS.Report_Id#
				  order by dbo.First_Admin.lname
			</cfquery> 			
			<cfreturn serializeJSON(GetUsers)>			
	</cffunction>
	
	<cffunction name="getCategories" displayname="List of Categories" access="remote" returnFormat="JSON" returntype="any" >
		<cfquery name="GetCategories" datasource="#request.dsn#">
			SELECT ID,DESCRIPTION FROM CATEGORIES ORDER BY ID
		</cfquery>
		<cfreturn serializeJSON(getCategories)>
	</cffunction>	
	
	<cffunction name="getReportsList" displayname="Reports assigned to a user" access="public" returntype="Query" > 
		<cfargument name="UserId" type="numeric" required="true" /> 
		<cfquery name="GetReports" datasource="#request.dsn#">
				 SELECT Report_Master.Report_Id,Report_Name,URL,Report_Desc,Category.Id as CategoryId, Category.Description as Description
				 FROM Report_Master Join Categories Category on Report_Master.CategoryId=Category.Id
				 INNER JOIN Report_Access ON Report_Master.Report_Id=Report_Access.Report_Id
				 WHERE Report_Access.User_Id=<cfqueryparam cfsqltype="cf_sql_numeric" value=#arguments.UserId#>
		</cfquery>		
		<cfreturn GetReports />		
	</cffunction>
	
	<cffunction name="GetAvailableUsers" displayname="Returns the list of available users" access="remote" returntype="Any" returnformat="JSON" >
		<cfargument name="Report_ID" type="numeric" required="true" /> 
		 <cfquery name="GetUserList" datasource=#request.dsn#> 
			    			SELECT ID as uid, cast(fname + ' ' + lname as varchar(50)) as username, position from dbo.FIRST_ADMIN
							WHERE ID NOT IN (SELECT USER_ID FROM DBO.Report_Access WHERE REPORT_ID= <cfqueryparam  cfsqltype="cf_sql_numeric" value=#arguments.Report_ID# />) AND STATUS=1
							ORDER BY UID
		</cfquery>
		<cfreturn  serializeJSON(GetUserList) />
	</cffunction>
	
	<cffunction name="GetAssignedUsers" displayname="Returns the list of Assigned users" access="remote" returntype="Any" returnformat="JSON" >
		<cfargument name="Report_ID" type="numeric" required="true" /> 
		 <cfquery name="GetUsersAssigned" datasource=#request.dsn#> 
			    			SELECT DISTINCT ID as uid, cast(fname + ' ' + lname as varchar(50)) as username, position from dbo.FIRST_ADMIN FA 
							JOIN REPORT_ACCESS RPT_ACCESS ON FA.ID = RPT_ACCESS.USER_ID AND 
							RPT_ACCESS.Report_Id= <cfqueryparam  cfsqltype="cf_sql_numeric" value=#arguments.Report_ID# /> ORDER BY FA.ID
		</cfquery>
		<cfreturn  serializeJSON(GetUsersAssigned) />
	</cffunction>
	
</cfcomponent>