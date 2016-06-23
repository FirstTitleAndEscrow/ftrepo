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
<!---The Signing Check box must be checked and a price needs to be entered--->

<CFIF (read_company.blnSigning eq "1") AND (#LEN(read_company.FeeSigning)# gte "1")>
    <CFSET Flag = "1">
<CFELSE>
    <CFSET Flag = "0">
</CFIF>

<CFIF #Flag# eq "1">   
<!---Insert into billing--->
    <CFQUERY datasource="#request.dsn#" >
        Insert Into Billing
            (Billing_Order_ID,
             Billing_Type,
             Billing_Company_ID,
             Billing_Borrower,
             Billing_Order_Date)
        Values
            (#get_titleid.Anc_ID#,
             'S',
             #read_company.id#,
             '#get_titleid.bfirstname1# #get_titleid.blastname1#',
             getDate())                    
          </CFQUERY>
<!---Check to make sure that there is a value in Fee Appraisal--->
    <CFIF #LEN(read_company.FeeSigning)# gte "1">
         <CFQUERY datasource="#request.dsn#" >
            Insert Into Billing_Detail
                (Billing_Order_ID,
                 Billing_Type,
                 Billing_Description,
                 Billing_Charge)
            Values
                (#get_titleid.Anc_ID#,
                 'S',
                 'Signing Services',
                 #read_company.FeeSigning#)            
        </CFQUERY>
    </CFIF>
</CFIF>
