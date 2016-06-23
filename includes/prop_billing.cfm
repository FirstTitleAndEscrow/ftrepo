
<CFQUERY datasource="#request.dsn#" NAME="read_company">
		SELECT *
		FROM companies
		WHERE ID = '#comp_id#'
		ORDER BY company ASC
</CFQUERY>
<!---If the Flag is equal to 1 that means that there's some billng charges
     and the Order can continue ELSE it skips this whole thing--->
     
<!---Initialize Variable--->
<CFSET Flag = "0">

<CFIF #LEN(read_company.FeeVestingLegal)# gte "1">
    <CFSET Flag = "1">
<CFELSEIF #LEN(read_company.FeeCurrentOwner)# gte "1"> 
    <CFSET Flag = "1">
<CFELSEIF #LEN(read_company.FeeFullSearch)# gte "1">
    <CFSET Flag = "1">
<CFELSE>
    <CFSET Flag = "0">
</CFIF>

<CFIF #Flag# eq "1">        
<!---Add this order to the Billing Table--->
    <CFQUERY datasource="#request.dsn#" >
        Insert Into Billing
            (Billing_Order_ID,
            Billing_Type,
            Billing_Company_ID,
            Billing_Borrower,
            Billing_Order_Date)
        Values
            (#get_propid.prop_ID#,
            'P',
            #read_company.id#,
            '#get_propid.bfirstname1# #get_propid.blastname1#',
            getDate())                    
    </CFQUERY>
    
    <!---Check for fees --->
    <!---If there aren't any fees then we have nothing to bill the client with --->
    <!---Add Charges to the Detail Table--->
    <!---Not only do we need to make sure that this is a full search (seach_type) but we also
        need to make sure that there is a fee for that in place or else we'll get an error--->
    <CFIF (#search_type# eq "B") AND #Len(read_company.FeeFullSearch)# gte "1" >  
        <CFQUERY datasource="#request.dsn#" >
            Insert Into Billing_Detail
                (Billing_Order_ID,
                 Billing_Type,
                 Billing_Description,
                 Billing_Charge)
            Values
                (#get_propid.prop_ID#,
                 'P',
                 'Full Search',
                 #read_company.FeeFullSearch#)            
        </CFQUERY>
    </CFIF> 
    <!---Same thing as above for this one which is "D" or Legal Vesting--->        
    <CFIF (#search_type# eq "D") AND #LEN(read_company.FeeVestingLegal)# gte "1">
        <CFQUERY datasource="#request.dsn#" >
            Insert Into Billing_Detail
                (Billing_Order_ID,
                 Billing_Type,
                 Billing_Description,
                 Billing_Charge)
            Values
                (#get_propid.prop_ID#,
                 'P',
                 'Vesting + Legal',
                 #read_company.FeeVestingLegal#)            
        </CFQUERY>
    </CFIF>      
    <!---And also Current Owner Search--->                              
    <CFIF (#search_type# eq "A") AND #Len(read_company.FeeCurrentOwner)# gte "1" >  
        <CFQUERY datasource="#request.dsn#" >
            Insert Into Billing_Detail
                (Billing_Order_ID,
                 Billing_Type,
                 Billing_Description,
                 Billing_Charge)
            Values
                (#get_propid.prop_ID#,
                 'P',
                 'Current Owner Search',
                 #read_company.FeeCurrentOwner#)            
        </CFQUERY>
    </CFIF>    
</CFIF>
