

<CFOUTPUT>

<CFSET   x  = #Round(loanamt_float)#>

loanamt_float - #loanamt_float#<p>
x - #x#<br>

					<CFSET   x_len  = #Len(x)#>	
x_len - #x_len#<br>					
						<CFIF #x_len# EQ "4">
							<CFSET x_temp = #x# / 100>
x_temp = #x_temp#<p>
							<CFSET   x_final  = #Round(x_temp)# * 100>						
						<CFELSEIF #x_len# EQ "5">
							<CFSET x_temp = #x# / 1000>
x_temp = #x_temp#<p>
							<CFSET   x_final  = #Round(x_temp)# * 1000>						
						<CFELSEIF #x_len# EQ "6">
							<CFSET x_temp = #x# / 1000>
x_temp = #x_temp#<p>
							<CFSET   x_final  = #Round(x_temp)# * 1000>						
						<CFELSEIF #x_len# EQ "7">
							<CFSET x_temp = #x# / 10000>
x_temp = #x_temp#<p>
							<CFSET   x_final  = #Round(x_temp)# * 10000>
						</CFIF>




x_final = #x_final#


</CFOUTPUT>



