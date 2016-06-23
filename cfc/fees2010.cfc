<cfcomponent>

<!--- getBundledRates--->
<cffunction name="getBundledRates" output="false" >
<cfargument name="company_id" type="string" default="0">
<cfargument name="loan_amount" type="string" default="0">
<cfargument name="previous_loan_amount" type="string" default="0">
<cfargument name="transaction_type" type="string" default="">
<cfargument name="property_state" type="string" default="">


<!--- if this is Chase, we need to take 70% off the current title ins premium, and record this new number for future use in the code (line 1101) --->
<cfif arguments.company_id eq 3343>
<cfif a_ins_premium lt 200>
<cfset a_ins_premium = 200>
</cfif>
<cfset chase_ti = a_ins_premium>
</cfif>
<!--- end --->


<!--- if this is Axcidion, and loan is less than, they get a 40% discount, then use the resulting number to figure out 1101 --->
<cfif (arguments.company_id eq 3492 or  arguments.company_id eq 5223) and arguments.loan_amount LT 500000>
<cfset a_ins_premium = (a_ins_premium * .60)>
</cfif>

<cfif (((arguments.company_id eq 3492 or (arguments.company_id eq 5223)) and arguments.loan_amount LT 500000 and (arguments.transaction_type neq 'Purchase' and treat_as_refi eq 1)) and arguments.property_state eq 'MD')>
<cfset a_1101 = 1070 <!--- - 320 ---> - a_ins_premium>
<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1070, '_____.__'), "Buyer")>
<cfif a_1101 gt 0>
<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
<cfset total_1101 = total_1101 + a_1101>
</cfif>
</cfif>


<cfif (arguments.company_id eq 7088 and arguments.loan_amount LT 500000 and (arguments.transaction_type neq 'Purchase' and treat_as_refi eq 1) and (arguments.property_state eq 'MD' or arguments.property_state eq 'VA'))>
<cfset a_1101 = 1100 <!--- - 320 ---> - a_ins_premium>
<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1100, '_____.__'), "Buyer")>
<cfif a_1101 gt 0>
<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
<cfset total_1101 = total_1101 + a_1101>
</cfif>
</cfif>

<cfif (arguments.company_id eq 7088 and arguments.loan_amount LT 500000 and (arguments.transaction_type neq 'Purchase' and treat_as_refi eq 1) and (arguments.property_state eq 'DC'))>
<cfset a_1101 = 1350 <!--- - 320 ---> - a_ins_premium>
<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1350, '_____.__'), "Buyer")>
<cfif a_1101 gt 0>
<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
<cfset total_1101 = total_1101 + a_1101>
</cfif>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="check_company" maxrows="1">
SELECT company FROM companies where ID =  #arguments.company_id#
</CFQUERY>

<!---<cfdump var="#arguments#">
<cfabort>
--->
<!---<cfif arguments.property_zip eq '22305' and arguments.company_id eq 13124>
arguments.transaction_type = #arguments.transaction_type#<br>
treat_as_refi = #treat_as_refi#<br>
arguments.previous_loan_amount = #arguments.previous_loan_amount#<br>
<cfoutput></cfoutput>
<cfabort>
</cfif>--->

<cfif (Mid(check_company.company, 1,10) eq 'Eagle Bank' or Mid(check_company.company, 1,9) eq 'EagleBank') and (arguments.transaction_type neq 'Purchase' and treat_as_refi eq 1)  and arguments.previous_loan_amount gt 0  and arguments.previous_loan_amount neq 'NULL'>

	<cfif arguments.property_state eq 'VA'>
		<cfif arguments.loan_amount lte 200000>
			<cfset a_1101 = 950 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 1070>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(950, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 300000>
			<cfset a_1101 = 1000 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 1070>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1000, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 400000>
			<cfset a_1101 = 1100 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 1070>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1100, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 500000>
			<cfset a_1101 = 1200 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 1070>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1200, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 600000>
			<cfset a_1101 = 1300 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 1350>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1300, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 700000>
			<cfset a_1101 = 1350 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 1520>--->
		<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1350, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 800000>
			<cfset a_1101 = 1500 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 1680>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1500, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 900000>
			<cfset a_1101 = 1600 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 1850>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1600, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 1000000>
			<cfset a_1101 = 1750 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 2020>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1750, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 1100000>
			<cfset a_1101 = 1875 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 2020>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1875, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 1200000>
			<cfset a_1101 = 1955 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 2020>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1955, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 1300000>
			<cfset a_1101 = 2050 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 2020>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(2050, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 1400000>
			<cfset a_1101 = 2130 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 2020>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(2130, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 1500000>
			<cfset a_1101 = 2215 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 2020>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(2215, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		</cfif>
    <cfelseif arguments.property_state eq 'MD'>
		<cfif arguments.loan_amount lte 200000>
			<cfset a_1101 = 950 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 1070>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(950, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 300000>
			<cfset a_1101 = 1000 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 1070>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1000, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 400000>
			<cfset a_1101 = 1100 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 1070>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1100, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 500000>
			<cfset a_1101 = 1200 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 1070>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1200, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 600000>
			<cfset a_1101 = 1300 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 1350>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1300, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 700000>
			<cfset a_1101 = 1400 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 1520>--->
		<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1400, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 800000>
			<cfset a_1101 = 1500 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 1680>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1500, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 900000>
			<cfset a_1101 = 1600 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 1850>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1600, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 1000000>
			<cfset a_1101 = 1700 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 2020>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1700, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 1100000>
			<cfset a_1101 = 1800 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 2020>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1800, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 1200000>
			<cfset a_1101 = 1900 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 2020>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1900, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 1300000>
			<cfset a_1101 = 2000 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 2020>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(2000, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 1400000>
			<cfset a_1101 = 2100 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 2020>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(2100, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 1500000>
			<cfset a_1101 = 2100 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 2020>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(2100, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		</cfif>
	<cfelseif arguments.property_state eq 'DC' >
		<cfif arguments.loan_amount lte 200000>
			<cfset a_1101 = 950 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 1070>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(950, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 300000>
			<cfset a_1101 = 1000 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 1070>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1000, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 400000>
			<cfset a_1101 = 1100 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 1070>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1100, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 500000>
			<cfset a_1101 = 1300 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 1070>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1300, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 600000>
			<cfset a_1101 = 1500 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 1350>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1500, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 700000>
			<cfset a_1101 = 1700 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 1520>--->
		<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1700, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 800000>
			<cfset a_1101 = 1900 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 1680>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(1900, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 900000>
			<cfset a_1101 = 2100 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 1850>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(2100, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 1000000>
			<cfset a_1101 = 2250 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 2020>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(2250, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 1100000>
			<cfset a_1101 = 2350 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 2020>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(2350, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 1200000>
			<cfset a_1101 = 2500 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 2020>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(2500, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 1300000>
			<cfset a_1101 = 2675 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 2020>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(2675, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 1400000>
			<cfset a_1101 = 2825 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 2020>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(2825, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		<cfelseif arguments.loan_amount lte 1500000>
			<cfset a_1101 = 3000 <!--- - 320 ---> - a_ins_premium>
			<!---<cfset a_ins_premium = 2020>--->
			<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(3000, '_____.__'), "Buyer")>
			<cfif a_1101 gt 0>
			<cfset temp = AddQueryItem(0, "Settlement or Closing Fee", NumberFormat(a_1101, '_____.__'), "Buyer")>
			<cfset total_1101 = total_1101 + a_1101>
			</cfif>
		</cfif>
	</cfif>
</cfif>

</cffunction>

<!--- getSecondMortgages (and JLP) function --->
<cffunction name="getSecondMortgages" output="true">
<cfargument name="property_state" default="0">
<cfargument name="property_county" default="0">
<cfargument name="property_city" default="0">
<cfargument name="underwriter_choice" default="0">
<cfargument name="title_id" default="0">
<cfargument name="transaction_type" default="0">
<cfargument name="enhanced_coverage" default="0">
<cfargument name="company_id" default="">
<cfargument name="loan_amount" default="0">
<cfargument name="jlp_policy" default="">



<!--- now let's check if this is a Junior Loan Policy, and if so, calculate the insurance --->

<cfif arguments.transaction_type contains 'Second Mortgage' and arguments.jlp_policy eq 1 and arguments.loan_amount LTE 200000>
<CFSET   x_final  = #Ceiling(arguments.loan_amount)#>	
<CFQUERY datasource="#request.dsn#" NAME="get_table_name" maxrows="1">		
SELECT jlp_table
FROM Zip_info
where state = '#arguments.property_state#'
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
SELECT second_mortgage FROM #get_table_name.jlp_table# WHERE a_to >= #x_final# order by a_to
</CFQUERY>
<cfset a_ins_premium = read_ins_calc.second_mortgage>

<cfset temp = AddQueryItem(1104, "Title Insurance Premium - Lender's Policy", NumberFormat(Ceiling(a_ins_premium), '_____.__'), "Buyer", 1)>
<cfif a_ins_premium eq ''><cfset a_ins_premium = 0></cfif>
<cfset roll_up_1101 = roll_up_1101 + a_ins_premium>

<cfelseif arguments.transaction_type contains 'Second Mortgage' and arguments.jlp_policy neq 1>
<cfset temp = getUnderwriter(arguments.property_state, arguments.property_county, arguments.property_city, arguments.underwriter_choice, arguments.title_id, arguments.transaction_type, arguments.enhanced_coverage, arguments.company_id, arguments.loan_amount)>

<CFSET   x_final  = #Ceiling(arguments.loan_amount)#>
<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
SELECT second_mortgage FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
</CFQUERY>

<cfset a_ins_premium = read_ins_calc.second_mortgage>

<cfset temp = AddQueryItem(1104, "Title Insurance Premium - Lender's Policy", NumberFormat(Ceiling(a_ins_premium), '_____.__'), "Buyer", 1)>
<cfif a_ins_premium eq ''><cfset a_ins_premium = 0></cfif>
<cfset roll_up_1101 = roll_up_1101 + a_ins_premium>

</cfif>
</cffunction>

<!--- getTransferTaxes function --->
<cffunction name="getTransferTaxes" output="true">
<cfargument name="property_state" type="string" default="">
<cfargument name="purchase_price" type="string" default="">
<cfargument name="asset_manager" type="string" default="">
<cfargument name="property_use_type" type="string" default="">
<cfargument name="assessed_value" type="string" default="">
<cfargument name="first_time_buyer" type="string" default="">
<cfargument name="transfer_tax_paid_by" type="string" default="">
<cfargument name="company_id" type="string" default="">
</cffunction>

<!--- Texas refi's and 2nds function --->
<cffunction name="getTexasRefis2nds" output="true">
<cfargument name="property_state" type="string" default="">
<cfargument name="transaction_type" type="string" default="">
<cfargument name="previous_loan_amount" type="string" default="">
<cfargument name="loan_amount" type="string" default="">
<cfargument name="previous_loan_year" type="string" default="">
<cfargument name="previous_loan_month" type="string" default="">


<!--- texas refi's and 2nds 1109--->
<CFIF arguments.property_state eq "TX" and ((arguments.transaction_type eq "Refinance" or treat_as_refi eq 1) or arguments.transaction_type contains "Second Mortgage" or arguments.transaction_type contains "Reverse Mortgage")>




<cfset arguments.previous_loan_amount = Round(arguments.previous_loan_amount)>



<cfif arguments.previous_loan_amount LTe 100000>
<CFQUERY datasource="#request.dsn#" NAME="read_prev_ins_calc" maxrows="1">
SELECT * FROM StateTexasStewart WHERE a_to >= #arguments.previous_loan_amount# order by a_to
</CFQUERY>
<cfelseif arguments.previous_loan_amount LTe 1000000>
  <cfset leftover = arguments.previous_loan_amount - 100000>
  <cfset premium = (leftover * .00554)>
  <cfset read_prev_ins_calc.sale = premium + 875>
  <!---<cfset read_prev_ins_calc.sale = Round(read_prev_ins_calc.sale)>--->
<cfelseif arguments.previous_loan_amount LTe 5000000>
  <cfset leftover = arguments.previous_loan_amount - 1000000>
  <cfset premium = (leftover * .00456)>
  <cfset read_prev_ins_calc.sale = premium + 5861>
  <!---<cfset read_prev_ins_calc.sale = Round(read_prev_ins_calc.sale)>--->
<cfelseif arguments.previous_loan_amount LTe 15000000>
  <cfset leftover = arguments.previous_loan_amount - 5000000>
  <cfset premium = (leftover * .00376)>
  <cfset read_prev_ins_calc.sale = premium + 24101>
  <!---<cfset read_prev_ins_calc.sale = Round(read_prev_ins_calc.sale)>--->
</cfif>



<cfif arguments.loan_amount LTe 100000>
<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
SELECT * FROM StateTexasStewart WHERE a_to >= #arguments.loan_amount# order by a_to 
</CFQUERY>

<cfelseif arguments.loan_amount LTe 1000000>
  <cfset leftover = arguments.loan_amount - 100000>
  <cfset premium = (leftover * .00554)>
  <cfset read_ins_calc.sale = premium + 875>
  <!---<cfset read_ins_calc.sale = Round(read_ins_calc.sale)>--->
<cfelseif arguments.loan_amount LTe 5000000>
  <cfset leftover = arguments.loan_amount - 1000000>
  <cfset premium = (leftover * .00456)>
  <cfset read_ins_calc.sale = premium + 5861>
  <!---<cfset read_ins_calc.sale = Round(read_ins_calc.sale)>--->
<cfelseif arguments.loan_amount LTe 15000000>
  <cfset leftover = arguments.loan_amount - 5000000>
  <cfset premium = (leftover * .00376)>
  <cfset read_ins_calc.sale = premium + 24101>
  <!---<cfset read_ins_calc.sale = Round(read_ins_calc.sale)>--->
</cfif>



<CFSET pre_r8_credit = #read_ins_calc.sale#>



<cfset NumYears = 0>
<cftry>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
<cfcatch>
<cfset NumYears = 0>
</cfcatch>
</cftry>


<cfswitch expression="#NumYears#">
<cfcase value="6">
<CFSET a_ins_premium = Round(read_ins_calc.sale) - (read_prev_ins_calc.sale * .15)>
</cfcase>
<cfcase value="5">
<CFSET a_ins_premium = Round(read_ins_calc.sale) - (read_prev_ins_calc.sale * .20)>
</cfcase>
<cfcase value="4">
<CFSET a_ins_premium = Round(read_ins_calc.sale) - (read_prev_ins_calc.sale * .25)>
</cfcase>
<cfcase value="3">
<CFSET a_ins_premium = Round(read_ins_calc.sale) - (read_prev_ins_calc.sale * .30)>
</cfcase>
<cfcase value="2">
<CFSET a_ins_premium = Round(read_ins_calc.sale) - (read_prev_ins_calc.sale * .35)>
</cfcase>
<cfcase value="1">
<CFSET a_ins_premium = Round(read_ins_calc.sale) - (read_prev_ins_calc.sale * .40)>
</cfcase>
<cfcase value="0">
<CFSET a_ins_premium = Round(read_ins_calc.sale) - (Round(read_prev_ins_calc.sale) * .40)>
</cfcase>
<cfdefaultcase>
<CFSET a_ins_premium = Round(read_ins_calc.sale)>
</cfdefaultcase>
</cfswitch>
</cfif>




<cfif a_ins_premium neq ''>
<cfset a_ins_premium = Round(a_ins_premium)>
</cfif>


</cffunction>

<!--- Construction Loans function --->
<cffunction name="getConstructionLoans" output="true">
<cfargument name="ADD_OR_REMOVE" type="string" default="">
<cfargument name="ADD_OR_REMOVE_NUM" type="string" default="">
<cfargument name="APPRAISED_VALUE" type="string" default="">
<cfargument name="ASSESSED_VALUE" type="string" default="">
<cfargument name="ASSET_MANAGER" type="string" default="">
<cfargument name="BORROWER_OWNS" type="string" default="">
<cfargument name="BUYER_PAID_LENDER_POLICY" type="string" default="">
<cfargument name="BUYER_PAID_OWNER_POLICY" type="string" default="">
<cfargument name="CEMA" type="string" default="">
<cfargument name="CLOSING_TYPE" type="string" default="">
<cfargument name="COMPANY_ID" type="string" default="">
<cfargument name="CONSTRUCTION_DRAWS" type="string" default="">
<cfargument name="CURRENT_DEED_NUM" type="string" default="">
<cfargument name="DELINQUENCY" type="string" default="">
<cfargument name="ENCOMPASS" type="string" default="">
<cfargument name="ENHANCED_COVERAGE" type="string" default="">
<cfargument name="FIRST_TIME_BUYER" type="string" default="">
<cfargument name="INSURED" type="string" default="">
<cfargument name="JLP_POLICY" type="string" default="">
<cfargument name="LOAN_AMOUNT" type="string" default="">
<cfargument name="NEW_DEED" type="string" default="">
<cfargument name="NON_SPOUSES_ADDED" type="string" default="">
<cfargument name="NON_SPOUSES_REMOVED" type="string" default="">
<cfargument name="OPT_ALTA_4" type="string" default="">
<cfargument name="OPT_ALTA_4_1" type="string" default="">
<cfargument name="OPT_ALTA_5" type="string" default="">
<cfargument name="OPT_ALTA_5_1" type="string" default="">
<cfargument name="OPT_ALTA_6" type="string" default="">
<cfargument name="OPT_ALTA_6_1" type="string" default="">
<cfargument name="OPT_ALTA_6_2" type="string" default="">
<cfargument name="OPT_ALTA_7" type="string" default="">
<cfargument name="OPT_ALTA_8_1" type="string" default="">
<cfargument name="OPT_ALTA_9" type="string" default="">
<cfargument name="OPT_SD_4" type="string" default="">
<cfargument name="OPT_SD_5" type="string" default="">
<cfargument name="OPT_SD_6" type="string" default="">
<cfargument name="OPT_SD_7" type="string" default="">
<cfargument name="OPT_SD_8" type="string" default="">
<cfargument name="OPT_SD_9" type="string" default="">
<cfargument name="OPT_SD_BALLOON" type="string" default="">
<cfargument name="OPT_SD_COMP" type="string" default="">
<cfargument name="OPT_SD_CREDIT" type="string" default="">
<cfargument name="OPT_TX_1" type="string" default="">
<cfargument name="OPT_TX_10" type="string" default="">
<cfargument name="OPT_TX_11" type="string" default="">
<cfargument name="OPT_TX_12" type="string" default="">
<cfargument name="OPT_TX_13" type="string" default="">
<cfargument name="OPT_TX_14" type="string" default="">
<cfargument name="OPT_TX_2" type="string" default="">
<cfargument name="OPT_TX_3" type="string" default="">
<cfargument name="OPT_TX_4" type="string" default="">
<cfargument name="OPT_TX_5" type="string" default="">
<cfargument name="OPT_TX_6" type="string" default="">
<cfargument name="OPT_TX_7" type="string" default="">
<cfargument name="OPT_TX_8" type="string" default="">
<cfargument name="OPT_TX_9" type="string" default="">
<cfargument name="OPT_UT_4" type="string" default="">
<cfargument name="OPT_UT_41" type="string" default="">
<cfargument name="OPT_UT_5" type="string" default="">
<cfargument name="OPT_UT_51" type="string" default="">
<cfargument name="OPT_UT_6" type="string" default="">
<cfargument name="OPT_UT_61" type="string" default="">
<cfargument name="OPT_UT_62" type="string" default="">
<cfargument name="OPT_UT_81" type="string" default="">
<cfargument name="OPT_UT_9" type="string" default="">
<cfargument name="PREVIOUS_LOAN_AMOUNT" type="string" default="">
<cfargument name="PREVIOUS_LOAN_MONTH" type="string" default="">
<cfargument name="PREVIOUS_LOAN_YEAR" type="string" default="">
<cfargument name="PREVIOUS_PURCH_AMOUNT" type="string" default="">
<cfargument name="PREVIOUS_PURCH_MONTH" type="string" default="">
<cfargument name="PREVIOUS_PURCH_YEAR" type="string" default="">
<cfargument name="end_loan_original_loan_amount" type="string" default="">
<cfargument name="PROPERTY_CITY" type="string" default="">
<cfargument name="PROPERTY_COUNTY" type="string" default="">
<cfargument name="PROPERTY_REPORT" type="string" default="">
<cfargument name="PROPERTY_STATE" type="string" default="">
<cfargument name="PROPERTY_USE_TYPE" type="string" default="">
<cfargument name="PURCHASE_PRICE" type="string" default="">
<cfargument name="REISSUE_RATES" type="string" default="">
<cfargument name="RETURN_DATA" type="string" default="">
<cfargument name="SAME_LENDER" type="string" default="">
<cfargument name="SELLER_PAID_LENDER_POLICY" type="string" default="">
<cfargument name="SELLER_PAID_OWNER_POLICY" type="string" default="">
<cfargument name="SPOUSES_ADDED" type="string" default="">
<cfargument name="SPOUSES_REMOVED" type="string" default="">
<cfargument name="TITLE_ID" type="string" default="">
<cfargument name="TRANSACTION_TYPE" type="string" default="">
<cfargument name="TRANSFER_TAX_PAID_BY" type="string" default="">
<cfargument name="UNDERWRITER_CHOICE" type="string" default="">

<!--- get current 1101 --->
<cfloop query="fees_query">
<cfif fees_query.line_number eq '1101'>
<cfset roll_up_1101 = fees_query.amount>
</cfif>
</cfloop>

<cfif arguments.property_state eq 'MD' or arguments.property_state eq 'VA'>
 	<cfif treat_as_refi eq 1>
	<cfif arguments.loan_amount gt arguments.previous_loan_amount>
	<cfset new_money = arguments.loan_amount - arguments.previous_loan_amount>
	<cfset hazard_ins = new_money / 1000>
	</cfif>
	</cfif>
	<cfif treat_as_purchase eq 1>
	<cfif arguments.loan_amount gt arguments.purchase_price>
	<cfset new_money = arguments.loan_amount - arguments.purchase_price>
	<cfset hazard_ins = new_money / 1000>
	</cfif>
	</cfif>
    <cfif IsDefined("hazard_ins")>
	<cfset temp = AddQueryItem(1114, 'Hazard Risk Premium', NumberFormat(hazard_ins, '_____.__'), "Buyer", 1)>
	<cfset roll_up_1101 = roll_up_1101 + hazard_ins>
    </cfif>
</cfif>

<cfset current_row = 0>
<cfloop query="fees_query">
<cfset current_row = current_row + 1>
<cfif fees_query.description contains 'Per Draw' or fees_query.description contains 'Construction Draws'>
<cfset draw_amount = fees_query.amount * arguments.CONSTRUCTION_DRAWS>
<cfset temp = QuerySetCell(fees_query, "Description", "#fees_query.Description# - #arguments.CONSTRUCTION_DRAWS# @ $#fees_query.amount# ea.", current_row)>
<cfset temp = QuerySetCell(fees_query, "Amount", "#draw_amount#", current_row)>
<cfif fees_query.outside eq 1>
	<cfset roll_up_1101 = roll_up_1101 + draw_amount - fees_query.amount>
</cfif>
</cfif>
</cfloop>



<!--- now replace 1101 with the new 1101 --->
<cfset current_row = 0>
<cfloop query="fees_query">
<cfset current_row = current_row + 1>
<cfif fees_query.line_number eq '1101'>
<cfset temp = QuerySetCell(fees_query, "Amount", "#roll_up_1101#", current_row)>
</cfif>
</cfloop>



<cfquery dbtype="query" name="fee_detail"> 
SELECT *
FROM fees_query
order by line_number
</cfquery>



</cffunction>

<!--- getModRate function --->
<cffunction name="getModRate" output="true">
<cfargument name="loan_amount"  type="string" default="">
<cfargument name="property_state"  type="string" default="">

<cfif arguments.property_state eq 'MD'>
		<CFQUERY datasource="#request.dsn#" NAME="get_new_rate">
		select *
		from #get_table.table_to_use#
		where a_to >= #arguments.loan_amount#
		order by a_to
		</CFQUERY>
		<cfset mod_rate = get_new_rate.modrates>
        <cfif mod_rate LT 55>
		<cfset mod_rate = 55>
		</cfif>
<cfelseif arguments.property_state eq 'VA'>
		<CFQUERY datasource="#request.dsn#" NAME="get_new_rate">
		select *
		from #get_table.table_to_use#
		where a_to >= #arguments.loan_amount#
		order by a_to
		</CFQUERY>
		<cfset mod_rate = get_new_rate.refinance * .30>
<cfelseif arguments.property_state eq 'PA'>
		<CFQUERY datasource="#request.dsn#" NAME="get_new_rate">
		select *
		from #get_table.table_to_use#
		where a_to >= #arguments.loan_amount#
		order by a_to
		</CFQUERY>
		<cfif NumYears LTE 5>
		<cfset mod_rate = get_new_rate.refinance * .50>
		<cfelseif NumYears LTE 10>
		<cfset mod_rate = get_new_rate.refinance * .70>
		<cfelse>
		<cfset mod_rate = get_new_rate.refinance>
		</cfif>

<cfelseif arguments.property_state eq 'ND'>
		<CFQUERY datasource="#request.dsn#" NAME="get_new_rate">
		select *
		from #get_table.table_to_use#
		where a_to >= #arguments.loan_amount#
		order by a_to
		</CFQUERY>
		<cfif NumYears GTE 3>
         <cfif arguments.loan_amount LTE 50000>
         <cfset mod_rate =  arguments.loan_amount * .001>
         <cfelseif arguments.loan_amount LTE 100000>
         <cfset mod_rate =  (50000 * .001) + ((arguments.loan_amount - 50000) * .0004)>
         <cfelseif arguments.loan_amount LTE 500000>
         <cfset mod_rate =  (50000 * .001) + (100000 * .0004)+((arguments.loan_amount - 150000) * .00025)>
         <cfelseif arguments.loan_amount LTE 5000000>
         <cfset mod_rate =  (50000 * .001) + (100000 * .0004) + (500000 * .00025)+((arguments.loan_amount - 650000) * .00025)>
         <cfset mod_rate =  210 + ((arguments.loan_amount - 400000) * .00010)>
         </cfif>
        <cfif mod_rate LT 50>
		<cfset mod_rate = 50>
		</cfif>
        <cfelse>
		<cfset mod_rate = 10>
		</cfif>

</cfif>
<cfreturn mod_rate>
</cffunction>

<!--- getAgencySplits function --->
<cffunction name="getAgencySplits" output="true">
<cfargument name="ADD_OR_REMOVE"  type="string" default="">
<cfargument name="ADD_OR_REMOVE_NUM"  type="string" default="">
<cfargument name="APPRAISED_VALUE"  type="string" default="">
<cfargument name="ASSESSED_VALUE"  type="string" default="">
<cfargument name="ASSET_MANAGER"  type="string" default="">
<cfargument name="BORROWER_OWNS"  type="string" default="">
<cfargument name="BUYER_PAID_LENDER_POLICY"  type="string" default="">
<cfargument name="BUYER_PAID_OWNER_POLICY"  type="string" default="">
<cfargument name="CEMA"  type="string" default="">
<cfargument name="CLOSING_TYPE"  type="string" default="">
<cfargument name="COMPANY_ID"  type="string" default="">
<cfargument name="CONSTRUCTION_DRAWS"  type="string" default="">
<cfargument name="CURRENT_DEED_NUM"  type="string" default="">
<cfargument name="DELINQUENCY"  type="string" default="">
<cfargument name="ENCOMPASS"  type="string" default="">
<cfargument name="ENHANCED_COVERAGE"  type="string" default="">
<cfargument name="FIRST_TIME_BUYER"  type="string" default="">
<cfargument name="INSURED"  type="string" default="">
<cfargument name="JLP_POLICY"  type="string" default="">
<cfargument name="LOAN_AMOUNT"  type="string" default="">
<cfargument name="NEW_DEED"  type="string" default="">
<cfargument name="NON_SPOUSES_ADDED"  type="string" default="">
<cfargument name="NON_SPOUSES_REMOVED"  type="string" default="">
<cfargument name="OPT_ALTA_4"  type="string" default="">
<cfargument name="OPT_ALTA_4_1"  type="string" default="">
<cfargument name="OPT_ALTA_5"  type="string" default="">
<cfargument name="OPT_ALTA_5_1"  type="string" default="">
<cfargument name="OPT_ALTA_6"  type="string" default="">
<cfargument name="OPT_ALTA_6_1"  type="string" default="">
<cfargument name="OPT_ALTA_6_2"  type="string" default="">
<cfargument name="OPT_ALTA_7"  type="string" default="">
<cfargument name="OPT_ALTA_8_1"  type="string" default="">
<cfargument name="OPT_ALTA_9"  type="string" default="">
<cfargument name="OPT_SD_4"  type="string" default="">
<cfargument name="OPT_SD_5"  type="string" default="">
<cfargument name="OPT_SD_6"  type="string" default="">
<cfargument name="OPT_SD_7"  type="string" default="">
<cfargument name="OPT_SD_8"  type="string" default="">
<cfargument name="OPT_SD_9"  type="string" default="">
<cfargument name="OPT_SD_BALLOON"  type="string" default="">
<cfargument name="OPT_SD_COMP"  type="string" default="">
<cfargument name="OPT_SD_CREDIT"  type="string" default="">
<cfargument name="OPT_TX_1"  type="string" default="">
<cfargument name="OPT_TX_10"  type="string" default="">
<cfargument name="OPT_TX_11"  type="string" default="">
<cfargument name="OPT_TX_12"  type="string" default="">
<cfargument name="OPT_TX_13"  type="string" default="">
<cfargument name="OPT_TX_14"  type="string" default="">
<cfargument name="OPT_TX_2"  type="string" default="">
<cfargument name="OPT_TX_3"  type="string" default="">
<cfargument name="OPT_TX_4"  type="string" default="">
<cfargument name="OPT_TX_5"  type="string" default="">
<cfargument name="OPT_TX_6"  type="string" default="">
<cfargument name="OPT_TX_7"  type="string" default="">
<cfargument name="OPT_TX_8"  type="string" default="">
<cfargument name="OPT_TX_9"  type="string" default="">
<cfargument name="OPT_UT_4"  type="string" default="">
<cfargument name="OPT_UT_41"  type="string" default="">
<cfargument name="OPT_UT_5"  type="string" default="">
<cfargument name="OPT_UT_51"  type="string" default="">
<cfargument name="OPT_UT_6"  type="string" default="">
<cfargument name="OPT_UT_61"  type="string" default="">
<cfargument name="OPT_UT_62"  type="string" default="">
<cfargument name="OPT_UT_81"  type="string" default="">
<cfargument name="OPT_UT_9"  type="string" default="">
<cfargument name="PREVIOUS_LOAN_AMOUNT"  type="string" default="">
<cfargument name="PREVIOUS_LOAN_MONTH"  type="string" default="">
<cfargument name="PREVIOUS_LOAN_YEAR"  type="string" default="">
<cfargument name="PREVIOUS_PURCH_AMOUNT"  type="string" default="">
<cfargument name="PREVIOUS_PURCH_MONTH"  type="string" default="">
<cfargument name="PREVIOUS_PURCH_YEAR"  type="string" default="">
<cfargument name="end_loan_original_loan_amount"  type="string" default="">
<cfargument name="PROPERTY_CITY"  type="string" default="">
<cfargument name="PROPERTY_COUNTY"  type="string" default="">
<cfargument name="PROPERTY_REPORT"  type="string" default="">
<cfargument name="PROPERTY_STATE"  type="string" default="">
<cfargument name="PROPERTY_USE_TYPE"  type="string" default="">
<cfargument name="PURCHASE_PRICE"  type="string" default="">
<cfargument name="REISSUE_RATES"  type="string" default="">
<cfargument name="RETURN_DATA"  type="string" default="">
<cfargument name="SAME_LENDER"  type="string" default="">
<cfargument name="SELLER_PAID_LENDER_POLICY"  type="string" default="">
<cfargument name="SELLER_PAID_OWNER_POLICY"  type="string" default="">
<cfargument name="SPOUSES_ADDED"  type="string" default="">
<cfargument name="SPOUSES_REMOVED"  type="string" default="">
<cfargument name="TITLE_ID"  type="string" default="">
<cfargument name="TRANSACTION_TYPE"  type="string" default="">
<cfargument name="TRANSFER_TAX_PAID_BY"  type="string" default="">
<cfargument name="UNDERWRITER_CHOICE"  type="string" default="">


<!--- get splits --->
<cfquery dbtype="query" name="fee_detail"> 
SELECT *
FROM fees_query
order by line_number
</cfquery>


<cfloop query="fee_detail">
<cfif fee_detail.line_number eq 1103>
<cfset owners_premium = fee_detail.amount>
</cfif>
<cfif fee_detail.line_number eq 1104>
<cfset row_num = fee_detail.currentrow>
<cfset pre_alta_lenders_premium = fee_detail.amount>
<cfif IsNumeric(fee_detail.amount)>
<cfset lenders_premium = fee_detail.amount + total_alta>
<cfelse>
<cfset lenders_premium = "Call for Quote!">
</cfif>
<cfif IsNumeric(fee_detail.amount)>
<cfset temp = QuerySetCell(fee_detail, "Amount", lenders_premium, row_num)>
<cfelse>
<cfset temp = QuerySetCell(fee_detail, "Amount", total_alta, row_num)>
</cfif>
<cfset temp = AddQueryItem(999, "Lender's Title Insurance Pre-Alta", pre_alta_lenders_premium, "Buyer", 0, "")>
</cfif>
</cfloop>


<cfparam name="owners_premium" default=0>
<cfparam name="lenders_premium" default=0>


<cfif lenders_premium neq 'Call for Quote!' and owners_premium neq 'Call For Quote!'>

<cfset agency_portion = 0>
<cfset ft_portion = 0>

<cfset total_combined_policies = ReplaceNoCase(lenders_premium, " ", "", "ALL")>

<cftry>
<cfset total_combined_policies = ReplaceNoCase(lenders_premium, " ", "", "ALL") + ReplaceNoCase(owners_premium, " ", "", "ALL")>
<cfcatch type="any"></cfcatch></cftry>




<!--- Missouri uses its own tables for figuring out the splits between underwriter and agency --->
<cfif arguments.property_state eq 'XXXX'> <!--- changed this to XXXX so it would not run on MO --->
<cfset agency_portion = 0>
	<cfif arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1>
	<CFSET   x_final  = #Ceiling(arguments.purchase_price)#>
	<cfelse>
	<CFSET   x_final  = #Ceiling(arguments.loan_amount)#>
	</cfif>

<CFQUERY datasource="#request.dsn#" NAME="get_split_rate" maxrows="1">
SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
</CFQUERY>
<cfif arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1>
 <cfset agency_portion = get_split_rate.owners_risk_rate>
<cfelse>
	<cfif arguments.reissue_rates eq 1><!--- if this is a reissue --->
	<cfset agency_portion = get_split_rate.reissue_risk_rate>
	<cfelseif get_all_comp_info.allow_subrates eq 1 and arguments.same_lender eq 1><!--- if this is a sub_rate --->
	<cfset agency_portion = get_split_rate.reissue_risk_rate>
	<cfelse>
	<cfset agency_portion = get_split_rate.loan_risk_rate>
	</cfif>
</cfif>

<cfset ft_portion = total_combined_policies - agency_portion>


<cfelse> <!--- not MO --->

<CFQUERY datasource="#request.dsn#" NAME="read_Title_Companies_States" maxrows="1">		
SELECT *
FROM Title_Companies_States s, title_companies t
where s.st_abbrev = '#arguments.property_state#'
and s.title_co_id = t.title_co_id
</CFQUERY>

<cfif IsDefined("exceptions.recordcount") and exceptions.recordcount GTE 1>
<cfset read_title_companies_states.title_co_id = exceptions.title_co_id>
<cfset arguments.underwriter_choice = exceptions.title_co_id>
</cfif>


<cfif request.which_bulk_rate_used eq 'Natic'>
<cfset read_title_companies_states.title_co_id = 30>
<cfelseif request.which_bulk_rate_used neq 'none'>
<cfset read_title_companies_states.title_co_id = 16>
</cfif>




<cfif arguments.property_state eq 'TX' and ((arguments.transaction_type eq 'Refinance' or arguments.transaction_type eq 'Reverse Mortgage') or treat_as_refi eq 1)>
<cfset total_combined_policies = a_ins_premium>
</cfif>



<CFQUERY datasource="#request.dsn#" NAME="get_split">
	Select * from FT_Agency_Splits where agency_id = #read_title_companies_states.title_co_id# and state = '#arguments.property_state#'
</CFQUERY>
	<cfif get_split.recordcount>
	 <cfif get_split.fee_per_thousand neq 'NULL' and get_split.fee_per_thousand neq ''>
	 <cfif arguments.purchase_price gt arguments.loan_amount>
	 <cfset agency_portion = ((arguments.purchase_price/1000) * get_split.fee_per_thousand)>
	 <cfelse>
	 <cfset agency_portion = ((arguments.loan_amount/1000) * get_split.fee_per_thousand)>
	 </cfif>
	 <cfset ft_portion = total_combined_policies - agency_portion>
	 <cfelse>
	 <cfset agency_portion = total_combined_policies * (get_split.agency_percent/100)>
	 <cfset ft_portion = total_combined_policies * (get_split.ft_percent/100)>
	 </cfif>
	 
	 
	<cfelse>

<CFQUERY datasource="#request.dsn#" NAME="get_split">
	Select * from FT_Agency_Splits where agency_id = #read_title_companies_states.title_co_id# and state = 'default'
</CFQUERY>
     <cfif get_split.fee_per_thousand neq 'NULL' and get_split.fee_per_thousand neq ''>
	 <cfset agency_portion = ((arguments.loan_amount/1000) * get_split.fee_per_thousand)>
	 <cfset ft_portion = total_combined_policies - agency_portion>
	 <cfelse>
	 <cfset agency_portion = total_combined_policies * (get_split.agency_percent/100)>
	 <cfset ft_portion = total_combined_policies * (get_split.ft_percent/100)>
	 </cfif>
	</cfif>
</cfif>


<cfif request.which_bulk_rate_used eq 'Natic' or request.which_bulk_rate_used eq 'Stewart'>
<cfset ft_portion = new_fee_amount * (70/100)>
<cfset agency_portion = new_fee_amount * (30/100)>
</cfif>


<cfif request.which_bulk_rate_used eq 'Chicago Rates' or request.which_bulk_rate_used eq 'Chicago Local Rates'>
<cfset ft_portion = lenders_title_insurance * (70/100)>
<cfset agency_portion = lenders_title_insurance * (30/100)>
</cfif>



<CFQUERY datasource="#request.dsn#" NAME="read_agency">
		SELECT title_ft_agency_name
		FROM  Company_Agency_Assoc_HUD2010
		WHERE billing_id = '#read_this_sets_billing_states.billing_id#'	
</CFQUERY>	



<cfif arguments.property_state eq 'IA'>
<cfquery dbtype="query" name="get_1104"> 
SELECT *
FROM fees_query
where (line_number = 1104)
order by line_number
</cfquery>
<cfquery dbtype="query" name="get_1101"> 
SELECT *
FROM fees_query
where (line_number = 1101)
order by line_number
</cfquery>
<cfset new_1101 = get_1101.amount - get_1104.amount>

<cfif arguments.loan_amount gt 500000>
<cfset new_1101 = new_1101>
<cfset new_1104 = 'Call for Quote!'>
<cfelse>

<cfif (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1) or arguments.transaction_type eq 'Reverse Mortgage' or arguments.transaction_type eq 'Second Mortgage'>
<cfset new_1101 = new_1101 + 90>
<cfset new_1104 = 90>
<cfelse>
<cfset new_1101 = new_1101 + 110>
<cfset new_1104 = 110>
</cfif>

</cfif>


<cfoutput query="fees_query" >
<cfif fees_query.line_number eq 1101>
<cfif IsNumeric(new_1101)>
<cfset temp = QuerySetCell(fees_query, "Amount", new_1101, fees_query.currentRow)>
<cfelse>
<cfset temp = QuerySetCell(fees_query, "Amount", 0, fees_query.currentRow)>
</cfif>
</cfif>
<cfif fees_query.line_number eq 1104>
<cfif IsNumeric(new_1104)>
<cfset temp = QuerySetCell(fees_query, "Amount", new_1104, fees_query.currentRow)>
<cfelse>
<cfset temp = QuerySetCell(fees_query, "Amount", 0, fees_query.currentRow)>
</cfif>
</cfif>
</cfoutput>

<cfquery dbtype="query" name="fee_detail"> 
SELECT *
FROM fees_query
order by line_number
</cfquery>


<cfset ft_portion = new_1104>
</cfif>





<cfif ft_portion neq 0>
<cfif arguments.property_state eq 'CA'>
<!---<cfif is_natic eq 1>
<cfset temp = AddQueryItem(1107, "Agent's portion of the total title insurance premium to North American Title - (" & DollarFormat(ft_portion) & ")", NumberFormat(ft_portion, '_____.__'), "Buyer", 1, "North American Title")>
<cfelse>
--->
<cfset temp = AddQueryItem(1107, "Agent's portion of the total title insurance premium to Placer Title - (" & DollarFormat(ft_portion) & ")", NumberFormat(ft_portion, '_____.__'), "Buyer", 1, "Placer Title")>
<!---</cfif>--->

<cfelseif arguments.property_state eq 'TX'>
<CFQUERY datasource="#request.dsn#" NAME="get_comp_name">
		SELECT company
		FROM  Companies
		WHERE id = #arguments.company_id#
</CFQUERY>	

<cfif get_comp_name.company contains 'REMN' or get_comp_name.company contains 'Finance My Home'>
<cfset temp = AddQueryItem(1107, "Agent's portion of the total title insurance premium to Allegiance Title Company - (" & DollarFormat(ft_portion) & ")", NumberFormat(ft_portion, '_____.__'), "Buyer", 1, "Allegiance Title Company")>
<cfelse>
<cfset temp = AddQueryItem(1107, "Agent's portion of the total title insurance premium to Title & Escrow of Texas, Inc - (" & DollarFormat(ft_portion) & ")", NumberFormat(ft_portion, '_____.__'), "Buyer", 1, "Title & Escrow of Texas, Inc")>

</cfif>

<cfelseif arguments.property_state eq 'CT'>
<!--- don't send this line cost --->
<cfelseif arguments.property_state eq 'AR'>
<cfset temp = AddQueryItem(1107, "Agent's portion of the total title insurance premium to Capstone Pioneer Settlement Services - (" & DollarFormat(ft_portion) & ")", NumberFormat(ft_portion, '_____.__'), "Buyer", 1, "Capstone Pioneer Settlement Services")>
<cfelseif arguments.property_state eq 'UT'>
<cfset temp = AddQueryItem(1107, "Agent's portion of the total title insurance premium to Cottonwood Title Insurance Agency, Inc. - (" & DollarFormat(ft_portion) & ")", NumberFormat(ft_portion, '_____.__'), "Buyer", 1, "Cottonwood Title Insurance Agency, Inc.")>
<cfelseif arguments.property_state eq 'NV'>
<cfset temp = AddQueryItem(1107, "Agent's portion of the total title insurance premium to Placer Title Company - (" & DollarFormat(ft_portion) & ")", NumberFormat(ft_portion, '_____.__'), "Buyer", 1, "Placer Title Company")>
<cfelseif arguments.property_state eq 'IA'>
<cfif IsNumeric(ft_portion)>
<cfset temp = AddQueryItem(1107, "Agent's portion of the total title insurance premium to Gomez May LLP - (" & DollarFormat(ft_portion) & ")", NumberFormat(ft_portion, '_____.__'), "Buyer", 1, "Gomez May LLP")>
<cfelse>
<cfset temp = AddQueryItem(1107, "Agent's portion of the total title insurance premium to Gomez May LLP - ('Call for Quote!')", 0, "Buyer", 1, "Gomez May LLP")>
</cfif>

<cfelse>
<cfset temp = AddQueryItem(1107, "Agent's portion of the total title insurance premium to #title_co_name# - (" & DollarFormat(ft_portion) & ")", NumberFormat(ft_portion, '_____.__'), "Buyer", 1, title_co_name)>
</cfif>

 </cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_Title_Companies" maxrows="1">		
SELECT *
FROM  title_companies t
where t.title_co_id = #arguments.underwriter_choice#
</CFQUERY>


<cfif request.which_bulk_rate_used eq 'Natic'>
<cfset read_Title_Companies.company = 'North American Title'>
<cfelseif request.which_bulk_rate_used eq 'Stewart' or request.which_bulk_rate_used eq 'Chicago Rates'  or request.which_bulk_rate_used eq 'Chicago Local Rates' >
<cfset read_Title_Companies.company = 'Stewart Title'>
</cfif>

<cfif property_state eq 'NM'>
<cfset read_Title_Companies.company = 'Stewart Title'>
</cfif>

<cfif agency_portion neq 0>
<cfif property_state eq 'CT'>

<cfset temp = AddQueryItem(1108, "Underwriter's portion of the total title insurance premium to #read_Title_Companies.company# - (" & DollarFormat((agency_portion + ft_portion)) & ")", NumberFormat((agency_portion + ft_portion), '_____.__'), "Buyer", 1, read_Title_Companies.company)>
<cfelseif property_state eq 'TX'>
<cfset temp = AddQueryItem(1108, "Underwriter's portion of the total title insurance premium to Title Underwriter - (" & DollarFormat(agency_portion) & ")", NumberFormat(agency_portion, '_____.__'), "Buyer", 1, "Title Underwriter")>
<cfelseif property_state eq 'CA'>
<cfset temp = AddQueryItem(1108, "Underwriter's portion of the total title insurance premium to Title Underwriter - (" & DollarFormat(agency_portion) & ")", NumberFormat(agency_portion, '_____.__'), "Buyer", 1, "Title Underwriter")>
<cfelse>
<cfset temp = AddQueryItem(1108, "Underwriter's portion of the total title insurance premium to #read_Title_Companies.company# - (" & DollarFormat(agency_portion) & ")", NumberFormat(agency_portion, '_____.__'), "Buyer", 1, read_Title_Companies.company)>
</cfif>

</cfif>		
</cfif>





<cfloop query="fees_query">
<cfif fees_query.line_number eq 1104>
<cfset row_num = fees_query.currentrow>
<cfif IsNumeric(fee_detail.amount)>
<cfset lenders_premium = fee_detail.amount + total_alta>
</cfif>
<cfif IsNumeric(fee_detail.amount)>
<cfset temp = QuerySetCell(fee_detail, "Amount", lenders_premium, row_num)>
<cfelse>
<cfset temp = QuerySetCell(fee_detail, "Amount", "Call for Quote!", row_num)>
</cfif>
</cfif>
</cfloop>
<!--- end get splits --->
</cffunction>

<!--- getSimulRate function --->
<cffunction name="getSimulRate" output="true">
<cfargument name="property_state" type="string"default="">
<cfargument name="property_county" type="string"default="">
<cfargument name="purchase_price" type="string"default="0">
<cfargument name="loan_amount" type="string"default="0">
<cfargument name="underwriter_choice" default="">
<cfargument name="enhanced_coverage" default="0">
<cfargument name="company_id" default="0">



<cftry>
<CFQUERY datasource="#request.dsn#" NAME="check_for_simul" maxrows="1">
	SELECT * FROM #get_table.table_to_use# order by a_to
</CFQUERY>
<cfif IsNumeric(check_for_simul.simul_rate) and check_for_simul.simul_rate neq 'NULL' and check_for_simul.simul_rate neq 0>
<cfset simul_rate = check_for_simul.simul_rate>
</cfif>
<cfcatch type="any"></cfcatch></cftry>


<!--- these states use a formula to determine the simul_rate --->
<cfif  arguments.property_state eq 'CA' and arguments.underwriter_choice eq 30>
<CFSET   x_final  = #Ceiling(arguments.purchase_price)#>
<CFQUERY datasource="#request.dsn#" NAME="read_owners_simul" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
	<cftry>
	<cfset full_owners_simul = read_owners_simul.sale + read_owners_simul.refinance>
	<cfcatch type="any">
	</cfcatch>
	</cftry>
	<cftry>
    <cfset simul_rate = (full_owners_simul - read_owners_simul.sale)>
	<cfcatch type="any">
    <cfset simul_rate = 0>
	</cfcatch>
	</cftry>
	


<cfelseif  arguments.property_state eq 'AR'>
<CFSET   x_final  = #Ceiling(arguments.purchase_price)#>
<CFQUERY datasource="#request.dsn#" NAME="read_owners_simul" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
	<cfset full_owners_simul = read_owners_simul.simul_rate>
    <cfset simul_rate = (read_owners_simul.simul_rate - read_owners_simul.sale)>

<cfelseif arguments.property_state eq 'CO'  and arguments.underwriter_choice eq 16>
<CFSET   x_final  = #Ceiling(arguments.purchase_price)#>
<CFSET   x_final2  = #Ceiling(arguments.loan_amount)#>
<CFQUERY datasource="#request.dsn#" NAME="read_owners_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
			<cfif arguments.property_county eq 'Adams'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 125)>
			<cfelseif arguments.property_county eq 'Arapahoe'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 125)>
			<cfelseif arguments.property_county eq 'Boulder'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 140)>
			<cfelseif arguments.property_county eq 'Broomfield'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 125)>
			<cfelseif arguments.property_county eq 'Chaffee'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 75)>
			<cfelseif arguments.property_county eq 'Clear Creek'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 120)>
			<cfelseif arguments.property_county eq 'Custer'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 85)>
			<cfelseif arguments.property_county eq 'Denver'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 125)>
			<cfelseif arguments.property_county eq 'Dolores'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 60)>
			<cfelseif arguments.property_county eq 'Douglas'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 125)>
			<cfelseif arguments.property_county eq 'Eagle'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 150)>
			<cfelseif arguments.property_county eq 'El Paso'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 125)>
			<cfelseif arguments.property_county eq 'Elbert'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 120)>
			<cfelseif arguments.property_county eq 'Fremont'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 85)>
			<cfelseif arguments.property_county eq 'Garfield'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 85)>
			<cfelseif arguments.property_county eq 'Grand'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 170)>
			<cfelseif arguments.property_county eq 'Huerfano'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 75)>
			<cfelseif arguments.property_county eq 'Jackson'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 140)>
			<cfelseif arguments.property_county eq 'Jefferson'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 125)>
			<cfelseif arguments.property_county eq 'Kiowa'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 60)>
			<cfelseif arguments.property_county eq 'La Plata'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 120)>
			<cfelseif arguments.property_county eq 'Larimer'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 140)>
			<cfelseif arguments.property_county eq 'Mesa'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 100)>
			<cfelseif arguments.property_county eq 'Moffat'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 75)>
			<cfelseif arguments.property_county eq 'Montezuma'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 60)>
			<cfelseif arguments.property_county eq 'Montrose'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 60)>
			<cfelseif arguments.property_county eq 'Ouray'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 75)>
			<cfelseif arguments.property_county eq 'Phillips'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 75)>
			<cfelseif arguments.property_county eq 'Pitkin'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 100)>
			<cfelseif arguments.property_county eq 'Pueblo'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 100)>
			<cfelseif arguments.property_county eq 'Rio Blanco'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 75)>
			<cfelseif arguments.property_county eq 'Routt'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 150)>
			<cfelseif arguments.property_county eq 'San Miguel'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 130)>
			<cfelseif arguments.property_county eq 'Sedgwick'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 75)>
			<cfelseif arguments.property_county eq 'Summit'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 120)>
			<cfelseif arguments.property_county eq 'Washington'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 125)>
			<cfelseif arguments.property_county eq 'Weld'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 140)>
			<cfelseif arguments.property_county eq 'Yuma'>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 125)>
			<cfelse>
			<cfset full_owners_simul = (read_owners_ins_calc.sale + 100)>
			</cfif>



<cfelseif arguments.property_state eq 'CO'  and arguments.underwriter_choice eq 30>
<CFSET   x_final  = #Ceiling(arguments.purchase_price)#>
<CFSET   x_final2  = #Ceiling(arguments.loan_amount)#>
<CFQUERY datasource="#request.dsn#" NAME="read_owners_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
    <cfset full_owners_simul = (read_owners_ins_calc.sale + 150)>




<cfelseif arguments.property_state eq 'ID'>
<CFSET   x_final  = #Ceiling(arguments.purchase_price)#>
<CFQUERY datasource="#request.dsn#" NAME="read_owners_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
	<cfif x_final LTE 500000>
	<cfset simul_rate = 75>
	<cfelse>
	<cfset simul_rate = (read_owners_ins_calc.sale * .10) >
	<cfif simul_rate LT 75>
	<cfset simul_rate = 75>
	</cfif>
	</cfif>
    <cfset full_owners_simul = read_ins_calc.sale + simul_rate>

<cfelseif arguments.property_state eq 'GA'>
	<CFSET   x_final  = #Ceiling(arguments.loan_amount)#>
		<CFQUERY datasource="#request.dsn#" NAME="read_lenders_ins_calc" maxrows="1">
		SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
		</CFQUERY>
	<CFSET   x_final  = #Ceiling(arguments.purchase_price)#>
		<CFQUERY datasource="#request.dsn#" NAME="read_owners_ins_calc" maxrows="1">
		SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
		</CFQUERY>
	<cfif read_lenders_ins_calc.refinance LTE read_owners_ins_calc.sale>
		<cfset full_owners_simul =  read_owners_ins_calc.sale - read_lenders_ins_calc.refinance + 100>
	<cfelse>
		<cfset full_owners_simul = 100>
	</cfif>


<cfelseif arguments.property_state eq 'NY'>
<CFSET   x_final  = #Ceiling(arguments.loan_amount)#>
<CFQUERY datasource="#request.dsn#" NAME="read_owners_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
	<cfset simul_rate = (read_owners_ins_calc.refinance * .30) >
    <cfset full_owners_simul = read_ins_calc.sale + simul_rate>

<cfelseif arguments.property_state eq 'NC'>
<CFSET   x_final  = #Ceiling(arguments.loan_amount)#>
<CFQUERY datasource="#request.dsn#" NAME="read_lenders_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
<CFSET   x_final  = #Ceiling(arguments.purchase_price)#>
<CFQUERY datasource="#request.dsn#" NAME="read_owners_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
	<cfset simul_rate = 25>
	<cfif read_lenders_ins_calc.refinance GT read_owners_ins_calc.sale>
	<cfset full_owners_simul = read_lenders_ins_calc.refinance + simul_rate>
	<cfelse>
	<cfset full_owners_simul = read_owners_ins_calc.sale + simul_rate>
	</cfif>


<cfelseif arguments.property_state eq 'NV'>
<CFSET   x_final  = #Ceiling(arguments.loan_amount)#>
<CFQUERY datasource="#request.dsn#" NAME="read_owners_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
	<cfset simul_rate = (read_owners_ins_calc.simul_rate) >
		<cfif arguments.property_state eq 'NV'>
		<cfset simul_rate = (read_owners_ins_calc.sale * .5) >
		</cfif>
    <cfset full_owners_simul = read_ins_calc.sale + simul_rate>


<cfelseif arguments.property_state eq 'ND'>
<CFSET   x_final  = #Ceiling(arguments.loan_amount)#>
<CFQUERY datasource="#request.dsn#" NAME="read_lenders_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
    <cfset simul_rate = (read_lenders_ins_calc.sale * .30) >
    <cfset full_owners_simul = read_ins_calc.sale + simul_rate>




<cfelseif arguments.property_state eq 'PA'>
<CFSET   x_final  = #Ceiling(arguments.loan_amount)#>
<CFQUERY datasource="#request.dsn#" NAME="read_lenders_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
	
<CFSET   x_final  = #Ceiling(arguments.purchase_price)#>
<CFQUERY datasource="#request.dsn#" NAME="read_owners_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
	<cfif read_lenders_ins_calc.refinance GT read_owners_ins_calc.sale>
	<cfset full_owners_simul = read_lenders_ins_calc.refinance>
	<cfelse>
	<cfset full_owners_simul = read_owners_ins_calc.sale>
	</cfif>
    <cfif arguments.enhanced_coverage eq 1>
	<cfif read_lenders_ins_calc.enhanced_lenders GT read_owners_ins_calc.enhanced_owners>
	<cfset full_owners_simul = read_lenders_ins_calc.enhanced_lenders>


	<cfelse>
	<cfset full_owners_simul = read_owners_ins_calc.enhanced_owners>
	</cfif>
	</cfif>




<cfelseif arguments.property_state eq 'SD'>
<CFSET   x_final  = #Ceiling(arguments.loan_amount)#>
<CFQUERY datasource="#request.dsn#" NAME="read_owners_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
	<cftry>
	<cfset simul_rate = (read_owners_ins_calc.simul_rate) >
	<cfcatch type="any">
	</cfcatch>
	</cftry>
	<cftry>
    <cfset full_owners_simul = read_ins_calc.sale + simul_rate>
	<cfcatch type="any">
    <cfset simul_rate = 0>
	</cfcatch>
	</cftry>


<cfelseif arguments.property_state eq 'UT'>
<CFSET   x_final  = #Ceiling(arguments.loan_amount)#>
<CFQUERY datasource="#request.dsn#" NAME="read_lenders_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>

	<cftry>
    <cfset simul_rate = (read_lenders_ins_calc.sale * .20) >
	<cfcatch type="any">
	</cfcatch>
	</cftry>
	<cftry>
    <cfset full_owners_simul = read_ins_calc.sale + simul_rate>
	<cfcatch type="any">
    <cfset simul_rate = 0>
	</cfcatch>
	</cftry>

<cfelseif arguments.property_state eq 'WI' and arguments.underwriter_choice eq 16>
		<cfset simul_rate = 250>
		<cfset full_owners_simul = read_ins_calc.sale + simul_rate>

<cfelseif arguments.property_state eq 'WI' and arguments.underwriter_choice eq 30>
		<cfset simul_rate = 300>
		<cfset full_owners_simul = read_ins_calc.sale + simul_rate>

<cfelseif arguments.property_state eq 'WI'>
		<CFSET   x_final  = #Ceiling(arguments.loan_amount)#>
		
		<cfif x_final GTE 1000000>
		<cfset simul_rate = 800>
		<cfelseif x_final GTE 400000>
		<cfset simul_rate = 650>
		<cfelseif x_final GTE 300000>
		<cfset simul_rate = 500>
		<cfelseif x_final GTE 250000>
		<cfset simul_rate = 400>
		<cfelseif x_final GTE 15000>
		<cfset simul_rate = 250>
		<cfelse>
		<cfset simul_rate = 150>
		</cfif>
		<cfset full_owners_simul = read_ins_calc.sale + simul_rate>

<cfelseif arguments.property_state eq 'MI' and arguments.loan_amount gt 0  and arguments.underwriter_choice neq 25>
 <CFSET   x_final  = #Ceiling(arguments.loan_amount)#>
	<cfif arguments.loan_amount gt 0>
	<CFQUERY datasource="#request.dsn#" NAME="read_lenders_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
	</cfif>
	<cfset simul_rate = read_lenders_ins_calc.refinance * .8>
	<cfif simul_rate LT 175>
	<cfset simul_rate = 175>
	</cfif>

<cfset full_owners_simul = read_ins_calc.sale + simul_rate>

<cfelseif arguments.property_state eq 'MI' and arguments.loan_amount gt 0  and arguments.underwriter_choice eq 25>
 <CFSET   x_final  = #Ceiling(arguments.purchase_price)#>
	<cfif arguments.loan_amount gt 0>
	<CFQUERY datasource="#request.dsn#" NAME="read_owners_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
	<cfset simul_rate = read_owners_ins_calc.simul_rate>
    <cfset full_owners_simul = read_owners_ins_calc.sale + simul_rate>
    <cfelse>
    <cfset full_owners_simul = read_owners_ins_calc.sale>
	</cfif>
<cfelse>
<cfset full_owners_simul = read_ins_calc.sale>
</cfif>

<cfset seller_paid_owners = 0>
<cfset owners_amount = 0>
<cfset seller_paid_lenders = 0>
<cfset buyer_paid_owners = 0>
<cfset buyer_paid_lenders = 0>
<!--- these states use the simul_rate listed in their rate table --->
<cfif arguments.property_state eq 'MD' or arguments.property_state eq 'AL' or arguments.property_state eq 'AK'  or arguments.property_state eq 'CT' or arguments.property_state eq 'DE' or arguments.property_state eq 'DC' or arguments.property_state eq 'FL' or arguments.property_state eq 'HI' or arguments.property_state eq 'IL' or arguments.property_state eq 'IN' or arguments.property_state eq 'KS' or arguments.property_state eq 'AZ' or arguments.property_state eq 'LA' or arguments.property_state eq 'MA' or arguments.property_state eq 'ME' or arguments.property_state eq 'MS' or arguments.property_state eq 'MO' or arguments.property_state eq 'MT' or arguments.property_state eq 'NE' or arguments.property_state eq 'NH' or arguments.property_state eq 'NM' or arguments.property_state eq 'OH' or arguments.property_state eq 'OK' or arguments.property_state eq 'OR' or arguments.property_state eq 'RI' or arguments.property_state eq 'SC' or arguments.property_state eq 'VA' or arguments.property_state eq 'WV' or arguments.property_state eq 'TN' or arguments.property_state eq 'MN' or arguments.property_state eq 'KY' or arguments.property_state eq 'NC'>

<cfif IsNumeric(read_ins_calc.sale)>

<cfif arguments.property_state eq 'MD' and arguments.enhanced_coverage eq 1 and arguments.underwriter_choice eq 25>
<cfset full_owners_simul = read_ins_calc.enhanced_owners + simul_rate>
<cfelseif arguments.loan_amount neq 0>
<cfset full_owners_simul = read_ins_calc.sale + simul_rate>


</cfif>
<cfelse>
<cfset full_owners_simul = read_ins_calc.sale>
</cfif>




<cfif arguments.loan_amount GT arguments.purchase_price>
<CFSET   x_final  = #Ceiling(arguments.loan_amount-arguments.purchase_price)#>
	<CFQUERY datasource="#request.dsn#" NAME="read_lenders_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>

<cfif property_state eq 'AL' or property_state eq 'DC'> 
<cfset full_owners_simul = full_owners_simul + (read_lenders_ins_calc.sale * .30)>
</cfif>
<cfif property_state eq 'AK'> 
<cfset full_owners_simul = full_owners_simul + (read_lenders_ins_calc.sale * .80)>
</cfif>
<cfif property_state eq 'MA'> 
<cfset full_owners_simul = full_owners_simul + (read_lenders_ins_calc.refinance)>
</cfif>
<cfif property_state eq 'LA'> 
<cfset full_owners_simul = full_owners_simul + (read_lenders_ins_calc.refinance)>
</cfif>
</cfif>
<cfelse>

<!--- if not one of the that uses the simul_rate in the table, and not one that use a formula above, then the simul_rate is coded into the table as part of the "sale" field --->
 <cfif arguments.property_state neq 'MD' and arguments.property_state neq 'AL' and arguments.property_state neq 'AK' and arguments.property_state neq 'CO' and arguments.property_state neq 'CT' and arguments.property_state neq 'DE' and arguments.property_state neq 'DC' and arguments.property_state neq 'FL' and arguments.property_state neq 'GA' and arguments.property_state neq 'HI' and arguments.property_state neq 'IL' and arguments.property_state neq 'IN' and arguments.property_state neq 'KS' and arguments.property_state neq 'AZ' and arguments.property_state neq 'LA' and arguments.property_state neq 'MA' and arguments.property_state neq 'ME' and arguments.property_state neq 'MI' and arguments.property_state neq 'MS' and arguments.property_state neq 'MO' and arguments.property_state neq 'MT' and arguments.property_state neq 'NE' and arguments.property_state neq 'NH' and arguments.property_state neq 'NM' and arguments.property_state neq 'OH' and arguments.property_state neq 'OK' and arguments.property_state neq 'OR' and arguments.property_state neq 'RI' and arguments.property_state neq 'SC' and arguments.property_state neq 'VA' and arguments.property_state neq 'WV' and arguments.property_state neq 'TN' and arguments.property_state neq 'MN' and arguments.property_state neq 'KY' and arguments.property_state neq 'WI' and arguments.property_state neq 'NC'>
	<cfset full_owners_simul = read_ins_calc.sale>
 </cfif>
</cfif>

<!---<cfif session.ft_user_id eq 248>
full_owners_simul = #full_owners_simul#
<cfabort>
</cfif>--->
</cffunction>

<!--- checkNatic function --->
<cffunction name="checkNatic" output="true">
<cfargument name="property_state" type="string"default="">
<cfargument name="property_county" type="string"default="">

<cfparam name="underwriter_choice" default="16">
<cfif arguments.property_state eq 'CA'>
<CFQUERY datasource="#request.dsn#" NAME="check_natic" maxrows="1">		
SELECT *
FROM Zip_info
where state = '#arguments.property_state#' and county = '#arguments.property_county#' and rate_table_natic = 'StateCaliforniaNatic'
</CFQUERY>

<cfif check_natic.recordcount gte 1>
<cfset underwriter_choice = 30>
<cfset arguments.underwriter_choice = 30>
<cfset underwriter_table = "rate_table_natic">
<cfset underwriter_name = "North American Title">
<cfset is_natic = 1>
</cfif>
</cfif>

<cfreturn underwriter_choice>
</cffunction>

<!--- getNaticRefiCA function --->
<cffunction name="getNaticRefiCA" output="true">
<cfargument name="property_state" type="string"default="">

<cfargument name="transaction_type" type="string"default="">
<cfargument name="is_natic" type="string"default="0">
<cfargument name="loan_amount" type="string"default="0">

<cfif arguments.property_state eq 'CA' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1) and arguments.is_natic eq 1>
			<cfif arguments.loan_amount lte 50000>
			<cfset a_ins_premium = 385>
			<cfelseif arguments.loan_amount lte 75000>
			<cfset a_ins_premium =  385>
			<cfelseif arguments.loan_amount lte 100000>
			<cfset a_ins_premium =  385>
			<cfelseif arguments.loan_amount lte 250000>
			<cfset a_ins_premium =  385>
			<cfelseif arguments.loan_amount lte 450000>
			<cfset a_ins_premium =  605>
			<cfelseif arguments.loan_amount lte 650000>
			<cfset a_ins_premium =  935>
			<cfelseif arguments.loan_amount lte 850000>
			<cfset a_ins_premium =  1210>
			<cfelseif arguments.loan_amount lte 1000000>
			<cfset a_ins_premium =  1430>
			<cfelseif arguments.loan_amount lte 1500000>
			<cfset a_ins_premium =  1760>
			<cfelseif arguments.loan_amount lte 2000000>
			<cfset a_ins_premium =  2200>
			<cfelseif arguments.loan_amount lte 3000000>
			<cfset a_ins_premium =  2800>
			<cfelseif arguments.loan_amount lte 4000000>
			<cfset a_ins_premium =  3400>
			<cfelseif arguments.loan_amount lte 5000000>
			<cfset a_ins_premium =  4100>
			<cfelseif arguments.loan_amount lte 6000000>
			<cfset a_ins_premium =  4700>
			<cfelseif arguments.loan_amount lte 7000000>
			<cfset a_ins_premium =  5300>
			<cfelseif arguments.loan_amount lte 8000000>
			<cfset a_ins_premium =  5900>
			<cfelseif arguments.loan_amount lte 9000000>
			<cfset a_ins_premium =  6600>
			<cfelseif arguments.loan_amount lte 10000000>
			<cfset a_ins_premium =  7200>
			</cfif>
</cfif>
</cffunction>

<!--- getIndianaSpecialRates function --->
<cffunction name="getIndianaSpecialRates" output="true">
<cfargument name="company_id" type="string"default="0">
<cfargument name="transaction_type" type="string"default="">
<cfargument name="property_state" type="string"default="">
<cfargument name="loan_amount" type="string"default="0">
<cfargument name="title_id" type="string"default="">
<cfparam name="underwriter_name" default="">

<cfset x_final = arguments.loan_amount>

<CFQUERY datasource="#request.dsn#" NAME="get_rates" maxrows="1">
		SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
		</CFQUERY>
		
<cfif (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1) and arguments.property_state eq 'IN' and (arguments.company_id eq 7393
or arguments.company_id eq 7402)>

<cfif arguments.loan_amount LTE 250000>
<cfset new_fee_amount = get_rates.refinance * .7>
<cfelseif arguments.loan_amount LTE 500000>
<cfset new_fee_amount = 550>
<cfelse>
<cfset new_fee_amount = get_rates.refinance * .6>
</cfif>


<cfloop query="fees_query">
			<cfif fees_query.line_number eq 1104>
			<cfset old_fee_amount = fees_query.amount>
			<cfset temp = QuerySetCell(fees_query, "amount", new_fee_amount, fees_query.currentRow)>
			</cfif>
			</cfloop>
<cfset roll_up_1101 = (roll_up_1101 - old_fee_amount) + new_fee_amount>
<cfif arguments.title_id neq ''>
<!--- update the file that it got the bulk rate --->
			<CFQUERY datasource="#request.dsn#" NAME="update_bulk_rate">		
			update title
			set bulk_rate_applied = 1
			where title_id = '#arguments.title_id#'
			</CFQUERY>
</cfif>

</cfif>
</cffunction>

<!--- getBulkRates function --->
<cffunction name="getBulkRates" output="true">
<cfargument name="company_id" type="string"default="0">
<cfargument name="transaction_type" type="string"default="">
<cfargument name="property_state" type="string"default="">
<cfargument name="loan_amount" type="string"default="0">
<cfargument name="title_id" type="string"default="">

<cfparam name="underwriter_name" default="">

<cfif arguments.loan_amount LTE 1500000>


<cfset request.natic_bulk_rates_used = 0>
<!--- NATIC Rates ( underwriter_name contains 'North American' and ) --->
<cfif underwriter_name contains 'North American' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1)>
<!--- check if client is activated have bulk rates in this state, and in this tier --->
	<cfif arguments.loan_amount LTE 1500000>
				<cfif arguments.loan_amount GTE 1250001>
				<cfset this_tier = 'tier_1500000'>
				<cfelseif arguments.loan_amount GTE 1000001>
				<cfset this_tier = 'tier_1250000'>
				<cfelseif arguments.loan_amount GTE 750001>
				<cfset this_tier = 'tier_1000000'>
				<cfelseif arguments.loan_amount GTE 500001>
				<cfset this_tier = 'tier_750000'>
				<cfelseif arguments.loan_amount GTE 250001>
				<cfset this_tier = 'tier_500000'>
				<cfelseif arguments.loan_amount GTE 175001>
				<cfset this_tier = 'tier_250000'>
				<cfelseif arguments.loan_amount GTE 100001>
				<cfset this_tier = 'tier_175000'>
				<cfelse>
				<cfset this_tier = 'tier_100000'>
				</cfif>
		<CFQUERY datasource="#request.dsn#" NAME="bulk_rate_authorized" maxrows="1">		
		SELECT *
		FROM Client_Bulk_Rates_Natic
		where comp_id = #arguments.company_id#
		and #this_tier# = 'True'
		and (state = '#arguments.property_state#' or state = 'All')
		</CFQUERY>

		<cfif bulk_rate_authorized.recordcount>
		<cfset bulk_rates_allowed = 1>
			<CFQUERY datasource="#request.dsn#" NAME="get_bulk_rate" maxrows="1">		
			SELECT #this_tier# as this_rate
			FROM Bulk_Rates_Natic
			where state = '#arguments.property_state#'
			</CFQUERY>

<cfif get_bulk_rate.recordcount GTE 1 and get_bulk_rate.this_rate neq 'NULL' and get_bulk_rate.this_rate neq ''>
<cfset new_fee_amount = get_bulk_rate.this_rate>

			<cfloop query="fees_query">
			<cfif fees_query.line_number eq 1104>
			<cfset old_fee_amount = fees_query.amount>
			<cfset temp = QuerySetCell(fees_query, "amount", new_fee_amount, fees_query.currentRow)>
			</cfif>
			</cfloop>
<cfparam name="old_fee_amount" default="0">
<cfset roll_up_1101 = (roll_up_1101 - old_fee_amount) + new_fee_amount>
<cfset request.natic_bulk_rates_used = 1>
<cfset request.which_bulk_rate_used = 'Natic'>
<cfset underwriter_name = "North American Title">
<cfset arguments.underwriter_choice = 30>
<cfif arguments.title_id neq ''>
<!--- update the file that it got the bulk rate --->
			<CFQUERY datasource="#request.dsn#" NAME="update_bulk_rate">		
			update title
			set bulk_rate_applied_natic = 1
			where title_id = '#arguments.title_id#'
			</CFQUERY>
</cfif>
<cfelse>
			<CFQUERY datasource="#request.dsn#" NAME="update_bulk_rate">		
			update title
			set bulk_rate_applied_natic = 0
			where title_id = '#arguments.title_id#'
			</CFQUERY>

            <cfloop query="fees_query">
			<cfif fees_query.line_number eq 1104>
			<cfset new_fee_amount = fees_query.amount>
			<cfset temp = QuerySetCell(fees_query, "amount", new_fee_amount, fees_query.currentRow)>
			</cfif>
			</cfloop>


	</cfif>
		</cfif>	
		
	</cfif>
</cfif>
<!--- end NATIC --->


<cfif request.natic_bulk_rates_used eq 0>

<!--- Stewart Bulk Rates (underwriter_name contains 'Stewart Title' and ) --->
<cfset stewart_bulk_rates_used = 0>

<cfif underwriter_name contains 'Stewart Title' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1)>
<!--- check if client is activated have bulk rates in this state, and in this tier --->
	<cfif arguments.loan_amount LTE 1500000>
				<cfif arguments.loan_amount GTE 1250001>
				<cfset this_tier = 'tier_1500000'>
				<cfelseif arguments.loan_amount GTE 1000001>
				<cfset this_tier = 'tier_1250000'>
				<cfelseif arguments.loan_amount GTE 750001>
				<cfset this_tier = 'tier_1000000'>
				<cfelseif arguments.loan_amount GTE 500001>
				<cfset this_tier = 'tier_750000'>
				<cfelseif arguments.loan_amount GTE 250001>
				<cfset this_tier = 'tier_500000'>
				<cfelseif arguments.loan_amount GTE 175001>
				<cfset this_tier = 'tier_250000'>
				<cfelseif arguments.loan_amount GTE 100001>
				<cfset this_tier = 'tier_175000'>
				<cfelse>
				<cfset this_tier = 'tier_100000'>
				</cfif>
		<CFQUERY datasource="#request.dsn#" NAME="bulk_rate_authorized" maxrows="1">		
		SELECT *
		FROM Client_Bulk_Rates
		where comp_id = #arguments.company_id#
		and #this_tier# = 'True'
		and (state = '#arguments.property_state#' or state = 'All')
		</CFQUERY>
	
    

		<cfif bulk_rate_authorized.recordcount>
		<cfset bulk_rates_allowed = 1>
			<CFQUERY datasource="#request.dsn#" NAME="get_bulk_rate" maxrows="1">		
			SELECT #this_tier# as this_rate
			FROM Bulk_Rates_Stewart
			where state = '#arguments.property_state#'
			</CFQUERY>
<cfif get_bulk_rate.recordcount GTE 1 and get_bulk_rate.this_rate neq 'NULL' and get_bulk_rate.this_rate neq ''>
<cfset new_fee_amount = get_bulk_rate.this_rate>

			<cfloop query="fees_query">
			<cfif fees_query.line_number eq 1104>
			<cfset old_fee_amount = fees_query.amount>
			<cfset temp = QuerySetCell(fees_query, "amount", new_fee_amount, fees_query.currentRow)>
			</cfif>
			</cfloop>
<cfset roll_up_1101 = (roll_up_1101 - old_fee_amount) + new_fee_amount>
<cfset stewart_bulk_rates_used = 1>
<cfset request.which_bulk_rate_used = 'Stewart'>
<cfset underwriter_name = "Stewart Title">
<cfset arguments.underwriter_choice = 16>
<cfif arguments.title_id neq ''>
<!--- update the file that it got the bulk rate --->
			<CFQUERY datasource="#request.dsn#" NAME="update_bulk_rate">		
			update title
			set bulk_rate_applied = 1
			where title_id = '#arguments.title_id#'
			</CFQUERY>
</cfif>
<cfelse>
			<CFQUERY datasource="#request.dsn#" NAME="update_bulk_rate">		
			update title
			set bulk_rate_applied = 0
			where title_id = '#arguments.title_id#'
			</CFQUERY>

            <cfloop query="fees_query">
			<cfif fees_query.line_number eq 1104>
			<cfset new_fee_amount = fees_query.amount>
			<cfset temp = QuerySetCell(fees_query, "amount", new_fee_amount, fees_query.currentRow)>
			</cfif>
			</cfloop>


	</cfif>
		</cfif>	
		
	</cfif>
</cfif>
</cfif>
<!--- end Stewart --->


</cfif>

</cffunction>

<!--- getChicagoRates function --->
<cffunction name="getChicagoRates" output="true">
<cfargument name="company_id" type="string"default="0">
<cfargument name="transaction_type" type="string"default="">
<cfargument name="property_state" type="string"default="">
<cfargument name="loan_amount" type="string"default="0">
<cfset request.chicago_bulk_rates_used = 0>


<cfif ((arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1) and arguments.property_state eq 'IL' and get_comp_info.allow_chicago_rates eq True and arguments.loan_amount LTE 500000)>
<cfset chicago_rates_allowed = 1>
<!--- these are for Chicago Bucket rates --->
<cfset lenders_title_insurance = 275>
<cfset signing_fee = 125>
<cfset closing_services = 150>
<cfset closing_protection_letter = 75>
<!--- end these are for Chicago Bucket rates --->

			<cfloop query="fees_query">
			<cfif fees_query.line_number eq 1104>
			<cfset old_fee_amount = fees_query.amount>
			<cftry>
			<cfset temp = QuerySetCell(fees_query, "Amount", lenders_title_insurance, fees_query.currentRow)>
			<cfcatch type="any">
			</cfcatch>
			</cftry>
			</cfif>
			</cfloop>

<cfset request.which_bulk_rate_used = 'Chicago Rates'>
<cfset roll_up_1101 = (roll_up_1101 - old_fee_amount) + lenders_title_insurance>
<cfset request.chicago_bulk_rates_used = 1>
</cfif>
</cffunction>

<!--- getChicagoRates2 function --->
<cffunction name="getChicagoRates2" output="true">
<cfargument name="company_id" type="string"default="0">
<cfargument name="transaction_type" type="string"default="">
<cfargument name="property_state" type="string"default="">
<cfargument name="property_county" type="string"default="">
<cfargument name="loan_amount" type="string"default="0">
<cfset request.chicago2_bulk_rates_used = 0>


<cfif arguments.loan_amount LTE 500000 and ((arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1) and arguments.property_state eq 'IL' and get_comp_info.allow_chicago_rates2 eq True and  (arguments.property_county eq 'Cook' or arguments.property_county eq 'Lake' or arguments.property_county eq 'McHenry' or arguments.property_county eq 'DuPage' or arguments.property_county eq 'Will' or arguments.property_county eq 'Kane' or arguments.property_county eq 'DeKalb' or arguments.property_county eq 'Kendall'))>


<!--- these are for Chicago Bucket rates --->
<cfset lenders_title_insurance = 250>
<cfset illinois_fee = 3>
<cfset closing_services = 225>
<cfset closing_protection_letter = 75>
<!--- end these are for Chicago Bucket rates --->


<cfset chicago_rates_allowed2 = 1>
<cfset underwriter_name = 'Stewart Title'>
<cfif arguments.loan_amount GT 500000>
<cfset lenders_title_insurance = lenders_title_insurance + ((arguments.loan_amount - 500000) * .001)>
</cfif>
<cfloop query="fees_query">

			<cfif fees_query.line_number eq 1104>
			<cfset old_fee_amount = fees_query.amount>
			<cftry>
			<cfset temp = QuerySetCell(fees_query, "Amount", lenders_title_insurance, fees_query.currentRow)>
			<cfcatch type="any">
			</cfcatch>
			</cftry>
			</cfif>
			</cfloop>

<cfset request.which_bulk_rate_used = 'Chicago Local Rates'>
<cfset roll_up_1101 = (roll_up_1101 - old_fee_amount) + lenders_title_insurance>
<cfset request.chicago2_bulk_rates_used = 1>
</cfif>

</cffunction>

<!--- getUnderwriter function --->
<cffunction name="getUnderwriter" output="true">
<cfargument name="property_state" type="string" default="">
<cfargument name="property_county" type="string" default="">
<cfargument name="property_city" type="string" default="">
<cfargument name="underwriter_choice"  default="0">
<cfargument name="title_id"  default="">
<cfargument name="transaction_type" type="string"default="">
<cfargument name="enhanced_coverage" type="string" default="0">
<cfargument name="company_id" type="string" default="">
<cfargument name="loan_amount" type="string" default="">

<CFQUERY datasource="#request.dsn#" NAME="get_all_comp_info">
SELECT * FROM Companies where ID = #trim(arguments.company_id)#
</CFQUERY>

<!--- get rate table --->
<CFQUERY datasource="#request.dsn#" NAME="read_Title_Companies_States" maxrows="1">		
SELECT *
FROM Title_Companies_States s, title_companies t
where s.st_abbrev = '#arguments.property_state#'
and s.title_co_id = t.title_co_id
</CFQUERY>

<cfset read_title_companies_states.title_co_id = 16>
<cfset underwriter_table = "rate_table_stewart">
<cfset underwriter_name = "Stewart Title Guaranty Company">

<!--- this part makes sure all streamline clients are put on Stewart until changed, also update order_verify_title.cfm line 1016 --->
<cfif arguments.title_id neq ''>
<CFQUERY datasource="#request.dsn#" NAME="read_underwriter" maxrows="1">		
SELECT *
FROM Doc_title_insurance_title
where title_id = #arguments.title_id#
</CFQUERY>
<cfset read_title_companies_states.title_co_id = #read_underwriter.insurance_co#>
<cfelse>


<cfif get_all_comp_info.streamline_client eq 'True' and (arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1)>
<cfset read_title_companies_states.title_co_id = 25>
<cfelseif get_all_comp_info.streamline_client eq 'True' and (arguments.transaction_type neq 'Purchase' and treat_as_refi eq 1)>
<cfset read_title_companies_states.title_co_id = 25>
</cfif>

</cfif>

<cfif Mid(get_all_comp_info.company,1,10) eq 'First Home'>
<cfset read_title_companies_states.title_co_id = 29>
</cfif>


<!--- this part checks to see if the client has an exception in the Underwriter_Default_Exceptions table, that determines their preferred underwriter for this state --->
<CFQUERY datasource="#request.dsn#" NAME="exceptions" maxrows="1">		
SELECT *
FROM Underwriter_Default_Exceptions
where comp_id = #arguments.company_id# 
and state = '#arguments.property_state#'
</CFQUERY>

<cfif exceptions.recordcount GTE 1>
<cfset read_title_companies_states.title_co_id = exceptions.title_co_id>
<cfset arguments.underwriter_choice = exceptions.title_co_id>

   <!--- if a title_id is sent along with this call, let's update it, too, just to make sure --->
   <cfif arguments.title_id neq ''>
		<CFQUERY datasource="#request.dsn#" NAME="find_rec" maxrows="1">		
		SELECT *
		FROM doc_title_Insurance_Title
		where title_id = #arguments.title_id# 
		</CFQUERY>
		<cfif find_rec.recordcount eq 0>
			<CFQUERY datasource="#request.dsn#" NAME="insert_rec">		
			insert into doc_title_Insurance_Title (title_id)
			values (#arguments.title_id#) 
			</CFQUERY>
		</cfif>
			<CFQUERY datasource="#request.dsn#" NAME="update_rec">		
			update doc_title_Insurance_Title
			set insurance_co =  #exceptions.title_co_id#
			where title_id = #arguments.title_id# 
			</CFQUERY>
	</cfif>
   <!--- if a title_id is sent along with this call, let's update it, too, just to make sure --->
</cfif>
<!--- END this part checks to see if the client has an exception in the Underwriter_Default_Exceptions table, that determines their preferred underwriter for this state --->


<!--- this will check to see if they have bulkrates set up for another underwriter, and if they do, will switch to that underwriter --->
	<cfif arguments.loan_amount LTE 1500000>
				<cfif arguments.loan_amount GTE 1250001>
				<cfset this_tier = 'tier_1500000'>
				<cfelseif arguments.loan_amount GTE 1000001>
				<cfset this_tier = 'tier_1250000'>
				<cfelseif arguments.loan_amount GTE 750001>
				<cfset this_tier = 'tier_1000000'>
				<cfelseif arguments.loan_amount GTE 500001>
				<cfset this_tier = 'tier_750000'>
				<cfelseif arguments.loan_amount GTE 250001>
				<cfset this_tier = 'tier_500000'>
				<cfelseif arguments.loan_amount GTE 175001>
				<cfset this_tier = 'tier_250000'>
				<cfelseif arguments.loan_amount GTE 100001>
				<cfset this_tier = 'tier_175000'>
				<cfelse>
				<cfset this_tier = 'tier_100000'>
				</cfif>
		<CFQUERY datasource="#request.dsn#" NAME="bulk_rate_authorized" maxrows="1">		
		SELECT *
		FROM Client_Bulk_Rates_Natic
		where comp_id = #arguments.company_id#
		and #this_tier# = 'True'
		and (state = '#arguments.property_state#' or state = 'All')
		</CFQUERY>

		<cfif bulk_rate_authorized.recordcount>
        <cfset read_title_companies_states.title_co_id = 30>
        <cfset arguments.underwriter_choice = 30>
        </cfif>



		<CFQUERY datasource="#request.dsn#" NAME="bulk_rate_authorized" maxrows="1">		
		SELECT *
		FROM Client_Bulk_Rates
		where comp_id = #arguments.company_id#
		and #this_tier# = 'True'
		and (state = '#arguments.property_state#' or state = 'All')
		</CFQUERY>

		<cfif bulk_rate_authorized.recordcount>
        <cfset read_title_companies_states.title_co_id = 16>
        <cfset arguments.underwriter_choice = 16>
        </cfif>
</cfif>

<!--- --->



<cfif read_title_companies_states.title_co_id eq 15>
<cfset underwriter_table = "rate_table">
<cfelseif read_title_companies_states.title_co_id eq 25>
<cfset underwriter_table = "rate_table_first_american">
<cfelseif read_title_companies_states.title_co_id eq 14>
<cfset underwriter_table = "rate_table">
<cfelseif read_title_companies_states.title_co_id eq 16>
<cfset underwriter_table = "rate_table_stewart">
<cfelseif read_title_companies_states.title_co_id eq 19>
<cfset underwriter_table = "rate_table">
<cfelseif read_title_companies_states.title_co_id eq 29>
<cfset underwriter_table = "rate_table_chicago">
<cfelseif read_title_companies_states.title_co_id eq 30>
<cfset underwriter_table = "rate_table_natic">
<cfelseif read_title_companies_states.title_co_id eq 33>
<cfset underwriter_table = "rate_table_wfg">
<cfelse>
<cfset underwriter_table = "rate_table_stewart">
</cfif>

<cfif underwriter_choice eq 16>
<cfset underwriter_table = "rate_table_stewart">
<cfelseif underwriter_choice eq 25>
<cfset underwriter_table = "rate_table_first_american">
<cfelseif underwriter_choice eq 29>
<cfset underwriter_table = "rate_table_chicago">
<cfelseif underwriter_choice eq 30>
<cfset underwriter_table = "rate_table_natic">
<cfelseif underwriter_choice eq 33>
<cfset underwriter_table = "rate_table_wfg">
<cfelse>
<cfset underwriter_table = "rate_table_stewart">
</cfif>

<cfset underwriter_name = "">
<cfif underwriter_table eq 'rate_table_stewart'>
<cfset underwriter_name = "Stewart Title Guaranty Company">
<cfelseif underwriter_table eq 'rate_table_first_american'>
<cfset underwriter_name = "First American Insurance Company">
<cfelseif underwriter_table eq 'rate_table_chicago'>
<cfset underwriter_name = "Chicago Title">
<cfelseif underwriter_table eq 'rate_table_natic'>
<cfset underwriter_name = "North American Title">
<cfelseif underwriter_table eq 'rate_table_wfg'>
<cfset underwriter_name = "WFG National Title Insurance Company">
</cfif>

<!--- if this is CA and one of the counties NATIC servers, switch underwriter to NATIC --->
<cfset temp = checkNatic(arguments.property_state, arguments.property_county)>
<cfif temp eq 30>
<cfset arguments.underwriter_choice = 30>
</cfif>


<!--- simultaneous issue fees --->
<cfset simul_rate = 0>
<cfset first_american_simul_rate_MD = 150>
<cfset first_american_simul_rate_VA = 150>
<cfset stewart_simul_rate_MD = 50>
<cfset stewart_ENHANCED_simul_rate_MD = 75>
<cfset stewart_simul_rate_VA = 150>
<cfset stewart_simul_rate_DC = 100>

<cfif underwriter_table contains 'stewart'>

<cfif arguments.property_state eq 'MD'>
	<cfif arguments.enhanced_coverage eq 1 and (arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1)>
	<cfset simul_rate = stewart_ENHANCED_simul_rate_MD>
	<cfelse>
	<cfset simul_rate = stewart_simul_rate_MD>
	</cfif>
<cfelseif arguments.property_state eq 'VA'>
<cfset simul_rate = stewart_simul_rate_VA>
<cfelseif arguments.property_state eq 'DC'>
<cfset simul_rate = stewart_simul_rate_DC>
</cfif>

<cfelseif underwriter_table contains 'first_american'>

<cfif arguments.property_state eq 'MD'>
<cfset simul_rate = first_american_simul_rate_MD>
<cfelseif arguments.property_state eq 'VA'>
<cfset simul_rate = first_american_simul_rate_VA>
</cfif>

<cfelseif underwriter_table contains 'chicago'>

<cfif arguments.property_state eq 'MD'>
<cfset simul_rate = 50>
<cfelseif arguments.property_state eq 'VA'>
<cfset simul_rate = 150>
<cfelseif arguments.property_state eq 'DC'>
<cfset simul_rate = 100>
</cfif>

</cfif>


<CFQUERY datasource="#request.dsn#" NAME="get_underwriters">
SELECT * FROM J_Companies_Underwriters WHERE comp_id = '#arguments.company_id#'
and state = '#arguments.property_state#'
</CFQUERY>
<cfif get_underwriters.recordcount>
<cfif get_underwriters.underwriter eq 'Stewart'>
<cfset underwriter_table = "rate_table_stewart">
<cfelseif get_underwriters.underwriter eq 'FirstAmerican'>
<cfset underwriter_table = "rate_table_first_american">
</cfif>
</cfif>





<CFQUERY datasource="#request.dsn#" NAME="get_table" maxrows="1">
SELECT #underwriter_table# as table_to_use FROM Zip_info WHERE state = '#arguments.property_state#'
and county = '#arguments.property_county#'
</CFQUERY>

<cfif get_table.table_to_use eq '' or get_table.table_to_use eq 'NULL'>
<CFQUERY datasource="#request.dsn#" NAME="get_table" maxrows="1">
SELECT rate_table as table_to_use FROM Zip_info WHERE state = '#arguments.property_state#'
and county = '#arguments.property_county#'
</CFQUERY>
</cfif>
<!--- tthis part checks to see that whatever table is selected, that it has fees in it, and if not, it'll default back to the regular (Ticor) tables) --->
<CFQUERY datasource="#request.dsn#" NAME="check_table" maxrows="1">
SELECT * FROM #get_table.table_to_use#
</CFQUERY>
<cfif check_table.recordcount eq 0>
<cfset underwriter_table = "rate_table">
<CFQUERY datasource="#request.dsn#" NAME="get_table" maxrows="1">
SELECT #underwriter_table# as table_to_use FROM Zip_info WHERE state = '#arguments.property_state#'
and county = '#arguments.property_county#'
</CFQUERY>			
</cfif>
<!--- end this part checks to see that whatever table is selected, that it has fees in it, and if not, it'll default back to the regular (Ticor) tables) --->

<cfif get_table.table_to_use eq 'StateMarylandStewart' and arguments.enhanced_coverage eq 1 and (arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1)>
<cfset get_table.table_to_use = 'StateMarylandStewartEnhanced'>
</cfif>

<cfif get_table.table_to_use eq 'StateVirginiaStewart' and arguments.enhanced_coverage eq '1' and (arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1)>
<cfset get_table.table_to_use = 'StateVirginiaStewartEnhanced'>
</cfif>
<cfif get_table.table_to_use eq 'StateVirginiaFirstAmerican' and arguments.enhanced_coverage eq '1' and (arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1)>
<cfset get_table.table_to_use = 'StateVirginiaFirstAmericanEnhanced'>
</cfif>

<cfif get_table.table_to_use eq 'StateMichiganStewart' and arguments.enhanced_coverage eq '1' and (arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1)>
<cfset get_table.table_to_use = 'StateMichiganStewartEnhanced'>
</cfif>

<!--- this part checks if a company has its own custom rate table, and if it does, we'll use that --->
<cfif Len(get_all_comp_info.custom_rate_table) and get_all_comp_info.custom_rate_table neq 0 and arguments.property_state eq 'IL'>
<cfset get_table.table_to_use = get_all_comp_info.custom_rate_table>
</cfif>

<cfset request.underwriter_id = arguments.underwriter_choice>
</cffunction>

<!--- getRecFees function --->
<cffunction name="getRecFees" output="true">
<cfargument name="transaction_type" type="string"default="">
<cfargument name="property_state" type="string" default="">
<cfargument name="property_county" type="string" default="">
<cfargument name="property_city" type="string" default="">
<cfargument name="loan_amount" type="string" default="0">
<cfargument name="purchase_price" type="string" default="0">
<cfargument name="previous_loan_amount" default=0>
<cfargument name="property_use_type" type="string" default="">
<cfargument name="company_id" type="string" default="">
<cfargument name="return_data" type="string" default="1">
<cfargument name="previous_loan_month" default=1>
<cfargument name="previous_loan_year" default=1996>
<cfargument name="previous_purch_year" default=1>
<cfargument name="previous_purch_month" default=1996>
<cfargument name="previous_purch_amount" default=0>
<cfargument name="enhanced_coverage" type="string" default="0">
<cfargument name="same_lender" type="string" default="0">
<cfargument name="reissue_rates" type="string" default="0">
<cfargument name="jlp_policy" type="string" default="0">
<cfargument name="property_report" type="string" default="0">
<cfargument name="appraised_value" type="string" default="0">
<cfargument name="seller_paid_lender_policy" type="string" default="0">
<cfargument name="seller_paid_owner_policy" type="string" default="0">
<cfargument name="buyer_paid_lender_policy" type="string" default="0">
<cfargument name="buyer_paid_owner_policy" type="string" default="0">
<cfargument name="asset_manager" type="string" default="">
<cfargument name="cema" type="string" default="0">
<cfargument name="transfer_tax_paid_by" type="string" default="">
<cfargument name="title_id"  default="">
<cfargument name="first_time_buyer"  default="0">
<cfargument name="encompass"  default="0">
<cfargument name="underwriter_choice"  default="0">
<cfargument name="delinquency"  default="0">
<cfargument name="insured"  default="">
<cfargument name="assessed_value"  default="0">
<cfargument name="new_deed" default="0">
<cfargument name="current_deed_num" default="1">
<cfargument name="add_or_remove" default="0">
<cfargument name="add_or_remove_num" default="0">
<cfargument name="previous_purchase_mortgage" default="0">
<cfargument name="prop_type" default="">
<cfargument name="property_address" default="">


<cfset state_money = 0>


<!--- get all recording fees for this state (and/or county) from our database --->
<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
SELECT * FROM recording_fees WHERE (state = '#arguments.property_state#' and county = '#arguments.property_county#' and city = '#arguments.property_city#')
<cfif arguments.property_state eq 'KY'>
or (state = '#arguments.property_state#' and (county = '' or county IS NULL) and city = '#arguments.property_city#')
</cfif>
</CFQUERY>
<cfif read_rec_fees.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
SELECT * FROM recording_fees WHERE state = '#arguments.property_state#' and county = '#arguments.property_county#' and (city = 'ALL' or city = '')
</CFQUERY>
</cfif>
<cfif read_rec_fees.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="read_rec_fees">
SELECT * FROM recording_fees WHERE state = '#arguments.property_state#' and (county = 'ALL' or county = '')
</CFQUERY>
</cfif>


<!--- 1201 rec fee --->
<!--- 1201 Deed recording fee --->
<cfif arguments.transaction_type eq 'Reverse Mortgage' <!--- or (arguments.transaction_type eq 'Refinance' and arguments.new_deed eq 1) ---> >
<cfset temp = QueryAddRow(fees_query)>
<cfset temp = QuerySetCell(fees_query, "Line_Number", 1202)>
<cfset temp = QuerySetCell(fees_query, "Description", "Mortgage Recording Fee")>
<cfif arguments.property_state eq 'VA'>
<cfset temp = QuerySetCell(fees_query, "Amount", 112)>
<cfset roll_up_1201 = roll_up_1201 + 112>
<cfelseif arguments.property_state eq 'CO'>
<cfset temp = QuerySetCell(fees_query, "Amount", 212)>
<cfset roll_up_1201 = roll_up_1201 + 212>
<cfelse>
<cfset temp = QuerySetCell(fees_query, "Amount", read_rec_fees.mort_rec_fee * 2)>
<cfset roll_up_1201 = roll_up_1201 + (read_rec_fees.mort_rec_fee * 2)>
</cfif>
<cfset temp = QuerySetCell(fees_query, "Payer", "Buyer")>
<cfset temp = QuerySetCell(fees_query, "Outside", 1)>
<cfelse>

<CFIF (#read_rec_fees.mort_rec_fee# NEQ "" and #read_rec_fees.mort_rec_fee# NEQ 0 and (arguments.loan_amount gt 0)) or ((arguments.company_id eq 3722 or arguments.company_id eq 4752 or arguments.company_id eq 4702) and (arguments.insured neq 'cash' and arguments.insured neq 'deferred'))>
<cfset temp = QueryAddRow(fees_query)>
<cfset temp = QuerySetCell(fees_query, "Line_Number", 1202)>
<cfset temp = QuerySetCell(fees_query, "Description", "Mortgage Recording Fee")>
<cfif arguments.company_id eq 3722 or  arguments.company_id eq 4752>
		<cfset temp = QuerySetCell(fees_query, "Amount", 120)>
		<cfset roll_up_1201 = roll_up_1201 + 120>
<cfelseif arguments.company_id eq 4702>
<cfset temp = QuerySetCell(fees_query, "Amount", 75)>
<cfset roll_up_1201 = roll_up_1201 + 75>
<cfelseif arguments.property_state eq 'NY' and arguments.cema eq 1>
<cfset temp = QuerySetCell(fees_query, "Amount", 400)>
<cfset roll_up_1201 = roll_up_1201 + 400>
<cfelseif arguments.property_state eq 'MD' and (arguments.property_use_type eq 2 or arguments.property_use_type contains "Investment")>
<cfset temp = QuerySetCell(fees_query, "Amount", 115)>
<cfset roll_up_1201 = roll_up_1201 + 115>
<cfelse>
<cfset temp = QuerySetCell(fees_query, "Amount", read_rec_fees.mort_rec_fee)>
<cfset roll_up_1201 = roll_up_1201 + read_rec_fees.mort_rec_fee>
</cfif>
<cfset temp = QuerySetCell(fees_query, "Payer", "Buyer")>
<cfset temp = QuerySetCell(fees_query, "Outside", 1)>
</cfif>
</cfif>
<CFIF (arguments.company_id eq 3722 or arguments.company_id eq 4752 or arguments.company_id eq 4702) or #read_rec_fees.deedrecfees# NEQ "" and #read_rec_fees.deedrecfees# NEQ 0 and ((arguments.transaction_type eq 'Purchase'  or treat_as_purchase eq 1) or arguments.company_id eq 3276) <!--- or (arguments.transaction_type eq 'Refinance' and arguments.new_deed eq 1) ---> >
<Cfset deed_rec_fee = #read_rec_fees.deedrecfees#>
		<cfif arguments.company_id eq 3722 or  arguments.company_id eq 4752>
		<Cfset deed_rec_fee = 120>
		<cfelseif arguments.company_id eq 4702>
		<Cfset deed_rec_fee = 75>
		</cfif>
<cfset temp = QueryAddRow(fees_query)>
<cfset temp = QuerySetCell(fees_query, "Line_Number", 1202)>
<cfset temp = QuerySetCell(fees_query, "Description", "Deed Recording Fee")>
<cfset temp = QuerySetCell(fees_query, "Amount", deed_rec_fee)>

<cfif arguments.company_id eq 3276 or  arguments.company_id eq 4680 or  arguments.company_id eq 3722 or  arguments.company_id eq 4752 or  arguments.company_id eq 4702 or arguments.asset_manager eq 3568 or arguments.asset_manager eq 2368 or arguments.property_state eq 'VA' or arguments.property_state eq 'FL' or arguments.property_state eq 'MD' or arguments.property_state eq 'SC' or arguments.property_state eq 'PA' or arguments.property_state eq 'GA' or arguments.property_state eq 'DE' or arguments.property_state eq 'DC' or arguments.property_state eq 'WV' or arguments.property_state eq 'AL' or arguments.property_state eq 'LA' or arguments.property_state eq 'MN' or arguments.property_state eq 'MS' or arguments.property_state eq 'MO' or arguments.property_state eq 'TN'  or arguments.property_state eq 'TX' or arguments.property_state eq 'UT' or arguments.property_state eq 'VT' or arguments.property_state eq 'WY'<!--- or arguments.new_deed eq 1 ---> >
<cfset temp = QuerySetCell(fees_query, "Payer", "Buyer")>
<cfset temp = QuerySetCell(fees_query, "Outside", 1)>
<cfset roll_up_1201 = roll_up_1201 + deed_rec_fee>
<cfelse>
<cfset temp = QuerySetCell(fees_query, "Payer", "Seller")>
<cfset temp = QuerySetCell(fees_query, "Outside", 0)>
</cfif>
</cfif>












<!--- NEW RECORDING FEES, STATE, CITY, COUNTY TRANSFER TAXES --->
<cfset total_city_county_transfer_tax_buyer = 0>
<cfset total_state_transfer_tax_buyer = 0>
<cfset total_city_county_transfer_tax_seller = 0>
<cfset total_state_transfer_tax_seller = 0>



<cfif arguments.property_state eq 'NJ'>

	<cfif arguments.purchase_price LTE 350000>
	
		<cfif arguments.purchase_price lte 150000>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + (arguments.purchase_price / 500) * 2>
		<cfelseif arguments.purchase_price lte 200000>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + (150000 / 500) * 2>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((arguments.purchase_price - 150000) / 500) * 3.35>
		<cfelse>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + (150000 / 500) * 2>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((50000) / 500) * 3.35>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((arguments.purchase_price - 200000) / 500) * 3.9>
		</cfif>
	
	
	
	<cfelse>
	<!--- purchase price over 350000 --->
		<cfif arguments.purchase_price lte 150000>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + (arguments.purchase_price / 500) * 2.9>
		<cfelseif arguments.purchase_price lte 200000>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + (150000 / 500) * 2.9>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((arguments.purchase_price - 150000) / 500) * 4.25>
		<cfelseif arguments.purchase_price lte 550000>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + (150000 / 500) * 2.9>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((50000) / 500) * 4.25>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((arguments.purchase_price - 200000) / 500) * 4.80>
		<cfelseif arguments.purchase_price lte 850000>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + (150000 / 500) * 2.9>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((50000) / 500) * 4.25>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((350000) / 500) * 4.80>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((arguments.purchase_price - 550000) / 500) * 5.30>
		<cfelseif arguments.purchase_price lte 1000000>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + (150000 / 500) * 2.9>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((50000) / 500) * 4.25>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((350000) / 500) * 4.80>

		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((300000) / 500) * 5.30>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((arguments.purchase_price - 850000) / 500) * 5.80>
		<cfelse>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + (150000 / 500) * 2.9>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((50000) / 500) * 4.25>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((350000) / 500) * 4.80>

		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((300000) / 500) * 5.30>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((150000) / 500) * 5.80>
		<cfset total_state_transfer_tax_seller = total_state_transfer_tax_seller + ((arguments.purchase_price - 1000000) / 500) * 6.05>
		</cfif>
	
	</cfif>
	

<!--- Add Mansion Tax if purchase price is over 1,000,000 --->
<cfif arguments.purchase_price gt 1000000>
<cfset total_state_transfer_tax_buyer = total_state_transfer_tax_buyer + (arguments.purchase_price  * .01)>
</cfif>

<cfif total_state_transfer_tax_seller neq 0>
<cfset descr = "State tax/stamps: Deed">
<cfif arguments.asset_manager neq 2368 and  arguments.asset_manager neq 3568 and arguments.transaction_type eq 'Purchase'><!--- Fannie and  Freddie are exempt --->
<cfset temp = AddQueryItem(1205, descr, NumberFormat(total_state_transfer_tax_seller, '_____.__'), "Seller", 0)>
</cfif>
<!--- <cfset roll_up_1203 = roll_up_1203 + total_state_transfer_tax_buyer> --->
</cfif>


<cfelseif arguments.property_state eq 'DC' and arguments.purchase_price LT 400000>
<cfset state_money = arguments.purchase_price>
<cfset state_transfer_buyer = (state_money * .022) / 2>
<cfset state_transfer_seller = (state_money * .022) / 2>
<cfset descr = "State tax/stamps: Deed">
<cfif arguments.asset_manager neq 2368 and  arguments.asset_manager neq 3568 and arguments.transaction_type eq 'Purchase'><!--- Fannie and  Freddie are exempt --->
<cfset temp = AddQueryItem(1205, descr, NumberFormat(state_transfer_seller, '_____.__'), "Seller", 0)>
</cfif>
<cfset temp = AddQueryItem(1205, descr, NumberFormat(state_transfer_buyer, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + state_transfer_buyer>




<cfelse>

<!--- ok, we're not in NJ, or CT and we're not (in DC and the purchase_price is less than 400,000), following code is for all other states --->

<cfparam name="read_rec_fees.state_Transfer_Tax" default=0>
<cfif Not IsNumeric(read_rec_fees.state_Transfer_Tax)>
<cfset read_rec_fees.state_Transfer_Tax = 0>
</cfif>
<cfparam name="read_rec_fees.county_Transfer_Tax" default=0>
<cfif Not IsNumeric(read_rec_fees.county_Transfer_Tax)>
<cfset read_rec_fees.county_Transfer_Tax = 0>
</cfif>
<cfparam name="read_rec_fees.city_Transfer_Tax" default=0>
<cfif Not IsNumeric(read_rec_fees.city_Transfer_Tax)>
<cfset read_rec_fees.city_Transfer_Tax = 0>
</cfif>


<cfif IsNumeric(arguments.purchase_price) and arguments.purchase_price neq 'NULL'>
<cfset state_money = arguments.purchase_price>
<cfelse>
<cfset state_money = 0>
</cfif>


<cfif IsNumeric(arguments.purchase_price) and arguments.purchase_price neq 'NULL'>
<cfset county_money = arguments.purchase_price>
<cfelse>
<cfset county_money = 0>
</cfif>

<cfif IsNumeric(arguments.purchase_price) and arguments.purchase_price neq 'NULL'>
<cfset city_money = arguments.purchase_price>
<cfelse>
<cfset city_money = 0>
</cfif>



<cfif arguments.property_state neq 'MD' or (arguments.property_state eq 'MD' and (arguments.property_use_type eq '1'  or arguments.property_use_type eq 'Primary Residence'))>
<cfif Len(read_rec_fees.State_Transfer_Exempt)>
<cfset state_money = state_money - read_rec_fees.State_Transfer_Exempt>
<cfif state_money lte 0>
<cfset state_money = 0>
</cfif>
</cfif>
</cfif>

<cfif arguments.property_state neq 'MD' or (arguments.property_state eq 'MD' and (arguments.property_use_type eq '1'  or arguments.property_use_type eq 'Primary Residence'))>
<cfif Len(read_rec_fees.County_Transfer_Exempt)>
<cfset county_money = county_money - read_rec_fees.County_Transfer_Exempt>
<cfif county_money lte 0>
<cfset county_money = 0>
</cfif>
</cfif>
</cfif>

<cfif arguments.property_state neq 'MD' or (arguments.property_state eq 'MD' and (arguments.property_use_type eq '1'  or arguments.property_use_type eq 'Primary Residence'))>
<cfif Len(read_rec_fees.City_Transfer_Exempt)>
<cfset city_money = city_money - read_rec_fees.City_Transfer_Exempt>
<cfif city_money lte 0>
<cfset city_money = 0>
</cfif>
</cfif>
</cfif>




<!--- reset these if this a MD refi or Construction in Prince Georges county because they do stuf weird --->
<cfif arguments.property_state eq 'MD' and arguments.property_county eq 'Prince Georges' and (arguments.transaction_type eq 'Refinance' or (arguments.transaction_type eq 'Construction' or treat_as_refi eq 1)) and (arguments.property_use_type eq '2'  or arguments.property_use_type contains 'Investment')>



<cfif arguments.previous_loan_amount GT 0>
<cfset state_money = arguments.loan_amount - arguments.previous_loan_amount>
<cfset county_money = arguments.loan_amount - arguments.previous_loan_amount>
<cfset city_money = arguments.loan_amount - arguments.previous_loan_amount>
<cfelse>
<cfset state_money = arguments.loan_amount>
<cfset county_money = arguments.loan_amount>
<cfset city_money = arguments.loan_amount>
</cfif>



<cfif arguments.property_state eq 'MD' and arguments.property_county eq 'Prince Georges' and (arguments.transaction_type eq 'Refinance' or (arguments.transaction_type eq 'Construction' or treat_as_refi eq 1)) and (arguments.property_use_type eq '1'  or arguments.property_use_type eq 'Primary Residence')>
<cfif arguments.previous_purchase_mortgage eq 0>
<cfset state_money = arguments.loan_amount - arguments.previous_loan_amount>
<cfset county_money = arguments.loan_amount - arguments.previous_loan_amount>
<cfset city_money = arguments.loan_amount - arguments.previous_loan_amount>
<cfelse>
<cfset state_money = 0>
<cfset county_money = 0>
<cfset city_money = 0>
</cfif>
</cfif>

</cfif>


<cfset state_transfer_buyer = 0>
<cfset state_transfer_seller = 0>

<cfif IsNumeric(read_rec_fees.State_Transfer_Tax) and read_rec_fees.State_Transfer_Tax neq 'NULL'>

<cfif arguments.property_state eq 'CT'>
  <cfset state_money = arguments.purchase_price>
  <cfif arguments.purchase_price LTE 800000>
	<cfset state_transfer_seller = (state_money * read_rec_fees.state_Transfer_Tax)>
  <cfelse>
	<cfset state_transfer_seller = (800000 * read_rec_fees.state_Transfer_Tax)>
	<cfset state_transfer_seller = ((state_transfer_seller + (state_money-800000)) * read_rec_fees.state_Transfer_Tax)>
    </cfif>
	
<cfelse>
<cfif read_rec_fees.State_Transfer_Paidby eq 'seller'>

	<cfif arguments.property_state eq 'VA' and (IsNumeric(arguments.assessed_value) and arguments.assessed_value GT arguments.purchase_price)>
	<cfset state_transfer_seller = arguments.assessed_value * read_rec_fees.State_Transfer_Tax>
	<cfelse>
	<cfset state_transfer_seller = state_money * read_rec_fees.State_Transfer_Tax>
	</cfif>
<cfelseif read_rec_fees.State_Transfer_Paidby eq 'buyer'>

	<cfif arguments.property_state eq 'VA' and (IsNumeric(arguments.assessed_value) and arguments.assessed_value GT arguments.purchase_price)>
	<cfset state_transfer_buyer = arguments.assessed_value * read_rec_fees.State_Transfer_Tax>
	<cfelse>
	<cfset state_transfer_buyer = state_money * read_rec_fees.State_Transfer_Tax>
	</cfif>
<cfelseif read_rec_fees.State_Transfer_Paidby eq 'split'>
	<cfif arguments.property_state eq 'VA' and (IsNumeric(arguments.assessed_value) and arguments.assessed_value GT arguments.purchase_price)>
	<cfset state_transfer_buyer = arguments.assessed_value * read_rec_fees.State_Transfer_buyer_split>
	<cfelse>
	<cfset state_transfer_buyer = state_money * read_rec_fees.State_Transfer_buyer_split>
	</cfif>
	<cfif arguments.property_state eq 'VA' and (IsNumeric(arguments.assessed_value) and arguments.assessed_value GT arguments.purchase_price)>
	<cfset state_transfer_seller = arguments.assessed_value * read_rec_fees.State_Transfer_seller_split>
	<cfelse>
	<cfset state_transfer_seller = state_money * read_rec_fees.State_Transfer_seller_split>
	</cfif>
</cfif>

</cfif>
</cfif>




<cfset county_transfer_buyer = 0>
<cfset county_transfer_seller = 0>

<cfif read_rec_fees.county_Transfer_Paidby eq 'seller' and IsNumeric(read_rec_fees.county_Transfer_Tax) and read_rec_fees.county_Transfer_Tax neq 'NULL'>

<cfif arguments.property_state eq 'VA' and (IsNumeric(arguments.assessed_value) and arguments.assessed_value GT arguments.purchase_price)>
<cfset county_transfer_seller = arguments.assessed_value * read_rec_fees.county_Transfer_Tax>
<cfelse>
<cfset county_transfer_seller = county_money * read_rec_fees.county_Transfer_Tax>
</cfif>
<cfelseif read_rec_fees.county_Transfer_Paidby eq 'buyer' and IsNumeric(read_rec_fees.county_Transfer_Tax) and read_rec_fees.county_Transfer_Tax neq 'NULL'>

<cfif arguments.property_state eq 'VA' and (IsNumeric(arguments.assessed_value) and arguments.assessed_value GT arguments.purchase_price)>
<cfset county_transfer_buyer = arguments.assessed_value * read_rec_fees.county_Transfer_Tax>
<cfelse>
<cfset county_transfer_buyer = county_money * read_rec_fees.county_Transfer_Tax>
</cfif>
<cfelseif read_rec_fees.county_Transfer_Paidby eq 'split' and IsNumeric(read_rec_fees.county_Transfer_buyer_split) and read_rec_fees.county_Transfer_buyer_split neq 'NULL' and IsNumeric(read_rec_fees.county_Transfer_seller_split) and read_rec_fees.county_Transfer_seller_split neq 'NULL'>

<cfif arguments.property_state eq 'VA' and (IsNumeric(arguments.assessed_value) and arguments.assessed_value GT arguments.purchase_price)>
<cfset county_transfer_buyer = arguments.assessed_value * read_rec_fees.county_Transfer_buyer_split>
<cfelse>
<cfset county_transfer_buyer = county_money * read_rec_fees.county_Transfer_buyer_split>
</cfif>


<cfif arguments.property_state eq 'VA' and (IsNumeric(arguments.assessed_value) and arguments.assessed_value GT arguments.purchase_price)>
<cfset county_transfer_seller = arguments.assessed_value * read_rec_fees.county_Transfer_seller_split>
<cfelse>
<cfset county_transfer_seller = county_money * read_rec_fees.county_Transfer_seller_split>
</cfif>


</cfif>

<cfset city_transfer_buyer = 0>
<cfset city_transfer_seller = 0>
<cfif IsNumeric(read_rec_fees.city_Transfer_Tax) and read_rec_fees.city_Transfer_Tax neq 'NULL'>
<cfif read_rec_fees.city_Transfer_Paidby eq 'seller'>
<cfif Len(read_rec_fees.city_Flat_Transfer_Tax)>
<cfset city_transfer_seller = read_rec_fees.city_Flat_Transfer_Tax>
<cfelse>
<cfset city_transfer_seller = city_money * read_rec_fees.city_Transfer_Tax>

</cfif>
<cfelseif read_rec_fees.city_Transfer_Paidby eq 'buyer'>
<cfif Len(read_rec_fees.city_Flat_Transfer_Tax)>
<cfset city_transfer_buyer = read_rec_fees.city_Flat_Transfer_Tax>
<cfelse>


<cfset city_transfer_buyer = city_money * read_rec_fees.city_Transfer_Tax>
</cfif>
<cfelseif read_rec_fees.city_Transfer_Paidby eq 'split'>
<cfif Len(read_rec_fees.city_Flat_Transfer_Tax)>
<cfset city_transfer_buyer = read_rec_fees.city_Flat_Transfer_Tax * read_rec_fees.city_Transfer_buyer_split>
<cfset city_transfer_SELLER = read_rec_fees.city_Flat_Transfer_Tax * read_rec_fees.city_Transfer_SELLER_split>
<cfelse>
<cfset city_transfer_buyer = CITY_MONEY  * read_rec_fees.city_Transfer_buyer_split>
<cfset city_transfer_seller = CITY_MONEY * read_rec_fees.city_Transfer_seller_split>
</cfif>
</cfif>
</cfif>

<cfset total_city_county_transfer_tax_buyer = county_transfer_buyer + city_transfer_buyer>
<cfset total_state_transfer_tax_buyer = state_transfer_buyer>
<cfset total_city_county_transfer_tax_seller = county_transfer_seller + city_transfer_seller>
<cfset total_state_transfer_tax_seller = state_transfer_seller>



<cfif total_city_county_transfer_tax_buyer neq 0>
<cfset descr = "City/County tax/stamps: Deed">
<cfset temp = AddQueryItem(1204, descr, NumberFormat(total_city_county_transfer_tax_buyer, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + total_city_county_transfer_tax_buyer>
</cfif>

<cfif total_city_county_transfer_tax_seller neq 0>
<cfset descr = "City/County tax/stamps: Deed">
<cfif arguments.asset_manager neq 2368 and  arguments.asset_manager neq 3568 and arguments.transaction_type eq 'Purchase'><!--- Fannie and  Freddie are exempt --->
  <cfset temp = AddQueryItem(1204, descr, NumberFormat(total_city_county_transfer_tax_seller, '_____.__'), "Seller", 0)>
</cfif>
</cfif>

<cfif total_state_transfer_tax_buyer neq 0>
<cfif arguments.property_state eq 'MD' and arguments.first_time_buyer eq 1>
<!--- if it's a Maryland property and a first time home buyer, they do not pay the buyer's portion of the state deed, so do nothing here --->
<cfelse> 
 
<cfif arguments.property_state eq 'VA'>
<cfset descr = "State tax/stamps: Grantee Tax: Deed">
<cfelse>
<cfset descr = "State tax/stamps: Deed">
</cfif>


<cfif arguments.transfer_tax_paid_by eq 'Seller' and arguments.transaction_type eq 'Purchase'>
<cfset temp = AddQueryItem(1205, descr, NumberFormat(total_state_transfer_tax_buyer, '_____.__'), "Seller", 0)>
<cfelse>
<cfset temp = AddQueryItem(1205, descr, NumberFormat(total_state_transfer_tax_buyer, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + total_state_transfer_tax_buyer>
</cfif>


</cfif>
</cfif>



<cfif total_state_transfer_tax_seller neq 0>
<cfif arguments.property_state eq 'VA'>
<cfset descr = "State tax/stamps: Grantor Tax: Deed">
<cfelse>
<cfset descr = "State tax/stamps: Deed">
</cfif>

<cfif arguments.company_id eq 4680>
<cfset temp = AddQueryItem(1205, descr, NumberFormat(total_state_transfer_tax_seller, '_____.__'), "Buyer", 0)>
<cfset roll_up_1203 = roll_up_1203 + total_state_transfer_tax_seller>
<cfelse>
<cfif arguments.company_id neq 3722 and arguments.company_id neq 4752 and arguments.company_id neq 4702 and arguments.company_id neq 2368 and  arguments.company_id neq 3568><!--- Fannie and  Freddie are exempt --->

<cfif arguments.property_state eq 'KY'>
<cfset temp = AddQueryItem(1205, descr, NumberFormat(4, '_____.__'), "Buyer", 0)>
<cfset roll_up_1203 = roll_up_1203 + 4>
<cfelse>
<cfif arguments.transaction_type eq 'Purchase'>
<cfset temp = AddQueryItem(1205, descr, NumberFormat(total_state_transfer_tax_seller, '_____.__'), "Seller", 0)>
</cfif>
</cfif>

</cfif>
</cfif>
</cfif>


<cfif arguments.purchase_price gt 1000000 and arguments.property_state eq 'NY'>
<cfset mansion_tax =  arguments.purchase_price  * .01>
<cfset temp = AddQueryItem(1205, "Mansion Tax: Deed", NumberFormat(mansion_tax, '_____.__'), "Buyer", 0)>
<cfset roll_up_1203 = roll_up_1203 + mansion_tax>
</cfif>



</cfif>
<!--- end Transfer Tax (Deed) --->





<!--- 1202 Mortgage Stamps --->

<CFSET city_mort_stamps = 0>
<cfif arguments.prop_type neq 'Cooperative'>

<cfif #arguments.transaction_type# eq 'Reverse Mortgage' and IsDefined("read_rec_fees.mort_stamps")>
<cfif arguments.property_state eq 'VA'>
<CFSET city_mort_stamps = (arguments.loan_amount * 1.5) * .00333>
<cfelseif arguments.property_state eq 'MD'>
<cfset city_mort_stamps=#NumberFormat(Ceiling(((arguments.loan_amount*1.5) - arguments.previous_loan_amount)*read_rec_fees.mort_stamps),'_____.__')#>
<cfelse>
<cftry>
<cfset city_mort_stamps=#NumberFormat(Ceiling((arguments.loan_amount*1.5)*read_rec_fees.mort_stamps),'_____.__')#>
<cfcatch type="any">
<cfset city_mort_stamps=0>
</cfcatch>
</cftry>
</cfif>
<cfelseif (#arguments.transaction_type# eq "Purchase" or treat_as_purchase eq 1)>
<cfif arguments.property_state eq "MD">

<!--- for Maryland Purchases, Mortgage Stamps are based on read_rec_fees.mort_stamps mulitplied by the Purchase Price, or the Loan Amount, whichever is greater --->
<cfif arguments.purchase_price gt arguments.loan_amount>
<cfset city_mort_stamps=#NumberFormat(Ceiling((arguments.purchase_price)*read_rec_fees.mort_stamps),'_____.__')#>
<cfelse>
<cfset city_mort_stamps=#NumberFormat(Ceiling((arguments.loan_amount)*read_rec_fees.mort_stamps),'_____.__')#>
</cfif>



<!--- for Maryland Purchases, if the Loan Amount (arguments.loan_amount) is greater than the purchase price (arguments.purchase_price), then Mortgage Stamps are calculated based on the difference between the Loan Amount and Purchase price. If Purchase Price is greater than Loan Amount, No Mortgage Stamps --->
<!--- if primary residence, should be a $50,000 exemption --->
<cfif arguments.property_state eq 'MD' and arguments.property_county eq 'Montgomery'>
<cfif arguments.loan_amount GTE arguments.purchase_price>
<cfset use_this_amount = arguments.loan_amount>
<cfelse>
<cfset use_this_amount = arguments.purchase_price>
</cfif>


<!--- if primary residence, should be a $50,000 exemption --->
<cfif (arguments.property_use_type eq '1'  or arguments.property_use_type eq 'Primary Residence')>
<cfset exemption_amt = 50000>
<cfelse>
<cfset exemption_amt = 0>
</cfif>
<cfif use_this_amount lte 500000>
<cfset city_mort_stamps=#NumberFormat(Ceiling((use_this_amount-exemption_amt)*read_rec_fees.mort_stamps),'_____.__')#>
<cfelse>
<cfset first_amount = #NumberFormat(Ceiling((500000-exemption_amt)*read_rec_fees.mort_stamps),'_____.__')#>
<cfset second_amount = ((use_this_amount - 500000) * .01)>
<cfset city_mort_stamps=#NumberFormat((first_amount + second_amount) ,'_____.__')#>
</cfif>
</cfif>
<cfelseif arguments.property_state eq "VA">
<cfif IsNumeric(arguments.loan_amount) and arguments.loan_amount gt 0>
<cfset city_mort_stamps = (read_rec_fees.mort_stamps * arguments.loan_amount)>
</cfif>
<cfelse>
<cfif isnumeric(read_rec_fees.mort_stamps)>
<CFSET city_mort_stamps = #Ceiling(arguments.loan_amount)# * #read_rec_fees.mort_stamps#>
<cfelse>
<cfset city_mort_stamps = 0>
</cfif>
</cfif>
<cfif city_mort_stamps LT 0>
<CFSET city_mort_stamps = 0>
</cfif>




<cfelseif #arguments.transaction_type# neq 'Purchase' and #arguments.transaction_type# neq 'Reverse Mortgage' and treat_as_refi eq 1>
<!--- not a purchase --->


<cfif (#arguments.property_state# EQ "MD")><!--- effective July 1st 2013: Currently properties sees as "Non Owner Occupied/Investment" are charged FULL recordation taxes on the entire loan amount.  This has changed to make it similar to Residential Properties.  So, ALL properties now will receive a credit for the prior loan amount and only pay recordation taxes for the amount of the difference between the old loan amount and new loan amount.  --->

<cfset city_mort_stamps=#NumberFormat(Ceiling((arguments.loan_amount-arguments.previous_loan_amount)*read_rec_fees.mort_stamps),'_____.__')#>

<cfif arguments.property_state eq 'MD' and arguments.property_county eq 'Montgomery' and (arguments.property_use_type eq '1'  or arguments.property_use_type eq 'Primary Residence')>
<cfif arguments.loan_amount gte arguments.previous_loan_amount>
<cfset new_money = arguments.loan_amount - arguments.previous_loan_amount>
<cfelse>
<cfset new_money = 0>
</cfif>


<cfif arguments.previous_loan_amount lt 500000> <!--- if previous loan less than 500000 --->

<cfset new_money_first_calc = new_money - (500000-arguments.previous_loan_amount)>
<cfif new_money_first_calc LTE 0>
<cfset new_money_first_calc = 0>
</cfif>


<cfset first_amount = #NumberFormat(Ceiling((new_money_first_calc)*read_rec_fees.mort_stamps),'_____.__')#>
<!--- new_money_first_calc =  new money - (500000 - previousloan) --->
<cfset new_money_second_calc = new_money - new_money_first_calc>
<cfif new_money_second_calc LT 500000>
<cfset second_amount = #NumberFormat(Ceiling((new_money_second_calc)*read_rec_fees.mort_stamps),'_____.__')#>
<cfelse>
<cfset second_amount = #NumberFormat(Ceiling((new_money_second_calc)*.01),'_____.__')#>
</cfif>
<!--- new money second calc = new money - new money first calc --->
<cfset city_mort_stamps=#NumberFormat((first_amount + second_amount) ,'_____.__')#>
<cfelse>
<cfset city_mort_stamps=#NumberFormat((new_money * .01) ,'_____.__')#>
</cfif>
</cfif>




<cfelseif arguments.property_state eq "NY">
<!--- If this is not a purchase (it's a refi or a 2nd) and the Porperty Use Type is Primary Residence, Mortgage Stamps are based on the loan amount (arguments.loan_amount) minus the existing loan (orig_loan_amt), otherwise, use the regular calculation --->
<cfif #arguments.property_county# eq "Bronx" or #arguments.property_county# eq "Kings" or #arguments.property_county# eq "New York" or #arguments.property_county# eq "Queens" or #arguments.property_county# eq "Richmond">
<cfif arguments.loan_amount LTE 500000>
<cfset percent_calc = 0.0205>
<cfelse>
<cfset percent_calc = 0.02175>
</cfif>
<cfelse>
<cfset percent_calc = read_rec_fees.mort_stamps>
</cfif>


<CFSET city_mort_stamps = #Ceiling(arguments.loan_amount)# * #percent_calc#>


<cfelse>


<cftry>
<CFSET city_mort_stamps = Ceiling(arguments.loan_amount) * read_rec_fees.mort_stamps>			
<cfcatch type="any"><cfset city_mort_stamps= 0></cfcatch>
</cftry>
</cfif>
<cfif city_mort_stamps LT 0>
<CFSET city_mort_stamps = 0>
</cfif>
<cfelse>
</cfif>			


<!---<cfif session.ft_user_id eq 248>
<cfoutput>
<cfdump var="#fees_query#">
</cfoutput>
</cfif>--->

<cfif IsDefined("City_mort_stamps") and city_mort_stamps neq 0 and city_mort_stamps neq "">
<cfif arguments.property_state eq 'NY'>
<cfif arguments.cema eq 1>
<cfif arguments.previous_loan_amount LTE arguments.loan_amount >
<CFSET city_mort_stamps = #Ceiling(arguments.loan_amount-arguments.previous_loan_amount)# * #percent_calc#>
<cfelse>
<CFSET city_mort_stamps = #Ceiling(arguments.loan_amount)# * #percent_calc#>
</cfif>
</cfif>
<cfset lender_cost = arguments.loan_amount * .0025>
<cfset descr = "City/County tax/stamps: Mortgage Stamps ($" & lender_cost & " POC Lender)">
<cfset temp = AddQueryItem(1204, descr, NumberFormat(city_mort_stamps, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + city_mort_stamps>



<cfelseif arguments.property_state eq 'VA' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1)>

<cfif arguments.previous_loan_amount GT 0>
	<cfset state_mort_stamps = #Ceiling(arguments.loan_amount)# * .0018> 
	<CFSET city_mort_stamps = #Ceiling(arguments.loan_amount)# * .0006>
	<cfelse>
	<cfset state_mort_stamps = #Ceiling(arguments.loan_amount)# * .00250> 
	<CFSET city_mort_stamps = #Ceiling(arguments.loan_amount)# * .0008333>
</cfif>


<cfset temp = AddQueryItem(1204, "City/County Recordation Tax: Mortgage", NumberFormat(city_mort_stamps, '_____.__'), "Buyer", 1)>	
<cfset roll_up_1203 = roll_up_1203 + city_mort_stamps>
<cfif IsDefined("state_mort_stamps")>
<cfset temp = AddQueryItem(1205, "State tax/stamps: Mortgage Stamps", NumberFormat(state_mort_stamps, '_____.__'), "Buyer", 1)>	
<cfset roll_up_1203 = roll_up_1203 + state_mort_stamps>
</cfif>

<cfelse>
<cfif arguments.property_state eq 'VA' and (arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1)>
<cfset state_mort_stamps = #Ceiling(arguments.loan_amount)# * .00250> 
<CFSET city_mort_stamps = #Ceiling(arguments.loan_amount)# * .0008333>
</cfif>
<cfif arguments.property_state eq 'MD' and (arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1) ><!--- if it's a purchase Maryland splits hte fee, on a refi, buyer pays it all, according to Dustin Haskins 8/25/2010 --->
<!--- according to Jillian, this charge should only apply if the loan amount is greater than the purchase price 11/2012 --->
<cfset temp = AddQueryItem(1204, "City/County Recordation Tax: Mortgage", NumberFormat(city_mort_stamps * .5, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + (city_mort_stamps * .5)>
<cfif arguments.asset_manager neq 2368 and  arguments.asset_manager neq 3568 and arguments.transaction_type eq 'Purchase'><!--- Fannie and  Freddie are exempt --->
<cfset temp = AddQueryItem(1204, "City/County Recordation Tax: Mortgage", NumberFormat(city_mort_stamps * .5, '_____.__'), "Seller", 0)>
</cfif>
<cfelseif arguments.property_state eq 'MD' and (arguments.transaction_type neq 'Purchase' and treat_as_refi eq 1)>


<cfset temp = AddQueryItem(1204, "City/County Recordation Tax: Mortgage", NumberFormat(city_mort_stamps, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + city_mort_stamps>
</cfif>


<cfif IsDefined("state_mort_stamps")>
<cfset temp = AddQueryItem(1205, "State tax/stamps: Mortgage Stamps", NumberFormat(Ceiling(state_mort_stamps), '_____.__'), "Buyer", 1)>	
<cfset roll_up_1203 = roll_up_1203 + Ceiling(state_mort_stamps)>
</cfif>
<cfif IsDefined("city_mort_stamps") and arguments.property_state neq 'MD' >
<cfset temp = AddQueryItem(1204, "City/County tax/stamps: Mortgage Stamps", NumberFormat(Ceiling(city_mort_stamps), '_____.__'), "Buyer", 1)>	
<cfset roll_up_1203 = roll_up_1203 + Ceiling(city_mort_stamps)>
</cfif>
</cfif>
</cfif>




<cfif arguments.property_state eq 'MD' and (arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1) and IsDefined("City_mort_stamps") and city_mort_stamps neq 0 and city_mort_stamps neq "">
<!---<cfquery dbtype="query" name="find_1205"> 
SELECT *
FROM fees_query where line_number = 1205
order by line_number
</cfquery>
<cfset temp = AddQueryItem(1205, "State Recordation Tax", NumberFormat(city_mort_stamps * .5, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + (city_mort_stamps * .5)>
<cfif arguments.asset_manager neq 2368 and  arguments.asset_manager neq 3568  and arguments.transaction_type eq 'Purchase'><!--- Fannie and  Freddie are exempt --->
<cfset temp = AddQueryItem(1205, "State Recordation Tax", NumberFormat(city_mort_stamps * .5, '_____.__'), "Seller", 0)>
</cfif>--->

<cfelseif arguments.property_state eq 'MD' and arguments.property_county eq 'Prince Georges' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1)  and arguments.property_use_type eq 2 and IsDefined("City_mort_stamps") and city_mort_stamps neq 0 and city_mort_stamps neq "">
<Cfset state_rec_tax = Ceiling(arguments.loan_amount * .014)>
<cfset temp = AddQueryItem(1205, "State/County/City Tax/stamps: Deed", NumberFormat(state_rec_tax, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + (state_rec_tax)>



<cfelseif arguments.property_state eq 'MD' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1)  and arguments.new_deed eq '1' and IsDefined("City_mort_stamps") and city_mort_stamps neq 0 and city_mort_stamps neq "">
<cfset temp = AddQueryItem(1205, "State Recordation Tax: Mortgage", NumberFormat(city_mort_stamps, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + (city_mort_stamps)>

</cfif>

</cfif>



</cffunction>

<!--- GetReissuerates function --->
<cffunction name="GetReissuerates" >
<cfargument name="a_ins_premium">
<cfargument name="previous_loan_year" default=2000>
<cfargument name="previous_loan_month" default=1>
<cfargument name="previous_purch_year" default=2000>
<cfargument name="previous_purch_month" default=1>
<cfargument name="previous_purch_amount">
<cfargument name="transaction_type">
<cfargument name="property_state">
<cfargument name="property_county">
<cfargument name="previous_loan_amount">
<cfargument name="loan_amount">
<cfargument name="company_id">
<cfargument name="reissue_rates">
<cfargument name="underwriter_choice">




<cfset request.got_reissue_rate = 0>

<CFQUERY datasource="#request.dsn#" NAME="get_comp_info" maxrows="1">
SELECT * FROM companies WHERE ID = #arguments.company_id#
</CFQUERY>	

<cfif arguments.property_state eq 'FL'>
<cfset get_comp_info.allow_reissue_rates = 'True'>
</cfif>



<cfif arguments.property_state eq 'CT'>
<cfset a_ins_premium = read_ins_calc.refinance * .6>
<cfset request.got_reissue_rate = 1>
</cfif>




<cfif arguments.property_state eq 'CO'>

<!--- Zone A --->
<cfif ListContains("Adams,Arapahoe,Boulder,Broomfield,Clear Creek,Denver,Douglas,Elbert,Jefferson", arguments.property_county, ",")>
	  <cfif arguments.loan_amount LTE 100000>
        <cfset a_ins_premium = 540>
      <cfelseif arguments.loan_amount LTE 150000>
        <cfset a_ins_premium = 605>
      <cfelseif arguments.loan_amount LTE 200000>
        <cfset a_ins_premium = 655>
      <cfelseif arguments.loan_amount LTE 300000>
        <cfset a_ins_premium = 755>
      <cfelseif arguments.loan_amount LTE 400000>
        <cfset a_ins_premium = 855>
      <cfelseif arguments.loan_amount LTE 500000>
        <cfset a_ins_premium = 955>
      <cfelseif arguments.loan_amount LTE 750000>
        <cfset a_ins_premium = 1105>
      <cfelseif arguments.loan_amount LTE 1000000>
        <cfset a_ins_premium = 1355>
      <cfelseif arguments.loan_amount LTE 1500000>
        <cfset a_ins_premium = 1855>
      <cfelseif arguments.loan_amount LTE 2000000>
        <cfset a_ins_premium = 2455>
      <cfelseif arguments.loan_amount LTE 3000000>
        <cfset a_ins_premium = 3655>
      <cfelse>
        <cfset a_ins_premium = read_ins_calc.refinance>
      </cfif>

<!--- Eagle,Lake --->
<cfelseif ListContains("Eagle,Lake", arguments.property_county, ",")>
	  <cfif arguments.loan_amount LTE 100000>
        <cfset a_ins_premium = 590>
      <cfelseif arguments.loan_amount LTE 150000>
        <cfset a_ins_premium = 640>
      <cfelseif arguments.loan_amount LTE 200000>
        <cfset a_ins_premium = 690>
      <cfelseif arguments.loan_amount LTE 300000>
        <cfset a_ins_premium = 790>
      <cfelseif arguments.loan_amount LTE 400000>
        <cfset a_ins_premium = 890>
      <cfelseif arguments.loan_amount LTE 500000>
        <cfset a_ins_premium = 1090>
      <cfelseif arguments.loan_amount LTE 750000>
        <cfset a_ins_premium = 1140>
      <cfelseif arguments.loan_amount LTE 1000000>
        <cfset a_ins_premium = 1390>
      <cfelseif arguments.loan_amount LTE 1500000>
        <cfset a_ins_premium = 1890>
      <cfelseif arguments.loan_amount LTE 2000000>
        <cfset a_ins_premium = 2490>
      <cfelseif arguments.loan_amount LTE 3000000>
        <cfset a_ins_premium = 3690>
      <cfelse>
        <cfset a_ins_premium = read_ins_calc.refinance>
      </cfif>

<!--- El Paso --->
<cfelseif ListContains("El Paso", arguments.property_county, ",")>
	  <cfif arguments.loan_amount LTE 100000>
        <cfset a_ins_premium = 565>
      <cfelseif arguments.loan_amount LTE 150000>
        <cfset a_ins_premium = 630>
      <cfelseif arguments.loan_amount LTE 200000>
        <cfset a_ins_premium = 690>
      <cfelseif arguments.loan_amount LTE 250000>
        <cfset a_ins_premium = 750>
      <cfelseif arguments.loan_amount LTE 300000>
        <cfset a_ins_premium = 810>
      <cfelseif arguments.loan_amount LTE 350000>
        <cfset a_ins_premium = 870>
      <cfelseif arguments.loan_amount LTE 400000>
        <cfset a_ins_premium = 931>
      <cfelseif arguments.loan_amount LTE 450000>
        <cfset a_ins_premium = 990>
      <cfelseif arguments.loan_amount LTE 500000>
        <cfset a_ins_premium = 1101>
      <cfelseif arguments.loan_amount LTE 550000>
        <cfset a_ins_premium = 1109>
      <cfelseif arguments.loan_amount LTE 600000>
        <cfset a_ins_premium = 1166>
      <cfelseif arguments.loan_amount LTE 700000>
        <cfset a_ins_premium = 1217>
      <cfelseif arguments.loan_amount LTE 800000>
        <cfset a_ins_premium = 1268>
      <cfelseif arguments.loan_amount LTE 900000>
        <cfset a_ins_premium = 1319>
      <cfelseif arguments.loan_amount LTE 1000000>
        <cfset a_ins_premium = 1370>
      <cfelse>
        <cfset a_ins_premium = read_ins_calc.refinance>
      </cfif>

<!--- Mesa --->
<cfelseif ListContains("Mesa", arguments.property_county, ",")>
	  <cfif arguments.loan_amount LTE 100000>
        <cfset a_ins_premium = 360>
      <cfelseif arguments.loan_amount LTE 150000>
        <cfset a_ins_premium = 437>
      <cfelseif arguments.loan_amount LTE 200000>
        <cfset a_ins_premium = 516>
      <cfelseif arguments.loan_amount LTE 250000>
        <cfset a_ins_premium = 589>
      <cfelseif arguments.loan_amount LTE 300000>
        <cfset a_ins_premium = 662>
      <cfelseif arguments.loan_amount LTE 350000>
        <cfset a_ins_premium = 738>
      <cfelseif arguments.loan_amount LTE 400000>
        <cfset a_ins_premium = 812>
      <cfelseif arguments.loan_amount LTE 450000>
        <cfset a_ins_premium = 886>
      <cfelseif arguments.loan_amount LTE 500000>
        <cfset a_ins_premium = 961>
      <cfelseif arguments.loan_amount LTE 550000>
        <cfset a_ins_premium = 979>
      <cfelseif arguments.loan_amount LTE 600000>
        <cfset a_ins_premium = 1092>
      <cfelseif arguments.loan_amount LTE 650000>
        <cfset a_ins_premium = 1156>
      <cfelseif arguments.loan_amount LTE 700000>
        <cfset a_ins_premium = 1220>
      <cfelseif arguments.loan_amount LTE 750000>
        <cfset a_ins_premium = 1283>
      <cfelseif arguments.loan_amount LTE 800000>
        <cfset a_ins_premium = 1346>
      <cfelseif arguments.loan_amount LTE 850000>
        <cfset a_ins_premium = 1410>
      <cfelseif arguments.loan_amount LTE 900000>
        <cfset a_ins_premium = 1473>
      <cfelseif arguments.loan_amount LTE 950000>
        <cfset a_ins_premium = 1536>
      <cfelseif arguments.loan_amount LTE 1000000>
        <cfset a_ins_premium = 1600>
      <cfelseif arguments.loan_amount LTE 1500000>
        <cfset a_ins_premium = 1838>
      <cfelseif arguments.loan_amount LTE 2000000>
        <cfset a_ins_premium = 2458>
      <cfelseif arguments.loan_amount LTE 3000000>
        <cfset a_ins_premium = 3700>
      <cfelse>
        <cfset a_ins_premium = read_ins_calc.refinance>
      </cfif>

<!--- All counties that are left --->
<cfelse>
	  <cfif arguments.loan_amount LTE 100000>
        <cfset a_ins_premium = 490>
      <cfelseif arguments.loan_amount LTE 150000>
        <cfset a_ins_premium = 540>
      <cfelseif arguments.loan_amount LTE 200000>
        <cfset a_ins_premium = 590>
      <cfelseif arguments.loan_amount LTE 300000>
        <cfset a_ins_premium = 690>
      <cfelseif arguments.loan_amount LTE 400000>
        <cfset a_ins_premium = 790>
      <cfelseif arguments.loan_amount LTE 500000>
        <cfset a_ins_premium = 990>
      <cfelseif arguments.loan_amount LTE 750000>
        <cfset a_ins_premium = 1040>
      <cfelseif arguments.loan_amount LTE 1000000>
        <cfset a_ins_premium = 1290>
      <cfelseif arguments.loan_amount LTE 1500000>
        <cfset a_ins_premium = 1790>
      <cfelseif arguments.loan_amount LTE 2000000>
        <cfset a_ins_premium = 2390>
      <cfelseif arguments.loan_amount LTE 3000000>
        <cfset a_ins_premium = 3590>
      <cfelse>
        <cfset a_ins_premium = read_ins_calc.refinance>
      </cfif>
</cfif>
<cfset request.got_reissue_rate = 1>
</cfif>


<!--- begin WFG --->
<cfif get_comp_info.allow_reissue_rates eq 'True' and arguments.reissue_rates eq 1 and arguments.underwriter_choice eq 33>


<cfif arguments.property_state eq 'WV'>
	  <cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
      <cfif arguments.previous_loan_year eq 0>
      <cfset arguments.previous_loan_year = 1996>
      </cfif>
      <cfif arguments.previous_loan_month eq 0>
      <cfset arguments.previous_loan_month = 1>
      </cfif>
      
      <cfif Numyears LTE 5>
      <cfset a_ins_premium = read_ins_calc.Refinance * .60>
      <cfset request.got_reissue_rate = 1>
      </cfif>
         <cfif a_ins_premium LT 125>
         <cfset a_ins_premium = 125>
         </cfif>

<cfelseif arguments.property_state eq 'VA'>
	  <cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
      <cfif arguments.previous_loan_year eq 0>
      <cfset arguments.previous_loan_year = 1996>
      </cfif>
      <cfif arguments.previous_loan_month eq 0>
      <cfset arguments.previous_loan_month = 1>
      </cfif>
      
      <cfif Numyears LTE 15>
      <cfset a_ins_premium = read_ins_calc.Refinance * .70>
      <cfset request.got_reissue_rate = 1>
      </cfif>
         <cfif a_ins_premium LT 100>
         <cfset a_ins_premium = 100>
         </cfif>

<cfelseif arguments.property_state eq 'SC'>
	  <cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
      <cfif arguments.previous_loan_year eq 0>
      <cfset arguments.previous_loan_year = 1996>
      </cfif>
      <cfif arguments.previous_loan_month eq 0>
      <cfset arguments.previous_loan_month = 1>
      </cfif>
      
      <cfif Numyears LTE 10>
      <cfset a_ins_premium = read_ins_calc.Refinance * .50>
      <cfset request.got_reissue_rate = 1>
      </cfif>
         <cfif a_ins_premium LT 100>
         <cfset a_ins_premium = 100>
         </cfif>


<cfelseif arguments.property_state eq 'RI'>
	  <cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
      <cfif arguments.previous_loan_year eq 0>
      <cfset arguments.previous_loan_year = 1996>
      </cfif>
      <cfif arguments.previous_loan_month eq 0>
      <cfset arguments.previous_loan_month = 1>
      </cfif>
      
      <cfset a_ins_premium = read_ins_calc.Refinance * .60>
      <cfset request.got_reissue_rate = 1>
         <cfif a_ins_premium LT 75>
         <cfset a_ins_premium = 75>
         </cfif>


<cfelseif arguments.property_state eq 'NH'>
	  <cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
      <cfif arguments.previous_loan_year eq 0>
      <cfset arguments.previous_loan_year = 1996>
      </cfif>
      <cfif arguments.previous_loan_month eq 0>
      <cfset arguments.previous_loan_month = 1>
      </cfif>
      
      <cfif Numyears LTE 10>
      <cfset a_ins_premium = read_ins_calc.Refinance * .60>
      <cfset request.got_reissue_rate = 1>
      </cfif>
      <cfset request.got_reissue_rate = 1>
         <cfif a_ins_premium LT 50>
         <cfset a_ins_premium = 50>
         </cfif>



</cfif>
</cfif> <!--- end WFG --->

<!---<cfif IsDefined("session.ft_user_id") and session.ft_user_id eq 248>
<cfoutput>
arguments.underwriter_choice = #arguments.underwriter_choice#
</cfoutput>
<cfabort>
</cfif>--->

<cfif get_comp_info.allow_reissue_rates eq 'True' and arguments.reissue_rates eq 1 and arguments.underwriter_choice eq 16>
<cfset owners_states = "AL,DC,FL,LA,MD,MO,OH,VA,WV" >

<cfif arguments.previous_purch_year eq 0>
<cfset arguments.previous_purch_year = 1996>
</cfif>
<cfif arguments.previous_purch_month eq 0>
<cfset arguments.previous_purch_month = 1>
</cfif>

<cfif arguments.previous_loan_year eq 0>
<cfset arguments.previous_loan_year = 1996>
</cfif>
<cfif arguments.previous_loan_month eq 0>
<cfset arguments.previous_loan_month = 1>
</cfif>

<cfif arguments.property_state eq 'KS'>
<cfif ListFindNoCase(owners_states, arguments.property_state, ",")>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_purch_year, arguments.previous_purch_month, 1), Now())>
<cfelse>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
</cfif>
<cfif Numyears LTE 10>
<cfset a_ins_premium = read_ins_calc.Refinance * .60>
<cfset request.got_reissue_rate = 1>
</cfif>
</cfif>



<cfif ListFindNoCase(owners_states, arguments.property_state, ",")>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_purch_year, arguments.previous_purch_month, 1), Now())>
<cfelse>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
</cfif>
<cfif arguments.property_state eq 'AL'>
<cfset a_ins_premium = a_ins_premium * .66>
<cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'AZ'>
<cfset a_ins_premium = a_ins_premium * .65>
   <cfif a_ins_premium LT 323>
   <cfset a_ins_premium = 323>
   </cfif>
<cfset request.got_reissue_rate = 1>






<cfelseif arguments.property_state eq 'DC' and Numyears LTE 7>
  <cfset discount_amt = 0>  
 <cfif arguments.loan_amount lte 50000>
 <cfset a_ins_premium =  (((arguments.loan_amount) / 1000) * 2.70)>
 <cfelseif arguments.loan_amount lte 100000>
  <cfset a_ins_premium =  (((50000) / 1000) * 2.70)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 50000) / 1000) * 2.34)>
 <cfelseif arguments.loan_amount lte 500000>
  <cfset a_ins_premium =  (((50000) / 1000) * 2.70)>
   <cfset a_ins_premium =  a_ins_premium + (((50000) / 1000) * 2.34)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 100000) / 1000) * 1.98)>
 <cfelseif arguments.loan_amount lte 10000000>
  <cfset a_ins_premium =  (((50000) / 1000) * 2.70)>
   <cfset a_ins_premium =  a_ins_premium + (((50000) / 1000) * 2.34)>
 <cfset a_ins_premium =  a_ins_premium + (((400000) / 1000) * 1.98)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 500000) / 1000) * 1.62)>
 </cfif> 
 <cfset a_ins_premium = NumberFormat(a_ins_premium, "____.__")>
<cfset request.got_reissue_rate = 1>





<!--- Delaware – policy 5 yrs old - $1.95 up to 100k, 1.55 – 100k to $1mil, 1.35, $1mil o $5mil --->
<cfelseif arguments.property_state eq 'DE' and Numyears LTE 5>
  <cfset discount_amt = 0>  
 <cfif arguments.loan_amount lte 100000>
 <cfset a_ins_premium =  (((arguments.loan_amount) / 1000) * 1.95)>
 <cfset request.got_reissue_rate = 1>
<cfelseif arguments.loan_amount lte 1000000>
  <cfset a_ins_premium =  (((100000) / 1000) * 1.95)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 100000) / 1000) * 1.55)>
<cfset request.got_reissue_rate = 1>
<cfelseif arguments.loan_amount lte 5000000>
  <cfset a_ins_premium =  (((100000) / 1000) * 1.95)>
   <cfset a_ins_premium =  a_ins_premium + (((1000000) / 1000) * 1.55)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 1000000) / 1000) * 1.35)>
 </cfif> 
 <cfset a_ins_premium = NumberFormat(a_ins_premium, "____.__")>
<cfset request.got_reissue_rate = 1>
 <cfif a_ins_premium lt 130>
  <cfset a_ins_premium = 130>
 </cfif>

<!--- Florida – 3 yrs, 3.30 up to 100k, 3.00, 100 to 1mil, 2, $1mil to $10mil --->
<cfelseif arguments.property_state eq 'FL'>
  <cfset discount_amt = 0>  
 <cfif arguments.loan_amount lte 100000>
 <cfset a_ins_premium =  (((arguments.loan_amount) / 1000) * 3.30)>
 <cfelseif arguments.loan_amount lte 1000000>
  <cfset a_ins_premium =  (((100000) / 1000) * 3.30)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 100000) / 1000) * 3.00)>
 <cfelseif arguments.loan_amount lte 10000000>
  <cfset a_ins_premium =  (((100000) / 1000) * 3.30)>
   <cfset a_ins_premium =  a_ins_premium + (((1000000) / 1000) * 3.00)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 1000000) / 1000) * 2.00)>
 </cfif> 
 <cfset a_ins_premium = NumberFormat(a_ins_premium, "____.__")>
<cfset request.got_reissue_rate = 1>

<cfelseif arguments.property_state eq 'ID' and Numyears LTE 2>
<cfset a_ins_premium = a_ins_premium * .50>
<cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'IN' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .60>
<cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'IL' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .70>
<cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'IA' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .70>
<cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'KY' and Numyears LTE 5>
<cfset a_ins_premium = a_ins_premium * .70>
<cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'LA' and Numyears LTE 7>
<cfset a_ins_premium = a_ins_premium * .60>
<cfset request.got_reissue_rate = 1>

<!--- Maryland – 7 yrs – up to 250k - 1.56, up to 500k - 1.35, up to $1mil - 1.14, up to $5mil- .96 --->

<!---<cfelseif arguments.property_state eq 'MD' and Numyears LTE 7>

  <cfset discount_amt = 0>  
 <cfif arguments.loan_amount lte 250000>
 <cfset a_ins_premium =  (((arguments.loan_amount) / 1000) * 2.47)>
 <cfelseif arguments.loan_amount lte 500000>
  <cfset a_ins_premium =  (((250000) / 1000) * 2.47)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 250000) / 1000) * 2.14)>
<cfset request.got_reissue_rate = 1>
 <cfelseif arguments.loan_amount lte 1000000>
  <cfset a_ins_premium =  (((250000) / 1000) * 2.47)>
 <cfset a_ins_premium =  a_ins_premium + (((250000) / 1000) * 2.14)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 500000) / 1000) * 1.81)>
 <cfelseif arguments.loan_amount gt 1000000>
  <cfset a_ins_premium =  (((250000) / 1000) * 2.47)>
 <cfset a_ins_premium =  a_ins_premium + (((250000) / 1000) * 2.14)>
 <cfset a_ins_premium =  a_ins_premium + (((500000) / 1000) * 1.81)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 1000000) / 1000) * 1.49)>
 </cfif> 
 <cfset a_ins_premium = NumberFormat(a_ins_premium, "____.__")>
 <cfif a_ins_premium LT 92>
 <cfset a_ins_premium = 92>
 </cfif>
<cfset request.got_reissue_rate = 1>--->
 <cfelseif arguments.property_state eq 'MS' and Numyears LTE 6>
<cfset a_ins_premium = a_ins_premium * .60>
<cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'MS' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .80>
<cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'MO' and Numyears LTE 10>
		 <cfif arguments.loan_amount lte 50000>
		 <cfset a_ins_premium =  (((arguments.loan_amount) / 1000) * .60)>
		 <cfelseif arguments.loan_amount lte 100000>
		  <cfset a_ins_premium =  (((50000) / 1000) * .60)>
		 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 50000) / 1000) * .48)>
		 <cfelseif arguments.loan_amount lte 5000000>
		  <cfset a_ins_premium =  (((50000) / 1000) * .60)>
		  <cfset a_ins_premium =  a_ins_premium + (((50000) / 1000) * .48)>
		 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 100000) / 1000) * .42)>
		 </cfif> 
		 <cfset a_ins_premium = NumberFormat(a_ins_premium, "____.__")>
		<cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'MT' and Numyears LTE 3>
<cfset a_ins_premium = a_ins_premium * .5>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'NE' and Numyears LTE 5>
<cfset a_ins_premium = a_ins_premium * .6>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'NC' and Numyears LTE 15>
<cfset a_ins_premium = a_ins_premium * .50>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'ND' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .60>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'PA' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .90>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'OH' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .70>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'RI' and Numyears LTE 10>
	<cftry>
    <cfset a_ins_premium = a_ins_premium * .60>
	<cfcatch type="any">
	<CFSET a_ins_premium = 'Call for Quote!'>
	</cfcatch>
	</cftry>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'SC' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .60>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'SD'>
<cftry>
<cfset a_ins_premium = a_ins_premium * .75>
<cfcatch type="any">
<cfset a_ins_premium = "Call for Quote!">
</cfcatch>
</cftry>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'TN' and Numyears LTE 15>
<cfset a_ins_premium = a_ins_premium * .70>
<cfif a_ins_premium LT 150>
<cfset a_ins_premium = 150>
</cfif>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'UT' and Numyears LTE 7>
<cftry>
<cfset a_ins_premium = a_ins_premium * .60>
<cfcatch type="any">
<cfset a_ins_premium = "Call for Quote!">
</cfcatch>
</cftry>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'VT'>
<cftry>
<cfset a_ins_premium = a_ins_premium * .5>
<cfcatch type="any">
<cfset a_ins_premium = "Call for Quote!">
</cfcatch>
</cftry>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'WA' and Numyears LTE 5>
<cfset a_ins_premium = a_ins_premium * .80>
<cfif a_ins_premium LT 270>
<cfset a_ins_premium = 270>
</cfif>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'WI'>
<cfset a_ins_premium = a_ins_premium * .90>
<cfif a_ins_premium LT 375>
<cfset a_ins_premium = 375>
</cfif>
    <cfset got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'WV' and Numyears LTE 5>
<cfset a_ins_premium = a_ins_premium * .60>
 <cfif a_ins_premium lt 125>
  <cfset a_ins_premium = 125>
 </cfif>
    <cfset request.got_reissue_rate = 1>

<cfelseif arguments.property_state eq 'WY' and Numyears LTE 5>
<cfset a_ins_premium = a_ins_premium * .50>
    <cfset request.got_reissue_rate = 1>
</cfif>

<cfelseif get_comp_info.allow_reissue_rates eq 'True' and arguments.reissue_rates eq 1 and underwriter_choice eq 29><!--- Chicago Title --->
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>

<cfif arguments.property_state eq 'WV' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .60>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'MD'>
<cfset a_ins_premium = read_ins_calc.reissue>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'DC' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .60>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'VA' and Numyears LTE 10>
<cfset a_ins_premium = read_ins_calc.reissue>
    <cfset request.got_reissue_rate = 1>
</cfif>


<cfif arguments.property_state eq 'KS'>
<cfif ListFindNoCase(owners_states, arguments.property_state, ",")>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_purch_year, arguments.previous_purch_month, 1), Now())>
<cfelse>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
</cfif>
<cfif Numyears LTE 10>
<cfset a_ins_premium = read_ins_calc.Refinance * .60>
    <cfset request.got_reissue_rate = 1>
</cfif>
</cfif>


<cfelseif get_comp_info.allow_reissue_rates eq 'True' and arguments.reissue_rates eq 1 and underwriter_choice eq 25><!--- First American --->
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
<cfif arguments.property_state eq 'DC' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .60>
    <cfset request.got_reissue_rate = 1>
</cfif>

<cfif arguments.property_state eq 'MD' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .60>
    <cfset request.got_reissue_rate = 1>
</cfif>


<cfif arguments.property_state eq 'TN' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .75>
    <cfset request.got_reissue_rate = 1>
</cfif>

<cfif arguments.property_state eq 'KS' and Numyears LTE 10>
<cfset a_ins_premium = read_ins_calc.Refinance * .60>
    <cfset request.got_reissue_rate = 1>
</cfif>

<!--- Delaware – policy 5 yrs old - $1.95 up to 100k, 1.55 – 100k to $1mil, 1.35, $1mil o $5mil --->
<cfif arguments.property_state eq 'DE' and Numyears LTE 5>
  <cfset discount_amt = 0>  
 <cfif arguments.loan_amount lte 100000>
 <cfset a_ins_premium =  (((arguments.loan_amount) / 1000) * 1.95)>
 <cfelseif arguments.loan_amount lte 1000000>
  <cfset a_ins_premium =  (((100000) / 1000) * 1.95)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 100000) / 1000) * 1.55)>
 <cfelseif arguments.loan_amount lte 5000000>
  <cfset a_ins_premium =  (((100000) / 1000) * 1.95)>
   <cfset a_ins_premium =  a_ins_premium + (((1000000) / 1000) * 1.55)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 1000000) / 1000) * 1.35)>
 </cfif> 
 <cfset a_ins_premium = NumberFormat(a_ins_premium, "____.__")>
</cfif>
    <cfset request.got_reissue_rate = 1>
 <cfif a_ins_premium lt 130>
  <cfset a_ins_premium = 130>
 </cfif>

<cfelseif get_comp_info.allow_reissue_rates eq 'True' and arguments.reissue_rates eq 1 and arguments.underwriter_choice eq 30>
<!--- NAtiC --->
<cfset owners_states = "DC,FL,MD,MI,MN,MS" >

<cfif arguments.previous_purch_year eq 0>
<cfset arguments.previous_purch_year = 1996>
</cfif>
<cfif arguments.previous_purch_month eq 0>
<cfset arguments.previous_purch_month = 1>
</cfif>

<cfif arguments.previous_loan_year eq 0>
<cfset arguments.previous_loan_year = 1996>
</cfif>
<cfif arguments.previous_loan_month eq 0>
<cfset arguments.previous_loan_month = 1>
</cfif>


<cfif ListFindNoCase(owners_states, arguments.property_state, ",")>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_purch_year, arguments.previous_purch_month, 1), Now())>
<cfelse>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
</cfif>



<cfif arguments.property_state eq 'KS'>
<cfif ListFindNoCase(owners_states, arguments.property_state, ",")>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_purch_year, arguments.previous_purch_month, 1), Now())>
<cfelse>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
</cfif>
<cfif Numyears LTE 10>
<cfset a_ins_premium = read_ins_calc.Refinance * .60>
    <cfset request.got_reissue_rate = 1>
</cfif>
<cfelseif arguments.property_state eq 'AL' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .60>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'AZ' and Numyears LTE 5>
<cfset a_ins_premium = a_ins_premium * .80>
 <cfif a_ins_premium lt 350>
  <cfset a_ins_premium = 350>
 </cfif>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'DC' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .60>
    <cfset request.got_reissue_rate = 1>
<!--- Delaware – policy 5 yrs old - $1.65 up to 100k, 1.30 – 100k to $1mil, 1.15, $1mil o $5mil --->
<!--- Delaware – policy 5 yrs old - $1.95 up to 100k, 1.55 – 100k to $1mil, 1.35, $1mil o $5mil --->
<cfelseif arguments.property_state eq 'DE' and Numyears LTE 5>
  <cfset discount_amt = 0>  
 <cfif arguments.loan_amount lte 100000>
 <cfset a_ins_premium =  (((arguments.loan_amount) / 1000) * 1.95)>
 <cfelseif arguments.loan_amount lte 1000000>
  <cfset a_ins_premium =  (((100000) / 1000) * 1.95)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 100000) / 1000) * 1.55)>
 <cfelseif arguments.loan_amount lte 5000000>
  <cfset a_ins_premium =  (((100000) / 1000) * 1.95)>
   <cfset a_ins_premium =  a_ins_premium + (((1000000) / 1000) * 1.55)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 1000000) / 1000) * 1.35)>
 </cfif> 
 <cfset a_ins_premium = NumberFormat(a_ins_premium, "____.__")>
    <cfset request.got_reissue_rate = 1>
 <cfif a_ins_premium lt 130>
  <cfset a_ins_premium = 130>
 </cfif>

<cfelseif arguments.property_state eq 'DE' and Numyears LTE 3>
		<CFQUERY datasource="#request.dsn#" NAME="get_rates" maxrows="1">
		SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
		</CFQUERY>
<cfset a_ins_premium = get_rates.reissue>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'FL' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .60>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'IN' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .60>
 <cfif a_ins_premium lt 100>
  <cfset a_ins_premium = 100>
 </cfif>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'KY' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .60>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'MD' and Numyears LTE 10>
		<CFQUERY datasource="#request.dsn#" NAME="get_rates" maxrows="1">
		SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
		</CFQUERY>
<cfset a_ins_premium = get_rates.reissue>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'MA' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .60>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'MI' and Numyears LTE 2>
<cfset a_ins_premium = a_ins_premium * .75>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'MN' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .60>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'MS' and Numyears LTE 40>
<cfset a_ins_premium = a_ins_premium * .60>
 <cfif a_ins_premium lt 250>
  <cfset a_ins_premium = 250>
 </cfif>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'NC' and Numyears LTE 15>
<cfset a_ins_premium = a_ins_premium * .5>
 <cfif a_ins_premium lt 50>
  <cfset a_ins_premium = 50>
 </cfif>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'OH' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .7>
 <cfif a_ins_premium lt 125>
  <cfset a_ins_premium = 125>
 </cfif>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'SC' and Numyears LTE 5>
<cfset a_ins_premium = a_ins_premium * .5>
 <cfif a_ins_premium lt 50>
  <cfset a_ins_premium = 50>
 </cfif>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'TN' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .7>
 <cfif a_ins_premium lt 200>
  <cfset a_ins_premium = 200>
 </cfif>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'VA' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .7>
 <cfif a_ins_premium lt 275>
  <cfset a_ins_premium = 275>
 </cfif>
    <cfset request.got_reissue_rate = 1>
<cfelseif arguments.property_state eq 'WI' and Numyears LTE 10>
<cfset a_ins_premium = a_ins_premium * .7>
 <cfif a_ins_premium lt 280>
  <cfset a_ins_premium = 280>
 </cfif>
    <cfset request.got_reissue_rate = 1>
</cfif>


</cfif>

<cfreturn  a_ins_premium>

</cffunction>

<!--- GetSubrates function --->
<cffunction name="GetSubrates" >
<cfargument name="a_ins_premium">
<cfargument name="previous_loan_year">
<cfargument name="previous_loan_month">
<cfargument name="previous_purch_year">
<cfargument name="previous_purch_month">
<cfargument name="previous_purch_amount">
<cfargument name="transaction_type">
<cfargument name="same_lender">
<cfargument name="property_state">
<cfargument name="previous_loan_amount">
<cfargument name="loan_amount">
<cfargument name="underwriter_choice" default="16">
<cfset a_ins_premium = arguments.a_ins_premium>

<!--- SUBSTITUTION RATES - these rates are applied to the Loan Policy rate if the policy is issued by the same lender --->
<!--- now we'll see if this company is allowed Substitution Rates, and if so, figure them out --->

<cfset current_ins_premium = a_ins_premium>
<cfif get_all_comp_info.allow_subrates eq 1>


<cftry>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_purch_year, arguments.previous_purch_month, 1), Now())>
<cfcatch type="any">
</cfcatch>
</cftry>

<cftry>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
<cfcatch type="any">
</cfcatch>
</cftry>


<cfif (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1) and arguments.same_lender eq 1 and NumYears LT 15>




<cfif arguments.property_state eq 'NM'>
<CFSET   x_final  = #Ceiling(arguments.previous_loan_amount)#>
		<CFQUERY datasource="#request.dsn#" NAME="get_subrates" maxrows="1">
		SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
		</CFQUERY>
        <cfif NumYears LT 2>
		<cfset a_ins_premium = NumberFormat((get_subrates.sale * .40), "____.__")>
        <cfelseif NumYears LT 3>
		<cfset a_ins_premium = NumberFormat((get_subrates.sale * .45), "____.__")>
        <cfelseif NumYears LT 4>
		<cfset a_ins_premium = NumberFormat((get_subrates.sale * .50), "____.__")>
        <cfelseif NumYears LT 5>
		<cfset a_ins_premium = NumberFormat((get_subrates.sale * .55), "____.__")>
        <cfelseif NumYears LT 6>
		<cfset a_ins_premium = NumberFormat((get_subrates.sale * .60), "____.__")>
        <cfelseif NumYears LT 7>
		<cfset a_ins_premium = NumberFormat((get_subrates.sale * .65), "____.__")>
        <cfelseif NumYears LT 8>
		<cfset a_ins_premium = NumberFormat((get_subrates.sale * .70), "____.__")>
        <cfelseif NumYears LT 9>
		<cfset a_ins_premium = NumberFormat((get_subrates.sale * .75), "____.__")>
        <cfelseif NumYears LT 10>
		<cfset a_ins_premium = NumberFormat((get_subrates.sale * .80), "____.__")>
		</cfif>
</cfif>

<cfif arguments.underwriter_choice eq 16><!--- Stewart --->

<cfif arguments.property_state eq 'DC'>
<CFSET   x_final  = #Ceiling(arguments.previous_loan_amount)#>
		<CFQUERY datasource="#request.dsn#" NAME="get_subrates" maxrows="1">
		SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
		</CFQUERY>
        <cfif NumYears LTE 3>
		<cfset a_ins_premium = (get_subrates.refinance * .30)>
		<cfelseif  NumYears LT 4>
		<cfset a_ins_premium = (get_subrates.refinance * .40)>
		<cfelseif  NumYears LT 5>
		<cfset a_ins_premium = (get_subrates.refinance * .50)>
		<cfelseif  NumYears LTE 7>
		<cfset a_ins_premium = (get_subrates.refinance * .60)>
		</cfif>
		<cfif arguments.loan_amount GT arguments.previous_loan_amount>
		<CFSET   x_final  = #Ceiling(arguments.loan_amount-arguments.previous_loan_amount)#>
		<CFQUERY datasource="#request.dsn#" NAME="get_rates" maxrows="1">
		SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
		</CFQUERY>
		<cfset a_ins_premium = a_ins_premium + (get_rates.refinance)>
        </cfif>
        <cfset current_ins_premium = a_ins_premium>
<cfelseif arguments.property_state eq 'AL'>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelseif arguments.property_state eq 'AZ'>
<cfset a_ins_premium = (a_ins_premium * .65)>
<cfelseif arguments.property_state eq 'CT'>
		<CFQUERY datasource="#request.dsn#" NAME="get_subrates" maxrows="1">
		SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
		</CFQUERY>
<cfif Numyears LTE 10>
<cfset a_ins_premium = (get_subrates.refinance * .60)>
</cfif>
<cfelseif arguments.property_state eq 'DE'>
<cfif Numyears LTE 5>
<cfset a_ins_premium = (a_ins_premium * .60)>
</cfif>
 <cfelseif arguments.property_state eq 'IN'>
	<cfif arguments.loan_amount LT 100000>
	<cfset a_ins_premium = (a_ins_premium * .60)>
	<cfelseif arguments.loan_amount LT 5000000>
	<cfset a_ins_premium = (a_ins_premium * .75)>
	</cfif>
<cfelseif arguments.property_state eq 'KY'>
<cfif Numyears LTE 3>
<cfset a_ins_premium = (a_ins_premium * .30)>
<cfelseif Numyears LTE 4>
<cfset a_ins_premium = (a_ins_premium * .40)>
<cfelseif Numyears LTE 5>
<cfset a_ins_premium = (a_ins_premium * .50)>
<cfelseif Numyears LTE 6>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelseif Numyears LTE 7>
<cfset a_ins_premium = (a_ins_premium * .70)>
<cfelseif Numyears LTE 8>
<cfset a_ins_premium = (a_ins_premium * .80)>
<cfelse>
<cfset a_ins_premium = a_ins_premium>
</cfif>

<cfelseif arguments.property_state eq 'FL' or  arguments.property_state eq 'IL' or  arguments.property_state eq 'WI'>

<cfif Numyears LT 3>
<cfset a_ins_premium = (a_ins_premium * .30)>
<cfelseif Numyears LT 4>
<cfset a_ins_premium = (a_ins_premium * .40)>
<cfelseif Numyears LT 5>
<cfset a_ins_premium = (a_ins_premium * .50)>
<cfelseif Numyears LTE 10>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelse>
<cfset a_ins_premium = a_ins_premium>
</cfif>

 <cfelseif arguments.property_state eq 'LA'>
<cfif IsNumeric(a_ins_premium)>
<cfset a_ins_premium = (a_ins_premium * .60)>
</cfif>
<cfelseif arguments.property_state eq 'MA'>
<cfif IsNumeric(a_ins_premium)>
<cfset a_ins_premium = (a_ins_premium * .60)>
</cfif>
<cfelseif arguments.property_state eq 'ME'>
<cfif Numyears LTE 5>
<cfif IsNumeric(a_ins_premium)>
<cfset a_ins_premium = (a_ins_premium * .80)>
</cfif>
<cfelse>
<cfset a_ins_premium = a_ins_premium>
</cfif>

<!--- Maryland – 7 yrs – up to 250k - 1.56, up to 500k - 1.35, up to $1mil - 1.14, up to $5mil- .96 --->

<cfelseif arguments.property_state eq 'MD' and Numyears LTE 7>
  <cfset discount_amt = 0>  
 <cfif arguments.loan_amount lte 250000>
 <cfset a_ins_premium =  (((arguments.loan_amount) / 1000) * 1.56)>
 <cfelseif arguments.loan_amount lte 500000>
  <cfset a_ins_premium =  (((250000) / 1000) * 1.56)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 250000) / 1000) * 1.35)>
 <cfelseif arguments.loan_amount lte 1000000>
  <cfset a_ins_premium =  (((250000) / 1000) * 1.56)>
 <cfset a_ins_premium =  a_ins_premium + (((250000) / 1000) * 1.35)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 500000) / 1000) * 1.14)>
 <cfelseif arguments.loan_amount gt 1000000>
  <cfset a_ins_premium =  (((250000) / 1000) * 1.56)>
 <cfset a_ins_premium =  a_ins_premium + (((250000) / 1000) * 1.35)>
 <cfset a_ins_premium =  a_ins_premium + (((500000) / 1000) * 1.14)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 1000000) / 1000) * .96)>
 </cfif> 
 <cfset a_ins_premium = NumberFormat(a_ins_premium, "____.__")>


<cfelseif arguments.property_state eq 'MN'>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelseif arguments.property_state eq 'MI'>
		<CFQUERY datasource="#request.dsn#" NAME="get_rates" maxrows="1">
		SELECT * FROM #get_table.table_to_use# WHERE a_to >= #arguments.loan_amount# order by a_to
		</CFQUERY>
<cfset a_ins_premium = (get_rates.refinance)>
<cfelseif arguments.property_state eq 'MS'>
<cfif Numyears LTE 6>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelseif Numyears LTE 10>
<cfset a_ins_premium = (a_ins_premium * .80)>
<cfelse>
<cfset a_ins_premium = a_ins_premium>
</cfif>
<cfelseif arguments.property_state eq 'MO'>
<cfset a_ins_premium = (a_ins_premium * .75)>
<cfelseif arguments.property_state eq 'MT'>
<cfif Numyears LTE 3>
<cfset a_ins_premium = (a_ins_premium * .50)>
</cfif>
<cfelseif arguments.property_state eq 'NC'>
<cfif Numyears LTE 15>
<cfset a_ins_premium = (a_ins_premium * .50)>
</cfif>
<cfelseif arguments.property_state eq 'ND'>
	<cfif Numyears LTE 3>
	<cfset a_ins_premium = (a_ins_premium * .30)>
	<cfelseif Numyears LTE 4>
	<cfset a_ins_premium = (a_ins_premium * .40)>
	<cfelseif Numyears LTE 5>
	<cfset a_ins_premium = (a_ins_premium * .50)>
	<cfelseif Numyears LTE 10>
	<cfset a_ins_premium = (a_ins_premium * .60)>
	</cfif>

<cfelseif arguments.property_state eq 'NJ'>
		<CFSET   x_final  = #Ceiling(arguments.previous_loan_amount)#>
				<CFQUERY datasource="#request.dsn#" NAME="get_subrates" maxrows="1">
				SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
				</CFQUERY>
		<cfset a_ins_premium = NumberFormat((get_subrates.subrates), "____.__")>
<cfelseif arguments.property_state eq 'NH'>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelseif arguments.property_state eq 'NE'>
<cfif Numyears LTE 3>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelse>
<cfset a_ins_premium = a_ins_premium>
</cfif>
<cfelseif arguments.property_state eq 'OH'>
<cfif Numyears LTE 10>
<cfset a_ins_premium = (a_ins_premium * .70)>
</cfif>
<cfelseif arguments.property_state eq 'RI'>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelseif arguments.property_state eq 'SC'>
<cfset a_ins_premium = (a_ins_premium * .60)>
<cfelseif arguments.property_state eq 'ME'>
<cfif Numyears LTE 5>
<cfif IsNumeric(a_ins_premium)>
<cfset a_ins_premium = (a_ins_premium * .80)>
</cfif>
<cfelse>
<cfset a_ins_premium = a_ins_premium>
</cfif>
<cfelseif arguments.property_state eq 'TN'>
<cfif Numyears LTE 5>
<cfif IsNumeric(a_ins_premium)>
<cfset a_ins_premium = (a_ins_premium * .60)>
</cfif>
<cfif IsNumeric(a_ins_premium) and a_ins_premium LT 150>
<cfset a_ins_premium = 150>
</cfif>

</cfif>
<cfelseif arguments.property_state eq 'VT'>
<cfif IsNumeric(a_ins_premium)>
<cfset a_ins_premium = (a_ins_premium * .60)>
</cfif>
<cfelseif arguments.property_state eq 'WV'>
<cfif IsNumeric(a_ins_premium)>
<cfset a_ins_premium = (a_ins_premium * .70)>
</cfif>
<cfelse>
<cfset current_ins_premium = a_ins_premium>
</cfif>
<cfelseif arguments.underwriter_choice eq 30><!--- NATIC --->

	<cfif arguments.property_state eq 'AL' and Numyears LTE 10>
	<cfset a_ins_premium = (a_ins_premium * .60)>
	<cfelseif arguments.property_state eq 'FL' and Numyears LTE 10>
        <cfif NumYears LTE 3>
		<cfset a_ins_premium = NumberFormat((a_ins_premium * .70), "____.__")>
        <cfelseif NumYears LTE 4>
		<cfset a_ins_premium = NumberFormat((a_ins_premium * .60), "____.__")>
        <cfelseif NumYears LTE 5>
		<cfset a_ins_premium = NumberFormat((a_ins_premium * .50), "____.__")>
        <cfelseif NumYears LTE 10>
		<cfset a_ins_premium = NumberFormat((a_ins_premium * .40), "____.__")>
		</cfif>
	<cfelseif arguments.property_state eq 'KY' and Numyears LTE 10>
        <cfif NumYears LTE 3>
		<cfset a_ins_premium = NumberFormat((a_ins_premium * .70), "____.__")>
        <cfelseif NumYears LTE 5>
		<cfset a_ins_premium = NumberFormat((a_ins_premium * .60), "____.__")>
        <cfelseif NumYears LTE 10>
		<cfset a_ins_premium = NumberFormat((get_subrates.sale * .50), "____.__")>
		</cfif>
	<cfelseif arguments.property_state eq 'MI' and Numyears LTE 10>
        <cfif NumYears LTE 3>
		<cfset a_ins_premium = NumberFormat((a_ins_premium * .70), "____.__")>
        <cfelseif NumYears LTE 4>
		<cfset a_ins_premium = NumberFormat((a_ins_premium * .60), "____.__")>
        <cfelseif NumYears LTE 5>
		<cfset a_ins_premium = NumberFormat((a_ins_premium * .50), "____.__")>
        <cfelseif NumYears LTE 10>
		<cfset a_ins_premium = NumberFormat((get_subrates.sale * .40), "____.__")>
		</cfif>
			<cfif a_ins_premium LT 10>
			<cfset a_ins_premium eq 10>
			</cfif>
	<cfelseif arguments.property_state eq 'MS' and Numyears LTE 10>
        <cfif NumYears LTE 3>
		<cfset a_ins_premium = NumberFormat((a_ins_premium * .70), "____.__")>
        <cfelseif NumYears LTE 4>
		<cfset a_ins_premium = NumberFormat((a_ins_premium * .60), "____.__")>
        <cfelseif NumYears LTE 5>
		<cfset a_ins_premium = NumberFormat((a_ins_premium * .50), "____.__")>
        <cfelseif NumYears LTE 10>
		<cfset a_ins_premium = NumberFormat((get_subrates.sale * .40), "____.__")>
		</cfif>
			<cfif a_ins_premium LT 250>
			<cfset a_ins_premium eq 250>
			</cfif>
	<cfelseif arguments.property_state eq 'NJ'>
		<CFSET   x_final  = #Ceiling(arguments.previous_loan_amount)#>
				<CFQUERY datasource="#request.dsn#" NAME="get_subrates" maxrows="1">
				SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
				</CFQUERY>
		<cfset a_ins_premium = NumberFormat((get_subrates.subrates), "____.__")>
	<cfelseif arguments.property_state eq 'SC' and Numyears LTE 10>
		<cfset a_ins_premium = (a_ins_premium * .5)>
	<cfelseif arguments.property_state eq 'TN' and Numyears LT 10>
        <cfif NumYears LTE 5>
		<cfset a_ins_premium = NumberFormat((a_ins_premium * .50), "____.__")>
        <cfelseif NumYears LT 10>
		<cfset a_ins_premium = NumberFormat((a_ins_premium * .75), "____.__")>
		</cfif>
			<cfif a_ins_premium LT 200>
			<cfset a_ins_premium eq 200>
			</cfif>


	</cfif>

</cfif>
</cfif>
</cfif>
<cfset current_ins_premium = a_ins_premium>
</cffunction>

<!--- DetermineAltaLine function --->
<cffunction name="DetermineAltaLine" >
<cfquery dbtype="query" name="get_1100s"> 
SELECT *
FROM fees_query where line_number between 1100 and 1199
order by line_number
</cfquery>
<cfset line_num = 1122>
<cfset used_numbers = ValueList(get_1100s.line_number, ",")>
<cfset possible_numbers = "1122,1121,1120,1119,1118,1117,1116,1115,1114,1113,1112,1111,1110,1109">
<cfloop index="i" list="#possible_numbers#" delimiters=",">
<cfif NOT ListContainsNoCase(used_numbers, i, ",")>
<cfset line_num = i>
</cfif>
</cfloop>

	<cfreturn line_num>
</cffunction>

<!--- Determine1300Line function --->
<cffunction name="Determine1300Line" >
<cfquery dbtype="query" name="get_1300s"> 
SELECT *
FROM fees_query where line_number between 1300 and 1399
order by line_number
</cfquery>
<cfset line_num = 1314>
<cfset used_numbers = ValueList(get_1300s.line_number, ",")>
<cfset possible_numbers = "1314,1313,1312,1311,1310,1309,1308,1307,1306,1305,1304,1303,1302">
<cfloop index="i" list="#possible_numbers#" delimiters=",">
<cfif NOT ListContainsNoCase(used_numbers, i, ",")>
<cfset line_num = i>
</cfif>
</cfloop>

	<cfreturn line_num>
</cffunction>

<!--- GetSubEscrowAttorneyFees function --->
<cffunction name="GetSubEscrowAttorneyFees">
<cfargument name="property_state" type="string" default="">
<cfargument name="property_county" type="string" default="">
<cfargument name="transaction_type"  default="">
<cfargument name="company_id"  default="0">


<cfset new_line = DetermineAltaLine()>

<cfif arguments.property_state eq 'MA'>
<cfset temp = AddQueryItem(new_line, "Attorney Fee to PC Law Associates", NumberFormat(85, '_____.__'), "Buyer", 1)>
<cfset roll_up_1101 = roll_up_1101 + 85>
<cfset temp = AddQueryItem(new_line, "Title Services to PC Law Associates", NumberFormat(45, '_____.__'), "Buyer", 1)>
<cfset roll_up_1101 = roll_up_1101 + 45>

<cfelseif arguments.property_state eq 'WV'>
<cfset temp = AddQueryItem(new_line, "Attorney Fee to Jeremiah F. McCormick, Atty", NumberFormat(150, '_____.__'), "Buyer", 1)>
<cfset roll_up_1101 = roll_up_1101 + 150>

<cfelseif arguments.property_state eq 'SC'>
<cfset temp = AddQueryItem(new_line, "Attorney Fee to John A. DeFede Esq", NumberFormat(30, '_____.__'), "Buyer", 1)>
<cfset roll_up_1101 = roll_up_1101 + 30>

<cfelseif arguments.property_state eq 'NC'>
<cfset temp = AddQueryItem(new_line, "Attorney Fee to J. Gregory Fagan", NumberFormat(30, '_____.__'), "Buyer", 1)>
<cfset roll_up_1101 = roll_up_1101 + 30>
<cfset new_line = DetermineAltaLine()>
<cfset temp = AddQueryItem(new_line, "Recording Service Fee to Abstracts USA", NumberFormat(45, '_____.__'), "Buyer", 1)>
<cfset roll_up_1101 = roll_up_1101 + 45>

<cfelseif arguments.property_state eq 'AZ'>
<cfset temp = AddQueryItem(new_line, "Sub Escrow Fee to Placer Title", NumberFormat(160, '_____.__'), "Buyer", 1)>
<cfset roll_up_1101 = roll_up_1101 + 160>

<cfelseif arguments.property_state eq 'WA'>
<cfset temp = AddQueryItem(new_line, "Sub Escrow Fee to Stewart Title", NumberFormat(270, '_____.__'), "Buyer", 1)>
<cfset roll_up_1101 = roll_up_1101 + 270>

<cfelseif arguments.property_state eq 'NV'>
<cfset temp = AddQueryItem(new_line, "Escrow Fee to Placer Title Company", NumberFormat(450, '_____.__'), "Buyer", 1)>
<cfset roll_up_1101 = roll_up_1101 + 450>

<cfelseif arguments.property_state eq 'UT'>
<cfset temp = AddQueryItem(new_line, "Escrow Fee to Cottonwood Title", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset roll_up_1101 = roll_up_1101 + 75>
<cfset new_line = DetermineAltaLine()>
<cfset temp = AddQueryItem(new_line, "Processing Fee to Cottonwood Title", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset roll_up_1101 = roll_up_1101 + 75>


<cfelseif arguments.property_state eq 'CA'>
<cfset new_line = DetermineAltaLine()>
<cfset temp = AddQueryItem(1102, "Escrow Fee to Placer Title Company", NumberFormat(450, '_____.__'), "Buyer", 1)>
<cfset roll_up_1101 = roll_up_1101 + 450>

<cfelseif arguments.property_state eq 'TX' and (arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1)>
<cfset new_line = DetermineAltaLine()>
<cfset temp = AddQueryItem(new_line, "Doc Prep Fee", NumberFormat(75, '_____.__'), "Buyer", 1)>
<cfset roll_up_1101 = roll_up_1101 + 75>


</cfif>
</cffunction>

<!--- AddXMLItem function --->
<cffunction name="AddXMLItem" >
<cfargument name="LINE_NUMBER">
<cfargument name="DESCRIPTION">
<cfargument name="AMOUNT">
<cfargument name="PAYEE" default="Buyer">
<cfargument name="COMP_ID" default="0">
<cfargument name="OUTSIDE" default="0">
<cfargument name="PAYTO" default="">
<cfset count = 1>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count] = XmlElemNew(ReturnXml, "RESPA_FEE")>
<cfif Mid(arguments.LINE_NUMBER, 1, 2) eq 11>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes.RESPASectionClassificationType = "1100: Settlement Closing Fees">
<cfelseif  Mid(arguments.LINE_NUMBER, 1, 2) eq 12>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes.RESPASectionClassificationType = "1200: RecordingAndTransferCharges">
<cfelseif  Mid(arguments.LINE_NUMBER, 1, 2) eq 13>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes.RESPASectionClassificationType = "1300: AdditionalSettlementCharges">
<cfelse>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes.RESPASectionClassificationType = "ALTA">
</cfif>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToType = arguments.payto>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = "#arguments.DESCRIPTION#">
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._SpecifiedHUDLineNumber = "#arguments.LINE_NUMBER#">
<cfif arguments.COMP_ID neq 3704 and arguments.COMP_ID neq 3746 and  arguments.COMP_ID neq 3747 and  arguments.COMP_ID neq 3748>
<cfif (arguments.LINE_NUMBER eq 1301 or arguments.LINE_NUMBER eq 1302 or arguments.LINE_NUMBER eq 1303 or arguments.LINE_NUMBER eq 1304 or arguments.LINE_NUMBER eq 1305 or arguments.LINE_NUMBER eq 1306 or arguments.LINE_NUMBER eq 1307 or arguments.LINE_NUMBER eq 1308 or arguments.LINE_NUMBER eq 1309)>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = "First Title">
</cfif>
</cfif>

<cfif arguments.COMP_ID eq 3722 or arguments.COMP_ID eq 4752>
<cfif (arguments.LINE_NUMBER eq 1301 or arguments.LINE_NUMBER eq 1302 or arguments.LINE_NUMBER eq 1303 or arguments.LINE_NUMBER eq 1304 or arguments.LINE_NUMBER eq 1305 or arguments.LINE_NUMBER eq 1306 or arguments.LINE_NUMBER eq 1307 or arguments.LINE_NUMBER eq 1308 or arguments.LINE_NUMBER eq 1309)>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._PaidToTypeOtherDescription = "Community Real Estate Services, LLC">
</cfif>
</cfif>

 <cfif arguments.LINE_NUMBER eq 1303>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._Type = "#arguments.DESCRIPTION#">
</cfif>

<cfif arguments.Description  contains 'ALTA'>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._Type = "#arguments.DESCRIPTION#">
</cfif>
<cfif  arguments.LINE_NUMBER eq 1112>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._Type = "#arguments.DESCRIPTION#">
</cfif>
<cfif arguments.LINE_NUMBER eq 1205>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].xmlAttributes._Type = "#arguments.DESCRIPTION#">
</cfif>
 <cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].XmlChildren[1] = XmlElemNew(ReturnXml, "_PAYMENT")>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].XmlChildren[1].xmlAttributes._Amount = "#Trim(arguments.AMOUNT)#">
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].XmlChildren[1].xmlAttributes._PaidByType = "#Trim(arguments.PAYEE)#">
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN.XmlChildren[1].XmlChildren[item_count].XmlChildren[1].xmlAttributes._OutsideCharge = "#Trim(arguments.OUTSIDE)#">

<CFSET item_count = item_count +1>
</cffunction>

<!--- AddQueryItem function --->
<cffunction name="AddQueryItem" output="false">
<cfargument name="line_number" type="string" default="">
<cfargument name="Description" type="string" default="">
<cfargument name="amount" type="string" default="">
<cfargument name="payer" type="string" default="">			
<cfargument name="outside" type="string" default="0">			
<cfargument name="payto" type="string" default="">	
<cfargument name="extra1102" type="string" default="">	
<cfif arguments.outside eq ''>
<cfset arguments.outside = 0>			
</cfif>		
<cfif arguments.line_number eq 1102>
<cfset arguments.outside = 1>			
</cfif>		
<cfset temp = QueryAddRow(fees_query)>
<cfset temp = QuerySetCell(fees_query, "Line_Number", arguments.line_number)>
<cfset temp = QuerySetCell(fees_query, "Description", arguments.description)>


			<cftry>
<cfif IsNumeric(arguments.amount)>
<cfset temp = QuerySetCell(fees_query, "Amount", arguments.amount)>
<cfelse>
<cfset temp = QuerySetCell(fees_query, "Amount", arguments.amount)>
</cfif>
			<cfcatch type="any">
			</cfcatch>
			</cftry>


<cfset temp = QuerySetCell(fees_query, "Payer", arguments.payer)>			
<cfset temp = QuerySetCell(fees_query, "Payto", arguments.payto)>			
<cfset temp = QuerySetCell(fees_query, "Outside", arguments.outside)>		
<cfset temp = QuerySetCell(fees_query, "Extra1102", arguments.extra1102)>		
</cffunction>

<!--- GetLineCosts function --->
<cffunction name="GetLineCosts" >

<cfargument name="asset_manager" default="">
<cfargument name="company_id" default="">
<cfargument name="property_state" default="">
<cfargument name="property_county" default="">
<cfargument name="transaction_type" default="">
<cfargument name="loan_amount" default="">
<cfargument name="delinquency" default="0">
<cfargument name="cema" default="0">
<cfargument name="CLOSING_TYPE" default="0">
<cfargument name="previous_loan_amount" default="0">


<cfparam name="get_comp_info.allow_chicago_rates" default=0>
<cfparam name="get_comp_info.allow_chicago_rates2" default=0>

<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values">
SELECT     *
FROM         Company_Billing_Values_HUD2010 AS h1 INNER JOIN
             Company_Billing_Values_B_HUD2010 AS h2 ON h1.Billing_ID = h2.Billing_ID
WHERE     (h1.Billing_ID = #read_this_sets_billing_states.billing_id#) 
</CFQUERY>  


<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_values_construction">
SELECT     *
FROM         Company_Billing_Values_CONSTRUCTION_HUD2010 AS h1 INNER JOIN
             Company_Billing_Values_CONSTRUCTION_B_HUD2010 AS h2 ON h1.Billing_ID = h2.Billing_ID
WHERE     (h1.Billing_ID = #read_this_sets_billing_states.billing_id#) 
</CFQUERY>  


<CFQUERY datasource="#request.dsn#" NAME="get_comp_info">
SELECT     *
FROM         companies
WHERE     ID = (#read_this_sets_billing_states.company_id#) 
</CFQUERY>  


<CFQUERY datasource="#request.dsn#" NAME="read_agency">
		SELECT title_ft_agency_name
		FROM  Company_Agency_Assoc_HUD2010
		WHERE billing_id = '#read_this_sets_billing_states.billing_id#'	
</CFQUERY>	

<CFQUERY datasource="#request.dsn#" NAME="read_itemized">
		SELECT * FROM
		ITEMIZED_1101_CHARGES
		WHERE billing_id = '#read_this_sets_billing_states.billing_id#'	
		order by ID desc
</CFQUERY>	
<CFQUERY datasource="#request.dsn#" NAME="read_itemized_construction">
		SELECT * FROM
		ITEMIZED_1101_CHARGES_CONSTRUCTION
		WHERE billing_id = '#read_this_sets_billing_states.billing_id#'	
		order by ID desc
</CFQUERY>	

<!--- Axidion 3942 & 5223
      Eagle - Raj  6013
	  BMIC Mortgage - Schiller  7088   --->
	  
<CFSET run_itemized = 1>
<cfif (arguments.company_id eq 3492 or arguments.company_id eq 5223 or arguments.company_id eq 7088) and (arguments.loan_amount LT 500000 and arguments.property_state eq 'MD')>
<CFSET run_itemized = 0>
</cfif> 

<cfif (arguments.company_id eq 7088) and (arguments.loan_amount LT 500000) and (arguments.property_state eq 'DC' or arguments.property_state eq 'VA')>
<CFSET run_itemized = 0>
</cfif> 


 <CFQUERY datasource="#request.dsn#" NAME="check_company" maxrows="1">
SELECT company FROM companies where ID =  #arguments.company_id#
</CFQUERY>
<cfif (Mid(check_company.company, 1,10) eq 'Eagle Bank' or Mid(check_company.company, 1,9) eq 'EagleBank') and (arguments.transaction_type neq 'Purchase' and treat_as_refi eq 1) and arguments.loan_amount LTE 1000000 and (arguments.property_state eq 'DC' or arguments.property_state eq 'VA' or arguments.property_state eq 'MD')  and arguments.previous_loan_amount gt 0  and arguments.previous_loan_amount neq 'NULL'>
<CFSET run_itemized = 0>
</cfif> 






<cfif ((#arguments.transaction_type# eq "Refinance") or (#arguments.transaction_type# eq "Reverse Mortgage"))>	
<cfif run_itemized eq 1>

<!--- don't show these if this is AXCIDION and the loan amount is less than 500000, or if we're going to swap out bulk rates for chicago --->
<cfif Len(read_itemized.A_1101_ITEM_AMOUNT_01_REFINANCE)>
<cfif request.which_bulk_rate_used eq 'none' or request.which_bulk_rate_used eq 'NULL' or request.which_bulk_rate_used eq '' or request.which_bulk_rate_used eq 'Natic' or request.which_bulk_rate_used eq 'Stewart'>


<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_01_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_01_REFINANCE neq 1)>
<cfif IsNumeric(#read_itemized.A_1101_ITEM_AMOUNT_01_REFINANCE#)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_01_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_01_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_01_REFINANCE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_01_REFINANCE, read_itemized.A_1101_ITEM_AMOUNT_01_REFINANCE, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_02_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_02_REFINANCE neq 1)>
<cfif IsNumeric(#read_itemized.A_1101_ITEM_AMOUNT_02_REFINANCE#)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_02_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_02_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_02_REFINANCE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_02_REFINANCE, read_itemized.A_1101_ITEM_AMOUNT_02_REFINANCE, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_03_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_03_REFINANCE neq 1)>
<cfif IsNumeric(#read_itemized.A_1101_ITEM_AMOUNT_03_REFINANCE#)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_03_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_03_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_03_REFINANCE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_03_REFINANCE, read_itemized.A_1101_ITEM_AMOUNT_03_REFINANCE, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_04_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_04_REFINANCE neq 1)>
<cfif IsNumeric(#read_itemized.A_1101_ITEM_AMOUNT_04_REFINANCE#)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_04_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_04_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_04_REFINANCE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_04_REFINANCE, read_itemized.A_1101_ITEM_AMOUNT_04_REFINANCE, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_05_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_05_REFINANCE neq 1)>
<cfif IsNumeric(#read_itemized.A_1101_ITEM_AMOUNT_05_REFINANCE#)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_05_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_05_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_05_REFINANCE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_05_REFINANCE, read_itemized.A_1101_ITEM_AMOUNT_05_REFINANCE, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_06_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_06_REFINANCE neq 1)>
<cfif IsNumeric(#read_itemized.A_1101_ITEM_AMOUNT_06_REFINANCE#)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_06_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_06_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_06_REFINANCE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_06_REFINANCE, read_itemized.A_1101_ITEM_AMOUNT_06_REFINANCE, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_07_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_07_REFINANCE neq 1)>
<cfif IsNumeric(#read_itemized.A_1101_ITEM_AMOUNT_07_REFINANCE#)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_07_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_07_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_07_REFINANCE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_07_REFINANCE, read_itemized.A_1101_ITEM_AMOUNT_07_REFINANCE, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_08_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_08_REFINANCE neq 1)>
<cfif IsNumeric(#read_itemized.A_1101_ITEM_AMOUNT_08_REFINANCE#)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_08_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_08_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_08_REFINANCE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_08_REFINANCE, read_itemized.A_1101_ITEM_AMOUNT_08_REFINANCE, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_09_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_09_REFINANCE neq 1)>
<cfif IsNumeric(#read_itemized.A_1101_ITEM_AMOUNT_09_REFINANCE#)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_09_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_09_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_09_REFINANCE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_09_REFINANCE, read_itemized.A_1101_ITEM_AMOUNT_09_REFINANCE, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_10_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_10_REFINANCE neq 1)>
<cfif IsNumeric(#read_itemized.A_1101_ITEM_AMOUNT_10_REFINANCE#)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_10_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_10_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_10_REFINANCE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_10_REFINANCE, read_itemized.A_1101_ITEM_AMOUNT_10_REFINANCE, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_11_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_11_REFINANCE neq 1)>
<cfif IsNumeric(#read_itemized.A_1101_ITEM_AMOUNT_11_REFINANCE#)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_11_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_11_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_11_REFINANCE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_11_REFINANCE, read_itemized.A_1101_ITEM_AMOUNT_11_REFINANCE, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_12_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_12_REFINANCE neq 1)>
<cfif IsNumeric(#read_itemized.A_1101_ITEM_AMOUNT_12_REFINANCE#)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_12_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_12_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_12_REFINANCE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_12_REFINANCE, read_itemized.A_1101_ITEM_AMOUNT_12_REFINANCE, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_13_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_13_REFINANCE neq 1)>
<cfif IsNumeric(#read_itemized.A_1101_ITEM_AMOUNT_13_REFINANCE#)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_13_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_13_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_13_REFINANCE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_13_REFINANCE, read_itemized.A_1101_ITEM_AMOUNT_13_REFINANCE, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_14_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_14_REFINANCE neq 1)>
<cfif IsNumeric(#read_itemized.A_1101_ITEM_AMOUNT_14_REFINANCE#)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_14_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_14_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_14_REFINANCE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_14_REFINANCE, read_itemized.A_1101_ITEM_AMOUNT_14_REFINANCE, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_15_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_15_REFINANCE neq 1)>
<cfif IsNumeric(#read_itemized.A_1101_ITEM_AMOUNT_15_REFINANCE#)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_15_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_15_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_15_REFINANCE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_15_REFINANCE, read_itemized.A_1101_ITEM_AMOUNT_15_REFINANCE, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_16_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_16_REFINANCE neq 1)>
<cfif IsNumeric(#read_itemized.A_1101_ITEM_AMOUNT_16_REFINANCE#)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_16_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_16_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_16_REFINANCE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_16_REFINANCE, read_itemized.A_1101_ITEM_AMOUNT_16_REFINANCE, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_17_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_17_REFINANCE neq 1)>
<cfif IsNumeric(#read_itemized.A_1101_ITEM_AMOUNT_17_REFINANCE#)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_17_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_17_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_17_REFINANCE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_17_REFINANCE, read_itemized.A_1101_ITEM_AMOUNT_17_REFINANCE, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_18_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_18_REFINANCE neq 1)>
<cfif IsNumeric(#read_itemized.A_1101_ITEM_AMOUNT_18_REFINANCE#)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_18_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_18_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_18_REFINANCE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_18_REFINANCE, read_itemized.A_1101_ITEM_AMOUNT_18_REFINANCE, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_19_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_19_REFINANCE neq 1)>
<cfif IsNumeric(#read_itemized.A_1101_ITEM_AMOUNT_19_REFINANCE#)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_19_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_19_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_19_REFINANCE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_19_REFINANCE, read_itemized.A_1101_ITEM_AMOUNT_19_REFINANCE, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_20_REFINANCE) and read_itemized.A_1101_ITEM_SELECTABLE_20_REFINANCE neq 1)>
<cfif IsNumeric(#read_itemized.A_1101_ITEM_AMOUNT_20_REFINANCE#)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_20_REFINANCE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_20_REFINANCE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_20_REFINANCE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_20_REFINANCE, read_itemized.A_1101_ITEM_AMOUNT_20_REFINANCE, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>

</cfif>
</cfif>



<cfif request.which_bulk_rate_used eq 'Chicago Local Rates'>
<!--- these are for Chicago Local Rates --->
<cfset closing_services = 225>
<cfset closing_protection_letter = 75>
<!--- end these are for Chicago Local Rates --->
<cfset temp = AddQueryItem(0, "Closing Services Fee", NumberFormat(closing_services, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + closing_services>
<cfset temp = AddQueryItem(0, "Closing Protection Letter", NumberFormat(closing_protection_letter, '_____.__'), "Buyer", 0, "North American Title")>
<cfset roll_up_1101 = roll_up_1101 + closing_protection_letter>
</cfif>

<cfif request.which_bulk_rate_used eq 'Chicago Rates'>
<!--- these are for Chicago Rates --->
<cfset closing_services = 150>
<cfset closing_protection_letter = 75>
<!--- end these are for Chicago Rates rates --->
<cfset temp = AddQueryItem(0, "Closing Services Fee", NumberFormat(closing_services, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + closing_services>
<cfset temp = AddQueryItem(0, "Closing Protection Letter", NumberFormat(closing_protection_letter, '_____.__'), "Buyer", 0, "North American Title")>
<cfset roll_up_1101 = roll_up_1101 + closing_protection_letter>
</cfif>



<cfif arguments.loan_amount neq 0 and arguments.loan_amount neq '' and arguments.loan_amount neq 'NULL'>
<cfif #read_this_sets_billing_values.A_0801_AMOUNT_REFINANCE# neq "">
<cfset a_801 = #read_this_sets_billing_values.A_0801_AMOUNT_REFINANCE#>
<cfset temp = AddQueryItem(801, read_this_sets_billing_values.A_0801_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_0801_AMOUNT_REFINANCE, '_____.__'), "Buyer", 1, #read_agency.title_ft_agency_name#)>
</cfif>


<cfif #read_this_sets_billing_values.A_0802_AMOUNT_REFINANCE# neq "">
<cfset a_802 = #read_this_sets_billing_values.A_0802_AMOUNT_REFINANCE#>
<cfset temp = AddQueryItem(802, read_this_sets_billing_values.A_0802_DESCRIPTION_REFINANCE, ReplaceNoCase(read_this_sets_billing_values.A_0802_AMOUNT_REFINANCE, " ", "", "ALL"), "Buyer", 1, #read_agency.title_ft_agency_name#)>
</cfif>

<cfif #read_this_sets_billing_values.A_0801_AMOUNT_REFINANCE# neq "" and #read_this_sets_billing_values.A_0802_AMOUNT_REFINANCE# neq "">
<cfset temp = AddQueryItem(803, "Your adjusted origination charges", NumberFormat((read_this_sets_billing_values.A_0802_AMOUNT_REFINANCE + read_this_sets_billing_values.A_0801_AMOUNT_REFINANCE), '_____.__'), "Buyer", 0)>
</cfif>


<cfif #read_this_sets_billing_values.A_0804_AMOUNT_REFINANCE# neq "">
<cfset a_804 = #read_this_sets_billing_values.A_0804_AMOUNT_REFINANCE#>
<cfif (arguments.company_id eq 3722 or arguments.company_id eq 4752) and IsNumeric(arguments.loan_amount) and arguments.loan_amount gt 0>
<cfset temp = AddQueryItem(804, read_this_sets_billing_values.A_0804_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_0804_AMOUNT_REFINANCE, '_____.__'), "Buyer", 1, read_this_sets_billing_values.A_0804_PAYTO_REFINANCE)>
<cfelseif (arguments.company_id eq 4702) and IsNumeric(arguments.loan_amount) and arguments.loan_amount gt 0>
<cfset temp = AddQueryItem(804, read_this_sets_billing_values.A_0804_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_0804_AMOUNT_REFINANCE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0804_PAYTO_REFINANCE)>
<cfelse>
<cfset temp = AddQueryItem(804, read_this_sets_billing_values.A_0804_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_0804_AMOUNT_REFINANCE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0804_PAYTO_REFINANCE)>
</cfif>
</cfif>

<cfif #read_this_sets_billing_values.A_0805_AMOUNT_REFINANCE# neq "">
<cfset a_805 = #read_this_sets_billing_values.A_0805_AMOUNT_REFINANCE#>
<cfset temp = AddQueryItem(805, read_this_sets_billing_values.A_0805_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_0805_AMOUNT_REFINANCE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0805_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0806_AMOUNT_REFINANCE# neq "">
<cfset a_806 = #read_this_sets_billing_values.A_0806_AMOUNT_REFINANCE#>
<cfset temp = AddQueryItem(806, read_this_sets_billing_values.A_0806_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_0806_AMOUNT_REFINANCE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0806_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0807_AMOUNT_REFINANCE# neq "">
<cfset a_807 = #read_this_sets_billing_values.A_0807_AMOUNT_REFINANCE#>
<cfset temp = AddQueryItem(807, read_this_sets_billing_values.A_0807_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_0807_AMOUNT_REFINANCE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0807_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0808_AMOUNT_REFINANCE# neq "">
<cfset a_808 = #read_this_sets_billing_values.A_0808_AMOUNT_REFINANCE#>
<cfset temp = AddQueryItem(808, read_this_sets_billing_values.A_0808_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_0808_AMOUNT_REFINANCE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0808_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0809_AMOUNT_REFINANCE# neq "">
<cfset a_809 = #read_this_sets_billing_values.A_0809_AMOUNT_REFINANCE#>
<cfset temp = AddQueryItem(809, read_this_sets_billing_values.A_0809_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_0809_AMOUNT_REFINANCE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0809_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0810_AMOUNT_REFINANCE# neq "">
<cfset a_810 = #read_this_sets_billing_values.A_0810_AMOUNT_REFINANCE#>
<cfset temp = AddQueryItem(810, read_this_sets_billing_values.A_0810_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_0810_AMOUNT_REFINANCE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0810_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0811_AMOUNT_REFINANCE# neq "">
<cfset a_811 = #read_this_sets_billing_values.A_0811_AMOUNT_REFINANCE#>
<cfset temp = AddQueryItem(811, read_this_sets_billing_values.A_0811_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_0811_AMOUNT_REFINANCE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0811_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0812_AMOUNT_REFINANCE# neq "">
<cfset a_812 = #read_this_sets_billing_values.A_0812_AMOUNT_REFINANCE#>
<cfset temp = AddQueryItem(812, read_this_sets_billing_values.A_0812_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_0812_AMOUNT_REFINANCE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0812_PAYTO_REFINANCE)>
</cfif>

</cfif>


<cfif request.which_bulk_rate_used eq 'none' or request.which_bulk_rate_used eq 'Natic' or request.which_bulk_rate_used eq 'Stewart'>
<cfif #read_this_sets_billing_values.A_1102_AMOUNT_REFINANCE# neq "">
<cfif arguments.property_state eq 'NY' and arguments.cema eq 1>
<cfset roll_up_1101 = roll_up_1101 + 325>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102_DESCRIPTION_REFINANCE, NumberFormat(325, '_____.__'), "Buyer", 1, read_this_sets_billing_values.A_1102_PAYTO_REFINANCE)>
<cfelse>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102_AMOUNT_REFINANCE>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1102_AMOUNT_REFINANCE, '_____.__'), "Buyer", 1, read_this_sets_billing_values.A_1102_PAYTO_REFINANCE)>
</cfif>
</cfif>

<cfelse>


<cfif (get_comp_info.allow_chicago_rates eq True and arguments.property_state eq 'IL') and IsDefined("signing_fee")>

<cfset roll_up_1101 = roll_up_1101 + signing_fee>
<cfset temp = AddQueryItem(1102, "Signing Fee", NumberFormat(signing_fee, '_____.__'), "Buyer", 1, "TP Agent Signer")>

</cfif>
</cfif>


<cfif #read_this_sets_billing_values.A_1102A_AMOUNT_REFINANCE# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102A_AMOUNT_REFINANCE>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102A_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1102A_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102A_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1102A_PAYTO_REFINANCE, "X")>
</cfif>
<cfif #read_this_sets_billing_values.A_1102B_AMOUNT_REFINANCE# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102B_AMOUNT_REFINANCE>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102B_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1102B_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102B_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1102B_PAYTO_REFINANCE, "X")>
</cfif>
<cfif #read_this_sets_billing_values.A_1102C_AMOUNT_REFINANCE# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102C_AMOUNT_REFINANCE>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102C_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1102C_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102C_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1102C_PAYTO_REFINANCE, "X")>
</cfif>
<cfif #read_this_sets_billing_values.A_1102D_AMOUNT_REFINANCE# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102D_AMOUNT_REFINANCE>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102D_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1102D_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102D_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1102D_PAYTO_REFINANCE, "X")>
</cfif>
<cfif #read_this_sets_billing_values.A_1102E_AMOUNT_REFINANCE# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102E_AMOUNT_REFINANCE>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102E_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1102E_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102E_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1102E_PAYTO_REFINANCE, "X")>
</cfif>
<cfif #read_this_sets_billing_values.A_1102F_AMOUNT_REFINANCE# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102F_AMOUNT_REFINANCE>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102F_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1102F_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102F_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1102F_PAYTO_REFINANCE, "X")>
</cfif>
<cfif #read_this_sets_billing_values.A_1102G_AMOUNT_REFINANCE# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102G_AMOUNT_REFINANCE>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102G_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1102G_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102G_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1102G_PAYTO_REFINANCE, "X")>
</cfif>
<cfif #read_this_sets_billing_values.A_1102H_AMOUNT_REFINANCE# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102H_AMOUNT_REFINANCE>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102H_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1102H_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102H_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1102H_PAYTO_REFINANCE, "X")>
</cfif>
<cfif #read_this_sets_billing_values.A_1102I_AMOUNT_REFINANCE# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102I_AMOUNT_REFINANCE>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102I_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1102I_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102I_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1102I_PAYTO_REFINANCE, "X")>
</cfif>


<cfif #read_this_sets_billing_values.A_1109_AMOUNT_REFINANCE# neq "">
<cfif read_this_sets_billing_values.A_1109_OUTSIDE_REFINANCE eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1109_AMOUNT_REFINANCE>
</cfif>
<cfset a_1109 = #read_this_sets_billing_values.A_1109_AMOUNT_REFINANCE#>
<cfset temp = AddQueryItem(1109, read_this_sets_billing_values.A_1109_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1109_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1109_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1109_PAYTO_REFINANCE)>
</cfif>




<cfif #read_this_sets_billing_values.A_1110_AMOUNT_REFINANCE# neq "">
<cfif read_this_sets_billing_values.A_1110_OUTSIDE_REFINANCE eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1110_AMOUNT_REFINANCE>
</cfif>
<cfset temp = AddQueryItem(1110, read_this_sets_billing_values.A_1110_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1110_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1110_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1110_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1111_AMOUNT_REFINANCE# neq "">
<cfif read_this_sets_billing_values.A_1111_OUTSIDE_REFINANCE eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1111_AMOUNT_REFINANCE>
</cfif>
<cfset temp = AddQueryItem(1111, read_this_sets_billing_values.A_1111_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1111_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1111_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1111_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1112_AMOUNT_REFINANCE# neq "">
<cfif read_this_sets_billing_values.A_1112_OUTSIDE_REFINANCE eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1112_AMOUNT_REFINANCE>
</cfif>
<cfset temp = AddQueryItem(1112, read_this_sets_billing_values.A_1112_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1112_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1112_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1112_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1113_AMOUNT_REFINANCE# neq "">
<cfif read_this_sets_billing_values.A_1113_OUTSIDE_REFINANCE eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1113_AMOUNT_REFINANCE>
</cfif>
<cfset temp = AddQueryItem(1113, read_this_sets_billing_values.A_1113_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1113_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1113_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1113_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1302_AMOUNT_REFINANCE# neq "">
<cfif read_this_sets_billing_values.A_1302_OUTSIDE_REFINANCE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1302_AMOUNT_REFINANCE>
</cfif>
<cfset temp = AddQueryItem(1302, read_this_sets_billing_values.A_1302_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1302_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1302_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1302_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1303_AMOUNT_REFINANCE# neq "">
<cfif read_this_sets_billing_values.A_1303_OUTSIDE_REFINANCE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1303_AMOUNT_REFINANCE>
</cfif>
<cfset temp = AddQueryItem(1303, read_this_sets_billing_values.A_1303_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1303_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1303_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1303_PAYTO_REFINANCE)>
</cfif>

<cfif #arguments.delinquency# neq '' and #arguments.delinquency# neq 'NULL' and #arguments.delinquency# neq 0 and (arguments.company_id eq 3722 or arguments.company_id eq 4752)>
<cfset roll_up_1301 = roll_up_1301 + arguments.delinquency>
<cfset temp = AddQueryItem(1303, "Past Due Maintenance", NumberFormat(arguments.delinquency, '_____.__'), "Buyer", 0, "6901 Oglesby Avenue Apt. Corp.")>
</cfif>

<cfif #read_this_sets_billing_values.A_1304_AMOUNT_REFINANCE# neq "">
<cfif read_this_sets_billing_values.A_1304_OUTSIDE_REFINANCE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1304_AMOUNT_REFINANCE>
</cfif>
<cfset temp = AddQueryItem(1304, read_this_sets_billing_values.A_1304_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1304_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1304_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1304_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1305_AMOUNT_REFINANCE# neq "">
<cfif read_this_sets_billing_values.A_1305_OUTSIDE_REFINANCE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1305_AMOUNT_REFINANCE>
</cfif>
<cfset temp = AddQueryItem(1305, read_this_sets_billing_values.A_1305_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1305_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1305_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1305_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1306_AMOUNT_REFINANCE# neq "">
<cfif read_this_sets_billing_values.A_1306_OUTSIDE_REFINANCE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1306_AMOUNT_REFINANCE>
</cfif>
<cfset temp = AddQueryItem(1306, read_this_sets_billing_values.A_1306_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1306_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1306_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1306_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1307_AMOUNT_REFINANCE# neq "">
<cfif read_this_sets_billing_values.A_1307_OUTSIDE_REFINANCE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1307_AMOUNT_REFINANCE>
</cfif>
<cfset temp = AddQueryItem(1307, read_this_sets_billing_values.A_1307_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1307_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1307_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1307_PAYTO_REFINANCE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1308_AMOUNT_REFINANCE# neq "">
<cfif read_this_sets_billing_values.A_1308_OUTSIDE_REFINANCE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1308_AMOUNT_REFINANCE>
</cfif>
<cfset temp = AddQueryItem(1308, read_this_sets_billing_values.A_1308_DESCRIPTION_REFINANCE, NumberFormat(read_this_sets_billing_values.A_1308_AMOUNT_REFINANCE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1308_OUTSIDE_REFINANCE, read_this_sets_billing_values.A_1308_PAYTO_REFINANCE)>
</cfif>
</cfif>

<!--- CONSTRUCTION 1X CLose --->
<cfelseif (arguments.transaction_type eq 'Construction' and arguments.closing_type eq '1')>	

<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_01_CONSTR_1X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_01_CONSTR_1X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_01_CONSTR_1X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_01_CONSTR_1X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_01_CONSTR_1X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_01_CONSTR_1X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_01_CONSTR_1X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>

<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_02_CONSTR_1X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_02_CONSTR_1X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_02_CONSTR_1X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_02_CONSTR_1X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_02_CONSTR_1X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_02_CONSTR_1X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_02_CONSTR_1X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>

<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_03_CONSTR_1X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_03_CONSTR_1X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_03_CONSTR_1X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_03_CONSTR_1X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_03_CONSTR_1X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_03_CONSTR_1X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_03_CONSTR_1X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_04_CONSTR_1X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_04_CONSTR_1X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_04_CONSTR_1X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_04_CONSTR_1X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_04_CONSTR_1X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_04_CONSTR_1X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_04_CONSTR_1X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_05_CONSTR_1X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_05_CONSTR_1X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_05_CONSTR_1X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_05_CONSTR_1X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_05_CONSTR_1X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_05_CONSTR_1X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_05_CONSTR_1X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_06_CONSTR_1X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_06_CONSTR_1X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_06_CONSTR_1X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_06_CONSTR_1X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_06_CONSTR_1X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_06_CONSTR_1X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_06_CONSTR_1X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_07_CONSTR_1X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_07_CONSTR_1X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_07_CONSTR_1X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_07_CONSTR_1X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_07_CONSTR_1X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_07_CONSTR_1X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_07_CONSTR_1X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_08_CONSTR_1X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_08_CONSTR_1X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_08_CONSTR_1X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_08_CONSTR_1X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_08_CONSTR_1X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_08_CONSTR_1X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_08_CONSTR_1X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_09_CONSTR_1X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_09_CONSTR_1X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_09_CONSTR_1X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_09_CONSTR_1X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_09_CONSTR_1X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_09_CONSTR_1X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_09_CONSTR_1X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_10_CONSTR_1X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_10_CONSTR_1X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_10_CONSTR_1X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_10_CONSTR_1X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_10_CONSTR_1X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_10_CONSTR_1X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_10_CONSTR_1X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_11_CONSTR_1X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_11_CONSTR_1X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_11_CONSTR_1X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_11_CONSTR_1X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_11_CONSTR_1X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_11_CONSTR_1X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_11_CONSTR_1X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_12_CONSTR_1X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_12_CONSTR_1X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_12_CONSTR_1X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_12_CONSTR_1X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_12_CONSTR_1X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_12_CONSTR_1X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_12_CONSTR_1X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_13_CONSTR_1X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_13_CONSTR_1X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_13_CONSTR_1X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_13_CONSTR_1X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_13_CONSTR_1X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_13_CONSTR_1X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_13_CONSTR_1X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_14_CONSTR_1X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_14_CONSTR_1X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_14_CONSTR_1X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_14_CONSTR_1X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_14_CONSTR_1X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_14_CONSTR_1X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_14_CONSTR_1X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_15_CONSTR_1X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_15_CONSTR_1X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_15_CONSTR_1X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_15_CONSTR_1X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_15_CONSTR_1X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_15_CONSTR_1X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_15_CONSTR_1X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_16_CONSTR_1X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_16_CONSTR_1X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_16_CONSTR_1X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_16_CONSTR_1X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_16_CONSTR_1X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_16_CONSTR_1X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_16_CONSTR_1X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_17_CONSTR_1X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_17_CONSTR_1X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_17_CONSTR_1X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_17_CONSTR_1X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_17_CONSTR_1X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_17_CONSTR_1X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_17_CONSTR_1X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_18_CONSTR_1X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_18_CONSTR_1X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_18_CONSTR_1X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_18_CONSTR_1X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_18_CONSTR_1X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_18_CONSTR_1X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_18_CONSTR_1X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_19_CONSTR_1X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_19_CONSTR_1X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_19_CONSTR_1X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_19_CONSTR_1X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_19_CONSTR_1X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_19_CONSTR_1X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_19_CONSTR_1X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_20_CONSTR_1X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_20_CONSTR_1X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_20_CONSTR_1X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_20_CONSTR_1X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_20_CONSTR_1X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_20_CONSTR_1X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_20_CONSTR_1X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>




<cfif #read_this_sets_billing_values_construction.A_0801_AMOUNT_CONSTR_1X# neq "">
<cfset a_801 = #read_this_sets_billing_values_construction.A_0801_AMOUNT_CONSTR_1X#>
<cfset temp = AddQueryItem(801, read_this_sets_billing_values_construction.A_0801_DESCRIPTION_CONSTR_1X, NumberFormat(read_this_sets_billing_values_construction.A_0801_AMOUNT_CONSTR_1X, '_____.__'), "Buyer", 1)>
</cfif>


<cfif #read_this_sets_billing_values_construction.A_0802_AMOUNT_CONSTR_1X# neq "">
<cfset a_802 = #read_this_sets_billing_values_construction.A_0802_AMOUNT_CONSTR_1X#>
<cfset temp = AddQueryItem(802, read_this_sets_billing_values_construction.A_0802_DESCRIPTION_CONSTR_1X, ReplaceNoCase(read_this_sets_billing_values_construction.A_0802_AMOUNT_CONSTR_1X, " ", "", "ALL"), "Buyer", 1)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_0801_AMOUNT_CONSTR_1X# neq "" and #read_this_sets_billing_values_construction.A_0802_AMOUNT_CONSTR_1X# neq "">
<cfset temp = AddQueryItem(803, "Your adjusted origination charges", NumberFormat((read_this_sets_billing_values_construction.A_0802_AMOUNT_CONSTR_1X + read_this_sets_billing_values_construction.A_0801_AMOUNT_CONSTR_1X), '_____.__'), "Buyer", 0)>
</cfif>


<cfif #read_this_sets_billing_values_construction.A_0804_AMOUNT_CONSTR_1X# neq "">
<cfset a_804 = #read_this_sets_billing_values_construction.A_0804_AMOUNT_CONSTR_1X#>
<cfset temp = AddQueryItem(804, read_this_sets_billing_values_construction.A_0804_DESCRIPTION_CONSTR_1X, NumberFormat(read_this_sets_billing_values_construction.A_0804_AMOUNT_CONSTR_1X, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0804_PAYTO_CONSTR_1X)>
</cfif>


<cfif #read_this_sets_billing_values_construction.A_0805_AMOUNT_CONSTR_1X# neq "">
<cfset a_805 = #read_this_sets_billing_values_construction.A_0805_AMOUNT_CONSTR_1X#>
<cfset temp = AddQueryItem(805, read_this_sets_billing_values_construction.A_0805_DESCRIPTION_CONSTR_1X, NumberFormat(read_this_sets_billing_values_construction.A_0805_AMOUNT_CONSTR_1X, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0805_PAYTO_CONSTR_1X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_0806_AMOUNT_CONSTR_1X# neq "">
<cfset a_806 = #read_this_sets_billing_values_construction.A_0806_AMOUNT_CONSTR_1X#>
<cfset temp = AddQueryItem(806, read_this_sets_billing_values_construction.A_0806_DESCRIPTION_CONSTR_1X, NumberFormat(read_this_sets_billing_values_construction.A_0806_AMOUNT_CONSTR_1X, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0806_PAYTO_CONSTR_1X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_0807_AMOUNT_CONSTR_1X# neq "">
<cfset a_807 = #read_this_sets_billing_values_construction.A_0807_AMOUNT_CONSTR_1X#>
<cfset temp = AddQueryItem(807, read_this_sets_billing_values_construction.A_0807_DESCRIPTION_CONSTR_1X, NumberFormat(read_this_sets_billing_values_construction.A_0807_AMOUNT_CONSTR_1X, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0807_PAYTO_CONSTR_1X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_0808_AMOUNT_CONSTR_1X# neq "">
<cfset a_808 = #read_this_sets_billing_values_construction.A_0808_AMOUNT_CONSTR_1X#>
<cfset temp = AddQueryItem(808, read_this_sets_billing_values_construction.A_0808_DESCRIPTION_CONSTR_1X, NumberFormat(read_this_sets_billing_values_construction.A_0808_AMOUNT_CONSTR_1X, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0808_PAYTO_CONSTR_1X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_0809_AMOUNT_CONSTR_1X# neq "">
<cfset a_809 = #read_this_sets_billing_values_construction.A_0809_AMOUNT_CONSTR_1X#>
<cfset temp = AddQueryItem(809, read_this_sets_billing_values_construction.A_0809_DESCRIPTION_CONSTR_1X, NumberFormat(read_this_sets_billing_values_construction.A_0809_AMOUNT_CONSTR_1X, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0809_PAYTO_CONSTR_1X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_0810_AMOUNT_CONSTR_1X# neq "">
<cfset a_810 = #read_this_sets_billing_values_construction.A_0810_AMOUNT_CONSTR_1X#>
<cfset temp = AddQueryItem(810, read_this_sets_billing_values_construction.A_0810_DESCRIPTION_CONSTR_1X, NumberFormat(read_this_sets_billing_values_construction.A_0810_AMOUNT_CONSTR_1X, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0810_PAYTO_CONSTR_1X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_0811_AMOUNT_CONSTR_1X# neq "">
<cfset a_811 = #read_this_sets_billing_values_construction.A_0811_AMOUNT_CONSTR_1X#>
<cfset temp = AddQueryItem(811, read_this_sets_billing_values_construction.A_0811_DESCRIPTION_CONSTR_1X, NumberFormat(read_this_sets_billing_values_construction.A_0811_AMOUNT_CONSTR_1X, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0811_PAYTO_CONSTR_1X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_0812_AMOUNT_CONSTR_1X# neq "">
<cfset a_812 = #read_this_sets_billing_values_construction.A_0812_AMOUNT_CONSTR_1X#>
<cfset temp = AddQueryItem(812, read_this_sets_billing_values_construction.A_0812_DESCRIPTION_CONSTR_1X, NumberFormat(read_this_sets_billing_values_construction.A_0812_AMOUNT_CONSTR_1X, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0812_PAYTO_CONSTR_1X)>
</cfif>


<cfif #read_this_sets_billing_values_construction.A_1102_AMOUNT_CONSTR_1X# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values_construction.A_1102_AMOUNT_CONSTR_1X>
<cfset a_1102 = #read_this_sets_billing_values_construction.A_1102_AMOUNT_CONSTR_1X#>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values_construction.A_1102_DESCRIPTION_CONSTR_1X, NumberFormat(read_this_sets_billing_values_construction.A_1102_AMOUNT_CONSTR_1X, '_____.__'), "Buyer", 1, read_this_sets_billing_values_construction.A_1102_PAYTO_CONSTR_1X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1109_AMOUNT_CONSTR_1X# neq "">
<cfif read_this_sets_billing_values_construction.A_1109_OUTSIDE_CONSTR_1X eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values_construction.A_1109_AMOUNT_CONSTR_1X>
</cfif>


<cfset temp = AddQueryItem(1109, read_this_sets_billing_values_construction.A_1109_DESCRIPTION_CONSTR_1X, NumberFormat(read_this_sets_billing_values_construction.A_1109_AMOUNT_CONSTR_1X, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1109_OUTSIDE_CONSTR_1X, read_this_sets_billing_values_construction.A_1109_PAYTO_CONSTR_1X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1110_AMOUNT_CONSTR_1X# neq "">
<cfif read_this_sets_billing_values_construction.A_1110_OUTSIDE_CONSTR_1X eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values_construction.A_1110_AMOUNT_CONSTR_1X>
</cfif>
<cfset temp = AddQueryItem(1110, read_this_sets_billing_values_construction.A_1110_DESCRIPTION_CONSTR_1X, NumberFormat(read_this_sets_billing_values_construction.A_1110_AMOUNT_CONSTR_1X, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1110_OUTSIDE_CONSTR_1X, read_this_sets_billing_values_construction.A_1110_PAYTO_CONSTR_1X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1111_AMOUNT_CONSTR_1X# neq "">
<cfif read_this_sets_billing_values_construction.A_1111_OUTSIDE_CONSTR_1X eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values_construction.A_1111_AMOUNT_CONSTR_1X>
</cfif>
<cfset temp = AddQueryItem(1111, read_this_sets_billing_values_construction.A_1111_DESCRIPTION_CONSTR_1X, NumberFormat(read_this_sets_billing_values_construction.A_1111_AMOUNT_CONSTR_1X, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1111_OUTSIDE_CONSTR_1X, read_this_sets_billing_values_construction.A_1111_PAYTO_CONSTR_1X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1112_AMOUNT_CONSTR_1X# neq "">
<cfif read_this_sets_billing_values_construction.A_1112_OUTSIDE_CONSTR_1X eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values_construction.A_1112_AMOUNT_CONSTR_1X>
</cfif>
<cfset temp = AddQueryItem(1112, read_this_sets_billing_values_construction.A_1112_DESCRIPTION_CONSTR_1X, NumberFormat(read_this_sets_billing_values_construction.A_1112_AMOUNT_CONSTR_1X, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1112_OUTSIDE_CONSTR_1X, read_this_sets_billing_values_construction.A_1112_PAYTO_CONSTR_1X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1113_AMOUNT_CONSTR_1X# neq "">
<cfif read_this_sets_billing_values_construction.A_1113_OUTSIDE_CONSTR_1X eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values_construction.A_1113_AMOUNT_CONSTR_1X>
</cfif>
<cfset temp = AddQueryItem(1113, read_this_sets_billing_values_construction.A_1113_DESCRIPTION_CONSTR_1X, NumberFormat(read_this_sets_billing_values_construction.A_1113_AMOUNT_CONSTR_1X, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1113_OUTSIDE_CONSTR_1X, read_this_sets_billing_values_construction.A_1113_PAYTO_CONSTR_1X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1302_AMOUNT_CONSTR_1X# neq "">
<cfif read_this_sets_billing_values_construction.A_1302_OUTSIDE_CONSTR_1X eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values_construction.A_1302_AMOUNT_CONSTR_1X>
</cfif>
<cfset temp = AddQueryItem(1302, read_this_sets_billing_values_construction.A_1302_DESCRIPTION_CONSTR_1X, NumberFormat(read_this_sets_billing_values_construction.A_1302_AMOUNT_CONSTR_1X, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1302_OUTSIDE_CONSTR_1X, read_this_sets_billing_values_construction.A_1302_PAYTO_CONSTR_1X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1303_AMOUNT_CONSTR_1X# neq "">
<cfif read_this_sets_billing_values_construction.A_1303_OUTSIDE_CONSTR_1X eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values_construction.A_1303_AMOUNT_CONSTR_1X>
</cfif>
<cfset temp = AddQueryItem(1303, read_this_sets_billing_values_construction.A_1303_DESCRIPTION_CONSTR_1X, NumberFormat(read_this_sets_billing_values_construction.A_1303_AMOUNT_CONSTR_1X, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1303_OUTSIDE_CONSTR_1X, read_this_sets_billing_values_construction.A_1303_PAYTO_CONSTR_1X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1304_AMOUNT_CONSTR_1X# neq "">
<cfif read_this_sets_billing_values_construction.A_1304_OUTSIDE_CONSTR_1X eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values_construction.A_1304_AMOUNT_CONSTR_1X>
</cfif>
<cfset temp = AddQueryItem(1304, read_this_sets_billing_values_construction.A_1304_DESCRIPTION_CONSTR_1X, NumberFormat(read_this_sets_billing_values_construction.A_1304_AMOUNT_CONSTR_1X, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1304_OUTSIDE_CONSTR_1X, read_this_sets_billing_values_construction.A_1304_PAYTO_CONSTR_1X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1305_AMOUNT_CONSTR_1X# neq "">
<cfif read_this_sets_billing_values_construction.A_1305_OUTSIDE_CONSTR_1X eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values_construction.A_1305_AMOUNT_CONSTR_1X>
</cfif>
<cfset temp = AddQueryItem(1305, read_this_sets_billing_values_construction.A_1305_DESCRIPTION_CONSTR_1X, NumberFormat(read_this_sets_billing_values_construction.A_1305_AMOUNT_CONSTR_1X, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1305_OUTSIDE_CONSTR_1X, read_this_sets_billing_values_construction.A_1305_PAYTO_CONSTR_1X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1306_AMOUNT_CONSTR_1X# neq "">
<cfif read_this_sets_billing_values_construction.A_1306_OUTSIDE_CONSTR_1X eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values_construction.A_1306_AMOUNT_CONSTR_1X>
</cfif>
<cfset temp = AddQueryItem(1306, read_this_sets_billing_values_construction.A_1306_DESCRIPTION_CONSTR_1X, NumberFormat(read_this_sets_billing_values_construction.A_1306_AMOUNT_CONSTR_1X, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1306_OUTSIDE_CONSTR_1X, read_this_sets_billing_values_construction.A_1306_PAYTO_CONSTR_1X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1307_AMOUNT_CONSTR_1X# neq "">
<cfif read_this_sets_billing_values_construction.A_1307_OUTSIDE_CONSTR_1X eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values_construction.A_1307_AMOUNT_CONSTR_1X>
</cfif>
<cfset temp = AddQueryItem(1307, read_this_sets_billing_values_construction.A_1307_DESCRIPTION_CONSTR_1X, NumberFormat(read_this_sets_billing_values_construction.A_1307_AMOUNT_CONSTR_1X, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1307_OUTSIDE_CONSTR_1X, read_this_sets_billing_values_construction.A_1307_PAYTO_CONSTR_1X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1308_AMOUNT_CONSTR_1X# neq "">
<cfif read_this_sets_billing_values_construction.A_1308_OUTSIDE_CONSTR_1X eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values_construction.A_1308_AMOUNT_CONSTR_1X>
</cfif>
<cfset temp = AddQueryItem(1308, read_this_sets_billing_values_construction.A_1308_DESCRIPTION_CONSTR_1X, NumberFormat(read_this_sets_billing_values_construction.A_1308_AMOUNT_CONSTR_1X, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1308_OUTSIDE_CONSTR_1X, read_this_sets_billing_values_construction.A_1308_PAYTO_CONSTR_1X)>
</cfif>

<!--- CoNSTRUCTION 2 X CLOSE --->
<cfelseif (arguments.transaction_type eq 'Construction' and arguments.closing_type eq '2')>	

<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_01_CONSTR_2X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_01_CONSTR_2X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_01_CONSTR_2X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_01_CONSTR_2X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_01_CONSTR_2X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_01_CONSTR_2X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_01_CONSTR_2X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>

<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_02_CONSTR_2X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_02_CONSTR_2X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_02_CONSTR_2X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_02_CONSTR_2X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_02_CONSTR_2X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_02_CONSTR_2X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_02_CONSTR_2X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>

<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_03_CONSTR_2X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_03_CONSTR_2X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_03_CONSTR_2X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_03_CONSTR_2X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_03_CONSTR_2X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_03_CONSTR_2X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_03_CONSTR_2X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_04_CONSTR_2X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_04_CONSTR_2X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_04_CONSTR_2X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_04_CONSTR_2X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_04_CONSTR_2X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_04_CONSTR_2X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_04_CONSTR_2X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_05_CONSTR_2X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_05_CONSTR_2X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_05_CONSTR_2X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_05_CONSTR_2X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_05_CONSTR_2X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_05_CONSTR_2X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_05_CONSTR_2X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_06_CONSTR_2X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_06_CONSTR_2X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_06_CONSTR_2X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_06_CONSTR_2X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_06_CONSTR_2X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_06_CONSTR_2X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_06_CONSTR_2X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_07_CONSTR_2X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_07_CONSTR_2X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_07_CONSTR_2X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_07_CONSTR_2X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_07_CONSTR_2X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_07_CONSTR_2X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_07_CONSTR_2X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_08_CONSTR_2X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_08_CONSTR_2X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_08_CONSTR_2X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_08_CONSTR_2X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_08_CONSTR_2X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_08_CONSTR_2X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_08_CONSTR_2X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_09_CONSTR_2X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_09_CONSTR_2X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_09_CONSTR_2X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_09_CONSTR_2X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_09_CONSTR_2X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_09_CONSTR_2X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_09_CONSTR_2X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_10_CONSTR_2X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_10_CONSTR_2X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_10_CONSTR_2X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_10_CONSTR_2X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_10_CONSTR_2X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_10_CONSTR_2X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_10_CONSTR_2X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_11_CONSTR_2X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_11_CONSTR_2X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_11_CONSTR_2X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_11_CONSTR_2X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_11_CONSTR_2X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_11_CONSTR_2X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_11_CONSTR_2X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_12_CONSTR_2X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_12_CONSTR_2X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_12_CONSTR_2X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_12_CONSTR_2X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_12_CONSTR_2X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_12_CONSTR_2X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_12_CONSTR_2X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_13_CONSTR_2X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_13_CONSTR_2X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_13_CONSTR_2X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_13_CONSTR_2X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_13_CONSTR_2X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_13_CONSTR_2X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_13_CONSTR_2X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_14_CONSTR_2X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_14_CONSTR_2X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_14_CONSTR_2X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_14_CONSTR_2X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_14_CONSTR_2X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_14_CONSTR_2X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_14_CONSTR_2X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_15_CONSTR_2X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_15_CONSTR_2X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_15_CONSTR_2X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_15_CONSTR_2X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_15_CONSTR_2X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_15_CONSTR_2X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_15_CONSTR_2X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_16_CONSTR_2X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_16_CONSTR_2X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_16_CONSTR_2X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_16_CONSTR_2X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_16_CONSTR_2X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_16_CONSTR_2X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_16_CONSTR_2X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_17_CONSTR_2X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_17_CONSTR_2X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_17_CONSTR_2X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_17_CONSTR_2X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_17_CONSTR_2X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_17_CONSTR_2X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_17_CONSTR_2X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_18_CONSTR_2X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_18_CONSTR_2X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_18_CONSTR_2X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_18_CONSTR_2X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_18_CONSTR_2X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_18_CONSTR_2X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_18_CONSTR_2X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_19_CONSTR_2X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_19_CONSTR_2X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_19_CONSTR_2X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_19_CONSTR_2X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_19_CONSTR_2X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_19_CONSTR_2X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_19_CONSTR_2X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_20_CONSTR_2X) and read_itemized_construction.A_1101_ITEM_SELECTABLE_20_CONSTR_2X neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_20_CONSTR_2X)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_20_CONSTR_2X, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_20_CONSTR_2X, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_20_CONSTR_2X>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_20_CONSTR_2X, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>




<cfif #read_this_sets_billing_values_construction.A_0801_AMOUNT_CONSTR_2X# neq "">
<cfset a_801 = #read_this_sets_billing_values_construction.A_0801_AMOUNT_CONSTR_2X#>
<cfset temp = AddQueryItem(801, read_this_sets_billing_values_construction.A_0801_DESCRIPTION_CONSTR_2X, NumberFormat(read_this_sets_billing_values_construction.A_0801_AMOUNT_CONSTR_2X, '_____.__'), "Buyer", 1)>
</cfif>


<cfif #read_this_sets_billing_values_construction.A_0802_AMOUNT_CONSTR_2X# neq "">
<cfset a_802 = #read_this_sets_billing_values_construction.A_0802_AMOUNT_CONSTR_2X#>
<cfset temp = AddQueryItem(802, read_this_sets_billing_values_construction.A_0802_DESCRIPTION_CONSTR_2X, ReplaceNoCase(read_this_sets_billing_values_construction.A_0802_AMOUNT_CONSTR_2X, " ", "", "ALL"), "Buyer", 1)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_0801_AMOUNT_CONSTR_2X# neq "" and #read_this_sets_billing_values_construction.A_0802_AMOUNT_CONSTR_2X# neq "">
<cfset temp = AddQueryItem(803, "Your adjusted origination charges", NumberFormat((read_this_sets_billing_values_construction.A_0802_AMOUNT_CONSTR_2X + read_this_sets_billing_values_construction.A_0801_AMOUNT_CONSTR_2X), '_____.__'), "Buyer", 0)>
</cfif>


<cfif #read_this_sets_billing_values_construction.A_0804_AMOUNT_CONSTR_2X# neq "">
<cfset a_804 = #read_this_sets_billing_values_construction.A_0804_AMOUNT_CONSTR_2X#>
<cfset temp = AddQueryItem(804, read_this_sets_billing_values_construction.A_0804_DESCRIPTION_CONSTR_2X, NumberFormat(read_this_sets_billing_values_construction.A_0804_AMOUNT_CONSTR_2X, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0804_PAYTO_CONSTR_2X)>
</cfif>


<cfif #read_this_sets_billing_values_construction.A_0805_AMOUNT_CONSTR_2X# neq "">
<cfset a_805 = #read_this_sets_billing_values_construction.A_0805_AMOUNT_CONSTR_2X#>
<cfset temp = AddQueryItem(805, read_this_sets_billing_values_construction.A_0805_DESCRIPTION_CONSTR_2X, NumberFormat(read_this_sets_billing_values_construction.A_0805_AMOUNT_CONSTR_2X, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0805_PAYTO_CONSTR_2X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_0806_AMOUNT_CONSTR_2X# neq "">
<cfset a_806 = #read_this_sets_billing_values_construction.A_0806_AMOUNT_CONSTR_2X#>
<cfset temp = AddQueryItem(806, read_this_sets_billing_values_construction.A_0806_DESCRIPTION_CONSTR_2X, NumberFormat(read_this_sets_billing_values_construction.A_0806_AMOUNT_CONSTR_2X, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0806_PAYTO_CONSTR_2X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_0807_AMOUNT_CONSTR_2X# neq "">
<cfset a_807 = #read_this_sets_billing_values_construction.A_0807_AMOUNT_CONSTR_2X#>
<cfset temp = AddQueryItem(807, read_this_sets_billing_values_construction.A_0807_DESCRIPTION_CONSTR_2X, NumberFormat(read_this_sets_billing_values_construction.A_0807_AMOUNT_CONSTR_2X, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0807_PAYTO_CONSTR_2X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_0808_AMOUNT_CONSTR_2X# neq "">
<cfset a_808 = #read_this_sets_billing_values_construction.A_0808_AMOUNT_CONSTR_2X#>
<cfset temp = AddQueryItem(808, read_this_sets_billing_values_construction.A_0808_DESCRIPTION_CONSTR_2X, NumberFormat(read_this_sets_billing_values_construction.A_0808_AMOUNT_CONSTR_2X, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0808_PAYTO_CONSTR_2X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_0809_AMOUNT_CONSTR_2X# neq "">
<cfset a_809 = #read_this_sets_billing_values_construction.A_0809_AMOUNT_CONSTR_2X#>
<cfset temp = AddQueryItem(809, read_this_sets_billing_values_construction.A_0809_DESCRIPTION_CONSTR_2X, NumberFormat(read_this_sets_billing_values_construction.A_0809_AMOUNT_CONSTR_2X, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0809_PAYTO_CONSTR_2X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_0810_AMOUNT_CONSTR_2X# neq "">
<cfset a_810 = #read_this_sets_billing_values_construction.A_0810_AMOUNT_CONSTR_2X#>
<cfset temp = AddQueryItem(810, read_this_sets_billing_values_construction.A_0810_DESCRIPTION_CONSTR_2X, NumberFormat(read_this_sets_billing_values_construction.A_0810_AMOUNT_CONSTR_2X, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0810_PAYTO_CONSTR_2X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_0811_AMOUNT_CONSTR_2X# neq "">
<cfset a_811 = #read_this_sets_billing_values_construction.A_0811_AMOUNT_CONSTR_2X#>
<cfset temp = AddQueryItem(811, read_this_sets_billing_values_construction.A_0811_DESCRIPTION_CONSTR_2X, NumberFormat(read_this_sets_billing_values_construction.A_0811_AMOUNT_CONSTR_2X, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0811_PAYTO_CONSTR_2X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_0812_AMOUNT_CONSTR_2X# neq "">
<cfset a_812 = #read_this_sets_billing_values_construction.A_0812_AMOUNT_CONSTR_2X#>
<cfset temp = AddQueryItem(812, read_this_sets_billing_values_construction.A_0812_DESCRIPTION_CONSTR_2X, NumberFormat(read_this_sets_billing_values_construction.A_0812_AMOUNT_CONSTR_2X, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0812_PAYTO_CONSTR_2X)>
</cfif>


<cfif #read_this_sets_billing_values_construction.A_1102_AMOUNT_CONSTR_2X# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values_construction.A_1102_AMOUNT_CONSTR_2X>
<cfset a_1102 = #read_this_sets_billing_values_construction.A_1102_AMOUNT_CONSTR_2X#>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values_construction.A_1102_DESCRIPTION_CONSTR_2X, NumberFormat(read_this_sets_billing_values_construction.A_1102_AMOUNT_CONSTR_2X, '_____.__'), "Buyer", 1, read_this_sets_billing_values_construction.A_1102_PAYTO_CONSTR_2X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1109_AMOUNT_CONSTR_2X# neq "">
<cfif read_this_sets_billing_values_construction.A_1109_OUTSIDE_CONSTR_2X eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values_construction.A_1109_AMOUNT_CONSTR_2X>
</cfif>


<cfset temp = AddQueryItem(1109, read_this_sets_billing_values_construction.A_1109_DESCRIPTION_CONSTR_2X, NumberFormat(read_this_sets_billing_values_construction.A_1109_AMOUNT_CONSTR_2X, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1109_OUTSIDE_CONSTR_2X, read_this_sets_billing_values_construction.A_1109_PAYTO_CONSTR_2X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1110_AMOUNT_CONSTR_2X# neq "">
<cfif read_this_sets_billing_values_construction.A_1110_OUTSIDE_CONSTR_2X eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values_construction.A_1110_AMOUNT_CONSTR_2X>
</cfif>
<cfset temp = AddQueryItem(1110, read_this_sets_billing_values_construction.A_1110_DESCRIPTION_CONSTR_2X, NumberFormat(read_this_sets_billing_values_construction.A_1110_AMOUNT_CONSTR_2X, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1110_OUTSIDE_CONSTR_2X, read_this_sets_billing_values_construction.A_1110_PAYTO_CONSTR_2X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1111_AMOUNT_CONSTR_2X# neq "">
<cfif read_this_sets_billing_values_construction.A_1111_OUTSIDE_CONSTR_2X eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values_construction.A_1111_AMOUNT_CONSTR_2X>
</cfif>
<cfset temp = AddQueryItem(1111, read_this_sets_billing_values_construction.A_1111_DESCRIPTION_CONSTR_2X, NumberFormat(read_this_sets_billing_values_construction.A_1111_AMOUNT_CONSTR_2X, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1111_OUTSIDE_CONSTR_2X, read_this_sets_billing_values_construction.A_1111_PAYTO_CONSTR_2X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1112_AMOUNT_CONSTR_2X# neq "">
<cfif read_this_sets_billing_values_construction.A_1112_OUTSIDE_CONSTR_2X eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values_construction.A_1112_AMOUNT_CONSTR_2X>
</cfif>
<cfset temp = AddQueryItem(1112, read_this_sets_billing_values_construction.A_1112_DESCRIPTION_CONSTR_2X, NumberFormat(read_this_sets_billing_values_construction.A_1112_AMOUNT_CONSTR_2X, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1112_OUTSIDE_CONSTR_2X, read_this_sets_billing_values_construction.A_1112_PAYTO_CONSTR_2X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1113_AMOUNT_CONSTR_2X# neq "">
<cfif read_this_sets_billing_values_construction.A_1113_OUTSIDE_CONSTR_2X eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values_construction.A_1113_AMOUNT_CONSTR_2X>
</cfif>
<cfset temp = AddQueryItem(1113, read_this_sets_billing_values_construction.A_1113_DESCRIPTION_CONSTR_2X, NumberFormat(read_this_sets_billing_values_construction.A_1113_AMOUNT_CONSTR_2X, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1113_OUTSIDE_CONSTR_2X, read_this_sets_billing_values_construction.A_1113_PAYTO_CONSTR_2X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1302_AMOUNT_CONSTR_2X# neq "">
<cfif read_this_sets_billing_values_construction.A_1302_OUTSIDE_CONSTR_2X eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values_construction.A_1302_AMOUNT_CONSTR_2X>
</cfif>
<cfset temp = AddQueryItem(1302, read_this_sets_billing_values_construction.A_1302_DESCRIPTION_CONSTR_2X, NumberFormat(read_this_sets_billing_values_construction.A_1302_AMOUNT_CONSTR_2X, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1302_OUTSIDE_CONSTR_2X, read_this_sets_billing_values_construction.A_1302_PAYTO_CONSTR_2X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1303_AMOUNT_CONSTR_2X# neq "">
<cfif read_this_sets_billing_values_construction.A_1303_OUTSIDE_CONSTR_2X eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values_construction.A_1303_AMOUNT_CONSTR_2X>
</cfif>
<cfset temp = AddQueryItem(1303, read_this_sets_billing_values_construction.A_1303_DESCRIPTION_CONSTR_2X, NumberFormat(read_this_sets_billing_values_construction.A_1303_AMOUNT_CONSTR_2X, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1303_OUTSIDE_CONSTR_2X, read_this_sets_billing_values_construction.A_1303_PAYTO_CONSTR_2X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1304_AMOUNT_CONSTR_2X# neq "">
<cfif read_this_sets_billing_values_construction.A_1304_OUTSIDE_CONSTR_2X eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values_construction.A_1304_AMOUNT_CONSTR_2X>
</cfif>
<cfset temp = AddQueryItem(1304, read_this_sets_billing_values_construction.A_1304_DESCRIPTION_CONSTR_2X, NumberFormat(read_this_sets_billing_values_construction.A_1304_AMOUNT_CONSTR_2X, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1304_OUTSIDE_CONSTR_2X, read_this_sets_billing_values_construction.A_1304_PAYTO_CONSTR_2X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1305_AMOUNT_CONSTR_2X# neq "">
<cfif read_this_sets_billing_values_construction.A_1305_OUTSIDE_CONSTR_2X eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values_construction.A_1305_AMOUNT_CONSTR_2X>
</cfif>
<cfset temp = AddQueryItem(1305, read_this_sets_billing_values_construction.A_1305_DESCRIPTION_CONSTR_2X, NumberFormat(read_this_sets_billing_values_construction.A_1305_AMOUNT_CONSTR_2X, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1305_OUTSIDE_CONSTR_2X, read_this_sets_billing_values_construction.A_1305_PAYTO_CONSTR_2X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1306_AMOUNT_CONSTR_2X# neq "">
<cfif read_this_sets_billing_values_construction.A_1306_OUTSIDE_CONSTR_2X eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values_construction.A_1306_AMOUNT_CONSTR_2X>
</cfif>
<cfset temp = AddQueryItem(1306, read_this_sets_billing_values_construction.A_1306_DESCRIPTION_CONSTR_2X, NumberFormat(read_this_sets_billing_values_construction.A_1306_AMOUNT_CONSTR_2X, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1306_OUTSIDE_CONSTR_2X, read_this_sets_billing_values_construction.A_1306_PAYTO_CONSTR_2X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1307_AMOUNT_CONSTR_2X# neq "">
<cfif read_this_sets_billing_values_construction.A_1307_OUTSIDE_CONSTR_2X eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values_construction.A_1307_AMOUNT_CONSTR_2X>
</cfif>
<cfset temp = AddQueryItem(1307, read_this_sets_billing_values_construction.A_1307_DESCRIPTION_CONSTR_2X, NumberFormat(read_this_sets_billing_values_construction.A_1307_AMOUNT_CONSTR_2X, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1307_OUTSIDE_CONSTR_2X, read_this_sets_billing_values_construction.A_1307_PAYTO_CONSTR_2X)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1308_AMOUNT_CONSTR_2X# neq "">
<cfif read_this_sets_billing_values_construction.A_1308_OUTSIDE_CONSTR_2X eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values_construction.A_1308_AMOUNT_CONSTR_2X>
</cfif>
<cfset temp = AddQueryItem(1308, read_this_sets_billing_values_construction.A_1308_DESCRIPTION_CONSTR_2X, NumberFormat(read_this_sets_billing_values_construction.A_1308_AMOUNT_CONSTR_2X, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1308_OUTSIDE_CONSTR_2X, read_this_sets_billing_values_construction.A_1308_PAYTO_CONSTR_2X)>
</cfif>




<!--- CONSTRUCTION TO PERM --->
<cfelseif (arguments.transaction_type eq 'Construction' and arguments.closing_type eq '3')>	

<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_01_END_LOAN) and read_itemized_construction.A_1101_ITEM_SELECTABLE_01_END_LOAN neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_01_END_LOAN)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_01_END_LOAN, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_01_END_LOAN, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_01_END_LOAN>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_01_END_LOAN, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>

<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_02_END_LOAN) and read_itemized_construction.A_1101_ITEM_SELECTABLE_02_END_LOAN neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_02_END_LOAN)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_02_END_LOAN, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_02_END_LOAN, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_02_END_LOAN>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_02_END_LOAN, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>

<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_03_END_LOAN) and read_itemized_construction.A_1101_ITEM_SELECTABLE_03_END_LOAN neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_03_END_LOAN)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_03_END_LOAN, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_03_END_LOAN, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_03_END_LOAN>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_03_END_LOAN, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_04_END_LOAN) and read_itemized_construction.A_1101_ITEM_SELECTABLE_04_END_LOAN neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_04_END_LOAN)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_04_END_LOAN, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_04_END_LOAN, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_04_END_LOAN>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_04_END_LOAN, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_05_END_LOAN) and read_itemized_construction.A_1101_ITEM_SELECTABLE_05_END_LOAN neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_05_END_LOAN)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_05_END_LOAN, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_05_END_LOAN, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_05_END_LOAN>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_05_END_LOAN, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_06_END_LOAN) and read_itemized_construction.A_1101_ITEM_SELECTABLE_06_END_LOAN neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_06_END_LOAN)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_06_END_LOAN, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_06_END_LOAN, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_06_END_LOAN>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_06_END_LOAN, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_07_END_LOAN) and read_itemized_construction.A_1101_ITEM_SELECTABLE_07_END_LOAN neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_07_END_LOAN)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_07_END_LOAN, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_07_END_LOAN, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_07_END_LOAN>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_07_END_LOAN, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_08_END_LOAN) and read_itemized_construction.A_1101_ITEM_SELECTABLE_08_END_LOAN neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_08_END_LOAN)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_08_END_LOAN, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_08_END_LOAN, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_08_END_LOAN>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_08_END_LOAN, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_09_END_LOAN) and read_itemized_construction.A_1101_ITEM_SELECTABLE_09_END_LOAN neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_09_END_LOAN)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_09_END_LOAN, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_09_END_LOAN, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_09_END_LOAN>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_09_END_LOAN, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_10_END_LOAN) and read_itemized_construction.A_1101_ITEM_SELECTABLE_10_END_LOAN neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_10_END_LOAN)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_10_END_LOAN, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_10_END_LOAN, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_10_END_LOAN>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_10_END_LOAN, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_11_END_LOAN) and read_itemized_construction.A_1101_ITEM_SELECTABLE_11_END_LOAN neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_11_END_LOAN)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_11_END_LOAN, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_11_END_LOAN, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_11_END_LOAN>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_11_END_LOAN, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_12_END_LOAN) and read_itemized_construction.A_1101_ITEM_SELECTABLE_12_END_LOAN neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_12_END_LOAN)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_12_END_LOAN, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_12_END_LOAN, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_12_END_LOAN>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_12_END_LOAN, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_13_END_LOAN) and read_itemized_construction.A_1101_ITEM_SELECTABLE_13_END_LOAN neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_13_END_LOAN)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_13_END_LOAN, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_13_END_LOAN, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_13_END_LOAN>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_13_END_LOAN, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_14_END_LOAN) and read_itemized_construction.A_1101_ITEM_SELECTABLE_14_END_LOAN neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_14_END_LOAN)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_14_END_LOAN, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_14_END_LOAN, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_14_END_LOAN>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_14_END_LOAN, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_15_END_LOAN) and read_itemized_construction.A_1101_ITEM_SELECTABLE_15_END_LOAN neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_15_END_LOAN)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_15_END_LOAN, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_15_END_LOAN, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_15_END_LOAN>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_15_END_LOAN, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_16_END_LOAN) and read_itemized_construction.A_1101_ITEM_SELECTABLE_16_END_LOAN neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_16_END_LOAN)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_16_END_LOAN, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_16_END_LOAN, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_16_END_LOAN>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_16_END_LOAN, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_17_END_LOAN) and read_itemized_construction.A_1101_ITEM_SELECTABLE_17_END_LOAN neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_17_END_LOAN)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_17_END_LOAN, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_17_END_LOAN, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_17_END_LOAN>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_17_END_LOAN, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_18_END_LOAN) and read_itemized_construction.A_1101_ITEM_SELECTABLE_18_END_LOAN neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_18_END_LOAN)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_18_END_LOAN, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_18_END_LOAN, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_18_END_LOAN>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_18_END_LOAN, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_19_END_LOAN) and read_itemized_construction.A_1101_ITEM_SELECTABLE_19_END_LOAN neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_19_END_LOAN)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_19_END_LOAN, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_19_END_LOAN, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_19_END_LOAN>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_19_END_LOAN, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized_construction.A_1101_ITEM_AMOUNT_20_END_LOAN) and read_itemized_construction.A_1101_ITEM_SELECTABLE_20_END_LOAN neq 1)>
<cfif IsNumeric(read_itemized_construction.A_1101_ITEM_AMOUNT_20_END_LOAN)>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_20_END_LOAN, NumberFormat(read_itemized_construction.A_1101_ITEM_AMOUNT_20_END_LOAN, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized_construction.A_1101_ITEM_AMOUNT_20_END_LOAN>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized_construction.A_1101_ITEM_DESCRIPTION_20_END_LOAN, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>




<cfif #read_this_sets_billing_values_construction.A_0801_AMOUNT_END_LOAN# neq "">
<cfset a_801 = #read_this_sets_billing_values_construction.A_0801_AMOUNT_END_LOAN#>
<cfset temp = AddQueryItem(801, read_this_sets_billing_values_construction.A_0801_DESCRIPTION_END_LOAN, NumberFormat(read_this_sets_billing_values_construction.A_0801_AMOUNT_END_LOAN, '_____.__'), "Buyer", 1)>
</cfif>


<cfif #read_this_sets_billing_values_construction.A_0802_AMOUNT_END_LOAN# neq "">
<cfset a_802 = #read_this_sets_billing_values_construction.A_0802_AMOUNT_END_LOAN#>
<cfset temp = AddQueryItem(802, read_this_sets_billing_values_construction.A_0802_DESCRIPTION_END_LOAN, ReplaceNoCase(read_this_sets_billing_values_construction.A_0802_AMOUNT_END_LOAN, " ", "", "ALL"), "Buyer", 1)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_0801_AMOUNT_END_LOAN# neq "" and #read_this_sets_billing_values_construction.A_0802_AMOUNT_END_LOAN# neq "">
<cfset temp = AddQueryItem(803, "Your adjusted origination charges", NumberFormat((read_this_sets_billing_values_construction.A_0802_AMOUNT_END_LOAN + read_this_sets_billing_values_construction.A_0801_AMOUNT_END_LOAN), '_____.__'), "Buyer", 0)>
</cfif>


<cfif #read_this_sets_billing_values_construction.A_0804_AMOUNT_END_LOAN# neq "">
<cfset a_804 = #read_this_sets_billing_values_construction.A_0804_AMOUNT_END_LOAN#>
<cfset temp = AddQueryItem(804, read_this_sets_billing_values_construction.A_0804_DESCRIPTION_END_LOAN, NumberFormat(read_this_sets_billing_values_construction.A_0804_AMOUNT_END_LOAN, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0804_PAYTO_END_LOAN)>
</cfif>


<cfif #read_this_sets_billing_values_construction.A_0805_AMOUNT_END_LOAN# neq "">
<cfset a_805 = #read_this_sets_billing_values_construction.A_0805_AMOUNT_END_LOAN#>
<cfset temp = AddQueryItem(805, read_this_sets_billing_values_construction.A_0805_DESCRIPTION_END_LOAN, NumberFormat(read_this_sets_billing_values_construction.A_0805_AMOUNT_END_LOAN, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0805_PAYTO_END_LOAN)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_0806_AMOUNT_END_LOAN# neq "">
<cfset a_806 = #read_this_sets_billing_values_construction.A_0806_AMOUNT_END_LOAN#>
<cfset temp = AddQueryItem(806, read_this_sets_billing_values_construction.A_0806_DESCRIPTION_END_LOAN, NumberFormat(read_this_sets_billing_values_construction.A_0806_AMOUNT_END_LOAN, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0806_PAYTO_END_LOAN)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_0807_AMOUNT_END_LOAN# neq "">
<cfset a_807 = #read_this_sets_billing_values_construction.A_0807_AMOUNT_END_LOAN#>
<cfset temp = AddQueryItem(807, read_this_sets_billing_values_construction.A_0807_DESCRIPTION_END_LOAN, NumberFormat(read_this_sets_billing_values_construction.A_0807_AMOUNT_END_LOAN, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0807_PAYTO_END_LOAN)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_0808_AMOUNT_END_LOAN# neq "">
<cfset a_808 = #read_this_sets_billing_values_construction.A_0808_AMOUNT_END_LOAN#>
<cfset temp = AddQueryItem(808, read_this_sets_billing_values_construction.A_0808_DESCRIPTION_END_LOAN, NumberFormat(read_this_sets_billing_values_construction.A_0808_AMOUNT_END_LOAN, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0808_PAYTO_END_LOAN)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_0809_AMOUNT_END_LOAN# neq "">
<cfset a_809 = #read_this_sets_billing_values_construction.A_0809_AMOUNT_END_LOAN#>
<cfset temp = AddQueryItem(809, read_this_sets_billing_values_construction.A_0809_DESCRIPTION_END_LOAN, NumberFormat(read_this_sets_billing_values_construction.A_0809_AMOUNT_END_LOAN, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0809_PAYTO_END_LOAN)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_0810_AMOUNT_END_LOAN# neq "">
<cfset a_810 = #read_this_sets_billing_values_construction.A_0810_AMOUNT_END_LOAN#>
<cfset temp = AddQueryItem(810, read_this_sets_billing_values_construction.A_0810_DESCRIPTION_END_LOAN, NumberFormat(read_this_sets_billing_values_construction.A_0810_AMOUNT_END_LOAN, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0810_PAYTO_END_LOAN)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_0811_AMOUNT_END_LOAN# neq "">
<cfset a_811 = #read_this_sets_billing_values_construction.A_0811_AMOUNT_END_LOAN#>
<cfset temp = AddQueryItem(811, read_this_sets_billing_values_construction.A_0811_DESCRIPTION_END_LOAN, NumberFormat(read_this_sets_billing_values_construction.A_0811_AMOUNT_END_LOAN, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0811_PAYTO_END_LOAN)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_0812_AMOUNT_END_LOAN# neq "">
<cfset a_812 = #read_this_sets_billing_values_construction.A_0812_AMOUNT_END_LOAN#>
<cfset temp = AddQueryItem(812, read_this_sets_billing_values_construction.A_0812_DESCRIPTION_END_LOAN, NumberFormat(read_this_sets_billing_values_construction.A_0812_AMOUNT_END_LOAN, '_____.__'), "Buyer", 0, read_this_sets_billing_values_construction.A_0812_PAYTO_END_LOAN)>
</cfif>


<cfif #read_this_sets_billing_values_construction.A_1102_AMOUNT_END_LOAN# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values_construction.A_1102_AMOUNT_END_LOAN>
<cfset a_1102 = #read_this_sets_billing_values_construction.A_1102_AMOUNT_END_LOAN#>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values_construction.A_1102_DESCRIPTION_END_LOAN, NumberFormat(read_this_sets_billing_values_construction.A_1102_AMOUNT_END_LOAN, '_____.__'), "Buyer", 1, read_this_sets_billing_values_construction.A_1102_PAYTO_END_LOAN)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1109_AMOUNT_END_LOAN# neq "">
<cfif read_this_sets_billing_values_construction.A_1109_OUTSIDE_END_LOAN eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values_construction.A_1109_AMOUNT_END_LOAN>
</cfif>


<cfset temp = AddQueryItem(1109, read_this_sets_billing_values_construction.A_1109_DESCRIPTION_END_LOAN, NumberFormat(read_this_sets_billing_values_construction.A_1109_AMOUNT_END_LOAN, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1109_OUTSIDE_END_LOAN, read_this_sets_billing_values_construction.A_1109_PAYTO_END_LOAN)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1110_AMOUNT_END_LOAN# neq "">
<cfif read_this_sets_billing_values_construction.A_1110_OUTSIDE_END_LOAN eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values_construction.A_1110_AMOUNT_END_LOAN>
</cfif>
<cfset temp = AddQueryItem(1110, read_this_sets_billing_values_construction.A_1110_DESCRIPTION_END_LOAN, NumberFormat(read_this_sets_billing_values_construction.A_1110_AMOUNT_END_LOAN, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1110_OUTSIDE_END_LOAN, read_this_sets_billing_values_construction.A_1110_PAYTO_END_LOAN)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1111_AMOUNT_END_LOAN# neq "">
<cfif read_this_sets_billing_values_construction.A_1111_OUTSIDE_END_LOAN eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values_construction.A_1111_AMOUNT_END_LOAN>
</cfif>
<cfset temp = AddQueryItem(1111, read_this_sets_billing_values_construction.A_1111_DESCRIPTION_END_LOAN, NumberFormat(read_this_sets_billing_values_construction.A_1111_AMOUNT_END_LOAN, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1111_OUTSIDE_END_LOAN, read_this_sets_billing_values_construction.A_1111_PAYTO_END_LOAN)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1112_AMOUNT_END_LOAN# neq "">
<cfif read_this_sets_billing_values_construction.A_1112_OUTSIDE_END_LOAN eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values_construction.A_1112_AMOUNT_END_LOAN>
</cfif>
<cfset temp = AddQueryItem(1112, read_this_sets_billing_values_construction.A_1112_DESCRIPTION_END_LOAN, NumberFormat(read_this_sets_billing_values_construction.A_1112_AMOUNT_END_LOAN, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1112_OUTSIDE_END_LOAN, read_this_sets_billing_values_construction.A_1112_PAYTO_END_LOAN)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1113_AMOUNT_END_LOAN# neq "">
<cfif read_this_sets_billing_values_construction.A_1113_OUTSIDE_END_LOAN eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values_construction.A_1113_AMOUNT_END_LOAN>
</cfif>
<cfset temp = AddQueryItem(1113, read_this_sets_billing_values_construction.A_1113_DESCRIPTION_END_LOAN, NumberFormat(read_this_sets_billing_values_construction.A_1113_AMOUNT_END_LOAN, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1113_OUTSIDE_END_LOAN, read_this_sets_billing_values_construction.A_1113_PAYTO_END_LOAN)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1302_AMOUNT_END_LOAN# neq "">
<cfif read_this_sets_billing_values_construction.A_1302_OUTSIDE_END_LOAN eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values_construction.A_1302_AMOUNT_END_LOAN>
</cfif>
<cfset temp = AddQueryItem(1302, read_this_sets_billing_values_construction.A_1302_DESCRIPTION_END_LOAN, NumberFormat(read_this_sets_billing_values_construction.A_1302_AMOUNT_END_LOAN, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1302_OUTSIDE_END_LOAN, read_this_sets_billing_values_construction.A_1302_PAYTO_END_LOAN)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1303_AMOUNT_END_LOAN# neq "">
<cfif read_this_sets_billing_values_construction.A_1303_OUTSIDE_END_LOAN eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values_construction.A_1303_AMOUNT_END_LOAN>
</cfif>
<cfset temp = AddQueryItem(1303, read_this_sets_billing_values_construction.A_1303_DESCRIPTION_END_LOAN, NumberFormat(read_this_sets_billing_values_construction.A_1303_AMOUNT_END_LOAN, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1303_OUTSIDE_END_LOAN, read_this_sets_billing_values_construction.A_1303_PAYTO_END_LOAN)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1304_AMOUNT_END_LOAN# neq "">
<cfif read_this_sets_billing_values_construction.A_1304_OUTSIDE_END_LOAN eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values_construction.A_1304_AMOUNT_END_LOAN>
</cfif>
<cfset temp = AddQueryItem(1304, read_this_sets_billing_values_construction.A_1304_DESCRIPTION_END_LOAN, NumberFormat(read_this_sets_billing_values_construction.A_1304_AMOUNT_END_LOAN, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1304_OUTSIDE_END_LOAN, read_this_sets_billing_values_construction.A_1304_PAYTO_END_LOAN)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1305_AMOUNT_END_LOAN# neq "">
<cfif read_this_sets_billing_values_construction.A_1305_OUTSIDE_END_LOAN eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values_construction.A_1305_AMOUNT_END_LOAN>
</cfif>
<cfset temp = AddQueryItem(1305, read_this_sets_billing_values_construction.A_1305_DESCRIPTION_END_LOAN, NumberFormat(read_this_sets_billing_values_construction.A_1305_AMOUNT_END_LOAN, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1305_OUTSIDE_END_LOAN, read_this_sets_billing_values_construction.A_1305_PAYTO_END_LOAN)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1306_AMOUNT_END_LOAN# neq "">
<cfif read_this_sets_billing_values_construction.A_1306_OUTSIDE_END_LOAN eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values_construction.A_1306_AMOUNT_END_LOAN>
</cfif>
<cfset temp = AddQueryItem(1306, read_this_sets_billing_values_construction.A_1306_DESCRIPTION_END_LOAN, NumberFormat(read_this_sets_billing_values_construction.A_1306_AMOUNT_END_LOAN, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1306_OUTSIDE_END_LOAN, read_this_sets_billing_values_construction.A_1306_PAYTO_END_LOAN)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1307_AMOUNT_END_LOAN# neq "">
<cfif read_this_sets_billing_values_construction.A_1307_OUTSIDE_END_LOAN eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values_construction.A_1307_AMOUNT_END_LOAN>
</cfif>
<cfset temp = AddQueryItem(1307, read_this_sets_billing_values_construction.A_1307_DESCRIPTION_END_LOAN, NumberFormat(read_this_sets_billing_values_construction.A_1307_AMOUNT_END_LOAN, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1307_OUTSIDE_END_LOAN, read_this_sets_billing_values_construction.A_1307_PAYTO_END_LOAN)>
</cfif>

<cfif #read_this_sets_billing_values_construction.A_1308_AMOUNT_END_LOAN# neq "">
<cfif read_this_sets_billing_values_construction.A_1308_OUTSIDE_END_LOAN eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values_construction.A_1308_AMOUNT_END_LOAN>
</cfif>
<cfset temp = AddQueryItem(1308, read_this_sets_billing_values_construction.A_1308_DESCRIPTION_END_LOAN, NumberFormat(read_this_sets_billing_values_construction.A_1308_AMOUNT_END_LOAN, '_____.__'), "Buyer", read_this_sets_billing_values_construction.A_1308_OUTSIDE_END_LOAN, read_this_sets_billing_values_construction.A_1308_PAYTO_END_LOAN)>
</cfif>


<!--- PURCHASE --->
<cfelseif (#arguments.transaction_type# eq "Purchase")>	

<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_01_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_01_PURCHASE neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_01_PURCHASE)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_01_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_01_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_01_PURCHASE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_01_PURCHASE, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>

<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_02_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_02_PURCHASE neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_02_PURCHASE)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_02_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_02_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_02_PURCHASE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_02_PURCHASE, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>

<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_03_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_03_PURCHASE neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_03_PURCHASE)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_03_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_03_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_03_PURCHASE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_03_PURCHASE, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_04_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_04_PURCHASE neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_04_PURCHASE)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_04_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_04_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_04_PURCHASE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_04_PURCHASE, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_05_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_05_PURCHASE neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_05_PURCHASE)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_05_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_05_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_05_PURCHASE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_05_PURCHASE, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_06_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_06_PURCHASE neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_06_PURCHASE)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_06_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_06_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_06_PURCHASE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_06_PURCHASE, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_07_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_07_PURCHASE neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_07_PURCHASE)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_07_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_07_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_07_PURCHASE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_07_PURCHASE, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_08_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_08_PURCHASE neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_08_PURCHASE)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_08_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_08_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_08_PURCHASE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_08_PURCHASE, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_09_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_09_PURCHASE neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_09_PURCHASE)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_09_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_09_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_09_PURCHASE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_09_PURCHASE, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_10_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_10_PURCHASE neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_10_PURCHASE)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_10_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_10_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_10_PURCHASE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_10_PURCHASE, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_11_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_11_PURCHASE neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_11_PURCHASE)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_11_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_11_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_11_PURCHASE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_11_PURCHASE, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_12_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_12_PURCHASE neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_12_PURCHASE)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_12_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_12_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_12_PURCHASE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_12_PURCHASE, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_13_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_13_PURCHASE neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_13_PURCHASE)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_13_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_13_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_13_PURCHASE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_13_PURCHASE, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_14_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_14_PURCHASE neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_14_PURCHASE)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_14_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_14_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_14_PURCHASE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_14_PURCHASE, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_15_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_15_PURCHASE neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_15_PURCHASE)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_15_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_15_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_15_PURCHASE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_15_PURCHASE, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_16_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_16_PURCHASE neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_16_PURCHASE)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_16_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_16_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_16_PURCHASE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_16_PURCHASE, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_17_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_17_PURCHASE neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_17_PURCHASE)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_17_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_17_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_17_PURCHASE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_17_PURCHASE, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_18_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_18_PURCHASE neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_18_PURCHASE)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_18_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_18_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_18_PURCHASE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_18_PURCHASE, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_19_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_19_PURCHASE neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_19_PURCHASE)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_19_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_19_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_19_PURCHASE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_19_PURCHASE, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>


<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_20_PURCHASE) and read_itemized.A_1101_ITEM_SELECTABLE_20_PURCHASE neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_20_PURCHASE)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_20_PURCHASE, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_20_PURCHASE, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfset roll_up_1101 = roll_up_1101 + read_itemized.A_1101_ITEM_AMOUNT_20_PURCHASE>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_20_PURCHASE, "Call for Quote!", "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>

<cfif #read_this_sets_billing_values.A_0801_AMOUNT_PURCHASE# neq "">
<cfset a_801 = #read_this_sets_billing_values.A_0801_AMOUNT_PURCHASE#>
<cfset temp = AddQueryItem(801, read_this_sets_billing_values.A_0801_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_0801_AMOUNT_PURCHASE, '_____.__'), "Buyer", 1)>
</cfif>


<cfif #read_this_sets_billing_values.A_0802_AMOUNT_PURCHASE# neq "">
<cfset a_802 = #read_this_sets_billing_values.A_0802_AMOUNT_PURCHASE#>
<cfset temp = AddQueryItem(802, read_this_sets_billing_values.A_0802_DESCRIPTION_PURCHASE, ReplaceNoCase(read_this_sets_billing_values.A_0802_AMOUNT_PURCHASE, " ", "", "ALL"), "Buyer", 1)>
</cfif>

<cfif #read_this_sets_billing_values.A_0801_AMOUNT_PURCHASE# neq "" and #read_this_sets_billing_values.A_0802_AMOUNT_PURCHASE# neq "">
<cfset temp = AddQueryItem(803, "Your adjusted origination charges", NumberFormat((read_this_sets_billing_values.A_0802_AMOUNT_PURCHASE + read_this_sets_billing_values.A_0801_AMOUNT_PURCHASE), '_____.__'), "Buyer", 0)>
</cfif>


<cfif #read_this_sets_billing_values.A_0804_AMOUNT_PURCHASE# neq "">
<cfset a_804 = #read_this_sets_billing_values.A_0804_AMOUNT_PURCHASE#>
<cfset temp = AddQueryItem(804, read_this_sets_billing_values.A_0804_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_0804_AMOUNT_PURCHASE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0804_PAYTO_PURCHASE)>
</cfif>


<cfif #read_this_sets_billing_values.A_0805_AMOUNT_PURCHASE# neq "">
<cfset a_805 = #read_this_sets_billing_values.A_0805_AMOUNT_PURCHASE#>
<cfset temp = AddQueryItem(805, read_this_sets_billing_values.A_0805_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_0805_AMOUNT_PURCHASE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0805_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0806_AMOUNT_PURCHASE# neq "">
<cfset a_806 = #read_this_sets_billing_values.A_0806_AMOUNT_PURCHASE#>
<cfset temp = AddQueryItem(806, read_this_sets_billing_values.A_0806_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_0806_AMOUNT_PURCHASE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0806_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0807_AMOUNT_PURCHASE# neq "">
<cfset a_807 = #read_this_sets_billing_values.A_0807_AMOUNT_PURCHASE#>
<cfset temp = AddQueryItem(807, read_this_sets_billing_values.A_0807_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_0807_AMOUNT_PURCHASE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0807_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0808_AMOUNT_PURCHASE# neq "">
<cfset a_808 = #read_this_sets_billing_values.A_0808_AMOUNT_PURCHASE#>
<cfset temp = AddQueryItem(808, read_this_sets_billing_values.A_0808_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_0808_AMOUNT_PURCHASE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0808_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0809_AMOUNT_PURCHASE# neq "">
<cfset a_809 = #read_this_sets_billing_values.A_0809_AMOUNT_PURCHASE#>
<cfset temp = AddQueryItem(809, read_this_sets_billing_values.A_0809_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_0809_AMOUNT_PURCHASE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0809_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0810_AMOUNT_PURCHASE# neq "">
<cfset a_810 = #read_this_sets_billing_values.A_0810_AMOUNT_PURCHASE#>
<cfset temp = AddQueryItem(810, read_this_sets_billing_values.A_0810_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_0810_AMOUNT_PURCHASE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0810_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0811_AMOUNT_PURCHASE# neq "">
<cfset a_811 = #read_this_sets_billing_values.A_0811_AMOUNT_PURCHASE#>
<cfset temp = AddQueryItem(811, read_this_sets_billing_values.A_0811_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_0811_AMOUNT_PURCHASE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0811_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_0812_AMOUNT_PURCHASE# neq "">
<cfset a_812 = #read_this_sets_billing_values.A_0812_AMOUNT_PURCHASE#>
<cfset temp = AddQueryItem(812, read_this_sets_billing_values.A_0812_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_0812_AMOUNT_PURCHASE, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0812_PAYTO_PURCHASE)>
</cfif>


<cfif #read_this_sets_billing_values.A_1102_AMOUNT_PURCHASE# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102_AMOUNT_PURCHASE>
<cfset a_1102 = #read_this_sets_billing_values.A_1102_AMOUNT_PURCHASE#>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1102_AMOUNT_PURCHASE, '_____.__'), "Buyer", 1, read_this_sets_billing_values.A_1102_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1102A_AMOUNT_PURCHASE# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102A_AMOUNT_PURCHASE>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102A_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1102A_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102A_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1102A_PAYTO_PURCHASE, "X")>
</cfif>
<cfif #read_this_sets_billing_values.A_1102B_AMOUNT_PURCHASE# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102B_AMOUNT_PURCHASE>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102B_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1102B_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102B_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1102B_PAYTO_PURCHASE, "X")>
</cfif>
<cfif #read_this_sets_billing_values.A_1102C_AMOUNT_PURCHASE# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102C_AMOUNT_PURCHASE>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102C_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1102C_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102C_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1102C_PAYTO_PURCHASE, "X")>
</cfif>
<cfif #read_this_sets_billing_values.A_1102D_AMOUNT_PURCHASE# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102D_AMOUNT_PURCHASE>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102D_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1102D_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102D_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1102D_PAYTO_PURCHASE, "X")>
</cfif>
<cfif #read_this_sets_billing_values.A_1102E_AMOUNT_PURCHASE# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102E_AMOUNT_PURCHASE>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102E_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1102E_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102E_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1102E_PAYTO_PURCHASE, "X")>
</cfif>
<cfif #read_this_sets_billing_values.A_1102F_AMOUNT_PURCHASE# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102F_AMOUNT_PURCHASE>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102F_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1102F_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102F_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1102F_PAYTO_PURCHASE, "X")>
</cfif>
<cfif #read_this_sets_billing_values.A_1102G_AMOUNT_PURCHASE# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102G_AMOUNT_PURCHASE>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102G_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1102G_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102G_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1102G_PAYTO_PURCHASE, "X")>
</cfif>
<cfif #read_this_sets_billing_values.A_1102H_AMOUNT_PURCHASE# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102H_AMOUNT_PURCHASE>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102H_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1102H_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102H_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1102H_PAYTO_PURCHASE, "X")>
</cfif>
<cfif #read_this_sets_billing_values.A_1102I_AMOUNT_PURCHASE# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102I_AMOUNT_PURCHASE>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102I_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1102I_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102I_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1102I_PAYTO_PURCHASE, "X")>
</cfif>


<cfif #read_this_sets_billing_values.A_1109_AMOUNT_PURCHASE# neq "">
<cfif read_this_sets_billing_values.A_1109_OUTSIDE_PURCHASE eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1109_AMOUNT_PURCHASE>
</cfif>


<cfset temp = AddQueryItem(1109, read_this_sets_billing_values.A_1109_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1109_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1109_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1109_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1110_AMOUNT_PURCHASE# neq "">
<cfif read_this_sets_billing_values.A_1110_OUTSIDE_PURCHASE eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1110_AMOUNT_PURCHASE>
</cfif>
<cfset temp = AddQueryItem(1110, read_this_sets_billing_values.A_1110_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1110_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1110_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1110_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1111_AMOUNT_PURCHASE# neq "">
<cfif read_this_sets_billing_values.A_1111_OUTSIDE_PURCHASE eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1111_AMOUNT_PURCHASE>
</cfif>
<cfset temp = AddQueryItem(1111, read_this_sets_billing_values.A_1111_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1111_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1111_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1111_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1112_AMOUNT_PURCHASE# neq "">
<cfif read_this_sets_billing_values.A_1112_OUTSIDE_PURCHASE eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1112_AMOUNT_PURCHASE>
</cfif>
<cfset temp = AddQueryItem(1112, read_this_sets_billing_values.A_1112_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1112_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1112_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1112_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1113_AMOUNT_PURCHASE# neq "">
<cfif read_this_sets_billing_values.A_1113_OUTSIDE_PURCHASE eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1113_AMOUNT_PURCHASE>
</cfif>
<cfset temp = AddQueryItem(1113, read_this_sets_billing_values.A_1113_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1113_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1113_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1113_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1302_AMOUNT_PURCHASE# neq "">
<cfif read_this_sets_billing_values.A_1302_OUTSIDE_PURCHASE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1302_AMOUNT_PURCHASE>
</cfif>
<cfset temp = AddQueryItem(1302, read_this_sets_billing_values.A_1302_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1302_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1302_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1302_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1303_AMOUNT_PURCHASE# neq "">
<cfif read_this_sets_billing_values.A_1303_OUTSIDE_PURCHASE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1303_AMOUNT_PURCHASE>
</cfif>
<cfset temp = AddQueryItem(1303, read_this_sets_billing_values.A_1303_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1303_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1303_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1303_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1304_AMOUNT_PURCHASE# neq "">
<cfif read_this_sets_billing_values.A_1304_OUTSIDE_PURCHASE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1304_AMOUNT_PURCHASE>
</cfif>
<cfset temp = AddQueryItem(1304, read_this_sets_billing_values.A_1304_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1304_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1304_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1304_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1305_AMOUNT_PURCHASE# neq "">
<cfif read_this_sets_billing_values.A_1305_OUTSIDE_PURCHASE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1305_AMOUNT_PURCHASE>
</cfif>
<cfset temp = AddQueryItem(1305, read_this_sets_billing_values.A_1305_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1305_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1305_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1305_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1306_AMOUNT_PURCHASE# neq "">
<cfif read_this_sets_billing_values.A_1306_OUTSIDE_PURCHASE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1306_AMOUNT_PURCHASE>
</cfif>
<cfset temp = AddQueryItem(1306, read_this_sets_billing_values.A_1306_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1306_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1306_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1306_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1307_AMOUNT_PURCHASE# neq "">
<cfif read_this_sets_billing_values.A_1307_OUTSIDE_PURCHASE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1307_AMOUNT_PURCHASE>
</cfif>
<cfset temp = AddQueryItem(1307, read_this_sets_billing_values.A_1307_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1307_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1307_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1307_PAYTO_PURCHASE)>
</cfif>

<cfif #read_this_sets_billing_values.A_1308_AMOUNT_PURCHASE# neq "">
<cfif read_this_sets_billing_values.A_1308_OUTSIDE_PURCHASE eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1308_AMOUNT_PURCHASE>
</cfif>
<cfset temp = AddQueryItem(1308, read_this_sets_billing_values.A_1308_DESCRIPTION_PURCHASE, NumberFormat(read_this_sets_billing_values.A_1308_AMOUNT_PURCHASE, '_____.__'), "Buyer", read_this_sets_billing_values.A_1308_OUTSIDE_PURCHASE, read_this_sets_billing_values.A_1308_PAYTO_PURCHASE)>
</cfif>


<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_01_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_01_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_01_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_01_PURCHASE_SELLER, '_____.__'), "Seller", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_02_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_02_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_02_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_02_PURCHASE_SELLER, '_____.__'), "Seller", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_03_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_03_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_03_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_03_PURCHASE_SELLER, '_____.__'), "Seller", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_04_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_04_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_04_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_04_PURCHASE_SELLER, '_____.__'), "Seller", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_05_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_05_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_05_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_05_PURCHASE_SELLER, '_____.__'), "Seller", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_06_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_06_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_06_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_06_PURCHASE_SELLER, '_____.__'), "Seller", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_07_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_07_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_07_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_07_PURCHASE_SELLER, '_____.__'), "Seller", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_08_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_08_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_08_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_08_PURCHASE_SELLER, '_____.__'), "Seller", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_09_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_09_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_09_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_09_PURCHASE_SELLER, '_____.__'), "Seller", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_10_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_10_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_10_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_10_PURCHASE_SELLER, '_____.__'), "Seller", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_11_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_11_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_11_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_11_PURCHASE_SELLER, '_____.__'), "Seller", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_12_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_12_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_12_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_12_PURCHASE_SELLER, '_____.__'), "Seller", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_13_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_13_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_13_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_13_PURCHASE_SELLER, '_____.__'), "Seller", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_14_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_14_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_14_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_14_PURCHASE_SELLER, '_____.__'), "Seller", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_15_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_15_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_15_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_15_PURCHASE_SELLER, '_____.__'), "Seller", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_16_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_16_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_16_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_16_PURCHASE_SELLER, '_____.__'), "Seller", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_17_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_17_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_17_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_17_PURCHASE_SELLER, '_____.__'), "Seller", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_18_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_18_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_18_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_18_PURCHASE_SELLER, '_____.__'), "Seller", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_19_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_19_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_19_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_19_PURCHASE_SELLER, '_____.__'), "Seller", 0, #read_agency.title_ft_agency_name#)>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_20_PURCHASE_SELLER) and read_itemized.A_1101_ITEM_SELECTABLE_20_PURCHASE_SELLER neq 1)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_20_PURCHASE_SELLER, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_20_PURCHASE_SELLER, '_____.__'), "Seller", 0, #read_agency.title_ft_agency_name#)>
</cfif>

<cfif #read_this_sets_billing_values.A_0801_AMOUNT_PURCHASE_SELLER# neq "">
<cfset a_801 = #read_this_sets_billing_values.A_0801_AMOUNT_PURCHASE_SELLER#>
<cfset temp = AddQueryItem(801, read_this_sets_billing_values.A_0801_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_0801_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0)>
</cfif>


<cfif #read_this_sets_billing_values.A_0802_AMOUNT_PURCHASE_SELLER# neq "">
<cfset a_802 = #read_this_sets_billing_values.A_0802_AMOUNT_PURCHASE_SELLER#>
<cfset temp = AddQueryItem(802, read_this_sets_billing_values.A_0802_DESCRIPTION_PURCHASE_SELLER, ReplaceNoCase(read_this_sets_billing_values.A_0802_AMOUNT_PURCHASE_SELLER, " ", "", "ALL"), "Seller", 0)>
</cfif>

<cfif #read_this_sets_billing_values.A_0801_AMOUNT_PURCHASE_SELLER# neq "" and #read_this_sets_billing_values.A_0802_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(803, "Your adjusted origination charges", NumberFormat((read_this_sets_billing_values.A_0802_AMOUNT_PURCHASE_SELLER + read_this_sets_billing_values.A_0801_AMOUNT_PURCHASE_SELLER), '_____.__'), "Seller", 0)>
</cfif>


<cfif #read_this_sets_billing_values.A_0804_AMOUNT_PURCHASE_SELLER# neq "">
<cfset a_804 = #read_this_sets_billing_values.A_0804_AMOUNT_PURCHASE_SELLER#>
<cfset temp = AddQueryItem(804, read_this_sets_billing_values.A_0804_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_0804_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_0804_PAYTO_PURCHASE_SELLER)>
</cfif>


<cfif #read_this_sets_billing_values.A_0805_AMOUNT_PURCHASE_SELLER# neq "">
<cfset a_805 = #read_this_sets_billing_values.A_0805_AMOUNT_PURCHASE_SELLER#>
<cfset temp = AddQueryItem(805, read_this_sets_billing_values.A_0805_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_0805_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_0805_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_0806_AMOUNT_PURCHASE_SELLER# neq "">
<cfset a_806 = #read_this_sets_billing_values.A_0806_AMOUNT_PURCHASE_SELLER#>
<cfset temp = AddQueryItem(806, read_this_sets_billing_values.A_0806_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_0806_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_0806_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_0807_AMOUNT_PURCHASE_SELLER# neq "">
<cfset a_807 = #read_this_sets_billing_values.A_0807_AMOUNT_PURCHASE_SELLER#>
<cfset temp = AddQueryItem(807, read_this_sets_billing_values.A_0807_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_0807_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_0807_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_0808_AMOUNT_PURCHASE_SELLER# neq "">
<cfset a_808 = #read_this_sets_billing_values.A_0808_AMOUNT_PURCHASE_SELLER#>
<cfset temp = AddQueryItem(808, read_this_sets_billing_values.A_0808_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_0808_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_0808_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_0809_AMOUNT_PURCHASE_SELLER# neq "">
<cfset a_809 = #read_this_sets_billing_values.A_0809_AMOUNT_PURCHASE_SELLER#>
<cfset temp = AddQueryItem(809, read_this_sets_billing_values.A_0809_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_0809_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_0809_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_0810_AMOUNT_PURCHASE_SELLER# neq "">
<cfset a_810 = #read_this_sets_billing_values.A_0810_AMOUNT_PURCHASE_SELLER#>
<cfset temp = AddQueryItem(810, read_this_sets_billing_values.A_0810_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_0810_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_0810_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_0811_AMOUNT_PURCHASE_SELLER# neq "">
<cfset a_811 = #read_this_sets_billing_values.A_0811_AMOUNT_PURCHASE_SELLER#>
<cfset temp = AddQueryItem(811, read_this_sets_billing_values.A_0811_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_0811_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_0811_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_0812_AMOUNT_PURCHASE_SELLER# neq "">
<cfset a_812 = #read_this_sets_billing_values.A_0812_AMOUNT_PURCHASE_SELLER#>
<cfset temp = AddQueryItem(812, read_this_sets_billing_values.A_0812_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_0812_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_0812_PAYTO_PURCHASE_SELLER)>
</cfif>


<cfif #read_this_sets_billing_values.A_1102_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1102_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_1102_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_1102A_AMOUNT_PURCHASE_SELLER# neq "">
<cfif read_this_sets_billing_values.A_1102A_OUTSIDE_PURCHASE_SELLER eq 1>
</cfif>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102A_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1102A_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", read_this_sets_billing_values.A_1102A_OUTSIDE_PURCHASE_SELLER, read_this_sets_billing_values.A_1102A_PAYTO_PURCHASE_SELLER, "X")>
</cfif>

<cfif #read_this_sets_billing_values.A_1102B_AMOUNT_PURCHASE_SELLER# neq "">
<cfif read_this_sets_billing_values.A_1102B_OUTSIDE_PURCHASE_SELLER eq 1>
</cfif>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102B_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1102B_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", read_this_sets_billing_values.A_1102B_OUTSIDE_PURCHASE_SELLER, read_this_sets_billing_values.A_1102B_PAYTO_PURCHASE_SELLER, "X")>
</cfif>

<cfif #read_this_sets_billing_values.A_1102C_AMOUNT_PURCHASE_SELLER# neq "">
<cfif read_this_sets_billing_values.A_1102C_OUTSIDE_PURCHASE_SELLER eq 1>
</cfif>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102C_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1102C_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", read_this_sets_billing_values.A_1102C_OUTSIDE_PURCHASE_SELLER, read_this_sets_billing_values.A_1102C_PAYTO_PURCHASE_SELLER, "X")>
</cfif>

<cfif #read_this_sets_billing_values.A_1102D_AMOUNT_PURCHASE_SELLER# neq "">
<cfif read_this_sets_billing_values.A_1102D_OUTSIDE_PURCHASE_SELLER eq 1>
</cfif>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102D_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1102D_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", read_this_sets_billing_values.A_1102D_OUTSIDE_PURCHASE_SELLER, read_this_sets_billing_values.A_1102D_PAYTO_PURCHASE_SELLER, "X")>
</cfif>

<cfif #read_this_sets_billing_values.A_1102E_AMOUNT_PURCHASE_SELLER# neq "">
<cfif read_this_sets_billing_values.A_1102E_OUTSIDE_PURCHASE_SELLER eq 1>
</cfif>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102E_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1102E_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", read_this_sets_billing_values.A_1102E_OUTSIDE_PURCHASE_SELLER, read_this_sets_billing_values.A_1102E_PAYTO_PURCHASE_SELLER, "X")>
</cfif>

<cfif #read_this_sets_billing_values.A_1102F_AMOUNT_PURCHASE_SELLER# neq "">
<cfif read_this_sets_billing_values.A_1102F_OUTSIDE_PURCHASE_SELLER eq 1>
</cfif>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102F_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1102F_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", read_this_sets_billing_values.A_1102F_OUTSIDE_PURCHASE_SELLER, read_this_sets_billing_values.A_1102F_PAYTO_PURCHASE_SELLER, "X")>
</cfif>

<cfif #read_this_sets_billing_values.A_1102G_AMOUNT_PURCHASE_SELLER# neq "">
<cfif read_this_sets_billing_values.A_1102G_OUTSIDE_PURCHASE_SELLER eq 1>
</cfif>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102G_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1102G_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", read_this_sets_billing_values.A_1102G_OUTSIDE_PURCHASE_SELLER, read_this_sets_billing_values.A_1102G_PAYTO_PURCHASE_SELLER, "X")>
</cfif>

<cfif #read_this_sets_billing_values.A_1102H_AMOUNT_PURCHASE_SELLER# neq "">
<cfif read_this_sets_billing_values.A_1102H_OUTSIDE_PURCHASE_SELLER eq 1>
</cfif>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102H_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1102H_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", read_this_sets_billing_values.A_1102H_OUTSIDE_PURCHASE_SELLER, read_this_sets_billing_values.A_1102H_PAYTO_PURCHASE_SELLER, "X")>
</cfif>

<cfif #read_this_sets_billing_values.A_1102I_AMOUNT_PURCHASE_SELLER# neq "">
<cfif read_this_sets_billing_values.A_1102I_OUTSIDE_PURCHASE_SELLER eq 1>
</cfif>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102I_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1102I_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", read_this_sets_billing_values.A_1102I_OUTSIDE_PURCHASE_SELLER, read_this_sets_billing_values.A_1102I_PAYTO_PURCHASE_SELLER, "X")>
</cfif>


<cfif #read_this_sets_billing_values.A_1109_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(1109, read_this_sets_billing_values.A_1109_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1109_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_1109_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_1110_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(1110, read_this_sets_billing_values.A_1110_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1110_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_1110_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_1111_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(1111, read_this_sets_billing_values.A_1111_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1111_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_1111_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_1112_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(1112, read_this_sets_billing_values.A_1112_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1112_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_1112_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_1113_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(1113, read_this_sets_billing_values.A_1113_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1113_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_1113_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_1302_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(1302, read_this_sets_billing_values.A_1302_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1302_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_1302_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_1303_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(1303, read_this_sets_billing_values.A_1303_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1303_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_1303_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_1304_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(1304, read_this_sets_billing_values.A_1304_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1304_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_1304_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_1305_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(1305, read_this_sets_billing_values.A_1305_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1305_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_1305_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_1306_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(1306, read_this_sets_billing_values.A_1306_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1306_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_1306_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_1307_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(1307, read_this_sets_billing_values.A_1307_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1307_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_1307_PAYTO_PURCHASE_SELLER)>
</cfif>

<cfif #read_this_sets_billing_values.A_1308_AMOUNT_PURCHASE_SELLER# neq "">
<cfset temp = AddQueryItem(1308, read_this_sets_billing_values.A_1308_DESCRIPTION_PURCHASE_SELLER, NumberFormat(read_this_sets_billing_values.A_1308_AMOUNT_PURCHASE_SELLER, '_____.__'), "Seller", 0, read_this_sets_billing_values.A_1308_PAYTO_PURCHASE_SELLER)>
</cfif>

<!--- 2ND Mortgage --->
<cfelseif (#arguments.transaction_type# eq "Second Mortgage")>	
	

<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_01_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_01_2ND_WITH_TI neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_01_2ND_WITH_TI)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_01_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_01_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_01_2ND_WITH_TI, read_itemized.A_1101_ITEM_AMOUNT_01_2ND_WITH_TI, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_02_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_02_2ND_WITH_TI neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_02_2ND_WITH_TI)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_02_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_02_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_02_2ND_WITH_TI, read_itemized.A_1101_ITEM_AMOUNT_02_2ND_WITH_TI, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_03_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_03_2ND_WITH_TI neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_03_2ND_WITH_TI)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_03_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_03_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_03_2ND_WITH_TI, read_itemized.A_1101_ITEM_AMOUNT_03_2ND_WITH_TI, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_04_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_04_2ND_WITH_TI neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_04_2ND_WITH_TI)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_04_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_04_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_04_2ND_WITH_TI, read_itemized.A_1101_ITEM_AMOUNT_04_2ND_WITH_TI, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_05_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_05_2ND_WITH_TI neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_05_2ND_WITH_TI)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_05_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_05_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_05_2ND_WITH_TI, read_itemized.A_1101_ITEM_AMOUNT_05_2ND_WITH_TI, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_06_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_06_2ND_WITH_TI neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_06_2ND_WITH_TI)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_06_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_06_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_06_2ND_WITH_TI, read_itemized.A_1101_ITEM_AMOUNT_06_2ND_WITH_TI, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_07_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_07_2ND_WITH_TI neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_07_2ND_WITH_TI)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_07_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_07_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_07_2ND_WITH_TI, read_itemized.A_1101_ITEM_AMOUNT_07_2ND_WITH_TI, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_08_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_08_2ND_WITH_TI neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_08_2ND_WITH_TI)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_08_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_08_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_08_2ND_WITH_TI, read_itemized.A_1101_ITEM_AMOUNT_08_2ND_WITH_TI, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_09_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_09_2ND_WITH_TI neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_09_2ND_WITH_TI)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_09_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_09_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_09_2ND_WITH_TI, read_itemized.A_1101_ITEM_AMOUNT_09_2ND_WITH_TI, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_10_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_10_2ND_WITH_TI neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_10_2ND_WITH_TI)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_10_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_10_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_10_2ND_WITH_TI, read_itemized.A_1101_ITEM_AMOUNT_10_2ND_WITH_TI, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_11_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_11_2ND_WITH_TI neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_11_2ND_WITH_TI)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_11_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_11_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_11_2ND_WITH_TI, read_itemized.A_1101_ITEM_AMOUNT_11_2ND_WITH_TI, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_12_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_12_2ND_WITH_TI neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_12_2ND_WITH_TI)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_12_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_12_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_12_2ND_WITH_TI, read_itemized.A_1101_ITEM_AMOUNT_12_2ND_WITH_TI, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_13_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_13_2ND_WITH_TI neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_13_2ND_WITH_TI)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_13_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_13_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_13_2ND_WITH_TI, read_itemized.A_1101_ITEM_AMOUNT_13_2ND_WITH_TI, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_14_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_14_2ND_WITH_TI neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_14_2ND_WITH_TI)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_14_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_14_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_14_2ND_WITH_TI, read_itemized.A_1101_ITEM_AMOUNT_14_2ND_WITH_TI, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_15_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_15_2ND_WITH_TI neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_15_2ND_WITH_TI)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_15_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_15_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_15_2ND_WITH_TI, read_itemized.A_1101_ITEM_AMOUNT_15_2ND_WITH_TI, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_16_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_16_2ND_WITH_TI neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_16_2ND_WITH_TI)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_16_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_16_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_16_2ND_WITH_TI, read_itemized.A_1101_ITEM_AMOUNT_16_2ND_WITH_TI, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_17_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_17_2ND_WITH_TI neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_17_2ND_WITH_TI)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_17_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_17_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_17_2ND_WITH_TI, read_itemized.A_1101_ITEM_AMOUNT_17_2ND_WITH_TI, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_18_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_18_2ND_WITH_TI neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_18_2ND_WITH_TI)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_18_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_18_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_18_2ND_WITH_TI, read_itemized.A_1101_ITEM_AMOUNT_18_2ND_WITH_TI, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_19_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_19_2ND_WITH_TI neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_19_2ND_WITH_TI)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_19_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_19_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_19_2ND_WITH_TI, read_itemized.A_1101_ITEM_AMOUNT_19_2ND_WITH_TI, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>
<cfif (Len(read_itemized.A_1101_ITEM_AMOUNT_20_2ND_WITH_TI) and read_itemized.A_1101_ITEM_SELECTABLE_20_2ND_WITH_TI neq 1)>
<cfif IsNumeric(read_itemized.A_1101_ITEM_AMOUNT_20_2ND_WITH_TI)>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_20_2ND_WITH_TI, NumberFormat(read_itemized.A_1101_ITEM_AMOUNT_20_2ND_WITH_TI, '_____.__'), "Buyer", 0, #read_agency.title_ft_agency_name#)>
<cfelse>
<cfset temp = AddQueryItem(0, read_itemized.A_1101_ITEM_DESCRIPTION_20_2ND_WITH_TI, read_itemized.A_1101_ITEM_AMOUNT_20_2ND_WITH_TI, "Buyer", 0, #read_agency.title_ft_agency_name#)>
</cfif>
</cfif>



<cfif #read_this_sets_billing_values.A_0801_AMOUNT_2ND_WITH_TI# neq "">
<cfset a_801 = #read_this_sets_billing_values.A_0801_AMOUNT_2ND_WITH_TI#>
<cfset temp = AddQueryItem(801, read_this_sets_billing_values.A_0801_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_0801_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", 1)>
</cfif>


<cfif #read_this_sets_billing_values.A_0802_AMOUNT_2ND_WITH_TI# neq "">
<cfset a_802 = #read_this_sets_billing_values.A_0802_AMOUNT_2ND_WITH_TI#>
<cfset temp = AddQueryItem(802, read_this_sets_billing_values.A_0802_DESCRIPTION_2ND_WITH_TI, ReplaceNoCase(read_this_sets_billing_values.A_0802_AMOUNT_2ND_WITH_TI, " ", "", "ALL"), "Buyer", 1)>
</cfif>

<cfif #read_this_sets_billing_values.A_0801_AMOUNT_2ND_WITH_TI# neq "" and #read_this_sets_billing_values.A_0802_AMOUNT_2ND_WITH_TI# neq "">
<cfset temp = AddQueryItem(803, "Your adjusted origination charges", NumberFormat((read_this_sets_billing_values.A_0802_AMOUNT_2ND_WITH_TI + read_this_sets_billing_values.A_0801_AMOUNT_2ND_WITH_TI), '_____.__'), "Buyer", 0)>
</cfif>


<cfif #read_this_sets_billing_values.A_0804_AMOUNT_2ND_WITH_TI# neq "">
<cfset a_804 = #read_this_sets_billing_values.A_0804_AMOUNT_2ND_WITH_TI#>
<cfset temp = AddQueryItem(804, read_this_sets_billing_values.A_0804_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_0804_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0804_PAYTO_2ND_WITH_TI)>
</cfif>


<cfif #read_this_sets_billing_values.A_0805_AMOUNT_2ND_WITH_TI# neq "">
<cfset a_805 = #read_this_sets_billing_values.A_0805_AMOUNT_2ND_WITH_TI#>
<cfset temp = AddQueryItem(805, read_this_sets_billing_values.A_0805_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_0805_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0805_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_0806_AMOUNT_2ND_WITH_TI# neq "">
<cfset a_806 = #read_this_sets_billing_values.A_0806_AMOUNT_2ND_WITH_TI#>
<cfset temp = AddQueryItem(806, read_this_sets_billing_values.A_0806_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_0806_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0806_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_0807_AMOUNT_2ND_WITH_TI# neq "">
<cfset a_807 = #read_this_sets_billing_values.A_0807_AMOUNT_2ND_WITH_TI#>
<cfset temp = AddQueryItem(807, read_this_sets_billing_values.A_0807_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_0807_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0807_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_0808_AMOUNT_2ND_WITH_TI# neq "">
<cfset a_808 = #read_this_sets_billing_values.A_0808_AMOUNT_2ND_WITH_TI#>
<cfset temp = AddQueryItem(808, read_this_sets_billing_values.A_0808_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_0808_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0808_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_0809_AMOUNT_2ND_WITH_TI# neq "">
<cfset a_809 = #read_this_sets_billing_values.A_0809_AMOUNT_2ND_WITH_TI#>
<cfset temp = AddQueryItem(809, read_this_sets_billing_values.A_0809_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_0809_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0809_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_0810_AMOUNT_2ND_WITH_TI# neq "">
<cfset a_810 = #read_this_sets_billing_values.A_0810_AMOUNT_2ND_WITH_TI#>
<cfset temp = AddQueryItem(810, read_this_sets_billing_values.A_0810_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_0810_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0810_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_0811_AMOUNT_2ND_WITH_TI# neq "">
<cfset a_811 = #read_this_sets_billing_values.A_0811_AMOUNT_2ND_WITH_TI#>
<cfset temp = AddQueryItem(811, read_this_sets_billing_values.A_0811_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_0811_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0811_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_0812_AMOUNT_2ND_WITH_TI# neq "">
<cfset a_812 = #read_this_sets_billing_values.A_0812_AMOUNT_2ND_WITH_TI#>
<cfset temp = AddQueryItem(812, read_this_sets_billing_values.A_0812_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_0812_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_0812_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_1101_AMOUNT_2ND_WITH_TI# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1101_AMOUNT_2ND_WITH_TI>
</cfif>

<cfif #read_this_sets_billing_values.A_1102_AMOUNT_2ND_WITH_TI# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102_AMOUNT_2ND_WITH_TI>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1102_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", 0, read_this_sets_billing_values.A_1102_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_1102A_AMOUNT_2ND_WITH_TI# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102A_AMOUNT_2ND_WITH_TI>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102A_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1102A_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102A_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1102A_PAYTO_2ND_WITH_TI, "X")>
</cfif>
<cfif #read_this_sets_billing_values.A_1102B_AMOUNT_2ND_WITH_TI# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102B_AMOUNT_2ND_WITH_TI>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102B_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1102B_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102B_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1102B_PAYTO_2ND_WITH_TI, "X")>
</cfif>
<cfif #read_this_sets_billing_values.A_1102C_AMOUNT_2ND_WITH_TI# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102C_AMOUNT_2ND_WITH_TI>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102C_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1102C_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102C_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1102C_PAYTO_2ND_WITH_TI, "X")>
</cfif>
<cfif #read_this_sets_billing_values.A_1102D_AMOUNT_2ND_WITH_TI# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102D_AMOUNT_2ND_WITH_TI>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102D_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1102D_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102D_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1102D_PAYTO_2ND_WITH_TI, "X")>
</cfif>
<cfif #read_this_sets_billing_values.A_1102E_AMOUNT_2ND_WITH_TI# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102E_AMOUNT_2ND_WITH_TI>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102E_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1102E_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102E_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1102E_PAYTO_2ND_WITH_TI, "X")>
</cfif>
<cfif #read_this_sets_billing_values.A_1102F_AMOUNT_2ND_WITH_TI# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102F_AMOUNT_2ND_WITH_TI>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102F_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1102F_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102F_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1102F_PAYTO_2ND_WITH_TI, "X")>
</cfif>
<cfif #read_this_sets_billing_values.A_1102G_AMOUNT_2ND_WITH_TI# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102G_AMOUNT_2ND_WITH_TI>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102G_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1102G_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102G_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1102G_PAYTO_2ND_WITH_TI, "X")>
</cfif>
<cfif #read_this_sets_billing_values.A_1102H_AMOUNT_2ND_WITH_TI# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102H_AMOUNT_2ND_WITH_TI>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102H_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1102H_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102H_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1102H_PAYTO_2ND_WITH_TI, "X")>
</cfif>
<cfif #read_this_sets_billing_values.A_1102I_AMOUNT_2ND_WITH_TI# neq "">
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1102I_AMOUNT_2ND_WITH_TI>
<cfset temp = AddQueryItem(1102, read_this_sets_billing_values.A_1102I_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1102I_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1102I_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1102I_PAYTO_2ND_WITH_TI, "X")>
</cfif>

<cfif #read_this_sets_billing_values.A_1109_AMOUNT_2ND_WITH_TI# neq "">
<cfif read_this_sets_billing_values.A_1109_OUTSIDE_2ND_WITH_TI eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1109_AMOUNT_2ND_WITH_TI>
</cfif>
<cfset temp = AddQueryItem(1109, read_this_sets_billing_values.A_1109_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1109_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1109_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1109_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_1110_AMOUNT_2ND_WITH_TI# neq "">
<cfif read_this_sets_billing_values.A_1110_OUTSIDE_2ND_WITH_TI eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1110_AMOUNT_2ND_WITH_TI>
</cfif>
<cfset temp = AddQueryItem(1110, read_this_sets_billing_values.A_1110_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1110_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1110_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1110_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_1111_AMOUNT_2ND_WITH_TI# neq "">
<cfif read_this_sets_billing_values.A_1111_OUTSIDE_2ND_WITH_TI eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1111_AMOUNT_2ND_WITH_TI>
</cfif>
<cfset temp = AddQueryItem(1111, read_this_sets_billing_values.A_1111_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1111_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1111_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1111_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_1112_AMOUNT_2ND_WITH_TI# neq "">
<cfif read_this_sets_billing_values.A_1112_OUTSIDE_2ND_WITH_TI eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1112_AMOUNT_2ND_WITH_TI>
</cfif>
<cfset temp = AddQueryItem(1112, read_this_sets_billing_values.A_1112_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1112_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1112_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1112_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_1113_AMOUNT_2ND_WITH_TI# neq "">
<cfif read_this_sets_billing_values.A_1113_OUTSIDE_2ND_WITH_TI eq 1>
<cfset roll_up_1101 = roll_up_1101 + read_this_sets_billing_values.A_1113_AMOUNT_2ND_WITH_TI>
</cfif>
<cfset temp = AddQueryItem(1113, read_this_sets_billing_values.A_1113_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1113_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1113_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1113_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_1302_AMOUNT_2ND_WITH_TI# neq "">
<cfif read_this_sets_billing_values.A_1302_OUTSIDE_2ND_WITH_TI eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1302_AMOUNT_2ND_WITH_TI>
</cfif>
<cfset temp = AddQueryItem(1302, read_this_sets_billing_values.A_1302_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1302_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1302_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1302_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_1303_AMOUNT_2ND_WITH_TI# neq "">
<cfif read_this_sets_billing_values.A_1303_OUTSIDE_2ND_WITH_TI eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1303_AMOUNT_2ND_WITH_TI>
</cfif>
<cfset temp = AddQueryItem(1303, read_this_sets_billing_values.A_1303_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1303_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1303_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1303_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_1304_AMOUNT_2ND_WITH_TI# neq "">
<cfif read_this_sets_billing_values.A_1304_OUTSIDE_2ND_WITH_TI eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1304_AMOUNT_2ND_WITH_TI>
</cfif>
<cfset temp = AddQueryItem(1304, read_this_sets_billing_values.A_1304_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1304_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1304_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1304_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_1305_AMOUNT_2ND_WITH_TI# neq "">
<cfif read_this_sets_billing_values.A_1305_OUTSIDE_2ND_WITH_TI eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1305_AMOUNT_2ND_WITH_TI>
</cfif>
<cfset temp = AddQueryItem(1305, read_this_sets_billing_values.A_1305_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1305_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1305_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1305_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_1306_AMOUNT_2ND_WITH_TI# neq "">
<cfif read_this_sets_billing_values.A_1306_OUTSIDE_2ND_WITH_TI eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1306_AMOUNT_2ND_WITH_TI>
</cfif>
<cfset temp = AddQueryItem(1306, read_this_sets_billing_values.A_1306_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1306_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1306_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1306_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_1307_AMOUNT_2ND_WITH_TI# neq "">
<cfif read_this_sets_billing_values.A_1307_OUTSIDE_2ND_WITH_TI eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1307_AMOUNT_2ND_WITH_TI>
</cfif>
<cfset temp = AddQueryItem(1307, read_this_sets_billing_values.A_1307_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1307_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1307_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1307_PAYTO_2ND_WITH_TI)>
</cfif>

<cfif #read_this_sets_billing_values.A_1308_AMOUNT_2ND_WITH_TI# neq "">
<cfif read_this_sets_billing_values.A_1308_OUTSIDE_2ND_WITH_TI eq 1>
<cfset roll_up_1301 = roll_up_1301 + read_this_sets_billing_values.A_1308_AMOUNT_2ND_WITH_TI>
</cfif>
<cfset temp = AddQueryItem(1308, read_this_sets_billing_values.A_1308_DESCRIPTION_2ND_WITH_TI, NumberFormat(read_this_sets_billing_values.A_1308_AMOUNT_2ND_WITH_TI, '_____.__'), "Buyer", read_this_sets_billing_values.A_1308_OUTSIDE_2ND_WITH_TI, read_this_sets_billing_values.A_1308_PAYTO_2ND_WITH_TI)>
</cfif>

</cfif>

<cfif roll_up_1301 neq 0>
<cfset temp = AddQueryItem(1301, "Additional Settlement Charges", NumberFormat(roll_up_1301, '_____.__'), "Buyer", 0, "")>
</cfif>

</cffunction>

<!--- GetCPL_Extra function --->
<cffunction name="GetCPL_Extra">
<cfargument name="loan_amount" type="string" default="0">
<cfargument name="underwriter_choice"  default="0">
<cfargument name="property_state"  default="">
<cfargument name="property_county"  default="">
<cfargument name="transaction_type"  default="">
<cfargument name="company_id"  default="">
<cfargument name="CEMA"  default="">


<cfset surcharge_payee = ''>
<cfif arguments.underwriter_choice eq 16>
<cfset surcharge_payee = ' to Stewart Title'>
<cfelseif arguments.underwriter_choice eq 30>
<cfset surcharge_payee = ' to North American Title'>
</cfif>
	<cfif (arguments.property_state eq 'FL')>
		<cfset new_alta_line1 = Determine1300Line()>	
		<cfset temp = AddQueryItem(new_alta_line1, "Statutory Surcharge#surcharge_payee#", NumberFormat('3.28', '_____.__'), "Buyer", 1)>
		<cfset roll_up_1301 = roll_up_1301 + 3.28>
	</cfif>



	<cfif arguments.property_state eq 'MD'>
     <cfif arguments.property_county eq 'Anne Arundel'>
		<cfset new_alta_line1 = Determine1300Line()>	
        <cfset temp = AddQueryItem(new_alta_line1, "Lien Cert. to #arguments.property_county# County", NumberFormat('50.00', '_____.__'), "Buyer", 1)>
		<cfset roll_up_1301 = roll_up_1301 + 50.00>
      </cfif>
     <cfif arguments.property_county eq 'Baltimore City'>
		<cfset new_alta_line1 = Determine1300Line()>	
        <cfset temp = AddQueryItem(new_alta_line1, "Lien Cert. to Baltimore City", NumberFormat('55.00', '_____.__'), "Buyer", 1)>
		<cfset roll_up_1301 = roll_up_1301 + 55.00>
     </cfif>
     <cfif arguments.property_county eq 'Baltimore'>
		<cfset new_alta_line1 = Determine1300Line()>	
        <cfset temp = AddQueryItem(new_alta_line1, "Lien Cert. to #arguments.property_county# County", NumberFormat('40.00', '_____.__'), "Buyer", 1)>
		<cfset roll_up_1301 = roll_up_1301 + 40.00>
     </cfif>
     <cfif arguments.property_county eq 'Carroll'>
		<cfset new_alta_line1 = Determine1300Line()>	
        <cfset temp = AddQueryItem(new_alta_line1, "Lien Cert. to #arguments.property_county# County", NumberFormat('40.00', '_____.__'), "Buyer", 1)>
		<cfset roll_up_1301 = roll_up_1301 + 40.00>
     </cfif>
     <cfif arguments.property_county eq 'Charles'>
		<cfset new_alta_line1 = Determine1300Line()>	
        <cfset temp = AddQueryItem(new_alta_line1, "Lien Cert. to #arguments.property_county# County", NumberFormat('20.00', '_____.__'), "Buyer", 1)>
		<cfset roll_up_1301 = roll_up_1301 + 20.00>
     </cfif>
     <cfif arguments.property_county eq 'Frederick'>
		<cfset new_alta_line1 = Determine1300Line()>	
        <cfset temp = AddQueryItem(new_alta_line1, "Lien Cert. to #arguments.property_county# County", NumberFormat('20.00', '_____.__'), "Buyer", 1)>
		<cfset roll_up_1301 = roll_up_1301 + 20.00>
     </cfif>
     <cfif arguments.property_county eq 'Harford'>
		<cfset new_alta_line1 = Determine1300Line()>	
        <cfset temp = AddQueryItem(new_alta_line1, "Lien Cert. to #arguments.property_county# County", NumberFormat('50.00', '_____.__'), "Buyer", 1)>
		<cfset roll_up_1301 = roll_up_1301 + 50.00>
     </cfif>
     <cfif arguments.property_county eq 'Howard'>
		<cfset new_alta_line1 = Determine1300Line()>	
        <cfset temp = AddQueryItem(new_alta_line1, "Lien Cert. to #arguments.property_county# County", NumberFormat('35.00', '_____.__'), "Buyer", 1)>
		<cfset roll_up_1301 = roll_up_1301 + 35.00>
     </cfif>
	</cfif>


	<cfif arguments.property_state eq 'GA'>
      <cfset temp = AddQueryItem(0, "Atty. Cert.", NumberFormat(60, '_____.__'), "Buyer", 0, "McDonnell & Associates")>
	  <cfset roll_up_1101 = roll_up_1101 + 60>
	</cfif>

	<cfif arguments.property_state eq 'TX'>
      <cfset temp = AddQueryItem(0, "Courier Fee", NumberFormat(35, '_____.__'), "Buyer", 0, "First Title & Escrow, Inc.")>
	  <cfset roll_up_1101 = roll_up_1101 + 35>
	</cfif>


	<cfif (arguments.company_id eq "7706" or check_company.company contains "MB Financial" or check_company.company contains "Wells Fargo") and arguments.CEMA eq "1" >

		<cfset new_alta_line1 = DetermineAltaLine()>	
		<cfset temp = AddQueryItem(new_alta_line1, "CEMA Attorney Review Prep Fee", NumberFormat(600, '_____.__'), "Buyer", 1)>
		<cfset roll_up_1101 = roll_up_1101 + 600>
	</cfif>
	
	<cfif arguments.property_state eq 'IL'>
      <cfset temp = AddQueryItem(1110, 'IL Certificate Service Fee', NumberFormat(3, '_____.__'), "Buyer", 1)>
	  <cfset roll_up_1101 = roll_up_1101 + 3>
	</cfif>

<cfif (request.which_bulk_rate_used eq 'none' or request.which_bulk_rate_used eq 'Natic' or request.which_bulk_rate_used eq 'Stewart')>
<cfif arguments.property_state eq 'WV'>
<cfset new_alta_line = DetermineAltaLine()>
<cfset temp = AddQueryItem(new_alta_line, "Courier Fee to First Title", NumberFormat(20, '_____.__'), "Buyer", 1)>
</cfif>
<cfif arguments.underwriter_choice eq 16>
<cfset cpl_payto = 'Closing Protection Letter'>
<cfelseif arguments.underwriter_choice eq 16 and arguments.property_state eq 'SC'>
<cfset cpl_payto = 'Lender CPL to Stewart Title Guaranty'>
<cfelseif arguments.underwriter_choice eq 25>
<cfset cpl_payto = 'Closing Protection Letter'>
<cfelseif arguments.underwriter_choice eq 30>
<cfset cpl_payto = 'Closing Protection Letter'>
<cfelse>
<cfset cpl_payto = 'Closing Protection Letter'>
</cfif>
<cfset POC = 1>

<cfset new_alta_line = DetermineAltaLine()>
<cfif check_company.company contains 'Mason-McDuffie'><!--- if this is the mason-mcduffie account, move this to the non-itemized 1101s, and change the POC value to 0 --->
<cfset new_alta_line = 0>
<cfset POC = 0>
</cfif>



	<cfif arguments.property_state eq 'UT'><!--- all underwriters --->
	<cfif arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1>

      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(50, '_____.__'), "Buyer", POC)>
	   <cfset roll_up_1101 = roll_up_1101 + 50>
	  <cfelse>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(25, '_____.__'), "Buyer", POC)>
	   <cfset roll_up_1101 = roll_up_1101 + 25>
	  </cfif>
	</cfif>

	<cfif arguments.property_state eq 'OH'><!--- all underwriters --->
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(40, '_____.__'), "Buyer", POC)>
	   <cfset roll_up_1101 = roll_up_1101 + 40>
	</cfif>

	<cfif arguments.property_state eq 'VA'><!--- all underwriters --->
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(20, '_____.__'), "Buyer", POC)>
	   <cfset roll_up_1101 = roll_up_1101 + 20>
	</cfif>

	<cfif arguments.property_state eq 'PA'><!--- all underwriters --->
      <cfset temp = AddQueryItem(new_alta_line, "Short Form Policy Fee", NumberFormat(100, '_____.__'), "Buyer", POC)>
	   <cfset roll_up_1101 = roll_up_1101 + 100>
	</cfif>


	<cfif arguments.property_state eq 'TX'><!--- all underwriters --->
	<cfif arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1>

      <cfset temp = AddQueryItem(new_alta_line, "TX Guaranty Fee ", NumberFormat(3, '_____.__'), "Buyer", POC)>
      <cfset temp = AddQueryItem(new_alta_line, "TX Guaranty Fee ", NumberFormat(3, '_____.__'), "Buyer", POC)>
	   <cfset roll_up_1101 = roll_up_1101 + 3>
	   <cfset roll_up_1101 = roll_up_1101 + 3>
	  <cfelse>
      <cfset temp = AddQueryItem(new_alta_line, "TX Guaranty Fee ", NumberFormat(3, '_____.__'), "Buyer", POC)>
	   <cfset roll_up_1101 = roll_up_1101 + 3>
	  </cfif>
	</cfif>


	<cfif arguments.property_state eq 'IN' and arguments.underwriter_choice neq 16>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(25, '_____.__'), "Buyer", POC)>
	   <cfset roll_up_1101 = roll_up_1101 + 25>
	</cfif>
	<cfif arguments.underwriter_choice eq 16 or arguments.underwriter_choice eq 30>
	<cfif  arguments.property_state eq 'IL'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(75, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 75>
	</cfif>
    </cfif>

<cfif arguments.underwriter_choice eq 16 or arguments.underwriter_choice eq 0>
	<cfif arguments.property_state eq 'IN'>
	<cfif arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(75, '_____.__'), "Buyer", POC)>
	   <cfset roll_up_1101 = roll_up_1101 + 75>
    <cfelse>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(50, '_____.__'), "Buyer", POC)>
	   <cfset roll_up_1101 = roll_up_1101 + 50>
	</cfif>
	</cfif>
	<cfif arguments.property_state eq 'AL'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(25, '_____.__'), "Buyer", POC)>
	   <cfset roll_up_1101 = roll_up_1101 + 25>
	</cfif>
</cfif>
<cfif arguments.loan_amount neq '' and arguments.loan_amount GT 0 and arguments.underwriter_choice eq 16>
	<cfif arguments.property_state eq 'AR'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(25, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 25>
	</cfif>
	<cfif arguments.property_state eq 'LA'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(25, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 25>
	</cfif>





	<cfif arguments.property_state eq 'MO'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(25, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 25>
	</cfif>
	<cfif arguments.property_state eq 'NJ'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(75, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 75>
	</cfif>
	<cfif arguments.property_state eq 'NC'>
		 <cfif arguments.loan_amount lte 100000>
		 <cfset cpl_amount =  (((arguments.loan_amount) / 1000) * .50)>
		 <cfelseif arguments.loan_amount lte 500000>
		  <cfset cpl_amount =  (((100000) / 1000) * .50)>
		  <cfset cpl_amount =  cpl_amount + (((arguments.loan_amount - 100000) / 1000) * .1)>
		 <cfelseif arguments.loan_amount GT 500000>
		  <cfset cpl_amount =  (((100000) / 1000) * .50)>
		  <cfset cpl_amount =  cpl_amount + (((400000) / 1000) * .1)>
		 </cfif> 
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(cpl_amount, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + cpl_amount>
	</cfif>
	<cfif arguments.property_state eq 'NE'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(25, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 25>
	</cfif>
 <cfif arguments.property_state eq 'PA'>
 <cfset new_alta_line = DetermineAltaLine()>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(125, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 125>
	</cfif>
 <cfif arguments.property_state eq 'RI'>
 <cfset new_alta_line = DetermineAltaLine()>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(25, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 25>
	</cfif>
 	<cfif arguments.property_state eq 'IA'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(25, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 25>
	</cfif>
	<cfif arguments.property_state eq 'DC'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(50, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 50>
	</cfif>
	<cfif arguments.property_state eq 'DE'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(75, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 75>
	</cfif>
	<cfif arguments.property_state eq 'FL'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(0, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 0>
	</cfif>
	<cfif arguments.property_state eq 'GA'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(40, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 40>
	</cfif>
	<cfif arguments.property_state eq 'MS'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(50, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 50>
	</cfif>
	<cfif arguments.property_state eq 'NM'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(0, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 0>
	</cfif>
	<cfif arguments.property_state eq 'SC'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(15, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 15>
	</cfif>
	<cfif arguments.property_state eq 'TN'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(50, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 50>
	</cfif>
 <cfif arguments.property_state eq 'VT'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(0, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 0>
	</cfif>
	<cfif arguments.property_state eq 'WV'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(50, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 50>
	</cfif>
</cfif>
<cfif arguments.loan_amount neq '' and arguments.loan_amount GT 0 and arguments.underwriter_choice eq 25>
	<cfif arguments.property_state eq 'TN'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(50, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 50>
	</cfif>
 <cfif arguments.property_state eq 'PA'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(125, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 125>
	</cfif>  
	<cfif arguments.property_state eq 'LA'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(25, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 25>
	</cfif>
</cfif>
<cfif arguments.loan_amount neq '' and arguments.loan_amount GT 0 and arguments.underwriter_choice eq 30>
	<cfif arguments.property_state eq 'AL'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(25, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 25>
	</cfif>
	  <cfif arguments.property_state eq 'PA'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(125, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 125>
	</cfif> 
	<cfif arguments.property_state eq 'MS'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(35, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 35>
	</cfif>
	<cfif arguments.property_state eq 'NJ'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(75, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 75>
	</cfif>
	<cfif arguments.property_state eq 'DE'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(125, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 125>
	</cfif>
	<cfif arguments.property_state eq 'LA'>
      <cfset temp = AddQueryItem(new_alta_line, cpl_payto, NumberFormat(25, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 25>
	</cfif>
</cfif>


	<cfif arguments.property_state eq 'CT'>
      <cfset temp = AddQueryItem(new_alta_line, 'Short Form policy fee', NumberFormat(100, '_____.__'), "Buyer", POC)>
	  <cfset roll_up_1101 = roll_up_1101 + 100>
	</cfif>
</cfif>



	<cfif arguments.property_state eq 'TX'>
		<cfset new_alta_line1 = DetermineAltaLine()>	
		<cfset temp = AddQueryItem(new_alta_line1, "E-Recording Service to Title & Escrow of Texas", NumberFormat(4.26, '_____.__'), "Buyer", 1)>
		<cfset roll_up_1101 = roll_up_1101 + 4.26>
	</cfif>


</cffunction>

<!--- GetAltas2 function --->
<cffunction name="GetAltas2" >
<cfargument name="opt_alta_4" type="string" default="0">
<cfargument name="opt_alta_4_1" type="string" default="0">
<cfargument name="opt_alta_5" type="string" default="0">
<cfargument name="opt_alta_5_1" type="string" default="0">
<cfargument name="opt_alta_6" type="string" default="0">
<cfargument name="opt_alta_6_1" type="string" default="0">
<cfargument name="opt_alta_6_2" type="string" default="0">
<cfargument name="opt_alta_7" type="string" default="0">
<cfargument name="opt_alta_8_1" type="string" default="0">
<cfargument name="opt_alta_9" type="string" default="0">

<cfargument name="opt_tx_1" type="string" default="0">
<cfargument name="opt_tx_2" type="string" default="1">
<cfargument name="opt_tx_3" type="string" default="0">
<cfargument name="opt_tx_4" type="string" default="0">
<cfargument name="opt_tx_5" type="string" default="1">
<cfargument name="opt_tx_6" type="string" default="0">
<cfargument name="opt_tx_7" type="string" default="0">
<cfargument name="opt_tx_8" type="string" default="0">
<cfargument name="opt_tx_9" type="string" default="0">
<cfargument name="opt_tx_10" type="string" default="0">
<cfargument name="opt_tx_11" type="string" default="0">
<cfargument name="opt_tx_12" type="string" default="0">
<cfargument name="opt_tx_13" type="string" default="0">
<cfargument name="opt_tx_14" type="string" default="0">

<cfargument name="opt_ut_4" type="string" default="0">
<cfargument name="opt_ut_41" type="string" default="0">
<cfargument name="opt_ut_5" type="string" default="0">
<cfargument name="opt_ut_51" type="string" default="0">
<cfargument name="opt_ut_6" type="string" default="0">
<cfargument name="opt_ut_61" type="string" default="0">
<cfargument name="opt_ut_62" type="string" default="0">
<cfargument name="opt_ut_81" type="string" default="0">
<cfargument name="opt_ut_9" type="string" default="0">


<cfargument name="opt_sd_comp" type="string" default="0">
<cfargument name="opt_sd_balloon" type="string" default="0">
<cfargument name="opt_sd_credit" type="string" default="0">
<cfargument name="opt_sd_7" type="string" default="0">
<cfargument name="opt_sd_6" type="string" default="0">
<cfargument name="opt_sd_4" type="string" default="0">
<cfargument name="opt_sd_5" type="string" default="0">
<cfargument name="opt_sd_9" type="string" default="0">
<cfargument name="opt_sd_8" type="string" default="0">
<cfargument name="opt_fl_nav" type="string" default="0">


<cfargument name="property_state" type="string" default="">
<cfargument name="property_county" type="string" default="">
<cfargument name="transaction_type" type="string" default="">
<cfargument name="loan_amount" type="string" default="0">
<cfargument name="company_id" type="string" default="0">

 <!--- 1300 Series ALTA --->
<cfset total_alta = 0>

<cfset trigger_stifel = 0>


<cfif arguments.company_id eq 4177 and arguments.loan_amount NEQ 0 and arguments.loan_amount NEQ 'NULL'>
<cfset trigger_stifel = 1>
</cfif>
<cfif arguments.company_id eq 9036 or arguments.company_id eq 9037 or arguments.company_id eq 9035>
<cfset arguments.opt_tx_13 eq 1> <!--- ARM (T-33.1) --->
<cfset arguments.opt_tx_14 eq 1> <!--- T-43) --->
<cfset arguments.opt_tx_2 eq 1> <!--- EPA (T-36) --->
<cfset arguments.opt_tx_3 eq 1> <!--- NOT YET DUE AND PAYABLE --->
<cfset arguments.opt_tx_5 eq 1> <!--- SURVEY (T-19) --->
</cfif> 


<cfparam name="request.natic_bulk_rates_used" default="0">
<cfparam name="request.stewart_bulk_rates_used" default="0">
<cfparam name="request.chicago_bulk_rates_used" default="0">
<cfparam name="request.chicago2_bulk_rates_used" default="0">



<CFQUERY datasource="#request.dsn#" NAME="altas">
select * from Alta_fees where state = '#arguments.property_state#' and (transaction_type = '#arguments.transaction_type#' or transaction_type = 'All') order by short_id
</CFQUERY>


<cfoutput query="altas">
<cfif altas.formula neq 'NULL' and altas.formula neq ''>
<cfif #Evaluate("arguments.#altas.short_id#")# eq 1 or altas.mandatory eq 'True' >
<cfinclude template="../alta_formulas/#altas.formula#">
</cfif>
<cfelse>



	<cfif #Evaluate("arguments.#altas.short_id#")# eq 1 or altas.mandatory eq 'True' or (altas.short_id eq 'opt_alta_8_1' and  trigger_stifel eq 1) or (altas.short_id eq 'opt_alta_9' and  trigger_stifel eq 1)>
		<cfif altas.bulk_rate_amount neq '' and altas.bulk_rate_amount neq 'NULL' and (request.natic_bulk_rates_used eq 1 or request.stewart_bulk_rates_used eq 1 or request.chicago_bulk_rates_used eq 1 or request.chicago2_bulk_rates_used eq 1)>
        
	<cfif altas.default_to_itemized eq 'True'>
      <cfset temp = AddQueryItem(0, #altas.description#, NumberFormat(altas.bulk_rate_amount, '_____.__'), "Buyer", 1, "")>
	  <cfset total_alta = total_alta + altas.bulk_rate_amount>
      <cfset roll_up_1101 = roll_up_1101 + altas.bulk_rate_amount>
	<cfelse>
	<cfif altas.short_id eq 'opt_tx_4'>
	   <cfset temp = AddQueryItem(1112, #altas.description#, NumberFormat(altas.bulk_rate_amount, '_____.__'), "#altas.paid_by#", 1)>
	<cfelse>
	   <cfset temp = AddQueryItem(DetermineAltaLine(), #altas.description#, NumberFormat(altas.bulk_rate_amount, '_____.__'), "#altas.paid_by#", 1)>
	</cfif>
	   <cfset total_alta = total_alta + altas.bulk_rate_amount>
       <cfset roll_up_1101 = roll_up_1101 + altas.bulk_rate_amount>
	</cfif>
			
			
		<cfelse>
	<cfif altas.default_to_itemized eq 'True'>
      <cfset temp = AddQueryItem(0, #altas.description#, NumberFormat(altas.amount, '_____.__'), "Buyer", 1, "")>
	  <cfset total_alta = total_alta + altas.amount>
      <cfset roll_up_1101 = roll_up_1101 + altas.amount>
	<cfelse>
    
    
	<cfif altas.short_id eq 'opt_tx_4'>
	   <cfset temp = AddQueryItem(1112, #altas.description#, NumberFormat(altas.amount, '_____.__'), "#altas.paid_by#", 1)>
	<cfelse>
	   <cfset temp = AddQueryItem(DetermineAltaLine(), #altas.description#, NumberFormat(altas.amount, '_____.__'), "#altas.paid_by#", 1)>
	</cfif>
    	   <cfset total_alta = total_alta + altas.amount>
       <cfset roll_up_1101 = roll_up_1101 + altas.amount>
	</cfif>
		</cfif>
	</cfif>


</cfif>

</cfoutput>

</cffunction>

<!--- getFees function --->
<cffunction name="getFees" output="true" returntype="query">
<cfargument name="transaction_type" type="string"default="">
<cfargument name="property_state" type="string" default="">
<cfargument name="property_county" type="string" default="">
<cfargument name="property_city" type="string" default="">
<cfargument name="loan_amount" type="string" default="0">
<cfargument name="purchase_price" type="string" default="0">
<cfargument name="previous_loan_amount" default=0>
<cfargument name="property_use_type" type="string" default="">
<cfargument name="company_id" type="string" default="">
<cfargument name="return_data" type="string" default="1">
<cfargument name="previous_loan_month" default=1>
<cfargument name="previous_loan_year" default=1996>
<cfargument name="previous_purch_year" default=1996>
<cfargument name="previous_purch_month" default=1>
<cfargument name="previous_purch_amount" default=0>
<cfargument name="same_lender" type="string" default="0">
<cfargument name="reissue_rates" type="string" default="0">
<cfargument name="jlp_policy" type="string" default="0">
<cfargument name="property_report" type="string" default="0">
<cfargument name="appraised_value" type="string" default="0">
<cfargument name="seller_paid_lender_policy" type="string" default="0">
<cfargument name="seller_paid_owner_policy" type="string" default="0">
<cfargument name="buyer_paid_lender_policy" type="string" default="0">
<cfargument name="buyer_paid_owner_policy" type="string" default="0">
<cfargument name="asset_manager" type="string" default="">
<cfargument name="opt_alta_4" type="string" default="0">
<cfargument name="opt_alta_4_1" type="string" default="0">
<cfargument name="opt_alta_5" type="string" default="0">
<cfargument name="opt_alta_5_1" type="string" default="0">
<cfargument name="opt_alta_6" type="string" default="0">
<cfargument name="opt_alta_6_1" type="string" default="0">
<cfargument name="opt_alta_6_2" type="string" default="0">
<cfargument name="opt_alta_7" type="string" default="0">
<cfargument name="opt_alta_8_1" type="string" default="0">
<cfargument name="opt_alta_9" type="string" default="0">


<cfargument name="opt_tx_1" type="string" default="0">
<cfargument name="opt_tx_2" type="string" default="1">
<cfargument name="opt_tx_3" type="string" default="0">
<cfargument name="opt_tx_4" type="string" default="0">
<cfargument name="opt_tx_5" type="string" default="1">
<cfargument name="opt_tx_6" type="string" default="0">
<cfargument name="opt_tx_7" type="string" default="0">
<cfargument name="opt_tx_8" type="string" default="0">
<cfargument name="opt_tx_9" type="string" default="0">
<cfargument name="opt_tx_10" type="string" default="0">
<cfargument name="opt_tx_11" type="string" default="0">
<cfargument name="opt_tx_12" type="string" default="0">
<cfargument name="opt_tx_13" type="string" default="0">
<cfargument name="opt_tx_14" type="string" default="0">

<cfargument name="opt_ut_4" type="string" default="0">
<cfargument name="opt_ut_41" type="string" default="0">
<cfargument name="opt_ut_5" type="string" default="0">
<cfargument name="opt_ut_51" type="string" default="0">
<cfargument name="opt_ut_6" type="string" default="0">
<cfargument name="opt_ut_61" type="string" default="0">
<cfargument name="opt_ut_62" type="string" default="0">
<cfargument name="opt_ut_81" type="string" default="0">
<cfargument name="opt_ut_9" type="string" default="0">
<cfargument name="opt_fl_nav" type="string" default="0">

<cfargument name="opt_sd_comp" type="string" default="0">
<cfargument name="opt_sd_balloon" type="string" default="0">
<cfargument name="opt_sd_credit" type="string" default="0">
<cfargument name="opt_sd_7" type="string" default="0">
<cfargument name="opt_sd_6" type="string" default="0">
<cfargument name="opt_sd_4" type="string" default="0">
<cfargument name="opt_sd_5" type="string" default="0">
<cfargument name="opt_sd_9" type="string" default="0">
<cfargument name="opt_sd_8" type="string" default="0">

<cfargument name="cema" type="string" default="0">
<cfargument name="enhanced_coverage" type="string" default="0">

<cfargument name="transfer_tax_paid_by" type="string" default="">
<cfargument name="title_id"  default="">
<cfargument name="first_time_buyer"  default="0">
<cfargument name="encompass"  default="0">
<cfargument name="underwriter_choice"  default="0">
<cfargument name="delinquency"  default="0">
<cfargument name="insured"  default="">
<cfargument name="assessed_value"  default="0">
<cfargument name="new_deed" default="0">
<cfargument name="current_deed_num" default="0">
<cfargument name="spouses_removed" default="0">
<cfargument name="non_spouses_removed" default="0">
<cfargument name="spouses_added" default="0">
<cfargument name="non_spouses_added" default="0">


<cfargument name="construction_draws" default="0">
<cfargument name="end_loan_original_loan_amount" default="0">
<cfargument name="closing_type" default="0">
<cfargument name="borrower_owns" default="0">
<cfargument name="PREVIOUS_PURCHASE_MORTGAGE" default="0">


<cfargument name="p_email" default="">
<cfargument name="o_email" default="">
<cfargument name="prop_type" default="">
<cfargument name="property_address" default="">


<cfset treat_as_purchase = 0>
<cfset treat_as_refi = 0>



<!--- 
1x close Purchase

Encompass:
Construction-Perm is checked
Refinance is not checked

In the Calc would be:
Construction selected
1X Close selected
"Does buyer own the property" = No

this calc will run, picking up fees as if it's a Purchase (except for the 1100's, which will pick up from Construction 1x Close in the fee set ups).
 Owner's policy, simul fee and loan rates



1x close Refinance

 Encompass:
 Construction-Perm is checked
 Refinance is checked

In the Calc would be:
 Construction selected
 1X Close selected
 "Does buyer own the property" = Yes

this calc will run, picking up fees as if it's a refi (except for the 1100's, which will pick up from Construction 1x Close in the fee set ups).
 loan rates apply for lender's insurance

2x close Purchase

 Encompass:
Construction is checked
 Refinance is not checked

In the Calc would be:
Construction selected
 2X Close selected
 "Does buyer own the property" = No

this calc will run, picking up fees as if it's a purchase (except for the 1100's, which will pick up from Construction 2x Close in the fee set ups).
 Owner's policy, simul fee and loan rates


2x close Refinance

 Encompass:
Construction is checked
 Refinance is checked

In the Calc would be:
Construction selected
 2X Close selected
 "Does buyer own the property" = Yes

this calc will run, picking up fees as if it's a refi (except for the non-itemized 1100's, which will pick up from Construction 2x Close in the fee set ups).
 loan rates apply for lender's insurance


End Loan (used to be Perm Loan)
 Encompass:
No Cash-Out Refi is checked
 "Is this a New Construction Loan" contains a value

 

In the Calc would be:
Construction selected
 End Loan selected
 "Does buyer own the property" = Yes

 

this calc will run, picking up fees as if it's a refi (except for the non-itemized 1100's, which will pick up from Construction 2x Close in the fee set ups).
 refi rates apply for lender's insurance

 
 --->


<cfif arguments.transaction_type eq 'Construction' and arguments.closing_type eq 1 and arguments.borrower_owns eq 0>
<cfset treat_as_purchase = 1>
<cfelseif arguments.transaction_type eq 'Construction' and arguments.closing_type eq 1 and arguments.borrower_owns eq 1>
<cfset treat_as_refi = 1>
<cfelseif arguments.transaction_type eq 'Construction' and arguments.closing_type eq 2 and arguments.borrower_owns eq 0>
<cfset treat_as_purchase = 1>
<cfelseif arguments.transaction_type eq 'Construction' and arguments.closing_type eq 2 and arguments.borrower_owns eq 1>
<cfset treat_as_refi = 1>
<cfelseif arguments.transaction_type eq 'Construction' and arguments.closing_type eq 3>
<cfset arguments.borrower_owns = 1>
<cfset treat_as_refi = 1>
</cfif>

<cfif arguments.transaction_type eq 'Purchase'>
<cfset treat_as_purchase = 1>
<cfelseif arguments.transaction_type eq 'Refinance' or  arguments.transaction_type eq 'Reverse Mortgage'>
<cfset treat_as_refi = 1>
</cfif>

<cfset arguments.purchase_price = ReplaceNoCase(arguments.purchase_price, ",", "", "ALL")>


<cfset is_natic = 0>


<!--- if this is CA and one of the counties NATIC servers, switch underwriter to NATIC --->
<cfset temp = checkNatic(arguments.property_state, arguments.property_county)>
<cfif temp eq 30>
<cfset arguments.underwriter_choice = 30>
</cfif>

<!--- if this is 
7134	North American Title-Commercial
7491	NORTH AMERICAN TITLE-RESIDENTIAL
7625	NTS - Chevron FCU
8090	North American Title-Residential
8408	North American-Residential-Mark Bauwin
switch underwriter to NATIC --->
<CFQUERY datasource="#request.dsn#" NAME="check_natic_available" maxrows="1">
	SELECT * FROM title_companies_states WHERE st_abbrev = '#arguments.property_state#' and title_co_id = 30
</CFQUERY>

<cfif (arguments.company_id eq 7134 or arguments.company_id eq 7491 or arguments.company_id eq 7625 or arguments.company_id eq 8090 or arguments.company_id eq 8408) and check_natic_available.recordcount eq 1>
<cfset arguments.underwriter_choice = 30>
</cfif>


<cfif Trim(previous_loan_amount) eq ''>
<cfset previous_loan_amount = 0>
</cfif>


<cfif arguments.property_state eq 'AK'>
<cfset arguments.enhanced_coverage = 1>
</cfif>

<cfif arguments.underwriter_choice eq '25' and (arguments.property_state eq 'MD' or arguments.property_state eq 'DC')>
<cfset arguments.reissue_rates = 0>
</cfif>



<!--- if this is a refi, Eagle Bank, in MD, DC, or VA they get special rates under First AM - so switch em to First Am --->
<CFQUERY datasource="#request.dsn#" NAME="check_company" maxrows="1">
SELECT company FROM companies where ID =  #arguments.company_id#
</CFQUERY>
<cfif (Mid(check_company.company, 1,10) eq 'Eagle Bank' or Mid(check_company.company, 1,9) eq 'EagleBank') and (arguments.transaction_type neq 'Purchase' and treat_as_refi eq 1) and (arguments.property_state eq 'MD' or arguments.property_state eq 'VA' or arguments.property_state eq 'DC')>
<cfset arguments.underwriter_choice = 25>
</cfif>

<cfset total_1101 = 0>
<cfset roll_up_1101 = 0>
<cfset roll_up_1104 = 0>
<cfset roll_up_1201 = 0>
<cfset roll_up_1203 = 0>
<cfset roll_up_1301 = 0>
<cfset bulk_rate = 0>
<cfset current_ins_premium = "">
<cfif arguments.previous_loan_month eq 'NULL' or arguments.previous_loan_month eq '' or arguments.previous_loan_month eq '0'>
<cfset arguments.previous_loan_month = 1>
</cfif>
<cfif arguments.previous_loan_year eq 'NULL' or arguments.previous_loan_year eq '' or arguments.previous_loan_year eq '0'>
<cfset arguments.previous_loan_year = 2006>
</cfif>
<cfif arguments.purchase_price eq "">
<cfset arguments.purchase_price = 0>
</cfif>
<cfset arguments.property_county = ReplaceNoCase(arguments.property_county, "'", "", "ALL")>
<cfif arguments.transaction_type eq "ConstructionOnly">
<cfset arguments.transaction_type = "Purchase">
</cfif>	
<CFSET item_count = 1>
<CFSET ReturnXml = XmlNew()>
<CFSET ReturnXml.XmlRoot = XmlElemNew(ReturnXml, "RESPONSE")>
<cfset ReturnXml.RESPONSE.xmlAttributes.Type = "FeeInquiry">
<cfset ReturnXml.RESPONSE.DATA = XmlElemNew(ReturnXml, "DATA")>
<cfset ReturnXml.RESPONSE.DATA.MAIN = XmlElemNew(ReturnXml, "MAIN")>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN = XmlElemNew(ReturnXml, "LOAN")>
<cfset ReturnXml.RESPONSE.DATA.MAIN.LOAN._APPLICATION = XmlElemNew(ReturnXml, "_APPLICATION")>
<cfif isDefined("session.comp_id") AND Len(session.comp_id)>
<CFQUERY datasource="#request.dsn#" NAME="insert_hit">
Insert into Fee_Generator_Hits (date_of_use, comp_id, state, transaction_type, processor_email, officer_email, encompass_pull)
values (#createodbcdatetime(now())#, #session.comp_id#, '#arguments.property_state#', '#arguments.transaction_type#', '#arguments.p_email#', '#arguments.o_email#', '#arguments.encompass#')
</CFQUERY>
<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="insert_hit">
Insert into Fee_Generator_Hits (date_of_use, comp_id, state, transaction_type, processor_email, officer_email, encompass_pull)
values (#createodbcdatetime(now())#, #arguments.company_id#, '#arguments.property_state#', '#arguments.transaction_type#', '#arguments.p_email#', '#arguments.o_email#', '#arguments.encompass#')
</CFQUERY>
</cfif>
<CFQUERY datasource="#request.dsn#" NAME="get_all_comp_info">
SELECT * FROM Companies where ID = #trim(arguments.company_id)#
</CFQUERY>
<cfset fees_query = QueryNew("Line_Number, Description, Amount, Payer, Outside, Payto, Extra1102")>	

<cfif get_all_comp_info.alta_8_1 eq 1>
<cfset arguments.opt_alta_8_1 = 1>
</cfif>
<cfif get_all_comp_info.alta_9 eq 1>
<cfset arguments.opt_alta_9 = 1>
</cfif>


<cfparam name="arguments.add_or_remove_num" default="0">
<cfparam name="arguments.add_or_remove" default="0">
<cfinclude template="../ernst.cfm">

<!---
<cfinclude template="../ernst.cfm">

<cfset temp = #GetRecFees(arguments.transaction_type,arguments.property_state,arguments.property_county,arguments.property_city,arguments.loan_amount,arguments.purchase_price,arguments.previous_loan_amount,arguments.property_use_type,arguments.company_id,arguments.return_data,arguments.previous_loan_month,arguments.previous_loan_year,arguments.previous_purch_year,arguments.previous_purch_month,arguments.previous_purch_amount,arguments.enhanced_coverage,arguments.same_lender,arguments.reissue_rates,arguments.jlp_policy,arguments.property_report,arguments.appraised_value,arguments.seller_paid_lender_policy,arguments.seller_paid_owner_policy,arguments.buyer_paid_lender_policy,arguments.buyer_paid_owner_policy,arguments.asset_manager,arguments.cema,arguments.transfer_tax_paid_by,arguments.title_id,arguments.first_time_buyer,arguments.encompass,arguments.underwriter_choice,arguments.delinquency,arguments.insured,arguments.assessed_value,arguments.new_deed,arguments.current_deed_num,arguments.add_or_remove,arguments.add_or_remove_num,arguments.previous_purchase_mortgage)#>
--->





<cfset pre_enhanced_amount = 0>
<cfset buyers_portion_owner_policy = 0>


<cfif arguments.property_report eq 0>
 
<cfif arguments.property_state eq 'UT'>
<cfset title_co_name = "Cottonwood Title Insurance Agency, Inc.">
<cfelseif arguments.property_state eq 'IA'>
<cfset title_co_name = "Gomez May LLP">
<cfelseif arguments.property_state eq 'NV'>
<cfset title_co_name = "Placer Title Company">
<cfelseif arguments.property_state eq 'AR'>
<cfset title_co_name = "Capstone Pioneer Settlement Services">
<cfelseif arguments.property_state eq 'CA'>
<cfset title_co_name = "North American Title Company">
<cfelseif arguments.company_id eq 2632>
<cfset title_co_name = "Axiom Title">
<cfelseif  arguments.company_id eq 3722 or arguments.company_id eq 4752>
<cfset title_co_name = "Community Real Estate Services, LLC">
<cfelse>
<cfset title_co_name = "First Title & Escrow, Inc.">
</cfif>

<!--- 1109 TITLE INSURANCE --->
<!--- is this an ROA Hutton file, even though it's a refi, needs to record Title Insurance as if it's a purchase, so we'll temporarily make this a purchase, figure out TI, then change it back to a refi --->
<cfif arguments.company_id eq 3276 or arguments.company_id eq 3943 or arguments.company_id eq 4043 or arguments.company_id eq 4042 or arguments.company_id eq 3722 or arguments.company_id eq 4752 or arguments.company_id eq 4702>
<cfset arguments.transaction_type = "Purchase">
</cfif>
<cfset a_ins_premium = "">

<!--- now let's check if this is a Junior Loan Policy, and if so, calculate the insurance --->

<cfif arguments.transaction_type contains 'Second Mortgage'>

<cfset temp = getSecondMortgages(arguments.property_state, arguments.property_county, arguments.property_city, arguments.underwriter_choice, arguments.title_id, arguments.transaction_type, arguments.enhanced_coverage, arguments.company_id, arguments.loan_amount, arguments.jlp_policy)>

<cfelse>


<cfset expedite_states = "AL,AR,DE,DC,GA,IL,IN,IA,KY,LA,ME,MD,MA,MN,MI,MO,NH,NC,ND,OK,SC,VT,VA,WI,WV">


<!--- getUnderwriter function goes here --->
<cfset temp = getUnderwriter(arguments.property_state, arguments.property_county, arguments.property_city, arguments.underwriter_choice, arguments.title_id, arguments.transaction_type, arguments.enhanced_coverage, arguments.company_id, arguments.loan_amount)>


<cfset out_of_range = 0>


<cfif NOT IsNumeric(arguments.loan_amount) or arguments.loan_amount eq '' or arguments.loan_amount eq 'NULL'>
  <CFSET   arguments.loan_amount = 0>
</cfif>
  
  
<cfif arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1>
<cfif arguments.loan_amount GT arguments.purchase_price>
<CFSET   x_final  = #Ceiling(arguments.loan_amount)#>
<cfelse>
<CFSET   x_final  = #Ceiling(arguments.purchase_price)#>
</cfif>
<cfelse>
<CFSET   x_final  = #Ceiling(arguments.loan_amount)#>
</cfif>			




<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
SELECT * FROM #get_table.table_to_use# WHERE a_to>= #x_final# order by a_to
</CFQUERY>


<cfif arguments.property_state eq 'TX'>
<cfif arguments.loan_amount eq 0>
  <cfif x_final LTe 100000>
  <cfset read_ins_calc.sale = read_ins_calc.sale>
  <cfelseif x_final LTe 1000000>
  <cfset leftover = x_final - 100000>
  <cfset premium = Round(leftover * .00554)>
  <cfset read_ins_calc.sale = premium + 875>
  <cfelseif x_final LTe 5000000>
  <cfset leftover = x_final - 1000000>
  <cfset premium = Round(leftover * .00456)>
  <cfset read_ins_calc.sale = premium + 5861>
  <cfelseif x_final LTe 15000000>
  <cfset leftover = arguments.loan_amount - 5000000>
  <cfset premium = Round(leftover * .00376)>
  <cfset read_ins_calc.sale = premium + 24101>
  </cfif>
<cfset a_ins_premium = read_ins_calc.sale>



<cfelseif x_final LTe 100000>

<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
SELECT * FROM StateTexasStewart WHERE a_to >= #x_final# order by a_to
</CFQUERY>
<cfelseif x_final LTe 1000000>
  <cfset leftover = x_final - 100000>
  <cfset premium = Round(leftover * .00554)>
  <cfset read_ins_calc.sale = premium + 875>
<cfelseif x_final LTe 5000000>
  <cfset leftover = x_final - 1000000>
  <cfset premium = Round(leftover * .00456)>
  <cfset read_ins_calc.sale = premium + 5861>
<cfelseif x_final LTe 15000000>
  <cfset leftover = x_final - 5000000>
  <cfset premium = Round(leftover * .00376)>
  <cfset read_ins_calc.sale = premium + 24101>
</cfif>
  <cfset a_ins_premium = read_ins_calc.sale>
</cfif>


<cfset request.new_owners_premium = read_ins_calc.sale>

<cfif read_ins_calc.recordcount eq 0>
<cfset out_of_range = 1>
</cfif>


<cfif ((arguments.transaction_type eq "Refinance" or treat_as_refi eq 1) or arguments.transaction_type eq "Reverse Mortgage")>
<CFIF (arguments.company_id eq 1847 or arguments.company_id eq 1864) and ListFindNoCase(expedite_states, pstate, ",")>
<CFSET a_ins_premium = #read_ins_calc.expedite#>
<cfelse>
<cfif arguments.property_state eq 'MI'>
<cfif IsNumeric(read_ins_calc.sale) and read_ins_calc.sale NEQ 'Call for Quote!'>
<CFSET a_ins_premium = (read_ins_calc.refinance)>
<cfelse>
<CFSET a_ins_premium = "Call for Quote!">
</cfif>
<cfelse>



<cfif arguments.underwriter_choice eq '25' and arguments.property_state eq 'MD' and arguments.enhanced_coverage eq 1>
<CFSET a_ins_premium = #read_ins_calc.enhanced_lenders#>
<cfelseif arguments.underwriter_choice eq '25' and arguments.property_state eq 'MD' and arguments.enhanced_coverage neq 1>
<CFSET a_ins_premium = #read_ins_calc.Refinance# * .6> 

			<cfif a_ins_premium LT 150>
			<CFSET a_ins_premium = 150>
			</cfif>

<cfelseif arguments.property_state eq 'KS'><!--- any underwriter --->
<CFSET a_ins_premium = #read_ins_calc.Refinance# * .7>
<cfelseif arguments.property_state eq 'OH'><!--- any underwriter --->
<CFSET a_ins_premium = #read_ins_calc.Refinance# * .7>
<cfelseif arguments.property_state eq 'CT'><!--- any underwriter --->
<CFSET a_ins_premium = #read_ins_calc.Refinance# * .6>
<cfelseif arguments.underwriter_choice eq '25' and arguments.property_state eq 'DC'>
<CFSET a_ins_premium = #read_ins_calc.Refinance# * .6>
<cfelseif arguments.underwriter_choice eq '25' and arguments.property_state eq 'CO'>
			<cfif arguments.loan_amount lte 250000>
			<cfset a_ins_premium = 350>
			<cfelseif arguments.loan_amount lte 500000>
			<cfset a_ins_premium =  350 + 400>
			<cfelseif arguments.loan_amount lte 750000>
			<cfset a_ins_premium =  350 + 400 + 450>
			<cfelseif arguments.loan_amount lte 1000000>
			<cfset a_ins_premium =  350 + 400 + 450 + 500>
			</cfif>
			<cfif arguments.loan_amount gt 5000000>
			<cfset a_ins_premium =  "Call for Quote!">
			<cfelseif arguments.loan_amount gt 3000000>
			<cfset a_ins_premium =  a_ins_premium + ((arguments.loan_amount-3000000) / 1000 * 1.55)>
			<cfset a_ins_premium =  a_ins_premium + ((2000000) / 1000 * 1.65)>
			<cfelseif arguments.loan_amount gt 1000000>
			<cfset a_ins_premium =  350 + 400 + 450 + 500>
			<cfset a_ins_premium =  a_ins_premium + ((arguments.loan_amount-1000000) / 1000 * 1.65)>
			</cfif>



<cfelseif arguments.underwriter_choice eq '16' and arguments.property_state eq 'WI'>
			<cfif arguments.loan_amount lte 500000>
				<cfset a_ins_premium = 475>
				<cfelseif arguments.loan_amount gte 500000>
				<cfset a_ins_premium =  475 + ((arguments.loan_amount-500000) / 1000 * 1)>			
			</cfif>			
			



<cfelseif arguments.underwriter_choice eq '25'  and arguments.property_state eq 'MA'>

<CFSET a_ins_premium = #read_ins_calc.Refinance# * .6>

<cfelseif arguments.underwriter_choice eq '16'  and arguments.property_state eq 'MA'>
	<cfset NumYears = 0>
	<cftry>
	<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
	<cfcatch>
	<cfset NumYears = 10>
	</cfcatch>
	</cftry>
	<cfif NumYears LTE 7>
	<CFSET a_ins_premium = #read_ins_calc.Refinance# * .6>
	<cfelse>
	<CFSET a_ins_premium = #read_ins_calc.Refinance#>
	</cfif>
<cfelseif arguments.underwriter_choice eq '16'  and arguments.property_state eq 'RI'>
<cftry>
<CFSET a_ins_premium = #read_ins_calc.Refinance# * .6>
<cfcatch type="any">
<CFSET a_ins_premium = 'Call for Quote!'>
</cfcatch>
</cftry>

<cfelseif arguments.property_state eq 'VA' and (arguments.underwriter_choice eq '25'  or arguments.underwriter_choice eq '16')>

<cftry>
<CFSET a_ins_premium = #read_ins_calc.Refinance# * .7>

<cfcatch type="any">
<CFSET a_ins_premium = 'Call for Quote!'>
</cfcatch>
</cftry>


<cfelseif arguments.property_state eq 'VA' and (arguments.underwriter_choice eq '30')>
<cftry>
			<cfif arguments.loan_amount lte 250000>
			<cfset a_ins_premium = arguments.loan_amount * .00167>
			<cfelseif arguments.loan_amount lte 500000>
			<cfset a_ins_premium = (250000 * .00167) + ((arguments.loan_amount - 250000) * .00133)>
			<cfelseif arguments.loan_amount lte 1000000>
			<cfset a_ins_premium = (250000 * .00167) + (250000 * .00133) + ((arguments.loan_amount - 500000) * .00116)>
			<cfelseif arguments.loan_amount lte 5000000>
			<cfset a_ins_premium = (250000 * .00167) + (250000 * .00133) + (500000 * .00116) + ((arguments.loan_amount - 1000000) * .00101)>
			<cfelseif arguments.loan_amount gt 5000000>
			<cfset a_ins_premium =  "Call for Quote!">
			</cfif>
			<cfif a_ins_premium lt 200>
			<cfset a_ins_premium = 200>
			</cfif>

<cfcatch type="any">
<CFSET a_ins_premium = 'Call for Quote!'>
</cfcatch>
</cftry>


<cfelseif arguments.property_state eq 'AL' and (arguments.underwriter_choice eq '16') and arguments.transaction_type eq 'Reverse Mortgage'>

<!---
Up to $100,000 of liability written ................................................. $3.50 
Over $100,000 and up to $500,000, add ....................................... $3.00 
Over $500,000 and up to $10,000,000, add ................................... $2.00 
Over $10,000,000 and up to $15,000,000, add .............................. $1.50 
Over $15,000,000, add ............................................................... $1.00 
Minimum charge ........................................ ...............................$125.00 
--->

			<cfif arguments.loan_amount lte 100000>
			<cfset a_ins_premium = arguments.loan_amount * .0035>
			<cfelseif arguments.loan_amount lte 500000>
			<cfset a_ins_premium = (100000 * .0035) + ((arguments.loan_amount - 100000) * .003)>
			<cfelseif arguments.loan_amount lte 10000000>
			<cfset a_ins_premium = (100000 * .0035) + (400000 * .003) + ((arguments.loan_amount - 500000) * .002)>
			<cfelseif arguments.loan_amount gt 10000000>
			<cfset a_ins_premium =  "Call for Quote!">
			</cfif>
			<cfif a_ins_premium lt 125>
			<cfset a_ins_premium = 125>
			</cfif>




<cfelseif arguments.property_state eq 'AL' and (arguments.underwriter_choice eq '30')>

<cftry>
<CFSET a_ins_premium = #read_ins_calc.Refinance# * .6>
<cfcatch type="any">
<CFSET a_ins_premium = 'Call for Quote!'>
</cfcatch>
</cftry>


<cfelseif arguments.property_state eq 'OR' and arguments.opt_alta_9 eq 1>
<CFSET a_ins_premium = #read_ins_calc.enhanced_lenders#>

<cfelse>
<CFSET a_ins_premium = #read_ins_calc.Refinance#>
</cfif>


</cfif>
</CFIF>

<cfelseif arguments.transaction_type eq "Purchase" or treat_as_purchase eq 1>
<cfif a_ins_premium neq 'Call for Quote!'>
<CFSET a_ins_premium = #read_ins_calc.sale#>
</cfif>

<cfelseif arguments.transaction_type contains "Second Mortgage">
<CFSET a_ins_premium = #read_ins_calc.second_mortgage#>
</cfif>			


<cfif arguments.property_state eq 'NV' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1) and  arguments.underwriter_choice eq '25'>
<CFSET a_ins_premium = read_ins_calc.sale>
<cfset NumYears = 0>
<cftry>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
<cfcatch>
<cfset NumYears = 0>
</cfcatch>
</cftry>

<cfif NumYears  LTE 3>
<CFSET a_ins_premium = read_ins_calc.short_term>
</cfif>
</cfif>

<cfif arguments.property_state eq 'PA' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1)>

<CFSET a_ins_premium = (#read_ins_calc.refinance#)>

</cfif>

<cfif arguments.property_state eq 'AZ' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1) and arguments.underwriter_choice eq 16>
<CFSET a_ins_premium = (#read_ins_calc.refinance# * .65)>
  <cfif a_ins_premium LT 323>
  <CFSET a_ins_premium = 323>
  </cfif>
</cfif>



<cfif arguments.property_state eq 'MD' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1) and arguments.underwriter_choice eq '16'>

<CFSET a_ins_premium = (#read_ins_calc.refinance# * .60)>

</cfif>


<cfif arguments.property_state eq 'NJ' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1)>
<cfif arguments.loan_amount LTE 100000>
<cfset a_ins_premium = arguments.loan_amount * .00275>
<cfelseif arguments.loan_amount LTE 500000>
<cfset a_ins_premium = 275 + ((arguments.loan_amount - 100000) * .0025)>
<cfelseif arguments.loan_amount LTE 2000000>
<cfset a_ins_premium = 275 + 1000 + ((arguments.loan_amount - 500000) * .00225)>
<cfelse>
<cfset a_ins_premium = 275 + 1000 + 3375 + ((arguments.loan_amount - 2000000) * .0015)>
</cfif>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="check_streamline">
SELECT * FROM companies where (id = #arguments.company_id#)
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="is_shapiro">
SELECT * FROM companies where (id = 2368 or master_co_id = 2368) and (id <> 3568)
</CFQUERY>
<cfset all_shapiro = ValueList(is_shapiro.ID, ",")>

<!--- Florida Refi but only for company ID 3910 --->
<cfif arguments.property_state eq 'FL' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1) and arguments.company_id eq 3910>
<cfset a_ins_premium = read_ins_calc.sale - 35>
<!--- the -35 part is because we have 35 dollars added to the "sale" transaction rate in the florida table --->
</cfif>



<cfset NumYears = 0>
<cftry>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_purch_year, arguments.previous_year_month, 1), Now())>
<cfcatch>
<cfset NumYears = 0>
</cfcatch>
</cftry>



<cfif arguments.property_state eq 'DC' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1)>
  <cfset discount_amt = 0>  
 <cfif arguments.loan_amount lte 50000> 
 <cfset a_ins_premium =  (((arguments.loan_amount) / 1000) * 2.70)>
 <cfelseif arguments.loan_amount lte 100000>
  <cfset a_ins_premium =  (((50000) / 1000) * 2.70)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 50000) / 1000) * 2.34)>
 <cfelseif arguments.loan_amount lte 500000>
  <cfset a_ins_premium =  (((50000) / 1000) * 2.70)>
   <cfset a_ins_premium =  a_ins_premium + (((50000) / 1000) * 2.34)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 100000) / 1000) * 1.98)>
 <cfelseif arguments.loan_amount lte 10000000>
  <cfset a_ins_premium =  (((50000) / 1000) * 2.70)>
   <cfset a_ins_premium =  a_ins_premium + (((50000) / 1000) * 2.34)>
 <cfset a_ins_premium =  a_ins_premium + (((400000) / 1000) * 1.98)>
 <cfset a_ins_premium =  a_ins_premium + (((arguments.loan_amount - 500000) / 1000) * 1.62)>
 </cfif> 
 <cfset a_ins_premium = NumberFormat(a_ins_premium, "____.__")>
</cfif>



<!--- WFG Refi --->
<cfif arguments.property_state eq 'VA' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1) and  arguments.underwriter_choice eq '33'>
	  <CFSET a_ins_premium = (#read_ins_calc.refinance# * .70)>
      <cfif a_ins_premium LT 200>
      <cfset a_ins_premium = 200>
      </cfif>
      <cfif arguments.enhanced_coverage eq 1>
      <cfif a_ins_premium LT 240>
      <cfset a_ins_premium = 240>
      </cfif>


</cfif>
</cfif>
<!--- WFG Refi --->




<cfset temp = getTexasRefis2nds(arguments.property_state, arguments.transaction_type,  arguments.previous_loan_amount, arguments.loan_amount, arguments.previous_loan_year, arguments.previous_loan_month)>



<!--- IN NATIC refi's and 2nds 1109--->
<CFIF arguments.property_state eq "IN" and ((arguments.transaction_type eq "Refinance" or treat_as_refi eq 1) or arguments.transaction_type contains "Second Mortgage" or arguments.transaction_type contains "Reverse Mortgage") and  arguments.underwriter_choice eq '30'>
<CFQUERY datasource="#request.dsn#" NAME="read_prev_ins_calc" maxrows="1">
SELECT * FROM #get_table.table_to_use# WHERE a_to >= #arguments.loan_amount# order by a_to
</CFQUERY>
<cfset NumYears = 0>
<cftry>
<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
<cfcatch>
<cfset NumYears = 0>
</cfcatch>
</cftry>

<cfif NumYears LTE 3>
<CFSET a_ins_premium = #read_ins_calc.refinance#  * .7>
<cfelseif NumYears LTE 5>
<CFSET a_ins_premium = #read_ins_calc.refinance#  * .6>
<cfelseif NumYears LTE 10>
<CFSET a_ins_premium = #read_ins_calc.refinance#  * .5>
<cfelse>
<CFSET a_ins_premium = #read_ins_calc.refinance#>
</cfif>

<cfif a_ins_premium LT 150>
<cfset a_ins_premium = 150>
</cfif>

</cfif>


<cfset request.got_reissue_rate = 0>
<!--- MI no longer has reissue or subrates, so dont trigger these in MI, all other states should trigger --->
<cfif arguments.property_state neq 'MI'>

	<cfif arguments.underwriter_choice neq 25 or (arguments.underwriter_choice eq 25 and arguments.property_state neq 'DC' and arguments.property_state neq 'MD' and arguments.property_state neq 'MI' and arguments.property_state neq 'VA' and arguments.property_state neq 'CO')><!--- first american has no reissue in DC, so run this only if it's not DC --->

<cfset a_ins_premium = #GetReissuerates(a_ins_premium, arguments.previous_loan_year, arguments.previous_loan_month,  arguments.previous_purch_year, arguments.previous_purch_month, arguments.previous_purch_amount, arguments.transaction_type, arguments.property_state, arguments.property_county, arguments.previous_loan_amount, arguments.loan_amount, arguments.company_id,  arguments.reissue_rates,  arguments.underwriter_choice)#>

	 </cfif>
     
     

	<cfif arguments.underwriter_choice neq 25><!--- first american has no sub-rates, so run 
	                                           this only if it's not first american --->
	
	

<cfset temp = GetSubrates(a_ins_premium, arguments.previous_loan_year, arguments.previous_loan_month,  arguments.previous_purch_year, arguments.previous_purch_month, arguments.previous_purch_amount, arguments.transaction_type, arguments.same_lender, arguments.property_state, arguments.previous_loan_amount, arguments.loan_amount, arguments.underwriter_choice)>
	
	</cfif>
	
</cfif>


<cfset temp = #GetBundledRates(arguments.company_id,arguments.loan_amount,arguments.previous_loan_amount,arguments.transaction_type,arguments.property_state)#>

<!--- NY Refinance --->
<cfif arguments.property_state eq 'NY' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1)>
	<cfset NumYears = 0>
	<cftry>
	<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
	<cfcatch>
	<cfset NumYears = 0>
	</cfcatch>
	</cftry>
	<cfif NumYears LTE 10>
		<cfif arguments.loan_amount gte 475000>
		<CFSET a_ins_premium = (#a_ins_premium# * .70)>
		<cfelse>
		<CFSET a_ins_premium = (#a_ins_premium# * .50)>
		</cfif>
	<cfelse>
	<CFSET a_ins_premium = #a_ins_premium#>
	</cfif>
</cfif>
<!--- end NY Refi --->



<!--- NJ Refinance --->
<cfif arguments.property_state eq 'NJ' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1)>
<cfif arguments.same_lender eq 1>
<cfif arguments.previous_loan_amount gt 0 and arguments.previous_loan_amount lt arguments.loan_amount>
<cfset new_money = arguments.loan_amount - arguments.previous_loan_amount>
<CFQUERY datasource="#request.dsn#" NAME="new_money_calc" maxrows="1">
SELECT * FROM #get_table.table_to_use# WHERE a_to >= #new_money# order by a_to
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="orig_money_calc" maxrows="1">
SELECT * FROM #get_table.table_to_use# WHERE a_to >= #arguments.previous_loan_amount# order by a_to
</CFQUERY>
<cfset a_ins_premium = new_money_calc.sale + orig_money_calc.refinance>
</cfif>
</cfif>
</cfif>
<!--- end NJ Refi --->


<!--- MS Refi, North American  --->
<cfif arguments.property_state eq 'MS' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1) and arguments.underwriter_choice eq 30>
	<cfset NumYears = 0>
	<cftry>
	<cfset NumYears = DateDiff("yyyy", CreateDate(arguments.previous_loan_year, arguments.previous_loan_month, 1), Now())>
	<cfcatch>

	<cfset NumYears = 0>
	</cfcatch>
	</cftry>
	<cfif NumYears LTE 10>
		<CFSET a_ins_premium = (#a_ins_premium# * .50)>
	<cfelseif NumYears LTE 5>
		<CFSET a_ins_premium = (#a_ins_premium# * .40)>
	<cfelseif NumYears LTE 3>
		<CFSET a_ins_premium = (#a_ins_premium# * .30)>
	<cfelse>
	<CFSET a_ins_premium = #a_ins_premium#>
	</cfif>
</cfif>
<!--- end MS Refi, North American  --->

<!--- Chase/RealEC accounts get a special bucket rate in MI on North American  --->
<cfif arguments.property_state eq 'MI' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1) and arguments.underwriter_choice eq 30 and (arguments.company_id eq 7393 OR arguments.company_id eq 7402)>
<cfset get_table.table_to_use = "StateMichiganNaticBucketRates">
<CFQUERY datasource="#request.dsn#" NAME="get_refi_rate" maxrows="1">
SELECT * FROM #get_table.table_to_use# WHERE a_to >= #arguments.loan_amount# order by a_to
</CFQUERY>
<cfset a_ins_premium = get_refi_rate.refinance>
</cfif>
<!--- end Chase/RealEC accounts get a special bucket rate in MI on North American --->


<!--- CA NATIC REFI --->
 <cfset temp = getNaticRefiCA(arguments.property_state, arguments.transaction_type, is_natic, arguments.loan_amount)>



<!--- If this is a refi, but there's no previous loan amount, then really it's not  refi and should either get the full loan rate, or a reissue loan rate if availale --->
<cfif (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1) and (arguments.previous_loan_amount eq 0 or arguments.previous_loan_amount eq '' or arguments.previous_loan_amount eq 'NULL') and request.got_reissue_rate eq 0>
<cfset a_ins_premium = read_ins_calc.refinance>
</cfif>


<!--- CO Refi, Stewart  --->
<cfif arguments.property_state eq 'CO' and (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1) and arguments.underwriter_choice eq 16>

<cfset a_ins_premium = #GetReissuerates(a_ins_premium, arguments.previous_loan_year, arguments.previous_loan_month,  arguments.previous_purch_year, arguments.previous_purch_month, arguments.previous_purch_amount, arguments.transaction_type, arguments.property_state, arguments.property_county, arguments.previous_loan_amount, arguments.loan_amount, arguments.company_id,  arguments.reissue_rates,  arguments.underwriter_choice)#>

</cfif>
<!--- end CO Refi, Stewart  --->




<!--- ALL Purchases --->
<CFIF arguments.transaction_type eq "Purchase" or treat_as_purchase eq 1>



<cfset temp = getSimulRate(arguments.property_state, arguments.property_county, arguments.purchase_price, arguments.loan_amount, arguments.underwriter_choice, arguments.enhanced_coverage, arguments.company_id)>

<cfset full_lenders = 0>
<cfset set_amount2 = 0>



<cfif NOT IsNumeric(arguments.loan_amount)>
<cfset arguments.loan_amount = 0>
</cfif>
<CFSET   x_final  = #Ceiling(arguments.loan_amount)#>
	<cfif arguments.loan_amount gt 0>
	<CFQUERY datasource="#request.dsn#" NAME="read_ins_calc" maxrows="1">
	SELECT * FROM #get_table.table_to_use# WHERE a_to >= #x_final# order by a_to
	</CFQUERY>
	<cfset full_lenders = read_ins_calc.refinance>
	</cfif>



<!---<cfif arguments.property_state eq 'TX'>
<cfif (arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1) and (arguments.loan_amount eq 0 or arguments.loan_amount eq "")>
<cfset full_lenders = 0>
<cfelse>
<cfset full_lenders = #a_ins_premium#>
</cfif>
</cfif>	--->

<cfset lenders_amount = full_lenders>

<cftry>
<cfif arguments.property_state eq 'GA'>
<cfset owners_amount = full_owners_simul>
<cfelseif arguments.property_state eq 'NE'>
<cfset owners_amount = full_owners_simul - simul_rate>
<cfelseif arguments.property_state eq 'TX'>
<cfset owners_amount = full_owners_simul + simul_rate - full_lenders>
<cfset Lenders_amount = full_lenders>
<cfelse>
<cfset owners_amount = full_owners_simul - full_lenders>
</cfif>
<cfcatch type="any"></cfcatch></cftry>




<cfif owners_amount gt 0>
<cfset buyer_paid_owners = owners_amount>
<cfelse>
<cfset buyer_paid_owners = simul_rate>
</cfif>


<cfset buyer_paid_lenders = lenders_amount>
	<cfif arguments.enhanced_coverage eq 1>
		<cfif arguments.property_state neq 'MD' and arguments.property_state neq 'VA'  and arguments.property_state neq 'MI'  and arguments.property_state neq 'NJ'>
		<cfif full_owners_simul neq 'Call for Quote!' and full_owners_simul neq ''>
		<cfset pre_enhanced_amount = (full_owners_simul - simul_rate) * .80>
		</cfif>
		</cfif>
	<!--- MD & VA  Purchases with enhanced Coverage, need to find out the pre-enhanced amount so we can substract it later if needed --->
		<cfif get_table.table_to_use eq 'StateMarylandStewartEnhanced'>
			<CFQUERY datasource="#request.dsn#" NAME="get_pre_enhanced_amount" maxrows="1">
			SELECT * FROM StateMarylandStewart WHERE a_to >= #arguments.purchase_price# order by a_to
			</CFQUERY>
			<cfset pre_enhanced_amount = get_pre_enhanced_amount.sale>
		<cfelseif get_table.table_to_use eq 'StateMarylandFirstAmerican'>
			<CFQUERY datasource="#request.dsn#" NAME="get_pre_enhanced_amount" maxrows="1">
			SELECT * FROM StateMarylandFirstAmerican WHERE a_to >= #arguments.purchase_price# order by a_to
			</CFQUERY>
			<cfset pre_enhanced_amount = get_pre_enhanced_amount.sale>
		<cfelseif get_table.table_to_use eq 'StateVirginiaStewartEnhanced'>
			<CFQUERY datasource="#request.dsn#" NAME="get_pre_enhanced_amount" maxrows="1">
			SELECT * FROM StateVirginiaStewart WHERE a_to >= #arguments.purchase_price# order by a_to
			</CFQUERY>
			<cfset pre_enhanced_amount = get_pre_enhanced_amount.sale>
		<cfelseif get_table.table_to_use eq 'StateVirginiaFirstAmericanEnhanced'>
			<CFQUERY datasource="#request.dsn#" NAME="get_pre_enhanced_amount" maxrows="1">
			SELECT * FROM StateVirginiaFirstAmerican WHERE a_to >= #arguments.purchase_price# order by a_to
			</CFQUERY>
			<cfset pre_enhanced_amount = get_pre_enhanced_amount.sale>
		<cfelseif get_table.table_to_use eq 'StateMichiganStewartEnhanced'>
			<CFQUERY datasource="#request.dsn#" NAME="get_pre_enhanced_amount" maxrows="1">
			SELECT * FROM StateMichiganStewart WHERE a_to >= #arguments.purchase_price# order by a_to
			</CFQUERY>
			<cfset pre_enhanced_amount = get_pre_enhanced_amount.sale>
		</cfif>
		
	</cfif>


<cfif arguments.seller_paid_owner_policy eq 1 or (arguments.property_state eq 'IL' and arguments.buyer_paid_owner_policy neq 1)>
	<cfif arguments.enhanced_coverage eq 1>
		<cftry>
		<!--- <cfset seller_paid_owners = pre_enhanced_amount - buyer_paid_lenders> --->
		<cfset seller_paid_owners = buyer_paid_owners - (full_owners_simul - pre_enhanced_amount)>
		<cfcatch type="any">
		<cfset seller_paid_owners = 'Call for Quote'>
		</cfcatch>
		</cftry>
		<!--- <cfset buyer_paid_owners = full_owners_simul - pre_enhanced_amount> --->
		<cftry>
		<cfset buyer_paid_owners = buyer_paid_owners - seller_paid_owners>
		<cfcatch type="any">
		<cfset buyer_paid_owners = 'Call for Quote'>
		</cfcatch>
		</cftry>
	<cfelse>
		<cfset seller_paid_owners = full_owners_simul>
		<cfset buyer_paid_owners = 0>
		<cfif arguments.loan_amount gt 0>
			<cftry>
			<cfset seller_paid_owners = full_owners_simul - full_lenders>
			<cfset buyer_paid_lenders = full_lenders>
			<cfcatch type="any">
			<cfset seller_paid_owners = 'Call for Quote'>
			</cfcatch>
			</cftry>
			<cfset buyer_paid_owners = 0>
		</cfif>
	</cfif>	
</cfif>
	

	<cfif arguments.seller_paid_lender_policy eq 1>
	<cfset seller_paid_lenders = full_lenders - simul_rate>
	<cfset buyer_paid_lenders = simul_rate>
	</cfif>

<cfif arguments.property_state eq 'TX'>
<cfset underwriter_name = 'Fidelity National Title'>
<cfset title_co_name = 'Allegiance Title Company'>
</cfif>

<cfif arguments.property_state eq 'NM'>
<cfset underwriter_name = 'Stewart Title Guaranty Company'>
<cfset title_co_name = 'Allegiance Title Company'>
</cfif>


<cfset seller_paid_owners_states = "AK,AZ,AR,CO,FL,ID,IN,MI,MT,OR,UT,WA,WI,WY">
<cfif ListFind(seller_paid_owners_states, arguments.property_state, ",")>
<cfset seller_paid_owners = buyer_paid_owners>
<cfset buyer_paid_owners = 0>
</cfif>

<cfset split_paid_owners_states = "NE,OH,SD">
<cfif ListFind(split_paid_owners_states, arguments.property_state, ",")>
<cfset seller_paid_owners = buyer_paid_owners>
<cfset buyer_paid_owners = 0>
</cfif>



<cfif arguments.property_state eq 'HI'>
<cfset seller_paid_owners = buyer_paid_owners * .60>
<cfset buyer_paid_owners = buyer_paid_owners - seller_paid_owners>
</cfif>








<cfif buyer_paid_owners neq 0>
<cftry>
<cfset temp = AddQueryItem(1103, "Title Insurance Premium - Owner's Policy", NumberFormat(buyer_paid_owners, '_____.__'), "Buyer",0, underwriter_name)>
<cfcatch type="any">
<cfset temp = AddQueryItem(1103, "Title Insurance Premium - Owner's Policy", "Call for Quote!", "Buyer",0, underwriter_name)>
</cfcatch>
</cftry>
</cfif>
<cfif buyer_paid_lenders neq 0>
<cfset buyer_paid_lenders = Ceiling(buyer_paid_lenders)>
<cfset temp = AddQueryItem(1104, "Title Insurance Premium - Lender's Policy", buyer_paid_lenders, "Buyer",1,title_co_name)>
<cfif IsNumeric(buyer_paid_lenders)>
<cfset roll_up_1101 = roll_up_1101 + buyer_paid_lenders>
</cfif>
</cfif>



<cfif seller_paid_owners eq 'Call for Quote'>
<cfset temp = AddQueryItem(1103, "Title Insurance Premium - Owner's Policy", seller_paid_owners, "Seller", 0, underwriter_name)>
<cfelseif seller_paid_owners neq 0>
<cfif arguments.company_id eq 3722 or arguments.company_id eq 4752 or arguments.company_id eq 4702>
<cfset temp = AddQueryItem(1103, "Title Insurance Premium - Owner's Policy", NumberFormat(seller_paid_owners, '_____.__'), "Buyer",0, underwriter_name)>
<cfelse>
<cfset temp = AddQueryItem(1103, "Title Insurance Premium - Owner's Policy", NumberFormat(seller_paid_owners, '_____.__'), "Seller", 0, underwriter_name)>
</cfif>
</cfif>
<cfif seller_paid_lenders neq 0>
<cfset seller_paid_lenders = Ceiling(seller_paid_lenders)>
<cfset temp = AddQueryItem(1104, "Title Insurance Premium - Lender's Policy", NumberFormat(seller_paid_lenders, '_____.__'), "Seller", 0, title_co_name)>
</cfif>

</cfif>


<cfif (arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1) and out_of_range eq 1>
<cfset temp = AddQueryItem(1103, "Title Insurance Premium - Owner's Policy", "Call for Quote!", "Buyer",0, underwriter_name)>
</cfif>





<cfif a_ins_premium neq 0 and trim(a_ins_premium) neq '' and (arguments.transaction_type neq 'Purchase' and treat_as_refi eq 1)>
<cfif current_ins_premium NEQ "" and current_ins_premium LT a_ins_premium >
<cfif is_natic eq 0>
<cfset a_ins_premium = current_ins_premium>
</cfif>
</cfif>


<cfif arguments.property_state eq 'CO' and IsDefined("new_ins_premium")>
<cfset a_ins_premium = new_ins_premium>
</cfif>


<cfset temp = AddQueryItem(1104, "Title Insurance Premium - Lender's Policy", Ceiling(a_ins_premium), "Buyer", 1, title_co_name)>
<cfif IsNumeric(a_ins_premium)>
 <cfset roll_up_1101 = roll_up_1101 + a_ins_premium>
</cfif>
</cfif>

</cfif>


<cfif arguments.property_state eq 'TX' and IsDefined("a_ins_premium") and arguments.transaction_type eq 'Reverse Mortgage'>
<cfset temp = AddQueryItem(1104, "Title Insurance Premium - Lender's Policy", Ceiling(a_ins_premium), "Buyer", 1, title_co_name)>
<cfif IsNumeric(a_ins_premium)>
 <cfset roll_up_1101 = roll_up_1101 + a_ins_premium>
</cfif>
</cfif>

<!--- is this an ROA Hutton file, even though it's a refi, needs to record Title Insurance as if it's a purchase, so we've already temporarily made this a purchase, and figured out TI, so now lets change it back to a refi --->			
<cfif arguments.company_id eq 3276 or arguments.company_id eq 3943 or arguments.company_id eq 4043 or arguments.company_id eq 4042 or arguments.company_id eq 3722 or arguments.company_id eq 4752 or arguments.company_id eq 4702>
<cfset arguments.transaction_type = "Refinance">
</cfif>

</cfif>
	
<cfif arguments.loan_amount gt 0>
<cfset temp = AddQueryItem(1105, "Lender's Title Policy Limit - (" & DollarFormat(arguments.loan_amount) & ")" , arguments.loan_amount, "Buyer", 1)>
</cfif>
<cfif arguments.purchase_price gt 0>
<cfset temp = AddQueryItem(1106, "Owner's Title Policy Limit - (" & DollarFormat(arguments.purchase_price) & ")" , arguments.purchase_price, "Buyer", 1)>
</cfif>


<cfset total_ti = 0>
<cfset county_ti_tax = 0>
<cfset city_ti_tax = 0>
<cfloop query="fees_query">
<cfif (fees_query.line_number eq 1103 or fees_query.line_number eq 1104) and IsNumeric(fees_query.amount)>
<cfset total_ti = total_ti + fees_query.amount>
</cfif>
</cfloop>

<cfif arguments.property_state eq 'KY'>
<cfset city_ti_tax = 0>
<cfset county_ti_tax = 0>
<cfif read_rec_fees.ti_premium_tax_county neq 'NULL' and read_rec_fees.ti_premium_tax_county neq ''>
<cfset county_ti_tax = total_ti * read_rec_fees.ti_premium_tax_county>
<cfif county_ti_tax GT 0>
<cfset temp = AddQueryItem(DetermineAltaLine(), "County Title Insurance Premium Tax", NumberFormat(county_ti_tax, '_____.__'), "Buyer", 0)>
</cfif>
</cfif>
<cfif read_rec_fees.ti_premium_tax_city neq 'NULL' and read_rec_fees.ti_premium_tax_city neq ''>
<cfset city_ti_tax = total_ti * read_rec_fees.ti_premium_tax_city>
<cfif city_ti_tax GT 0>
<cfset temp = AddQueryItem(DetermineAltaLine(), "City Title Insurance Premium Tax", NumberFormat(city_ti_tax, '_____.__'), "Buyer", 0)>
</cfif>
</cfif>
</cfif>



<cfif arguments.property_state eq 'WA'>
<!--- get state title insurance premium tax for this state (and/or county) from our database --->
<CFQUERY datasource="#request.dsn#" NAME="get_state_ti_tax">
SELECT * FROM StateTitleInsTaxRates WHERE (state = '#arguments.property_state#' and county = '#arguments.property_county#' and city = '#arguments.property_city#')
</CFQUERY>
<cfif get_state_ti_tax.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="get_state_ti_tax">
SELECT * FROM StateTitleInsTaxRates WHERE state = '#arguments.property_state#' and county = '#arguments.property_county#' and (city = 'ALL')
</CFQUERY>
</cfif>


<cfif get_state_ti_tax.percentage neq 'NULL' and get_state_ti_tax.percentage neq ''>
<cfset state_ti_tax = total_ti * get_state_ti_tax.percentage>
<cfif state_ti_tax GT 0>
<cfset temp = AddQueryItem(DetermineAltaLine(), "State Title Insurance Premium Tax", NumberFormat(state_ti_tax, '_____.__'), "Buyer", 0)>
</cfif>
</cfif>
</cfif>


<cfset request.natic_bulk_rates_used = 0>
<cfset request.which_bulk_rate_used = 'none'>
<cfset bulk_rates_allowed = 0>
<cfif arguments.property_state neq 'CA'>
<cfset temp = getBulkRates(arguments.company_id, arguments.transaction_type, arguments.property_state, arguments.loan_amount, arguments.title_id)>
</cfif>

<cfif arguments.property_state eq 'IN'>
<cfset temp = getIndianaSpecialRates(arguments.company_id, arguments.transaction_type, arguments.property_state, arguments.loan_amount, arguments.title_id)>
</cfif>

<cfset chicago_rates_allowed = 0>
<cfset chicago_rates_allowed2 = 0>
<cfset temp = getChicagoRates(arguments.company_id, arguments.transaction_type, arguments.property_state, arguments.loan_amount)>
<cfset temp = getChicagoRates2(arguments.company_id, arguments.transaction_type, arguments.property_state, arguments.property_county, arguments.loan_amount)>

		
<!--- here we are going to see if we should get the fees from a different account, if an 'asset manager' is chosen, we'll get the fees from that company, otherwise, we'll get them from the company placing the order --->
<cfif arguments.asset_manager neq '' and arguments.asset_manager neq 'NULL' and arguments.asset_manager neq 0>
<cfset billing_co_id_to_use = arguments.asset_manager>
<cfelse>
<cfset billing_co_id_to_use = arguments.company_id>
</cfif>		




<!--- 1204 Intangible Tax --->
<cfif arguments.company_id neq 3722 and arguments.company_id neq 4752 and arguments.company_id neq 4702>
<CFIF #read_rec_fees.intangible_tax# neq 0 and isnumeric(read_rec_fees.intangible_tax)>
<cfif arguments.transaction_type eq 'Reverse Mortgage'>
<CFSET intang_tax = #Ceiling(arguments.loan_amount * 1.5)# * #read_rec_fees.intangible_tax#>
<cfelse>
<CFSET intang_tax = #Ceiling(arguments.loan_amount)# * #read_rec_fees.intangible_tax#>
</cfif>

<cfif arguments.property_state eq 'FL' or arguments.property_state eq 'GA'>

<cfset temp = AddQueryItem(1205, "State tax/stamps: Intangible Tax: Mortgage", NumberFormat(intang_tax, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + intang_tax>
<cfelse>
<cfset temp = AddQueryItem(1206, "State tax/stamps: Intangible Tax: Mortgage", NumberFormat(intang_tax, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + intang_tax>
</cfif>
</cfif>
</cfif>

<cfif roll_up_1201 neq 0>
	<cfset temp = AddQueryItem(1201, "Government Recording Charges", NumberFormat(roll_up_1201, '_____.__'), "Buyer", 0)>
</cfif>



<!--- special New Orleans Charges --->
<cfif arguments.property_city eq 'New Orleans' and arguments.property_state eq 'LA'>
<cfif (arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1) and arguments.loan_amount gt 0>
<cfset temp = AddQueryItem(1208, "Recording Fee to City of New Orleans", NumberFormat(650, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + 650>
<cfset temp = AddQueryItem(1209, "Notorial Archive Fee to City of New Orleans", NumberFormat(40, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + 40>
<cfelse>
<cfset temp = AddQueryItem(1208, "Recording Fee to City of New Orleans", NumberFormat(325, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + 325>
<cfset temp = AddQueryItem(1209, "Notorial Archive Fee to City of New Orleans", NumberFormat(20, '_____.__'), "Buyer", 1)>
<cfset roll_up_1203 = roll_up_1203 + 20>
</cfif>
</cfif>

<cfif arguments.company_id neq 3722 and arguments.company_id neq 4752 and arguments.company_id neq 4702>
	<cfset temp = AddQueryItem(1203, "Transfer Taxes", NumberFormat(roll_up_1203, '_____.__'), "Buyer", 0)>
</cfif>


<!--- get custom fees for this client --->
<!--- First let's make sure they even have fees set up for this state, because if not, there's no reason to do it, and it would throw an error anyway --->
<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
SELECT * FROM company_billing_states_HUD2010 WHERE company_id = '#billing_co_id_to_use#' and a_states = '#arguments.property_state#' and county = '#arguments.property_county#'
order by state_id desc
</CFQUERY>
<cfif read_this_sets_billing_states.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="read_this_sets_billing_states">
SELECT * FROM company_billing_states_HUD2010 WHERE company_id = '#billing_co_id_to_use#' and a_states = '#arguments.property_state#' and (county = '' or county IS NULL)
order by state_id desc
</CFQUERY>
</cfif>



<cfif read_this_sets_billing_states.recordcount neq 0>
<cfset temp = #GetLineCosts(arguments.asset_manager,arguments.company_id,arguments.property_state,arguments.property_county,arguments.transaction_type,arguments.loan_amount, arguments.delinquency, arguments.cema, arguments.closing_type, arguments.previous_loan_amount)#>
</cfif>



<!--- get CPL fee --->


<cfset temp = #GetCPL_Extra(arguments.loan_amount, arguments.underwriter_choice, arguments.property_state, arguments.property_county,arguments.transaction_type, arguments.company_id,arguments.cema)#>




<cfset temp = #GetSubEscrowAttorneyFees(arguments.property_state, arguments.property_county, arguments.transaction_type, arguments.company_id)#>

<!---<cfif arguments.property_state eq 'OH'><!--- all underwriters --->
<cfset temp = AddQueryItem(DetermineAltaLine(), "Binder Fee to First Title", NumberFormat(50, '_____.__'), "Buyer", 1)>
<cfset roll_up_1101 = roll_up_1101 + 50>
</cfif>--->

<cfif arguments.property_state eq 'PA'>
<cfset temp = AddQueryItem(DetermineAltaLine(), "Tax Status Research Fee", NumberFormat(50, '_____.__'), "Buyer", 1)>
<cfset roll_up_1101 = roll_up_1101 + 50>
</cfif>

<cfif arguments.property_state eq 'GA'>
<cfif arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1>
<cfset temp = AddQueryItem(DetermineAltaLine(), "GRMA fee to GA Dept. of Banking & Finance", NumberFormat(10, '_____.__'), "Buyer", 1)>
<cfset roll_up_1101 = roll_up_1101 + 10>
</cfif>
</cfif>


<cfif roll_up_1101 neq 0>
<cfset total_1101 = total_1101 + roll_up_1101>
</cfif>



<!--- gonna add up alta fees to add them to lender's title premium so we can split them between agency and underwriter --->
<cfset temp = #GetAltas2(arguments.opt_alta_4, arguments.opt_alta_4_1, arguments.opt_alta_5, arguments.opt_alta_5_1, arguments.opt_alta_6, arguments.opt_alta_6_1, arguments.opt_alta_6_2, arguments.opt_alta_7, arguments.opt_alta_8_1, arguments.opt_alta_9, arguments.opt_tx_1, arguments.opt_tx_2, arguments.opt_tx_3, arguments.opt_tx_4, arguments.opt_tx_5, arguments.opt_tx_6, arguments.opt_tx_7, arguments.opt_tx_8, arguments.opt_tx_9, arguments.opt_tx_10, arguments.opt_tx_11, arguments.opt_tx_12, arguments.opt_tx_13, arguments.opt_tx_14, arguments.opt_ut_4, arguments.opt_ut_41, arguments.opt_ut_5, arguments.opt_ut_51, arguments.opt_ut_6, arguments.opt_ut_61, arguments.opt_ut_62, arguments.opt_ut_81, arguments.opt_ut_9, arguments.opt_sd_comp, arguments.opt_sd_balloon, arguments.opt_sd_credit, arguments.opt_sd_7, arguments.opt_sd_6, arguments.opt_sd_4, arguments.opt_sd_5, arguments.opt_sd_9, arguments.opt_sd_8, arguments.opt_fl_nav, arguments.property_state, arguments.property_county, arguments.transaction_type, arguments.loan_amount, arguments.company_id)#>



<cfif total_alta neq 0>
<cfset total_1101 = total_1101 + total_alta>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="check_streamline">
SELECT * FROM companies where (id = #arguments.company_id#)
</CFQUERY>


<!--- Axidion 3942 & 5223
      Eagle - Raj  6013
	  BMIC Mortgage - Schiller  7088   --->

<cfif (arguments.company_id eq 3492 or arguments.company_id eq 5223 or arguments.company_id eq 7088) and arguments.loan_amount LT 500000 and (arguments.transaction_type neq 'Purchase' and treat_as_refi eq 1) and arguments.property_state eq 'MD'>

<cfelseif arguments.company_id eq 7088 and arguments.loan_amount LT 500000 and (arguments.transaction_type neq 'Purchase' and treat_as_refi eq 1) and (arguments.property_state eq 'DC' or arguments.property_state eq 'VA')>

<cfelseif (Mid(check_streamline.company, 1, 10) eq 'Eagle Bank' or Mid(check_streamline.company, 1, 9) eq 'EagleBank') and arguments.loan_amount LTE 1500000 and (arguments.transaction_type neq 'Purchase' and treat_as_refi eq 1) and (arguments.property_state eq 'DC' or arguments.property_state eq 'VA' or arguments.property_state eq 'MD')  and arguments.previous_loan_amount gt 0  and arguments.previous_loan_amount neq 'NULL'> 

<cfelse>
<cfset temp = AddQueryItem(1101, "Title Services and Lender's Title Insurance", NumberFormat(Ceiling(total_1101), '_____.__'), "Buyer", 0, "")>
</cfif>
<!--- end --->




<cfparam name="arguments.ADD_OR_REMOVE" default="">
<cfparam name="arguments.ADD_OR_REMOVE_NUM" default="">
<cfparam name="arguments.APPRAISED_VALUE" default="">
<cfparam name="arguments.ASSESSED_VALUE" default="">
<cfparam name="arguments.ASSET_MANAGER" default="">
<cfparam name="arguments.BORROWER_OWNS" default="">
<cfparam name="arguments.BUYER_PAID_LENDER_POLICY" default="">
<cfparam name="arguments.BUYER_PAID_OWNER_POLICY" default="">
<cfparam name="arguments.CEMA" default="">
<cfparam name="arguments.CLOSING_TYPE" default="">
<cfparam name="arguments.COMPANY_ID" default="">
<cfparam name="arguments.CONSTRUCTION_DRAWS" default="">
<cfparam name="arguments.CURRENT_DEED_NUM" default="">
<cfparam name="arguments.DELINQUENCY" default="">
<cfparam name="arguments.ENCOMPASS" default="">
<cfparam name="arguments.ENHANCED_COVERAGE" default="">
<cfparam name="arguments.FIRST_TIME_BUYER" default="">
<cfparam name="arguments.INSURED" default="">
<cfparam name="arguments.JLP_POLICY" default="">
<cfparam name="arguments.LOAN_AMOUNT" default="">
<cfparam name="arguments.NEW_DEED" default="">
<cfparam name="arguments.NON_SPOUSES_ADDED" default="">
<cfparam name="arguments.NON_SPOUSES_REMOVED" default="">
<cfparam name="arguments.OPT_ALTA_4" default="">
<cfparam name="arguments.OPT_ALTA_4_1" default="">
<cfparam name="arguments.OPT_ALTA_5" default="">
<cfparam name="arguments.OPT_ALTA_5_1" default="">
<cfparam name="arguments.OPT_ALTA_6" default="">
<cfparam name="arguments.OPT_ALTA_6_1" default="">
<cfparam name="arguments.OPT_ALTA_6_2" default="">
<cfparam name="arguments.OPT_ALTA_7" default="">
<cfparam name="arguments.OPT_ALTA_8_1" default="">
<cfparam name="arguments.OPT_ALTA_9" default="">
<cfparam name="arguments.OPT_SD_4" default="">
<cfparam name="arguments.OPT_SD_5" default="">
<cfparam name="arguments.OPT_SD_6" default="">
<cfparam name="arguments.OPT_SD_7" default="">
<cfparam name="arguments.OPT_SD_8" default="">
<cfparam name="arguments.OPT_SD_9" default="">
<cfparam name="arguments.OPT_SD_BALLOON" default="">
<cfparam name="arguments.OPT_SD_COMP" default="">
<cfparam name="arguments.OPT_SD_CREDIT" default="">
<cfparam name="arguments.OPT_TX_1" default="">
<cfparam name="arguments.OPT_TX_10" default="">
<cfparam name="arguments.OPT_TX_11" default="">
<cfparam name="arguments.OPT_TX_12" default="">
<cfparam name="arguments.OPT_TX_13" default="">
<cfparam name="arguments.OPT_TX_14" default="">
<cfparam name="arguments.OPT_TX_2" default="">
<cfparam name="arguments.OPT_TX_3" default="">
<cfparam name="arguments.OPT_TX_4" default="">
<cfparam name="arguments.OPT_TX_5" default="">
<cfparam name="arguments.OPT_TX_6" default="">
<cfparam name="arguments.OPT_TX_7" default="">
<cfparam name="arguments.OPT_TX_8" default="">
<cfparam name="arguments.OPT_TX_9" default="">
<cfparam name="arguments.OPT_UT_4" default="">
<cfparam name="arguments.OPT_UT_41" default="">
<cfparam name="arguments.OPT_UT_5" default="">
<cfparam name="arguments.OPT_UT_51" default="">
<cfparam name="arguments.OPT_UT_6" default="">
<cfparam name="arguments.OPT_UT_61" default="">
<cfparam name="arguments.OPT_UT_62" default="">
<cfparam name="arguments.OPT_UT_81" default="">
<cfparam name="arguments.OPT_UT_9" default="">
<cfparam name="arguments.PREVIOUS_LOAN_AMOUNT" default="">
<cfparam name="arguments.PREVIOUS_LOAN_MONTH" default="">
<cfparam name="arguments.PREVIOUS_LOAN_YEAR" default="">
<cfparam name="arguments.PREVIOUS_PURCH_AMOUNT" default="">
<cfparam name="arguments.PREVIOUS_PURCH_MONTH" default="">
<cfparam name="arguments.PREVIOUS_PURCH_YEAR" default="">
<cfparam name="arguments.end_loan_original_loan_amount" default="">
<cfparam name="arguments.PROPERTY_CITY" default="">
<cfparam name="arguments.PROPERTY_COUNTY" default="">
<cfparam name="arguments.PROPERTY_REPORT" default="">
<cfparam name="arguments.PROPERTY_STATE" default="">
<cfparam name="arguments.PROPERTY_USE_TYPE" default="">
<cfparam name="arguments.PURCHASE_PRICE" default="">
<cfparam name="arguments.REISSUE_RATES" default="">
<cfparam name="arguments.RETURN_DATA" default="">
<cfparam name="arguments.SAME_LENDER" default="">
<cfparam name="arguments.SELLER_PAID_LENDER_POLICY" default="">
<cfparam name="arguments.SELLER_PAID_OWNER_POLICY" default="">
<cfparam name="arguments.SPOUSES_ADDED" default="">
<cfparam name="arguments.SPOUSES_REMOVED" default="">
<cfparam name="arguments.TITLE_ID" default="">
<cfparam name="arguments.TRANSACTION_TYPE" default="">
<cfparam name="arguments.TRANSFER_TAX_PAID_BY" default="">
<cfparam name="arguments.UNDERWRITER_CHOICE" default="">
<cfparam name="arguments.prop_type" default="">

<cfset temp = #getAgencySplits(arguments.ADD_OR_REMOVE,arguments.ADD_OR_REMOVE_NUM,arguments.APPRAISED_VALUE,arguments.ASSESSED_VALUE,arguments.ASSET_MANAGER,arguments.BORROWER_OWNS,arguments.BUYER_PAID_LENDER_POLICY,arguments.BUYER_PAID_OWNER_POLICY,arguments.CEMA,arguments.CLOSING_TYPE,arguments.COMPANY_ID,arguments.CONSTRUCTION_DRAWS,arguments.CURRENT_DEED_NUM,arguments.DELINQUENCY,arguments.ENCOMPASS,arguments.ENHANCED_COVERAGE,arguments.FIRST_TIME_BUYER,arguments.INSURED,arguments.JLP_POLICY,arguments.LOAN_AMOUNT,arguments.NEW_DEED,arguments.NON_SPOUSES_ADDED,arguments.NON_SPOUSES_REMOVED,arguments.OPT_ALTA_4,arguments.OPT_ALTA_4_1,arguments.OPT_ALTA_5,arguments.OPT_ALTA_5_1,arguments.OPT_ALTA_6,arguments.OPT_ALTA_6_1,arguments.OPT_ALTA_6_2,arguments.OPT_ALTA_7,arguments.OPT_ALTA_8_1,arguments.OPT_ALTA_9,arguments.OPT_SD_4,arguments.OPT_SD_5,arguments.OPT_SD_6,arguments.OPT_SD_7,arguments.OPT_SD_8,arguments.OPT_SD_9,arguments.OPT_SD_BALLOON,arguments.OPT_SD_COMP,arguments.OPT_SD_CREDIT,arguments.OPT_TX_1,arguments.OPT_TX_10,arguments.OPT_TX_11,arguments.OPT_TX_12,arguments.OPT_TX_13,arguments.OPT_TX_14,arguments.OPT_TX_2,arguments.OPT_TX_3,arguments.OPT_TX_4,arguments.OPT_TX_5,arguments.OPT_TX_6,arguments.OPT_TX_7,arguments.OPT_TX_8,arguments.OPT_TX_9,arguments.OPT_UT_4,arguments.OPT_UT_41,arguments.OPT_UT_5,arguments.OPT_UT_51,arguments.OPT_UT_6,arguments.OPT_UT_61,arguments.OPT_UT_62,arguments.OPT_UT_81,arguments.OPT_UT_9,arguments.PREVIOUS_LOAN_AMOUNT,arguments.PREVIOUS_LOAN_MONTH,arguments.PREVIOUS_LOAN_YEAR,arguments.PREVIOUS_PURCH_AMOUNT,arguments.PREVIOUS_PURCH_MONTH,arguments.PREVIOUS_PURCH_YEAR,arguments.end_loan_original_loan_amount,arguments.PROPERTY_CITY,arguments.PROPERTY_COUNTY,arguments.PROPERTY_REPORT,arguments.PROPERTY_STATE,arguments.PROPERTY_USE_TYPE,arguments.PURCHASE_PRICE,arguments.REISSUE_RATES,arguments.RETURN_DATA,arguments.SAME_LENDER,arguments.SELLER_PAID_LENDER_POLICY,arguments.SELLER_PAID_OWNER_POLICY,arguments.SPOUSES_ADDED,arguments.SPOUSES_REMOVED,arguments.TITLE_ID,arguments.TRANSACTION_TYPE,arguments.TRANSFER_TAX_PAID_BY,arguments.UNDERWRITER_CHOICE,arguments.prop_type)#>




<!--- if this is (xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) then set all fees to the buyer side --->
<cfset fees_query2 = fees_query>
<!---  arguments.company_id eq 8712 or arguments.company_id eq 8618   --->
<cfif check_company.company contains 'Mason-McDuffie'>
<!-- loop through and find any seller fees --->
<cfloop query="fees_query">
<cfif fees_query.payer eq 'Seller' and fees_query.line_number gt 1201 and fees_query.line_number lt 1300>
<cfset temp_line_number = fees_query.line_number>
<cfset temp_amount = fees_query.amount>
<cfset temp_description = fees_query.description>

         <!--- These next parts total up, 1101, 1201, 1203, and 1301, because if a fee moves from seller to buyer, these would increase --->
		 <!--- 1100 series --->
         <cfif fees_query.line_number gt 1101 and fees_query.line_number lt 1200>
         <cfloop query="fees_query">
		 <cfif fees_query.line_number eq '1101'>
         <cfset temp = QuerySetCell(fees_query, "Amount", fees_query.amount + temp_amount, fees_query.currentrow)>
         </cfif>
		 </cfloop>
		 </cfif>


		 <!--- 1200 series --->


         <cfif fees_query.line_number gt 1201 and fees_query.line_number lt 1203>
         <cfloop query="fees_query">
		 <cfif fees_query.line_number eq '1201'>
         <cfset temp = QuerySetCell(fees_query, "Amount", fees_query.amount + temp_amount, fees_query.currentrow)>
         </cfif>
		 </cfloop>
		 </cfif>

		 <!--- 1203 series --->
         <cfif fees_query.line_number gt 1203 and fees_query.line_number lt 1300>
         <cfloop query="fees_query">
		 <cfif fees_query.line_number eq '1203'>
         <cfset temp = QuerySetCell(fees_query, "Amount", fees_query.amount + temp_amount, fees_query.currentrow)>
         </cfif>
		 </cfloop>
		 </cfif>

		 <!--- 1300 series --->
         <cfif fees_query.line_number gt 1301 and fees_query.line_number lt 1400>
         <cfloop query="fees_query">
		 <cfif fees_query.line_number eq '1301'>
         <cfset temp = QuerySetCell(fees_query, "Amount", fees_query.amount + temp_amount, fees_query.currentrow)>
         </cfif>
		 </cfloop>
		 </cfif>



         <!-- now loop through and see if there is a buyer-side of this fee already in place, and if there is, add the seller's fee to it -->		 
		 <cfset found_one = 0>
         <cfloop query="fees_query2">
		 <cfif fees_query2.line_number eq temp_line_number and fees_query2.description eq temp_description and fees_query2.payer eq 'Buyer' and found_one eq 0>
         <cfset temp = QuerySetCell(fees_query, "Amount", fees_query.amount + temp_amount, fees_query.currentrow)>
		 <cfset found_one = 1>
         </cfif>
		 </cfloop>
	
	    <!--- if a buyer-side version of the fee was not found, then just change this seller fee to a buyer fee --->
		<cfif found_one eq 0>
         <cfloop query="fees_query2">
		 <cfif fees_query2.line_number eq temp_line_number and fees_query2.description eq temp_description and fees_query2.payer eq 'Seller'>
			<cfset temp = QuerySetCell(fees_query, "Payer", 'Buyer', fees_query.currentrow)>
			<cfset temp = QuerySetCell(fees_query, "Outside", '1', fees_query.currentrow)>
         </cfif>
		 </cfloop>
		 </cfif>
</cfif>
</cfloop>

<!--- lastly, recall the query getting rid of anything left over on the seller side in the 1200 series --->
<cfquery dbtype="query" name="new_query">
select *
from fees_query
where (payer = 'Buyer') or (payer = 'Seller' and line_number < 1200) or (payer = 'Seller' and line_number > 1299) 
</cfquery>
<cfset fees_query = new_query>

</cfif> 
<!--- END if this is (xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) then set all fees to the buyer side --->






<!--- if this is a George Mason acct then set all fees to the buyer side --->
<cfset fees_query2 = fees_query>
<!---  arguments.company_id eq 8712 or arguments.company_id eq 8618   --->
<!--- <cfif check_company.company contains 'George Mason' and (arguments.transaction_type eq 'Purchase' or treat_as_purchase eq 1)>
<!--- loop through and find any seller fees --->
<cfloop query="fees_query">
<cfif fees_query.payer eq 'Seller' and fees_query.line_number gt 1201 and fees_query.line_number lt 1300>
<cfset temp_line_number = fees_query.line_number>
<cfset temp_amount = fees_query.amount>
<cfset temp_description = fees_query.description>

         <!--- These next parts total up, 1101, 1201, 1203, and 1301, because if a fee moves from seller to buyer, these would increase --->

		 <!--- 1200 series --->
         <cfif fees_query.line_number gt 1201 and fees_query.line_number lt 1203>
         <cfloop query="fees_query">
		 <cfif fees_query.line_number eq '1201'>
         <cfset temp = QuerySetCell(fees_query, "Amount", fees_query.amount + temp_amount, fees_query.currentrow)>
         </cfif>
		 </cfloop>
		 </cfif>

		 <!--- 1203 series --->
         <cfif fees_query.line_number gt 1203 and fees_query.line_number lt 1300>
         <cfloop query="fees_query">
		 <cfif fees_query.line_number eq '1203'>
         <cfset temp = QuerySetCell(fees_query, "Amount", fees_query.amount + temp_amount, fees_query.currentrow)>
         </cfif>
		 </cfloop>
		 </cfif>




         <!-- now loop through and see if there is a buyer-side of this fee already in place, and if there is, add the seller's fee to it -->		 
		 <cfset found_one = 0>
         <cfloop query="fees_query2">
		 <cfif fees_query2.line_number eq temp_line_number and fees_query2.description eq temp_description and fees_query2.payer eq 'Buyer' and found_one eq 0>
         <cfset temp = QuerySetCell(fees_query, "Amount", fees_query.amount + temp_amount, fees_query.currentrow)>
		 <cfset found_one = 1>
         </cfif>
		 </cfloop>
	
	    <!--- if a buyer-side version of the fee was not found, then just change this seller fee to a buyer fee --->
		<cfif found_one eq 0>
         <cfloop query="fees_query2">
		 <cfif fees_query2.line_number eq temp_line_number and fees_query2.description eq temp_description and fees_query2.payer eq 'Seller'>
			<cfset temp = QuerySetCell(fees_query, "Payer", 'Buyer', fees_query.currentrow)>
			<cfset temp = QuerySetCell(fees_query, "Outside", '1', fees_query.currentrow)>
         </cfif>
		 </cfloop>
		 </cfif>
</cfif>
</cfloop>

<!--- lastly, recall the query getting rid of anything left over on the seller side in the 1200 series --->
<cfquery dbtype="query" name="new_query">
select *
from fees_query
where (payer = 'Buyer') or (payer = 'Seller' and line_number < 1200) or (payer = 'Seller' and line_number > 1299) 
</cfquery>
<cfset fees_query = new_query>

</cfif>---> 
<!--- END if this is a George Mason acct then set all fees to the buyer side --->







<!--- if this is a refi with a new deed, recalulate the transfer taxes  --->
<!---
Add the following boxes on calculator and order form:
1. How many parties on title ?
2. Do you wan tto add or remove parties from title 
3. How many (that are non-exempt) ?

Calculate the amount due using the percentage portion of total transfer taxes for that juridiction.  Ex : 2 parties on title, and addeng 1, they would be 1/3 of transfer taxes - 1 party on title and adding one, they would be 50%.  2 on, and removing 1, they would be 50%
--->
<cfif (arguments.transaction_type eq 'Refinance' or treat_as_refi eq 1) and arguments.new_deed eq 1>
<!--- figure out the percentage --->
<cfif arguments.add_or_remove eq 'add'>
<cfset deed_percentage = arguments.add_or_remove_num / (arguments.current_deed_num + arguments.add_or_remove_num)>
<cfelseif arguments.add_or_remove eq 'remove'>
<cfset deed_percentage = arguments.add_or_remove_num / (arguments.current_deed_num)>
</cfif>

<!-- loop through and find any seller fees --->
<cfloop query="fees_query">
<cfif fees_query.line_number gt 1202 and fees_query.line_number lt 1300>
         <cfset temp = QuerySetCell(fees_query, "Amount", fees_query.amount * deed_percentage, fees_query.currentrow)>
         <cfset temp = QuerySetCell(fees_query, "Payer", "Buyer", fees_query.currentrow)>
</cfif>
</cfloop>



</cfif> 
<!--- END if this is a refi with a new deed, recalulate the transfer taxes  --->




<!--- if this is shore processing, take out all but 1100 and 1200 series --->
<cfif arguments.company_id eq 6780>
<cfquery dbtype="query" name="fee_detail"> 
SELECT *
FROM fees_query
where (line_number < 1300 and line_number > 1099) or (line_number = 0)
order by line_number
</cfquery>

<cfset fees_query = fee_detail>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="get_company_info">
SELECT     *
FROM         Companies
where id = #arguments.company_id#
</CFQUERY>



<cfif arguments.transaction_type eq 'Construction'>
<cfset temp = #getConstructionLoans(arguments.ADD_OR_REMOVE,arguments.ADD_OR_REMOVE_NUM,arguments.APPRAISED_VALUE,arguments.ASSESSED_VALUE,arguments.ASSET_MANAGER,arguments.BORROWER_OWNS,arguments.BUYER_PAID_LENDER_POLICY,arguments.BUYER_PAID_OWNER_POLICY,arguments.CEMA,arguments.CLOSING_TYPE,arguments.COMPANY_ID,arguments.CONSTRUCTION_DRAWS,arguments.CURRENT_DEED_NUM,arguments.DELINQUENCY,arguments.ENCOMPASS,arguments.ENHANCED_COVERAGE,arguments.FIRST_TIME_BUYER,arguments.INSURED,arguments.JLP_POLICY,arguments.LOAN_AMOUNT,arguments.NEW_DEED,arguments.NON_SPOUSES_ADDED,arguments.NON_SPOUSES_REMOVED,arguments.OPT_ALTA_4,arguments.OPT_ALTA_4_1,arguments.OPT_ALTA_5,arguments.OPT_ALTA_5_1,arguments.OPT_ALTA_6,arguments.OPT_ALTA_6_1,arguments.OPT_ALTA_6_2,arguments.OPT_ALTA_7,arguments.OPT_ALTA_8_1,arguments.OPT_ALTA_9,arguments.OPT_SD_4,arguments.OPT_SD_5,arguments.OPT_SD_6,arguments.OPT_SD_7,arguments.OPT_SD_8,arguments.OPT_SD_9,arguments.OPT_SD_BALLOON,arguments.OPT_SD_COMP,arguments.OPT_SD_CREDIT,arguments.OPT_TX_1,arguments.OPT_TX_10,arguments.OPT_TX_11,arguments.OPT_TX_12,arguments.OPT_TX_13,arguments.OPT_TX_14,arguments.OPT_TX_2,arguments.OPT_TX_3,arguments.OPT_TX_4,arguments.OPT_TX_5,arguments.OPT_TX_6,arguments.OPT_TX_7,arguments.OPT_TX_8,arguments.OPT_TX_9,arguments.OPT_UT_4,arguments.OPT_UT_41,arguments.OPT_UT_5,arguments.OPT_UT_51,arguments.OPT_UT_6,arguments.OPT_UT_61,arguments.OPT_UT_62,arguments.OPT_UT_81,arguments.OPT_UT_9,arguments.PREVIOUS_LOAN_AMOUNT,arguments.PREVIOUS_LOAN_MONTH,arguments.PREVIOUS_LOAN_YEAR,arguments.PREVIOUS_PURCH_AMOUNT,arguments.PREVIOUS_PURCH_MONTH,arguments.PREVIOUS_PURCH_YEAR,arguments.end_loan_original_loan_amount,arguments.PROPERTY_CITY,arguments.PROPERTY_COUNTY,arguments.PROPERTY_REPORT,arguments.PROPERTY_STATE,arguments.PROPERTY_USE_TYPE,arguments.PURCHASE_PRICE,arguments.REISSUE_RATES,arguments.RETURN_DATA,arguments.SAME_LENDER,arguments.SELLER_PAID_LENDER_POLICY,arguments.SELLER_PAID_OWNER_POLICY,arguments.SPOUSES_ADDED,arguments.SPOUSES_REMOVED,arguments.TITLE_ID,arguments.TRANSACTION_TYPE,arguments.TRANSFER_TAX_PAID_BY,arguments.UNDERWRITER_CHOICE)#>
</cfif>



<cfif arguments.encompass eq 1>
<cfinclude template="../encompass/encompass_xml_transform.cfm" >
<cfelse>
<cfquery dbtype="query" name="fee_detail"> 
SELECT *
FROM fees_query
order by line_number
</cfquery>
</cfif>


<cfset removeDeed = 0>

<cfloop query="fee_detail">
<cfif fee_detail.amount eq '0' and fee_detail.description contains 'Deed'>
<cfset removeDeed = 1>
</cfif>
</cfloop>

<cfif removeDeed eq 1>
<cfquery dbtype="query" name="fees_temp"> 
SELECT *
FROM fee_detail
where (description not like '%Deed%' and amount > 0)
order by line_number
</cfquery>
<cfset fee_detail = fees_temp>
</cfif>



<cfif arguments.property_state eq 'TX'>
<cfquery dbtype="query" name="fee_detail"> 
SELECT *
FROM fees_query
order by line_number
</cfquery>
</cfif>







<cfif (Mid(check_company.company, 1,10) eq 'Eagle Bank' or Mid(check_company.company, 1,9) eq 'EagleBank') and (arguments.transaction_type neq 'Purchase' and treat_as_refi eq 1)  and arguments.previous_loan_amount gt 0  and arguments.previous_loan_amount neq 'NULL'>

<cfset amount_to_subtract = 0>

<cfloop query="fees_query">
<cfif fees_query.line_number gte 1109 and fees_query.line_number lte 1200 and fees_query.payer eq 'Buyer'>
<cfset amount_to_subtract = amount_to_subtract + fees_query.amount>
</cfif>
</cfloop>

<cfloop query="fees_query">
<cfif fees_query.description eq "Settlement or Closing Fee" and fees_query.payer eq 'Buyer'>
<cfset new_settlement_amount = fees_query.amount - amount_to_subtract>
<cfset fees_query[ "amount" ][ fees_query.currentrow ] = new_settlement_amount>
</cfif>
</cfloop>


</cfif>







<cfloop query="fees_query">
<cfif fees_query.line_number eq 0 and fees_query.description contains 'Closing'>
<cfset temp = QuerySetCell(fees_query, "Line_Number", 1102, fees_query.currentRow)>
<cfset temp = QuerySetCell(fees_query, "Extra1102", 'X', fees_query.currentRow)>
<cfset temp = QuerySetCell(fees_query, "Outside", '1', fees_query.currentRow)>
</cfif>
</cfloop>



<cfif arguments.property_state eq 'IA'>
        <cfloop query="fees_query">
        <cfif fees_query.line_number eq 1103>
        <cfset fees_query[ "Description" ][ fees_query.currentrow ] = "IA Title Guaranty Fee-Owner's-to Gomez May LLP">
        </cfif>
        <cfif fees_query.line_number eq 1104>
        <cfset fees_query[ "Description" ][ fees_query.currentrow ] = "IA Title Guaranty Fee-Lender's-to Gomez May LLP">
        <cfset fees_query[ "outside" ][ fees_query.currentrow ] = 1>
        </cfif>
        </cfloop>
        
        <cfquery dbtype="query" name="fee_detail"> 
        SELECT *
        FROM fees_query
        where line_number <> 1107 and line_number <> 1108 and line_number <> 1105 and line_number <> 1106
        </cfquery>
        <cfset fees_query = fee_detail>

</cfif>



<cfif mid(get_company_info.company,1,3) eq 'GMM' or get_company_info.company contains 'George Mason'>

<!---<cfif arguments.property_state eq 'MD'>

<cfquery dbtype="query" name="fee_detail"> 
SELECT *
FROM fees_query
where line_number > 1200
</cfquery>

<cfloop query="fee_detail">
<cfif fee_detail.payer eq 'Seller'>

<cfloop query="fees_query">
    <cfif fees_query.line_number eq fee_detail.line_number and fees_query.description eq fee_detail.description and fees_query.payer eq 'Buyer'>
    <cftry>
    <cfset new_amount = fees_query.amount + fee_detail.amount>
    <cfcatch type="any">
    <cfset new_amount = fee_detail.amount>
    </cfcatch>
    </cftry>
        <cfset fees_query[ "amount" ][ fees_query.currentRow ] = javaCast("int",#new_amount#) />
    </cfif>
</cfloop>
</cfif>
</cfloop>
</cfif>--->

<cfquery dbtype="query" name="fee_detail"> 
SELECT *
FROM fees_query
where payer = 'Buyer'
order by line_number
</cfquery>


<cfset fees_query = fee_detail>


<cfloop query="fees_query">
<!---<cfif fees_query.outside eq 0 and fees_query.line_number neq 1101 and fees_query.line_number neq 1201 and fees_query.line_number neq 1203 and fees_query.line_number neq 1301 and fees_query.line_number neq 1103>
<cfset fees_query[ "outside" ][ fees_query.currentrow ] = 1>
</cfif>--->


<cfif fees_query.description contains 'Attorney Disbursement'>
<cfset fees_query[ "description" ][ fees_query.currentrow ] = "Attorney's Fees">
</cfif>


<cfif fees_query.description contains 'Attorney Review'>
<cfset fees_query[ "description" ][ fees_query.currentrow ] = "Attorney's Fees">
</cfif>

<cfif fees_query.description contains 'Overnight Fee'>
<cfset fees_query[ "description" ][ fees_query.currentrow ] = "Courier Fee">
</cfif>

<cfif fees_query.description contains 'Tax Search'>
<cfset fees_query[ "description" ][ fees_query.currentrow ] = "Tax Status Research Fee">
</cfif>

<cfif fees_query.description contains 'Title Insurance Binder Fee'>
<cfset fees_query[ "description" ][ fees_query.currentrow ] = "Title Insurance Binder">
</cfif>


<cfif fees_query.description contains 'CPL'>
<cfset fees_query[ "description" ][ fees_query.currentrow ] = "Closing Protection Letter">
</cfif>



<cfif arguments.property_state eq 'PA'>
<cfif fees_query.description contains 'Short Form Policy'>
<cfset fees_query[ "description" ][ fees_query.currentrow ] = "Short Form Policy">
</cfif>
</cfif>

<cfif arguments.property_state eq 'GA'>
<cfif fees_query.description contains 'Title Examination'>
<cfset fees_query[ "description" ][ fees_query.currentrow ] = "Title Examination">
</cfif>
<cfif fees_query.description contains 'GRMA'>
<cfset fees_query[ "description" ][ fees_query.currentrow ] = "GA Residential Mortgage Act Per Loan Fee">
</cfif>
</cfif>

<cfif arguments.property_state eq 'NC'>
<cfif Find('Recording Service Fee to', fees_query.description)>
<cfset fees_query[ "description" ][ fees_query.currentrow ] = "Recording Services Fee">
<cfset fees_query[ "payto" ][ fees_query.currentrow ] = ReplaceNoCase(fees_query.description, 'Recording Service Fee to ', '', "ALL")>
</cfif>
</cfif>


<cfif Find('Recording Service Fee', fees_query.description)>
<cfset fees_query[ "description" ][ fees_query.currentrow ] = "Recording Services Fee">
<cfset fees_query[ "payto" ][ fees_query.currentrow ] = ReplaceNoCase(fees_query.description, 'Recording Service Fee to ', '', "ALL")>
</cfif>

</cfloop>






<cfquery dbtype="query" name="fee_detail"> 
SELECT *
FROM fees_query
order by line_number
</cfquery>
</cfif>



<!---<cfmail to="rick@jermain.com" from="rjermain@firsttitleservices.com" subject="test" type="html">
<cfoutput>#mid(get_company_info.company,1,3)#</cfoutput>
<cfdump var="#fee_detail#">
</cfmail>
--->

<cfset removeDeed = 0>

<!---<cfloop query="fee_detail">
<cfif fee_detail.line_number eq 0 and fee_detail.description contains 'Closing'>
<cfset temp = QuerySetCell(fee_detail, "Line_Number", 1102, fee_detail.currentRow)>
<cfset temp = QuerySetCell(fee_detail, "Extra1102", 'X', fee_detail.currentRow)>
<cfset temp = QuerySetCell(fee_detail, "Outside", '1', fee_detail.currentRow)>
</cfif>
</cfloop>



<cfparam name="temp_query" default="">
<cfset temp_query = QueryNew("Line_Number, Description, Amount, Payer, Outside, Payto, Extra1102")>	

<cfquery dbtype="query" name="tempquery"> 
SELECT *
FROM fee_detail where line_number = 0
order by description
</cfquery>
<cfloop query="tempquery">
<cfset temp = QueryAddRow(temp_query)>
<cfset temp = QuerySetCell(temp_query, "Line_Number", tempquery.line_number)>
<cfset temp = QuerySetCell(temp_query, "Description", tempquery.description)>
<cfset temp = QuerySetCell(temp_query, "Amount", tempquery.Amount)>
<cfset temp = QuerySetCell(temp_query, "Payer", tempquery.Payer)>
<cfset temp = QuerySetCell(temp_query, "Outside", tempquery.Outside)>
<cfset temp = QuerySetCell(temp_query, "Extra1102", tempquery.Extra1102)>
</cfloop>
<cfquery dbtype="query" name="tempquery"> 
SELECT *
FROM fee_detail where line_number = 1101
order by description
</cfquery>
<cfloop query="tempquery">
<cfset temp = QueryAddRow(temp_query)>
<cfset temp = QuerySetCell(temp_query, "Line_Number", tempquery.line_number)>
<cfset temp = QuerySetCell(temp_query, "Description", tempquery.description)>
<cfset temp = QuerySetCell(temp_query, "Amount", tempquery.Amount)>
<cfset temp = QuerySetCell(temp_query, "Payer", tempquery.Payer)>
<cfset temp = QuerySetCell(temp_query, "Outside", tempquery.Outside)>
<cfset temp = QuerySetCell(temp_query, "Extra1102", tempquery.Extra1102)>
</cfloop>
<cfquery dbtype="query" name="tempquery"> 
SELECT *
FROM fee_detail where line_number = 1102
order by extra1102
</cfquery>
<cfloop query="tempquery">
<cfset temp = QueryAddRow(temp_query)>
<cfset temp = QuerySetCell(temp_query, "Line_Number", tempquery.line_number)>
<cfset temp = QuerySetCell(temp_query, "Description", tempquery.description)>
<cfset temp = QuerySetCell(temp_query, "Amount", tempquery.Amount)>
<cfset temp = QuerySetCell(temp_query, "Payer", tempquery.Payer)>
<cfset temp = QuerySetCell(temp_query, "Outside", tempquery.Outside)>
<cfset temp = QuerySetCell(temp_query, "Extra1102", tempquery.Extra1102)>
</cfloop>
<cfquery dbtype="query" name="tempquery"> 
SELECT *
FROM fee_detail where line_number > 1102
order by line_number,description
</cfquery>
<cfloop query="tempquery">
<cfset temp = QueryAddRow(temp_query)>
<cfset temp = QuerySetCell(temp_query, "Line_Number", tempquery.line_number)>
<cfset temp = QuerySetCell(temp_query, "Description", tempquery.description)>
<cfset temp = QuerySetCell(temp_query, "Amount", tempquery.Amount)>
<cfset temp = QuerySetCell(temp_query, "Payer", tempquery.Payer)>
<cfset temp = QuerySetCell(temp_query, "Outside", tempquery.Outside)>
<cfset temp = QuerySetCell(temp_query, "Extra1102", tempquery.Extra1102)>
</cfloop>

<cfset fee_detail = temp_query>--->


<cfloop query="fee_detail">
<!---<cfif mid(get_company_info.company,1,3) eq 'GMM'>--->

<cfif Mid(fee_detail.line_number,1,4) eq 1109 or Mid(fee_detail.line_number,1,4) eq 1104 or Mid(fee_detail.line_number,1,4) eq 1102 or Mid(fee_detail.line_number,1,4) eq 1202 or Mid(fee_detail.line_number,1,4) eq 1204 or Mid(fee_detail.line_number,1,4) eq 1205 or Mid(fee_detail.line_number,1,4) eq 1206 or Mid(fee_detail.line_number,1,4) gte 1302>
<cfset fee_detail[ "outside" ][ fee_detail.currentrow ] = 0>
</cfif>

<cfif fee_detail.line_number gt 1109 and fee_detail.line_number lt 1200 and fee_detail.payer eq 'Buyer'>
<cfset fee_detail[ "outside" ][ fee_detail.currentrow ] = 0>
</cfif>


<cfif fee_detail.line_number eq 1104 and arguments.property_state eq 'IA'>
<cfset fee_detail[ "outside" ][ fee_detail.currentrow ] = 1>
</cfif>



<cfif fee_detail.line_number neq 1203>
<cfif IsNumeric(fee_detail.amount)>
<cfset temp = AddXMLItem(fee_detail.line_number, fee_detail.description, NumberFormat(fee_detail.amount, '_____.__'), fee_detail.payer, arguments.company_id, fee_detail.outside, fee_detail.payto)>
<cfelse>
<cfset temp = AddXMLItem(fee_detail.line_number, fee_detail.description, fee_detail.amount, fee_detail.payer, arguments.company_id, fee_detail.outside, fee_detail.payto)>
</cfif>
</cfif>
</cfloop>




<!---<cfdump var="#fee_detail#"><cfabort>--->

<!---<cfloop query="fees_query">
<cfif arguments.property_state eq 'TX'>
<cfif fees_query.description contains 'Tax Cert Fee'>
<cfset fees_query[ "outside" ][ fees_query.currentrow ] = 1>
</cfif>
</cfif>
</cfloop>--->

<!---<cfmail to="rick@jermain.com" from="rjermain@firsttitleservices.com" subject="test" type="html">
<cfoutput>#mid(get_company_info.company,1,3)#</cfoutput>
<cfdump var="#fee_detail#">
<cfdump var="#ReturnXML#">
</cfmail>--->


<cffile action="write" addnewline="no" file="c:\inetpub\wwwroot\clients\firsttitleservices.com\www\temp_xml.xml" output="#ReturnXML#" nameconflict="overwrite">
<cfset session.XMLOUT = ReturnXML>



<cfif isDefined("url.rec_id") and url.rec_id neq ''>



<cfif request.which_bulk_rate_used eq 'Natic'>
<cfset insurance_co = 30>
<cfelseif request.which_bulk_rate_used eq 'Stewart' or request.which_bulk_rate_used eq 'Chicago Local Rates' or request.which_bulk_rate_used eq 'Chicago Rates'>
<cfset insurance_co = 16>
</cfif>
<!--- update the file that it got the bulk rate --->
			<CFQUERY datasource="#request.dsn#" NAME="update_bulk_rate">		
			update title
			set which_bulk_rate_used = '#request.which_bulk_rate_used#'
			where title_id = '#url.rec_id#'
			</CFQUERY>
<cfif request.which_bulk_rate_used neq 'none'>
			<CFQUERY datasource="#request.dsn#" NAME="update_ti_co">		
			update doc_title_insurance_title
			set insurance_co = '#insurance_co#'
			where title_id = '#url.rec_id#'
			</CFQUERY>
</cfif>
</cfif>


<cfreturn fees_query>			
</cffunction>

</cfcomponent>