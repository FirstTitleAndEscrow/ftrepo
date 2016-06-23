<cfparam name="form.salesperson" default="All">

<!---Checking for either a blank start or end date--->
<CFIF (#Len(startdate)# lte "1") OR (#Len(enddate)# lte "1")>
    <CFLOCATION URL="https://#cgi.server_name#/admin_area/Sales_Commission_Report_Date.cfm?a_trigger=1&uid=#uid#">
</CFIF>
<!---Checking for valid dates--->
<CFIF (#IsDate(startdate)# eq "False") OR (#IsDate(enddate)# eq "False" )>
    <CFLOCATION URL="https://#cgi.server_name#/admin_area/Sales_Commission_Report_Date.cfm?a_trigger=2&uid=#uid#">
</CFIF>

<!---Do a Group By to get all of the Outside Sales People's Names--->
<cfif session.ft_user_id eq 294 or session.ft_user_id eq 56 or session.ft_user_id eq 59  or session.ft_user_id eq 90 or session.ft_user_id eq 424>
<CFQUERY datasource="#request.dsn#" NAME="read_Loans_Funded">
	SELECT     fname, lname, intSales
    FROM       sqlLoans_Funded
					  <cfif form.sales_people neq 'All'>
					  AND intSales IN (#form.sales_people#)
					  </cfif>
    GROUP BY fname, lname
</CFQUERY>
<cfelseif session.role_id eq 34 or session.ft_user_id eq 248>

<CFQUERY datasource="#request.dsn#" NAME="read_Loans_Funded">
SELECT     ID as intSales, fname, lname, username, status
FROM         First_Admin
WHERE

<cfif form.sales_people neq 'All'>
ID IN (#form.sales_people#)
<cfelse>
(role_id = 24 OR (role_id = 34 AND id <> 450)) AND (status = 1 OR
                      status = 'True') AND (va_employee IS NULL OR
                      va_employee = 0) AND (mi_employee IS NULL OR
                      mi_employee = 0) AND (mo_employee IS NULL OR
                      mo_employee = 0) AND (mi_flushing_employee IS NULL OR
                      mi_flushing_employee = 0) AND (tx_employee IS NULL OR
                      tx_employee = 0)  AND (ft_fairfax_employee IS NULL OR
                      ft_fairfax_employee = 0) AND (ID NOT IN (327, 264, 450)) OR
                      (ID = 319) OR
                      (ID = 408) OR
                      (ID = 460)
					  or (ID = 59)
					  or (ID = 56)
					  or (ID = 294)
</cfif>
ORDER BY lname
</cfquery>
<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="lookup_user">
	SELECT     fname, lname, ID
    FROM       First_admin
    where ID = '#session.ft_user_id#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_Loans_Funded">
	SELECT     fname, lname
    FROM       sqlLoans_Funded
	where (lname = '#lookup_user.lname#' AND
	fname = '#lookup_user.fname#')
	<cfif session.mi_admin eq 1>
	or (intSales in (select ID from first_admin where role_id = 24 and mi_employee = 'True'))
	<cfelseif session.mo_admin eq 1>
	or (intSales in (select ID from first_admin where role_id = 24 and mo_employee = 'True'))
	<cfelseif session.mi_flushing_admin eq 1>
	or (intSales in (select ID from first_admin where role_id = 24 and mi_flushing_employee = 'True'))
	<cfelseif session.tx_admin eq 1>
	or (intSales in (select ID from first_admin where role_id = 24 and tx_employee = 'True'))
</cfif>
    GROUP BY fname, lname
</CFQUERY>
</cfif>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>Sales Revenue by Salesperson</title>
</head>
<body>
<table>
    <tr>
        <TD colspan="10">
            <FONT FACE=verdana SIZE=3 color="black">
            <B><CENTER>Sales Revenue Report for dates between <CFOUTPUT>#startdate#</CFOUTPUT> and <CFOUTPUT>#enddate#</CFOUTPUT></B></CENTER>
            </FONT>
        </td>
    </tr>
    <tr>
        <TD colspan="10">
         <BR><BR>
        </td>
    </tr>
</table>



    <!---Loop through one outside salesperson at a time --->
<!--- <cfset startdate = DateFormat(DateAdd("d", -1, startdate), "m/d/yyyy")>
<cfset enddate = DateFormat(DateAdd("d", 1, enddate), "m/d/yyyy")>
 ---><CFLOOP QUERY="read_Loans_Funded">
 <CFQUERY datasource="#request.dsn#" NAME="salesperson">
	SELECT     fname, lname, ID
    FROM       First_admin
    where lname = '#read_loans_funded.lname#' and fname = '#read_loans_funded.fname#'
</CFQUERY>

    <CFQUERY datasource="#request.dsn#" NAME="read_Loans_Funded_Person">
	    SELECT *
	    FROM sqlLoans_Funded
	    WHERE (cl_dateandtime
        Between CONVERT(DATETIME,'#startdate#', 102) AND CONVERT(DATETIME,'#enddate#', 102)
		or fl_dateandtime
        Between CONVERT(DATETIME,'#startdate#', 102) AND CONVERT(DATETIME,'#enddate#', 102)
		)
        And fname Like '#trim(read_Loans_Funded.fname)#'
        and lname Like '#trim(read_Loans_Funded.lname)#'
		order by Company
    </CFQUERY>

<cfset revenue_total = 0>
<cfloop query="read_Loans_Funded_Person">
<cfif IsNumeric(read_loans_funded_person.revenue) and read_loans_funded_person.revenue neq ''>
<cfset revenue_total = revenue_total + read_loans_funded_person.revenue>
</cfif>
</cfloop>

    <CFQUERY datasource="#request.dsn#" NAME="read_Loans_Ordered_Person">
	    SELECT *
	    FROM Title
	    WHERE order_date
        Between CONVERT(DATETIME,'#startdate#', 102) AND CONVERT(DATETIME,'#enddate#', 102)
        and comp_id in (Select ID from companies where intsales = #salesperson.ID#
		<cfif session.role_id eq 34 or session.ft_user_id eq 450>
		and streamline_client <> 1
		</cfif>)
    </CFQUERY>


<table border=0>
<CFIF #read_Loans_Funded_Person.RecordCount# gte "1">
        <tr>
            <TD width="250" align="left" valign="top">
                <FONT FACE=verdana SIZE=2 color="black">
                <B><CFOUTPUT>#read_Loans_Funded.fname# #read_Loans_Funded.lname#</CFOUTPUT></B>
                </font>
            </td>
            <td width="150" align="right" valign="top">
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Deals Ordered</B>
                </font>
            </td>
            <td width="150" align="right" valign="top">
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Deals Closed</B>
                </font>
            </td>
            <td width="150" align="right" valign="top">
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Revenue</B>
                </font>
            </td>
        </tr>

 <TR>
                <td>&nbsp;

                </td>
                <td align="right" valign="top">
                    <FONT FACE=verdana SIZE=1 color="black">
                    <cfoutput>#read_Loans_Ordered_Person.recordcount#</cfoutput>
                    </font>
                </td>
                <td align="right" valign="top">
                    <FONT FACE=verdana SIZE=1 color="black">
                    <cfoutput>#read_Loans_Funded_Person.recordcount#</cfoutput>
                    </font>
                </td>
                <td align="right" valign="top">
                    <FONT FACE=verdana SIZE=1 color="black">
                   <cfoutput>#DollarFormat(revenue_total)#</cfoutput>
                    </font>
                </td>

            </tr>
        <TR>
            <TD colspan="4">
                <HR>
            </TD>

        </tr>
        </CFIF>
    </CFLoop>
	</table>
	<cfflush>


</body>
</html>
