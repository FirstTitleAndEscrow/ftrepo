<!---Harry Travis 07/20/2004 --->
<CFTRY>

<CFQUERY datasource="#request.dsn#" NAME="read_vendor_management_today">
	SELECT     sqlFirstTitle_Admin_Today.a_user, First_Admin.role_id, First_Admin.fname, First_Admin.lname, First_Admin.ID
	FROM       sqlFirstTitle_Admin_Today LEFT OUTER JOIN
               First_Admin ON sqlFirstTitle_Admin_Today.a_user = First_Admin.username
	WHERE     (First_Admin.role_id IN(5,22)) 
</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_vendor_management_all">
	SELECT     ID, username, role_id, fname, lname,role_mgr
	FROM         First_Admin
	WHERE     (role_id IN (5,22))
</CFQUERY>		

<CFQUERY datasource="#request.dsn#" NAME="read_last_vendor_management">
	SELECT     preprocessor_Start_Datetime, preprocessor_ID
	FROM       tblUser_Roles
	GROUP BY preprocessor_Start_Datetime, preprocessor_ID
	ORDER BY preprocessor_Start_Datetime DESC
</CFQUERY>

<CFSET a_vendmgmt = ArrayNew(1)>
<CFSET a_count = "1">

<!---If there is only one person total in preprocessing then that person doesn't need to go through the loop either.--->
<CFIF #read_vendor_management_all.recordcount# eq 1>
 	<CFSET preprocessing = #read_vendor_management_all.ID#>
<CFELSE>
<!---If there is only one person here today then there is no sense in going through the loop--->
	<CFIF #read_vendor_management_today.recordcount# eq 1>
		<!---The ID of the one person that is here--->
		<CFSET preprocessing = #read_vendor_management_today.ID#>
		<!---If noone is here --->
		<!---Create an array of everyone in vendor management--->
	<CFELSEIF #read_vendor_management_today.recordcount# eq 0>
		<CFOUTPUT QUERY="read_vendor_management_all">
			<CFSET a_vendmgmt[a_count] = #ID#>
			<CFSET a_count = #a_count# + "1">
		</CFOUTPUT>

		<CFSET length = #ArrayLen(a_vendmgmt)#>		
		<CFSET a_count = 1>
		<CFSET preprocessing = "#a_vendmgmt[1]#">
		<CFLOOP FROM="1" TO="#ArrayLen(a_vendmgmt)#" INDEX="PPP">
			<CFIF #trim(read_last_vendor_management.preprocessor_ID)# eq #trim(a_vendmgmt[length])#>
				<CFSET preprocessing = "#a_vendmgmt[1]#">
			<CFELSEIF #trim(read_last_vendor_management.preprocessor_ID)# eq #trim(a_vendmgmt[a_count])#>
				<CFSET preprocessing = "#a_vendmgmt[a_count + 1]#">
			</CFIF>	
			<CFSET a_count = #a_count# + "1">							
		</CFLOOP>

	<CFELSEIF #read_vendor_management_today.recordcount# gt 1>
		<CFOUTPUT QUERY="read_vendor_management_today">
			<CFSET a_vendmgmt[a_count] = #ID#>
			<CFSET a_count = #a_count# + "1">
		</CFOUTPUT>
		
		<CFSET length = #ArrayLen(a_vendmgmt)#>		
		<CFSET a_count = 1>
        <CFSET preprocessing = "#a_vendmgmt[1]#">    
		<CFLOOP FROM="1" TO="#ArrayLen(a_vendmgmt)#" INDEX="PPP">
			<CFIF #read_last_vendor_management.preprocessor_ID# eq #a_vendmgmt[length]#>
				<CFSET preprocessing = "#a_vendmgmt[1]#">
			<CFELSEIF #read_last_vendor_management.preprocessor_ID# eq #a_vendmgmt[a_count]#>
				<CFSET preprocessing = "#a_vendmgmt[a_count + 1]#">
			</CFIF>
				<CFSET a_count = #a_count# + "1">					
		</CFLOOP>
	</CFIF>
</CFIF>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	
</head>

<body><!---
<CFOUTPUT>#preprocessing#<br>Today's Record Count is #read_vendor_management_today.recordcount#<br>the last vm person was -#read_last_vendor_management.preprocessor_ID#
<br>The last person in the array is #a_vendmgmt[length]#<br>The First Person in the array is #a_vendmgmt[1]#
 </CFOUTPUT>
--->
</body>
</html>
<CFCATCH>
    <CFMAIL
				TO="webmaster@firsttitleservices.com"
				FROM="webmaster@firsttitleservices.com"
				SERVER="127.0.0.1"
				Subject="Preprocessing Error"
				TIMEOUT="600"
				type="HTML"
				>

Go to admin_area/includes/preprocessing2.cfm
It is not working.
    </CFMAIL>
</CFCATCH>
</cftry>
