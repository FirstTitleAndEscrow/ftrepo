<CFQUERY datasource="#request.dsn#" NAME="get_current">
SELECT     t.*, h.a_1108_a
FROM         Title t, HUD_Form_Title_Pg2 h
WHERE     (t.order_date > '06/01/2006') and (pstate <> 'TX') AND (t.SearchType = 'purchase') AND (t.appraisal_status <> 'Loan Closed') AND (t.cancelled IS NULL) and (t.purchase <> '') and (t.purchase <> '00000000') and (t.purchase <> '0000000') and (t.purchase <> '000000') and (t.purchase <> '00000') and (t.purchase IS NOT NULL) and (t.purchase <> '0')  and (h.a_1108_a is not null) and (h.title_id  = t.title_id)
order by t.order_date
</cfquery>





<table border=1 cellpadding=6>
<tr>
<td align="left" valign="top">&nbsp;</td>
<td align="left" valign="top">ID</td>
<td align="left" valign="top">State</td>
<td align="left" valign="top">Table</td>
<td align="left" valign="top">Currently</td>
<td align="left" valign="top">Will Change to</td>
<td align="left" valign="top">Purchase Price</td>
</tr>
<cfset current_count = 0>
<cfoutput query="get_current">
<!--- <cfset pcounty = pcounty>
<cfset pstate = pstate>
<cfset purchase = purchase>
<cfset a_1108_a = a_1108_a>
 --->
 


<CFIF (#pstate# EQ "AL")> 
			<CFIF (#pcounty# EQ "Cherokee") OR (#pcounty# EQ "Colbert")  OR (#pcounty# EQ "Dekalb") OR (#pcounty# EQ "Etowah") OR (#pcounty# EQ "Franklin") OR (#pcounty# EQ "Jackson") OR (#pcounty# EQ "Lauderdale") OR (#pcounty# EQ "Lawrence") OR (#pcounty# EQ "Limestone") OR (#pcounty# EQ "Madison") OR (#pcounty# EQ "Marion") OR (#pcounty# EQ "Marshall") OR (#pcounty# EQ "Winston")>
					<CFSET a_tble_to_read = "StateAlabamaMetro">
					<CFELSE>
					<CFSET a_tble_to_read = "StateAlabamaState">
				</CFIF>
				<CFELSEIF #pstate# EQ "AR">
					<CFSET a_tble_to_read = "StateArkansas">
				<CFELSEIF #pstate# EQ "MT">
					     <CFIF (#comp_id# eq 729) >
						 <CFSET a_tble_to_read = "StateMontanaStewart">
						 <cfelse>
                         <CFSET a_tble_to_read = "StateMontana">
						 </cfif>
				<CFELSEIF #pstate# EQ "AK">
					<CFSET a_tble_to_read = "Alaska">
			    <CFELSEIF #pstate# EQ "AZ">
                <CFIF (#comp_id# eq "115") or (#comp_id# eq "621") >
                     <CFSET a_tble_to_read = "StateArizonaMIC">
				<CFELSEIF #comp_id# eq "729">
					<CFIF (#pcounty# EQ "Apache") OR  (#pcounty# EQ "Cochise") OR  (#pcounty# EQ "Gila") OR  (#pcounty# EQ "Graham") OR  (#pcounty# EQ "Greenlee") OR  (#pcounty# EQ "Maricopa") OR  (#pcounty# EQ "Mohave") OR  (#pcounty# EQ "Pina") OR  (#pcounty# EQ "Pinal")>
					    <CFSET a_tble_to_read = "StateArizonaStewartZone1">
					<CFelseIF (#pcounty# EQ "Yuma") OR  (#pcounty# EQ "Lapaz")>
					    <CFSET a_tble_to_read = "StateArizonaStewartZone2">
					<CFelseIF (#pcounty# EQ "Coconino")  OR  (#pcounty# EQ "Yavapai")>
					    <CFSET a_tble_to_read = "StateArizonaStewartZone3">
					<CFelseIF (#pcounty# EQ "Navajo")>
					    <CFSET a_tble_to_read = "StateArizonaStewartZone4">
					<CFelseIF (#pcounty# EQ "Santa Cruz")>
					    <CFSET a_tble_to_read = "StateArizonaStewartZone5">
					<cfelse>
					    <CFSET a_tble_to_read = "StateArizonaStewartZone1">
					 </CFIF>
				<CFELSE>    
				    <CFIF (#pcounty# EQ "Maricopa") OR  (#pcounty# EQ "Pima") OR  (#pcounty# EQ "Pinal")>
					    <CFSET a_tble_to_read = "StateArizonaZone1">
				    <CFelseIF (#pcounty# EQ "Coconino")>
					    <CFSET a_tble_to_read = "StateArizonaZone2">
				    <CFelseIF (#pcounty# EQ "Cochise")>
					    <CFSET a_tble_to_read = "StateArizonaZone3">
				    <CFelseIF (#pcounty# EQ "Yavapai")>
					    <CFSET a_tble_to_read = "StateArizonaZone4">
				    <CFelseIF (#pcounty# EQ "Mohave")>
					    <CFSET a_tble_to_read = "StateArizonaZone5">
				    <cfelse>
					    <CFSET a_tble_to_read = "StateArizona">
				    </CFIF>
                </CFIF>        
			<CFELSEIF #pstate# eq "CA">
                 <CFIF (#pcounty# EQ "Butte") OR (#pcounty# EQ "Colusa") OR (#pcounty# EQ "Del Norte") OR (#pcounty# EQ "Glenn") OR (#pcounty# EQ "Humboldt") OR (#pcounty# EQ "Lake")>
                       <CFSET a_tble_to_read = "StateCaliforniaZone2">
                 <CFELSE>
                       <CFSET a_tble_to_read = "StateCaliforniaZone1">
                 </CFIF>                                   
			<CFELSEIF #pstate# EQ "CT">
				<CFSET a_tble_to_read = "StateConnecticut">
			<CFELSEIF #pstate# EQ "CO">
				<CFIF (#pcounty# EQ "Adams") OR  (#pcounty# EQ "Arapahoe") OR  (#pcounty# EQ "Broomfield") OR  (#pcounty# EQ "Clear Creek") OR  (#pcounty# EQ "Denver") OR  (#pcounty# EQ "Douglas") OR  (#pcounty# EQ "Elbert") OR  (#pcounty# EQ "Jefferson")>
					<CFSET a_tble_to_read = "StateColoradoZone1">
				<CFelseIF (#pcounty# EQ "Alamosa") OR  (#pcounty# EQ "Conejos") OR  (#pcounty# EQ "Rio Grande") OR  (#pcounty# EQ "Saguache")>
					<CFSET a_tble_to_read = "StateColoradoZone2">
				<CFelseIF (#pcounty# EQ "Archuleta") OR (#pcounty# EQ "Mineral")>
					<CFSET a_tble_to_read = "StateColoradoZone3">
				<CFelseIF (#pcounty# EQ "Boulder")>
					<CFSET a_tble_to_read = "StateColoradoZone4">
				<CFelseIF (#pcounty# EQ "Chaffee")>
					<CFSET a_tble_to_read = "StateColoradoZone5">
				<CFelseIF (#pcounty# EQ "Custer") OR (#pcounty# EQ "Fremont")>
					<CFSET a_tble_to_read = "StateColoradoZone6">
				<CFelseIF (#pcounty# EQ "Dolorse") OR (#pcounty# EQ "LaPlata") OR (#pcounty# EQ "Montezuma")>
					<CFSET a_tble_to_read = "StateColoradoZone7">
				<CFelseIF (#pcounty# EQ "Eagle") OR (#pcounty# EQ "Garfield") OR (#pcounty# EQ "Grand") OR (#pcounty# EQ "Jackson") OR (#pcounty# EQ "Pitkin") OR (#pcounty# EQ "Routt")>
					<CFSET a_tble_to_read = "StateColoradoZone8">
				<CFelseIF (#pcounty# EQ "El Paso")>
					<CFSET a_tble_to_read = "StateColoradoZone9">
				<CFelseIF (#pcounty# EQ "Moffatt")>
					<CFSET a_tble_to_read = "StateColoradoZone10">
				<CFelseIF (#pcounty# EQ "Larimer")>
					<CFSET a_tble_to_read = "StateColoradoZone11">
				<CFelseIF (#pcounty# EQ "Montrose") OR (#pcounty# EQ "Ouray")>
					<CFSET a_tble_to_read = "StateColoradoZone12">
				<CFelseIF (#pcounty# EQ "Phillips")>
					<CFSET a_tble_to_read = "StateColoradoZone13">
				<CFelseIF (#pcounty# EQ "Pueblo")>
					<CFSET a_tble_to_read = "StateColoradoZone14">
				<CFelseIF (#pcounty# EQ "Rio Blanco")>
					<CFSET a_tble_to_read = "StateColoradoZone15">
				<CFelseIF (#pcounty# EQ "Weld")>
					<CFSET a_tble_to_read = "StateColoradoZone16">
				<cfelse>
					<CFSET a_tble_to_read = "StateColoradoZone17">
				</CFIF>
			<CFELSEIF #pstate# EQ "DC">
				<CFSET a_tble_to_read = "StateDistrictColombia">
			<CFELSEIF #pstate# EQ "DE">
				<CFSET a_tble_to_read = "StateDelaware">
			<CFELSEIF #pstate# EQ "FL">
				<CFSET a_tble_to_read = "StateFlorida">
			<CFELSEIF #pstate# EQ "GA">
				 <CFIF #comp_id# eq "729">
				 	<CFSET a_tble_to_read = "StateGeorgiaStewart">
				 <cfelse>
				
				
					<CFIF (#pcounty# EQ "Fulton") OR (#pcounty# EQ "Cobb")  OR (#pcounty# EQ "Clayton") OR (#pcounty# EQ "Cherokee") OR (#pcounty# EQ "Dekalb") OR (#pcounty# EQ "Gwinnett") OR (#pcounty# EQ "Henry") OR (#pcounty# EQ "Douglas") OR (#pcounty# EQ "Forsyth") OR (#pcounty# EQ "Paulding") OR (#pcounty# EQ "Carroll")>
					<CFSET a_tble_to_read = "StateGeorgiaMetro">
					<CFELSE>
					<CFSET a_tble_to_read = "StateGeorgiaState">
				</CFIF>
				
				</cfif>
				
                <CFELSEIF #pstate# EQ "HI">
					<CFSET a_tble_to_read = "StateHawaii">
				<CFELSEIF #pstate# EQ "IA">
					<CFSET a_tble_to_read = "StateIowa">
				<CFELSEIF #pstate# EQ "ID">
					<CFSET a_tble_to_read = "StateIdaho">
				<CFELSEIF #pstate# EQ "IL">
					<CFSET a_tble_to_read = "StateIllinois">
				<CFELSEIF #pstate# EQ "IN">
					<CFSET a_tble_to_read = "StateIndiana">
				<CFELSEIF #pstate# EQ "KS">
					<CFSET a_tble_to_read = "StateKansas">
				<CFELSEIF #pstate# EQ "KY">
					<CFSET a_tble_to_read = "StateKentucky">
				<CFELSEIF #pstate# EQ "LA">
					<CFSET a_tble_to_read = "StateLouisianna">
				<CFELSEIF #pstate# EQ "ME">
					<CFSET a_tble_to_read = "StateMaine">
				<CFELSEIF #pstate# EQ "MD">
					<CFSET a_tble_to_read = "StateMaryland">
				<CFELSEIF #pstate# EQ "MA">
					<CFSET a_tble_to_read = "StateMassachusetts">
				<CFELSEIF #pstate# EQ "MI">
					<CFIF (#pcounty# EQ "Allegan") OR (#pcounty# EQ "Barry")  OR (#pcounty# EQ "Clinton") OR (#pcounty# EQ "Eaton") OR (#pcounty# EQ "Grand Traverse") OR (#pcounty# EQ "Ingham") OR (#pcounty# EQ "Ionia") OR (#pcounty# EQ "Kent") OR (#pcounty# EQ "Leelanau") OR (#pcounty# EQ "Montcalm") OR (#pcounty# EQ "Muskegon") OR (#pcounty# EQ "Newaygo") OR (#pcounty# EQ "Ottawa")>
					<CFSET a_tble_to_read = "StateMichiganZone2">
					<CFELSEIF #pcounty# eq "Wayne">
			        <CFSET a_tble_to_read = "StateMichiganZone3">
					<CFELSE>
					<CFSET a_tble_to_read = "StateMichiganZone1">
				</CFIF>
				<CFELSEIF #pstate# EQ "MN">
					<CFSET a_tble_to_read = "StateMinnesota">
				<CFELSEIF #pstate# EQ "MS">
					<CFSET a_tble_to_read = "StateMississipi">
				<CFELSEIF #pstate# EQ "MO">
					<CFSET a_tble_to_read = "StateMissouri">
				<CFELSEIF #pstate# EQ "NJ">
					<CFSET a_tble_to_read = "StateNewJersey">
				<CFELSEIF #pstate# EQ "NC">
					<CFSET a_tble_to_read = "StateNorthCarolina">
					<CFELSEIF #pstate# EQ "ND">
					<CFIF #comp_id# eq "729">
					<CFSET a_tble_to_read = "StateNorthDakotaStewart">
					<cfelse>
					<CFSET a_tble_to_read = "StateNorthDakota">
					</cfif>
					
				<CFELSEIF #pstate# EQ "NH">
					<CFSET a_tble_to_read = "StateNewHampshire">
				<CFELSEIF #pstate# EQ "NM">
					<CFSET a_tble_to_read = "StateNewMexico">
                <CFELSEIF #pstate# EQ "NV">
								
								 <CFIF #comp_id# eq "729">
				 
				 <CFSET a_tble_to_read = "StateNevadaStewart">
				 
				 <cfelse>
				
								
					<CFSET a_tble_to_read = "StateNevada">    
					</cfif>
				<CFELSEIF #pstate# EQ "NY">
					<CFIF (#pcounty# EQ "Albany") OR (#pcounty# EQ "Bronx")  OR (#pcounty# EQ "Columbia") OR (#pcounty# EQ "Dutchess") OR (#pcounty# EQ "Greene") OR (#pcounty# EQ "Kings") OR (#pcounty# EQ "Nassau") OR (#pcounty# EQ "New York") OR (#pcounty# EQ "Orange") OR (#pcounty# EQ "Putnam") OR (#pcounty# EQ "Queens") OR (#pcounty# EQ "Rensselaer") OR (#pcounty# EQ "Richmond") OR (#pcounty# EQ "Rockland") OR (#pcounty# EQ "Suffolk") OR (#pcounty# EQ "Sullivan") OR (#pcounty# EQ "Westchester") OR (#pcounty# EQ "Ulster")>
					<CFSET a_tble_to_read = "StateNewYorkZone2">
					<CFELSE>
					<CFSET a_tble_to_read = "StateNewYorkZone1">
				</CFIF>
				<CFELSEIF #pstate# EQ "OH">
					<CFSET a_tble_to_read = "StateOhio">
                    <CFELSEIF #pstate# EQ "OR">
					<CFSET a_tble_to_read = "StateOregon">
				<CFELSEIF #pstate# EQ "PA">
					<CFSET a_tble_to_read = "StatePennsylvania">
				<CFELSEIF #pstate# EQ "RI">
					<CFSET a_tble_to_read = "StateRhodeIsland">
				<CFELSEIF #pstate# EQ "SC">
					<CFSET a_tble_to_read = "StateSouthCarolina">
				<CFELSEIF #pstate# EQ "SD">
					<CFSET a_tble_to_read = "StateSouthDakota">
				<CFELSEIF #pstate# EQ "TN">
					<CFIF (#pcounty# EQ "Davidson")>
						<CFSET a_tble_to_read = "StateTennesseeZone1">
					<CFelseIF (#pcounty# EQ "Hamilton")>
						<CFSET a_tble_to_read = "StateTennesseeZone2">
					<CFelseIF (#pcounty# EQ "Knox")>
						<CFSET a_tble_to_read = "StateTennesseeZone3">
					<CFelseIF (#pcounty# EQ "Shelby")>
						<CFSET a_tble_to_read = "StateTennesseeZone4">
					<cfelse>
						<CFSET a_tble_to_read = "StateTennessee">
					</CFIF>
				<CFELSEIF #pstate# EQ "TX">
					<CFSET a_tble_to_read = "StateTexas">
				<CFELSEIF #pstate# EQ "UT">
					<CFSET a_tble_to_read = "StateUtah">
				<CFELSEIF #pstate# EQ "VT">
					<CFSET a_tble_to_read = "StateVermont">
				<CFELSEIF #pstate# EQ "VA">
					<CFSET a_tble_to_read = "StateVirginia">
				
				
				
				<CFELSEIF #pstate# EQ "WA">
					<CFIF (#pcounty# EQ "Douglas") OR (#pcounty# EQ "Chelan")>
					<CFSET a_tble_to_read = "StateWashingtonZone1">
					<CFELSEIF  (#pcounty# EQ "Grays Harbor")>
					<CFSET a_tble_to_read = "StateWashingtonZone2">
					<CFELSEIF  (#pcounty# EQ "Lewis")>
					<CFSET a_tble_to_read = "StateWashingtonZone3">
					<CFELSEIF  (#pcounty# EQ "Spokane")>
					<CFSET a_tble_to_read = "StateWashingtonZone4">
					<CFELSEIF  (#pcounty# EQ "King") or (#pcounty# EQ "Pierce") or (#pcounty# EQ "Snohomish")>
					<CFSET a_tble_to_read = "StateWashingtonZone5">
					<CFELSEIF  (#pcounty# EQ "Clark") or (#pcounty# EQ "Cowlitz")>
					<CFSET a_tble_to_read = "StateWashingtonZone6">
					<CFELSEIF  (#pcounty# EQ "Whitman")>
					<CFSET a_tble_to_read = "StateWashingtonZone7">
					<CFELSE>
					<CFSET a_tble_to_read = "StateWashington">
				    </CFIF>
				<CFELSEIF #pstate# EQ "WI">
					<CFSET a_tble_to_read = "StateWisconsin">
				<CFELSEIF #pstate# EQ "WV">
					<CFSET a_tble_to_read = "StateWestVirginia">
				<CFELSEIF #pstate# EQ "WY">
					<CFSET a_tble_to_read = "StateWyoming">
				</CFIF>
		
		
				
				<!--- Round up the value of the loan amount --->
					
					<!--- remove any potential decimal values --->
					<CFSET   x  = #Round(purchase)#>
					
					 <CFSET   x_len  = #Len(x)#>					
						<CFIF #x_len# EQ "3">
							<CFSET x_temp = #x# / 10>
							<CFSET   x_final  = #Round(x_temp)# * 10>	
						<CFELSEIF #x_len# EQ "4">
							<CFSET x_temp = #x# / 100>
							<CFSET   x_final  = #Round(x_temp)# * 100>						
						<CFELSEIF #x_len# EQ "5">
							<CFSET x_temp = #x# / 1000>
							<CFSET   x_final  = #Round(x_temp)# * 1000>						
						<CFELSEIF #x_len# EQ "6">
							<CFSET x_temp = #x# / 1000>
							<CFSET   x_final  = #Round(x_temp)# * 1000>						
						<CFELSEIF #x_len# EQ "7">
							<CFSET x_temp = #x# / 10000>
							<CFSET   x_final  = #Round(x_temp)# * 10000>
					<CFELSEIF #x_len# EQ "8">
							<CFSET x_temp = #x# / 100000>
							<CFSET   x_final  = #Round(x_temp)# * 100000>				
						</CFIF>


<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final# order by a_to
      </CFQUERY>
	  <cfset temp_a_1108_a = read_ins_calc.sale>















<CFIF #pstate# eq "MI" and searchType eq "Purchase">

<CFSET   x  = #Round(purchase)#>				
					 <CFSET   x_len  = #Len(x)#>					
						<CFIF #x_len# EQ "3">
							<CFSET x_temp = #x# / 10>
							<CFSET   x_final  = #Round(x_temp)# * 10>	
						<CFELSEIF #x_len# EQ "4">
							<CFSET x_temp = #x# / 100>
							<CFSET   x_final  = #Round(x_temp)# * 100>						
						<CFELSEIF #x_len# EQ "5">
							<CFSET x_temp = #x# / 1000>
							<CFSET   x_final  = #Round(x_temp)# * 1000>						
						<CFELSEIF #x_len# EQ "6">
							<CFSET x_temp = #x# / 1000>
							<CFSET   x_final  = #Round(x_temp)# * 1000>						
						<CFELSEIF #x_len# EQ "7">
							<CFSET x_temp = #x# / 10000>
							<CFSET   x_final  = #Round(x_temp)# * 10000>
					<CFELSEIF #x_len# EQ "8">
							<CFSET x_temp = #x# / 100000>
							<CFSET   x_final  = #Round(x_temp)# * 100000>
</CFIF> 

<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final# order by a_to
      </CFQUERY> 

<cfset temp_a_1109_a = read_ins_calc.sale>

<CFSET   x  = #Round(loanamt_float)#>				
					 <CFSET   x_len  = #Len(x)#>					
						<CFIF #x_len# EQ "3">
							<CFSET x_temp = #x# / 10>
							<CFSET   x_final  = #Round(x_temp)# * 10>	
						<CFELSEIF #x_len# EQ "4">
							<CFSET x_temp = #x# / 100>
							<CFSET   x_final  = #Round(x_temp)# * 100>						
						<CFELSEIF #x_len# EQ "5">
							<CFSET x_temp = #x# / 1000>
							<CFSET   x_final  = #Round(x_temp)# * 1000>						
						<CFELSEIF #x_len# EQ "6">
							<CFSET x_temp = #x# / 1000>
							<CFSET   x_final  = #Round(x_temp)# * 1000>						
						<CFELSEIF #x_len# EQ "7">
							<CFSET x_temp = #x# / 10000>
							<CFSET   x_final  = #Round(x_temp)# * 10000>
					<CFELSEIF #x_len# EQ "8">
							<CFSET x_temp = #x# / 100000>
							<CFSET   x_final  = #Round(x_temp)# * 100000>
					
						</CFIF> 


<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
      SELECT * FROM #a_tble_to_read# WHERE a_to >= #x_final# order by a_to

      </CFQUERY> 


	  <cfset temp_a_1110_a = read_ins_calc.refinance * .40>
	  

	  <cfset temp_a_1108_a = temp_a_1110_a + temp_a_1109_a>
	  
</cfif>



<!--- <CFQUERY name="update_hud" datasource="#request.dsn#">
UPDATE hud_form_title_pg2
Set a_1108_a = '#a_1108_a#',
a_1109_a = '#a_1109_a#',
a_1110_a = '#a_1110_a#'
where title_id = '#get_titleid.title_id#'
</CFQUERY> --->


<cfif a_1108_a NEQ temp_a_1108_a>
<cfset current_count = current_count + 1>
<tr>
<td align="left" valign="top">#current_count#.</td>
<td align="left" valign="top">#title_id#</td>
<td align="left" valign="top">#pstate#</td>
<td align="left" valign="top">#a_tble_to_read#</td>
<td align="left" valign="top">#a_1108_a#</td>
<td align="left" valign="top">#temp_a_1108_a#</td>
<td align="left" valign="top">#purchase#</td>
</tr>
</cfif>

<!--- <CFQUERY datasource="#request.dsn#" NAME="get_current">
UPDATE HUD_Form_Title_Pg2
set a_1108_a = #temp_a_1108_a#
WHERE  title_id  = #title_id#
</cfquery> --->

</cfoutput>
</table>




<!--- <CFQUERY datasource="#request.dsn#" NAME="get_current">
SELECT    sale, ID
FROM   StateNewYorkZone2
order by a_to
</cfquery>

<cfoutput query="get_current">
<cfset org_num = #sale#>
<cfset num = #sale#>
<cfif ListLen(num, ".") gt 1 and Len(ListGetAt(num, 2, ".")) eq 3>
<cfset num = num + (10 - Mid(num, Len(num), 1)) / 1000>
</cfif>
<br>
<CFQUERY datasource="#request.dsn#" NAME="update">
Update StateNewYorkZone2
set sale = '#num#'
where ID = #ID#
</cfquery>

On ID #ID# the system changed sale from #org_num# to #num#<br>
</cfoutput> --->