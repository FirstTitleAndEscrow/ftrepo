 
  <CFSET a_temp_field_substitution = "">
 
 <CFSET a_temp_field_substitution = 
 		#ReReplaceNoCase(Committment_Item, "PROPERTY COUNTY", "#read_Title.pcounty#", "ALL")#>
 
  <CFSET a_temp_field_substitution = 
 		#ReReplaceNoCase(Committment_Item, "PROPERTY STATE", "#read_Title.pstate#", "ALL")#>
 
  <CFSET a_temp_field_substitution = 
 		#ReReplaceNoCase(Committment_Item, "PROPERTY ADDRESS", "#read_Title.paddress#", "ALL")#>
		
   <CFSET a_temp_field_substitution = 
 		#ReReplaceNoCase(Committment_Item, "PAYOFF LENDER 1 NAME", "#read_Title.polender1#", "ALL")#>
 
   <CFSET a_temp_field_substitution = 
 		#ReReplaceNoCase(Committment_Item, "PAYOFF LENDER 2 NAME", "#read_Title.polender2#", "ALL")#> 
 
   <CFSET a_temp_field_substitution = 
 		#ReReplaceNoCase(Committment_Item, "BUYER 1", "#Buyer_1#", "ALL")#>  
 
   <CFSET a_temp_field_substitution = 
 		#ReReplaceNoCase(Committment_Item, "BUYER 2", "#Buyer_2#", "ALL")#>  
 
   <CFSET a_temp_field_substitution = 
 		#ReReplaceNoCase(Committment_Item, "SELLER 1", "#Seller_1#", "ALL")#>  
 
   <CFSET a_temp_field_substitution = 
 		#ReReplaceNoCase(Committment_Item, "SELLER 2", "#Seller_2#", "ALL")#> 
 
   <CFSET a_temp_field_substitution = 
 		#ReReplaceNoCase(Committment_Item, "LOAN TRUSTEE 1", "#Seller_1#", "ALL")#>