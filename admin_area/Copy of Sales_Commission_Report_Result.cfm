<!---Checking for either a blank start or end date--->
<CFIF (#Len(startdate)# lte "1") OR (#Len(enddate)# lte "1")>
    <CFLOCATION URL="https://#cgi.server_name#/admin_area/Sales_Commission_Report_Date.cfm?a_trigger=1&uid=#uid#">
</CFIF>
<!---Checking for valid dates--->
<CFIF (#IsDate(startdate)# eq "False") OR (#IsDate(enddate)# eq "False" )>
    <CFLOCATION URL="https://#cgi.server_name#/admin_area/Sales_Commission_Report_Date.cfm?a_trigger=2&uid=#uid#">
</CFIF>

<!---Do a Group By to get all of the Outside Sales People's Names--->
<cfif session.ft_user_id eq 294 or session.ft_user_id eq 56 or session.ft_user_id eq 59 or session.ft_user_id eq 90 or session.ft_user_id eq 248>
<CFQUERY datasource="#request.dsn#" NAME="read_Loans_Funded">
	SELECT     fname, lname
    FROM       sqlLoans_Funded
    GROUP BY fname, lname
</CFQUERY>
<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="lookup_user">
	SELECT     fname, lname
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
<title>Sales Commission Report</title>
</head>
<body>

<table>
    <tr>
        <TD colspan="10">
            <FONT FACE=verdana SIZE=3 color="black">
            <B><CENTER>Sales Commission Report for dates between <CFOUTPUT>#startdate#</CFOUTPUT> and <CFOUTPUT>#enddate#</CFOUTPUT></B></CENTER>
            </FONT>
        </td>
    </tr>
    <tr>
        <TD colspan="10">
         <BR><BR>
        </td>
    </tr>
<cfif session.ft_user_id eq 294 or session.ft_user_id eq 56 or session.ft_user_id eq 59 or session.ft_user_id eq 90>
    <tr>
        <TD colspan="10">
            <FONT FACE=verdana SIZE=3 color="black">
            <B>Outside Sales People</B>
            </font>
        </td>
    </tr>
</cfif>
    <!---Loop through one outside salesperson at a time --->
<cfset startdate = DateFormat(DateAdd("d", -1, startdate), "m/d/yyyy")>
<cfset enddate = DateFormat(DateAdd("d", 1, enddate), "m/d/yyyy")>
<CFLOOP QUERY="read_Loans_Funded">
    <CFQUERY datasource="#request.dsn#" NAME="read_Loans_Funded_Person">
	    SELECT *
	    FROM sqlLoans_Funded
	    WHERE fl_dateandtime
        Between CONVERT(DATETIME,'#startdate#', 102) AND CONVERT(DATETIME,'#enddate#', 102)
        And fname Like '#trim(read_Loans_Funded.fname)#'
        and lname Like '#trim(read_Loans_Funded.lname)#'
    </CFQUERY>


<!--- <cfif cgi.REMOTE_ADDR eq '98.233.232.47'>
<cfdump var="#read_Loans_Funded_Person#">
<cfabort>
</cfif>
 --->
    <CFIF #read_Loans_Funded_Person.RecordCount# gte "1">
        <tr>
            <TD colspan="10">
                <FONT FACE=verdana SIZE=2 color="black">
                <B><CFOUTPUT>#read_Loans_Funded.fname# #read_Loans_Funded.lname#</CFOUTPUT></B>
                </font>
            </td>


        </tr>
        <TR>
            <td width="250">
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Company</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Company Sign-up Date</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>First Order Date</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>First Closing Req Date</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Total Closed</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Order Number</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>B First Name</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>B Last Name</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>County</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>State</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Loan Amount</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Order Date</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Closing Date</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Funded Date</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Revenue</B>
                </font>
            </td>
        </tr>
		<cfset revenue_total = 0>
        <CFOUTPUT QUERY="read_Loans_Funded_Person" StartRow="1" MAXROWS="1000000">
		<CFQUERY datasource="#request.dsn#" NAME="revenue">
	    SELECT revenue
	    FROM title
	    WHERE title_id = #title_id#
        </CFQUERY>
        <CFQUERY datasource="#request.dsn#" NAME="read_comp_info" maxrows=1>
	    SELECT order_date_adjusted
	    FROM title
	    WHERE comp_id = #read_Loans_Funded_Person.ID#
		order by order_date_adjusted
    </CFQUERY>
    <CFQUERY datasource="#request.dsn#" NAME="total_closed">
	    SELECT *
	    FROM title
	    WHERE comp_id = #read_Loans_Funded_Person.ID#
		and appraisal_status = 'Loan Closed' or appraisal_status = 'Loan Funded'
    </CFQUERY>
<!---     <CFQUERY datasource="#request.dsn#" NAME="first_rec" maxrows=1>
	    SELECT a_filled_out_date
	    FROM title_closing_order_request
	    WHERE c_comp_id = #read_Loans_Funded_Person.ID#
		order by a_filled_out_date
    </CFQUERY>
 --->    <TR>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    #Company#
                    </font>
                </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    <cfif a_date neq 'NULL' and a_date neq ''>#a_date#</cfif>
                    </font>
                </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    #DateFormat(read_comp_info.order_date_adjusted, "m/d/yyyy")#
                    </font>
                </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                   <!--- #DateFormat(first_rec.a_filled_out_date, "m/d/yyyy")# --->
                    </font>
                </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                   #total_closed.recordcount#
                    </font>
                </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    #title_id#
                    </FONT>
                </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    #bfirstname1#
                    </font>
                </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    #blastname1#
                    </font>
                </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    #pcounty#
                    </font>
               </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    #pstate#
                    </font>
                </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    #dollarformat(loanamt_float)#
                    </font>
                </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    #dateformat(order_date_adjusted,"mm/dd/yyyy")#
                    </font>
                </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    #dateformat(l_date,"mm/dd/yyyy")#
                    </font>
                </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    #dateformat(fl_dateandtime,"mm/dd/yyyy")#
                    </font>
               </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">

					<cfif revenue.revenue eq '' or revenue.revenue eq 'NULL' or NOT IsNumeric(revenue.revenue)>
					<cfset new_rev = 0>
					<cfelse>
					<cfset new_rev = revenue.revenue - 120>
					 <cfif company contains 'National Home Lending'>
					 <cfset new_rev = new_rev - 230>
					 </cfif>
					 <cfif company contains 'Chase/RealEC'>
					 <cfset new_rev = revenue.revenue - 175>
					 </cfif>
					</cfif>
					<cfset revenue_total = revenue_total + new_rev>
					#dollarformat(new_rev)#
                    </font>
                </td>
            </tr>
        </CFOUTPUT>
        <TR>
            <TD colspan="15">
                <HR>
            </TD>

        </tr>
		<tr>
		        <td>&nbsp;</td>
				<td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    <cfoutput>#dollarformat(revenue_total)#</cfoutput>
                    </font>
                </td>
        </TR>
        </CFIF>
    </CFLoop>
	</table>
	<cfflush>
<!---Inside Sales--->
    <CFQUERY datasource="#request.dsn#" NAME="read_Loans_Funded_Inside">
	SELECT     fname, lname
    FROM       sqlLoans_Funded_InsideSales
    GROUP BY fname, lname
</CFQUERY>
<table><tr>
        <TD colspan="10">
         <BR><BR>
        </td>
    </tr>
<cfif session.ft_user_id eq 294 or session.ft_user_id eq 56 or session.ft_user_id eq 59 or session.ft_user_id eq 90 or session.ft_user_id eq 248>
    <tr>
        <TD colspan="10">
            <FONT FACE=verdana SIZE=3 color="black">
            <B>Inside Sales People</B>
            </font>
        </td>
    </tr>

    <!---Loop through one outside salesperson at a time --->
<CFLOOP QUERY="read_Loans_Funded_Inside">
    <CFQUERY datasource="#request.dsn#" NAME="read_Loans_Funded_Person_Inside">
	    SELECT *
	    FROM sqlLoans_Funded_InsideSales
	    WHERE fl_dateandtime
        Between CONVERT(DATETIME,'#startdate#', 102) AND CONVERT(DATETIME,'#enddate#', 102)
        And fname Like '#trim(read_Loans_Funded_Inside.fname)#'
        and lname Like '#trim(read_Loans_Funded_Inside.lname)#'
    </CFQUERY>


    <CFIF #read_Loans_Funded_Person_Inside.RecordCount# gte "1">
        <tr>
            <TD colspan="10">
                <FONT FACE=verdana SIZE=2 color="black">
                <B><CFOUTPUT>#read_Loans_Funded_Inside.fname# #read_Loans_Funded_Inside.lname#</CFOUTPUT></B>
                </font>
            </td>

        </tr>
        <TR>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Company</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Company Sign-Up Date</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>First Order Date</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>First Closing Req. Date</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Total Closed</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Order Number</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>B First Name</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>B Last Name</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>County</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>State</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Loan Amount</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Order Date</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Closing Date</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Funded Date</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Revenue</B>
                </font>
            </td>
        </tr>


	<CFOUTPUT QUERY="read_Loans_Funded_Person_Inside" StartRow="1" MAXROWS="1000000">
	<CFQUERY datasource="#request.dsn#" NAME="revenue">
	    SELECT revenue
	    FROM title
	    WHERE title_id = #title_id#
        </CFQUERY>
    <CFQUERY datasource="#request.dsn#" NAME="read_comp_info" maxrows=1>
	    SELECT order_date_adjusted
	    FROM title
	    WHERE comp_id = #read_Loans_Funded_Person_Inside.ID#
		order by order_date_adjusted
    </CFQUERY>
    <CFQUERY datasource="#request.dsn#" NAME="total_closed">
	    SELECT *
	    FROM title
	    WHERE comp_id = #read_Loans_Funded_Person_Inside.ID#
		and appraisal_status = 'Loan Closed' or appraisal_status = 'Loan Funded'
    </CFQUERY>
    <!--- <CFQUERY datasource="#request.dsn#" NAME="first_rec" maxrows=1>
	    SELECT a_filled_out_date
	    FROM title_closing_order_request
	    WHERE c_comp_id = #read_Loans_Funded_Person_Inside.ID#
		order by a_filled_out_date
    </CFQUERY> --->

            <TR>
                <td>#Company#</td>
				 <td><cfif a_date neq 'NULL' and a_date neq ''>#a_date#</cfif></td>
				 <td>#DateFormat(read_comp_info.order_date_adjusted, "m/d/yyyy")#</td>
				 <td><!--- #DateFormat(first_rec.a_filled_out_date, "m/d/yyyy")# ---></td>
				 <td>#total_closed.recordcount#</td>
                <td>#title_id#</td>
                <td>#bfirstname1#</td>
                <td>#blastname1#</td>
                <td>#pcounty#</td>
                <td>#pstate#</td>
                <td>#dollarformat(loanamt_float)#</td>
                <td>#dateformat(order_date_adjusted,"mm/dd/yyyy")#</td>
                <td>#dateformat(l_date,"mm/dd/yyyy")#</td>
                <td>#dateformat(fl_dateandtime,"mm/dd/yyyy")#</td>
<cfif revenue.revenue eq '' or revenue.revenue eq 'NULL'>
					<cfset new_rev = 0>
					<cfelse>
					<cfset new_rev = revenue.revenue - 120>
					 <cfif company contains 'National Home Lending'>
					 <cfset new_rev = new_rev - 230>
					 </cfif>
					 <cfif company contains 'Chase/RealEC'>
					 <cfset new_rev = revenue.revenue - 175>
					 </cfif>
					</cfif>
					<cfset revenue_total = revenue_total + new_rev>
					<td>#dollarformat(new_rev)#</td>

            </tr>
        </CFOUTPUT>
        <TR>
            <TD colspan="15">
                <HR>
            </TD>
        </TR>
		<tr>
		        <td>&nbsp;</td>
				<td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    <cfoutput>#dollarformat(revenue_total)#</cfoutput>
                    </font>
                </td>
        </TR>        <CFELSE>
        <TR>
            <TD colspan="15">
                None
            </TD>
        </TR>
        </CFIF>
    </CFLoop>
</cfif>
</table>


</body>
</html>
