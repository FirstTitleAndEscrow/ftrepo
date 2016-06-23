<cfset strContent = #getHttpRequestData()#> 
<cfset getxml = #strContent.content#> 
<cfset log_file1="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\Walzcak\REQLog.txt">
		<cffile action = "append" file =#log_file1#  output = #tostring(getxml)# mode = "777">	
 <!--- <cfinvoke 
		component="walzcak/validatexml" 
		method="xmlvalidation" 
		returnvariable=validate>
	<cfinvokeargument name="getxml" value=#getxml#>
</cfinvoke>  

 <!--- <cfoutput>#validate# </cfoutput> --->   

<cfset xmldoc1 = #xmlparse(validate)#> 
<cfset value=XMLSearch(xmldoc1,"//Validated")>
<cfloop index="i" from=1 to="#arraylen(value)#">
	<cfset valid=value[i].xmlText>
</cfloop>
 --->
<cfset xmldoc= #xmlparse(getxml)#>
 
<!--- <cfif #valid# is "Yes">  --->
	<cfset rootelement = #xmldoc.xmlRoot.xmlName#>
	<!---<cfoutput>#rootelement#</cfoutput> --->
	<cfif #rootelement# is "REQUEST_GROUP" >
		
		 <cfinvoke 
			component="walzcak/REQorderManager"
			method="REQORDER">
			<cfinvokeargument name="xmldoc" value="#xmldoc#">
	 	</cfinvoke>
	<cfelse>	
		<cfinvoke 
			component="walzcak/FT_Ordergateway"
			method="FTORDER">
			<cfinvokeargument name="xmldoc" value="#xmldoc#">
	 	</cfinvoke>
	 	<!--- <cfinvoke 
			component="walzcak/FTordergateway"
			method="FTORDER">
			<cfinvokeargument name="xmldoc" value="#xmldoc#">
	 	</cfinvoke> ---> 
<!--- </cfif>	 --->
</cfif>	
  
