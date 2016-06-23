<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="user_name" DEFAULT="">
<CFPARAM NAME="lo_id" DEFAULT="0">
<CFPARAM NAME="comp_id" DEFAULT="">
<CFPARAM NAME="user_id_1" DEFAULT="">
<CFPARAM NAME="title" DEFAULT="1">
<CFPARAM NAME="appraisal" DEFAULT="0">
<CFPARAM NAME="property" DEFAULT="0">
<CFPARAM NAME="other" DEFAULT="0">

<CFSET Temp.CFID = Session.CFID>
<CFSET Temp.CFTOKEN = Session.CFTOKEN>
<CFSET Temp.SESSIONID = Session.SESSIONID>
<CFSET Temp.URLTOKEN = Session.URLTOKEN>

<HTML>
<HEAD>
    <TITLE>Upload Dynatek File</TITLE>
</HEAD>
<body>
<H2>upload File</H2>

<CFFILE ACTION="upload"
        DESTINATION="C:\Inetpub\wwwroot\Clients\firsttitleservices.com\www\uploaded_files\Dynatek\"
        NAMECONFLICT="overwrite"
        FILEFIELD="Filetoupload">


<!--Read File --->
	<cffile ACTION="Read"
    FILE="C:\Inetpub\wwwroot\Clients\firsttitleservices.com\www\uploaded_files\Dynatek\FirstTitleExport.txt"
    VARIABLE="ExportFile">

	<!-- Parse variables to allow loop to read output correctly --->
<cfset ExportFile = ExportFile>
<cfset ExportFile = replace(ExportFile,"||","|  |","all")>
<cfset ExportFile = replace(ExportFile,"||","|  |","all")>
<cfset ExportFile = replace(ExportFile,",#chr(166)#","|  ","all")>
<!--- This is for testing
<Cfoutput>
	#ExportFile#
</CFOUTPUT> --->
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
	<cfset str_paddress =
		listGetAt(str_Line,11,"|")>
	<cfset str_pcity =
		listGetAt(str_Line,12,"|")>
	<cfset str_pzip =
		listGetAt(str_Line,13,"|")>
	<cfset str_pcounty =
		listGetAt(str_Line,14,"|")>
	<cfset str_loan_number =
		listGetAt(str_Line,15,"|")>
	<cfset str_polender1 =
		listGetAt(str_Line,16,"|")>
	<cfset str_loanamt_float =
		listGetAt(str_Line,17,"|")>
	 <cfset str_purchase =
		listGetAt(str_Line,18,"|")>
	<cfset str_shphone1 =
		listGetAt(str_Line,19,"|")>
	<cfset str_polender2 =
		listGetAt(str_Line,20,"|")>
	<cfset str_slastname1 =
		listGetAt(str_Line,21,"|")>
	<cfset str_plegaldesc =
		listGetAt(str_Line,22,"|")>
	<cfset str_condo_pud =
		listGetAt(str_Line,23,"|")>
	<cfset str_slastname2 =
		listGetAt(str_Line,24,"|")>
	<cfset str_prop_use_type =
		listGetAt(str_Line,25,"|")>
	<cfset str_pstate =
		Left(listGetAt(str_Line,26,"|"),2)>









<cfquery  datasource="#request.dsn#">

			INSERT INTO
				TITLE_TEMP_DYNATEK (blastname1,bfirstname1,bssn1,bhphone1,bwphone1,blastname2,bfirstname2,bssn2,bhphone2,bwphone2,paddress,pcity,pzip,pcounty,loan_number,polender1,loanamt_float,purchase,shphone1,polender2,slastname1,plegaldesc,condo_pud,slastname2,prop_use_type,pstate,token)
				VALUES ('#str_blastname1#','#str_bfirstname1#','#str_bssn1#','#str_bhphone1#','#str_bwphone1#','#str_blastname2#','#str_bfirstname2#','#str_bssn2#','#str_bhphone2#','#str_bwphone2#','#str_paddress#','#str_pcity#','#str_pzip#','#str_pcounty#','#str_loan_number#','#str_polender1#','#str_loanamt_float#','#str_purchase#','#str_shphone1#','#str_polender2#','#str_slastname1#','#str_plegaldesc#','#str_condo_pud#','#str_slastname2#','#str_prop_use_type#','#str_pstate#',#temp.CFToken#)
</cfquery>

</cfloop>
<!--- Kill all Sessions --->

<cfif NOT isdefined("cookie.CFID")>
   <cfif isDefined("session.CFID")>
      <cfcookie name="CFID" value="#session.CFID#">
      <cfcookie name="CFTOKEN" value="#session.CFTOKEN#">
   <cfelse>
      <cfabort>
   </cfif>
</cfif>
<!--- // KILLS ALL SESSIONS AND LOGS OUT ADMINISTRATOR WHEN BROWSER IS SHUT
DOWN // --->
<!---<CFIF IsDefined("Cookie.CFID") AND IsDefined("Cookie.CFTOKEN")> --->
    <CFSET Variables.cfid_local = Cookie.CFID>
    <CFSET Variables.cftoken_local = Cookie.CFTOKEN>
    <CFCOOKIE name="CFID" value="#Variables.cfid_local#">
    <CFCOOKIE name="CFTOKEN" value="#Variables.cftoken_local#">
<!---</CFIF> --->
<CFOUTPUT>
	This is the Cookie Token - #CFTOKEN#
</CFOUTPUT>
<!---
<CFLOCATION URL="https://#cgi.server_name#/form_dynatek_title_request.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&title=#title#&appraisal=#appraisal#">

--->
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


