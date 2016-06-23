<!---This is the view of last processors--->
<!---Get last person --->
<CFQUERY datasource="#request.dsn#" NAME="read_last_processor">
	SELECT    Title.proc_name
	FROM      Title LEFT OUTER JOIN
              Doc_Closer_Title ON Title.Title_ID = Doc_Closer_Title.TITLE_ID
	WHERE     (LEN(Title.proc_name) > 1)
	ORDER BY Doc_Closer_Title.inst_dateandtime DESC
</CFQUERY>	


<!---This query tells me if the last processor will be in the array.  If the last person is not 
then someone else needs to be assigned as last processor ---> 
<CFQUERY datasource="#request.dsn#" NAME="read_preprocessor">
	SELECT    *
	FROM         dbo.sqlProcessing_Count
	WHERE     (a_user = '#read_last_processor.proc_name#')
	ORDER BY a_user
</CFQUERY>

<CFIF #read_preprocessor.RecordCount# eq 0> <!---This means that the last processor is not in 
	the current array--->

	<!---Create a loop until a last processor is found --->
	<CFSET Countvar = 0>
	<CFSET RowNum = 2>
	<!---Loop until countvar = 1--->
	
	<CFLOOP CONDITION="CountVar eq 0"> 
		<CFPARAM NAME="MaxRows" DEFAULT="1">
		<CFPARAM NAME="StartRow" DEFAULT="#RowNum#">
		
		<CFOUTPUT QUERY="read_last_processor" StartRow="#StartRow#" MAXROWS="#MaxRows#">

		<CFQUERY datasource="#request.dsn#" NAME="read_preprocessor">
			SELECT    *
			FROM         dbo.sqlProcessing_Count
			WHERE     (a_user = '#read_last_processor.proc_name#')
			ORDER BY a_user
		</CFQUERY>
	
		<CFIF #read_preprocessor.recordcount# eq 0>
			<CFSET Countvar = 0>
			<CFSET RowNum = #RowNum# + 1>
		<CFELSE>
			<CFSET Countvar = 1>
			<CFSET LastProcessor = #read_last_processor.proc_name#>
		</CFIF>
		</CFOUTPUT>
	</CFLoop>
</CFIF>