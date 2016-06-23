<cfinclude template="vendorheader.cfm">
<br><br>
<h2>Thank You Your Information Has Been Submitted</h2>

<cfmail to="jmoore@firsttitleservices.com" from="ebrancaccio@firsttitleservices.com" subject="GSA Order Submitted" type="html">
<cfloop list="#fieldNames#" index="field">
	<cfif field NEQ "action">
		#field#: #Evaluate(field)#<br>
	</cfif>

</cfloop>
</cfmail>
<cfinclude template="vendorfooter.cfm">