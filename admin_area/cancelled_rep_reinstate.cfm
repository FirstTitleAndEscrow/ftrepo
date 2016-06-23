<CFQUERY datasource="#request.dsn#" NAME="read_user">
	Select fname, lname
	from first_admin 
	where ID = #url.uid#
</CFQUERY>

<cfif #a_trigger# eq "1"><!---Title--->
	
	<CFQUERY datasource="#request.dsn#">		
		Update Title
		set cancelled = null,
		original_order_date = order_date,
		order_date = '#DateFormat(Now(), "mm/dd/yyyy")#'
		where Title_ID = #order_id# and cancelled = 1
	</CFQUERY>		

	<CFQUERY datasource="#request.dsn#">		
		INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#trim(read_user.fname)#', '#trim(read_user.lname)#', #order_ID#, 'Order Reinstated.','#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
	</CFQUERY>

<CFELSEIF #a_trigger# eq "2"><!---Property--->
	<CFQUERY datasource="#request.dsn#">	
		Update Property
		set cancelled = null,
		original_order_date = order_date,
		order_date = '#DateFormat(Now(), "mm/dd/yyyy")#'
		where Prop_ID = #order_id# and cancelled = 1
	</CFQUERY>

	<CFQUERY datasource="#request.dsn#">		
		INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#trim(read_user.fname)#', '#trim(read_user.lname)#', #order_id#, 'Order Reinstated.','#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'P', '1', '1')		
	</CFQUERY>
</CFIF>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Reinstate</title>
</head>

<body>
<CFOUTPUT>
Order Number #URL.Order_ID# has been reinstated and a comment has been added.
</CFOUTPUT>

</body>
</html>
