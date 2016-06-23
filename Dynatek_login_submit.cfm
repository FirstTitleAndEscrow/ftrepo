
<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="user_name" DEFAULT="">
<CFPARAM NAME="password" DEFAULT="">
<CFPARAM NAME="comp_id" DEFAULT="">
<CFPARAM NAME="lp_id" DEFAULT="">
<CFPARAM NAME="ExportFile" DEFAULT="">

<CFSET a_insert_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET a_insert_date = #DateFormat(Now(), "mm-dd-yyyy")#>
<!---<CFTRY> --->
<CFQUERY datasource="#request.dsn#" NAME="read_company">
	SELECT *
	FROM companies
	WHERE a_user = '#user_name#' AND a_pass = '#password#' and a_status = 1
</CFQUERY>

<cfoutput>
	<cfset comp_id = #read_company.id#>

</cfoutput>

<CFIF #read_company.recordcount# EQ 0>
	<cfset session.ExportFile = trim(ExportFile)>



	<CFLOCATION URL="https://#cgi.server_name#/Dynatek_login.cfm?a_trigger=1">
<CFELSE>

<HTML>
<BODY>

<CFOUTPUT>This is the Export File - #ExportFile#</CFOUTPUT>
<cfset ExportFile = "#ExportFile#">
<cfset ExportFile = replace(ExportFile,"||","|  |","all")>
<cfset ExportFile = replace(ExportFile,"||","|  |","all")>
<cfset ExportFile = replace(ExportFile,",#chr(166)#","|  ","all")>



<cfloop
	list="#ExportFile#"
	delimiters="#chr(166)##chr(10)#"
	index="str_Line">
	<cfset str_blastname1 =
		listGetAt(str_Line,1,"|")>
	<cfset str_bfirstname1 =
		listGetAt(str_Line,2,"|")>
	<cfset str_bssn1 =
		listGetAt(str_Line,3,"|")>
	<cfset str_bhphone1 =
		listGetAt(str_Line,4,"|")>
	<cfset str_bwphone1 =
		listGetAt(str_Line,5,"|")>
	<cfset str_blastname2 =
		listGetAt(str_Line,6,"|")>
	 <cfset str_bfirstname2 =
		listGetAt(str_Line,7,"|")>
	<cfset str_bssn2 =
		listGetAt(str_Line,8,"|")>
	<cfset str_bhphone2 =
		listGetAt(str_Line,9,"|")>
	<cfset str_bwphone2 =
		listGetAt(str_Line,10,"|")>
	<cfset str_paddressnum =
		listGetAt(str_Line,11,"|")>
	<cfset str_paddress =
		listGetAt(str_Line,12,"|")>
	<cfset str_pcity =
		listGetAt(str_Line,13,"|")>
	<cfset str_pzip =
		listGetAt(str_Line,14,"|")>
	<cfset str_pcounty =
		listGetAt(str_Line,15,"|")>
	<cfset str_loan_number =
		listGetAt(str_Line,16,"|")>
	<cfset str_polender1 =
		listGetAt(str_Line,17,"|")>
	<cfset str_loanamt_float =
		listGetAt(str_Line,18,"|")>
	 <cfset str_purchase =
		listGetAt(str_Line,19,"|")>
	<cfset str_shphone1 =
		listGetAt(str_Line,20,"|")>
	<cfset str_polender2 =
		listGetAt(str_Line,21,"|")>
	<cfset str_slastname1 =
		listGetAt(str_Line,22,"|")>
	<cfset str_plegaldesc =
		listGetAt(str_Line,23,"|")>
	<cfset str_condo_pud =
		listGetAt(str_Line,24,"|")>
	<cfset str_slastname2 =
		listGetAt(str_Line,25,"|")>
	<cfset str_prop_use_type =
		listGetAt(str_Line,26,"|")>
	<cfset str_pstate =
		Left(listGetAt(str_Line,27,"|"),2)>


<cfquery  datasource="#request.dsn#">
	INSERT INTO
		TITLE_TEMP_DYNATEK (blastname1,bfirstname1,bssn1,bhphone1,bwphone1,blastname2,bfirstname2,bssn2,bhphone2,bwphone2,paddressnum,paddress,pcity,pzip,pcounty,loan_number,polender1,loanamt_float,purchase,shphone1,polender2,slastname1,plegaldesc,condo_pud,slastname2,prop_use_type,pstate,a_insert_date,a_insert_time)
				VALUES ('#str_blastname1#','#str_bfirstname1#','#str_bssn1#','#str_bhphone1#','#str_bwphone1#','#str_blastname2#','#str_bfirstname2#','#str_bssn2#','#str_bhphone2#','#str_bwphone2#','#str_paddressnum#','#str_paddress#','#str_pcity#','#str_pzip#','#str_pcounty#','#str_loan_number#','#str_polender1#','#str_loanamt_float#','#str_purchase#','#str_shphone1#','#str_polender2#','#str_slastname1#','#str_plegaldesc#','#str_condo_pud#','#str_slastname2#','#str_prop_use_type#','#str_pstate#','#a_insert_date#','#a_insert_time#')
</cfquery>

</cfloop>

<CFQUERY datasource="#request.dsn#" NAME="get_temp_titleid">
	SELECT Temp_Loan_ID
	FROM TITLE_Temp_Dynatek
	WHERE a_insert_date = '#a_insert_date#' AND a_insert_time = '#a_insert_time#'
</CFQUERY>

<INPUT TYPE="Hidden" NAME="Temp_Loan_ID" VALUE="#get_temp_titleid.Temp_Loan_ID#">



<CFLOCATION URL="https://#cgi.server_name#/Dynatek_acct_mgt.cfm?comp_id=#read_company.ID#&Temp_Loan_ID=#get_temp_titleid.Temp_Loan_ID#">

</cfif></HTML>
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
