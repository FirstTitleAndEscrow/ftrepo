<cfcomponent>

	<cffunction name="QuickContact" access="remote" return="numeric">
		<cfargument name="firstName">
		<cfargument name="lastName">
		<cfargument name="email">
		<cfargument name="phone">
		<cfargument name="discuss">
		<cfquery datasource="#request.dsn#" name="insform">
			insert into webforms(fname,lname,email,company,discuss,phone,sourcepage)
			values('#arguments.firstname#','#arguments.lastname#','#arguments.email#',null,'#arguments.discuss#','#arguments.phone#','Quick Contact Form')
		</cfquery>
		<cfreturn 1>
	</cffunction>

</cfcomponent>