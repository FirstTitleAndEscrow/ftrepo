<script language="JavaScript" type="text/JavaScript">
function validate_form() {
var survey_completed = true;
var msg = "The following errors were encountered:\n\n";

// check if Effective Data is completed //
if (document.add_condo_data.condo_eff_date.value.length < 1) {
msg += "Please enter an Effective Data\n";
survey_completed = false;
} 
// check if Unit Number is completed //
if (document.add_condo_data.condo_unit_num.value.length < 1) {
msg += "Please enter a Unit Number\n";
survey_completed = false;
} 
// check if Tax Amount is completed //
if (document.add_condo_data.condo_tax_amt.value.length < 1) {
msg += "Please Enter a Tax Amount\n";
survey_completed = false;
} else {
if (isNaN(document.add_condo_data.condo_tax_amt.value)) {
msg += "Tax Amount must be a number\n";
survey_completed = false;
}
}
// if everything checks out, submit the form (return true) if not, alert the user //
// which Questions still need to be answered //
if (survey_completed == false) {
alert(msg);
return false;
} else {
return true;
}
} 
</script>



<cfif a_trigger eq 3>


<CFQUERY datasource="#request.dsn#" NAME="update_title">
			Update Title
			Set condo_eff_date = '#form.condo_eff_date#',
			condo_tax_amt = '#form.condo_tax_amt#',
			condo_unit_num = '#form.condo_unit_num#'
			WHERE title_ID = #rec_ID#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="update_tax">		
			Update tax_cert_title
			Set comments = 'The projected annual taxes for Taxes for Year 2006/2007 for this Unit are #DollarFormat(form.condo_tax_amt)#'
			where title_id = #rec_id# 
		</CFQUERY>
		
<CFQUERY datasource="#request.dsn#" NAME="check_ins_view" maxrows="1">		
			Select * FROM title_ins_view
			where title_id = #rec_id# 
			AND type = 'DATA'
			AND selectedOrgs is not null
		</CFQUERY>
<cfif check_ins_view.recordcount>
<CFQUERY datasource="#request.dsn#" NAME="update_Title_Data">
update title_ins_view
set notes = 'SITUATED IN MONTGOMERY COUNTY, MARYLAND: Condominium Unit No. ###form.condo_unit_num# ("the Unit") together with the Common Elements appurtenant thereto, in the Aurora Condominium South, Montgomery County, Maryland, pursuant to the Declaration of Condominium recorded in Liber ___ at folio ___ et seq., among the Land Records of Montgomery County, Maryland, and the Condominium Plat recorded in Condominium Plat Book ___ at Plat No. ___.',
addex = 'Covenants, Conditions, Restrictions, Terms and Conditions as set forth in the Declaration of Condominium and the By-Laws attached thereto recorded in Liber ___ at folio ___. Note: Policy, when issued, will contain an ALTA Form 4 Endorsement.',
data37 = '#form.condo_eff_date#'
WHERE title_ID  = #rec_ID# and selectedOrgs is not null	
</CFQUERY>
<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="update_Title_Data">
Insert into title_ins_view
  (title_id, notes, addex, data37)
  Values
  (#rec_ID#, 'SITUATED IN MONTGOMERY COUNTY, MARYLAND: Condominium Unit No. ###form.condo_unit_num# ("the Unit") together with the Common Elements appurtenant thereto, in the Aurora Condominium South, Montgomery County, Maryland, pursuant to the Declaration of Condominium recorded in Liber ___ at folio ___ et seq., among the Land Records of Montgomery County, Maryland, and the Condominium Plat recorded in Condominium Plat Book ___ at Plat No. ___.', 'Covenants, Conditions, Restrictions, Terms and Conditions as set forth in the Declaration of Condominium and the By-Laws attached thereto recorded in Liber ___ at folio ___. Note: Policy, when issued, will contain an ALTA Form 4 Endorsement.', '#form.condo_eff_date#')
</CFQUERY>
</cfif>



<CFQUERY datasource="#request.dsn#" NAME="check_ins_add" maxrows="1">		
			Select * FROM title_ins_add
			where title_id = #rec_id# 
			AND type = 'DATA'
		</CFQUERY>
<cfif check_ins_add.recordcount>
<CFQUERY datasource="#request.dsn#" NAME="update_Title_Data">
update title_ins_add
set notes = 'SITUATED IN MONTGOMERY COUNTY, MARYLAND: Condominium Unit No. ###form.condo_unit_num# ("the Unit") together with the Common Elements appurtenant thereto, in the Aurora Condominium South, Montgomery County, Maryland, pursuant to the Declaration of Condominium recorded in Liber ___ at folio ___ et seq., among the Land Records of Montgomery County, Maryland, and the Condominium Plat recorded in Condominium Plat Book ___ at Plat No. ___.',
addex = 'Covenants, Conditions, Restrictions, Terms and Conditions as set forth in the Declaration of Condominium and the By-Laws attached thereto recorded in Liber ___ at folio ___. Note: Policy, when issued, will contain an ALTA Form 4 Endorsement.',
data37 = '#form.condo_eff_date#'
WHERE title_ID  = #rec_ID# and type = 'DATA'
</CFQUERY>
<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="update_Title_Data">
Insert into title_ins_add
  (title_id, notes, addex, data37)
  Values
  (#rec_ID#, 'SITUATED IN MONTGOMERY COUNTY, MARYLAND: Condominium Unit No. ###form.condo_unit_num# ("the Unit") together with the Common Elements appurtenant thereto, in the Aurora Condominium South, Montgomery County, Maryland, pursuant to the Declaration of Condominium recorded in Liber ___ at folio ___ et seq., among the Land Records of Montgomery County, Maryland, and the Condominium Plat recorded in Condominium Plat Book ___ at Plat No. ___.', 'Covenants, Conditions, Restrictions, Terms and Conditions as set forth in the Declaration of Condominium and the By-Laws attached thereto recorded in Liber ___ at folio ___. Note: Policy, when issued, will contain an ALTA Form 4 Endorsement.', '#form.condo_eff_date#')
</CFQUERY>
</cfif>


<cfoutput><cflocation url="title_report_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#"></cfoutput>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_title">
		
			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_eff_date">
		
			SELECT data37
			FROM title_ins_view
			WHERE title_ID  = #rec_ID# and selectedOrgs is not null
</CFQUERY>
		
<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">
		
			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_ID#
		
</CFQUERY>

<cfparam name="read_title.condo_eff_date" default="">
<cfparam name="read_title.condo_unit_num" default="">
<cfparam name="read_title.condo_tax_amt" default="">


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="#ffffff" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

<CENTER>
<CENTER>
<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="gray">
	<tr>
		<td width=830 align=middle valign=top>
		
<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="white">
	<!--- <tr>
		<td width=830 align=middle valign=top bgcolor="e1e1el">
			<IMG src="./images/logo_title_reports.gif">
			
		</td>
	</tr>
 --->


	<tr>
		<td width=830 align=middle valign=top bgcolor=e1e1el>




	<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">
	





<CFOUTPUT QUERY="read_title"> <!--- =================================== ---><!--- ===/    [ CLIENT INFO ]  TOP   \=== ---><!--- =================================== --->
<cfform action="title_add_condo_data.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=3&company_id=#company_ID#" method="post" name="add_condo_data" onsubmit="return validate_form();">
<table cellpadding=1 cellspacing=1 border=0 bgcolor=bfbfbf>
	<tr>
			<td colspan="2" align=left valign=top bgcolor=d3d3d3>
			
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>ADD CONDO DATA</B>- Order: #read_title.TITLE_ID#</CENTER></FONT>
			</td>
		</tr>

			<tr>
			<td><strong>Effective Date</strong>:</td>
			<td><input type="text" name="condo_eff_date" id="condo_eff_date" value="#get_eff_date.data37#"></td>
			</tr>
			<tr>
			<td><strong>Unit Number</strong>:</td>
			<td><input type="text" name="condo_unit_num" id="condo_unit_num" value="#read_title.condo_unit_num#"></td>
			</tr>
			<tr>
			<td><strong>Tax Amount</strong>:</td>
			<td><input type="text" name="condo_tax_amt" id="condo_tax_amt" value="#read_title.condo_tax_amt#"></td>
			</tr>
			<tr>
			<td>&nbsp;</td><td><input name="Submit" type="submit" value="Submit">&nbsp;&nbsp;&nbsp;&nbsp;<input name="Cancel" type="button" onClick="document.location.href='title_report_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#';" value="Cancel"><br>
<br>
			</td>
			</tr>

			</table>
			<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
			</td>
		</tr>
</table>
</cfform>
</cfoutput>


	
</BODY>
</HTML>
	

	
	
	
	