<cfparam name="prop_id" default="">
<cfparam name="copyCosts" default="">
<cfparam name="order_type" default="P">
<cfparam name="invoicecount" default="1">

<cfset request.dsn = "First_Title_Main_Admin">

<cfif order_type EQ "P">
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_property">
	select p.*, c.company from property p
	inner join companies c on c.id = p.comp_id
	where p.prop_id = #prop_id#
</CFQUERY>
<cfelse>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_property">
	select * from title
	where title_id = #prop_id#
</CFQUERY>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_company">
	SELECT *
	FROM companies
	WHERE ID = #read_property.comp_id#
</CFQUERY>

<cfset file_prefix="S&B">
<cfif order_type EQ "P">
	<cfset file_prefix="S&B">
<cfset sd_list="9506,9507,9508,9510,9509,9511,9567">
<!--- if this is S&D or one of their companies (listed above) - then use different email --->
	<cfif ListContains(sd_list,read_property.comp_id,",") or Mid(read_company.company,1,3) eq 'S&D'>
		<cfif read_property.pstate eq 'PA'>
            <cfset file_prefix="S&D">
		<cfelseif read_property.pstate eq 'FL'>
            <cfset file_prefix="SFG">
		</cfif>
	</cfif>
<cfelse>
<cfset sd_list="9506,9507,9508,9510,9509,9511,9567">
<!--- if this is S&D or one of their companies (listed above) - then use different email --->
	<cfif ListContains(sd_list,read_title.comp_id,",") or Mid(read_company.company,1,3) eq 'S&D'>
		<cfif read_title.pstate eq 'PA'>
            <cfset file_prefix="S&D">
		<cfelseif read_title.pstate eq 'FL'>
            <cfset file_prefix="SFG">
		</cfif>
	</cfif>
</cfif>

<cfif order_Type EQ "P" AND Len(read_property.cost_per_copy) AND Len(read_property.total_copies)>
	<cfset copyCosts = read_property.cost_per_copy*read_property.total_copies>
</cfif>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_tracker">
	select top 1 * from vendor_tracker_new
	where order_id = #prop_id#
	AND task = 'Abstract'
	order by assign_date desc
</CFQUERY>

<cfif Len(read_property.loantype)>
<cfif read_property.pstate EQ "MD" OR read_property.pstate EQ "VA" OR read_property.pstate EQ "DC" >
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
</cfif>

<cfif read_tracker.product_ordered EQ "full_search">
		<cfif read_property.pstate EQ "PA">
			<cfset read_pricing.price = 220>
		<cfelseif read_property.pstate EQ "FL">
		    <cfif read_property.loantype EQ "FNMA">
				<cfset read_pricing.price = 200>
			<cfelse>
				<cfset read_pricing.price = 225>
			</cfif>
		</cfif>
	<cfelseif read_tracker.product_ordered EQ "two_owner">
		<cfif read_property.pstate EQ "PA">
			<cfset read_pricing.price = 90>
		<cfelseif read_property.pstate EQ "FL">
			 <cfif read_property.loantype EQ "FNMA">
				<cfset read_pricing.price = 200>
			<cfelse>
				<cfset read_pricing.price = 225>
			</cfif>
		</cfif>
	<cfelseif read_tracker.product_ordered EQ "bring_to_date">
		<cfif read_property.pstate EQ "PA">
			<CFQUERY datasource="#request.dsn#" NAME="chkupdate">
				select id from vendor_tracker_new
				where order_ID = #read_property.prop_ID#
				AND product_ordered = 'two_owner'
			</cfquery>
			<cfif chkupdate.recordcount>
				<cfset read_pricing.price = 40>
			<cfelse>
				<cfset read_pricing.price = 75>
			</cfif>
		<cfelseif read_property.pstate EQ "FL">
			<cfif updatecount EQ 1 AND read_property.loantype EQ "FNMA">
				<cfset read_pricing.price = 75>
			<cfelse>
				<cfset read_pricing.price = 50>
			</cfif>
		</cfif>
	</cfif>

<cfdocument format="pdf" fileName="c:\uploads\#order_type#-#prop_id#_INVOICE.pdf" overwrite="true">
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

<cfif file_prefix eq 'S&B'>
<div style="padding:5px;margin:3px;font-size:12px;float:left;text-align:left;">
				<b>BILL TO</b><br>
				Shapiro Brown &amp; Alt<br>
				13135 Lee Jackson Hwy, Ste. 203<br>
				Fairfax, VA 22033
			</div>
<cfelseif file_prefix eq 'S&D'>
<div style="padding:5px;margin:3px;font-size:12px;float:left;text-align:left;">
				<b>BILL TO</b><br>
				Shapiro &amp; DeNardo, L.L.C.<BR>
                3600 Horizon Dr. Suite 150<BR>
                King of Prussia, PA 19406
			</div>
<cfelseif file_prefix eq 'SFG'>
<div style="padding:5px;margin:3px;font-size:12px;float:left;text-align:left;">
				<b>BILL TO</b><br>
				Shapiro, Fishman &amp; Gaché, LLP<BR>
                4630 Woodland Corporate Boulevard, Suite 100<BR>
                Tampa, FL 33614
			</div>
</cfif>			
			<div style="float:right;text-align:right;">
				<b>Invoice Date: #DateFormat(read_tracker.assign_date,"mm/dd/yyyy")#<br>
				<!---Payment Due: #DateFormat(Now(),"mm/dd/yyyy")#<br>--->
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
					<td>#order_type#-#prop_id#-#invoicecount#</td>
				</tr>
				<tr><td>#file_prefix# File No.</td>
					<td>#read_property.loan_number#</td>
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
					<td>#DollarFormat(ReplaceNoCase(read_property.loanamt_float, ",", "", "ALL"))#</td>
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
		<td width="70%">Two Owner Search</td>
		<td align="right">#DollarFormat(read_pricing.price)#</td>
		</tr>
		</cfcase>
		<cfcase value="full_search">
		<tr>
		<td>Full Search</td>
		<td width="70%">Full Search</td>
		<td align="right"><cfif isDefined("read_property.title_id") AND read_property.title_id EQ 94700>$600.00<cfelse>#DollarFormat(read_pricing.price)#</cfif></td>
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
		<cfif isDefined("read_property.title_id") AND read_property.title_id EQ 94700><cfset total = 600><cfelse><cfset total = read_pricing.price></cfif>



		
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
<cfset fileSys = CreateObject('component','cfc.FileManagement')>
<cfinvoke	component = "cfc.FileManagement"	method = "PDFcompress" file2="#order_type#-#prop_id#_INVOICE.pdf" filepath="c:\uploads\">

<cfset new_file_name = #fileSys.MoveFromUploadsOverwrite('#order_type#-#prop_id#_INVOICE.pdf')#>
