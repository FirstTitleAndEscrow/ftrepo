<CFSET strVar = "Being the same property as transferred by Quit Claim Deed on 05/20/1995 and recorded 03/20/1996 from Daniel Martinez, III, married to Rebecca Jaracz to Donald E. Witma , Joint Tenants, recorded in Book 12 and Page 15">

<CFOUTPUT>#len(strVar)#</CFOUTPUT>
	<CFSET strVar2 = #mid(strVar,1,76)#>
	<CFSET strVar2 = #strVar2#&"ğ">

<CFIF #len(strVar)# gte 77> 
	<CFSET strVar3 = #mid(strVar,77,76)#>
	<CFSET strVar3 = #strVar2# & #strVar3#&"ğ">
</CFIF>


<CFIF #len(strVar)# gte 153> 
	<CFSET strVar4 = #mid(strVar,153,76)#>
	<CFSET strVar4 = #strVar3# & #strVar4#&"ğ">
<CFELSE>
	<CFSET strVar4 = "ğ">
	<CFSET strVar4 = #strVar3# & #strVar4#>
</CFIF>

<CFIF #len(strVar)# gte 229> 
	<CFSET strVar5 = #mid(strVar,229,76)#>
	<CFSET strVar5 = #strVar4# & #strVar5#&"ğ">
<CFELSE>
	<CFSET strVar5 = "ğ">
	<CFSET strVar5 = #strVar4# & #strVar5#>
</CFIF>

<CFIF #len(strVar)# gte 305> 
	<CFSET strVar6 = #mid(strVar,305,76)#>
	<CFSET strVar6 = #strVar5# & #strVar6#&"ğ">
<CFELSE>
	<CFSET strVar6 = "ğ">
	<CFSET strVar6 = #strVar5# & #strVar6#>
</CFIF>

<CFIF #len(strVar)# gte 381> 
	<CFSET strVar7 = #mid(strVar,381,76)#>
	<CFSET strVar7 = #strVar6# & #strVar7#&"ğ">
<CFELSE>
	<CFSET strVar7 = "ğ">
	<CFSET strVar7 = #strVar6# & #strVar7#>
</CFIF>

<CFIF #len(strVar)# gte 457> 
	<CFSET strVar8 = #mid(strVar,457,76)#>
	<CFSET strVar8 = #strVar7# & #strVar8#&"ğ">
<CFELSE>
	<CFSET strVar8 = "ğ">
	<CFSET strVar8 = #strVar7# & #strVar8#>
</CFIF>

<CFIF #len(strVar)# gte 533> 
	<CFSET strVar9 = #mid(strVar,533,76)#>
	<CFSET strVar9 = #strVar8# & #strVar9#&"ğ">
<CFELSE>
	<CFSET strVar9 = "ğ">
	<CFSET strVar9 = #strVar8# & #strVar9#>
</CFIF>

<CFIF #len(strVar)# gte 609> 
	<CFSET strVar10 = #mid(strVar,609,76)#>
	<CFSET strVar10 = #strVar9# & #strVar10#&"ğ">
<CFELSE>
	<CFSET strVar10 = "ğ">
	<CFSET strVar10 = #strVar9# & #strVar10#>
</CFIF>

<CFIF #len(strVar)# gte 685> 
	<CFSET strVar11 = #mid(strVar,685,76)#>
	<CFSET strVar11 = #strVar10# & #strVar11#&"ğ">
<CFELSE>
	<CFSET strVar11 = "ğ">
	<CFSET strVar11 = #strVar10# & #strVar11#>
</CFIF>

<CFIF #len(strVar)# gte 761> 
	<CFSET strVar12 = #mid(strVar,761,76)#>
	<CFSET strVar12 = #strVar11# & #strVar12#&"ğ">
<CFELSE>
	<CFSET strVar12 = "ğ">
	<CFSET strVar12 = #strVar11# & #strVar12#>
</CFIF>

<CFIF #len(strVar)# gte 837> 
	<CFSET strVar12 = #mid(strVar,837,76)#>
	<CFSET strVar12 = #strVar11# & #strVar12#&"ğ">
<CFELSE>
	<CFSET strVar12 = "ğ">
	<CFSET strVar12 = #strVar11# & #strVar12#>
</CFIF>

<CFIF #len(strVar)# gte 913> 
	<CFSET strVar13 = #mid(strVar,913,76)#>
	<CFSET strVar13 = #strVar12# & #strVar13#&"ğ">
<CFELSE>
	<CFSET strVar13 = "ğ">
	<CFSET strVar13 = #strVar12# & #strVar13#>
</CFIF>

<CFIF #len(strVar)# gte 989> 
	<CFSET strVar14 = #mid(strVar,913,76)#>
	<CFSET strVar14 = #strVar13# & #strVar14#&"ğ">
<CFELSE>
	<CFSET strVar14 = "ğ">
	<CFSET strVar14 = #strVar13# & #strVar14#>
</CFIF>

<CFIF #len(strVar)# gte 1065> 
	<CFSET strVar15 = #mid(strVar,1065,76)#>
	<CFSET strVar15 = #strVar14# & #strVar15#&"ğ">
<CFELSE>
	<CFSET strVar15 = "ğ">
	<CFSET strVar15 = #strVar14# & #strVar15#>
</CFIF>

<CFSET strVar16 = "|">
	<CFSET strVar16 = #strVar15# & #strVar16#>


<CFOUTPUT>#strVar16#</CFOUTPUT>




