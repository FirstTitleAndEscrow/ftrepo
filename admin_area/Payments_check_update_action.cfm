<CFQUERY datasource="#request.dsn#" >
    Insert into Checks_Detail
        (Checks_ID,
        Billing_Detail_ID,
        checks_detail_payment,
        checks_detail_date)
    Values
        (#Checks_id#,
         #Billing_Detail_ID#,
         #checks_detail_payment#,
         getdate())
                  
</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>Untitled</title>
</head>
<body>

</body>
</html>
