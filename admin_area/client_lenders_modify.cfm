

		<CFQUERY datasource="#request.dsn#" NAME="read_company">
		
			SELECT *
			FROM companies
			WHERE ID = #company_id#
		
		</CFQUERY>



<CFIF #a_flag# EQ "2">

	<CFSET a_lend_list = #ListToArray(FORM.New_lenders_id, ",")#>
	
	<CFLOOP FROM="1" TO="#ArrayLen(a_lend_list)#" INDEX="DDD">

		<CFQUERY datasource="#request.dsn#" NAME="read_lender_1">		
			SELECT *
			FROM Lenders
			WHERE Lender_id = #a_lend_list[DDD]#		
		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" >		
			INSERT INTO company_lender_assoc(Lender_ID, Lender_Name, Lender_State, Company_ID)
			VALUES(#read_lender_1.Lender_ID#, '#read_lender_1.company#',  '#read_lender_1.state#', #company_id#)		
		</CFQUERY>	
	
	</CFLOOP>





<CFELSEIF #a_flag# EQ "1">

	<CFSET a_lend_list = #ListToArray(FORM.Current_lenders_id, ",")#>
	
	<CFLOOP FROM="1" TO="#ArrayLen(a_lend_list)#" INDEX="EEE">
		<CFQUERY datasource="#request.dsn#" >		
			DELETE
			FROM company_lender_assoc
			WHERE Lender_ID = #a_lend_list[EEE]# AND company_id = #company_id#
		</CFQUERY>	
	
	</CFLOOP>


</CFIF>







		<CFQUERY datasource="#request.dsn#" NAME="read_current_lender_assoc">
		
			SELECT *
			FROM company_lender_assoc
			WHERE Company_ID = #company_id#
			ORDER BY Lender_State ASC, Lender_Name ASC
		
		</CFQUERY>
		

		<CFQUERY datasource="#request.dsn#" NAME="read_lenders">
		
			SELECT *
			FROM Lenders 
			ORDER BY state ASC, company ASC
		
		</CFQUERY>	
		
		<CFSET a_lender_id = ArrayNew(1)>
		<CFSET a_lender_state = ArrayNew(1)>
		<CFSET a_lender_name = ArrayNew(1)>
		<CFSET a_count = "1">
		
		<CFOUTPUT QUERY="read_lenders">
				<CFSET a_lender_id[a_count] = #Lender_ID#>
				<CFSET a_lender_state[a_count] = #state#>
				<CFSET a_lender_name[a_count] = #company#>
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
			<font size=2 color=blue face=arial><B>MODIFY Lenders associted with this Mortgage Client</B>
		</td>
	</tr>
<CFOUTPUT>
	<tr>
		<td width=498 align=center valign=top bgcolor=e3e3e3>
			<font size=3 color=blue face=arial>
			Client - <B>#read_company.company#</B>
		</td>
	</tr>

	<tr>
		<td width=498 align=center valign=top bgcolor=e3e3e3>

			<table width=497 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>	
				<tr>
					<td width=490 align=left valign=top bgcolor=e1e1e1>
						<A href="./client_modify_display.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#company_id#"><img src="./images/button_return.gif" border=0></A>
					</td>
				</tr>

	<FORM METHOD=POST ACTION="./client_lenders_modify.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#company_id#&a_flag=1">

	<tr>		
		<td width=497  align=left valign=top bgcolor=e6e6e6>	
			<font size=1 color=blue face=verdana>
			Below is a list of the Lender(s) associated with this Mortgage Client. To remove a Lender from the list below, Select all of the ones you want to remove, then click on the delete button.
			<p>
		</td>
	</tr>

</CFOUTPUT>

		<td width=497 align=left valign=top bgcolor=e6e6e6>	
						<SELECT NAME="Current_lenders_id" 	MULTIPLE		
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
							<CFOUTPUT QUERY="read_current_lender_assoc">
										<OPTION VALUE="#Lender_ID#">#Lender_state#&nbsp;&nbsp;--&nbsp;#Lender_Name# </OPTION>
						
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

	<FORM METHOD=POST ACTION="./client_lenders_modify.cfm?uid=#URL.uid#&al=#URL.al#&company_id=#company_id#&a_flag=2">

	<tr>		
		<td width=497  align=left valign=top bgcolor=e6e6e6>	
			<font size=1 color=blue face=verdana>
			Select one or more Lenders from the list below to be associated with this Mortgage Client
			<p>
		</td>
	</tr>

</CFOUTPUT>

		<td width=497 align=left valign=top bgcolor=e6e6e6>	
						<SELECT NAME="New_lenders_id" 	MULTIPLE		
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
					<CFIF #read_current_lender_assoc.recordcount# EQ "0">
						<CFLOOP FROM="1" TO="#ArrayLen(a_lender_id)#" INDEX="PPP">
						
							<CFOUTPUT>
								<OPTION VALUE="#a_Lender_ID[PPP]#">#a_lender_state[PPP]#&nbsp;&nbsp;--&nbsp;#a_lender_name[PPP]# </OPTION>
							</CFOUTPUT>
						</CFLOOP>
					
					<CFELSE>
					
								
						<CFLOOP FROM="1" TO="#ArrayLen(a_lender_id)#" INDEX="PPP">
							<CFSET xx_trigger = "1">
							<CFOUTPUT QUERY="read_current_lender_assoc">
								<CFIF #Lender_ID# EQ #a_lender_id[PPP]#>
									<CFSET xx_trigger = "2">	
								</CFIF>						
							</CFOUTPUT>
								<CFIF #xx_trigger# EQ "1">
						<CFOUTPUT>
									<OPTION VALUE="#a_Lender_ID[PPP]#">#a_lender_state[PPP]#&nbsp;&nbsp;--&nbsp;#a_lender_name[PPP]# </OPTION>
						</CFOUTPUT>
								</CFIF>
							
						</CFLOOP>
						
					</CFIF>
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

