<!---Views --->

<!---Get last person --->
<CFQUERY datasource="#request.dsn#" NAME="read_last_processor">
	Select Title_ID,p_name
	from Title
	where (p_name Is Not Null)
	Order by Title_ID Desc
</CFQUERY>	

<!---List of processors available for work --->
<CFQUERY datasource="#request.dsn#" NAME="read_preprocessor">
	SELECT  sqlFirstTitle_Admin_Today.a_user
	FROM    Title RIGHT OUTER JOIN
            sqlFirstTitle_Admin_Today ON Title.p_name = sqlFirstTitle_Admin_Today.a_user LEFT OUTER JOIN
            First_Admin ON sqlFirstTitle_Admin_Today.a_user = First_Admin.username
	WHERE     (First_Admin.role_id = 22)
	GROUP BY sqlFirstTitle_Admin_Today.a_user
	HAVING      (COUNT(Title.p_name) < 5)
</CFQUERY>	

<!---set variables --->
<CFSET a_preprocessor = ArrayNew(1)>
<CFSET a_count = "1">

<!--Query with variables to go through the loop --->
<CFOUTPUT QUERY="read_preprocessor">
	<CFSET a_preprocessor[a_count] = #a_user#>
	<CFSET a_count = #a_count# + "1">
</CFOUTPUT>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Test Page</title>
</head>	

<body>
<!---If the last processor is not in at this time then change last processor to the first person in the list --->
<!---This list lets me know if the last processor is in for the day --->
<CFQUERY datasource="#request.dsn#" NAME="read_preprocessor_last">
	SELECT sqlFirstTitle_Admin_Today.a_user
	FROM   Title RIGHT OUTER JOIN
    sqlFirstTitle_Admin_Today ON Title.p_name = sqlFirstTitle_Admin_Today.a_user LEFT OUTER JOIN
    First_Admin ON sqlFirstTitle_Admin_Today.a_user = First_Admin.username
	WHERE  (First_Admin.username = '#read_last_processor.p_name#')
	GROUP BY sqlFirstTitle_Admin_Today.a_user, First_Admin.role_id
	HAVING (First_Admin.role_id = 22) AND (COUNT(Title.p_name) < 5)
	
</CFQUERY>
<!---If there is someone who has less than 5 --->
<CFIF #read_preprocessor.recordcount# gt 1>
	<!---Is the last processor here right now?--->
	<CFIF #read_preprocessor_last.recordcount# eq 0><!---No  Use the First Processor that is here--->
		<CFSET ctc_name  = '#a_preprocessor[1]#'>
	<CFELSE><!---Yes  Keep the real last processor--->
		<CFSET lastprocessor  = '#read_last_processor.p_name#'>
	</CFIF>

	<CFLOOP FROM="1" TO="#ArrayLen(a_preprocessor)#" INDEX="PPP">
						<CFOUTPUT>
								#a_preprocessor[PPP]# 
						</CFOUTPUT>
	</CFLOOP>

	<CFSET a_count = "1">
	<CFSET length = #ArrayLen(a_preprocessor)#>				
	<CFOUTPUT>Last Processor is #read_last_processor.p_name#<BR>The length of the array is #Length#</CFOUTPUT>
	<!---initialize counter --->
	<CFOUTPUT>
	<CFIF #read_preprocessor_last.recordcount# gt 0>
	
		<CFLOOP FROM="1" TO="#ArrayLen(a_preprocessor)#" INDEX="PPP">
		<!---If the last processor's name is equal to the last processor in the array 
		then set it to the first one --->
			<CFIF #lastprocessor# eq '#a_preprocessor[length]#'>
				<CFSET ctc_name = '#a_preprocessor[1]#'>
				<!---If the last processor's name is equal to the current processor going through the loop
				then set it to the next one --->
			<CFELSEIF #lastprocessor# eq '#a_preprocessor[a_count]#'>
				<CFSET a_count = #a_count# + "1">			
				<CFSET ctc_name = '#a_preprocessor[a_count]#'>
				<CFSET a_count = #a_count# - "1">			
			</CFIF>		
	
			<CFSET a_count = #a_count# + "1">			

		</CFLOOP>
	</CFIF>
	</CFOUTPUT>

<!---What if everyone has more than 4 --->				
<CFELSE>
<!---Send an email to Pam --->
	<!--- <CFMAIL SUBJECT="Pre-Processing"
		FROM="webmaster@firsttitleservices.com"
		TO="htravis@firsttitleservices.com"
		type="HTML">

All Processors in for the day currently have more than 4 a piece.
	</CFMAIL> --->
	<!---Under the assumption that everyone has over 4 we now distribute them that way. --->

	<CFQUERY datasource="#request.dsn#" NAME="read_preprocessor_over">
		SELECT  sqlFirstTitle_Admin_Today.a_user
		FROM    Title RIGHT OUTER JOIN
        sqlFirstTitle_Admin_Today ON Title.p_name = sqlFirstTitle_Admin_Today.a_user LEFT OUTER JOIN
        First_Admin ON sqlFirstTitle_Admin_Today.a_user = First_Admin.username
		WHERE     (First_Admin.role_id = 22)
		GROUP BY sqlFirstTitle_Admin_Today.a_user
	</CFQUERY>	

	<CFSET a_preprocessor_over = ArrayNew(1)>
	<CFSET a_count = "1">

	<CFOUTPUT QUERY="read_preprocessor_over">
		<CFSET a_preprocessor_over[a_count] = #a_user#>
		<CFSET a_count = #a_count# + "1">
	</CFOUTPUT>
	
	<CFSET lastprocessor  = '#read_last_processor.p_name#'>
	
	<CFSET a_count = "1">
	<CFSET length = #ArrayLen(a_preprocessor_over)#>				
	
	<CFLOOP FROM="1" TO="#ArrayLen(a_preprocessor_over)#" INDEX="PPP">
		<!---If the last processor's name is equal to the last processor in the array 
		then set it to the first one --->
		<CFIF #lastprocessor# eq '#a_preprocessor_over[length]#'>
			<CFSET ctc_name = '#a_preprocessor_over[1]#'>
		</CFIF>
		
		<CFIF #Trim(lastprocessor)# eq #Trim(a_preprocessor_over[a_count])#>
			<CFSET ctc_name = '#a_preprocessor_over[a_count + 1]#'>
		</CFIF>		
		
		<CFSET a_count = #a_count# + "1">			

	</CFLOOP>

</CFIF>



	



  

</body>
</html>