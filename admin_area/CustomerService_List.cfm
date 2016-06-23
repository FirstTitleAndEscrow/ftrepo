<!---This is a Group By to get all of the Customer Service Reps--->
<cfquery datasource="#request.dsn#" Name="Employee_Name_Group_By">
    SELECT     TOP 100 PERCENT intCustServ
    FROM         dbo.Companies
    GROUP BY intCustServ, LEN(intCustServ)
    HAVING      (LEN(intCustServ) > 0)
</CFquery>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>Customer Service Client List</title>
</head>
<body>
<table>

    <tr>
        <td colspan="2">
            <B>Customer Service List with First Title Clients</B>
        </td>
    </tr>
    
    <CFLOOP QUERY="Employee_Name_Group_By">
    <cfquery datasource="#request.dsn#" Name="Read_Name">
    Select fname + ' ' + lname  as name
    from First_Admin where id = #Employee_Name_Group_By.intCustServ#
    </CFquery>

    <TR>
        <td>
            <BR>
        </td>
    </TR>
    <tr>
        <td colspan="2">
           <CFOUTPUT><B>#Read_Name.name#</b></CFOUTPUT>  
        </td>
    </tr>
    
    <cfquery datasource="#request.dsn#" Name="Employee_Name">
    SELECT     First_Admin.fname, First_Admin.lname, Companies.company, First_Admin.ID AS Employee_ID, 
               Companies.ID AS Company_ID
    FROM       Companies INNER JOIN
               First_Admin ON Companies.intCustServ = First_Admin.ID
    WHERE     intCustServ = #intCustServ#
    ORDER BY First_Admin.lname, First_Admin.fname, Companies.company
</CFQUERY>
    <CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="Employee_Name">
    <tr>
        
        <td>
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        </td>
        <td>
            <a href="./client_modify_display.cfm?uid=#uid#&al=#al#&company_id=#Company_ID#">
                #company#
            </a>
        </td>
    </tr>
    </CFOUTPUT> 
    </CFLoop>       
</table>


</body>
</html>
