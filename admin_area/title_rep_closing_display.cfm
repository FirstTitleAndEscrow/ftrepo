
<cfparam name="buyer_lname" default="">
<cfparam name="buyer_fname" default="">
<cfparam name="seller_fname" default="">
<cfparam name="seller_lname" default="">
<cfparam name="comments" default="">
<cfparam name="events" default=""> 
<cfparam name="appraisal_status" default="">
<cfparam name="sortorder" default=""> 
<cfparam name="user_id" default="">
<cfparam name="confirm_mon" default="">
<cfparam name="comfirm_day" default="">
<cfparam name="confirm_year" default="">
<cfparam name="comfirm_day_to" default="">
<cfparam name="confirm_mon_to" default="">
<cfparam name="confirm_year_to" default="">
<cfparam name="title_id" default="">
<cfparam name="app_id" default="">
<cfparam name="anc_id" default="">
<cfparam name="cr_id" default="">
<cfparam name="avm_id" default="">
<cfparam name="sn_id" default="">
<cfparam name="prop_id" default="">
<cfparam name="order_id" default="">
<cfparam name="abstract_id" default="">
<cfparam name="abstract_file" default="">
<cfparam name="icl_file" default="">
<cfparam name="closer_file" default="">
<cfparam name="company_id" default=""> 
<cfparam name="a_trigger" default="0">
<cfparam name="loan_number" default="">
<CFSET r_count = "0">


		
	<!---- BEGIN MODIFY  ----->
<cfoutput>
		<CFIF IsDefined("form.confirm_mon")><cfif #confirm_mon# NEQ "Month">
	<CFSET confirm_mon = #confirm_mon#>
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day")><cfif #comfirm_day# NEQ "Day">
	<CFSET comfirm_day = #comfirm_day#>
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year")><cfif #confirm_year# NEQ "Year">
	<CFSET confirm_year = #confirm_year#>
</cfif></CFIF>
		 <CFIF IsDefined("form.confirm_mon_to")><cfif #confirm_mon_to# NEQ "Month">
	<CFSET confirm_mon_to = #confirm_mon_to#>
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day_to")><cfif #comfirm_day_to# NEQ "Day">
	<CFSET comfirm_day_to = #comfirm_day_to#>
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year_to")><cfif #confirm_year_to# NEQ "Year">
	<CFSET confirm_year_to = #confirm_year_to#>
</cfif></CFIF>
		
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	<CFSET status = #appraisal_status#>
</cfif></CFIF>
	<CFIF IsDefined("form.loan_number")><cfif #loan_number# NEQ "">
	<CFSET loan_number = #loan_number#>
</cfif></CFIF>	

<CFIF IsDefined("form.title_id")><cfif #title_id# NEQ "NONE">
	<CFSET title_id = #title_id#>
</cfif></CFIF>

<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	<CFSET buyer_fname = #buyer_fname#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	<CFSET buyer_lname = #buyer_lname#>
</cfif></CFIF>

</cfoutput>
	
<CFIF #comp_id# eq "ALL">
		
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM Title a, Title_Closing_Order_Request b 
			WHERE a.title_id = b.title_id and b.request_date is null
<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
		
			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>
		
		<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
			</CFIF>
		
				
				<CFIF #title_id# NEQ "none">
				AND a.title_id = '#title_id#'
			</CFIF> 
			
			 
					

			  <CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (sfirstname1 LIKE '%#seller_fname#%' OR sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (slastname1 LIKE '%#seller_lname#%' OR slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
	  <cfif #url.uid# EQ "92">
and (comp_ID = 128 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 174 or comp_ID = 208)
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date asc 
		</cfif> </CFQUERY>  
		

		<CFSET r_count = #read_report.recordcount#>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>


</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>

<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=820 align=center valign=top>
		
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=820 align=center valign=top bgcolor=e1e1e1>
		
	
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Commitment Report Search</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=820 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<!--- <CFIF #r_count# NEQ "0"> --->


<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>
		
		</TD>
				</TR>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>
			
			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=820 cellpadding=1 cellspacing=1 border=0>

					<tr>
						

						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>			
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td> --->

						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Client
						</td>			

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
					

						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=60 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Update
						</td> --->
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Details
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
	
	
			 
			 
			 <CFLOOP QUERY="read_report">
		
			
			<CFOUTPUT>
					
					<CFQUERY datasource="#request.dsn#" NAME="read_company">
		
			SELECT *
			FROM companies
			where ID = #comp_id#
		
		</CFQUERY>
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							T-#title_id#
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_company.company#
						</td>			

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						
						

	<td bgcolor=#a_bgcolor# width=120 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	
	 
	 #appraisal_status#
	</td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.title_id#&user_id=#user_id#&company_id=#company_id#&title_id=#title_id#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&a_trigger=0" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	
	  
	  
	  </td>	


	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./form_title_closing_order_requesta_cal.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&comp_id=#comp_id#&YearMonthDay=#YearMonthDay#"><img src="./images/button_close.gif" border=0 ALT="View the details for this record"></a>
	</td>
	
	
		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">				
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">				
							</CFIF>
					</tr>
	<!--- </FORM> --->
			
			
		</tr>	
			</CFOUTPUT>	</CFLOOP><!--- </CFIF> ---> 	 <!--- </CFIF> ---> 
	
				</table>



			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
	<cfelse>
	
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>


</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>

<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=820 align=center valign=top>
		
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=820 align=center valign=top bgcolor=e1e1e1>
		
	
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Commitment Report Search</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=820 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<!--- <CFIF #r_count# NEQ "0"> --->


<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
			<!--- 	The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below. --->
				</CENTER>
		
		</TD>
				</TR>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>
			
			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=820 cellpadding=1 cellspacing=1 border=0>

					<tr>
						

						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>			
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Num
						</td>
						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td> --->

						<td bgcolor=gray width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Client
						</td>			

						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td> --->
						<td bgcolor=gray width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
					

						<td bgcolor=gray width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=60 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Comments
						</td>
						<!--- <td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Update
						</td> --->
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Details
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
	
	
	<CFSET zip_id_2 = #ListToArray(comp_id, ",")#>
<CFSET cty_name_1 = ArrayNew(1)>
<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

			<CFSET cty_name_1[MMM] = #st_temp[1]#>		
		
		
		</CFLOOP>

<CFLOOP FROM="1" TO="#ArrayLen(cty_name_1)#" INDEX="TTT">

	
	<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM Title a, Title_Closing_Order_Request b 
			WHERE a.title_id = b.title_id and b.request_date is null and comp_id = '#cty_name_1[TTT]#'
<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
	

			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>
		
		<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
			</CFIF>
		
				
				<CFIF #title_id# NEQ "none">
				AND a.title_id = '#title_id#'
			</CFIF> 
			
			
				
		

			 <CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>

			<CFIF IsDefined("FORM.seller_fname")>
				AND (sfirstname1 LIKE '%#seller_fname#%' OR sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (slastname1 LIKE '%#seller_lname#%' OR slastname2 LIKE '%#seller_lname#%')
			</CFIF> 				
      
	  <cfif #url.uid# EQ "92">
and (comp_ID = 128 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 174 or comp_ID = 208)
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date asc 
		</cfif> </CFQUERY>  
			 
			 <CFSET r_count = #read_report.recordcount#>
			 <CFQUERY datasource="#request.dsn#" NAME="read_comp">
						SELECT *
						FROM Companies 
						WHERE ID = #cty_name_1[TTT]#
					</CFQUERY>
			 <tr>
						
		

						<td bgcolor=#a_bgcolor# colspan = 8 width="100%" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<cfoutput>#r_count# records found for #read_comp.company# </cfoutput>
						</td>
						
						</tr>
			 <CFLOOP QUERY="read_report">
		
			
			<CFOUTPUT>
					
					<CFQUERY datasource="#request.dsn#" NAME="read_company">
		
			SELECT *
			FROM companies
			where ID = #comp_id#
		
		</CFQUERY>
					
					
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "m/d/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							T-#title_id#
						</td>

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_company.company#
						</td>			

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						
						

	<td bgcolor=#a_bgcolor# width=120 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	
	 
	 #appraisal_status#
	</td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.title_id#&user_id=#user_id#&company_id=#company_id#&title_id=#title_id#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&a_trigger=0" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	
	  
	  
	  </td>	


	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./form_title_closing_order_requesta_cal.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&comp_id=#comp_id#&YearMonthDay=#YearMonthDay#"><img src="./images/button_close.gif" border=0 ALT="View the details for this record"></a>
	</td>
	
	
		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">				
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">				
							</CFIF>
					</tr>
	<!--- </FORM> --->
			
			
		</tr>	
			</CFOUTPUT>	</CFLOOP></CFLOOP>
	
				</table>



			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
	
	</cfif>