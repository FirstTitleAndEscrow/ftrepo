<CFPARAM NAME="vd" DEFAULT=0>
<CFIF IsDefined("form.vd") is True>
  <cfif #form.vd# is 1>
  <CFLOCATION URL="/admin_area/abstractors_add.cfm?uid=#URL.uid#&al=#URL.al#">
  <cfelseif #form.vd# is 2>
  <CFLOCATION URL="/admin_area/appraisers_add.cfm?uid=#URL.uid#&al=#URL.al#">
  <cfelseif #form.vd# is 3>
  <CFLOCATION URL="/admin_area/closer_add.cfm?uid=#URL.uid#&al=#URL.al#">
  <cfelseif #form.vd# is 4>
  <CFLOCATION URL="/admin_area/tax_vendor_add.cfm?uid=#URL.uid#&al=#URL.al#">
  <cfelseif #form.vd# is 5>
  <CFLOCATION URL="/admin_area/icl_vendor_add.cfm?uid=#URL.uid#&al=#URL.al#">
  <cfelseif #form.vd# is 7>
  <CFLOCATION URL="/admin_area/deed_prep_vendor_add.cfm?uid=#URL.uid#&al=#URL.al#">
  <cfelse>
  <CFLOCATION URL="/admin_area/payoff_vendor_add.cfm?uid=#URL.uid#&al=#URL.al#">
  </cfif>
</cfif>
