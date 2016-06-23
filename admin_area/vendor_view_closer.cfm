
	
	


		<CFQUERY datasource="#request.dsn#" NAME="read_Closers">
		
			SELECT *
			FROM Closer 
			WHERE Closer_ID = #Closer_ID#
		
		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_state_list">
		
			SELECT *
			FROM first_title_states
			ORDER BY st_abbrev ASC
		
		</CFQUERY>
		
		
		<CFSET a_states_list = ArrayNew(1)>
		<CFSET a_count = "1">
		
		<CFOUTPUT QUERY="read_state_list">
			<CFSET a_states_list[a_count] = #st_abbrev#>
			<CFSET a_count = #a_count# + "1">
		
		</CFOUTPUT>
		
			<CFSET a_state_cty_list = ArrayNew(2)>
			<CFSET a_county_count = ArrayNew(1)>
		
		<CFLOOP FROM="1" TO="#ArrayLen(a_states_list)#" INDEX="TTT">
		
			<CFQUERY datasource="#request.dsn#" NAME="read_state_cty_list">

				SELECT DISTINCT COUNTY
				FROM zip_info
				WHERE state = '#a_states_list[TTT]#'
				ORDER BY county ASC

			</CFQUERY>
				
				<CFSET b_count = "1">
			
				<CFOUTPUT QUERY="read_state_cty_list">
					<CFSET a_state_cty_list[TTT][b_count] = #county#>
				
					<CFSET b_count = #b_count# + "1">
				</CFOUTPUT>
				
				<CFSET a_county_count[TTT] = #b_count# - "1">
				
		</CFLOOP>
		
		

		<CFQUERY datasource="#request.dsn#" NAME="read_Closers_county_list">
		
			SELECT st_abbrev, ct_name
			FROM Closer_county
			WHERE Closer_ID = #Closer_ID#
			ORDER BY st_abbrev ASC, ct_name ASC
		
		</CFQUERY>
		
		
		<CFSET a_app_states_1 = ArrayNew(1)>
		<CFSET a_app_county_1 = ArrayNew(1)>
		<CFSET c_count = "1">
		
		<CFOUTPUT QUERY="read_Closers_county_list">
			<CFSET a_app_states_1[c_count] = #st_abbrev#>
			<CFSET a_app_county_1[c_count] = #ct_name#>
			<CFSET c_count = #c_count# + "1">		
		</CFOUTPUT>

<CFQUERY datasource="#request.dsn#" NAME="read_rank">
		
			SELECT *
			FROM Closer_county
			WHERE Closer_ID = #Closer_ID#
					
		</CFQUERY>
		


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>

</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>



<CENTER>

<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=500 align=center valign=top>
		
<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

	<tr>
		<td width=499 align=center valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>

<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

<CFOUTPUT>
	<tr>
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>View Closer</B>
		</td>
	</tr>
</CFOUTPUT>	

</table>

		</td>
	</tr>

	<tr>
		<td width=499 align=center valign=top bgcolor=white>
			

<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=white>

<CFOUTPUT>
	

	<tr>		
		
		<td width=249 align=left valign=top bgcolor=e1e1e1>	
			<NOBR><a href="vendor_coverage.cfm?&a_trigger=1&uid=#URL.uid#&al=#URL.al#&a_state=#a_state#&vendor=#vendor#"><img src="./images/button_return.gif" border=0></a><img src="./images/clear.gif" height=10 width=85></NOBR>
					
		
		</td>
	<td width=249 align=right valign=top bgcolor=e1e1e1>	
	 <cfif #url.uid# neq "93" AND #url.uid# neq "167"><a href="closer_modify_view.cfm?closer_id=#closer_ID#&uid=#URL.uid#&al=#URL.al#&a_state=#a_state#&vendor=#vendor#"></cfif><img border=0 src="./images/button_modify.gif" ALT="Modify this entry"></a>	
	</td>
	</tr>

	<!--- <tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			TSS Code -  
		
		
		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>	
			<input type=text name="tss_id"  size=35 maxlength=75
			VALUE="#read_Closers.tss_id#"
							size="1" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none;" >
					
		
		</td>
	</tr> --->
	
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Company Name - 
		
		
		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
		#read_Closers.company#</font>
		<font size=2 color=black face=arial>
			(or Closer Name) 		
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
			<b>User Name - 
		</b>
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
				<font size=2 color=blue face=arial>
			#read_closers.username#</font>
					
		
		</td>
	</tr>	
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<b><font size=2 color=blue face=arial>
			Password - 
		</b>
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
				<font size=2 color=blue face=arial>
			#read_closers.password#</font>
					
		
		</td>
	</tr>	
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			First Name - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
				<font size=2 color=blue face=arial>
			#read_Closers.fname#</font>
					
		
		</td>
	</tr>	

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Last Name - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
				<font size=2 color=blue face=arial>
			#read_Closers.lname#</font>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Phone - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
				<font size=2 color=blue face=arial>
			#read_Closers.phone#</font>
					
		
		</td>
	</tr>
<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Cell - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
				<font size=2 color=blue face=arial>#read_Closers.cell#
					</font>
		
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Pager - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
		#read_Closers.pager#</font>
					
		
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Fax - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
				<font size=2 color=blue face=arial>
			#read_Closers.fax#</font>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Email - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
				<font size=2 color=blue face=arial>#read_Closers.email#
		</font>
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Address - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
				<font size=2 color=blue face=arial>
			#read_Closers.addr1#</font>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Address - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			
				<font size=2 color=blue face=arial>
			#read_Closers.addr2#</font>
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Notes -  
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			
				<font size=2 color=blue face=arial>
			#read_Closers.a_note_1#</font>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			City - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			
				<font size=2 color=blue face=arial>
			#read_Closers.city#</font>
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			State - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			
				<font size=2 color=blue face=arial>
			#read_Closers.state#</font>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Zip Code - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
				<font size=2 color=blue face=arial>
			#read_Closers.zip_code#</font>
		
		</td>
	</tr>


	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Charge for Svc - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
				<font size=2 color=blue face=arial>#read_Closers.a_cost#					
		</font>
		</td>
	</tr>
 <tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Rank - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
				<font size=2 color=blue face=arial>#read_rank.rank#					
		</font>
		</td>
	</tr>
	<tr>		
		<td width=367 colspan=2 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Comments
		
		
		</td>
	</tr>
	
	<tr>
		<td width=367 colspan=2 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
			#read_Closers.a_comments#
					</font>
		
		</td>
	</tr>



	<tr>		
		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Preferences for recieving Closer Notice
	
		</td>
	</tr>
	
	<tr>
		
		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
		#read_Closers.pref_for_send# 
			
		
		</td>
	</tr>


	<tr>		
		
		<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>	
				
		
		</td>
	</tr>

</CFOUTPUT>
	


		
	<tr>		

		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<b>Counties Currently Serviced</b>
		</td>
	</tr>


<CFIF #read_Closers_county_list.recordcount# EQ "0">

	<tr>
		<td width=498 colspan=2 align=left valign=top bgcolor=f1f1f1>
		<p>
		<bR>
		<font size=2 color=blue face=arial>
		This Closer does not have any "Counties Serviced" in their list. 
		<p>		
		</td>
	</tr>

<CFELSE>
	<tr>
		<td width=348 align=left valign=top bgcolor=f1f1f1>
		<font size=2 color=black face=arial>
		This is the current List of States and Counties for this Closer.  
		<p>
		
		</td>

		<td width=150 align=left valign=top bgcolor=f1f1f1>
<font size=2 color=blue face=arial>
					
						<SELECT NAME="zip_id" MULTIPLE			
					size="6" 
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
					<CFLOOP FROM="1" TO="#ArrayLen(a_app_states_1)#" INDEX="UUU">
						<CFOUTPUT >
							<OPTION VALUE="#a_app_states_1[UUU]#|#a_app_county_1[UUU]#">#a_app_states_1[UUU]# --- #a_app_county_1[UUU]#</OPTION>
						</CFOUTPUT>	
					</CFLOOP>
			</SELECT>
					</font>
			
		</td>
	</tr>

	<tr>
		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			
		</td>
	</tr>	
	
</CFIF>

	

	<tr>
		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			
		</td>
	</tr>	


</table>	
		
		
	</table>	
		
		</td>		

		

	</tr>
</table>
		
	<tr>
		<td width=499 align=center valign=top bgcolor=white>
			


	</td>
</tr>
</table>	

	</td>
</tr>
</table>


</BODY>
</HTML>

