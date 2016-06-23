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
	SELECT     	sqlFirstTitle_Admin_Today.a_user, First_Admin.role_id
	FROM        First_Admin RIGHT OUTER JOIN
                sqlFirstTitle_Admin_Today ON First_Admin.username = sqlFirstTitle_Admin_Today.a_user
	WHERE     (First_Admin.role_id = 22)
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
	SELECT     	sqlFirstTitle_Admin_Today.a_user, First_Admin.role_id
	FROM        First_Admin RIGHT OUTER JOIN
                sqlFirstTitle_Admin_Today ON First_Admin.username = sqlFirstTitle_Admin_Today.a_user
	WHERE     (First_Admin.role_id = 22) and (First_Admin.username = #read_last_processor.p_name#)
</CFQUERY>
<!---Is the last processor here right now?--->
<CFOUTPUT>This is the match#read_preprocessor_last.a_user#</CFOUTPUT>



<CFLOOP FROM="1" TO="#ArrayLen(a_preprocessor)#" INDEX="PPP">
						<CFOUTPUT>
								#a_preprocessor[PPP]#
						</CFOUTPUT>
				</CFLOOP>
<CFSET a_count = "1">
<CFSET length = #ArrayLen(a_preprocessor)#>
<CFOUTPUT>Last Processor is #read_last_processor.p_name#<BR>The length of the array is #Length#</CFOUTPUT>
<!---initialize counter --->

<CFLOOP FROM="1" TO="#ArrayLen(a_preprocessor)#" INDEX="PPP">
	<!---If the last processor's name is equal to the last processor in the array
	then set it to the first one --->
	<CFIF #read_last_processor.p_name# eq '#a_preprocessor[length]#'>
		<CFSET ctc_name = '#a_preprocessor[1]#'>
	<!---If the last processor's name is equal to the current processor going through the loop
	then set it to the next one --->
	<CFELSEIF #read_last_processor.p_name# eq '#a_preprocessor[a_count]#'>
		<CFSET ctc_name = '#a_preprocessor[a_count+ 1]#'>
	</CFIF>

	<CFSET a_count = #a_count# + "1">

</CFLOOP>

	<CFOUTPUT>This gets assigned to - #ctc_name#</CFOUTPUT>
<script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body>
</html>
