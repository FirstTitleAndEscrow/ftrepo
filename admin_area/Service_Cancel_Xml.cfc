<cfcomponent>
	
	<CFINCLUDE Template ="../RealEC/RealEC_variables.cfm">
	
	<!--- Function Flood --->
	<cffunction name="F_Status">
		<cfargument name="Order_no" required="true"> 
		<cfargument name="RECCode" required="true">
		
		<CFQUERY name="sel_anc" datasource="#request.dsn#">
			Select * from ancillary where Anc_ID =#arguments.Order_no#
		</cfquery>	
		<CFQUERY name="sel_notes" datasource="#request.dsn#">
			Select * from title_notes where Order_ID =#arguments.Order_no# and note_type='F'
				and N_Date='#DateFormat(Now(), "m/d/yyyy")#' and N_Time='#TimeFormat(Now(), "HH:mm:ss")#'
		</cfquery>
		
		<cfset TransactionID = #RECClientID#&"-F-"&#arguments.Order_no#>
		<cfset info = GetTimeZoneInfo()>
		<CFSET TodayDate=now()>
			
			<CFXML variable="Cancel_XML">
			   <cfoutput query="sel_anc">
					<RealEC-XML> 
						<Header>   
			    		 	<AckRef>1</AckRef>
			      			<Created><cfoutput>#trim(DateFormat(TodayDate, "yyyy/mm/dd"))# #trim(TimeFormat(TodayDate, "HH:mm:ss"))#</cfoutput></Created>
			      			<Format>RealEC</Format>
							<GMTOffset><cfoutput>#trim(info.utcHourOffset)#</cfoutput></GMTOffset>
							<SourceApp>RealEC Web</SourceApp>
							<SourceID><cfoutput>#trim(SourceID)#</cfoutput></SourceID>
							<SourceVer>1</SourceVer>
							<Version>1</Version>
							<UserName>First Title</UserName>
							<CreatedBy><cfoutput>#trim(RECClientID)#</cfoutput></CreatedBy>
						</Header>
						<Transaction>
							<TransactionID><cfoutput>#trim(TransactionID)#</cfoutput></TransactionID>
							<ProductList>
								<Count>1</Count>
								<Product>
									<UniqueID>1</UniqueID>
									<!--- <cfif #trim(sel_anc.FLOOD)# eq 'Life'><ProductCode>26</ProductCode></cfif><cfif #trim(sel_anc.FLOOD)# eq 'Basic'><ProductCode>25</ProductCode></cfif><cfif #trim(sel_anc.FLOOD)# eq 'Census'><ProductCode>40</ProductCode></cfif><cfif #trim(sel_anc.FLOOD)# eq 'LifeCensus'><ProductCode>41</ProductCode></cfif>
									<ProviderID><cfoutput>#trim(Flood_Provider_ID)#</cfoutput></ProviderID> --->
									<Event>
										<RECCode>#trim(arguments.RECCode)#</RECCode>
										<EventDate><cfoutput>#trim(DateFormat(TodayDate, "yyyy/mm/dd"))# #trim(TimeFormat(TodayDate, "HH:mm:ss"))#</cfoutput></EventDate>
										<ReasonList>
							                  <Reason>
											  	 <ReasonCode>6</ReasonCode>
												 <ReasonDesc>Other</ReasonDesc>
							                     <cfif #arguments.RECCode# eq 220><Comments>#trim(sel_notes.N_Note)#</Comments></cfif>
							                  </Reason>
						            	</ReasonList>
										<cfif #arguments.RECCode# eq 220><Comment>#trim(sel_notes.N_Note)#</Comment></cfif>
									</Event>
								</Product>
							</ProductList>
						</Transaction>	
    	 			</RealEC-XML>
			   </cfoutput>	
		
		</CFXML>
			
		 <cfreturn #Cancel_XML# > 
		
	</cffunction>
	
	
	<!--- Function Credit --->
    <cffunction name="CR_Status">
		<cfargument name="Order_no" required="true"> 
		<cfargument name="RECCode" required="true">
		
		<CFQUERY name="sel_anc" datasource="#request.dsn#">
			Select * from ancillary where Anc_ID =#arguments.Order_no#
		</cfquery>	
		<CFQUERY name="sel_notes" datasource="#request.dsn#">
			Select * from title_notes where Order_ID =#arguments.Order_no# and note_type='CR'
				and N_Date='#DateFormat(Now(), "m/d/yyyy")#' and N_Time='#TimeFormat(Now(), "HH:mm:ss")#'
		</cfquery>
		
			<cfset TransactionID = #RECClientID#&"-CR-"&#arguments.Order_no#>
			<cfset info = GetTimeZoneInfo()>
			<CFSET TodayDate=now()>
							
			<CFXML variable ="Cancel_XML">
				<cfoutput query="sel_anc">
					<RealEC-XML> 
						<Header>   
			    		 	<AckRef>1</AckRef>
			      			<Created><cfoutput>#trim(DateFormat(TodayDate, "yyyy/mm/dd"))# #trim(TimeFormat(TodayDate, "HH:mm:ss"))#</cfoutput></Created>
			      			<Format>RealEC</Format>
							<GMTOffset><cfoutput>#trim(info.utcHourOffset)#</cfoutput></GMTOffset>
							<SourceApp>RealEC Web</SourceApp>
							<SourceID><cfoutput>#trim(SourceID)#</cfoutput></SourceID>
							<SourceVer>1</SourceVer>
							<Version>1</Version>
							<UserName>First Title</UserName>
							<CreatedBy><cfoutput>#trim(RECClientID)#</cfoutput></CreatedBy>
						</Header>
						<Transaction>
							<TransactionID><cfoutput>#trim(TransactionID)#</cfoutput></TransactionID>
							<ProductList>
								<Count>1</Count>
								<Product>
									<UniqueID>1</UniqueID>
									<!--- <cfif #trim(sel_anc.CREDIT)# eq 'safe'><ProductCode>389</ProductCode></cfif><cfif #trim(sel_anc.CREDIT)# eq 'infile'><ProductCode>360</ProductCode></cfif><cfif #trim(sel_anc.CREDIT)# eq 'singleagency'><ProductCode>52</ProductCode></cfif><cfif #trim(sel_anc.CREDIT)# eq 'reissue'><ProductCode>361</ProductCode></cfif><cfif #trim(sel_anc.CREDIT)# eq 'twoagency'><ProductCode>55</ProductCode></cfif>
									<ProviderID><cfoutput>#trim(Credit_Provider_ID)#</cfoutput></ProviderID> --->
									<Event>
										<RECCode>#trim(arguments.RECCode)#</RECCode>
										<EventDate><cfoutput>#trim(DateFormat(TodayDate, "yyyy/mm/dd"))#</cfoutput> <cfoutput>#trim(TimeFormat(TodayDate, "HH:mm:ss"))#</cfoutput></EventDate>
										<ReasonList>
							                  <Reason>
											  	 <ReasonCode>6</ReasonCode>
												 <ReasonDesc>Other</ReasonDesc>
							                     <cfif #arguments.RECCode# eq 220><Comments>#trim(sel_notes.N_Note)#</Comments></cfif>
							                  </Reason>
							            </ReasonList>
										<cfif #arguments.RECCode# eq 220><Comment>#trim(sel_notes.N_Note)#</Comment></cfif>
									</Event>
								</Product>
							</ProductList>
						</Transaction>	
    	 			</RealEC-XML>
				</cfoutput>
		    </CFXML>
			
		 <cfreturn #Cancel_XML# > 
		
	</cffunction>

	<!--- Function AVM --->
	
	<cffunction name="AVM_Status">
		<cfargument name="Order_no" required="true"> 
		<cfargument name="RECCode" required="true">
		
		<CFQUERY name="sel_anc" datasource="#request.dsn#">
			Select * from ancillary where Anc_ID =#arguments.Order_no#
		</cfquery>	
		<cfif #trim(sel_anc.AVM)# eq 'Home'>
				   <CFSET RECClientId = #RECClientID_HVE#>
		</cfif>	

		<CFQUERY name="sel_notes" datasource="#request.dsn#">
			Select * from title_notes where Order_ID =#arguments.Order_no# and note_type='AVM'
				and N_Date='#DateFormat(Now(), "m/d/yyyy")#' and N_Time='#TimeFormat(Now(), "HH:mm:ss")#'
		</cfquery>
		
			<cfset TransactionID = #RECClientID#&"-AVM-"&#arguments.Order_no#>
			<cfset info = GetTimeZoneInfo()>
			<CFSET TodayDate=now()>
							
			<CFXML variable ="Cancel_XML">
				<cfoutput query="sel_anc">
					<RealEC-XML> 
						<Header>   
			    		 	<AckRef>1</AckRef>
			      			<Created><cfoutput>#trim(DateFormat(TodayDate, "yyyy/mm/dd"))# #trim(TimeFormat(TodayDate, "HH:mm:ss"))#</cfoutput></Created>
			      			<Format>RealEC</Format>
							<GMTOffset><cfoutput>#trim(info.utcHourOffset)#</cfoutput></GMTOffset>
							<SourceApp>RealEC Web</SourceApp>
							<SourceID><cfoutput>#trim(SourceID)#</cfoutput></SourceID>
							<SourceVer>1</SourceVer>
							<Version>1</Version>
							<UserName>First Title</UserName>
							<CreatedBy><cfoutput>#trim(RECClientID)#</cfoutput></CreatedBy>
						</Header>
						<Transaction>
							<TransactionID><cfoutput>#trim(TransactionID)#</cfoutput></TransactionID>
							<ProductList>
								<Count>1</Count>
								<Product>
									<UniqueID>1</UniqueID>
									<!--- <cfif #trim(sel_anc.AVM)# eq 'Home'><ProductCode>123</ProductCode></cfif><cfif #trim(sel_anc.AVM)# eq 'First'><ProductCode>339</ProductCode></cfif><cfif #trim(sel_anc.AVM)# eq 'CASA'><ProductCode>181</ProductCode></cfif><cfif #trim(sel_anc.AVM)# eq 'HPA'><ProductCode>291</ProductCode></cfif>
									<ProviderID><cfoutput>#trim(AVM_Provider_ID)#</cfoutput></ProviderID> --->
									<Event>
										<RECCode>#trim(arguments.RECCode)#</RECCode>
										<EventDate><cfoutput>#trim(DateFormat(TodayDate, "yyyy/mm/dd"))#</cfoutput> <cfoutput>#trim(TimeFormat(TodayDate, "HH:mm:ss"))#</cfoutput></EventDate>
										<ReasonList>
							                  <Reason>
											  	 <ReasonCode>6</ReasonCode>
												 <ReasonDesc>Other</ReasonDesc>
							                     <cfif #arguments.RECCode# eq 220><Comments>#trim(sel_notes.N_Note)#</Comments></cfif>
							                  </Reason>
							            </ReasonList>
										<cfif #arguments.RECCode# eq 220><Comment>#trim(sel_notes.N_Note)#</Comment></cfif>
									</Event>
								</Product>
							</ProductList>
						</Transaction>	
    	 			</RealEC-XML>
				</cfoutput>
		
			</CFXML>
			
		 <cfreturn #Cancel_XML# > 
		
	</cffunction>
	
	
	
	
	<!--- //function Property --->
	<cffunction name="Property_Status">
		<cfargument name="Order_no" required="true"> 
		<cfargument name="RECCode" required="true">
		
		<CFQUERY name="sel_anc" datasource="#request.dsn#">
			Select * from Property where prop_id =#arguments.Order_no#
		</cfquery>
		<CFQUERY name="sel_notes" datasource="#request.dsn#">
			Select * from title_notes where Order_ID =#arguments.Order_no# and note_type='P'
				and N_Date='#DateFormat(Now(), "m/d/yyyy")#' and N_Time='#TimeFormat(Now(), "HH:mm:ss")#'
		</cfquery>
		
		<cfset TransactionID = #RECClientID#&"-P-"&#arguments.Order_no#>
		
			<cfset info = GetTimeZoneInfo()>
			<CFSET TodayDate=now()>
							
			<CFXML variable ="Cancel_XML">
				<cfoutput query="sel_anc">
					<RealEC-XML> 
						<Header>   
			    		 	<AckRef>1</AckRef>
			      			<Created><cfoutput>#DateFormat(TodayDate, "yyyy/mm/dd")# #trim(TimeFormat(TodayDate, "HH:mm:ss"))#</cfoutput></Created>
			      			<Format>RealEC</Format>
							<GMTOffset><cfoutput>#info.utcHourOffset#</cfoutput></GMTOffset>
							<SourceApp>RealEC Web</SourceApp>
							<SourceID><cfoutput>#SourceID#</cfoutput></SourceID>
							<SourceVer>1</SourceVer>
							<Version>1</Version>
							<UserName>First Title</UserName>
							<CreatedBy><cfoutput>#RECClientID#</cfoutput></CreatedBy>
						</Header>
						<Transaction>
							<TransactionID><cfoutput>#TransactionID#</cfoutput></TransactionID>
							<ProductList>
								<Count>1</Count>
								<Product>
									<UniqueID>1</UniqueID>
									<!--- <ProductCode>282</ProductCode>
									<ProviderID><cfoutput>#AVM_Provider_ID#</cfoutput></ProviderID> --->
									<Event>
										<RECCode>#arguments.RECCode#</RECCode>
										<EventDate><cfoutput>#DateFormat(TodayDate, "yyyy/mm/dd")#</cfoutput> <cfoutput>#TimeFormat(TodayDate, "HH:mm:ss")#</cfoutput></EventDate>
										<ReasonList>
							                  <Reason>
											  	 <ReasonCode>6</ReasonCode>
												 <ReasonDesc>Other</ReasonDesc>
							                     <cfif #arguments.RECCode# eq 220><Comments>#sel_notes.N_Note#</Comments></cfif>
							                  </Reason>
							            </ReasonList>
										<cfif #arguments.RECCode# eq 220><Comment>#sel_notes.N_Note#</Comment></cfif>
									</Event>
								</Product>
							</ProductList>
						</Transaction>	
    	 			</RealEC-XML>
				</cfoutput>
		
			</CFXML>
			
		 <cfreturn #Cancel_XML# > 
		
	</cffunction>

</cfcomponent>	

	