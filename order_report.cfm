				<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		
			SELECT *
			FROM companies
			order by company
			
			
 </CFQUERY> 
		
		
		
		
		
		
		
		
		
		

 

<table width="100%" cellpadding=1 cellspacing=1 border=0>

	
					

					
					<tr>
						
				<td bgcolor=yellow width="20%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<b>Company
						</td>		
						<td bgcolor=yellow width="10%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						<b>	Order Num
						</td>		
							<td bgcolor=yellow width="10%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<b>Order Date
						</td>			
						<td bgcolor=yellow width="15%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<b>Processor
						</td>	
						<td bgcolor=yellow width="15%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<b>proc email
						</td>	
						<td bgcolor=yellow width="15%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<b>Officer
						</td>
							<td bgcolor=yellow width="15%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<b>Off email
						</td>


					
			</tr>
			
			
			<CFLOOP query="read_comp">
			
			
			
			
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM Title 
			WHERE comp_id = #id# and (check_date between '11/1/2003' and getdate()) and cancelled is null 
			order by check_date
			
			
 </CFQUERY> 
<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
	
	<!---  <CFIF #a_trigger# EQ "1">  --->
		<CFIF IsDefined("count")>
			<CFIF #count# EQ 0>
				<CFSET count = 1>
			</CFIF>	
		<CFELSE>
			<CFSET count = 1>
		</CFIF>	

		<!---------------------------------------------------->
		<!--- SET COUNT_END FOR RECORD DISPLAY --->
		<!---------------------------------------------------->
		


			 <CFOUTPUT QUERY="read_report">
		

					
					<CFQUERY datasource="#request.dsn#" NAME="read_company">
		
			SELECT *
			FROM companies
			where ID = #comp_id#
		
		</CFQUERY>
		
						<td bgcolor=#a_bgcolor# width="20%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						#read_company.company#
						</td>	

						<td bgcolor=#a_bgcolor# width="10%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						#title_id#
						</td>		
							<td bgcolor=#a_bgcolor# width="10%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
						#DateFormat(check_date, "m/d/yyyy")#	
						</td>			

								<td bgcolor=#a_bgcolor# width="15%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pname#
						</td>
						<td bgcolor=#a_bgcolor# width="15%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#p_email#
						</td>

                      <td bgcolor=#a_bgcolor# width="15%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#oname#
						</td>
						<td bgcolor=#a_bgcolor# width="15%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							
					#o_email#
						</td>
			
					
					</tr>
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">				
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">				
							</CFIF>
			</CFOUTPUT>		
	
		
	</cfloop>
	
		</table>



