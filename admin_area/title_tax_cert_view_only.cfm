



		<CFQUERY datasource="#request.dsn#" NAME="read_title_tax_cert">
		
			SELECT *
			FROM tax_cert_title
			WHERE title_ID = #rec_ID#
		
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_title">
		
			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#
		
		</CFQUERY>
		
		
<CFIF #read_title_tax_cert.User_ID_started# GT "">


		<!--- ===/ Get the name of the person that is  \=== --->
		<!--- ===/ STARTED the Tax Cert Process        \=== --->
		
		<CFQUERY datasource="#request.dsn#" NAME="read_user_starting">
		
			SELECT *
			FROM first_admin
			WHERE ID = #read_title_tax_cert.User_ID_started#
		
		</CFQUERY>		
		
		
		<CFSET user_that_started = #read_user_starting.fname# & " " & #read_user_starting.lname#>

		
<CFELSE>
		<CFSET user_that_started = "Not Started Yet">
</CFIF>


<CFIF #read_title_tax_cert.User_ID_finished# GT "">

		<!--- ===/ Get the name of the person that is  \=== --->
		<!--- ===/ FINISHED the Tax Cert Process       \=== --->
		
		<CFQUERY datasource="#request.dsn#" NAME="read_user_finished">
		
			SELECT *
			FROM first_admin
			WHERE ID = #read_title_tax_cert.User_ID_finished#
		
		</CFQUERY>		
		
		<CFSET user_that_started = #read_user_finished.fname# & " " & #read_user_finished.lname#>

<CFELSE>
		<CFSET user_that_finished = "Not Finished Yet">
</CFIF>
			

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=15 MarginWidth=5 MarginHeight=0>

<CENTER>
<CENTER>
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=520 align=center valign=top>
		
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

	<tr>
		<td width=520 align=center valign=top bgcolor=e1e1e1>



<CFOUTPUT>


<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 colspan=2 align=center valign=top bgcolor=f3f3f3>
				<font size=3 color=blue face=arial>
				<B>Tax Certificate Request Form</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Person Obtaining Info - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#user_that_started#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Date Started - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#read_title_tax_cert.a_date_started#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Time Started - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#read_title_tax_cert.a_time_started#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Person Completeing Info - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#user_that_finished#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Date Completed - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#read_title_tax_cert.a_date_finished#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Time Completed - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#read_title_tax_cert.a_time_finished#</B>
			</td>
		</tr>
<!--- =========================================================== --->
		<tr>
			<td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3>
				<font size=2 color=black face=arial>
				<B>Property Address:</B>
			</td>
		</tr>	

		<tr>
			<td width=519 colspan=2  align=center valign=top bgcolor=e1e1e1>
				
				<table width=518 cellpadding=1 cellspacing=1 border=0>
					<tr>
						<td width=217 align=right valign=top>
							<font size=2 color=blue face=arial>
							<B>#read_title.paddress#</B>
						</td>
						
						<td width=120 align=right valign=top>
							<font size=2 color=blue face=arial>
							<B>#read_title.pcity#</B>
						</td>				

						<td width=20 align=right valign=top>
							<font size=2 color=blue face=arial>
							<B>#read_title.pstate#</B>
						</td>

						<td width=60 align=right valign=top>
							<font size=2 color=blue face=arial>
							<B>#read_title.pzip#</B>
						</td>				
						<td width=100 align=right valign=top>
							<font size=2 color=blue face=arial>
							<B>#read_title.pcounty#</B>
						</td>
					</tr>

					<tr>
						<td width=517 colspan=5 align=right valign=top>
							<font size=2 color=blue face=arial>
							Loan Amount is.... <font size=2 color=blue face=arial>
							<B>$ #NumberFormat(read_title.loanamt_float, "999,999,999.99")#</B><br>
							<CFIF #read_title.estimate_value# GT "">
							Estimated Property Value is.... <font size=2 color=blue face=arial>
							<B>$ #NumberFormat(read_title.estimate_value, "999,999,999.99")#</B></CFIF>
						</td>
					</tr>
				</table>
				
			</td>
		</tr>	
<!--- =========================================================== --->		
		<tr>
			<td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3>
				<font size=2 color=black face=arial>
				<B>Tax Bill - Payment Information:</B>
			</td>
		</tr>	
		
		

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Check Payable to -  
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.payable_to#</b>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Address 1  -  
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.addr_1#</b>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Address 2  -  
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.addr_2#</b>
			</td>
		</tr>		

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				City  -  
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.city#</b>
			</td>
		</tr>		

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				State  
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.state#</b>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Zip  -  
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.zip#</b>
			</td>
		</tr>

		<tr>
			<td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3>
				<font size=2 color=black face=arial>
				<B>Taxing State Contact Information:</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				State  -  
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.taxing_state#</b>
			</td>
		</tr>		

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Phone  -  
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.taxing_state_phone#</b>
			</td>
		</tr>		

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Ext  -  
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.taxing_state_ext#</b>
			</td>
		</tr>	
		
		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Fax  -  
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.taxing_state_fax#</b>
			</td>
		</tr>			

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Contact Person  -  
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.taxing_state_person#</b>
			</td>
		</tr>

		<tr>
			<td width=519 colspan=2  align=left valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Comments  -  
			</td>
		</tr>
		
		<tr>
			<td width=519 colspan=2  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.taxing_state_comments#</b>
			</td>
		</tr>

		<tr>
			<td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3>
				<font size=2 color=black face=arial>
				<B>Tax Details for this Property:</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Property Tax ID  -  
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.tax_payer_id#</b>
			</td>
		</tr>		

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Tax Period [ <B>FROM</B> ]   -
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.tax_period_covered_from#</b>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Tax Period [ <B>TO</B> ]   -
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.tax_period_covered_to#</b>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Tax <B>Year</B> Payment is Covering -   
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.tax_year_pymnt_covers#</b>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Tax Billing Periods -   
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=1 color=black face=verdana>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.taxing_state_pay_increments#</b>
			</td>
		</tr>

		<tr>
			<td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3>
				<font size=2 color=black face=arial>
				<B>Tax Due Dates :</B>
			</td>
		</tr>
		
		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Due Date 1   - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.tax_due_dates_1#</b>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Due Date 2   -  
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.tax_due_dates_2#</b>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Due Date 3   - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.tax_due_dates_3#</b>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Due Date 4   - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.tax_due_dates_4#</b>
			</td>
		</tr>

		<tr>
			<td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3>
				<font size=2 color=black face=arial>
				<B>Tax Dilenquency / Leins :</B>
			</td>
		</tr>		

		<tr>
			<td width=519 colspan=2  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.dilinquent_taxes#</b>
			</td>
		</tr>

		<tr>
			<td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3>
				<font size=2 color=black face=arial>
				<B>Other Taxes</B> [fill in information as applicable to this property ].
				<p><font size=1 color=blue face=verdana>
				Use the comments section of each section below to fill in information regarding any rates that may apply, to whom the payment should be made, period of coverage, etc.
			</td>
		</tr>
	<!---===============================================================--->

		<tr>
			<td width=519 colspan=2  align=left valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				<B>Township</B>
			</td>
		</tr>
		
		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Tax Rate -   
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.other_tax_township_rate#</b>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Comments -   
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.other_tax_township_desc#</b>
			</td>
		</tr>
	<!---===============================================================--->
		<tr>
			<td width=519 colspan=2  align=left valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				<B>City</B>
			</td>
		</tr>
		
		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Tax Rate -   
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.other_tax_city_rate#</b>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Comments -   
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.other_tax_city_desc#</b>
			</td>
		</tr>

	<!---===============================================================--->
		<tr>
			<td width=519 colspan=2  align=left valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				<B>County</B>
			</td>
		</tr>
		
		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Tax Rate -   
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.other_tax_county_rate#</b>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Comments -   
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.other_tax_county_desc#</b>
			</td>
		</tr>

		<tr>
			<td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3>
				<font size=2 color=black face=arial>
				<B>Tax Payment History :</B>
			</td>
		</tr>		

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Tax Amount Last Paid -   
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.amt_last_paid#</b>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Last Period Covered [ <B>FROM</B> ] -
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.amt_last_period_from#</b>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Last Period Covered [ <B>TO</B> ] -
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.amt_last_period_to#</b>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Tax Amount Next Due -     
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.amt_next_due#</b>
			</td>
		</tr>
		
		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Next Due Date [ <B>FROM</B> ] -
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.amt_next_due_from#</b>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Next Due Date [ <B>TO</B> ] -
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				<B>#read_title_tax_cert.amt_next_due_to#</b>
			</td>
		</tr>

	</table>

</CFOUTPUT>


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