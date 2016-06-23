<cfparam name="prop_id" default="">
<cfparam name="copyCosts" default="">
<cfparam name="id" default="">
<cfparam name="invoicecount" default="">


<cfset request.dsn = "First_Title_Main_Admin">

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_property">
	select p.*, c.company from property p
	inner join companies c on c.id = p.comp_id
	where p.prop_id = #prop_id#
</CFQUERY>


<cfset file_prefix="S&B">
<cfset sd_list="9506,9507,9508,9510,9509,9511,9567">
<!--- if this is S&D or one of their companies (listed above) - then use different email --->
	<cfif ListContains(sd_list,read_property.comp_id,",") or Mid(read_property.company,1,3) eq 'S&D'>
		<cfif read_property.pstate eq 'PA'>
            <cfset file_prefix="S&D">
		<cfelseif read_property.pstate eq 'FL'>
            <cfset file_prefix="SFG">
		</cfif>
	</cfif>


<cfif Len(read_property.cost_per_copy) AND Len(read_property.total_copies)>
	<cfset copyCosts = read_property.cost_per_copy*read_property.total_copies>
</cfif>

<cfif Len(id)>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_tracker">
	select  * from vendor_tracker_new
	where id = #id#
</CFQUERY>
<cfelse>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_tracker">
	select top 1 * from vendor_tracker_new
	where order_id = #prop_id#
	AND task = 'Abstract'
	order by assign_date desc
</CFQUERY>
</cfif>

<cfif read_property.pstate EQ "MD" OR read_property.pstate EQ "VA" OR read_property.pstate EQ "DC">
<cfif read_property.loantype EQ "FNMA_free" AND updatecount LTE 2 and read_tracker.product_ordered EQ "bring_to_date">
	

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_pricing">
			select <cfif (prop_id EQ "16174" AND invoicecount EQ 2) OR (prop_id EQ "8477" AND invoicecount EQ 3) OR (prop_id EQ "11238" AND invoicecount EQ 2) OR (prop_id EQ "18469" AND invoicecount EQ 2)>50<cfelse>0</cfif> as price
			from companies
			where id = #read_property.comp_id#
		</CFQUERY>
<cfelse>
		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_pricing">
			select <cfif read_tracker.product_ordered EQ "bring_to_date"><cfif (prop_id EQ "17408" AND invoicecount EQ 1)>268<cfelse>Updates</cfif><cfelseif read_tracker.product_ordered EQ "doc_retrieval" AND (prop_id EQ "19125" AND invoicecount EQ 2)>15<cfelseif read_tracker.product_ordered EQ "doc_retrieval" AND (prop_id EQ "21219" AND invoicecount EQ 1)>28<cfelse>#Replace(read_property.loantype,"_free","")#</cfif><cfif  not (prop_id EQ "17408" AND invoicecount EQ 1) AND not (prop_id EQ "19125" AND invoicecount EQ 2) AND not (prop_id EQ "21219" AND invoicecount EQ 1)>_#read_property.pstate#</cfif> as price
			from companies
			where id = #read_property.comp_id#
		</CFQUERY>
	
</cfif>

<cfelse>

	<cfif read_property.loantype EQ "FNMA_free">
	

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_pricing">
			select <cfif (prop_id EQ "16174" AND invoicecount EQ 2) OR (prop_id EQ "8477" AND invoicecount EQ 3) OR (prop_id EQ "11238" AND invoicecount EQ 2)>50<cfelse>0</cfif> as price
			from companies
			where id = #read_property.comp_id#
		</CFQUERY>
<cfelse>
		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_pricing">
			select <cfif read_tracker.product_ordered EQ "bring_to_date">Updates<cfelse><cfif Len(read_property.loantype)>#read_property.loantype#<cfelse>FNMA</cfif></cfif>_reg as price
			from companies
			where id = #read_property.comp_id#
		</CFQUERY>
	
</cfif>

</cfif>
<cfif read_pricing.Price EQ 50 AND read_property.loantype EQ "FHLMC" AND read_tracker.assign_date GTE "4/18/2014">
	<cfset read_pricing.Price = 75>
</cfif>
<cfif (prop_id EQ "7791" AND invoicecount EQ 6)>
	<cfset read_pricing.price = 55>
</cfif>

<cfif read_property.invoice_date eq 'NULL' or read_property.invoice_date eq ''>
<cfset invoice_date = DateFormat(Now(),"mm/dd/yyyy")>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="update_order">
			update property
			set invoice_date = '#invoice_date#'
			where prop_id = #read_property.prop_id#
		</CFQUERY>
<cfelse>
<cfset invoice_date = DateFormat(read_property.invoice_date,"mm/dd/yyyy")>
</cfif>
<!---
<cfif listFind("18145,18147,18169,18222,18223",read_property.prop_id)>
	<cfset read_tracker.product_ordered = "full_search">
</cfif>
--->
<cfif read_tracker.product_ordered EQ "full_search">
		<cfif read_property.pstate EQ "PA">
			<cfset read_pricing.price = 220>
		<cfelseif read_property.pstate EQ "FL">
			<cfif read_property.loantype EQ "FNMA">
				<cfset read_pricing.price = 200>
			<cfelse>
				<cfset read_pricing.price = 220>
			</cfif>
		</cfif>
		<cfif (prop_id EQ "22398" AND invoicecount EQ 2)>
			<cfset read_pricing.price = 230>
		</cfif>
	<cfelseif read_tracker.product_ordered EQ "two_owner">
		<cfif read_property.pstate EQ "PA">
			<cfset read_pricing.price = 90>
		<cfelseif read_property.pstate EQ "FL">
			<cfif read_property.loantype EQ "FNMA">
				<cfset read_pricing.price = 200>
			<cfelse>
				<cfset read_pricing.price = 220>
			</cfif>
		</cfif>
	<cfelseif read_tracker.product_ordered EQ "doc_retrieval">
		<cfset read_pricing.price = 25>
		<cfif (prop_id EQ "22028" AND invoicecount EQ 1)>
			<cfset read_pricing.price = 35>
		</cfif>
		<cfif (prop_id EQ "22541" AND invoicecount EQ 1)>
			<cfset read_pricing.price = 30>
		</cfif>
		<cfif (prop_id EQ "23420" AND invoicecount EQ 1)>
			<cfset read_pricing.price = 38>
		</cfif>
		<cfif (prop_id EQ "23707" AND invoicecount EQ 2)>
			<cfset read_pricing.price = 64>
		</cfif>
	<cfelseif read_tracker.product_ordered EQ "bring_to_date" OR read_tracker.product_ordered EQ "current_owner">
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
			<cfif read_property.prop_id EQ 22682>
				<cfset read_pricing.price = 0>
			</cfif>
		<cfelseif read_property.pstate EQ "FL">
			<cfif read_property.loantype EQ "FNMA">
				<cfset read_pricing.price = 75>
			<cfelse>
				<cfset read_pricing.price = 50>
			</cfif>
			<cfif read_property.prop_id EQ 23077 OR read_property.prop_id EQ 19269 OR read_property.prop_id EQ 20785>
				<cfset read_pricing.price = 50>
			</cfif>
			<cfif read_property.prop_id EQ 18437 OR read_property.prop_id EQ 24422 OR read_property.prop_id EQ 24027 OR read_property.prop_id EQ 21015 OR read_property.prop_id EQ 20785 OR read_property.prop_id EQ 22537>
				<cfset read_pricing.price = 75>
			</cfif>
			
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
					<td>P-#read_property.prop_id#<cfif Len(invoicecount)>-#invoicecount#</cfif></td>
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
		<td width="70%">Two Owner Search</td>
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
		<cfcase value="doc_retrieval">
		<tr>
		<td>Doc Retrieval</td>
		<td width="70%">Document Retrieval</td>
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