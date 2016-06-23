<cfcomponent>
	<cffunction name="fnProcessResponse">
		<cfargument name="response_xml" required="true">
		
			<CFSET xmlDoc=#xmlparse(response_xml)#>
			
			 <CFSET Validate = XmlSearch(xmlDoc, "//Validated")>
			 
			<CFLOOP INDEX="i" FROM="1" TO="#ARRAYLEN(Validate)#">
				<cfset Validated=Validate[i].XmlText>
			</cfloop>
			
			<!--- <CFSET Trans_ID = XmlSearch(xmlDoc, "//TransactionID")>
			<CFLOOP INDEX="i" FROM="1" TO="#ARRAYLEN(Trans_ID)#">
				<cfset Transaction_ID=Trans_ID[i].XmlChildren[1].XmlText>
			</cfloop> 
			<cfset Order_ID=listgetat(Transaction_ID,3,'-')> --->
			<cfset Transaction_ID=#arguments.Trans_ID#>
			<cfset Order_ID=listgetat(Transaction_ID,3,'-')>
			
			<cfset Order_Type=listgetat(Transaction_ID,2,'-')>
			
			<CFSET Reason_desc = XmlSearch(xmlDoc, "//Description")>
			 <CFLOOP INDEX="i" FROM="1" TO="#ARRAYLEN(Reason_desc)#">
				<cfset Description=Reason_desc[i].XmlText>
			</cfloop>
			
			
			<cfif #Validated# eq "yes">
				<cfinvoke method="fnValidatedYes" > 
					<cfinvokeargument name="ID" value=#Order_ID#>
					<cfinvokeargument name="ordertype" value=#Order_Type#>
				</cfinvoke>
				
			<cfelse>
				<cfinvoke method="fnValidatedNo" >
					<cfinvokeargument name="ID" value=#Order_ID#>
					<cfinvokeargument name="Desc" value=#Description#>
					<cfinvokeargument name="ordertype" value=#Order_Type#>
				</cfinvoke> 
				
			</cfif>  
			
			<!--- <cfreturn #check_xml#> --->
			
	</cffunction>
	
	<cffunction name="fnValidatedYes">
			<cfargument name="ID" required="true">
			<cfargument name="ordertype" required="true">
		
			<!--- <CFQUERY name="read_anc" datasource="#request.dsn#">
					Select * from ancillary where Anc_ID =#arguments.ID#
			</cfquery>
			<CFQUERY name="read_prop" datasource="#request.dsn#">
					Select * from property where prop_id =#arguments.ID#
			</cfquery>
			
			<cfif #ordertype# eq "F">
				<CFQUERY datasource="#request.dsn#">		
					INSERT INTO Title_Notes(FName, Order_ID, N_Note, N_Date, N_Time, note_type, access2)
					VALUES('#read_anc.oname#',#arguments.ID#, 'Event Submitted to realEC', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'F', '1')		
				</CFQUERY>
			<cfelseif #ordertype# eq "AVM">
				<CFQUERY datasource="#request.dsn#">		
					INSERT INTO Title_Notes(FName, Order_ID, N_Note, N_Date, N_Time, note_type, access2)
					VALUES('#read_anc.oname#',#arguments.ID#, 'Event Submitted to realEC', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'AVM', '1')		
				</CFQUERY>
			<cfelseif #ordertype# eq "CR">
				<CFQUERY datasource="#request.dsn#">		
					INSERT INTO Title_Notes(FName, Order_ID, N_Note, N_Date, N_Time, note_type, access2)
					VALUES('#read_anc.oname#',#arguments.ID#, 'Event Submitted to realEC', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'CR', '1')		
				</CFQUERY>
			<cfelseif #trim(ordertype)# is "P">
				<CFQUERY datasource="#request.dsn#">		
					INSERT INTO Title_Notes(FName, Order_ID, N_Note, N_Date, N_Time, note_type, access2)
					VALUES('#read_prop.oname#',#arguments.ID#, 'Event Submitted to realEC', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'P', '1')		
				</CFQUERY>
			</cfif>  --->
			
		<!--- <cfreturn "valid"> --->
	</cffunction>	
	
	<cffunction name="fnValidatedNo">
		<cfargument name="ID" required="true">
		<cfargument name="Desc" required="true">
		<cfargument name="ordertype" required="true">
		
		<CFQUERY name="read_anc" datasource="#request.dsn#">
			Select * from ancillary where Anc_ID =#arguments.ID#
		</cfquery>
		<CFQUERY name="read_prop" datasource="#request.dsn#">
			Select * from property where prop_id =#arguments.ID#
		</cfquery>
		
		 <cfset note="Event Submission to realEC failed - "&#arguments.Desc#>
		 
		 
		<cfif #ordertype# eq "F">
			<CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, Order_ID, N_Note, N_Date, N_Time, note_type, access2)
				VALUES('#read_anc.pname#',#arguments.ID#, '#note#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'F', '1')		
			</CFQUERY>
		<cfelseif #ordertype# eq "AVM">
			<CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, Order_ID, N_Note, N_Date, N_Time, note_type, access2)
				VALUES('#read_anc.pname#',#arguments.ID#, '#note#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'AVM', '1')		
			</CFQUERY>
		<cfelseif #ordertype# eq "CR">
			<CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, Order_ID, N_Note, N_Date, N_Time, note_type, access2)
				VALUES('#read_anc.pname#',#arguments.ID#, '#note#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'CR', '1')		
			</CFQUERY>
		<cfelseif #trim(ordertype)# eq "P">
			<CFQUERY datasource="#request.dsn#" name="prop_comment">		
				INSERT INTO Title_Notes(FName, Order_ID, N_Note, N_Date, N_Time, note_type, access2)
				VALUES('#read_prop.pname#',#arguments.ID#, '#note#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'P', '1')		
			</CFQUERY>
			
		</cfif> 
		<!--- <cfreturn "Not valid"> --->
	</cffunction>   
</cfcomponent>