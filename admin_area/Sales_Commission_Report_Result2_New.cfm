<cfparam name="form.text_only" default="0">
<cfif session.ft_user_id neq 340 and session.ft_user_id neq 90 and session.ft_user_id neq 450 and session.ft_user_id neq 344 and session.ft_user_id neq 374 and session.ft_user_id neq 483 and session.ft_user_id neq 477 and session.ft_user_id neq 9 and session.ft_user_id neq 472 and session.ft_user_id neq 595>
<cfset form.text_only = 1>
</cfif>
<!---Checking for either a blank start or end date--->
<CFIF (#Len(startdate)# lte "1") OR (#Len(enddate)# lte "1")>
    <CFLOCATION URL="https://#cgi.server_name#/admin_area/Sales_Commission_Report_Date.cfm?a_trigger=1&uid=#uid#">
</CFIF>
<!---Checking for valid dates--->
<CFIF (#IsDate(startdate)# eq "False") OR (#IsDate(enddate)# eq "False" )>
    <CFLOCATION URL="https://#cgi.server_name#/admin_area/Sales_Commission_Report_Date.cfm?a_trigger=2&uid=#uid#">
</CFIF>

<!---Do a Group By to get all of the Outside Sales People's Names--->
<!---<cfif session.ft_user_id eq 294 or session.ft_user_id eq 56 or session.ft_user_id eq 59 or session.ft_user_id eq 90 or session.ft_user_id eq 248 or session.ft_user_id eq 424 or session.ft_user_id eq 340 or session.ft_user_id eq 450 or session.ft_user_id eq 344 or session.ft_user_id eq 374 or session.ft_user_id eq 483 or session.ft_user_id eq 477 or session.ft_user_id eq 9 or session.ft_user_id eq 472 or session.ft_user_id eq 595>
       <CFQUERY datasource="#request.dsn#" NAME="read_Loans_Funded">
              SELECT     fname, lname
           FROM       sqlLoans_Funded
           GROUP BY fname, lname
       </CFQUERY>
<cfelse>
              <CFQUERY datasource="#request.dsn#" NAME="lookup_user">
                     SELECT     fname, lname
                  FROM       First_admin
                  
              </CFQUERY>--->

              <CFQUERY datasource="#request.dsn#" NAME="read_Loans_Funded">
                     <cfif session.ft_user_id eq 294 or session.ft_user_id eq 56 or session.ft_user_id eq 59 or session.ft_user_id eq 90 or session.ft_user_id eq 248 or session.ft_user_id eq 424 or session.ft_user_id eq 340 or session.ft_user_id eq 450 or session.ft_user_id eq 344 or session.ft_user_id eq 374 or session.ft_user_id eq 483 or session.ft_user_id eq 477 or session.ft_user_id eq 9 or session.ft_user_id eq 472 or session.ft_user_id eq 595>               
                           SELECT     fname, lname
                         FROM       sqlLoans_Funded
                         GROUP BY fname, lname
                     <cfelse>   
                         SELECT     a.fname, a.lname
                         FROM       sqlLoans_Funded a,  First_admin b
                           where a.lname = b.lname AND
                           a.fname =  b.fname
                           <cfif session.mi_admin eq 1>
                                  or (intSales in (select ID from first_admin where role_id = 24 and mi_employee = 'True'))
                                  AND  b.ID = '#session.ft_user_id#'
                           <cfelseif session.mo_admin eq 1>
                                  or (intSales in (select ID from first_admin where role_id = 24 and mo_employee = 'True'))
                                  AND  b.ID = '#session.ft_user_id#'
                           <cfelseif session.mi_flushing_admin eq 1>
                                  or (intSales in (select ID from first_admin where role_id = 24 and mi_flushing_employee = 'True'))
                                  AND  b.ID = '#session.ft_user_id#'
                           <cfelseif session.tx_admin eq 1>
                                  or (intSales in (select ID from first_admin where role_id = 24 and tx_employee = 'True'))
                                  AND  b.ID = '#session.ft_user_id#'
                           </cfif>
                         GROUP BY a.fname, a.lname
                     </cfif>
              </CFQUERY>
              

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
<cfif session.ft_user_id eq 294 or session.ft_user_id eq 56 or session.ft_user_id eq 59 or session.ft_user_id eq 90 or session.ft_user_id eq 424 or session.ft_user_id eq 344 or session.ft_user_id eq 374 or session.ft_user_id eq 483 or session.ft_user_id eq 477 or session.ft_user_id eq 9 or session.ft_user_id eq 472 or session.ft_user_id eq 595>
    <tr>
        <TD colspan="10">
            <FONT FACE=verdana SIZE=3 color="black">
            <B>Outside Sales People</B>
            </font>
        </td>
    </tr>
</cfif>
<!--- <cfif cgi.REMOTE_ADDR eq '98.233.232.47'>
<cfdump var="#read_Loans_Funded#">
<cfabort>
</cfif>
 --->

    <!---Loop through one outside salesperson at a time --->
<!--- <cfset startdate = DateFormat(DateAdd("d", -1, startdate), "m/d/yyyy")> --->
<cfset enddate = DateFormat(DateAdd("d", 1, enddate), "m/d/yyyy")>
<CFLOOP QUERY="read_Loans_Funded">
    <CFQUERY datasource="#request.dsn#" NAME="read_Loans_Funded_Person">
<!--- Synechron Commented code 04/01/2013           SELECT *
           FROM sqlLoans_Funded
           WHERE fl_dateandtime--->
        SELECT 
           (select top 1 order_date_adjusted from  title d where a.company_ID=d.comp_id order by order_date_adjusted ) order_date_adjusted_comp_info    ,
           (SELECT COUNT(*) FROM title d WHERE a.company_ID=d.comp_id and order_date_adjusted between  '#DateFormat(startdate, "mm/dd/yyyy")#' and '#DateFormat(enddate, "mm/dd/yyyy")#')  count_total_ordered_in_range ,           
           (SELECT COUNT(*)  FROM title d WHERE  a.company_ID=d.comp_id and (appraisal_status = 'Loan Closed' or appraisal_status = 'Loan Funded')) total_closed,
           (SELECT top 1 a_filled_out_date FROM title_closing_order_request d WHERE d.c_comp_id = a.company_ID  order by a_filled_out_date) a_filled_out_date,
           a.Company, a.Company_ID, a.a_date, a.title_id, a.bfirstname1, a.blastname1, a.pcounty, a.pstate, a.loanamt_float, a.l_date, a.fl_dateandtime, a.original_revenue_amt, a.revenue, a.order_date_adjusted, a.Insured
           FROM sqlLoans_Funded a
           WHERE fl_dateandtime
        Between CONVERT(DATETIME,'#startdate#', 102) AND CONVERT(DATETIME,'#enddate#', 102)
        And fname Like '#trim(read_Loans_Funded.fname)#'
        and lname Like '#trim(read_Loans_Funded.lname)#'
              
    </CFQUERY>

<!--- <cfif cgi.REMOTE_ADDR eq '98.233.232.47'>
<cfdump var="#read_Loans_Funded_Person#"><br>
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
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Company</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Company ID</B>
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
                <B>Total Ordered <cfoutput>#DateFormat(startdate, "mm/dd/yyyy")#-#DateFormat(enddate, "mm/dd/yyyy")#</cfoutput></B>
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
                <B>Lender</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>B Last Name</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>B First Name</B>
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
                <B>Orig. Revenue Amt.</B>
                </font>
            </td>
            <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Revenue</B>
                </font>
            </td>
            <cfif form.text_only neq 1>
                     <td>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>&nbsp;</B>
                </font>
            </td>
                     </cfif>
        </tr>
              <cfset revenue_total = 0>
      <CFOUTPUT QUERY="read_Loans_Funded_Person" StartRow="1" MAXROWS="1000000">
<!--- Synechron Commented code 04/01/2013 <CFQUERY datasource="#request.dsn#" NAME="revenue">
           SELECT revenue
           FROM title
           WHERE title_id = #title_id#
        </CFQUERY>
 --->
<!--- Synechron Commented code 04/01/2013 <CFQUERY datasource="#request.dsn#" NAME="read_comp_info" maxrows=1>
           SELECT order_date_adjusted
           FROM title
           WHERE comp_id = #read_Loans_Funded_Person.company_ID#
              order by order_date_adjusted
   </CFQUERY>

 <CFQUERY datasource="#request.dsn#" NAME="total_ordered_in_range" >
           SELECT order_date_adjusted
           FROM title
           WHERE 
              order_date_adjusted between '#DateFormat(startdate, "mm/dd/yyyy")#' and '#DateFormat(enddate, "mm/dd/yyyy")#' 
              and comp_id = #read_Loans_Funded_Person.company_ID#
              order by order_date_adjusted
   </CFQUERY>--->

<!--- Synechron Commented code 04/01/2013 <CFQUERY datasource="#request.dsn#" NAME="total_closed">
           SELECT *
           FROM title
           WHERE (comp_id = #read_Loans_Funded_Person.company_ID#
              and (appraisal_status = 'Loan Closed' or appraisal_status = 'Loan Funded'))
    </CFQUERY>--->

<!--- Synechron Commented code 04/01/2013 <CFQUERY datasource="#request.dsn#" NAME="first_rec" maxrows=1>
           SELECT a_filled_out_date
           FROM title_closing_order_request
           WHERE c_comp_id = #read_Loans_Funded_Person.company_ID#
              order by a_filled_out_date
    </CFQUERY>--->

<form action="Sales_Commission_Report_Revenue_Commit.cfm" method="post"   name="form_#read_Loans_Funded_Person.currentrow#" target="update_window" onSubmit="window.open('','update_window','width=10,height=10');">
 <TR>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    #company#
                    </FONT>
                </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    #Company_ID#
                    </FONT>
                </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    <cfif a_date neq 'NULL' and a_date neq ''>#a_date#</cfif>
                    </font>
                </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    #DateFormat(order_date_adjusted_comp_info, "m/d/yyyy")#
                    </font>
                </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                  #DateFormat(a_filled_out_date, "m/d/yyyy")#
                    </font>
                </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                   #count_total_ordered_in_range#
                    </font>
                </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                   #total_closed#
                    </font>
                </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    #title_id#
                    </FONT>
                </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    #insured#
                    </font>
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
                                  <cfif form.text_only eq 1>
                                  #numberformat(loanamt_float, "______.__")#
                                  <cfelse>
                                  #dollarformat(loanamt_float)#
                                  </cfif>

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
                           <cfif read_Loans_Funded_Person.original_revenue_amt eq '' or read_Loans_Funded_Person.original_revenue_amt eq 'NULL' or NOT IsNumeric(read_Loans_Funded_Person.original_revenue_amt)>
                           <cfset original_revenue_amt = 0>
                           </cfif>
                    <FONT FACE=verdana SIZE=1 color="black">
                    #dollarformat(original_revenue_amt)#
                    </font>
               </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">

                                  <cfif read_Loans_Funded_Person.revenue eq '' or read_Loans_Funded_Person.revenue eq 'NULL' or NOT IsNumeric(read_Loans_Funded_Person.revenue)>
                                  <cfset new_rev = 0>
                                  <cfelse>
                                  <cfset new_rev = read_Loans_Funded_Person.revenue - 120>
                                   <cfif company contains 'National Home Lending'>
                                   <cfset new_rev = new_rev - 230>
                                   </cfif>
									 <cfif company contains 'Chase/RealEC'>
									 <cfset new_rev = read_Loans_Funded_Person.revenue - 175>
									 </cfif>
                                  </cfif>
                                  <cfset revenue_total = revenue_total + new_rev>
                                  <input type="hidden" name="file_id" value="#read_Loans_Funded_Person.title_id#" size="6">
                                  <cfif form.text_only eq 1>
                                  #numberformat(new_rev, "______.__")#
                                  <cfelse>
                                  <input type="text" name="revenue_amount" value="#dollarformat(new_rev)#" size="6">
                                  </cfif>

                    </font>
                </td>
                           <cfif form.text_only neq 1>
                           <td><input type="submit" name="submit" value="commit" ></td>
                           </cfif>
            </tr>
</form>
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
<cfif session.ft_user_id eq 294 or session.ft_user_id eq 56 or session.ft_user_id eq 59 or session.ft_user_id eq 90 or session.ft_user_id eq 248 or session.ft_user_id eq 424 or session.ft_user_id eq 344 or session.ft_user_id eq 374 or session.ft_user_id eq 483 or session.ft_user_id eq 9 or session.ft_user_id eq 472 or session.ft_user_id eq 595>
    <tr>
        <TD colspan="10">
            <FONT FACE=verdana SIZE=3 color="black">
            <B>Inside Sales People</B>
            </font>
        </td>
    </tr>

    
<!---
    <CFQUERY datasource="#request.dsn#" NAME="read_Loans_Funded_Person_Inside">
	    SELECT *
	    FROM sqlLoans_Funded_InsideSales
	    WHERE fl_dateandtime
        Between CONVERT(DATETIME,'#startdate#', 102) AND CONVERT(DATETIME,'#enddate#', 102)
        And fname Like '#trim(read_Loans_Funded_Inside.fname)#'
        and lname Like '#trim(read_Loans_Funded_Inside.lname)#'
    </CFQUERY>--->
    <!---Loop through one outside salesperson at a time --->
    	<CFLOOP QUERY="read_Loans_Funded_Inside">
        <CFQUERY datasource="#request.dsn#" NAME="read_Loans_Funded_Person_Inside">
<!---  Commented by synechron 04/01/2013    SELECT *
           FROM sqlLoans_Funded_InsideSales--->
           <!---Added by sychron 04/01/2013 start--->
           SELECT
           (SELECT top 1 order_date_adjusted
           FROM title d
           WHERE d.comp_id = a.ID
              order by order_date_adjusted) order_date_adjusted_comp_info,
           (SELECT COUNT(*)
           FROM title d
           WHERE  a.ID=d.comp_id and (appraisal_status = 'Loan Closed' or appraisal_status = 'Loan Funded')) total_closed,
           (SELECT top 1 a_filled_out_date      FROM title_closing_order_request d WHERE d.c_comp_id = a.ID       order by a_filled_out_date) a_filled_out_date,
           a.title_id, a.bfirstname1, a.blastname1, a.pcounty, a.pstate, a.loanamt_float, a.order_date_adjusted, a.l_date, a.fl_dateandtime, a.Company, a.a_date, a.revenue             
           FROM sqlLoans_Funded_InsideSales a
	    WHERE fl_dateandtime
        Between CONVERT(DATETIME,'#startdate#', 102) AND CONVERT(DATETIME,'#enddate#', 102)
        And a.fname Like '#trim(read_Loans_Funded_Inside.fname)#'
        and a.lname Like '#trim(read_Loans_Funded_Inside.lname)#'
    </CFQUERY>


    <CFIF #read_Loans_Funded_Person_Inside.RecordCount# gte "1">
        <tr>
            <TD colspan="10">
                <FONT FACE=verdana SIZE=1 color="black">
                <!---04/04/4013 Code added by Synechron for task no. 5 query optimization start--->
                <B><cfoutput>#fname# #lname#</cfoutput></B>
				<!---04/04/4013 Code added by Synechron for task no. 5 query optimization end--->
				<!---04/04/4013 commented by Synechron for task no. 5 query optimization start--->
                <!---<B><CFOUTPUT>#read_Loans_Funded_Inside.fname# #read_Loans_Funded_Inside.lname#</CFOUTPUT></B>--->
				<!---04/04/4013 commented by Synechron for task no. 5 query optimization end--->
                </font>
            </td>

        </tr>
        <TR>
            <td >
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
<!---04/04/4013 commented by Synechron for task no. 5 query optimization start--->
<!---    <CFQUERY datasource="#request.dsn#" NAME="read_comp_info" maxrows=1>
	    SELECT order_date_adjusted
	    FROM title
	    WHERE comp_id = #read_Loans_Funded_Person_Inside.ID#
		order by order_date_adjusted
    </CFQUERY>
    <CFQUERY datasource="#request.dsn#" NAME="total_closed">
	    SELECT *
	    FROM title
	    WHERE (comp_id = #read_Loans_Funded_Person_Inside.ID#
		and (appraisal_status = 'Loan Closed' or appraisal_status = 'Loan Funded'))
    </CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="first_rec" maxrows=1>
	    SELECT a_filled_out_date
	    FROM title_closing_order_request
	    WHERE c_comp_id = #read_Loans_Funded_Person_Inside.ID#
		order by a_filled_out_date
    </CFQUERY>--->
<!---04/04/4013 commented by Synechron for task no. 5 query optimization end--->

            <TR>
                <td><FONT FACE=verdana SIZE=1 color="black">#Company#</font></td>
				 <td><cfif a_date neq 'NULL' and a_date neq ''><FONT FACE=verdana SIZE=1 color="black">#a_date#</font></cfif></td>
				 <!---04/04/4013 commented by Synechron for task no. 5 query optimization start--->
<!---			 <td><FONT FACE=verdana SIZE=1 color="black">#DateFormat(read_comp_info.order_date_adjusted, "m/d/yyyy")#</font></td>
				 <td><FONT FACE=verdana SIZE=1 color="black">#DateFormat(first_rec.a_filled_out_date, "m/d/yyyy")#</font></td>
				 <td><FONT FACE=verdana SIZE=1 color="black">#total_closed.recordcount#</font></td>--->
				 <!---04/04/4013 commented by Synechron for task no. 5 query optimization end--->
				 <!---04/04/4013 commented by Synechron for task no. 5 query optimization start--->
				<td><FONT FACE=verdana SIZE=1 color="black">#DateFormat(order_date_adjusted_comp_info, "m/d/yyyy")#</font></td>
                <td><FONT FACE=verdana SIZE=1 color="black">#DateFormat(a_filled_out_date, "m/d/yyyy")#</font></td>
                <td><FONT FACE=verdana SIZE=1 color="black">#total_closed#</font></td>
				<!---04/04/4013 commented by Synechron for task no. 5 query optimization end--->
                <td><FONT FACE=verdana SIZE=1 color="black">#title_id#</font></td>
                <td><FONT FACE=verdana SIZE=1 color="black">#bfirstname1#</font></td>
                <td><FONT FACE=verdana SIZE=1 color="black">#blastname1#</font></td>
                <td><FONT FACE=verdana SIZE=1 color="black">#pcounty#</font></td>
                <td><FONT FACE=verdana SIZE=1 color="black">#pstate#</font></td>
                <td><FONT FACE=verdana SIZE=1 color="black">#dollarformat(loanamt_float)#</font></td>
                <td><FONT FACE=verdana SIZE=1 color="black">#dateformat(order_date_adjusted,"mm/dd/yyyy")#</font></td>
                <td><FONT FACE=verdana SIZE=1 color="black">#dateformat(l_date,"mm/dd/yyyy")#</font></td>
                <td><FONT FACE=verdana SIZE=1 color="black">#dateformat(fl_dateandtime,"mm/dd/yyyy")#</font></td>
				<cfif read_Loans_Funded_Person_Inside.revenue eq '' or read_Loans_Funded_Person_Inside.revenue eq 'NULL'>
					<cfset new_rev = 0>
				<cfelse>
					<cfset new_rev = read_Loans_Funded_Person_Inside.revenue - 120>
					 <cfif company contains 'National Home Lending'>
					 	<cfset new_rev = new_rev - 230>
					 </cfif>
					 <cfif company contains 'Chase/RealEC'>
					 <cfset new_rev = read_Loans_Funded_Person_Inside.revenue - 175>
					 </cfif>
				</cfif>
					<cfset revenue_total = revenue_total + new_rev>
					<td><FONT FACE=verdana SIZE=1 color="black">#dollarformat(new_rev)#</font></td>

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