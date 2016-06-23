<CFQUERY datasource="#request.dsn#" NAME="read_title_data">
         select *
			from title_ins_view
			WHERE title_id = 22106
		</cfquery>
		<!---Tax Data--->
		<CFQUERY datasource="#request.dsn#" NAME="read_tax">
			SELECT *
			FROM tax_cert_title
			where title_id = 22106
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

<html>
<body>
<!---Save this to a file --->
		<CFOUTPUT>
			#LegalDescription#
</CFOUTPUT>


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

