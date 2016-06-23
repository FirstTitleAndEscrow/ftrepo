<cfif arguments.COMP_ID eq 3704 or arguments.COMP_ID eq 3746 or  arguments.COMP_ID eq 3747 or  arguments.COMP_ID eq 3748>


	<cfif arguments.LINE_NUMBER eq 1101>
	<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = "EAM2 Settlement">
	</cfif>
	
	<cfif arguments.LINE_NUMBER eq 1102 or arguments.LINE_NUMBER eq 1103 or arguments.LINE_NUMBER eq 1104 or arguments.LINE_NUMBER eq 1109>
	<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = "Worldwide Abstract">
	</cfif>
	
	
	<cfif arguments.LINE_NUMBER eq 1205>
	<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = "">
	</cfif>
	
	
	<cfif (arguments.LINE_NUMBER eq 1301 or arguments.LINE_NUMBER eq 1302 or arguments.LINE_NUMBER eq 1303 or arguments.LINE_NUMBER eq 1304 or arguments.LINE_NUMBER eq 1305 or arguments.LINE_NUMBER eq 1306 or arguments.LINE_NUMBER eq 1307 or arguments.LINE_NUMBER eq 1308 or arguments.LINE_NUMBER eq 1309)>
	<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = "">
	</cfif>
	
	<cfif arguments.LINE_NUMBER eq 1303>
	<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._Type = "Title Closing Pick Up Fee">
	</cfif>
	
	<cfif arguments.LINE_NUMBER eq 1306>
	<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._Type = "ALTA 8.1">
	<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = "">
	</cfif>
	
	
	<cfif arguments.Description  contains 'ALTA'>
	<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._Type = "#arguments.DESCRIPTION#">
	<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = "">
	</cfif>
	
	
	<cfif arguments.LINE_NUMBER eq 1112>
	<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._Type = "Signing fee">
	<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = "">
	</cfif>
	
	<cfif arguments.LINE_NUMBER eq 1205>
	<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._Type = "Recording fee">
	<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = "">
	</cfif>

<cfif (arguments.LINE_NUMBER eq 1301 or arguments.LINE_NUMBER eq 1302 or arguments.LINE_NUMBER eq 1303 or arguments.LINE_NUMBER eq 1304 or arguments.LINE_NUMBER eq 1305 or arguments.LINE_NUMBER eq 1306 or arguments.LINE_NUMBER eq 1307 or arguments.LINE_NUMBER eq 1308 or arguments.LINE_NUMBER eq 1309)>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = " ">
</cfif>

</cfif>

