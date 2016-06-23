<CFQUERY datasource="#request.dsn#" NAME="get_procs">
	SELECT     * from users where streamline_emp = 'True' and pname <> 'Rick Jermain'
</CFQUERY>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>Streamline Loan Processor Report</title>
</head>
<body>
<table>
    <tr>
        <TD colspan="10">
            <FONT FACE=verdana SIZE=3 color="black">
            <B><CENTER>Streamline Loan Processor Report</B></CENTER>
            </FONT>
        </td>
    </tr>
    <tr>
        <TD colspan="10">
         <BR><BR>
        </td>
    </tr>

    <!---Loop through one outside salesperson at a time --->
<CFLOOP QUERY="get_procs">
    <CFQUERY datasource="#request.dsn#" NAME="get_files">
	    SELECT *
	    FROM title where (pname = '#get_procs.lp_fname# #get_procs.lp_lname#' or pname = '#get_procs.lp_fname##get_procs.lp_lname#')
		and appraisal_status <> 'Loan Closed'
		and appraisal_status <> 'Loan Funded'
		and appraisal_status <> 'Loan Closed-Seller Rep'	
		and (cancelled is NULL or cancelled = '')	
		and comp_id <> '100'
		order by title_id
    </CFQUERY>
    
    <CFIF #get_files.RecordCount# gte "1">
        <tr>
            <TD colspan="8">
                <FONT FACE=verdana SIZE=2 color="black">
                <B><CFOUTPUT>#get_procs.lp_fname# #get_procs.lp_lname#</CFOUTPUT></B>
                </font>
            </td>
            
            
        </tr>
        <TR>
            <td width=200>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Company</B>
                </font>
            </td>
            <td width=100>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Order Number</B>
                </font>
            </td>
            <td width=200>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Address</B>
                </font>
            </td>
            <td width=200>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Closing Date</B>
                </font>
            </td>
            <td width=100>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Busted Date</B>
                </font>
            </td>
            <td width=50>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Loan Number</B>
                </font>
            </td>
            <td width=100>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Order Date</B>
                </font>
            </td>
            <td width=100>
                <FONT FACE=verdana SIZE=1 color="black">
                <B>Seller Rep</B>
                </font>
            </td>
        </tr>
		<cfoutput query="get_files">
		    <CFQUERY datasource="#request.dsn#" NAME="get_comp">
	    SELECT *
	    FROM companies where id = '#get_files.comp_id#'
    </CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_busted_date">
	    SELECT *
	    FROM title_closing_order_Request where title_id = #get_files.title_id#
    </CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_close_date">
	    SELECT *
	    FROM eventlist where title_id = #get_files.title_id#
    </CFQUERY>
            <TR <cfif get_files.seller_rep eq 'True'>bgcolor=cccccc<cfelse>bgcolor=FFFFFF</cfif>>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    #get_comp.Company#
                    </font>
                </td>
                <td >
                    <FONT FACE=verdana SIZE=1 color="black">
                    #title_id#
                    </FONT>
                </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    #paddress#, #pcity#, #pstate# #pzip#
                    </font>
                </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    <cfif IsDate(get_busted_date.a_Req_Closing_Date) and get_busted_date.a_Req_Closing_Date neq 'NULL'>
					#dateFormat(get_busted_date.a_Req_Closing_Date, 'm/d/yyyy')#
					</cfif>
                    </font>
                </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    <cfif IsDate(get_busted_date.contract_busted_date) and get_busted_date.contract_busted_date neq 'NULL'>
					#dateFormat(get_busted_date.contract_busted_date, 'm/d/yyyy')#
					</cfif>
                    </font>
               </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    #loan_number#
                    </font>
                </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    #dateformat(order_date_adjusted,"mm/dd/yyyy")#
                    </font>
                </td>
                <td>
                    <FONT FACE=verdana SIZE=1 color="black">
                    <cfif get_files.seller_rep eq 'True'>YES<cfelse>&nbsp;</cfif>
                    </font>    
                </td>
            </tr>
        </CFOUTPUT>
        <TR>
            <TD colspan="11">
                <HR>
            </TD>

        </tr>
        </CFIF> 
    </CFLoop>

</body>
</html>
