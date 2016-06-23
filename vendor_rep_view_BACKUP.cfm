<cfparam name="url.reject" default=0>
<cfparam name="url.rejected_file" default=0>
<cfif isdefined("url.username") and isdefined("url.password")>

<CFQUERY datasource="#request.dsn#" NAME="read_abstractor">

			SELECT *
			FROM abstractors
			WHERE username = '#URLDecode(url.username)#' and password = '#URLDecode(url.password)#'

	</CFQUERY>
		<cfif #read_abstractor.Abstractor_ID# eq 1810>
		<cfset session.Is_Logged_in = 1>
	    <cfset session.FT_user_id = 1810>
		<cflocation url="ctc_payoff_upload.cfm" addtoken="no">
		</cfif>
</cfif>

		<cfparam name="url.message" default="">
<CFSET r_count = "0">
<cfif #a_trigger# eq "1">


		<CFQUERY datasource="#request.dsn#" NAME="read_abstractor">

			SELECT *
			FROM abstractors
			WHERE username = '#URLDecode(url.username)#' and password = '#URLDecode(url.password)#'

	</CFQUERY>

<cfset vendor_type = read_abstractor.type>

		<cfif #read_abstractor.Abstractor_ID# eq 1810>
		<cfset session.Is_Logged_in = 1>
	    <cfset session.FT_user_id = 1810>
		<cflocation url="ctc_payoff_upload.cfm" addtoken="no">
		</cfif>



<cfif #read_abstractor.Abstractor_ID# eq 1481>
		<CFQUERY datasource="#request.dsn#" NAME="read_abstractor_order">
			SELECT *
			FROM abstractors a, doc_abstract_Title b, Title t
			WHERE (a.abstractor_id = b.abstractor_id or a.abstractor_id = b.abstractor_tax_id) and b.chandresh_access = 1
			AND ((b.abstractor_doc_upload is NULL) or (b.abstractor_doc_upload2 is NULL) or (b.abstractor_doc_upload3 is NULL))
and t.title_id = b.title_id
order by b.title_id
	</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_property_order">
			SELECT *
			FROM abstractors a, doc_abstract_prop b, Property t
			WHERE (a.abstractor_id = b.abstractor_id or a.abstractor_id = b.abstractor_tax_id) and b.chandresh_access = 1
			AND ((b.abstractor_doc_upload is NULL) or (b.abstractor_doc_upload2 is NULL) or (b.abstractor_doc_upload3 is NULL))
and t.prop_id = b.prop_id
order by b.prop_id
	</CFQUERY>

		<cfelse>



<cfif vendor_type eq 4 or vendor_type eq 999>
<CFQUERY datasource="#request.dsn#" NAME="read_abstractor_order">
SELECT *
FROM abstractors a, doc_abstract_Title b, Title t, tax_cert_title tc
WHERE a.username = '#url.username#' and a.password = '#url.password#'
and ((a.abstractor_id = b.abstractor_tax_id)
and t.title_id = b.title_id
and tc.title_id = t.title_id
and tc.title_id = b.title_id
and (tc.taxes_completed IS NULL or tc.taxes_completed = ''))
and (t.cancelled is null or t.cancelled = 0)
<!--- and (t.appraisal_status <> 'Loan Closed') --->
order by b.title_id
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_property_order">
SELECT *
FROM abstractors a, doc_abstract_Prop b, Property t, tax_cert_prop tc
WHERE a.username = '#url.username#' and a.password = '#url.password#'
and ((a.abstractor_id = b.abstractor_tax_id)
and t.prop_id = b.prop_id
and tc.prop_id = t.prop_id
and tc.prop_id = b.prop_id
and (tc.taxes_completed IS NULL or tc.taxes_completed = ''))
<!--- and t.order_date > '#DateFormat(DateAdd("d", -30, Now()), "m/d/yyyy")#' --->
and (t.cancelled is null or t.cancelled = 0)
and (t.appraisal_status <> 'Loan Closed')
and (t.appraisal_status <> 'Loan Funded')
and (t.appraisal_status <> 'Loan Closed-Seller Rep')
order by b.prop_id
</CFQUERY>
<cfelse>
<cfif read_abstractor.typing_and_abs eq 1>
<CFQUERY datasource="#request.dsn#" NAME="read_abstractor_order">
SELECT *
FROM abstractors a, doc_abstract_Title b, Title t, tblUser_Roles tbl
WHERE (a.username = '#url.username#' and a.password = '#url.password#')
and (a.abstractor_id = b.abstractor_id or a.abstractor_id = b.abstractor_id_3)
AND (b.abstractor_doc_upload is NULL or tbl.Typing_End_Datetime is NULL)
and t.title_id = b.title_id
and t.title_id = tbl.title_id
<!--- and t.order_date > '#DateFormat(DateAdd("d", -30, Now()), "m/d/yyyy")#' --->
and (t.cancelled is null or t.cancelled = 0)
<!--- and (t.appraisal_status <> 'Loan Closed') --->
and (t.appraisal_status <> 'Loan Funded')
and (t.appraisal_status <> 'Loan Closed-Seller Rep')
order by b.title_id
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_abstractor_typing_order">
SELECT *
FROM title
WHERE title_id = 99999999999
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_property_order">
SELECT *
FROM abstractors a, doc_abstract_Prop b, Property t, tblUser_Roles tbl
WHERE (a.username = '#url.username#' and a.password = '#url.password#')
and (a.abstractor_id = b.abstractor_id or a.abstractor_id = b.abstractor_id_3)
AND (b.abstractor_doc_upload is NULL or tbl.Typing_End_Datetime is NULL)
and t.prop_id = b.prop_id
and t.prop_id = tbl.prop_id
<!--- and t.order_date > '#DateFormat(DateAdd("d", -30, Now()), "m/d/yyyy")#' --->
and (t.cancelled is null or t.cancelled = 0)
and (t.appraisal_status <> 'Loan Closed')
and (t.appraisal_status <> 'Loan Funded')
and (t.appraisal_status <> 'Loan Closed-Seller Rep')
order by b.prop_id
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_property_typing_order">
SELECT *
FROM Property
WHERE prop_id = 99999999999
</CFQUERY>

<cfelse>
<cfoutput>Read query 1<br></cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_abstractor_order">
SELECT *
FROM abstractors a, doc_abstract_Title b, Title t
WHERE (a.username = '#url.username#' and a.password = '#url.password#')
and (a.abstractor_id = b.abstractor_id)
AND (b.abstractor_doc_upload is NULL)
and t.title_id = b.title_id
<!--- and t.order_date > '#DateFormat(DateAdd("d", -30, Now()), "m/d/yyyy")#' --->
and (t.cancelled is null or t.cancelled = 0)
<!--- and (t.appraisal_status <> 'Loan Closed') --->
and (t.appraisal_status <> 'Loan Funded')
and (t.appraisal_status <> 'Loan Closed-Seller Rep')
order by b.title_id
</CFQUERY>
<cfoutput>Read query 2<br></cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_abstractor_typing_order">
SELECT *
FROM abstractors a, doc_abstract_Title b, Title t, tblUser_Roles tbl
WHERE (a.username = '#url.username#' and a.password = '#url.password#')
and (a.abstractor_id = b.abstractor_id_3)
AND (tbl.Typing_End_Datetime is NULL)
and t.title_id = b.title_id
and t.title_id = tbl.title_id
<!--- and t.order_date > '#DateFormat(DateAdd("d", -30, Now()), "m/d/yyyy")#' --->
and (t.cancelled is null or t.cancelled = 0)
<!--- and (t.appraisal_status <> 'Loan Closed') --->
and (t.appraisal_status <> 'Loan Funded')
and (t.appraisal_status <> 'Loan Closed-Seller Rep')
order by b.title_id
</CFQUERY>
<cfoutput>Read query 3<br></cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_property_order">
SELECT *
FROM abstractors a, doc_abstract_prop b, Property t
WHERE (a.username = '#url.username#' and a.password = '#url.password#')
and (a.abstractor_id = b.abstractor_id)
AND (b.abstractor_doc_upload is NULL)
and t.prop_id = b.prop_id
<!--- and t.order_date > '#DateFormat(DateAdd("d", -30, Now()), "m/d/yyyy")#' --->
and (t.cancelled is null or t.cancelled = 0)
and (t.appraisal_status <> 'Loan Closed')
and (t.appraisal_status <> 'Loan Funded')
and (t.appraisal_status <> 'Loan Closed-Seller Rep')
order by b.prop_id
</CFQUERY>
<cfoutput>Read query 4<br></cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_property_typing_order">
SELECT *
FROM abstractors a, doc_abstract_Prop b, Property t, tblUser_Roles tbl
WHERE (a.username = '#url.username#' and a.password = '#url.password#')
and (a.abstractor_id = b.abstractor_id_3)
AND (tbl.Typing_End_Datetime is NULL)
and t.prop_id = b.prop_id
and t.prop_id = tbl.prop_id
<!--- and t.order_date > '#DateFormat(DateAdd("d", -30, Now()), "m/d/yyyy")#' --->
and (t.cancelled is null or t.cancelled = 0)
and (t.appraisal_status <> 'Loan Closed')
and (t.appraisal_status <> 'Loan Funded')
and (t.appraisal_status <> 'Loan Closed-Seller Rep')
order by b.prop_id
</CFQUERY>
</cfif>
</cfif>
</cfif>



	<cfelseif #a_trigger# eq "2">
<cfoutput>Read query 5<br></cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_closer_order">

			SELECT *
			FROM closer a, doc_closer_title b
			WHERE a.closer_id = b.closer_id and username = '#url.user#' and password = '#url.pass#' order by b.title_id

	</CFQUERY>


<cfelse>

<cfoutput>Read query 6<br></cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_title_payoff1_order">
 SELECT *
 FROM Pay_off_Lender_1_Title a, Title b
 WHERE a.title_id = b.title_id
 and a.a_assigned_by IS NOT NULL and a.payoff1_upload IS NULL
 order by b.title_id
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_title_payoff2_order">
 SELECT *
 FROM Pay_off_Lender_2_Title a, Title b
 WHERE a.title_id = b.title_id
 and a.a_assigned_by IS NOT NULL and a.payoff2_upload IS NULL
 order by b.title_id
</CFQUERY>
<cfset title_orders_temp = QueryNew("title_id, account_num, payoff_id, payoff_num")>

<cfoutput query="read_title_payoff1_order">
<cfset temp = QueryAddRow(title_orders_temp)>
<cfset temp = QuerySetCell(title_orders_temp, "title_id", read_title_payoff1_order.title_id)>
<cfset temp = QuerySetCell(title_orders_temp, "account_num", read_title_payoff1_order.poacctno1)>
<cfset temp = QuerySetCell(title_orders_temp, "payoff_id", read_title_payoff1_order.pay_off_1_id)>
<cfset temp = QuerySetCell(title_orders_temp, "payoff_num", 1)>
</cfoutput>
<cfoutput query="read_title_payoff2_order">
<cfset temp = QueryAddRow(title_orders_temp)>
<cfset temp = QuerySetCell(title_orders_temp, "title_id", read_title_payoff2_order.title_id)>
<cfset temp = QuerySetCell(title_orders_temp, "account_num", read_title_payoff2_order.poacctno2)>
<cfset temp = QuerySetCell(title_orders_temp, "payoff_id", read_title_payoff2_order.pay_off_2_id)>
<cfset temp = QuerySetCell(title_orders_temp, "payoff_num", 2)>
</cfoutput>
<cfoutput>Read query 7<br></cfoutput>
<cfquery dbtype="query" name="title_orders">
	SELECT *
	FROM title_orders_temp
	order by title_id
</cfquery>










<cfoutput>Read query 8<br></cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_prop_payoff1_order">
 SELECT *
 FROM Pay_off_Lender_1_Prop a, Property b
 WHERE a.prop_id = b.prop_id
 and a.a_assigned_by IS NOT NULL and a.payoff1_upload IS NULL
 order by b.prop_id
</CFQUERY>
<cfoutput>Read query 9<br></cfoutput>
<CFQUERY datasource="#request.dsn#" NAME="read_prop_payoff2_order">
 SELECT *
 FROM Pay_off_Lender_2_Prop a, Property b
 WHERE a.prop_id = b.prop_id
 and a.a_assigned_by IS NOT NULL and a.payoff2_upload IS NULL
 order by b.prop_id
</CFQUERY>
<cfset property_orders_temp = QueryNew("prop_id, account_num, payoff_id, payoff_num")>

<cfoutput query="read_prop_payoff1_order">
<cfset temp = QueryAddRow(property_orders_temp)>
<cfset temp = QuerySetCell(property_orders_temp, "prop_id", read_prop_payoff1_order.prop_id)>
<cfset temp = QuerySetCell(property_orders_temp, "account_num", read_prop_payoff1_order.poacctno1)>
<cfset temp = QuerySetCell(property_orders_temp, "payoff_id", read_prop_payoff1_order.pay_off_1_id)>
<cfset temp = QuerySetCell(property_orders_temp, "payoff_num", 1)>
</cfoutput>
<cfoutput query="read_prop_payoff2_order">
<cfset temp = QueryAddRow(property_orders_temp)>
<cfset temp = QuerySetCell(property_orders_temp, "prop_id", read_prop_payoff2_order.prop_id)>
<cfset temp = QuerySetCell(property_orders_temp, "account_num", read_prop_payoff2_order.poacctno2)>
<cfset temp = QuerySetCell(property_orders_temp, "payoff_id", read_prop_payoff2_order.pay_off_2_id)>
<cfset temp = QuerySetCell(property_orders_temp, "payoff_num", 1)>
</cfoutput>
<cfoutput>Read query 10<br></cfoutput>
<cfquery dbtype="query" name="property_orders">
	SELECT *
	FROM property_orders_temp
	order by prop_id
</cfquery>

</cfif>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>

<script type="text/javascript">
function put() {
var frm;
frm = document.frm;

if (frm.Prop_id.value != 'NONE') {
if (frm.Title_id.value != 'NONE') {
frm.Title_id.selectedIndex = frm.Title_id.options[1];
}
}
}

function puta() {
var frm;
frm = document.frm;

if (frm.Title_id.value != 'NONE') {
if (frm.Prop_id.value != 'NONE') {
frm.Prop_id.selectedIndex = frm.Prop_id.options[1];
}
}
}



</script>

</head>

<cfif IsDefined("read_abstractor_order.recordcount") and read_abstractor_order.recordcount neq 0>
<cfoutput>Read query 11<br></cfoutput>
<cfquery dbtype="query" name="read_abstractor_order_updates">
	SELECT *
	FROM read_abstractor_order
	where title_update = 1
	order by title_id desc
</cfquery>
<cfoutput>Read query 12<br></cfoutput>
<cfquery dbtype="query" name="read_abstractor_order_non_updates">
	SELECT *
	FROM read_abstractor_order
	where title_update = 0
	order by title_id desc
</cfquery>

</cfif>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>



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
	<tr>
			<cfif #a_trigger# EQ "1">

			<td width=780 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B><cfif vendor_type eq 4 or vendor_type eq 999>Taxes<cfelse>Abstract</cfif> Order Search</B></CENTER>
			</TD>
		</TR>

<CFFORM name="frm" METHOD=POST ACTION="./vendor_view_orders.cfm?username=#username#&password=#password#&a_trigger=1">
<INPUT type="hidden" name="uid" value="URL.uid"><input type="hidden" name="username" value="#username#">
<input type="hidden" name="password" value="#username#">
	<INPUT type="hidden" name="al" value="URL.al"><tr>
			<td width=780 align=center valign=top bgcolor=d3d3d3>
				<table width=600 cellpadding=1 cellspacing=1 border=0>
<cfif url.reject neq 0 and url.rejected_file neq 0>
<cfoutput><tr>
<td colspan="2" bgcolor=d3d3d3 align="center"><font color=red>File #url.rejected_file# has been removed from your queue.</font></td>
</tr>
</cfoutput></cfif>
							<tr>


					<td bgcolor=d3d3d3 width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Title ID
						</td>

						<td bgcolor=d3d3d3 width=300 align=left valign=top>
							<SELECT NAME="Title_id"			onchange="puta()"
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
								<cfif read_abstractor_order.recordcount neq 0>
                                <cfif read_abstractor_order_updates.recordcount neq 0>
								<CFOUTPUT QUERY="read_abstractor_order_updates"><OPTION VALUE="#Title_ID#">#Title_ID# - UPDATE</OPTION>
								</CFOUTPUT>
								</cfif>
                                <cfif read_abstractor_order_non_updates.recordcount neq 0>
								<CFOUTPUT QUERY="read_abstractor_order_non_updates"><OPTION VALUE="#Title_ID#">#Title_ID#</OPTION>
								</CFOUTPUT>
								</cfif>
								</cfif>
								<cfif vendor_type neq 4 and vendor_type neq 999>
								<cfif read_abstractor_typing_order.recordcount neq 0>
								<CFOUTPUT QUERY="read_abstractor_typing_order">
								<OPTION VALUE="#Title_ID#">#Title_ID#</OPTION>
								</CFOUTPUT>
								</cfif>
								</cfif>
							</SELECT>
						</td>
					</tr>


					<tr>


					<td bgcolor=d3d3d3 width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Property ID
						</td>

						<td bgcolor=d3d3d3 width=300 align=left valign=top>
							<SELECT NAME="Prop_id"			onchange="put()"
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
								<cfif read_property_order.recordcount neq 0><CFOUTPUT QUERY="read_property_order"><OPTION VALUE="#Prop_ID#">#Prop_ID#</OPTION></CFOUTPUT></cfif>
								<cfif vendor_type neq 4 and vendor_type neq 999>
								<cfif read_property_typing_order.recordcount neq 0><CFOUTPUT QUERY="read_property_typing_order"><OPTION VALUE="#Prop_ID#">#Prop_ID#</OPTION></CFOUTPUT>
								</cfif></cfif>
							</SELECT>
						</td>
					</tr>


					<tr>
						<td bgcolor=d3d3d3 width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Month
						</td>

						<td bgcolor=d3d3d3 width=300 align=left valign=top>
							<SELECT NAME="oda_month"
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

	   	<option value="1">January</option>
		<option value="2">February</option>
		<option value="3">March</option>
		<option value="4">April</option>
		<option value="5">May</option>
		<option value="6">June</option>
		<option value="7">July</option>
		<option value="8">August</option>
		<option value="9">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>
							</SELECT>
						</td>
					</tr>

					<tr>
						<td bgcolor=d3d3d3 width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's First Name -
						</td>

						<td bgcolor=d3d3d3 width=300 align=left valign=top>
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
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
					<tr>
						<td bgcolor=d3d3d3 width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's Last Name -
						</td>

						<td bgcolor=d3d3d3 width=300 align=left valign=top>
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
								clear: none;"
								>
						</td>
					</tr>

			<!--- 		<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
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

					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
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


					</tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order By
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
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
<OPTION VALUE="oda_month">Month</OPTION>
<OPTION VALUE="Title_id">Order Number</OPTION>
</SELECT>
						</td>
					</tr>	 --->


					<tr>
						<td bgcolor=d3d3d3 colspan=3 width=600 align=center valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>

					</tr>
</CFFORM>

<!--- put up the last Daily Pipeline Email for them to see --->
<cfif vendor_type eq 4 or 999><!--- show tax vendor pipeline --->
<CFQUERY datasource="#request.dsn#" NAME="get_all">
SELECT *
FROM vendor_daily_report
WHERE (abstractor_id = '#read_abstractor.abstractor_id#')
and todays_date = '#DateFormat(Now(), "m/d/yyyy")#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_abstractor_orders">
SELECT *
FROM abstractors a, doc_abstract_TITLE b, TITLE t, tax_cert_TITLE tc
WHERE (a.abstractor_id = '#read_abstractor.abstractor_id#')
and ((a.abstractor_id = b.abstractor_tax_id)
and t.TITLE_ID = b.TITLE_ID
and tc.TITLE_ID = t.TITLE_ID
and tc.TITLE_ID = b.TITLE_ID
<cfif get_all.title neq ''>
and t.title_id IN (#get_all.title#))
<cfelse>
and t.title_id IN (0000000))
</cfif>
order by b.TITLE_ID
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_abstractor_prop_orders">
SELECT *
FROM abstractors a, doc_abstract_prop b, Property t, tax_cert_prop tc
WHERE (a.abstractor_id = '#read_abstractor.abstractor_id#')
and ((a.abstractor_id = b.abstractor_tax_id)
and t.prop_id = b.prop_id
and tc.prop_id = t.prop_id
and tc.prop_id = b.prop_id
<cfif get_all.prop neq ''>
and t.prop_id IN (#get_all.prop#))
<cfelse>
and t.prop_id IN (0000000))
</cfif>
order by b.prop_id
</CFQUERY>


<cfif read_abstractor_orders.recordcount neq 0 or read_abstractor_prop_orders.recordcount neq 0>

<CFQUERY datasource="#request.dsn#" NAME="get_comp_info">
Select email, company from Abstractors where abstractor_id = #read_abstractor.abstractor_id#
</CFQUERY>
<!--- #get_comp_info.email# --->

<style type="text/css" media="screen">
<!--
body, TD {
margin: 3;
padding: 3;
font: 12px verdana, arial, sans-serif;
}
.small {
margin: 3;
padding: 3;
font: 9px verdana, arial, sans-serif;
}
input {
margin: 3;
padding: 3;
font: 9px verdana, arial, sans-serif;
}
select, option {
margin: 3;
padding: 3;
font: 9px verdana, arial, sans-serif;
}
.header {

font: 16px verdana, arial, sans-serif;
}
-->
</style>

<cfoutput><table width="544" cellpadding="1" cellspacing="1" bgcolor="##000000">
<tr><td align="left" valign="top">
<table width="100%" cellpadding="0" cellspacing="4" bgcolor="##ffffff" border=0>
<tr>
<td align="center" valign="top"><h2>Abstracts USA, LLC</h2>
<span class="Header">Daily Pipeline report for:<br>
<strong>#get_comp_info.company#</strong></span><br><br>
<br>

According to our records, the following files are awaiting completion of TAXES:<br>
as of: #DateFormat(Now(), "m/d/yyyy")#<br>
<br>

<table width="400">
	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
<cfif read_abstractor_orders.recordcount neq 0>
<cfloop query="read_abstractor_orders">
<tr>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							T-#title_id#
						</td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>
						<td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
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
</cfloop>
</cfif>
<cfif read_abstractor_prop_orders.recordcount neq 0>
<cfloop query="read_abstractor_prop_orders">
<tr>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							P-#prop_id#
						</td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>
						<td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
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
</cfloop>
</cfif>
</table>


</td></tr>
	<TR>
		<TD>
			<span style="font-size:12px; font-family:Arial, Helvetica, sans-serif"><br>
<br>
Please email Shelly Brown at vendormgr@abstractsusa.com with information on the following:<br>
1. Expected delivery date/time<br>
2. Questions on details or order placed<br><br>

Note: PLEASE BE SURE TO READ SPECIAL INSTRUCTIONS ON ORDERS PLACED TO ENSURE PROPER PRODUCT DELIVERY
<br>
<br>
</span></TD>
	</TR>
<tr>
<td align="center" valign="top"><IMG SRC="https://#cgi.server_name#/auto_emails/images/footer_blank.jpg" width="542" height="16"><br>
<br>
</td>
</tr>
</TABLE>
</TD>
	</TR>
</TABLE></cfoutput>

<br>
<br>
<br>
</cfif>

<cfelse>

<!--- show abstractor pipeline --->
<CFQUERY datasource="#request.dsn#" NAME="get_all">
SELECT *
FROM vendor_daily_report
WHERE (abstractor_id = '#read_abstractor.abstractor_id#')
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_abstractor_orders">
SELECT *
FROM abstractors a, doc_abstract_Title b, Title t
WHERE (a.abstractor_id = '#read_abstractor.abstractor_id#')
and (a.abstractor_id = b.abstractor_id)
AND (b.abstractor_doc_upload is NULL)
and t.title_id = b.title_id
<cfif get_all.title neq ''>
and t.title_id IN (#get_all.title#))
<cfelse>
and t.title_id IN (0000000))
</cfif>
order by b.title_id
	</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_abstractor_prop_orders">
SELECT *
FROM abstractors a, doc_abstract_Prop b, Property t
WHERE (a.abstractor_id = '#read_abstractor.abstractor_id#')
and (a.abstractor_id = b.abstractor_id)
AND (b.abstractor_doc_upload is NULL)
and t.prop_id = b.prop_id
<cfif get_all.prop neq ''>
and t.prop_id IN (#get_all.prop#))
<cfelse>
and t.prop_id IN (0000000))
</cfif>
order by b.prop_id
	</CFQUERY>

<cfif read_abstractor_orders.recordcount neq 0 or read_abstractor_prop_orders.recordcount neq 0>

<CFQUERY datasource="#request.dsn#" NAME="get_comp_info">
Select email, company from Abstractors where abstractor_id = #read_abstractor.abstractor_id#
</CFQUERY>
<!--- #get_comp_info.email# --->

<style type="text/css" media="screen">
<!--
body, TD {
margin: 3;
padding: 3;
font: 12px verdana, arial, sans-serif;
}
.small {
margin: 3;
padding: 3;
font: 9px verdana, arial, sans-serif;
}
input {
margin: 3;
padding: 3;
font: 9px verdana, arial, sans-serif;
}
select, option {
margin: 3;
padding: 3;
font: 9px verdana, arial, sans-serif;
}
.header {

font: 16px verdana, arial, sans-serif;
}
-->
</style>

<cfoutput><table width="544" cellpadding="1" cellspacing="1" bgcolor="##000000">
<tr><td align="left" valign="top">
<table width="100%" cellpadding="0" cellspacing="4" bgcolor="##ffffff" border=0>
<tr>
<td align="center" valign="top"><h2>Abstracts USA, LLC</h2>
<span class="Header">Daily Pipeline report for:<br>
<strong>#get_comp_info.company#</strong></span><br><br>
<br>

According to our records, the following files are awaiting completion of TAXES:<br>
as of: #DateFormat(Now(), "m/d/yyyy")#<br>
<br>

<table width="400">
	<CFSET a_bgcolor = "d3d3d3">
	<CFSET a_color_trigger = "1">
<cfif read_abstractor_orders.recordcount neq 0>
<cfloop query="read_abstractor_orders">
<tr>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							T-#title_id#
						</td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>
						<td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
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
</cfloop>
</cfif>
<cfif read_abstractor_prop_orders.recordcount neq 0>
<cfloop query="read_abstractor_prop_orders">
<tr>
						<td bgcolor=#a_bgcolor# width=50 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#DateFormat(check_date, "mm/dd/yyyy")#
						</td>
						<td bgcolor=#a_bgcolor# width=70 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							P-#prop_id#
						</td>
						<td bgcolor=#a_bgcolor# width=110 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#BFirstName1# #BLastName1#
						</td>
						<td bgcolor=#a_bgcolor# width=20 align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							#pstate#
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
</cfloop>
</cfif>
</table>


</td></tr>
	<TR>
		<TD>
			<span style="font-size:12px; font-family:Arial, Helvetica, sans-serif"><br>
<br>
Please email Shelly Brown at vendormgr@abstractsusa.com with information on the following:<br>
1. Expected delivery date/time<br>
2. Questions on details or order placed<br><br>

Note: PLEASE BE SURE TO READ SPECIAL INSTRUCTIONS ON ORDERS PLACED TO ENSURE PROPER PRODUCT DELIVERY
<br>
<br>
</span></TD>
	</TR>
<tr>
<td align="center" valign="top"><IMG SRC="https://#cgi.server_name#/auto_emails/images/footer_blank.jpg" width="542" height="16"><br>
<br>
</td>
</tr>
</TABLE>
</TD>
	</TR>
</TABLE></cfoutput>

<br>
<br>
<br>
</cfif>
</cfif>
<!--- end pipeline email --->



<cfelseif #a_trigger# EQ "2">
			<td width=780 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Closer Order Search</B></CENTER>
			</TD>
		</TR>

<CFFORM METHOD=POST ACTION="./vendor_view_orders.cfm?user=#user#&pass=#pass#&a_trigger=2">
<INPUT type="hidden" name="uid" value="URL.uid"><input type="hidden" name="user" value="#user#">
<input type="hidden" name="pass" value="#user#">
	<INPUT type="hidden" name="al" value="URL.al"><tr>
			<td width=780 align=center valign=top bgcolor=d3d3d3>
				<table width=600 cellpadding=1 cellspacing=1 border=0>

							<tr>


					<td bgcolor=d3d3d3 width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Title ID
						</td>

						<td bgcolor=d3d3d3 width=300 align=left valign=top>
							<SELECT NAME="Title_id"
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
								<CFOUTPUT QUERY="read_closer_order"><OPTION VALUE="#Title_ID#">#Title_ID#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr>

				<tr>
						<td bgcolor=d3d3d3 width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Month
						</td>

						<td bgcolor=d3d3d3 width=300 align=left valign=top>
							<SELECT NAME="oda_month"
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

	   	<option value="1">January</option>
		<option value="2">February</option>
		<option value="3">March</option>
		<option value="4">April</option>
		<option value="5">May</option>
		<option value="6">June</option>
		<option value="7">July</option>
		<option value="8">August</option>
		<option value="9">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>
							</SELECT>
						</td>
					</tr>

				<tr>
						<td bgcolor=d3d3d3 width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's First Name -
						</td>

						<td bgcolor=d3d3d3 width=300 align=left valign=top>
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
								clear: none;"
								>
						</td>
					</tr>
		<!--- ================================================== --->
					<tr>
						<td bgcolor=d3d3d3 width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Borrower's Last Name -
						</td>

						<td bgcolor=d3d3d3 width=300 align=left valign=top>
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
								clear: none;"
								>
						</td>
					</tr>
					<!--- <tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer First Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
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

					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer Last Name -
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
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


					</tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Order By
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
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
<OPTION VALUE="oda_month">Month</OPTION>
<OPTION VALUE="Title_id">Order Number</OPTION>
</SELECT>
						</td>
					</tr>	 --->


					<tr>
						<td bgcolor=d3d3d3 colspan=3 width=600 align=center valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>

					</tr>
</CFFORM>


<cfelse>











<cfif url.message eq 'success'>
<td><font face="Arial, Helvetica, sans-serif" color="FF0000">The Payoff was successfully uploaded.</font><br>
<br></td></tr>
<tr>
</cfif>



<td width=780 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Payoff Request Order Search</B></CENTER>
			</TD>
		</TR>

<CFFORM METHOD=POST ACTION="./vendor_view_orders.cfm?username=#username#&password=#password#&a_trigger=3">
<!--- <INPUT type="hidden" name="uid" value="URL.uid"><input type="hidden" name="user" value="#user#">
<input type="hidden" name="pass" value="#user#">
	<INPUT type="hidden" name="al" value="URL.al"> ---><tr>
			<td width=780 align=center valign=top bgcolor=d3d3d3>
				<table width=600 cellpadding=1 cellspacing=1 border=0>



					<tr>
					<td bgcolor=d3d3d3 width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Title ID
						</td>

						<td bgcolor=d3d3d3 width=300 align=left valign=top>
							<SELECT NAME="this_title_order"
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
								<CFOUTPUT QUERY="title_orders"><OPTION VALUE="#Payoff_ID#, #payoff_num#">Order No. #Title_ID# - Acct No. #account_num#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr>


				<tr>
					<td bgcolor=d3d3d3 width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Property ID
						</td>

						<td bgcolor=d3d3d3 width=300 align=left valign=top>
							<SELECT NAME="this_property_order"
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
								<CFOUTPUT QUERY="property_orders"><OPTION VALUE="#Prop_ID#, #payoff_num#">Order No. #Prop_ID# - Acct No. #account_num#</OPTION></CFOUTPUT>
							</SELECT>
						</td>
					</tr>




					<tr>
						<td bgcolor=d3d3d3 colspan=3 width=600 align=center valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>

					</tr>
</CFFORM>










</cfif>
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


			</TD>
		</TR>

	</table>


			</TD>
		</TR>

	</table>

<script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body>
</HTML>


