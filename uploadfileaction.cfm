<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="user_name" DEFAULT="">
<CFPARAM NAME="lo_id" DEFAULT="0">
<CFPARAM NAME="comp_id" DEFAULT="">
<CFPARAM NAME="user_id_1" DEFAULT="">
<CFPARAM NAME="title" DEFAULT="1">
<CFPARAM NAME="appraisal" DEFAULT="0">
<CFPARAM NAME="property" DEFAULT="0">
<CFPARAM NAME="other" DEFAULT="0">
<CFPARAM NAME="emp" DEFAULT="0">

<CFSET a_insert_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET a_insert_date = #DateFormat(Now(), "mm-dd-yyyy")#>
<HTML>
<HEAD>
    <TITLE>upload File</TITLE>
</HEAD>
<body>
<H2>upload File</H2>

<CFFILE ACTION="upload"
        DESTINATION="C:\Inetpub\wwwroot\Clients\firsttitleservices.com\www\uploaded_files\Calyx\"
        NAMECONFLICT="overwrite"
        FILEFIELD="Filetoupload">


<!--Read File --->
	<cffile ACTION="Read"
    FILE="C:\Inetpub\wwwroot\Clients\firsttitleservices.com\www\uploaded_files\Calyx\#ServerFile#"
    VARIABLE="ExportFile">

	<!-- Parse variables to allow loop to read output correctly -->
<cfset ExportFile = ExportFile>
<cfset ExportFile = replace(ExportFile,",,",",  ,","all")>
<cfset ExportFile = replace(ExportFile,",,",",  ,","all")>
<cfset ExportFile = replace(ExportFile,",#chr(13)#",",  ","all")>



<cfloop
	list="#ExportFile#"
	delimiters="#chr(13)##chr(10)#"
	index="str_Line">

	<cfset str_loan_number =
		listGetAt(str_Line,1,",")>
	<cfset str_blastname1 =
		listGetAt(str_Line,2,",")>
	<cfset str_bfirstname1 =
		listGetAt(str_Line,3,",")>
	<cfset str_bssn1 =
		listGetAt(str_Line,4,",")>
	<cfset str_bhphone1 =
		listGetAt(str_Line,5,",")>
	<cfset str_bwphone1 =
		listGetAt(str_Line,6,",")>
	<cfset str_blastname2 =
		listGetAt(str_Line,7,",")>
	 <cfset str_bfirstname2 =
		listGetAt(str_Line,8,",")>
	<cfset str_bssn2 =
		listGetAt(str_Line,9,",")>
	<cfset str_bhphone2 =
		listGetAt(str_Line,10,",")>
	<cfset str_bwphone2 =
		listGetAt(str_Line,11,",")>
	<cfset str_slastname1 =
		listGetAt(str_Line,12,",")>
	<cfset str_sfirstname1 =
		listGetAt(str_Line,13,",")>
	<cfset str_shphone1 =
		listGetAt(str_Line,14,",")>
	<cfset str_slastname2 =
		listGetAt(str_Line,15,",")>
	<cfset str_sfirstname2 =
		listGetAt(str_Line,16,",")>
	<cfset str_paddress =
		listGetAt(str_Line,17,",")>
	<cfset str_pcity =
		listGetAt(str_Line,18,",")>
	 <cfset str_pstate =
		Left(listGetAt(str_Line,19,","),2)>
	<cfset str_pzip =
		listGetAt(str_Line,20,",")>
	<cfset str_pcounty =
		listGetAt(str_Line,21,",")>
	<cfset str_plegaldesc =
		listGetAt(str_Line,22,",")>
	<cfset str_prop_use_type =
		listGetAt(str_Line,23,",")>
	<cfset str_a_comment =
		listGetAt(str_Line,24,",")>
	<cfset str_polender1 =
		listGetAt(str_Line,25,",")>
	<cfset str_poacctno1 =
		listGetAt(str_Line,26,",")>
	<cfset str_polender2 =
		listGetAt(str_Line,27,",")>
	<cfset str_poacctno2 =
		listGetAt(str_Line,28,",")>
	<cfset str_loanamt_float =
		listGetAt(str_Line,29,",")>
	 <cfset str_purchase =
		listGetAt(str_Line,30,",")>
	<cfset str_loan_type_111 =
		listGetAt(str_Line,31,",")>
	<cfset str_loan_program_333 =
		listGetAt(str_Line,32,",")>
	<cfset str_searchtype =
		listGetAt(str_Line,33,",")>
	<cfset str_insured =
		listGetAt(str_Line,34,",")>

<!---bssn1, bssn2 need the dashes trimmed--->
<CFIF #len(str_bssn1)# gt 9>
	<CFSET strSocSecNum = "#str_bssn1#">
	<cfset str_bssn1 = #replace(strSocSecNum,"-","" ,"all")#>
</CFIF>

<CFIF #len(str_bssn2)# gt 9>
	<CFSET strSocSecNum = "#str_bssn2#">
	<cfset str_bssn2 = #replace(strSocSecNum,"-","" ,"all")#>
</CFIF>

<cfquery  datasource="#request.dsn#">
			INSERT INTO
				TITLE_TEMP (loan_number,blastname1,bfirstname1,bssn1,bhphone1,bwphone1,blastname2,bfirstname2,bssn2,bhphone2,bwphone2,slastname1,sfirstname1,shphone1,slastname2,sfirstname2,paddress,pcity,pstate,pzip,pcounty,plegaldesc,prop_use_type,a_comment,polender1,poacctno1,polender2,poacctno2,loanamt_float,purchase,loan_type_111,loan_program_333,searchtype,insured,a_insert_date,a_insert_time)
				VALUES ('#str_loan_number#','#str_blastname1#','#str_bfirstname1#','#str_bssn1#','#str_bhphone1#','#str_bwphone1#','#str_blastname2#','#str_bfirstname2#','#str_bssn2#','#str_bhphone2#','#str_bwphone2#','#str_slastname1#','#str_sfirstname1#','#str_shphone1#','#str_slastname2#','#str_sfirstname2#','#str_paddress#','#str_pcity#','#str_pstate#','#str_pzip#','#str_pcounty#','#str_plegaldesc#','#str_prop_use_type#','#str_a_comment#','#str_polender1#','#str_poacctno1#','#str_polender2#','#str_poacctno2#','#str_loanamt_float#','#str_purchase#','#str_loan_type_111#','#str_loan_program_333#','#str_searchtype#','#str_insured#','#a_insert_date#','#a_insert_time#')
</cfquery>

</cfloop>

 <CFQUERY datasource="#request.dsn#" NAME="get_temp_titleid">
	SELECT Temp_Loan_ID
	FROM TITLE_Temp
	WHERE a_insert_date = '#a_insert_date#' AND a_insert_time = '#a_insert_time#'
</CFQUERY>

<!---If for some reason the Calyx User was able to get to this screen without a state, county, or Zip Listed then they must select that
	information before going any further. --->

<CFQUERY datasource="#request.dsn#" Name="get_State_City">
	Select pcity, pstate, pzip, pcounty
	from TITLE_TEMP
	where Temp_Loan_ID = #get_temp_titleid.Temp_Loan_ID#
</CFQUERY>

<CFIF #LEN(get_State_City.pcity)# eq 2 or  #LEN(get_State_City.pzip)# eq 2 or #LEN(get_State_City.pcounty)# eq 2>
	<CFOUTPUT>
		<CFLOCATION URL="https://#cgi.server_name#/calyx_form_title_request_addr.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&title=#title#&appraisal=#appraisal#&Temp_Loan_ID=#get_temp_titleid.Temp_Loan_ID#&zip_trigger=0&emp=#emp#">
	</CFOUTPUT>
</CFIF>

<INPUT TYPE="Hidden" NAME="Temp_Loan_ID" VALUE="#get_temp_titleid.Temp_Loan_ID#">

<CFLOCATION URL="https://#cgi.server_name#/form_calyx_title_request.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&title=#title#&appraisal=#appraisal#&Temp_Loan_ID=#get_temp_titleid.Temp_Loan_ID#&emp=#emp#">

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
</HTML>