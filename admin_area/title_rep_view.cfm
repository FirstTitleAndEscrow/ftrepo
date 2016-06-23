<cfparam name="form.product" default="all">

<CFINCLUDE TEMPLATE="./includes/companies.cfm">

<cfif Right(full_list_comp_ids, 1) eq ','>
<cfset full_list_comp_ids = Left(full_list_comp_ids, (Len(full_list_comp_ids)-1))>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
		SELECT title_id
		FROM title where comp_ID IN(#full_list_comp_ids#) and cancelled is null
		ORDER BY Title_id
</CFQUERY>

		<CFSET c_count = "1">
		<CFSET a_company_name = ArrayNew(1)>
		<CFSET a_company_id   = ArrayNew(1)>
		
		<CFOUTPUT QUERY="read_companies">
			<CFSET a_company_name[c_count] = #company#>
			<CFSET   a_company_id[c_count] = #ID#>
			
			<CFSET c_count = #c_count# + "1">
		</CFOUTPUT>
		
	<!---=========================================== --->	
	<!---===================================================================== --->
	<!--- ===/ Use the list of companies to get a list of all their users \=== --->

		<!--- <CFSET    users_fname = ArrayNew(2)>
		<CFSET    users_lname = ArrayNew(2)>
		<CFSET       users_id = ArrayNew(2)>
		<CFSET    a_rec_count = ArrayNew(1)>
		
		<CFSET a_count = "1">
		<CFSET b_count = "1">
		
		
		

				<CFQUERY NAME="read_users" datasource="#request.dsn#" cachedwithin="#CreateTimeSpan(0, 0, 59, 0)#">
					SELECT *
					FROM users
					Where comp_id IN (#full_list_comp_ids#)
					ORDER BY comp_id, lp_lname ASC, lp_fname ASC
				</CFQUERY>

					<CFOUTPUT QUERY="read_users">
						<CFSET users_fname[a_count][b_count] = #lp_fname#>
						<CFSET users_lname[a_count][b_count] = #lp_lname#>
						<CFSET    users_id[a_count][b_count] = #ID#>

						<CFSET b_count = #b_count# + "1">
						<CFSET a_count = #a_count# + "1">
					</CFOUTPUT>
						<CFSET a_rec_count[a_count] = #read_users.recordcount#>
						<CFSET b_count = "1"> --->

	<!---===================================================================== --->		
<!--- <CFQUERY datasource="#request.dsn#" NAME="read_date">
	SELECT oda_month, title_id
	FROM title where  cancelled is null
	ORDER BY oda_month, Title_id
</CFQUERY>
 --->

<!--- <CFQUERY datasource="#request.dsn#" NAME="read_Comments">
	SELECT DISTINCT comments
	FROM title where cancelled is null
	ORDER BY comments
</CFQUERY> --->

<!--- <CFQUERY datasource="#request.dsn#" NAME="read_date_p">
	SELECT oda_month
	FROM property
	ORDER BY oda_month
</CFQUERY>
 --->
<!--- <CFQUERY datasource="#request.dsn#" NAME="read_titleid_p">
	SELECT prop_id
	FROM property
	ORDER BY prop_id
</CFQUERY> --->

<!--- <CFQUERY datasource="#request.dsn#" NAME="read_date_p">
	SELECT oda_month, prop_id
	FROM property
	ORDER BY oda_month, prop_id
</CFQUERY> --->

<!--- <CFQUERY datasource="#request.dsn#" NAME="read_titleid_a">
	SELECT app_id
	FROM appraisal
	ORDER BY app_id
</CFQUERY> --->
		
<!--- <CFQUERY datasource="#request.dsn#" NAME="read_titleid_anc">
	SELECT anc_id
	FROM ancillary where codeFlood is not null
	ORDER BY anc_id
</CFQUERY> --->


<!--- <CFQUERY datasource="#request.dsn#" NAME="read_titleid_avm">
	SELECT anc_id
	FROM ancillary where codeAVM is not null
	ORDER BY anc_id
</CFQUERY> --->

<!--- <CFQUERY datasource="#request.dsn#" NAME="read_titleid_sn">
	SELECT anc_id
	FROM ancillary where codeSigning is not null
	ORDER BY anc_id
</CFQUERY> --->
		
<!--- <CFQUERY datasource="#request.dsn#" NAME="read_titleid_cr">
	SELECT anc_id
	FROM ancillary where codeCR is not null
	ORDER BY anc_id
</CFQUERY> --->

<!--- <CFQUERY datasource="#request.dsn#" NAME="read_titleid_anc">
	SELECT anc_id
	FROM ancillary
	ORDER BY anc_id
</CFQUERY> --->
		
<!--- <CFQUERY datasource="#request.dsn#" NAME="read_titleid_c">
	SELECT *
	FROM Title C, Title_Closing_Order_Request O 
	WHERE C.title_id = O.title_id AND O.a_Req_closing_month IS NOT NULL and c.cancelled is null
	ORDER BY o.Title_id
</CFQUERY>	 --->
	
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
<script language="javascript">
function select_product(product) {
if (product == 'all') {
document.getElementById('title_ids').style.display = 'none';
document.getElementById('title_closings').style.display = 'none';
document.getElementById('property_ids').style.display = 'none';
document.getElementById('appraisal_ids').style.display = 'none';
document.getElementById('anc_ids').style.display = 'none';
document.getElementById('avm_ids').style.display = 'none';
document.getElementById('credit_ids').style.display = 'none';
document.getElementById('signing_ids').style.display = 'none';
document.getElementById('normal_status').style.display = 'block';
document.getElementById('closing_status').style.display = 'none';
document.getElementById('title_id').value = '';
document.getElementById('closing_id').value = '';
document.getElementById('prop_id').value = '';
document.getElementById('app_id').value = '';
document.getElementById('anc_id').value = '';
document.getElementById('avm_id').value = '';
document.getElementById('cr_id').value = '';
document.getElementById('sn_id').value = '';
document.getElementById('all_title_block').style.display = 'block';
document.getElementById('title_title_block').style.display = 'none';
document.getElementById('property_title_block').style.display = 'none';
document.getElementById('appraisal_title_block').style.display = 'none';
document.getElementById('flood_title_block').style.display = 'none';
document.getElementById('avm_title_block').style.display = 'none';
document.getElementById('credit_title_block').style.display = 'none';
document.getElementById('signing_title_block').style.display = 'none';
document.getElementById('closing_title_block').style.display = 'none';
}
if (product == 'title') {
document.getElementById('title_ids').style.display = 'block';
document.getElementById('title_closings').style.display = 'none';
document.getElementById('property_ids').style.display = 'none';
document.getElementById('appraisal_ids').style.display = 'none';
document.getElementById('anc_ids').style.display = 'none';
document.getElementById('avm_ids').style.display = 'none';
document.getElementById('credit_ids').style.display = 'none';
document.getElementById('signing_ids').style.display = 'none';
document.getElementById('normal_status').style.display = 'block';
document.getElementById('closing_status').style.display = 'none';
document.getElementById('title_id').value = '';
document.getElementById('closing_id').value = '';
document.getElementById('prop_id').value = '';
document.getElementById('app_id').value = '';
document.getElementById('anc_id').value = '';
document.getElementById('avm_id').value = '';
document.getElementById('cr_id').value = '';
document.getElementById('sn_id').value = '';
document.getElementById('all_title_block').style.display = 'none';
document.getElementById('title_title_block').style.display = 'block';
document.getElementById('property_title_block').style.display = 'none';
document.getElementById('appraisal_title_block').style.display = 'none';
document.getElementById('flood_title_block').style.display = 'none';
document.getElementById('avm_title_block').style.display = 'none';
document.getElementById('credit_title_block').style.display = 'none';
document.getElementById('signing_title_block').style.display = 'none';
document.getElementById('closing_title_block').style.display = 'none';
}
if (product == 'closing') {
document.getElementById('title_ids').style.display = 'none';
document.getElementById('title_closings').style.display = 'block';
document.getElementById('property_ids').style.display = 'none';
document.getElementById('appraisal_ids').style.display = 'none';
document.getElementById('anc_ids').style.display = 'none';
document.getElementById('avm_ids').style.display = 'none';
document.getElementById('credit_ids').style.display = 'none';
document.getElementById('signing_ids').style.display = 'none';
document.getElementById('normal_status').style.display = 'none';
document.getElementById('closing_status').style.display = 'block';
document.getElementById('title_id').value = '';
document.getElementById('closing_id').value = '';
document.getElementById('prop_id').value = '';
document.getElementById('app_id').value = '';
document.getElementById('anc_id').value = '';
document.getElementById('avm_id').value = '';
document.getElementById('cr_id').value = '';
document.getElementById('sn_id').value = '';
document.getElementById('all_title_block').style.display = 'none';


document.getElementById('title_title_block').style.display = 'none';
document.getElementById('property_title_block').style.display = 'none';
document.getElementById('appraisal_title_block').style.display = 'none';
document.getElementById('flood_title_block').style.display = 'none';
document.getElementById('avm_title_block').style.display = 'none';
document.getElementById('credit_title_block').style.display = 'none';
document.getElementById('signing_title_block').style.display = 'none';
document.getElementById('closing_title_block').style.display = 'block';
}
if (product == 'property') {
document.getElementById('title_ids').style.display = 'none';
document.getElementById('title_closings').style.display = 'none';
document.getElementById('property_ids').style.display = 'block';
document.getElementById('appraisal_ids').style.display = 'none';
document.getElementById('anc_ids').style.display = 'none';
document.getElementById('avm_ids').style.display = 'none';
document.getElementById('credit_ids').style.display = 'none';
document.getElementById('signing_ids').style.display = 'none';
document.getElementById('normal_status').style.display = 'block';
document.getElementById('closing_status').style.display = 'none';
document.getElementById('title_id').value = '';
document.getElementById('closing_id').value = '';
document.getElementById('prop_id').value = '';
document.getElementById('app_id').value = '';
document.getElementById('anc_id').value = '';
document.getElementById('avm_id').value = '';
document.getElementById('cr_id').value = '';
document.getElementById('sn_id').value = '';
document.getElementById('all_title_block').style.display = 'none';
document.getElementById('title_title_block').style.display = 'none';
document.getElementById('property_title_block').style.display = 'block';
document.getElementById('appraisal_title_block').style.display = 'none';
document.getElementById('flood_title_block').style.display = 'none';
document.getElementById('avm_title_block').style.display = 'none';
document.getElementById('credit_title_block').style.display = 'none';
document.getElementById('signing_title_block').style.display = 'none';
document.getElementById('closing_title_block').style.display = 'none';
}
if (product == 'appraisal') {
document.getElementById('title_ids').style.display = 'none';
document.getElementById('title_closings').style.display = 'none';
document.getElementById('property_ids').style.display = 'none';
document.getElementById('appraisal_ids').style.display = 'block';
document.getElementById('anc_ids').style.display = 'none';
document.getElementById('avm_ids').style.display = 'none';
document.getElementById('credit_ids').style.display = 'none';
document.getElementById('signing_ids').style.display = 'none';
document.getElementById('normal_status').style.display = 'block';
document.getElementById('closing_status').style.display = 'none';
document.getElementById('title_id').value = '';
document.getElementById('closing_id').value = '';
document.getElementById('prop_id').value = '';
document.getElementById('app_id').value = '';
document.getElementById('anc_id').value = '';
document.getElementById('avm_id').value = '';
document.getElementById('cr_id').value = '';
document.getElementById('sn_id').value = '';
document.getElementById('all_title_block').style.display = 'none';
document.getElementById('title_title_block').style.display = 'none';
document.getElementById('property_title_block').style.display = 'none';
document.getElementById('appraisal_title_block').style.display = 'block';
document.getElementById('flood_title_block').style.display = 'none';
document.getElementById('avm_title_block').style.display = 'none';
document.getElementById('credit_title_block').style.display = 'none';
document.getElementById('signing_title_block').style.display = 'none';
document.getElementById('closing_title_block').style.display = 'none';
}
if (product == 'flood') {
document.getElementById('title_ids').style.display = 'none';
document.getElementById('title_closings').style.display = 'none';
document.getElementById('property_ids').style.display = 'none';
document.getElementById('appraisal_ids').style.display = 'none';
document.getElementById('anc_ids').style.display = 'block';
document.getElementById('avm_ids').style.display = 'none';
document.getElementById('normal_status').style.display = 'block';
document.getElementById('closing_status').style.display = 'none';

document.getElementById('credit_ids').style.display = 'none';
document.getElementById('signing_ids').style.display = 'none';
document.getElementById('title_id').value = '';
document.getElementById('closing_id').value = '';
document.getElementById('prop_id').value = '';
document.getElementById('app_id').value = '';
document.getElementById('anc_id').value = '';
document.getElementById('avm_id').value = '';
document.getElementById('cr_id').value = '';
document.getElementById('sn_id').value = '';
document.getElementById('all_title_block').style.display = 'none';
document.getElementById('title_title_block').style.display = 'none';
document.getElementById('property_title_block').style.display = 'none';
document.getElementById('appraisal_title_block').style.display = 'none';
document.getElementById('flood_title_block').style.display = 'block';
document.getElementById('avm_title_block').style.display = 'none';
document.getElementById('credit_title_block').style.display = 'none';
document.getElementById('signing_title_block').style.display = 'none';
document.getElementById('closing_title_block').style.display = 'none';
}
if (product == 'avm') {
document.getElementById('title_ids').style.display = 'none';
document.getElementById('title_closings').style.display = 'none';
document.getElementById('property_ids').style.display = 'none';
document.getElementById('appraisal_ids').style.display = 'none';
document.getElementById('anc_ids').style.display = 'none';
document.getElementById('avm_ids').style.display = 'block';
document.getElementById('credit_ids').style.display = 'none';
document.getElementById('signing_ids').style.display = 'none';
document.getElementById('normal_status').style.display = 'block';
document.getElementById('closing_status').style.display = 'none';
document.getElementById('title_id').value = '';
document.getElementById('closing_id').value = '';
document.getElementById('prop_id').value = '';
document.getElementById('app_id').value = '';
document.getElementById('anc_id').value = '';
document.getElementById('avm_id').value = '';
document.getElementById('cr_id').value = '';
document.getElementById('sn_id').value = '';
document.getElementById('all_title_block').style.display = 'none';
document.getElementById('title_title_block').style.display = 'none';
document.getElementById('property_title_block').style.display = 'none';
document.getElementById('appraisal_title_block').style.display = 'none';
document.getElementById('flood_title_block').style.display = 'none';
document.getElementById('avm_title_block').style.display = 'block';
document.getElementById('credit_title_block').style.display = 'none';
document.getElementById('signing_title_block').style.display = 'none';
document.getElementById('closing_title_block').style.display = 'none';
}
if (product == 'credit') {
document.getElementById('title_ids').style.display = 'none';
document.getElementById('title_closings').style.display = 'none';
document.getElementById('property_ids').style.display = 'none';
document.getElementById('appraisal_ids').style.display = 'none';
document.getElementById('anc_ids').style.display = 'none';
document.getElementById('avm_ids').style.display = 'none';
document.getElementById('credit_ids').style.display = 'block';
document.getElementById('signing_ids').style.display = 'none';
document.getElementById('normal_status').style.display = 'block';
document.getElementById('closing_status').style.display = 'none';

document.getElementById('title_id').value = '';
document.getElementById('closing_id').value = '';
document.getElementById('prop_id').value = '';
document.getElementById('app_id').value = '';
document.getElementById('anc_id').value = '';
document.getElementById('avm_id').value = '';
document.getElementById('cr_id').value = '';
document.getElementById('sn_id').value = '';
document.getElementById('all_title_block').style.display = 'none';
document.getElementById('title_title_block').style.display = 'none';
document.getElementById('property_title_block').style.display = 'none';
document.getElementById('appraisal_title_block').style.display = 'none';
document.getElementById('flood_title_block').style.display = 'none';
document.getElementById('avm_title_block').style.display = 'none';
document.getElementById('credit_title_block').style.display = 'block';
document.getElementById('signing_title_block').style.display = 'none';
document.getElementById('closing_title_block').style.display = 'none';
}
if (product == 'signing') {
document.getElementById('title_ids').style.display = 'none';
document.getElementById('title_closings').style.display = 'none';
document.getElementById('property_ids').style.display = 'none';
document.getElementById('appraisal_ids').style.display = 'none';
document.getElementById('anc_ids').style.display = 'none';
document.getElementById('avm_ids').style.display = 'none';
document.getElementById('credit_ids').style.display = 'none';
document.getElementById('signing_ids').style.display = 'block';
document.getElementById('normal_status').style.display = 'block';
document.getElementById('closing_status').style.display = 'none';

document.getElementById('title_id').value = '';
document.getElementById('closing_id').value = '';
document.getElementById('prop_id').value = '';
document.getElementById('app_id').value = '';
document.getElementById('anc_id').value = '';
document.getElementById('avm_id').value = '';
document.getElementById('cr_id').value = '';
document.getElementById('sn_id').value = '';
document.getElementById('all_title_block').style.display = 'none';
document.getElementById('title_title_block').style.display = 'none';
document.getElementById('property_title_block').style.display = 'none';
document.getElementById('appraisal_title_block').style.display = 'none';
document.getElementById('flood_title_block').style.display = 'none';
document.getElementById('avm_title_block').style.display = 'none';
document.getElementById('credit_title_block').style.display = 'none';
document.getElementById('signing_title_block').style.display = 'block';
document.getElementById('closing_title_block').style.display = 'none';
}
}

</script>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0 onLoad="select_product('all');">

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
	<tr id="all_title_block" style="display: block;">
			<td width=780 align=left valign=top bgcolor=gray>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>All Product Report Search</B></CENTER>
			</TD>
		</TR>
	<tr id="title_title_block" style="display: none;">
		<td width=820 align=left valign=top bgcolor=green>
		    <FONT FACE=ARIAL SIZE=2 color="white">
			<CENTER><B>Title Commitment Report Search</B></CENTER>
        </TD>
    </TR>
	<tr id="property_title_block" style="display: none;">
			<td width=820 align=left valign=top bgcolor=purple>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Property Report Search</B></CENTER>
			</TD>
		</TR>
		<tr id="appraisal_title_block" style="display: none;">
			<td width=820 align=left valign=top bgcolor=navy>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Appraisal Report Search</B></CENTER>
			</TD>
		</TR>
		<tr id="flood_title_block" style="display: none;">
			<td width=820 align=left valign=top bgcolor=black>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Flood Report Search</B></CENTER>
			</TD>
		</TR>
		<tr id="avm_title_block" style="display: none;">
			<td width=820 align=left valign=top bgcolor=red>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>AVM Report Search</B></CENTER>
			</TD>
		</TR>
		<tr id="credit_title_block" style="display: none;">
			<td width=820 align=left valign=top bgcolor=brown>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Credit Report Search</B></CENTER>
			</TD>
		</TR>
		<tr id="signing_title_block" style="display: none;">
			<td width=820 align=left valign=top bgcolor=orange>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Signing Report Search</B></CENTER>
			</TD>
		</TR>
		<tr id="closing_title_block" style="display: none;">
			<td width=820 align=left valign=top bgcolor=gray>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Product Report Search</B></CENTER>
			</TD>
		</TR>
<CFFORM NAME="frm" ACTION="./title_rep_display.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" METHOD=POST>
<INPUT type="hidden" name="update" value="no"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><tr>
			<td width=780 align=center valign=top bgcolor=d3d3d3>
		
		<table width=350 cellpadding=1 cellspacing=1 border=0>
		<tr>		
<td bgcolor=d3d3d3 width=350 align=center valign=top>
							<br><FONT FACE=verdana SIZE=1 color="blUE">
							<B>SELECT A PRODUCT</b>
						</td>
</tr>
						<td bgcolor=d3d3d3 width=350 align=center valign=top>
							<SELECT NAME="product"	onchange="select_product(this.value)"		
								size="1" 
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e1e1e1; 
								border-color: e1e1e1; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none; 
								float: none;" 
								rows="5" 
								cols="45" 
								>
								
								
								<OPTION VALUE="all" <cfif form.product eq 'all'>selected</cfif>>All</OPTION>
								<OPTION VALUE="title" <cfif form.product eq 'title'>selected</cfif>>Title</OPTION>								
								<OPTION VALUE="property" <cfif form.product eq 'property'>selected</cfif>>Property</OPTION>
								<OPTION VALUE="appraisal" <cfif form.product eq 'appraisal'>selected</cfif>>Appraisal</OPTION>
								<OPTION VALUE="flood" <cfif form.product eq 'flood'>selected</cfif>>Flood</OPTION>
								<OPTION VALUE="credit" <cfif form.product eq 'credit'>selected</cfif>>Credit</OPTION>
								<OPTION VALUE="avm" <cfif form.product eq 'avm'>selected</cfif>>AVM</OPTION>
								<OPTION VALUE="signing" <cfif form.product eq 'signing'>selected</cfif>>Signing</OPTION>
								<OPTION VALUE="closing" <cfif form.product eq 'closing'>selected</cfif>>Closing</OPTION>
								
							</SELECT>
						
						<br><br>
						
						</td>
					</tr>
				</table>



<table width=850 cellpadding=1 cellspacing=1 border=0>
							
							
							
							
							
							<tr>
						<nobr><td bgcolor=d3d3d3 width=850 align=center valign=top>
								<B>FROM</B>
		<select name="confirm_mon" onChange="monthresult()"
		
											size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none; 
											float: none;" 
											rows="3" 
											cols="45" 
											>
<option value="Month">Month</option>

		
	   	<option value="01">January</option>
		<option value="02">February</option>
		<option value="03">March</option>
		<option value="04">April</option>
		<option value="05">May</option>
		<option value="06">June</option>
		<option value="07">July</option>
		<option value="08">August</option>
		<option value="09">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>


</select>

<select name="comfirm_day" onChange="dayresult()"
size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none; 
											float: none;" 
											rows="3" 
											cols="45" 
											>



<OPTION VALUE="Day">Day</OPTION>

	 	
		<OPTION VALUE="01">01</OPTION>
		<OPTION VALUE="02">02</OPTION>
		<OPTION VALUE="03">03</OPTION>
		<OPTION VALUE="04">04</OPTION>
		<OPTION VALUE="05">05</OPTION>
		<OPTION VALUE="06">06</OPTION>
		<OPTION VALUE="07">07</OPTION>
		<OPTION VALUE="08">08</OPTION>
		<OPTION VALUE="09">09</OPTION>
		<OPTION VALUE="10">10</OPTION>
		<OPTION VALUE="11">11</OPTION>
		<OPTION VALUE="12">12</OPTION>
		<OPTION VALUE="13">13</OPTION>
		<OPTION VALUE="14">14</OPTION>
		<OPTION VALUE="15">15</OPTION>
		<OPTION VALUE="16">16</OPTION>
		<OPTION VALUE="17">17</OPTION>
		<OPTION VALUE="18">18</OPTION>
		<OPTION VALUE="19">19</OPTION>
		<OPTION VALUE="20">20</OPTION>
		<OPTION VALUE="21">21</OPTION>
		<OPTION VALUE="22">22</OPTION>
		<OPTION VALUE="23">23</OPTION>
		<OPTION VALUE="24">24</OPTION>
		<OPTION VALUE="25">25</OPTION>
		<OPTION VALUE="26">26</OPTION>
		<OPTION VALUE="27">27</OPTION>
		<OPTION VALUE="28">28</OPTION>
		<OPTION VALUE="29">29</OPTION>
		<OPTION VALUE="30">30</OPTION>			
		<OPTION VALUE="31">31</OPTION>
</select>  
<select name="confirm_year" onChange="yearresult()"
size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none; 
											float: none;" 
											rows="3" 
											cols="45" 
											>
		


<option value="Year">Year</option>

		
		
	   	<option value="2000">2000</option>
		<option value="2001">2001</option>
		<option value="2002">2002</option>
		<option value="2003">2003</option>
		<option value="2004">2004</option>
		<option value="2005">2005</option>
		<option value="2006">2006</option>
		<option value="2007">2007</option>
		<option value="2008">2008</option>
		<option value="2009">2009</option>
		<option value="2010">2010</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
<option value="2016">2016</option>
<option value="2017">2017</option>
<option value="2018">2018</option>
<option value="2019">2019</option>
<option value="2020">2020</option>
		</select>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <B>TO</B>

		<select name="confirm_mon_to"
		size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none; 
											float: none;" 
											rows="3" 
											cols="45" 
											>

<option value="Month">Month</option>

		
	   	<option value="01">January</option>
		<option value="02">February</option>
		<option value="03">March</option>
		<option value="04">April</option>
		<option value="05">May</option>
		<option value="06">June</option>
		<option value="07">July</option>
		<option value="08">August</option>
		<option value="09">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>


</select>

<select name="comfirm_day_to"
size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none; 
											float: none;" 
											rows="3" 
											cols="45" 
											>



<OPTION VALUE="Day">Day</OPTION>

	 	
		<OPTION VALUE="01">01</OPTION>
		<OPTION VALUE="02">02</OPTION>
		<OPTION VALUE="03">03</OPTION>
		<OPTION VALUE="04">04</OPTION>
		<OPTION VALUE="05">05</OPTION>
		<OPTION VALUE="06">06</OPTION>
		<OPTION VALUE="07">07</OPTION>
		<OPTION VALUE="08">08</OPTION>
		<OPTION VALUE="09">09</OPTION>
		<OPTION VALUE="10">10</OPTION>
		<OPTION VALUE="11">11</OPTION>
		<OPTION VALUE="12">12</OPTION>
		<OPTION VALUE="13">13</OPTION>
		<OPTION VALUE="14">14</OPTION>
		<OPTION VALUE="15">15</OPTION>
		<OPTION VALUE="16">16</OPTION>
		<OPTION VALUE="17">17</OPTION>
		<OPTION VALUE="18">18</OPTION>
		<OPTION VALUE="19">19</OPTION>
		<OPTION VALUE="20">20</OPTION>
		<OPTION VALUE="21">21</OPTION>
		<OPTION VALUE="22">22</OPTION>
		<OPTION VALUE="23">23</OPTION>
		<OPTION VALUE="24">24</OPTION>
		<OPTION VALUE="25">25</OPTION>
		<OPTION VALUE="26">26</OPTION>
		<OPTION VALUE="27">27</OPTION>
		<OPTION VALUE="28">28</OPTION>
		<OPTION VALUE="29">29</OPTION>
		<OPTION VALUE="30">30</OPTION>			
		<OPTION VALUE="31">31</OPTION>
</select>  
<select name="confirm_year_to"
size="1" 
											style="font-size: 9; 
											font-family: verdana; 
											font-style: normal; 
											color: BLUE; 
											background-color: E4E3E3; 
											border-color: white; 
											border-left-width: thin; 
											border-right-width: thin; 
											border-top-width: thin; 
											border-bottom-width: thin; 
											border-width: thin; 
											border-style: bar; 
											clear: none; 
											float: none;" 
											rows="3" 
											cols="45" 
											>
		


<option value="Year">Year</option>

		
		
	   	<option value="2000">2000</option>
		<option value="2001">2001</option>
		<option value="2002">2002</option>
		<option value="2003">2003</option>
		<option value="2004">2004</option>
		<option value="2005">2005</option>
		<option value="2006">2006</option>
		<option value="2007">2007</option>
		<option value="2008">2008</option>
		<option value="2009">2009</option>
		<option value="2010">2010</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
		<OPTION VALUE="2016">2016</OPTION>
		<OPTION VALUE="2017">2017</OPTION>
		<OPTION VALUE="2018">2018</OPTION>
		<OPTION VALUE="2019">2019</OPTION>
		<OPTION VALUE="2020">2020</OPTION>
		</select>
						</td></nobr>
					</tr>
				</table>		
					<table width=650 cellpadding=1 cellspacing=1 border=0>
					
				
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Clients 
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="company_id"	multiple		
								size="5" 
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e1e1e1; 
								border-color: e1e1e1; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none; 
								float: none;" 
								rows="5" 
								cols="45" 
								>
								
								<OPTION VALUE="NONE" selected>N/A</OPTION>
								<CFOUTPUT QUERY="read_companies"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>			
							</SELECT>
						</td>
					</tr>
					<tr id = "title_ids" style="display: none;">
					<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Title Number
						</td>
						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<!--- <SELECT NAME="Title_id"			
								size="1" 
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e1e1e1; 
								border-color: e1e1e1; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none; 
								float: none;" 
								rows="5" 
								cols="45" 
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid"><OPTION VALUE="#Title_ID#">#Title_ID#</OPTION></CFOUTPUT>			
							</SELECT> --->
							<input type="text" name="title_id" size=15 maxlength=15 style="font-size: 9; 
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
								clear: none;" 
								>
						</td>
					</tr>




<tr id = "title_closings" style="display: none;">
					<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Title Closing Number
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<!--- <SELECT NAME="closing_id"			
								size="1" 
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e1e1e1; 
								border-color: e1e1e1; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none; 
								float: none;" 
								rows="5" 
								cols="45" 
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid_c"><OPTION VALUE="#Title_ID#">#Title_ID#</OPTION></CFOUTPUT>			
							</SELECT> --->
							<input type="text" name="closing_id" size=15 maxlength=15 style="font-size: 9; 
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
								clear: none;" 
								>
						</td>
					</tr>
					
<tr id = "property_ids" style="display: none;">
					<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Property Number
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<!--- <SELECT NAME="prop_id"			
								size="1" 
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e1e1e1; 
								border-color: e1e1e1; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none; 
								float: none;" 
								rows="5" 
								cols="45" 
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid_p"><OPTION VALUE="#prop_ID#">0232#prop_ID#</OPTION></CFOUTPUT>			
							</SELECT> --->
							<input type="text" name="prop_id" size=15 maxlength=15 style="font-size: 9; 
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
								clear: none;" 
								>
						</td>
					</tr>
					
<tr id = "appraisal_ids" style="display: none;">
					<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Appraisal Number
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<!--- <SELECT NAME="app_id"			
								size="1" 
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e1e1e1; 
								border-color: e1e1e1; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none; 
								float: none;" 
								rows="5" 
								cols="45" 
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid_a"><OPTION VALUE="#app_ID#">#app_ID#</OPTION></CFOUTPUT>			
							</SELECT> --->
							<input type="text" name="app_id" size=15 maxlength=15 style="font-size: 9; 
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
								clear: none;" 
								>
						</td>
					</tr>					
<tr id = "anc_ids" style="display: none;">
					<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Flood Number
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<!--- <SELECT NAME="anc_id"			
								size="1" 
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e1e1e1; 
								border-color: e1e1e1; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none; 
								float: none;" 
								rows="5" 
								cols="45" 
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid_anc"><OPTION VALUE="#anc_ID#">#anc_ID#</OPTION></CFOUTPUT>			
							</SELECT> --->
							<input type="text" name="anc_id" size=15 maxlength=15 style="font-size: 9; 
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
								clear: none;" 
								>
						</td>
					</tr>	
<tr id = "avm_ids" style="display: none;">
					<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							AVM Number
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<!--- <SELECT NAME="avm_id"			
								size="1" 
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e1e1e1; 
								border-color: e1e1e1; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none; 
								float: none;" 
								rows="5" 
								cols="45" 
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid_avm"><OPTION VALUE="#anc_ID#">#anc_ID#</OPTION></CFOUTPUT>			
							</SELECT> --->
							<input type="text" name="avm_id" size=15 maxlength=15 style="font-size: 9; 
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
								clear: none;" 
								>
						</td>
					</tr>
<tr id = "credit_ids" style="display: none;">
					<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Credit Number
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<!--- <SELECT NAME="cr_id"			
								size="1" 
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e1e1e1; 
								border-color: e1e1e1; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none; 
								float: none;" 
								rows="5" 
								cols="45" 
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid_cr"><OPTION VALUE="#anc_ID#">#anc_ID#</OPTION></CFOUTPUT>			
							</SELECT> --->
							<input type="text" name="cr_id" size=15 maxlength=15 style="font-size: 9; 
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
								clear: none;" 
								>
						</td>
					</tr>	
<tr id = "signing_ids" style="display: none;">
					<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Signing Number
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<!--- <SELECT NAME="sn_id"			
								size="1" 
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e1e1e1; 
								border-color: e1e1e1; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none; 
								float: none;" 
								rows="5" 
								cols="45" 
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid_sn"><OPTION VALUE="#anc_ID#">#anc_ID#</OPTION></CFOUTPUT>			
							</SELECT> --->
							<input type="text" name="sn_id" size=15 maxlength=15 style="font-size: 9; 
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
								clear: none;" 
								>
						</td>
					</tr>
				<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
					      <FONT FACE=verdana SIZE=1 color="black">
							Loan Number -
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="loan_number" size=15 maxlength=15
								size="1" 
								style="font-size: 9; 
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
								clear: none;" 
								>
						</td>
					</tr>
				
					<!--- <tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Loan Processors 
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="user_id"			
								size="1" 
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e1e1e1; 
								border-color: e1e1e1; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none; 
								float: none;" 
								rows="5" 
								cols="45" 
								>
								<OPTION VALUE="NONE">N/A</OPTION>
				<CFOUTPUT>
					<CFLOOP FROM="1" TO="#ArrayLen(a_company_name)#" INDEX="AAA">
						<CFIF #a_rec_count[AAA]# NEQ "0">
							<OPTION VALUE="NONE">------------------------------------</OPTION>
							
							<OPTION VALUE="NONE">#a_company_name[AAA]#</OPTION>
							<CFLOOP FROM="1" TO="#a_rec_count[AAA]#" INDEX="BBB">
								<cfset user_id = #users_id[AAA][BBB]#>
								<OPTION VALUE="#user_id#">&nbsp;&nbsp;--&nbsp;&nbsp;&nbsp;#users_lname[AAA][BBB]#,  #users_fname[AAA][BBB]#</OPTION>
							</CFLOOP>
							<OPTION VALUE="NONE"></OPTION>
						</CFIF>
					</CFLOOP>
				</CFOUTPUT>

							</SELECT>
						</td>
					</tr> --->
		<!--- ================================================== --->				
		<tr id="normal_status" style="display: none;">		
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="Appraisal_status"			
								size="1" 
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e1e1e1; 
								border-color: e1e1e1; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none; 
								float: none;" 
								rows="5" 
								cols="45" 
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								 <option value="In Process" style="thin">In Process</OPTION>	 
	  <option value="In Typing">In Typing</OPTION>
	<option value="Report E-mailed" style="thin">Report E-mailed</OPTION>
	<option value="Report Faxed" style="thin" >Report Faxed</OPTION>
	<option value="Cancelled per client" style="thin">Cancelled per client</OPTION>
								</SELECT>
						</td>
					</tr>
		<tr id="closing_status" style="display: none;">		
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Status
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="closing_status"			
								size="1" 
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e1e1e1; 
								border-color: e1e1e1; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none; 
								float: none;" 
								rows="5" 
								cols="45" 
								>
								<OPTION VALUE="Closing Requested">Closing Requested</OPTION>
								 <option value="Closer Assigned" style="thin">Closer Assigned</OPTION>	 
	  <option value="Closing Info Submitted">Closing Info Submitted</OPTION>
	<option value="Loan Closed" style="thin">Loan Closed</OPTION>
	<option value="Loan Funded" style="thin" >Loan Funded</OPTION>
								</SELECT>
						</td>
					</tr>
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer First Name -  
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
								size="1" 
								style="font-size: 9; 
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
								clear: none;" >
						</td>
					</tr>
		<!--- ================================================== --->						
					<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer Last Name -  
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
								size="1" 
								style="font-size: 9; 
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
								clear: none;" >
						</td>
					</tr>
					
			<tr>
						<td bgcolor=d3d3d3 width=250 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Sort By
						</td>

						<td bgcolor=d3d3d3 width=400 align=left valign=top>
							<SELECT NAME="sortorder"			
								size="1" 
								style="font-size: 9; 

								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e1e1e1; 
								border-color: e1e1e1; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none; 
								float: none;" 
								rows="5" 
								cols="45" 
								>
<OPTION VALUE="NONE">N/A</OPTION>
<OPTION VALUE="check_date">Order Date</OPTION>
<OPTION VALUE="Title_id">Order Number</OPTION>
<OPTION VALUE="appraisal_status">Status</OPTION>
<OPTION VALUE="User_ID">Loan Processor</OPTION>
</SELECT>
						</td>
					</tr>	
						

					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=650 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0> 
						</td>

					</tr>
</CFFORM>
<!--- ======================================================================== --->

				</table>
			</TD>
		</TR>

<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->

			</TD>
		</TR>

	</table>

</BODY>
</HTML>