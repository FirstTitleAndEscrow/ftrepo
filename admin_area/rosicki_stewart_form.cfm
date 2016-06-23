
<cfparam name="form.ORDER_ID" default="100">
<cfparam name="form.LOAN_NUMBER" default="">
<cfparam name="form.VESTING" default="">
<cfparam name="form.DEL_TAXES_AMOUNT" default="">
<cfparam name="form.DEL_TAXES_YEARS" default="">
<cfparam name="form.PAID_FC" default="">
<cfparam name="form.DEL_HOA_AMOUNT" default="">
<cfparam name="form.DEL_HOA_YEARS" default="">
<cfparam name="form.IRS_LIEN" default="">
<cfparam name="form.LIEN_EXPIRES" default="">
<cfparam name="form.OTHER_LIENS" default="">
<cfparam name="form.TO_WHOM1" default="">
<cfparam name="form.TO_WHOM1_AMOUNT" default="">
<cfparam name="form.TO_WHOM2" default="">
<cfparam name="form.TO_WHOM2_AMOUNT" default="">
<cfparam name="form.TO_WHOM3_AMOUNT" default="">
<cfparam name="form.OUTSTANDING_MORTS" default="">
<cfparam name="form.FALLOFF" default="">
<cfparam name="form.OTHER_DOCS_NEEDED" default="">
<cfparam name="form.OTHER_DOCS_NEEDED_TEXT" default="">
<cfparam name="form.OTHER_ISSUES" default="">
<cfparam name="form.submit" default="">



<cfif form.submit eq 'Save' or form.submit eq 'Save and Mark As Sent'>

<CFQUERY datasource="#request.dsn#" NAME="find_data">
Select * from Rosicki where order_id = #form.order_id#
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="find_title_data">
Select * from title where title_id = #form.order_id#
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="insert_data">
Update title 
set loan_number = '#form.loan_number#'
WHERE title_id = '#form.order_id#'
</cfquery>

<cfif find_data.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" NAME="insert_data">
Insert into Rosicki (ORDER_ID, VESTING, DEL_TAXES_AMOUNT, DEL_TAXES_YEARS, PAID_FC, DEL_HOA_AMOUNT, DEL_HOA_YEARS, IRS_LIEN, LIEN_EXPIRES, OTHER_LIENS, TO_WHOM1, TO_WHOM1_AMOUNT, TO_WHOM2, TO_WHOM2_AMOUNT, TO_WHOM3, TO_WHOM3_AMOUNT, OUTSTANDING_MORTS, FALLOFF, OTHER_DOCS_NEEDED, OTHER_DOCS_NEEDED_TEXT, OTHER_ISSUES)
values
('#form.ORDER_ID#', '#form.VESTING#', '#form.DEL_TAXES_AMOUNT#', '#form.DEL_TAXES_YEARS#', '#form.PAID_FC#', '#form.DEL_HOA_AMOUNT#', '#form.DEL_HOA_YEARS#', '#form.IRS_LIEN#', <cfif form.lien_expires neq ''>'#form.LIEN_EXPIRES#'<cfelse>NULL</cfif>, '#form.OTHER_LIENS#', '#form.TO_WHOM1#', '#form.TO_WHOM1_AMOUNT#', '#form.TO_WHOM2#', '#form.TO_WHOM2_AMOUNT#', '#form.TO_WHOM3#', '#form.TO_WHOM3_AMOUNT#', '#form.OUTSTANDING_MORTS#', '#form.FALLOFF#', '#form.OTHER_DOCS_NEEDED#', '#form.OTHER_DOCS_NEEDED_TEXT#', '#form.OTHER_ISSUES#')
</cfquery>

<cfelse>


<CFQUERY datasource="#request.dsn#" NAME="insert_data">
Update Rosicki 
set VESTING = '#form.VESTING#',
DEL_TAXES_AMOUNT = '#form.DEL_TAXES_AMOUNT#',
DEL_TAXES_YEARS = '#form.DEL_TAXES_YEARS#',
PAID_FC = '#form.PAID_FC#',
DEL_HOA_AMOUNT = '#form.DEL_HOA_AMOUNT#',
DEL_HOA_YEARS = '#form.DEL_HOA_YEARS#',
IRS_LIEN = '#form.IRS_LIEN#',
LIEN_EXPIRES = <cfif form.lien_expires neq ''>'#form.LIEN_EXPIRES#'<cfelse>NULL</cfif>,
OTHER_LIENS = '#form.OTHER_LIENS#',
TO_WHOM1 = '#form.TO_WHOM1#',
TO_WHOM1_AMOUNT = '#form.TO_WHOM1_AMOUNT#',
TO_WHOM2 = '#form.TO_WHOM2#',
TO_WHOM2_AMOUNT = '#form.TO_WHOM2_AMOUNT#',
TO_WHOM3 = '#form.TO_WHOM3#',
TO_WHOM3_AMOUNT = '#form.TO_WHOM3_AMOUNT#',
OUTSTANDING_MORTS = '#form.OUTSTANDING_MORTS#',
FALLOFF = '#form.FALLOFF#',
OTHER_DOCS_NEEDED = '#form.OTHER_DOCS_NEEDED#',
OTHER_DOCS_NEEDED_TEXT = '#form.OTHER_DOCS_NEEDED_TEXT#',
OTHER_ISSUES = '#form.OTHER_ISSUES#'
WHERE order_id = '#form.order_id#'
</cfquery>
</cfif>
<cfif form.submit eq "Save and Mark As Sent">

<cflocation url="/admin_area/title_committment_submit.cfm?#cgi.query_string#&go_through=1">
<cfelse>
<center><BR><font color="red">The Title Commitment Checklist has been Saved</font></center><br>
</cfif>
</cfif>
<CFQUERY datasource="#request.dsn#" NAME="find_data">
Select * from Rosicki where order_id = #url.rec_id#
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="find_title_data">
Select * from title where title_id = #url.rec_id#
</cfquery>


<center>
<font face="Arial, Helvetica, sans-serif">The Client has requested that the following information be<BR> filled-out, which will be sent along with the Title Commitment:</center><br>
<br>

<form action="<cfoutput>#cgi.SCRIPT_NAME#?#CGI.QUERY_STRING#</cfoutput>" method="post">
<cfoutput>
<input type="hidden" name="order_id" value="#rec_id#">

<table width="800" border="1" cellspacing="2" cellpadding="8">
  <tr>
    <td align="left" valign="top"><font face="Arial, Helvetica, sans-serif">
<center><strong>PRELIMINARY TITLE REPORT CHECKLIST</strong><br>
Updated 7-28-09</center><br><br>

<strong>Loan number:</strong>&nbsp;&nbsp;<input type="text" name="loan_number" value="#find_title_data.loan_number#" size="15">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Property Address:</strong> #find_title_data.paddress#, #find_title_data.pcity#, #find_title_data.pstate# #find_title_data.pzip#<br><br>

<strong>Title vesting</strong> <br><br>

<input type="text" name="vesting" value="#find_data.vesting#" size="30">&nbsp;&nbsp;once f/c deed records.<br><br>

<strong>Delinquent Taxes</strong><br><br>

Amount&nbsp;&nbsp;<input type="text" name="del_taxes_amount" value="#find_data.del_taxes_amount#" size="10">&nbsp;&nbsp;&nbsp;&nbsp;Years due&nbsp;&nbsp;<input type="text" name="del_taxes_years" value="#find_data.del_taxes_years#" size="5">	<br><br>

Paid with f/c deed recording?&nbsp;&nbsp;<input type="radio" name="paid_fc" value="Y" size="15" <cfif find_data.paid_fc eq 'Y'>checked</cfif>>&nbsp;Y&nbsp;&nbsp;&nbsp;<input type="radio" name="paid_fc" value="N" size="15" <cfif find_data.paid_fc eq 'N'>checked</cfif>>&nbsp;N<br><br>

<strong>Delinquent HOA</strong> (Attach W-9 if over 1000.00)<br><br>

Amount&nbsp;&nbsp;<input type="text" name="del_hoa_amount" value="#find_data.del_hoa_amount#" size="10">&nbsp;&nbsp;&nbsp;&nbsp;Years due &nbsp;&nbsp;<input type="text" name="del_hoa_years" value="#find_data.del_hoa_years#" size="5">	<br><br>

<strong>IRS Lien</strong>	<br><br>

<input type="radio" name="irs_lien" value="Y" size="15" <cfif find_data.irs_lien eq 'Y'>checked</cfif>>&nbsp;Y&nbsp;&nbsp;&nbsp;<input type="radio" name="irs_lien" value="N" size="15" <cfif find_data.irs_lien eq 'N'>checked</cfif>>&nbsp;N&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date Lien Expires <input type="text" name="lien_expires" value="<cfif IsDate(find_data.lien_expires)>#DateFormat(find_data.lien_expires, 'm/d/yyyy')#</cfif>" size="10"><br><br>

<strong>Other Liens</strong>	(Attach W-9 for each lien noted)&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="other_liens" value="Y" size="15" <cfif find_data.other_liens eq 'Y'>checked</cfif>>&nbsp;Y&nbsp;&nbsp;&nbsp;<input type="radio" name="other_liens" value="N" size="15" <cfif find_data.other_liens eq 'N'>checked</cfif>>&nbsp;N<br><br>

To whom?&nbsp;&nbsp;<input type="text" name="to_whom1" value="#find_data.to_whom1#" size="30">&nbsp;&nbsp;&nbsp;&nbsp;Amount due&nbsp;&nbsp;<input type="text" name="to_whom1_amount" value="#find_data.to_whom1_amount#" size="10"> <br><br> 

To whom?&nbsp;&nbsp;<input type="text" name="to_whom2" value="#find_data.to_whom2#" size="30">&nbsp;&nbsp;&nbsp;&nbsp;Amount due&nbsp;&nbsp;<input type="text" name="to_whom2_amount" value="#find_data.to_whom2_amount#" size="10"> <br><br> 

To whom?&nbsp;&nbsp;<input type="text" name="to_whom3" value="#find_data.to_whom3#" size="30">&nbsp;&nbsp;&nbsp;&nbsp;Amount due&nbsp;&nbsp;<input type="text" name="to_whom3_amount" value="#find_data.to_whom3_amount#" size="10"> <br><br> 

<strong>Outstanding Mortgages/Judgments</strong>&nbsp;&nbsp;&nbsp;<input type="radio" name="outstanding_morts" value="Y" size="15" <cfif find_data.outstanding_morts eq 'Y'>checked</cfif>>&nbsp;Y&nbsp;&nbsp;&nbsp;<input type="radio" name="outstanding_morts" value="N" size="15" <cfif find_data.outstanding_morts eq 'N'>checked</cfif>>&nbsp;N<br><br>

<strong>Fall off with f/c deed recording?</strong>&nbsp;&nbsp;&nbsp;<input type="radio" name="falloff" value="Y" size="15" <cfif find_data.falloff eq 'Y'>checked</cfif>>&nbsp;Y&nbsp;&nbsp;&nbsp;<input type="radio" name="falloff" value="N" size="15" <cfif find_data.falloff eq 'N'>checked</cfif>>&nbsp;N<br><br>

If no, docs needed to clear (circle all required)<br><br>

<input type="checkbox" name="other_docs_needed" value="Origination Title policy" <cfif find_data.other_docs_needed contains 'Origination Title policy'>checked</cfif>>&nbsp;Origination Title policy&nbsp;&nbsp;<input type="checkbox" name="other_docs_needed" value="Origination HUD" <cfif find_data.other_docs_needed contains 'Origination HUD'>checked</cfif>>&nbsp;Origination HUD&nbsp;&nbsp;<input type="checkbox" name="other_docs_needed" value="Other docs needed" <cfif find_data.other_docs_needed contains 'Other docs needed'>checked</cfif>>&nbsp;Other docs needed			<input type="text" name="other_docs_needed_text" value="#find_data.other_docs_needed_text#" size="15"><br><br>

<strong>Other issues</strong> (please indicate estimated timeframe to clear)<br>
<textarea cols="75" rows="5" name="other_issues">#find_data.other_issues#</textarea>	</font>
	</td>
  </tr>
  <tr>
    <td align="right" valign="top"><input name="submit" type="submit" value="Save">&nbsp;&nbsp;&nbsp;&nbsp;<input name="submit" type="submit" value="Save and Mark As Sent"></td>
  </tr>
</table>
</cfoutput>
<br>
<br></font>
<cfinclude template="../title_committment_view_stewart_title_ins.cfm">
</form>