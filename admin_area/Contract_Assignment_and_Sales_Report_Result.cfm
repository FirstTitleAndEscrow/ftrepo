<cfparam name="url.uid" default=0>
<CFPARAM NAME="excel" DEFAULT="0">

<cfoutput>
<cfif #excel# EQ 1>
	<cfset filename = "file.xls">
		<cfcontent type="application/vnd.ms-excel">
<cfheader name="Content-Disposition" value="attachment; filename=#filename#">
#filename#
</cfif>
</cfoutput>
<!---Checking for either a blank start or end date--->
<CFIF (#Len(startdate)# lte "1") OR (#Len(enddate)# lte "1")>
    <CFLOCATION URL="https://#cgi.server_name#/admin_area/Sales_Assigned_Report_Date.cfm?a_trigger=1&uid=#uid#">
</CFIF>
<!---Checking for valid dates--->
<CFIF (#IsDate(startdate)# eq "False") OR (#IsDate(enddate)# eq "False" )>
    <CFLOCATION URL="https://#cgi.server_name#/admin_area/Sales_Assigned_Report_Date.cfm?a_trigger=2&uid=#uid#">
</CFIF>

<!--- <CFINCLUDE TEMPLATE="./includes/companies.cfm">
<cfset all_comp_ids = ValueList(read_Companies.ID, ",")>
<CFQUERY datasource="#request.dsn#" NAME="get_all_files">
	SELECT     title_id
    FROM       Title
	where comp_id in (#all_comp_ids#)
</CFQUERY>
<cfset all_title_ids = ValueList(get_all_files.title_id, ",")>
 --->
<!---Do a Group By to get all of the Outside Sales People's Names--->


<CFQUERY datasource="#request.dsn#" NAME="find_files">
	SELECT     distinct n.order_id, n.N_Date, t.comp_id
    FROM       Title_notes n, Companies c, title t
	where n.N_Date between '#DateFormat(startdate, "m-d-yyyy")#' and '#DateFormat(enddate, "m-d-yyyy")#'
	and n.N_Note Like 'File was reassigned from client%'
	and n.order_id = t.title_id and t.comp_id = c.ID
	order by n.N_Date DESC
</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="check_user">
	SELECT    * from First_Admin where ID = #session.ft_user_id#
</CFQUERY>


<cfif session.ft_user_id eq 294 or session.ft_user_id eq 56 or session.ft_user_id eq 59 or session.ft_user_id eq 90 or check_user.role_id eq 32 or check_user.role_id eq 22 or check_user.role_id eq 23 or check_user.role_id eq 'NULL' or check_user.role_id eq ''   or check_user.mi_flushing_admin eq 1  or check_user.mi_admin eq 1  or check_user.tx_admin eq 1  or check_user.va_admin eq 1    or check_user.mo_admin eq 1   >
<CFQUERY datasource="#request.dsn#" NAME="salespeople">
		SELECT fname, lname, id
		FROM First_Admin
		WHERE Role_ID = 24
			<cfif check_user.mi_flushing_admin eq 1>
            and mi_flushing_employee = 1
            </cfif>    
            <cfif check_user.mi_admin eq 1>
            and mi_employee = 1
            </cfif>    
            <cfif check_user.ft_fairfax_admin eq 1>
            and ft_fairfax_employee = 1
            </cfif>    
            <cfif check_user.tx_admin eq 1>
            and tx_employee = 1
            </cfif>    
            <cfif check_user.va_admin eq 1>
            and va_employee = 1
            </cfif>    
            <cfif check_user.mo_admin eq 1>
            and mo_employee = 1
            </cfif>    

		order by lname
	</CFQUERY>
<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="salespeople">
		SELECT fname, lname, id
		FROM First_Admin
		WHERE ID = #url.uid#
		order by lname
	</CFQUERY>
</cfif>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>Contract Assignment and Sales Report</title>
<script language="javascript">

function to_excel() {
document.excel_form.submit();
}
</script>
</head>
<body>
<cfoutput>
<form name="excel_form" action="Contract_Assignment_and_Sales_Report_Result.cfm?uid=#URL.uid#" method="post">
<input type="hidden" name="excel" value="1">
<input type="hidden" name="startdate" value="#DateFormat(startdate, 'm-d-yyyy')#">
<input type="hidden" name="enddate" value="#DateFormat(enddate, 'm-d-yyyy')#">
</form>
</cfoutput>
<input name="excel_submit" type="button" onClick="to_excel();" value="EXPORT TO EXCEL"><br>
<br><br>
<br>


<cfset found_some_records = 0>

<table >
    <tr>
        <TD colspan="5">
            <FONT FACE=verdana SIZE=3 color="black">
            <B><CENTER>Contract Assignment and Sales Report for dates between <CFOUTPUT>#startdate#</CFOUTPUT> and <CFOUTPUT>#enddate#</CFOUTPUT></B></CENTER>
            </FONT>
        </td>
    </tr>
    <tr>
        <TD colspan="5">
         <BR><BR>
        </td>
    </tr>
    <!---Loop through one outside salesperson at a time --->
<cfset startdate = DateFormat(DateAdd("d", -1, startdate), "m/d/yyyy")>
<cfset enddate = DateFormat(DateAdd("d", 1, enddate), "m/d/yyyy")>
<CFLOOP QUERY="salespeople">
			<CFQUERY datasource="#request.dsn#" name="get_sales_companies">
				SELECT ID
				FROM companies
				where intSales = #salespeople.ID#
			</cfquery>
<cfset all_comp_ids = ValueList(get_sales_companies.id, ",")>

<cfif ListLen(all_comp_ids, ",")>
			<cfquery dbtype="query" name="read_files_from_query">
				SELECT *
				FROM find_files
				where comp_id IN (#all_comp_ids#)
				order by comp_ID
			</cfquery>



    <CFIF #read_files_from_query.RecordCount# gte "1">
	<cfset found_some_records = found_some_records + 1>
<cfif found_some_records eq 1>
	    <tr>
        <TD colspan="5">
            <FONT FACE=verdana SIZE=3 color="black">
            <B>Outside Sales People</B>
            </font>
        </td>
    </tr>

</cfif>

        <tr>
            <TD colspan="5">
                <FONT FACE=verdana SIZE=2 color="black">
                <B><CFOUTPUT>#salespeople.fname# #salespeople.lname#</CFOUTPUT></B>
                </font>
            </td>


        </tr>
        <TR>
            <td width="100">
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Order ID</B>
                </font>
            </td>
            <td width=125>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Assigned Date</B>
                </font>
            </td>
            <td width=250>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Company</B>
                </font>
            </td>
            <td width=150>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Status</B>
                </font>
            </td>
            <td width=150>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Closed/Funded Data</B>
                </font>
            </td>
            <td width=150>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Full Closing / Seller Rep</B>
                </font>
            </td>
        </tr>
<cfset ID_list = "">
        <CFOUTPUT QUERY="read_files_from_query" StartRow="1" MAXROWS="1000000">
<CFQUERY datasource="#request.dsn#" name="get_company_info">
				SELECT *
				FROM companies
				where ID = #read_files_from_query.comp_ID#
</cfquery>
<CFQUERY datasource="#request.dsn#" name="get_file_info">
				SELECT *
				FROM title t, eventlist e
				where t.title_ID = #read_files_from_query.order_ID#
				and e.title_id = t.title_id
</cfquery>
<cfif ListFindNoCase(ID_List, read_files_from_query.order_id, ",") eq 0>
				<cfset ID_list = ListAppend(ID_List, read_files_from_query.order_id, ",")>
				 <TR>
                <td width=100>
				<FONT FACE=verdana SIZE=1 color="black">
                    #read_files_from_query.order_id#
                    </font>
                </td>
                <td width=125>
                    <FONT FACE=verdana SIZE=1 color="black">
                    <cfif read_files_from_query.N_Date neq 'NULL' and read_files_from_query.N_Date neq ''>#DateFormat(read_files_from_query.N_Date, "m/d/yyyy")#</cfif>
                    </font>
                </td>
                <td width=250>
                    <FONT FACE=verdana SIZE=1 color="black">
                    #get_company_info.company#
                    </font>
                </td>
                <td width=150>
                    <FONT FACE=verdana SIZE=1 color="black">
                   #get_file_info.appraisal_status#
                    </font>
                </td>
                <td width=150>
                    <FONT FACE=verdana SIZE=1 color="black">
                   <cfif get_file_info.appraisal_status eq 'Loan Closed' or get_file_info.appraisal_status eq 'Loan Closed-Seller Rep'>#DateFormat(get_file_info.cl_dateandtime, "m/d/yyyy")#<cfelseif get_file_info.appraisal_status eq 'Loan Funded'>#DateFormat(get_file_info.fl_dateandtime, "m/d/yyyy")#<cfelse>&nbsp;</cfif>
                    </font>
                </td>
                <td width=150>
                    <FONT FACE=verdana SIZE=1 color="black">
                   <cfif get_file_info.sales_call_full eq 1>Sales Call - Full Closing<cfelseif get_file_info.sales_call_seller_rep eq 1>Sales Call - Seller Rep Only<cfelse>&nbsp;</cfif>
                    </font>
                </td>
            </tr>
			</cfif>
        </CFOUTPUT>
        </CFIF>
	</cfif>
    </CFLoop>
	</table>
	<cfflush>



	<br>
<br>
<br>
<br>









<cfset found_some_records = 0>




<cfif session.ft_user_id eq 294 or session.ft_user_id eq 56 or session.ft_user_id eq 59 or session.ft_user_id eq 90>

<CFQUERY datasource="#request.dsn#" NAME="salespeople">
		SELECT fname, lname, id
		FROM First_Admin
		WHERE Role_ID = 15
		order by lname
	</CFQUERY>



<table >
    <!---Loop through one outside salesperson at a time --->
<cfset startdate = DateFormat(DateAdd("d", -1, startdate), "m/d/yyyy")>
<cfset enddate = DateFormat(DateAdd("d", 1, enddate), "m/d/yyyy")>
<CFLOOP QUERY="salespeople">
			<CFQUERY datasource="#request.dsn#" name="get_sales_companies">
				SELECT ID
				FROM companies
				where intSales = #salespeople.ID#
			</cfquery>
<cfset all_comp_ids = ValueList(get_sales_companies.id, ",")>

<cfif ListLen(all_comp_ids, ",")>
			<cfquery dbtype="query" name="read_files_from_query">
				SELECT *
				FROM find_files
				where comp_id IN (#all_comp_ids#)
				order by comp_ID
			</cfquery>



    <CFIF #read_files_from_query.RecordCount# gte "1">
<cfset found_some_records = found_some_records + 1>
<cfif found_some_records eq 1>
	    <tr>
        <TD colspan="5">
            <FONT FACE=verdana SIZE=3 color="black">
            <B>Inside Sales People</B>
            </font>
        </td>
    </tr>

</cfif>


        <tr>
            <TD colspan="5">
                <FONT FACE=verdana SIZE=2 color="black">
                <B><CFOUTPUT>#salespeople.fname# #salespeople.lname#</CFOUTPUT></B>
                </font>
            </td>


        </tr>
        <TR>
            <td width="100">
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Order ID</B>
                </font>
            </td>
            <td width=125>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Assigned Date</B>
                </font>
            </td>
            <td width=250>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Company</B>
                </font>
            </td>
            <td width=150>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Status</B>
                </font>
            </td>
            <td width=150>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Closed/Funded Data</B>
                </font>
            </td>
        </tr>
        <CFOUTPUT QUERY="read_files_from_query" StartRow="1" MAXROWS="1000000">
<CFQUERY datasource="#request.dsn#" name="get_company_info">
				SELECT *
				FROM companies
				where ID = #read_files_from_query.comp_ID#
</cfquery>
<CFQUERY datasource="#request.dsn#" name="get_file_info">
				SELECT *
				FROM title t, eventlist e
				where t.title_ID = #read_files_from_query.order_ID#
				and e.title_id = t.title_id
</cfquery>
  <TR>
                <td width=100>
                    <FONT FACE=verdana SIZE=1 color="black">
                    #read_files_from_query.order_id#
                    </font>
                </td>
                <td width=125>
                    <FONT FACE=verdana SIZE=1 color="black">
                    <cfif read_files_from_query.N_Date neq 'NULL' and read_files_from_query.N_Date neq ''>#DateFormat(read_files_from_query.N_Date, "m/d/yyyy")#</cfif>
                    </font>
                </td>
                <td width=250>
                    <FONT FACE=verdana SIZE=1 color="black">
                    #get_company_info.company#
                    </font>
                </td>
                <td width=150>
                    <FONT FACE=verdana SIZE=1 color="black">
                   #get_file_info.appraisal_status#
                    </font>
                </td>
                <td width=150>
                    <FONT FACE=verdana SIZE=1 color="black">
                   <cfif get_file_info.appraisal_status eq 'Loan Closed' or get_file_info.appraisal_status eq 'Loan Closed-Seller Rep'>#DateFormat(get_file_info.cl_dateandtime, "m/d/yyyy")#<cfelseif get_file_info.appraisal_status eq 'Loan Funded'>#DateFormat(get_file_info.fl_dateandtime, "m/d/yyyy")#<cfelse>&nbsp;</cfif>
                    </font>
                </td>
            </tr>
        </CFOUTPUT>
        </CFIF>
	</cfif>
    </CFLoop>
	</table>
	<cfflush>
</cfif>





</body>
</html>
