<cfparam name="buyer_lname" default="">
<cfparam name="buyer_fname" default="">
<cfparam name="seller_fname" default="">
<cfparam name="seller_lname" default="">
<cfparam name="title_id" default="">
<cfparam name="comments" default="">
<cfparam name="appraisal_status" default="">
<CFSET r_count = "0">


		
		
	<!---- BEGIN MODIFY  ----->
<cfoutput>
		<CFIF IsDefined("comments")><cfif #comments# is not "">
	<CFSET comments = #comments#>
</cfif></CFIF>
<CFIF IsDefined("appraisal_status")><cfif #appraisal_status# is not "">
	<CFSET status = #appraisal_status#>
</cfif></CFIF>
		<CFIF IsDefined("form.title_id")><cfif #title_id# NEQ "NONE">
	<CFSET title_id = #title_id#>
</cfif></CFIF>
		
		</cfoutput>
	
	<!------ END MODIFY 
			SELECT *
			FROM Title
			WHERE 0 = 0
	------>
<!--- <CFQUERY datasource="#request.dsn#" NAME="read_closing">
		
			SELECT a_Req_closing_date
			FROM title_closing_order_request
			WHERE title_id = URL.rec_id 
			
</CFQUERY> --->

<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
SELECT *
FROM Title C, Title_Closing_Order_Request O 
WHERE C.title_id = O.title_id AND O.a_Req_closing_month IS NOT NULL

			<!--- 
			<CFIF #company_id# NEQ "NONE">
				AND comp_id = #company_id#
			</CFIF> --->

			
			
			<CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>
<CFIF #title_id# NEQ "none">
				AND c.title_id = '#title_id#'
			</CFIF> 
			<!--- <CFIF IsDefined("FORM.seller_fname")>
				AND (sfirstname1 LIKE '%#seller_fname#%' OR sfirstname2 LIKE '%#seller_fname#%')
			</CFIF>			

			<CFIF IsDefined("FORM.seller_lname")>
				AND (slastname1 LIKE '%#seller_lname#%' OR slastname2 LIKE '%#seller_lname#%')
			</CFIF>			 --->	
           <cfif #comments# is not "">
           and comments LIKE '%#comments#%'
           </cfif>

		

<cfif #appraisal_status# is not "">
and appraisal_status LIKE '%#appraisal_status#%'
</cfif>
			ORDER BY comp_id ASC, user_id ASC, oda_year DESC, oda_month DESC, oda_day DESC
		
		</CFQUERY>
		


	<CFIF '#update#' EQ 'yes'>


				<CFQUERY name="updateinfo" datasource="#request.dsn#">
				UPDATE title
				SET  appraisal_status = '#appraisal_status#',
					comments = '#comments#'
				WHERE title_id = '#title_id#'
				</CFQUERY>

		</cfif>
		
		<CFSET r_count = #read_report.recordcount#>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="FFFFFF" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=780 align=center valign=top>
		
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<!--- <tr>
		<td width=780 align=center valign=top bgcolor=e1e1e1>
			<IMG SRC="./images/logo_title_reports.gif">
			
		</td>
	</tr> --->

	<tr>
		<td width=780 align=center valign=top bgcolor=e1e1e1>
		
	
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Closing Request Search</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=780 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<!--- <CFIF #r_count# NEQ "0"> --->


<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located<CFOUTPUT> ( <b>#r_count#</b> ) </cfoutput>records as shown below.
				</CENTER>
			<CFIF IsDefined("count")>
		<CFIF #count# EQ 0>
			
				<CFSET count_forward = 10>

				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE><font size="2">
				<CFOUTPUT><!--- &company_id=#company_id# ---><!--- &Seller_fname=#Seller_fname#&seller_lname=#seller_lname# --->
<INPUT type="hidden" name="title_id" value="#read_report.title_id#"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><A HREF="./title_admin_closing_display.cfm?update=#update#&uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.title_id#&title_id=#title_id#&comments=#comments#&appraisal_status=#appraisal_status#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=1">
				Next Screen</a></CFOUTPUT>
				</CFIF>
		
			<CFELSE><font size="2">
					
				<CFSET count_forward = #count# + 10>
				<CFSET count_back = #count# - 10><!--- &company_id=#company_id# --->
<!--- &Seller_fname=#Seller_fname#&seller_lname=#seller_lname# --->
					<CFIF (#count# EQ 0) OR (#count# EQ 1)>
					<CFOUTPUT><A HREF="./title_admin_closing_display.cfm?update=#update#&uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.title_id#&title_id=#title_id#&comments=#comments#&appraisal_status=#appraisal_status#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&a_trigger=1"></CFOUTPUT>
					<CFELSE>
					<CFOUTPUT><!--- &company_id=#company_id# ---><!--- &Seller_fname=#Seller_fname#&seller_lname=#seller_lname# --->
<INPUT type="hidden" name="title_id" value="#read_report.title_id#"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><A HREF="./title_admin_closing_display.cfm?update=#update#&uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.title_id#&title_id=#title_id#&comments=#comments#&appraisal_status=#appraisal_status#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_back#&a_trigger=1"></CFOUTPUT>
					</CFIF>
				Previous Screen</a>
				
				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->
				<CFELSE><!--- company_id=#company_id#& --->
				<CFOUTPUT><!--- &Seller_fname=#Seller_fname#&seller_lname=#seller_lname# --->
<INPUT type="hidden" name="title_id" value="#read_report.title_id#"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><A HREF="./title_admin_closing_display.cfm?update=#update#&uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.title_id#&title_id=#title_id#&comments=#comments#&appraisal_status=#appraisal_status#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=1">
				Next Screen</a></CFOUTPUT>
				</CFIF></td>
			
			</CFIF>
			
		<CFELSE>
		<!---------------------------------------------------->		
		<!--- NOT DEFINED & BEGINNING OF LIST ---->
		<!---------------------------------------------------->
			<CFIF #read_report.recordcount# LT 10>

			<CFELSE><font size="2">
			
				<CFSET count_forward = 10>
				
				<CFIF #count_forward# GTE #read_report.recordcount#>
				<!--- IF AT END OF LIST, DO NOT DISPLAY --->

				<CFELSE>
				<CFOUTPUT><!--- &Seller_fname=#Seller_fname# ---><!--- &seller_lname=#seller_lname# --->
<INPUT type="hidden" name="title_id" value="#read_report.title_id#"><INPUT type="hidden" name="uid" value="URL.uid"><!--- company_id=#company_id#& --->
	<INPUT type="hidden" name="al" value="URL.al"><A HREF="./title_admin_closing_display.cfm?update=#update#&uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.title_id#&title_id=#title_id#&comments=#comments#&appraisal_status=#appraisal_status#&buyer_fname=#buyer_fname#&buyer_lname=#buyer_lname#&count=#count_forward#&a_trigger=1">
				Next Screen</a></CFOUTPUT>
				</CFIF></td></tr>
				
			</CFIF>	
		</CFIF>		</TD>
				</TR>
	<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
			
			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=780 cellpadding=1 cellspacing=1 border=0>

					<tr>
						

						<td bgcolor=gray width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order Date
						</td>			

						<td bgcolor=gray width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 1
						</td>

						<td bgcolor=gray width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower 2
						</td>

						<!--- <td bgcolor=gray width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 1
						</td>			

						<td bgcolor=gray width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Seller 2
						</td>
						<td bgcolor=gray width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Due Date
						</td>
						<td bgcolor=gray width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Appr?
						</td> --->
						<td bgcolor=gray width=140 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=200 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Details
						</td>
						
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Coments
						</td>
						
					</tr>

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
		<CFSET count_end = #count# + 9>
		
			 <CFLOOP QUERY="read_report" startrow="#count#" endrow="#count_end#">
		
			
			<CFOUTPUT>
					<tr>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#a_filled_out_date#
						</td>			
		

				
						<td bgcolor=#a_bgcolor# width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

						
							<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">				
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">				
							</CFIF><!--- &company_id=#company_ID# --->
			
<FORM action="./title_admin_closing_display.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.title_id#&title_id=#title_id#">


<cfif #comments# is not ""><input type="hidden" name="comments" value="#comments#"></cfif>
<cfif #appraisal_status# is not ""><input type="hidden" name="appraisal_status" value="#appraisal_status#"></cfif>
<!--- <cfif #company_id# is not ""><input type="hidden" name="company_id" value="#company_id#"></cfif> --->
<cfif #Trim(buyer_lname)# is not ""><input type="hidden" name="buyer_lname" value="#buyer_lname#"></cfif>
<cfif #Trim(buyer_fname)# is not ""><input type="hidden" name="buyer_fname" value="#buyer_fname#"></cfif>
<!--- <cfif #Trim(seller_lname)# is not ""><input type="hidden" name="seller_lname" value="#seller_lname#"></cfif>
<cfif #Trim(seller_fname)# is not ""><input type="hidden" name="seller_fname" value="#seller_fname#"></cfif> --->
<INPUT type="hidden" name="update" value="yes">
<INPUT type="hidden" name="title_id" value="#read_report.title_id#"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="title_id" value="#title_id#">
	<INPUT type="hidden" name="al" value="URL.al">
	<td valign="middle"><FONT FACE=verdana SIZE=1 color="black">
	  	<select name="appraisal_status" style="thin ">
	<cfif #appraisal_status# is not "open">
	 <option value="#appraisal_status#" style="thin" selected >#appraisal_status#
	<cfelse> 
	  <option value="In Process" style="thin" selected>In Process</OPTION>
	 </cfif>
	  <option value="In Process" style="thin">In Process</OPTION>	 
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
    <option value="Delayed" style="thin">Delayed</OPTION>
	<option value="Loan Closed" style="thin"> Loan Closed</OPTION>
	<option value="Closing Requested" style="thin">Closing Requested</OPTION>
	<option value="Closing Req Completed" style="thin">Closing Req Completed</OPTION>
	<option value=""></option>
	</select></td>

	<td valign="middle"><FONT FACE=verdana SIZE=1 color="black">
	<select name="comments">
	  <option value="#comments#">#comments#</OPTION>
	  <option value="Court House Closed">Court House Closed</OPTION>
	  <option value="Waiting on Tax Info.">Waiting on Tax Info.</OPTION>
	  <option value="In Typing">In Typing</OPTION>
	  <option value="Waiting on Judgment Info">Waiting on Judgment Info</OPTION>
      <option value="Call for Detail">Call for Detail</OPTION>
	  <option value="Judgments Exist">Judgments Exist</OPTION>
	  <option value="Subordination Needed">Subordination Needed</OPTION>
      <option value="Subordination Received">Subordination Received</OPTION>
	  <option value="Vesting Issue">Vesting Issue</OPTION>
	  <option value="Unreleased Mortgages Exists">Unreleased Mortgages Exists</OPTION>
	  <option value="Clear to Close">Clear to Close</OPTION>
	  <option value=""></option>
	  </select></td>	

<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_closing_admin_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&a_trigger=0&company_id=0"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
						</td>
					

	<td valign="middle"><FONT FACE=verdana SIZE=1 color="black">
	
	<input type="submit" value="Update">
	</td>
	
	
					</tr>
	</FORM>
			
			
		</tr>	
			</CFOUTPUT>	
			
			</CFLOOP><!--- </CFIF> ---> 	 <!--- </CFIF> ---> 
		
			
			
		</table>
		



			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
		

	