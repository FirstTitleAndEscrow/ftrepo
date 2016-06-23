<!---Views --->

<!---Get last person --->
<CFQUERY datasource="#request.dsn#" NAME="read_last_processor">
	Select Title_ID,p_name
	from Title
	where len(p_name)>1
	Order by Title_ID Desc
</CFQUERY>	

<!---List of all preprocessors whether here or not --->
<CFQUERY datasource="#request.dsn#" NAME="read_all_preprocessor">
	Select username
	from First_Admin
	where role_ID = 22
</CFQUERY>	

<!---List of all preprocessors that are here today --->
<CFQUERY datasource="#request.dsn#" NAME="read_all_preprocessor_today">
	SELECT 		sqlFirstTitle_Admin_Today.a_user, First_Admin.role_id
	FROM        sqlFirstTitle_Admin_Today LEFT OUTER JOIN
                First_Admin ON sqlFirstTitle_Admin_Today.a_user = First_Admin.username
	WHERE      (First_Admin.role_id = 22)
</cfquery>
	
<!---List of preprocessors available for work --->
<CFQUERY datasource="#request.dsn#" NAME="read_preprocessor">
	<!---SELECT     	 sqlFirstTitle_Admin_Today.a_user
	FROM         Title RIGHT OUTER JOIN
                 sqlFirstTitle_Admin_Today ON Title.p_name = sqlFirstTitle_Admin_Today.a_user LEFT OUTER JOIN
                 First_Admin ON sqlFirstTitle_Admin_Today.a_user = First_Admin.username
	WHERE        (First_Admin.role_id = 22)
	GROUP BY     sqlFirstTitle_Admin_Today.a_user, Title.p_complete_date
	HAVING       (COUNT(Title.p_name) < 4) AND (Title.p_complete_date IS NULL) --->
	Select * from sqlPreprocessing_Ready_For_Work
</CFQUERY>	

<!---set variables --->
<CFSET a_preprocessor = ArrayNew(1)>
<CFSET a_count = "1">

<!---If there is a pre-processor here today --->
<CFIF #read_all_preprocessor_today.recordcount# gte 1>
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
		Select * from sqlPreprocessors_Today where a_user = '#read_last_processor.p_name#'
		<!---
		SELECT sqlFirstTitle_Admin_Today.a_user
		FROM   Title RIGHT OUTER JOIN
    	sqlFirstTitle_Admin_Today ON Title.p_name = sqlFirstTitle_Admin_Today.a_user LEFT OUTER JOIN
    	First_Admin ON sqlFirstTitle_Admin_Today.a_user = First_Admin.username
		WHERE  (First_Admin.username = '#read_last_processor.p_name#')
		GROUP BY sqlFirstTitle_Admin_Today.a_user, First_Admin.role_id
		HAVING (First_Admin.role_id = 22) AND (COUNT(Title.p_name) < 4)
		--->
	</CFQUERY>
	<!---If there is someone who has less than 1 --->
	<CFIF #read_preprocessor.recordcount# gte 1>
	<!---Is the last processor here right now?--->
	<CFIF #read_preprocessor_last.recordcount# eq 0><!---No  Use the First Processor that is here--->
		<CFSET preproc_name  = '#a_preprocessor[1]#'>
	<CFELSE><!---Yes  Keep the real last processor--->
		<CFSET lastprocessor  = '#read_last_processor.p_name#'>
	</CFIF>

	<CFLOOP FROM="1" TO="#ArrayLen(a_preprocessor)#" INDEX="PPP">
	<!---						<CFOUTPUT>
								#a_preprocessor[PPP]# 
						</CFOUTPUT> --->
	</CFLOOP>

	<CFSET a_count = "1">
	<CFSET length = #ArrayLen(a_preprocessor)#>				
	<!---<CFOUTPUT>Last Processor is #read_last_processor.p_name#<BR>The length of the array is #Length#</CFOUTPUT>--->
	<!---initialize counter --->
	<CFOUTPUT>
	<CFIF #read_preprocessor_last.recordcount# gt 0>
	
		<CFLOOP FROM="1" TO="#ArrayLen(a_preprocessor)#" INDEX="PPP">
		<!---If the last processor's name is equal to the last processor in the array 
		then set it to the first one --->
			<CFIF #trim(lastprocessor)# eq '#trim(a_preprocessor[length])#'>
				<CFSET preproc_name = '#a_preprocessor[1]#'>
				<!---If the last processor's name is equal to the current processor going through the loop
				then set it to the next one --->
			<CFELSEIF #trim(lastprocessor)# eq '#trim(a_preprocessor[a_count])#'>
				<CFSET preproc_name = '#a_preprocessor[a_count + 1]#'>
			</CFIF>		
			
			<CFSET a_count = #a_count# + "1">			

		</CFLOOP>
	</CFIF>
	
	</CFOUTPUT>

<!---What if everyone has more than 1 --->				
<CFELSE>
<!---Send an email to Managers --->
	<CFMAIL SUBJECT="Pre-Processing"
		FROM="webmaster@firsttitleservices.com"
		TO="dmiller@firsttitleservices.com"
		type="HTML">

All Processors in for the day currently have more than 3 a piece.
	</CFMAIL>
	<!---Under the assumption that everyone has over 3 we now distribute them that way. --->
	<!---Distribute to each person--->
	<!--Query to distribute --->
	<CFQUERY datasource="#request.dsn#" NAME="read_preprocessor">
		SELECT     sqlFirstTitle_Admin_Today.a_user
		FROM         Title RIGHT OUTER JOIN
                      sqlFirstTitle_Admin_Today ON Title.p_name = sqlFirstTitle_Admin_Today.a_user LEFT OUTER JOIN
                      First_Admin ON sqlFirstTitle_Admin_Today.a_user = First_Admin.username
		WHERE     (First_Admin.role_id = 22)
		GROUP BY sqlFirstTitle_Admin_Today.a_user, Title.p_complete_date
		HAVING      (Title.p_complete_date IS NULL)
	</CFQUERY>
	<!---Get the last person --->
	<CFSET lastprocessor  = '#read_last_processor.p_name#'>
	
	<!--Create an array with everyone in it --->
	<!---set variables --->
	<CFSET a_preprocessor = ArrayNew(1)>
	<CFSET a_count = "1">

	<!--Query with variables to go through the loop --->
	<CFOUTPUT QUERY="read_preprocessor">
		<CFSET a_preprocessor[a_count] = #a_user#>
		<CFSET a_count = #a_count# + "1">
	</CFOUTPUT>
	
	<CFLOOP FROM="1" TO="#ArrayLen(a_preprocessor)#" INDEX="PPP">
					<!---	<CFOUTPUT>
								#a_preprocessor[PPP]# 
						</CFOUTPUT> --->
	</CFLOOP>
	
	<CFSET a_count = "1">
	<CFSET length = #ArrayLen(a_preprocessor)#>			
	
	<CFLOOP FROM="1" TO="#ArrayLen(a_preprocessor)#" INDEX="PPP">
		<!---If the last processor's name is equal to the last processor in the array 
		then set it to the first one --->
			<CFIF #trim(lastprocessor)# eq '#trim(a_preprocessor[length])#'>
				<CFSET preproc_name = '#a_preprocessor[1]#'>
				<!---If the last processor's name is equal to the current processor going through the loop
				then set it to the next one --->
			<CFELSEIF #trim(lastprocessor)# eq '#trim(a_preprocessor[a_count])#'>
				<CFSET preproc_name = '#a_preprocessor[a_count + 1]#'>
			</CFIF>		
			
			<CFSET a_count = #a_count# + "1">			

		</CFLOOP>
		
</CFIF>
<CFELSE>
<!---If noone is here --->
	<CFSET a_preprocessor = ArrayNew(1)>
	<CFSET a_count = "1">

	<CFOUTPUT QUERY="read_all_preprocessor">
		<CFSET a_preprocessor[a_count] = #a_user#>
		<CFSET a_count = #a_count# + "1">
	</CFOUTPUT>

	<CFSET lastprocessor = #read_last_processor.p_name#>

	<CFLOOP FROM="1" TO="#ArrayLen(a_preprocessor)#" INDEX="PPP">
		<!---If the last processor's name is equal to the last processor in the array 
		then set it to the first one --->
			<CFIF #trim(lastprocessor)# eq '#trim(a_preprocessor[length])#'>
				<CFSET preproc_name = '#a_preprocessor[1]#'>
				<!---If the last processor's name is equal to the current processor going through the loop
				then set it to the next one --->
			<CFELSEIF #trim(lastprocessor)# eq '#trim(a_preprocessor[a_count])#'>
				<CFSET preproc_name = '#a_preprocessor[a_count + 1]#'>
			</CFIF>		
			
			<CFSET a_count = #a_count# + "1">			

		</CFLOOP>
	<!--- <CFMAIL SUBJECT="Pre-Processing"
		FROM="webmaster@firsttitleservices.com"
		TO="htravis@firsttitleservices.com"
		type="HTML">

There are no pre-processors in the office at this today but the file was assigned to - #preproc_name#
	</CFMAIL>	 --->	

</CFIF>
<CFOUTPUT>The Pre-Processor is #preproc_name#</CFOUTPUT>
</body>
</html>