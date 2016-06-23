
<cfpARAM NAME="read_id.ID" DEFAULT="100">
<cfpARAM NAME="copy_from" DEFAULT="0">



<CFSET b_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET b_date = #DateFormat(Now(), "mm/dd/yyyy")#>
<CFQUERY datasource="#request.dsn#" NAME="read_company">
			SELECT *
			FROM companies
			WHERE ID = #Read_ID.id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="check_richmond">
			SELECT *
			FROM First_admin
			WHERE ID = #read_company.intSales#
</CFQUERY>



<cfset read_from_account = 426>
<cfif read_company.streamline_client eq 'True' or read_company.streamline_client eq 1>
<cfset read_from_account = 2368>
</cfif>

<cfif check_richmond.va_employee eq 'True'>
<cfset read_from_account = 4927>
</cfif>

<cfif read_company.master_co_id neq 0 and read_company.master_co_id neq 'NULL'>
<cfset read_from_account = read_company.master_co_id>
</cfif>

<cfif read_company.master_co_id neq 0 and read_company.master_co_id neq 'NULL'>
<cfset read_from_account = read_company.master_co_id>
</cfif>


<cfif copy_from neq 0>
<cfset read_from_account = copy_from>
</cfif>


<cfhttp url="https://#cgi.server_name#/copy_fees/index.cfm" method="post">
<cfhttpparam type="Formfield" name="FROMID" value="#read_from_account#">
<cfhttpparam type="Formfield" name="TOID" value="#Read_ID.id#">
<cfhttpparam type="Formfield" name="SUBMIT" value="Copy Line Costs">
</cfhttp>
