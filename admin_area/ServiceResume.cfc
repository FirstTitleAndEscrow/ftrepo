<cfcomponent>
<cffunction name="ResumeMethod">
	<cfargument name="RealEC_xml" required="true">
	<cfargument name="OrderID" required="true">
	
	<CFINCLUDE Template ="RealEC_variables.cfm">
	
	<CFSET xmlDoc=#xmlparse(arguments.RealEC_xml)#>
	
	<CFSET Trans_ID = XmlSearch(xmlDoc, "//TransactionID")>
		<CFLOOP INDEX="i" FROM="1" TO="#ARRAYLEN(Trans_ID)#">
			<cfset Transaction_ID=Trans_ID[i].XmlText>
		</cfloop> 
		
	<cfset Order_Type=listgetat(Transaction_ID,2,'-')>
	
	<CFSET Trans_part = XmlSearch(xmlDoc, "//Comment")>
	<CFLOOP INDEX="i" FROM="1" TO="#ARRAYLEN(Trans_part)#">
		<cfset RealEcComment=Trans_part[i].XmlText>
	</cfloop> 
	
<CFQUERY name="read_anc" datasource="#request.dsn#">
		Select * from ancillary where Anc_ID =#arguments.OrderID#
</cfquery>	
 
<CFQUERY name="read_Prop" datasource="#request.dsn#">
		Select * from property where prop_id =#arguments.OrderID#
</cfquery>	


 <cfif #RealEcComment# is not "">
	 <cfset note="Service Resume - "&#RealEcComment#>
<cfelse>
	<cfset note="Service Resume">
</cfif>
<!--- <br><cfoutput>note==#note#</cfoutput> --->

<cfif #Order_Type# eq "F">
	<CFQUERY datasource="#request.dsn#">		
		INSERT INTO Title_Notes(FName, Order_ID, N_Note, N_Date, N_Time, note_type,access,access2)
		VALUES('#read_anc.oname#',#arguments.OrderID#, '#note#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'F','1','1')		
	</CFQUERY>
	<cfquery datasource="#request.dsn#">
		update Ancillary set  appraisal_status = 'In Process' where anc_id = #arguments.OrderID# 
	</cfquery> 
<cfelseif #Order_Type# eq "AVM">
	 <CFQUERY datasource="#request.dsn#">		
		INSERT INTO Title_Notes(FName, Order_ID, N_Note, N_Date, N_Time, note_type,access,access2)
		VALUES('#read_anc.oname#',#arguments.OrderID#, '#note#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'AVM','1','1')		
	</CFQUERY> 
	<cfquery datasource="#request.dsn#">
		update Ancillary set  appraisal_status = 'In Process' where anc_id = #arguments.OrderID# 
	</cfquery>
<cfelseif #Order_Type# eq "CR">
	<CFQUERY datasource="#request.dsn#">		
		INSERT INTO Title_Notes(FName, Order_ID, N_Note, N_Date, N_Time, note_type,access,access2)
		VALUES('#read_anc.oname#',#arguments.OrderID#, '#note#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'CR','1','1')		
	</CFQUERY> 
	<cfquery datasource="#request.dsn#">
		update Ancillary set  appraisal_status = 'In Process' where anc_id = #arguments.OrderID# 
	</cfquery>
<cfelseif #Order_Type# eq "P">
	<CFQUERY datasource="#request.dsn#">		
		INSERT INTO Title_Notes(FName, Order_ID, N_Note, N_Date, N_Time, note_type,access,access2)
		VALUES('#read_Prop.oname#',#arguments.OrderID#, '#note#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'P', '1','1')		
	</CFQUERY> 
	<cfquery datasource="#request.dsn#">
		update Property set  appraisal_status = 'In Process' where prop_id = #arguments.OrderID# 
	</cfquery>
</cfif>



 <CFMAIL
				TO="#MailTo#"
				FROM="webmaster@firsttitleservices.com"
				SERVER="127.0.0.1"
				Subject="Service Resume"
				TIMEOUT="600"
				type="HTML"
				>

	Services of Order '#Order_Type#-#arguments.OrderID#' has been Resumed.

</CFMAIL> 

</cffunction>
</cfcomponent>