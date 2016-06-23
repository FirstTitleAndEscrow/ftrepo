

		<CFQUERY datasource="#request.dsn#" NAME="read_admin_user">
		
			SELECT *
			FROM first_admin
			WHERE ID = #user_id#
		
		</CFQUERY>



<CFIF #a_flag# EQ "2">

	
	

	<CFSET a_company_list = #ListToArray(FORM.New_company_id, ",")#>
		
<CFLOOP FROM="1" TO="#ArrayLen(a_company_list)#" INDEX="DDD">
<CFQUERY datasource="#request.dsn#" NAME="read_company_1">		
			SELECT *
			FROM companies
			WHERE ID = #a_company_list[DDD]#		
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#" >		
			INSERT INTO user_client_assoc(ID, company_id, company_name)
			VALUES(#read_admin_user.ID#, #read_company_1.ID#, '#read_company_1.company#')		
		</CFQUERY>	
	
	</CFLOOP>





<CFELSEIF #a_flag# EQ "1">

	<CFSET a_company_list = #ListToArray(FORM.Current_companies_id, ",")#>
	
	<CFLOOP FROM="1" TO="#ArrayLen(a_company_list)#" INDEX="EEE">
		
		<CFQUERY datasource="#request.dsn#" >		
			DELETE
			FROM user_client_assoc
			WHERE ID = #user_id# AND company_id = #a_company_list[EEE]#
		</CFQUERY>	
		
	
	</CFLOOP>

<cfelse>
</CFIF>


<!--- <CFQUERY datasource="#request.dsn#" >		
			DELETE
			FROM user_client_assoc
			WHERE ID = #user_id# AND company_id = '#FORM.Current_companies_id#'
		</CFQUERY>	 --->




		<CFQUERY datasource="#request.dsn#" NAME="read_current_assoc">
		
			SELECT *
			FROM user_client_assoc
			WHERE ID = #user_id#
			ORDER BY company_Name ASC
		
		</CFQUERY>
		

		<CFQUERY datasource="#request.dsn#" NAME="read_companies">
		
			SELECT *
			FROM companies
			ORDER BY company ASC
		
		</CFQUERY>	
		

				<CFSET a_company_x = "">
				
					<CFOUTPUT QUERY="read_current_assoc">
						<CFSET a_company_x = #a_company_x# & #company_name# & ",">
					</CFOUTPUT>
					
				<CFSET a_company_list = #ListToArray(a_company_x, ",")#>
		
		<CFSET a_company_id = ArrayNew(1)>
		<CFSET a_company_name = ArrayNew(1)>
		<CFSET a_count = "1"> 
		
		<CFOUTPUT QUERY="read_companies">
				
				<CFSET a_company_id[a_count] = #ID#>
				<CFSET a_company_name[a_count] = #company#>
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
			<font size=2 color=blue face=arial><B>MODIFY clients associted with this user</B>
		</td>
	</tr>
<CFOUTPUT>
	<tr>
		<td width=498 align=center valign=top bgcolor=e3e3e3>
			<font size=3 color=blue face=arial>
			User - <B>#read_admin_user.fname#&nbsp;&nbsp;&nbsp;&nbsp;#read_admin_user.lname#</B>
		</td>
	</tr>

	<tr>
		<td width=498 align=center valign=top bgcolor=e3e3e3>

			<table width=497 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>	
				<tr>
					<td width=490 align=left valign=top bgcolor=e1e1e1>
						<A href="./user_admin_modify_user.cfm?uid=#URL.uid#&al=#URL.al#&user_id=#user_id#"><img src="./images/button_return.gif" border=0></A>
					</td>
				</tr>

	<FORM METHOD=POST ACTION="./client_user_modify.cfm?uid=#URL.uid#&al=#URL.al#&user_id=#user_id#&a_flag=1">

	<tr>		
		<td width=497  align=left valign=top bgcolor=e6e6e6>	
			<font size=1 color=blue face=verdana>
			Below is a list of the FT Agencies associated with this Mortgage Client. To remove a FT Agency from the list below, Select all of the ones you want to remove, then click on the delete button.
			<p>
		</td>
	</tr>

</CFOUTPUT>

		<td width=497 align=left valign=top bgcolor=e6e6e6>	
						<SELECT NAME="Current_companies_id" size="10" multiple
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
							<CFOUTPUT QUERY="read_current_assoc">
										<OPTION VALUE="#company_id#">#company_name# </OPTION>
						
							</CFOUTPUT>
						</SELECT>	
							<p>
							<input type=image src="./images/button_delete.gif" border=0>

		</td>
	</tr>
</FORM>

	
</table>

			
		</td>
	</tr>

<!--- ============================================================ --->

<CFOUTPUT>

	<tr>
		<td width=498 align=center valign=top bgcolor=e3e3e3>

			<table width=497 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>	

	<FORM METHOD=POST ACTION="./client_user_modify.cfm?uid=#URL.uid#&al=#URL.al#&user_id=#user_id#&a_flag=2">

	<tr>		
		<td width=497  align=left valign=top bgcolor=e6e6e6>	
			<font size=1 color=blue face=verdana>
			Select one or more Lenders from the list below to be associated with this Mortgage Client
			<p>
		</td>
	</tr>

</CFOUTPUT>

		<td width=497 align=left valign=top bgcolor=e6e6e6>	
						<SELECT NAME="New_company_id" 	MULTIPLE		
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
		 	<CFIF #read_current_assoc.recordcount# EQ "0">
					<CFLOOP FROM="1" TO="#ArrayLen(a_company_id)#" INDEX="PPP">
						
							<CFOUTPUT>
								<OPTION VALUE="#a_company_id[PPP]#">#a_company_name[PPP]# </OPTION>
							</CFOUTPUT>
			</CFLOOP>
					
					 
					 
						
					
					<CFELSE>
					
								
						<CFLOOP FROM="1" TO="#ArrayLen(a_company_id)#" INDEX="PPP">
							<CFSET xx_trigger = "1">
							<CFOUTPUT QUERY="read_current_assoc">
								<CFIF #company_ID# EQ #a_company_ID[PPP]#>
									<CFSET xx_trigger = "2">	
								</CFIF>						
							</CFOUTPUT>
								<CFIF #xx_trigger# EQ "1">
						<CFOUTPUT>
									<OPTION VALUE="#a_company_ID[PPP]#">#a_company_name[PPP]# </OPTION>
						</CFOUTPUT>
								</CFIF>
							
						</CFLOOP>
						
					</CFIF>  
					
					<!--- <CFOUTPUT QUERY="read_companies"> 
								<CFSET b_trigger = "1">
								<CFLOOP FROM="1" TO="#ArrayLen(a_company_list)#" INDEX="CCC">
									<CFIF #a_company_list[CCC]# EQ #company#>
										<CFSET b_trigger = "2">	
									</CFIF>
								</CFLOOP>
									<CFIF #b_trigger# EQ "1">
										<OPTION VALUE="#company#">#company#</OPTION>	
									</CFIF>
									<CFSET b_trigger = "1">							
							</CFOUTPUT> --->
						</SELECT>
							<p>
							<input type=image src="./images/button_add.gif" border=0>

		</td>
	</tr>
</FORM>

	
</table>

		</td>
	</tr>

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

