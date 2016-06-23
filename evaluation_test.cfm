<CFSET first_set.var1 = "A">
<CFSET first_set.var2 = "B">
<CFSET first_set.var3 = "C">
<CFSET first_set.var4 = "D">
<CFSET first_set.var5 = "E">
<CFSET first_set.var6 = "F">
<CFSET second_set.var1 = "Ab">
<CFSET second_set.var2 = "B">
<CFSET second_set.var3 = "Cb">
<CFSET second_set.var4 = "D">
<CFSET second_set.var5 = "Eb">
<CFSET second_set.var6 = "Fb">

<cfset field_list = "var1,var2,var3,var4,var5,var6">

<cfloop index="i" list="#field_list#" delimiters=",">
<cfif Evaluate("first_set.#i#") neq  Evaluate("second_set.#i#")>
Add change to db<br>
<cfelse>
Do not add to db<br>
</cfif>
</cfloop>



