 
  <CFSET a_temp_field_substitution_1 = "">


 <CFSET a_temp_field_substitution_1 = 
 		#ReReplace(read_temp_comm_2.Committment_Item, "[ PROPERTY COUNTY ]", "#read_Title.pcounty#", "ALL")#>

  <CFSET a_temp_field_substitution_1 = 
 		#ReReplace(a_temp_field_substitution_1, "[ PROPERTY STATE ]", "#read_Title.pstate#", "ALL")#>

  <CFSET a_temp_field_substitution_1 = 
 		#ReReplace(a_temp_field_substitution_1, "[ PROPERTY ADDRESS ]", "#read_Title.paddress#", "ALL")#>	
		
   <CFSET a_temp_field_substitution_1 = 
 		#ReReplace(a_temp_field_substitution_1, "[ PAYOFF LENDER 1 NAME ]", "#read_Title.polender1#", "ALL")#>

   <CFSET a_temp_field_substitution_1 = 
 		#ReReplace(a_temp_field_substitution_1, "[ PAYOFF LENDER 2 NAME ]", "#read_Title.polender2#", "ALL")#> 


   <CFSET a_temp_field_substitution_1 = 
 		#ReReplace(a_temp_field_substitution_1, "[ BUYER 1 ]", "#Buyer_1#", "ALL")#>  

   <CFSET a_temp_field_substitution_1 = 
 		#ReReplace(a_temp_field_substitution_1, "[ BUYER 2 ]", "#Buyer_2#", "ALL")#>  

   <CFSET a_temp_field_substitution_1 = 
 		#ReReplace(a_temp_field_substitution_1, "[ SELLER 1 ]", "#Seller_1#", "ALL")#>  
 
   <CFSET a_temp_field_substitution_1 = 
 		#ReReplace(a_temp_field_substitution_1, "[ SELLER 2 ]", "#Seller_2#", "ALL")#> 

