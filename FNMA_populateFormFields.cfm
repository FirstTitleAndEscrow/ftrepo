<!---<cfset SecondRecord0f_04B_150= 0 />
<cfset SecondRecord0f_06G_090= false />--->
<cfset SecondApplicant ="">
<cfset min = "">
<cfset max = "">
<!--- <cfdump var="#formFieldStruct#">
<cfabort> --->
<cfloop collection="#formFieldStruct#" item="key">
    <cfset fieldPart = ListFirst(key,'_')>
       <cfset preVal = ListLast(key,'_')>
	   <cfset proptype_preval= ListLast(key,'_')>  
    <cfswitch expression="#fieldPart#">
	  
	  <cfcase value="03A"><!--- BORROWER / SELLER INFORMATION --->	
			<cfset innerStruct = formFieldStruct[key]>
			<cfset coApplicantIndicator = innerStruct['03A-020']['Data_Stream_Value']>
			<cfif coApplicantIndicator IS 'BW'>
			   <cfset FORM.bwLastName  = innerStruct['03A-060']['Data_Stream_Value']>  <!--- Last Name --->
			   <cfset FORM.bwFirstName = innerStruct['03A-040']['Data_Stream_Value']>  <!--- First Name --->
			   <cfset FORM.bwSocSecNo  = innerStruct['03A-030']['Data_Stream_Value']>  <!--- Social Sec. No. --->
			   <cfset FORM.bwHomePhNo  = innerStruct['03A-080']['Data_Stream_Value']>  <!--- Home Ph. --->
			   <cfset SecondApplicant = coApplicantIndicator>
			   <!--- <cfset FORM.bwWorkPhNo  = innerStruct['04B-150']['Data_Stream_Value']> --->  <!--- Home Ph. --->		   
			</cfif>
			<cfif coApplicantIndicator IS 'QZ'>
			   <cfset FORM.qzLastName  = innerStruct['03A-060']['Data_Stream_Value']>  <!--- Last Name --->
			   <cfset FORM.qzFirstName = innerStruct['03A-040']['Data_Stream_Value']>  <!--- First Name --->
			   <cfset FORM.qzSocSecNo  = innerStruct['03A-030']['Data_Stream_Value']>  <!--- Social Sec. No. --->
			   <cfset FORM.qzHomePhNo  = innerStruct['03A-080']['Data_Stream_Value']>  <!--- Home Ph. --->
			   <cfset SecondApplicant  = coApplicantIndicator>
			   <!--- <cfset FORM.bwWorkPhNo  = innerStruct['04B-150']['Data_Stream_Value']> --->  <!--- Home Ph. --->		   
			</cfif>
	  </cfcase>	
	
	  <cfcase value="02A"><!--- PROPERTY ADDRESS --->
	  		   <cfset innerStruct = formFieldStruct[key]>
			   <cfset FORM.propStreetAddr  = innerStruct['02A-020']['Data_Stream_Value']> <!--- Street Address ---> 
			   <cfset propStreetAddr_02A_020 = FORM.propStreetAddr> 
			    
			   <cfset FORM.City        = innerStruct['02A-030']['Data_Stream_Value']> <!--- City --->
			   <cfset FORM.State       = innerStruct['02A-040']['Data_Stream_Value']> <!--- State --->
			   <cfset FORM.Zip         = innerStruct['02A-050']['Data_Stream_Value']> <!--- Zip --->
		     
		       <!--- Based on city,state and zip get county information from zip_info table --->
		        <cfquery name="getCountyName" Datasource="#request.dsn#">
				  SELECT County 
				  FROM zip_info
				  WHERE
				     City  = '#FORM.City#' AND
				     State = '#FORM.State#' AND
				     Zip   = #FORM.Zip#				
			   </cfquery>
			   
			   <cfset FORM.County = getCountyName.County> 
			   
			   <cfset FORM.propLegalDescDeed  = innerStruct['02A-090']['Data_Stream_Value']> <!--- Legal Description/Deed Reference --->	            
				
		</cfcase>
		
		<cfcase value="02B"><!--- PROPERTY ADDRESS --->
		 		<cfset innerStruct = formFieldStruct[key]>
				 
				 <!---To find Transaction Type --->
				 	
				 <cfset transactionTypeIs   = innerStruct['02B-030']['Data_Stream_Value']> <!---Transaction Type --->				 			
				<cfif transactionTypeIs EQ 16>
				    <cfset FORM.transactionType = 'Purchase'>
				<cfelse>
					<cfset FORM.transactionType = 'Refinance'> 
				</cfif>
				
		 		<!--- 02B-050. If value is 1 then Primary resident else (option 2 and D will go under Investment other) --->
		 		<cfset propertyUseIs   = innerStruct['02B-050']['Data_Stream_Value']> <!--- Property Use --->
		 		<cfif  propertyUseIs EQ 1>
				   <cfset FORM.propertyUse = 'Primary Residence'>
				<Cfelse>
				   <cfset FORM.propertyUse = 'Investment/Other'>
				</cfif>
				
				
				<!--- COMMENTS --->
				<!--- Field Description + value ie.02B-060  and Field Description + value ie.02B-070 --->				
				<cfset fieldDescriptionOf_02B_060 = innerStruct['02B-060']['Data_Stream']>
				<cfset fieldValueOf_02B_060       = innerStruct['02B-060']['Data_Stream_Value']> 
				
				<cfset fieldDescriptionOf_02B_070 = innerStruct['02B-070']['Data_Stream']>
				<cfset fieldValueOf_02B_070       = innerStruct['02B-070']['Data_Stream_Value']> 
		      
		        <!--- <cfset FORM.commentsAre = fieldDescriptionOf_02B_060 & ':' & Trim(fieldValueOf_02B_060) & ' and ' & fieldDescriptionOf_02B_070 & ':' & Trim(fieldValueOf_02B_070)> --->
		        <cfset FORM.commentsAre = fieldDescriptionOf_02B_070 & ':' & Trim(fieldValueOf_02B_070)>
		        
		</cfcase>
		
		<cfcase value="01A"><!--- LOAN NUMBER --->
		       <cfset innerStruct = formFieldStruct[key]>
		 	   <cfset FORM.loanNumber      = Trim(innerStruct['01A-050']['Data_Stream_Value'])> 		 	   
		 	   <cfset loanAmount_01A_060   = Trim(innerStruct['01A-060']['Data_Stream_Value'])>  <!--- value from 01A-060. If transaction type is New Secondary Mortgage, then value comes from 07A-100 ---> 
				
		</cfcase>
				
			
		<cfcase value="04B"><!---Work Phone Number (Multiple))--->
					
				<cfif min eq "">
                      <cfset min=preVal>
                      <cfset innerStruct = formFieldStruct[key]>
                         <cfif  SecondApplicant IS 'QZ'>
					  		 <cfset FORM.qzWorkPhNo = innerStruct['04B-150']['Data_Stream_Value']> 
					     <cfelse>
							 <cfset FORM.bwWorkPhNo = innerStruct['04B-150']['Data_Stream_Value']>
					     </cfif> 
               <cfelse>
               <cfif min gt preVal>
                      <cfset min=preVal>
                      <cfset innerStruct = formFieldStruct[key]>
                          <cfif  SecondApplicant IS 'QZ'>
					  		 <cfset FORM.qzWorkPhNo = innerStruct['04B-150']['Data_Stream_Value']> 
					      <cfelse>
							 <cfset FORM.bwWorkPhNo = innerStruct['04B-150']['Data_Stream_Value']>
					      </cfif> 
               </cfif>
               </cfif>							
		</cfcase>
				
		<cfcase value="07A"><!--- TITLE INSURANCE INFORMATION --->
		        <cfset innerStruct = formFieldStruct[key]>
		 	    
		 	    <cfset transactionTypeIs   = innerStruct['07A-100']['Data_Stream_Value']>  <!--- 16 is for Purchase transaction type. Except 16 all others are Refinance. If field 07A-100 contains some value, then transaction type is New Secondary Mortgage. --->
		        
				    <cfif transactionTypeIs GT 0>
				       <cfset FORM.transactionType = 'New Second Mortgage'>				       
				    </cfif>    
								
				<cfset FORM.prevPurLeaseAmt   =Trim(innerStruct['07A-020']['Data_Stream_Value'])>  <!--- Previous Loan Date :Purchase/Lease Amount Price --->
				<cfset loanAmount_07A_100     = innerStruct['07A-100']['Data_Stream_Value']>  <!--- value from 01A-060. If transaction type is New Secondary Mortgage, then value comes from 07A-100 ---> 
		</cfcase>		
		
		<cfcase value="EH"><!--- TITLE INSURANCE INFORMATION --->
		        <cfset innerStruct = formFieldStruct[key]>		 	    
		 	    <cfset FORM.yourChoice   = innerStruct['EH-030']['Data_Stream_Value']>  				 
		</cfcase>	 
	
	
	    <cfcase value="02D"><!--- TITLE INSURANCE INFORMATION --->		 	    
		 	    <cfset innerStruct = formFieldStruct[key]>
		 	    <cfset FORM.prevPurchasePrice   =Trim(innerStruct['02D-030']['Data_Stream_Value'])>		 	    
			    <cfset FORM.prevPurchaseYear    = Trim(innerStruct['02D-020']['Data_Stream_Value'])>   <!--- value comes from 02D-020.(only year part) --->
		
		        <cfset balanceOfLoan_02D_040    = innerStruct['02D-040']['Data_Stream_Value']>
		</cfcase>
		
	<!---	<cfcase value="06G"><!--- TITLE INSURANCE INFORMATION --->		 	    
		 	    <cfset innerStruct = formFieldStruct[key]>
		 	    <cfset propStreetAddr_06G_030   = innerStruct['06G-030']['Data_Stream_Value']>  <!--- If value for property address is same in 02A-020 and 06G-030, balance of loan=06G-110. Else balance of loan=02D-040---> 
		        <cfset balanceOfLoan_06G_110    = innerStruct['06G-110']['Data_Stream_Value']>
				<!---<cfif SecondRecord0f_06G_090 EQ false>--->
				<cfset FORM.PropertyType 	= innerStruct['06G-090']['Data_Stream_Value']>  <!---06G-090. If entity is not present in the list then choose single family else choose from he list --->
				<!---</cfif>--->
				<!---<cfset SecondRecord0f_06G_090=True />--->
					  
		</cfcase>	--->
		
		<cfcase value="06G">
			<cfif max eq "">
                      <cfset max=proptype_preval>
                      <cfset innerStruct = formFieldStruct[key]>
					    <cfset propStreetAddr_06G_030   = innerStruct['06G-030']['Data_Stream_Value']>  <!--- If value for property address is same in 02A-020 and 06G-030, balance of loan=06G-110. Else balance of loan=02D-040---> 
		        		<cfset balanceOfLoan_06G_110    = innerStruct['06G-110']['Data_Stream_Value']>
                       	<cfset FORM.PropertyType 	= innerStruct['06G-090']['Data_Stream_Value']>  <!---06G-090. If entity is not present in the list then choose single family else choose from he list --->
               <cfelse>
                      <cfif max lt proptype_preval>
                             <cfset max=proptype_preval>
                     	 <cfset innerStruct = formFieldStruct[key]>
                      		<cfset propStreetAddr_06G_030   = innerStruct['06G-030']['Data_Stream_Value']>  <!--- If value for property address is same in 02A-020 and 06G-030, balance of loan=06G-110. Else balance of loan=02D-040---> 
		        			<cfset balanceOfLoan_06G_110    = innerStruct['06G-110']['Data_Stream_Value']>
                       		<cfset FORM.PropertyType 	= innerStruct['06G-090']['Data_Stream_Value']>  <!---06G-090. If entity is not present in the list then choose single family else choose from he list --->
                      </cfif>
               </cfif>	               
		</cfcase>
    </cfswitch>  
</cfloop>

 <cfset FORM.prevPurchaseMonth   = 1> 	 <!--- Default to 1 --->
 <cfset FORM.prevLoanDateMonth   = 1> 	 <!---Previous Loan Date :  Default to 1 --->
 <cfset FORM.prevLoanDateYear    = 1996> <!---Previous Loan Year :  Default to 1996 --->

 <!--- value from 01A-060. If transaction type is New Secondary Mortgage, then value comes from 07A-100 ---> 
 <cfif StructKeyExists(FORM,'transactionType') >
	 <cfif FORM.transactionType IS 'New Second Mortgage'>
	 	 <cfif IsDefined('loanAmount_07A_100')>
	   		<cfset FORM.loanAmount = Trim(loanAmount_07A_100) >
	     <cfelse>
		 	<cfset FORM.loanAmount =0>
		  </cfif> 
	 	<cfelse>
		 	 <cfif IsDefined('loanAmount_01A_060')>
	   			<cfset FORM.loanAmount = Trim(loanAmount_01A_060) >
			<cfelse>
				<cfset FORM.loanAmount = 0 >
			  </cfif>
	 </cfif>
 </cfif>
<!--- If value for property address is same in 02A-020 and 06G-030, balance of loan=06G-110. Else balance of loan=02D-040 --->
	  <cfset FORM.balanceOfLoan =Trim(balanceOfLoan_06G_110)>

 <cfif IsDefined("propStreetAddr_02A_020") AND Isdefined("propStreetAddr_06G_030") >
	<cfif trim(propStreetAddr_02A_020) IS trim(propStreetAddr_06G_030) >
		<cfif IsDefined("balanceOfLoan_06G_110")>
		  <cfset FORM.balanceOfLoan =Trim(balanceOfLoan_06G_110)>
		  <cfelse>
		  <cfset FORM.balanceOfLoan = 0>
		</cfif>
	<cfelse>
		<cfif IsDefined("balanceOfLoan_02D_040")>
		  <cfset FORM.balanceOfLoan =Trim(balanceOfLoan_02D_040)>
		  <cfelse>
		  <cfset FORM.balanceOfLoan = 0>
		</cfif>
	</cfif>
 <cfelse>
	  <cfset FORM.balanceOfLoan = 0>  
 </cfif>

<!---<cfdump var="#FORM#" label="FORM">
 <cfabort>--->

