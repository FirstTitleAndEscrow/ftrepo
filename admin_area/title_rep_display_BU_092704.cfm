<cfparam name="state" default="">
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



<cfif #a_trigger# eq "1">	

<CFQUERY datasource="#request.dsn#" NAME="read_user">
	SELECT  *
	FROM	First_Admin 
	where id = #url.uid#
</CFQUERY>
<!---24 is the role Id for outside sales--->
<CFIF #read_user.role_id# eq 24>
	<CFINCLUDE TEMPLATE="./includes/companies_list.cfm">
</CFIF>
		
	<!---- BEGIN MODIFY  ----->
<cfoutput>
		<CFIF IsDefined("form.confirm_mon")><cfif #confirm_mon# NEQ "Month">
	<CFSET confirm_mon = #confirm_mon#>
</cfif></CFIF>
<CFIF IsDefined("form.state")><cfif #state# NEQ "none">
	<CFSET state = #state#>
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
		<CFIF IsDefined("form.comments")><cfif #comments# NEQ "NONE">
	<CFSET comments = #comments#>
</cfif></CFIF>
<CFIF IsDefined("form.events")><cfif #events# NEQ "NONE">
	<CFSET events = #events#>
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
<CFIF IsDefined("form.order_id")><cfif #order_id# NEQ "NONE">
	<CFSET order_id = #order_id#>
</cfif></CFIF>
<CFIF IsDefined("form.abstract_id")><cfif #abstract_id# NEQ "NONE">
	<CFSET abstract_id = #abstract_id#>
</cfif></CFIF>
<CFIF IsDefined("form.abstract_file")><cfif #abstract_file# NEQ "NONE">
	<CFSET abstract_file = #abstract_file#>
</cfif></CFIF>
<CFIF IsDefined("form.icl_file")><cfif #icl_file# NEQ "NONE">
	<CFSET icl_file = #icl_file#>
</cfif></CFIF>
<CFIF IsDefined("form.closer_file")><cfif #closer_file# NEQ "NONE">
	<CFSET closer_file = #closer_file#>
</cfif></CFIF>
<CFIF IsDefined("form.company_id")><cfif #company_id# NEQ "NONE">
	<CFSET company_id = #company_id#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	<CFSET buyer_fname = #buyer_fname#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	<CFSET buyer_lname = #buyer_lname#>
</cfif></CFIF>

</cfoutput>
	
	
<CFIF #company_id# eq "none">
		
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
						 SELECT *
						 FROM Title 
						 WHERE cancelled is null
<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>

			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>
		
		<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
			</CFIF>
		
				
				<CFIF #title_id# NEQ "none">
				AND title_id = '#title_id#'
			</CFIF> 
			
			 
			 <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
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
    	<!---outside Sales info goes here --->
			<CFIF #read_user.role_id# eq 24>
						AND comp_ID IN(#companylist#)
			</CFIF>
			<!---End of Outsides Sales --->
		 <cfif #sortorder# NEQ "NONE">
		  		 ORDER BY #sortorder#
		 <CFELSE>
		 				 ORDER BY  check_date asc 
		</cfif> 
	</CFQUERY>  
		

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
		
	
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=navy>
	<tr>
		<td width=820 align=center valign=top>
<cfoutput><font color = white><b>
		<CFIF IsDefined("form.confirm_mon")><cfif #confirm_mon# NEQ "Month">
	From #confirm_mon#/
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day")><cfif #comfirm_day# NEQ "Day">
#comfirm_day#
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year")><cfif #confirm_year# NEQ "Year">
/#confirm_year#
</cfif></CFIF>
		 <CFIF IsDefined("form.confirm_mon_to")><cfif #confirm_mon_to# NEQ "Month">
	TO #confirm_mon_to#/
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day_to")><cfif #comfirm_day_to# NEQ "Day">
/#comfirm_day_to#/
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year_to")><cfif #confirm_year_to# NEQ "Year">
/#confirm_year_to#,
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	#appraisal_status#,
</cfif></CFIF>		
<CFIF IsDefined("form.loan_amount")><cfif #loan_amount# NEQ "NONE">
	#loan_amount#,
</cfif></CFIF>
<CFIF IsDefined("form.title_id")><cfif #title_id# NEQ "NONE">
	#title_id#,
</cfif></CFIF>
<CFIF IsDefined("form.order_id")><cfif #order_id# NEQ "NONE">
	#order_id#,
</cfif></CFIF>
<CFIF IsDefined("form.prop_id")><cfif #prop_id# NEQ "NONE">
	#prop_id#,
</cfif></CFIF>
<CFIF IsDefined("form.company_id")><cfif #company_id# EQ "NONE">
	'ALL CLIENTS',
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	#buyer_fname#,
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	#buyer_lname#,
</cfif></CFIF></b></font>
</cfoutput>
	</td>
</tr></table>

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
								Duedate/Date Sent
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
		<CFQUERY datasource="#request.dsn#" NAME="read">
			SELECT *
			FROM Doc_Title_Insurance_Title
			WHERE title_id = #title_id#	
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
							<cfif #read.a_recieved_date# neq "">
							#DateFormat(read.a_recieved_date, "m/d/yyyy")# #TimeFormat(read.a_recieved_time, "HH:mm:ss")#
						<cfelse>#DateFormat(duedate, "m/d/yyyy")#</cfif></td>
						
						

	<td bgcolor=#a_bgcolor# width=120 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	
	 
	 #appraisal_status#
	</td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.title_id#&user_id=#user_id#&company_id=#company_id#&title_id=#title_id#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&a_trigger=0" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	
	  
	  
	  </td>	


	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
		
	
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=navy>
	<tr>
		<td width=820 align=center valign=top>
<cfoutput><font color = white><b>
		<CFIF IsDefined("form.confirm_mon")><cfif #confirm_mon# NEQ "Month">
	From #confirm_mon#/
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day")><cfif #comfirm_day# NEQ "Day">
#comfirm_day#
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year")><cfif #confirm_year# NEQ "Year">
/#confirm_year#
</cfif></CFIF>
		 <CFIF IsDefined("form.confirm_mon_to")><cfif #confirm_mon_to# NEQ "Month">
	TO #confirm_mon_to#/
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day_to")><cfif #comfirm_day_to# NEQ "Day">
/#comfirm_day_to#/
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year_to")><cfif #confirm_year_to# NEQ "Year">
/#confirm_year_to#,
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	#appraisal_status#,
</cfif></CFIF>		
<CFIF IsDefined("form.loan_amount")><cfif #loan_amount# NEQ "NONE">
	#loan_amount#,
</cfif></CFIF>
<CFIF IsDefined("form.title_id")><cfif #title_id# NEQ "NONE">
	#title_id#,
</cfif></CFIF>
<CFIF IsDefined("form.order_id")><cfif #order_id# NEQ "NONE">
	#order_id#,
</cfif></CFIF>
<CFIF IsDefined("form.prop_id")><cfif #prop_id# NEQ "NONE">
	#prop_id#,
</cfif></CFIF>
<CFIF IsDefined("form.company_id")><cfif #company_id# EQ "NONE">
	'ALL CLIENTS',
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	#buyer_fname#,
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	#buyer_lname#,
</cfif></CFIF></b></font>
</cfoutput>
	</td>
</tr></table>

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
							Duedate/Date Sent
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
	
	
	<CFSET zip_id_2 = #ListToArray(company_id, ",")#>
<CFSET cty_name_1 = ArrayNew(1)>
<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

			<CFSET cty_name_1[MMM] = #st_temp[1]#>		
		
		
		</CFLOOP>

<CFLOOP FROM="1" TO="#ArrayLen(cty_name_1)#" INDEX="TTT">

	
	<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM Title 
			WHERE comp_id = '#cty_name_1[TTT]#' and cancelled is null
<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>

			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>
		
		<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
			</CFIF>
		
				
				<CFIF #title_id# NEQ "none">
				AND title_id = '#title_id#'
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
and (comp_ID = 128 or comp_ID = 127 or comp_ID = 241 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 227 or comp_id = 397 or comp_ID = 366 or comp_ID = 359 or comp_ID = 231 or comp_ID = 232 or comp_ID = 251 or comp_ID = 252 or comp_ID = 209 or comp_ID = 205 or comp_ID = 174 or comp_ID = 178 or comp_ID = 141 	or comp_ID = 293 or comp_ID = 321 or comp_ID = 289 or comp_ID = 128 or comp_ID = 253 or comp_ID = 254)
</cfif>
<cfif #url.uid# eq "206" or #url.uid# eq "208" or #url.uid# eq "193">
and (comp_ID = 100)
</cfif>
<cfif #url.uid# eq 203>
			and (comp_id=224 or comp_id=465 or comp_id=522 or comp_id=333 or comp_id=523)
			</cfif>
<cfif #url.uid# EQ "185">
and (comp_ID = 404 or comp_id = 408 )
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date asc 
		</cfif> </CFQUERY>  
			 
			 <CFSET r_count = #read_report.recordcount#>
			 <cfif #r_count# neq 0>
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
						
						</tr></cfif>
			 <CFLOOP QUERY="read_report">
		
			
			<CFOUTPUT>
					
					<CFQUERY datasource="#request.dsn#" NAME="read_company">
		
			SELECT *
			FROM companies
			where ID = #comp_id#
		
		</CFQUERY>
				<CFQUERY datasource="#request.dsn#" NAME="read">
			SELECT *
			FROM Doc_Title_Insurance_Title
			WHERE title_id = #title_id#	
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
							<cfif #read.a_recieved_date# neq "">
							#DateFormat(read.a_recieved_date, "m/d/yyyy")# #TimeFormat(read.a_recieved_time, "HH:mm:ss")#
						<cfelse>#DateFormat(duedate, "m/d/yyyy")#</cfif>
						
						</td>
						
						

	<td bgcolor=#a_bgcolor# width=120 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	
	 
	 #appraisal_status#
	</td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.title_id#&user_id=#user_id#&company_id=#company_id#&title_id=#title_id#&appraisal_status=#appraisal_status#&sortorder=#sortorder#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&a_trigger=0" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	
	  
	  
	  </td>	


	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
			</CFOUTPUT>	</CFLOOP></CFLOOP><!--- </CFIF> ---> 	 <!--- </CFIF> ---> 
	
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
	<cfelseif #a_trigger# eq "2">
		<!---- BEGIN MODIFY  ----->
		
<cfoutput>
		<CFIF IsDefined("form.confirm_mon")><cfif #confirm_mon# NEQ "Month">
	<CFSET confirm_mon = #confirm_mon#>
</cfif></CFIF>
<CFIF IsDefined("form.state")><cfif #state# NEQ "none">
	<CFSET state = #state#>
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
		<CFIF IsDefined("form.comments")><cfif #comments# NEQ "NONE">
	<CFSET comments = #comments#>
</cfif></CFIF>
<CFIF IsDefined("form.events")><cfif #events# NEQ "NONE">
	<CFSET events = #events#>
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	<CFSET status = #appraisal_status#>
</cfif></CFIF>
		
<CFIF IsDefined("form.loan_number")><cfif #loan_number# NEQ "">
	<CFSET loan_number = #loan_number#>
</cfif></CFIF>	
<CFIF IsDefined("form.prop_id")><cfif #prop_id# NEQ "NONE">
	<CFSET prop_id = #prop_id#>
</cfif></CFIF>
<CFIF IsDefined("form.order_id")><cfif #order_id# NEQ "NONE">
	<CFSET order_id = #order_id#>
</cfif></CFIF>
<CFIF IsDefined("form.abstract_id")><cfif #abstract_id# NEQ "NONE">
	<CFSET abstract_id = #abstract_id#>
</cfif></CFIF>
<CFIF IsDefined("form.abstract_file")><cfif #abstract_file# NEQ "NONE">
	<CFSET abstract_file = #abstract_file#>
</cfif></CFIF>
<CFIF IsDefined("form.icl_file")><cfif #icl_file# NEQ "NONE">
	<CFSET icl_file = #icl_file#>
</cfif></CFIF>
<CFIF IsDefined("form.closer_file")><cfif #closer_file# NEQ "NONE">
	<CFSET closer_file = #closer_file#>
</cfif></CFIF>
<CFIF IsDefined("form.company_id")><cfif #company_id# NEQ "NONE">
	<CFSET company_id = #company_id#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	<CFSET buyer_fname = #buyer_fname#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	<CFSET buyer_lname = #buyer_lname#>
</cfif></CFIF>

</cfoutput>
	
<cfif #company_id# eq "none">
		
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM property
			WHERE 0 = 0
			
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>

			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>
					
			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
			</CFIF>
				
				<CFIF #prop_id# NEQ "NONE">
				AND prop_id = '#prop_id#'
			</CFIF> 
			
			 
			 <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
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
and (comp_ID = 128 or comp_ID = 127 or comp_ID = 241 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 227  or comp_id = 397 or comp_ID = 366 or comp_ID = 359 or comp_ID = 231 or comp_ID = 232 or comp_ID = 251 or comp_ID = 252 or comp_ID = 209 or comp_ID = 205 or comp_ID = 174 or comp_ID = 178 or comp_ID = 141 	or comp_ID = 293 or comp_ID = 321 or comp_ID = 289 or comp_ID = 128 or comp_ID = 253 or comp_ID = 254)
</cfif>
<cfif #url.uid# EQ "185">
and (comp_ID = 404 or comp_id = 408)
</cfif>
<cfif #url.uid# eq "206" or #url.uid#  or #url.uid# eq "208" or #url.uid# eq "193">
and (comp_ID = 100)
</cfif>
<cfif #url.uid# eq 203>
			and (comp_id=224 or comp_id=465 or comp_id=522 or comp_id=333 or comp_id=523)
			</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date asc 
		</cfif> </CFQUERY>  
		
		

		
		
		
		<!--- <CFIF '#update#' EQ 'yes'>

				<CFQUERY datasource="#request.dsn#">
				UPDATE title
				SET  appraisal_status = '#appraisal_status#',
					comments = '#comments#'
				WHERE prop_id = #prop_id#
				</CFQUERY>

		</cfif> --->
		<CFSET r_count = #read_report.recordcount#>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>



</head>

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
		
	
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=navy>
	<tr>
		<td width=820 align=center valign=top>
<cfoutput><font color = white><b>
		<CFIF IsDefined("form.confirm_mon")><cfif #confirm_mon# NEQ "Month">
	From #confirm_mon#/
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day")><cfif #comfirm_day# NEQ "Day">
#comfirm_day#
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year")><cfif #confirm_year# NEQ "Year">
/#confirm_year#
</cfif></CFIF>
		 <CFIF IsDefined("form.confirm_mon_to")><cfif #confirm_mon_to# NEQ "Month">
	TO #confirm_mon_to#/
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day_to")><cfif #comfirm_day_to# NEQ "Day">
/#comfirm_day_to#/
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year_to")><cfif #confirm_year_to# NEQ "Year">
/#confirm_year_to#,
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	#appraisal_status#,
</cfif></CFIF>		
<CFIF IsDefined("form.loan_amount")><cfif #loan_amount# NEQ "NONE">
	#loan_amount#,
</cfif></CFIF>
<CFIF IsDefined("form.title_id")><cfif #title_id# NEQ "NONE">
	#title_id#,
</cfif></CFIF>
<CFIF IsDefined("form.order_id")><cfif #order_id# NEQ "NONE">
	#order_id#,
</cfif></CFIF>
<CFIF IsDefined("form.prop_id")><cfif #prop_id# NEQ "NONE">
	#prop_id#,
</cfif></CFIF>
<CFIF IsDefined("form.company_id")><cfif #company_id# EQ "NONE">
	'ALL CLIENTS',
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	#buyer_fname#,
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	#buyer_lname#,
</cfif></CFIF></b></font>
</cfoutput>
	</td>
</tr></table>

<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=purple>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Property Report Search</B></CENTER>
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
							P-#prop_id#
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
						
<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>	

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&a_trigger=0&company_id=#company_ID#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./prop_report_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
		
	
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=navy>
	<tr>
		<td width=820 align=center valign=top>
<cfoutput><font color = white><b>
		<CFIF IsDefined("form.confirm_mon")><cfif #confirm_mon# NEQ "Month">
	From #confirm_mon#/
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day")><cfif #comfirm_day# NEQ "Day">
#comfirm_day#
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year")><cfif #confirm_year# NEQ "Year">
/#confirm_year#
</cfif></CFIF>
		 <CFIF IsDefined("form.confirm_mon_to")><cfif #confirm_mon_to# NEQ "Month">
	TO #confirm_mon_to#/
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day_to")><cfif #comfirm_day_to# NEQ "Day">
/#comfirm_day_to#/
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year_to")><cfif #confirm_year_to# NEQ "Year">
/#confirm_year_to#,
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	#appraisal_status#,
</cfif></CFIF>		
<CFIF IsDefined("form.loan_amount")><cfif #loan_amount# NEQ "NONE">
	#loan_amount#,
</cfif></CFIF>
<CFIF IsDefined("form.title_id")><cfif #title_id# NEQ "NONE">
	#title_id#,
</cfif></CFIF>
<CFIF IsDefined("form.order_id")><cfif #order_id# NEQ "NONE">
	#order_id#,
</cfif></CFIF>
<CFIF IsDefined("form.prop_id")><cfif #prop_id# NEQ "NONE">
	#prop_id#,
</cfif></CFIF>
<CFIF IsDefined("form.company_id")><cfif #company_id# EQ "NONE">
	'ALL CLIENTS',
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	#buyer_fname#,
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	#buyer_lname#,
</cfif></CFIF></b></font>
</cfoutput>
	</td>
</tr></table>

<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=purple>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Property Report Search</B></CENTER>
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
	<CFSET zip_id_2 = #ListToArray(company_id, ",")#>
<CFSET cty_name_1 = ArrayNew(1)>

<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

			<CFSET cty_name_1[MMM] = #st_temp[1]#>		
		
		
		</CFLOOP>

<CFLOOP FROM="1" TO="#ArrayLen(cty_name_1)#" INDEX="TTT">
			<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM property
		
				where comp_id = '#cty_name_1[TTT]#'
			
			
			
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>

			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>
					
			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
			</CFIF>
				
				<CFIF #prop_id# NEQ "none">
				AND prop_id = '#prop_id#'
			</CFIF> 
			
			 
			 <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
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
and (comp_ID = 128 or comp_ID = 127 or comp_ID = 241 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 227  or comp_id = 397 or comp_ID = 366 or comp_ID = 359 or comp_ID = 231 or comp_ID = 232 or comp_ID = 251 or comp_ID = 252 or comp_ID = 209 or comp_ID = 205 or comp_ID = 174 or comp_ID = 178 or comp_ID = 141 	or comp_ID = 293 or comp_ID = 321 or comp_ID = 289 or comp_ID = 128 or comp_ID = 253 or comp_ID = 254)
</cfif>
<cfif #url.uid# EQ "185">
and (comp_ID = 404 or comp_id = 408)
</cfif>
<cfif #url.uid# eq "206"  or #url.uid# eq "208" or #url.uid# eq "193">
and (comp_ID = 100)
</cfif>
<cfif #url.uid# eq 203>
			and (comp_id=224 or comp_id=465 or comp_id=522 or comp_id=333 or comp_id=523)
			</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date asc 
		</cfif> </CFQUERY>
			 
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
							P-#prop_id#
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
						
<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>	

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&a_trigger=0&company_id=#company_ID#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./prop_report_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
			</CFOUTPUT>	</CFLOOP>	</CFLOOP><!--- </CFIF> ---> 	 <!--- </CFIF> ---> 
	
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
	<cfelseif #a_trigger# eq 5>
	<cfif #company_id# eq "none">	
		<!---- BEGIN MODIFY  ----->
<cfoutput>
<CFIF IsDefined("form.confirm_mon")><cfif #confirm_mon# NEQ "Month">
	<CFSET confirm_mon = #confirm_mon#>
</cfif></CFIF>
<CFIF IsDefined("form.state")><cfif #state# NEQ "none">
	<CFSET state = #state#>
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
		<CFIF IsDefined("form.comments")><cfif #comments# NEQ "NONE">
	<CFSET comments = #comments#>
</cfif></CFIF>
<CFIF IsDefined("form.events")><cfif #events# NEQ "NONE">
	<CFSET events = #events#>
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
<CFIF IsDefined("form.order_id")><cfif #order_id# NEQ "NONE">
	<CFSET order_id = #order_id#>
</cfif></CFIF>
<CFIF IsDefined("form.abstract_id")><cfif #abstract_id# NEQ "NONE">
	<CFSET abstract_id = #abstract_id#>
</cfif></CFIF>
<CFIF IsDefined("form.abstract_file")><cfif #abstract_file# NEQ "NONE">
	<CFSET abstract_file = #abstract_file#>
</cfif></CFIF>
<CFIF IsDefined("form.icl_file")><cfif #icl_file# NEQ "NONE">
	<CFSET icl_file = #icl_file#>
</cfif></CFIF>
<CFIF IsDefined("form.closer_file")><cfif #closer_file# NEQ "NONE">
	<CFSET closer_file = #closer_file#>
</cfif></CFIF>
<CFIF IsDefined("form.company_id")><cfif #company_id# NEQ "NONE">
	<CFSET company_id = #company_id#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	<CFSET buyer_fname = #buyer_fname#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	<CFSET buyer_lname = #buyer_lname#>
</cfif></CFIF>

</cfoutput>
	

		
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
SELECT *
FROM Title C, Title_Closing_Order_Request O 
WHERE C.title_id = O.title_id AND O.a_Req_closing_month IS NOT NULL and c.cancelled is null
			
		<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>	
			
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>

			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>
			
		
			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
			</CFIF>
				
				<CFIF #title_id# NEQ "none">
				AND c.title_id = '#title_id#'
			</CFIF> 
			
			 
			 <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
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
and (comp_ID = 128 or comp_ID = 127 or comp_ID = 241 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 227  or comp_id = 397 or comp_ID = 366 or comp_ID = 359 or comp_ID = 231 or comp_ID = 232 or comp_ID = 251 or comp_ID = 209 or comp_ID = 205 or comp_ID = 174 or comp_ID = 178 or comp_ID = 141)
</cfif><cfif #url.uid# eq "206" or #url.uid# eq "208" or #url.uid# eq "193">
and (comp_ID = 100)
</cfif>
<cfif #url.uid# eq 203>
			and (comp_id=224 or comp_id=465 or comp_id=522 or comp_id=333 or comp_id=523)
			</cfif>
<cfif #url.uid# EQ "185">
and (comp_ID = 404 or comp_id = 408)
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
		
	
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=navy>
	<tr>
		<td width=820 align=center valign=top>
<cfoutput><font color = white><b>
		<CFIF IsDefined("form.confirm_mon")><cfif #confirm_mon# NEQ "Month">
	From #confirm_mon#/
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day")><cfif #comfirm_day# NEQ "Day">
#comfirm_day#
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year")><cfif #confirm_year# NEQ "Year">
/#confirm_year#
</cfif></CFIF>
		 <CFIF IsDefined("form.confirm_mon_to")><cfif #confirm_mon_to# NEQ "Month">
	TO #confirm_mon_to#/
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day_to")><cfif #comfirm_day_to# NEQ "Day">
/#comfirm_day_to#/
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year_to")><cfif #confirm_year_to# NEQ "Year">
/#confirm_year_to#,
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	#appraisal_status#,
</cfif></CFIF>		
<CFIF IsDefined("form.loan_amount")><cfif #loan_amount# NEQ "NONE">
	#loan_amount#,
</cfif></CFIF>
<CFIF IsDefined("form.title_id")><cfif #title_id# NEQ "NONE">
	#title_id#,
</cfif></CFIF>
<CFIF IsDefined("form.order_id")><cfif #order_id# NEQ "NONE">
	#order_id#,
</cfif></CFIF>
<CFIF IsDefined("form.prop_id")><cfif #prop_id# NEQ "NONE">
	#prop_id#,
</cfif></CFIF>
<CFIF IsDefined("form.company_id")><cfif #company_id# EQ "NONE">
	'ALL CLIENTS',
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	#buyer_fname#,
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	#buyer_lname#,
</cfif></CFIF></b></font>
</cfoutput>
	</td>
</tr></table>

<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=blue>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Closing Request Search</B></CENTER>
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
							C-#title_id#
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
						
                       
<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=0&company_id=#company_ID#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_closing_admin_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=0&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
			</CFOUTPUT>	</CFLOOP>
	
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
		
	
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=navy>
	<tr>
		<td width=820 align=center valign=top>
<cfoutput><font color = white><b>
		<CFIF IsDefined("form.confirm_mon")><cfif #confirm_mon# NEQ "Month">
	From #confirm_mon#/
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day")><cfif #comfirm_day# NEQ "Day">
#comfirm_day#
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year")><cfif #confirm_year# NEQ "Year">
/#confirm_year#
</cfif></CFIF>
		 <CFIF IsDefined("form.confirm_mon_to")><cfif #confirm_mon_to# NEQ "Month">
	TO #confirm_mon_to#/
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day_to")><cfif #comfirm_day_to# NEQ "Day">
/#comfirm_day_to#/
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year_to")><cfif #confirm_year_to# NEQ "Year">
/#confirm_year_to#,
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	#appraisal_status#,
</cfif></CFIF>		
<CFIF IsDefined("form.loan_amount")><cfif #loan_amount# NEQ "NONE">
	#loan_amount#,
</cfif></CFIF>
<CFIF IsDefined("form.title_id")><cfif #title_id# NEQ "NONE">
	#title_id#,
</cfif></CFIF>
<CFIF IsDefined("form.order_id")><cfif #order_id# NEQ "NONE">
	#order_id#,
</cfif></CFIF>
<CFIF IsDefined("form.prop_id")><cfif #prop_id# NEQ "NONE">
	#prop_id#,
</cfif></CFIF>
<CFIF IsDefined("form.company_id")><cfif #company_id# EQ "NONE">
	'ALL CLIENTS',
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	#buyer_fname#,
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	#buyer_lname#,
</cfif></CFIF></b></font>
</cfoutput>
	</td>
</tr></table>

<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=blue>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Closing Request Search</B></CENTER>
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
	
	<CFSET zip_id_2 = #ListToArray(company_id, ",")#>
<CFSET cty_name_1 = ArrayNew(1)>

<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

			<CFSET cty_name_1[MMM] = #st_temp[1]#>		
		
		
		</CFLOOP>

<CFLOOP FROM="1" TO="#ArrayLen(cty_name_1)#" INDEX="TTT">

			<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
SELECT *
FROM Title C, Title_Closing_Order_Request O 
WHERE C.title_id = O.title_id AND O.a_Req_closing_month IS NOT NULL and comp_id = '#cty_name_1[TTT]#' and c.cancelled is null
			
		<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>	
			
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>

			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>
			
		
			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
			</CFIF>
				
				<CFIF #title_id# NEQ "none">
				AND c.title_id = '#title_id#'
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
and (comp_ID = 128 or comp_ID = 127 or comp_ID = 241 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 227  or comp_id = 397 or comp_ID = 366 or comp_ID = 359 or comp_ID = 231 or comp_ID = 232 or comp_ID = 251 or comp_ID = 252 or comp_ID = 209 or comp_ID = 205 or comp_ID = 174 or comp_ID = 178 or comp_ID = 141 	or comp_ID = 293 or comp_ID = 321 or comp_ID = 289 or comp_ID = 128 or comp_ID = 253 or comp_ID = 254)
</cfif>
<cfif #url.uid# eq "206" or #url.uid# eq "208" or #url.uid# eq "193">
and (comp_ID = 100)
</cfif>
<cfif #url.uid# eq 203>
			and (comp_id=224 or comp_id=465 or comp_id=522 or comp_id=333 or comp_id=523)
			</cfif>
			
<cfif #url.uid# EQ "185">
and (comp_ID = 404 or comp_id = 408)
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date asc 
		</cfif> </CFQUERY>  
		
		
	
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
							C-#title_id#
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
						
                       
<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=0&company_id=#company_ID#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_closing_admin_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=0&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
	<cfelseif #a_trigger# eq 3>
		
		<!---- BEGIN MODIFY  ----->
<cfoutput>
		<CFIF IsDefined("form.confirm_mon")><cfif #confirm_mon# NEQ "Month">
	<CFSET confirm_mon = #confirm_mon#>
</cfif></CFIF>
<CFIF IsDefined("form.state")><cfif #state# NEQ "none">
	<CFSET state = #state#>
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
		<CFIF IsDefined("form.comments")><cfif #comments# NEQ "NONE">
	<CFSET comments = #comments#>
</cfif></CFIF>
<CFIF IsDefined("form.events")><cfif #events# NEQ "NONE">
	<CFSET events = #events#>
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	<CFSET status = #appraisal_status#>
</cfif></CFIF>
		
<CFIF IsDefined("form.loan_number")><cfif #loan_number# NEQ "">
	<CFSET loan_number = #loan_number#>
</cfif></CFIF>	
<CFIF IsDefined("form.app_id")><cfif #app_id# NEQ "NONE">
	<CFSET app_id = #app_id#>
</cfif></CFIF>
<CFIF IsDefined("form.order_id")><cfif #order_id# NEQ "NONE">
	<CFSET order_id = #order_id#>
</cfif></CFIF>
<CFIF IsDefined("form.abstract_id")><cfif #abstract_id# NEQ "NONE">
	<CFSET abstract_id = #abstract_id#>
</cfif></CFIF>
<CFIF IsDefined("form.abstract_file")><cfif #abstract_file# NEQ "NONE">
	<CFSET abstract_file = #abstract_file#>
</cfif></CFIF>
<CFIF IsDefined("form.icl_file")><cfif #icl_file# NEQ "NONE">
	<CFSET icl_file = #icl_file#>
</cfif></CFIF>
<CFIF IsDefined("form.closer_file")><cfif #closer_file# NEQ "NONE">
	<CFSET closer_file = #closer_file#>
</cfif></CFIF>
<CFIF IsDefined("form.company_id")><cfif #company_id# NEQ "NONE">
	<CFSET company_id = #company_id#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	<CFSET buyer_fname = #buyer_fname#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	<CFSET buyer_lname = #buyer_lname#>
</cfif></CFIF>

</cfoutput>
	

		
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM appraisal
			WHERE 0 = 0
			
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>
 
			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>
		
		
			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
			</CFIF>
				
				<CFIF #app_id# NEQ "none">
				AND app_id = '#app_id#'
			</CFIF> 
			
			 
			 <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
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
and (comp_ID = 128 or comp_ID = 127 or comp_ID = 241 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 227  or comp_id = 397 or comp_ID = 366 or comp_ID = 359 or comp_ID = 231 or comp_ID = 232 or comp_ID = 251 or comp_ID = 252 or comp_ID = 209 or comp_ID = 205 or comp_ID = 174 or comp_ID = 178 or comp_ID = 141 	or comp_ID = 293 or comp_ID = 321 or comp_ID = 289 or comp_ID = 128 or comp_ID = 253 or comp_ID = 254)
</cfif>
<cfif #url.uid# EQ "185">
and (comp_ID = 404 or comp_id = 408)
</cfif>
<cfif #url.uid# eq "206"  or #url.uid# eq "208" or #url.uid# eq "193">
and (comp_ID = 100)
</cfif>
<cfif #url.uid# eq 203>
			and (comp_id=224 or comp_id=465 or comp_id=522 or comp_id=333 or comp_id=523)
			</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date DESC 
		</cfif> </CFQUERY>  
		
		

		
		
		
		<!--- <CFIF '#update#' EQ 'yes'>

				<CFQUERY datasource="#request.dsn#">
				UPDATE title
				SET  appraisal_status = '#appraisal_status#',
					comments = '#comments#'
				WHERE prop_id = #prop_id#
				</CFQUERY>

		</cfif> --->
		<CFSET r_count = #read_report.recordcount#>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>



</head>

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
		
	
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=navy>
	<tr>
		<td width=820 align=center valign=top>
<cfoutput><font color = white><b>
		<CFIF IsDefined("form.confirm_mon")><cfif #confirm_mon# NEQ "Month">
	From #confirm_mon#/
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day")><cfif #comfirm_day# NEQ "Day">
#comfirm_day#
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year")><cfif #confirm_year# NEQ "Year">
/#confirm_year#
</cfif></CFIF>
		 <CFIF IsDefined("form.confirm_mon_to")><cfif #confirm_mon_to# NEQ "Month">
	TO #confirm_mon_to#/
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day_to")><cfif #comfirm_day_to# NEQ "Day">
/#comfirm_day_to#/
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year_to")><cfif #confirm_year_to# NEQ "Year">
/#confirm_year_to#,
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	#appraisal_status#,
</cfif></CFIF>		
<CFIF IsDefined("form.loan_amount")><cfif #loan_amount# NEQ "NONE">
	#loan_amount#,
</cfif></CFIF>
<CFIF IsDefined("form.title_id")><cfif #title_id# NEQ "NONE">
	#title_id#,
</cfif></CFIF>
<CFIF IsDefined("form.order_id")><cfif #order_id# NEQ "NONE">
	#order_id#,
</cfif></CFIF>
<CFIF IsDefined("form.prop_id")><cfif #prop_id# NEQ "NONE">
	#prop_id#,
</cfif></CFIF>
<CFIF IsDefined("form.company_id")><cfif #company_id# EQ "NONE">
	'ALL CLIENTS',
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	#buyer_fname#,
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	#buyer_lname#,
</cfif></CFIF></b></font>
</cfoutput>
	</td>
</tr></table>

<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=navy>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Appraisal Report Search</B></CENTER>
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
							APP-#app_id#
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

					
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
						
<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td> 

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#app_id#&a_trigger=0&company_id=#company_ID#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_navu_appraisal.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#app_id#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
	<cfelseif #a_trigger# eq 4>
		
		<!---- BEGIN MODIFY  ----->
<cfoutput>
	<CFIF IsDefined("form.confirm_mon")><cfif #confirm_mon# NEQ "Month">
	<CFSET confirm_mon = #confirm_mon#>
</cfif></CFIF>
<CFIF IsDefined("form.state")><cfif #state# NEQ "none">
	<CFSET state = #state#>
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
		<CFIF IsDefined("form.comments")><cfif #comments# NEQ "NONE">
	<CFSET comments = #comments#>
</cfif></CFIF>
<CFIF IsDefined("form.events")><cfif #events# NEQ "NONE">
	<CFSET events = #events#>
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	<CFSET status = #appraisal_status#>
</cfif></CFIF>
		
<CFIF IsDefined("form.loan_number")><cfif #loan_number# NEQ "">
	<CFSET loan_number = #loan_number#>
</cfif></CFIF>	
<CFIF IsDefined("form.anc_id")><cfif #anc_id# NEQ "NONE">
	<CFSET anc_id = #anc_id#>
</cfif></CFIF>
<CFIF IsDefined("form.order_id")><cfif #order_id# NEQ "NONE">
	<CFSET order_id = #order_id#>
</cfif></CFIF>
<CFIF IsDefined("form.abstract_id")><cfif #abstract_id# NEQ "NONE">
	<CFSET abstract_id = #abstract_id#>
</cfif></CFIF>
<CFIF IsDefined("form.abstract_file")><cfif #abstract_file# NEQ "NONE">
	<CFSET abstract_file = #abstract_file#>
</cfif></CFIF>
<CFIF IsDefined("form.icl_file")><cfif #icl_file# NEQ "NONE">
	<CFSET icl_file = #icl_file#>
</cfif></CFIF>
<CFIF IsDefined("form.closer_file")><cfif #closer_file# NEQ "NONE">
	<CFSET closer_file = #closer_file#>
</cfif></CFIF>
<CFIF IsDefined("form.company_id")><cfif #company_id# NEQ "NONE">
	<CFSET company_id = #company_id#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	<CFSET buyer_fname = #buyer_fname#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	<CFSET buyer_lname = #buyer_lname#>
</cfif></CFIF>

</cfoutput>
	

		
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM ancillary
			WHERE codeFlood is not null
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>

			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>
			
			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
			</CFIF>
				
				<CFIF #anc_id# NEQ "none">
				AND anc_id = '#anc_id#'
			</CFIF> 
			
			 
			 <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
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
and (comp_ID = 128 or comp_ID = 127 or comp_ID = 241 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 227  or comp_id = 397 or comp_ID = 366 or comp_ID = 359 or comp_ID = 231 or comp_ID = 232 or comp_ID = 251 or comp_ID = 252 or comp_ID = 209 or comp_ID = 205 or comp_ID = 174 or comp_ID = 178 or comp_ID = 141 	or comp_ID = 293 or comp_ID = 321 or comp_ID = 289 or comp_ID = 128 or comp_ID = 253 or comp_ID = 254)
</cfif>
<cfif #url.uid# eq "206"  or #url.uid# eq "208" or #url.uid# eq "193">
and (comp_ID = 100)
</cfif>
<cfif #url.uid# eq 203>
			and (comp_id=224 or comp_id=465 or comp_id=522 or comp_id=333 or comp_id=523)
			</cfif>
<cfif #url.uid# EQ "185">
and (comp_ID = 404 or comp_id = 408)
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date asc
		</cfif> </CFQUERY>  
		
		

		
		
		
		<!--- <CFIF '#update#' EQ 'yes'>

				<CFQUERY datasource="#request.dsn#">
				UPDATE title
				SET  appraisal_status = '#appraisal_status#',
					comments = '#comments#'
				WHERE prop_id = #prop_id#
				</CFQUERY>

		</cfif> --->
		<CFSET r_count = #read_report.recordcount#>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>



</head>

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
		
	
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=navy>
	<tr>
		<td width=820 align=center valign=top>
<cfoutput><font color = white><b>
		<CFIF IsDefined("form.confirm_mon")><cfif #confirm_mon# NEQ "Month">
	From #confirm_mon#/
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day")><cfif #comfirm_day# NEQ "Day">
#comfirm_day#
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year")><cfif #confirm_year# NEQ "Year">
/#confirm_year#
</cfif></CFIF>
		 <CFIF IsDefined("form.confirm_mon_to")><cfif #confirm_mon_to# NEQ "Month">
	TO #confirm_mon_to#/
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day_to")><cfif #comfirm_day_to# NEQ "Day">
/#comfirm_day_to#/
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year_to")><cfif #confirm_year_to# NEQ "Year">
/#confirm_year_to#,
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	#appraisal_status#,
</cfif></CFIF>		
<CFIF IsDefined("form.loan_amount")><cfif #loan_amount# NEQ "NONE">
	#loan_amount#,
</cfif></CFIF>
<CFIF IsDefined("form.title_id")><cfif #title_id# NEQ "NONE">
	#title_id#,
</cfif></CFIF>
<CFIF IsDefined("form.order_id")><cfif #order_id# NEQ "NONE">
	#order_id#,
</cfif></CFIF>
<CFIF IsDefined("form.prop_id")><cfif #prop_id# NEQ "NONE">
	#prop_id#,
</cfif></CFIF>
<CFIF IsDefined("form.company_id")><cfif #company_id# EQ "NONE">
	'ALL CLIENTS',
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	#buyer_fname#,
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	#buyer_lname#,
</cfif></CFIF></b></font>
</cfoutput>
	</td>
</tr></table>

<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=black>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Flood Report Search</B></CENTER>
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
							<cfif #codeFlood# neq "">F</cfif>-#anc_id#
					
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

						<!--- --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
					<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td> 	


	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav_sn.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&a_trigger=0&company_id=#company_ID#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_navu_credit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
	
	<cfelseif #a_trigger# eq 9>
		
		<!---- BEGIN MODIFY  ----->
<cfoutput>
		<CFIF IsDefined("form.confirm_mon")><cfif #confirm_mon# NEQ "Month">
	<CFSET confirm_mon = #confirm_mon#>
</cfif></CFIF>
<CFIF IsDefined("form.state")><cfif #state# NEQ "none">
	<CFSET state = #state#>
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
<CFIF IsDefined("form.events")><cfif #events# NEQ "NONE">
	<CFSET events = #events#>
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	<CFSET status = #appraisal_status#>
</cfif></CFIF>
		
<CFIF IsDefined("form.loan_number")><cfif #loan_number# NEQ "">
	<CFSET loan_number = #loan_number#>
</cfif></CFIF>	
<CFIF IsDefined("form.avm_id")><cfif #avm_id# NEQ "NONE">
	<CFSET avm_id = #avm_id#>
</cfif></CFIF>
<CFIF IsDefined("form.order_id")><cfif #order_id# NEQ "NONE">
	<CFSET order_id = #order_id#>
</cfif></CFIF>
<CFIF IsDefined("form.abstract_id")><cfif #abstract_id# NEQ "NONE">
	<CFSET abstract_id = #abstract_id#>
</cfif></CFIF>
<CFIF IsDefined("form.abstract_file")><cfif #abstract_file# NEQ "NONE">
	<CFSET abstract_file = #abstract_file#>
</cfif></CFIF>
<CFIF IsDefined("form.icl_file")><cfif #icl_file# NEQ "NONE">
	<CFSET icl_file = #icl_file#>
</cfif></CFIF>
<CFIF IsDefined("form.closer_file")><cfif #closer_file# NEQ "NONE">
	<CFSET closer_file = #closer_file#>
</cfif></CFIF>
<CFIF IsDefined("form.company_id")><cfif #company_id# NEQ "NONE">
	<CFSET company_id = #company_id#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	<CFSET buyer_fname = #buyer_fname#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	<CFSET buyer_lname = #buyer_lname#>
</cfif></CFIF>

</cfoutput>
	

		
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM ancillary
			WHERE codeAVM is not null
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>

			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>
		
		
			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
			</CFIF>
				
				<CFIF #avm_id# NEQ "none">
				AND anc_id = '#avm_id#'
			</CFIF> 
			
			 
			 <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
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
and (comp_ID = 128 or comp_ID = 127 or comp_ID = 241 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 227  or comp_id = 397 or comp_ID = 366 or comp_ID = 359 or comp_ID = 231 or comp_ID = 232 or comp_ID = 251 or comp_ID = 252 or comp_ID = 209 or comp_ID = 205 or comp_ID = 174 or comp_ID = 178 or comp_ID = 141 	or comp_ID = 293 or comp_ID = 321 or comp_ID = 289 or comp_ID = 128 or comp_ID = 253 or comp_ID = 254)
</cfif>
<cfif #url.uid# eq "206"  or #url.uid# eq "208" or #url.uid# eq "193">
and (comp_ID = 100)
</cfif>
<cfif #url.uid# eq 203>
			and (comp_id=224 or comp_id=465 or comp_id=522 or comp_id=333 or comp_id=523)
			</cfif>
<cfif #url.uid# EQ "185">
and (comp_ID = 404 or comp_id = 408)
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date asc 
		</cfif> </CFQUERY>  
		
		

		
		
		
		<!--- <CFIF '#update#' EQ 'yes'>

				<CFQUERY datasource="#request.dsn#">
				UPDATE title
				SET  appraisal_status = '#appraisal_status#',
					comments = '#comments#'
				WHERE prop_id = #prop_id#
				</CFQUERY>

		</cfif> --->
		<CFSET r_count = #read_report.recordcount#>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>



</head>

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
		
	
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=navy>
	<tr>
		<td width=820 align=center valign=top>
<cfoutput><font color = white><b>
		<CFIF IsDefined("form.confirm_mon")><cfif #confirm_mon# NEQ "Month">
	From #confirm_mon#/
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day")><cfif #comfirm_day# NEQ "Day">
#comfirm_day#
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year")><cfif #confirm_year# NEQ "Year">
/#confirm_year#
</cfif></CFIF>
		 <CFIF IsDefined("form.confirm_mon_to")><cfif #confirm_mon_to# NEQ "Month">
	TO #confirm_mon_to#/
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day_to")><cfif #comfirm_day_to# NEQ "Day">
/#comfirm_day_to#/
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year_to")><cfif #confirm_year_to# NEQ "Year">
/#confirm_year_to#,
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	#appraisal_status#,
</cfif></CFIF>		
<CFIF IsDefined("form.loan_amount")><cfif #loan_amount# NEQ "NONE">
	#loan_amount#,
</cfif></CFIF>
<CFIF IsDefined("form.title_id")><cfif #title_id# NEQ "NONE">
	#title_id#,
</cfif></CFIF>
<CFIF IsDefined("form.order_id")><cfif #order_id# NEQ "NONE">
	#order_id#,
</cfif></CFIF>
<CFIF IsDefined("form.prop_id")><cfif #prop_id# NEQ "NONE">
	#prop_id#,
</cfif></CFIF>
<CFIF IsDefined("form.company_id")><cfif #company_id# EQ "NONE">
	'ALL CLIENTS',
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	#buyer_fname#,
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	#buyer_lname#,
</cfif></CFIF></b></font>
</cfoutput>
	</td>
</tr></table>

<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=red>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>AVM Report Search</B></CENTER>
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
							<cfif #codeAVM# neq "">AVM</cfif>-#anc_id#
					
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

						<!--- --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
					<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td> 	


	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav_sn.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&a_trigger=0&company_id=#company_ID#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_navu_credit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
	
		<cfelseif #a_trigger# eq 8>
		
		<!---- BEGIN MODIFY  ----->
<cfoutput>
		<CFIF IsDefined("form.confirm_mon")><cfif #confirm_mon# NEQ "Month">
	<CFSET confirm_mon = #confirm_mon#>
</cfif></CFIF>
<CFIF IsDefined("form.state")><cfif #state# NEQ "none">
	<CFSET state = #state#>
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
<CFIF IsDefined("form.events")><cfif #events# NEQ "NONE">
	<CFSET events = #events#>
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	<CFSET status = #appraisal_status#>
</cfif></CFIF>
		
<CFIF IsDefined("form.loan_number")><cfif #loan_number# NEQ "">
	<CFSET loan_number = #loan_number#>
</cfif></CFIF>	
<CFIF IsDefined("form.cr_id")><cfif #cr_id# NEQ "NONE">
	<CFSET cr_id = #cr_id#>
</cfif></CFIF>
<CFIF IsDefined("form.order_id")><cfif #order_id# NEQ "NONE">
	<CFSET order_id = #order_id#>
</cfif></CFIF>
<CFIF IsDefined("form.abstract_id")><cfif #abstract_id# NEQ "NONE">
	<CFSET abstract_id = #abstract_id#>
</cfif></CFIF>
<CFIF IsDefined("form.abstract_file")><cfif #abstract_file# NEQ "NONE">
	<CFSET abstract_file = #abstract_file#>
</cfif></CFIF>
<CFIF IsDefined("form.icl_file")><cfif #icl_file# NEQ "NONE">
	<CFSET icl_file = #icl_file#>
</cfif></CFIF>
<CFIF IsDefined("form.closer_file")><cfif #closer_file# NEQ "NONE">
	<CFSET closer_file = #closer_file#>
</cfif></CFIF>
<CFIF IsDefined("form.company_id")><cfif #company_id# NEQ "NONE">
	<CFSET company_id = #company_id#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	<CFSET buyer_fname = #buyer_fname#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	<CFSET buyer_lname = #buyer_lname#>
</cfif></CFIF>

</cfoutput>
	

		
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM ancillary
			WHERE codeCR is not null
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>
 
			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>

		
			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
			</CFIF>
				
				<CFIF #cr_id# NEQ "none">
				AND anc_id = '#cr_id#'
			</CFIF> 
			
			 
			 <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
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
and (comp_ID = 128 or comp_ID = 127 or comp_ID = 241 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 227 or comp_id = 397  or comp_ID = 366 or comp_ID = 359 or comp_ID = 231 or comp_ID = 232 or comp_ID = 251 or comp_ID = 252 or comp_ID = 209 or comp_ID = 205 or comp_ID = 174 or comp_ID = 178 or comp_ID = 141 	or comp_ID = 293 or comp_ID = 321 or comp_ID = 289 or comp_ID = 128 or comp_ID = 253 or comp_ID = 254)
</cfif><cfif #url.uid# eq "206" or #url.uid# eq "208" or #url.uid# eq "193">
and (comp_ID = 100)
</cfif>
<cfif #url.uid# eq 203>
			and (comp_id=224 or comp_id=465 or comp_id=522 or comp_id=333 or comp_id=523)
			</cfif>
<cfif #url.uid# EQ "185">
and (comp_ID = 404 or comp_id = 408)
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY check_date DESC 
		</cfif> </CFQUERY>  
		
		

		
		
		
		<!--- <CFIF '#update#' EQ 'yes'>

				<CFQUERY datasource="#request.dsn#">
				UPDATE title
				SET  appraisal_status = '#appraisal_status#',
					comments = '#comments#'
				WHERE prop_id = #prop_id#
				</CFQUERY>

		</cfif> --->
		<CFSET r_count = #read_report.recordcount#>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>



</head>

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
		
	
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=navy>
	<tr>
		<td width=820 align=center valign=top>
<cfoutput><font color = white><b>
		<CFIF IsDefined("form.confirm_mon")><cfif #confirm_mon# NEQ "Month">
	From #confirm_mon#/
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day")><cfif #comfirm_day# NEQ "Day">
#comfirm_day#
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year")><cfif #confirm_year# NEQ "Year">
/#confirm_year#
</cfif></CFIF>
		 <CFIF IsDefined("form.confirm_mon_to")><cfif #confirm_mon_to# NEQ "Month">
	TO #confirm_mon_to#/
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day_to")><cfif #comfirm_day_to# NEQ "Day">
/#comfirm_day_to#/
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year_to")><cfif #confirm_year_to# NEQ "Year">
/#confirm_year_to#,
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	#appraisal_status#,
</cfif></CFIF>		
<CFIF IsDefined("form.loan_amount")><cfif #loan_amount# NEQ "NONE">
	#loan_amount#,
</cfif></CFIF>
<CFIF IsDefined("form.title_id")><cfif #title_id# NEQ "NONE">
	#title_id#,
</cfif></CFIF>
<CFIF IsDefined("form.order_id")><cfif #order_id# NEQ "NONE">
	#order_id#,
</cfif></CFIF>
<CFIF IsDefined("form.prop_id")><cfif #prop_id# NEQ "NONE">
	#prop_id#,
</cfif></CFIF>
<CFIF IsDefined("form.company_id")><cfif #company_id# EQ "NONE">
	'ALL CLIENTS',
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	#buyer_fname#,
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	#buyer_lname#,
</cfif></CFIF></b></font>
</cfoutput>
	</td>
</tr></table>

<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=brown>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Credit Report Search</B></CENTER>
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
							<cfif #codeCR# neq "">CR</cfif>-#anc_id#
					
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

						<!--- --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
					<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td> 	


	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav_sn.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&a_trigger=0&company_id=#company_ID#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_navu_credit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
	
			<cfelseif #a_trigger# eq 7>
		
		<!---- BEGIN MODIFY  ----->
<cfoutput>
<CFIF IsDefined("form.confirm_mon")><cfif #confirm_mon# NEQ "Month">
	<CFSET confirm_mon = #confirm_mon#>
</cfif></CFIF>
<CFIF IsDefined("form.state")><cfif #state# NEQ "none">
	<CFSET state = #state#>
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
		<CFIF IsDefined("form.comments")><cfif #comments# NEQ "NONE">
	<CFSET comments = #comments#>
</cfif></CFIF>
<CFIF IsDefined("form.events")><cfif #events# NEQ "NONE">
	<CFSET events = #events#>
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	<CFSET status = #appraisal_status#>
</cfif></CFIF>
		
<CFIF IsDefined("form.loan_number")><cfif #loan_number# NEQ "">
	<CFSET loan_number = #loan_number#>
</cfif></CFIF>	
<CFIF IsDefined("form.sn_id")><cfif #sn_id# NEQ "NONE">
	<CFSET sn_id = #sn_id#>
</cfif></CFIF>
<CFIF IsDefined("form.order_id")><cfif #order_id# NEQ "NONE">
	<CFSET order_id = #order_id#>
</cfif></CFIF>
<CFIF IsDefined("form.abstract_id")><cfif #abstract_id# NEQ "NONE">
	<CFSET abstract_id = #abstract_id#>
</cfif></CFIF>
<CFIF IsDefined("form.abstract_file")><cfif #abstract_file# NEQ "NONE">
	<CFSET abstract_file = #abstract_file#>
</cfif></CFIF>
<CFIF IsDefined("form.icl_file")><cfif #icl_file# NEQ "NONE">
	<CFSET icl_file = #icl_file#>
</cfif></CFIF>
<CFIF IsDefined("form.closer_file")><cfif #closer_file# NEQ "NONE">
	<CFSET closer_file = #closer_file#>
</cfif></CFIF>
<CFIF IsDefined("form.company_id")><cfif #company_id# NEQ "NONE">
	<CFSET company_id = #company_id#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	<CFSET buyer_fname = #buyer_fname#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	<CFSET buyer_lname = #buyer_lname#>
</cfif></CFIF>

</cfoutput>
	

		
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM ancillary
			WHERE codeSigning is not null
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>
 
			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>
	
		
			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
			</CFIF>
				
				<CFIF #sn_id# NEQ "none">
				AND anc_id = '#sn_id#'
			</CFIF> 
			
			 
			 <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
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
and (comp_ID = 128 or comp_ID = 127 or comp_ID = 241 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 227  or comp_id = 397 or comp_ID = 366 or comp_ID = 359 or comp_ID = 231 or comp_ID = 232 or comp_ID = 251 or comp_ID = 252 or comp_ID = 209 or comp_ID = 205 or comp_ID = 174 or comp_ID = 178 or comp_ID = 141 	or comp_ID = 293 or comp_ID = 321 or comp_ID = 289 or comp_ID = 128 or comp_ID = 253 or comp_ID = 254)
</cfif><cfif #url.uid# eq "206" or #url.uid# eq "208" or #url.uid# eq "193">
and (comp_ID = 100)
</cfif>
<cfif #url.uid# eq 203>
			and (comp_id=224 or comp_id=465 or comp_id=522 or comp_id=333 or comp_id=523)
			</cfif>
<cfif #url.uid# EQ "185">
and (comp_ID = 404 or comp_id = 408)
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date asc 
		</cfif> </CFQUERY>  
		
		

		
		
		
		<!--- <CFIF '#update#' EQ 'yes'>

				<CFQUERY datasource="#request.dsn#">
				UPDATE title
				SET  appraisal_status = '#appraisal_status#',
					comments = '#comments#'
				WHERE prop_id = #prop_id#
				</CFQUERY>

		</cfif> --->
		<CFSET r_count = #read_report.recordcount#>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>



</head>

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
		
	
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=navy>
	<tr>
		<td width=820 align=center valign=top>
<cfoutput><font color = white><b>
		<CFIF IsDefined("form.confirm_mon")><cfif #confirm_mon# NEQ "Month">
	From #confirm_mon#/
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day")><cfif #comfirm_day# NEQ "Day">
#comfirm_day#
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year")><cfif #confirm_year# NEQ "Year">
/#confirm_year#
</cfif></CFIF>
		 <CFIF IsDefined("form.confirm_mon_to")><cfif #confirm_mon_to# NEQ "Month">
	TO #confirm_mon_to#/
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day_to")><cfif #comfirm_day_to# NEQ "Day">
/#comfirm_day_to#/
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year_to")><cfif #confirm_year_to# NEQ "Year">
/#confirm_year_to#,
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	#appraisal_status#,
</cfif></CFIF>		
<CFIF IsDefined("form.loan_amount")><cfif #loan_amount# NEQ "NONE">
	#loan_amount#,
</cfif></CFIF>
<CFIF IsDefined("form.title_id")><cfif #title_id# NEQ "NONE">
	#title_id#,
</cfif></CFIF>
<CFIF IsDefined("form.order_id")><cfif #order_id# NEQ "NONE">
	#order_id#,
</cfif></CFIF>
<CFIF IsDefined("form.prop_id")><cfif #prop_id# NEQ "NONE">
	#prop_id#,
</cfif></CFIF>
<CFIF IsDefined("form.company_id")><cfif #company_id# EQ "NONE">
	'ALL CLIENTS',
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	#buyer_fname#,
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	#buyer_lname#,
</cfif></CFIF></b></font>
</cfoutput>
	</td>
</tr></table>

<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=orange>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Signing Report Search</B></CENTER>
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
	
	
			 
			 
			 <CFLOOP QUERY="read_report" >
		
			
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
							<cfif #codeSigning# neq "">SN</cfif>-#anc_id#
					
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

						<!--- --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
					<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td> 	


	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav_sn.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&a_trigger=0&company_id=#company_ID#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_navu_credit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
	
	<cfoutput>
		<CFIF IsDefined("form.confirm_mon")><cfif #confirm_mon# NEQ "Month">
	<CFSET confirm_mon = #confirm_mon#>
</cfif></CFIF>
<CFIF IsDefined("form.state")><cfif #state# NEQ "none">
	<CFSET state = #state#>
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
		<CFIF IsDefined("form.comments")><cfif #comments# NEQ "NONE">
	<CFSET comments = #comments#>
</cfif></CFIF>
<CFIF IsDefined("form.events")><cfif #events# NEQ "NONE">
	<CFSET events = #events#>
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
<CFIF IsDefined("form.prop_id")><cfif #prop_id# NEQ "NONE">
	<CFSET title_id = #title_id#>
</cfif></CFIF>
<CFIF IsDefined("form.title_id")><cfif #prop_id# NEQ "NONE">
	<CFSET prop_id = #prop_id#>
</cfif></CFIF>
<CFIF IsDefined("form.app_id")><cfif #app_id# NEQ "NONE">
	<CFSET app_id = #app_id#>
</cfif></CFIF>
<CFIF IsDefined("form.anc_id")><cfif #anc_id# NEQ "NONE">
	<CFSET anc_id = #anc_id#>
</cfif></CFIF>
<CFIF IsDefined("form.cr_id")><cfif #cr_id# NEQ "NONE">
	<CFSET cr_id = #cr_id#>
</cfif></CFIF>
<CFIF IsDefined("form.avm_id")><cfif #avm_id# NEQ "NONE">
	<CFSET avm_id = #avm_id#>
</cfif></CFIF>
<CFIF IsDefined("form.sn_id")><cfif #sn_id# NEQ "NONE">
	<CFSET sn_id = #sn_id#>
</cfif></CFIF>
<CFIF IsDefined("form.order_id")><cfif #order_id# NEQ "NONE">
	<CFSET order_id = #order_id#>
</cfif></CFIF>
<CFIF IsDefined("form.abstract_id")><cfif #abstract_id# NEQ "NONE">
	<CFSET abstract_id = #abstract_id#>
</cfif></CFIF>
<CFIF IsDefined("form.abstract_file")><cfif #abstract_file# NEQ "NONE">
	<CFSET abstract_file = #abstract_file#>
</cfif></CFIF>
<CFIF IsDefined("form.icl_file")><cfif #icl_file# NEQ "NONE">
	<CFSET icl_file = #icl_file#>
</cfif></CFIF>
<CFIF IsDefined("form.closer_file")><cfif #closer_file# NEQ "NONE">
	<CFSET closer_file = #closer_file#>
</cfif></CFIF>
<CFIF IsDefined("form.company_id")><cfif #company_id# NEQ "NONE">
	<CFSET company_id = #company_id#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	<CFSET buyer_fname = #buyer_fname#>
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	<CFSET buyer_lname = #buyer_lname#>
</cfif></CFIF>

</cfoutput>
	

		
		
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>



</head>

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
		
	
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=navy>
	<tr>
		<td width=820 align=center valign=top>
<cfoutput><font color = white><b>
		<CFIF IsDefined("form.confirm_mon")><cfif #confirm_mon# NEQ "Month">
	From #confirm_mon#/
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day")><cfif #comfirm_day# NEQ "Day">
#comfirm_day#
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year")><cfif #confirm_year# NEQ "Year">
/#confirm_year#
</cfif></CFIF>
		 <CFIF IsDefined("form.confirm_mon_to")><cfif #confirm_mon_to# NEQ "Month">
	TO #confirm_mon_to#/
</cfif></CFIF>
<CFIF IsDefined("form.comfirm_day_to")><cfif #comfirm_day_to# NEQ "Day">
/#comfirm_day_to#/
</cfif></CFIF>
<CFIF IsDefined("form.confirm_year_to")><cfif #confirm_year_to# NEQ "Year">
/#confirm_year_to#,
</cfif></CFIF>
<CFIF IsDefined("form.appraisal_status")><cfif #appraisal_status# NEQ "NONE">
	#appraisal_status#,
</cfif></CFIF>		
<CFIF IsDefined("form.loan_amount")><cfif #loan_amount# NEQ "NONE">
	#loan_amount#,
</cfif></CFIF>
<CFIF IsDefined("form.title_id")><cfif #title_id# NEQ "NONE">
	#title_id#,
</cfif></CFIF>
<CFIF IsDefined("form.order_id")><cfif #order_id# NEQ "NONE">
	#order_id#,
</cfif></CFIF>
<CFIF IsDefined("form.prop_id")><cfif #prop_id# NEQ "NONE">
	#prop_id#,
</cfif></CFIF>
<CFIF IsDefined("form.company_id")><cfif #company_id# EQ "NONE">
	'ALL CLIENTS',
</cfif></CFIF>
<CFIF IsDefined("form.buyer_fname")><cfif #Trim(buyer_fname)# is not "">
	#buyer_fname#,
</cfif></CFIF>
<CFIF IsDefined("form.buyer_lname")><cfif #Trim(buyer_lname)# is not "">
	#buyer_lname#,
</cfif></CFIF></b></font>
</cfoutput>
	</td>
</tr></table>

<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=gray>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Product Report Search</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=820 align=left valign=top bgcolor=e1e1e1>
		
		
		<cfif #company_id# eq "none">
 <CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM Title 
			WHERE cancelled is null
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>

			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>

		<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
			</CFIF>
		
			
			 
			 <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
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
and (comp_ID = 128 or comp_ID = 127 or comp_ID = 241 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 227  or comp_id = 397 or comp_ID = 366 or comp_ID = 359 or comp_ID = 231 or comp_ID = 232 or comp_ID = 251 or comp_ID = 252 or comp_ID = 209 or comp_ID = 205 or comp_ID = 174 or comp_ID = 178 or comp_ID = 141 	or comp_ID = 293 or comp_ID = 321 or comp_ID = 289 or comp_ID = 128 or comp_ID = 253 or comp_ID = 254)
</cfif>
<cfif #url.uid# eq "206"  or #url.uid# eq "208" or #url.uid# eq "193">
and (comp_ID = 100)
</cfif>
<cfif #url.uid# eq 203>
			and (comp_id=224 or comp_id=465 or comp_id=522 or comp_id=333 or comp_id=523)
			</cfif>
<cfif #url.uid# EQ "185">
and (comp_ID = 404 or comp_id = 408)
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date asc
		</cfif> </CFQUERY>  
	
		<CFQUERY datasource="#request.dsn#" NAME="read_prop">
		
			SELECT *
			FROM property
			WHERE 0 = 0
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>
 
			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>
	
		
			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
			</CFIF>
			
			 
			 <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
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
and (comp_ID = 128 or comp_ID = 127 or comp_ID = 241 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 227  or comp_id = 397 or comp_ID = 366 or comp_ID = 359 or comp_ID = 231 or comp_ID = 232 or comp_ID = 251 or comp_ID = 252 or comp_ID = 209 or comp_ID = 205 or comp_ID = 174 or comp_ID = 178 or comp_ID = 141 	or comp_ID = 293 or comp_ID = 321 or comp_ID = 289 or comp_ID = 128 or comp_ID = 253 or comp_ID = 254)
</cfif><cfif #url.uid# eq "206" or #url.uid# eq "208" or #url.uid# eq "193">
and (comp_ID = 100)
</cfif>
<cfif #url.uid# eq 203>
			and (comp_id=224 or comp_id=465 or comp_id=522 or comp_id=333 or comp_id=523)
			</cfif>
<cfif #url.uid# EQ "185">
and (comp_ID = 404 or comp_id = 408)
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date asc 
		</cfif> </CFQUERY>  
	
		<CFQUERY datasource="#request.dsn#" NAME="read_app">
		
			SELECT *
			FROM appraisal
			WHERE 0 = 0
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>

			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>
	
		
			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
			</CFIF>
				
			
			 <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
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
and (comp_ID = 128 or comp_ID = 127 or comp_ID = 241 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 227  or comp_id = 397 or comp_ID = 366 or comp_ID = 359 or comp_ID = 231 or comp_ID = 232 or comp_ID = 251 or comp_ID = 252 or comp_ID = 209 or comp_ID = 205 or comp_ID = 174 or comp_ID = 178 or comp_ID = 141 	or comp_ID = 293 or comp_ID = 321 or comp_ID = 289 or comp_ID = 128 or comp_ID = 253 or comp_ID = 254)
</cfif><cfif #url.uid# eq "206" or #url.uid# eq "208" or #url.uid# eq "193">
and (comp_ID = 100)
</cfif>
<cfif #url.uid# eq 203>
			and (comp_id=224 or comp_id=465 or comp_id=522 or comp_id=333 or comp_id=523)
			</cfif>
<cfif #url.uid# EQ "185">
and (comp_ID = 404 or comp_id = 408)
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date asc 
		</cfif> </CFQUERY>  
	

		<CFQUERY datasource="#request.dsn#" NAME="read_anc">
		
			SELECT *
			FROM ancillary
			WHERE codeFlood is not null
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>
 
			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>

		
			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
			</CFIF>
			
			
			 
			 <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
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
and (comp_ID = 128 or comp_ID = 127 or comp_ID = 241 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 227 or comp_id = 397 or comp_ID = 366 or comp_ID = 359 or comp_ID = 231 or comp_ID = 232 or comp_ID = 251 or comp_ID = 252 or comp_ID = 209 or comp_ID = 205 or comp_ID = 174 or comp_ID = 178 or comp_ID = 141 	or comp_ID = 293 or comp_ID = 321 or comp_ID = 289 or comp_ID = 128 or comp_ID = 253 or comp_ID = 254)
</cfif><cfif #url.uid# eq "206" or #url.uid# eq "208" or #url.uid# eq "193">
and (comp_ID = 100)
</cfif>
<cfif #url.uid# eq 203>
			and (comp_id=224 or comp_id=465 or comp_id=522 or comp_id=333 or comp_id=523)
			</cfif>
<cfif #url.uid# EQ "185">
and (comp_ID = 404 or comp_id = 408 )
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date asc 
		</cfif> </CFQUERY>  
		
		<CFQUERY datasource="#request.dsn#" NAME="read_cr">
		
			SELECT *
			FROM ancillary
			WHERE codeCR is not null
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>

			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>

		
			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
			</CFIF>
			
			
			 
			 <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
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
and (comp_ID = 128 or comp_ID = 127 or comp_ID = 241 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 227  or comp_id = 397 or comp_ID = 366 or comp_ID = 359 or comp_ID = 231 or comp_ID = 232 or comp_ID = 251 or comp_ID = 252 or comp_ID = 209 or comp_ID = 205 or comp_ID = 174 or comp_ID = 178 or comp_ID = 141 	or comp_ID = 293 or comp_ID = 321 or comp_ID = 289 or comp_ID = 128 or comp_ID = 253 or comp_ID = 254)
</cfif><cfif #url.uid# eq "206"  or #url.uid# eq "208" or #url.uid# eq "193">
and (comp_ID = 100)
</cfif>
<cfif #url.uid# eq 203>
			and (comp_id=224 or comp_id=465 or comp_id=522 or comp_id=333 or comp_id=523)
			</cfif>
<cfif #url.uid# EQ "185">
and (comp_ID = 404 or comp_id = 408)
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date asc 
		</cfif> </CFQUERY>  
		
	<CFQUERY datasource="#request.dsn#" NAME="read_avm">
		
			SELECT *
			FROM ancillary
			WHERE codeAVM is not null
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>

			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>

		
			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
			</CFIF>
			
			
			 
			 <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
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
and (comp_ID = 128 or comp_ID = 127 or comp_ID = 241 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 227  or comp_id = 397 or comp_ID = 366 or comp_ID = 359 or comp_ID = 231 or comp_ID = 232 or comp_ID = 251 or comp_ID = 252 or comp_ID = 209 or comp_ID = 205 or comp_ID = 174 or comp_ID = 178 or comp_ID = 141 	or comp_ID = 293 or comp_ID = 321 or comp_ID = 289 or comp_ID = 128 or comp_ID = 253 or comp_ID = 254)
</cfif><cfif #url.uid# eq "206" or #url.uid# eq "208" or #url.uid# eq "193">
and (comp_ID = 100)
</cfif>
<cfif #url.uid# eq 203>
			and (comp_id=224 or comp_id=465 or comp_id=522 or comp_id=333 or comp_id=523)
			</cfif>
<cfif #url.uid# EQ "185">
and (comp_ID = 404 or comp_id = 408)
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date asc 
		</cfif> </CFQUERY>   
		
		<CFQUERY datasource="#request.dsn#" NAME="read_sn">
		
			SELECT *
			FROM ancillary
			WHERE codeSigning is not null
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>
 
			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>
			
		
			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
			</CFIF>
			
			
			 
			 <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
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
and (comp_ID = 128 or comp_ID = 127 or comp_ID = 241 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 227 or comp_id = 397 or comp_ID = 366 or comp_ID = 359 or comp_ID = 231 or comp_ID = 232 or comp_ID = 251 or comp_ID = 252 or comp_ID = 209 or comp_ID = 205 or comp_ID = 174 or comp_ID = 178 or comp_ID = 141 	or comp_ID = 293 or comp_ID = 321 or comp_ID = 289 or comp_ID = 128 or comp_ID = 253 or comp_ID = 254)
</cfif><cfif #url.uid# eq "206" or #url.uid# eq "208" or #url.uid# eq "193">
and (comp_ID = 100)
</cfif>
<cfif #url.uid# eq 203>
			and (comp_id=224 or comp_id=465 or comp_id=522 or comp_id=333 or comp_id=523)
			</cfif>
<cfif #url.uid# EQ "185">
and (comp_ID = 404 or comp_id = 408 )
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date asc 
		</cfif> </CFQUERY>  
<CFQUERY datasource="#request.dsn#" NAME="read_closing">
		
SELECT *
FROM Title C, Title_Closing_Order_Request O 
WHERE C.title_id = O.title_id AND O.a_Req_closing_month IS NOT NULL and c.cancelled is null
			
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>
  
			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>
	
		
			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
			</CFIF>
				 
			 <CFIF #company_id# NEQ "none">
				AND comp_id = '#company_id#'
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
and (comp_ID = 128 or comp_ID = 127 or comp_ID = 241 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 227 or comp_id = 397 or comp_ID = 366 or comp_ID = 359 or comp_ID = 231 or comp_ID = 232 or comp_ID = 251 or comp_ID = 252 or comp_ID = 209 or comp_ID = 205 or comp_ID = 174 or comp_ID = 178 or comp_ID = 141 	or comp_ID = 293 or comp_ID = 321 or comp_ID = 289 or comp_ID = 128 or comp_ID = 253 or comp_ID = 254)
</cfif><cfif #url.uid# eq "206" or #url.uid# eq "208" or #url.uid# eq "193">
and (comp_ID = 100)
</cfif>
<cfif #url.uid# eq 203>
			and (comp_id=224 or comp_id=465 or comp_id=522 or comp_id=333 or comp_id=523)
			</cfif>
<cfif #url.uid# EQ "185">
and (comp_ID = 404 or comp_id = 408 )
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date asc
		</cfif> </CFQUERY>  
	
	
	<CFSET r_count = #read_closing.recordcount# + #read_report.recordcount# + #read_prop.recordcount# + #read_app.recordcount# + #read_anc.recordcount# + #read_avm.recordcount# + #read_cr.recordcount# + #read_sn.recordcount#>
	
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
							Company
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
							#bFirstName1# #bLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_company.company#
						</td>			

						<!--- --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
					<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td> 	


	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=0&company_id=#company_ID#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
	
	 <CFLOOP QUERY="read_prop">
		
			
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
							P-#prop_id#
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
<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td> 

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&a_trigger=0&company_id=#company_ID#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./prop_report_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
			</CFOUTPUT>	</CFLOOP>
	 <CFLOOP QUERY="read_app">
		
			
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
							APP-#app_id#
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
<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td> 

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#app_id#&a_trigger=0&company_id=#company_ID#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_navu_appraisal.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#app_id#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
			</CFOUTPUT>	</CFLOOP> 
	

			
	 <CFLOOP QUERY="read_anc">
		
			
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
							<cfif #codeFlood# neq "">F</cfif>-#anc_id#
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
						
<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td> 

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav_sn.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&a_trigger=0&company_id=#company_ID#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_navu_credit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
			</CFOUTPUT>	</CFLOOP> 
			
			
			 <CFLOOP QUERY="read_cr">
		
			
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
							<cfif #codeCR# neq "">CR</cfif>-#anc_id#
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
						
<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td> 

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav_sn.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&a_trigger=0&company_id=#company_ID#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_navu_credit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
			</CFOUTPUT>	</CFLOOP> 
			
			 <CFLOOP QUERY="read_avm">
		
			
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
							<cfif #codeAVM# neq "">AVM</cfif>-#anc_id#
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
						
<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td> 

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav_sn.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&a_trigger=0&company_id=#company_ID#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_navu_credit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
			</CFOUTPUT>	</CFLOOP> 
			
			 <CFLOOP QUERY="read_sn">
		
			
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
							<cfif #codeSigning# neq "">SN</cfif>-#anc_id#
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
						
<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td> 

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav_sn.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&a_trigger=0&company_id=#company_ID#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_navu_credit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
			</CFOUTPUT>	</CFLOOP> 
			
			<CFLOOP QUERY="read_closing">
		
			
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
							C-#title_id#
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
<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td> 

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=0&company_id=#company_ID#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_closing_admin_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
			</CFOUTPUT>	</CFLOOP>
			
			
				</table>



			</TD>
		</TR>

	</table>
<cfelse>



	
	
<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<!--- <CFIF #r_count# NEQ "0"> --->


<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				<!--- The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				 ---></CENTER>
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
							Company
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
	
		<CFSET zip_id_2 = #ListToArray(company_id, ",")#>
<CFSET cty_name_1 = ArrayNew(1)>

<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

			<CFSET cty_name_1[MMM] = #st_temp[1]#>		
		
		
		</CFLOOP>

<CFLOOP FROM="1" TO="#ArrayLen(cty_name_1)#" INDEX="TTT">

 <CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM Title 
			WHERE comp_id = '#cty_name_1[TTT]#' and cancelled is null
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>

			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>

		<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
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
and (comp_ID = 128 or comp_ID = 127 or comp_ID = 241 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 227  or comp_id = 397 or comp_ID = 366 or comp_ID = 359 or comp_ID = 231 or comp_ID = 232 or comp_ID = 251 or comp_ID = 252 or comp_ID = 209 or comp_ID = 205 or comp_ID = 174 or comp_ID = 178 or comp_ID = 141 	or comp_ID = 293 or comp_ID = 321 or comp_ID = 289 or comp_ID = 128 or comp_ID = 253 or comp_ID = 254)
</cfif>
<cfif #url.uid# EQ "185">
and (comp_ID = 404 or comp_id = 408)
</cfif>
<cfif #url.uid# eq "206"  or #url.uid# eq "208" or #url.uid# eq "193">
and (comp_ID = 100)
</cfif>
<cfif #url.uid# eq 203>
			and (comp_id=224 or comp_id=465 or comp_id=522 or comp_id=333 or comp_id=523)
			</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date asc 
		</cfif> </CFQUERY>  
	
		<CFQUERY datasource="#request.dsn#" NAME="read_prop">
		
			SELECT *
			FROM property
			WHERE comp_id = '#cty_name_1[TTT]#'
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>
 
			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>
	
		
			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
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
and (comp_ID = 128 or comp_ID = 127 or comp_ID = 241 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 227  or comp_id = 397 or comp_ID = 366 or comp_ID = 359 or comp_ID = 231 or comp_ID = 232 or comp_ID = 251 or comp_ID = 252 or comp_ID = 209 or comp_ID = 205 or comp_ID = 174 or comp_ID = 178 or comp_ID = 141 	or comp_ID = 293 or comp_ID = 321 or comp_ID = 289 or comp_ID = 128 or comp_ID = 253 or comp_ID = 254)
</cfif><cfif #url.uid# eq "206"  or #url.uid# eq "208" or #url.uid# eq "193">
and (comp_ID = 100)
</cfif>
<cfif #url.uid# eq 203>
			and (comp_id=224 or comp_id=465 or comp_id=522 or comp_id=333 or comp_id=523)
			</cfif>
<cfif #url.uid# EQ "185">
and (comp_ID = 404 or comp_id = 408)
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  
	
		<CFQUERY datasource="#request.dsn#" NAME="read_app">
		
			SELECT *
			FROM appraisal
			WHERE comp_id = '#cty_name_1[TTT]#'
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>

			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>
	
		
			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
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
and (comp_ID = 128 or comp_ID = 127 or comp_ID = 241 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 227  or comp_id = 397 or comp_ID = 366 or comp_ID = 359 or comp_ID = 231 or comp_ID = 232 or comp_ID = 251 or comp_ID = 252 or comp_ID = 209 or comp_ID = 205 or comp_ID = 174 or comp_ID = 178 or comp_ID = 141 	or comp_ID = 293 or comp_ID = 321 or comp_ID = 289 or comp_ID = 128 or comp_ID = 253 or comp_ID = 254)
</cfif><cfif #url.uid# eq "206"  or #url.uid# eq "208" or #url.uid# eq "193">
and (comp_ID = 100)
</cfif>
<cfif #url.uid# eq 203>
			and (comp_id=224 or comp_id=465 or comp_id=522 or comp_id=333 or comp_id=523)
			</cfif>
<cfif #url.uid# EQ "185">
and (comp_ID = 404 or comp_id = 408)
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  
	

		<CFQUERY datasource="#request.dsn#" NAME="read_anc">
		
			SELECT *
			FROM ancillary
			WHERE codeFlood is not null and comp_id = '#cty_name_1[TTT]#'
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>
 
			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>

		
			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
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
and (comp_ID = 128 or comp_ID = 127 or comp_ID = 241 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 227  or comp_id = 397 or comp_ID = 366 or comp_ID = 359 or comp_ID = 231 or comp_ID = 232 or comp_ID = 251 or comp_ID = 252 or comp_ID = 209 or comp_ID = 205 or comp_ID = 174 or comp_ID = 178 or comp_ID = 141 	or comp_ID = 293 or comp_ID = 321 or comp_ID = 289 or comp_ID = 128 or comp_ID = 253 or comp_ID = 254)
</cfif><cfif #url.uid# eq "206"  or #url.uid# eq "208" or #url.uid# eq "193">
and (comp_ID = 100)
</cfif>
<cfif #url.uid# eq 203>
			and (comp_id=224 or comp_id=465 or comp_id=522 or comp_id=333 or comp_id=523)
			</cfif>
<cfif #url.uid# EQ "185">
and (comp_ID = 404 or comp_id = 408)
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  
		
		<CFQUERY datasource="#request.dsn#" NAME="read_cr">
		
			SELECT *
			FROM ancillary
			WHERE codeCR is not null and comp_id = '#cty_name_1[TTT]#'
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>

			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>

		
			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
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
and (comp_ID = 128 or comp_ID = 127 or comp_ID = 241 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 227  or comp_id = 397 or comp_ID = 366 or comp_ID = 359 or comp_ID = 231 or comp_ID = 232 or comp_ID = 251 or comp_ID = 252 or comp_ID = 209 or comp_ID = 205 or comp_ID = 174 or comp_ID = 178 or comp_ID = 141 	or comp_ID = 293 or comp_ID = 321 or comp_ID = 289 or comp_ID = 128 or comp_ID = 253 or comp_ID = 254)
</cfif><cfif #url.uid# eq "206" or #url.uid# eq "208" or #url.uid# eq "193">
and (comp_ID = 100)
</cfif>
<cfif #url.uid# eq 203>
			and (comp_id=224 or comp_id=465 or comp_id=522 or comp_id=333 or comp_id=523)
			</cfif>
<cfif #url.uid# EQ "185">
and (comp_ID = 404 or comp_id = 408)
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  
		
	<CFQUERY datasource="#request.dsn#" NAME="read_avm">
		
			SELECT *
			FROM ancillary
			WHERE codeAVM is not null and comp_id = '#cty_name_1[TTT]#'
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>

			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>

		
			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
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
and (comp_ID = 128 or comp_ID = 127 or comp_ID = 241 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 227  or comp_id = 397 or comp_ID = 366 or comp_ID = 359 or comp_ID = 231 or comp_ID = 232 or comp_ID = 251 or comp_ID = 252 or comp_ID = 209 or comp_ID = 205 or comp_ID = 174 or comp_ID = 178 or comp_ID = 141 	or comp_ID = 293 or comp_ID = 321 or comp_ID = 289 or comp_ID = 128 or comp_ID = 253 or comp_ID = 254)
</cfif><cfif #url.uid# eq "206"  or #url.uid# eq "208" or #url.uid# eq "193">
and (comp_ID = 100)
</cfif>
<cfif #url.uid# eq 203>
			and (comp_id=224 or comp_id=465 or comp_id=522 or comp_id=333 or comp_id=523)
			</cfif>
<cfif #url.uid# EQ "185">
and (comp_ID = 404 or comp_id = 408)
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>   
		
		<CFQUERY datasource="#request.dsn#" NAME="read_sn">
		
			SELECT *
			FROM ancillary
			WHERE codeSigning is not null and comp_id = '#cty_name_1[TTT]#'
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>
 
			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>
			
		
			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
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
and (comp_ID = 128 or comp_ID = 127 or comp_ID = 241 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 227  or comp_id = 397 or comp_ID = 366 or comp_ID = 359 or comp_ID = 231 or comp_ID = 232 or comp_ID = 251 or comp_ID = 252 or comp_ID = 209 or comp_ID = 205 or comp_ID = 174 or comp_ID = 178 or comp_ID = 141 	or comp_ID = 293 or comp_ID = 321 or comp_ID = 289 or comp_ID = 128 or comp_ID = 253 or comp_ID = 254)
</cfif><cfif #url.uid# eq "206"  or #url.uid# eq "208" or #url.uid# eq "193">
and (comp_ID = 100)
</cfif>
<cfif #url.uid# eq 203>
			and (comp_id=224 or comp_id=465 or comp_id=522 or comp_id=333 or comp_id=523)
			</cfif>
<cfif #url.uid# EQ "185">
and (comp_ID = 404 or comp_id = 408)
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date 
		</cfif> </CFQUERY>  
<CFQUERY datasource="#request.dsn#" NAME="read_closing">
		
SELECT *
FROM Title C, Title_Closing_Order_Request O 
WHERE C.title_id = O.title_id AND O.a_Req_closing_month IS NOT NULL and comp_id = '#cty_name_1[TTT]#' and c.cancelled is null
			
			<cfif (#confirm_mon# NEQ "Month" and #comfirm_day# NEQ "Day" and #confirm_year# NEQ "Year") and (#confirm_mon_to# NEQ "Month" and #comfirm_day_to# NEQ "Day" and #confirm_year_to# NEQ "Year")>
			<CFSET YearMon = CreateDate(#confirm_year#, #confirm_mon#, #comfirm_day#)>
			<CFSET YearMonto = CreateDate(#confirm_year_to#, #confirm_mon_to#, #comfirm_day_to#)>

			and (check_date between '#DateFormat(YearMon, "m/d/yyyy")#' AND '#DateFormat(YearMonto, "m/d/yyyy")#')
			</cfif>
			
			 <cfif #user_id# NEQ "NONE">
and user_id = '#user_id#'
</cfif>
  
			
			<CFIF #appraisal_status# NEQ "none">
				AND appraisal_status = '#appraisal_status#'
			
			</CFIF>
	
		
			<CFIF #loan_number# NEQ "">
				AND loan_number = '#loan_number#'
			
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
and (comp_ID = 128 or comp_ID = 127 or comp_ID = 241 or comp_ID = 115 or comp_id = 154 or comp_id = 155 or comp_id = 156 or comp_id = 157 or comp_id = 158 or comp_id = 159 or comp_id = 160 or comp_id = 161 or comp_id = 162 or comp_id = 163 or comp_id = 164 or comp_id = 165 or comp_id = 166 or comp_id = 167 or comp_id = 168 or comp_id = 169 or comp_id = 170 or comp_id = 182 or comp_id = 181 or comp_id = 183 or comp_id = 184 or comp_id = 185 or comp_id = 186 or comp_id = 187 or comp_id = 188 or comp_id = 189 or comp_id = 192 or comp_id = 190 or comp_id = 193 or comp_id = 194 or comp_id = 195 or comp_id = 196 or comp_id = 197  or comp_id = 198  or comp_id = 199  or comp_id = 200  or comp_id = 201 or comp_ID = 210 or comp_ID = 213 or comp_ID = 141)
</cfif>
	  	  <cfif #url.uid# EQ "93">
and (comp_ID = 211 or comp_ID = 227  or comp_id = 397 or comp_ID = 366 or comp_ID = 359 or comp_ID = 231 or comp_ID = 232 or comp_ID = 251 or comp_ID = 252 or comp_ID = 209 or comp_ID = 205 or comp_ID = 174 or comp_ID = 178 or comp_ID = 141 	or comp_ID = 293 or comp_ID = 321 or comp_ID = 289 or comp_ID = 128 or comp_ID = 253 or comp_ID = 254)
</cfif>
<cfif #url.uid# eq "206"  or #url.uid# eq "208" or #url.uid# eq "193">
and (comp_ID = 100)
</cfif>
<cfif #url.uid# eq 203>
			and (comp_id=224 or comp_id=465 or comp_id=522 or comp_id=333 or comp_id=523)
			</cfif>
<cfif #url.uid# EQ "185">
and (comp_ID = 404 or comp_id = 408)
</cfif>
		<cfif #sortorder# NEQ "NONE">
		ORDER BY #sortorder#
	

 	<CFELSE>
		 ORDER BY  check_date  
		</cfif> </CFQUERY>  
	
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
							#bFirstName1# #bLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

						<td bgcolor=#a_bgcolor# width=130 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#read_company.company#
						</td>			

						<!--- --->
						<td bgcolor=#a_bgcolor# width=58 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(duedate, "m/d/yyyy")#
						</td>
					<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td> 	


	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=0&company_id=#company_ID#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
	
	 <CFLOOP QUERY="read_prop">
		
			
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
							P-#prop_id#
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
<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td> 

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&a_trigger=0&company_id=#company_ID#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./prop_report_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#prop_id#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
			</CFOUTPUT>	</CFLOOP>
	 <CFLOOP QUERY="read_app">
		
			
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
							APP-#app_id#
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
<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td> 

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#app_id#&a_trigger=0&company_id=#company_ID#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_navu_appraisal.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#app_id#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
			</CFOUTPUT>	</CFLOOP> 
	

			
	 <CFLOOP QUERY="read_anc">
		
			
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
							<cfif #codeFlood# neq "">F</cfif>-#anc_id#
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
						
<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td> 

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav_sn.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&a_trigger=0&company_id=#company_ID#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_navu_credit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
			</CFOUTPUT>	</CFLOOP> 
			
			
			 <CFLOOP QUERY="read_cr">
		
			
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
							<cfif #codeCR# neq "">CR</cfif>-#anc_id#
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
						
<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td> 

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav_sn.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&a_trigger=0&company_id=#company_ID#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_navu_credit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
			</CFOUTPUT>	</CFLOOP> 
			
			 <CFLOOP QUERY="read_avm">
		
			
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
							<cfif #codeAVM# neq "">AVM</cfif>-#anc_id#
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
						
<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td> 

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav_sn.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&a_trigger=0&company_id=#company_ID#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_navu_credit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
			</CFOUTPUT>	</CFLOOP> 
			
			 <CFLOOP QUERY="read_sn">
		
			
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
							<cfif #codeSigning# neq "">SN</cfif>-#anc_id#
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
						
<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td> 

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav_sn.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&a_trigger=0&company_id=#company_ID#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_navu_credit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#anc_id#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
			</CFOUTPUT>	</CFLOOP> 
			
			<CFLOOP QUERY="read_closing">
		
			
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
							C-#title_id#
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
<td bgcolor=#a_bgcolor# width=120 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td> 

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">
	<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=0&company_id=#company_ID#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">add/view</a>
	
	<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_closing_admin_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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


</cfif>
			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
	
	
	
	
	
	</cfif>