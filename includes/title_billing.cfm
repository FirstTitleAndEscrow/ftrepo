<CFQUERY datasource="#request.dsn#" NAME="read_company">
        SELECT *
        FROM companies
        WHERE ID = '#comp_id#'
        ORDER BY company ASC
</CFQUERY>
    
<!---Add this order to the Billing Table--->
<!---but first we need to test to make sure there are charges 
     in the Company Table
        
     If the Variable Flag has a one after the IF statements
     then you will know that there are charges set up.
--->

<!---Initialilize Variable--->
<CFSET Flag = "0">
    
<CFIF #read_company.blnCommit# eq "1"> 
    <CFSET Flag = "1">
<CFELSEIF #read_company.blnFullServ# eq "1"> 
    <CFSET Flag = "1">
<CFELSEIF #read_company.blnClearC# eq "1">
    <CFSET Flag = "1">
<CFELSEIF #read_company.blnPayoff# eq "1">
    <CFSET Flag = "1">
<CFELSEIF #read_company.blnDisbursements# eq "1">   
   <CFSET Flag = "1">  
<CFELSEIF #read_company.blnRecording# eq "1" >
    <CFSET Flag = "1">
<CFELSEIF #read_company.blnShipping# eq "1" >
    <CFSET Flag = "1">
<CFELSEIF #Len(read_company.FeeCurrentOwner)# gte "1" >
   <CFSET Flag = "1">
<CFELSEIF #Len(read_company.FeeFullSearch)# gte "1" >
   <CFSET Flag = "1">
<CFELSEIF #Len(read_company.FeePolicyOnly)# gte "1" >
    <CFSET Flag = "1">           
<CFELSE>                       
    <CFSET Flag = "0">
</CFIF>        
   
<CFIF #Flag# eq "1"> 
    <!---Then insert into table Billing
    This is where the basic information is held.
    Not the detail information
    --->
    <CFQUERY datasource="#request.dsn#" >
            Insert Into Billing
                (Billing_Order_ID,
                Billing_Type,
                Billing_Company_ID,
                Billing_Borrower,
                Billing_Order_Date)
            Values
                (#get_titleid.title_ID#,
                'T',
                #read_company.id#,
                '#get_titleid.bfirstname1# #get_titleid.blastname1#',
                getDate())                    
    </CFQUERY>
    
    <!---If this is a Full Search then we need to  make sure that there's a charge for full search--->
    <CFIF #Len(read_company.FeeFullSearch)# gte 1>
            <!---Add Charges to the Detail Table--->
            <CFIF #search_type# eq "B" >  <!---Full Search ---->     
                <CFQUERY datasource="#request.dsn#" >
                    Insert Into Billing_Detail
                    (Billing_Order_ID,
                    Billing_Type,
                    Billing_Description,
                    Billing_Charge)
                Values
                    (#get_titleid.title_ID#,
                    'T',
                    'Full Search',
                     #read_company.FeeFullSearch#)            
                </CFQUERY>
            </CFIF>
        </CFIF>
        <CFIF #Len(read_company.FeeCurrentOwner)# gte 1>
            <CFIF #search_type# eq "A" >  <!---Current Owner Search ---->                                                              
            <!---Insert Current Owner Charge into Detail Table--->
                <CFQUERY datasource="#request.dsn#" >
                    Insert Into Billing_Detail
                    (Billing_Order_ID,
                    Billing_Type,
                    Billing_Description,
                    Billing_Charge)
                Values
                    (#get_titleid.title_ID#,
                    'T',
                    'Current Owner Search',
                     #read_company.FeeCurrentOwner#)            
                </CFQUERY>    
            </CFIF>
        </CFIF>
        <!---Checking for Recording Fees ---->
        <CFIF #read_company.blnRecording# eq 1>
            <CFIF #Len(read_company.FeeRecording)# gte 1 >
                <CFQUERY datasource="#request.dsn#" >
                    Insert Into Billing_Detail
                        (Billing_Order_ID,
                        Billing_Type,
                        Billing_Description,
                        Billing_Charge)
                    Values
                        (#get_titleid.title_ID#,
                        'T',
                        'Recording',
                        #read_company.FeeRecording#)            
                </CFQUERY>
            </CFIF>
        </CFIF>  
        <CFIF #read_company.blnCommit# eq 1>
            <CFIF #Len(read_company.FeePolicyOnly)# gte 1 >
                <CFSET Binder = 0><!---Initialize to prevent errors on insert into Table--->
                <CFSET Binder = 295 + #read_company.FeePolicyOnly#>
            
                <CFQUERY datasource="#request.dsn#" >
                    Insert Into Billing_Detail
                    (Billing_Order_ID,
                    Billing_Type,
                    Billing_Description,
                    Billing_Charge)
                Values
                    (#get_titleid.title_ID#,
                    'T',
                    'Insurance Commitment Policy',
                    #Binder#)            
                </CFQUERY>
            </CFIF>
        </CFIF>                            
 </CFIF>
 <!---End of Billing--->