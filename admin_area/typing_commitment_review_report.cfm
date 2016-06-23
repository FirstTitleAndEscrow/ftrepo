<cfparam name="url.al" default="1">
<cfif IsDefined("session.ft_user_id")>
<cfparam name="url.uid" default="#session.ft_user_id#">
</cfif>

<CFQUERY datasource="#request.dsn#" Name="User_Name">
	Select * from First_Admin where id = #url.uid#
</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_typing_work">
select * from vendor_tracker_new v, Title_Closing_Order_Request tc, Title t, Eventlist e, Companies c
where v.vendor_id = 12 <!--- in house typing --->
    <cfif user_name.mi_flushing_admin eq 1>
     and c.intSales IN (Select id from first_admin where mi_flushing_employee = 1)
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          or c.id in (9711,10436,11086,11100,11087)
          </cfif>
    </cfif>    
    <cfif user_name.mi_admin eq 1>
     and c.intSales IN (Select id from first_admin where mi_employee = 1)
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          or c.id in (9711,10436,11086,11100,11087)
          </cfif>
    </cfif>    
    <cfif user_name.mo_admin eq 1>
     and c.intSales IN (Select id from first_admin where mo_employee = 1)
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          or c.id in (9711,10436,11086,11100,11087)
          </cfif>
    </cfif>    
    <cfif user_name.ft_fairfax_admin eq 1>
     and c.intSales IN (Select id from first_admin where ft_fairfax_employee = 1)
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          or c.id in (9711,10436,11086,11100,11087)
          </cfif>
    </cfif>    
    <cfif user_name.tx_admin eq 1>
     and c.intSales IN (Select id from first_admin where tx_employee = 1)
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          or c.id in (9711,10436,11086,11100,11087)
          </cfif>
    </cfif>    
    <cfif user_name.va_admin eq 1>
     and c.intSales IN (Select id from first_admin where va_employee = 1)
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          or c.id in (9711,10436,11086,11100,11087)
          </cfif>
    </cfif>    
and t.order_date > '12/31/2011'
and v.completed is NULL
and v.task = 'Typing'
and tc.title_id = v.order_id
and t.title_id = v.order_id
and c.ID = t.comp_id
and e.title_id = v.order_id
order by tc.contract_busted_date
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="get_comt_work">
select * from vendor_tracker_new v, Title_Closing_Order_Request tc, Title t, Eventlist e, Companies c
where v.vendor_id = 12 <!--- in house typing --->
    <cfif user_name.mi_flushing_admin eq 1>
     and c.intSales IN (Select id from first_admin where mi_flushing_employee = 1)
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          or c.id in (9711,10436,11086,11100,11087)
          </cfif>
    </cfif>    
    <cfif user_name.mi_admin eq 1>
     and c.intSales IN (Select id from first_admin where mi_employee = 1)
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          or c.id in (9711,10436,11086,11100,11087)
          </cfif>
    </cfif>    
    <cfif user_name.mo_admin eq 1>
     and c.intSales IN (Select id from first_admin where mo_employee = 1)
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          or c.id in (9711,10436,11086,11100,11087)
          </cfif>
    </cfif>    
    <cfif user_name.ft_fairfax_admin eq 1>
     and c.intSales IN (Select id from first_admin where ft_fairfax_employee = 1)
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          or c.id in (9711,10436,11086,11100,11087)
          </cfif>
    </cfif>    
    <cfif user_name.tx_admin eq 1>
     and c.intSales IN (Select id from first_admin where tx_employee = 1)
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          or c.id in (9711,10436,11086,11100,11087)
          </cfif>
    </cfif>    
    <cfif user_name.va_admin eq 1>
     and c.intSales IN (Select id from first_admin where va_employee = 1)
		  <cfif session.ft_user_id eq 592 or session.ft_user_id eq 575>
          or c.id in (9711,10436,11086,11100,11087)
          </cfif>
    </cfif>    
and t.order_date > '12/31/2011'
and v.completed is NULL
and v.task = 'Review'
and tc.title_id = v.order_id
and t.title_id = v.order_id
and c.ID = t.comp_id
and e.title_id = v.order_id
order by tc.contract_busted_date
</CFQUERY>



 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title></title>

 
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND=""  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

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
				<CENTER><B>Typing Not Completed</B></CENTER>
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
			
			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=820 cellpadding=1 cellspacing=1 border=0>

					<tr>
						

						<td bgcolor=silver width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<strong>Order Date</strong>
						</td>			
						<td bgcolor=silver width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<strong>Order Num</strong>
						</td>
						<td bgcolor=silver align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<strong>Borrower 1</strong>
						</td>

					
						<td bgcolor=silver width=80 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<strong>Closing Date</strong>
						</td>
					

						<td bgcolor=silver width=80 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<strong>Busted Date</strong>
						</td>
						<td bgcolor=silver width=80 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<strong>Loan Amount</strong>
						</td>
					
						<td bgcolor=silver width=60 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<strong>Details</strong>
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">

	
			<CFOUTPUT QUERY="get_typing_work">
		<cfset f_color = "black">
		<cfif new_client eq '1'><cfset f_color = "red"></cfif>
					
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="#f_color#">
							#DateFormat(get_typing_work.check_date, "m/d/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="#f_color#">
							T-#get_typing_work.title_id#
						</td>

						<td bgcolor=#a_bgcolor# align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="#f_color#">
							#get_typing_work.BFirstName1# #get_typing_work.BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=80 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="#f_color#">
							<cftry>#DateFormat(CreateDate(get_typing_work.c_year, get_typing_work.c_month, get_typing_work.c_day), "m/d/yyyy")#<cfcatch type="any">&nbsp;</cfcatch></cftry>
						</td>
						
						

	<td bgcolor=#a_bgcolor# width=80 align=center valign=top><FONT FACE=verdana SIZE=1 color="#f_color#">
	
	 
	 #DateFormat(get_typing_work.contract_busted_date, "m/d/yyyy")#
	</td>

	<td bgcolor=#a_bgcolor# width=80 align=center valign=top><FONT FACE=verdana SIZE=1 color="#f_color#">
	
	 
	 <cfif get_typing_work.insured eq 'cash'>cash<cfelse>#get_typing_work.loanamt_float#</cfif>
	</td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="#f_color#">
							<a href="./title_report_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&oda_month=#oda_month#&company_id=0&code=T" target="_new"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
	</td>
	
	
		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">				
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">				
							</CFIF>
					</tr>
	
			
			
		</tr>	
			</CFOUTPUT>	
			 	
			

				</table>



			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
</td></tr></table>
</td></tr></table>	
	
	
	<br>
<br>
<br>

	
	
	
	
	
	
	
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
				<CENTER><B>Commitment Review Not Completed</B></CENTER>
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
			
			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->
			<table width=820 cellpadding=1 cellspacing=1 border=0>

					<tr>
						

						<td bgcolor=silver width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<strong>Order Date</strong>
						</td>			
						<td bgcolor=silver width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<strong>Order Num</strong>
						</td>
						<td bgcolor=silver align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<strong>Borrower 1</strong>
						</td>

					
						<td bgcolor=silver width=80 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<strong>Closing Date</strong>
						</td>
					

						<td bgcolor=silver width=80 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<strong>Busted Date</strong>
						</td>
						<td bgcolor=silver width=80 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<strong>Loan Amount</strong>
						</td>
					
						<td bgcolor=silver width=60 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							<strong>Details</strong>
						</td>
					</tr>

<!--- ======================================================================== --->

	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">

			 
	
			<CFOUTPUT QUERY="get_comt_work">
		<cfset f_color = "black">
		<cfif new_client eq '1'><cfset f_color = "red"></cfif>
					
					<tr>
						
		

						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="#f_color#">
							#DateFormat(get_comt_work.check_date, "m/d/yyyy")#
						</td>			
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="#f_color#">
							T-#get_comt_work.title_id#
						</td>

						<td bgcolor=#a_bgcolor# align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="#f_color#">
							#get_comt_work.BFirstName1# #get_comt_work.BLastName1#
						</td>

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName2# #BLastName2#
						</td> --->

						<!--- <td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#SFirstName2# #SLastName2#
						</td> --->
						<td bgcolor=#a_bgcolor# width=80 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="#f_color#">
							<cftry>#DateFormat(CreateDate(get_comt_work.A_Req_Closing_year, get_comt_work.A_Req_Closing_month, get_comt_work.A_Req_Closing_day), "m/d/yyyy")#<cfcatch type="any">&nbsp;</cfcatch></cftry>
						</td>

	<td bgcolor=#a_bgcolor# width=80 align=center valign=top><FONT FACE=verdana SIZE=1 color="#f_color#">
	
	 
	 #DateFormat(get_comt_work.contract_busted_date, "m/d/yyyy")#
	</td>

	<td bgcolor=#a_bgcolor# width=80 align=center valign=top><FONT FACE=verdana SIZE=1 color="#f_color#">
	
	 
	 <cfif get_comt_work.insured eq 'cash'>cash<cfelse>#get_comt_work.loanamt_float#</cfif>
	</td>

	<td bgcolor=#a_bgcolor# width=60 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="#f_color#">
							<a href="./title_report_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&oda_month=#oda_month#&company_id=0&code=T" target="_new"><img src="./images/button_details.gif" border=0 ALT="View the details for this record"></a>
	</td>
	
	
		<CFIF #a_color_trigger# eq "1">
								<CFSET a_bgcolor = "white">
								<CFSET a_color_trigger = "2">				
							<CFELSE>
								<CFSET a_bgcolor = "d3d3d3">
								<CFSET a_color_trigger = "1">				
							</CFIF>
					</tr>
	
			
			
		</tr>	
			</CFOUTPUT>	
			 	
			

				</table>



			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
</td></tr></table>
</td></tr></table>	
	
</BODY>
</HTML>
