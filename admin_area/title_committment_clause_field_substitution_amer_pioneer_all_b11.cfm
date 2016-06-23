 
  <CFSET a_temp_field_substitution = "">
 
 <CFSET a_temp_field_substitution = 
 		#ReReplaceNoCase(Committment_Item, "[ PROPERTY COUNTY ]", "#read_Title.pcounty#", "ALL")#>
 
  <CFSET a_temp_field_substitution = 
 		#ReReplaceNoCase(a_temp_field_substitution, "[ PROPERTY STATE ]", "#read_Title.pstate#", "ALL")#>
 
  <CFSET a_temp_field_substitution = 
 		#ReReplaceNoCase(a_temp_field_substitution, "[ PROPERTY ADDRESS ]", "#read_Title.paddress#", "ALL")#>
		
   <CFSET a_temp_field_substitution = 
 		#ReReplaceNoCase(a_temp_field_substitution, "[ PAYOFF LENDER 1 NAME ]", "#read_Title.polender1#", "ALL")#>
 
   <CFSET a_temp_field_substitution = 
 		#ReReplaceNoCase(a_temp_field_substitution, "[ PAYOFF LENDER 2 NAME ]", "#read_Title.polender2#", "ALL")#> 
 
   <CFSET a_temp_field_substitution = 
 		#ReReplaceNoCase(a_temp_field_substitution, "[ BUYER 1 ]", "#Buyer_1#", "ALL")#>  
 
   <CFSET a_temp_field_substitution = 
 		#ReReplaceNoCase(a_temp_field_substitution, "[ BUYER 2 ]", "#Buyer_2#", "ALL")#>  
 
   <CFSET a_temp_field_substitution = 
 		#ReReplaceNoCase(a_temp_field_substitution, "[ SELLER 1 ]", "#Seller_1#", "ALL")#>  
 
   <CFSET a_temp_field_substitution = 
 		#ReReplaceNoCase(a_temp_field_substitution, "[ SELLER 2 ]", "#Seller_2#", "ALL")#> 
 
   <CFSET a_temp_field_substitution = 
 		#ReReplaceNoCase(a_temp_field_substitution, "[ LOAN TRUSTEE 1 ]", "#Seller_1#", "ALL")#>