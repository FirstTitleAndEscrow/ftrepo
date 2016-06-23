<CFQUERY datasource="#request.dsn#" NAME="Dynatek_Legal_Description">
	SELECT     dbo.Title_Temp_Dynatek.Temp_loan_ID, dbo.Title.bfirstname1, dbo.Title.blastname1,dbo.Title_Temp_Dynatek.Title_ID, dbo.Title_Temp_Dynatek.legal_status,
                      dbo.Title_Temp_Dynatek.email_date, dbo.Title.comp_id, dbo.Companies.company, dbo.Companies.team_id, dbo.Title.Verifyemail, dbo.Title.Verifyemail_2,
                      dbo.Title.Verifyemail_3, dbo.Title_Temp_Dynatek.loan_number
	FROM         dbo.Companies RIGHT OUTER JOIN
                      dbo.Title ON dbo.Companies.ID = dbo.Title.comp_id RIGHT OUTER JOIN
                      dbo.Title_Temp_Dynatek ON dbo.Title.Title_ID = dbo.Title_Temp_Dynatek.Title_ID
	WHERE     (dbo.Title_Temp_Dynatek.Title_ID IS NOT NULL) AND (dbo.Title_Temp_Dynatek.legal_status = 1) AND (dbo.Title_Temp_Dynatek.email_date IS NULL)
</CFQUERY>
<!--- <cftry>
<cfinvoke component = "cfc.team_info"	method = "getTeamEmail"	returnVariable = "team_email" team_id="#Dynatek_Legal_Description.team_id#">
<cfcatch type="Any">
		<cfoutput>
		<cfmail from="rjermain@firsttitleservices.com" to="rjermain@firsttitleservices.com" subject="Team Email Failure">
		<hr>
			<h1>Other Error: #cfcatch.Type#</h1>
			<ul>
				<li><b>Message:</b> #cfcatch.Message#
				<li><b>Detail:</b> #cfcatch.Detail#
				<li><B>Page:</B> #GetBaseTemplatePath()#
			</ul>
		</cfmail>
        </cfoutput>
	</cfcatch>
</cftry> --->

<CFQUERY datasource="#request.dsn#" NAME="read_tax">
			SELECT *
			FROM tax_cert_title
			where title_id = #Dynatek_Legal_Description.Title_ID#
		</CFQUERY>

<CFLOOP QUERY="Dynatek_Legal_Description">

<CFQUERY datasource="#request.dsn#" NAME="read_title_data">
        select * from title_ins_view WHERE title_id = #Dynatek_Legal_Description.title_ID#

</cfquery>
<!---Creating a variable to hold all of the Legal Information --->
<CFSET LegalDescription = "">
<cfif #read_title_data.notes# neq "">
	<CFSET LegalDescription = "#read_title_data.notes#">
</cfif>

<cfif #read_title_data.data1# NEQ "">
	 <CFSET LegalDescription = #LegalDescription# & 'Being the same property as transferred by #read_title_data.data5# on #DateFormat(read_title_data.data10, "mm")#/#DateFormat(read_title_data.data10, "dd")#/#DateFormat(read_title_data.data10, "yyyy")# and recorded #DateFormat(read_title_data.data11, "mm")#/#DateFormat(read_title_data.data11, "dd")#/#DateFormat(read_title_data.data11, "yyyy")# from #read_title_data.data1#'>
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
</cfif>
<cfif #read_tax.data29# NEQ "">
  <CFSET LegalDescription = #LegalDescription# & " Real Estate Taxes for #Read_tax.data29# are #Read_tax.data31#. They are payable #Read_tax.data37#. The amount paid was $#Read_tax.data28#. #Read_tax.data34#. The due dates are #Read_tax.data30#. The parcel ID number is #Read_tax.data19#.">
 </CFIF>

<CFQUERY datasource="#request.dsn#" NAME="Dynatek_Legal_Description_Update">
	update title_temp_dynatek
	set legal_description = '#LegalDescription#'
	where Temp_loan_ID = #Dynatek_Legal_Description.Temp_Loan_ID#
</CFQUERY>
</cfloop>
<CFOUTPUT>The Legal Description is #LegalDescription#</CFOUTPUT>
<!---Update the email sent date in Title_Temp_Dynatek--->
<!---
<cfif #Dynatek_Legal_Description.RecordCount# gt 0 >
		<CFLOCATION URL="https://#cgi.server_name#/Dynatek_Email_Date_Update.cfm?temp_loan_id=#Dynatek_Legal_Description.temp_loan_id#">
</CFIF>
--->



