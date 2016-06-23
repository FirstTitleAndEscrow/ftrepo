
<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="user_name" DEFAULT="">
<CFPARAM NAME="password" DEFAULT="">
<CFPARAM NAME="comp_id" DEFAULT="">
<CFPARAM NAME="lp_id" DEFAULT="">
<CFPARAM NAME="job_id" DEFAULT="">
<CFPARAM NAME="ExportFile" DEFAULT="">
<CFPARAM NAME="ExportFile2" DEFAULT="">

<CFSET a_insert_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET a_insert_date = #DateFormat(Now(), "mm-dd-yyyy")#>

<CFQUERY datasource="#request.dsn#" NAME="read_company">
	SELECT *
	FROM companies
	WHERE a_user = '#user_name#' AND a_pass = '#password#' and a_status = 1
</CFQUERY>

<cfoutput>
	<cfset comp_id = #read_company.id#>
</cfoutput>

<!---<CFIF #read_company.recordcount# EQ 0>
	<cfset session.ExportFile = trim(ExportFile)>
	<CFLOCATION URL="https://#cgi.server_name#/Dynatek_login_Rerun.cfm?a_trigger=1">
<CFELSE> --->
	<HTML>
	<BODY><CFOUTPUT><B><Center>File has been transferred.  You can now close your browser.</CENTER></B></CFOUTPUT>
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
			Left(listGetAt(str_Line,27,"|"),2)></CFLoop>

<!---Get the Legal Description and save as a variable.
	Get the company name and the loan number
Then you will have the the title id --->

		<CFQUERY datasource="#request.dsn#" NAME="Dynatek_Title_Temp">
				Select *
				FROM Title_Temp_Dynatek LEFT OUTER JOIN
	            Title ON Title_Temp_Dynatek.Title_ID = Title.Title_ID
				where title.comp_id = #read_company.id# and title_temp_dynatek.loan_number = '#str_loan_number#'
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_title_data">
        	select *
			from title_ins_view
			WHERE title_id = #Dynatek_Title_Temp.title_ID#
		</cfquery>
		<!---Tax Data--->
		<CFQUERY datasource="#request.dsn#" NAME="read_tax">
			SELECT *
			FROM tax_cert_title
			where title_id = #Dynatek_Title_Temp.title_ID#
		</CFQUERY>

		<CFSET LegalDescription = "">
		<cfif #read_title_data.notes# neq "">
			<CFSET LegalDescription = "#read_title_data.notes#">
		</cfif>
		<cfif #read_title_data.data1# NEQ "">
			 <CFSET LegalDescription = #LegalDescription# & 'Being the same property as transferred by #read_title_data.data5# on #DateFormat(read_title_data.data10, "mm")#/#DateFormat(read_title_data.data10, "dd")#/#DateFormat(read_title_data.data10, "yyyy")# and recorded #DateFormat(read_title_data.data11, "mm")#/#DateFormat(read_title_data.data11, "dd")#/#DateFormat(read_title_data.data11, "yyyy")# from #read_title_data.data1#'>
		</CFIF>
		<cfif #read_title_data.data2# NEQ "">
			<CFSET LegalDescription = #LegalDescription# & " and #read_title_data.data2#">
		</CFIF>
		<CFSET LegalDescription = #LegalDescription# & " to #read_title_data.data3#">
		<CFIF #read_title_data.data4# NEQ "">
			<CFSET LegalDescription = #LegalDescription# & " and #read_title_data.data4#">
		</CFIF>
		<CFSET LegalDescription = #LegalDescription# & " , #read_title_data.data6#,">
		<cfif #read_title_data.data7# eq "">
			<CFIF #read_title_data.data8# NEQ "">
				<CFSET LegalDescription = #LegalDescription# & " recorded in Book #read_title_data.data8#">
			</cfif>
			<cfif #read_title_data.data9# neq "">
	 			<CFSET LegalDescription = #LegalDescription# & " and Page #read_title_data.data9#">
			</cfif>
		<cfelse>
			<CFSET LegalDescription = #LegalDescription# & " recorded in Document Number #read_title_data.data7#">
		</cfif>
		<cfif #read_tax.data29# NEQ "">
  			<CFSET LegalDescription = #LegalDescription# & " Real Estate Taxes for #Read_tax.data29# are #Read_tax.data31#. They are payable #Read_tax.data37#. The amount paid was $#Read_tax.data28#. #Read_tax.data34#. The due dates are #Read_tax.data30#. The parcel ID number is #Read_tax.data19#.">
 		</CFIF>


<!---Save this to a file --->
		<CFFILE ACTION="Write"
    		FILE="C:\inetpub\wwwroot\Clients\Dynatek\Dynatek\#ExportFile2#.txt"
			OUTPUT="#LegalDescription#"
   			ADDNEWLINE="No">


</HTML>
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
