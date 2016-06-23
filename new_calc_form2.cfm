


<cfset jlp_states = "AL,AK,AR,AZ,CA,CO,CT,DE,GA,HI,ID,KS,KY,LA,ME,MD,MI,MN,MO,MT,NE,NV,NH,NM,NY,NC,ND,OH,SC,SD,TN,TX,UT,VT,VA,WA,WV,WI,WY" >
<cfset owners_states = "DC,FL,LA,MD,MO,OH,VA,WV" >
<cfset prev_loan_balance_shown = 0>
<cfset calc_button_shown = 0>
<cfparam name="form.construction_draws" default="">
<cfparam name="form.end_loan_original_loan_amount" default="">
<cfparam name="form.closing_type" default="">
<cfparam name="form.borrower_owns" default="1">
<cfparam name="form.custom_fees" default="">
<cfparam name="form.first_time_buyer" default="0">
<cfparam name="form.transaction_type" default="">
<cfparam name="form.property_state" default="">
<cfparam name="form.property_city" default="">
<cfparam name="form.property_zip" default="">
<cfparam name="form.property_county" default="">
<cfparam name="form.loan_amount" default="0">
<cfparam name="form.previous_loan_amount" default="0">
<cfparam name="form.previous_loan_month" default=1>
<cfparam name="form.previous_loan_year" default=1996>
<cfparam name="form.previous_purch_amount" default="0">
<cfparam name="form.previous_purch_month" default=1>
<cfparam name="form.previous_purch_year" default=1996>
<cfparam name="form.fee_submit" default="">
<cfparam name="form.place_order" default="">
<cfparam name="form.purchase_price" default="0">
<cfparam name="form.property_use_type" default="1">
<cfparam name="form.return_data" default="1">
<cfparam name="form.enhanced_coverage" default="0">
<cfparam name="form.assessed_value" default="0">
<cfparam name="form.current_orders" default="0">
<cfparam name="form.update_this_title_id" default="0">
<cfparam name="form.update_this_prop_id" default="0">
<cfparam name="form.same_lender" default="0">
<cfparam name="form.reissue_rates" default="0">
<cfparam name="form.jlp_policy" default="0">
<cfparam name="form.seller_paid_lender_policy" default="0">
<cfparam name="form.seller_paid_owner_policy" default="0">
<cfparam name="form.asset_manager" default="">
<cfparam name="form.opt_alta_4" default="0">
<cfparam name="form.opt_alta_4_1" default="0">
<cfparam name="form.opt_alta_5" default="0">
<cfparam name="form.opt_alta_5_1" default="0">
<cfparam name="form.opt_alta_6" default="0">
<cfparam name="form.opt_alta_6_1" default="0">
<cfparam name="form.opt_alta_6_2" default="0">
<cfparam name="form.opt_alta_7" default="0">
<cfparam name="form.opt_alta_8_1" default="0">
<cfparam name="form.opt_alta_9" default="0">
<cfparam name="form.opt_tx_1" default="0">
<cfparam name="form.opt_tx_2" default="1">
<cfparam name="form.opt_tx_3" default="0">
<cfparam name="form.opt_tx_4" default="0">
<cfparam name="form.opt_tx_5" default="1">
<cfparam name="form.opt_tx_6" default="0">
<cfparam name="form.opt_tx_7" default="0">
<cfparam name="form.opt_tx_8" default="0">
<cfparam name="form.opt_tx_9" default="0">
<cfparam name="form.opt_tx_10" default="0">
<cfparam name="form.opt_tx_11" default="0">
<cfparam name="form.opt_tx_12" default="0">
<cfparam name="form.opt_tx_13" default="0">
<cfparam name="form.opt_tx_14" default="0">

<cfparam name="form.opt_ut_4" default="0">
<cfparam name="form.opt_ut_41" default="0">
<cfparam name="form.opt_ut_5" default="0">
<cfparam name="form.opt_ut_51" default="0">
<cfparam name="form.opt_ut_6" default="0">
<cfparam name="form.opt_ut_61" default="0">
<cfparam name="form.opt_ut_62" default="0">
<cfparam name="form.opt_ut_81" default="0">
<cfparam name="form.opt_ut_9" default="0">

<cfparam name="form.opt_sd_comp" default="0">
<cfparam name="form.opt_sd_balloon" default="0">
<cfparam name="form.opt_sd_credit" default="0">
<cfparam name="form.opt_sd_7" default="0">
<cfparam name="form.opt_sd_6" default="0">
<cfparam name="form.opt_sd_4" default="0">
<cfparam name="form.opt_sd_5" default="0">
<cfparam name="form.opt_sd_9" default="0">
<cfparam name="form.opt_sd_8" default="0">


<cfparam name="form.transfer_tax_paid_by" default="">
<cfparam name="form.sender_name" default="">
<cfparam name="form.sender_email" default="">
<cfparam name="form.agent_name" default="">
<cfparam name="form.agent_email" default="">
<cfparam name="form.send_quote" default="0">
<cfparam name="form.underwriter_choice" default="16">
<cfparam name="form.new_deed" default="0">
<cfparam name="form.current_deed_num" default="1">
<cfparam name="form.add_or_remove" default="">
<cfparam name="form.add_or_remove_num" default="">
<cfparam name="form.previous_purchase_mortgage" default="0">

<cfparam name="form.mortgage_pages" default="18">
<cfparam name="form.deed_pages" default="18">

<cfparam name="form.knowpages" default="0">




<cfparam name="form.cema" default="0">

<cfif form.property_state eq 'AK'>
<cfset form.enhanced_coverage = 1>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="get_comp_info">
  SELECT * from companies where ID = #session.comp_id#
</CFQUERY>
<cfset allow_construction_loans = 0>
<cfif session.comp_id eq 1754>
<cfset allow_construction_loans = 1>
</cfif> 

<cfif get_comp_info.streamline_client neq 1 and get_comp_info.streamline_client neq 'True'>
<!--- set a default underwriter...if the client has a specific underwriter for this state in Underwriter_Default_Exceptions, set it to that --->
<CFQUERY datasource="#request.dsn#" NAME="exceptions" maxrows="1">
SELECT *
FROM Underwriter_Default_Exceptions
where comp_id = #session.comp_id#
and state = '#form.property_state#'
</CFQUERY>

<cfif exceptions.recordcount GTE 1>
<cfset form.underwriter_choice = #exceptions.title_co_id#>
<cfelse>
<cfset form.underwriter_choice = 16> <!--- default to Stewart --->
</cfif>
<!--- END set a default underwriter...if the client has a specific underwriter for this state in Underwriter_Default_Exceptions, set it to that --->
</cfif>




<script language="javascript">
function check_new_deed() {
if (document.getElementsByName('new_deed')[0].checked) {
document.getElementById('title_new_deed_table').style.display = 'block';
} else {
document.getElementById('title_new_deed_table').style.display = 'none';
document.getElementById('current_deed_num').value = '1';
document.getElementById('spouses_removed').value = '0';
document.getElementById('non_spouses_removed').value = '0';
document.getElementById('spouses_added').value = '0';
document.getElementById('non_spouses_added').value = '0';
}
if (document.getElementsByName('new_deed')[1].checked) {
document.getElementById('title_new_deed_table').style.display = 'none';
document.getElementById('current_deed_num').value = '1';
document.getElementById('spouses_removed').value = '0';
document.getElementById('non_spouses_removed').value = '0';
document.getElementById('spouses_added').value = '0';
document.getElementById('non_spouses_added').value = '0';
}
}
</script>


<script language="javascript">
function check_end_loan_original_loan_amount() {
if (document.getElementById('closing_type').value == '3') {
document.getElementById('perm_original_loan').style.display = 'block';
document.form.borrower_owns[0].checked = true;
document.form.borrower_owns[1].checked = false;
} else {
document.getElementById('perm_original_loan').style.display = 'none';
document.getElementById('end_loan_original_loan_amount').value = '';
}
}
</script>



<script language="javascript">
function submit_form() {
document.form.submit();
}
</script>



<CFQUERY datasource="#request.dsn#" NAME="get_states">
SELECT     *
FROM         First_Title_States
where (exclude_from_ordering = 'False' or exclude_from_ordering IS NULL)
<cfif form.transaction_type eq 'Construction'>
and st_abbrev IN ('MD','PA','VA','ND')
</cfif>
order by st_abbrev
</CFQUERY>

<cfset valid_states = ValueList(get_states.st_abbrev, ",")>
<CFQUERY datasource="#request.dsn#" NAME="get_zips">
SELECT    DISTINCT zip
FROM      Zip_info
<cfif form.property_state neq "">
Where state = '#form.property_state#'
<cfelse>
Where state = 'No State Name'
</cfif>
and (exclude_from_ordering = 'False' or exclude_from_ordering IS NULL)
order by zip
</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="get_counties">
SELECT    DISTINCT county
FROM      Zip_info
<cfif form.property_state neq "">
Where state = '#form.property_state#'
<cfelse>
Where state = '00000000'

</cfif>

and (exclude_from_ordering = 'False' or exclude_from_ordering IS NULL)

<cfif form.property_zip neq "">
and zip = '#form.property_zip#'
<cfelse>
and zip = '00000000'
</cfif>

order by county
</CFQUERY>




<CFQUERY datasource="#request.dsn#" NAME="get_cities">
SELECT    DISTINCT city
FROM      Zip_info
<cfif form.property_state neq "">
Where state = '#form.property_state#'
<cfelse>
Where state = '00000000'

</cfif>
and (exclude_from_ordering = 'False' or exclude_from_ordering IS NULL)
<cfif form.property_zip neq "">
and zip = '#form.property_zip#'
<cfelse>
and zip = '00000000'
</cfif>

and zip = '#form.property_zip#'


order by city
</CFQUERY>


<style>
TD {font-family:Arial, Helvetica, sans-serif; font-size:9pt; color:#000033; font-weight:bold}
.small_italic {font-family:Arial, Helvetica, sans-serif; font-size:9pt; color:#000033; font-weight:normal; font-style:italic}
</style>



<script language="javascript">
function Validate_Form()
{



var message = "The Following fields must be completed:\n";
var complete = 1;

if (document.form.transaction_type.value=='') {
complete = 0
message = message + "Transction Type\n";
 alert(message);
return false;
}

if (document.form.property_state.value=='') {
complete = 0
message = message + "State\n";
 }

if (document.form.property_zip.value=='') {
complete = 0
message = message + "Zip Code\n";
 }

if (document.form.property_county.value=='') {
complete = 0
message = message + "County\n";
 }

if (document.form.property_city.value=='') {
complete = 0
message = message + "City\n";
 }

if (document.form.transaction_type.value=="Refinance" || (document.form.transaction_type.value=="Construction" && document.form.borrower_owns[0].checked)) {
if (document.form.loan_amount.value=='' || document.form.loan_amount.value==0) {
complete = 0
message = message + "Loan Amount\n";
 }
 }

if (document.form.transaction_type.value=="Purchase" || (document.form.transaction_type.value=="Construction" && document.form.borrower_owns[1].checked)) {
if (document.form.purchase_price.value=='' || document.form.purchase_price.value==0) {
complete = 0
message = message + "Purchase Price\n";
 }
}


if (document.form.transaction_type.value=='Refinance' || document.form.transaction_type.value=='Second Mortgage'  || (document.form.transaction_type.value=="Construction" && document.form.borrower_owns[0].checked)) {
if (document.form.property_state.value=='MD' || document.form.property_state.value=='TX' || document.form.property_state.value=='VA' || document.form.property_state.value=='PA' || document.form.property_state.value=='DC') {
if (document.form.previous_loan_amount.value=='')  {
complete = 0
message = message + "Balance of Loan to be paid off\n";
 }


if (document.form.property_state.value=='TX' || document.form.property_state.value=='NV') {
if (document.form.previous_loan_year.value=='')  {
complete = 0
message = message + "Previous Loan Year\n";
 }
if (document.form.previous_loan_month.value=='')  {
complete = 0
message = message + "Previous Loan Month\n";
 }
}

 }
}



if (complete == 0) {
alert(message);
return false;
} else {
document.form.fee_submit.value='Calculate Fees';
submit_form()
}
}

 </script>

<body onLoad="check_new_deed();">
 <CFFORM ACTION="#CGI.SCRIPT_NAME#?#Replace(CGI.QUERY_STRING,'calc_id','calc_id2')#" NAME="form" METHOD="POST">
<input type="hidden" name="current_orders" value="<cfoutput>#form.current_orders#</cfoutput>">
<input type="hidden" name="update_this_title_id" value="<cfoutput>#form.update_this_title_id#</cfoutput>">
<input type="hidden" name="update_this_prop_id" value="<cfoutput>#form.update_this_prop_id#</cfoutput>">
<input type="hidden" name="send_quote" value="0">
<center>
<cfif dont_show eq 0>
<table cellpadding="1" cellspacing="0" bgcolor="#e9e9e9"><tr>
<td>
<table width="655" cellpadding="3" cellspacing="3" bgcolor="#FFFFFF">
  <tr>
    <td align="left" valign="top" width="110"  bgcolor="#e9e9e9">Transaction Type</td>
    <td align="left" valign="top" width="60" bgcolor="#e9e9e9">State</td>
    <td align="left" valign="top" width="60" bgcolor="#e9e9e9">Zip Code</td>
    <td align="left" valign="top" width="160" bgcolor="#e9e9e9">County</td>
    <td align="left" valign="top" width="120" bgcolor="#e9e9e9">City</td>
    <td align="left" valign="top" width="140" bgcolor="#e9e9e9"><cfif form.transaction_type eq 'Reverse Mortgage'>Max. Claim Limit<cfelse>Loan Amount</cfif></td>
  </tr>
  <tr>
    <td align="left" valign="top"  bgcolor="#e9e9e9"><select name="transaction_type" onChange="submit_form();" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;width=100">
	<option value="" selected>Select</option>
	
	<cfif (form.property_state neq 'HI' and form.property_state neq 'AK' and form.property_state neq 'OR' and form.property_state neq 'CA' and form.property_state neq 'WA' and form.property_state neq 'NV' and form.property_state neq 'UT' and form.property_state neq 'ID' and form.property_state neq 'NM' and form.property_state neq 'WY' and form.property_state neq 'OK' and form.property_state neq 'SD' and form.property_state neq 'AR' and form.property_state neq 'IA') or (get_comp_info.ID EQ 9165 or get_comp_info.ID EQ 11726)><option value="Purchase" <cfif form.transaction_type eq "Purchase">selected</cfif>>Purchase</option></cfif>
	<option value="Refinance" <cfif form.transaction_type eq "Refinance">selected</cfif>>Refinance</option>
	<option value="Second Mortgage" <cfif form.transaction_type eq "Second Mortgage">selected</cfif>>2nd Mortgage</option>
	<option value="Reverse Mortgage" <cfif form.transaction_type eq "Reverse Mortgage">selected</cfif>>Reverse Mortgage</option>
	<cfif allow_construction_loans eq 1>
	<option value="Construction" <cfif form.transaction_type eq "Construction">selected</cfif>>Construction</option>
	</cfif>
	</select></td>
	<td align="left" valign="top"  bgcolor="#e9e9e9">
	<select name="property_state" onchange="submit_form();" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none; width=50">
	<option value="">Select</option>
<cfif IsDefined("session.comp_id") and session.comp_id eq 3704>
	<cfoutput query="read_state_list">
	
	<option value="#read_state_list.st_abbrev#" <cfif form.property_state eq read_state_list.st_abbrev>selected</cfif>>#read_state_list.st_abbrev#</option>
	
	</cfoutput>
<cfelse>
	<cfoutput query="get_states">
	
	<option value="#get_states.st_abbrev#" <cfif form.property_state eq get_states.st_abbrev>selected</cfif> >#get_states.st_abbrev#</option>
	
	</cfoutput>
</cfif>

</td>

	<td align="left" valign="top"  bgcolor="#e9e9e9">
	<select name="property_zip" onchange="submit_form();" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none; width=60">
	<option value="">Select</option>
	<cfoutput query="get_zips">
	<option value="#get_zips.zip#" <cfif form.property_zip eq get_zips.zip or get_zips.recordcount eq 1>selected</cfif>>#get_zips.zip#</option>
	</cfoutput>
	</td>
	<td align="left" valign="top"  bgcolor="#e9e9e9"><select name="property_county" onchange="submit_form();" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;  width: 150;">
	<option value="">Select</option>
	<cfoutput query="get_counties">

	<option value="#get_counties.county#" <cfif form.property_county eq get_counties.county or get_counties.recordcount eq 1>selected</cfif>>#get_counties.county#</option>

	</cfoutput>
	</td>

	<td align="left" valign="top"  bgcolor="#e9e9e9"><select name="property_city" onchange="submit_form();" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;  width=120">
	<option value="">Select</option>
	<cfoutput query="get_cities">
	<option value="#get_cities.city#" <cfif form.property_city eq get_cities.city or get_cities.recordcount eq 1>selected</cfif>>#get_cities.city#</option>
	</cfoutput></td>

    <td align="left" valign="top"  bgcolor="#e9e9e9"><input type="text" name="loan_amount" value="<cfoutput>#form.loan_amount#</cfoutput>" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;  width=140"></td>


  </tr>
  <tr><td colspan="4" >&nbsp;</td><td colspan="2" bgcolor="#e9e9e9" align="center">Do you know the number of pages?
  <br><input type="radio" <cfif form.knowpages EQ 0>checked</cfif> onclick="$('.pagenum').hide()" name="knowpages" value="0"> No <input type="radio" onclick="$('.pagenum').show()" name="knowpages" <cfif form.knowpages EQ 1>checked</cfif> value="1"> Yes
  </td></tr>
  <tr class="pagenum" <cfif form.knowpages EQ 0>style="display:none"</cfif>>
	<td colspan="4">&nbsp;</td>
	<td bgcolor="#e9e9e9">Mortgage Pages</td>

  <td align="left"  bgcolor="#e9e9e9">Deed Pages</td>
  </tr>
  <tr class="pagenum" <cfif form.knowpages EQ 0>style="display:none"</cfif>> 
	<td colspan="4">&nbsp;</td>
	<td bgcolor="#e9e9e9"><select name="mortgage_pages" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;  width=140">
										<cfloop from="1" to="40" index="i">
											<option value="<cfoutput>#i#</cfoutput>" <cfif i EQ form.mortgage_pages>selected</cfif>><cfoutput>#i#</cfoutput></option>
										</cfloop>
										</select>
										</td>

  <td align="left"  bgcolor="#e9e9e9">
								<select name="deed_pages" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;  width=140">
										<cfloop from="1" to="40" index="i">
											<option value="<cfoutput>#i#</cfoutput>" <cfif i EQ form.deed_pages>selected</cfif>><cfoutput>#i#</cfoutput></option>
										</cfloop>
										</select>
			
  </td>
  </tr>
  <cfif form.transaction_type eq "Purchase" or (form.transaction_type eq 'Construction' and form.borrower_owns eq 0)>
  <cfif form.property_state eq 'CT' or form.property_state eq 'VT' or form.property_state eq 'MD'>

  <tr>
  <td colspan="3">First Time Home Buyer?&nbsp;&nbsp;<select name="first_time_buyer" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;width=60">
	<option value="0" <cfif form.first_time_buyer eq 0>selected</cfif>>No</option>
	<option value="1" <cfif form.first_time_buyer eq 1>selected</cfif>>Yes</option></td>
  <td bgcolor="#e9e9e9">Enhanced Title Insurance*</td>
 <td align="left"  bgcolor="#e9e9e9">Property Use Type</td>
  <td align="left"  bgcolor="#e9e9e9">Purchase Price</td>
  </tr>
  
  <tr>
  <td colspan="3"><input type="hidden" name="fee_submit" value="">

  &nbsp;<input type="button" value="Calculate Fees" name="fee_submit_button"  style="font-size: 12;
										font-family: verdana;
										font-style: normal;
										color: black;
										border-color: gray;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none; background-color:#FFCC66" onClick="document.form.current_orders.value = 0;document.form.update_this_title_id.value = 0;document.form.update_this_prop_id.value = 0;return Validate_Form();">
										<cfset calc_button_shown = 1>
										
</td>
										<td>
										<cfif read_company.enhanced_coverage eq 1 and (form.transaction_type eq 'Purchase' or form.property_state eq 'PA')>
										<select name="enhanced_coverage" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;width=150">
	<option value="0" <cfif form.enhanced_coverage eq 0>selected</cfif>>No</option>
	<option value="1" <cfif form.enhanced_coverage eq 1>selected</cfif>>Yes</option>
	<cfelse>
	<input type="hidden" name="enhanced_coverage" value="0">
	</cfif>
	</td>

<td  bgcolor="#e9e9e9"><select name="property_use_type" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;width=150"  onchange="submit_form();">
	<option value="1" <cfif form.property_use_type eq 1>selected</cfif>>Primary Residence</option>
	<option value="2" <cfif form.property_use_type eq 2>selected</cfif>>Investment/Other</option></td>
  <td align="left"  bgcolor="#e9e9e9"><input type="text" name="purchase_price" value="<cfoutput>#form.purchase_price#</cfoutput>" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;  width=140"></td>
  </tr>

  <cfelse>
  

  <tr>

  <cfif form.property_state eq 'VA'>
   <td colspan="3">&nbsp;</td>
  <td bgcolor="#e9e9e9">Assessed Value</td>
  <cfelse>
   <td colspan="4">&nbsp;</td>
  </cfif>

  <td bgcolor="#e9e9e9">Enhanced Title Insurance*</td>

  <td align="left"  bgcolor="#e9e9e9">Purchase Price</td>
  </tr>
  <tr>
  <td colspan="3"><cfif calc_button_shown eq 0><input type="hidden" name="fee_submit" value="">
  &nbsp;<input type="button" value="Calculate Fees" name="fee_submit_button"  style="font-size: 12;
										font-family: verdana;
										font-style: normal;
										color: black;
										border-color: gray;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none; background-color:#ffcc66" onClick="document.form.current_orders.value = 0;document.form.update_this_title_id.value = 0;document.form.update_this_prop_id.value = 0;return Validate_Form();">
										<cfset calc_button_shown = 1>
										<cfelse>
										&nbsp;
										</cfif>
										</td>

<cfif form.property_state eq 'VA'>
										<td><input type="text" name="assessed_value" value="<cfoutput>#form.assessed_value#</cfoutput>" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;  width=140"></td>
										<cfelse>
										<td>&nbsp;</td></cfif>
<td bgcolor="#e9e9e9">

<cfif read_company.enhanced_coverage eq 1 and form.transaction_type eq 'Purchase' or (form.transaction_type eq 'Refinance' and form.new_deed eq 1)>
										<select name="enhanced_coverage" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;width=150">
	<option value="0" <cfif form.enhanced_coverage eq 0>selected</cfif>>No</option>
	<option value="1" <cfif form.enhanced_coverage eq 1>selected</cfif>>Yes</option>
	<cfelse>
	<input type="hidden" name="enhanced_coverage" value="0">
	</cfif>
	</td>
  <td align="left"  bgcolor="#e9e9e9"><input type="text" name="purchase_price" value="<cfoutput>#form.purchase_price#</cfoutput>" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;  width=140"></td>
  </tr>
  </cfif>

  <cfelseif form.transaction_type eq "Refinance" or form.transaction_type eq "Second Mortgage" or form.transaction_type eq "Reverse Mortgage" or (form.transaction_type eq 'Construction' and form.borrower_owns eq 1)>
 <cfif form.property_state eq "TX" or form.property_state eq "CA" or form.property_state eq "VA" or form.property_state eq "DC" or form.property_state eq "NV" or (form.property_state eq "PA" and (form.transaction_type eq "Refinance" or form.transaction_type eq "Reverse Mortgage" or (form.transaction_type eq 'Construction' and form.borrower_owns eq 1))) or ((form.transaction_type eq "Refinance" or form.transaction_type eq "Reverse Mortgage" or (form.transaction_type eq 'Construction' and form.borrower_owns eq 1)) and read_company.allow_subrates eq 1) and (form.property_state neq "MD" and (form.transaction_type eq "Refinance" or form.transaction_type eq "Reverse Mortgage" or (form.transaction_type eq 'Construction' and form.borrower_owns eq 1))) or (read_company.allow_reissue_rates eq 'True')>

<cfif ListFindNoCase(owners_states, '#form.property_state#', ",")>
  <tr>
  <td colspan="3">&nbsp;
  </td>
 <td  bgcolor="#e9e9e9">Previous Purchase Month</td>
  <td  bgcolor="#e9e9e9">Previous Purchase Year</td>
  <td align="left"  bgcolor="#e9e9e9" width="140">Previous Purchase Price</td>
  </tr>
<cfelse>
  <tr>
  <td colspan="3">&nbsp;</td>
 <td  bgcolor="#e9e9e9">Previous Loan Month</td>
  <td  bgcolor="#e9e9e9">Previous Loan Year</td>
<td align="left"  bgcolor="#e9e9e9" width="140">Previous Loan Balance</td>
 </tr>
<cfset prev_loan_balance_shown = 1>
</cfif>


<cfif ListFindNoCase(owners_states, '#form.property_state#', ",")>
<tr>
  <td colspan="2"><cfif calc_button_shown eq 0><input type="hidden" name="fee_submit" value="">
  &nbsp;<input type="button" value="Calculate Fees" name="fee_submit_button"  style="font-size: 12;
										font-family: verdana;
										font-style: normal;
										color: black;
										border-color: gray;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none; background-color:#ffcc66" onClick="document.form.current_orders.value = 0;document.form.update_this_title_id.value = 0;document.form.update_this_prop_id.value = 0;return Validate_Form();">
										<cfset calc_button_shown = 1>
										<cfelse>
										&nbsp;
										</cfif>
										</td>
<td width="60">&nbsp;</td>
  <td align="left"  bgcolor="#e9e9e9"><select name="previous_purch_month" onChange="submit_form();" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;width=150">
	<option value="" selected>Select</option>
	<option value="1" <cfif form.previous_purch_month eq 1>selected</cfif>>January</option>
	<option value="2" <cfif form.previous_purch_month eq 2>selected</cfif>>February</option>
	<option value="3" <cfif form.previous_purch_month eq 3>selected</cfif>>March</option>
	<option value="4" <cfif form.previous_purch_month eq 4>selected</cfif>>April</option>
	<option value="5" <cfif form.previous_purch_month eq 5>selected</cfif>>May</option>
	<option value="6" <cfif form.previous_purch_month eq 6>selected</cfif>>June</option>
	<option value="7" <cfif form.previous_purch_month eq 7>selected</cfif>>July</option>
	<option value="8" <cfif form.previous_purch_month eq 8>selected</cfif>>August</option>
	<option value="9" <cfif form.previous_purch_month eq 9>selected</cfif>>September</option>
	<option value="10" <cfif form.previous_purch_month eq 10>selected</cfif>>October</option>
	<option value="11" <cfif form.previous_purch_month eq 11>selected</cfif>>November</option>
	<option value="12" <cfif form.previous_purch_month eq 12>selected</cfif>>December</option>

	</select></td>
  <td align="left"  bgcolor="#e9e9e9"><input type="text" name="previous_purch_year" value="<cfoutput>#form.previous_purch_year#</cfoutput>" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;  width=100"></td>

  <td align="left"  bgcolor="#e9e9e9"><input type="text" name="previous_purch_amount" value="<cfoutput>#form.previous_purch_amount#</cfoutput>" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;  width=140"></td>
  </tr>
  <cfelse>

<tr>
  <td colspan="2"><cfif calc_button_shown eq 0><input type="hidden" name="fee_submit" value="">
  &nbsp;<input type="button" value="Calculate Fees" name="fee_submit_button"  style="font-size: 12;
										font-family: verdana;
										font-style: normal;
										color: black;
										border-color: gray;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none; background-color:#ffcc66" onClick="document.form.current_orders.value = 0;document.form.update_this_title_id.value = 0;document.form.update_this_prop_id.value = 0;return Validate_Form();">
										<cfset calc_button_shown = 1>
										<cfelse>
										&nbsp;
										</cfif>
										</td>
<td width="60">&nbsp;</td>
  <td align="left"  bgcolor="#e9e9e9"><select name="previous_loan_month" onChange="submit_form();" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;width=150">
	<option value="" selected>Select</option>
	<option value="1" <cfif form.previous_loan_month eq 1>selected</cfif>>January</option>
	<option value="2" <cfif form.previous_loan_month eq 2>selected</cfif>>February</option>
	<option value="3" <cfif form.previous_loan_month eq 3>selected</cfif>>March</option>
	<option value="4" <cfif form.previous_loan_month eq 4>selected</cfif>>April</option>
	<option value="5" <cfif form.previous_loan_month eq 5>selected</cfif>>May</option>
	<option value="6" <cfif form.previous_loan_month eq 6>selected</cfif>>June</option>
	<option value="7" <cfif form.previous_loan_month eq 7>selected</cfif>>July</option>
	<option value="8" <cfif form.previous_loan_month eq 8>selected</cfif>>August</option>
	<option value="9" <cfif form.previous_loan_month eq 9>selected</cfif>>September</option>
	<option value="10" <cfif form.previous_loan_month eq 10>selected</cfif>>October</option>
	<option value="11" <cfif form.previous_loan_month eq 11>selected</cfif>>November</option>
	<option value="12" <cfif form.previous_loan_month eq 12>selected</cfif>>December</option>

	</select></td>
  <td align="left"  bgcolor="#e9e9e9"><input type="text" name="previous_loan_year" value="<cfoutput>#form.previous_loan_year#</cfoutput>" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;  width=100"></td>

  <td align="left"  bgcolor="#e9e9e9"><input type="text" name="previous_loan_amount" value="<cfoutput>#form.previous_loan_amount#</cfoutput>" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;  width=140"></td>
  </tr>
  </cfif>
</cfif>

 <cfif (form.property_state eq "MD" or form.property_state eq "NY" or form.transaction_type eq "Reverse Mortgage" or ListFindNoCase(owners_states, '#form.property_state#', ","))>
 
<cfif prev_loan_balance_shown eq 0>
   <tr>
  <td colspan="4">&nbsp;</td>
  <td  bgcolor="#e9e9e9">Property Use Type</td>
  <td align="left"  bgcolor="#e9e9e9">Balance of Loan to be paid off</td>
  </tr>
  <tr>
  <td colspan="2"><cfif calc_button_shown eq 0><input type="hidden" name="fee_submit" value="">
  &nbsp;<input type="button" value="Calculate Fees" name="fee_submit_button"  style="font-size: 12;
										font-family: verdana;
										font-style: normal;
										color: black;
										border-color: gray;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none; background-color:#ffcc66" onClick="document.form.current_orders.value = 0;document.form.update_this_title_id.value = 0;document.form.update_this_prop_id.value = 0;return Validate_Form();">
										<cfset calc_button_shown = 1>
										<cfelse>
										&nbsp;
										</cfif>
										</td>
										<td  colspan="2" bgcolor="#ffffff">&nbsp;</td>
  <td  bgcolor="#e9e9e9"><select name="property_use_type" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;width=150"  onchange="submit_form();">
	<option value="1" <cfif form.property_use_type eq 1>selected</cfif>>Primary Residence</option>
	<option value="2" <cfif form.property_use_type eq 2>selected</cfif>>Investment/Other</option>
	</td>
 <td align="left"  bgcolor="#e9e9e9"><input type="text" name="previous_loan_amount" value="<cfoutput>#form.previous_loan_amount#</cfoutput>" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;  width=140"></td>
</tr>
<cfelse>

  <tr>
  <td colspan="4">&nbsp;</td>
  <td  bgcolor="#e9e9e9">Is this a CEMA Loan?</td>
  <td  bgcolor="#e9e9e9">Property Use Type</td>
  </tr>
  <tr>
  <td colspan="2"><cfif calc_button_shown eq 0><input type="hidden" name="fee_submit" value="">
  &nbsp;<input type="button" value="Calculate Fees" name="fee_submit_button"  style="font-size: 12;
										font-family: verdana;
										font-style: normal;
										color: black;
										border-color: gray;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none; background-color:#ffcc66" onClick="document.form.current_orders.value = 0;document.form.update_this_title_id.value = 0;document.form.update_this_prop_id.value = 0;return Validate_Form();">
										<cfset calc_button_shown = 1>
										<cfelse>
										&nbsp;
										</cfif>
										</td>
										<td  colspan="2" bgcolor="#ffffff">&nbsp;</td>
<td  bgcolor="#e9e9e9"><input type="radio" id="cema"  name="cema" value="1" <cfif form.cema eq 1>checked</cfif>>Yes&nbsp;&nbsp;&nbsp;<input type="radio" name="cema" id="cema" value="0" <cfif form.cema eq 0>checked</cfif>>No</td>

  <td  bgcolor="#e9e9e9"><select name="property_use_type" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;width=150"  onchange="submit_form();">
	<option value="1" <cfif form.property_use_type eq 1>selected</cfif>>Primary Residence</option>
	<option value="2" <cfif form.property_use_type eq 2>selected</cfif>>Investment/Other</option>
	</td>
	</tr>
</cfif>

<cfelse>
<tr><td>&nbsp;</td></tr>
<tr><td colspan="2"><cfif calc_button_shown eq 0><input type="hidden" name="fee_submit" value="">
  &nbsp;<input type="button" value="Calculate Fees" name="fee_submit_button"  style="font-size: 12;
										font-family: verdana;
										font-style: normal;
										color: black;
										border-color: gray;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none; background-color:#ffcc66" onClick="document.form.current_orders.value = 0;document.form.update_this_title_id.value = 0;document.form.update_this_prop_id.value = 0;return Validate_Form();">
										<cfset calc_button_shown = 1>
										<cfelse>
										&nbsp;
										</cfif>
										</td></tr>
   </cfif>
<cfelse>
<tr><td>&nbsp;</td></tr>
<tr><td colspan="2"><cfif calc_button_shown eq 0><input type="hidden" name="fee_submit" value="">
  &nbsp;<input type="button" value="Calculate Fees" name="fee_submit_button"  style="font-size: 12;
										font-family: verdana;
										font-style: normal;
										color: black;
										border-color: gray;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none; background-color:#ffcc66" onClick="document.form.current_orders.value = 0;document.form.update_this_title_id.value = 0;document.form.update_this_prop_id.value = 0;return Validate_Form();">
										<cfset calc_button_shown = 1>
										<cfelse>
										&nbsp;
										</cfif>
										</td></tr>
  </cfif>
  
<cfif form.transaction_type eq 'Refinance' and form.property_county eq 'Prince Georges' and form.property_use_type eq '1'>
<tr><td colspan=5>Have you had a purchase money mortgage for more than 12 months?<BR>
<input type="radio" id="previous_purchase_mortgage"  name="previous_purchase_mortgage" value="1" <cfif form.previous_purchase_mortgage eq 1>checked</cfif>  onclick="submit_form();">Yes&nbsp;&nbsp;&nbsp;<input type="radio" name="previous_purchase_mortgage" id="previous_purchase_mortgage" value="0" <cfif form.previous_purchase_mortgage eq 0>checked</cfif>  onclick="submit_form();">No<br><br></td></tr>
</cfif>
  
<cfif form.transaction_type eq 'Construction'>
<tr id="const_loan" style="display: block;"><td colspan=10>Does Borrower own the property?<br>
<input type="radio" id="borrower_owns"  name="borrower_owns" value="1" <cfif form.borrower_owns eq 1>checked</cfif>  onclick="submit_form();">Yes&nbsp;&nbsp;&nbsp;<input type="radio" name="borrower_owns" id="borrower_owns" value="0" <cfif form.borrower_owns eq 0>checked</cfif>  onclick="submit_form();">No<br><br>
Choose Closing:
<select name="closing_type" id="closing_type" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;width=150" onChange="check_end_loan_original_loan_amount(); document.form.submit();">
	<option value="1" <cfif form.closing_type eq 1>selected</cfif>>1x Closing</option>
	<option value="2" <cfif form.closing_type eq 2>selected</cfif>>2x Closing</option>
	<option value="3" <cfif form.closing_type eq 3>selected</cfif>>End Loan</option>
</select>
</td></tr>
<tr id="perm_original_loan" name="perm_original_loan" style="display: <cfif form.closing_type eq 3>block;<cfelse>none;</cfif>"><td colspan=10>Original Loan Amount<br>
<input type="text" id="end_loan_original_loan_amount"  name="end_loan_original_loan_amount" value="<cfoutput>#form.end_loan_original_loan_amount#</cfoutput>" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;width=75"></td></tr>


<tr><td colspan=10>Number of Construction Draws Needed:<br>
<select name="construction_draws" id="construction_draws" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;width=50">
	<option value="0" <cfif form.construction_draws eq 0>selected</cfif>>0</option>
	<option value="1" <cfif form.construction_draws eq 1>selected</cfif>>1</option>
	<option value="2" <cfif form.construction_draws eq 2>selected</cfif>>2</option>
	<option value="3" <cfif form.construction_draws eq 3>selected</cfif>>3</option>
	<option value="4" <cfif form.construction_draws eq 4>selected</cfif>>4</option>
	<option value="5" <cfif form.construction_draws eq 5>selected</cfif>>5</option>
	<option value="6" <cfif form.construction_draws eq 6>selected</cfif>>6</option>
	<option value="7" <cfif form.construction_draws eq 7>selected</cfif>>7</option>
	<option value="8" <cfif form.construction_draws eq 8>selected</cfif>>8</option>
	<option value="9" <cfif form.construction_draws eq 9>selected</cfif>>9</option>
	<option value="10" <cfif form.construction_draws eq 10>selected</cfif>>10</option>
</select></td></tr>
</cfif>  
  
  
  
  
  
  
<!---
1. How many parties on title ?
2. Do you wan tto add or remove parties from title 
3. How many (that are non-exempt) ?
--->

<cfif form.transaction_type eq 'Refinance' and get_comp_info.ID eq 1754 and form.property_state eq 'MD'><tr><td colspan=5>Will there be a deed adding or removing a party on title?<br>
<input type="radio" id="new_deed"  name="new_deed" value="1" <cfif form.new_deed eq 1>checked</cfif> onClick="check_new_deed();">Yes&nbsp;&nbsp;&nbsp;<input type="radio" name="new_deed" id="new_deed" value="0" <cfif form.new_deed eq 0>checked</cfif> onClick="check_new_deed();">No<br></td></tr>
<tr id="title_new_deed_table" style="display: none;"><td colspan=5>
<cfoutput>How many parties are currently on the title?&nbsp;<input type="text" name="current_deed_num" id="current_deed_num" size=2 value="#form.current_deed_num#"> <br>
Do you want to add or remove parties from title?&nbsp;&nbsp;<input type="radio" id="add_or_remove"  name="add_or_remove" value="add" <cfif form.add_or_remove eq 'add'>checked</cfif> >Add&nbsp;&nbsp;&nbsp;<input type="radio" name="add_or_remove" id="add_or_remove" value="remove" <cfif form.add_or_remove eq 'remove'>checked</cfif>>Remove<BR>
How many (that are non-exempt)?&nbsp;&nbsp;<input type="text" name="add_or_remove_num" id="add_or_remove_num" size=2 value="#form.add_or_remove_num#"> <br>
</cfoutput>
 </td></tr></cfif>

<cfif form.underwriter_choice eq 25 and (form.property_state eq 'MD' or form.property_state eq 'DC' or form.property_state eq 'MI' or form.property_state eq 'VA' or form.property_state eq 'CO') >
 <input type="hidden" name="same_lender" value="0">
<cfelseif form.transaction_type eq 'Refinance'  or (form.transaction_type eq 'Construction' and form.borrower_owns eq 1) and (read_company.allow_subrates eq 1 or form.property_state eq 'DC') >
<tr><td colspan="6" align="right">Was the previous policy issued to the same lender?&nbsp;&nbsp;<input type="radio" id="same_lender"  name="same_lender" value="1" <cfif form.same_lender eq 1>checked</cfif>  onclick="document.getElementById('reissue_rates').checked = false;"  >Yes&nbsp;&nbsp;&nbsp;<input type="radio" name="same_lender" value="0" <cfif form.same_lender eq 0>checked</cfif>>No<br>
<span class="small_italic">Lender must be existing mortgage holder or recorded assignee. </span><br>
  </td></tr>
  <cfelse>
  <input type="hidden" name="same_lender" value="0">
</cfif>


<cfif form.underwriter_choice eq 25 and (form.property_state eq 'MD' or form.property_state eq 'DC' or form.property_state eq 'VA') or (form.underwriter_choice eq 30 and form.property_state eq 'VA')>
  <input type="hidden" name="reissue_rates" value="0">
<cfelseif form.underwriter_choice eq 16 and (form.property_state eq 'MD' or form.property_state eq 'VA')>
  <input type="hidden" name="reissue_rates" value="0">
<cfelseif (read_company.allow_reissue_rates eq 'True') and (form.transaction_type eq 'Refinance' or form.transaction_type eq "Reverse Mortgage" or (form.transaction_type eq 'Construction' and form.borrower_owns eq 1))>
<tr><td colspan="6" align="right">Do reissue Rates Apply?&nbsp;&nbsp;<input type="radio" id="reissue_rates"  name="reissue_rates" value="1" <cfif form.reissue_rates eq 1>checked</cfif>  onclick="document.getElementById('same_lender').checked = false;">Yes&nbsp;&nbsp;&nbsp;<input type="radio" name="reissue_rates" value="0" <cfif form.reissue_rates eq 0>checked</cfif>>No<br></b>
<span class="small_italic">Prior Policy copy must be provided to receive discounted rate. Lenders and or owners policy must be provided to receive the re-issue rate if checking “yes”.</span>
  </td></tr>
  <cfelse>
  <input type="hidden" name="reissue_rates" value="0">
</cfif>
<input type="hidden" name="jlp_policy" value="0">
<!---<cfif form.transaction_type eq 'Second Mortgage' and ListContainsNoCase(jlp_states, form.Property_State, ",") and form.Loan_Amount LTE 200000>
<tr><td colspan="6" align="right">Is this a Junior Loan Policy?&nbsp;&nbsp;<input type="radio" name="jlp_policy" value="1" <cfif form.jlp_policy eq 1>checked</cfif>>Yes&nbsp;&nbsp;&nbsp;<input type="radio" name="jlp_policy" value="0" <cfif form.jlp_policy eq 0>checked</cfif>>No
  </td></tr>
 <cfelse>
  <input type="hidden" name="jlp_policy" value="0">
</cfif>--->
</table>
</td></tr></table>

<cfif get_comp_info.streamline_client eq 'True' and form.transaction_type eq 'Purchase' and (form.property_state eq 'MI' or form.property_state eq 'VA' or form.property_state eq 'MD')>
<table><tr><td><input type="checkbox" name="seller_paid_lender_policy" value="1" <cfif form.seller_paid_lender_policy eq 1>checked</cfif>> Seller Paid Lender's Policy<br>
<input type="checkbox" name="seller_paid_owner_policy" value="1" <cfif form.seller_paid_owner_policy eq 1>checked</cfif>> Seller Paid Owner's Policy<br>
</td></tr></table>
<cfelse>
<input type="hidden" name="seller_paid_lender_policy" value="0">
<input type="hidden" name="seller_paid_owner_policy" value="0">
</cfif>



















<!--- new Alta Form --->


<CFQUERY datasource="#request.dsn#" NAME="altas">
select * from Alta_fees where state = '#form.property_state#' and (transaction_type = '#form.transaction_type#' or transaction_type = 'All') order by short_id
</CFQUERY>


<cfif altas.recordcount neq 0>
<table>
<tr>
<td align="left" valign="top" width="350"><font size="-2">ALTA Endorsements
</tr>
<tr>
<cfif form.property_state eq 'TX'>
<td align="left" valign="top" width="350"><font size="-2">
STANDARD ENDORSEMENTS <BR>
<cfoutput query="altas">
<cfif altas.short_id eq 'opt_tx_2' or altas.short_id eq 'opt_tx_3' or altas.short_id eq 'opt_tx_4' or altas.short_id eq 'opt_tx_5' or altas.short_id eq 'opt_tx_6' or altas.short_id eq 'opt_tx_12'>
<input type="checkbox" value="1" name="#altas.short_id#" <cfif #Evaluate("form.#altas.short_id#")# eq 1 or altas.mandatory eq 'True'>checked</cfif> >&nbsp;#altas.long_description#<br>
</cfif>
</cfoutput>
</td>
<td align="left" valign="top"><font size="-2">
ADDITIONAL ENDORSEMENTS IF APPLICABLE:<BR>
<cfoutput query="altas">
<cfif altas.short_id eq 'opt_tx_7' or altas.short_id eq 'opt_tx_8' or altas.short_id eq 'opt_tx_11' or altas.short_id eq 'opt_tx_13' or altas.short_id eq 'opt_tx_14'>
<input type="checkbox" value="1" name="#altas.short_id#" <cfif #Evaluate("form.#altas.short_id#")# eq 1 or altas.mandatory eq 'True'>checked</cfif> >&nbsp;#altas.long_description#<br>
</cfif>
</cfoutput>
<br>
HOME EQUITY ENDORSEMENTS IF APPLICABLE:<BR>
<cfoutput query="altas">

<cfif altas.short_id eq 'opt_tx_9' or altas.short_id eq 'opt_tx_10'>
<input type="checkbox" value="1" name="#altas.short_id#" <cfif #Evaluate("form.#altas.short_id#")# eq 1 or altas.mandatory eq 'True'>checked</cfif> >&nbsp;#altas.long_description#<br>
</cfif>
</cfoutput>
</td>
<cfelse>
<td align="left" valign="top" width="400"><font size="-2">
<cfoutput query="altas">
<cfif altas.currentrow GTE (altas.recordcount / 2 + 1) and altas.currentrow LT (altas.recordcount / 2 + 2) and altas.currentrow gt 3>
</td>
<td align="left" valign="top" width="400"><font size="-2">
</cfif>
<input type="checkbox" value="1" name="#altas.short_id#" <cfif #Evaluate("form.#altas.short_id#")# eq 1 or altas.mandatory eq 'True'>checked</cfif> >&nbsp;#altas.long_description#<br>
</cfoutput>
</td>
</cfif>
</tr>
</table>
</cfif>

<!--- END new Alta Form --->

<!--- NEW HUD --->
<table>
<tr>
<td align="left" valign="top" width="20%"><font size="-2"><cfif get_comp_info.streamline_client eq 'True' and get_comp_info.streamline_controls eq 'True'>
Asset&nbsp;Manager&nbsp;/&nbsp;Seller&nbsp;&nbsp;<select NAME="asset_manager"

									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" >
									<option value="" <cfif form.asset_manager eq ''>selected</cfif>>N/A</option>
									<option value="3191" <cfif form.asset_manager eq '3191'>selected</cfif>>M & T Bank - REO Division</option>
									<option value="2368" <cfif form.asset_manager eq '2368'>selected</cfif>>Freddie Mac</option>
									<option value="3568" <cfif form.asset_manager eq '3568'>selected</cfif>>Fannie Mae</option>
									<option value="3182" <cfif form.asset_manager eq '3182'>selected</cfif>>Rosicki, Rosicki and Associates</option>
									<option value="3728" <cfif form.asset_manager eq '3728'>selected</cfif>>LPS Default Title</option>
									</select><BR><BR>
<cfelse>
<input type="hidden" name="asset_manager" value=""><BR><BR>
</cfif>


<cfif get_comp_info.streamline_client eq 'True' and get_comp_info.streamline_controls eq 'True'>
Transfer Tax Paid By&nbsp;&nbsp;<select NAME="transfer_tax_paid_by"

									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" >
									<option value="" <cfif form.transfer_tax_paid_by eq ''>selected</cfif>>Default</option>
									<option value="Buyer" <cfif form.transfer_tax_paid_by eq 'Buyer'>selected</cfif>>Buyer</option>
									<option value="Seller" <cfif form.transfer_tax_paid_by eq 'Seller'>selected</cfif>>Seller</option>
									</select></font><br>
<cfelse>
<input type="hidden" name="transfer_tax_paid_by" value="">
</cfif>

<cfif get_comp_info.streamline_client eq 'True' and get_comp_info.streamline_controls eq 'True'>
<br>
Underwriter&nbsp;&nbsp;<select NAME="underwriter_choice"

									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" onChange="submit_form();" >
									<option value="" <cfif form.underwriter_choice eq ''>selected</cfif>>Default</option>
									<option value="16" <cfif form.underwriter_choice eq '16'>selected</cfif>>Stewart Title Guaranty Company</option>
									<option value="25" <cfif form.underwriter_choice eq '25'>selected</cfif>>First American Title Insurance Company</option>
									<option value="30" <cfif form.underwriter_choice eq '30'>selected</cfif>>North American Title Insurance Company</option>
									</select></font>
<cfelse>
<input type="hidden" name="underwriter_choice" value="16">
</cfif>


</td>
</tr>
<cfif altas.recordcount neq 0>
<tr><td colspan=2 align="center"><font size="-2">If you require an Endorsement that is not listed above, Please contact your Sales Associate to receive a specific quote.</font></td></tr>
</cfif>
</table>



<cfif ListContainsNoCase(valid_states, form.property_state, ",")>
<cfif  form.fee_submit eq 'Calculate Fees' or form.place_order eq "Place Title Order"><br>
<table><tr>
  <td valign="top"><input type="button" value="Apply This Calculation to a Current Order" name="apply_current_orders_button"  style="font-size: 12;
										font-family: verdana;
										font-style: normal;
										color: black;
										border-color: gray;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none; background-color:#ffcc66; width:275px;" onClick="document.form.current_orders.value = 1;document.form.update_this_title_id.value = 0;document.form.update_this_prop_id.value = 0;return Validate_Form();"><br>
<cfif form.current_orders eq 1>
<CFQUERY datasource="#request.dsn#" NAME="get_title_orders">
SELECT     *
FROM       title
where comp_id = '#url.comp_id#'
and cancelled IS NULL
and pstate = '#form.property_state#'
and pcity = '#form.property_city#'
and pcounty = '#form.property_county#'
and searchtype = '#form.transaction_type#'
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_property_orders">
SELECT     *
FROM       Property
where comp_id = '#url.comp_id#'
and cancelled IS NULL
and pstate = '#form.property_state#'
and pcity = '#form.property_city#'
and pcounty = '#form.property_county#'
and hud = 1
</CFQUERY>
<cfif get_title_orders.recordcount eq 0 and get_property_orders.recordcount eq 0>
<table cellpadding="1" cellspacing="0" bgcolor="#000000" width="100%"><tr><td>
<table width="100%" cellpadding="3" cellspacing="3" bgcolor="#FFFFFF">
<tr>
<td bgcolor="#FFFFFF">No records that meet the criteria have been found</td></tr></table></td></tr></table>
<cfelse>
<table cellpadding="1" cellspacing="0" bgcolor="#000000" width="100%"><tr><td>
<table width="100%" cellpadding="3" cellspacing="3" bgcolor="#FFFFFF">
<tr>
<td bgcolor="#e9e9e9"><strong>ID</strong></td>
<td bgcolor="#e9e9e9"><strong>Type</strong></td>
<td bgcolor="#e9e9e9"><strong>Borrower</strong></td>
<td bgcolor="#e9e9e9"><strong>Address</strong></td>
<td bgcolor="#e9e9e9"></td>
</tr>
<cfif get_title_orders.recordcount>
<cfoutput query="get_title_orders">
<tr>
<td><a href="title_client_report_nav.cfm?comp_id=#url.comp_id#&A_Update_DB_Flag=0&user_id_1=0&lo_id=0&rec_id=#get_title_orders.title_id#&a_trigger=1" target="new">#get_title_orders.title_id#</a></td>
<td>Title</td>
<td>#get_title_orders.blastname1#</td>
<td>#get_title_orders.paddress#</td>
<td>
<cfif form.update_this_title_id eq get_title_orders.title_id><font color="green"><i>applied</i></font><cfelse><a href="##" onClick="document.form.current_orders.value = 1;document.form.update_this_title_id.value = #get_title_orders.title_id#;document.form.update_this_prop_id.value = 0;return Validate_Form();" style="text-decoration:underline; font-color:blue;">apply</a></cfif></td>
</tr>
</cfoutput>
</cfif>
<cfif get_property_orders.recordcount>
<cfoutput query="get_property_orders">
<tr>
<td><a href="view_the_prop_order.cfm?comp_id=#url.comp_id#&A_Update_DB_Flag=0&user_id_1=0&lo_id=0&rec_id=#get_property_orders.prop_id#&a_trigger=1" target="new">#get_property_orders.prop_id#</a></td>
<td>Property</td>
<td>#get_property_orders.blastname1#</td>
<td>#get_property_orders.paddress#</td>
<td><cfif form.update_this_prop_id eq get_property_orders.prop_id><font color="green"><i>applied</i></font><cfelse><a href="##" onClick="document.form.current_orders.value = 1;document.form.update_this_title_id.value = 0;document.form.update_this_prop_id.value = #get_property_orders.prop_id#;return Validate_Form();" style="text-decoration:underline; font-color:blue;">apply</a></cfif></td>
</tr>
</cfoutput>
</cfif>
</table></td>
</tr>
</table>
</cfif>
</cfif>
<td valign="top">
<!---
<input type="button" value="Create Good Faith Estimate" name="create_gfe"  style="font-size: 12;
										font-family: verdana;
										font-style: normal;
										color: black;
										border-color: gray;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none; background-color:#ffcc66; width: 185px;" onClick="document.form.current_orders.value = 1;document.form.update_this_title_id.value = 0;document.form.update_this_prop_id.value = 0;document.calc_form.submit();">
--->


<input type="button" value="Create Loan Estimate" name="create_le"  style="font-size: 12;
										font-family: verdana;
										font-style: normal;
										color: black;
										border-color: gray;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none; background-color:#ffcc66; width: 185px;" onClick="document.form.current_orders.value = 1;document.form.update_this_title_id.value = 0;document.form.update_this_prop_id.value = 0;document.calc_form2.submit();">





<cfif cgi.SCRIPT_NAME eq "/calculator.cfm">
<cfif  form.fee_submit eq 'Calculate Fees' or form.place_order eq "Place Title Order"><td valign="top">
<form action="/gfe/place_order.cfm" target="place_order" method="post" name="postform">
<!--- <cfoutput><cfloop index="this_field" list="#form.fieldnames#" delimiters=",">
<cftry>
<cfset var = Evaluate("form.#this_field#")>
<input type="hidden" name="#this_field#" value="#var#">
<cfcatch></cfcatch></cftry>
</cfloop></cfoutput> --->
<input type="button" value="Place Title Order" name="place_order"  style="font-size: 12;
										font-family: verdana;
										font-style: normal;
										color: white;
										border-color: gray;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none; background-color:#990000" onClick="document.form.current_orders.value = 0; document.calc_form.action = '/gfe/place_order.cfm';document.calc_form.submit();" >
</td>
</tr>
<tr><td colspan=3>
<center><br>
<input type="button" value="Print Quote" name="print"  style="font-size: 12;
										font-family: verdana;
										font-style: normal;
										color: white;
										border-color: gray;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none; background-color:#990000" onClick="document.form.print_quote.value = 1;document.form.send_quote.value = 0;document.form.current_orders.value = 0;document.form.update_this_title_id.value = 0;document.form.update_this_prop_id.value = 0;return Validate_Form();" >
<input type="button" value="Save Quote" name="print"  style="font-size: 12;
										font-family: verdana;
										font-style: normal;
										color: white;
										border-color: gray;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none; background-color:#990000" onClick="document.form.save_quote.value = 1;document.form.send_quote.value = 0;document.form.current_orders.value = 0;document.form.update_this_title_id.value = 0;document.form.update_this_prop_id.value = 0;return Validate_Form();" >

<table width="500" cellpadding="3" cellspacing="0" border=1 style="border-color:#000000; border-width:1px; border-style:inset;">
<tr>
<td align="left" valign="top" bgcolor="#CCCCFF" colspan=2>Would you like to send a courtesy copy of this GUARANTEED Closing Cost Quote to a borrower or real estate agent?</td></tr>
<tr>
<td align="left" valign="top" bgcolor="#CCCCFF" width=250>
Your Name<br>
<input type="text" name="sender_name" value="<cfoutput>#form.sender_name#</cfoutput>" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;  width=180"></td>
<td align="left" valign="top" bgcolor="#CCCCFF" width=250>
Your Email Address<br>
<input type="text" name="sender_email" value="<cfoutput>#form.sender_email#</cfoutput>" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;  width=180"></td>
										</tr>
<tr>
<td align="left" valign="top" bgcolor="#CCCCFF" width=250>Agent/Borrower's Name<br>
<input type="text" name="agent_name" value="<cfoutput>#form.agent_name#</cfoutput>" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;  width=180"></td>
<td align="left" valign="top" bgcolor="#CCCCFF" width=250>Agent/Borrower's Email Address<br>
<input type="text" name="agent_email" value="<cfoutput>#form.agent_email#</cfoutput>" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;  width=180"></td></tr>
<tr>
<td align="right" valign="top" bgcolor="#CCCCFF" colspan=2><cfif form.send_quote eq 1><font color="red">Quote Sent to <cfoutput>#form.agent_email#</cfoutput></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</cfif><input type="button" value="Send" name="send_email"  style="font-size: 12;
										font-family: verdana;
										font-style: normal;
										color: white;
										border-color: gray;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none; background-color:#990000" onClick="document.form.send_quote.value = 1;document.form.current_orders.value = 0;document.form.update_this_title_id.value = 0;document.form.update_this_prop_id.value = 0;return Validate_Form();" >

<input type="hidden" name="print_quote" value="0">
<input type="hidden" name="save_quote" value="0">

</form></td>
</tr>
</table>
</center>
</cfif>

</cfif>


















<cfif form.update_this_title_id neq 0>
<cfset form.previous_loan_amount = ReplaceNocase(form.previous_loan_amount, '$', '', 'ALL')>
<cfset form.previous_loan_amount = ReplaceNocase(form.previous_loan_amount, ',', '', 'ALL')>

<cfset form.loan_amount = ReplaceNocase(form.loan_amount, '$', '', 'ALL')>
<cfset form.loan_amount = ReplaceNocase(form.loan_amount, ',', '', 'ALL')>

<cfset form.purchase_price = ReplaceNocase(form.purchase_price, '$', '', 'ALL')>
<cfset form.purchase_price = ReplaceNocase(form.purchase_price, ',', '', 'ALL')>
<CFQUERY datasource="#request.dsn#" NAME="update_title_order">
Update title
set loanamt_float = '#form.loan_amount#',
purchase = '#form.purchase_price#',
estimated_loan_float = '#form.previous_loan_amount#',
enhanced_coverage = '#form.enhanced_coverage#',
prev_loan_mo = '#form.previous_loan_month#',
prev_loan_year = '#form.previous_loan_year#',
prop_use_type = '#form.property_use_type#',
reissue_rates = '#form.reissue_rates#',
jlp_policy = '#form.jlp_policy#'
where title_id = '#update_this_title_id#'
</CFQUERY>

<!--- Here we run the new fee calculator function, and any fees it returns will overwrite their respective fees. This is because I couldn't detangle this page enough...so I let this page do it's thing and get whatever fees it gets, then I overwrite with the more accurate fee calculator fees --->
<cftry>
<cfset update_this_title_id = form.update_this_title_id>
<cfinclude template="./rick_tests/update_hud_fee_calc.cfm">
<cfinclude template="./rick_tests/update_hud_fee_calc_2010.cfm">
      <cfcatch type="Any">
        <cfoutput>
          <cfmail from="rjermain@firsttitleservices.com" to="rjermain@firsttitleservices.com" subject="Update Fees Failure: Calculator Update Title Order: #update_this_title_id#" type="html">
<!--- and the diagnostic message from the ColdFusion server --->
			<p>#cfcatch.message#</p>
			<p>Caught an exception, type = #CFCATCH.TYPE# </p>
			<p>The contents of the tag stack are:</p>
			<cfloop index = i from = 1
					to = #ArrayLen(CFCATCH.TAGCONTEXT)#>
				<cfset sCurrent = #CFCATCH.TAGCONTEXT[i]#>
				<br>#i# #sCurrent["ID"]# <br>
Line Number: #sCurrent["LINE"]#, Column: #sCurrent["COLUMN"]#<br>
					#sCurrent["TEMPLATE"]#
			</cfloop>

            <hr>
            <h1>Other Error:#cfcatch.Type#</h1>
            <ul>
              <li><b>Message:</b>#cfcatch.Message#
              <li><b>Detail:</b>#cfcatch.Detail#
              <li><B>Page:</B>#GetBaseTemplatePath()#
            </ul><br>
Form Variables<br>
			<cfdump var="#form#"><br>
<br>
URL Variables<br>
			<cfdump var="#url#"><br>
<br>
Session Variables<br>
			<cfdump var="#session#"><br>
<br>          </cfmail>
        </cfoutput>
      </cfcatch>
  </cftry>
</cfif>












<cfif form.update_this_prop_id neq 0>
<cfset form.loan_amount = ReplaceNocase(form.loan_amount, '$', '', 'ALL')>
<cfset form.loan_amount = ReplaceNocase(form.loan_amount, ',', '', 'ALL')>
<CFQUERY datasource="#request.dsn#" NAME="update_property_order">
Update Property
set <!--- loanamt_float = '#form.loan_amount#', --->
prop_use_type = '#form.property_use_type#'
where prop_id = '#update_this_prop_id#'
</CFQUERY>

<!--- Here we run the new fee calculator function, and any fees it returns will overwrite their respective fees. This is because I couldn't detangle this page enough...so I let this page do it's thing and get whatever fees it gets, then I overwrite with the more accurate fee calculator fees --->
<cftry>
<cfset update_this_prop_id = form.update_this_prop_id>
<cfinclude template="./rick_tests/update_prop_hud_fee_calc.cfm">
      <cfcatch type="Any">
        <cfoutput>
          <cfmail from="rjermain@firsttitleservices.com" to="rjermain@firsttitleservices.com" subject="Update Fees Failure: Calculator Update Prop Order: #update_this_prop_id#" type="html">
<!--- and the diagnostic message from the ColdFusion server --->
			<p>#cfcatch.message#</p>
			<p>Caught an exception, type = #CFCATCH.TYPE# </p>
			<p>The contents of the tag stack are:</p>
			<cfloop index = i from = 1
					to = #ArrayLen(CFCATCH.TAGCONTEXT)#>
				<cfset sCurrent = #CFCATCH.TAGCONTEXT[i]#>
				<br>#i# #sCurrent["ID"]# <br>
Line Number: #sCurrent["LINE"]#, Column: #sCurrent["COLUMN"]#<br>
					#sCurrent["TEMPLATE"]#
			</cfloop>

            <hr>
            <h1>Other Error:#cfcatch.Type#</h1>
            <ul>
              <li><b>Message:</b>#cfcatch.Message#
              <li><b>Detail:</b>#cfcatch.Detail#
              <li><B>Page:</B>#GetBaseTemplatePath()#
            </ul><br>
Form Variables<br>
			<cfdump var="#form#"><br>
<br>
URL Variables<br>
			<cfdump var="#url#"><br>
<br>
Session Variables<br>
			<cfdump var="#session#"><br>
<br>          </cfmail>
        </cfoutput>
      </cfcatch>
  </cftry>
</cfif>








	</td>

  <td align="left"></td>
  </tr>
  </cfif>

  <!--- <tr>
  <td colspan="3">&nbsp;</td>

  <td>Return Data as Type:</td></tr>
  <tr>
  <td colspan="3">&nbsp;</td>

  <td><select name="return_data" style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e6e6e6;
										border-color: e6e6e6;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;width=150">
	<option value="1" <cfif form.return_data eq 1>selected</cfif>>HTML</option>
	<option value="2" <cfif form.return_data eq 2>selected</cfif>>MISMO XML</option>
	<option value="3" <cfif form.return_data eq 3>selected</cfif>>MS Excel</option>
	</td>

  <td align="left"></td>
  </tr> --->

</table>
</cfif>
</td></tr></table>
</center>
</cfif>
</cfform>

<cfif  form.fee_submit eq 'Calculate Fees' or form.place_order eq "Place Title Order">
<cfset form.previous_loan_amount = ReplaceNocase(form.previous_loan_amount, '$', '', 'ALL')>
<cfset form.previous_loan_amount = ReplaceNocase(form.previous_loan_amount, ',', '', 'ALL')>

<cfset form.loan_amount = ReplaceNocase(form.loan_amount, '$', '', 'ALL')>
<cfset form.loan_amount = ReplaceNocase(form.loan_amount, ',', '', 'ALL')>

<cfset form.purchase_price = ReplaceNocase(form.purchase_price, '$', '', 'ALL')>
<cfset form.purchase_price = ReplaceNocase(form.purchase_price, ',', '', 'ALL')>

<cfoutput>
<!--- NEW HUD --->

<form name="calc_form" action="GFE_2010_modify.cfm" method="post" target="new">

<!--- <form name="calc_form" action="../gfe/gfe_form.cfm" method="post" target="new">
 --->
<!--- NEW HUD --->

<input type="hidden" name="comp_id" value="#comp_id#">
<input type="hidden" name="transaction_type" value="#form.transaction_type#">
<input type="hidden" name="property_county" value="#form.property_county#">
<input type="hidden" name="property_city" value="#form.property_city#">
<input type="hidden" name="property_state" value="#form.property_state#">
<input type="hidden" name="property_zip" value="#form.property_zip#">
<input type="hidden" name="base_loan_amount" value="#form.loan_amount#">
<input type="hidden" name="purchase_price" value="#form.purchase_price#">
<input type="hidden" name="previous_purch_amount" value="#form.previous_purch_amount#">
<input type="hidden" name="previous_purch_year" value="#form.previous_purch_year#">
<input type="hidden" name="previous_purch_month" value="#form.previous_purch_month#">
<input type="hidden" name="previous_loan_amount" value="#form.previous_loan_amount#">
<input type="hidden" name="previous_loan_year" value="#form.previous_loan_year#">
<input type="hidden" name="previous_loan_month" value="#form.previous_loan_month#">
<input type="hidden" name="property_use_type" value="#form.property_use_type#">
<input type="hidden" name="enhanced_coverage" value="#form.enhanced_coverage#">
<input type="hidden" name="city_state" value="#form.property_city#, #form.property_state#">
<input type="hidden" name="same_lender" value="#form.same_lender#">
<input type="hidden" name="reissue_rates" value="#form.reissue_rates#">
<input type="hidden" name="jlp_policy" value="#form.jlp_policy#">
<input type="hidden" name="seller_paid_lender_policy" value="#form.seller_paid_lender_policy#">
<input type="hidden" name="seller_paid_owner_policy" value="#form.seller_paid_owner_policy#">
<input type="hidden" name="asset_manager" value="#form.asset_manager#">
<input type="hidden" name="asset_manager" value="#form.send_quote#">
<input type="hidden" name="assessed_value" value="#form.assessed_value#">
<input type="hidden" name="form.opt_alta_4" value="#form.opt_alta_4#">
<input type="hidden" name="form.opt_alta_4_1" value="#form.opt_alta_4_1#">
<input type="hidden" name="form.opt_alta_5" value="#form.opt_alta_5#">
<input type="hidden" name="form.opt_alta_5_1" value="#form.opt_alta_5_1#">
<input type="hidden" name="form.opt_alta_6" value="#form.opt_alta_6#">
<input type="hidden" name="form.opt_alta_6_1" value="#form.opt_alta_6_1#">
<input type="hidden" name="form.opt_alta_6_2" value="#form.opt_alta_6_2#">
<input type="hidden" name="form.opt_alta_7" value="#form.opt_alta_7#">
<input type="hidden" name="form.opt_alta_8_1" value="#form.opt_alta_8_1#">
<input type="hidden" name="form.opt_alta_9" value="#form.opt_alta_9#">
<input type="hidden" name="form.opt_tx_1"  value="#form.opt_tx_1#">
<input type="hidden" name="form.opt_tx_2"  value="#form.opt_tx_2#">
<input type="hidden" name="form.opt_tx_3"  value="#form.opt_tx_3#">
<input type="hidden" name="form.opt_tx_4"  value="#form.opt_tx_4#">
<input type="hidden" name="form.opt_tx_5"  value="#form.opt_tx_5#">
<input type="hidden" name="form.opt_tx_6"  value="#form.opt_tx_6#">
<input type="hidden" name="form.opt_tx_7" value="#form.opt_tx_7#">
<input type="hidden" name="form.opt_tx_8" value="#form.opt_tx_8#">
<input type="hidden" name="form.opt_tx_9" value="#form.opt_tx_9#">
<input type="hidden" name="form.opt_tx_10" value="#form.opt_tx_10#">
<input type="hidden" name="form.opt_tx_11" value="#form.opt_tx_11#">
<input type="hidden" name="form.opt_tx_12" value="#form.opt_tx_12#">
<input type="hidden" name="form.opt_tx_13" value="#form.opt_tx_13#">
<input type="hidden" name="form.opt_tx_14" value="#form.opt_tx_14#">

<input type="hidden" name="form.opt_ut_4" value="#form.opt_ut_4#">
<input type="hidden" name="form.opt_ut_41" value="#form.opt_ut_41#">
<input type="hidden" name="form.opt_ut_5" value="#form.opt_ut_5#">
<input type="hidden" name="form.opt_ut_51" value="#form.opt_ut_51#">
<input type="hidden" name="form.opt_ut_6" value="#form.opt_ut_6#">
<input type="hidden" name="form.opt_ut_61" value="#form.opt_ut_61#">
<input type="hidden" name="form.opt_ut_62" value="#form.opt_ut_62#">
<input type="hidden" name="form.opt_ut_81" value="#form.opt_ut_81#">
<input type="hidden" name="form.opt_ut_9" value="#form.opt_ut_9#">

<input type="hidden" name="form.opt_sd_comp" value="#form.opt_sd_comp#">
<input type="hidden" name="form.opt_sd_balloon" value="#form.opt_sd_balloon#">
<input type="hidden" name="form.opt_sd_credit" value="#form.opt_sd_credit#">
<input type="hidden" name="form.opt_sd_7" value="#form.opt_sd_7#">
<input type="hidden" name="form.opt_sd_6" value="#form.opt_sd_6#">
<input type="hidden" name="form.opt_sd_4" value="#form.opt_sd_4#">
<input type="hidden" name="form.opt_sd_5" value="#form.opt_sd_5#">
<input type="hidden" name="form.opt_sd_9" value="#form.opt_sd_9#">
<input type="hidden" name="form.opt_sd_8" value="#form.opt_sd_8#">


<input type="hidden" name="form.return_data" value="#form.return_data#">
<input type="hidden" name="form.cema" value="#form.cema#">

<input type="hidden" name="form.new_deed" value="#form.new_deed#">
<input type="hidden" name="form.current_deed_num" value="#form.current_deed_num#">
<input type="hidden" name="form.add_or_remove" value="#form.add_or_remove#">
<input type="hidden" name="form.add_or_remove_num" value="#form.add_or_remove_num#">



<input type="hidden" name="form.construction_draws" value="#form.construction_draws#">
<input type="hidden" name="form.end_loan_original_loan_amount" value="#form.end_loan_original_loan_amount#">
<input type="hidden" name="form.closing_type" value="#form.closing_type#">
<input type="hidden" name="form.borrower_owns" value="#form.borrower_owns#">

</form>


<form name="calc_form2" action="disclosures/disclosure2/index.cfm" method="post" target="new">

<!--- <form name="calc_form" action="../gfe/gfe_form.cfm" method="post" target="new">
 --->
<!--- NEW HUD --->

<input type="hidden" name="comp_id" value="#comp_id#">
<input type="hidden" name="transaction_type" value="#form.transaction_type#">
<input type="hidden" name="property_county" value="#form.property_county#">
<input type="hidden" name="property_city" value="#form.property_city#">
<input type="hidden" name="property_state" value="#form.property_state#">
<input type="hidden" name="property_zip" value="#form.property_zip#">
<input type="hidden" name="base_loan_amount" value="#form.loan_amount#">
<input type="hidden" name="purchase_price" value="#form.purchase_price#">
<input type="hidden" name="previous_purch_amount" value="#form.previous_purch_amount#">
<input type="hidden" name="previous_purch_year" value="#form.previous_purch_year#">
<input type="hidden" name="previous_purch_month" value="#form.previous_purch_month#">
<input type="hidden" name="previous_loan_amount" value="#form.previous_loan_amount#">
<input type="hidden" name="previous_loan_year" value="#form.previous_loan_year#">
<input type="hidden" name="previous_loan_month" value="#form.previous_loan_month#">
<input type="hidden" name="property_use_type" value="#form.property_use_type#">
<input type="hidden" name="enhanced_coverage" value="#form.enhanced_coverage#">
<input type="hidden" name="city_state" value="#form.property_city#, #form.property_state#">
<input type="hidden" name="same_lender" value="#form.same_lender#">
<input type="hidden" name="reissue_rates" value="#form.reissue_rates#">
<input type="hidden" name="jlp_policy" value="#form.jlp_policy#">
<input type="hidden" name="seller_paid_lender_policy" value="#form.seller_paid_lender_policy#">
<input type="hidden" name="seller_paid_owner_policy" value="#form.seller_paid_owner_policy#">
<input type="hidden" name="asset_manager" value="#form.asset_manager#">
<input type="hidden" name="asset_manager" value="#form.send_quote#">
<input type="hidden" name="assessed_value" value="#form.assessed_value#">
<input type="hidden" name="form.opt_alta_4" value="#form.opt_alta_4#">
<input type="hidden" name="form.opt_alta_4_1" value="#form.opt_alta_4_1#">
<input type="hidden" name="form.opt_alta_5" value="#form.opt_alta_5#">
<input type="hidden" name="form.opt_alta_5_1" value="#form.opt_alta_5_1#">
<input type="hidden" name="form.opt_alta_6" value="#form.opt_alta_6#">
<input type="hidden" name="form.opt_alta_6_1" value="#form.opt_alta_6_1#">
<input type="hidden" name="form.opt_alta_6_2" value="#form.opt_alta_6_2#">
<input type="hidden" name="form.opt_alta_7" value="#form.opt_alta_7#">
<input type="hidden" name="form.opt_alta_8_1" value="#form.opt_alta_8_1#">
<input type="hidden" name="form.opt_alta_9" value="#form.opt_alta_9#">
<input type="hidden" name="form.opt_tx_1"  value="#form.opt_tx_1#">
<input type="hidden" name="form.opt_tx_2"  value="#form.opt_tx_2#">
<input type="hidden" name="form.opt_tx_3"  value="#form.opt_tx_3#">
<input type="hidden" name="form.opt_tx_4"  value="#form.opt_tx_4#">
<input type="hidden" name="form.opt_tx_5"  value="#form.opt_tx_5#">
<input type="hidden" name="form.opt_tx_6"  value="#form.opt_tx_6#">
<input type="hidden" name="form.opt_tx_7" value="#form.opt_tx_7#">
<input type="hidden" name="form.opt_tx_8" value="#form.opt_tx_8#">
<input type="hidden" name="form.opt_tx_9" value="#form.opt_tx_9#">
<input type="hidden" name="form.opt_tx_10" value="#form.opt_tx_10#">
<input type="hidden" name="form.opt_tx_11" value="#form.opt_tx_11#">
<input type="hidden" name="form.opt_tx_12" value="#form.opt_tx_12#">
<input type="hidden" name="form.opt_tx_13" value="#form.opt_tx_13#">
<input type="hidden" name="form.opt_tx_14" value="#form.opt_tx_14#">

<input type="hidden" name="form.opt_ut_4" value="#form.opt_ut_4#">
<input type="hidden" name="form.opt_ut_41" value="#form.opt_ut_41#">
<input type="hidden" name="form.opt_ut_5" value="#form.opt_ut_5#">
<input type="hidden" name="form.opt_ut_51" value="#form.opt_ut_51#">
<input type="hidden" name="form.opt_ut_6" value="#form.opt_ut_6#">
<input type="hidden" name="form.opt_ut_61" value="#form.opt_ut_61#">
<input type="hidden" name="form.opt_ut_62" value="#form.opt_ut_62#">
<input type="hidden" name="form.opt_ut_81" value="#form.opt_ut_81#">
<input type="hidden" name="form.opt_ut_9" value="#form.opt_ut_9#">

<input type="hidden" name="form.opt_sd_comp" value="#form.opt_sd_comp#">
<input type="hidden" name="form.opt_sd_balloon" value="#form.opt_sd_balloon#">
<input type="hidden" name="form.opt_sd_credit" value="#form.opt_sd_credit#">
<input type="hidden" name="form.opt_sd_7" value="#form.opt_sd_7#">
<input type="hidden" name="form.opt_sd_6" value="#form.opt_sd_6#">
<input type="hidden" name="form.opt_sd_4" value="#form.opt_sd_4#">
<input type="hidden" name="form.opt_sd_5" value="#form.opt_sd_5#">
<input type="hidden" name="form.opt_sd_9" value="#form.opt_sd_9#">
<input type="hidden" name="form.opt_sd_8" value="#form.opt_sd_8#">


<input type="hidden" name="form.return_data" value="#form.return_data#">
<input type="hidden" name="form.cema" value="#form.cema#">

<input type="hidden" name="form.new_deed" value="#form.new_deed#">
<input type="hidden" name="form.current_deed_num" value="#form.current_deed_num#">
<input type="hidden" name="form.add_or_remove" value="#form.add_or_remove#">
<input type="hidden" name="form.add_or_remove_num" value="#form.add_or_remove_num#">



<input type="hidden" name="form.construction_draws" value="#form.construction_draws#">
<input type="hidden" name="form.end_loan_original_loan_amount" value="#form.end_loan_original_loan_amount#">
<input type="hidden" name="form.closing_type" value="#form.closing_type#">
<input type="hidden" name="form.borrower_owns" value="#form.borrower_owns#">
<input type="hidden" name="form.transfer_tax_paid_by" value="#form.transfer_tax_paid_by#">
<input type="hidden" name="form.first_time_buyer" value="#form.first_time_buyer#">
<input type="hidden" name="form.underwriter_choice" value="#form.underwriter_choice#">
<input type="hidden" name="form.previous_purchase_mortgage" value="#form.previous_purchase_mortgage#">
</form>
</cfoutput>

</cfif>


