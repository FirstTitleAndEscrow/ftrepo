<cfif IsDefined("url.cid")>
<cfset company_id = url.cid>
</cfif>

		<CFQUERY datasource="#request.dsn#" NAME="read_company">
		
			SELECT *
			FROM companies
			WHERE ID = #company_id#
		
		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_company_billing_values">
		
			SELECT *
			FROM company_billing_values 
			WHERE company_ID = #company_id#
		
		</CFQUERY>
		<cfif #read_company_billing_values.recordcount# gt 0>
		<CFQUERY datasource="#request.dsn#" NAME="read_company_billing_states">
		
			SELECT *
			FROM company_billing_states 
			WHERE company_ID = #company_id# and billing_id = #read_company_billing_values.billing_id# 
		
		</CFQUERY> 
		<cfelse>
		<CFQUERY datasource="#request.dsn#" NAME="read_company_billing_states">
		
			SELECT *
			FROM company_billing_states 
			WHERE 1=0 
		
		</CFQUERY> 
			
			
			</cfif>
	<CFSET a_billing_id = ArrayNew(1)>
<CFSET a_st_list_4 = ArrayNew(1)>
	
		<CFSET a_count = "1">
		<CFSET B_count = "1">
		
<CFOUTPUT QUERY="read_company_billing_values">
				
				<CFSET a_billing_id[a_count] = #billing_id#>
				
				<CFSET a_count = #a_count# + "1">			
		</CFOUTPUT>
		<CFOUTPUT QUERY="read_company_billing_states">
				
				<CFSET a_st_list_4[B_count] = #a_states#>
				
				<CFSET B_count = #B_count# + "1">			
		</CFOUTPUT>
	
		
<CFQUERY datasource="#request.dsn#" NAME="read_ft_agency">
		
			SELECT *
			FROM company_agency_assoc
			WHERE company_ID = #company_id#
		
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_ft_agencies">
		
			SELECT *
			FROM company_billing_values a, company_agency_assoc b
			WHERE a.company_ID = #company_id# AND b.company_id = #company_id# AND a.company_ID = b.company_id
		
		</CFQUERY>
		<!---Changed this to show all 50 states Harry 06/25/2004 --->
		<CFQUERY datasource="#request.dsn#" NAME="read_all_first_title_states">
			SELECT *
			FROM first_title_states_all
			ORDER BY st_abbrev ASC
		</CFQUERY>		
		
		<CFQUERY datasource="#request.dsn#" NAME="read_agencies">
		
			SELECT *
			FROM Title_FT_agencies 
			ORDER BY Company ASC, State ASC
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

		
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>

</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>


<CENTER>

<CENTER>

<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=500 align=center valign=top>
		
<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

	<tr>
		<td width=499 align=center valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>

<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

	<tr>
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=blue face=arial><B>Modify Mortgage Client Line Costs</B>
		</td>
	</tr>
<CFOUTPUT>
	<tr>
		<td width=498 align=center valign=top bgcolor=e3e3e3>
			<font size=3 color=blue face=arial>
			Client - <B>#read_company.company#</B>
		</td>
	</tr>
</CFOUTPUT>
	<tr>
		<td width=498 align=center valign=top bgcolor=e1e1e1>
			<font size=2 color=blue face=arial>
			<CFIF #read_company_billing_values.recordcount# GT "0">
				From the pulldown below, choose which Line Cost set to modify.
			<table width=498 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>	
<CFOUTPUT>
				<tr>
					<td width=490 colspan=3 align=left valign=top bgcolor=e1e1e1>
						<A href="./client_modify_display.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#company_id#"><img src="./images/button_return.gif" border=0></A>
					</td>
				</tr>
</CFOUTPUT>				
	
				<tr>
					<td width=80 align=center valign=top bgcolor=e1e1e1>
						<font size=2 color=black face=arial>
						Billing ID
					</td>

					<td width=410 align=left colspan=2 valign=top bgcolor=e1e1e1>
						<font size=2 color=black face=arial>
						States associated with Billing IDs
					</td>
				
			<cfloop query="read_company_billing_values">				
				<CFOUTPUT>
				
				<CFQUERY datasource="#request.dsn#" NAME="read_company_billing_states">
		
			SELECT *
			FROM company_billing_states 
			WHERE company_ID = #company_id# and billing_id = #billing_id# 
		
		</CFQUERY>
				
				
				
				<tr>
					<td width=80 align=center valign=top bgcolor=f1f1f1>
						<font size=1 color=blue face=verdana>
						<B>#read_company_billing_states.billing_id#</B>
					</td>
</cfoutput>
					
					 <CFQUERY datasource="#request.dsn#" NAME="read_company_billing_states">
		
			SELECT *
			FROM company_billing_states 
			WHERE company_ID = #company_id# and billing_id = #billing_id# 
		
		</CFQUERY>
		
		
		 <td width=410 align=left valign=top bgcolor=f1f1f1>
					<cfloop query="read_company_billing_states">				
				<CFOUTPUT>	<font size=1 color=blue face=verdana>
				
						<B>#read_company_billing_states.a_states#</B>
						
				</CFOUTPUT>
				</cfloop>
					</td>
			
		
			
				</tr>
			
			  </cfloop>
		<tr>
					<td width=80 align=center valign=top bgcolor=e1e1e1>
						<font size=2 color=black face=arial>
						Billing ID
					</td>

					<td width=410 align=left colspan=2 valign=top bgcolor=e1e1e1>
						<font size=2 color=black face=arial>
						FT Agencies associated with Billing IDs
					</td>
				
			<CFOUTPUT query="read_ft_agency">				
				<tr>
					<td width=80 align=center valign=top bgcolor=f1f1f1>
						<font size=1 color=blue face=verdana>
						<B>#billing_id#</B>
					</td>

					<td width=410 align=left valign=top bgcolor=f1f1f1>
						<font size=1 color=blue face=verdana>
						<B>#title_FT_Agency_Name#</B>
					</td>
			
				
			
			
				</tr>
			
			</cfoutput>  
		
		
		
	<CFFORM METHOD=POST ACTION="./client_line_costs_display.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#company_id#">
				<tr>
					<td width=490 colspan=3 align=right valign=top bgcolor=e1e1e1>
						<font size=2 color=black face=arial>
						<NOBR>Select an ID - <SELECT NAME="billing_id" 			
												size="1" 
												style="font-size: 9; 
												font-family: verdana; 
												font-style: normal; 
												color: blue; 
												background-color: e1e1e1; 
												border-color: e1e1e1; 
												border-left-width: thin; 
												border-right-width: thin; 
												border-top-width: thin; 
												border-bottom-width: thin; 
												border-width: thin; 
												border-style: bar; 
												clear: none; 
												float: none;" 
												rows="5" 
												cols="45" 
												>
						<CFOUTPUT QUERY="read_company_billing_values"><OPTION VALUE="#billing_id#">#billing_id# </OPTION></CFOUTPUT>			
												</SELECT></NOBR>
					</td>
				</tr>
			
				<tr>
					<td width=490 colspan=3 align=right valign=top bgcolor=e1e1e1>
						<font size=2 color=black face=arial>
						<input type=image src="./images/button_next.gif" border=0>
					</td>
				</tr>			
	</CFFORM>
				</table>

		</CFIF>	
			
	<!--- ======================================================== --->

		</td>
	</tr>

	<tr>
		<td width=498 align=center valign=top bgcolor=gray>
			<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
				<tr>
					
			
	
	<CFFORM METHOD=POST ACTION="./client_line_costs_add.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#company_id#">	
			<td width=298 align=center valign=top>
					<font size=2 color=black face=arial>
			
			
			Choose which FT Agency to add to a new Line
			Cost set.
			<p>		
		
				<SELECT NAME="ft_agencies" 			
				size="1" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e1e1e1; 
				border-color: e1e1e1; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; 
				float: none;" 
				rows="5" 
				cols="45" 
				>
				
				
				<CFLOOP FROM="1" TO="#ArrayLen(a_agency_id)#" INDEX="PPP">
						
							<CFOUTPUT>
								<OPTION VALUE="#a_agency_ID[PPP]#">#a_agency_state[PPP]#&nbsp;&nbsp;--&nbsp;#a_agency_name[PPP]# </OPTION>
							</CFOUTPUT>
						</CFLOOP>
				</SELECT>
					</td>
					<td width=200 align=center valign=top><p>
			<font size=2 color=black face=arial>
			Choose which states to add to a new Line
			Cost set.
			<p>
			
			<CFIF #read_company_billing_states.recordcount# GT "0">
			
				<CFSET a_st_list = "">
				
					<CFOUTPUT QUERY="read_company_billing_states">
						<CFSET a_st_list = #a_st_list# & #a_states# & ",">
					</CFOUTPUT>
					
					<CFSET a_st_list_1 = #ListToArray(a_st_list, ",")#>
						<SELECT NAME="a_st_list_2" 	MULTIPLE		
								size="10" 
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e1e1e1; 
								border-color: e1e1e1; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none; 
								float: none;" 
								rows="5" 
								cols="45" 
								>
							<CFOUTPUT QUERY="read_all_first_title_states"> 
								<CFSET a_trigger = "1">
								<CFLOOP FROM="1" TO="#ArrayLen(a_st_list_1)#" INDEX="BBB">
									<CFIF #a_st_list_1[BBB]# EQ #st_abbrev# >
										<CFSET a_trigger = "2">
									</CFIF>
								</CFLOOP>
									<CFIF #a_trigger# EQ "1">
										<OPTION VALUE="#st_abbrev#">#st_abbrev#</OPTION>
									</CFIF>
								<CFSET a_trigger = "1">								
							</CFOUTPUT>
						</SELECT>			
			
			
			<CFELSE>

						<SELECT NAME="a_st_list_2" 	MULTIPLE		
								size="10" 
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e1e1e1; 
								border-color: e1e1e1; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none; 
								float: none;" 
								rows="5" 
								cols="45" 
								>
							<CFOUTPUT QUERY="read_all_first_title_states"> 
								<OPTION VALUE="#st_abbrev#">#st_abbrev#</OPTION>							
							</CFOUTPUT>
						</SELECT>			
			</CFIF>
			<p>
			<input type=image src="./images/button_next.gif" border=0>
			<p>
			
		</td></CFFORM>
			
	</tr>
</table>
		</td>
	</tr>
</table>
		
		</td>		

		

	</tr>
</table>


	</td>
</tr>
</table>	

	</td>
</tr>
</table>


</BODY>
</HTML>

