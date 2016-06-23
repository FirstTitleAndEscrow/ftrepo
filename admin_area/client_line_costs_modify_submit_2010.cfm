<cfset field_list = #form.fieldnames#>
<cfparam name="form.counties" default="">


<CFOUTPUT>
<B>Field Names:</B> #Form.FieldNames#
<P>
<B>Field Values:</B><BR>
<CFLOOP INDEX="TheField" list="#Form.FieldNames#">
  #TheField# = #Evaluate(TheField)#<BR>
  <cfif #Evaluate(TheField)# eq 'Description of Charge' or #Evaluate(TheField)# eq 'Payee Name' or #Evaluate(TheField)# contains 'Amount'>
  <cfset form[TheField] = ''>
  </cfif>
</CFLOOP>
</CFOUTPUT>



<cfif IsDefined("url.fees")>
<cfset temp = StructClear(form)>
<cfset company_id = #url.company_id#>
<CFQUERY datasource="#request.dsn#" NAME="read_temp_fees">
			SELECT *
			FROM company_billing_values_HUD2010_tempmods
			WHERE tempmod_id = #url.fees#
		</CFQUERY>
 <CFQUERY datasource="#request.dsn#" NAME="read_temp_fees_construction">
			SELECT *
			FROM company_billing_values_CONSTRUCTION_HUD2010_tempmods
			WHERE tempmod_id = #url.fees#
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_temp_fees_b">
			SELECT *
			FROM company_billing_values_b_HUD2010_tempmods
			WHERE tempmod_id = #url.fees#
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_temp_fees_construction_b">
			SELECT *
			FROM company_billing_values_construction_b_HUD2010_tempmods
			WHERE tempmod_id = #url.fees#
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_itemized_fees">
			SELECT *
			FROM ITEMIZED_1101_CHARGES_tempmods
			WHERE tempmod_id = #url.fees#
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_itemized_fees_construction">
			SELECT *
			FROM ITEMIZED_1101_CHARGES_CONSTRUCTION_tempmods
			WHERE tempmod_id = #url.fees#
		</CFQUERY>

<cfset field_count = 1>
<cfloop index="i" list="#read_temp_fees.columnList#" delimiters=",">
<cfset newvar = 'read_temp_fees.' & i>
<cfoutput><cfset "#i#" = Evaluate(#newvar#)></cfoutput>
</cfloop>

<cfset field_count = 1>
<cfloop index="i" list="#read_temp_fees_construction.columnList#" delimiters=",">
<cfset newvar = 'read_temp_fees_construction.' & i>
<cfoutput><cfset "#i#" = Evaluate(#newvar#)></cfoutput>
</cfloop>

<cfset field_count = 1>
<cfloop index="i" list="#read_temp_fees_b.columnList#" delimiters=",">
<cfset newvar = 'read_temp_fees_b.' & i>
<cfoutput><cfset "#i#" = Evaluate(#newvar#)></cfoutput>
</cfloop>

<cfset field_count = 1>
<cfloop index="i" list="#read_temp_fees_construction_b.columnList#" delimiters=",">
<cfset newvar = 'read_temp_fees_construction_b.' & i>
<cfoutput><cfset "#i#" = Evaluate(#newvar#)></cfoutput>
</cfloop>


<cfset field_count = 1>
<cfloop index="i" list="#read_itemized_fees.columnList#" delimiters=",">
<cfset newvar = 'read_itemized_fees.' & i>
<cfoutput><cfset "#i#" = Evaluate(#newvar#)></cfoutput>
</cfloop>

<cfset field_count = 1>
<cfloop index="i" list="#read_itemized_fees_construction.columnList#" delimiters=",">
<cfset newvar = 'read_itemized_fees_construction.' & i>
<cfoutput><cfset "#i#" = Evaluate(#newvar#)></cfoutput>
</cfloop>

</cfif>



<cfparam name="A_0801_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_0801_AMOUNT_REFINANCE" default="">
<cfparam name="A_0802_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_0802_AMOUNT_REFINANCE" default="">
<cfparam name="A_0804_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_0804_PAYTO_REFINANCE" default="">
<cfparam name="A_0804_AMOUNT_REFINANCE" default="">
<cfparam name="A_0805_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_0805_PAYTO_REFINANCE" default="">
<cfparam name="A_0805_AMOUNT_REFINANCE" default="">
<cfparam name="A_0806_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_0806_PAYTO_REFINANCE" default="">
<cfparam name="A_0806_AMOUNT_REFINANCE" default="">
<cfparam name="A_0807_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_0807_PAYTO_REFINANCE" default="">
<cfparam name="A_0807_AMOUNT_REFINANCE" default="">
<cfparam name="A_0808_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_0808_PAYTO_REFINANCE" default="">
<cfparam name="A_0808_AMOUNT_REFINANCE" default="">
<cfparam name="A_0809_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_0809_PAYTO_REFINANCE" default="">
<cfparam name="A_0809_AMOUNT_REFINANCE" default="">
<cfparam name="A_0810_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_0810_PAYTO_REFINANCE" default="">
<cfparam name="A_0810_AMOUNT_REFINANCE" default="">
<cfparam name="A_0811_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_0811_PAYTO_REFINANCE" default="">
<cfparam name="A_0811_AMOUNT_REFINANCE" default="">
<cfparam name="A_0812_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_0812_PAYTO_REFINANCE" default="">
<cfparam name="A_0812_AMOUNT_REFINANCE" default="">
<cfparam name="A_1101_AMOUNT_REFINANCE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_01_REFINANCE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_01_REFINANCE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_01_REFINANCE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_02_REFINANCE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_02_REFINANCE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_02_REFINANCE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_03_REFINANCE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_03_REFINANCE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_03_REFINANCE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_04_REFINANCE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_04_REFINANCE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_04_REFINANCE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_05_REFINANCE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_05_REFINANCE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_05_REFINANCE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_06_REFINANCE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_06_REFINANCE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_06_REFINANCE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_07_REFINANCE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_07_REFINANCE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_07_REFINANCE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_08_REFINANCE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_08_REFINANCE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_08_REFINANCE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_09_REFINANCE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_09_REFINANCE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_09_REFINANCE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_10_REFINANCE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_10_REFINANCE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_10_REFINANCE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_11_REFINANCE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_11_REFINANCE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_11_REFINANCE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_12_REFINANCE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_12_REFINANCE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_12_REFINANCE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_13_REFINANCE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_13_REFINANCE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_13_REFINANCE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_14_REFINANCE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_14_REFINANCE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_14_REFINANCE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_15_REFINANCE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_15_REFINANCE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_15_REFINANCE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_16_REFINANCE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_16_REFINANCE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_16_REFINANCE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_17_REFINANCE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_17_REFINANCE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_17_REFINANCE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_18_REFINANCE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_18_REFINANCE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_18_REFINANCE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_19_REFINANCE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_19_REFINANCE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_19_REFINANCE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_20_REFINANCE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_20_REFINANCE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_20_REFINANCE" default="">
<cfparam name="A_1102_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_1102_PAYTO_REFINANCE" default="">
<cfparam name="A_1102_AMOUNT_REFINANCE" default="">
<cfparam name="A_1102A_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_1102A_PAYTO_REFINANCE" default="">
<cfparam name="A_1102A_AMOUNT_REFINANCE" default="">
<cfparam name="A_1102B_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_1102B_PAYTO_REFINANCE" default="">
<cfparam name="A_1102B_AMOUNT_REFINANCE" default="">
<cfparam name="A_1102C_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_1102C_PAYTO_REFINANCE" default="">
<cfparam name="A_1102C_AMOUNT_REFINANCE" default="">
<cfparam name="A_1102D_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_1102D_PAYTO_REFINANCE" default="">
<cfparam name="A_1102D_AMOUNT_REFINANCE" default="">
<cfparam name="A_1102E_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_1102E_PAYTO_REFINANCE" default="">
<cfparam name="A_1102E_AMOUNT_REFINANCE" default="">
<cfparam name="A_1102F_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_1102F_PAYTO_REFINANCE" default="">
<cfparam name="A_1102F_AMOUNT_REFINANCE" default="">
<cfparam name="A_1102G_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_1102G_PAYTO_REFINANCE" default="">
<cfparam name="A_1102G_AMOUNT_REFINANCE" default="">
<cfparam name="A_1102H_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_1102H_PAYTO_REFINANCE" default="">
<cfparam name="A_1102H_AMOUNT_REFINANCE" default="">
<cfparam name="A_1102I_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_1102I_PAYTO_REFINANCE" default="">
<cfparam name="A_1102I_AMOUNT_REFINANCE" default="">
<cfparam name="A_1109_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_1109_PAYTO_REFINANCE" default="">
<cfparam name="A_1109_AMOUNT_REFINANCE" default="">
<cfparam name="A_1109_OUTSIDE_REFINANCE" default=0>
<cfparam name="A_1110_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_1110_PAYTO_REFINANCE" default="">
<cfparam name="A_1110_AMOUNT_REFINANCE" default="">
<cfparam name="A_1110_OUTSIDE_REFINANCE" default=0>
<cfparam name="A_1111_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_1111_PAYTO_REFINANCE" default="">
<cfparam name="A_1111_AMOUNT_REFINANCE" default="">
<cfparam name="A_1111_OUTSIDE_REFINANCE" default=0>
<cfparam name="A_1112_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_1112_PAYTO_REFINANCE" default="">
<cfparam name="A_1112_AMOUNT_REFINANCE" default="">
<cfparam name="A_1112_OUTSIDE_REFINANCE" default=0>
<cfparam name="A_1113_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_1113_PAYTO_REFINANCE" default="">
<cfparam name="A_1113_AMOUNT_REFINANCE" default="">
<cfparam name="A_1113_OUTSIDE_REFINANCE" default=0>
<!--- <cfparam name="A_1301_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_1301_PAYTO_REFINANCE" default="">
<cfparam name="A_1301_AMOUNT_REFINANCE" default="">
<cfparam name="A_1301_OUTSIDE_REFINANCE" default=0>
 --->
<cfparam name="A_1302_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_1302_PAYTO_REFINANCE" default="">
<cfparam name="A_1302_AMOUNT_REFINANCE" default="">
<cfparam name="A_1302_OUTSIDE_REFINANCE" default=0>
<cfparam name="A_1303_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_1303_PAYTO_REFINANCE" default="">
<cfparam name="A_1303_AMOUNT_REFINANCE" default="">
<cfparam name="A_1303_OUTSIDE_REFINANCE" default=0>
<cfparam name="A_1304_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_1304_PAYTO_REFINANCE" default="">
<cfparam name="A_1304_AMOUNT_REFINANCE" default="">
<cfparam name="A_1304_OUTSIDE_REFINANCE" default=0>
<cfparam name="A_1305_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_1305_PAYTO_REFINANCE" default="">
<cfparam name="A_1305_AMOUNT_REFINANCE" default="">
<cfparam name="A_1305_OUTSIDE_REFINANCE" default=0>
<cfparam name="A_1306_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_1306_PAYTO_REFINANCE" default="">
<cfparam name="A_1306_AMOUNT_REFINANCE" default="">
<cfparam name="A_1306_OUTSIDE_REFINANCE" default=0>
<cfparam name="A_1307_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_1307_PAYTO_REFINANCE" default="">
<cfparam name="A_1307_AMOUNT_REFINANCE" default="">
<cfparam name="A_1307_OUTSIDE_REFINANCE" default=0>
<cfparam name="A_1308_DESCRIPTION_REFINANCE" default="">
<cfparam name="A_1308_PAYTO_REFINANCE" default="">
<cfparam name="A_1308_AMOUNT_REFINANCE" default="">
<cfparam name="A_1308_OUTSIDE_REFINANCE" default=0>


<cfparam name="A_0801_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_0801_AMOUNT_PURCHASE" default="">
<cfparam name="A_0802_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_0802_AMOUNT_PURCHASE" default="">
<cfparam name="A_0804_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_0804_PAYTO_PURCHASE" default="">
<cfparam name="A_0804_AMOUNT_PURCHASE" default="">
<cfparam name="A_0805_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_0805_PAYTO_PURCHASE" default="">
<cfparam name="A_0805_AMOUNT_PURCHASE" default="">
<cfparam name="A_0806_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_0806_PAYTO_PURCHASE" default="">
<cfparam name="A_0806_AMOUNT_PURCHASE" default="">
<cfparam name="A_0807_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_0807_PAYTO_PURCHASE" default="">
<cfparam name="A_0807_AMOUNT_PURCHASE" default="">
<cfparam name="A_0808_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_0808_PAYTO_PURCHASE" default="">
<cfparam name="A_0808_AMOUNT_PURCHASE" default="">
<cfparam name="A_0809_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_0809_PAYTO_PURCHASE" default="">
<cfparam name="A_0809_AMOUNT_PURCHASE" default="">
<cfparam name="A_0810_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_0810_PAYTO_PURCHASE" default="">
<cfparam name="A_0810_AMOUNT_PURCHASE" default="">
<cfparam name="A_0811_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_0811_PAYTO_PURCHASE" default="">
<cfparam name="A_0811_AMOUNT_PURCHASE" default="">
<cfparam name="A_0812_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_0812_PAYTO_PURCHASE" default="">
<cfparam name="A_0812_AMOUNT_PURCHASE" default="">
<cfparam name="A_1101_AMOUNT_PURCHASE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_01_PURCHASE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_01_PURCHASE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_01_PURCHASE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_02_PURCHASE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_02_PURCHASE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_02_PURCHASE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_03_PURCHASE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_03_PURCHASE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_03_PURCHASE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_04_PURCHASE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_04_PURCHASE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_04_PURCHASE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_05_PURCHASE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_05_PURCHASE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_05_PURCHASE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_06_PURCHASE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_06_PURCHASE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_06_PURCHASE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_07_PURCHASE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_07_PURCHASE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_07_PURCHASE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_08_PURCHASE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_08_PURCHASE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_08_PURCHASE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_09_PURCHASE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_09_PURCHASE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_09_PURCHASE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_10_PURCHASE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_10_PURCHASE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_10_PURCHASE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_11_PURCHASE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_11_PURCHASE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_11_PURCHASE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_12_PURCHASE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_12_PURCHASE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_12_PURCHASE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_13_PURCHASE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_13_PURCHASE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_13_PURCHASE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_14_PURCHASE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_14_PURCHASE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_14_PURCHASE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_15_PURCHASE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_15_PURCHASE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_15_PURCHASE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_16_PURCHASE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_16_PURCHASE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_16_PURCHASE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_17_PURCHASE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_17_PURCHASE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_17_PURCHASE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_18_PURCHASE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_18_PURCHASE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_18_PURCHASE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_19_PURCHASE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_19_PURCHASE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_19_PURCHASE" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_20_PURCHASE" default="">
<cfparam name="A_1101_ITEM_AMOUNT_20_PURCHASE" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_20_PURCHASE" default="">

<cfparam name="A_1102_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_1102_PAYTO_PURCHASE" default="">
<cfparam name="A_1102_AMOUNT_PURCHASE" default="">
<cfparam name="A_1102A_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_1102A_PAYTO_PURCHASE" default="">
<cfparam name="A_1102A_AMOUNT_PURCHASE" default="">
<cfparam name="A_1102B_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_1102B_PAYTO_PURCHASE" default="">
<cfparam name="A_1102B_AMOUNT_PURCHASE" default="">
<cfparam name="A_1102C_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_1102C_PAYTO_PURCHASE" default="">
<cfparam name="A_1102C_AMOUNT_PURCHASE" default="">
<cfparam name="A_1102D_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_1102D_PAYTO_PURCHASE" default="">
<cfparam name="A_1102D_AMOUNT_PURCHASE" default="">
<cfparam name="A_1102E_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_1102E_PAYTO_PURCHASE" default="">
<cfparam name="A_1102E_AMOUNT_PURCHASE" default="">
<cfparam name="A_1102F_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_1102F_PAYTO_PURCHASE" default="">
<cfparam name="A_1102F_AMOUNT_PURCHASE" default="">
<cfparam name="A_1102G_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_1102G_PAYTO_PURCHASE" default="">
<cfparam name="A_1102G_AMOUNT_PURCHASE" default="">
<cfparam name="A_1102H_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_1102H_PAYTO_PURCHASE" default="">
<cfparam name="A_1102H_AMOUNT_PURCHASE" default="">
<cfparam name="A_1102I_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_1102I_PAYTO_PURCHASE" default="">
<cfparam name="A_1102I_AMOUNT_PURCHASE" default="">
<cfparam name="A_1109_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_1109_PAYTO_PURCHASE" default="">
<cfparam name="A_1109_AMOUNT_PURCHASE" default="">
<cfparam name="A_1109_OUTSIDE_PURCHASE" default=0>
<cfparam name="A_1110_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_1110_PAYTO_PURCHASE" default="">
<cfparam name="A_1110_AMOUNT_PURCHASE" default="">
<cfparam name="A_1110_OUTSIDE_PURCHASE" default=0>
<cfparam name="A_1111_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_1111_PAYTO_PURCHASE" default="">
<cfparam name="A_1111_AMOUNT_PURCHASE" default="">
<cfparam name="A_1111_OUTSIDE_PURCHASE" default=0>
<cfparam name="A_1112_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_1112_PAYTO_PURCHASE" default="">
<cfparam name="A_1112_AMOUNT_PURCHASE" default="">
<cfparam name="A_1112_OUTSIDE_PURCHASE" default=0>
<cfparam name="A_1113_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_1113_PAYTO_PURCHASE" default="">
<cfparam name="A_1113_AMOUNT_PURCHASE" default="">
<cfparam name="A_1113_OUTSIDE_PURCHASE" default=0>
<!--- <cfparam name="A_1301_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_1301_PAYTO_PURCHASE" default="">
<cfparam name="A_1301_AMOUNT_PURCHASE" default="">
<cfparam name="A_1301_OUTSIDE_PURCHASE" default=0>
 --->
<cfparam name="A_1302_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_1302_PAYTO_PURCHASE" default="">
<cfparam name="A_1302_AMOUNT_PURCHASE" default="">
<cfparam name="A_1302_OUTSIDE_PURCHASE" default=0>
<cfparam name="A_1303_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_1303_PAYTO_PURCHASE" default="">
<cfparam name="A_1303_AMOUNT_PURCHASE" default="">
<cfparam name="A_1303_OUTSIDE_PURCHASE" default=0>
<cfparam name="A_1304_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_1304_PAYTO_PURCHASE" default="">
<cfparam name="A_1304_AMOUNT_PURCHASE" default="">
<cfparam name="A_1304_OUTSIDE_PURCHASE" default=0>
<cfparam name="A_1305_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_1305_PAYTO_PURCHASE" default="">
<cfparam name="A_1305_AMOUNT_PURCHASE" default="">
<cfparam name="A_1305_OUTSIDE_PURCHASE" default=0>
<cfparam name="A_1306_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_1306_PAYTO_PURCHASE" default="">
<cfparam name="A_1306_AMOUNT_PURCHASE" default="">
<cfparam name="A_1306_OUTSIDE_PURCHASE" default=0>
<cfparam name="A_1307_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_1307_PAYTO_PURCHASE" default="">
<cfparam name="A_1307_AMOUNT_PURCHASE" default="">
<cfparam name="A_1307_OUTSIDE_PURCHASE" default=0>
<cfparam name="A_1308_DESCRIPTION_PURCHASE" default="">
<cfparam name="A_1308_PAYTO_PURCHASE" default="">
<cfparam name="A_1308_AMOUNT_PURCHASE" default="">
<cfparam name="A_1308_OUTSIDE_PURCHASE" default=0>
<cfparam name="A_0801_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_0801_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_0802_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_0802_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_0804_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_0804_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_0804_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_0805_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_0805_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_0805_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_0806_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_0806_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_0806_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_0807_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_0807_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_0807_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_0808_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_0808_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_0808_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_0809_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_0809_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_0809_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_0810_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_0810_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_0810_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_0811_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_0811_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_0811_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_0812_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_0812_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_0812_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_1101_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_01_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_01_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_01_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_02_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_02_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_02_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_03_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_03_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_03_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_04_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_04_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_04_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_05_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_05_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_05_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_06_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_06_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_06_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_07_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_07_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_07_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_08_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_08_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_08_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_09_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_09_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_09_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_10_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_10_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_10_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_11_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_11_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_11_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_12_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_12_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_12_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_13_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_13_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_13_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_14_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_14_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_14_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_15_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_15_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_15_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_16_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_16_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_16_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_17_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_17_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_17_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_18_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_18_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_18_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_19_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_19_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_19_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_20_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_20_2ND_NO_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_20_2ND_NO_TI" default="">

<cfparam name="A_1102_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_1102_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_1102_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_1102_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_1102A_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_1102A_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_1102A_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_1102B_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_1102B_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_1102B_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_1102C_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_1102C_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_1102C_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_1102D_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_1102D_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_1102D_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_1102E_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_1102E_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_1102E_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_1102F_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_1102F_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_1102F_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_1102G_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_1102G_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_1102G_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_1102H_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_1102H_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_1102H_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_1102I_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_1102I_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_1102I_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_1109_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_1109_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_1109_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_1109_OUTSIDE_2ND_NO_TI" default=0>
<cfparam name="A_1110_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_1110_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_1110_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_1110_OUTSIDE_2ND_NO_TI" default=0>
<cfparam name="A_1111_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_1111_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_1111_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_1111_OUTSIDE_2ND_NO_TI" default=0>
<cfparam name="A_1112_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_1112_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_1112_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_1112_OUTSIDE_2ND_NO_TI" default=0>
<cfparam name="A_1113_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_1113_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_1113_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_1113_OUTSIDE_2ND_NO_TI" default=0>
<!--- <cfparam name="A_1301_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_1301_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_1301_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_1301_OUTSIDE_2ND_NO_TI" default=0>
 --->
<cfparam name="A_1302_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_1302_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_1302_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_1302_OUTSIDE_2ND_NO_TI" default=0>
<cfparam name="A_1303_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_1303_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_1303_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_1303_OUTSIDE_2ND_NO_TI" default=0>
<cfparam name="A_1304_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_1304_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_1304_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_1304_OUTSIDE_2ND_NO_TI" default=0>
<cfparam name="A_1305_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_1305_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_1305_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_1305_OUTSIDE_2ND_NO_TI" default=0>
<cfparam name="A_1306_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_1306_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_1306_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_1306_OUTSIDE_2ND_NO_TI" default=0>
<cfparam name="A_1307_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_1307_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_1307_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_1307_OUTSIDE_2ND_NO_TI" default=0>
<cfparam name="A_1308_DESCRIPTION_2ND_NO_TI" default="">
<cfparam name="A_1308_PAYTO_2ND_NO_TI" default="">
<cfparam name="A_1308_AMOUNT_2ND_NO_TI" default="">
<cfparam name="A_1308_OUTSIDE_2ND_NO_TI" default=0>
<cfparam name="A_0801_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_0801_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_0802_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_0802_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_0804_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_0804_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_0804_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_0805_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_0805_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_0805_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_0806_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_0806_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_0806_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_0807_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_0807_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_0807_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_0808_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_0808_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_0808_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_0809_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_0809_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_0809_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_0810_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_0810_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_0810_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_0811_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_0811_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_0811_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_0812_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_0812_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_0812_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_1101_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_01_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_01_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_01_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_02_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_02_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_02_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_03_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_03_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_03_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_04_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_04_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_04_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_05_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_05_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_05_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_06_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_06_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_06_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_07_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_07_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_07_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_08_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_08_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_08_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_09_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_09_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_09_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_10_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_10_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_10_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_11_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_11_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_11_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_12_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_12_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_12_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_13_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_13_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_13_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_14_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_14_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_14_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_15_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_15_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_15_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_16_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_16_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_16_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_17_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_17_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_17_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_18_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_18_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_18_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_19_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_19_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_19_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_20_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_AMOUNT_20_2ND_WITH_TI" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_20_2ND_WITH_TI" default="">

<cfparam name="A_1102_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_1102_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_1102_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_1102A_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_1102A_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_1102A_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_1102B_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_1102B_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_1102B_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_1102C_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_1102C_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_1102C_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_1102D_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_1102D_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_1102D_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_1102E_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_1102E_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_1102E_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_1102F_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_1102F_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_1102F_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_1102G_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_1102G_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_1102G_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_1102H_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_1102H_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_1102H_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_1102I_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_1102I_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_1102I_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_1109_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_1109_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_1109_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_1109_OUTSIDE_2ND_WITH_TI" default=0>
<cfparam name="A_1110_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_1110_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_1110_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_1110_OUTSIDE_2ND_WITH_TI" default=0>
<cfparam name="A_1111_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_1111_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_1111_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_1111_OUTSIDE_2ND_WITH_TI" default=0>
<cfparam name="A_1112_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_1112_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_1112_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_1112_OUTSIDE_2ND_WITH_TI" default=0>
<cfparam name="A_1113_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_1113_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_1113_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_1113_OUTSIDE_2ND_WITH_TI" default=0>
<!--- <cfparam name="A_1301_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_1301_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_1301_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_1301_OUTSIDE_2ND_WITH_TI" default=0>
 --->
<cfparam name="A_1302_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_1302_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_1302_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_1302_OUTSIDE_2ND_WITH_TI" default=0>
<cfparam name="A_1303_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_1303_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_1303_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_1303_OUTSIDE_2ND_WITH_TI" default=0>
<cfparam name="A_1304_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_1304_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_1304_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_1304_OUTSIDE_2ND_WITH_TI" default=0>
<cfparam name="A_1305_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_1305_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_1305_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_1305_OUTSIDE_2ND_WITH_TI" default=0>
<cfparam name="A_1306_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_1306_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_1306_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_1306_OUTSIDE_2ND_WITH_TI" default=0>
<cfparam name="A_1307_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_1307_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_1307_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_1307_OUTSIDE_2ND_WITH_TI" default=0>
<cfparam name="A_1308_DESCRIPTION_2ND_WITH_TI" default="">
<cfparam name="A_1308_PAYTO_2ND_WITH_TI" default="">
<cfparam name="A_1308_AMOUNT_2ND_WITH_TI" default="">
<cfparam name="A_1308_OUTSIDE_2ND_WITH_TI" default=0>
<cfparam name="A_0801_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_0801_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_0802_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_0802_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_0804_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_0804_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_0804_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_0805_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_0805_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_0805_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_0806_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_0806_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_0806_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_0807_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_0807_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_0807_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_0808_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_0808_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_0808_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_0809_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_0809_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_0809_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_0810_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_0810_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_0810_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_0811_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_0811_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_0811_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_0812_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_0812_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_0812_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_1101_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_01_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_AMOUNT_01_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_01_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_02_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_AMOUNT_02_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_02_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_03_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_AMOUNT_03_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_03_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_04_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_AMOUNT_04_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_04_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_05_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_AMOUNT_05_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_05_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_06_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_AMOUNT_06_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_06_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_07_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_AMOUNT_07_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_07_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_08_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_AMOUNT_08_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_08_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_09_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_AMOUNT_09_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_09_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_10_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_AMOUNT_10_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_10_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_11_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_AMOUNT_11_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_11_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_12_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_AMOUNT_12_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_12_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_13_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_AMOUNT_13_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_13_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_14_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_AMOUNT_14_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_14_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_15_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_AMOUNT_15_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_15_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_16_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_AMOUNT_16_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_16_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_17_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_AMOUNT_17_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_17_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_18_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_AMOUNT_18_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_18_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_19_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_AMOUNT_19_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_19_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_20_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_AMOUNT_20_PURCHASE_SELLER" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_20_PURCHASE_SELLER" default="">

<cfparam name="A_1102_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_1102_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_1102_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_1102A_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_1102A_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_1102A_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_1102B_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_1102B_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_1102B_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_1102C_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_1102C_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_1102C_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_1102D_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_1102D_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_1102D_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_1102E_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_1102E_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_1102E_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_1102F_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_1102F_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_1102F_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_1102G_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_1102G_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_1102G_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_1102H_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_1102H_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_1102H_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_1102I_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_1102I_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_1102I_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_1109_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_1109_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_1109_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_1109_OUTSIDE_PURCHASE_SELLER" default=0>
<cfparam name="A_1110_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_1110_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_1110_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_1110_OUTSIDE_PURCHASE_SELLER" default=0>
<cfparam name="A_1111_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_1111_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_1111_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_1111_OUTSIDE_PURCHASE_SELLER" default=0>
<cfparam name="A_1112_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_1112_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_1112_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_1112_OUTSIDE_PURCHASE_SELLER" default=0>
<cfparam name="A_1113_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_1113_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_1113_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_1113_OUTSIDE_PURCHASE_SELLER" default=0>
<!--- <cfparam name="A_1301_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_1301_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_1301_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_1301_OUTSIDE_PURCHASE_SELLER" default=0>
 --->
<cfparam name="A_1302_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_1302_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_1302_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_1302_OUTSIDE_PURCHASE_SELLER" default=0>
<cfparam name="A_1303_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_1303_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_1303_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_1303_OUTSIDE_PURCHASE_SELLER" default=0>
<cfparam name="A_1304_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_1304_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_1304_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_1304_OUTSIDE_PURCHASE_SELLER" default=0>
<cfparam name="A_1305_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_1305_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_1305_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_1305_OUTSIDE_PURCHASE_SELLER" default=0>
<cfparam name="A_1306_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_1306_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_1306_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_1306_OUTSIDE_PURCHASE_SELLER" default=0>
<cfparam name="A_1307_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_1307_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_1307_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_1307_OUTSIDE_PURCHASE_SELLER" default=0>
<cfparam name="A_1308_DESCRIPTION_PURCHASE_SELLER" default="">
<cfparam name="A_1308_PAYTO_PURCHASE_SELLER" default="">
<cfparam name="A_1308_AMOUNT_PURCHASE_SELLER" default="">
<cfparam name="A_1308_OUTSIDE_PURCHASE_SELLER" default=0>
<cfparam name="A_0801_DESCRIPTION_CONSTR_1X" default="">
<cfparam name="A_0801_AMOUNT_CONSTR_1X" default="">
<cfparam name="A_0802_DESCRIPTION_CONSTR_1X" default="">
<cfparam name="A_0802_AMOUNT_CONSTR_1X" default="">
<cfparam name="A_0804_DESCRIPTION_CONSTR_1X" default="">
<cfparam name="A_0804_PAYTO_CONSTR_1X" default="">
<cfparam name="A_0804_AMOUNT_CONSTR_1X" default="">
<cfparam name="A_0805_DESCRIPTION_CONSTR_1X" default="">
<cfparam name="A_0805_PAYTO_CONSTR_1X" default="">
<cfparam name="A_0805_AMOUNT_CONSTR_1X" default="">
<cfparam name="A_0806_DESCRIPTION_CONSTR_1X" default="">
<cfparam name="A_0806_PAYTO_CONSTR_1X" default="">
<cfparam name="A_0806_AMOUNT_CONSTR_1X" default="">
<cfparam name="A_0807_DESCRIPTION_CONSTR_1X" default="">
<cfparam name="A_0807_PAYTO_CONSTR_1X" default="">
<cfparam name="A_0807_AMOUNT_CONSTR_1X" default="">
<cfparam name="A_0808_DESCRIPTION_CONSTR_1X" default="">
<cfparam name="A_0808_PAYTO_CONSTR_1X" default="">
<cfparam name="A_0808_AMOUNT_CONSTR_1X" default="">
<cfparam name="A_0809_DESCRIPTION_CONSTR_1X" default="">
<cfparam name="A_0809_PAYTO_CONSTR_1X" default="">
<cfparam name="A_0809_AMOUNT_CONSTR_1X" default="">
<cfparam name="A_0810_DESCRIPTION_CONSTR_1X" default="">
<cfparam name="A_0810_PAYTO_CONSTR_1X" default="">
<cfparam name="A_0810_AMOUNT_CONSTR_1X" default="">
<cfparam name="A_0811_DESCRIPTION_CONSTR_1X" default="">
<cfparam name="A_0811_PAYTO_CONSTR_1X" default="">
<cfparam name="A_0811_AMOUNT_CONSTR_1X" default="">
<cfparam name="A_0812_DESCRIPTION_CONSTR_1X" default="">
<cfparam name="A_0812_PAYTO_CONSTR_1X" default="">
<cfparam name="A_0812_AMOUNT_CONSTR_1X" default="">
<cfparam name="A_1101_AMOUNT_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_01_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_01_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_01_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_02_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_02_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_02_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_03_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_03_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_03_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_04_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_04_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_04_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_05_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_05_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_05_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_06_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_06_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_06_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_07_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_07_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_07_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_08_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_08_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_08_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_09_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_09_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_09_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_10_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_10_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_10_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_11_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_11_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_11_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_12_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_12_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_12_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_13_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_13_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_13_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_14_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_14_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_14_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_15_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_15_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_15_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_16_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_16_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_16_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_17_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_17_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_17_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_18_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_18_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_18_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_19_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_19_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_19_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_20_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_20_CONSTR_1X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_20_CONSTR_1X" default="">
<cfparam name="A_1102_DESCRIPTION_CONSTR_1X" default="">
<cfparam name="A_1102_PAYTO_CONSTR_1X" default="">
<cfparam name="A_1102_AMOUNT_CONSTR_1X" default="">
<cfparam name="A_1109_DESCRIPTION_CONSTR_1X" default="">
<cfparam name="A_1109_PAYTO_CONSTR_1X" default="">
<cfparam name="A_1109_AMOUNT_CONSTR_1X" default="">
<cfparam name="A_1109_OUTSIDE_CONSTR_1X" default=0>
<cfparam name="A_1110_DESCRIPTION_CONSTR_1X" default="">
<cfparam name="A_1110_PAYTO_CONSTR_1X" default="">
<cfparam name="A_1110_AMOUNT_CONSTR_1X" default="">
<cfparam name="A_1110_OUTSIDE_CONSTR_1X" default=0>
<cfparam name="A_1111_DESCRIPTION_CONSTR_1X" default="">
<cfparam name="A_1111_PAYTO_CONSTR_1X" default="">
<cfparam name="A_1111_AMOUNT_CONSTR_1X" default="">
<cfparam name="A_1111_OUTSIDE_CONSTR_1X" default=0>
<cfparam name="A_1112_DESCRIPTION_CONSTR_1X" default="">
<cfparam name="A_1112_PAYTO_CONSTR_1X" default="">
<cfparam name="A_1112_AMOUNT_CONSTR_1X" default="">
<cfparam name="A_1112_OUTSIDE_CONSTR_1X" default=0>
<cfparam name="A_1113_DESCRIPTION_CONSTR_1X" default="">
<cfparam name="A_1113_PAYTO_CONSTR_1X" default="">
<cfparam name="A_1113_AMOUNT_CONSTR_1X" default="">
<cfparam name="A_1113_OUTSIDE_CONSTR_1X" default=0>
<!--- <cfparam name="A_1301_DESCRIPTION_CONSTR_1X" default="">
<cfparam name="A_1301_PAYTO_CONSTR_1X" default="">
<cfparam name="A_1301_AMOUNT_CONSTR_1X" default="">
<cfparam name="A_1301_OUTSIDE_CONSTR_1X" default=0>
 --->
<cfparam name="A_1302_DESCRIPTION_CONSTR_1X" default="">
<cfparam name="A_1302_PAYTO_CONSTR_1X" default="">
<cfparam name="A_1302_AMOUNT_CONSTR_1X" default="">
<cfparam name="A_1302_OUTSIDE_CONSTR_1X" default=0>
<cfparam name="A_1303_DESCRIPTION_CONSTR_1X" default="">
<cfparam name="A_1303_PAYTO_CONSTR_1X" default="">
<cfparam name="A_1303_AMOUNT_CONSTR_1X" default="">
<cfparam name="A_1303_OUTSIDE_CONSTR_1X" default=0>
<cfparam name="A_1304_DESCRIPTION_CONSTR_1X" default="">
<cfparam name="A_1304_PAYTO_CONSTR_1X" default="">
<cfparam name="A_1304_AMOUNT_CONSTR_1X" default="">
<cfparam name="A_1304_OUTSIDE_CONSTR_1X" default=0>
<cfparam name="A_1305_DESCRIPTION_CONSTR_1X" default="">
<cfparam name="A_1305_PAYTO_CONSTR_1X" default="">
<cfparam name="A_1305_AMOUNT_CONSTR_1X" default="">
<cfparam name="A_1305_OUTSIDE_CONSTR_1X" default=0>
<cfparam name="A_1306_DESCRIPTION_CONSTR_1X" default="">
<cfparam name="A_1306_PAYTO_CONSTR_1X" default="">
<cfparam name="A_1306_AMOUNT_CONSTR_1X" default="">
<cfparam name="A_1306_OUTSIDE_CONSTR_1X" default=0>
<cfparam name="A_1307_DESCRIPTION_CONSTR_1X" default="">
<cfparam name="A_1307_PAYTO_CONSTR_1X" default="">
<cfparam name="A_1307_AMOUNT_CONSTR_1X" default="">
<cfparam name="A_1307_OUTSIDE_CONSTR_1X" default=0>
<cfparam name="A_1308_DESCRIPTION_CONSTR_1X" default="">
<cfparam name="A_1308_PAYTO_CONSTR_1X" default="">
<cfparam name="A_1308_AMOUNT_CONSTR_1X" default="">
<cfparam name="A_1308_OUTSIDE_CONSTR_1X" default=0>
<cfparam name="A_0801_DESCRIPTION_CONSTR_2X" default="">
<cfparam name="A_0801_AMOUNT_CONSTR_2X" default="">
<cfparam name="A_0802_DESCRIPTION_CONSTR_2X" default="">
<cfparam name="A_0802_AMOUNT_CONSTR_2X" default="">
<cfparam name="A_0804_DESCRIPTION_CONSTR_2X" default="">
<cfparam name="A_0804_PAYTO_CONSTR_2X" default="">
<cfparam name="A_0804_AMOUNT_CONSTR_2X" default="">
<cfparam name="A_0805_DESCRIPTION_CONSTR_2X" default="">
<cfparam name="A_0805_PAYTO_CONSTR_2X" default="">
<cfparam name="A_0805_AMOUNT_CONSTR_2X" default="">
<cfparam name="A_0806_DESCRIPTION_CONSTR_2X" default="">
<cfparam name="A_0806_PAYTO_CONSTR_2X" default="">
<cfparam name="A_0806_AMOUNT_CONSTR_2X" default="">
<cfparam name="A_0807_DESCRIPTION_CONSTR_2X" default="">
<cfparam name="A_0807_PAYTO_CONSTR_2X" default="">
<cfparam name="A_0807_AMOUNT_CONSTR_2X" default="">
<cfparam name="A_0808_DESCRIPTION_CONSTR_2X" default="">
<cfparam name="A_0808_PAYTO_CONSTR_2X" default="">
<cfparam name="A_0808_AMOUNT_CONSTR_2X" default="">
<cfparam name="A_0809_DESCRIPTION_CONSTR_2X" default="">
<cfparam name="A_0809_PAYTO_CONSTR_2X" default="">
<cfparam name="A_0809_AMOUNT_CONSTR_2X" default="">
<cfparam name="A_0810_DESCRIPTION_CONSTR_2X" default="">
<cfparam name="A_0810_PAYTO_CONSTR_2X" default="">
<cfparam name="A_0810_AMOUNT_CONSTR_2X" default="">
<cfparam name="A_0811_DESCRIPTION_CONSTR_2X" default="">
<cfparam name="A_0811_PAYTO_CONSTR_2X" default="">
<cfparam name="A_0811_AMOUNT_CONSTR_2X" default="">
<cfparam name="A_0812_DESCRIPTION_CONSTR_2X" default="">
<cfparam name="A_0812_PAYTO_CONSTR_2X" default="">
<cfparam name="A_0812_AMOUNT_CONSTR_2X" default="">
<cfparam name="A_1101_AMOUNT_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_01_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_01_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_01_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_02_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_02_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_02_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_03_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_03_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_03_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_04_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_04_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_04_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_05_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_05_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_05_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_06_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_06_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_06_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_07_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_07_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_07_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_08_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_08_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_08_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_09_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_09_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_09_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_10_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_10_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_10_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_11_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_11_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_11_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_12_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_12_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_12_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_13_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_13_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_13_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_14_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_14_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_14_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_15_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_15_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_15_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_16_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_16_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_16_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_17_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_17_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_17_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_18_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_18_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_18_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_19_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_19_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_19_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_20_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_AMOUNT_20_CONSTR_2X" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_20_CONSTR_2X" default="">
<cfparam name="A_1102_DESCRIPTION_CONSTR_2X" default="">
<cfparam name="A_1102_PAYTO_CONSTR_2X" default="">
<cfparam name="A_1102_AMOUNT_CONSTR_2X" default="">
<cfparam name="A_1109_DESCRIPTION_CONSTR_2X" default="">
<cfparam name="A_1109_PAYTO_CONSTR_2X" default="">
<cfparam name="A_1109_AMOUNT_CONSTR_2X" default="">
<cfparam name="A_1109_OUTSIDE_CONSTR_2X" default=0>
<cfparam name="A_1110_DESCRIPTION_CONSTR_2X" default="">
<cfparam name="A_1110_PAYTO_CONSTR_2X" default="">
<cfparam name="A_1110_AMOUNT_CONSTR_2X" default="">
<cfparam name="A_1110_OUTSIDE_CONSTR_2X" default=0>
<cfparam name="A_1111_DESCRIPTION_CONSTR_2X" default="">
<cfparam name="A_1111_PAYTO_CONSTR_2X" default="">
<cfparam name="A_1111_AMOUNT_CONSTR_2X" default="">
<cfparam name="A_1111_OUTSIDE_CONSTR_2X" default=0>
<cfparam name="A_1112_DESCRIPTION_CONSTR_2X" default="">
<cfparam name="A_1112_PAYTO_CONSTR_2X" default="">
<cfparam name="A_1112_AMOUNT_CONSTR_2X" default="">
<cfparam name="A_1112_OUTSIDE_CONSTR_2X" default=0>
<cfparam name="A_1113_DESCRIPTION_CONSTR_2X" default="">
<cfparam name="A_1113_PAYTO_CONSTR_2X" default="">
<cfparam name="A_1113_AMOUNT_CONSTR_2X" default="">
<cfparam name="A_1113_OUTSIDE_CONSTR_2X" default=0>
<!--- <cfparam name="A_1301_DESCRIPTION_CONSTR_2X" default="">
<cfparam name="A_1301_PAYTO_CONSTR_2X" default="">
<cfparam name="A_1301_AMOUNT_CONSTR_2X" default="">
<cfparam name="A_1301_OUTSIDE_CONSTR_2X" default=0>
 --->
<cfparam name="A_1302_DESCRIPTION_CONSTR_2X" default="">
<cfparam name="A_1302_PAYTO_CONSTR_2X" default="">
<cfparam name="A_1302_AMOUNT_CONSTR_2X" default="">
<cfparam name="A_1302_OUTSIDE_CONSTR_2X" default=0>
<cfparam name="A_1303_DESCRIPTION_CONSTR_2X" default="">
<cfparam name="A_1303_PAYTO_CONSTR_2X" default="">
<cfparam name="A_1303_AMOUNT_CONSTR_2X" default="">
<cfparam name="A_1303_OUTSIDE_CONSTR_2X" default=0>
<cfparam name="A_1304_DESCRIPTION_CONSTR_2X" default="">
<cfparam name="A_1304_PAYTO_CONSTR_2X" default="">
<cfparam name="A_1304_AMOUNT_CONSTR_2X" default="">
<cfparam name="A_1304_OUTSIDE_CONSTR_2X" default=0>
<cfparam name="A_1305_DESCRIPTION_CONSTR_2X" default="">
<cfparam name="A_1305_PAYTO_CONSTR_2X" default="">
<cfparam name="A_1305_AMOUNT_CONSTR_2X" default="">
<cfparam name="A_1305_OUTSIDE_CONSTR_2X" default=0>
<cfparam name="A_1306_DESCRIPTION_CONSTR_2X" default="">
<cfparam name="A_1306_PAYTO_CONSTR_2X" default="">
<cfparam name="A_1306_AMOUNT_CONSTR_2X" default="">
<cfparam name="A_1306_OUTSIDE_CONSTR_2X" default=0>
<cfparam name="A_1307_DESCRIPTION_CONSTR_2X" default="">
<cfparam name="A_1307_PAYTO_CONSTR_2X" default="">
<cfparam name="A_1307_AMOUNT_CONSTR_2X" default="">
<cfparam name="A_1307_OUTSIDE_CONSTR_2X" default=0>
<cfparam name="A_1308_DESCRIPTION_CONSTR_2X" default="">
<cfparam name="A_1308_PAYTO_CONSTR_2X" default="">
<cfparam name="A_1308_AMOUNT_CONSTR_2X" default="">
<cfparam name="A_1308_OUTSIDE_CONSTR_2X" default=0>
<cfparam name="A_0801_DESCRIPTION_END_LOAN" default="">
<cfparam name="A_0801_AMOUNT_END_LOAN" default="">
<cfparam name="A_0802_DESCRIPTION_END_LOAN" default="">
<cfparam name="A_0802_AMOUNT_END_LOAN" default="">
<cfparam name="A_0804_DESCRIPTION_END_LOAN" default="">
<cfparam name="A_0804_PAYTO_END_LOAN" default="">
<cfparam name="A_0804_AMOUNT_END_LOAN" default="">
<cfparam name="A_0805_DESCRIPTION_END_LOAN" default="">
<cfparam name="A_0805_PAYTO_END_LOAN" default="">
<cfparam name="A_0805_AMOUNT_END_LOAN" default="">
<cfparam name="A_0806_DESCRIPTION_END_LOAN" default="">
<cfparam name="A_0806_PAYTO_END_LOAN" default="">
<cfparam name="A_0806_AMOUNT_END_LOAN" default="">
<cfparam name="A_0807_DESCRIPTION_END_LOAN" default="">
<cfparam name="A_0807_PAYTO_END_LOAN" default="">
<cfparam name="A_0807_AMOUNT_END_LOAN" default="">
<cfparam name="A_0808_DESCRIPTION_END_LOAN" default="">
<cfparam name="A_0808_PAYTO_END_LOAN" default="">
<cfparam name="A_0808_AMOUNT_END_LOAN" default="">
<cfparam name="A_0809_DESCRIPTION_END_LOAN" default="">
<cfparam name="A_0809_PAYTO_END_LOAN" default="">
<cfparam name="A_0809_AMOUNT_END_LOAN" default="">
<cfparam name="A_0810_DESCRIPTION_END_LOAN" default="">
<cfparam name="A_0810_PAYTO_END_LOAN" default="">
<cfparam name="A_0810_AMOUNT_END_LOAN" default="">
<cfparam name="A_0811_DESCRIPTION_END_LOAN" default="">
<cfparam name="A_0811_PAYTO_END_LOAN" default="">
<cfparam name="A_0811_AMOUNT_END_LOAN" default="">
<cfparam name="A_0812_DESCRIPTION_END_LOAN" default="">
<cfparam name="A_0812_PAYTO_END_LOAN" default="">
<cfparam name="A_0812_AMOUNT_END_LOAN" default="">
<cfparam name="A_1101_AMOUNT_END_LOAN" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_01_END_LOAN" default="">
<cfparam name="A_1101_ITEM_AMOUNT_01_END_LOAN" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_01_END_LOAN" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_02_END_LOAN" default="">
<cfparam name="A_1101_ITEM_AMOUNT_02_END_LOAN" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_02_END_LOAN" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_03_END_LOAN" default="">
<cfparam name="A_1101_ITEM_AMOUNT_03_END_LOAN" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_03_END_LOAN" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_04_END_LOAN" default="">
<cfparam name="A_1101_ITEM_AMOUNT_04_END_LOAN" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_04_END_LOAN" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_05_END_LOAN" default="">
<cfparam name="A_1101_ITEM_AMOUNT_05_END_LOAN" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_05_END_LOAN" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_06_END_LOAN" default="">
<cfparam name="A_1101_ITEM_AMOUNT_06_END_LOAN" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_06_END_LOAN" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_07_END_LOAN" default="">
<cfparam name="A_1101_ITEM_AMOUNT_07_END_LOAN" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_07_END_LOAN" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_08_END_LOAN" default="">
<cfparam name="A_1101_ITEM_AMOUNT_08_END_LOAN" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_08_END_LOAN" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_09_END_LOAN" default="">
<cfparam name="A_1101_ITEM_AMOUNT_09_END_LOAN" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_09_END_LOAN" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_10_END_LOAN" default="">
<cfparam name="A_1101_ITEM_AMOUNT_10_END_LOAN" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_10_END_LOAN" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_11_END_LOAN" default="">
<cfparam name="A_1101_ITEM_AMOUNT_11_END_LOAN" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_11_END_LOAN" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_12_END_LOAN" default="">
<cfparam name="A_1101_ITEM_AMOUNT_12_END_LOAN" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_12_END_LOAN" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_13_END_LOAN" default="">
<cfparam name="A_1101_ITEM_AMOUNT_13_END_LOAN" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_13_END_LOAN" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_14_END_LOAN" default="">
<cfparam name="A_1101_ITEM_AMOUNT_14_END_LOAN" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_14_END_LOAN" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_15_END_LOAN" default="">
<cfparam name="A_1101_ITEM_AMOUNT_15_END_LOAN" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_15_END_LOAN" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_16_END_LOAN" default="">
<cfparam name="A_1101_ITEM_AMOUNT_16_END_LOAN" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_16_END_LOAN" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_17_END_LOAN" default="">
<cfparam name="A_1101_ITEM_AMOUNT_17_END_LOAN" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_17_END_LOAN" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_18_END_LOAN" default="">
<cfparam name="A_1101_ITEM_AMOUNT_18_END_LOAN" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_18_END_LOAN" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_19_END_LOAN" default="">
<cfparam name="A_1101_ITEM_AMOUNT_19_END_LOAN" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_19_END_LOAN" default="">
<cfparam name="A_1101_ITEM_DESCRIPTION_20_END_LOAN" default="">
<cfparam name="A_1101_ITEM_AMOUNT_20_END_LOAN" default="">
<cfparam name="A_1101_ITEM_SELECTABLE_20_END_LOAN" default="">
<cfparam name="A_1102_DESCRIPTION_END_LOAN" default="">
<cfparam name="A_1102_PAYTO_END_LOAN" default="">
<cfparam name="A_1102_AMOUNT_END_LOAN" default="">
<cfparam name="A_1109_DESCRIPTION_END_LOAN" default="">
<cfparam name="A_1109_PAYTO_END_LOAN" default="">
<cfparam name="A_1109_AMOUNT_END_LOAN" default="">
<cfparam name="A_1109_OUTSIDE_END_LOAN" default=0>
<cfparam name="A_1110_DESCRIPTION_END_LOAN" default="">
<cfparam name="A_1110_PAYTO_END_LOAN" default="">
<cfparam name="A_1110_AMOUNT_END_LOAN" default="">
<cfparam name="A_1110_OUTSIDE_END_LOAN" default=0>
<cfparam name="A_1111_DESCRIPTION_END_LOAN" default="">
<cfparam name="A_1111_PAYTO_END_LOAN" default="">
<cfparam name="A_1111_AMOUNT_END_LOAN" default="">
<cfparam name="A_1111_OUTSIDE_END_LOAN" default=0>
<cfparam name="A_1112_DESCRIPTION_END_LOAN" default="">
<cfparam name="A_1112_PAYTO_END_LOAN" default="">
<cfparam name="A_1112_AMOUNT_END_LOAN" default="">
<cfparam name="A_1112_OUTSIDE_END_LOAN" default=0>
<cfparam name="A_1113_DESCRIPTION_END_LOAN" default="">
<cfparam name="A_1113_PAYTO_END_LOAN" default="">
<cfparam name="A_1113_AMOUNT_END_LOAN" default="">
<cfparam name="A_1113_OUTSIDE_END_LOAN" default=0>
<!--- <cfparam name="A_1301_DESCRIPTION_END_LOAN" default="">
<cfparam name="A_1301_PAYTO_END_LOAN" default="">
<cfparam name="A_1301_AMOUNT_END_LOAN" default="">
<cfparam name="A_1301_OUTSIDE_END_LOAN" default=0>
 --->
<cfparam name="A_1302_DESCRIPTION_END_LOAN" default="">
<cfparam name="A_1302_PAYTO_END_LOAN" default="">
<cfparam name="A_1302_AMOUNT_END_LOAN" default="">
<cfparam name="A_1302_OUTSIDE_END_LOAN" default=0>
<cfparam name="A_1303_DESCRIPTION_END_LOAN" default="">
<cfparam name="A_1303_PAYTO_END_LOAN" default="">
<cfparam name="A_1303_AMOUNT_END_LOAN" default="">
<cfparam name="A_1303_OUTSIDE_END_LOAN" default=0>
<cfparam name="A_1304_DESCRIPTION_END_LOAN" default="">
<cfparam name="A_1304_PAYTO_END_LOAN" default="">
<cfparam name="A_1304_AMOUNT_END_LOAN" default="">
<cfparam name="A_1304_OUTSIDE_END_LOAN" default=0>
<cfparam name="A_1305_DESCRIPTION_END_LOAN" default="">
<cfparam name="A_1305_PAYTO_END_LOAN" default="">
<cfparam name="A_1305_AMOUNT_END_LOAN" default="">
<cfparam name="A_1305_OUTSIDE_END_LOAN" default=0>
<cfparam name="A_1306_DESCRIPTION_END_LOAN" default="">
<cfparam name="A_1306_PAYTO_END_LOAN" default="">
<cfparam name="A_1306_AMOUNT_END_LOAN" default="">
<cfparam name="A_1306_OUTSIDE_END_LOAN" default=0>
<cfparam name="A_1307_DESCRIPTION_END_LOAN" default="">
<cfparam name="A_1307_PAYTO_END_LOAN" default="">
<cfparam name="A_1307_AMOUNT_END_LOAN" default="">
<cfparam name="A_1307_OUTSIDE_END_LOAN" default=0>
<cfparam name="A_1308_DESCRIPTION_END_LOAN" default="">
<cfparam name="A_1308_PAYTO_END_LOAN" default="">
<cfparam name="A_1308_AMOUNT_END_LOAN" default="">
<cfparam name="A_1308_OUTSIDE_END_LOAN" default=0>




<cfparam name="url.ft_agencies" default="">

<CFPARAM NAME="New_agency_id" DEFAULT="">
<cfif Len(url.ft_agencies)>
<cfset new_agency_id = ft_agencies>
</cfif>

	<CFQUERY datasource="#request.dsn#" NAME="read_user">
		SELECT *
		FROM First_Admin
		WHERE ID = '#URL.UID#'
</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_company">

			SELECT *
			FROM companies
			WHERE ID = #url.company_id#

		</CFQUERY>





<!--- <cfset read_user.lname = 'Hays'> --->

<cfif #read_user.lname# eq "Hays" OR  #read_user.lname# eq "Elliott">


<CFIF #a_flag# EQ "1">
<CFSET b_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET b_date = #DateFormat(Now(), "mm/dd/yyyy")#>

<CFQUERY datasource="#request.dsn#" name="create_fee">
Insert into company_billing_values_HUD2010_tempmods (billing_id, b_date, b_time)
values(#billing_id#, '#b_date#', '#b_time#')
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_new_id">
			SELECT *
			FROM Company_Billing_Values_HUD2010_tempmods
			WHERE b_time = '#b_time#' AND b_date = '#b_date#'
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" name="create_fee">
Insert into company_billing_values_CONSTRUCTION_HUD2010_tempmods (tempmod_id, billing_id, b_date, b_time)
values(#get_new_id.tempmod_id#, #billing_id#, '#b_date#', '#b_time#')
</CFQUERY>
<CFQUERY datasource="#request.dsn#" name="create_fee">
Insert into company_billing_values_b_HUD2010_tempmods (tempmod_id, billing_id)
values(#get_new_id.tempmod_id#, #billing_id#)
</CFQUERY>
<CFQUERY datasource="#request.dsn#" name="create_fee">
Insert into company_billing_values_construction_b_HUD2010_tempmods (tempmod_id, billing_id)
values(#get_new_id.tempmod_id#, #billing_id#)
</CFQUERY>
<CFQUERY datasource="#request.dsn#" name="create_fee">
Insert into ITEMIZED_1101_CHARGES_tempmods (tempmod_id, billing_id)
values(#get_new_id.tempmod_id#, #billing_id#)
</CFQUERY>
<CFQUERY datasource="#request.dsn#" name="create_fee">
Insert into ITEMIZED_1101_CHARGES_construction_tempmods (tempmod_id, billing_id)
values(#get_new_id.tempmod_id#, #billing_id#)
</CFQUERY>


<CFQUERY datasource="#request.dsn#" name="update_fees">
UPDATE company_billing_values_HUD2010_tempmods
SET
A_0801_DESCRIPTION_REFINANCE='#A_0801_DESCRIPTION_REFINANCE#',
A_0801_AMOUNT_REFINANCE='#A_0801_AMOUNT_REFINANCE#',
A_0802_DESCRIPTION_REFINANCE='#A_0802_DESCRIPTION_REFINANCE#',
A_0802_AMOUNT_REFINANCE='#A_0802_AMOUNT_REFINANCE#',
A_0804_DESCRIPTION_REFINANCE='#A_0804_DESCRIPTION_REFINANCE#',
A_0804_PAYTO_REFINANCE='#A_0804_PAYTO_REFINANCE#',
A_0804_AMOUNT_REFINANCE='#A_0804_AMOUNT_REFINANCE#',
A_0805_DESCRIPTION_REFINANCE='#A_0805_DESCRIPTION_REFINANCE#',
A_0805_PAYTO_REFINANCE='#A_0805_PAYTO_REFINANCE#',
A_0805_AMOUNT_REFINANCE='#A_0805_AMOUNT_REFINANCE#',
A_0806_DESCRIPTION_REFINANCE='#A_0806_DESCRIPTION_REFINANCE#',
A_0806_PAYTO_REFINANCE='#A_0806_PAYTO_REFINANCE#',
A_0806_AMOUNT_REFINANCE='#A_0806_AMOUNT_REFINANCE#',
A_0807_DESCRIPTION_REFINANCE='#A_0807_DESCRIPTION_REFINANCE#',
A_0807_PAYTO_REFINANCE='#A_0807_PAYTO_REFINANCE#',
A_0807_AMOUNT_REFINANCE='#A_0807_AMOUNT_REFINANCE#',
A_0808_DESCRIPTION_REFINANCE='#A_0808_DESCRIPTION_REFINANCE#',
A_0808_PAYTO_REFINANCE='#A_0808_PAYTO_REFINANCE#',
A_0808_AMOUNT_REFINANCE='#A_0808_AMOUNT_REFINANCE#',
A_0809_DESCRIPTION_REFINANCE='#A_0809_DESCRIPTION_REFINANCE#',
A_0809_PAYTO_REFINANCE='#A_0809_PAYTO_REFINANCE#',
A_0809_AMOUNT_REFINANCE='#A_0809_AMOUNT_REFINANCE#',
A_0810_DESCRIPTION_REFINANCE='#A_0810_DESCRIPTION_REFINANCE#',
A_0810_PAYTO_REFINANCE='#A_0810_PAYTO_REFINANCE#',
A_0810_AMOUNT_REFINANCE='#A_0810_AMOUNT_REFINANCE#',
A_0811_DESCRIPTION_REFINANCE='#A_0811_DESCRIPTION_REFINANCE#',
A_0811_PAYTO_REFINANCE='#A_0811_PAYTO_REFINANCE#',
A_0811_AMOUNT_REFINANCE='#A_0811_AMOUNT_REFINANCE#',
A_0812_DESCRIPTION_REFINANCE='#A_0812_DESCRIPTION_REFINANCE#',
A_0812_PAYTO_REFINANCE='#A_0812_PAYTO_REFINANCE#',
A_0812_AMOUNT_REFINANCE='#A_0812_AMOUNT_REFINANCE#',
A_1101_AMOUNT_REFINANCE='#A_1101_AMOUNT_REFINANCE#',
A_1102_DESCRIPTION_REFINANCE='#A_1102_DESCRIPTION_REFINANCE#',
A_1102_PAYTO_REFINANCE='#A_1102_PAYTO_REFINANCE#',
A_1102_AMOUNT_REFINANCE='#A_1102_AMOUNT_REFINANCE#',
A_1109_DESCRIPTION_REFINANCE='#A_1109_DESCRIPTION_REFINANCE#',
A_1109_PAYTO_REFINANCE='#A_1109_PAYTO_REFINANCE#',
A_1109_AMOUNT_REFINANCE='#A_1109_AMOUNT_REFINANCE#',
A_1109_OUTSIDE_REFINANCE='#A_1109_OUTSIDE_REFINANCE#',
A_1110_DESCRIPTION_REFINANCE='#A_1110_DESCRIPTION_REFINANCE#',
A_1110_PAYTO_REFINANCE='#A_1110_PAYTO_REFINANCE#',
A_1110_AMOUNT_REFINANCE='#A_1110_AMOUNT_REFINANCE#',
A_1110_OUTSIDE_REFINANCE='#A_1110_OUTSIDE_REFINANCE#',
A_1111_DESCRIPTION_REFINANCE='#A_1111_DESCRIPTION_REFINANCE#',
A_1111_PAYTO_REFINANCE='#A_1111_PAYTO_REFINANCE#',
A_1111_AMOUNT_REFINANCE='#A_1111_AMOUNT_REFINANCE#',
A_1111_OUTSIDE_REFINANCE='#A_1111_OUTSIDE_REFINANCE#',
A_1112_DESCRIPTION_REFINANCE='#A_1112_DESCRIPTION_REFINANCE#',
A_1112_PAYTO_REFINANCE='#A_1112_PAYTO_REFINANCE#',
A_1112_AMOUNT_REFINANCE='#A_1112_AMOUNT_REFINANCE#',
A_1112_OUTSIDE_REFINANCE='#A_1112_OUTSIDE_REFINANCE#',
A_1113_DESCRIPTION_REFINANCE='#A_1113_DESCRIPTION_REFINANCE#',
A_1113_PAYTO_REFINANCE='#A_1113_PAYTO_REFINANCE#',
A_1113_AMOUNT_REFINANCE='#A_1113_AMOUNT_REFINANCE#',
A_1113_OUTSIDE_REFINANCE='#A_1113_OUTSIDE_REFINANCE#',
A_0801_DESCRIPTION_PURCHASE='#A_0801_DESCRIPTION_PURCHASE#',
A_0801_AMOUNT_PURCHASE='#A_0801_AMOUNT_PURCHASE#',
A_0802_DESCRIPTION_PURCHASE='#A_0802_DESCRIPTION_PURCHASE#',
A_0802_AMOUNT_PURCHASE='#A_0802_AMOUNT_PURCHASE#',
A_0804_DESCRIPTION_PURCHASE='#A_0804_DESCRIPTION_PURCHASE#',
A_0804_PAYTO_PURCHASE='#A_0804_PAYTO_PURCHASE#',
A_0804_AMOUNT_PURCHASE='#A_0804_AMOUNT_PURCHASE#',
A_0805_DESCRIPTION_PURCHASE='#A_0805_DESCRIPTION_PURCHASE#',
A_0805_PAYTO_PURCHASE='#A_0805_PAYTO_PURCHASE#',
A_0805_AMOUNT_PURCHASE='#A_0805_AMOUNT_PURCHASE#',
A_0806_DESCRIPTION_PURCHASE='#A_0806_DESCRIPTION_PURCHASE#',
A_0806_PAYTO_PURCHASE='#A_0806_PAYTO_PURCHASE#',
A_0806_AMOUNT_PURCHASE='#A_0806_AMOUNT_PURCHASE#',
A_0807_DESCRIPTION_PURCHASE='#A_0807_DESCRIPTION_PURCHASE#',
A_0807_PAYTO_PURCHASE='#A_0807_PAYTO_PURCHASE#',
A_0807_AMOUNT_PURCHASE='#A_0807_AMOUNT_PURCHASE#',
A_0808_DESCRIPTION_PURCHASE='#A_0808_DESCRIPTION_PURCHASE#',
A_0808_PAYTO_PURCHASE='#A_0808_PAYTO_PURCHASE#',
A_0808_AMOUNT_PURCHASE='#A_0808_AMOUNT_PURCHASE#',
A_0809_DESCRIPTION_PURCHASE='#A_0809_DESCRIPTION_PURCHASE#',
A_0809_PAYTO_PURCHASE='#A_0809_PAYTO_PURCHASE#',
A_0809_AMOUNT_PURCHASE='#A_0809_AMOUNT_PURCHASE#',
A_0810_DESCRIPTION_PURCHASE='#A_0810_DESCRIPTION_PURCHASE#',
A_0810_PAYTO_PURCHASE='#A_0810_PAYTO_PURCHASE#',
A_0810_AMOUNT_PURCHASE='#A_0810_AMOUNT_PURCHASE#',
A_0811_DESCRIPTION_PURCHASE='#A_0811_DESCRIPTION_PURCHASE#',
A_0811_PAYTO_PURCHASE='#A_0811_PAYTO_PURCHASE#',
A_0811_AMOUNT_PURCHASE='#A_0811_AMOUNT_PURCHASE#',
A_0812_DESCRIPTION_PURCHASE='#A_0812_DESCRIPTION_PURCHASE#',
A_0812_PAYTO_PURCHASE='#A_0812_PAYTO_PURCHASE#',
A_0812_AMOUNT_PURCHASE='#A_0812_AMOUNT_PURCHASE#',
A_1101_AMOUNT_PURCHASE='#A_1101_AMOUNT_PURCHASE#',
A_1102_DESCRIPTION_PURCHASE='#A_1102_DESCRIPTION_PURCHASE#',
A_1102_PAYTO_PURCHASE='#A_1102_PAYTO_PURCHASE#',
A_1102_AMOUNT_PURCHASE='#A_1102_AMOUNT_PURCHASE#',
A_1109_DESCRIPTION_PURCHASE='#A_1109_DESCRIPTION_PURCHASE#',
A_1109_PAYTO_PURCHASE='#A_1109_PAYTO_PURCHASE#',
A_1109_AMOUNT_PURCHASE='#A_1109_AMOUNT_PURCHASE#',
A_1109_OUTSIDE_PURCHASE='#A_1109_OUTSIDE_PURCHASE#',
A_1110_DESCRIPTION_PURCHASE='#A_1110_DESCRIPTION_PURCHASE#',
A_1110_PAYTO_PURCHASE='#A_1110_PAYTO_PURCHASE#',
A_1110_AMOUNT_PURCHASE='#A_1110_AMOUNT_PURCHASE#',
A_1110_OUTSIDE_PURCHASE='#A_1110_OUTSIDE_PURCHASE#',
A_1111_DESCRIPTION_PURCHASE='#A_1111_DESCRIPTION_PURCHASE#',
A_1111_PAYTO_PURCHASE='#A_1111_PAYTO_PURCHASE#',
A_1111_AMOUNT_PURCHASE='#A_1111_AMOUNT_PURCHASE#',
A_1111_OUTSIDE_PURCHASE='#A_1111_OUTSIDE_PURCHASE#',
A_1112_DESCRIPTION_PURCHASE='#A_1112_DESCRIPTION_PURCHASE#',
A_1112_PAYTO_PURCHASE='#A_1112_PAYTO_PURCHASE#',
A_1112_AMOUNT_PURCHASE='#A_1112_AMOUNT_PURCHASE#',
A_1112_OUTSIDE_PURCHASE='#A_1112_OUTSIDE_PURCHASE#',
A_1113_DESCRIPTION_PURCHASE='#A_1113_DESCRIPTION_PURCHASE#',
A_1113_PAYTO_PURCHASE='#A_1113_PAYTO_PURCHASE#',
A_1113_AMOUNT_PURCHASE='#A_1113_AMOUNT_PURCHASE#',
A_1113_OUTSIDE_PURCHASE='#A_1113_OUTSIDE_PURCHASE#',
A_0801_DESCRIPTION_2ND_NO_TI='#A_0801_DESCRIPTION_2ND_NO_TI#',
A_0801_AMOUNT_2ND_NO_TI='#A_0801_AMOUNT_2ND_NO_TI#',
A_0802_DESCRIPTION_2ND_NO_TI='#A_0802_DESCRIPTION_2ND_NO_TI#',
A_0802_AMOUNT_2ND_NO_TI='#A_0802_AMOUNT_2ND_NO_TI#',
A_0804_DESCRIPTION_2ND_NO_TI='#A_0804_DESCRIPTION_2ND_NO_TI#',
A_0804_PAYTO_2ND_NO_TI='#A_0804_PAYTO_2ND_NO_TI#',
A_0804_AMOUNT_2ND_NO_TI='#A_0804_AMOUNT_2ND_NO_TI#',
A_0805_DESCRIPTION_2ND_NO_TI='#A_0805_DESCRIPTION_2ND_NO_TI#',
A_0805_PAYTO_2ND_NO_TI='#A_0805_PAYTO_2ND_NO_TI#',
A_0805_AMOUNT_2ND_NO_TI='#A_0805_AMOUNT_2ND_NO_TI#',
A_0806_DESCRIPTION_2ND_NO_TI='#A_0806_DESCRIPTION_2ND_NO_TI#',
A_0806_PAYTO_2ND_NO_TI='#A_0806_PAYTO_2ND_NO_TI#',
A_0806_AMOUNT_2ND_NO_TI='#A_0806_AMOUNT_2ND_NO_TI#',
A_0807_DESCRIPTION_2ND_NO_TI='#A_0807_DESCRIPTION_2ND_NO_TI#',
A_0807_PAYTO_2ND_NO_TI='#A_0807_PAYTO_2ND_NO_TI#',
A_0807_AMOUNT_2ND_NO_TI='#A_0807_AMOUNT_2ND_NO_TI#',
A_0808_DESCRIPTION_2ND_NO_TI='#A_0808_DESCRIPTION_2ND_NO_TI#',
A_0808_PAYTO_2ND_NO_TI='#A_0808_PAYTO_2ND_NO_TI#',
A_0808_AMOUNT_2ND_NO_TI='#A_0808_AMOUNT_2ND_NO_TI#',
A_0809_DESCRIPTION_2ND_NO_TI='#A_0809_DESCRIPTION_2ND_NO_TI#',
A_0809_PAYTO_2ND_NO_TI='#A_0809_PAYTO_2ND_NO_TI#',
A_0809_AMOUNT_2ND_NO_TI='#A_0809_AMOUNT_2ND_NO_TI#',
A_0810_DESCRIPTION_2ND_NO_TI='#A_0810_DESCRIPTION_2ND_NO_TI#',
A_0810_PAYTO_2ND_NO_TI='#A_0810_PAYTO_2ND_NO_TI#',
A_0810_AMOUNT_2ND_NO_TI='#A_0810_AMOUNT_2ND_NO_TI#',
A_0811_DESCRIPTION_2ND_NO_TI='#A_0811_DESCRIPTION_2ND_NO_TI#',
A_0811_PAYTO_2ND_NO_TI='#A_0811_PAYTO_2ND_NO_TI#',
A_0811_AMOUNT_2ND_NO_TI='#A_0811_AMOUNT_2ND_NO_TI#',
A_0812_DESCRIPTION_2ND_NO_TI='#A_0812_DESCRIPTION_2ND_NO_TI#',
A_0812_PAYTO_2ND_NO_TI='#A_0812_PAYTO_2ND_NO_TI#',
A_0812_AMOUNT_2ND_NO_TI='#A_0812_AMOUNT_2ND_NO_TI#',
A_1101_AMOUNT_2ND_NO_TI='#A_1101_AMOUNT_2ND_NO_TI#',
A_1102_DESCRIPTION_2ND_NO_TI='#A_1102_DESCRIPTION_2ND_NO_TI#',
A_1102_PAYTO_2ND_NO_TI='#A_1102_PAYTO_2ND_NO_TI#',
A_1102_AMOUNT_2ND_NO_TI='#A_1102_AMOUNT_2ND_NO_TI#',
A_1109_DESCRIPTION_2ND_NO_TI='#A_1109_DESCRIPTION_2ND_NO_TI#',
A_1109_PAYTO_2ND_NO_TI='#A_1109_PAYTO_2ND_NO_TI#',
A_1109_AMOUNT_2ND_NO_TI='#A_1109_AMOUNT_2ND_NO_TI#',
A_1109_OUTSIDE_2ND_NO_TI='#A_1109_OUTSIDE_2ND_NO_TI#',
A_1110_DESCRIPTION_2ND_NO_TI='#A_1110_DESCRIPTION_2ND_NO_TI#',
A_1110_PAYTO_2ND_NO_TI='#A_1110_PAYTO_2ND_NO_TI#',
A_1110_AMOUNT_2ND_NO_TI='#A_1110_AMOUNT_2ND_NO_TI#',
A_1110_OUTSIDE_2ND_NO_TI='#A_1110_OUTSIDE_2ND_NO_TI#',
A_1111_DESCRIPTION_2ND_NO_TI='#A_1111_DESCRIPTION_2ND_NO_TI#',
A_1111_PAYTO_2ND_NO_TI='#A_1111_PAYTO_2ND_NO_TI#',
A_1111_AMOUNT_2ND_NO_TI='#A_1111_AMOUNT_2ND_NO_TI#',
A_1111_OUTSIDE_2ND_NO_TI='#A_1111_OUTSIDE_2ND_NO_TI#',
A_1112_DESCRIPTION_2ND_NO_TI='#A_1112_DESCRIPTION_2ND_NO_TI#',
A_1112_PAYTO_2ND_NO_TI='#A_1112_PAYTO_2ND_NO_TI#',
A_1112_AMOUNT_2ND_NO_TI='#A_1112_AMOUNT_2ND_NO_TI#',
A_1112_OUTSIDE_2ND_NO_TI='#A_1112_OUTSIDE_2ND_NO_TI#',
A_1113_DESCRIPTION_2ND_NO_TI='#A_1113_DESCRIPTION_2ND_NO_TI#',
A_1113_PAYTO_2ND_NO_TI='#A_1113_PAYTO_2ND_NO_TI#',
A_1113_AMOUNT_2ND_NO_TI='#A_1113_AMOUNT_2ND_NO_TI#',
A_1113_OUTSIDE_2ND_NO_TI='#A_1113_OUTSIDE_2ND_NO_TI#',
A_0801_DESCRIPTION_2ND_WITH_TI='#A_0801_DESCRIPTION_2ND_WITH_TI#',
A_0801_AMOUNT_2ND_WITH_TI='#A_0801_AMOUNT_2ND_WITH_TI#',
A_0802_DESCRIPTION_2ND_WITH_TI='#A_0802_DESCRIPTION_2ND_WITH_TI#',
A_0802_AMOUNT_2ND_WITH_TI='#A_0802_AMOUNT_2ND_WITH_TI#',
A_0804_DESCRIPTION_2ND_WITH_TI='#A_0804_DESCRIPTION_2ND_WITH_TI#',
A_0804_PAYTO_2ND_WITH_TI='#A_0804_PAYTO_2ND_WITH_TI#',
A_0804_AMOUNT_2ND_WITH_TI='#A_0804_AMOUNT_2ND_WITH_TI#',
A_0805_DESCRIPTION_2ND_WITH_TI='#A_0805_DESCRIPTION_2ND_WITH_TI#',
A_0805_PAYTO_2ND_WITH_TI='#A_0805_PAYTO_2ND_WITH_TI#',
A_0805_AMOUNT_2ND_WITH_TI='#A_0805_AMOUNT_2ND_WITH_TI#',
A_0806_DESCRIPTION_2ND_WITH_TI='#A_0806_DESCRIPTION_2ND_WITH_TI#',
A_0806_PAYTO_2ND_WITH_TI='#A_0806_PAYTO_2ND_WITH_TI#',
A_0806_AMOUNT_2ND_WITH_TI='#A_0806_AMOUNT_2ND_WITH_TI#',
A_0807_DESCRIPTION_2ND_WITH_TI='#A_0807_DESCRIPTION_2ND_WITH_TI#',
A_0807_PAYTO_2ND_WITH_TI='#A_0807_PAYTO_2ND_WITH_TI#',
A_0807_AMOUNT_2ND_WITH_TI='#A_0807_AMOUNT_2ND_WITH_TI#',
A_0808_DESCRIPTION_2ND_WITH_TI='#A_0808_DESCRIPTION_2ND_WITH_TI#',
A_0808_PAYTO_2ND_WITH_TI='#A_0808_PAYTO_2ND_WITH_TI#',
A_0808_AMOUNT_2ND_WITH_TI='#A_0808_AMOUNT_2ND_WITH_TI#',
A_0809_DESCRIPTION_2ND_WITH_TI='#A_0809_DESCRIPTION_2ND_WITH_TI#',
A_0809_PAYTO_2ND_WITH_TI='#A_0809_PAYTO_2ND_WITH_TI#',
A_0809_AMOUNT_2ND_WITH_TI='#A_0809_AMOUNT_2ND_WITH_TI#',
A_0810_DESCRIPTION_2ND_WITH_TI='#A_0810_DESCRIPTION_2ND_WITH_TI#',
A_0810_PAYTO_2ND_WITH_TI='#A_0810_PAYTO_2ND_WITH_TI#',
A_0810_AMOUNT_2ND_WITH_TI='#A_0810_AMOUNT_2ND_WITH_TI#',
A_0811_DESCRIPTION_2ND_WITH_TI='#A_0811_DESCRIPTION_2ND_WITH_TI#',
A_0811_PAYTO_2ND_WITH_TI='#A_0811_PAYTO_2ND_WITH_TI#',
A_0811_AMOUNT_2ND_WITH_TI='#A_0811_AMOUNT_2ND_WITH_TI#',
A_0812_DESCRIPTION_2ND_WITH_TI='#A_0812_DESCRIPTION_2ND_WITH_TI#',
A_0812_PAYTO_2ND_WITH_TI='#A_0812_PAYTO_2ND_WITH_TI#',
A_0812_AMOUNT_2ND_WITH_TI='#A_0812_AMOUNT_2ND_WITH_TI#',
A_1101_AMOUNT_2ND_WITH_TI='#A_1101_AMOUNT_2ND_WITH_TI#',
A_1102_DESCRIPTION_2ND_WITH_TI='#A_1102_DESCRIPTION_2ND_WITH_TI#',
A_1102_PAYTO_2ND_WITH_TI='#A_1102_PAYTO_2ND_WITH_TI#',
A_1102_AMOUNT_2ND_WITH_TI='#A_1102_AMOUNT_2ND_WITH_TI#',
A_1109_DESCRIPTION_2ND_WITH_TI='#A_1109_DESCRIPTION_2ND_WITH_TI#',
A_1109_PAYTO_2ND_WITH_TI='#A_1109_PAYTO_2ND_WITH_TI#',
A_1109_AMOUNT_2ND_WITH_TI='#A_1109_AMOUNT_2ND_WITH_TI#',
A_1109_OUTSIDE_2ND_WITH_TI='#A_1109_OUTSIDE_2ND_WITH_TI#',
A_1110_DESCRIPTION_2ND_WITH_TI='#A_1110_DESCRIPTION_2ND_WITH_TI#',
A_1110_PAYTO_2ND_WITH_TI='#A_1110_PAYTO_2ND_WITH_TI#',
A_1110_AMOUNT_2ND_WITH_TI='#A_1110_AMOUNT_2ND_WITH_TI#',
A_1110_OUTSIDE_2ND_WITH_TI='#A_1110_OUTSIDE_2ND_WITH_TI#',
A_1111_DESCRIPTION_2ND_WITH_TI='#A_1111_DESCRIPTION_2ND_WITH_TI#',
A_1111_PAYTO_2ND_WITH_TI='#A_1111_PAYTO_2ND_WITH_TI#',
A_1111_AMOUNT_2ND_WITH_TI='#A_1111_AMOUNT_2ND_WITH_TI#',
A_1111_OUTSIDE_2ND_WITH_TI='#A_1111_OUTSIDE_2ND_WITH_TI#',
A_1112_DESCRIPTION_2ND_WITH_TI='#A_1112_DESCRIPTION_2ND_WITH_TI#',
A_1112_PAYTO_2ND_WITH_TI='#A_1112_PAYTO_2ND_WITH_TI#',
A_1112_AMOUNT_2ND_WITH_TI='#A_1112_AMOUNT_2ND_WITH_TI#',
A_1112_OUTSIDE_2ND_WITH_TI='#A_1112_OUTSIDE_2ND_WITH_TI#',
A_1113_DESCRIPTION_2ND_WITH_TI='#A_1113_DESCRIPTION_2ND_WITH_TI#',
A_1113_PAYTO_2ND_WITH_TI='#A_1113_PAYTO_2ND_WITH_TI#',
A_1113_AMOUNT_2ND_WITH_TI='#A_1113_AMOUNT_2ND_WITH_TI#',
A_1113_OUTSIDE_2ND_WITH_TI='#A_1113_OUTSIDE_2ND_WITH_TI#',
A_0801_DESCRIPTION_PURCHASE_SELLER='#A_0801_DESCRIPTION_PURCHASE_SELLER#',
A_0801_AMOUNT_PURCHASE_SELLER='#A_0801_AMOUNT_PURCHASE_SELLER#',
A_0802_DESCRIPTION_PURCHASE_SELLER='#A_0802_DESCRIPTION_PURCHASE_SELLER#',
A_0802_AMOUNT_PURCHASE_SELLER='#A_0802_AMOUNT_PURCHASE_SELLER#',
A_0804_DESCRIPTION_PURCHASE_SELLER='#A_0804_DESCRIPTION_PURCHASE_SELLER#',
A_0804_PAYTO_PURCHASE_SELLER='#A_0804_PAYTO_PURCHASE_SELLER#',
A_0804_AMOUNT_PURCHASE_SELLER='#A_0804_AMOUNT_PURCHASE_SELLER#',
A_0805_DESCRIPTION_PURCHASE_SELLER='#A_0805_DESCRIPTION_PURCHASE_SELLER#',
A_0805_PAYTO_PURCHASE_SELLER='#A_0805_PAYTO_PURCHASE_SELLER#',
A_0805_AMOUNT_PURCHASE_SELLER='#A_0805_AMOUNT_PURCHASE_SELLER#',
A_0806_DESCRIPTION_PURCHASE_SELLER='#A_0806_DESCRIPTION_PURCHASE_SELLER#',
A_0806_PAYTO_PURCHASE_SELLER='#A_0806_PAYTO_PURCHASE_SELLER#',
A_0806_AMOUNT_PURCHASE_SELLER='#A_0806_AMOUNT_PURCHASE_SELLER#',
A_0807_DESCRIPTION_PURCHASE_SELLER='#A_0807_DESCRIPTION_PURCHASE_SELLER#',
A_0807_PAYTO_PURCHASE_SELLER='#A_0807_PAYTO_PURCHASE_SELLER#',
A_0807_AMOUNT_PURCHASE_SELLER='#A_0807_AMOUNT_PURCHASE_SELLER#',
A_0808_DESCRIPTION_PURCHASE_SELLER='#A_0808_DESCRIPTION_PURCHASE_SELLER#',
A_0808_PAYTO_PURCHASE_SELLER='#A_0808_PAYTO_PURCHASE_SELLER#',
A_0808_AMOUNT_PURCHASE_SELLER='#A_0808_AMOUNT_PURCHASE_SELLER#',
A_0809_DESCRIPTION_PURCHASE_SELLER='#A_0809_DESCRIPTION_PURCHASE_SELLER#',
A_0809_PAYTO_PURCHASE_SELLER='#A_0809_PAYTO_PURCHASE_SELLER#',
A_0809_AMOUNT_PURCHASE_SELLER='#A_0809_AMOUNT_PURCHASE_SELLER#',
A_0810_DESCRIPTION_PURCHASE_SELLER='#A_0810_DESCRIPTION_PURCHASE_SELLER#',
A_0810_PAYTO_PURCHASE_SELLER='#A_0810_PAYTO_PURCHASE_SELLER#',
A_0810_AMOUNT_PURCHASE_SELLER='#A_0810_AMOUNT_PURCHASE_SELLER#',
A_0811_DESCRIPTION_PURCHASE_SELLER='#A_0811_DESCRIPTION_PURCHASE_SELLER#',
A_0811_PAYTO_PURCHASE_SELLER='#A_0811_PAYTO_PURCHASE_SELLER#',
A_0811_AMOUNT_PURCHASE_SELLER='#A_0811_AMOUNT_PURCHASE_SELLER#',
A_0812_DESCRIPTION_PURCHASE_SELLER='#A_0812_DESCRIPTION_PURCHASE_SELLER#',
A_0812_PAYTO_PURCHASE_SELLER='#A_0812_PAYTO_PURCHASE_SELLER#',
A_0812_AMOUNT_PURCHASE_SELLER='#A_0812_AMOUNT_PURCHASE_SELLER#',
A_1101_AMOUNT_PURCHASE_SELLER='#A_1101_AMOUNT_PURCHASE_SELLER#',
A_1102_DESCRIPTION_PURCHASE_SELLER='#A_1102_DESCRIPTION_PURCHASE_SELLER#',
A_1102_PAYTO_PURCHASE_SELLER='#A_1102_PAYTO_PURCHASE_SELLER#',
A_1102_AMOUNT_PURCHASE_SELLER='#A_1102_AMOUNT_PURCHASE_SELLER#',
A_1109_DESCRIPTION_PURCHASE_SELLER='#A_1109_DESCRIPTION_PURCHASE_SELLER#',
A_1109_PAYTO_PURCHASE_SELLER='#A_1109_PAYTO_PURCHASE_SELLER#',
A_1109_AMOUNT_PURCHASE_SELLER='#A_1109_AMOUNT_PURCHASE_SELLER#',
A_1109_OUTSIDE_PURCHASE_SELLER='#A_1109_OUTSIDE_PURCHASE_SELLER#',
A_1110_DESCRIPTION_PURCHASE_SELLER='#A_1110_DESCRIPTION_PURCHASE_SELLER#',
A_1110_PAYTO_PURCHASE_SELLER='#A_1110_PAYTO_PURCHASE_SELLER#',
A_1110_AMOUNT_PURCHASE_SELLER='#A_1110_AMOUNT_PURCHASE_SELLER#',
A_1110_OUTSIDE_PURCHASE_SELLER='#A_1110_OUTSIDE_PURCHASE_SELLER#',
A_1111_DESCRIPTION_PURCHASE_SELLER='#A_1111_DESCRIPTION_PURCHASE_SELLER#',
A_1111_PAYTO_PURCHASE_SELLER='#A_1111_PAYTO_PURCHASE_SELLER#',
A_1111_AMOUNT_PURCHASE_SELLER='#A_1111_AMOUNT_PURCHASE_SELLER#',
A_1111_OUTSIDE_PURCHASE_SELLER='#A_1111_OUTSIDE_PURCHASE_SELLER#',
A_1112_DESCRIPTION_PURCHASE_SELLER='#A_1112_DESCRIPTION_PURCHASE_SELLER#',
A_1112_PAYTO_PURCHASE_SELLER='#A_1112_PAYTO_PURCHASE_SELLER#',
A_1112_AMOUNT_PURCHASE_SELLER='#A_1112_AMOUNT_PURCHASE_SELLER#',
A_1112_OUTSIDE_PURCHASE_SELLER='#A_1112_OUTSIDE_PURCHASE_SELLER#',
A_1113_DESCRIPTION_PURCHASE_SELLER='#A_1113_DESCRIPTION_PURCHASE_SELLER#',
A_1113_PAYTO_PURCHASE_SELLER='#A_1113_PAYTO_PURCHASE_SELLER#',
A_1113_AMOUNT_PURCHASE_SELLER='#A_1113_AMOUNT_PURCHASE_SELLER#',
A_1113_OUTSIDE_PURCHASE_SELLER='#A_1113_OUTSIDE_PURCHASE_SELLER#'
WHERE tempmod_id = #get_new_id.tempmod_id#
</CFQUERY>



<CFQUERY datasource="#request.dsn#" name="update_fees">
UPDATE company_billing_values_construction_HUD2010_tempmods
SET
A_0801_DESCRIPTION_CONSTR_1X='#A_0801_DESCRIPTION_CONSTR_1X#',
A_0801_AMOUNT_CONSTR_1X='#A_0801_AMOUNT_CONSTR_1X#',
A_0802_DESCRIPTION_CONSTR_1X='#A_0802_DESCRIPTION_CONSTR_1X#',
A_0802_AMOUNT_CONSTR_1X='#A_0802_AMOUNT_CONSTR_1X#',
A_0804_DESCRIPTION_CONSTR_1X='#A_0804_DESCRIPTION_CONSTR_1X#',
A_0804_PAYTO_CONSTR_1X='#A_0804_PAYTO_CONSTR_1X#',
A_0804_AMOUNT_CONSTR_1X='#A_0804_AMOUNT_CONSTR_1X#',
A_0805_DESCRIPTION_CONSTR_1X='#A_0805_DESCRIPTION_CONSTR_1X#',
A_0805_PAYTO_CONSTR_1X='#A_0805_PAYTO_CONSTR_1X#',
A_0805_AMOUNT_CONSTR_1X='#A_0805_AMOUNT_CONSTR_1X#',
A_0806_DESCRIPTION_CONSTR_1X='#A_0806_DESCRIPTION_CONSTR_1X#',
A_0806_PAYTO_CONSTR_1X='#A_0806_PAYTO_CONSTR_1X#',
A_0806_AMOUNT_CONSTR_1X='#A_0806_AMOUNT_CONSTR_1X#',
A_0807_DESCRIPTION_CONSTR_1X='#A_0807_DESCRIPTION_CONSTR_1X#',
A_0807_PAYTO_CONSTR_1X='#A_0807_PAYTO_CONSTR_1X#',
A_0807_AMOUNT_CONSTR_1X='#A_0807_AMOUNT_CONSTR_1X#',
A_0808_DESCRIPTION_CONSTR_1X='#A_0808_DESCRIPTION_CONSTR_1X#',
A_0808_PAYTO_CONSTR_1X='#A_0808_PAYTO_CONSTR_1X#',
A_0808_AMOUNT_CONSTR_1X='#A_0808_AMOUNT_CONSTR_1X#',
A_0809_DESCRIPTION_CONSTR_1X='#A_0809_DESCRIPTION_CONSTR_1X#',
A_0809_PAYTO_CONSTR_1X='#A_0809_PAYTO_CONSTR_1X#',
A_0809_AMOUNT_CONSTR_1X='#A_0809_AMOUNT_CONSTR_1X#',
A_0810_DESCRIPTION_CONSTR_1X='#A_0810_DESCRIPTION_CONSTR_1X#',
A_0810_PAYTO_CONSTR_1X='#A_0810_PAYTO_CONSTR_1X#',
A_0810_AMOUNT_CONSTR_1X='#A_0810_AMOUNT_CONSTR_1X#',
A_0811_DESCRIPTION_CONSTR_1X='#A_0811_DESCRIPTION_CONSTR_1X#',
A_0811_PAYTO_CONSTR_1X='#A_0811_PAYTO_CONSTR_1X#',
A_0811_AMOUNT_CONSTR_1X='#A_0811_AMOUNT_CONSTR_1X#',
A_0812_DESCRIPTION_CONSTR_1X='#A_0812_DESCRIPTION_CONSTR_1X#',
A_0812_PAYTO_CONSTR_1X='#A_0812_PAYTO_CONSTR_1X#',
A_0812_AMOUNT_CONSTR_1X='#A_0812_AMOUNT_CONSTR_1X#',
A_1101_AMOUNT_CONSTR_1X='#A_1101_AMOUNT_CONSTR_1X#',
A_1102_DESCRIPTION_CONSTR_1X='#A_1102_DESCRIPTION_CONSTR_1X#',
A_1102_PAYTO_CONSTR_1X='#A_1102_PAYTO_CONSTR_1X#',
A_1102_AMOUNT_CONSTR_1X='#A_1102_AMOUNT_CONSTR_1X#',
A_1109_DESCRIPTION_CONSTR_1X='#A_1109_DESCRIPTION_CONSTR_1X#',
A_1109_PAYTO_CONSTR_1X='#A_1109_PAYTO_CONSTR_1X#',
A_1109_AMOUNT_CONSTR_1X='#A_1109_AMOUNT_CONSTR_1X#',
A_1109_OUTSIDE_CONSTR_1X='#A_1109_OUTSIDE_CONSTR_1X#',
A_1110_DESCRIPTION_CONSTR_1X='#A_1110_DESCRIPTION_CONSTR_1X#',
A_1110_PAYTO_CONSTR_1X='#A_1110_PAYTO_CONSTR_1X#',
A_1110_AMOUNT_CONSTR_1X='#A_1110_AMOUNT_CONSTR_1X#',
A_1110_OUTSIDE_CONSTR_1X='#A_1110_OUTSIDE_CONSTR_1X#',
A_1111_DESCRIPTION_CONSTR_1X='#A_1111_DESCRIPTION_CONSTR_1X#',
A_1111_PAYTO_CONSTR_1X='#A_1111_PAYTO_CONSTR_1X#',
A_1111_AMOUNT_CONSTR_1X='#A_1111_AMOUNT_CONSTR_1X#',
A_1111_OUTSIDE_CONSTR_1X='#A_1111_OUTSIDE_CONSTR_1X#',
A_1112_DESCRIPTION_CONSTR_1X='#A_1112_DESCRIPTION_CONSTR_1X#',
A_1112_PAYTO_CONSTR_1X='#A_1112_PAYTO_CONSTR_1X#',
A_1112_AMOUNT_CONSTR_1X='#A_1112_AMOUNT_CONSTR_1X#',
A_1112_OUTSIDE_CONSTR_1X='#A_1112_OUTSIDE_CONSTR_1X#',
A_1113_DESCRIPTION_CONSTR_1X='#A_1113_DESCRIPTION_CONSTR_1X#',
A_1113_PAYTO_CONSTR_1X='#A_1113_PAYTO_CONSTR_1X#',
A_1113_AMOUNT_CONSTR_1X='#A_1113_AMOUNT_CONSTR_1X#',
A_1113_OUTSIDE_CONSTR_1X='#A_1113_OUTSIDE_CONSTR_1X#',
A_0801_DESCRIPTION_CONSTR_2X='#A_0801_DESCRIPTION_CONSTR_2X#',
A_0801_AMOUNT_CONSTR_2X='#A_0801_AMOUNT_CONSTR_2X#',
A_0802_DESCRIPTION_CONSTR_2X='#A_0802_DESCRIPTION_CONSTR_2X#',
A_0802_AMOUNT_CONSTR_2X='#A_0802_AMOUNT_CONSTR_2X#',
A_0804_DESCRIPTION_CONSTR_2X='#A_0804_DESCRIPTION_CONSTR_2X#',
A_0804_PAYTO_CONSTR_2X='#A_0804_PAYTO_CONSTR_2X#',
A_0804_AMOUNT_CONSTR_2X='#A_0804_AMOUNT_CONSTR_2X#',
A_0805_DESCRIPTION_CONSTR_2X='#A_0805_DESCRIPTION_CONSTR_2X#',
A_0805_PAYTO_CONSTR_2X='#A_0805_PAYTO_CONSTR_2X#',
A_0805_AMOUNT_CONSTR_2X='#A_0805_AMOUNT_CONSTR_2X#',
A_0806_DESCRIPTION_CONSTR_2X='#A_0806_DESCRIPTION_CONSTR_2X#',
A_0806_PAYTO_CONSTR_2X='#A_0806_PAYTO_CONSTR_2X#',
A_0806_AMOUNT_CONSTR_2X='#A_0806_AMOUNT_CONSTR_2X#',
A_0807_DESCRIPTION_CONSTR_2X='#A_0807_DESCRIPTION_CONSTR_2X#',
A_0807_PAYTO_CONSTR_2X='#A_0807_PAYTO_CONSTR_2X#',
A_0807_AMOUNT_CONSTR_2X='#A_0807_AMOUNT_CONSTR_2X#',
A_0808_DESCRIPTION_CONSTR_2X='#A_0808_DESCRIPTION_CONSTR_2X#',
A_0808_PAYTO_CONSTR_2X='#A_0808_PAYTO_CONSTR_2X#',
A_0808_AMOUNT_CONSTR_2X='#A_0808_AMOUNT_CONSTR_2X#',
A_0809_DESCRIPTION_CONSTR_2X='#A_0809_DESCRIPTION_CONSTR_2X#',
A_0809_PAYTO_CONSTR_2X='#A_0809_PAYTO_CONSTR_2X#',
A_0809_AMOUNT_CONSTR_2X='#A_0809_AMOUNT_CONSTR_2X#',
A_0810_DESCRIPTION_CONSTR_2X='#A_0810_DESCRIPTION_CONSTR_2X#',
A_0810_PAYTO_CONSTR_2X='#A_0810_PAYTO_CONSTR_2X#',
A_0810_AMOUNT_CONSTR_2X='#A_0810_AMOUNT_CONSTR_2X#',
A_0811_DESCRIPTION_CONSTR_2X='#A_0811_DESCRIPTION_CONSTR_2X#',
A_0811_PAYTO_CONSTR_2X='#A_0811_PAYTO_CONSTR_2X#',
A_0811_AMOUNT_CONSTR_2X='#A_0811_AMOUNT_CONSTR_2X#',
A_0812_DESCRIPTION_CONSTR_2X='#A_0812_DESCRIPTION_CONSTR_2X#',
A_0812_PAYTO_CONSTR_2X='#A_0812_PAYTO_CONSTR_2X#',
A_0812_AMOUNT_CONSTR_2X='#A_0812_AMOUNT_CONSTR_2X#',
A_1101_AMOUNT_CONSTR_2X='#A_1101_AMOUNT_CONSTR_2X#',
A_1102_DESCRIPTION_CONSTR_2X='#A_1102_DESCRIPTION_CONSTR_2X#',
A_1102_PAYTO_CONSTR_2X='#A_1102_PAYTO_CONSTR_2X#',
A_1102_AMOUNT_CONSTR_2X='#A_1102_AMOUNT_CONSTR_2X#',
A_1109_DESCRIPTION_CONSTR_2X='#A_1109_DESCRIPTION_CONSTR_2X#',
A_1109_PAYTO_CONSTR_2X='#A_1109_PAYTO_CONSTR_2X#',
A_1109_AMOUNT_CONSTR_2X='#A_1109_AMOUNT_CONSTR_2X#',
A_1109_OUTSIDE_CONSTR_2X='#A_1109_OUTSIDE_CONSTR_2X#',
A_1110_DESCRIPTION_CONSTR_2X='#A_1110_DESCRIPTION_CONSTR_2X#',
A_1110_PAYTO_CONSTR_2X='#A_1110_PAYTO_CONSTR_2X#',
A_1110_AMOUNT_CONSTR_2X='#A_1110_AMOUNT_CONSTR_2X#',
A_1110_OUTSIDE_CONSTR_2X='#A_1110_OUTSIDE_CONSTR_2X#',
A_1111_DESCRIPTION_CONSTR_2X='#A_1111_DESCRIPTION_CONSTR_2X#',
A_1111_PAYTO_CONSTR_2X='#A_1111_PAYTO_CONSTR_2X#',
A_1111_AMOUNT_CONSTR_2X='#A_1111_AMOUNT_CONSTR_2X#',
A_1111_OUTSIDE_CONSTR_2X='#A_1111_OUTSIDE_CONSTR_2X#',
A_1112_DESCRIPTION_CONSTR_2X='#A_1112_DESCRIPTION_CONSTR_2X#',
A_1112_PAYTO_CONSTR_2X='#A_1112_PAYTO_CONSTR_2X#',
A_1112_AMOUNT_CONSTR_2X='#A_1112_AMOUNT_CONSTR_2X#',
A_1112_OUTSIDE_CONSTR_2X='#A_1112_OUTSIDE_CONSTR_2X#',
A_1113_DESCRIPTION_CONSTR_2X='#A_1113_DESCRIPTION_CONSTR_2X#',
A_1113_PAYTO_CONSTR_2X='#A_1113_PAYTO_CONSTR_2X#',
A_1113_AMOUNT_CONSTR_2X='#A_1113_AMOUNT_CONSTR_2X#',
A_1113_OUTSIDE_CONSTR_2X='#A_1113_OUTSIDE_CONSTR_2X#',
A_0801_DESCRIPTION_END_LOAN='#A_0801_DESCRIPTION_END_LOAN#',
A_0801_AMOUNT_END_LOAN='#A_0801_AMOUNT_END_LOAN#',
A_0802_DESCRIPTION_END_LOAN='#A_0802_DESCRIPTION_END_LOAN#',
A_0802_AMOUNT_END_LOAN='#A_0802_AMOUNT_END_LOAN#',
A_0804_DESCRIPTION_END_LOAN='#A_0804_DESCRIPTION_END_LOAN#',
A_0804_PAYTO_END_LOAN='#A_0804_PAYTO_END_LOAN#',
A_0804_AMOUNT_END_LOAN='#A_0804_AMOUNT_END_LOAN#',
A_0805_DESCRIPTION_END_LOAN='#A_0805_DESCRIPTION_END_LOAN#',
A_0805_PAYTO_END_LOAN='#A_0805_PAYTO_END_LOAN#',
A_0805_AMOUNT_END_LOAN='#A_0805_AMOUNT_END_LOAN#',
A_0806_DESCRIPTION_END_LOAN='#A_0806_DESCRIPTION_END_LOAN#',
A_0806_PAYTO_END_LOAN='#A_0806_PAYTO_END_LOAN#',
A_0806_AMOUNT_END_LOAN='#A_0806_AMOUNT_END_LOAN#',
A_0807_DESCRIPTION_END_LOAN='#A_0807_DESCRIPTION_END_LOAN#',
A_0807_PAYTO_END_LOAN='#A_0807_PAYTO_END_LOAN#',
A_0807_AMOUNT_END_LOAN='#A_0807_AMOUNT_END_LOAN#',
A_0808_DESCRIPTION_END_LOAN='#A_0808_DESCRIPTION_END_LOAN#',
A_0808_PAYTO_END_LOAN='#A_0808_PAYTO_END_LOAN#',
A_0808_AMOUNT_END_LOAN='#A_0808_AMOUNT_END_LOAN#',
A_0809_DESCRIPTION_END_LOAN='#A_0809_DESCRIPTION_END_LOAN#',
A_0809_PAYTO_END_LOAN='#A_0809_PAYTO_END_LOAN#',
A_0809_AMOUNT_END_LOAN='#A_0809_AMOUNT_END_LOAN#',
A_0810_DESCRIPTION_END_LOAN='#A_0810_DESCRIPTION_END_LOAN#',
A_0810_PAYTO_END_LOAN='#A_0810_PAYTO_END_LOAN#',
A_0810_AMOUNT_END_LOAN='#A_0810_AMOUNT_END_LOAN#',
A_0811_DESCRIPTION_END_LOAN='#A_0811_DESCRIPTION_END_LOAN#',
A_0811_PAYTO_END_LOAN='#A_0811_PAYTO_END_LOAN#',
A_0811_AMOUNT_END_LOAN='#A_0811_AMOUNT_END_LOAN#',
A_0812_DESCRIPTION_END_LOAN='#A_0812_DESCRIPTION_END_LOAN#',
A_0812_PAYTO_END_LOAN='#A_0812_PAYTO_END_LOAN#',
A_0812_AMOUNT_END_LOAN='#A_0812_AMOUNT_END_LOAN#',
A_1101_AMOUNT_END_LOAN='#A_1101_AMOUNT_END_LOAN#',
A_1102_DESCRIPTION_END_LOAN='#A_1102_DESCRIPTION_END_LOAN#',
A_1102_PAYTO_END_LOAN='#A_1102_PAYTO_END_LOAN#',
A_1102_AMOUNT_END_LOAN='#A_1102_AMOUNT_END_LOAN#',
A_1109_DESCRIPTION_END_LOAN='#A_1109_DESCRIPTION_END_LOAN#',
A_1109_PAYTO_END_LOAN='#A_1109_PAYTO_END_LOAN#',
A_1109_AMOUNT_END_LOAN='#A_1109_AMOUNT_END_LOAN#',
A_1109_OUTSIDE_END_LOAN='#A_1109_OUTSIDE_END_LOAN#',
A_1110_DESCRIPTION_END_LOAN='#A_1110_DESCRIPTION_END_LOAN#',
A_1110_PAYTO_END_LOAN='#A_1110_PAYTO_END_LOAN#',
A_1110_AMOUNT_END_LOAN='#A_1110_AMOUNT_END_LOAN#',
A_1110_OUTSIDE_END_LOAN='#A_1110_OUTSIDE_END_LOAN#',
A_1111_DESCRIPTION_END_LOAN='#A_1111_DESCRIPTION_END_LOAN#',
A_1111_PAYTO_END_LOAN='#A_1111_PAYTO_END_LOAN#',
A_1111_AMOUNT_END_LOAN='#A_1111_AMOUNT_END_LOAN#',
A_1111_OUTSIDE_END_LOAN='#A_1111_OUTSIDE_END_LOAN#',
A_1112_DESCRIPTION_END_LOAN='#A_1112_DESCRIPTION_END_LOAN#',
A_1112_PAYTO_END_LOAN='#A_1112_PAYTO_END_LOAN#',
A_1112_AMOUNT_END_LOAN='#A_1112_AMOUNT_END_LOAN#',
A_1112_OUTSIDE_END_LOAN='#A_1112_OUTSIDE_END_LOAN#',
A_1113_DESCRIPTION_END_LOAN='#A_1113_DESCRIPTION_END_LOAN#',
A_1113_PAYTO_END_LOAN='#A_1113_PAYTO_END_LOAN#',
A_1113_AMOUNT_END_LOAN='#A_1113_AMOUNT_END_LOAN#',
A_1113_OUTSIDE_END_LOAN='#A_1113_OUTSIDE_END_LOAN#'
WHERE tempmod_id = #get_new_id.tempmod_id#
</CFQUERY>


<CFQUERY datasource="#request.dsn#" name="update_fees_b">
UPDATE company_billing_values_b_HUD2010_tempmods
SET
A_1302_DESCRIPTION_REFINANCE='#A_1302_DESCRIPTION_REFINANCE#',
A_1302_PAYTO_REFINANCE='#A_1302_PAYTO_REFINANCE#',
A_1302_AMOUNT_REFINANCE='#A_1302_AMOUNT_REFINANCE#',
A_1302_OUTSIDE_REFINANCE='#A_1302_OUTSIDE_REFINANCE#',
A_1303_DESCRIPTION_REFINANCE='#A_1303_DESCRIPTION_REFINANCE#',
A_1303_PAYTO_REFINANCE='#A_1303_PAYTO_REFINANCE#',
A_1303_AMOUNT_REFINANCE='#A_1303_AMOUNT_REFINANCE#',
A_1303_OUTSIDE_REFINANCE='#A_1303_OUTSIDE_REFINANCE#',
A_1304_DESCRIPTION_REFINANCE='#A_1304_DESCRIPTION_REFINANCE#',
A_1304_PAYTO_REFINANCE='#A_1304_PAYTO_REFINANCE#',
A_1304_AMOUNT_REFINANCE='#A_1304_AMOUNT_REFINANCE#',
A_1304_OUTSIDE_REFINANCE='#A_1304_OUTSIDE_REFINANCE#',
A_1305_DESCRIPTION_REFINANCE='#A_1305_DESCRIPTION_REFINANCE#',
A_1305_PAYTO_REFINANCE='#A_1305_PAYTO_REFINANCE#',
A_1305_AMOUNT_REFINANCE='#A_1305_AMOUNT_REFINANCE#',
A_1305_OUTSIDE_REFINANCE='#A_1305_OUTSIDE_REFINANCE#',
A_1306_DESCRIPTION_REFINANCE='#A_1306_DESCRIPTION_REFINANCE#',
A_1306_PAYTO_REFINANCE='#A_1306_PAYTO_REFINANCE#',
A_1306_AMOUNT_REFINANCE='#A_1306_AMOUNT_REFINANCE#',
A_1306_OUTSIDE_REFINANCE='#A_1306_OUTSIDE_REFINANCE#',
A_1307_DESCRIPTION_REFINANCE='#A_1307_DESCRIPTION_REFINANCE#',
A_1307_PAYTO_REFINANCE='#A_1307_PAYTO_REFINANCE#',
A_1307_AMOUNT_REFINANCE='#A_1307_AMOUNT_REFINANCE#',
A_1307_OUTSIDE_REFINANCE='#A_1307_OUTSIDE_REFINANCE#',
A_1308_DESCRIPTION_REFINANCE='#A_1308_DESCRIPTION_REFINANCE#',
A_1308_PAYTO_REFINANCE='#A_1308_PAYTO_REFINANCE#',
A_1308_AMOUNT_REFINANCE='#A_1308_AMOUNT_REFINANCE#',
A_1308_OUTSIDE_REFINANCE='#A_1308_OUTSIDE_REFINANCE#',
A_1302_DESCRIPTION_PURCHASE='#A_1302_DESCRIPTION_PURCHASE#',
A_1302_PAYTO_PURCHASE='#A_1302_PAYTO_PURCHASE#',
A_1302_AMOUNT_PURCHASE='#A_1302_AMOUNT_PURCHASE#',
A_1302_OUTSIDE_PURCHASE='#A_1302_OUTSIDE_PURCHASE#',
A_1303_DESCRIPTION_PURCHASE='#A_1303_DESCRIPTION_PURCHASE#',
A_1303_PAYTO_PURCHASE='#A_1303_PAYTO_PURCHASE#',
A_1303_AMOUNT_PURCHASE='#A_1303_AMOUNT_PURCHASE#',
A_1303_OUTSIDE_PURCHASE='#A_1303_OUTSIDE_PURCHASE#',
A_1304_DESCRIPTION_PURCHASE='#A_1304_DESCRIPTION_PURCHASE#',
A_1304_PAYTO_PURCHASE='#A_1304_PAYTO_PURCHASE#',
A_1304_AMOUNT_PURCHASE='#A_1304_AMOUNT_PURCHASE#',
A_1304_OUTSIDE_PURCHASE='#A_1304_OUTSIDE_PURCHASE#',
A_1305_DESCRIPTION_PURCHASE='#A_1305_DESCRIPTION_PURCHASE#',
A_1305_PAYTO_PURCHASE='#A_1305_PAYTO_PURCHASE#',
A_1305_AMOUNT_PURCHASE='#A_1305_AMOUNT_PURCHASE#',
A_1305_OUTSIDE_PURCHASE='#A_1305_OUTSIDE_PURCHASE#',
A_1306_DESCRIPTION_PURCHASE='#A_1306_DESCRIPTION_PURCHASE#',
A_1306_PAYTO_PURCHASE='#A_1306_PAYTO_PURCHASE#',
A_1306_AMOUNT_PURCHASE='#A_1306_AMOUNT_PURCHASE#',
A_1306_OUTSIDE_PURCHASE='#A_1306_OUTSIDE_PURCHASE#',
A_1307_DESCRIPTION_PURCHASE='#A_1307_DESCRIPTION_PURCHASE#',
A_1307_PAYTO_PURCHASE='#A_1307_PAYTO_PURCHASE#',
A_1307_AMOUNT_PURCHASE='#A_1307_AMOUNT_PURCHASE#',
A_1307_OUTSIDE_PURCHASE='#A_1307_OUTSIDE_PURCHASE#',
A_1308_DESCRIPTION_PURCHASE='#A_1308_DESCRIPTION_PURCHASE#',
A_1308_PAYTO_PURCHASE='#A_1308_PAYTO_PURCHASE#',
A_1308_AMOUNT_PURCHASE='#A_1308_AMOUNT_PURCHASE#',
A_1308_OUTSIDE_PURCHASE='#A_1308_OUTSIDE_PURCHASE#',
A_1302_DESCRIPTION_2ND_NO_TI='#A_1302_DESCRIPTION_2ND_NO_TI#',
A_1302_PAYTO_2ND_NO_TI='#A_1302_PAYTO_2ND_NO_TI#',
A_1302_AMOUNT_2ND_NO_TI='#A_1302_AMOUNT_2ND_NO_TI#',
A_1302_OUTSIDE_2ND_NO_TI='#A_1302_OUTSIDE_2ND_NO_TI#',
A_1303_DESCRIPTION_2ND_NO_TI='#A_1303_DESCRIPTION_2ND_NO_TI#',
A_1303_PAYTO_2ND_NO_TI='#A_1303_PAYTO_2ND_NO_TI#',
A_1303_AMOUNT_2ND_NO_TI='#A_1303_AMOUNT_2ND_NO_TI#',
A_1303_OUTSIDE_2ND_NO_TI='#A_1303_OUTSIDE_2ND_NO_TI#',
A_1304_DESCRIPTION_2ND_NO_TI='#A_1304_DESCRIPTION_2ND_NO_TI#',
A_1304_PAYTO_2ND_NO_TI='#A_1304_PAYTO_2ND_NO_TI#',
A_1304_AMOUNT_2ND_NO_TI='#A_1304_AMOUNT_2ND_NO_TI#',
A_1304_OUTSIDE_2ND_NO_TI='#A_1304_OUTSIDE_2ND_NO_TI#',
A_1305_DESCRIPTION_2ND_NO_TI='#A_1305_DESCRIPTION_2ND_NO_TI#',
A_1305_PAYTO_2ND_NO_TI='#A_1305_PAYTO_2ND_NO_TI#',
A_1305_AMOUNT_2ND_NO_TI='#A_1305_AMOUNT_2ND_NO_TI#',
A_1305_OUTSIDE_2ND_NO_TI='#A_1305_OUTSIDE_2ND_NO_TI#',
A_1306_DESCRIPTION_2ND_NO_TI='#A_1306_DESCRIPTION_2ND_NO_TI#',
A_1306_PAYTO_2ND_NO_TI='#A_1306_PAYTO_2ND_NO_TI#',
A_1306_AMOUNT_2ND_NO_TI='#A_1306_AMOUNT_2ND_NO_TI#',
A_1306_OUTSIDE_2ND_NO_TI='#A_1306_OUTSIDE_2ND_NO_TI#',
A_1307_DESCRIPTION_2ND_NO_TI='#A_1307_DESCRIPTION_2ND_NO_TI#',
A_1307_PAYTO_2ND_NO_TI='#A_1307_PAYTO_2ND_NO_TI#',
A_1307_AMOUNT_2ND_NO_TI='#A_1307_AMOUNT_2ND_NO_TI#',
A_1307_OUTSIDE_2ND_NO_TI='#A_1307_OUTSIDE_2ND_NO_TI#',
A_1308_DESCRIPTION_2ND_NO_TI='#A_1308_DESCRIPTION_2ND_NO_TI#',
A_1308_PAYTO_2ND_NO_TI='#A_1308_PAYTO_2ND_NO_TI#',
A_1308_AMOUNT_2ND_NO_TI='#A_1308_AMOUNT_2ND_NO_TI#',
A_1308_OUTSIDE_2ND_NO_TI='#A_1308_OUTSIDE_2ND_NO_TI#',
A_1302_DESCRIPTION_2ND_WITH_TI='#A_1302_DESCRIPTION_2ND_WITH_TI#',
A_1302_PAYTO_2ND_WITH_TI='#A_1302_PAYTO_2ND_WITH_TI#',
A_1302_AMOUNT_2ND_WITH_TI='#A_1302_AMOUNT_2ND_WITH_TI#',
A_1302_OUTSIDE_2ND_WITH_TI='#A_1302_OUTSIDE_2ND_WITH_TI#',
A_1303_DESCRIPTION_2ND_WITH_TI='#A_1303_DESCRIPTION_2ND_WITH_TI#',
A_1303_PAYTO_2ND_WITH_TI='#A_1303_PAYTO_2ND_WITH_TI#',
A_1303_AMOUNT_2ND_WITH_TI='#A_1303_AMOUNT_2ND_WITH_TI#',
A_1303_OUTSIDE_2ND_WITH_TI='#A_1303_OUTSIDE_2ND_WITH_TI#',
A_1304_DESCRIPTION_2ND_WITH_TI='#A_1304_DESCRIPTION_2ND_WITH_TI#',
A_1304_PAYTO_2ND_WITH_TI='#A_1304_PAYTO_2ND_WITH_TI#',
A_1304_AMOUNT_2ND_WITH_TI='#A_1304_AMOUNT_2ND_WITH_TI#',
A_1304_OUTSIDE_2ND_WITH_TI='#A_1304_OUTSIDE_2ND_WITH_TI#',
A_1305_DESCRIPTION_2ND_WITH_TI='#A_1305_DESCRIPTION_2ND_WITH_TI#',
A_1305_PAYTO_2ND_WITH_TI='#A_1305_PAYTO_2ND_WITH_TI#',
A_1305_AMOUNT_2ND_WITH_TI='#A_1305_AMOUNT_2ND_WITH_TI#',
A_1305_OUTSIDE_2ND_WITH_TI='#A_1305_OUTSIDE_2ND_WITH_TI#',
A_1306_DESCRIPTION_2ND_WITH_TI='#A_1306_DESCRIPTION_2ND_WITH_TI#',
A_1306_PAYTO_2ND_WITH_TI='#A_1306_PAYTO_2ND_WITH_TI#',
A_1306_AMOUNT_2ND_WITH_TI='#A_1306_AMOUNT_2ND_WITH_TI#',
A_1306_OUTSIDE_2ND_WITH_TI='#A_1306_OUTSIDE_2ND_WITH_TI#',
A_1307_DESCRIPTION_2ND_WITH_TI='#A_1307_DESCRIPTION_2ND_WITH_TI#',
A_1307_PAYTO_2ND_WITH_TI='#A_1307_PAYTO_2ND_WITH_TI#',
A_1307_AMOUNT_2ND_WITH_TI='#A_1307_AMOUNT_2ND_WITH_TI#',
A_1307_OUTSIDE_2ND_WITH_TI='#A_1307_OUTSIDE_2ND_WITH_TI#',
A_1308_DESCRIPTION_2ND_WITH_TI='#A_1308_DESCRIPTION_2ND_WITH_TI#',
A_1308_PAYTO_2ND_WITH_TI='#A_1308_PAYTO_2ND_WITH_TI#',
A_1308_AMOUNT_2ND_WITH_TI='#A_1308_AMOUNT_2ND_WITH_TI#',
A_1308_OUTSIDE_2ND_WITH_TI='#A_1308_OUTSIDE_2ND_WITH_TI#',
A_1302_DESCRIPTION_PURCHASE_SELLER='#A_1302_DESCRIPTION_PURCHASE_SELLER#',
A_1302_PAYTO_PURCHASE_SELLER='#A_1302_PAYTO_PURCHASE_SELLER#',
A_1302_AMOUNT_PURCHASE_SELLER='#A_1302_AMOUNT_PURCHASE_SELLER#',
A_1302_OUTSIDE_PURCHASE_SELLER='#A_1302_OUTSIDE_PURCHASE_SELLER#',
A_1303_DESCRIPTION_PURCHASE_SELLER='#A_1303_DESCRIPTION_PURCHASE_SELLER#',
A_1303_PAYTO_PURCHASE_SELLER='#A_1303_PAYTO_PURCHASE_SELLER#',
A_1303_AMOUNT_PURCHASE_SELLER='#A_1303_AMOUNT_PURCHASE_SELLER#',
A_1303_OUTSIDE_PURCHASE_SELLER='#A_1303_OUTSIDE_PURCHASE_SELLER#',
A_1304_DESCRIPTION_PURCHASE_SELLER='#A_1304_DESCRIPTION_PURCHASE_SELLER#',
A_1304_PAYTO_PURCHASE_SELLER='#A_1304_PAYTO_PURCHASE_SELLER#',
A_1304_AMOUNT_PURCHASE_SELLER='#A_1304_AMOUNT_PURCHASE_SELLER#',
A_1304_OUTSIDE_PURCHASE_SELLER='#A_1304_OUTSIDE_PURCHASE_SELLER#',
A_1305_DESCRIPTION_PURCHASE_SELLER='#A_1305_DESCRIPTION_PURCHASE_SELLER#',
A_1305_PAYTO_PURCHASE_SELLER='#A_1305_PAYTO_PURCHASE_SELLER#',
A_1305_AMOUNT_PURCHASE_SELLER='#A_1305_AMOUNT_PURCHASE_SELLER#',
A_1305_OUTSIDE_PURCHASE_SELLER='#A_1305_OUTSIDE_PURCHASE_SELLER#',
A_1306_DESCRIPTION_PURCHASE_SELLER='#A_1306_DESCRIPTION_PURCHASE_SELLER#',
A_1306_PAYTO_PURCHASE_SELLER='#A_1306_PAYTO_PURCHASE_SELLER#',
A_1306_AMOUNT_PURCHASE_SELLER='#A_1306_AMOUNT_PURCHASE_SELLER#',
A_1306_OUTSIDE_PURCHASE_SELLER='#A_1306_OUTSIDE_PURCHASE_SELLER#',
A_1307_DESCRIPTION_PURCHASE_SELLER='#A_1307_DESCRIPTION_PURCHASE_SELLER#',
A_1307_PAYTO_PURCHASE_SELLER='#A_1307_PAYTO_PURCHASE_SELLER#',
A_1307_AMOUNT_PURCHASE_SELLER='#A_1307_AMOUNT_PURCHASE_SELLER#',
A_1307_OUTSIDE_PURCHASE_SELLER='#A_1307_OUTSIDE_PURCHASE_SELLER#',
A_1308_DESCRIPTION_PURCHASE_SELLER='#A_1308_DESCRIPTION_PURCHASE_SELLER#',
A_1308_PAYTO_PURCHASE_SELLER='#A_1308_PAYTO_PURCHASE_SELLER#',
A_1308_AMOUNT_PURCHASE_SELLER='#A_1308_AMOUNT_PURCHASE_SELLER#',
A_1308_OUTSIDE_PURCHASE_SELLER='#A_1308_OUTSIDE_PURCHASE_SELLER#',
A_1102A_DESCRIPTION_REFINANCE='#A_1102A_DESCRIPTION_REFINANCE#',
A_1102A_PAYTO_REFINANCE='#A_1102A_PAYTO_REFINANCE#',
A_1102A_AMOUNT_REFINANCE='#A_1102A_AMOUNT_REFINANCE#',
A_1102B_DESCRIPTION_REFINANCE='#A_1102B_DESCRIPTION_REFINANCE#',
A_1102B_PAYTO_REFINANCE='#A_1102B_PAYTO_REFINANCE#',
A_1102B_AMOUNT_REFINANCE='#A_1102B_AMOUNT_REFINANCE#',
A_1102C_DESCRIPTION_REFINANCE='#A_1102C_DESCRIPTION_REFINANCE#',
A_1102C_PAYTO_REFINANCE='#A_1102C_PAYTO_REFINANCE#',
A_1102C_AMOUNT_REFINANCE='#A_1102C_AMOUNT_REFINANCE#',
A_1102D_DESCRIPTION_REFINANCE='#A_1102D_DESCRIPTION_REFINANCE#',
A_1102D_PAYTO_REFINANCE='#A_1102D_PAYTO_REFINANCE#',
A_1102D_AMOUNT_REFINANCE='#A_1102D_AMOUNT_REFINANCE#',
A_1102E_DESCRIPTION_REFINANCE='#A_1102E_DESCRIPTION_REFINANCE#',
A_1102E_PAYTO_REFINANCE='#A_1102E_PAYTO_REFINANCE#',
A_1102E_AMOUNT_REFINANCE='#A_1102E_AMOUNT_REFINANCE#',
A_1102F_DESCRIPTION_REFINANCE='#A_1102F_DESCRIPTION_REFINANCE#',
A_1102F_PAYTO_REFINANCE='#A_1102F_PAYTO_REFINANCE#',
A_1102F_AMOUNT_REFINANCE='#A_1102F_AMOUNT_REFINANCE#',
A_1102G_DESCRIPTION_REFINANCE='#A_1102G_DESCRIPTION_REFINANCE#',
A_1102G_PAYTO_REFINANCE='#A_1102G_PAYTO_REFINANCE#',
A_1102G_AMOUNT_REFINANCE='#A_1102G_AMOUNT_REFINANCE#',
A_1102H_DESCRIPTION_REFINANCE='#A_1102H_DESCRIPTION_REFINANCE#',
A_1102H_PAYTO_REFINANCE='#A_1102H_PAYTO_REFINANCE#',
A_1102H_AMOUNT_REFINANCE='#A_1102H_AMOUNT_REFINANCE#',
A_1102I_DESCRIPTION_REFINANCE='#A_1102I_DESCRIPTION_REFINANCE#',
A_1102I_PAYTO_REFINANCE='#A_1102I_PAYTO_REFINANCE#',
A_1102I_AMOUNT_REFINANCE='#A_1102I_AMOUNT_REFINANCE#',
A_1102A_DESCRIPTION_PURCHASE='#A_1102A_DESCRIPTION_PURCHASE#',
A_1102A_PAYTO_PURCHASE='#A_1102A_PAYTO_PURCHASE#',
A_1102A_AMOUNT_PURCHASE='#A_1102A_AMOUNT_PURCHASE#',
A_1102B_DESCRIPTION_PURCHASE='#A_1102B_DESCRIPTION_PURCHASE#',
A_1102B_PAYTO_PURCHASE='#A_1102B_PAYTO_PURCHASE#',
A_1102B_AMOUNT_PURCHASE='#A_1102B_AMOUNT_PURCHASE#',
A_1102C_DESCRIPTION_PURCHASE='#A_1102C_DESCRIPTION_PURCHASE#',
A_1102C_PAYTO_PURCHASE='#A_1102C_PAYTO_PURCHASE#',
A_1102C_AMOUNT_PURCHASE='#A_1102C_AMOUNT_PURCHASE#',
A_1102D_DESCRIPTION_PURCHASE='#A_1102D_DESCRIPTION_PURCHASE#',
A_1102D_PAYTO_PURCHASE='#A_1102D_PAYTO_PURCHASE#',
A_1102D_AMOUNT_PURCHASE='#A_1102D_AMOUNT_PURCHASE#',
A_1102E_DESCRIPTION_PURCHASE='#A_1102E_DESCRIPTION_PURCHASE#',
A_1102E_PAYTO_PURCHASE='#A_1102E_PAYTO_PURCHASE#',
A_1102E_AMOUNT_PURCHASE='#A_1102E_AMOUNT_PURCHASE#',
A_1102F_DESCRIPTION_PURCHASE='#A_1102F_DESCRIPTION_PURCHASE#',
A_1102F_PAYTO_PURCHASE='#A_1102F_PAYTO_PURCHASE#',
A_1102F_AMOUNT_PURCHASE='#A_1102F_AMOUNT_PURCHASE#',
A_1102G_DESCRIPTION_PURCHASE='#A_1102G_DESCRIPTION_PURCHASE#',
A_1102G_PAYTO_PURCHASE='#A_1102G_PAYTO_PURCHASE#',
A_1102G_AMOUNT_PURCHASE='#A_1102G_AMOUNT_PURCHASE#',
A_1102H_DESCRIPTION_PURCHASE='#A_1102H_DESCRIPTION_PURCHASE#',
A_1102H_PAYTO_PURCHASE='#A_1102H_PAYTO_PURCHASE#',
A_1102H_AMOUNT_PURCHASE='#A_1102H_AMOUNT_PURCHASE#',
A_1102I_DESCRIPTION_PURCHASE='#A_1102I_DESCRIPTION_PURCHASE#',
A_1102I_PAYTO_PURCHASE='#A_1102I_PAYTO_PURCHASE#',
A_1102I_AMOUNT_PURCHASE='#A_1102I_AMOUNT_PURCHASE#',
A_1102A_DESCRIPTION_2ND_WITH_TI='#A_1102A_DESCRIPTION_2ND_WITH_TI#',
A_1102A_PAYTO_2ND_WITH_TI='#A_1102A_PAYTO_2ND_WITH_TI#',
A_1102A_AMOUNT_2ND_WITH_TI='#A_1102A_AMOUNT_2ND_WITH_TI#',
A_1102B_DESCRIPTION_2ND_WITH_TI='#A_1102B_DESCRIPTION_2ND_WITH_TI#',
A_1102B_PAYTO_2ND_WITH_TI='#A_1102B_PAYTO_2ND_WITH_TI#',
A_1102B_AMOUNT_2ND_WITH_TI='#A_1102B_AMOUNT_2ND_WITH_TI#',
A_1102C_DESCRIPTION_2ND_WITH_TI='#A_1102C_DESCRIPTION_2ND_WITH_TI#',
A_1102C_PAYTO_2ND_WITH_TI='#A_1102C_PAYTO_2ND_WITH_TI#',
A_1102C_AMOUNT_2ND_WITH_TI='#A_1102C_AMOUNT_2ND_WITH_TI#',
A_1102D_DESCRIPTION_2ND_WITH_TI='#A_1102D_DESCRIPTION_2ND_WITH_TI#',
A_1102D_PAYTO_2ND_WITH_TI='#A_1102D_PAYTO_2ND_WITH_TI#',
A_1102D_AMOUNT_2ND_WITH_TI='#A_1102D_AMOUNT_2ND_WITH_TI#',
A_1102E_DESCRIPTION_2ND_WITH_TI='#A_1102E_DESCRIPTION_2ND_WITH_TI#',
A_1102E_PAYTO_2ND_WITH_TI='#A_1102E_PAYTO_2ND_WITH_TI#',
A_1102E_AMOUNT_2ND_WITH_TI='#A_1102E_AMOUNT_2ND_WITH_TI#',
A_1102F_DESCRIPTION_2ND_WITH_TI='#A_1102F_DESCRIPTION_2ND_WITH_TI#',
A_1102F_PAYTO_2ND_WITH_TI='#A_1102F_PAYTO_2ND_WITH_TI#',
A_1102F_AMOUNT_2ND_WITH_TI='#A_1102F_AMOUNT_2ND_WITH_TI#',
A_1102G_DESCRIPTION_2ND_WITH_TI='#A_1102G_DESCRIPTION_2ND_WITH_TI#',
A_1102G_PAYTO_2ND_WITH_TI='#A_1102G_PAYTO_2ND_WITH_TI#',
A_1102G_AMOUNT_2ND_WITH_TI='#A_1102G_AMOUNT_2ND_WITH_TI#',
A_1102H_DESCRIPTION_2ND_WITH_TI='#A_1102H_DESCRIPTION_2ND_WITH_TI#',
A_1102H_PAYTO_2ND_WITH_TI='#A_1102H_PAYTO_2ND_WITH_TI#',
A_1102H_AMOUNT_2ND_WITH_TI='#A_1102H_AMOUNT_2ND_WITH_TI#',
A_1102I_DESCRIPTION_2ND_WITH_TI='#A_1102I_DESCRIPTION_2ND_WITH_TI#',
A_1102I_PAYTO_2ND_WITH_TI='#A_1102I_PAYTO_2ND_WITH_TI#',
A_1102I_AMOUNT_2ND_WITH_TI='#A_1102I_AMOUNT_2ND_WITH_TI#',
A_1102A_DESCRIPTION_2ND_NO_TI='#A_1102A_DESCRIPTION_2ND_NO_TI#',
A_1102A_PAYTO_2ND_NO_TI='#A_1102A_PAYTO_2ND_NO_TI#',
A_1102A_AMOUNT_2ND_NO_TI='#A_1102A_AMOUNT_2ND_NO_TI#',
A_1102B_DESCRIPTION_2ND_NO_TI='#A_1102B_DESCRIPTION_2ND_NO_TI#',
A_1102B_PAYTO_2ND_NO_TI='#A_1102B_PAYTO_2ND_NO_TI#',
A_1102B_AMOUNT_2ND_NO_TI='#A_1102B_AMOUNT_2ND_NO_TI#',
A_1102C_DESCRIPTION_2ND_NO_TI='#A_1102C_DESCRIPTION_2ND_NO_TI#',
A_1102C_PAYTO_2ND_NO_TI='#A_1102C_PAYTO_2ND_NO_TI#',
A_1102C_AMOUNT_2ND_NO_TI='#A_1102C_AMOUNT_2ND_NO_TI#',
A_1102D_DESCRIPTION_2ND_NO_TI='#A_1102D_DESCRIPTION_2ND_NO_TI#',
A_1102D_PAYTO_2ND_NO_TI='#A_1102D_PAYTO_2ND_NO_TI#',
A_1102D_AMOUNT_2ND_NO_TI='#A_1102D_AMOUNT_2ND_NO_TI#',
A_1102E_DESCRIPTION_2ND_NO_TI='#A_1102E_DESCRIPTION_2ND_NO_TI#',
A_1102E_PAYTO_2ND_NO_TI='#A_1102E_PAYTO_2ND_NO_TI#',
A_1102E_AMOUNT_2ND_NO_TI='#A_1102E_AMOUNT_2ND_NO_TI#',
A_1102F_DESCRIPTION_2ND_NO_TI='#A_1102F_DESCRIPTION_2ND_NO_TI#',
A_1102F_PAYTO_2ND_NO_TI='#A_1102F_PAYTO_2ND_NO_TI#',
A_1102F_AMOUNT_2ND_NO_TI='#A_1102F_AMOUNT_2ND_NO_TI#',
A_1102G_DESCRIPTION_2ND_NO_TI='#A_1102G_DESCRIPTION_2ND_NO_TI#',
A_1102G_PAYTO_2ND_NO_TI='#A_1102G_PAYTO_2ND_NO_TI#',
A_1102G_AMOUNT_2ND_NO_TI='#A_1102G_AMOUNT_2ND_NO_TI#',
A_1102H_DESCRIPTION_2ND_NO_TI='#A_1102H_DESCRIPTION_2ND_NO_TI#',
A_1102H_PAYTO_2ND_NO_TI='#A_1102H_PAYTO_2ND_NO_TI#',
A_1102H_AMOUNT_2ND_NO_TI='#A_1102H_AMOUNT_2ND_NO_TI#',
A_1102I_DESCRIPTION_2ND_NO_TI='#A_1102I_DESCRIPTION_2ND_NO_TI#',
A_1102I_PAYTO_2ND_NO_TI='#A_1102I_PAYTO_2ND_NO_TI#',
A_1102I_AMOUNT_2ND_NO_TI='#A_1102I_AMOUNT_2ND_NO_TI#',
A_1102A_DESCRIPTION_PURCHASE_SELLER='#A_1102A_DESCRIPTION_PURCHASE_SELLER#',
A_1102A_PAYTO_PURCHASE_SELLER='#A_1102A_PAYTO_PURCHASE_SELLER#',
A_1102A_AMOUNT_PURCHASE_SELLER='#A_1102A_AMOUNT_PURCHASE_SELLER#',
A_1102B_DESCRIPTION_PURCHASE_SELLER='#A_1102B_DESCRIPTION_PURCHASE_SELLER#',
A_1102B_PAYTO_PURCHASE_SELLER='#A_1102B_PAYTO_PURCHASE_SELLER#',
A_1102B_AMOUNT_PURCHASE_SELLER='#A_1102B_AMOUNT_PURCHASE_SELLER#',
A_1102C_DESCRIPTION_PURCHASE_SELLER='#A_1102C_DESCRIPTION_PURCHASE_SELLER#',
A_1102C_PAYTO_PURCHASE_SELLER='#A_1102C_PAYTO_PURCHASE_SELLER#',
A_1102C_AMOUNT_PURCHASE_SELLER='#A_1102C_AMOUNT_PURCHASE_SELLER#',
A_1102D_DESCRIPTION_PURCHASE_SELLER='#A_1102D_DESCRIPTION_PURCHASE_SELLER#',
A_1102D_PAYTO_PURCHASE_SELLER='#A_1102D_PAYTO_PURCHASE_SELLER#',
A_1102D_AMOUNT_PURCHASE_SELLER='#A_1102D_AMOUNT_PURCHASE_SELLER#',
A_1102E_DESCRIPTION_PURCHASE_SELLER='#A_1102E_DESCRIPTION_PURCHASE_SELLER#',
A_1102E_PAYTO_PURCHASE_SELLER='#A_1102E_PAYTO_PURCHASE_SELLER#',
A_1102E_AMOUNT_PURCHASE_SELLER='#A_1102E_AMOUNT_PURCHASE_SELLER#',
A_1102F_DESCRIPTION_PURCHASE_SELLER='#A_1102F_DESCRIPTION_PURCHASE_SELLER#',
A_1102F_PAYTO_PURCHASE_SELLER='#A_1102F_PAYTO_PURCHASE_SELLER#',
A_1102F_AMOUNT_PURCHASE_SELLER='#A_1102F_AMOUNT_PURCHASE_SELLER#',
A_1102G_DESCRIPTION_PURCHASE_SELLER='#A_1102G_DESCRIPTION_PURCHASE_SELLER#',
A_1102G_PAYTO_PURCHASE_SELLER='#A_1102G_PAYTO_PURCHASE_SELLER#',
A_1102G_AMOUNT_PURCHASE_SELLER='#A_1102G_AMOUNT_PURCHASE_SELLER#',
A_1102H_DESCRIPTION_PURCHASE_SELLER='#A_1102H_DESCRIPTION_PURCHASE_SELLER#',
A_1102H_PAYTO_PURCHASE_SELLER='#A_1102H_PAYTO_PURCHASE_SELLER#',
A_1102H_AMOUNT_PURCHASE_SELLER='#A_1102H_AMOUNT_PURCHASE_SELLER#',
A_1102I_DESCRIPTION_PURCHASE_SELLER='#A_1102I_DESCRIPTION_PURCHASE_SELLER#',
A_1102I_PAYTO_PURCHASE_SELLER='#A_1102I_PAYTO_PURCHASE_SELLER#',
A_1102I_AMOUNT_PURCHASE_SELLER='#A_1102I_AMOUNT_PURCHASE_SELLER#'
WHERE tempmod_id = #get_new_id.tempmod_id#
</CFQUERY>


<CFQUERY datasource="#request.dsn#" name="update_fees_constr_b">
UPDATE company_billing_values_construction_b_HUD2010_tempmods
SET
A_1302_DESCRIPTION_CONSTR_1X='#A_1302_DESCRIPTION_CONSTR_1X#',
A_1302_PAYTO_CONSTR_1X='#A_1302_PAYTO_CONSTR_1X#',
A_1302_AMOUNT_CONSTR_1X='#A_1302_AMOUNT_CONSTR_1X#',
A_1302_OUTSIDE_CONSTR_1X='#A_1302_OUTSIDE_CONSTR_1X#',
A_1303_DESCRIPTION_CONSTR_1X='#A_1303_DESCRIPTION_CONSTR_1X#',
A_1303_PAYTO_CONSTR_1X='#A_1303_PAYTO_CONSTR_1X#',
A_1303_AMOUNT_CONSTR_1X='#A_1303_AMOUNT_CONSTR_1X#',
A_1303_OUTSIDE_CONSTR_1X='#A_1303_OUTSIDE_CONSTR_1X#',
A_1304_DESCRIPTION_CONSTR_1X='#A_1304_DESCRIPTION_CONSTR_1X#',
A_1304_PAYTO_CONSTR_1X='#A_1304_PAYTO_CONSTR_1X#',
A_1304_AMOUNT_CONSTR_1X='#A_1304_AMOUNT_CONSTR_1X#',
A_1304_OUTSIDE_CONSTR_1X='#A_1304_OUTSIDE_CONSTR_1X#',
A_1305_DESCRIPTION_CONSTR_1X='#A_1305_DESCRIPTION_CONSTR_1X#',
A_1305_PAYTO_CONSTR_1X='#A_1305_PAYTO_CONSTR_1X#',
A_1305_AMOUNT_CONSTR_1X='#A_1305_AMOUNT_CONSTR_1X#',
A_1305_OUTSIDE_CONSTR_1X='#A_1305_OUTSIDE_CONSTR_1X#',
A_1306_DESCRIPTION_CONSTR_1X='#A_1306_DESCRIPTION_CONSTR_1X#',
A_1306_PAYTO_CONSTR_1X='#A_1306_PAYTO_CONSTR_1X#',
A_1306_AMOUNT_CONSTR_1X='#A_1306_AMOUNT_CONSTR_1X#',
A_1306_OUTSIDE_CONSTR_1X='#A_1306_OUTSIDE_CONSTR_1X#',
A_1307_DESCRIPTION_CONSTR_1X='#A_1307_DESCRIPTION_CONSTR_1X#',
A_1307_PAYTO_CONSTR_1X='#A_1307_PAYTO_CONSTR_1X#',
A_1307_AMOUNT_CONSTR_1X='#A_1307_AMOUNT_CONSTR_1X#',
A_1307_OUTSIDE_CONSTR_1X='#A_1307_OUTSIDE_CONSTR_1X#',
A_1308_DESCRIPTION_CONSTR_1X='#A_1308_DESCRIPTION_CONSTR_1X#',
A_1308_PAYTO_CONSTR_1X='#A_1308_PAYTO_CONSTR_1X#',
A_1308_AMOUNT_CONSTR_1X='#A_1308_AMOUNT_CONSTR_1X#',
A_1308_OUTSIDE_CONSTR_1X='#A_1308_OUTSIDE_CONSTR_1X#',
A_1302_DESCRIPTION_CONSTR_2X='#A_1302_DESCRIPTION_CONSTR_2X#',
A_1302_PAYTO_CONSTR_2X='#A_1302_PAYTO_CONSTR_2X#',
A_1302_AMOUNT_CONSTR_2X='#A_1302_AMOUNT_CONSTR_2X#',
A_1302_OUTSIDE_CONSTR_2X='#A_1302_OUTSIDE_CONSTR_2X#',
A_1303_DESCRIPTION_CONSTR_2X='#A_1303_DESCRIPTION_CONSTR_2X#',
A_1303_PAYTO_CONSTR_2X='#A_1303_PAYTO_CONSTR_2X#',
A_1303_AMOUNT_CONSTR_2X='#A_1303_AMOUNT_CONSTR_2X#',
A_1303_OUTSIDE_CONSTR_2X='#A_1303_OUTSIDE_CONSTR_2X#',
A_1304_DESCRIPTION_CONSTR_2X='#A_1304_DESCRIPTION_CONSTR_2X#',
A_1304_PAYTO_CONSTR_2X='#A_1304_PAYTO_CONSTR_2X#',
A_1304_AMOUNT_CONSTR_2X='#A_1304_AMOUNT_CONSTR_2X#',
A_1304_OUTSIDE_CONSTR_2X='#A_1304_OUTSIDE_CONSTR_2X#',
A_1305_DESCRIPTION_CONSTR_2X='#A_1305_DESCRIPTION_CONSTR_2X#',
A_1305_PAYTO_CONSTR_2X='#A_1305_PAYTO_CONSTR_2X#',
A_1305_AMOUNT_CONSTR_2X='#A_1305_AMOUNT_CONSTR_2X#',
A_1305_OUTSIDE_CONSTR_2X='#A_1305_OUTSIDE_CONSTR_2X#',
A_1306_DESCRIPTION_CONSTR_2X='#A_1306_DESCRIPTION_CONSTR_2X#',
A_1306_PAYTO_CONSTR_2X='#A_1306_PAYTO_CONSTR_2X#',
A_1306_AMOUNT_CONSTR_2X='#A_1306_AMOUNT_CONSTR_2X#',
A_1306_OUTSIDE_CONSTR_2X='#A_1306_OUTSIDE_CONSTR_2X#',
A_1307_DESCRIPTION_CONSTR_2X='#A_1307_DESCRIPTION_CONSTR_2X#',
A_1307_PAYTO_CONSTR_2X='#A_1307_PAYTO_CONSTR_2X#',
A_1307_AMOUNT_CONSTR_2X='#A_1307_AMOUNT_CONSTR_2X#',
A_1307_OUTSIDE_CONSTR_2X='#A_1307_OUTSIDE_CONSTR_2X#',
A_1308_DESCRIPTION_CONSTR_2X='#A_1308_DESCRIPTION_CONSTR_2X#',
A_1308_PAYTO_CONSTR_2X='#A_1308_PAYTO_CONSTR_2X#',
A_1308_AMOUNT_CONSTR_2X='#A_1308_AMOUNT_CONSTR_2X#',
A_1308_OUTSIDE_CONSTR_2X='#A_1308_OUTSIDE_CONSTR_2X#',
A_1302_DESCRIPTION_END_LOAN='#A_1302_DESCRIPTION_END_LOAN#',
A_1302_PAYTO_END_LOAN='#A_1302_PAYTO_END_LOAN#',
A_1302_AMOUNT_END_LOAN='#A_1302_AMOUNT_END_LOAN#',
A_1302_OUTSIDE_END_LOAN='#A_1302_OUTSIDE_END_LOAN#',
A_1303_DESCRIPTION_END_LOAN='#A_1303_DESCRIPTION_END_LOAN#',
A_1303_PAYTO_END_LOAN='#A_1303_PAYTO_END_LOAN#',
A_1303_AMOUNT_END_LOAN='#A_1303_AMOUNT_END_LOAN#',
A_1303_OUTSIDE_END_LOAN='#A_1303_OUTSIDE_END_LOAN#',
A_1304_DESCRIPTION_END_LOAN='#A_1304_DESCRIPTION_END_LOAN#',
A_1304_PAYTO_END_LOAN='#A_1304_PAYTO_END_LOAN#',
A_1304_AMOUNT_END_LOAN='#A_1304_AMOUNT_END_LOAN#',
A_1304_OUTSIDE_END_LOAN='#A_1304_OUTSIDE_END_LOAN#',
A_1305_DESCRIPTION_END_LOAN='#A_1305_DESCRIPTION_END_LOAN#',
A_1305_PAYTO_END_LOAN='#A_1305_PAYTO_END_LOAN#',
A_1305_AMOUNT_END_LOAN='#A_1305_AMOUNT_END_LOAN#',
A_1305_OUTSIDE_END_LOAN='#A_1305_OUTSIDE_END_LOAN#',
A_1306_DESCRIPTION_END_LOAN='#A_1306_DESCRIPTION_END_LOAN#',
A_1306_PAYTO_END_LOAN='#A_1306_PAYTO_END_LOAN#',
A_1306_AMOUNT_END_LOAN='#A_1306_AMOUNT_END_LOAN#',
A_1306_OUTSIDE_END_LOAN='#A_1306_OUTSIDE_END_LOAN#',
A_1307_DESCRIPTION_END_LOAN='#A_1307_DESCRIPTION_END_LOAN#',
A_1307_PAYTO_END_LOAN='#A_1307_PAYTO_END_LOAN#',
A_1307_AMOUNT_END_LOAN='#A_1307_AMOUNT_END_LOAN#',
A_1307_OUTSIDE_END_LOAN='#A_1307_OUTSIDE_END_LOAN#',
A_1308_DESCRIPTION_END_LOAN='#A_1308_DESCRIPTION_END_LOAN#',
A_1308_PAYTO_END_LOAN='#A_1308_PAYTO_END_LOAN#',
A_1308_AMOUNT_END_LOAN='#A_1308_AMOUNT_END_LOAN#',
A_1308_OUTSIDE_END_LOAN='#A_1308_OUTSIDE_END_LOAN#'
WHERE tempmod_id = #get_new_id.tempmod_id#
</CFQUERY>


<CFQUERY datasource="#request.dsn#" name="update_itemized">
UPDATE ITEMIZED_1101_CHARGES_tempmods
SET
A_1101_ITEM_DESCRIPTION_01_REFINANCE = '#A_1101_ITEM_DESCRIPTION_01_REFINANCE#',
A_1101_ITEM_AMOUNT_01_REFINANCE = '#A_1101_ITEM_AMOUNT_01_REFINANCE#',
A_1101_ITEM_SELECTABLE_01_REFINANCE = '#A_1101_ITEM_SELECTABLE_01_REFINANCE#',
A_1101_ITEM_DESCRIPTION_02_REFINANCE = '#A_1101_ITEM_DESCRIPTION_02_REFINANCE#',
A_1101_ITEM_AMOUNT_02_REFINANCE = '#A_1101_ITEM_AMOUNT_02_REFINANCE#',
A_1101_ITEM_SELECTABLE_02_REFINANCE = '#A_1101_ITEM_SELECTABLE_02_REFINANCE#',
A_1101_ITEM_DESCRIPTION_03_REFINANCE = '#A_1101_ITEM_DESCRIPTION_03_REFINANCE#',
A_1101_ITEM_AMOUNT_03_REFINANCE = '#A_1101_ITEM_AMOUNT_03_REFINANCE#',
A_1101_ITEM_SELECTABLE_03_REFINANCE = '#A_1101_ITEM_SELECTABLE_03_REFINANCE#',
A_1101_ITEM_DESCRIPTION_04_REFINANCE = '#A_1101_ITEM_DESCRIPTION_04_REFINANCE#',
A_1101_ITEM_AMOUNT_04_REFINANCE = '#A_1101_ITEM_AMOUNT_04_REFINANCE#',
A_1101_ITEM_SELECTABLE_04_REFINANCE = '#A_1101_ITEM_SELECTABLE_04_REFINANCE#',
A_1101_ITEM_DESCRIPTION_05_REFINANCE = '#A_1101_ITEM_DESCRIPTION_05_REFINANCE#',
A_1101_ITEM_AMOUNT_05_REFINANCE = '#A_1101_ITEM_AMOUNT_05_REFINANCE#',
A_1101_ITEM_SELECTABLE_05_REFINANCE = '#A_1101_ITEM_SELECTABLE_05_REFINANCE#',
A_1101_ITEM_DESCRIPTION_06_REFINANCE = '#A_1101_ITEM_DESCRIPTION_06_REFINANCE#',
A_1101_ITEM_AMOUNT_06_REFINANCE = '#A_1101_ITEM_AMOUNT_06_REFINANCE#',
A_1101_ITEM_SELECTABLE_06_REFINANCE = '#A_1101_ITEM_SELECTABLE_06_REFINANCE#',
A_1101_ITEM_DESCRIPTION_07_REFINANCE = '#A_1101_ITEM_DESCRIPTION_07_REFINANCE#',
A_1101_ITEM_AMOUNT_07_REFINANCE = '#A_1101_ITEM_AMOUNT_07_REFINANCE#',
A_1101_ITEM_SELECTABLE_07_REFINANCE = '#A_1101_ITEM_SELECTABLE_07_REFINANCE#',
A_1101_ITEM_DESCRIPTION_08_REFINANCE = '#A_1101_ITEM_DESCRIPTION_08_REFINANCE#',
A_1101_ITEM_AMOUNT_08_REFINANCE = '#A_1101_ITEM_AMOUNT_08_REFINANCE#',
A_1101_ITEM_SELECTABLE_08_REFINANCE = '#A_1101_ITEM_SELECTABLE_08_REFINANCE#',
A_1101_ITEM_DESCRIPTION_09_REFINANCE = '#A_1101_ITEM_DESCRIPTION_09_REFINANCE#',
A_1101_ITEM_AMOUNT_09_REFINANCE = '#A_1101_ITEM_AMOUNT_09_REFINANCE#',
A_1101_ITEM_SELECTABLE_09_REFINANCE = '#A_1101_ITEM_SELECTABLE_09_REFINANCE#',
A_1101_ITEM_DESCRIPTION_10_REFINANCE = '#A_1101_ITEM_DESCRIPTION_10_REFINANCE#',
A_1101_ITEM_AMOUNT_10_REFINANCE = '#A_1101_ITEM_AMOUNT_10_REFINANCE#',
A_1101_ITEM_SELECTABLE_10_REFINANCE = '#A_1101_ITEM_SELECTABLE_10_REFINANCE#',
A_1101_ITEM_DESCRIPTION_11_REFINANCE = '#A_1101_ITEM_DESCRIPTION_11_REFINANCE#',
A_1101_ITEM_AMOUNT_11_REFINANCE = '#A_1101_ITEM_AMOUNT_11_REFINANCE#',
A_1101_ITEM_SELECTABLE_11_REFINANCE = '#A_1101_ITEM_SELECTABLE_11_REFINANCE#',
A_1101_ITEM_DESCRIPTION_12_REFINANCE = '#A_1101_ITEM_DESCRIPTION_12_REFINANCE#',
A_1101_ITEM_AMOUNT_12_REFINANCE = '#A_1101_ITEM_AMOUNT_12_REFINANCE#',
A_1101_ITEM_SELECTABLE_12_REFINANCE = '#A_1101_ITEM_SELECTABLE_12_REFINANCE#',
A_1101_ITEM_DESCRIPTION_13_REFINANCE = '#A_1101_ITEM_DESCRIPTION_13_REFINANCE#',
A_1101_ITEM_AMOUNT_13_REFINANCE = '#A_1101_ITEM_AMOUNT_13_REFINANCE#',
A_1101_ITEM_SELECTABLE_13_REFINANCE = '#A_1101_ITEM_SELECTABLE_13_REFINANCE#',
A_1101_ITEM_DESCRIPTION_14_REFINANCE = '#A_1101_ITEM_DESCRIPTION_14_REFINANCE#',
A_1101_ITEM_AMOUNT_14_REFINANCE = '#A_1101_ITEM_AMOUNT_14_REFINANCE#',
A_1101_ITEM_SELECTABLE_14_REFINANCE = '#A_1101_ITEM_SELECTABLE_14_REFINANCE#',
A_1101_ITEM_DESCRIPTION_15_REFINANCE = '#A_1101_ITEM_DESCRIPTION_15_REFINANCE#',
A_1101_ITEM_AMOUNT_15_REFINANCE = '#A_1101_ITEM_AMOUNT_15_REFINANCE#',
A_1101_ITEM_SELECTABLE_15_REFINANCE = '#A_1101_ITEM_SELECTABLE_15_REFINANCE#',
A_1101_ITEM_DESCRIPTION_16_REFINANCE = '#A_1101_ITEM_DESCRIPTION_16_REFINANCE#',
A_1101_ITEM_AMOUNT_16_REFINANCE = '#A_1101_ITEM_AMOUNT_16_REFINANCE#',
A_1101_ITEM_SELECTABLE_16_REFINANCE = '#A_1101_ITEM_SELECTABLE_16_REFINANCE#',
A_1101_ITEM_DESCRIPTION_17_REFINANCE = '#A_1101_ITEM_DESCRIPTION_17_REFINANCE#',
A_1101_ITEM_AMOUNT_17_REFINANCE = '#A_1101_ITEM_AMOUNT_17_REFINANCE#',
A_1101_ITEM_SELECTABLE_17_REFINANCE = '#A_1101_ITEM_SELECTABLE_17_REFINANCE#',
A_1101_ITEM_DESCRIPTION_18_REFINANCE = '#A_1101_ITEM_DESCRIPTION_18_REFINANCE#',
A_1101_ITEM_AMOUNT_18_REFINANCE = '#A_1101_ITEM_AMOUNT_18_REFINANCE#',
A_1101_ITEM_SELECTABLE_18_REFINANCE = '#A_1101_ITEM_SELECTABLE_18_REFINANCE#',
A_1101_ITEM_DESCRIPTION_19_REFINANCE = '#A_1101_ITEM_DESCRIPTION_19_REFINANCE#',
A_1101_ITEM_AMOUNT_19_REFINANCE = '#A_1101_ITEM_AMOUNT_19_REFINANCE#',
A_1101_ITEM_SELECTABLE_19_REFINANCE = '#A_1101_ITEM_SELECTABLE_19_REFINANCE#',
A_1101_ITEM_DESCRIPTION_20_REFINANCE = '#A_1101_ITEM_DESCRIPTION_20_REFINANCE#',
A_1101_ITEM_AMOUNT_20_REFINANCE = '#A_1101_ITEM_AMOUNT_20_REFINANCE#',
A_1101_ITEM_SELECTABLE_20_REFINANCE = '#A_1101_ITEM_SELECTABLE_20_REFINANCE#',
A_1101_ITEM_DESCRIPTION_01_PURCHASE = '#A_1101_ITEM_DESCRIPTION_01_PURCHASE#',
A_1101_ITEM_AMOUNT_01_PURCHASE = '#A_1101_ITEM_AMOUNT_01_PURCHASE#',
A_1101_ITEM_SELECTABLE_01_PURCHASE = '#A_1101_ITEM_SELECTABLE_01_PURCHASE#',
A_1101_ITEM_DESCRIPTION_02_PURCHASE = '#A_1101_ITEM_DESCRIPTION_02_PURCHASE#',
A_1101_ITEM_AMOUNT_02_PURCHASE = '#A_1101_ITEM_AMOUNT_02_PURCHASE#',
A_1101_ITEM_SELECTABLE_02_PURCHASE = '#A_1101_ITEM_SELECTABLE_02_PURCHASE#',
A_1101_ITEM_DESCRIPTION_03_PURCHASE = '#A_1101_ITEM_DESCRIPTION_03_PURCHASE#',
A_1101_ITEM_AMOUNT_03_PURCHASE = '#A_1101_ITEM_AMOUNT_03_PURCHASE#',
A_1101_ITEM_SELECTABLE_03_PURCHASE = '#A_1101_ITEM_SELECTABLE_03_PURCHASE#',
A_1101_ITEM_DESCRIPTION_04_PURCHASE = '#A_1101_ITEM_DESCRIPTION_04_PURCHASE#',
A_1101_ITEM_AMOUNT_04_PURCHASE = '#A_1101_ITEM_AMOUNT_04_PURCHASE#',
A_1101_ITEM_SELECTABLE_04_PURCHASE = '#A_1101_ITEM_SELECTABLE_04_PURCHASE#',
A_1101_ITEM_DESCRIPTION_05_PURCHASE = '#A_1101_ITEM_DESCRIPTION_05_PURCHASE#',
A_1101_ITEM_AMOUNT_05_PURCHASE = '#A_1101_ITEM_AMOUNT_05_PURCHASE#',
A_1101_ITEM_SELECTABLE_05_PURCHASE = '#A_1101_ITEM_SELECTABLE_05_PURCHASE#',
A_1101_ITEM_DESCRIPTION_06_PURCHASE = '#A_1101_ITEM_DESCRIPTION_06_PURCHASE#',
A_1101_ITEM_AMOUNT_06_PURCHASE = '#A_1101_ITEM_AMOUNT_06_PURCHASE#',
A_1101_ITEM_SELECTABLE_06_PURCHASE = '#A_1101_ITEM_SELECTABLE_06_PURCHASE#',
A_1101_ITEM_DESCRIPTION_07_PURCHASE = '#A_1101_ITEM_DESCRIPTION_07_PURCHASE#',
A_1101_ITEM_AMOUNT_07_PURCHASE = '#A_1101_ITEM_AMOUNT_07_PURCHASE#',
A_1101_ITEM_SELECTABLE_07_PURCHASE = '#A_1101_ITEM_SELECTABLE_07_PURCHASE#',
A_1101_ITEM_DESCRIPTION_08_PURCHASE = '#A_1101_ITEM_DESCRIPTION_08_PURCHASE#',
A_1101_ITEM_AMOUNT_08_PURCHASE = '#A_1101_ITEM_AMOUNT_08_PURCHASE#',
A_1101_ITEM_SELECTABLE_08_PURCHASE = '#A_1101_ITEM_SELECTABLE_08_PURCHASE#',
A_1101_ITEM_DESCRIPTION_09_PURCHASE = '#A_1101_ITEM_DESCRIPTION_09_PURCHASE#',
A_1101_ITEM_AMOUNT_09_PURCHASE = '#A_1101_ITEM_AMOUNT_09_PURCHASE#',
A_1101_ITEM_SELECTABLE_09_PURCHASE = '#A_1101_ITEM_SELECTABLE_09_PURCHASE#',
A_1101_ITEM_DESCRIPTION_10_PURCHASE = '#A_1101_ITEM_DESCRIPTION_10_PURCHASE#',
A_1101_ITEM_AMOUNT_10_PURCHASE = '#A_1101_ITEM_AMOUNT_10_PURCHASE#',
A_1101_ITEM_SELECTABLE_10_PURCHASE = '#A_1101_ITEM_SELECTABLE_10_PURCHASE#',
A_1101_ITEM_DESCRIPTION_11_PURCHASE = '#A_1101_ITEM_DESCRIPTION_11_PURCHASE#',
A_1101_ITEM_AMOUNT_11_PURCHASE = '#A_1101_ITEM_AMOUNT_11_PURCHASE#',
A_1101_ITEM_SELECTABLE_11_PURCHASE = '#A_1101_ITEM_SELECTABLE_11_PURCHASE#',
A_1101_ITEM_DESCRIPTION_12_PURCHASE = '#A_1101_ITEM_DESCRIPTION_12_PURCHASE#',
A_1101_ITEM_AMOUNT_12_PURCHASE = '#A_1101_ITEM_AMOUNT_12_PURCHASE#',
A_1101_ITEM_SELECTABLE_12_PURCHASE = '#A_1101_ITEM_SELECTABLE_12_PURCHASE#',
A_1101_ITEM_DESCRIPTION_13_PURCHASE = '#A_1101_ITEM_DESCRIPTION_13_PURCHASE#',
A_1101_ITEM_AMOUNT_13_PURCHASE = '#A_1101_ITEM_AMOUNT_13_PURCHASE#',
A_1101_ITEM_SELECTABLE_13_PURCHASE = '#A_1101_ITEM_SELECTABLE_13_PURCHASE#',
A_1101_ITEM_DESCRIPTION_14_PURCHASE = '#A_1101_ITEM_DESCRIPTION_14_PURCHASE#',
A_1101_ITEM_AMOUNT_14_PURCHASE = '#A_1101_ITEM_AMOUNT_14_PURCHASE#',
A_1101_ITEM_SELECTABLE_14_PURCHASE = '#A_1101_ITEM_SELECTABLE_14_PURCHASE#',
A_1101_ITEM_DESCRIPTION_15_PURCHASE = '#A_1101_ITEM_DESCRIPTION_15_PURCHASE#',
A_1101_ITEM_AMOUNT_15_PURCHASE = '#A_1101_ITEM_AMOUNT_15_PURCHASE#',
A_1101_ITEM_SELECTABLE_15_PURCHASE = '#A_1101_ITEM_SELECTABLE_15_PURCHASE#',
A_1101_ITEM_DESCRIPTION_16_PURCHASE = '#A_1101_ITEM_DESCRIPTION_16_PURCHASE#',
A_1101_ITEM_AMOUNT_16_PURCHASE = '#A_1101_ITEM_AMOUNT_16_PURCHASE#',
A_1101_ITEM_SELECTABLE_16_PURCHASE = '#A_1101_ITEM_SELECTABLE_16_PURCHASE#',
A_1101_ITEM_DESCRIPTION_17_PURCHASE = '#A_1101_ITEM_DESCRIPTION_17_PURCHASE#',
A_1101_ITEM_AMOUNT_17_PURCHASE = '#A_1101_ITEM_AMOUNT_17_PURCHASE#',
A_1101_ITEM_SELECTABLE_17_PURCHASE = '#A_1101_ITEM_SELECTABLE_17_PURCHASE#',
A_1101_ITEM_DESCRIPTION_18_PURCHASE = '#A_1101_ITEM_DESCRIPTION_18_PURCHASE#',
A_1101_ITEM_AMOUNT_18_PURCHASE = '#A_1101_ITEM_AMOUNT_18_PURCHASE#',
A_1101_ITEM_SELECTABLE_18_PURCHASE = '#A_1101_ITEM_SELECTABLE_18_PURCHASE#',
A_1101_ITEM_DESCRIPTION_19_PURCHASE = '#A_1101_ITEM_DESCRIPTION_19_PURCHASE#',
A_1101_ITEM_AMOUNT_19_PURCHASE = '#A_1101_ITEM_AMOUNT_19_PURCHASE#',
A_1101_ITEM_SELECTABLE_19_PURCHASE = '#A_1101_ITEM_SELECTABLE_19_PURCHASE#',
A_1101_ITEM_DESCRIPTION_20_PURCHASE = '#A_1101_ITEM_DESCRIPTION_20_PURCHASE#',
A_1101_ITEM_AMOUNT_20_PURCHASE = '#A_1101_ITEM_AMOUNT_20_PURCHASE#',
A_1101_ITEM_SELECTABLE_20_PURCHASE = '#A_1101_ITEM_SELECTABLE_20_PURCHASE#',
A_1101_ITEM_DESCRIPTION_01_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_01_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_01_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_01_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_01_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_01_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_02_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_02_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_02_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_02_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_02_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_02_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_03_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_03_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_03_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_03_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_03_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_03_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_04_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_04_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_04_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_04_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_04_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_04_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_05_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_05_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_05_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_05_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_05_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_05_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_06_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_06_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_06_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_06_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_06_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_06_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_07_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_07_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_07_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_07_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_07_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_07_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_08_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_08_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_08_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_08_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_08_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_08_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_09_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_09_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_09_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_09_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_09_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_09_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_10_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_10_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_10_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_10_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_10_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_10_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_11_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_11_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_11_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_11_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_11_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_11_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_12_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_12_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_12_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_12_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_12_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_12_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_13_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_13_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_13_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_13_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_13_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_13_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_14_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_14_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_14_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_14_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_14_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_14_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_15_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_15_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_15_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_15_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_15_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_15_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_16_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_16_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_16_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_16_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_16_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_16_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_17_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_17_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_17_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_17_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_17_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_17_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_18_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_18_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_18_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_18_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_18_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_18_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_19_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_19_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_19_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_19_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_19_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_19_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_20_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_20_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_20_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_20_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_20_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_20_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_01_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_01_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_01_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_01_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_01_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_01_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_02_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_02_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_02_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_02_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_02_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_02_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_03_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_03_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_03_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_03_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_03_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_03_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_04_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_04_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_04_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_04_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_04_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_04_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_05_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_05_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_05_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_05_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_05_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_05_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_06_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_06_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_06_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_06_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_06_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_06_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_07_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_07_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_07_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_07_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_07_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_07_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_08_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_08_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_08_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_08_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_08_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_08_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_09_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_09_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_09_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_09_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_09_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_09_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_10_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_10_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_10_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_10_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_10_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_10_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_11_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_11_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_11_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_11_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_11_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_11_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_12_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_12_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_12_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_12_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_12_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_12_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_13_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_13_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_13_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_13_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_13_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_13_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_14_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_14_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_14_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_14_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_14_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_14_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_15_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_15_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_15_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_15_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_15_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_15_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_16_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_16_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_16_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_16_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_16_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_16_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_17_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_17_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_17_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_17_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_17_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_17_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_18_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_18_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_18_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_18_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_18_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_18_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_19_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_19_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_19_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_19_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_19_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_19_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_20_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_20_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_20_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_20_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_20_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_20_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_01_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_01_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_01_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_01_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_01_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_01_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_02_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_02_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_02_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_02_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_02_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_02_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_03_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_03_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_03_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_03_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_03_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_03_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_04_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_04_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_04_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_04_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_04_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_04_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_05_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_05_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_05_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_05_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_05_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_05_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_06_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_06_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_06_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_06_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_06_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_06_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_07_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_07_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_07_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_07_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_07_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_07_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_08_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_08_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_08_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_08_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_08_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_08_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_09_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_09_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_09_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_09_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_09_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_09_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_10_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_10_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_10_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_10_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_10_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_10_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_11_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_11_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_11_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_11_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_11_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_11_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_12_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_12_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_12_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_12_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_12_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_12_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_13_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_13_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_13_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_13_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_13_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_13_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_14_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_14_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_14_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_14_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_14_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_14_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_15_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_15_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_15_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_15_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_15_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_15_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_16_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_16_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_16_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_16_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_16_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_16_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_17_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_17_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_17_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_17_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_17_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_17_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_18_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_18_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_18_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_18_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_18_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_18_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_19_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_19_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_19_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_19_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_19_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_19_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_20_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_20_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_20_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_20_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_20_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_20_PURCHASE_SELLER#'
WHERE tempmod_id = #get_new_id.tempmod_id#
</CFQUERY>



<CFQUERY datasource="#request.dsn#" name="update_itemized_constr">
UPDATE ITEMIZED_1101_CHARGES_CONSTRUCTION_tempmods
SET
A_1101_ITEM_DESCRIPTION_01_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_01_CONSTR_1X#',
A_1101_ITEM_AMOUNT_01_CONSTR_1X = '#A_1101_ITEM_AMOUNT_01_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_01_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_01_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_02_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_02_CONSTR_1X#',
A_1101_ITEM_AMOUNT_02_CONSTR_1X = '#A_1101_ITEM_AMOUNT_02_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_02_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_02_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_03_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_03_CONSTR_1X#',
A_1101_ITEM_AMOUNT_03_CONSTR_1X = '#A_1101_ITEM_AMOUNT_03_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_03_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_03_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_04_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_04_CONSTR_1X#',
A_1101_ITEM_AMOUNT_04_CONSTR_1X = '#A_1101_ITEM_AMOUNT_04_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_04_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_04_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_05_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_05_CONSTR_1X#',
A_1101_ITEM_AMOUNT_05_CONSTR_1X = '#A_1101_ITEM_AMOUNT_05_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_05_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_05_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_06_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_06_CONSTR_1X#',
A_1101_ITEM_AMOUNT_06_CONSTR_1X = '#A_1101_ITEM_AMOUNT_06_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_06_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_06_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_07_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_07_CONSTR_1X#',
A_1101_ITEM_AMOUNT_07_CONSTR_1X = '#A_1101_ITEM_AMOUNT_07_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_07_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_07_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_08_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_08_CONSTR_1X#',
A_1101_ITEM_AMOUNT_08_CONSTR_1X = '#A_1101_ITEM_AMOUNT_08_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_08_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_08_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_09_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_09_CONSTR_1X#',
A_1101_ITEM_AMOUNT_09_CONSTR_1X = '#A_1101_ITEM_AMOUNT_09_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_09_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_09_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_10_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_10_CONSTR_1X#',
A_1101_ITEM_AMOUNT_10_CONSTR_1X = '#A_1101_ITEM_AMOUNT_10_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_10_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_10_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_11_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_11_CONSTR_1X#',
A_1101_ITEM_AMOUNT_11_CONSTR_1X = '#A_1101_ITEM_AMOUNT_11_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_11_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_11_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_12_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_12_CONSTR_1X#',
A_1101_ITEM_AMOUNT_12_CONSTR_1X = '#A_1101_ITEM_AMOUNT_12_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_12_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_12_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_13_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_13_CONSTR_1X#',
A_1101_ITEM_AMOUNT_13_CONSTR_1X = '#A_1101_ITEM_AMOUNT_13_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_13_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_13_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_14_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_14_CONSTR_1X#',
A_1101_ITEM_AMOUNT_14_CONSTR_1X = '#A_1101_ITEM_AMOUNT_14_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_14_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_14_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_15_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_15_CONSTR_1X#',
A_1101_ITEM_AMOUNT_15_CONSTR_1X = '#A_1101_ITEM_AMOUNT_15_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_15_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_15_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_16_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_16_CONSTR_1X#',
A_1101_ITEM_AMOUNT_16_CONSTR_1X = '#A_1101_ITEM_AMOUNT_16_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_16_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_16_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_17_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_17_CONSTR_1X#',
A_1101_ITEM_AMOUNT_17_CONSTR_1X = '#A_1101_ITEM_AMOUNT_17_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_17_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_17_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_18_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_18_CONSTR_1X#',
A_1101_ITEM_AMOUNT_18_CONSTR_1X = '#A_1101_ITEM_AMOUNT_18_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_18_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_18_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_19_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_19_CONSTR_1X#',
A_1101_ITEM_AMOUNT_19_CONSTR_1X = '#A_1101_ITEM_AMOUNT_19_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_19_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_19_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_20_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_20_CONSTR_1X#',
A_1101_ITEM_AMOUNT_20_CONSTR_1X = '#A_1101_ITEM_AMOUNT_20_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_20_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_20_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_01_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_01_CONSTR_2X#',
A_1101_ITEM_AMOUNT_01_CONSTR_2X = '#A_1101_ITEM_AMOUNT_01_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_01_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_01_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_02_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_02_CONSTR_2X#',
A_1101_ITEM_AMOUNT_02_CONSTR_2X = '#A_1101_ITEM_AMOUNT_02_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_02_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_02_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_03_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_03_CONSTR_2X#',
A_1101_ITEM_AMOUNT_03_CONSTR_2X = '#A_1101_ITEM_AMOUNT_03_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_03_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_03_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_04_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_04_CONSTR_2X#',
A_1101_ITEM_AMOUNT_04_CONSTR_2X = '#A_1101_ITEM_AMOUNT_04_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_04_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_04_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_05_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_05_CONSTR_2X#',
A_1101_ITEM_AMOUNT_05_CONSTR_2X = '#A_1101_ITEM_AMOUNT_05_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_05_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_05_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_06_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_06_CONSTR_2X#',
A_1101_ITEM_AMOUNT_06_CONSTR_2X = '#A_1101_ITEM_AMOUNT_06_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_06_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_06_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_07_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_07_CONSTR_2X#',
A_1101_ITEM_AMOUNT_07_CONSTR_2X = '#A_1101_ITEM_AMOUNT_07_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_07_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_07_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_08_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_08_CONSTR_2X#',
A_1101_ITEM_AMOUNT_08_CONSTR_2X = '#A_1101_ITEM_AMOUNT_08_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_08_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_08_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_09_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_09_CONSTR_2X#',
A_1101_ITEM_AMOUNT_09_CONSTR_2X = '#A_1101_ITEM_AMOUNT_09_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_09_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_09_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_10_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_10_CONSTR_2X#',
A_1101_ITEM_AMOUNT_10_CONSTR_2X = '#A_1101_ITEM_AMOUNT_10_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_10_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_10_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_11_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_11_CONSTR_2X#',
A_1101_ITEM_AMOUNT_11_CONSTR_2X = '#A_1101_ITEM_AMOUNT_11_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_11_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_11_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_12_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_12_CONSTR_2X#',
A_1101_ITEM_AMOUNT_12_CONSTR_2X = '#A_1101_ITEM_AMOUNT_12_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_12_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_12_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_13_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_13_CONSTR_2X#',
A_1101_ITEM_AMOUNT_13_CONSTR_2X = '#A_1101_ITEM_AMOUNT_13_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_13_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_13_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_14_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_14_CONSTR_2X#',
A_1101_ITEM_AMOUNT_14_CONSTR_2X = '#A_1101_ITEM_AMOUNT_14_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_14_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_14_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_15_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_15_CONSTR_2X#',
A_1101_ITEM_AMOUNT_15_CONSTR_2X = '#A_1101_ITEM_AMOUNT_15_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_15_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_15_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_16_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_16_CONSTR_2X#',
A_1101_ITEM_AMOUNT_16_CONSTR_2X = '#A_1101_ITEM_AMOUNT_16_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_16_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_16_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_17_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_17_CONSTR_2X#',
A_1101_ITEM_AMOUNT_17_CONSTR_2X = '#A_1101_ITEM_AMOUNT_17_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_17_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_17_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_18_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_18_CONSTR_2X#',
A_1101_ITEM_AMOUNT_18_CONSTR_2X = '#A_1101_ITEM_AMOUNT_18_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_18_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_18_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_19_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_19_CONSTR_2X#',
A_1101_ITEM_AMOUNT_19_CONSTR_2X = '#A_1101_ITEM_AMOUNT_19_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_19_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_19_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_20_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_20_CONSTR_2X#',
A_1101_ITEM_AMOUNT_20_CONSTR_2X = '#A_1101_ITEM_AMOUNT_20_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_20_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_20_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_01_END_LOAN = '#A_1101_ITEM_DESCRIPTION_01_END_LOAN#',
A_1101_ITEM_AMOUNT_01_END_LOAN = '#A_1101_ITEM_AMOUNT_01_END_LOAN#',
A_1101_ITEM_SELECTABLE_01_END_LOAN = '#A_1101_ITEM_SELECTABLE_01_END_LOAN#',
A_1101_ITEM_DESCRIPTION_02_END_LOAN = '#A_1101_ITEM_DESCRIPTION_02_END_LOAN#',
A_1101_ITEM_AMOUNT_02_END_LOAN = '#A_1101_ITEM_AMOUNT_02_END_LOAN#',
A_1101_ITEM_SELECTABLE_02_END_LOAN = '#A_1101_ITEM_SELECTABLE_02_END_LOAN#',
A_1101_ITEM_DESCRIPTION_03_END_LOAN = '#A_1101_ITEM_DESCRIPTION_03_END_LOAN#',
A_1101_ITEM_AMOUNT_03_END_LOAN = '#A_1101_ITEM_AMOUNT_03_END_LOAN#',
A_1101_ITEM_SELECTABLE_03_END_LOAN = '#A_1101_ITEM_SELECTABLE_03_END_LOAN#',
A_1101_ITEM_DESCRIPTION_04_END_LOAN = '#A_1101_ITEM_DESCRIPTION_04_END_LOAN#',
A_1101_ITEM_AMOUNT_04_END_LOAN = '#A_1101_ITEM_AMOUNT_04_END_LOAN#',
A_1101_ITEM_SELECTABLE_04_END_LOAN = '#A_1101_ITEM_SELECTABLE_04_END_LOAN#',
A_1101_ITEM_DESCRIPTION_05_END_LOAN = '#A_1101_ITEM_DESCRIPTION_05_END_LOAN#',
A_1101_ITEM_AMOUNT_05_END_LOAN = '#A_1101_ITEM_AMOUNT_05_END_LOAN#',
A_1101_ITEM_SELECTABLE_05_END_LOAN = '#A_1101_ITEM_SELECTABLE_05_END_LOAN#',
A_1101_ITEM_DESCRIPTION_06_END_LOAN = '#A_1101_ITEM_DESCRIPTION_06_END_LOAN#',
A_1101_ITEM_AMOUNT_06_END_LOAN = '#A_1101_ITEM_AMOUNT_06_END_LOAN#',
A_1101_ITEM_SELECTABLE_06_END_LOAN = '#A_1101_ITEM_SELECTABLE_06_END_LOAN#',
A_1101_ITEM_DESCRIPTION_07_END_LOAN = '#A_1101_ITEM_DESCRIPTION_07_END_LOAN#',
A_1101_ITEM_AMOUNT_07_END_LOAN = '#A_1101_ITEM_AMOUNT_07_END_LOAN#',
A_1101_ITEM_SELECTABLE_07_END_LOAN = '#A_1101_ITEM_SELECTABLE_07_END_LOAN#',
A_1101_ITEM_DESCRIPTION_08_END_LOAN = '#A_1101_ITEM_DESCRIPTION_08_END_LOAN#',
A_1101_ITEM_AMOUNT_08_END_LOAN = '#A_1101_ITEM_AMOUNT_08_END_LOAN#',
A_1101_ITEM_SELECTABLE_08_END_LOAN = '#A_1101_ITEM_SELECTABLE_08_END_LOAN#',
A_1101_ITEM_DESCRIPTION_09_END_LOAN = '#A_1101_ITEM_DESCRIPTION_09_END_LOAN#',
A_1101_ITEM_AMOUNT_09_END_LOAN = '#A_1101_ITEM_AMOUNT_09_END_LOAN#',
A_1101_ITEM_SELECTABLE_09_END_LOAN = '#A_1101_ITEM_SELECTABLE_09_END_LOAN#',
A_1101_ITEM_DESCRIPTION_10_END_LOAN = '#A_1101_ITEM_DESCRIPTION_10_END_LOAN#',
A_1101_ITEM_AMOUNT_10_END_LOAN = '#A_1101_ITEM_AMOUNT_10_END_LOAN#',
A_1101_ITEM_SELECTABLE_10_END_LOAN = '#A_1101_ITEM_SELECTABLE_10_END_LOAN#',
A_1101_ITEM_DESCRIPTION_11_END_LOAN = '#A_1101_ITEM_DESCRIPTION_11_END_LOAN#',
A_1101_ITEM_AMOUNT_11_END_LOAN = '#A_1101_ITEM_AMOUNT_11_END_LOAN#',
A_1101_ITEM_SELECTABLE_11_END_LOAN = '#A_1101_ITEM_SELECTABLE_11_END_LOAN#',
A_1101_ITEM_DESCRIPTION_12_END_LOAN = '#A_1101_ITEM_DESCRIPTION_12_END_LOAN#',
A_1101_ITEM_AMOUNT_12_END_LOAN = '#A_1101_ITEM_AMOUNT_12_END_LOAN#',
A_1101_ITEM_SELECTABLE_12_END_LOAN = '#A_1101_ITEM_SELECTABLE_12_END_LOAN#',
A_1101_ITEM_DESCRIPTION_13_END_LOAN = '#A_1101_ITEM_DESCRIPTION_13_END_LOAN#',
A_1101_ITEM_AMOUNT_13_END_LOAN = '#A_1101_ITEM_AMOUNT_13_END_LOAN#',
A_1101_ITEM_SELECTABLE_13_END_LOAN = '#A_1101_ITEM_SELECTABLE_13_END_LOAN#',
A_1101_ITEM_DESCRIPTION_14_END_LOAN = '#A_1101_ITEM_DESCRIPTION_14_END_LOAN#',
A_1101_ITEM_AMOUNT_14_END_LOAN = '#A_1101_ITEM_AMOUNT_14_END_LOAN#',
A_1101_ITEM_SELECTABLE_14_END_LOAN = '#A_1101_ITEM_SELECTABLE_14_END_LOAN#',
A_1101_ITEM_DESCRIPTION_15_END_LOAN = '#A_1101_ITEM_DESCRIPTION_15_END_LOAN#',
A_1101_ITEM_AMOUNT_15_END_LOAN = '#A_1101_ITEM_AMOUNT_15_END_LOAN#',
A_1101_ITEM_SELECTABLE_15_END_LOAN = '#A_1101_ITEM_SELECTABLE_15_END_LOAN#',
A_1101_ITEM_DESCRIPTION_16_END_LOAN = '#A_1101_ITEM_DESCRIPTION_16_END_LOAN#',
A_1101_ITEM_AMOUNT_16_END_LOAN = '#A_1101_ITEM_AMOUNT_16_END_LOAN#',
A_1101_ITEM_SELECTABLE_16_END_LOAN = '#A_1101_ITEM_SELECTABLE_16_END_LOAN#',
A_1101_ITEM_DESCRIPTION_17_END_LOAN = '#A_1101_ITEM_DESCRIPTION_17_END_LOAN#',
A_1101_ITEM_AMOUNT_17_END_LOAN = '#A_1101_ITEM_AMOUNT_17_END_LOAN#',
A_1101_ITEM_SELECTABLE_17_END_LOAN = '#A_1101_ITEM_SELECTABLE_17_END_LOAN#',
A_1101_ITEM_DESCRIPTION_18_END_LOAN = '#A_1101_ITEM_DESCRIPTION_18_END_LOAN#',
A_1101_ITEM_AMOUNT_18_END_LOAN = '#A_1101_ITEM_AMOUNT_18_END_LOAN#',
A_1101_ITEM_SELECTABLE_18_END_LOAN = '#A_1101_ITEM_SELECTABLE_18_END_LOAN#',
A_1101_ITEM_DESCRIPTION_19_END_LOAN = '#A_1101_ITEM_DESCRIPTION_19_END_LOAN#',
A_1101_ITEM_AMOUNT_19_END_LOAN = '#A_1101_ITEM_AMOUNT_19_END_LOAN#',
A_1101_ITEM_SELECTABLE_19_END_LOAN = '#A_1101_ITEM_SELECTABLE_19_END_LOAN#',
A_1101_ITEM_DESCRIPTION_20_END_LOAN = '#A_1101_ITEM_DESCRIPTION_20_END_LOAN#',
A_1101_ITEM_AMOUNT_20_END_LOAN = '#A_1101_ITEM_AMOUNT_20_END_LOAN#',
A_1101_ITEM_SELECTABLE_20_END_LOAN = '#A_1101_ITEM_SELECTABLE_20_END_LOAN#'
WHERE tempmod_id = #get_new_id.tempmod_id#
</CFQUERY>


<CFMAIL
TO="rick@jermain.com"
FROM="webmaster@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="Line Cost info change request"
TIMEOUT="600"
type="HTML"
>
<style type="text/css">
<!--
body { margin:0px;padding:0px;font-family:arial,sans-serif;font-size:10px;}
table { font-size:10px;}
textarea { font-family:arial,sans-serif; font-size:10px; color:##004000; background:##cdfed0; border:1px dotted ##004000; }
input.text, input.date, input.two_digit, input.four_digit { font-size:10px; font-style:italic; width:180px; color:##999999; background:##cdfed0; border:1px dotted ##004000; }
input.textnormal, input.date, input.two_digit, input.four_digit { font-size:10px; font-style:normal; width:180px; color:##000000; background:##cdfed0; border:1px dotted ##004000; }
input.small { font-size:10px; font-style:italic; width:100px; color:##999999;background:##cdfed0; border:1px dotted ##004000; text-align:right; }
input.smallnormal { font-size:10px; width:100px; font-style:normal; color:##000000;background:##cdfed0; border:1px dotted ##004000; text-align:right; }
input.check { font-size:10px; width:30px; color:##004000; border:1px dotted ##004000; }
input.userout { font-size:10px; width:160px; color:##400000; background:##ffdfdf; border:1px dotted ##400000; }
input.userin { font-size:10px; width:180px; color:##400000; background:##ffdfdf; border:1px dotted ##400000; }
p.pagebreak { page-break-before:always }
.page_container { width:1330px; }
.page_title { font-size:14px; }
.table_header { font-weight:bold; background-color:black; color:white; }
.bsilver { border-right:1px solid black; border-left:1px solid black; border-bottom:1px solid black;  background-color:##dddddd; }
.bdarksilver { border:1px solid black; background-color:##bbbbbb; }
.bdarksilver_head { border:1px solid black; font-weight:bold; background-color:##bbbbbb; }
.black { font-weight:bold; background-color:black; color:white; }
.bordered { border-bottom:1px solid black; border-right:1px solid black; text-align:right; vertical-align:bottom;  }
.bordered_wleft { border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; text-align:right; vertical-align:bottom;  }
-->
</style>
<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

	<tr>
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial>
			<B>A request #read_user.fname#&nbsp;&nbsp;#read_user.lname# to change 2010 Line Costs for the company below</B>
			<p>
		</td>
	</tr>

	<tr>
		<td width=498 align=center valign=top bgcolor=e3e3e3>
			<font size=3 color=green face=arial>
			Client - <B>#read_company.company#</B>
		</td>
	</tr>


</table>

<table width=600 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>


	<tr>
		<td width=600 align=center valign=top bgcolor=e3e3e3>
			<font size=2 color=black face=arial>
<cfoutput>
<span class="page_title">REFINANCE</span><BR>
<!-- 800 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr><td height="4" colspan="6"></td></tr>
<tr>
<td class="bdarksilver_head">800. Items Payable in Connection with Loan</td>
<td class="bdarksilver_head" align="right">Amount</td>
</tr>
<tr>
<td class="bsilver">801. #A_0801_DESCRIPTION_REFINANCE#</td>
<td class="bordered">#A_0801_AMOUNT_REFINANCE#</td>
</tr>
<tr>
<tr>
<td class="bsilver">802. #A_0802_DESCRIPTION_REFINANCE#</td>
<td class="bordered">#A_0802_AMOUNT_REFINANCE#</td>
</tr>
<tr>
<td class="bsilver">804. #A_0804_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_0804_PAYTO_REFINANCE#</td>

<td class="bordered">#A_0804_AMOUNT_REFINANCE#</td>
</tr>
<tr>
<td class="bsilver">805. #A_0805_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_0805_PAYTO_REFINANCE#</td>
<td class="bordered">#A_0805_AMOUNT_REFINANCE#</td>
</tr>
<tr>
<td class="bsilver">806. #A_0806_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_0806_PAYTO_REFINANCE#</td>
<td class="bordered">#A_0806_AMOUNT_REFINANCE#</td>
</tr>

<tr>
<td class="bsilver">807. #A_0807_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_0807_PAYTO_REFINANCE#</td>
<td class="bordered">#A_0807_AMOUNT_REFINANCE#</td>
</tr>
<tr>
<td class="bsilver">808. #A_0808_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_0808_PAYTO_REFINANCE#</td>
<td class="bordered">#A_0808_AMOUNT_REFINANCE#</td>
</tr>
<tr>
<td class="bsilver">809. #A_0809_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_0809_PAYTO_REFINANCE#</td>
<td class="bordered">#A_0809_AMOUNT_REFINANCE#</td>
</tr>
<tr>
<td class="bsilver">810. #A_0810_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_0810_PAYTO_REFINANCE#</td>
<td class="bordered">#A_0810_AMOUNT_REFINANCE#</td>
</tr>
<tr>
<td class="bsilver">811. #A_0811_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_0811_PAYTO_REFINANCE#</td>
<td class="bordered">#A_0811_AMOUNT_REFINANCE#</td>
</tr>
<tr>
<td class="bsilver">812. #A_0812_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_0812_PAYTO_REFINANCE#</td>
<td class="bordered">#A_0812_AMOUNT_REFINANCE#</td>
</tr>
</table>
<!-- 1100 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1100. Title Charges</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>
</tr>
<tr>
<td class="bsilver">1101. Total charges in connection with Title not explicitly listed below</td>
<td class="bordered">#A_1101_AMOUNT_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Itemized 1101 Charges</td>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_01_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_01_REFINANCE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_01_REFINANCE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_02_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_02_REFINANCE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_02_REFINANCE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_03_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_03_REFINANCE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_03_REFINANCE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_04_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_04_REFINANCE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_04_REFINANCE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_05_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_05_REFINANCE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_05_REFINANCE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_06_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_06_REFINANCE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_06_REFINANCE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_07_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_07_REFINANCE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_07_REFINANCE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_08_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_08_REFINANCE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_08_REFINANCE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_09_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_09_REFINANCE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_09_REFINANCE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_10_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_10_REFINANCE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_10_REFINANCE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_11_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_11_REFINANCE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_11_REFINANCE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_12_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_12_REFINANCE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_12_REFINANCE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_13_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_13_REFINANCE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_13_REFINANCE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_14_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_14_REFINANCE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_14_REFINANCE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_15_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_15_REFINANCE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_15_REFINANCE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_16_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_16_REFINANCE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_16_REFINANCE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_17_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_17_REFINANCE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_17_REFINANCE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_18_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_18_REFINANCE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_18_REFINANCE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_19_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_19_REFINANCE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_19_REFINANCE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_20_REFINANCE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_20_REFINANCE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_20_REFINANCE eq 1>(selectable)</cfif></td>
</tr>

<tr>
<td class="bsilver">1102. #A_1102_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_1102_PAYTO_REFINANCE#</td>
<td class="bordered">#A_1102_AMOUNT_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102A. #A_1102A_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_1102A_PAYTO_REFINANCE#</td>
<td class="bordered">#A_1102A_AMOUNT_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102B. #A_1102B_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_1102B_PAYTO_REFINANCE#</td>
<td class="bordered">#A_1102B_AMOUNT_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102C. #A_1102C_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_1102C_PAYTO_REFINANCE#</td>
<td class="bordered">#A_1102C_AMOUNT_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102D. #A_1102D_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_1102D_PAYTO_REFINANCE#</td>
<td class="bordered">#A_1102D_AMOUNT_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102E. #A_1102E_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_1102E_PAYTO_REFINANCE#</td>
<td class="bordered">#A_1102E_AMOUNT_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102F. #A_1102F_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_1102F_PAYTO_REFINANCE#</td>
<td class="bordered">#A_1102F_AMOUNT_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102G. #A_1102G_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_1102G_PAYTO_REFINANCE#</td>
<td class="bordered">#A_1102G_AMOUNT_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102H. #A_1102H_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_1102H_PAYTO_REFINANCE#</td>
<td class="bordered">#A_1102H_AMOUNT_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102I. #A_1102I_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_1102I_PAYTO_REFINANCE#</td>
<td class="bordered">#A_1102I_AMOUNT_REFINANCE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1109. #A_1109_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_1109_PAYTO_REFINANCE#</td>
<td class="bordered">#A_1109_AMOUNT_REFINANCE#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1109_OUTSIDE_REFINANCE" value="1" onClick="a_1109_outside();" <cfif A_1109_OUTSIDE_REFINANCE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1110. #A_1110_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_1110_PAYTO_REFINANCE#</td>
<td class="bordered">#A_1110_AMOUNT_REFINANCE#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1110_OUTSIDE_REFINANCE" value="1" onClick="a_1110_outside();" <cfif A_1110_OUTSIDE_REFINANCE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1111. #A_1111_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_1111_PAYTO_REFINANCE#</td>
<td class="bordered">#A_1111_AMOUNT_REFINANCE#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1111_OUTSIDE_REFINANCE" value="1" onClick="a_1111_outside();" <cfif A_1111_OUTSIDE_REFINANCE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1112. #A_1112_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_1112_PAYTO_REFINANCE#</td>
<td class="bordered">#A_1112_AMOUNT_REFINANCE#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1112_OUTSIDE_REFINANCE" value="1" onClick="a_1112_outside();" <cfif A_1112_OUTSIDE_REFINANCE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1113. #A_1113_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_1113_PAYTO_REFINANCE#</td>
<td class="bordered">#A_1113_AMOUNT_REFINANCE#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1113_OUTSIDE_REFINANCE" value="1" onClick="a_1113_outside();" <cfif A_1113_OUTSIDE_REFINANCE eq 1>checked</cfif> /></td></tr>
</table>
<!-- 1300 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1300. Additional Settlement Charges (for Non-Title/Settlement Charges)</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>

</tr>
<!--- <tr>
<td class="bsilver">1301. #A_1301_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_1301_PAYTO_REFINANCE#</td>
<td class="bordered">#A_1301_AMOUNT_REFINANCE#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1301_OUTSIDE_REFINANCE" value="1" onClick="a_1301_outside();" <cfif A_1301_OUTSIDE_REFINANCE eq 1>checked</cfif> /></td></tr>
 ---><tr>
<td class="bsilver">1302. #A_1302_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_1302_PAYTO_REFINANCE#</td>
<td class="bordered">#A_1302_AMOUNT_REFINANCE#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1302_OUTSIDE_REFINANCE" value="1" onClick="a_1302_outside();" <cfif A_1302_OUTSIDE_REFINANCE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1303. #A_1303_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_1303_PAYTO_REFINANCE#</td>
<td class="bordered">#A_1303_AMOUNT_REFINANCE#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1303_OUTSIDE_REFINANCE" value="1" onClick="a_1303_outside();" <cfif A_1303_OUTSIDE_REFINANCE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1304. #A_1304_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_1304_PAYTO_REFINANCE#</td>
<td class="bordered">#A_1304_AMOUNT_REFINANCE#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1304_OUTSIDE_REFINANCE" value="1" onClick="a_1304_outside();" <cfif A_1304_OUTSIDE_REFINANCE eq 1>checked</cfif> /></td></tr>

<tr>
<td class="bsilver">1305. #A_1305_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_1305_PAYTO_REFINANCE#</td>
<td class="bordered">#A_1305_AMOUNT_REFINANCE#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1305_OUTSIDE_REFINANCE" value="1" onClick="a_1305_outside();" <cfif A_1305_OUTSIDE_REFINANCE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1306. #A_1306_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_1306_PAYTO_REFINANCE#</td>
<td class="bordered">#A_1306_AMOUNT_REFINANCE#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1306_OUTSIDE_REFINANCE" value="1" onClick="a_1306_outside();" <cfif A_1306_OUTSIDE_REFINANCE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1307. #A_1307_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_1307_PAYTO_REFINANCE#</td>
<td class="bordered">#A_1307_AMOUNT_REFINANCE#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1307_OUTSIDE_REFINANCE" value="1" onClick="a_1307_outside();" <cfif A_1307_OUTSIDE_REFINANCE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1308. #A_1308_DESCRIPTION_REFINANCE#&nbsp;to &nbsp;#A_1308_PAYTO_REFINANCE#</td>
<td class="bordered">#A_1308_AMOUNT_REFINANCE#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1308_OUTSIDE_REFINANCE" value="1" onClick="a_1308_outside();" <cfif A_1308_OUTSIDE_REFINANCE eq 1>checked</cfif> /></td></tr>
</table>

<br>
<br>
<br>
<span class="page_title">PURCHASE</span><BR>
<!-- 800 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr><td height="4" colspan="6"></td></tr>
<tr>
<td class="bdarksilver_head">800. Items Payable in Connection with Loan</td>
<td class="bdarksilver_head" align="right">Amount</td>
</tr>
<tr>
<td class="bsilver">801. #A_0801_DESCRIPTION_PURCHASE#</td>
<td class="bordered">#A_0801_AMOUNT_PURCHASE#</td>
</tr>
<tr>
<tr>
<td class="bsilver">802. #A_0802_DESCRIPTION_PURCHASE#</td>
<td class="bordered">#A_0802_AMOUNT_PURCHASE#</td>
</tr>
<tr>
<td class="bsilver">804. #A_0804_DESCRIPTION_PURCHASE# &nbsp;to &nbsp;#A_0804_PAYTO_PURCHASE#</td>
<td class="bordered">#A_0804_AMOUNT_PURCHASE#</td>
</tr>
<tr>
<td class="bsilver">805. #A_0805_DESCRIPTION_PURCHASE# &nbsp;to &nbsp;#A_0805_PAYTO_PURCHASE#</td>
<td class="bordered">#A_0805_AMOUNT_PURCHASE#</td>
</tr>
<tr>
<td class="bsilver">806. #A_0806_DESCRIPTION_PURCHASE# &nbsp;to &nbsp;#A_0806_PAYTO_PURCHASE#</td>
<td class="bordered">#A_0806_AMOUNT_PURCHASE#</td>
</tr>

<tr>
<td class="bsilver">807. #A_0807_DESCRIPTION_PURCHASE# &nbsp;to &nbsp;#A_0807_PAYTO_PURCHASE#</td>
<td class="bordered">#A_0807_AMOUNT_PURCHASE#</td>
</tr>
<tr>
<td class="bsilver">808. #A_0808_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_0808_PAYTO_PURCHASE#</td>
<td class="bordered">#A_0808_AMOUNT_PURCHASE#</td>
</tr>
<tr>
<td class="bsilver">809. #A_0809_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_0809_PAYTO_PURCHASE#</td>
<td class="bordered">#A_0809_AMOUNT_PURCHASE#</td>
</tr>
<tr>
<td class="bsilver">810. #A_0810_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_0810_PAYTO_PURCHASE#</td>
<td class="bordered">#A_0810_AMOUNT_PURCHASE#</td>

</tr>
<tr>
<td class="bsilver">811. #A_0811_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_0811_PAYTO_PURCHASE#</td>
<td class="bordered">#A_0811_AMOUNT_PURCHASE#</td>
</tr>
<tr>
<td class="bsilver">812. #A_0812_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_0812_PAYTO_PURCHASE#</td>
<td class="bordered">#A_0812_AMOUNT_PURCHASE#</td>
</tr>
</table>
<!-- 1100 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1100. Title Charges</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>
</tr>
<tr>
<td class="bsilver">1101. Total charges in connection with Title not explicitly listed below</td>
<td class="bordered">#A_1101_AMOUNT_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Itemized 1101 Charges</td>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_01_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_01_PURCHASE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_01_PURCHASE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_02_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_02_PURCHASE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_02_PURCHASE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_03_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_03_PURCHASE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_03_PURCHASE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_04_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_04_PURCHASE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_04_PURCHASE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_05_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_05_PURCHASE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_05_PURCHASE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_06_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_06_PURCHASE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_06_PURCHASE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_07_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_07_PURCHASE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_07_PURCHASE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_08_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_08_PURCHASE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_08_PURCHASE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_09_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_09_PURCHASE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_09_PURCHASE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_10_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_10_PURCHASE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_10_PURCHASE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_11_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_11_PURCHASE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_11_PURCHASE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_12_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_12_PURCHASE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_12_PURCHASE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_13_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_13_PURCHASE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_13_PURCHASE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_14_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_14_PURCHASE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_14_PURCHASE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_15_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_15_PURCHASE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_15_PURCHASE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_16_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_16_PURCHASE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_16_PURCHASE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_17_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_17_PURCHASE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_17_PURCHASE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_18_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_18_PURCHASE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_18_PURCHASE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_19_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_19_PURCHASE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_19_PURCHASE eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_20_PURCHASE#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_20_PURCHASE#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_20_PURCHASE eq 1>(selectable)</cfif></td>
</tr>

<tr>
<td class="bsilver">1102. #A_1102_DESCRIPTION_PURCHASE# &nbsp;to &nbsp;#A_1102_PAYTO_PURCHASE#</td>
<td class="bordered">#A_1102_AMOUNT_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102A. #A_1102A_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_1102A_PAYTO_PURCHASE#</td>
<td class="bordered">#A_1102A_AMOUNT_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102B. #A_1102B_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_1102B_PAYTO_PURCHASE#</td>
<td class="bordered">#A_1102B_AMOUNT_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102C. #A_1102C_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_1102C_PAYTO_PURCHASE#</td>
<td class="bordered">#A_1102C_AMOUNT_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102D. #A_1102D_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_1102D_PAYTO_PURCHASE#</td>
<td class="bordered">#A_1102D_AMOUNT_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102E. #A_1102E_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_1102E_PAYTO_PURCHASE#</td>
<td class="bordered">#A_1102E_AMOUNT_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102F. #A_1102F_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_1102F_PAYTO_PURCHASE#</td>
<td class="bordered">#A_1102F_AMOUNT_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102G. #A_1102G_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_1102G_PAYTO_PURCHASE#</td>
<td class="bordered">#A_1102G_AMOUNT_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102H. #A_1102H_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_1102H_PAYTO_PURCHASE#</td>
<td class="bordered">#A_1102H_AMOUNT_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102I. #A_1102I_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_1102I_PAYTO_PURCHASE#</td>
<td class="bordered">#A_1102I_AMOUNT_PURCHASE#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1109. #A_1109_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_1109_PAYTO_PURCHASE#</td>
<td class="bordered">#A_1109_AMOUNT_PURCHASE#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1109_OUTSIDE_PURCHASE" value="1" onClick="a_1109_outside();" <cfif A_1109_OUTSIDE_PURCHASE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1110. #A_1110_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_1110_PAYTO_PURCHASE#</td>
<td class="bordered">#A_1110_AMOUNT_PURCHASE#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1110_OUTSIDE_PURCHASE" value="1" onClick="a_1110_outside();" <cfif A_1110_OUTSIDE_PURCHASE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1111. #A_1111_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_1111_PAYTO_PURCHASE#</td>
<td class="bordered">#A_1111_AMOUNT_PURCHASE#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1111_OUTSIDE_PURCHASE" value="1" onClick="a_1111_outside();" <cfif A_1111_OUTSIDE_PURCHASE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1112. #A_1112_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_1112_PAYTO_PURCHASE#</td>
<td class="bordered">#A_1112_AMOUNT_PURCHASE#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1112_OUTSIDE_PURCHASE" value="1" onClick="a_1112_outside();" <cfif A_1112_OUTSIDE_PURCHASE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1113. #A_1113_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_1113_PAYTO_PURCHASE#</td>
<td class="bordered">#A_1113_AMOUNT_PURCHASE#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1113_OUTSIDE_PURCHASE" value="1" onClick="a_1113_outside();" <cfif A_1113_OUTSIDE_PURCHASE eq 1>checked</cfif> /></td></tr>
</table>
<!-- 1300 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1300. Additional Settlement Charges (for Non-Title/Settlement Charges)</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>

</tr>
<!--- <tr>
<td class="bsilver">1301. #A_1301_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_1301_PAYTO_PURCHASE#</td>
<td class="bordered">#A_1301_AMOUNT_PURCHASE#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1301_OUTSIDE_PURCHASE" value="1" onClick="a_1301_outside();" <cfif A_1301_OUTSIDE_PURCHASE eq 1>checked</cfif> /></td></tr>
 ---><tr>
<td class="bsilver">1302. #A_1302_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_1302_PAYTO_PURCHASE#</td>
<td class="bordered">#A_1302_AMOUNT_PURCHASE#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1302_OUTSIDE_PURCHASE" value="1" onClick="a_1302_outside();" <cfif A_1302_OUTSIDE_PURCHASE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1303. #A_1303_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_1303_PAYTO_PURCHASE#</td>
<td class="bordered">#A_1303_AMOUNT_PURCHASE#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1303_OUTSIDE_PURCHASE" value="1" onClick="a_1303_outside();" <cfif A_1303_OUTSIDE_PURCHASE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1304. #A_1304_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_1304_PAYTO_PURCHASE#</td>
<td class="bordered">#A_1304_AMOUNT_PURCHASE#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1304_OUTSIDE_PURCHASE" value="1" onClick="a_1304_outside();" <cfif A_1304_OUTSIDE_PURCHASE eq 1>checked</cfif> /></td></tr>

<tr>
<td class="bsilver">1305. #A_1305_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_1305_PAYTO_PURCHASE#</td>
<td class="bordered">#A_1305_AMOUNT_PURCHASE#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1305_OUTSIDE_PURCHASE" value="1" onClick="a_1305_outside();" <cfif A_1305_OUTSIDE_PURCHASE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1306. #A_1306_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_1306_PAYTO_PURCHASE#</td>
<td class="bordered">#A_1306_AMOUNT_PURCHASE#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1306_OUTSIDE_PURCHASE" value="1" onClick="a_1306_outside();" <cfif A_1306_OUTSIDE_PURCHASE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1307. #A_1307_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_1307_PAYTO_PURCHASE#</td>
<td class="bordered">#A_1307_AMOUNT_PURCHASE#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1307_OUTSIDE_PURCHASE" value="1" onClick="a_1307_outside();" <cfif A_1307_OUTSIDE_PURCHASE eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1308. #A_1308_DESCRIPTION_PURCHASE#&nbsp;to &nbsp;#A_1308_PAYTO_PURCHASE#</td>

<td class="bordered">#A_1308_AMOUNT_PURCHASE#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1308_OUTSIDE_PURCHASE" value="1" onClick="a_1308_outside();" <cfif A_1308_OUTSIDE_PURCHASE eq 1>checked</cfif> /></td></tr>
</table>
<br>
<br>
<br>
<span class="page_title">2ND MORTGAGE with NO Title Insurance</span><BR>
<!-- 800 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr><td height="4" colspan="6"></td></tr>
<tr>
<td class="bdarksilver_head">800. Items Payable in Connection with Loan</td>
<td class="bdarksilver_head" align="right">Amount</td>
</tr>
<tr>
<td class="bsilver">801. #A_0801_DESCRIPTION_2ND_NO_TI#</td>
<td class="bordered">#A_0801_AMOUNT_2ND_NO_TI#</td>
</tr>
<tr>
<tr>
<td class="bsilver">802. #A_0802_DESCRIPTION_2ND_NO_TI#</td>
<td class="bordered">#A_0802_AMOUNT_2ND_NO_TI#</td>
</tr>
<tr>
<td class="bsilver">804. #A_0804_DESCRIPTION_2ND_NO_TI# &nbsp;to &nbsp;#A_0804_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_0804_AMOUNT_2ND_NO_TI#</td>
</tr>
<tr>
<td class="bsilver">805. #A_0805_DESCRIPTION_2ND_NO_TI# &nbsp;to &nbsp;#A_0805_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_0805_AMOUNT_2ND_NO_TI#</td>
</tr>
<tr>
<td class="bsilver">806. #A_0806_DESCRIPTION_2ND_NO_TI# &nbsp;to &nbsp;#A_0806_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_0806_AMOUNT_2ND_NO_TI#</td>
</tr>

<tr>
<td class="bsilver">807. #A_0807_DESCRIPTION_2ND_NO_TI# &nbsp;to &nbsp;#A_0807_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_0807_AMOUNT_2ND_NO_TI#</td>
</tr>
<tr>
<td class="bsilver">808. #A_0808_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_0808_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_0808_AMOUNT_2ND_NO_TI#</td>
</tr>
<tr>
<td class="bsilver">809. #A_0809_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_0809_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_0809_AMOUNT_2ND_NO_TI#</td>
</tr>
<tr>
<td class="bsilver">810. #A_0810_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_0810_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_0810_AMOUNT_2ND_NO_TI#</td>
</tr>
<tr>
<td class="bsilver">811. #A_0811_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_0811_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_0811_AMOUNT_2ND_NO_TI#</td>
</tr>
<tr>
<td class="bsilver">812. #A_0812_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_0812_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_0812_AMOUNT_2ND_NO_TI#</td>
</tr>
</table>
<!-- 1100 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1100. Title Charges</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>
</tr>
<tr>
<td class="bsilver">1101. Total charges in connection with Title not explicitly listed below</td>
<td class="bordered">#A_1101_AMOUNT_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Itemized 1101 Charges</td>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_01_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_01_2ND_NO_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_01_2ND_NO_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_02_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_02_2ND_NO_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_02_2ND_NO_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_03_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_03_2ND_NO_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_03_2ND_NO_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_04_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_04_2ND_NO_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_04_2ND_NO_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_05_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_05_2ND_NO_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_05_2ND_NO_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_06_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_06_2ND_NO_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_06_2ND_NO_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_07_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_07_2ND_NO_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_07_2ND_NO_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_08_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_08_2ND_NO_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_08_2ND_NO_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_09_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_09_2ND_NO_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_09_2ND_NO_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_10_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_10_2ND_NO_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_10_2ND_NO_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_11_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_11_2ND_NO_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_11_2ND_NO_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_12_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_12_2ND_NO_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_12_2ND_NO_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_13_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_13_2ND_NO_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_13_2ND_NO_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_14_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_14_2ND_NO_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_14_2ND_NO_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_15_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_15_2ND_NO_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_15_2ND_NO_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_16_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_16_2ND_NO_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_16_2ND_NO_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_17_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_17_2ND_NO_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_17_2ND_NO_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_18_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_18_2ND_NO_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_18_2ND_NO_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_19_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_19_2ND_NO_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_19_2ND_NO_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_20_2ND_NO_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_20_2ND_NO_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_20_2ND_NO_TI eq 1>(selectable)</cfif></td>
</tr>

<tr>
<td class="bsilver">1102. #A_1102_DESCRIPTION_2ND_NO_TI# &nbsp;to &nbsp;#A_1102_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_1102_AMOUNT_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102A. #A_1102A_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_1102A_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_1102A_AMOUNT_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102B. #A_1102B_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_1102B_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_1102B_AMOUNT_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102C. #A_1102C_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_1102C_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_1102C_AMOUNT_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102D. #A_1102D_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_1102D_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_1102D_AMOUNT_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102E. #A_1102E_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_1102E_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_1102E_AMOUNT_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102F. #A_1102F_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_1102F_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_1102F_AMOUNT_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102G. #A_1102G_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_1102G_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_1102G_AMOUNT_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102H. #A_1102H_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_1102H_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_1102H_AMOUNT_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102I. #A_1102I_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_1102I_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_1102I_AMOUNT_2ND_NO_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1109. #A_1109_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_1109_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_1109_AMOUNT_2ND_NO_TI#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1109_OUTSIDE_2ND_NO_TI" value="1" onClick="a_1109_outside();" <cfif A_1109_OUTSIDE_2ND_NO_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1110. #A_1110_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_1110_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_1110_AMOUNT_2ND_NO_TI#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1110_OUTSIDE_2ND_NO_TI" value="1" onClick="a_1110_outside();" <cfif A_1110_OUTSIDE_2ND_NO_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1111. #A_1111_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_1111_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_1111_AMOUNT_2ND_NO_TI#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1111_OUTSIDE_2ND_NO_TI" value="1" onClick="a_1111_outside();" <cfif A_1111_OUTSIDE_2ND_NO_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1112. #A_1112_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_1112_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_1112_AMOUNT_2ND_NO_TI#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1112_OUTSIDE_2ND_NO_TI" value="1" onClick="a_1112_outside();" <cfif A_1112_OUTSIDE_2ND_NO_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1113. #A_1113_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_1113_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_1113_AMOUNT_2ND_NO_TI#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1113_OUTSIDE_2ND_NO_TI" value="1" onClick="a_1113_outside();" <cfif A_1113_OUTSIDE_2ND_NO_TI eq 1>checked</cfif> /></td></tr>
</table>
<!-- 1300 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1300. Additional Settlement Charges (for Non-Title/Settlement Charges)</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>

</tr>
<!--- <tr>
<td class="bsilver">1301. #A_1301_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_1301_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_1301_AMOUNT_2ND_NO_TI#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1301_OUTSIDE_2ND_NO_TI" value="1" onClick="a_1301_outside();" <cfif A_1301_OUTSIDE_2ND_NO_TI eq 1>checked</cfif> /></td></tr>
 ---><tr>
<td class="bsilver">1302. #A_1302_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_1302_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_1302_AMOUNT_2ND_NO_TI#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1302_OUTSIDE_2ND_NO_TI" value="1" onClick="a_1302_outside();" <cfif A_1302_OUTSIDE_2ND_NO_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1303. #A_1303_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_1303_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_1303_AMOUNT_2ND_NO_TI#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1303_OUTSIDE_2ND_NO_TI" value="1" onClick="a_1303_outside();" <cfif A_1303_OUTSIDE_2ND_NO_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1304. #A_1304_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_1304_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_1304_AMOUNT_2ND_NO_TI#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1304_OUTSIDE_2ND_NO_TI" value="1" onClick="a_1304_outside();" <cfif A_1304_OUTSIDE_2ND_NO_TI eq 1>checked</cfif> /></td></tr>

<tr>
<td class="bsilver">1305. #A_1305_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_1305_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_1305_AMOUNT_2ND_NO_TI#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1305_OUTSIDE_2ND_NO_TI" value="1" onClick="a_1305_outside();" <cfif A_1305_OUTSIDE_2ND_NO_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1306. #A_1306_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_1306_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_1306_AMOUNT_2ND_NO_TI#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1306_OUTSIDE_2ND_NO_TI" value="1" onClick="a_1306_outside();" <cfif A_1306_OUTSIDE_2ND_NO_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1307. #A_1307_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_1307_PAYTO_2ND_NO_TI#</td>
<td class="bordered">#A_1307_AMOUNT_2ND_NO_TI#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1307_OUTSIDE_2ND_NO_TI" value="1" onClick="a_1307_outside();" <cfif A_1307_OUTSIDE_2ND_NO_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1308. #A_1308_DESCRIPTION_2ND_NO_TI#&nbsp;to &nbsp;#A_1308_PAYTO_2ND_NO_TI#</td>

<td class="bordered">#A_1308_AMOUNT_2ND_NO_TI#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1308_OUTSIDE_2ND_NO_TI" value="1" onClick="a_1308_outside();" <cfif A_1308_OUTSIDE_2ND_NO_TI eq 1>checked</cfif> /></td></tr>
</table>
<br>
<br>
<br>
<span class="page_title">2ND MORTGAGE with Title Insurance</span><BR>
<!-- 800 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr><td height="4" colspan="6"></td></tr>
<tr>
<td class="bdarksilver_head">800. Items Payable in Connection with Loan</td>
<td class="bdarksilver_head" align="right">Amount</td>
</tr>
<tr>
<td class="bsilver">801. #A_0801_DESCRIPTION_2ND_WITH_TI#</td>
<td class="bordered">#A_0801_AMOUNT_2ND_WITH_TI#</td>
</tr>
<tr>
<tr>
<td class="bsilver">802. #A_0802_DESCRIPTION_2ND_WITH_TI#</td>
<td class="bordered">#A_0802_AMOUNT_2ND_WITH_TI#</td>
</tr>
<tr>
<td class="bsilver">804. #A_0804_DESCRIPTION_2ND_WITH_TI# &nbsp;to &nbsp;#A_0804_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_0804_AMOUNT_2ND_WITH_TI#</td>
</tr>
<tr>
<td class="bsilver">805. #A_0805_DESCRIPTION_2ND_WITH_TI# &nbsp;to &nbsp;#A_0805_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_0805_AMOUNT_2ND_WITH_TI#</td>
</tr>
<tr>
<td class="bsilver">806. #A_0806_DESCRIPTION_2ND_WITH_TI# &nbsp;to &nbsp;#A_0806_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_0806_AMOUNT_2ND_WITH_TI#</td>
</tr>

<tr>
<td class="bsilver">807. #A_0807_DESCRIPTION_2ND_WITH_TI# &nbsp;to &nbsp;#A_0807_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_0807_AMOUNT_2ND_WITH_TI#</td>
</tr>
<tr>
<td class="bsilver">808. #A_0808_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_0808_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_0808_AMOUNT_2ND_WITH_TI#</td>
</tr>
<tr>
<td class="bsilver">809. #A_0809_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_0809_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_0809_AMOUNT_2ND_WITH_TI#</td>
</tr>
<tr>
<td class="bsilver">810. #A_0810_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_0810_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_0810_AMOUNT_2ND_WITH_TI#</td>
</tr>
<tr>
<td class="bsilver">811. #A_0811_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_0811_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_0811_AMOUNT_2ND_WITH_TI#</td>
</tr>
<tr>
<td class="bsilver">812. #A_0812_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_0812_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_0812_AMOUNT_2ND_WITH_TI#</td>
</tr>
</table>
<!-- 1100 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1100. Title Charges</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>
</tr>
<tr>
<td class="bsilver">1101. Total charges in connection with Title not explicitly listed below</td>
<td class="bordered">#A_1101_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Itemized 1101 Charges</td>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_01_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_01_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_01_2ND_WITH_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_02_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_02_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_02_2ND_WITH_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_03_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_03_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_03_2ND_WITH_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_04_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_04_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_04_2ND_WITH_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_05_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_05_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_05_2ND_WITH_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_06_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_06_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_06_2ND_WITH_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_07_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_07_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_07_2ND_WITH_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_08_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_08_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_08_2ND_WITH_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_09_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_09_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_09_2ND_WITH_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_10_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_10_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_10_2ND_WITH_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_11_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_11_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_11_2ND_WITH_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_12_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_12_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_12_2ND_WITH_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_13_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_13_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_13_2ND_WITH_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_14_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_14_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_14_2ND_WITH_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_15_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_15_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_15_2ND_WITH_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_16_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_16_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_16_2ND_WITH_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_17_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_17_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_17_2ND_WITH_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_18_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_18_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_18_2ND_WITH_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_19_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_19_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_19_2ND_WITH_TI eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_20_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_20_2ND_WITH_TI#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_20_2ND_WITH_TI eq 1>(selectable)</cfif></td>
</tr>

<tr>
<td class="bsilver">1102. #A_1102_DESCRIPTION_2ND_WITH_TI# &nbsp;to &nbsp;#A_1102_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_1102_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102A. #A_1102A_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_1102A_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_1102A_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102B. #A_1102B_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_1102B_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_1102B_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102C. #A_1102C_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_1102C_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_1102C_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102D. #A_1102D_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_1102D_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_1102D_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102E. #A_1102E_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_1102E_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_1102E_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102F. #A_1102F_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_1102F_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_1102F_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102G. #A_1102G_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_1102G_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_1102G_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102H. #A_1102H_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_1102H_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_1102H_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102I. #A_1102I_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_1102I_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_1102I_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1109. #A_1109_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_1109_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_1109_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1109_OUTSIDE_2ND_WITH_TI" value="1" onClick="a_1109_outside();" <cfif A_1109_OUTSIDE_2ND_WITH_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1110. #A_1110_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_1110_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_1110_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1110_OUTSIDE_2ND_WITH_TI" value="1" onClick="a_1110_outside();" <cfif A_1110_OUTSIDE_2ND_WITH_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1111. #A_1111_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_1111_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_1111_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1111_OUTSIDE_2ND_WITH_TI" value="1" onClick="a_1111_outside();" <cfif A_1111_OUTSIDE_2ND_WITH_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1112. #A_1112_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_1112_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_1112_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1112_OUTSIDE_2ND_WITH_TI" value="1" onClick="a_1112_outside();" <cfif A_1112_OUTSIDE_2ND_WITH_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1113. #A_1113_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_1113_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_1113_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1113_OUTSIDE_2ND_WITH_TI" value="1" onClick="a_1113_outside();" <cfif A_1113_OUTSIDE_2ND_WITH_TI eq 1>checked</cfif> /></td></tr>
</table>
<!-- 1300 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1300. Additional Settlement Charges (for Non-Title/Settlement Charges)</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>

</tr>
<!--- <tr>
<td class="bsilver">1301. #A_1301_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_1301_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_1301_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1301_OUTSIDE_2ND_WITH_TI" value="1" onClick="a_1301_outside();" <cfif A_1301_OUTSIDE_2ND_WITH_TI eq 1>checked</cfif> /></td></tr>
 ---><tr>
<td class="bsilver">1302. #A_1302_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_1302_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_1302_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1302_OUTSIDE_2ND_WITH_TI" value="1" onClick="a_1302_outside();" <cfif A_1302_OUTSIDE_2ND_WITH_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1303. #A_1303_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_1303_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_1303_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1303_OUTSIDE_2ND_WITH_TI" value="1" onClick="a_1303_outside();" <cfif A_1303_OUTSIDE_2ND_WITH_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1304. #A_1304_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_1304_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_1304_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1304_OUTSIDE_2ND_WITH_TI" value="1" onClick="a_1304_outside();" <cfif A_1304_OUTSIDE_2ND_WITH_TI eq 1>checked</cfif> /></td></tr>

<tr>
<td class="bsilver">1305. #A_1305_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_1305_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_1305_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1305_OUTSIDE_2ND_WITH_TI" value="1" onClick="a_1305_outside();" <cfif A_1305_OUTSIDE_2ND_WITH_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1306. #A_1306_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_1306_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_1306_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1306_OUTSIDE_2ND_WITH_TI" value="1" onClick="a_1306_outside();" <cfif A_1306_OUTSIDE_2ND_WITH_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1307. #A_1307_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_1307_PAYTO_2ND_WITH_TI#</td>
<td class="bordered">#A_1307_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1307_OUTSIDE_2ND_WITH_TI" value="1" onClick="a_1307_outside();" <cfif A_1307_OUTSIDE_2ND_WITH_TI eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1308. #A_1308_DESCRIPTION_2ND_WITH_TI#&nbsp;to &nbsp;#A_1308_PAYTO_2ND_WITH_TI#</td>

<td class="bordered">#A_1308_AMOUNT_2ND_WITH_TI#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1308_OUTSIDE_2ND_WITH_TI" value="1" onClick="a_1308_outside();" <cfif A_1308_OUTSIDE_2ND_WITH_TI eq 1>checked</cfif> /></td></tr>
</table>
<br>
<br>
<br>
<span class="page_title">PURCHASE - SELLER</span><BR>
<!-- 800 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr><td height="4" colspan="6"></td></tr>
<tr>
<td class="bdarksilver_head">800. Items Payable in Connection with Loan</td>
<td class="bdarksilver_head" align="right">Amount</td>
</tr>
<tr>
<td class="bsilver">801. #A_0801_DESCRIPTION_PURCHASE_SELLER#</td>
<td class="bordered">#A_0801_AMOUNT_PURCHASE_SELLER#</td>
</tr>
<tr>
<tr>
<td class="bsilver">802. #A_0802_DESCRIPTION_PURCHASE_SELLER#</td>
<td class="bordered">#A_0802_AMOUNT_PURCHASE_SELLER#</td>
</tr>
<tr>
<td class="bsilver">804. #A_0804_DESCRIPTION_PURCHASE_SELLER# &nbsp;to &nbsp;#A_0804_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_0804_AMOUNT_PURCHASE_SELLER#</td>
</tr>
<tr>
<td class="bsilver">805. #A_0805_DESCRIPTION_PURCHASE_SELLER# &nbsp;to &nbsp;#A_0805_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_0805_AMOUNT_PURCHASE_SELLER#</td>
</tr>
<tr>
<td class="bsilver">806. #A_0806_DESCRIPTION_PURCHASE_SELLER# &nbsp;to &nbsp;#A_0806_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_0806_AMOUNT_PURCHASE_SELLER#</td>
</tr>

<tr>
<td class="bsilver">807. #A_0807_DESCRIPTION_PURCHASE_SELLER# &nbsp;to &nbsp;#A_0807_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_0807_AMOUNT_PURCHASE_SELLER#</td>
</tr>
<tr>
<td class="bsilver">808. #A_0808_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_0808_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_0808_AMOUNT_PURCHASE_SELLER#</td>
</tr>
<tr>
<td class="bsilver">809. #A_0809_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_0809_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_0809_AMOUNT_PURCHASE_SELLER#</td>
</tr>
<tr>
<td class="bsilver">810. #A_0810_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_0810_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_0810_AMOUNT_PURCHASE_SELLER#</td>
</tr>
<tr>
<td class="bsilver">811. #A_0811_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_0811_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_0811_AMOUNT_PURCHASE_SELLER#</td>
</tr>
<tr>
<td class="bsilver">812. #A_0812_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_0812_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_0812_AMOUNT_PURCHASE_SELLER#</td>
</tr>
</table>
<!-- 1100 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1100. Title Charges</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>
</tr>
<tr>
<td class="bsilver">1101. Total charges in connection with Title not explicitly listed below</td>
<td class="bordered">#A_1101_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Itemized 1101 Charges</td>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_01_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_01_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_01_PURCHASE_SELLER eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_02_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_02_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_02_PURCHASE_SELLER eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_03_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_03_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_03_PURCHASE_SELLER eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_04_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_04_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_04_PURCHASE_SELLER eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_05_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_05_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_05_PURCHASE_SELLER eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_06_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_06_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_06_PURCHASE_SELLER eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_07_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_07_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_07_PURCHASE_SELLER eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_08_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_08_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_08_PURCHASE_SELLER eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_09_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_09_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_09_PURCHASE_SELLER eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_10_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_10_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_10_PURCHASE_SELLER eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_11_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_11_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_11_PURCHASE_SELLER eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_12_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_12_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_12_PURCHASE_SELLER eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_13_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_13_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_13_PURCHASE_SELLER eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_14_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_14_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_14_PURCHASE_SELLER eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_15_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_15_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_15_PURCHASE_SELLER eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_16_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_16_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_16_PURCHASE_SELLER eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_17_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_17_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_17_PURCHASE_SELLER eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_18_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_18_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_18_PURCHASE_SELLER eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_19_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_19_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_19_PURCHASE_SELLER eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_20_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_20_PURCHASE_SELLER#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_20_PURCHASE_SELLER eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver">1102. #A_1102_DESCRIPTION_PURCHASE_SELLER# &nbsp;to &nbsp;#A_1102_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_1102_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102A. #A_1102A_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_1102A_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_1102A_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102B. #A_1102B_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_1102B_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_1102B_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102C. #A_1102C_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_1102C_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_1102C_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102D. #A_1102D_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_1102D_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_1102D_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102E. #A_1102E_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_1102E_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_1102E_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102F. #A_1102F_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_1102F_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_1102F_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102G. #A_1102G_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_1102G_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_1102G_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102H. #A_1102H_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_1102H_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_1102H_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1102I. #A_1102I_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_1102I_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_1102I_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1109. #A_1109_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_1109_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_1109_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1109_OUTSIDE_PURCHASE_SELLER" value="1" onClick="a_1109_outside();" <cfif A_1109_OUTSIDE_PURCHASE_SELLER eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1110. #A_1110_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_1110_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_1110_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1110_OUTSIDE_PURCHASE_SELLER" value="1" onClick="a_1110_outside();" <cfif A_1110_OUTSIDE_PURCHASE_SELLER eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1111. #A_1111_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_1111_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_1111_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1111_OUTSIDE_PURCHASE_SELLER" value="1" onClick="a_1111_outside();" <cfif A_1111_OUTSIDE_PURCHASE_SELLER eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1112. #A_1112_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_1112_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_1112_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1112_OUTSIDE_PURCHASE_SELLER" value="1" onClick="a_1112_outside();" <cfif A_1112_OUTSIDE_PURCHASE_SELLER eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1113. #A_1113_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_1113_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_1113_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1113_OUTSIDE_PURCHASE_SELLER" value="1" onClick="a_1113_outside();" <cfif A_1113_OUTSIDE_PURCHASE_SELLER eq 1>checked</cfif> /></td></tr>
</table>
<!-- 1300 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1300. Additional Settlement Charges (for Non-Title/Settlement Charges)</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>

</tr>
<!--- <tr>
<td class="bsilver">1301. #A_1301_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_1301_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_1301_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1301_OUTSIDE_PURCHASE_SELLER" value="1" onClick="a_1301_outside();" <cfif A_1301_OUTSIDE_PURCHASE_SELLER eq 1>checked</cfif> /></td></tr>
 ---><tr>
<td class="bsilver">1302. #A_1302_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_1302_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_1302_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1302_OUTSIDE_PURCHASE_SELLER" value="1" onClick="a_1302_outside();" <cfif A_1302_OUTSIDE_PURCHASE_SELLER eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1303. #A_1303_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_1303_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_1303_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1303_OUTSIDE_PURCHASE_SELLER" value="1" onClick="a_1303_outside();" <cfif A_1303_OUTSIDE_PURCHASE_SELLER eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1304. #A_1304_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_1304_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_1304_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1304_OUTSIDE_PURCHASE_SELLER" value="1" onClick="a_1304_outside();" <cfif A_1304_OUTSIDE_PURCHASE_SELLER eq 1>checked</cfif> /></td></tr>

<tr>
<td class="bsilver">1305. #A_1305_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_1305_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_1305_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1305_OUTSIDE_PURCHASE_SELLER" value="1" onClick="a_1305_outside();" <cfif A_1305_OUTSIDE_PURCHASE_SELLER eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1306. #A_1306_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_1306_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_1306_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1306_OUTSIDE_PURCHASE_SELLER" value="1" onClick="a_1306_outside();" <cfif A_1306_OUTSIDE_PURCHASE_SELLER eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1307. #A_1307_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_1307_PAYTO_PURCHASE_SELLER#</td>
<td class="bordered">#A_1307_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1307_OUTSIDE_PURCHASE_SELLER" value="1" onClick="a_1307_outside();" <cfif A_1307_OUTSIDE_PURCHASE_SELLER eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1308. #A_1308_DESCRIPTION_PURCHASE_SELLER#&nbsp;to &nbsp;#A_1308_PAYTO_PURCHASE_SELLER#</td>

<td class="bordered">#A_1308_AMOUNT_PURCHASE_SELLER#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1308_OUTSIDE_PURCHASE_SELLER" value="1" onClick="a_1308_outside();" <cfif A_1308_OUTSIDE_PURCHASE_SELLER eq 1>checked</cfif> /></td></tr>
</table>
<br>
<br>
<br>
<span class="page_title">PURCHASE - SELLER</span><BR>
<!-- 800 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr><td height="4" colspan="6"></td></tr>
<tr>
<td class="bdarksilver_head">800. Items Payable in Connection with Loan</td>
<td class="bdarksilver_head" align="right">Amount</td>
</tr>
<tr>
<td class="bsilver">801. #A_0801_DESCRIPTION_CONSTR_1X#</td>
<td class="bordered">#A_0801_AMOUNT_CONSTR_1X#</td>
</tr>
<tr>
<tr>
<td class="bsilver">802. #A_0802_DESCRIPTION_CONSTR_1X#</td>
<td class="bordered">#A_0802_AMOUNT_CONSTR_1X#</td>
</tr>
<tr>
<td class="bsilver">804. #A_0804_DESCRIPTION_CONSTR_1X# &nbsp;to &nbsp;#A_0804_PAYTO_CONSTR_1X#</td>
<td class="bordered">#A_0804_AMOUNT_CONSTR_1X#</td>
</tr>
<tr>
<td class="bsilver">805. #A_0805_DESCRIPTION_CONSTR_1X# &nbsp;to &nbsp;#A_0805_PAYTO_CONSTR_1X#</td>
<td class="bordered">#A_0805_AMOUNT_CONSTR_1X#</td>
</tr>
<tr>
<td class="bsilver">806. #A_0806_DESCRIPTION_CONSTR_1X# &nbsp;to &nbsp;#A_0806_PAYTO_CONSTR_1X#</td>
<td class="bordered">#A_0806_AMOUNT_CONSTR_1X#</td>
</tr>

<tr>
<td class="bsilver">807. #A_0807_DESCRIPTION_CONSTR_1X# &nbsp;to &nbsp;#A_0807_PAYTO_CONSTR_1X#</td>
<td class="bordered">#A_0807_AMOUNT_CONSTR_1X#</td>
</tr>
<tr>
<td class="bsilver">808. #A_0808_DESCRIPTION_CONSTR_1X#&nbsp;to &nbsp;#A_0808_PAYTO_CONSTR_1X#</td>
<td class="bordered">#A_0808_AMOUNT_CONSTR_1X#</td>
</tr>
<tr>
<td class="bsilver">809. #A_0809_DESCRIPTION_CONSTR_1X#&nbsp;to &nbsp;#A_0809_PAYTO_CONSTR_1X#</td>
<td class="bordered">#A_0809_AMOUNT_CONSTR_1X#</td>
</tr>
<tr>
<td class="bsilver">810. #A_0810_DESCRIPTION_CONSTR_1X#&nbsp;to &nbsp;#A_0810_PAYTO_CONSTR_1X#</td>
<td class="bordered">#A_0810_AMOUNT_CONSTR_1X#</td>
</tr>
<tr>
<td class="bsilver">811. #A_0811_DESCRIPTION_CONSTR_1X#&nbsp;to &nbsp;#A_0811_PAYTO_CONSTR_1X#</td>
<td class="bordered">#A_0811_AMOUNT_CONSTR_1X#</td>
</tr>
<tr>
<td class="bsilver">812. #A_0812_DESCRIPTION_CONSTR_1X#&nbsp;to &nbsp;#A_0812_PAYTO_CONSTR_1X#</td>
<td class="bordered">#A_0812_AMOUNT_CONSTR_1X#</td>
</tr>
</table>
<!-- 1100 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1100. Title Charges</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>
</tr>
<tr>
<td class="bsilver">1101. Total charges in connection with Title not explicitly listed below</td>
<td class="bordered">#A_1101_AMOUNT_CONSTR_1X#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Itemized 1101 Charges</td>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_01_CONSTR_1X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_01_CONSTR_1X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_01_CONSTR_1X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_02_CONSTR_1X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_02_CONSTR_1X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_02_CONSTR_1X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_03_CONSTR_1X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_03_CONSTR_1X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_03_CONSTR_1X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_04_CONSTR_1X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_04_CONSTR_1X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_04_CONSTR_1X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_05_CONSTR_1X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_05_CONSTR_1X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_05_CONSTR_1X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_06_CONSTR_1X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_06_CONSTR_1X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_06_CONSTR_1X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_07_CONSTR_1X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_07_CONSTR_1X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_07_CONSTR_1X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_08_CONSTR_1X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_08_CONSTR_1X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_08_CONSTR_1X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_09_CONSTR_1X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_09_CONSTR_1X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_09_CONSTR_1X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_10_CONSTR_1X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_10_CONSTR_1X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_10_CONSTR_1X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_11_CONSTR_1X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_11_CONSTR_1X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_11_CONSTR_1X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_12_CONSTR_1X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_12_CONSTR_1X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_12_CONSTR_1X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_13_CONSTR_1X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_13_CONSTR_1X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_13_CONSTR_1X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_14_CONSTR_1X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_14_CONSTR_1X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_14_CONSTR_1X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_15_CONSTR_1X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_15_CONSTR_1X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_15_CONSTR_1X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_16_CONSTR_1X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_16_CONSTR_1X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_16_CONSTR_1X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_17_CONSTR_1X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_17_CONSTR_1X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_17_CONSTR_1X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_18_CONSTR_1X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_18_CONSTR_1X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_18_CONSTR_1X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_19_CONSTR_1X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_19_CONSTR_1X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_19_CONSTR_1X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_20_CONSTR_1X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_20_CONSTR_1X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_20_CONSTR_1X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver">1102. #A_1102_DESCRIPTION_CONSTR_1X# &nbsp;to &nbsp;#A_1102_PAYTO_CONSTR_1X#</td>
<td class="bordered">#A_1102_AMOUNT_CONSTR_1X#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1109. #A_1109_DESCRIPTION_CONSTR_1X#&nbsp;to &nbsp;#A_1109_PAYTO_CONSTR_1X#</td>
<td class="bordered">#A_1109_AMOUNT_CONSTR_1X#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1109_OUTSIDE_CONSTR_1X" value="1" onClick="a_1109_outside();" <cfif A_1109_OUTSIDE_CONSTR_1X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1110. #A_1110_DESCRIPTION_CONSTR_1X#&nbsp;to &nbsp;#A_1110_PAYTO_CONSTR_1X#</td>
<td class="bordered">#A_1110_AMOUNT_CONSTR_1X#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1110_OUTSIDE_CONSTR_1X" value="1" onClick="a_1110_outside();" <cfif A_1110_OUTSIDE_CONSTR_1X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1111. #A_1111_DESCRIPTION_CONSTR_1X#&nbsp;to &nbsp;#A_1111_PAYTO_CONSTR_1X#</td>
<td class="bordered">#A_1111_AMOUNT_CONSTR_1X#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1111_OUTSIDE_CONSTR_1X" value="1" onClick="a_1111_outside();" <cfif A_1111_OUTSIDE_CONSTR_1X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1112. #A_1112_DESCRIPTION_CONSTR_1X#&nbsp;to &nbsp;#A_1112_PAYTO_CONSTR_1X#</td>
<td class="bordered">#A_1112_AMOUNT_CONSTR_1X#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1112_OUTSIDE_CONSTR_1X" value="1" onClick="a_1112_outside();" <cfif A_1112_OUTSIDE_CONSTR_1X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1113. #A_1113_DESCRIPTION_CONSTR_1X#&nbsp;to &nbsp;#A_1113_PAYTO_CONSTR_1X#</td>
<td class="bordered">#A_1113_AMOUNT_CONSTR_1X#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1113_OUTSIDE_CONSTR_1X" value="1" onClick="a_1113_outside();" <cfif A_1113_OUTSIDE_CONSTR_1X eq 1>checked</cfif> /></td></tr>
</table>
<!-- 1300 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1300. Additional Settlement Charges (for Non-Title/Settlement Charges)</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>

</tr>
<!--- <tr>
<td class="bsilver">1301. #A_1301_DESCRIPTION_CONSTR_1X#&nbsp;to &nbsp;#A_1301_PAYTO_CONSTR_1X#</td>
<td class="bordered">#A_1301_AMOUNT_CONSTR_1X#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1301_OUTSIDE_CONSTR_1X" value="1" onClick="a_1301_outside();" <cfif A_1301_OUTSIDE_CONSTR_1X eq 1>checked</cfif> /></td></tr>
 ---><tr>
<td class="bsilver">1302. #A_1302_DESCRIPTION_CONSTR_1X#&nbsp;to &nbsp;#A_1302_PAYTO_CONSTR_1X#</td>
<td class="bordered">#A_1302_AMOUNT_CONSTR_1X#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1302_OUTSIDE_CONSTR_1X" value="1" onClick="a_1302_outside();" <cfif A_1302_OUTSIDE_CONSTR_1X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1303. #A_1303_DESCRIPTION_CONSTR_1X#&nbsp;to &nbsp;#A_1303_PAYTO_CONSTR_1X#</td>
<td class="bordered">#A_1303_AMOUNT_CONSTR_1X#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1303_OUTSIDE_CONSTR_1X" value="1" onClick="a_1303_outside();" <cfif A_1303_OUTSIDE_CONSTR_1X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1304. #A_1304_DESCRIPTION_CONSTR_1X#&nbsp;to &nbsp;#A_1304_PAYTO_CONSTR_1X#</td>
<td class="bordered">#A_1304_AMOUNT_CONSTR_1X#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1304_OUTSIDE_CONSTR_1X" value="1" onClick="a_1304_outside();" <cfif A_1304_OUTSIDE_CONSTR_1X eq 1>checked</cfif> /></td></tr>

<tr>
<td class="bsilver">1305. #A_1305_DESCRIPTION_CONSTR_1X#&nbsp;to &nbsp;#A_1305_PAYTO_CONSTR_1X#</td>
<td class="bordered">#A_1305_AMOUNT_CONSTR_1X#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1305_OUTSIDE_CONSTR_1X" value="1" onClick="a_1305_outside();" <cfif A_1305_OUTSIDE_CONSTR_1X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1306. #A_1306_DESCRIPTION_CONSTR_1X#&nbsp;to &nbsp;#A_1306_PAYTO_CONSTR_1X#</td>
<td class="bordered">#A_1306_AMOUNT_CONSTR_1X#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1306_OUTSIDE_CONSTR_1X" value="1" onClick="a_1306_outside();" <cfif A_1306_OUTSIDE_CONSTR_1X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1307. #A_1307_DESCRIPTION_CONSTR_1X#&nbsp;to &nbsp;#A_1307_PAYTO_CONSTR_1X#</td>
<td class="bordered">#A_1307_AMOUNT_CONSTR_1X#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1307_OUTSIDE_CONSTR_1X" value="1" onClick="a_1307_outside();" <cfif A_1307_OUTSIDE_CONSTR_1X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1308. #A_1308_DESCRIPTION_CONSTR_1X#&nbsp;to &nbsp;#A_1308_PAYTO_CONSTR_1X#</td>

<td class="bordered">#A_1308_AMOUNT_CONSTR_1X#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1308_OUTSIDE_CONSTR_1X" value="1" onClick="a_1308_outside();" <cfif A_1308_OUTSIDE_CONSTR_1X eq 1>checked</cfif> /></td></tr>
</table>
<br>
<br>
<br>
<span class="page_title">PURCHASE - SELLER</span><BR>
<!-- 800 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr><td height="4" colspan="6"></td></tr>
<tr>
<td class="bdarksilver_head">800. Items Payable in Connection with Loan</td>
<td class="bdarksilver_head" align="right">Amount</td>
</tr>
<tr>
<td class="bsilver">801. #A_0801_DESCRIPTION_CONSTR_2X#</td>
<td class="bordered">#A_0801_AMOUNT_CONSTR_2X#</td>
</tr>
<tr>
<tr>
<td class="bsilver">802. #A_0802_DESCRIPTION_CONSTR_2X#</td>
<td class="bordered">#A_0802_AMOUNT_CONSTR_2X#</td>
</tr>
<tr>
<td class="bsilver">804. #A_0804_DESCRIPTION_CONSTR_2X# &nbsp;to &nbsp;#A_0804_PAYTO_CONSTR_2X#</td>
<td class="bordered">#A_0804_AMOUNT_CONSTR_2X#</td>
</tr>
<tr>
<td class="bsilver">805. #A_0805_DESCRIPTION_CONSTR_2X# &nbsp;to &nbsp;#A_0805_PAYTO_CONSTR_2X#</td>
<td class="bordered">#A_0805_AMOUNT_CONSTR_2X#</td>
</tr>
<tr>
<td class="bsilver">806. #A_0806_DESCRIPTION_CONSTR_2X# &nbsp;to &nbsp;#A_0806_PAYTO_CONSTR_2X#</td>
<td class="bordered">#A_0806_AMOUNT_CONSTR_2X#</td>
</tr>

<tr>
<td class="bsilver">807. #A_0807_DESCRIPTION_CONSTR_2X# &nbsp;to &nbsp;#A_0807_PAYTO_CONSTR_2X#</td>
<td class="bordered">#A_0807_AMOUNT_CONSTR_2X#</td>
</tr>
<tr>
<td class="bsilver">808. #A_0808_DESCRIPTION_CONSTR_2X#&nbsp;to &nbsp;#A_0808_PAYTO_CONSTR_2X#</td>
<td class="bordered">#A_0808_AMOUNT_CONSTR_2X#</td>
</tr>
<tr>
<td class="bsilver">809. #A_0809_DESCRIPTION_CONSTR_2X#&nbsp;to &nbsp;#A_0809_PAYTO_CONSTR_2X#</td>
<td class="bordered">#A_0809_AMOUNT_CONSTR_2X#</td>
</tr>
<tr>
<td class="bsilver">810. #A_0810_DESCRIPTION_CONSTR_2X#&nbsp;to &nbsp;#A_0810_PAYTO_CONSTR_2X#</td>
<td class="bordered">#A_0810_AMOUNT_CONSTR_2X#</td>
</tr>
<tr>
<td class="bsilver">811. #A_0811_DESCRIPTION_CONSTR_2X#&nbsp;to &nbsp;#A_0811_PAYTO_CONSTR_2X#</td>
<td class="bordered">#A_0811_AMOUNT_CONSTR_2X#</td>
</tr>
<tr>
<td class="bsilver">812. #A_0812_DESCRIPTION_CONSTR_2X#&nbsp;to &nbsp;#A_0812_PAYTO_CONSTR_2X#</td>
<td class="bordered">#A_0812_AMOUNT_CONSTR_2X#</td>
</tr>
</table>
<!-- 1100 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1100. Title Charges</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>
</tr>
<tr>
<td class="bsilver">1101. Total charges in connection with Title not explicitly listed below</td>
<td class="bordered">#A_1101_AMOUNT_CONSTR_2X#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Itemized 1101 Charges</td>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_01_CONSTR_2X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_01_CONSTR_2X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_01_CONSTR_2X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_02_CONSTR_2X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_02_CONSTR_2X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_02_CONSTR_2X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_03_CONSTR_2X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_03_CONSTR_2X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_03_CONSTR_2X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_04_CONSTR_2X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_04_CONSTR_2X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_04_CONSTR_2X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_05_CONSTR_2X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_05_CONSTR_2X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_05_CONSTR_2X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_06_CONSTR_2X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_06_CONSTR_2X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_06_CONSTR_2X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_07_CONSTR_2X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_07_CONSTR_2X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_07_CONSTR_2X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_08_CONSTR_2X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_08_CONSTR_2X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_08_CONSTR_2X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_09_CONSTR_2X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_09_CONSTR_2X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_09_CONSTR_2X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_10_CONSTR_2X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_10_CONSTR_2X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_10_CONSTR_2X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_11_CONSTR_2X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_11_CONSTR_2X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_11_CONSTR_2X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_12_CONSTR_2X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_12_CONSTR_2X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_12_CONSTR_2X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_13_CONSTR_2X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_13_CONSTR_2X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_13_CONSTR_2X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_14_CONSTR_2X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_14_CONSTR_2X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_14_CONSTR_2X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_15_CONSTR_2X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_15_CONSTR_2X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_15_CONSTR_2X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_16_CONSTR_2X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_16_CONSTR_2X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_16_CONSTR_2X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_17_CONSTR_2X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_17_CONSTR_2X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_17_CONSTR_2X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_18_CONSTR_2X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_18_CONSTR_2X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_18_CONSTR_2X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_19_CONSTR_2X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_19_CONSTR_2X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_19_CONSTR_2X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_20_CONSTR_2X#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_20_CONSTR_2X#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_20_CONSTR_2X eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver">1102. #A_1102_DESCRIPTION_CONSTR_2X# &nbsp;to &nbsp;#A_1102_PAYTO_CONSTR_2X#</td>
<td class="bordered">#A_1102_AMOUNT_CONSTR_2X#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1109. #A_1109_DESCRIPTION_CONSTR_2X#&nbsp;to &nbsp;#A_1109_PAYTO_CONSTR_2X#</td>
<td class="bordered">#A_1109_AMOUNT_CONSTR_2X#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1109_OUTSIDE_CONSTR_2X" value="1" onClick="a_1109_outside();" <cfif A_1109_OUTSIDE_CONSTR_2X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1110. #A_1110_DESCRIPTION_CONSTR_2X#&nbsp;to &nbsp;#A_1110_PAYTO_CONSTR_2X#</td>
<td class="bordered">#A_1110_AMOUNT_CONSTR_2X#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1110_OUTSIDE_CONSTR_2X" value="1" onClick="a_1110_outside();" <cfif A_1110_OUTSIDE_CONSTR_2X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1111. #A_1111_DESCRIPTION_CONSTR_2X#&nbsp;to &nbsp;#A_1111_PAYTO_CONSTR_2X#</td>
<td class="bordered">#A_1111_AMOUNT_CONSTR_2X#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1111_OUTSIDE_CONSTR_2X" value="1" onClick="a_1111_outside();" <cfif A_1111_OUTSIDE_CONSTR_2X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1112. #A_1112_DESCRIPTION_CONSTR_2X#&nbsp;to &nbsp;#A_1112_PAYTO_CONSTR_2X#</td>
<td class="bordered">#A_1112_AMOUNT_CONSTR_2X#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1112_OUTSIDE_CONSTR_2X" value="1" onClick="a_1112_outside();" <cfif A_1112_OUTSIDE_CONSTR_2X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1113. #A_1113_DESCRIPTION_CONSTR_2X#&nbsp;to &nbsp;#A_1113_PAYTO_CONSTR_2X#</td>
<td class="bordered">#A_1113_AMOUNT_CONSTR_2X#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1113_OUTSIDE_CONSTR_2X" value="1" onClick="a_1113_outside();" <cfif A_1113_OUTSIDE_CONSTR_2X eq 1>checked</cfif> /></td></tr>
</table>
<!-- 1300 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1300. Additional Settlement Charges (for Non-Title/Settlement Charges)</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>

</tr>
<!--- <tr>
<td class="bsilver">1301. #A_1301_DESCRIPTION_CONSTR_2X#&nbsp;to &nbsp;#A_1301_PAYTO_CONSTR_2X#</td>
<td class="bordered">#A_1301_AMOUNT_CONSTR_2X#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1301_OUTSIDE_CONSTR_2X" value="1" onClick="a_1301_outside();" <cfif A_1301_OUTSIDE_CONSTR_2X eq 1>checked</cfif> /></td></tr>
 ---><tr>
<td class="bsilver">1302. #A_1302_DESCRIPTION_CONSTR_2X#&nbsp;to &nbsp;#A_1302_PAYTO_CONSTR_2X#</td>
<td class="bordered">#A_1302_AMOUNT_CONSTR_2X#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1302_OUTSIDE_CONSTR_2X" value="1" onClick="a_1302_outside();" <cfif A_1302_OUTSIDE_CONSTR_2X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1303. #A_1303_DESCRIPTION_CONSTR_2X#&nbsp;to &nbsp;#A_1303_PAYTO_CONSTR_2X#</td>
<td class="bordered">#A_1303_AMOUNT_CONSTR_2X#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1303_OUTSIDE_CONSTR_2X" value="1" onClick="a_1303_outside();" <cfif A_1303_OUTSIDE_CONSTR_2X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1304. #A_1304_DESCRIPTION_CONSTR_2X#&nbsp;to &nbsp;#A_1304_PAYTO_CONSTR_2X#</td>
<td class="bordered">#A_1304_AMOUNT_CONSTR_2X#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1304_OUTSIDE_CONSTR_2X" value="1" onClick="a_1304_outside();" <cfif A_1304_OUTSIDE_CONSTR_2X eq 1>checked</cfif> /></td></tr>

<tr>
<td class="bsilver">1305. #A_1305_DESCRIPTION_CONSTR_2X#&nbsp;to &nbsp;#A_1305_PAYTO_CONSTR_2X#</td>
<td class="bordered">#A_1305_AMOUNT_CONSTR_2X#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1305_OUTSIDE_CONSTR_2X" value="1" onClick="a_1305_outside();" <cfif A_1305_OUTSIDE_CONSTR_2X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1306. #A_1306_DESCRIPTION_CONSTR_2X#&nbsp;to &nbsp;#A_1306_PAYTO_CONSTR_2X#</td>
<td class="bordered">#A_1306_AMOUNT_CONSTR_2X#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1306_OUTSIDE_CONSTR_2X" value="1" onClick="a_1306_outside();" <cfif A_1306_OUTSIDE_CONSTR_2X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1307. #A_1307_DESCRIPTION_CONSTR_2X#&nbsp;to &nbsp;#A_1307_PAYTO_CONSTR_2X#</td>
<td class="bordered">#A_1307_AMOUNT_CONSTR_2X#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1307_OUTSIDE_CONSTR_2X" value="1" onClick="a_1307_outside();" <cfif A_1307_OUTSIDE_CONSTR_2X eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1308. #A_1308_DESCRIPTION_CONSTR_2X#&nbsp;to &nbsp;#A_1308_PAYTO_CONSTR_2X#</td>

<td class="bordered">#A_1308_AMOUNT_CONSTR_2X#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1308_OUTSIDE_CONSTR_2X" value="1" onClick="a_1308_outside();" <cfif A_1308_OUTSIDE_CONSTR_2X eq 1>checked</cfif> /></td></tr>
</table>
<br>
<br>
<br>
<span class="page_title">PURCHASE - SELLER</span><BR>
<!-- 800 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr><td height="4" colspan="6"></td></tr>
<tr>
<td class="bdarksilver_head">800. Items Payable in Connection with Loan</td>
<td class="bdarksilver_head" align="right">Amount</td>
</tr>
<tr>
<td class="bsilver">801. #A_0801_DESCRIPTION_END_LOAN#</td>
<td class="bordered">#A_0801_AMOUNT_END_LOAN#</td>
</tr>
<tr>
<tr>
<td class="bsilver">802. #A_0802_DESCRIPTION_END_LOAN#</td>
<td class="bordered">#A_0802_AMOUNT_END_LOAN#</td>
</tr>
<tr>
<td class="bsilver">804. #A_0804_DESCRIPTION_END_LOAN# &nbsp;to &nbsp;#A_0804_PAYTO_END_LOAN#</td>
<td class="bordered">#A_0804_AMOUNT_END_LOAN#</td>
</tr>
<tr>
<td class="bsilver">805. #A_0805_DESCRIPTION_END_LOAN# &nbsp;to &nbsp;#A_0805_PAYTO_END_LOAN#</td>
<td class="bordered">#A_0805_AMOUNT_END_LOAN#</td>
</tr>
<tr>
<td class="bsilver">806. #A_0806_DESCRIPTION_END_LOAN# &nbsp;to &nbsp;#A_0806_PAYTO_END_LOAN#</td>
<td class="bordered">#A_0806_AMOUNT_END_LOAN#</td>
</tr>

<tr>
<td class="bsilver">807. #A_0807_DESCRIPTION_END_LOAN# &nbsp;to &nbsp;#A_0807_PAYTO_END_LOAN#</td>
<td class="bordered">#A_0807_AMOUNT_END_LOAN#</td>
</tr>
<tr>
<td class="bsilver">808. #A_0808_DESCRIPTION_END_LOAN#&nbsp;to &nbsp;#A_0808_PAYTO_END_LOAN#</td>
<td class="bordered">#A_0808_AMOUNT_END_LOAN#</td>
</tr>
<tr>
<td class="bsilver">809. #A_0809_DESCRIPTION_END_LOAN#&nbsp;to &nbsp;#A_0809_PAYTO_END_LOAN#</td>
<td class="bordered">#A_0809_AMOUNT_END_LOAN#</td>
</tr>
<tr>
<td class="bsilver">810. #A_0810_DESCRIPTION_END_LOAN#&nbsp;to &nbsp;#A_0810_PAYTO_END_LOAN#</td>
<td class="bordered">#A_0810_AMOUNT_END_LOAN#</td>
</tr>
<tr>
<td class="bsilver">811. #A_0811_DESCRIPTION_END_LOAN#&nbsp;to &nbsp;#A_0811_PAYTO_END_LOAN#</td>
<td class="bordered">#A_0811_AMOUNT_END_LOAN#</td>
</tr>
<tr>
<td class="bsilver">812. #A_0812_DESCRIPTION_END_LOAN#&nbsp;to &nbsp;#A_0812_PAYTO_END_LOAN#</td>
<td class="bordered">#A_0812_AMOUNT_END_LOAN#</td>
</tr>
</table>
<!-- 1100 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1100. Title Charges</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>
</tr>
<tr>
<td class="bsilver">1101. Total charges in connection with Title not explicitly listed below</td>
<td class="bordered">#A_1101_AMOUNT_END_LOAN#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Itemized 1101 Charges</td>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_01_END_LOAN#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_01_END_LOAN#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_01_END_LOAN eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_02_END_LOAN#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_02_END_LOAN#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_02_END_LOAN eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_03_END_LOAN#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_03_END_LOAN#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_03_END_LOAN eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_04_END_LOAN#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_04_END_LOAN#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_04_END_LOAN eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_05_END_LOAN#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_05_END_LOAN#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_05_END_LOAN eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_06_END_LOAN#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_06_END_LOAN#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_06_END_LOAN eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_07_END_LOAN#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_07_END_LOAN#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_07_END_LOAN eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_08_END_LOAN#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_08_END_LOAN#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_08_END_LOAN eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_09_END_LOAN#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_09_END_LOAN#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_09_END_LOAN eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_10_END_LOAN#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_10_END_LOAN#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_10_END_LOAN eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_11_END_LOAN#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_11_END_LOAN#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_11_END_LOAN eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_12_END_LOAN#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_12_END_LOAN#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_12_END_LOAN eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_13_END_LOAN#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_13_END_LOAN#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_13_END_LOAN eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_14_END_LOAN#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_14_END_LOAN#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_14_END_LOAN eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_15_END_LOAN#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_15_END_LOAN#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_15_END_LOAN eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_16_END_LOAN#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_16_END_LOAN#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_16_END_LOAN eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_17_END_LOAN#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_17_END_LOAN#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_17_END_LOAN eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_18_END_LOAN#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_18_END_LOAN#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_18_END_LOAN eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_19_END_LOAN#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_19_END_LOAN#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_19_END_LOAN eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_DESCRIPTION_20_END_LOAN#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#A_1101_ITEM_AMOUNT_20_END_LOAN#&nbsp;&nbsp;&nbsp;<cfif A_1101_ITEM_SELECTABLE_20_END_LOAN eq 1>(selectable)</cfif></td>
</tr>
<tr>
<td class="bsilver">1102. #A_1102_DESCRIPTION_END_LOAN# &nbsp;to &nbsp;#A_1102_PAYTO_END_LOAN#</td>
<td class="bordered">#A_1102_AMOUNT_END_LOAN#</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">1109. #A_1109_DESCRIPTION_END_LOAN#&nbsp;to &nbsp;#A_1109_PAYTO_END_LOAN#</td>
<td class="bordered">#A_1109_AMOUNT_END_LOAN#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1109_OUTSIDE_END_LOAN" value="1" onClick="a_1109_outside();" <cfif A_1109_OUTSIDE_END_LOAN eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1110. #A_1110_DESCRIPTION_END_LOAN#&nbsp;to &nbsp;#A_1110_PAYTO_END_LOAN#</td>
<td class="bordered">#A_1110_AMOUNT_END_LOAN#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1110_OUTSIDE_END_LOAN" value="1" onClick="a_1110_outside();" <cfif A_1110_OUTSIDE_END_LOAN eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1111. #A_1111_DESCRIPTION_END_LOAN#&nbsp;to &nbsp;#A_1111_PAYTO_END_LOAN#</td>
<td class="bordered">#A_1111_AMOUNT_END_LOAN#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1111_OUTSIDE_END_LOAN" value="1" onClick="a_1111_outside();" <cfif A_1111_OUTSIDE_END_LOAN eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1112. #A_1112_DESCRIPTION_END_LOAN#&nbsp;to &nbsp;#A_1112_PAYTO_END_LOAN#</td>
<td class="bordered">#A_1112_AMOUNT_END_LOAN#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1112_OUTSIDE_END_LOAN" value="1" onClick="a_1112_outside();" <cfif A_1112_OUTSIDE_END_LOAN eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1113. #A_1113_DESCRIPTION_END_LOAN#&nbsp;to &nbsp;#A_1113_PAYTO_END_LOAN#</td>
<td class="bordered">#A_1113_AMOUNT_END_LOAN#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1113_OUTSIDE_END_LOAN" value="1" onClick="a_1113_outside();" <cfif A_1113_OUTSIDE_END_LOAN eq 1>checked</cfif> /></td></tr>
</table>
<!-- 1300 -->
<table width="600" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td class="bdarksilver_head">1300. Additional Settlement Charges (for Non-Title/Settlement Charges)</td>
<td class="bdarksilver_head" align="right">Amount</td>
<td class="bdarksilver_head" align="right">Outside</td>

</tr>
<!--- <tr>
<td class="bsilver">1301. #A_1301_DESCRIPTION_END_LOAN#&nbsp;to &nbsp;#A_1301_PAYTO_END_LOAN#</td>
<td class="bordered">#A_1301_AMOUNT_END_LOAN#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1301_OUTSIDE_END_LOAN" value="1" onClick="a_1301_outside();" <cfif A_1301_OUTSIDE_END_LOAN eq 1>checked</cfif> /></td></tr>
 ---><tr>
<td class="bsilver">1302. #A_1302_DESCRIPTION_END_LOAN#&nbsp;to &nbsp;#A_1302_PAYTO_END_LOAN#</td>
<td class="bordered">#A_1302_AMOUNT_END_LOAN#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1302_OUTSIDE_END_LOAN" value="1" onClick="a_1302_outside();" <cfif A_1302_OUTSIDE_END_LOAN eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1303. #A_1303_DESCRIPTION_END_LOAN#&nbsp;to &nbsp;#A_1303_PAYTO_END_LOAN#</td>
<td class="bordered">#A_1303_AMOUNT_END_LOAN#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1303_OUTSIDE_END_LOAN" value="1" onClick="a_1303_outside();" <cfif A_1303_OUTSIDE_END_LOAN eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1304. #A_1304_DESCRIPTION_END_LOAN#&nbsp;to &nbsp;#A_1304_PAYTO_END_LOAN#</td>
<td class="bordered">#A_1304_AMOUNT_END_LOAN#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1304_OUTSIDE_END_LOAN" value="1" onClick="a_1304_outside();" <cfif A_1304_OUTSIDE_END_LOAN eq 1>checked</cfif> /></td></tr>

<tr>
<td class="bsilver">1305. #A_1305_DESCRIPTION_END_LOAN#&nbsp;to &nbsp;#A_1305_PAYTO_END_LOAN#</td>
<td class="bordered">#A_1305_AMOUNT_END_LOAN#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1305_OUTSIDE_END_LOAN" value="1" onClick="a_1305_outside();" <cfif A_1305_OUTSIDE_END_LOAN eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1306. #A_1306_DESCRIPTION_END_LOAN#&nbsp;to &nbsp;#A_1306_PAYTO_END_LOAN#</td>
<td class="bordered">#A_1306_AMOUNT_END_LOAN#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1306_OUTSIDE_END_LOAN" value="1" onClick="a_1306_outside();" <cfif A_1306_OUTSIDE_END_LOAN eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1307. #A_1307_DESCRIPTION_END_LOAN#&nbsp;to &nbsp;#A_1307_PAYTO_END_LOAN#</td>
<td class="bordered">#A_1307_AMOUNT_END_LOAN#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1307_OUTSIDE_END_LOAN" value="1" onClick="a_1307_outside();" <cfif A_1307_OUTSIDE_END_LOAN eq 1>checked</cfif> /></td></tr>
<tr>
<td class="bsilver">1308. #A_1308_DESCRIPTION_END_LOAN#&nbsp;to &nbsp;#A_1308_PAYTO_END_LOAN#</td>

<td class="bordered">#A_1308_AMOUNT_END_LOAN#</td>
<td class="bordered" align="center"><input type="checkbox" class="check" name="A_1308_OUTSIDE_END_LOAN" value="1" onClick="a_1308_outside();" <cfif A_1308_OUTSIDE_END_LOAN eq 1>checked</cfif> /></td></tr>
</table>

</cfoutput>
		</td>
	</tr>




</table>




<table width=498>
<tr>

		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Click <NOBR><a href="https://#CGI.SERVER_NAME#/admin_area/client_line_costs_modify_submit_2010.cfm?uid=59&al=1&company_id=#url.company_id#&billing_id=#billing_id#&a_flag=1&fees=#get_new_id.tempmod_id#">HERE</a></NOBR>
to allow the modification</B>
		</td>
	</tr>
</table>





</cfmail>




<CFELSEIF #a_flag# EQ "3">

		<CFQUERY datasource="#request.dsn#" NAME="read_agency_1">
			SELECT *
			FROM title_FT_Agencies
			WHERE Title_FT_Agency_id = #New_agency_id#
		</CFQUERY>

<CFMAIL
TO="rick@jermain.com"
FROM="webmaster@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="FT Agency info change request"
TIMEOUT="600"
type="HTML"
>

<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

	<tr>
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial>
			<B>A request #read_user.fname#&nbsp;&nbsp;#read_user.lname# to change the FT Agency for the company below</B>
			<p>
		</td>
	</tr>

	<tr>
		<td width=498 align=center valign=top bgcolor=e3e3e3>
			<font size=3 color=green face=arial>
			Client - <B>#read_company.company#</B>
		</td>
	</tr>


</table>

<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>


	<tr>
		<td width=498 align=center valign=top bgcolor=e3e3e3>
			<font size=2 color=black face=arial>
			FT Agency changed to #read_agency_1.company#

		</td>
	</tr>




</table>




<table width=498>
<tr>
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Click <NOBR><a href="https://#CGI.SERVER_NAME#/admin_area/client_line_costs_modify_submit_2010.cfm?uid=59&al=1&company_id=#url.company_id#&billing_id=#billing_id#&New_agency_id=#New_agency_id#&a_flag=3">HERE</a></NOBR>
to allow the modification</B>
		</td>
	</tr>
</table>





</cfmail>



<cfelse>




</cfif>

<cfelse>

<CFIF #a_flag# EQ "1">



<cfif url.billing_id eq 'X'>
<CFSET b_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET b_date = #DateFormat(Now(), "mm/dd/yyyy")#>

<CFQUERY datasource="#request.dsn#" name="create_fee">
Insert into company_billing_values_HUD2010 (b_date, b_time, company_id)
values('#b_date#', '#b_time#', #url.company_id#)
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_new_id">
			SELECT *
			FROM Company_Billing_Values_HUD2010
			WHERE b_time = '#b_time#' AND b_date = '#b_date#' and company_id = #url.company_id#
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" name="create_fee">
Insert into company_billing_values_construction_HUD2010 (billing_id, company_id)
values(#get_new_id.billing_id#, #url.company_id#)
</CFQUERY>
<CFQUERY datasource="#request.dsn#" name="create_fee">
Insert into company_billing_values_b_HUD2010 (billing_id, company_id)
values(#get_new_id.billing_id#, #url.company_id#)
</CFQUERY>
<CFQUERY datasource="#request.dsn#" name="create_fee">
Insert into company_billing_values_construction_b_HUD2010 (billing_id, company_id)
values(#get_new_id.billing_id#, #url.company_id#)
</CFQUERY>
<CFQUERY datasource="#request.dsn#" name="create_fee">
Insert into ITEMIZED_1101_CHARGES (billing_id, company_id)
values(#get_new_id.billing_id#, #url.company_id#)
</CFQUERY>
<CFQUERY datasource="#request.dsn#" name="create_fee">
Insert into ITEMIZED_1101_CHARGES_CONSTRUCTION (billing_id, company_id)
values(#get_new_id.billing_id#, #url.company_id#)
</CFQUERY>
<cfset billing_id = #get_new_id.billing_id#>
</cfif>


<CFQUERY datasource="#request.dsn#" name="update_fees">
UPDATE company_billing_values_HUD2010
SET
A_0801_DESCRIPTION_REFINANCE='#A_0801_DESCRIPTION_REFINANCE#',
A_0801_AMOUNT_REFINANCE='#A_0801_AMOUNT_REFINANCE#',
A_0802_DESCRIPTION_REFINANCE='#A_0802_DESCRIPTION_REFINANCE#',
A_0802_AMOUNT_REFINANCE='#A_0802_AMOUNT_REFINANCE#',
A_0804_DESCRIPTION_REFINANCE='#A_0804_DESCRIPTION_REFINANCE#',
A_0804_PAYTO_REFINANCE='#A_0804_PAYTO_REFINANCE#',
A_0804_AMOUNT_REFINANCE='#A_0804_AMOUNT_REFINANCE#',
A_0805_DESCRIPTION_REFINANCE='#A_0805_DESCRIPTION_REFINANCE#',
A_0805_PAYTO_REFINANCE='#A_0805_PAYTO_REFINANCE#',
A_0805_AMOUNT_REFINANCE='#A_0805_AMOUNT_REFINANCE#',
A_0806_DESCRIPTION_REFINANCE='#A_0806_DESCRIPTION_REFINANCE#',
A_0806_PAYTO_REFINANCE='#A_0806_PAYTO_REFINANCE#',
A_0806_AMOUNT_REFINANCE='#A_0806_AMOUNT_REFINANCE#',
A_0807_DESCRIPTION_REFINANCE='#A_0807_DESCRIPTION_REFINANCE#',
A_0807_PAYTO_REFINANCE='#A_0807_PAYTO_REFINANCE#',
A_0807_AMOUNT_REFINANCE='#A_0807_AMOUNT_REFINANCE#',
A_0808_DESCRIPTION_REFINANCE='#A_0808_DESCRIPTION_REFINANCE#',
A_0808_PAYTO_REFINANCE='#A_0808_PAYTO_REFINANCE#',
A_0808_AMOUNT_REFINANCE='#A_0808_AMOUNT_REFINANCE#',
A_0809_DESCRIPTION_REFINANCE='#A_0809_DESCRIPTION_REFINANCE#',
A_0809_PAYTO_REFINANCE='#A_0809_PAYTO_REFINANCE#',
A_0809_AMOUNT_REFINANCE='#A_0809_AMOUNT_REFINANCE#',
A_0810_DESCRIPTION_REFINANCE='#A_0810_DESCRIPTION_REFINANCE#',
A_0810_PAYTO_REFINANCE='#A_0810_PAYTO_REFINANCE#',
A_0810_AMOUNT_REFINANCE='#A_0810_AMOUNT_REFINANCE#',
A_0811_DESCRIPTION_REFINANCE='#A_0811_DESCRIPTION_REFINANCE#',
A_0811_PAYTO_REFINANCE='#A_0811_PAYTO_REFINANCE#',
A_0811_AMOUNT_REFINANCE='#A_0811_AMOUNT_REFINANCE#',
A_0812_DESCRIPTION_REFINANCE='#A_0812_DESCRIPTION_REFINANCE#',
A_0812_PAYTO_REFINANCE='#A_0812_PAYTO_REFINANCE#',
A_0812_AMOUNT_REFINANCE='#A_0812_AMOUNT_REFINANCE#',
A_1101_AMOUNT_REFINANCE='#A_1101_AMOUNT_REFINANCE#',
A_1102_DESCRIPTION_REFINANCE='#A_1102_DESCRIPTION_REFINANCE#',
A_1102_PAYTO_REFINANCE='#A_1102_PAYTO_REFINANCE#',
A_1102_AMOUNT_REFINANCE='#A_1102_AMOUNT_REFINANCE#',
A_1109_DESCRIPTION_REFINANCE='#A_1109_DESCRIPTION_REFINANCE#',
A_1109_PAYTO_REFINANCE='#A_1109_PAYTO_REFINANCE#',
A_1109_AMOUNT_REFINANCE='#A_1109_AMOUNT_REFINANCE#',
A_1109_OUTSIDE_REFINANCE='#A_1109_OUTSIDE_REFINANCE#',
A_1110_DESCRIPTION_REFINANCE='#A_1110_DESCRIPTION_REFINANCE#',
A_1110_PAYTO_REFINANCE='#A_1110_PAYTO_REFINANCE#',
A_1110_AMOUNT_REFINANCE='#A_1110_AMOUNT_REFINANCE#',
A_1110_OUTSIDE_REFINANCE='#A_1110_OUTSIDE_REFINANCE#',
A_1111_DESCRIPTION_REFINANCE='#A_1111_DESCRIPTION_REFINANCE#',
A_1111_PAYTO_REFINANCE='#A_1111_PAYTO_REFINANCE#',
A_1111_AMOUNT_REFINANCE='#A_1111_AMOUNT_REFINANCE#',
A_1111_OUTSIDE_REFINANCE='#A_1111_OUTSIDE_REFINANCE#',
A_1112_DESCRIPTION_REFINANCE='#A_1112_DESCRIPTION_REFINANCE#',
A_1112_PAYTO_REFINANCE='#A_1112_PAYTO_REFINANCE#',
A_1112_AMOUNT_REFINANCE='#A_1112_AMOUNT_REFINANCE#',
A_1112_OUTSIDE_REFINANCE='#A_1112_OUTSIDE_REFINANCE#',
A_1113_DESCRIPTION_REFINANCE='#A_1113_DESCRIPTION_REFINANCE#',
A_1113_PAYTO_REFINANCE='#A_1113_PAYTO_REFINANCE#',
A_1113_AMOUNT_REFINANCE='#A_1113_AMOUNT_REFINANCE#',
A_1113_OUTSIDE_REFINANCE='#A_1113_OUTSIDE_REFINANCE#',
A_0801_DESCRIPTION_PURCHASE='#A_0801_DESCRIPTION_PURCHASE#',
A_0801_AMOUNT_PURCHASE='#A_0801_AMOUNT_PURCHASE#',
A_0802_DESCRIPTION_PURCHASE='#A_0802_DESCRIPTION_PURCHASE#',
A_0802_AMOUNT_PURCHASE='#A_0802_AMOUNT_PURCHASE#',
A_0804_DESCRIPTION_PURCHASE='#A_0804_DESCRIPTION_PURCHASE#',
A_0804_PAYTO_PURCHASE='#A_0804_PAYTO_PURCHASE#',
A_0804_AMOUNT_PURCHASE='#A_0804_AMOUNT_PURCHASE#',
A_0805_DESCRIPTION_PURCHASE='#A_0805_DESCRIPTION_PURCHASE#',
A_0805_PAYTO_PURCHASE='#A_0805_PAYTO_PURCHASE#',
A_0805_AMOUNT_PURCHASE='#A_0805_AMOUNT_PURCHASE#',
A_0806_DESCRIPTION_PURCHASE='#A_0806_DESCRIPTION_PURCHASE#',
A_0806_PAYTO_PURCHASE='#A_0806_PAYTO_PURCHASE#',
A_0806_AMOUNT_PURCHASE='#A_0806_AMOUNT_PURCHASE#',
A_0807_DESCRIPTION_PURCHASE='#A_0807_DESCRIPTION_PURCHASE#',
A_0807_PAYTO_PURCHASE='#A_0807_PAYTO_PURCHASE#',
A_0807_AMOUNT_PURCHASE='#A_0807_AMOUNT_PURCHASE#',
A_0808_DESCRIPTION_PURCHASE='#A_0808_DESCRIPTION_PURCHASE#',
A_0808_PAYTO_PURCHASE='#A_0808_PAYTO_PURCHASE#',
A_0808_AMOUNT_PURCHASE='#A_0808_AMOUNT_PURCHASE#',
A_0809_DESCRIPTION_PURCHASE='#A_0809_DESCRIPTION_PURCHASE#',
A_0809_PAYTO_PURCHASE='#A_0809_PAYTO_PURCHASE#',
A_0809_AMOUNT_PURCHASE='#A_0809_AMOUNT_PURCHASE#',
A_0810_DESCRIPTION_PURCHASE='#A_0810_DESCRIPTION_PURCHASE#',
A_0810_PAYTO_PURCHASE='#A_0810_PAYTO_PURCHASE#',
A_0810_AMOUNT_PURCHASE='#A_0810_AMOUNT_PURCHASE#',
A_0811_DESCRIPTION_PURCHASE='#A_0811_DESCRIPTION_PURCHASE#',
A_0811_PAYTO_PURCHASE='#A_0811_PAYTO_PURCHASE#',
A_0811_AMOUNT_PURCHASE='#A_0811_AMOUNT_PURCHASE#',
A_0812_DESCRIPTION_PURCHASE='#A_0812_DESCRIPTION_PURCHASE#',
A_0812_PAYTO_PURCHASE='#A_0812_PAYTO_PURCHASE#',
A_0812_AMOUNT_PURCHASE='#A_0812_AMOUNT_PURCHASE#',
A_1101_AMOUNT_PURCHASE='#A_1101_AMOUNT_PURCHASE#',
A_1102_DESCRIPTION_PURCHASE='#A_1102_DESCRIPTION_PURCHASE#',
A_1102_PAYTO_PURCHASE='#A_1102_PAYTO_PURCHASE#',
A_1102_AMOUNT_PURCHASE='#A_1102_AMOUNT_PURCHASE#',
A_1109_DESCRIPTION_PURCHASE='#A_1109_DESCRIPTION_PURCHASE#',
A_1109_PAYTO_PURCHASE='#A_1109_PAYTO_PURCHASE#',
A_1109_AMOUNT_PURCHASE='#A_1109_AMOUNT_PURCHASE#',
A_1109_OUTSIDE_PURCHASE='#A_1109_OUTSIDE_PURCHASE#',
A_1110_DESCRIPTION_PURCHASE='#A_1110_DESCRIPTION_PURCHASE#',
A_1110_PAYTO_PURCHASE='#A_1110_PAYTO_PURCHASE#',
A_1110_AMOUNT_PURCHASE='#A_1110_AMOUNT_PURCHASE#',
A_1110_OUTSIDE_PURCHASE='#A_1110_OUTSIDE_PURCHASE#',
A_1111_DESCRIPTION_PURCHASE='#A_1111_DESCRIPTION_PURCHASE#',
A_1111_PAYTO_PURCHASE='#A_1111_PAYTO_PURCHASE#',
A_1111_AMOUNT_PURCHASE='#A_1111_AMOUNT_PURCHASE#',
A_1111_OUTSIDE_PURCHASE='#A_1111_OUTSIDE_PURCHASE#',
A_1112_DESCRIPTION_PURCHASE='#A_1112_DESCRIPTION_PURCHASE#',
A_1112_PAYTO_PURCHASE='#A_1112_PAYTO_PURCHASE#',
A_1112_AMOUNT_PURCHASE='#A_1112_AMOUNT_PURCHASE#',
A_1112_OUTSIDE_PURCHASE='#A_1112_OUTSIDE_PURCHASE#',
A_1113_DESCRIPTION_PURCHASE='#A_1113_DESCRIPTION_PURCHASE#',
A_1113_PAYTO_PURCHASE='#A_1113_PAYTO_PURCHASE#',
A_1113_AMOUNT_PURCHASE='#A_1113_AMOUNT_PURCHASE#',
A_1113_OUTSIDE_PURCHASE='#A_1113_OUTSIDE_PURCHASE#',
A_0801_DESCRIPTION_2ND_NO_TI='#A_0801_DESCRIPTION_2ND_NO_TI#',
A_0801_AMOUNT_2ND_NO_TI='#A_0801_AMOUNT_2ND_NO_TI#',
A_0802_DESCRIPTION_2ND_NO_TI='#A_0802_DESCRIPTION_2ND_NO_TI#',
A_0802_AMOUNT_2ND_NO_TI='#A_0802_AMOUNT_2ND_NO_TI#',
A_0804_DESCRIPTION_2ND_NO_TI='#A_0804_DESCRIPTION_2ND_NO_TI#',
A_0804_PAYTO_2ND_NO_TI='#A_0804_PAYTO_2ND_NO_TI#',
A_0804_AMOUNT_2ND_NO_TI='#A_0804_AMOUNT_2ND_NO_TI#',
A_0805_DESCRIPTION_2ND_NO_TI='#A_0805_DESCRIPTION_2ND_NO_TI#',
A_0805_PAYTO_2ND_NO_TI='#A_0805_PAYTO_2ND_NO_TI#',
A_0805_AMOUNT_2ND_NO_TI='#A_0805_AMOUNT_2ND_NO_TI#',
A_0806_DESCRIPTION_2ND_NO_TI='#A_0806_DESCRIPTION_2ND_NO_TI#',
A_0806_PAYTO_2ND_NO_TI='#A_0806_PAYTO_2ND_NO_TI#',
A_0806_AMOUNT_2ND_NO_TI='#A_0806_AMOUNT_2ND_NO_TI#',
A_0807_DESCRIPTION_2ND_NO_TI='#A_0807_DESCRIPTION_2ND_NO_TI#',
A_0807_PAYTO_2ND_NO_TI='#A_0807_PAYTO_2ND_NO_TI#',
A_0807_AMOUNT_2ND_NO_TI='#A_0807_AMOUNT_2ND_NO_TI#',
A_0808_DESCRIPTION_2ND_NO_TI='#A_0808_DESCRIPTION_2ND_NO_TI#',
A_0808_PAYTO_2ND_NO_TI='#A_0808_PAYTO_2ND_NO_TI#',
A_0808_AMOUNT_2ND_NO_TI='#A_0808_AMOUNT_2ND_NO_TI#',
A_0809_DESCRIPTION_2ND_NO_TI='#A_0809_DESCRIPTION_2ND_NO_TI#',
A_0809_PAYTO_2ND_NO_TI='#A_0809_PAYTO_2ND_NO_TI#',
A_0809_AMOUNT_2ND_NO_TI='#A_0809_AMOUNT_2ND_NO_TI#',
A_0810_DESCRIPTION_2ND_NO_TI='#A_0810_DESCRIPTION_2ND_NO_TI#',
A_0810_PAYTO_2ND_NO_TI='#A_0810_PAYTO_2ND_NO_TI#',
A_0810_AMOUNT_2ND_NO_TI='#A_0810_AMOUNT_2ND_NO_TI#',
A_0811_DESCRIPTION_2ND_NO_TI='#A_0811_DESCRIPTION_2ND_NO_TI#',
A_0811_PAYTO_2ND_NO_TI='#A_0811_PAYTO_2ND_NO_TI#',
A_0811_AMOUNT_2ND_NO_TI='#A_0811_AMOUNT_2ND_NO_TI#',
A_0812_DESCRIPTION_2ND_NO_TI='#A_0812_DESCRIPTION_2ND_NO_TI#',
A_0812_PAYTO_2ND_NO_TI='#A_0812_PAYTO_2ND_NO_TI#',
A_0812_AMOUNT_2ND_NO_TI='#A_0812_AMOUNT_2ND_NO_TI#',
A_1101_AMOUNT_2ND_NO_TI='#A_1101_AMOUNT_2ND_NO_TI#',
A_1102_DESCRIPTION_2ND_NO_TI='#A_1102_DESCRIPTION_2ND_NO_TI#',
A_1102_PAYTO_2ND_NO_TI='#A_1102_PAYTO_2ND_NO_TI#',
A_1102_AMOUNT_2ND_NO_TI='#A_1102_AMOUNT_2ND_NO_TI#',
A_1109_DESCRIPTION_2ND_NO_TI='#A_1109_DESCRIPTION_2ND_NO_TI#',
A_1109_PAYTO_2ND_NO_TI='#A_1109_PAYTO_2ND_NO_TI#',
A_1109_AMOUNT_2ND_NO_TI='#A_1109_AMOUNT_2ND_NO_TI#',
A_1109_OUTSIDE_2ND_NO_TI='#A_1109_OUTSIDE_2ND_NO_TI#',
A_1110_DESCRIPTION_2ND_NO_TI='#A_1110_DESCRIPTION_2ND_NO_TI#',
A_1110_PAYTO_2ND_NO_TI='#A_1110_PAYTO_2ND_NO_TI#',
A_1110_AMOUNT_2ND_NO_TI='#A_1110_AMOUNT_2ND_NO_TI#',
A_1110_OUTSIDE_2ND_NO_TI='#A_1110_OUTSIDE_2ND_NO_TI#',
A_1111_DESCRIPTION_2ND_NO_TI='#A_1111_DESCRIPTION_2ND_NO_TI#',
A_1111_PAYTO_2ND_NO_TI='#A_1111_PAYTO_2ND_NO_TI#',
A_1111_AMOUNT_2ND_NO_TI='#A_1111_AMOUNT_2ND_NO_TI#',
A_1111_OUTSIDE_2ND_NO_TI='#A_1111_OUTSIDE_2ND_NO_TI#',
A_1112_DESCRIPTION_2ND_NO_TI='#A_1112_DESCRIPTION_2ND_NO_TI#',
A_1112_PAYTO_2ND_NO_TI='#A_1112_PAYTO_2ND_NO_TI#',
A_1112_AMOUNT_2ND_NO_TI='#A_1112_AMOUNT_2ND_NO_TI#',
A_1112_OUTSIDE_2ND_NO_TI='#A_1112_OUTSIDE_2ND_NO_TI#',
A_1113_DESCRIPTION_2ND_NO_TI='#A_1113_DESCRIPTION_2ND_NO_TI#',
A_1113_PAYTO_2ND_NO_TI='#A_1113_PAYTO_2ND_NO_TI#',
A_1113_AMOUNT_2ND_NO_TI='#A_1113_AMOUNT_2ND_NO_TI#',
A_1113_OUTSIDE_2ND_NO_TI='#A_1113_OUTSIDE_2ND_NO_TI#',
A_0801_DESCRIPTION_2ND_WITH_TI='#A_0801_DESCRIPTION_2ND_WITH_TI#',
A_0801_AMOUNT_2ND_WITH_TI='#A_0801_AMOUNT_2ND_WITH_TI#',
A_0802_DESCRIPTION_2ND_WITH_TI='#A_0802_DESCRIPTION_2ND_WITH_TI#',
A_0802_AMOUNT_2ND_WITH_TI='#A_0802_AMOUNT_2ND_WITH_TI#',
A_0804_DESCRIPTION_2ND_WITH_TI='#A_0804_DESCRIPTION_2ND_WITH_TI#',
A_0804_PAYTO_2ND_WITH_TI='#A_0804_PAYTO_2ND_WITH_TI#',
A_0804_AMOUNT_2ND_WITH_TI='#A_0804_AMOUNT_2ND_WITH_TI#',
A_0805_DESCRIPTION_2ND_WITH_TI='#A_0805_DESCRIPTION_2ND_WITH_TI#',
A_0805_PAYTO_2ND_WITH_TI='#A_0805_PAYTO_2ND_WITH_TI#',
A_0805_AMOUNT_2ND_WITH_TI='#A_0805_AMOUNT_2ND_WITH_TI#',
A_0806_DESCRIPTION_2ND_WITH_TI='#A_0806_DESCRIPTION_2ND_WITH_TI#',
A_0806_PAYTO_2ND_WITH_TI='#A_0806_PAYTO_2ND_WITH_TI#',
A_0806_AMOUNT_2ND_WITH_TI='#A_0806_AMOUNT_2ND_WITH_TI#',
A_0807_DESCRIPTION_2ND_WITH_TI='#A_0807_DESCRIPTION_2ND_WITH_TI#',
A_0807_PAYTO_2ND_WITH_TI='#A_0807_PAYTO_2ND_WITH_TI#',
A_0807_AMOUNT_2ND_WITH_TI='#A_0807_AMOUNT_2ND_WITH_TI#',
A_0808_DESCRIPTION_2ND_WITH_TI='#A_0808_DESCRIPTION_2ND_WITH_TI#',
A_0808_PAYTO_2ND_WITH_TI='#A_0808_PAYTO_2ND_WITH_TI#',
A_0808_AMOUNT_2ND_WITH_TI='#A_0808_AMOUNT_2ND_WITH_TI#',
A_0809_DESCRIPTION_2ND_WITH_TI='#A_0809_DESCRIPTION_2ND_WITH_TI#',
A_0809_PAYTO_2ND_WITH_TI='#A_0809_PAYTO_2ND_WITH_TI#',
A_0809_AMOUNT_2ND_WITH_TI='#A_0809_AMOUNT_2ND_WITH_TI#',
A_0810_DESCRIPTION_2ND_WITH_TI='#A_0810_DESCRIPTION_2ND_WITH_TI#',
A_0810_PAYTO_2ND_WITH_TI='#A_0810_PAYTO_2ND_WITH_TI#',
A_0810_AMOUNT_2ND_WITH_TI='#A_0810_AMOUNT_2ND_WITH_TI#',
A_0811_DESCRIPTION_2ND_WITH_TI='#A_0811_DESCRIPTION_2ND_WITH_TI#',
A_0811_PAYTO_2ND_WITH_TI='#A_0811_PAYTO_2ND_WITH_TI#',
A_0811_AMOUNT_2ND_WITH_TI='#A_0811_AMOUNT_2ND_WITH_TI#',
A_0812_DESCRIPTION_2ND_WITH_TI='#A_0812_DESCRIPTION_2ND_WITH_TI#',
A_0812_PAYTO_2ND_WITH_TI='#A_0812_PAYTO_2ND_WITH_TI#',
A_0812_AMOUNT_2ND_WITH_TI='#A_0812_AMOUNT_2ND_WITH_TI#',
A_1101_AMOUNT_2ND_WITH_TI='#A_1101_AMOUNT_2ND_WITH_TI#',
A_1102_DESCRIPTION_2ND_WITH_TI='#A_1102_DESCRIPTION_2ND_WITH_TI#',
A_1102_PAYTO_2ND_WITH_TI='#A_1102_PAYTO_2ND_WITH_TI#',
A_1102_AMOUNT_2ND_WITH_TI='#A_1102_AMOUNT_2ND_WITH_TI#',
A_1109_DESCRIPTION_2ND_WITH_TI='#A_1109_DESCRIPTION_2ND_WITH_TI#',
A_1109_PAYTO_2ND_WITH_TI='#A_1109_PAYTO_2ND_WITH_TI#',
A_1109_AMOUNT_2ND_WITH_TI='#A_1109_AMOUNT_2ND_WITH_TI#',
A_1109_OUTSIDE_2ND_WITH_TI='#A_1109_OUTSIDE_2ND_WITH_TI#',
A_1110_DESCRIPTION_2ND_WITH_TI='#A_1110_DESCRIPTION_2ND_WITH_TI#',
A_1110_PAYTO_2ND_WITH_TI='#A_1110_PAYTO_2ND_WITH_TI#',
A_1110_AMOUNT_2ND_WITH_TI='#A_1110_AMOUNT_2ND_WITH_TI#',
A_1110_OUTSIDE_2ND_WITH_TI='#A_1110_OUTSIDE_2ND_WITH_TI#',
A_1111_DESCRIPTION_2ND_WITH_TI='#A_1111_DESCRIPTION_2ND_WITH_TI#',
A_1111_PAYTO_2ND_WITH_TI='#A_1111_PAYTO_2ND_WITH_TI#',
A_1111_AMOUNT_2ND_WITH_TI='#A_1111_AMOUNT_2ND_WITH_TI#',
A_1111_OUTSIDE_2ND_WITH_TI='#A_1111_OUTSIDE_2ND_WITH_TI#',
A_1112_DESCRIPTION_2ND_WITH_TI='#A_1112_DESCRIPTION_2ND_WITH_TI#',
A_1112_PAYTO_2ND_WITH_TI='#A_1112_PAYTO_2ND_WITH_TI#',
A_1112_AMOUNT_2ND_WITH_TI='#A_1112_AMOUNT_2ND_WITH_TI#',
A_1112_OUTSIDE_2ND_WITH_TI='#A_1112_OUTSIDE_2ND_WITH_TI#',
A_1113_DESCRIPTION_2ND_WITH_TI='#A_1113_DESCRIPTION_2ND_WITH_TI#',
A_1113_PAYTO_2ND_WITH_TI='#A_1113_PAYTO_2ND_WITH_TI#',
A_1113_AMOUNT_2ND_WITH_TI='#A_1113_AMOUNT_2ND_WITH_TI#',
A_1113_OUTSIDE_2ND_WITH_TI='#A_1113_OUTSIDE_2ND_WITH_TI#',
A_0801_DESCRIPTION_PURCHASE_SELLER='#A_0801_DESCRIPTION_PURCHASE_SELLER#',
A_0801_AMOUNT_PURCHASE_SELLER='#A_0801_AMOUNT_PURCHASE_SELLER#',
A_0802_DESCRIPTION_PURCHASE_SELLER='#A_0802_DESCRIPTION_PURCHASE_SELLER#',
A_0802_AMOUNT_PURCHASE_SELLER='#A_0802_AMOUNT_PURCHASE_SELLER#',
A_0804_DESCRIPTION_PURCHASE_SELLER='#A_0804_DESCRIPTION_PURCHASE_SELLER#',
A_0804_PAYTO_PURCHASE_SELLER='#A_0804_PAYTO_PURCHASE_SELLER#',
A_0804_AMOUNT_PURCHASE_SELLER='#A_0804_AMOUNT_PURCHASE_SELLER#',
A_0805_DESCRIPTION_PURCHASE_SELLER='#A_0805_DESCRIPTION_PURCHASE_SELLER#',
A_0805_PAYTO_PURCHASE_SELLER='#A_0805_PAYTO_PURCHASE_SELLER#',
A_0805_AMOUNT_PURCHASE_SELLER='#A_0805_AMOUNT_PURCHASE_SELLER#',
A_0806_DESCRIPTION_PURCHASE_SELLER='#A_0806_DESCRIPTION_PURCHASE_SELLER#',
A_0806_PAYTO_PURCHASE_SELLER='#A_0806_PAYTO_PURCHASE_SELLER#',
A_0806_AMOUNT_PURCHASE_SELLER='#A_0806_AMOUNT_PURCHASE_SELLER#',
A_0807_DESCRIPTION_PURCHASE_SELLER='#A_0807_DESCRIPTION_PURCHASE_SELLER#',
A_0807_PAYTO_PURCHASE_SELLER='#A_0807_PAYTO_PURCHASE_SELLER#',
A_0807_AMOUNT_PURCHASE_SELLER='#A_0807_AMOUNT_PURCHASE_SELLER#',
A_0808_DESCRIPTION_PURCHASE_SELLER='#A_0808_DESCRIPTION_PURCHASE_SELLER#',
A_0808_PAYTO_PURCHASE_SELLER='#A_0808_PAYTO_PURCHASE_SELLER#',
A_0808_AMOUNT_PURCHASE_SELLER='#A_0808_AMOUNT_PURCHASE_SELLER#',
A_0809_DESCRIPTION_PURCHASE_SELLER='#A_0809_DESCRIPTION_PURCHASE_SELLER#',
A_0809_PAYTO_PURCHASE_SELLER='#A_0809_PAYTO_PURCHASE_SELLER#',
A_0809_AMOUNT_PURCHASE_SELLER='#A_0809_AMOUNT_PURCHASE_SELLER#',
A_0810_DESCRIPTION_PURCHASE_SELLER='#A_0810_DESCRIPTION_PURCHASE_SELLER#',
A_0810_PAYTO_PURCHASE_SELLER='#A_0810_PAYTO_PURCHASE_SELLER#',
A_0810_AMOUNT_PURCHASE_SELLER='#A_0810_AMOUNT_PURCHASE_SELLER#',
A_0811_DESCRIPTION_PURCHASE_SELLER='#A_0811_DESCRIPTION_PURCHASE_SELLER#',
A_0811_PAYTO_PURCHASE_SELLER='#A_0811_PAYTO_PURCHASE_SELLER#',
A_0811_AMOUNT_PURCHASE_SELLER='#A_0811_AMOUNT_PURCHASE_SELLER#',
A_0812_DESCRIPTION_PURCHASE_SELLER='#A_0812_DESCRIPTION_PURCHASE_SELLER#',
A_0812_PAYTO_PURCHASE_SELLER='#A_0812_PAYTO_PURCHASE_SELLER#',
A_0812_AMOUNT_PURCHASE_SELLER='#A_0812_AMOUNT_PURCHASE_SELLER#',
A_1101_AMOUNT_PURCHASE_SELLER='#A_1101_AMOUNT_PURCHASE_SELLER#',
A_1102_DESCRIPTION_PURCHASE_SELLER='#A_1102_DESCRIPTION_PURCHASE_SELLER#',
A_1102_PAYTO_PURCHASE_SELLER='#A_1102_PAYTO_PURCHASE_SELLER#',
A_1102_AMOUNT_PURCHASE_SELLER='#A_1102_AMOUNT_PURCHASE_SELLER#',
A_1109_DESCRIPTION_PURCHASE_SELLER='#A_1109_DESCRIPTION_PURCHASE_SELLER#',
A_1109_PAYTO_PURCHASE_SELLER='#A_1109_PAYTO_PURCHASE_SELLER#',
A_1109_AMOUNT_PURCHASE_SELLER='#A_1109_AMOUNT_PURCHASE_SELLER#',
A_1109_OUTSIDE_PURCHASE_SELLER='#A_1109_OUTSIDE_PURCHASE_SELLER#',
A_1110_DESCRIPTION_PURCHASE_SELLER='#A_1110_DESCRIPTION_PURCHASE_SELLER#',
A_1110_PAYTO_PURCHASE_SELLER='#A_1110_PAYTO_PURCHASE_SELLER#',
A_1110_AMOUNT_PURCHASE_SELLER='#A_1110_AMOUNT_PURCHASE_SELLER#',
A_1110_OUTSIDE_PURCHASE_SELLER='#A_1110_OUTSIDE_PURCHASE_SELLER#',
A_1111_DESCRIPTION_PURCHASE_SELLER='#A_1111_DESCRIPTION_PURCHASE_SELLER#',
A_1111_PAYTO_PURCHASE_SELLER='#A_1111_PAYTO_PURCHASE_SELLER#',
A_1111_AMOUNT_PURCHASE_SELLER='#A_1111_AMOUNT_PURCHASE_SELLER#',
A_1111_OUTSIDE_PURCHASE_SELLER='#A_1111_OUTSIDE_PURCHASE_SELLER#',
A_1112_DESCRIPTION_PURCHASE_SELLER='#A_1112_DESCRIPTION_PURCHASE_SELLER#',
A_1112_PAYTO_PURCHASE_SELLER='#A_1112_PAYTO_PURCHASE_SELLER#',
A_1112_AMOUNT_PURCHASE_SELLER='#A_1112_AMOUNT_PURCHASE_SELLER#',
A_1112_OUTSIDE_PURCHASE_SELLER='#A_1112_OUTSIDE_PURCHASE_SELLER#',
A_1113_DESCRIPTION_PURCHASE_SELLER='#A_1113_DESCRIPTION_PURCHASE_SELLER#',
A_1113_PAYTO_PURCHASE_SELLER='#A_1113_PAYTO_PURCHASE_SELLER#',
A_1113_AMOUNT_PURCHASE_SELLER='#A_1113_AMOUNT_PURCHASE_SELLER#',
A_1113_OUTSIDE_PURCHASE_SELLER='#A_1113_OUTSIDE_PURCHASE_SELLER#'
WHERE billing_id = #billing_id# AND company_id = #url.company_id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" name="check_for_table">
select billing_id from company_billing_values_construction_HUD2010
WHERE billing_id = #billing_id# AND company_id = #url.company_id#
</CFQUERY>
<cfif check_for_table.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" name="insert">
insert into company_billing_values_construction_HUD2010 (billing_id, company_id)
values(#billing_id#, #url.company_id#)
</CFQUERY>
</cfif>



<CFQUERY datasource="#request.dsn#" name="update_fees">
UPDATE company_billing_values_construction_HUD2010
SET
A_0801_DESCRIPTION_CONSTR_1X='#A_0801_DESCRIPTION_CONSTR_1X#',
A_0801_AMOUNT_CONSTR_1X='#A_0801_AMOUNT_CONSTR_1X#',
A_0802_DESCRIPTION_CONSTR_1X='#A_0802_DESCRIPTION_CONSTR_1X#',
A_0802_AMOUNT_CONSTR_1X='#A_0802_AMOUNT_CONSTR_1X#',
A_0804_DESCRIPTION_CONSTR_1X='#A_0804_DESCRIPTION_CONSTR_1X#',
A_0804_PAYTO_CONSTR_1X='#A_0804_PAYTO_CONSTR_1X#',
A_0804_AMOUNT_CONSTR_1X='#A_0804_AMOUNT_CONSTR_1X#',
A_0805_DESCRIPTION_CONSTR_1X='#A_0805_DESCRIPTION_CONSTR_1X#',
A_0805_PAYTO_CONSTR_1X='#A_0805_PAYTO_CONSTR_1X#',
A_0805_AMOUNT_CONSTR_1X='#A_0805_AMOUNT_CONSTR_1X#',
A_0806_DESCRIPTION_CONSTR_1X='#A_0806_DESCRIPTION_CONSTR_1X#',
A_0806_PAYTO_CONSTR_1X='#A_0806_PAYTO_CONSTR_1X#',
A_0806_AMOUNT_CONSTR_1X='#A_0806_AMOUNT_CONSTR_1X#',
A_0807_DESCRIPTION_CONSTR_1X='#A_0807_DESCRIPTION_CONSTR_1X#',
A_0807_PAYTO_CONSTR_1X='#A_0807_PAYTO_CONSTR_1X#',
A_0807_AMOUNT_CONSTR_1X='#A_0807_AMOUNT_CONSTR_1X#',
A_0808_DESCRIPTION_CONSTR_1X='#A_0808_DESCRIPTION_CONSTR_1X#',
A_0808_PAYTO_CONSTR_1X='#A_0808_PAYTO_CONSTR_1X#',
A_0808_AMOUNT_CONSTR_1X='#A_0808_AMOUNT_CONSTR_1X#',
A_0809_DESCRIPTION_CONSTR_1X='#A_0809_DESCRIPTION_CONSTR_1X#',
A_0809_PAYTO_CONSTR_1X='#A_0809_PAYTO_CONSTR_1X#',
A_0809_AMOUNT_CONSTR_1X='#A_0809_AMOUNT_CONSTR_1X#',
A_0810_DESCRIPTION_CONSTR_1X='#A_0810_DESCRIPTION_CONSTR_1X#',
A_0810_PAYTO_CONSTR_1X='#A_0810_PAYTO_CONSTR_1X#',
A_0810_AMOUNT_CONSTR_1X='#A_0810_AMOUNT_CONSTR_1X#',
A_0811_DESCRIPTION_CONSTR_1X='#A_0811_DESCRIPTION_CONSTR_1X#',
A_0811_PAYTO_CONSTR_1X='#A_0811_PAYTO_CONSTR_1X#',
A_0811_AMOUNT_CONSTR_1X='#A_0811_AMOUNT_CONSTR_1X#',
A_0812_DESCRIPTION_CONSTR_1X='#A_0812_DESCRIPTION_CONSTR_1X#',
A_0812_PAYTO_CONSTR_1X='#A_0812_PAYTO_CONSTR_1X#',
A_0812_AMOUNT_CONSTR_1X='#A_0812_AMOUNT_CONSTR_1X#',
A_1101_AMOUNT_CONSTR_1X='#A_1101_AMOUNT_CONSTR_1X#',
A_1102_DESCRIPTION_CONSTR_1X='#A_1102_DESCRIPTION_CONSTR_1X#',
A_1102_PAYTO_CONSTR_1X='#A_1102_PAYTO_CONSTR_1X#',
A_1102_AMOUNT_CONSTR_1X='#A_1102_AMOUNT_CONSTR_1X#',
A_1109_DESCRIPTION_CONSTR_1X='#A_1109_DESCRIPTION_CONSTR_1X#',
A_1109_PAYTO_CONSTR_1X='#A_1109_PAYTO_CONSTR_1X#',
A_1109_AMOUNT_CONSTR_1X='#A_1109_AMOUNT_CONSTR_1X#',
A_1109_OUTSIDE_CONSTR_1X='#A_1109_OUTSIDE_CONSTR_1X#',
A_1110_DESCRIPTION_CONSTR_1X='#A_1110_DESCRIPTION_CONSTR_1X#',
A_1110_PAYTO_CONSTR_1X='#A_1110_PAYTO_CONSTR_1X#',
A_1110_AMOUNT_CONSTR_1X='#A_1110_AMOUNT_CONSTR_1X#',
A_1110_OUTSIDE_CONSTR_1X='#A_1110_OUTSIDE_CONSTR_1X#',
A_1111_DESCRIPTION_CONSTR_1X='#A_1111_DESCRIPTION_CONSTR_1X#',
A_1111_PAYTO_CONSTR_1X='#A_1111_PAYTO_CONSTR_1X#',
A_1111_AMOUNT_CONSTR_1X='#A_1111_AMOUNT_CONSTR_1X#',
A_1111_OUTSIDE_CONSTR_1X='#A_1111_OUTSIDE_CONSTR_1X#',
A_1112_DESCRIPTION_CONSTR_1X='#A_1112_DESCRIPTION_CONSTR_1X#',
A_1112_PAYTO_CONSTR_1X='#A_1112_PAYTO_CONSTR_1X#',
A_1112_AMOUNT_CONSTR_1X='#A_1112_AMOUNT_CONSTR_1X#',
A_1112_OUTSIDE_CONSTR_1X='#A_1112_OUTSIDE_CONSTR_1X#',
A_1113_DESCRIPTION_CONSTR_1X='#A_1113_DESCRIPTION_CONSTR_1X#',
A_1113_PAYTO_CONSTR_1X='#A_1113_PAYTO_CONSTR_1X#',
A_1113_AMOUNT_CONSTR_1X='#A_1113_AMOUNT_CONSTR_1X#',
A_1113_OUTSIDE_CONSTR_1X='#A_1113_OUTSIDE_CONSTR_1X#',
A_0801_DESCRIPTION_CONSTR_2X='#A_0801_DESCRIPTION_CONSTR_2X#',
A_0801_AMOUNT_CONSTR_2X='#A_0801_AMOUNT_CONSTR_2X#',
A_0802_DESCRIPTION_CONSTR_2X='#A_0802_DESCRIPTION_CONSTR_2X#',
A_0802_AMOUNT_CONSTR_2X='#A_0802_AMOUNT_CONSTR_2X#',
A_0804_DESCRIPTION_CONSTR_2X='#A_0804_DESCRIPTION_CONSTR_2X#',
A_0804_PAYTO_CONSTR_2X='#A_0804_PAYTO_CONSTR_2X#',
A_0804_AMOUNT_CONSTR_2X='#A_0804_AMOUNT_CONSTR_2X#',
A_0805_DESCRIPTION_CONSTR_2X='#A_0805_DESCRIPTION_CONSTR_2X#',
A_0805_PAYTO_CONSTR_2X='#A_0805_PAYTO_CONSTR_2X#',
A_0805_AMOUNT_CONSTR_2X='#A_0805_AMOUNT_CONSTR_2X#',
A_0806_DESCRIPTION_CONSTR_2X='#A_0806_DESCRIPTION_CONSTR_2X#',
A_0806_PAYTO_CONSTR_2X='#A_0806_PAYTO_CONSTR_2X#',
A_0806_AMOUNT_CONSTR_2X='#A_0806_AMOUNT_CONSTR_2X#',
A_0807_DESCRIPTION_CONSTR_2X='#A_0807_DESCRIPTION_CONSTR_2X#',
A_0807_PAYTO_CONSTR_2X='#A_0807_PAYTO_CONSTR_2X#',
A_0807_AMOUNT_CONSTR_2X='#A_0807_AMOUNT_CONSTR_2X#',
A_0808_DESCRIPTION_CONSTR_2X='#A_0808_DESCRIPTION_CONSTR_2X#',
A_0808_PAYTO_CONSTR_2X='#A_0808_PAYTO_CONSTR_2X#',
A_0808_AMOUNT_CONSTR_2X='#A_0808_AMOUNT_CONSTR_2X#',
A_0809_DESCRIPTION_CONSTR_2X='#A_0809_DESCRIPTION_CONSTR_2X#',
A_0809_PAYTO_CONSTR_2X='#A_0809_PAYTO_CONSTR_2X#',
A_0809_AMOUNT_CONSTR_2X='#A_0809_AMOUNT_CONSTR_2X#',
A_0810_DESCRIPTION_CONSTR_2X='#A_0810_DESCRIPTION_CONSTR_2X#',
A_0810_PAYTO_CONSTR_2X='#A_0810_PAYTO_CONSTR_2X#',
A_0810_AMOUNT_CONSTR_2X='#A_0810_AMOUNT_CONSTR_2X#',
A_0811_DESCRIPTION_CONSTR_2X='#A_0811_DESCRIPTION_CONSTR_2X#',
A_0811_PAYTO_CONSTR_2X='#A_0811_PAYTO_CONSTR_2X#',
A_0811_AMOUNT_CONSTR_2X='#A_0811_AMOUNT_CONSTR_2X#',
A_0812_DESCRIPTION_CONSTR_2X='#A_0812_DESCRIPTION_CONSTR_2X#',
A_0812_PAYTO_CONSTR_2X='#A_0812_PAYTO_CONSTR_2X#',
A_0812_AMOUNT_CONSTR_2X='#A_0812_AMOUNT_CONSTR_2X#',
A_1101_AMOUNT_CONSTR_2X='#A_1101_AMOUNT_CONSTR_2X#',
A_1102_DESCRIPTION_CONSTR_2X='#A_1102_DESCRIPTION_CONSTR_2X#',
A_1102_PAYTO_CONSTR_2X='#A_1102_PAYTO_CONSTR_2X#',
A_1102_AMOUNT_CONSTR_2X='#A_1102_AMOUNT_CONSTR_2X#',
A_1109_DESCRIPTION_CONSTR_2X='#A_1109_DESCRIPTION_CONSTR_2X#',
A_1109_PAYTO_CONSTR_2X='#A_1109_PAYTO_CONSTR_2X#',
A_1109_AMOUNT_CONSTR_2X='#A_1109_AMOUNT_CONSTR_2X#',
A_1109_OUTSIDE_CONSTR_2X='#A_1109_OUTSIDE_CONSTR_2X#',
A_1110_DESCRIPTION_CONSTR_2X='#A_1110_DESCRIPTION_CONSTR_2X#',
A_1110_PAYTO_CONSTR_2X='#A_1110_PAYTO_CONSTR_2X#',
A_1110_AMOUNT_CONSTR_2X='#A_1110_AMOUNT_CONSTR_2X#',
A_1110_OUTSIDE_CONSTR_2X='#A_1110_OUTSIDE_CONSTR_2X#',
A_1111_DESCRIPTION_CONSTR_2X='#A_1111_DESCRIPTION_CONSTR_2X#',
A_1111_PAYTO_CONSTR_2X='#A_1111_PAYTO_CONSTR_2X#',
A_1111_AMOUNT_CONSTR_2X='#A_1111_AMOUNT_CONSTR_2X#',
A_1111_OUTSIDE_CONSTR_2X='#A_1111_OUTSIDE_CONSTR_2X#',
A_1112_DESCRIPTION_CONSTR_2X='#A_1112_DESCRIPTION_CONSTR_2X#',
A_1112_PAYTO_CONSTR_2X='#A_1112_PAYTO_CONSTR_2X#',
A_1112_AMOUNT_CONSTR_2X='#A_1112_AMOUNT_CONSTR_2X#',
A_1112_OUTSIDE_CONSTR_2X='#A_1112_OUTSIDE_CONSTR_2X#',
A_1113_DESCRIPTION_CONSTR_2X='#A_1113_DESCRIPTION_CONSTR_2X#',
A_1113_PAYTO_CONSTR_2X='#A_1113_PAYTO_CONSTR_2X#',
A_1113_AMOUNT_CONSTR_2X='#A_1113_AMOUNT_CONSTR_2X#',
A_1113_OUTSIDE_CONSTR_2X='#A_1113_OUTSIDE_CONSTR_2X#',
A_0801_DESCRIPTION_END_LOAN='#A_0801_DESCRIPTION_END_LOAN#',
A_0801_AMOUNT_END_LOAN='#A_0801_AMOUNT_END_LOAN#',
A_0802_DESCRIPTION_END_LOAN='#A_0802_DESCRIPTION_END_LOAN#',
A_0802_AMOUNT_END_LOAN='#A_0802_AMOUNT_END_LOAN#',
A_0804_DESCRIPTION_END_LOAN='#A_0804_DESCRIPTION_END_LOAN#',
A_0804_PAYTO_END_LOAN='#A_0804_PAYTO_END_LOAN#',
A_0804_AMOUNT_END_LOAN='#A_0804_AMOUNT_END_LOAN#',
A_0805_DESCRIPTION_END_LOAN='#A_0805_DESCRIPTION_END_LOAN#',
A_0805_PAYTO_END_LOAN='#A_0805_PAYTO_END_LOAN#',
A_0805_AMOUNT_END_LOAN='#A_0805_AMOUNT_END_LOAN#',
A_0806_DESCRIPTION_END_LOAN='#A_0806_DESCRIPTION_END_LOAN#',
A_0806_PAYTO_END_LOAN='#A_0806_PAYTO_END_LOAN#',
A_0806_AMOUNT_END_LOAN='#A_0806_AMOUNT_END_LOAN#',
A_0807_DESCRIPTION_END_LOAN='#A_0807_DESCRIPTION_END_LOAN#',
A_0807_PAYTO_END_LOAN='#A_0807_PAYTO_END_LOAN#',
A_0807_AMOUNT_END_LOAN='#A_0807_AMOUNT_END_LOAN#',
A_0808_DESCRIPTION_END_LOAN='#A_0808_DESCRIPTION_END_LOAN#',
A_0808_PAYTO_END_LOAN='#A_0808_PAYTO_END_LOAN#',
A_0808_AMOUNT_END_LOAN='#A_0808_AMOUNT_END_LOAN#',
A_0809_DESCRIPTION_END_LOAN='#A_0809_DESCRIPTION_END_LOAN#',
A_0809_PAYTO_END_LOAN='#A_0809_PAYTO_END_LOAN#',
A_0809_AMOUNT_END_LOAN='#A_0809_AMOUNT_END_LOAN#',
A_0810_DESCRIPTION_END_LOAN='#A_0810_DESCRIPTION_END_LOAN#',
A_0810_PAYTO_END_LOAN='#A_0810_PAYTO_END_LOAN#',
A_0810_AMOUNT_END_LOAN='#A_0810_AMOUNT_END_LOAN#',
A_0811_DESCRIPTION_END_LOAN='#A_0811_DESCRIPTION_END_LOAN#',
A_0811_PAYTO_END_LOAN='#A_0811_PAYTO_END_LOAN#',
A_0811_AMOUNT_END_LOAN='#A_0811_AMOUNT_END_LOAN#',
A_0812_DESCRIPTION_END_LOAN='#A_0812_DESCRIPTION_END_LOAN#',
A_0812_PAYTO_END_LOAN='#A_0812_PAYTO_END_LOAN#',
A_0812_AMOUNT_END_LOAN='#A_0812_AMOUNT_END_LOAN#',
A_1101_AMOUNT_END_LOAN='#A_1101_AMOUNT_END_LOAN#',
A_1102_DESCRIPTION_END_LOAN='#A_1102_DESCRIPTION_END_LOAN#',
A_1102_PAYTO_END_LOAN='#A_1102_PAYTO_END_LOAN#',
A_1102_AMOUNT_END_LOAN='#A_1102_AMOUNT_END_LOAN#',
A_1109_DESCRIPTION_END_LOAN='#A_1109_DESCRIPTION_END_LOAN#',
A_1109_PAYTO_END_LOAN='#A_1109_PAYTO_END_LOAN#',
A_1109_AMOUNT_END_LOAN='#A_1109_AMOUNT_END_LOAN#',
A_1109_OUTSIDE_END_LOAN='#A_1109_OUTSIDE_END_LOAN#',
A_1110_DESCRIPTION_END_LOAN='#A_1110_DESCRIPTION_END_LOAN#',
A_1110_PAYTO_END_LOAN='#A_1110_PAYTO_END_LOAN#',
A_1110_AMOUNT_END_LOAN='#A_1110_AMOUNT_END_LOAN#',
A_1110_OUTSIDE_END_LOAN='#A_1110_OUTSIDE_END_LOAN#',
A_1111_DESCRIPTION_END_LOAN='#A_1111_DESCRIPTION_END_LOAN#',
A_1111_PAYTO_END_LOAN='#A_1111_PAYTO_END_LOAN#',
A_1111_AMOUNT_END_LOAN='#A_1111_AMOUNT_END_LOAN#',
A_1111_OUTSIDE_END_LOAN='#A_1111_OUTSIDE_END_LOAN#',
A_1112_DESCRIPTION_END_LOAN='#A_1112_DESCRIPTION_END_LOAN#',
A_1112_PAYTO_END_LOAN='#A_1112_PAYTO_END_LOAN#',
A_1112_AMOUNT_END_LOAN='#A_1112_AMOUNT_END_LOAN#',
A_1112_OUTSIDE_END_LOAN='#A_1112_OUTSIDE_END_LOAN#',
A_1113_DESCRIPTION_END_LOAN='#A_1113_DESCRIPTION_END_LOAN#',
A_1113_PAYTO_END_LOAN='#A_1113_PAYTO_END_LOAN#',
A_1113_AMOUNT_END_LOAN='#A_1113_AMOUNT_END_LOAN#',
A_1113_OUTSIDE_END_LOAN='#A_1113_OUTSIDE_END_LOAN#'
WHERE billing_id = #billing_id# AND company_id = #url.company_id#
</CFQUERY>


<CFQUERY datasource="#request.dsn#" name="update_fees_b">
UPDATE company_billing_values_b_HUD2010
SET
A_1302_DESCRIPTION_REFINANCE='#A_1302_DESCRIPTION_REFINANCE#',
A_1302_PAYTO_REFINANCE='#A_1302_PAYTO_REFINANCE#',
A_1302_AMOUNT_REFINANCE='#A_1302_AMOUNT_REFINANCE#',
A_1302_OUTSIDE_REFINANCE='#A_1302_OUTSIDE_REFINANCE#',
A_1303_DESCRIPTION_REFINANCE='#A_1303_DESCRIPTION_REFINANCE#',
A_1303_PAYTO_REFINANCE='#A_1303_PAYTO_REFINANCE#',
A_1303_AMOUNT_REFINANCE='#A_1303_AMOUNT_REFINANCE#',
A_1303_OUTSIDE_REFINANCE='#A_1303_OUTSIDE_REFINANCE#',
A_1304_DESCRIPTION_REFINANCE='#A_1304_DESCRIPTION_REFINANCE#',
A_1304_PAYTO_REFINANCE='#A_1304_PAYTO_REFINANCE#',
A_1304_AMOUNT_REFINANCE='#A_1304_AMOUNT_REFINANCE#',
A_1304_OUTSIDE_REFINANCE='#A_1304_OUTSIDE_REFINANCE#',
A_1305_DESCRIPTION_REFINANCE='#A_1305_DESCRIPTION_REFINANCE#',
A_1305_PAYTO_REFINANCE='#A_1305_PAYTO_REFINANCE#',
A_1305_AMOUNT_REFINANCE='#A_1305_AMOUNT_REFINANCE#',
A_1305_OUTSIDE_REFINANCE='#A_1305_OUTSIDE_REFINANCE#',
A_1306_DESCRIPTION_REFINANCE='#A_1306_DESCRIPTION_REFINANCE#',
A_1306_PAYTO_REFINANCE='#A_1306_PAYTO_REFINANCE#',
A_1306_AMOUNT_REFINANCE='#A_1306_AMOUNT_REFINANCE#',
A_1306_OUTSIDE_REFINANCE='#A_1306_OUTSIDE_REFINANCE#',
A_1307_DESCRIPTION_REFINANCE='#A_1307_DESCRIPTION_REFINANCE#',
A_1307_PAYTO_REFINANCE='#A_1307_PAYTO_REFINANCE#',
A_1307_AMOUNT_REFINANCE='#A_1307_AMOUNT_REFINANCE#',
A_1307_OUTSIDE_REFINANCE='#A_1307_OUTSIDE_REFINANCE#',
A_1308_DESCRIPTION_REFINANCE='#A_1308_DESCRIPTION_REFINANCE#',
A_1308_PAYTO_REFINANCE='#A_1308_PAYTO_REFINANCE#',
A_1308_AMOUNT_REFINANCE='#A_1308_AMOUNT_REFINANCE#',
A_1308_OUTSIDE_REFINANCE='#A_1308_OUTSIDE_REFINANCE#',
A_1302_DESCRIPTION_PURCHASE='#A_1302_DESCRIPTION_PURCHASE#',
A_1302_PAYTO_PURCHASE='#A_1302_PAYTO_PURCHASE#',
A_1302_AMOUNT_PURCHASE='#A_1302_AMOUNT_PURCHASE#',
A_1302_OUTSIDE_PURCHASE='#A_1302_OUTSIDE_PURCHASE#',
A_1303_DESCRIPTION_PURCHASE='#A_1303_DESCRIPTION_PURCHASE#',
A_1303_PAYTO_PURCHASE='#A_1303_PAYTO_PURCHASE#',
A_1303_AMOUNT_PURCHASE='#A_1303_AMOUNT_PURCHASE#',
A_1303_OUTSIDE_PURCHASE='#A_1303_OUTSIDE_PURCHASE#',
A_1304_DESCRIPTION_PURCHASE='#A_1304_DESCRIPTION_PURCHASE#',
A_1304_PAYTO_PURCHASE='#A_1304_PAYTO_PURCHASE#',
A_1304_AMOUNT_PURCHASE='#A_1304_AMOUNT_PURCHASE#',
A_1304_OUTSIDE_PURCHASE='#A_1304_OUTSIDE_PURCHASE#',
A_1305_DESCRIPTION_PURCHASE='#A_1305_DESCRIPTION_PURCHASE#',
A_1305_PAYTO_PURCHASE='#A_1305_PAYTO_PURCHASE#',
A_1305_AMOUNT_PURCHASE='#A_1305_AMOUNT_PURCHASE#',
A_1305_OUTSIDE_PURCHASE='#A_1305_OUTSIDE_PURCHASE#',
A_1306_DESCRIPTION_PURCHASE='#A_1306_DESCRIPTION_PURCHASE#',
A_1306_PAYTO_PURCHASE='#A_1306_PAYTO_PURCHASE#',
A_1306_AMOUNT_PURCHASE='#A_1306_AMOUNT_PURCHASE#',
A_1306_OUTSIDE_PURCHASE='#A_1306_OUTSIDE_PURCHASE#',
A_1307_DESCRIPTION_PURCHASE='#A_1307_DESCRIPTION_PURCHASE#',
A_1307_PAYTO_PURCHASE='#A_1307_PAYTO_PURCHASE#',
A_1307_AMOUNT_PURCHASE='#A_1307_AMOUNT_PURCHASE#',
A_1307_OUTSIDE_PURCHASE='#A_1307_OUTSIDE_PURCHASE#',
A_1308_DESCRIPTION_PURCHASE='#A_1308_DESCRIPTION_PURCHASE#',
A_1308_PAYTO_PURCHASE='#A_1308_PAYTO_PURCHASE#',
A_1308_AMOUNT_PURCHASE='#A_1308_AMOUNT_PURCHASE#',
A_1308_OUTSIDE_PURCHASE='#A_1308_OUTSIDE_PURCHASE#',
A_1302_DESCRIPTION_2ND_NO_TI='#A_1302_DESCRIPTION_2ND_NO_TI#',
A_1302_PAYTO_2ND_NO_TI='#A_1302_PAYTO_2ND_NO_TI#',
A_1302_AMOUNT_2ND_NO_TI='#A_1302_AMOUNT_2ND_NO_TI#',
A_1302_OUTSIDE_2ND_NO_TI='#A_1302_OUTSIDE_2ND_NO_TI#',
A_1303_DESCRIPTION_2ND_NO_TI='#A_1303_DESCRIPTION_2ND_NO_TI#',
A_1303_PAYTO_2ND_NO_TI='#A_1303_PAYTO_2ND_NO_TI#',
A_1303_AMOUNT_2ND_NO_TI='#A_1303_AMOUNT_2ND_NO_TI#',
A_1303_OUTSIDE_2ND_NO_TI='#A_1303_OUTSIDE_2ND_NO_TI#',
A_1304_DESCRIPTION_2ND_NO_TI='#A_1304_DESCRIPTION_2ND_NO_TI#',
A_1304_PAYTO_2ND_NO_TI='#A_1304_PAYTO_2ND_NO_TI#',
A_1304_AMOUNT_2ND_NO_TI='#A_1304_AMOUNT_2ND_NO_TI#',
A_1304_OUTSIDE_2ND_NO_TI='#A_1304_OUTSIDE_2ND_NO_TI#',
A_1305_DESCRIPTION_2ND_NO_TI='#A_1305_DESCRIPTION_2ND_NO_TI#',
A_1305_PAYTO_2ND_NO_TI='#A_1305_PAYTO_2ND_NO_TI#',
A_1305_AMOUNT_2ND_NO_TI='#A_1305_AMOUNT_2ND_NO_TI#',
A_1305_OUTSIDE_2ND_NO_TI='#A_1305_OUTSIDE_2ND_NO_TI#',
A_1306_DESCRIPTION_2ND_NO_TI='#A_1306_DESCRIPTION_2ND_NO_TI#',
A_1306_PAYTO_2ND_NO_TI='#A_1306_PAYTO_2ND_NO_TI#',
A_1306_AMOUNT_2ND_NO_TI='#A_1306_AMOUNT_2ND_NO_TI#',
A_1306_OUTSIDE_2ND_NO_TI='#A_1306_OUTSIDE_2ND_NO_TI#',
A_1307_DESCRIPTION_2ND_NO_TI='#A_1307_DESCRIPTION_2ND_NO_TI#',
A_1307_PAYTO_2ND_NO_TI='#A_1307_PAYTO_2ND_NO_TI#',
A_1307_AMOUNT_2ND_NO_TI='#A_1307_AMOUNT_2ND_NO_TI#',
A_1307_OUTSIDE_2ND_NO_TI='#A_1307_OUTSIDE_2ND_NO_TI#',
A_1308_DESCRIPTION_2ND_NO_TI='#A_1308_DESCRIPTION_2ND_NO_TI#',
A_1308_PAYTO_2ND_NO_TI='#A_1308_PAYTO_2ND_NO_TI#',
A_1308_AMOUNT_2ND_NO_TI='#A_1308_AMOUNT_2ND_NO_TI#',
A_1308_OUTSIDE_2ND_NO_TI='#A_1308_OUTSIDE_2ND_NO_TI#',
A_1302_DESCRIPTION_2ND_WITH_TI='#A_1302_DESCRIPTION_2ND_WITH_TI#',
A_1302_PAYTO_2ND_WITH_TI='#A_1302_PAYTO_2ND_WITH_TI#',
A_1302_AMOUNT_2ND_WITH_TI='#A_1302_AMOUNT_2ND_WITH_TI#',
A_1302_OUTSIDE_2ND_WITH_TI='#A_1302_OUTSIDE_2ND_WITH_TI#',
A_1303_DESCRIPTION_2ND_WITH_TI='#A_1303_DESCRIPTION_2ND_WITH_TI#',
A_1303_PAYTO_2ND_WITH_TI='#A_1303_PAYTO_2ND_WITH_TI#',
A_1303_AMOUNT_2ND_WITH_TI='#A_1303_AMOUNT_2ND_WITH_TI#',
A_1303_OUTSIDE_2ND_WITH_TI='#A_1303_OUTSIDE_2ND_WITH_TI#',
A_1304_DESCRIPTION_2ND_WITH_TI='#A_1304_DESCRIPTION_2ND_WITH_TI#',
A_1304_PAYTO_2ND_WITH_TI='#A_1304_PAYTO_2ND_WITH_TI#',
A_1304_AMOUNT_2ND_WITH_TI='#A_1304_AMOUNT_2ND_WITH_TI#',
A_1304_OUTSIDE_2ND_WITH_TI='#A_1304_OUTSIDE_2ND_WITH_TI#',
A_1305_DESCRIPTION_2ND_WITH_TI='#A_1305_DESCRIPTION_2ND_WITH_TI#',
A_1305_PAYTO_2ND_WITH_TI='#A_1305_PAYTO_2ND_WITH_TI#',
A_1305_AMOUNT_2ND_WITH_TI='#A_1305_AMOUNT_2ND_WITH_TI#',
A_1305_OUTSIDE_2ND_WITH_TI='#A_1305_OUTSIDE_2ND_WITH_TI#',
A_1306_DESCRIPTION_2ND_WITH_TI='#A_1306_DESCRIPTION_2ND_WITH_TI#',
A_1306_PAYTO_2ND_WITH_TI='#A_1306_PAYTO_2ND_WITH_TI#',
A_1306_AMOUNT_2ND_WITH_TI='#A_1306_AMOUNT_2ND_WITH_TI#',
A_1306_OUTSIDE_2ND_WITH_TI='#A_1306_OUTSIDE_2ND_WITH_TI#',
A_1307_DESCRIPTION_2ND_WITH_TI='#A_1307_DESCRIPTION_2ND_WITH_TI#',
A_1307_PAYTO_2ND_WITH_TI='#A_1307_PAYTO_2ND_WITH_TI#',
A_1307_AMOUNT_2ND_WITH_TI='#A_1307_AMOUNT_2ND_WITH_TI#',
A_1307_OUTSIDE_2ND_WITH_TI='#A_1307_OUTSIDE_2ND_WITH_TI#',
A_1308_DESCRIPTION_2ND_WITH_TI='#A_1308_DESCRIPTION_2ND_WITH_TI#',
A_1308_PAYTO_2ND_WITH_TI='#A_1308_PAYTO_2ND_WITH_TI#',
A_1308_AMOUNT_2ND_WITH_TI='#A_1308_AMOUNT_2ND_WITH_TI#',
A_1308_OUTSIDE_2ND_WITH_TI='#A_1308_OUTSIDE_2ND_WITH_TI#',
A_1302_DESCRIPTION_PURCHASE_SELLER='#A_1302_DESCRIPTION_PURCHASE_SELLER#',
A_1302_PAYTO_PURCHASE_SELLER='#A_1302_PAYTO_PURCHASE_SELLER#',
A_1302_AMOUNT_PURCHASE_SELLER='#A_1302_AMOUNT_PURCHASE_SELLER#',
A_1302_OUTSIDE_PURCHASE_SELLER='#A_1302_OUTSIDE_PURCHASE_SELLER#',
A_1303_DESCRIPTION_PURCHASE_SELLER='#A_1303_DESCRIPTION_PURCHASE_SELLER#',
A_1303_PAYTO_PURCHASE_SELLER='#A_1303_PAYTO_PURCHASE_SELLER#',
A_1303_AMOUNT_PURCHASE_SELLER='#A_1303_AMOUNT_PURCHASE_SELLER#',
A_1303_OUTSIDE_PURCHASE_SELLER='#A_1303_OUTSIDE_PURCHASE_SELLER#',
A_1304_DESCRIPTION_PURCHASE_SELLER='#A_1304_DESCRIPTION_PURCHASE_SELLER#',
A_1304_PAYTO_PURCHASE_SELLER='#A_1304_PAYTO_PURCHASE_SELLER#',
A_1304_AMOUNT_PURCHASE_SELLER='#A_1304_AMOUNT_PURCHASE_SELLER#',
A_1304_OUTSIDE_PURCHASE_SELLER='#A_1304_OUTSIDE_PURCHASE_SELLER#',
A_1305_DESCRIPTION_PURCHASE_SELLER='#A_1305_DESCRIPTION_PURCHASE_SELLER#',
A_1305_PAYTO_PURCHASE_SELLER='#A_1305_PAYTO_PURCHASE_SELLER#',
A_1305_AMOUNT_PURCHASE_SELLER='#A_1305_AMOUNT_PURCHASE_SELLER#',
A_1305_OUTSIDE_PURCHASE_SELLER='#A_1305_OUTSIDE_PURCHASE_SELLER#',
A_1306_DESCRIPTION_PURCHASE_SELLER='#A_1306_DESCRIPTION_PURCHASE_SELLER#',
A_1306_PAYTO_PURCHASE_SELLER='#A_1306_PAYTO_PURCHASE_SELLER#',
A_1306_AMOUNT_PURCHASE_SELLER='#A_1306_AMOUNT_PURCHASE_SELLER#',
A_1306_OUTSIDE_PURCHASE_SELLER='#A_1306_OUTSIDE_PURCHASE_SELLER#',
A_1307_DESCRIPTION_PURCHASE_SELLER='#A_1307_DESCRIPTION_PURCHASE_SELLER#',
A_1307_PAYTO_PURCHASE_SELLER='#A_1307_PAYTO_PURCHASE_SELLER#',
A_1307_AMOUNT_PURCHASE_SELLER='#A_1307_AMOUNT_PURCHASE_SELLER#',
A_1307_OUTSIDE_PURCHASE_SELLER='#A_1307_OUTSIDE_PURCHASE_SELLER#',
A_1308_DESCRIPTION_PURCHASE_SELLER='#A_1308_DESCRIPTION_PURCHASE_SELLER#',
A_1308_PAYTO_PURCHASE_SELLER='#A_1308_PAYTO_PURCHASE_SELLER#',
A_1308_AMOUNT_PURCHASE_SELLER='#A_1308_AMOUNT_PURCHASE_SELLER#',
A_1308_OUTSIDE_PURCHASE_SELLER='#A_1308_OUTSIDE_PURCHASE_SELLER#',
A_1102A_DESCRIPTION_REFINANCE='#A_1102A_DESCRIPTION_REFINANCE#',
A_1102A_PAYTO_REFINANCE='#A_1102A_PAYTO_REFINANCE#',
A_1102A_AMOUNT_REFINANCE='#A_1102A_AMOUNT_REFINANCE#',
A_1102B_DESCRIPTION_REFINANCE='#A_1102B_DESCRIPTION_REFINANCE#',
A_1102B_PAYTO_REFINANCE='#A_1102B_PAYTO_REFINANCE#',
A_1102B_AMOUNT_REFINANCE='#A_1102B_AMOUNT_REFINANCE#',
A_1102C_DESCRIPTION_REFINANCE='#A_1102C_DESCRIPTION_REFINANCE#',
A_1102C_PAYTO_REFINANCE='#A_1102C_PAYTO_REFINANCE#',
A_1102C_AMOUNT_REFINANCE='#A_1102C_AMOUNT_REFINANCE#',
A_1102D_DESCRIPTION_REFINANCE='#A_1102D_DESCRIPTION_REFINANCE#',
A_1102D_PAYTO_REFINANCE='#A_1102D_PAYTO_REFINANCE#',
A_1102D_AMOUNT_REFINANCE='#A_1102D_AMOUNT_REFINANCE#',
A_1102E_DESCRIPTION_REFINANCE='#A_1102E_DESCRIPTION_REFINANCE#',
A_1102E_PAYTO_REFINANCE='#A_1102E_PAYTO_REFINANCE#',
A_1102E_AMOUNT_REFINANCE='#A_1102E_AMOUNT_REFINANCE#',
A_1102F_DESCRIPTION_REFINANCE='#A_1102F_DESCRIPTION_REFINANCE#',
A_1102F_PAYTO_REFINANCE='#A_1102F_PAYTO_REFINANCE#',
A_1102F_AMOUNT_REFINANCE='#A_1102F_AMOUNT_REFINANCE#',
A_1102G_DESCRIPTION_REFINANCE='#A_1102G_DESCRIPTION_REFINANCE#',
A_1102G_PAYTO_REFINANCE='#A_1102G_PAYTO_REFINANCE#',
A_1102G_AMOUNT_REFINANCE='#A_1102G_AMOUNT_REFINANCE#',
A_1102H_DESCRIPTION_REFINANCE='#A_1102H_DESCRIPTION_REFINANCE#',
A_1102H_PAYTO_REFINANCE='#A_1102H_PAYTO_REFINANCE#',
A_1102H_AMOUNT_REFINANCE='#A_1102H_AMOUNT_REFINANCE#',
A_1102I_DESCRIPTION_REFINANCE='#A_1102I_DESCRIPTION_REFINANCE#',
A_1102I_PAYTO_REFINANCE='#A_1102I_PAYTO_REFINANCE#',
A_1102I_AMOUNT_REFINANCE='#A_1102I_AMOUNT_REFINANCE#',
A_1102A_DESCRIPTION_PURCHASE='#A_1102A_DESCRIPTION_PURCHASE#',
A_1102A_PAYTO_PURCHASE='#A_1102A_PAYTO_PURCHASE#',
A_1102A_AMOUNT_PURCHASE='#A_1102A_AMOUNT_PURCHASE#',
A_1102B_DESCRIPTION_PURCHASE='#A_1102B_DESCRIPTION_PURCHASE#',
A_1102B_PAYTO_PURCHASE='#A_1102B_PAYTO_PURCHASE#',
A_1102B_AMOUNT_PURCHASE='#A_1102B_AMOUNT_PURCHASE#',
A_1102C_DESCRIPTION_PURCHASE='#A_1102C_DESCRIPTION_PURCHASE#',
A_1102C_PAYTO_PURCHASE='#A_1102C_PAYTO_PURCHASE#',
A_1102C_AMOUNT_PURCHASE='#A_1102C_AMOUNT_PURCHASE#',
A_1102D_DESCRIPTION_PURCHASE='#A_1102D_DESCRIPTION_PURCHASE#',
A_1102D_PAYTO_PURCHASE='#A_1102D_PAYTO_PURCHASE#',
A_1102D_AMOUNT_PURCHASE='#A_1102D_AMOUNT_PURCHASE#',
A_1102E_DESCRIPTION_PURCHASE='#A_1102E_DESCRIPTION_PURCHASE#',
A_1102E_PAYTO_PURCHASE='#A_1102E_PAYTO_PURCHASE#',
A_1102E_AMOUNT_PURCHASE='#A_1102E_AMOUNT_PURCHASE#',
A_1102F_DESCRIPTION_PURCHASE='#A_1102F_DESCRIPTION_PURCHASE#',
A_1102F_PAYTO_PURCHASE='#A_1102F_PAYTO_PURCHASE#',
A_1102F_AMOUNT_PURCHASE='#A_1102F_AMOUNT_PURCHASE#',
A_1102G_DESCRIPTION_PURCHASE='#A_1102G_DESCRIPTION_PURCHASE#',
A_1102G_PAYTO_PURCHASE='#A_1102G_PAYTO_PURCHASE#',
A_1102G_AMOUNT_PURCHASE='#A_1102G_AMOUNT_PURCHASE#',
A_1102H_DESCRIPTION_PURCHASE='#A_1102H_DESCRIPTION_PURCHASE#',
A_1102H_PAYTO_PURCHASE='#A_1102H_PAYTO_PURCHASE#',
A_1102H_AMOUNT_PURCHASE='#A_1102H_AMOUNT_PURCHASE#',
A_1102I_DESCRIPTION_PURCHASE='#A_1102I_DESCRIPTION_PURCHASE#',
A_1102I_PAYTO_PURCHASE='#A_1102I_PAYTO_PURCHASE#',
A_1102I_AMOUNT_PURCHASE='#A_1102I_AMOUNT_PURCHASE#',
A_1102A_DESCRIPTION_2ND_WITH_TI='#A_1102A_DESCRIPTION_2ND_WITH_TI#',
A_1102A_PAYTO_2ND_WITH_TI='#A_1102A_PAYTO_2ND_WITH_TI#',
A_1102A_AMOUNT_2ND_WITH_TI='#A_1102A_AMOUNT_2ND_WITH_TI#',
A_1102B_DESCRIPTION_2ND_WITH_TI='#A_1102B_DESCRIPTION_2ND_WITH_TI#',
A_1102B_PAYTO_2ND_WITH_TI='#A_1102B_PAYTO_2ND_WITH_TI#',
A_1102B_AMOUNT_2ND_WITH_TI='#A_1102B_AMOUNT_2ND_WITH_TI#',
A_1102C_DESCRIPTION_2ND_WITH_TI='#A_1102C_DESCRIPTION_2ND_WITH_TI#',
A_1102C_PAYTO_2ND_WITH_TI='#A_1102C_PAYTO_2ND_WITH_TI#',
A_1102C_AMOUNT_2ND_WITH_TI='#A_1102C_AMOUNT_2ND_WITH_TI#',
A_1102D_DESCRIPTION_2ND_WITH_TI='#A_1102D_DESCRIPTION_2ND_WITH_TI#',
A_1102D_PAYTO_2ND_WITH_TI='#A_1102D_PAYTO_2ND_WITH_TI#',
A_1102D_AMOUNT_2ND_WITH_TI='#A_1102D_AMOUNT_2ND_WITH_TI#',
A_1102E_DESCRIPTION_2ND_WITH_TI='#A_1102E_DESCRIPTION_2ND_WITH_TI#',
A_1102E_PAYTO_2ND_WITH_TI='#A_1102E_PAYTO_2ND_WITH_TI#',
A_1102E_AMOUNT_2ND_WITH_TI='#A_1102E_AMOUNT_2ND_WITH_TI#',
A_1102F_DESCRIPTION_2ND_WITH_TI='#A_1102F_DESCRIPTION_2ND_WITH_TI#',
A_1102F_PAYTO_2ND_WITH_TI='#A_1102F_PAYTO_2ND_WITH_TI#',
A_1102F_AMOUNT_2ND_WITH_TI='#A_1102F_AMOUNT_2ND_WITH_TI#',
A_1102G_DESCRIPTION_2ND_WITH_TI='#A_1102G_DESCRIPTION_2ND_WITH_TI#',
A_1102G_PAYTO_2ND_WITH_TI='#A_1102G_PAYTO_2ND_WITH_TI#',
A_1102G_AMOUNT_2ND_WITH_TI='#A_1102G_AMOUNT_2ND_WITH_TI#',
A_1102H_DESCRIPTION_2ND_WITH_TI='#A_1102H_DESCRIPTION_2ND_WITH_TI#',
A_1102H_PAYTO_2ND_WITH_TI='#A_1102H_PAYTO_2ND_WITH_TI#',
A_1102H_AMOUNT_2ND_WITH_TI='#A_1102H_AMOUNT_2ND_WITH_TI#',
A_1102I_DESCRIPTION_2ND_WITH_TI='#A_1102I_DESCRIPTION_2ND_WITH_TI#',
A_1102I_PAYTO_2ND_WITH_TI='#A_1102I_PAYTO_2ND_WITH_TI#',
A_1102I_AMOUNT_2ND_WITH_TI='#A_1102I_AMOUNT_2ND_WITH_TI#',
A_1102A_DESCRIPTION_2ND_NO_TI='#A_1102A_DESCRIPTION_2ND_NO_TI#',
A_1102A_PAYTO_2ND_NO_TI='#A_1102A_PAYTO_2ND_NO_TI#',
A_1102A_AMOUNT_2ND_NO_TI='#A_1102A_AMOUNT_2ND_NO_TI#',
A_1102B_DESCRIPTION_2ND_NO_TI='#A_1102B_DESCRIPTION_2ND_NO_TI#',
A_1102B_PAYTO_2ND_NO_TI='#A_1102B_PAYTO_2ND_NO_TI#',
A_1102B_AMOUNT_2ND_NO_TI='#A_1102B_AMOUNT_2ND_NO_TI#',
A_1102C_DESCRIPTION_2ND_NO_TI='#A_1102C_DESCRIPTION_2ND_NO_TI#',
A_1102C_PAYTO_2ND_NO_TI='#A_1102C_PAYTO_2ND_NO_TI#',
A_1102C_AMOUNT_2ND_NO_TI='#A_1102C_AMOUNT_2ND_NO_TI#',
A_1102D_DESCRIPTION_2ND_NO_TI='#A_1102D_DESCRIPTION_2ND_NO_TI#',
A_1102D_PAYTO_2ND_NO_TI='#A_1102D_PAYTO_2ND_NO_TI#',
A_1102D_AMOUNT_2ND_NO_TI='#A_1102D_AMOUNT_2ND_NO_TI#',
A_1102E_DESCRIPTION_2ND_NO_TI='#A_1102E_DESCRIPTION_2ND_NO_TI#',
A_1102E_PAYTO_2ND_NO_TI='#A_1102E_PAYTO_2ND_NO_TI#',
A_1102E_AMOUNT_2ND_NO_TI='#A_1102E_AMOUNT_2ND_NO_TI#',
A_1102F_DESCRIPTION_2ND_NO_TI='#A_1102F_DESCRIPTION_2ND_NO_TI#',
A_1102F_PAYTO_2ND_NO_TI='#A_1102F_PAYTO_2ND_NO_TI#',
A_1102F_AMOUNT_2ND_NO_TI='#A_1102F_AMOUNT_2ND_NO_TI#',
A_1102G_DESCRIPTION_2ND_NO_TI='#A_1102G_DESCRIPTION_2ND_NO_TI#',
A_1102G_PAYTO_2ND_NO_TI='#A_1102G_PAYTO_2ND_NO_TI#',
A_1102G_AMOUNT_2ND_NO_TI='#A_1102G_AMOUNT_2ND_NO_TI#',
A_1102H_DESCRIPTION_2ND_NO_TI='#A_1102H_DESCRIPTION_2ND_NO_TI#',
A_1102H_PAYTO_2ND_NO_TI='#A_1102H_PAYTO_2ND_NO_TI#',
A_1102H_AMOUNT_2ND_NO_TI='#A_1102H_AMOUNT_2ND_NO_TI#',
A_1102I_DESCRIPTION_2ND_NO_TI='#A_1102I_DESCRIPTION_2ND_NO_TI#',
A_1102I_PAYTO_2ND_NO_TI='#A_1102I_PAYTO_2ND_NO_TI#',
A_1102I_AMOUNT_2ND_NO_TI='#A_1102I_AMOUNT_2ND_NO_TI#',
A_1102A_DESCRIPTION_PURCHASE_SELLER='#A_1102A_DESCRIPTION_PURCHASE_SELLER#',
A_1102A_PAYTO_PURCHASE_SELLER='#A_1102A_PAYTO_PURCHASE_SELLER#',
A_1102A_AMOUNT_PURCHASE_SELLER='#A_1102A_AMOUNT_PURCHASE_SELLER#',
A_1102B_DESCRIPTION_PURCHASE_SELLER='#A_1102B_DESCRIPTION_PURCHASE_SELLER#',
A_1102B_PAYTO_PURCHASE_SELLER='#A_1102B_PAYTO_PURCHASE_SELLER#',
A_1102B_AMOUNT_PURCHASE_SELLER='#A_1102B_AMOUNT_PURCHASE_SELLER#',
A_1102C_DESCRIPTION_PURCHASE_SELLER='#A_1102C_DESCRIPTION_PURCHASE_SELLER#',
A_1102C_PAYTO_PURCHASE_SELLER='#A_1102C_PAYTO_PURCHASE_SELLER#',
A_1102C_AMOUNT_PURCHASE_SELLER='#A_1102C_AMOUNT_PURCHASE_SELLER#',
A_1102D_DESCRIPTION_PURCHASE_SELLER='#A_1102D_DESCRIPTION_PURCHASE_SELLER#',
A_1102D_PAYTO_PURCHASE_SELLER='#A_1102D_PAYTO_PURCHASE_SELLER#',
A_1102D_AMOUNT_PURCHASE_SELLER='#A_1102D_AMOUNT_PURCHASE_SELLER#',
A_1102E_DESCRIPTION_PURCHASE_SELLER='#A_1102E_DESCRIPTION_PURCHASE_SELLER#',
A_1102E_PAYTO_PURCHASE_SELLER='#A_1102E_PAYTO_PURCHASE_SELLER#',
A_1102E_AMOUNT_PURCHASE_SELLER='#A_1102E_AMOUNT_PURCHASE_SELLER#',
A_1102F_DESCRIPTION_PURCHASE_SELLER='#A_1102F_DESCRIPTION_PURCHASE_SELLER#',
A_1102F_PAYTO_PURCHASE_SELLER='#A_1102F_PAYTO_PURCHASE_SELLER#',
A_1102F_AMOUNT_PURCHASE_SELLER='#A_1102F_AMOUNT_PURCHASE_SELLER#',
A_1102G_DESCRIPTION_PURCHASE_SELLER='#A_1102G_DESCRIPTION_PURCHASE_SELLER#',
A_1102G_PAYTO_PURCHASE_SELLER='#A_1102G_PAYTO_PURCHASE_SELLER#',
A_1102G_AMOUNT_PURCHASE_SELLER='#A_1102G_AMOUNT_PURCHASE_SELLER#',
A_1102H_DESCRIPTION_PURCHASE_SELLER='#A_1102H_DESCRIPTION_PURCHASE_SELLER#',
A_1102H_PAYTO_PURCHASE_SELLER='#A_1102H_PAYTO_PURCHASE_SELLER#',
A_1102H_AMOUNT_PURCHASE_SELLER='#A_1102H_AMOUNT_PURCHASE_SELLER#',
A_1102I_DESCRIPTION_PURCHASE_SELLER='#A_1102I_DESCRIPTION_PURCHASE_SELLER#',
A_1102I_PAYTO_PURCHASE_SELLER='#A_1102I_PAYTO_PURCHASE_SELLER#',
A_1102I_AMOUNT_PURCHASE_SELLER='#A_1102I_AMOUNT_PURCHASE_SELLER#'
WHERE billing_id = #billing_id# AND company_id = #url.company_id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" name="check_for_table">
select billing_id from company_billing_values_construction_b_HUD2010
WHERE billing_id = #billing_id# AND company_id = #url.company_id#
</CFQUERY>
<cfif check_for_table.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" name="insert">
insert into company_billing_values_construction_b_HUD2010 (billing_id, company_id)
values(#billing_id#, #url.company_id#)
</CFQUERY>
</cfif>

<CFQUERY datasource="#request.dsn#" name="update_fees_b">
UPDATE company_billing_values_construction_b_HUD2010
SET
A_1302_DESCRIPTION_CONSTR_1X='#A_1302_DESCRIPTION_CONSTR_1X#',
A_1302_PAYTO_CONSTR_1X='#A_1302_PAYTO_CONSTR_1X#',
A_1302_AMOUNT_CONSTR_1X='#A_1302_AMOUNT_CONSTR_1X#',
A_1302_OUTSIDE_CONSTR_1X='#A_1302_OUTSIDE_CONSTR_1X#',
A_1303_DESCRIPTION_CONSTR_1X='#A_1303_DESCRIPTION_CONSTR_1X#',
A_1303_PAYTO_CONSTR_1X='#A_1303_PAYTO_CONSTR_1X#',
A_1303_AMOUNT_CONSTR_1X='#A_1303_AMOUNT_CONSTR_1X#',
A_1303_OUTSIDE_CONSTR_1X='#A_1303_OUTSIDE_CONSTR_1X#',
A_1304_DESCRIPTION_CONSTR_1X='#A_1304_DESCRIPTION_CONSTR_1X#',
A_1304_PAYTO_CONSTR_1X='#A_1304_PAYTO_CONSTR_1X#',
A_1304_AMOUNT_CONSTR_1X='#A_1304_AMOUNT_CONSTR_1X#',
A_1304_OUTSIDE_CONSTR_1X='#A_1304_OUTSIDE_CONSTR_1X#',
A_1305_DESCRIPTION_CONSTR_1X='#A_1305_DESCRIPTION_CONSTR_1X#',
A_1305_PAYTO_CONSTR_1X='#A_1305_PAYTO_CONSTR_1X#',
A_1305_AMOUNT_CONSTR_1X='#A_1305_AMOUNT_CONSTR_1X#',
A_1305_OUTSIDE_CONSTR_1X='#A_1305_OUTSIDE_CONSTR_1X#',
A_1306_DESCRIPTION_CONSTR_1X='#A_1306_DESCRIPTION_CONSTR_1X#',
A_1306_PAYTO_CONSTR_1X='#A_1306_PAYTO_CONSTR_1X#',
A_1306_AMOUNT_CONSTR_1X='#A_1306_AMOUNT_CONSTR_1X#',
A_1306_OUTSIDE_CONSTR_1X='#A_1306_OUTSIDE_CONSTR_1X#',
A_1307_DESCRIPTION_CONSTR_1X='#A_1307_DESCRIPTION_CONSTR_1X#',
A_1307_PAYTO_CONSTR_1X='#A_1307_PAYTO_CONSTR_1X#',
A_1307_AMOUNT_CONSTR_1X='#A_1307_AMOUNT_CONSTR_1X#',
A_1307_OUTSIDE_CONSTR_1X='#A_1307_OUTSIDE_CONSTR_1X#',
A_1308_DESCRIPTION_CONSTR_1X='#A_1308_DESCRIPTION_CONSTR_1X#',
A_1308_PAYTO_CONSTR_1X='#A_1308_PAYTO_CONSTR_1X#',
A_1308_AMOUNT_CONSTR_1X='#A_1308_AMOUNT_CONSTR_1X#',
A_1308_OUTSIDE_CONSTR_1X='#A_1308_OUTSIDE_CONSTR_1X#',
A_1302_DESCRIPTION_CONSTR_2X='#A_1302_DESCRIPTION_CONSTR_2X#',
A_1302_PAYTO_CONSTR_2X='#A_1302_PAYTO_CONSTR_2X#',
A_1302_AMOUNT_CONSTR_2X='#A_1302_AMOUNT_CONSTR_2X#',
A_1302_OUTSIDE_CONSTR_2X='#A_1302_OUTSIDE_CONSTR_2X#',
A_1303_DESCRIPTION_CONSTR_2X='#A_1303_DESCRIPTION_CONSTR_2X#',
A_1303_PAYTO_CONSTR_2X='#A_1303_PAYTO_CONSTR_2X#',
A_1303_AMOUNT_CONSTR_2X='#A_1303_AMOUNT_CONSTR_2X#',
A_1303_OUTSIDE_CONSTR_2X='#A_1303_OUTSIDE_CONSTR_2X#',
A_1304_DESCRIPTION_CONSTR_2X='#A_1304_DESCRIPTION_CONSTR_2X#',
A_1304_PAYTO_CONSTR_2X='#A_1304_PAYTO_CONSTR_2X#',
A_1304_AMOUNT_CONSTR_2X='#A_1304_AMOUNT_CONSTR_2X#',
A_1304_OUTSIDE_CONSTR_2X='#A_1304_OUTSIDE_CONSTR_2X#',
A_1305_DESCRIPTION_CONSTR_2X='#A_1305_DESCRIPTION_CONSTR_2X#',
A_1305_PAYTO_CONSTR_2X='#A_1305_PAYTO_CONSTR_2X#',
A_1305_AMOUNT_CONSTR_2X='#A_1305_AMOUNT_CONSTR_2X#',
A_1305_OUTSIDE_CONSTR_2X='#A_1305_OUTSIDE_CONSTR_2X#',
A_1306_DESCRIPTION_CONSTR_2X='#A_1306_DESCRIPTION_CONSTR_2X#',
A_1306_PAYTO_CONSTR_2X='#A_1306_PAYTO_CONSTR_2X#',
A_1306_AMOUNT_CONSTR_2X='#A_1306_AMOUNT_CONSTR_2X#',
A_1306_OUTSIDE_CONSTR_2X='#A_1306_OUTSIDE_CONSTR_2X#',
A_1307_DESCRIPTION_CONSTR_2X='#A_1307_DESCRIPTION_CONSTR_2X#',
A_1307_PAYTO_CONSTR_2X='#A_1307_PAYTO_CONSTR_2X#',
A_1307_AMOUNT_CONSTR_2X='#A_1307_AMOUNT_CONSTR_2X#',
A_1307_OUTSIDE_CONSTR_2X='#A_1307_OUTSIDE_CONSTR_2X#',
A_1308_DESCRIPTION_CONSTR_2X='#A_1308_DESCRIPTION_CONSTR_2X#',
A_1308_PAYTO_CONSTR_2X='#A_1308_PAYTO_CONSTR_2X#',
A_1308_AMOUNT_CONSTR_2X='#A_1308_AMOUNT_CONSTR_2X#',
A_1308_OUTSIDE_CONSTR_2X='#A_1308_OUTSIDE_CONSTR_2X#',
A_1302_DESCRIPTION_END_LOAN='#A_1302_DESCRIPTION_END_LOAN#',
A_1302_PAYTO_END_LOAN='#A_1302_PAYTO_END_LOAN#',
A_1302_AMOUNT_END_LOAN='#A_1302_AMOUNT_END_LOAN#',
A_1302_OUTSIDE_END_LOAN='#A_1302_OUTSIDE_END_LOAN#',
A_1303_DESCRIPTION_END_LOAN='#A_1303_DESCRIPTION_END_LOAN#',
A_1303_PAYTO_END_LOAN='#A_1303_PAYTO_END_LOAN#',
A_1303_AMOUNT_END_LOAN='#A_1303_AMOUNT_END_LOAN#',
A_1303_OUTSIDE_END_LOAN='#A_1303_OUTSIDE_END_LOAN#',
A_1304_DESCRIPTION_END_LOAN='#A_1304_DESCRIPTION_END_LOAN#',
A_1304_PAYTO_END_LOAN='#A_1304_PAYTO_END_LOAN#',
A_1304_AMOUNT_END_LOAN='#A_1304_AMOUNT_END_LOAN#',
A_1304_OUTSIDE_END_LOAN='#A_1304_OUTSIDE_END_LOAN#',
A_1305_DESCRIPTION_END_LOAN='#A_1305_DESCRIPTION_END_LOAN#',
A_1305_PAYTO_END_LOAN='#A_1305_PAYTO_END_LOAN#',
A_1305_AMOUNT_END_LOAN='#A_1305_AMOUNT_END_LOAN#',
A_1305_OUTSIDE_END_LOAN='#A_1305_OUTSIDE_END_LOAN#',
A_1306_DESCRIPTION_END_LOAN='#A_1306_DESCRIPTION_END_LOAN#',
A_1306_PAYTO_END_LOAN='#A_1306_PAYTO_END_LOAN#',
A_1306_AMOUNT_END_LOAN='#A_1306_AMOUNT_END_LOAN#',
A_1306_OUTSIDE_END_LOAN='#A_1306_OUTSIDE_END_LOAN#',
A_1307_DESCRIPTION_END_LOAN='#A_1307_DESCRIPTION_END_LOAN#',
A_1307_PAYTO_END_LOAN='#A_1307_PAYTO_END_LOAN#',
A_1307_AMOUNT_END_LOAN='#A_1307_AMOUNT_END_LOAN#',
A_1307_OUTSIDE_END_LOAN='#A_1307_OUTSIDE_END_LOAN#',
A_1308_DESCRIPTION_END_LOAN='#A_1308_DESCRIPTION_END_LOAN#',
A_1308_PAYTO_END_LOAN='#A_1308_PAYTO_END_LOAN#',
A_1308_AMOUNT_END_LOAN='#A_1308_AMOUNT_END_LOAN#',
A_1308_OUTSIDE_END_LOAN='#A_1308_OUTSIDE_END_LOAN#'
WHERE billing_id = #billing_id# AND company_id = #url.company_id#
</CFQUERY>


<CFQUERY datasource="#request.dsn#" name="update_itemized_fees">
UPDATE ITEMIZED_1101_CHARGES
SET
A_1101_ITEM_DESCRIPTION_01_REFINANCE = '#A_1101_ITEM_DESCRIPTION_01_REFINANCE#',
A_1101_ITEM_AMOUNT_01_REFINANCE = '#A_1101_ITEM_AMOUNT_01_REFINANCE#',
A_1101_ITEM_SELECTABLE_01_REFINANCE = '#A_1101_ITEM_SELECTABLE_01_REFINANCE#',
A_1101_ITEM_DESCRIPTION_02_REFINANCE = '#A_1101_ITEM_DESCRIPTION_02_REFINANCE#',
A_1101_ITEM_AMOUNT_02_REFINANCE = '#A_1101_ITEM_AMOUNT_02_REFINANCE#',
A_1101_ITEM_SELECTABLE_02_REFINANCE = '#A_1101_ITEM_SELECTABLE_02_REFINANCE#',
A_1101_ITEM_DESCRIPTION_03_REFINANCE = '#A_1101_ITEM_DESCRIPTION_03_REFINANCE#',
A_1101_ITEM_AMOUNT_03_REFINANCE = '#A_1101_ITEM_AMOUNT_03_REFINANCE#',
A_1101_ITEM_SELECTABLE_03_REFINANCE = '#A_1101_ITEM_SELECTABLE_03_REFINANCE#',
A_1101_ITEM_DESCRIPTION_04_REFINANCE = '#A_1101_ITEM_DESCRIPTION_04_REFINANCE#',
A_1101_ITEM_AMOUNT_04_REFINANCE = '#A_1101_ITEM_AMOUNT_04_REFINANCE#',
A_1101_ITEM_SELECTABLE_04_REFINANCE = '#A_1101_ITEM_SELECTABLE_04_REFINANCE#',
A_1101_ITEM_DESCRIPTION_05_REFINANCE = '#A_1101_ITEM_DESCRIPTION_05_REFINANCE#',
A_1101_ITEM_AMOUNT_05_REFINANCE = '#A_1101_ITEM_AMOUNT_05_REFINANCE#',
A_1101_ITEM_SELECTABLE_05_REFINANCE = '#A_1101_ITEM_SELECTABLE_05_REFINANCE#',
A_1101_ITEM_DESCRIPTION_06_REFINANCE = '#A_1101_ITEM_DESCRIPTION_06_REFINANCE#',
A_1101_ITEM_AMOUNT_06_REFINANCE = '#A_1101_ITEM_AMOUNT_06_REFINANCE#',
A_1101_ITEM_SELECTABLE_06_REFINANCE = '#A_1101_ITEM_SELECTABLE_06_REFINANCE#',
A_1101_ITEM_DESCRIPTION_07_REFINANCE = '#A_1101_ITEM_DESCRIPTION_07_REFINANCE#',
A_1101_ITEM_AMOUNT_07_REFINANCE = '#A_1101_ITEM_AMOUNT_07_REFINANCE#',
A_1101_ITEM_SELECTABLE_07_REFINANCE = '#A_1101_ITEM_SELECTABLE_07_REFINANCE#',
A_1101_ITEM_DESCRIPTION_08_REFINANCE = '#A_1101_ITEM_DESCRIPTION_08_REFINANCE#',
A_1101_ITEM_AMOUNT_08_REFINANCE = '#A_1101_ITEM_AMOUNT_08_REFINANCE#',
A_1101_ITEM_SELECTABLE_08_REFINANCE = '#A_1101_ITEM_SELECTABLE_08_REFINANCE#',
A_1101_ITEM_DESCRIPTION_09_REFINANCE = '#A_1101_ITEM_DESCRIPTION_09_REFINANCE#',
A_1101_ITEM_AMOUNT_09_REFINANCE = '#A_1101_ITEM_AMOUNT_09_REFINANCE#',
A_1101_ITEM_SELECTABLE_09_REFINANCE = '#A_1101_ITEM_SELECTABLE_09_REFINANCE#',
A_1101_ITEM_DESCRIPTION_10_REFINANCE = '#A_1101_ITEM_DESCRIPTION_10_REFINANCE#',
A_1101_ITEM_AMOUNT_10_REFINANCE = '#A_1101_ITEM_AMOUNT_10_REFINANCE#',
A_1101_ITEM_SELECTABLE_10_REFINANCE = '#A_1101_ITEM_SELECTABLE_10_REFINANCE#',
A_1101_ITEM_DESCRIPTION_11_REFINANCE = '#A_1101_ITEM_DESCRIPTION_11_REFINANCE#',
A_1101_ITEM_AMOUNT_11_REFINANCE = '#A_1101_ITEM_AMOUNT_11_REFINANCE#',
A_1101_ITEM_SELECTABLE_11_REFINANCE = '#A_1101_ITEM_SELECTABLE_11_REFINANCE#',
A_1101_ITEM_DESCRIPTION_12_REFINANCE = '#A_1101_ITEM_DESCRIPTION_12_REFINANCE#',
A_1101_ITEM_AMOUNT_12_REFINANCE = '#A_1101_ITEM_AMOUNT_12_REFINANCE#',
A_1101_ITEM_SELECTABLE_12_REFINANCE = '#A_1101_ITEM_SELECTABLE_12_REFINANCE#',
A_1101_ITEM_DESCRIPTION_13_REFINANCE = '#A_1101_ITEM_DESCRIPTION_13_REFINANCE#',
A_1101_ITEM_AMOUNT_13_REFINANCE = '#A_1101_ITEM_AMOUNT_13_REFINANCE#',
A_1101_ITEM_SELECTABLE_13_REFINANCE = '#A_1101_ITEM_SELECTABLE_13_REFINANCE#',
A_1101_ITEM_DESCRIPTION_14_REFINANCE = '#A_1101_ITEM_DESCRIPTION_14_REFINANCE#',
A_1101_ITEM_AMOUNT_14_REFINANCE = '#A_1101_ITEM_AMOUNT_14_REFINANCE#',
A_1101_ITEM_SELECTABLE_14_REFINANCE = '#A_1101_ITEM_SELECTABLE_14_REFINANCE#',
A_1101_ITEM_DESCRIPTION_15_REFINANCE = '#A_1101_ITEM_DESCRIPTION_15_REFINANCE#',
A_1101_ITEM_AMOUNT_15_REFINANCE = '#A_1101_ITEM_AMOUNT_15_REFINANCE#',
A_1101_ITEM_SELECTABLE_15_REFINANCE = '#A_1101_ITEM_SELECTABLE_15_REFINANCE#',
A_1101_ITEM_DESCRIPTION_16_REFINANCE = '#A_1101_ITEM_DESCRIPTION_16_REFINANCE#',
A_1101_ITEM_AMOUNT_16_REFINANCE = '#A_1101_ITEM_AMOUNT_16_REFINANCE#',
A_1101_ITEM_SELECTABLE_16_REFINANCE = '#A_1101_ITEM_SELECTABLE_16_REFINANCE#',
A_1101_ITEM_DESCRIPTION_17_REFINANCE = '#A_1101_ITEM_DESCRIPTION_17_REFINANCE#',
A_1101_ITEM_AMOUNT_17_REFINANCE = '#A_1101_ITEM_AMOUNT_17_REFINANCE#',
A_1101_ITEM_SELECTABLE_17_REFINANCE = '#A_1101_ITEM_SELECTABLE_17_REFINANCE#',
A_1101_ITEM_DESCRIPTION_18_REFINANCE = '#A_1101_ITEM_DESCRIPTION_18_REFINANCE#',
A_1101_ITEM_AMOUNT_18_REFINANCE = '#A_1101_ITEM_AMOUNT_18_REFINANCE#',
A_1101_ITEM_SELECTABLE_18_REFINANCE = '#A_1101_ITEM_SELECTABLE_18_REFINANCE#',
A_1101_ITEM_DESCRIPTION_19_REFINANCE = '#A_1101_ITEM_DESCRIPTION_19_REFINANCE#',
A_1101_ITEM_AMOUNT_19_REFINANCE = '#A_1101_ITEM_AMOUNT_19_REFINANCE#',
A_1101_ITEM_SELECTABLE_19_REFINANCE = '#A_1101_ITEM_SELECTABLE_19_REFINANCE#',
A_1101_ITEM_DESCRIPTION_20_REFINANCE = '#A_1101_ITEM_DESCRIPTION_20_REFINANCE#',
A_1101_ITEM_AMOUNT_20_REFINANCE = '#A_1101_ITEM_AMOUNT_20_REFINANCE#',
A_1101_ITEM_SELECTABLE_20_REFINANCE = '#A_1101_ITEM_SELECTABLE_20_REFINANCE#',
A_1101_ITEM_DESCRIPTION_01_PURCHASE = '#A_1101_ITEM_DESCRIPTION_01_PURCHASE#',
A_1101_ITEM_AMOUNT_01_PURCHASE = '#A_1101_ITEM_AMOUNT_01_PURCHASE#',
A_1101_ITEM_SELECTABLE_01_PURCHASE = '#A_1101_ITEM_SELECTABLE_01_PURCHASE#',
A_1101_ITEM_DESCRIPTION_02_PURCHASE = '#A_1101_ITEM_DESCRIPTION_02_PURCHASE#',
A_1101_ITEM_AMOUNT_02_PURCHASE = '#A_1101_ITEM_AMOUNT_02_PURCHASE#',
A_1101_ITEM_SELECTABLE_02_PURCHASE = '#A_1101_ITEM_SELECTABLE_02_PURCHASE#',
A_1101_ITEM_DESCRIPTION_03_PURCHASE = '#A_1101_ITEM_DESCRIPTION_03_PURCHASE#',
A_1101_ITEM_AMOUNT_03_PURCHASE = '#A_1101_ITEM_AMOUNT_03_PURCHASE#',
A_1101_ITEM_SELECTABLE_03_PURCHASE = '#A_1101_ITEM_SELECTABLE_03_PURCHASE#',
A_1101_ITEM_DESCRIPTION_04_PURCHASE = '#A_1101_ITEM_DESCRIPTION_04_PURCHASE#',
A_1101_ITEM_AMOUNT_04_PURCHASE = '#A_1101_ITEM_AMOUNT_04_PURCHASE#',
A_1101_ITEM_SELECTABLE_04_PURCHASE = '#A_1101_ITEM_SELECTABLE_04_PURCHASE#',
A_1101_ITEM_DESCRIPTION_05_PURCHASE = '#A_1101_ITEM_DESCRIPTION_05_PURCHASE#',
A_1101_ITEM_AMOUNT_05_PURCHASE = '#A_1101_ITEM_AMOUNT_05_PURCHASE#',
A_1101_ITEM_SELECTABLE_05_PURCHASE = '#A_1101_ITEM_SELECTABLE_05_PURCHASE#',
A_1101_ITEM_DESCRIPTION_06_PURCHASE = '#A_1101_ITEM_DESCRIPTION_06_PURCHASE#',
A_1101_ITEM_AMOUNT_06_PURCHASE = '#A_1101_ITEM_AMOUNT_06_PURCHASE#',
A_1101_ITEM_SELECTABLE_06_PURCHASE = '#A_1101_ITEM_SELECTABLE_06_PURCHASE#',
A_1101_ITEM_DESCRIPTION_07_PURCHASE = '#A_1101_ITEM_DESCRIPTION_07_PURCHASE#',
A_1101_ITEM_AMOUNT_07_PURCHASE = '#A_1101_ITEM_AMOUNT_07_PURCHASE#',
A_1101_ITEM_SELECTABLE_07_PURCHASE = '#A_1101_ITEM_SELECTABLE_07_PURCHASE#',
A_1101_ITEM_DESCRIPTION_08_PURCHASE = '#A_1101_ITEM_DESCRIPTION_08_PURCHASE#',
A_1101_ITEM_AMOUNT_08_PURCHASE = '#A_1101_ITEM_AMOUNT_08_PURCHASE#',
A_1101_ITEM_SELECTABLE_08_PURCHASE = '#A_1101_ITEM_SELECTABLE_08_PURCHASE#',
A_1101_ITEM_DESCRIPTION_09_PURCHASE = '#A_1101_ITEM_DESCRIPTION_09_PURCHASE#',
A_1101_ITEM_AMOUNT_09_PURCHASE = '#A_1101_ITEM_AMOUNT_09_PURCHASE#',
A_1101_ITEM_SELECTABLE_09_PURCHASE = '#A_1101_ITEM_SELECTABLE_09_PURCHASE#',
A_1101_ITEM_DESCRIPTION_10_PURCHASE = '#A_1101_ITEM_DESCRIPTION_10_PURCHASE#',
A_1101_ITEM_AMOUNT_10_PURCHASE = '#A_1101_ITEM_AMOUNT_10_PURCHASE#',
A_1101_ITEM_SELECTABLE_10_PURCHASE = '#A_1101_ITEM_SELECTABLE_10_PURCHASE#',
A_1101_ITEM_DESCRIPTION_11_PURCHASE = '#A_1101_ITEM_DESCRIPTION_11_PURCHASE#',
A_1101_ITEM_AMOUNT_11_PURCHASE = '#A_1101_ITEM_AMOUNT_11_PURCHASE#',
A_1101_ITEM_SELECTABLE_11_PURCHASE = '#A_1101_ITEM_SELECTABLE_11_PURCHASE#',
A_1101_ITEM_DESCRIPTION_12_PURCHASE = '#A_1101_ITEM_DESCRIPTION_12_PURCHASE#',
A_1101_ITEM_AMOUNT_12_PURCHASE = '#A_1101_ITEM_AMOUNT_12_PURCHASE#',
A_1101_ITEM_SELECTABLE_12_PURCHASE = '#A_1101_ITEM_SELECTABLE_12_PURCHASE#',
A_1101_ITEM_DESCRIPTION_13_PURCHASE = '#A_1101_ITEM_DESCRIPTION_13_PURCHASE#',
A_1101_ITEM_AMOUNT_13_PURCHASE = '#A_1101_ITEM_AMOUNT_13_PURCHASE#',
A_1101_ITEM_SELECTABLE_13_PURCHASE = '#A_1101_ITEM_SELECTABLE_13_PURCHASE#',
A_1101_ITEM_DESCRIPTION_14_PURCHASE = '#A_1101_ITEM_DESCRIPTION_14_PURCHASE#',
A_1101_ITEM_AMOUNT_14_PURCHASE = '#A_1101_ITEM_AMOUNT_14_PURCHASE#',
A_1101_ITEM_SELECTABLE_14_PURCHASE = '#A_1101_ITEM_SELECTABLE_14_PURCHASE#',
A_1101_ITEM_DESCRIPTION_15_PURCHASE = '#A_1101_ITEM_DESCRIPTION_15_PURCHASE#',
A_1101_ITEM_AMOUNT_15_PURCHASE = '#A_1101_ITEM_AMOUNT_15_PURCHASE#',
A_1101_ITEM_SELECTABLE_15_PURCHASE = '#A_1101_ITEM_SELECTABLE_15_PURCHASE#',
A_1101_ITEM_DESCRIPTION_16_PURCHASE = '#A_1101_ITEM_DESCRIPTION_16_PURCHASE#',
A_1101_ITEM_AMOUNT_16_PURCHASE = '#A_1101_ITEM_AMOUNT_16_PURCHASE#',
A_1101_ITEM_SELECTABLE_16_PURCHASE = '#A_1101_ITEM_SELECTABLE_16_PURCHASE#',
A_1101_ITEM_DESCRIPTION_17_PURCHASE = '#A_1101_ITEM_DESCRIPTION_17_PURCHASE#',
A_1101_ITEM_AMOUNT_17_PURCHASE = '#A_1101_ITEM_AMOUNT_17_PURCHASE#',
A_1101_ITEM_SELECTABLE_17_PURCHASE = '#A_1101_ITEM_SELECTABLE_17_PURCHASE#',
A_1101_ITEM_DESCRIPTION_18_PURCHASE = '#A_1101_ITEM_DESCRIPTION_18_PURCHASE#',
A_1101_ITEM_AMOUNT_18_PURCHASE = '#A_1101_ITEM_AMOUNT_18_PURCHASE#',
A_1101_ITEM_SELECTABLE_18_PURCHASE = '#A_1101_ITEM_SELECTABLE_18_PURCHASE#',
A_1101_ITEM_DESCRIPTION_19_PURCHASE = '#A_1101_ITEM_DESCRIPTION_19_PURCHASE#',
A_1101_ITEM_AMOUNT_19_PURCHASE = '#A_1101_ITEM_AMOUNT_19_PURCHASE#',
A_1101_ITEM_SELECTABLE_19_PURCHASE = '#A_1101_ITEM_SELECTABLE_19_PURCHASE#',
A_1101_ITEM_DESCRIPTION_20_PURCHASE = '#A_1101_ITEM_DESCRIPTION_20_PURCHASE#',
A_1101_ITEM_AMOUNT_20_PURCHASE = '#A_1101_ITEM_AMOUNT_20_PURCHASE#',
A_1101_ITEM_SELECTABLE_20_PURCHASE = '#A_1101_ITEM_SELECTABLE_20_PURCHASE#',
A_1101_ITEM_DESCRIPTION_01_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_01_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_01_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_01_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_01_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_01_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_02_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_02_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_02_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_02_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_02_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_02_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_03_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_03_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_03_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_03_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_03_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_03_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_04_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_04_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_04_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_04_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_04_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_04_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_05_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_05_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_05_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_05_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_05_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_05_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_06_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_06_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_06_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_06_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_06_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_06_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_07_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_07_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_07_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_07_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_07_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_07_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_08_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_08_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_08_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_08_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_08_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_08_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_09_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_09_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_09_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_09_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_09_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_09_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_10_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_10_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_10_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_10_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_10_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_10_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_11_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_11_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_11_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_11_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_11_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_11_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_12_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_12_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_12_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_12_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_12_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_12_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_13_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_13_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_13_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_13_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_13_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_13_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_14_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_14_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_14_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_14_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_14_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_14_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_15_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_15_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_15_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_15_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_15_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_15_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_16_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_16_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_16_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_16_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_16_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_16_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_17_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_17_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_17_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_17_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_17_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_17_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_18_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_18_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_18_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_18_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_18_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_18_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_19_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_19_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_19_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_19_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_19_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_19_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_20_2ND_NO_TI = '#A_1101_ITEM_DESCRIPTION_20_2ND_NO_TI#',
A_1101_ITEM_AMOUNT_20_2ND_NO_TI = '#A_1101_ITEM_AMOUNT_20_2ND_NO_TI#',
A_1101_ITEM_SELECTABLE_20_2ND_NO_TI = '#A_1101_ITEM_SELECTABLE_20_2ND_NO_TI#',
A_1101_ITEM_DESCRIPTION_01_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_01_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_01_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_01_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_01_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_01_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_02_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_02_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_02_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_02_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_02_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_02_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_03_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_03_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_03_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_03_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_03_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_03_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_04_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_04_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_04_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_04_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_04_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_04_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_05_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_05_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_05_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_05_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_05_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_05_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_06_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_06_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_06_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_06_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_06_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_06_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_07_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_07_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_07_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_07_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_07_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_07_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_08_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_08_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_08_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_08_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_08_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_08_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_09_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_09_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_09_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_09_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_09_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_09_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_10_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_10_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_10_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_10_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_10_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_10_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_11_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_11_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_11_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_11_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_11_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_11_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_12_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_12_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_12_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_12_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_12_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_12_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_13_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_13_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_13_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_13_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_13_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_13_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_14_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_14_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_14_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_14_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_14_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_14_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_15_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_15_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_15_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_15_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_15_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_15_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_16_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_16_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_16_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_16_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_16_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_16_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_17_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_17_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_17_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_17_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_17_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_17_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_18_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_18_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_18_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_18_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_18_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_18_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_19_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_19_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_19_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_19_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_19_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_19_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_20_2ND_WITH_TI = '#A_1101_ITEM_DESCRIPTION_20_2ND_WITH_TI#',
A_1101_ITEM_AMOUNT_20_2ND_WITH_TI = '#A_1101_ITEM_AMOUNT_20_2ND_WITH_TI#',
A_1101_ITEM_SELECTABLE_20_2ND_WITH_TI = '#A_1101_ITEM_SELECTABLE_20_2ND_WITH_TI#',
A_1101_ITEM_DESCRIPTION_01_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_01_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_01_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_01_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_01_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_01_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_02_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_02_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_02_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_02_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_02_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_02_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_03_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_03_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_03_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_03_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_03_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_03_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_04_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_04_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_04_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_04_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_04_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_04_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_05_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_05_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_05_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_05_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_05_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_05_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_06_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_06_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_06_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_06_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_06_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_06_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_07_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_07_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_07_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_07_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_07_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_07_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_08_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_08_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_08_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_08_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_08_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_08_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_09_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_09_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_09_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_09_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_09_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_09_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_10_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_10_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_10_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_10_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_10_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_10_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_11_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_11_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_11_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_11_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_11_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_11_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_12_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_12_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_12_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_12_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_12_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_12_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_13_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_13_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_13_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_13_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_13_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_13_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_14_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_14_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_14_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_14_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_14_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_14_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_15_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_15_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_15_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_15_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_15_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_15_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_16_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_16_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_16_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_16_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_16_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_16_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_17_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_17_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_17_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_17_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_17_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_17_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_18_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_18_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_18_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_18_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_18_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_18_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_19_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_19_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_19_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_19_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_19_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_19_PURCHASE_SELLER#',
A_1101_ITEM_DESCRIPTION_20_PURCHASE_SELLER = '#A_1101_ITEM_DESCRIPTION_20_PURCHASE_SELLER#',
A_1101_ITEM_AMOUNT_20_PURCHASE_SELLER = '#A_1101_ITEM_AMOUNT_20_PURCHASE_SELLER#',
A_1101_ITEM_SELECTABLE_20_PURCHASE_SELLER = '#A_1101_ITEM_SELECTABLE_20_PURCHASE_SELLER#'
WHERE billing_id = #billing_id# AND company_id = #url.company_id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" name="check_for_table">
select billing_id from ITEMIZED_1101_CHARGES_CONSTRUCTION
WHERE billing_id = #billing_id# AND company_id = #url.company_id#
</CFQUERY>
<cfif check_for_table.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" name="insert">
insert into ITEMIZED_1101_CHARGES_CONSTRUCTION (billing_id, company_id)
values(#billing_id#, #url.company_id#)
</CFQUERY>
</cfif>

<CFQUERY datasource="#request.dsn#" name="update_itemized_fees">
UPDATE ITEMIZED_1101_CHARGES_CONSTRUCTION
SET
A_1101_ITEM_DESCRIPTION_01_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_01_CONSTR_1X#',
A_1101_ITEM_AMOUNT_01_CONSTR_1X = '#A_1101_ITEM_AMOUNT_01_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_01_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_01_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_02_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_02_CONSTR_1X#',
A_1101_ITEM_AMOUNT_02_CONSTR_1X = '#A_1101_ITEM_AMOUNT_02_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_02_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_02_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_03_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_03_CONSTR_1X#',
A_1101_ITEM_AMOUNT_03_CONSTR_1X = '#A_1101_ITEM_AMOUNT_03_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_03_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_03_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_04_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_04_CONSTR_1X#',
A_1101_ITEM_AMOUNT_04_CONSTR_1X = '#A_1101_ITEM_AMOUNT_04_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_04_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_04_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_05_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_05_CONSTR_1X#',
A_1101_ITEM_AMOUNT_05_CONSTR_1X = '#A_1101_ITEM_AMOUNT_05_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_05_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_05_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_06_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_06_CONSTR_1X#',
A_1101_ITEM_AMOUNT_06_CONSTR_1X = '#A_1101_ITEM_AMOUNT_06_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_06_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_06_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_07_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_07_CONSTR_1X#',
A_1101_ITEM_AMOUNT_07_CONSTR_1X = '#A_1101_ITEM_AMOUNT_07_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_07_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_07_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_08_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_08_CONSTR_1X#',
A_1101_ITEM_AMOUNT_08_CONSTR_1X = '#A_1101_ITEM_AMOUNT_08_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_08_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_08_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_09_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_09_CONSTR_1X#',
A_1101_ITEM_AMOUNT_09_CONSTR_1X = '#A_1101_ITEM_AMOUNT_09_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_09_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_09_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_10_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_10_CONSTR_1X#',
A_1101_ITEM_AMOUNT_10_CONSTR_1X = '#A_1101_ITEM_AMOUNT_10_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_10_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_10_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_11_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_11_CONSTR_1X#',
A_1101_ITEM_AMOUNT_11_CONSTR_1X = '#A_1101_ITEM_AMOUNT_11_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_11_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_11_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_12_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_12_CONSTR_1X#',
A_1101_ITEM_AMOUNT_12_CONSTR_1X = '#A_1101_ITEM_AMOUNT_12_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_12_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_12_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_13_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_13_CONSTR_1X#',
A_1101_ITEM_AMOUNT_13_CONSTR_1X = '#A_1101_ITEM_AMOUNT_13_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_13_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_13_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_14_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_14_CONSTR_1X#',
A_1101_ITEM_AMOUNT_14_CONSTR_1X = '#A_1101_ITEM_AMOUNT_14_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_14_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_14_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_15_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_15_CONSTR_1X#',
A_1101_ITEM_AMOUNT_15_CONSTR_1X = '#A_1101_ITEM_AMOUNT_15_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_15_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_15_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_16_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_16_CONSTR_1X#',
A_1101_ITEM_AMOUNT_16_CONSTR_1X = '#A_1101_ITEM_AMOUNT_16_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_16_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_16_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_17_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_17_CONSTR_1X#',
A_1101_ITEM_AMOUNT_17_CONSTR_1X = '#A_1101_ITEM_AMOUNT_17_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_17_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_17_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_18_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_18_CONSTR_1X#',
A_1101_ITEM_AMOUNT_18_CONSTR_1X = '#A_1101_ITEM_AMOUNT_18_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_18_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_18_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_19_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_19_CONSTR_1X#',
A_1101_ITEM_AMOUNT_19_CONSTR_1X = '#A_1101_ITEM_AMOUNT_19_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_19_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_19_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_20_CONSTR_1X = '#A_1101_ITEM_DESCRIPTION_20_CONSTR_1X#',
A_1101_ITEM_AMOUNT_20_CONSTR_1X = '#A_1101_ITEM_AMOUNT_20_CONSTR_1X#',
A_1101_ITEM_SELECTABLE_20_CONSTR_1X = '#A_1101_ITEM_SELECTABLE_20_CONSTR_1X#',
A_1101_ITEM_DESCRIPTION_01_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_01_CONSTR_2X#',
A_1101_ITEM_AMOUNT_01_CONSTR_2X = '#A_1101_ITEM_AMOUNT_01_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_01_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_01_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_02_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_02_CONSTR_2X#',
A_1101_ITEM_AMOUNT_02_CONSTR_2X = '#A_1101_ITEM_AMOUNT_02_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_02_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_02_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_03_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_03_CONSTR_2X#',
A_1101_ITEM_AMOUNT_03_CONSTR_2X = '#A_1101_ITEM_AMOUNT_03_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_03_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_03_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_04_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_04_CONSTR_2X#',
A_1101_ITEM_AMOUNT_04_CONSTR_2X = '#A_1101_ITEM_AMOUNT_04_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_04_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_04_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_05_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_05_CONSTR_2X#',
A_1101_ITEM_AMOUNT_05_CONSTR_2X = '#A_1101_ITEM_AMOUNT_05_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_05_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_05_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_06_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_06_CONSTR_2X#',
A_1101_ITEM_AMOUNT_06_CONSTR_2X = '#A_1101_ITEM_AMOUNT_06_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_06_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_06_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_07_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_07_CONSTR_2X#',
A_1101_ITEM_AMOUNT_07_CONSTR_2X = '#A_1101_ITEM_AMOUNT_07_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_07_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_07_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_08_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_08_CONSTR_2X#',
A_1101_ITEM_AMOUNT_08_CONSTR_2X = '#A_1101_ITEM_AMOUNT_08_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_08_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_08_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_09_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_09_CONSTR_2X#',
A_1101_ITEM_AMOUNT_09_CONSTR_2X = '#A_1101_ITEM_AMOUNT_09_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_09_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_09_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_10_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_10_CONSTR_2X#',
A_1101_ITEM_AMOUNT_10_CONSTR_2X = '#A_1101_ITEM_AMOUNT_10_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_10_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_10_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_11_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_11_CONSTR_2X#',
A_1101_ITEM_AMOUNT_11_CONSTR_2X = '#A_1101_ITEM_AMOUNT_11_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_11_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_11_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_12_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_12_CONSTR_2X#',
A_1101_ITEM_AMOUNT_12_CONSTR_2X = '#A_1101_ITEM_AMOUNT_12_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_12_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_12_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_13_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_13_CONSTR_2X#',
A_1101_ITEM_AMOUNT_13_CONSTR_2X = '#A_1101_ITEM_AMOUNT_13_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_13_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_13_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_14_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_14_CONSTR_2X#',
A_1101_ITEM_AMOUNT_14_CONSTR_2X = '#A_1101_ITEM_AMOUNT_14_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_14_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_14_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_15_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_15_CONSTR_2X#',
A_1101_ITEM_AMOUNT_15_CONSTR_2X = '#A_1101_ITEM_AMOUNT_15_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_15_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_15_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_16_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_16_CONSTR_2X#',
A_1101_ITEM_AMOUNT_16_CONSTR_2X = '#A_1101_ITEM_AMOUNT_16_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_16_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_16_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_17_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_17_CONSTR_2X#',
A_1101_ITEM_AMOUNT_17_CONSTR_2X = '#A_1101_ITEM_AMOUNT_17_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_17_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_17_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_18_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_18_CONSTR_2X#',
A_1101_ITEM_AMOUNT_18_CONSTR_2X = '#A_1101_ITEM_AMOUNT_18_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_18_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_18_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_19_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_19_CONSTR_2X#',
A_1101_ITEM_AMOUNT_19_CONSTR_2X = '#A_1101_ITEM_AMOUNT_19_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_19_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_19_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_20_CONSTR_2X = '#A_1101_ITEM_DESCRIPTION_20_CONSTR_2X#',
A_1101_ITEM_AMOUNT_20_CONSTR_2X = '#A_1101_ITEM_AMOUNT_20_CONSTR_2X#',
A_1101_ITEM_SELECTABLE_20_CONSTR_2X = '#A_1101_ITEM_SELECTABLE_20_CONSTR_2X#',
A_1101_ITEM_DESCRIPTION_01_END_LOAN = '#A_1101_ITEM_DESCRIPTION_01_END_LOAN#',
A_1101_ITEM_AMOUNT_01_END_LOAN = '#A_1101_ITEM_AMOUNT_01_END_LOAN#',
A_1101_ITEM_SELECTABLE_01_END_LOAN = '#A_1101_ITEM_SELECTABLE_01_END_LOAN#',
A_1101_ITEM_DESCRIPTION_02_END_LOAN = '#A_1101_ITEM_DESCRIPTION_02_END_LOAN#',
A_1101_ITEM_AMOUNT_02_END_LOAN = '#A_1101_ITEM_AMOUNT_02_END_LOAN#',
A_1101_ITEM_SELECTABLE_02_END_LOAN = '#A_1101_ITEM_SELECTABLE_02_END_LOAN#',
A_1101_ITEM_DESCRIPTION_03_END_LOAN = '#A_1101_ITEM_DESCRIPTION_03_END_LOAN#',
A_1101_ITEM_AMOUNT_03_END_LOAN = '#A_1101_ITEM_AMOUNT_03_END_LOAN#',
A_1101_ITEM_SELECTABLE_03_END_LOAN = '#A_1101_ITEM_SELECTABLE_03_END_LOAN#',
A_1101_ITEM_DESCRIPTION_04_END_LOAN = '#A_1101_ITEM_DESCRIPTION_04_END_LOAN#',
A_1101_ITEM_AMOUNT_04_END_LOAN = '#A_1101_ITEM_AMOUNT_04_END_LOAN#',
A_1101_ITEM_SELECTABLE_04_END_LOAN = '#A_1101_ITEM_SELECTABLE_04_END_LOAN#',
A_1101_ITEM_DESCRIPTION_05_END_LOAN = '#A_1101_ITEM_DESCRIPTION_05_END_LOAN#',
A_1101_ITEM_AMOUNT_05_END_LOAN = '#A_1101_ITEM_AMOUNT_05_END_LOAN#',
A_1101_ITEM_SELECTABLE_05_END_LOAN = '#A_1101_ITEM_SELECTABLE_05_END_LOAN#',
A_1101_ITEM_DESCRIPTION_06_END_LOAN = '#A_1101_ITEM_DESCRIPTION_06_END_LOAN#',
A_1101_ITEM_AMOUNT_06_END_LOAN = '#A_1101_ITEM_AMOUNT_06_END_LOAN#',
A_1101_ITEM_SELECTABLE_06_END_LOAN = '#A_1101_ITEM_SELECTABLE_06_END_LOAN#',
A_1101_ITEM_DESCRIPTION_07_END_LOAN = '#A_1101_ITEM_DESCRIPTION_07_END_LOAN#',
A_1101_ITEM_AMOUNT_07_END_LOAN = '#A_1101_ITEM_AMOUNT_07_END_LOAN#',
A_1101_ITEM_SELECTABLE_07_END_LOAN = '#A_1101_ITEM_SELECTABLE_07_END_LOAN#',
A_1101_ITEM_DESCRIPTION_08_END_LOAN = '#A_1101_ITEM_DESCRIPTION_08_END_LOAN#',
A_1101_ITEM_AMOUNT_08_END_LOAN = '#A_1101_ITEM_AMOUNT_08_END_LOAN#',
A_1101_ITEM_SELECTABLE_08_END_LOAN = '#A_1101_ITEM_SELECTABLE_08_END_LOAN#',
A_1101_ITEM_DESCRIPTION_09_END_LOAN = '#A_1101_ITEM_DESCRIPTION_09_END_LOAN#',
A_1101_ITEM_AMOUNT_09_END_LOAN = '#A_1101_ITEM_AMOUNT_09_END_LOAN#',
A_1101_ITEM_SELECTABLE_09_END_LOAN = '#A_1101_ITEM_SELECTABLE_09_END_LOAN#',
A_1101_ITEM_DESCRIPTION_10_END_LOAN = '#A_1101_ITEM_DESCRIPTION_10_END_LOAN#',
A_1101_ITEM_AMOUNT_10_END_LOAN = '#A_1101_ITEM_AMOUNT_10_END_LOAN#',
A_1101_ITEM_SELECTABLE_10_END_LOAN = '#A_1101_ITEM_SELECTABLE_10_END_LOAN#',
A_1101_ITEM_DESCRIPTION_11_END_LOAN = '#A_1101_ITEM_DESCRIPTION_11_END_LOAN#',
A_1101_ITEM_AMOUNT_11_END_LOAN = '#A_1101_ITEM_AMOUNT_11_END_LOAN#',
A_1101_ITEM_SELECTABLE_11_END_LOAN = '#A_1101_ITEM_SELECTABLE_11_END_LOAN#',
A_1101_ITEM_DESCRIPTION_12_END_LOAN = '#A_1101_ITEM_DESCRIPTION_12_END_LOAN#',
A_1101_ITEM_AMOUNT_12_END_LOAN = '#A_1101_ITEM_AMOUNT_12_END_LOAN#',
A_1101_ITEM_SELECTABLE_12_END_LOAN = '#A_1101_ITEM_SELECTABLE_12_END_LOAN#',
A_1101_ITEM_DESCRIPTION_13_END_LOAN = '#A_1101_ITEM_DESCRIPTION_13_END_LOAN#',
A_1101_ITEM_AMOUNT_13_END_LOAN = '#A_1101_ITEM_AMOUNT_13_END_LOAN#',
A_1101_ITEM_SELECTABLE_13_END_LOAN = '#A_1101_ITEM_SELECTABLE_13_END_LOAN#',
A_1101_ITEM_DESCRIPTION_14_END_LOAN = '#A_1101_ITEM_DESCRIPTION_14_END_LOAN#',
A_1101_ITEM_AMOUNT_14_END_LOAN = '#A_1101_ITEM_AMOUNT_14_END_LOAN#',
A_1101_ITEM_SELECTABLE_14_END_LOAN = '#A_1101_ITEM_SELECTABLE_14_END_LOAN#',
A_1101_ITEM_DESCRIPTION_15_END_LOAN = '#A_1101_ITEM_DESCRIPTION_15_END_LOAN#',
A_1101_ITEM_AMOUNT_15_END_LOAN = '#A_1101_ITEM_AMOUNT_15_END_LOAN#',
A_1101_ITEM_SELECTABLE_15_END_LOAN = '#A_1101_ITEM_SELECTABLE_15_END_LOAN#',
A_1101_ITEM_DESCRIPTION_16_END_LOAN = '#A_1101_ITEM_DESCRIPTION_16_END_LOAN#',
A_1101_ITEM_AMOUNT_16_END_LOAN = '#A_1101_ITEM_AMOUNT_16_END_LOAN#',
A_1101_ITEM_SELECTABLE_16_END_LOAN = '#A_1101_ITEM_SELECTABLE_16_END_LOAN#',
A_1101_ITEM_DESCRIPTION_17_END_LOAN = '#A_1101_ITEM_DESCRIPTION_17_END_LOAN#',
A_1101_ITEM_AMOUNT_17_END_LOAN = '#A_1101_ITEM_AMOUNT_17_END_LOAN#',
A_1101_ITEM_SELECTABLE_17_END_LOAN = '#A_1101_ITEM_SELECTABLE_17_END_LOAN#',
A_1101_ITEM_DESCRIPTION_18_END_LOAN = '#A_1101_ITEM_DESCRIPTION_18_END_LOAN#',
A_1101_ITEM_AMOUNT_18_END_LOAN = '#A_1101_ITEM_AMOUNT_18_END_LOAN#',
A_1101_ITEM_SELECTABLE_18_END_LOAN = '#A_1101_ITEM_SELECTABLE_18_END_LOAN#',
A_1101_ITEM_DESCRIPTION_19_END_LOAN = '#A_1101_ITEM_DESCRIPTION_19_END_LOAN#',
A_1101_ITEM_AMOUNT_19_END_LOAN = '#A_1101_ITEM_AMOUNT_19_END_LOAN#',
A_1101_ITEM_SELECTABLE_19_END_LOAN = '#A_1101_ITEM_SELECTABLE_19_END_LOAN#',
A_1101_ITEM_DESCRIPTION_20_END_LOAN = '#A_1101_ITEM_DESCRIPTION_20_END_LOAN#',
A_1101_ITEM_AMOUNT_20_END_LOAN = '#A_1101_ITEM_AMOUNT_20_END_LOAN#',
A_1101_ITEM_SELECTABLE_20_END_LOAN = '#A_1101_ITEM_SELECTABLE_20_END_LOAN#'
WHERE billing_id = #billing_id# AND company_id = #url.company_id#
</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_company">

			SELECT *
			FROM companies
			WHERE ID = #url.company_id#

		</CFQUERY>



<CFelseIF #a_flag# EQ "3">


		<CFQUERY datasource="#request.dsn#" NAME="read_current_ft">
			SELECT *
			FROM company_billing_values_HUD2010
			WHERE billing_id = #billing_id# AND company_id = #url.company_id#
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_agency_1">
			SELECT *
			FROM title_FT_Agencies
			WHERE Title_FT_Agency_id = #New_agency_id#
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_company">

			SELECT *
			FROM companies
			WHERE ID = #url.company_id#

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_com">

			SELECT *
			FROM company_agency_assoc_HUD2010
			WHERE billing_id = #read_current_ft.billing_id# and company_id = #read_current_ft.company_id#
		</CFQUERY>
		<cfif #read_com.recordcount# EQ 0>
<CFQUERY datasource="#request.dsn#" >
			INSERT INTO company_agency_assoc_HUD2010(title_FT_Agency_ID, billing_id, title_FT_Agency_Name, title_FT_Agency_State, Company_ID)
			VALUES(#read_agency_1.title_FT_Agency_ID#, #billing_ID#, '#read_agency_1.company#', '#read_agency_1.state#', #read_company.id#)
		</CFQUERY>

			<cfelse>
<CFQUERY datasource="#request.dsn#" >
			update company_agency_assoc_HUD2010
			set title_FT_Agency_ID = #read_agency_1.title_FT_Agency_ID#,
			title_FT_Agency_Name = '#read_agency_1.company#',
			title_FT_Agency_State = '#read_agency_1.state#',
			Company_ID = #read_company.id#
			WHERE billing_id = #read_current_ft.billing_id# AND company_id = #read_current_ft.company_id#
	</CFQUERY>

				</cfif>


<CFELSEIF #a_flag# EQ "4">

		<CFQUERY datasource="#request.dsn#" NAME="read_current_st">

			SELECT state_id, a_states
			FROM company_billing_states_HUD2010
			WHERE billing_id = #billing_id# AND company_id = #url.company_id#
			order by state_id desc

		</CFQUERY>

			<CFSET st_list_current = #ListToArray(read_current_st.a_states, ",")#>


			<CFSET st_list = #ListToArray(a_st_list_3, ",")#>

			<CFSET a_states_new_list = "">

	<CFLOOP FROM="1" TO="#ArrayLen(st_list_current)#" INDEX="AAA">
		<CFSET x_trigger = "1">

			<CFLOOP FROM="1" TO="#ArrayLen(st_list)#" INDEX="BBB">
				<CFIF #st_list[BBB]# EQ #st_list_current[AAA]#>
					<CFSET x_trigger = "2">
				</CFIF>
			</CFLOOP>

			<CFIF #x_trigger# EQ "1">
				<CFSET a_states_new_list = #st_list_current[AAA]# & "," & #a_states_new_list#>
					<CFSET x_trigger = "1">
			</CFIF>
	</CFLOOP>

<cfif ListLen(form.counties, ",") eq 0>
		<CFQUERY datasource="#request.dsn#" >

			delete from company_billing_states_HUD2010

			WHERE billing_id = #billing_id# AND company_id = #url.company_id# AND a_states = '#a_st_list_3#'

		</CFQUERY>
</cfif>


<CFELSE>

	<CFSET st_list = #ListToArray(a_st_list_3, ",")#>

		<CFSET a_add_states = "">

	<CFLOOP FROM="1" TO="#ArrayLen(st_list)#" INDEX="AAA">
			<CFSET a_add_states = #a_add_states# & #st_list[AAA]# & ",">
	</CFLOOP>

		<CFQUERY datasource="#request.dsn#" NAME="read_current_st">

			SELECT state_id, a_states
			FROM company_billing_states_HUD2010
			WHERE billing_id = #billing_id# AND company_id = #url.company_id#
			order by state_id desc

		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" NAME="read_current_state">

			SELECT *
			FROM company_billing_states_HUD2010
			WHERE billing_id = #billing_id# AND company_id = #url.company_id#

		</CFQUERY>

			<CFSET a_1 = #a_add_states# & #read_current_st.a_states#>

			<CFSET a_state_list = #ListToArray(a_st_list_3, ",")#>

	<CFLOOP FROM="1" TO="#ArrayLen(a_state_list)#" INDEX="DDD">
		<CFQUERY datasource="#request.dsn#" >
			INSERT INTO company_billing_states_HUD2010(billing_id, company_ID, a_states)
			VALUES('#billing_id#', '#url.company_id#', '#a_state_list[DDD]#')
		</CFQUERY>
	</CFLOOP>




</CFIF>




	<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_id">
			SELECT *
			FROM company_billing_values_HUD2010
			WHERE billing_id = #billing_id#
		</CFQUERY>
	<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_st">

			SELECT *
			FROM company_billing_states_HUD2010
			WHERE billing_id = #billing_id#
			order by state_id desc

		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_current_agency_assoc">

			SELECT *
			FROM company_agency_assoc_HUD2010
			WHERE billing_id = #read_this_sets_billing_id.billing_id#

		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_agencies">

			SELECT *
			FROM title_FT_Agencies
			ORDER BY state ASC, company ASC

		</CFQUERY>

		<CFSET a_agency_id = ArrayNew(1)>
		<CFSET a_agency_state = ArrayNew(1)>
		<CFSET a_agency_name = ArrayNew(1)>
		<CFSET a_count = "1">

		<CFOUTPUT QUERY="read_agencies">
				<CFSET a_agency_id[a_count] = #title_FT_Agency_ID#>
				<CFSET a_agency_state[a_count] = #state#>
				<CFSET a_agency_name[a_count] = #company#>
				<CFSET a_count = #a_count# + "1">
		</CFOUTPUT>




		<CFQUERY datasource="#request.dsn#" NAME="read_company">

			SELECT *
			FROM companies
			WHERE ID = #url.company_id#

		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">
			SELECT *
			FROM company_billing_values_HUD2010
			WHERE billing_id = #billing_id#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">

			SELECT *
			FROM company_billing_states_HUD2010
			WHERE billing_id = #billing_id#
			order by state_id desc

		</CFQUERY>
					<CFSET a_st_list_4 = ArrayNew(1)>

		<CFSET a_count = "1">

		<CFOUTPUT QUERY="read_this_sets_billing_states">

				<CFSET a_st_list_4[a_count] = #a_states#>

				<CFSET a_count = #a_count# + "1">
		</CFOUTPUT>




		<CFQUERY datasource="#request.dsn#" NAME="read_company_billing_values">
			SELECT *
			FROM company_billing_values_HUD2010
			WHERE company_ID = #url.company_id#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_company_billing_states">

			SELECT *
			FROM company_billing_states_HUD2010
			WHERE company_ID = #url.company_id#
			order by state_id desc

		</CFQUERY>
				<CFSET a_st_list_x = "">

					<CFOUTPUT QUERY="read_company_billing_states">
						<CFSET a_st_list_x = #a_st_list_x# & #a_states# & ",">
					</CFOUTPUT>

				<CFSET a_st_list_7 = #ListToArray(a_st_list_x, ",")#>


		<CFQUERY datasource="#request.dsn#" NAME="read_all_first_title_states">

			SELECT *
			FROM first_title_states
			ORDER BY st_abbrev ASC

		</CFQUERY>



</cfif>


<cfif ListLen(form.counties, ",") gt 0>
	<CFLOOP INDEX="i" list="#form.counties#" delimiters=",">
		<CFQUERY datasource="#request.dsn#"  name="delete_entries">
			delete  from company_billing_states_HUD2010
			where a_states = '#read_this_sets_billing_states.a_states#' and (county = '#i#') and company_id = #url.company_id#
		</CFQUERY>
	</CFLOOP>

	<CFLOOP INDEX="j" list="#form.counties#" delimiters=",">
		<CFQUERY datasource="#request.dsn#" >
			INSERT INTO company_billing_states_HUD2010(billing_id, company_ID, a_states, county)
			VALUES('#billing_id#', '#url.company_id#', '#url.state#', '#j#')
		</CFQUERY>
	</CFLOOP>


<CFQUERY datasource="#request.dsn#" NAME="read_com">
	SELECT *
	FROM company_agency_assoc_HUD2010
	WHERE billing_id = #billing_id# and company_id = #url.company_id#
</CFQUERY>
<cfif read_com.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="read_bill_id">
	SELECT *
	FROM company_billing_states_HUD2010
	WHERE a_states = '#url.state#' and company_id = #url.company_id# and (county = '' or county IS NULL)
	order by state_id desc
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_agency">
	SELECT *
	FROM company_agency_assoc_HUD2010
	WHERE billing_id = #read_bill_id.billing_id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" >
			INSERT INTO company_agency_assoc_HUD2010(title_FT_Agency_ID, billing_id, title_FT_Agency_Name, title_FT_Agency_State, Company_ID)
			VALUES(#read_agency.title_FT_Agency_ID#, #billing_ID#, '#read_agency.title_FT_Agency_Name#', '#url.state#', #url.company_id#)
		</CFQUERY>

</cfif>
</cfif>
<!--- <cfif cgi.REMOTE_ADDR eq '98.233.232.47'>
<cfoutput>#ListLen(form.counties, ",")#</cfoutput>
<cfabort>
</cfif>
 --->
 <cfset url.state = ''>
 <cfif IsDefined("form.A_ST_LIST_3")>
 <cfset url.state = form.A_ST_LIST_3  >
 </cfif>
	<CFLOCATION URL="https://#cgi.server_name#/admin_area/client_line_costs_display_2010.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#url.company_id#&billing_id=#billing_id#&state=#url.state#">