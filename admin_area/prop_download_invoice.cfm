<cfparam name="prop_id" default="">
<cfparam name="copyCosts" default="">

<cfset request.dsn = "First_Title_Main_Admin">

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_property">
	select * from property
	where prop_id = #prop_id#
</CFQUERY>

<cfif Len(read_property.cost_per_copy) AND Len(read_property.total_copies)>
	<cfset copyCosts = read_property.cost_per_copy*read_property.total_copies>
</cfif>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_tracker">
	select top 1 * from vendor_tracker_new
	where order_id = #prop_id#
	AND task = 'Abstract'
	order by assign_date desc
</CFQUERY>

<cfif read_property.pstate EQ "MD" OR read_property.pstate EQ "VA" OR read_property.pstate EQ "DC">
<cfif read_property.loantype EQ "FNMA_free">
	

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_pricing">
			select 0 as price
			from companies
			where id = #read_property.comp_id#
		</CFQUERY>
<cfelse>
		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_pricing">
			select <cfif read_tracker.product_ordered EQ "bring_to_date">Updates<cfelse>#read_property.loantype#</cfif>_#read_property.pstate# as price
			from companies
			where id = #read_property.comp_id#
		</CFQUERY>
	
</cfif>

<cfelse>

	<cfif read_property.loantype EQ "FNMA_free">
	

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_pricing">
			select 0 as price
			from companies
			where id = #read_property.comp_id#
		</CFQUERY>
<cfelse>
		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_pricing">
			select <cfif read_tracker.product_ordered EQ "bring_to_date">Updates<cfelse>#read_property.loantype#</cfif>_reg as price
			from companies
			where id = #read_property.comp_id#
		</CFQUERY>
	
</cfif>

</cfif>

<cfdocument format="pdf" fileName="c:\uploads\P-#read_property.prop_id#_INVOICE.pdf" overwrite="true">
<cfoutput>
	<body style="margin:20px;font-size:14px;">
		
		<div style="text-align:center;width:100%;">
			<h2>INVOICE</h2>
			<h2>Streamline Title</h2>
			<cfif NOT DateDiff("d", Now(), "1/30/2012")>
<h3>30 West Gude Drive<br>Rockville, MD 20850</h3>
<cfelse>
<h3>7361 Calhoun Place, Suite 200<br>Rockville, MD 20855</h3>
</cfif>

			<div style="padding:5px;margin:3px;font-size:12px;float:left;text-align:left;">
				<b>BILL TO</b><br>
				Shapiro and Burson<br>
				13135 Lee Jackson Hwy, Ste. 203<br>
				Fairfax, VA 22033
			</div>
			<div style="float:right;text-align:right;">
				<b>Invoice Date: #DateFormat(read_tracker.assign_date,"mm/dd/yyyy")#<br>
				Payment Due: #DateFormat(Now(),"mm/dd/yyyy")#<br>
				<!---Invoice Number: 93840--->
				
				</b>
			</div>
			<div style="clear:both"></div>
		</div>
		<hr>
		<table>
		<tr>
		<td valign="top">
			<table cellpadding="8">
				<tr><td>File No</td>
					<td>P-#read_property.prop_id#</td>
				</tr>
				<tr><td>Buyer</td>
					<td>#read_property.bfirstName1# #read_property.blastName1#</td>
				</tr>
				<!---
				<tr><td>Seller</td>
					<td>#read_property.sfirstName1# #read_property.slastName1#</td>
				</tr>
				--->
			</table>
			<P>
			<b>PROPERTY INFORMATION:</b>
			<br><br>
			#read_property.paddress#<br>
			#read_property.pcity#, #read_property.pstate# #read_property.pzip#
			</P>
		</td>
		<td width="200">&nbsp;</td>
		<td valign="top">
			<table>
				<tr><td>Sales Amount</td>
					<td></td>
				</tr>
				<tr><td>Loan Amount</td>
					<td>#DollarFormat(read_property.loanamt_float)#</td>
				</tr>
			</table>
		
		</td>
		</tr>
		</table>
		<br><br>
		<table width="100%" border="1" cellspacing="0" cellpadding="5">
		<tr>
		<td><b>Item Code</b></td>
		<td width="70%"><b>Description</b></td>
		<td align="right"><b>Amount</b></td>
		</tr>
		<cfswitch expression="#read_tracker.product_ordered#">
		<cfcase value="two_owner">
		<tr>
		<td>Two Owner</td>
		<td width="70%">Two Owner Property Report</td>
		<td align="right">#DollarFormat(read_pricing.price)#</td>
		</tr>
		</cfcase>
		<cfcase value="full_search">
		<tr>
		<td>Full Search</td>
		<td width="70%">Full Search</td>
		<td align="right">#DollarFormat(read_pricing.price)#</td>
		</tr>
		</cfcase>
		<cfcase value="bring_to_date">
		<tr>
		<td>Update</td>
		<td width="70%">Bring To Date</td>
		<td align="right">#DollarFormat(read_pricing.price)#</td>
		</tr>
		</cfcase>
		</cfswitch>
		<cfset total = read_pricing.price>


		
		<cfif Len(copyCosts)>
			<tr>
		<td>Copies</td>
		<td width="70%">Copies</td>
		<td align="right">#DollarFormat(copyCosts)#</td>
		</tr>
		<cfset total = total + copyCosts>
		</cfif>
		
		<tr >
			<td>&nbsp;</td>
			<td align="right"><b>Total</b></td>
			<td align="right"><b>#DollarFormat(total)#</b></td>
		</tr>
		</table>
		
	</body>
</cfoutput>
</cfdocument>

<cfheader name="Content-Disposition" value="inline; filename=P-#read_property.prop_id#_INVOICE.pdf">
<cfcontent type="application/unknown"	file="C:\Uploads\P-#read_property.prop_id#_INVOICE.pdf" deleteFile="yes">