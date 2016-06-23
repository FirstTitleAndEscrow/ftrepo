<CFQUERY datasource="#request.dsn#" >
    Insert into Checks
        (company_ID,
        checks_number,
        checks_date,
        checks_amount)
    Values
        (#company_id#,
         #checks_number#,
         getdate(),
         #checks_amount#
            )
</CFQUERY>
<!---Get Primary Key from Checks Table and pass into URL--->
<CFQUERY datasource="#request.dsn#" Name="Get_Check">
    Select Checks_ID
    from Checks
    where company_ID = #company_id#
    and checks_number = #checks_number#
    and checks_amount = #checks_amount#
</CFQUERY>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>Untitled</title>
</head>
<body>
<!---<cfoutput>
company_id #company_id#
check number #checks_number#
checks date #Now()#
Checks amount #checks_amount#
</cfoutput>--->
<CFOUTPUT>
<CFLOCATION URL="https://#cgi.server_name#/admin_area/payments_check_orders.cfm?ID=#Get_Check.Checks_ID#">
</CFOUTPUT>
</body>
</html>
