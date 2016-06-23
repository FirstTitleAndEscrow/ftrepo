<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>
<script language="javascript">
function refreshParent() 
{
    window.opener.location.reload(true);
}
</script>
</head>

<body onunload="javascript:refreshParent()">







<cfif url.enable eq 1>
<CFQUERY DATASOURCE="#request.dsn#" NAME="update_rec">
Update First_admin set va_employee_temp = va_employee,
va_admin_temp = va_admin,
fairfax_admin_temp = fairfax_admin
where (va_employee = 'True' and role_id <> 24)
</CFQUERY>
<CFQUERY DATASOURCE="#request.dsn#" NAME="update_rec">
Update First_admin set va_employee = 'False',
va_admin = 'False',
fairfax_admin = 'False'
where (va_employee = 'True' and role_id <> 24)
</CFQUERY>
<center>
<h2>RICHMOND<br>
Emergency Access<br>
is now<br>
<font color="green"><h1><u>ON</u></h1></font></h2>
</center>
</cfif>


<cfif url.enable eq 0>
<CFQUERY DATASOURCE="#request.dsn#" NAME="update_rec">
Update First_admin set va_employee = va_employee_temp,
va_admin = va_admin_temp,
fairfax_admin = fairfax_admin_temp
where (va_employee_temp = 'True' and role_id <> 24)
</CFQUERY>
<CFQUERY DATASOURCE="#request.dsn#" NAME="update_rec">
Update First_admin set va_employee_temp = NULL,
va_admin_temp = NULL,
fairfax_admin_temp = NULL
</CFQUERY>
<center>
<h2>RICHMOND<br>
Emergency Access<br>
is now<br>
<font color="red"><h1><u>OFF</u></h1></font></h2>
</center>
</cfif>




</body>
</html>
