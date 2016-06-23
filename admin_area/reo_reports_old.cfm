<!--- <cfoutput>
#DateDiff("d", "11/22/2008", Now())#<br>
</cfoutput>
<cfabort>
 --->

<CFPARAM NAME="a_fname" DEFAULT="">
<CFPARAM NAME="a_lname" DEFAULT="">
<CFPARAM NAME="a_user" DEFAULT="">
<CFPARAM NAME="a_date" DEFAULT="">
<CFPARAM NAME="a_time" DEFAULT="">
<CFPARAM NAME="a_ip" DEFAULT="">
<CFPARAM NAME="vendor" DEFAULT="">
<CFPARAM NAME="calendar" DEFAULT="">
<CFPARAM NAME="order" DEFAULT="">
<!---d3d3d3--->
<CFSET a_bgcolor = "d3d3d3">
<CFSET a_color_trigger = "1">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>REO Report</title>
</head>

<body>

<!--- let's create the query we're going to dump all of our info to, which will be used for soprting, etc. --->

<cfset the_big_query = QueryNew("order_num, reo_num, prop_addr, closing_date, busted_date, company_name, report_num, flag1, flag2, datediff, datediff2, flag3, proc")>
<!--- ok, first we're gonna get all the files with a Sales Contract uploaded, because that makes it an REO file --->
<CFQUERY datasource="#request.dsn#" NAME="all_reos">
SELECT     t.cancelled, t.comp_id, t.paddress, t.pcity, t.pcounty, t.pstate,
t.pzip, t.reo_draft_deed, t.reo_draft_deed_date, t.reo_final_hud, t.reo_final_hud_date, t.reo_hud_for_approval, t.reo_hud_for_approval_date, t.reo_package, t.reo_package_date, t.reo_processor, t.reo_sales_contract,
t.reo_sales_contract_date, t.reo_signed_deed, t.reo_signed_deed_date, t.reo_signed_hud, t.reo_signed_hud_date, t.Title_ID, t.loan_number,
c.company AS Expr1
FROM         Title t INNER JOIN
Companies c ON t.comp_id = c.ID
WHERE     (t.reo_sales_contract <> '') AND (t.reo_sales_contract IS NOT NULL) AND (t.appraisal_status <> 'Loan Closed') AND (t.cancelled IS NULL)
</CFQUERY>
<!--- <CFQUERY datasource="#request.dsn#" NAME="all_reos">
			SELECT     t.*, c.company AS Expr1
FROM         Title t INNER JOIN
                      Companies c ON t.comp_id = c.ID
WHERE     (t.reo_sales_contract <> '') AND (t.reo_sales_contract IS NOT NULL) AND (t.appraisal_status <> 'Loan Closed') AND (t.Title_ID <> 45163) AND (t.Title_ID <> 46968) AND (t.Title_ID <> 46064)
</CFQUERY>
 ---><!--- <cfdump var="#all_reos#">
<cfabort>
 --->
<!--- now we're going to loop through them and figure out which of reports each one belongs to  --->

<!--- <cfdump var="#all_reos#">
<cfabort>
 ---><cfoutput query="all_reos">

<!--- hud fOR aPPROVAL nOT uPLOADED --->
<cfif reo_hud_for_approval EQ '' or reo_hud_for_approval eq 'NULL' or reo_hud_for_approval_date EQ '' or reo_hud_for_approval_date eq 'NULL'>

<!--- repeatable chunk of code --->
<cfset temp = QueryAddRow(the_big_query)>
<cfif reo_processor neq 'NULL'>
<CFQUERY datasource="#request.dsn#" NAME="get_proc">
SELECT  * from first_admin where ID = '#reo_processor#'
</CFQUERY>
<cfset temp = QuerySetCell(the_big_query, "proc", '#get_proc.fname# #get_proc.lname#')>
<cfelse>
<cfset temp = QuerySetCell(the_big_query, "proc", '')>
</cfif>
<cfset temp = QuerySetCell(the_big_query, "datediff", '0')>
<cfset temp = QuerySetCell(the_big_query, "datediff2", '0')>
<cfset temp = QuerySetCell(the_big_query, "closing_date", '')><cfset temp = QuerySetCell(the_big_query, "busted_date", '')>
<cfset temp = QuerySetCell(the_big_query, "flag1", '0')>
<cfset temp = QuerySetCell(the_big_query, "flag2", '0')>
<cfset temp = QuerySetCell(the_big_query, "flag3", '0')>
<cfset temp = QuerySetCell(the_big_query, "order_num", '#all_reos.title_id#')>
		<cfif all_reos.loan_number neq '' and all_reos.loan_number neq 'NULL'>
		<cfset temp = QuerySetCell(the_big_query, "reo_num", '#all_reos.loan_number#')>
		</cfif>
		<cfset propaddr = all_reos.paddress & ", " & all_reos.pcity & ", " & all_reos.pstate>
		<cfset temp = QuerySetCell(the_big_query, "prop_addr", '#propaddr#')>

	<!--- let's see if this file has a closing date set yet --->
	<CFQUERY datasource="#request.dsn#" NAME="get_closing_date">
				Select *
				from eventlist
				where title_id = #all_reos.title_id#
				and closing_date <> '' and closing_date is not NULL
	</CFQUERY>
	<cfif get_closing_date.recordcount and IsDate(get_closing_date.closing_date)>
	<cfset temp = QuerySetCell(the_big_query, "closing_date", CreateODBCDate(DateFormat(get_closing_date.closing_date, 'm/d/yyyy')))>
	</cfif>
	<!--- let's see if this file has a contract busted date set yet, which it really should
	because you can't upload anything until there is a busted date --->
	<CFQUERY datasource="#request.dsn#" NAME="get_busted_date">
				Select *
				from title_closing_order_request
				where title_id = #all_reos.title_id#
				and contract_busted_date <> '' and contract_busted_date is not NULL
	</CFQUERY>
	<cfif get_busted_date.recordcount and IsDate(get_busted_date.contract_busted_date)>
	<cfset temp = QuerySetCell(the_big_query, "busted_date", CreateODBCDate(DateFormat(get_busted_date.contract_busted_date, 'm/d/yyyy')))>
	</cfif>
		<cfset temp = QuerySetCell(the_big_query, "company_name", '#all_reos.Expr1#')>
		<cfset temp = QuerySetCell(the_big_query, "report_num", '3')>
		    <cfset date_to_use = "">
			<cfif get_closing_date.recordcount and IsDate(get_closing_date.closing_date) and IsDate(get_busted_date.contract_busted_date)>
			<cfif get_closing_date.closing_date LT get_busted_date.contract_busted_date>
			<cfset date_to_use = get_closing_date.closing_date>
			<cfelse>
			<cfset date_to_use = get_busted_date.contract_busted_date>
			</cfif>
			<cfelse>
			<cfset date_to_use = get_busted_date.contract_busted_date>
			</cfif>

		<cfif IsDate(date_to_use)>
		<cfif dateDiff("d", Now(), date_to_use) lte 1>
		<cfset temp = QuerySetCell(the_big_query, "flag1", '1')>
		<cfset temp = QuerySetCell(the_big_query, "datediff", (dateDiff("d", Now(), date_to_use)+1))>
		</cfif>
		<cfif dateDiff("d", Now(), date_to_use) lt 0>
		<cfset temp = QuerySetCell(the_big_query, "flag1", '0')>
		<cfset temp = QuerySetCell(the_big_query, "flag3", '1')>
		<cfset temp = QuerySetCell(the_big_query, "datediff2", dateDiff("d", Now(), date_to_use))>
		</cfif>
		</cfif>
		<cfset temp = QuerySetCell(the_big_query, "flag2", '0')>
<!--- end repeatable chunk of code --->

</cfif>




<!--- Final report, if the signed hud is uploaded --->
<cfif reo_signed_hud NEQ '' and reo_signed_hud neq 'NULL' and reo_signed_hud_date NEQ '' and reo_signed_hud_date neq 'NULL'>





<!--- repeatable chun k of code --->
		<cfset temp = QueryAddRow(the_big_query)>
<cfif reo_processor neq 'NULL'>
<CFQUERY datasource="#request.dsn#" NAME="get_proc">
SELECT  * from first_admin where ID = '#reo_processor#'
</CFQUERY>
<cfset temp = QuerySetCell(the_big_query, "proc", '#get_proc.fname# #get_proc.lname#')>
<cfelse>
<cfset temp = QuerySetCell(the_big_query, "proc", '')>
</cfif>
		<cfset temp = QuerySetCell(the_big_query, "datediff", '0')>
		<cfset temp = QuerySetCell(the_big_query, "datediff2", '0')>
<cfset temp = QuerySetCell(the_big_query, "closing_date", '')><cfset temp = QuerySetCell(the_big_query, "busted_date", '')>
<cfset temp = QuerySetCell(the_big_query, "flag1", '0')>
<cfset temp = QuerySetCell(the_big_query, "flag2", '0')>
<cfset temp = QuerySetCell(the_big_query, "flag3", '0')>
<cfset temp = QuerySetCell(the_big_query, "order_num", '#all_reos.title_id#')>
		<cfif all_reos.loan_number neq '' and all_reos.loan_number neq 'NULL'>
		<cfset temp = QuerySetCell(the_big_query, "reo_num", '#all_reos.loan_number#')>
		</cfif>
		<cfset propaddr = all_reos.paddress & ", " & all_reos.pcity & ", " & all_reos.pstate>
		<cfset temp = QuerySetCell(the_big_query, "prop_addr", '#propaddr#')>

	<!--- let's see if this file has a closing date set yet --->
	<CFQUERY datasource="#request.dsn#" NAME="get_closing_date">
				Select *
				from eventlist
				where title_id = #all_reos.title_id#
				and closing_date <> '' and closing_date is not NULL
	</CFQUERY>
	<cfif get_closing_date.recordcount and IsDate(get_closing_date.closing_date)>
	<cfset temp = QuerySetCell(the_big_query, "closing_date", CreateODBCDate(DateFormat(get_closing_date.closing_date, 'm/d/yyyy')))>
	</cfif>
	<!--- let's see if this file has a contract busted date set yet, which it really should
	because you can't upload anything until there is a busted date --->
	<CFQUERY datasource="#request.dsn#" NAME="get_busted_date">
				Select *
				from title_closing_order_request
				where title_id = #all_reos.title_id#
				and contract_busted_date <> '' and contract_busted_date is not NULL
	</CFQUERY>
	<cfif get_busted_date.recordcount and IsDate(get_busted_date.contract_busted_date)>
	<cfset temp = QuerySetCell(the_big_query, "busted_date", CreateODBCDate(DateFormat(get_busted_date.contract_busted_date, 'm/d/yyyy')))>
	</cfif>
		<cfset temp = QuerySetCell(the_big_query, "company_name", '#all_reos.Expr1#')>
		<cfset temp = QuerySetCell(the_big_query, "report_num", '6')>
		<cfset temp = QuerySetCell(the_big_query, "flag1", '0')>
<cfset temp = QuerySetCell(the_big_query, "flag2", '0')>
<cfset temp = QuerySetCell(the_big_query, "flag3", '0')>
<!--- end repeatable chunk of code --->
</cfif>





<!--- Final HUD Uploaded , flag1 if signed HUD w/Wire Info not uploaded 1 day after scheduled closing --->
<cfif reo_final_hud NEQ '' and reo_final_hud neq 'NULL' and reo_final_hud_date NEQ '' and reo_final_hud_date neq 'NULL'>


<!--- repeatable chun k of code --->
<cfset temp = QueryAddRow(the_big_query)>
<cfif reo_processor neq 'NULL'>
<CFQUERY datasource="#request.dsn#" NAME="get_proc">
SELECT  * from first_admin where ID = '#reo_processor#'
</CFQUERY>
<cfset temp = QuerySetCell(the_big_query, "proc", '#get_proc.fname# #get_proc.lname#')>
<cfelse>
<cfset temp = QuerySetCell(the_big_query, "proc", '')>
</cfif>
<cfset temp = QuerySetCell(the_big_query, "datediff", '0')>
<cfset temp = QuerySetCell(the_big_query, "datediff2", '0')>
<cfset temp = QuerySetCell(the_big_query, "closing_date", '')><cfset temp = QuerySetCell(the_big_query, "busted_date", '')>
<cfset temp = QuerySetCell(the_big_query, "flag1", '0')>
<cfset temp = QuerySetCell(the_big_query, "flag2", '0')>
<cfset temp = QuerySetCell(the_big_query, "flag3", '0')>
<cfset temp = QuerySetCell(the_big_query, "order_num", '#all_reos.title_id#')>
		<cfif all_reos.loan_number neq '' and all_reos.loan_number neq 'NULL'>
		<cfset temp = QuerySetCell(the_big_query, "reo_num", '#all_reos.loan_number#')>
		</cfif>
		<cfset propaddr = all_reos.paddress & ", " & all_reos.pcity & ", " & all_reos.pstate>
		<cfset temp = QuerySetCell(the_big_query, "prop_addr", '#propaddr#')>

	<!--- let's see if this file has a closing date set yet --->
	<CFQUERY datasource="#request.dsn#" NAME="get_closing_date">
				Select *
				from eventlist
				where title_id = #all_reos.title_id#
				and closing_date <> '' and closing_date is not NULL
	</CFQUERY>
	<cfif get_closing_date.recordcount and IsDate(get_closing_date.closing_date)>
	<cfset temp = QuerySetCell(the_big_query, "closing_date", CreateODBCDate(DateFormat(get_closing_date.closing_date, 'm/d/yyyy')))>
	</cfif>
	<!--- let's see if this file has a contract busted date set yet, which it really should
	because you can't upload anything until there is a busted date --->
	<CFQUERY datasource="#request.dsn#" NAME="get_busted_date">
				Select *
				from title_closing_order_request
				where title_id = #all_reos.title_id#
				and contract_busted_date <> '' and contract_busted_date is not NULL
	</CFQUERY>
	<cfif get_busted_date.recordcount and isDate(get_busted_date.contract_busted_date)>
	<cfset temp = QuerySetCell(the_big_query, "busted_date", CreateODBCDate(DateFormat(get_busted_date.contract_busted_date, 'm/d/yyyy')))>
	</cfif>
		<cfset temp = QuerySetCell(the_big_query, "company_name", '#all_reos.Expr1#')>
		<cfset temp = QuerySetCell(the_big_query, "report_num", 5)>
		<cfif get_closing_date.recordcount and DateDiff("d", get_closing_date.closing_date, Now()) gte 1 and (reo_signed_hud EQ '' or reo_signed_hud eq 'NULL' or reo_signed_hud_date EQ '' or reo_signed_hud_date eq 'NULL')>
		<cfset temp = QuerySetCell(the_big_query, "datediff", DateDiff("d", get_closing_date.closing_date, Now()))>
		<cfset temp = QuerySetCell(the_big_query, "flag1", '1')>
		<cfelse>
		<cfset temp = QuerySetCell(the_big_query, "flag1", '0')>
		</cfif>

		<cfset temp = QuerySetCell(the_big_query, "flag2", '0')>
<!--- end repeatable chunk of code --->
</cfif>



<!--- Report 4 - Hud for Approval Uploaded
flag if Final HUD not uploaded within 24 hours of Scheduled Closing --->
<cfif reo_hud_for_approval NEQ '' and reo_hud_for_approval neq 'NULL' and reo_hud_for_approval_date NEQ '' and reo_hud_for_approval_date neq 'NULL'>





<!--- repeatable chunk of code --->
<cfset temp = QueryAddRow(the_big_query)>
<cfif reo_processor neq 'NULL'>
<CFQUERY datasource="#request.dsn#" NAME="get_proc">
SELECT  * from first_admin where ID = '#reo_processor#'
</CFQUERY>
<cfset temp = QuerySetCell(the_big_query, "proc", '#get_proc.fname# #get_proc.lname#')>
<cfelse>
<cfset temp = QuerySetCell(the_big_query, "proc", '')>
</cfif>
<cfset temp = QuerySetCell(the_big_query, "datediff", '0')>
		<cfset temp = QuerySetCell(the_big_query, "datediff2", '0')>
<cfset temp = QuerySetCell(the_big_query, "closing_date", '')><cfset temp = QuerySetCell(the_big_query, "busted_date", '')>
<cfset temp = QuerySetCell(the_big_query, "flag1", '0')>
<cfset temp = QuerySetCell(the_big_query, "flag2", '0')>
<cfset temp = QuerySetCell(the_big_query, "flag3", '0')>
<cfset temp = QuerySetCell(the_big_query, "order_num", '#all_reos.title_id#')>
		<cfif all_reos.loan_number neq '' and all_reos.loan_number neq 'NULL'>
		<cfset temp = QuerySetCell(the_big_query, "reo_num", '#all_reos.loan_number#')>
		</cfif>
		<cfset propaddr = all_reos.paddress & ", " & all_reos.pcity & ", " & all_reos.pstate>
		<cfset temp = QuerySetCell(the_big_query, "prop_addr", '#propaddr#')>

	<!--- let's see if this file has a closing date set yet --->
	<CFQUERY datasource="#request.dsn#" NAME="get_closing_date">
				Select *
				from eventlist
				where title_id = #all_reos.title_id#
				and closing_date <> '' and closing_date is not NULL
	</CFQUERY>
	<cfif get_closing_date.recordcount and IsDate(get_closing_date.closing_date)>
	<cfset temp = QuerySetCell(the_big_query, "closing_date", CreateODBCDate(DateFormat(get_closing_date.closing_date, 'm/d/yyyy')))>
	</cfif>
	<!--- let's see if this file has a contract busted date set yet, which it really should
	because you can't upload anything until there is a busted date --->
	<CFQUERY datasource="#request.dsn#" NAME="get_busted_date">
				Select *
				from title_closing_order_request
				where title_id = #all_reos.title_id#
				and contract_busted_date <> '' and contract_busted_date is not NULL
	</CFQUERY>
	<cfif get_busted_date.recordcount and IsDate(get_busted_date.contract_busted_date)>
	<cfset temp = QuerySetCell(the_big_query, "busted_date", CreateODBCDate(DateFormat(get_busted_date.contract_busted_date, 'm/d/yyyy')))>
	</cfif>
		<cfset temp = QuerySetCell(the_big_query, "company_name", '#all_reos.Expr1#')>
		<cfset temp = QuerySetCell(the_big_query, "report_num", '4')>
		<cfif get_closing_date.recordcount and (reo_final_hud eq '' or reo_final_hud eq 'NULL' or reo_final_hud_date eq '' or reo_final_hud_date eq 'NULL') and DateDiff("d", Now(), get_closing_date.closing_date) lte 1>

		<cfset temp = QuerySetCell(the_big_query, "datefiff", '#DateDiff("d", Now(), get_closing_date.closing_date)#')>
		<cfset temp = QuerySetCell(the_big_query, "flag1", '1')>
		</cfif>
		<cfif get_closing_date.recordcount and DateDiff("d", Now(), get_closing_date.closing_date) lt 0>
		<cfset temp = QuerySetCell(the_big_query, "datediff2", '#DateDiff("d", Now(), get_closing_date.closing_date)#')>
		<cfset temp = QuerySetCell(the_big_query, "flag1", '0')>
		<cfset temp = QuerySetCell(the_big_query, "flag3", '1')>
		</cfif>
		<cfset temp = QuerySetCell(the_big_query, "flag2", '0')>
<!--- end repeatable chunk of code --->
</cfif>





<!--- Report 2 - Draft Deed Uploaded
flag1 if no Signed Deed in 3 days
flag2 if Signed Deed NOT uploaded w/in 2 days of Contract Busted Date, or Scheduled Closing, whichever is earlier. --->

<cfif reo_draft_deed NEQ '' and reo_draft_deed neq 'NULL' and reo_draft_deed_date NEQ '' and reo_draft_deed_date neq 'NULL' and (reo_signed_deed eq 'NULL' or reo_signed_deed eq '')>





<!--- repeatable chun k of code --->
<cfset temp = QueryAddRow(the_big_query)>
<cfif reo_processor neq 'NULL'>
<CFQUERY datasource="#request.dsn#" NAME="get_proc">
SELECT  * from first_admin where ID = '#reo_processor#'
</CFQUERY>
<cfset temp = QuerySetCell(the_big_query, "proc", '#get_proc.fname# #get_proc.lname#')>
<cfelse>
<cfset temp = QuerySetCell(the_big_query, "proc", '')>
</cfif>
<cfset temp = QuerySetCell(the_big_query, "datediff", '0')>
		<cfset temp = QuerySetCell(the_big_query, "datediff2", '0')>
<cfset temp = QuerySetCell(the_big_query, "closing_date", '')><cfset temp = QuerySetCell(the_big_query, "busted_date", '')>
<cfset temp = QuerySetCell(the_big_query, "flag1", '0')>
<cfset temp = QuerySetCell(the_big_query, "flag2", '0')>
<cfset temp = QuerySetCell(the_big_query, "flag3", '0')>
<cfset temp = QuerySetCell(the_big_query, "order_num", '#all_reos.title_id#')>
		<cfif all_reos.loan_number neq '' and all_reos.loan_number neq 'NULL'>
		<cfset temp = QuerySetCell(the_big_query, "reo_num", '#all_reos.loan_number#')>
		</cfif>
		<cfset propaddr = all_reos.paddress & ", " & all_reos.pcity & ", " & all_reos.pstate>
		<cfset temp = QuerySetCell(the_big_query, "prop_addr", '#propaddr#')>

	<!--- let's see if this file has a closing date set yet --->
	<CFQUERY datasource="#request.dsn#" NAME="get_closing_date">
				Select *
				from eventlist
				where title_id = #all_reos.title_id#
				and closing_date <> '' and closing_date is not NULL
	</CFQUERY>
	<cfif get_closing_date.recordcount and IsDate(get_closing_date.closing_date)>
	<cfset temp = QuerySetCell(the_big_query, "closing_date", CreateODBCDate(DateFormat(get_closing_date.closing_date, 'm/d/yyyy')))>
	</cfif>
	<!--- let's see if this file has a contract busted date set yet, which it really should
	because you can't upload anything until there is a busted date --->
	<CFQUERY datasource="#request.dsn#" NAME="get_busted_date">
				Select *
				from title_closing_order_request
				where title_id = #all_reos.title_id#
				and contract_busted_date <> '' and contract_busted_date is not NULL
	</CFQUERY>
	<cfif get_busted_date.recordcount and IsDate(get_busted_date.contract_busted_date)>
	<cfset temp = QuerySetCell(the_big_query, "busted_date", CreateODBCDate(DateFormat(get_busted_date.contract_busted_date, 'm/d/yyyy')))>
	</cfif>
		<cfset temp = QuerySetCell(the_big_query, "company_name", '#all_reos.Expr1#')>
		<cfset temp = QuerySetCell(the_big_query, "report_num", '2')>

			<cfset date_to_use = "">
			<cfif get_closing_date.recordcount and IsDate(get_closing_date.closing_date) and IsDate(get_busted_date.contract_busted_date)>
			<cfif get_closing_date.closing_date LT get_busted_date.contract_busted_date>
			<cfset date_to_use = get_closing_date.closing_date>
			<cfelse>
			<cfset date_to_use = get_busted_date.contract_busted_date>
			</cfif>
			<cfelse>
			<cfset date_to_use = get_busted_date.contract_busted_date>
			</cfif>


<!--- flag1 if no Signed Deed in 3 days --->
<cfset temp = QuerySetCell(the_big_query, "datediff", (DateDiff("d", reo_draft_deed_date, Now())-3))>
<cfif (reo_signed_deed eq '' or reo_signed_deed eq 'NULL' or reo_signed_deed_date eq '' or reo_signed_deed_date eq 'NULL') and DateDiff("d", reo_draft_deed_date, Now()) gte 3>
		<cfset temp = QuerySetCell(the_big_query, "flag1", '1')>
		<cfelse>
		<cfset temp = QuerySetCell(the_big_query, "flag1", '0')>
		</cfif>

<!--- flag2 if Signed Deed NOT uploaded w/in 2 days of Contract Busted Date, or Scheduled Closing, whichever is earlier --->
<cfif IsDate(date_to_use)>

<cfif (reo_signed_deed eq '' or reo_signed_deed eq 'NULL' or reo_signed_deed_date eq '' or reo_signed_deed_date eq 'NULL') and DateDiff("d", Now(), DateFormat(date_to_use, "m/d/yyyy")) lte 2>
<cfif DateDiff("d", Now(), DateFormat(date_to_use, "m/d/yyyy")) gte 0>
<cfset temp = QuerySetCell(the_big_query, "datediff2", (DateDiff("d", Now(), DateFormat(date_to_use, "m/d/yyyy"))+1))>
</cfif>
<cfif DateDiff("d", Now(), DateFormat(date_to_use, "m/d/yyyy")) lt 0>
<cfset temp = QuerySetCell(the_big_query, "flag3", '1')>
<cfset temp = QuerySetCell(the_big_query, "datediff2", DateDiff("d", Now(), DateFormat(date_to_use, "m/d/yyyy")))>
</cfif>

		<cfset temp = QuerySetCell(the_big_query, "flag2", '1')>
		<cfset temp = QuerySetCell(the_big_query, "flag1", '0')>
		<cfelse>
		<cfset temp = QuerySetCell(the_big_query, "flag2", '0')>
		</cfif>
</cfif>
<!--- end repeatable chunk of code --->
</cfif>












<cfif (reo_sales_contract neq '' and reo_sales_contract neq 'NULL' and reo_sales_contract_date neq '' and reo_sales_contract_date neq 'NULL')    and reo_package eq '' or reo_package eq 'NULL' or reo_package_date eq '' or reo_package_date eq 'NULL'   or reo_draft_deed eq '' or reo_draft_deed eq 'NULL' or reo_draft_deed_date eq '' or reo_draft_deed_date eq 'NULL'> <!--- if it doesn't fit in the other reports, it's gotta be put in this one --->

<!--- 1.  Sales Contract Uploaded
flag if no REO Package within 3/days
flag if no Draft Deed within 5/days --->




<!--- repeatable chun k of code --->
<cfset temp = QueryAddRow(the_big_query)>
<cfif reo_processor neq 'NULL'>
<CFQUERY datasource="#request.dsn#" NAME="get_proc">
SELECT  * from first_admin where ID = '#reo_processor#'
</CFQUERY>
<cfset temp = QuerySetCell(the_big_query, "proc", '#get_proc.fname# #get_proc.lname#')>
<cfelse>
<cfset temp = QuerySetCell(the_big_query, "proc", '')>
</cfif>
<cfset temp = QuerySetCell(the_big_query, "datediff", '0')>
		<cfset temp = QuerySetCell(the_big_query, "datediff2", '0')>
<cfset temp = QuerySetCell(the_big_query, "closing_date", '')><cfset temp = QuerySetCell(the_big_query, "busted_date", '')>
<cfset temp = QuerySetCell(the_big_query, "flag1", '0')>
<cfset temp = QuerySetCell(the_big_query, "flag2", '0')>
<cfset temp = QuerySetCell(the_big_query, "flag3", '0')>
<cfset temp = QuerySetCell(the_big_query, "order_num", '#all_reos.title_id#')>
		<cfif all_reos.loan_number neq '' and all_reos.loan_number neq 'NULL'>
		<cfset temp = QuerySetCell(the_big_query, "reo_num", '#all_reos.loan_number#')>
		</cfif>
		<cfset propaddr = all_reos.paddress & ", " & all_reos.pcity & ", " & all_reos.pstate>
		<cfset temp = QuerySetCell(the_big_query, "prop_addr", '#propaddr#')>

	<!--- let's see if this file has a closing date set yet --->
	<CFQUERY datasource="#request.dsn#" NAME="get_closing_date">
				Select *
				from eventlist
				where title_id = #all_reos.title_id#
				and closing_date <> '' and closing_date is not NULL
	</CFQUERY>
	<cfif get_closing_date.recordcount and IsDate(get_closing_date.closing_date)>
	<cfset temp = QuerySetCell(the_big_query, "closing_date", CreateODBCDate(DateFormat(get_closing_date.closing_date, 'm/d/yyyy')))>
	</cfif>
	<!--- let's see if this file has a contract busted date set yet, which it really should
	because you can't upload anything until there is a busted date --->
	<CFQUERY datasource="#request.dsn#" NAME="get_busted_date">
				Select *
				from title_closing_order_request
				where title_id = #all_reos.title_id#
				and contract_busted_date <> '' and contract_busted_date is not NULL
	</CFQUERY>
	<cfif get_busted_date.recordcount and IsDate(get_busted_date.contract_busted_date)>
	<cfset temp = QuerySetCell(the_big_query, "busted_date", CreateODBCDate(DateFormat(get_busted_date.contract_busted_date, 'm/d/yyyy')))>
	</cfif>
		<cfset temp = QuerySetCell(the_big_query, "company_name", '#all_reos.Expr1#')>
		<cfset temp = QuerySetCell(the_big_query, "report_num", '1')>

<!--- flag if no REO Package within 3/days --->
<cfset temp = QuerySetCell(the_big_query, "datediff", DateDiff("d", reo_sales_contract_date, Now()))><cfif (reo_package eq '' or reo_package eq 'NULL' or reo_package_date eq '' or reo_package_date eq 'NULL') and DateDiff("d", reo_sales_contract_date, Now()) gte 3>
		<cfset temp = QuerySetCell(the_big_query, "flag1", '1')>
		<cfset temp = QuerySetCell(the_big_query, "datediff", (DateDiff("d", reo_sales_contract_date, Now())-3))>
		<cfelse>
		<cfset temp = QuerySetCell(the_big_query, "flag1", '0')>
		</cfif>

<!--- flag2 if no Draft Deed within 5/days --->
<cfif (reo_draft_deed eq '' or reo_draft_deed eq 'NULL' or reo_draft_deed_date eq '' or reo_draft_deed_date eq 'NULL') and DateDiff("d", reo_sales_contract_date, Now()) gte 5>

		<cfset temp = QuerySetCell(the_big_query, "flag2", '1')>
		<cfset temp = QuerySetCell(the_big_query, "datediff2", (DateDiff("d", reo_sales_contract_date, Now())-5))>
		<cfelse>
		<cfset temp = QuerySetCell(the_big_query, "flag2", '0')>
		</cfif>
<!--- end repeatable chunk of code --->

</cfif>
</cfoutput>




<!--- whew...now let's call queries from the big query to get the individual reports --->
<!--- set all reports to sort by order number by default --->
<cfparam name="url.report_sort" default="order_num">


<!--- <cfif cgi.REMOTE_ADDR eq '98.233.53.115'>
<cfdump var="#the_big_query#">
<cfabort>
</cfif>
 --->
<cfquery dbtype="query" name="report1">
	SELECT *
	FROM the_big_query
    where report_num = 1
order by #url.report_sort#
</cfquery>



<cfquery dbtype="query" name="report2">
	SELECT *
	FROM the_big_query
    where report_num = 2
    order by #url.report_sort#
</cfquery>

<cfquery dbtype="query" name="report3">
	SELECT *
	FROM the_big_query
    where report_num = 3
    order by #url.report_sort#
</cfquery>

<cfquery dbtype="query" name="report4">
	SELECT *
	FROM the_big_query
    where report_num = 4
    order by #url.report_sort#
</cfquery>

<cfquery dbtype="query" name="report5">
	SELECT *
	FROM the_big_query
    where report_num = 5
    order by #url.report_sort#
</cfquery>

<cfquery dbtype="query" name="report6">
	SELECT *
	FROM the_big_query
    where report_num = 6
    order by #url.report_sort#
</cfquery>




<!--- now we spit out the reports --->
<!--- report1 --->
<TABLE cellSpacing=1 cellPadding=1 width="100%" align="Center" border=0>
	<tr>
		<td align="center"
              colspan = 8
            width="100%">
			<B>Sales Contract Uploaded</b><BR>
<div align="left">
<table cellpadding=2 cellspacing=0 border=0>
<tr><td><img src="images/flag_red.gif" width=12 height=12></td>
<td><font size=1 color=black face=verdana>no REO Package within 3/days - <i>number in white is number of days late</i></font></td></tr>
<tr><td><img src="images/flag_green.gif" width=12 height=12></td>
<td><font size=1 color=black face=verdana>no Draft Deed within 5/days - <i>number in white is number of days late</i></font></td></tr>
</table>
</div>

		</td>
	</tr>
<cfif report1.recordcount>
<cfoutput>
<tr>
		<td align="left"><font size=1 color=black face=verdana><b>&nbsp;</b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b>&nbsp;</b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=order_num">Order Num</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=reo_num">REO Number</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=prop_addr">Property Address</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=closing_date">Closing Date</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=busted_date">Contract Busted Date</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=company_name">Company Name</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=proc">Processor</a></b></font></td>
	</tr>
</cfoutput>
<cfoutput query="report1">
<cfset a_bgcolor = "FFFFFF">
<cfset a_bgcolor2 = "FFFFFF">
<cfif report1.flag1 eq 1>
<cfset a_bgcolor = "red">
</cfif>
<cfif report1.flag2 eq 1>
<cfset a_bgcolor2 = "green">
</cfif>
<tr>

			<tr>
 <td bgcolor="#a_bgcolor#"><font size=1 color=black face=verdana><b><cfif a_bgcolor eq 'red'><font color="white">#datediff#</font><cfelse>&nbsp;</cfif></b></font></td>
 <td bgcolor="#a_bgcolor2#"><font size=1 color=black face=verdana><b><cfif a_bgcolor2 eq 'green'><font color="white">#datediff2#</font><cfelse>&nbsp;</cfif></b></font></td>
			<td><a href="title_report_modify.cfm?&company_id=0&uid=#session.ft_user_id#&al=1&rec_id=#report1.order_num#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#report1.order_num#</font></a></td>
		<td align="left"><font size=1 color=black face=verdana>#report1.reo_num#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
			#report1.prop_addr#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
		    #DateFormat(report1.closing_date, "m/d/yyyy")#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
		    #DateFormat(report1.busted_date, "m/d/yyyy")#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
			#report1.company_name#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
			<nobr>#report1.proc#</nobr></font></td>
	</tr>
	</cfoutput>
<cfelse>
<tr><td colspan=6><font size=1>No records match this report</font></td></tr>
</cfif>
</table><br>
<br>
<br>



<cfflush>



<!--- report2 --->
<!--- Draft Deed Uploaded
flag if no Signed Deed in 3 days
flag if Signed Deed NOT uploaded w/in 2 days of Contract Busted Date, or Scheduled Closing, whichever is earlier. --->
<TABLE cellSpacing=1 cellPadding=1 width="100%" align="Center" border=0>
	<tr>
		<td align="center"
              colspan = 8
            width="100%"><B>Draft Deed Uploaded</b><BR>
<div align="left">
<table cellpadding=3 cellspacing=0 border=0>
<tr><td><img src="images/flag_red.gif" width=12 height=12></td>
<td><font size=1 color=black face=verdana>no Signed Deed in 3 days - <i>number in white is number of days late</i></font></td></tr>
<tr><td><img src="images/flag_green.gif" width=12 height=12></td>
<td><font size=1 color=black face=verdana>Signed Deed NOT uploaded w/in 2 days of Contract Busted Date, or Scheduled Closing, whichever is earlier - <i>number in white is number of days until Contract Busted Date, or Scheduled Closing, whichever is earlier</i></font></td></tr>
<tr><td><img src="images/flag_gray.gif" width=12 height=12></td>
<td><font size=1 color=black face=verdana>Currently Past Contract Busted Date, or Scheduled Closing, whichever is earlier - <i>number in white is number of days past Contract Busted Date, or Scheduled Closing, whichever is earlier</i></font></td></tr>
</table>
</div>
</td>
	</tr>
<cfif report2.recordcount>
<cfoutput>
<tr>
		<td align="left"><font size=1 color=black face=verdana><b>&nbsp;</b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b>&nbsp;</b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=order_num">Order Num</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=reo_num">REO Number</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=prop_addr">Property Address</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=closing_date">Closing Date</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=busted_date">Contract Busted Date</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=company_name">Company Name</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=proc">Processor</a></b></font></td>
	</tr>
</cfoutput>
<cfoutput query="report2">
<cfset a_bgcolor = "FFFFFF">
<cfset a_bgcolor2 = "FFFFFF">
<cfif report2.flag1 eq 1>
<cfset a_bgcolor = "red">
</cfif>
<cfif report2.flag2 eq 1>
<cfset a_bgcolor2 = "green">
</cfif>
<cfif report2.flag3 eq 1>
<cfset a_bgcolor2 = "gray">
</cfif>
<tr>

			<tr>
 <td bgcolor="#a_bgcolor#"><font size=1 color=black face=verdana><b><cfif a_bgcolor eq 'red'><font color="white">#datediff#</font><cfelse>&nbsp;</cfif></b></font></td>
 <td bgcolor="#a_bgcolor2#"><font size=1 color=black face=verdana><b><cfif a_bgcolor2 eq 'green' or a_bgcolor2 eq 'gray'><font color="white">#ReplaceNoCase(datediff2, "-", "", "ALL")#</font><cfelse>&nbsp;</cfif></b></font></td>
			<td><a href="title_report_modify.cfm?&company_id=0&uid=#session.ft_user_id#&al=1&rec_id=#report2.order_num#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#report2.order_num#</font></a></td>
		<td align="left"><font size=1 color=black face=verdana>#report2.reo_num#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
			#report2.prop_addr#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
		    #DateFormat(report2.closing_date, "m/d/yyyy")#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
		    #DateFormat(report2.busted_date, "m/d/yyyy")#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
			#report2.company_name#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
			<nobr>#report2.proc#</nobr></font></td>
	</tr>
	</cfoutput>
<cfelse>
<tr><td colspan=6><font size=1>No records match this report</font></td></tr>
</cfif>
</table><br>
<br>
<br>


<cfflush>





<!--- report3 --->
<!--- HUD For Approval Not Uploaded --->
<TABLE cellSpacing=1 cellPadding=1 width="100%" align="Center" border=0>
	<tr>
		<td align="center"
              colspan = 8
            width="100%">
			<B>HUD For Approval Not Uploaded</b><BR>
<div align="left">
<table cellpadding=2 cellspacing=0 border=0>
<tr><td><img src="images/flag_red.gif" width=12 height=12></td>
<td><font size=1 color=black face=verdana>HUD for Approval NOT uploaded w/in 1 day of Contract Busted Date or Scheduled Closing, whichever is earlier - <i>number in white is number of days until Contract Busted Date or Scheduled Closing, whichever is earlier</i></font></td></tr>
<tr><td><img src="images/flag_gray.gif" width=12 height=12></td>
<td><font size=1 color=black face=verdana>Past Contract Busted Date or Scheduled Closing, whichever is earlier - <i>number in white is number of days past Contract Busted Date or Scheduled Closing, whichever is earlier</i></font></td></tr>
</table>
</div>
		</td>
	</tr>
<cfif report3.recordcount>
<cfoutput>
<tr>
		<td align="left"><font size=1 color=black face=verdana><b>&nbsp;</b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b>&nbsp;</b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=order_num">Order Num</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=reo_num">REO Number</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=prop_addr">Property Address</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=closing_date">Closing Date</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=busted_date">Contract Busted Date</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=company_name">Company Name</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=proc">Processor</a></b></font></td>
	</tr>
</cfoutput>
<cfoutput query="report3">
<cfset a_bgcolor = "FFFFFF">
<cfset a_bgcolor2 = "FFFFFF">
<cfif report3.flag1 eq 1>
<cfset a_bgcolor = "red">
</cfif>
<cfif report3.flag2 eq 1>
<cfset a_bgcolor2 = "green">
</cfif>
<cfif report3.flag3 eq 1>
<cfset a_bgcolor2 = "gray">
</cfif>
<tr>

			<tr>
 <td bgcolor="#a_bgcolor#"><font size=1 color=black face=verdana><b><cfif a_bgcolor eq 'red'><font color="white">#datediff#</font><cfelse>&nbsp;</cfif></b></font></td>
 <td bgcolor="#a_bgcolor2#"><font size=1 color=black face=verdana><b><cfif a_bgcolor2 eq 'gray'><font color="white">#ReplaceNoCase(datediff2, "-", "", "ALL")#</font><cfelse>&nbsp;</cfif></b></font></td>
			<td><a href="title_report_modify.cfm?&company_id=0&uid=#session.ft_user_id#&al=1&rec_id=#report3.order_num#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#report3.order_num#</font></a></td>
		<td align="left"><font size=1 color=black face=verdana>#report3.reo_num#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
			#report3.prop_addr#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
		    #DateFormat(report3.closing_date, "m/d/yyyy")#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
		    #DateFormat(report3.busted_date, "m/d/yyyy")#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
			#report3.company_name#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
			<nobr>#report3.proc#</nobr></font></td>
	</tr>
	</cfoutput>
<cfelse>
<tr><td colspan=6><font size=1>No records match this report</font></td></tr>
</cfif>
</table><br>
<br>
<br>

<cfflush>

<!--- report4 --->
<!---4. Hud for Approval Uploaded
flag if Final HUD not uploaded within 24 hours of Scheduled Closing --->
<TABLE cellSpacing=1 cellPadding=1 width="100%" align="Center" border=0>
	<tr>
		<td align="center"
              colspan = 8
            width="100%">
			<B>Hud for Approval Uploaded</b><BR>
<div align="left">
<table cellpadding=2 cellspacing=0 border=0>
<tr><td><img src="images/flag_red.gif" width=12 height=12></td>
<td><font size=1 color=black face=verdana>Final HUD not uploaded within 24 hours of Scheduled Closing - <i>number in white is number of hours until Scheduled Closing</i></font></td></tr>
<tr><td><img src="images/flag_gray.gif" width=12 height=12></td>
<td><font size=1 color=black face=verdana>Past Contract Busted Date or Scheduled Closing, whichever is earlier - <i>number in white is number of days past Contract Busted Date or Scheduled Closing, whichever is earlier</i></font></td></tr>
</table>
</div>

		</td>
	</tr>
<cfif report4.recordcount>
<cfoutput>
<tr>
		<td align="left"><font size=1 color=black face=verdana><b>&nbsp;</b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b>&nbsp;</b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=order_num">Order Num</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=reo_num">REO Number</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=prop_addr">Property Address</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=closing_date">Closing Date</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=busted_date">Contract Busted Date</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=company_name">Company Name</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=proc">Processor</a></b></font></td>
	</tr>
</cfoutput>
<cfoutput query="report4">
<cfset a_bgcolor = "FFFFFF">
<cfset a_bgcolor2 = "FFFFFF">
<cfif report4.flag1 eq 1>
<cfset a_bgcolor = "red">
</cfif>
<cfif report4.flag2 eq 1>
<cfset a_bgcolor2 = "green">
</cfif>
<cfif report4.flag3 eq 1>
<cfset a_bgcolor2 = "gray">
</cfif>
<tr>

			<tr>
 <td bgcolor="#a_bgcolor#"><font size=1 color=black face=verdana><b><cfif a_bgcolor eq 'red'><font color="white">#datediff#</font><cfelse>&nbsp;</cfif></b></font></td>
 <td bgcolor="#a_bgcolor2#"><font size=1 color=black face=verdana><b><cfif a_bgcolor2 eq 'gray'><font color="white">#datediff2#</font><cfelse>&nbsp;</cfif></b></font></td>
			<td><a href="title_report_modify.cfm?&company_id=0&uid=#session.ft_user_id#&al=1&rec_id=#report4.order_num#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#report4.order_num#</font></a></td>
		<td align="left"><font size=1 color=black face=verdana>#report4.reo_num#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
			#report4.prop_addr#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
		    #DateFormat(report4.closing_date, "m/d/yyyy")#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
		    #DateFormat(report4.busted_date, "m/d/yyyy")#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
			#report4.company_name#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
			<nobr>#report4.proc#</nobr></font></td>
	</tr>
	</cfoutput>
<cfelse>
<tr><td colspan=6><font size=1>No records match this report</font></td></tr>
</cfif>
</table><br>
<br>
<br>

<cfflush>

<!--- report5 --->
<!---5. Final HUD Uploaded
flag if signed HUH w/Wire Info not up[loaded 1 day after scheduled closing --->
<TABLE cellSpacing=1 cellPadding=1 width="100%" align="Center" border=0>
	<tr>
		<td align="center"
              colspan = 8
            width="100%">
			<B>Final HUD Uploaded</b><BR>
			<div align="left">
<table cellpadding=2 cellspacing=0 border=0>
<tr><td><img src="images/flag_red.gif" width=12 height=12></td>
<td><font size=1 color=black face=verdana>signed HUD w/Wire Info not uploaded 1 day after Scheduled Closing - <i>number in white is number of days past Scheduled Closing</i></font></td></tr>
</table>
</div>
		</td>
	</tr>
<cfif report5.recordcount>
<cfoutput>
<tr>
		<td align="left"><font size=1 color=black face=verdana><b>&nbsp;</b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b>&nbsp;</b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=order_num">Order Num</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=reo_num">REO Number</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=prop_addr">Property Address</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=closing_date">Closing Date</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=busted_date">Contract Busted Date</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=company_name">Company Name</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=proc">Processor</a></b></font></td>
	</tr>
</cfoutput>
<cfoutput query="report5">
<cfset a_bgcolor = "FFFFFF">
<cfset a_bgcolor2 = "FFFFFF">
<cfif report5.flag1 eq 1>
<cfset a_bgcolor = "red">
</cfif>
<cfif report5.flag2 eq 1>
<cfset a_bgcolor2 = "green">
</cfif>
<cfif report5.flag3 eq 1>
<cfset a_bgcolor2 = "gray">
</cfif>
<tr>

			<tr>
 <td bgcolor="#a_bgcolor#"><font size=1 color=black face=verdana><b><cfif a_bgcolor eq 'red'><font color="white">#datediff#</font><cfelse>&nbsp;</cfif></b></font></td>
 <td bgcolor="#a_bgcolor2#"><font size=1 color=black face=verdana><b>&nbsp;</b></font></td>
			<td><a href="title_report_modify.cfm?&company_id=0&uid=#session.ft_user_id#&al=1&rec_id=#report5.order_num#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#report5.order_num#</font></a></td>
		<td align="left"><font size=1 color=black face=verdana>#report5.reo_num#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
			#report5.prop_addr#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
		    #DateFormat(report5.closing_date, "m/d/yyyy")#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
		    #DateFormat(report5.busted_date, "m/d/yyyy")#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
			#report5.company_name#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
			<nobr>#report5.proc#</nobr></font></td>
	</tr>
	</cfoutput>
<cfelse>
<tr><td colspan=6><font size=1>No records match this report</font></td></tr>
</cfif>
</table><br>
<br>
<br>

<cfflush>



<!--- report6 --->
<!---Signed HUD Uploaded --->
<TABLE cellSpacing=1 cellPadding=1 width="100%" align="Center" border=0>
	<tr>
		<td align="center"
              colspan = 8
            width="100%">
			<B>Signed HUD Uploaded<BR>
<!--- <font size=1><font color="red">red</font> flag if signed HUD w/Wire Info not uploaded 1 day after Scheduled Closing</font> --->
</B>
		</td>
	</tr>
<cfif report6.recordcount>
<cfoutput>
<tr>
		<td align="left"><font size=1 color=black face=verdana><b>&nbsp;</b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b>&nbsp;</b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=order_num">Order Num</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=reo_num">REO Number</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=prop_addr">Property Address</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=closing_date">Closing Date</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=busted_date">Contract Busted Date</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=company_name">Company Name</a></b></font></td>
		<td align="left"><font size=1 color=black face=verdana><b><a href="#cgi.script_name#?report_sort=proc">Processor</a></b></font></td>
	</tr>
</cfoutput>
<cfoutput query="report6">
<cfset a_bgcolor = "FFFFFF">
<cfset a_bgcolor2 = "FFFFFF">
<cfif report6.flag1 eq 1>
<cfset a_bgcolor = "red">
</cfif>
<cfif report6.flag2 eq 1>
<cfset a_bgcolor2 = "green">
</cfif>
<tr>

			<tr>
 <td bgcolor="#a_bgcolor#"><font size=1 color=black face=verdana><b>&nbsp;</b></font></td>
 <td bgcolor="#a_bgcolor2#"><font size=1 color=black face=verdana><b>&nbsp;</b></font></td>
			<td><a href="title_report_modify.cfm?&company_id=0&uid=#session.ft_user_id#&al=1&rec_id=#report6.order_num#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#report6.order_num#</font></a></td>
		<td align="left"><font size=1 color=black face=verdana>#report6.reo_num#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
			#report6.prop_addr#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
		    #DateFormat(report6.closing_date, "m/d/yyyy")#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
		    #DateFormat(report6.busted_date, "m/d/yyyy")#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
			#report6.company_name#</font></td>
		<td align="left"><font size=1 color=black face=verdana>
			<nobr>#report6.proc#</nobr></font></td>
	</tr>
	</cfoutput>
<cfelse>
<tr><td colspan=6><font size=1>No records match this report</font></td></tr>
</cfif>
</table><br>
<br>
<br>
<cfflush>






