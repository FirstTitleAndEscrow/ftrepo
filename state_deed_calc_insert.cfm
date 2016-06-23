
<cfif (IsDefined("url.searchtype") and form.SearchType EQ "Purchase") or (IsDefined("url.searchtype") and url.searchtype eq "Purchase")>

<!--- NJ Transfer Tax --->
	<cfif pstate eq "NJ">
	<cfset state_deed_1 = 0>
	  <cfif form.loanamt_float LT 350000>
		<cfif form.loanamt_float GT 150000>
		  <cfset state_deed_1 = 150000 * 0.004>
	    <cfelse>
	      <cfset state_deed_1 = form.loanamt_float * 0.004>
	    </cfif>
	  
        <cfif form.loanamt_float GT 200000>
		  <cfset state_deed_1 = state_deed_1 + (50000 * 0.0067)>
		  <cfset state_deed_1 = state_deed_1 + ((form.loanamt_float - 200000) * 0.0078)>
	    <cfelse>
	      <cfset state_deed_1 = state_deed_1 + ((form.loanamt_float - 150000) * 0.0067)>
	    </cfif>

	  <cfelse>
	  
	  <cfif form.loanamt_float GT 150000>
		<cfset state_deed_1 = 150000 * 0.0058>
	  <cfelse>
	    <cfset state_deed_1 = form.loanamt_float * 0.0058>
	  </cfif>
	  
      <cfif form.loanamt_float GT 200000>
		<cfset state_deed_1 = state_deed_1 + (50000 * 0.0085)>
	  <cfelse>
	    <cfset state_deed_1 = state_deed_1 + ((form.loanamt_float - 150000) * 0.0085)>
	  </cfif>
	  
	  <cfif form.loanamt_float GT 550000>
		<cfset state_deed_1 = state_deed_1 + (250000 * 0.0096)>
	  <cfelse>
	    <cfset state_deed_1 = state_deed_1 + ((form.loanamt_float - 2000000) * 0.0096)>
	  </cfif>
	  
	  <cfif form.loanamt_float GT 850000>
		<cfset state_deed_1 = state_deed_1 + (300000 * 0.0106)>
	  <cfelse>
	    <cfset state_deed_1 = state_deed_1 + ((form.loanamt_float - 550000) * 0.0106)>
	  </cfif>
	  
	  <cfif form.loanamt_float GT 1000000>
		<cfset state_deed_1 = state_deed_1 + (150000 * 0.0116)>
		<cfset state_deed_1 = state_deed_1 + ((form.loanamt_float - 850000) * 0.0121)>
	  <cfelse>
	    <cfset state_deed_1 = state_deed_1 + ((form.loanamt_float - 850000) * 0.0116)>
	  </cfif>
	  </cfif>
	  <cfif form.LOANAMT_FLOAT GT 1000000>
		<cfset state_deed_1 = state_deed_1 + (form.LOANAMT_FLOAT * 0.01)>
	</cfif>
	</cfif>
<!--- END NJ Transfer Tax --->	

<!--- LA Transfer Tax --->
	<cfif pstate eq "LA" and url.PCNT eq "Orleans" and url.PCTY eq "New Orleans">
	<cfset state_deed_1 = 325>
	</cfif>
<!--- END LA Transfer Tax --->	

<!--- HI Transfer Tax --->
	<cfif pstate eq "HI">
	<cfset state_deed_1 = 0>
	  <cfif form.loanamt_float LT 600000>
		<cfset state_deed_1 = form.loanamt_float * 0.0015>
	  <cfelseif form.loanamt_float LT 1000000>
	    <cfset state_deed_1 = form.loanamt_float * 0.0025>
      <cfelse>
	    <cfset state_deed_1 = form.loanamt_float * 0.0035>
	  </cfif>
	</cfif>
<!--- END HI Transfer Tax --->

<!--- DC Transfer Tax --->
	<cfif pstate eq "DC">
	<cfset state_deed_1 = 0>
	  <cfif form.loanamt_float LT 400000>
		<cfset state_deed_1 = form.loanamt_float * 0.022>
	  <cfelse>
	    <cfset state_deed_1 = form.loanamt_float * 0.029>
	  </cfif>
	</cfif>
<!--- END DC Transfer Tax --->	

<!--- VT Transfer Tax --->
	<cfif pstate eq "VT">
	
	<cfset state_deed_1 = 0>
	  <cfif form.loanamt_float GT 100000>
		<cfset state_deed_1 = 100000 * 0.005>
		<cfset state_deed_1 = state_deed_1 + ((form.loanamt_float-100000) * 0.0125)>
	  <cfelse>
	    <cfset state_deed_1 = form.loanamt_float * 0.005>
	  </cfif>
	</cfif>
<!--- END VT Transfer Tax --->	


<!--- CT Transfer Tax --->
	<cfif pstate eq "CT">
	<cfset state_deed_1 = 0>
	  <cfif form.loanamt_float GT 800000>
		<cfset state_deed_1 = 800000 * 0.0075>
		<cfset state_deed_1 = form.loanamt_float-800000 * 0.0125>
	  <cfelse>
	    <cfset state_deed_1 = form.loanamt_float * 0.0075>
	  </cfif>
	</cfif>
<!--- END CT Transfer Tax --->	

<!--- NY Transfer Tax --->
	<cfif pstate eq "NY">
	   <cfif #url.PCNT# eq "Bronx" or #url.PCNT# eq "Kings" or #url.PCNT# eq "New York" or #url.PCNT# eq "Queens" or #url.PCNT# eq "Richmond">
		    <cfif form.LOANAMT_FLOAT GT 1000000>
		       <cfset state_deed_1 = (form.LOANAMT_FLOAT) * 0.01825>
		          <cfelseif form.LOANAMT_FLOAT GTE 500000>
		            <cfset state_deed_1 = (form.LOANAMT_FLOAT) * 0.01825>
		          <cfelse>
		             <cfset state_deed_1 = (form.LOANAMT_FLOAT) * 0.014>
		          </cfif>
			 </cfif>
	<cfif form.LOANAMT_FLOAT GT 1000000>
		<cfset state_deed_1 = state_deed_1 + (form.LOANAMT_FLOAT * 0.01)>
	</cfif>
	</cfif>
<!--- END NY Transfer Tax --->	



<!--- Alabama Transfer Tax --->
<cfif pstate eq "AL">
		<cfif url.LOANAMT_FLOAT GT url.LOANAMT_FLOAT4>
		<cfset state_deed_1 = (url.LOANAMT_FLOAT-url.LOANAMT_FLOAT4) * read_rec_fees.transfer_tax>
		<cfelse>
		<cfset state_deed_1 = 0>
		</cfif>
	</cfif>
<!--- END Alabama Transfer Tax --->

<cfelse>
<cfset state_deed_1 = state_deed_1>
</cfif>