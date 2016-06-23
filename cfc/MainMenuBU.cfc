<cfcomponent>
   <cfset THIS.dsn=#request.dsn#>

	<!--- Get tbl Departments for Menu --->
	<cffunction name="GetMenuHead" access="remote" returntype="query"> 
		<cfargument name="User_Id" type="any" required="true"> 
		<!--- Do search --->
		<cfquery datasource=#request.dsn# name="result">
		   	Select distinct a.ID,a.description 
			from categories a 
			join report_master b on a.Id=b.CategoryId
			join report_access c on b.Report_Id= c.Report_Id
			Where User_Id=#User_Id#
		</cfquery>
		<!--- And return it --->
		<cfreturn result>
	</cffunction>

	<!--- Get subitems for Menu --->
	<cffunction name="GetMenuItem" access="remote" returntype="query"> 
		<cfargument name="menukey" type="any" required="true">   
		<cfargument name="User_Id" type="any" required="true">   
		<!--- Do search --->
		<cfquery datasource=#request.dsn# name="result">
			Select b.Report_Id, b.Report_Name, b.CategoryId ,b.URL,b.Report_Desc
			from categories a 
			join report_master b on a.Id=b.CategoryId
			join report_access c on b.Report_Id= c.Report_Id
			Where User_Id=#User_Id# and CategoryId =#menukey#		
		</cfquery>
		<!--- And return it --->
		<cfreturn result>
	</cffunction>

</cfcomponent>


