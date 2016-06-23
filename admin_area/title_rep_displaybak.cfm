
<CFSET r_count = "0">


		<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM Title
			WHERE 0 = 0
			
			<CFIF #company_id# NEQ "NONE">
				AND comp_id = #company_id#
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

			ORDER BY comp_id ASC, user_id ASC, oda_year DESC, oda_month DESC, oda_day DESC
		
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
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=780 align=center valign=top>
		
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=780 align=center valign=top bgcolor=e1e1e1>
		
	
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Commitment Report Search</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=780 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<CFIF #r_count# NEQ "0">
<CFOUTPUT>

<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located ( <b>#r_count#</b> ) records as shown below.
				</CENTER>
			</TD>
		</TR>
	<tr>
			<td width=780 align=left valign=top bgcolor=d3d3d3>
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

						<td bgcolor=gray width=100 align=center valign=top>
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
						</td>

						<td bgcolor=gray width=80 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Coments
						</td>
						<td bgcolor=gray width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Details
						</td>
					</tr>
</CFOUTPUT>
<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
	
	<CFIF #a_trigger# EQ "1">
			<CFOUTPUT QUERY="read_report">
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#oda_month#/#oda_day#/#oda_year#
						</td>			

						<td bgcolor=#a_bgcolor# width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>

						<td bgcolor=#a_bgcolor# width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td>

						<td bgcolor=#a_bgcolor# width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName1# #SLastName1#
						</td>			

						<td bgcolor=#a_bgcolor# width=100 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#duedate#
						</td>
						<td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#do_appraisal#
						</td>
                       
						<td bgcolor=#a_bgcolor# width=80 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#appraisal_status#
						</td>
						 <td bgcolor=#a_bgcolor# width=30 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#comments#
						</td>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<a href="./title_report_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_ID#"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
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
	</CFIF>
				</table>

</CFIF>

			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
	
	
	