<cfcomponent>
	
	<cffunction name="assignCTC" output="false" access="remote">
		<cfargument name="title_ID" required="yes">
		<cfargument name="assignedToID" required="yes">
		
		
		<cfset var outStr = "">
		
		
			<cfquery name="updateTitle" datasource="#request.dsn#" >
				update title
				set
				cleartoclosereview_assignedToID = <cfif Len(arguments.assignedToID)>#arguments.assignedToID#<cfelse>null</cfif>
				where title_id = #arguments.title_id#				


			</cfquery>
			
			<cfif Len(arguments.assignedToID)>
				<cfquery name="getAdmin" datasource="#request.dsn#" >
					select fname,lname,email from First_Admin
					where ID = #arguments.assignedToID#
				</cfquery>

				<cfmail to="#getAdmin.email#" from="webmaster@firsttitleservices.com" subject="File Assigned For Clear to Close Review">File T-#arguments.title_id# has been assigned to you as the clear to close reviewer.
				</cfmail>

				<cfquery name="insNote" datasource="#request.dsn#" >
					insert into title_notes(fname,lname,n_date,n_time,order_ID,n_note,note_type)
					values('#getAdmin.fname#','#getAdmin.lname#','#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#',#arguments.title_ID#,'File T-#arguments.title_id# has been assigned to #getAdmin.fname# #getAdmin.lname# for clear to close review','T')
				</cfquery>

			</cfif>
		
		
		
		<cfreturn outstr>
		
	</cffunction>
</cfcomponent>