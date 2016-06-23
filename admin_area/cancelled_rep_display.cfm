<cfparam name="a_trigger" default=0>

	<cfoutput>
	
	<CFIF IsDefined("form.company_id")>
		<cfif #company_id# NEQ "NONE">
			<CFSET company_id = #company_id#>
		</cfif>
	</CFIF>
	<CFIF IsDefined("form.buyer_fname")>
		<cfif #Trim(buyer_fname)# is not "">
			<CFSET buyer_fname = #buyer_fname#>
		</cfif>
	</CFIF>
	<CFIF IsDefined("form.buyer_lname")>
		<cfif #Trim(buyer_lname)# is not "">
			<CFSET buyer_lname = #buyer_lname#>
		</cfif>
	</CFIF>
	
<cfif #a_trigger# eq "1"><!---Title--->
	<CFIF IsDefined("form.title_id")>
		<cfif #title_id# NEQ "NONE">
			<CFSET order_id = #title_id#>
		</cfif>
	</CFIF>
	
	<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT     	Title.Title_ID As Order_ID, Title.check_date, Companies.company, Title.bfirstname1, 
						Title.blastname1,'T' as type
			FROM       	Title LEFT OUTER JOIN
                       	Companies ON Title.comp_id = Companies.ID
					   	where cancelled = 1 
			<CFIF #title_id# NEQ "none">
				AND title_id = #order_id#
			</CFIF> 
			<CFIF #company_id# NEQ "none">
				AND comp_id IN (#company_id#)
			</CFIF> 
			<CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>
			<CFIF FORM.date_start neq ''>
				AND (check_date >= '#form.date_start#')
			</CFIF>
			<CFIF FORM.date_end neq ''>
				AND (check_date <= '#form.date_end#')
			</CFIF>
			
			order by check_date
	</CFQUERY>
<CFELSEIF #a_trigger# eq "2"><!---Property--->
	<CFIF IsDefined("form.prop_id")>
		<cfif #Prop_id# NEQ "NONE">
			<CFSET order_id = #prop_id#>
		</cfif>
	</CFIF>
	
	<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT     	Property.Prop_ID As Order_ID, Property.check_date, Companies.company, Property.bfirstname1, 
						Property.blastname1,'P' as Type
			FROM       	Property LEFT OUTER JOIN
                       	Companies ON Property.comp_id = Companies.ID
					   	where cancelled = 1 
			<CFIF #prop_id# NEQ "none">
				AND prop_id = #order_id#
			</CFIF> 
			<CFIF #company_id# NEQ "none">
				AND comp_id IN (#company_id#)
			</CFIF> 
			<CFIF IsDefined("FORM.buyer_fname")>
				AND (bfirstname1 LIKE '%#buyer_fname#%' OR bfirstname2 LIKE '%#buyer_fname#%')
			</CFIF>			
			<CFIF IsDefined("FORM.buyer_lname")>
				AND (blastname1 LIKE '%#buyer_lname#%' OR blastname2 LIKE '%#buyer_lname#%')
			</CFIF>
			<CFIF FORM.date_start neq ''>
				AND (check_date >= '#form.date_start#')
			</CFIF>
			<CFIF FORM.date_end neq ''>
				AND (check_date <= '#form.date_end#')
			</CFIF>
			order by check_date
	</CFQUERY>	
</CFIF>		
	
	<CFSET OrderRecordCount = #read_report.recordcount#>
	</CFOUTPUT>
	

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
								</td>
							</tr>
						</table>
						<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
							<tr>
								<td width=820 align=left valign=top bgcolor=green>
									<FONT FACE=ARIAL SIZE=2 color="white">
									<CENTER><B>Cancelled Title Commitment Report Search</B></CENTER>
								</TD>
							</TR>
							<tr>
								<td width=820 align=left valign=top bgcolor=e1e1e1>
									<FONT FACE=ARIAL SIZE=1 color="black">
									<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
									The search located<CFOUTPUT> ( <b>#OrderRecordCount#</b> ) </cfoutput>records as shown below.
									</CENTER>
								</TD>
							</TR>
							<td width=820 align=left valign=top bgcolor=d3d3d3>
								<table width=820 cellpadding=1 cellspacing=1 border=0>
									<tr>
										<td bgcolor=gray  align=center valign=top>
											<FONT FACE=verdana SIZE=1 color="black">
											Order Date
										</td>			
										<td bgcolor=gray  align=center valign=top>
											<FONT FACE=verdana SIZE=1 color="black">
											Order Num
										</td>
										<td bgcolor=gray  align=center valign=top>
											<FONT FACE=verdana SIZE=1 color="black">
											Borrower 1
										</td>
										<td bgcolor=gray  align=center valign=top>
											<FONT FACE=verdana SIZE=1 color="black">
											Client
										</td>			
										<td bgcolor=gray  align=center valign=top>
											<FONT FACE=verdana SIZE=1 color="black">
											Comments
										</td>
										<td bgcolor=gray  align=center valign=top>
											<FONT FACE=verdana SIZE=1 color="black">
											Reinstate
										</td>
									</tr>
<!---Read Query--->		
<CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="read_report">
									<tr>
									<td bgcolor=gray  align=center valign=top>
											<FONT FACE=verdana SIZE=1 color="black">
											#DateFormat(check_date, "m/d/yyyy")#
										</td>			
										<td bgcolor=gray  align=center valign=top>
											<FONT FACE=verdana SIZE=1 color="black">
											<CFIF #Type# eq "T">
												T-#Order_id#
											<CFELSE>
												P-0232#Order_id#
											</CFIF>
										</td>
										<td bgcolor=gray  align=center valign=top>
											<FONT FACE=verdana SIZE=1 color="black">
											#bfirstname1# #blastname1#
										</td>
										<td bgcolor=gray  align=center valign=top>
											<FONT FACE=verdana SIZE=1 color="black">
											#read_report.company#
										</td>			
										<td bgcolor=gray  align=center valign=top>
											<FONT FACE=verdana SIZE=1 color="black">
											<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_report.order_id#&a_trigger=1&code=#Type#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')">
											<FONT FACE=verdana SIZE=1 color="blue">
											add/view</a>
										</td>
										<td bgcolor=gray align=center valign=top>
											<!---needs UID, Order_ID, a_trigger--->
											<a href="./cancelled_rep_reinstate.cfm?&uid=#URL.uid#&al=#URL.al#&a_trigger=#a_trigger#&Order_ID=#order_id#" >
											<img src="./images/reinstate.gif" border=0 ALT="Reinstate Cancelled Order"></a>
										</td>
									</tr>		
</CFOUTPUT>									
								</table>
							</td>
							</tr>
							</table>
