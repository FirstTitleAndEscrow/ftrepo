<style type="text/css">
td {font-family:Arial, Helvetica, sans-serif; font-size:14px}
</style>
<cfset title_id=URL.rec_id>
		
	<CFQUERY datasource="#request.dsn#" Name="read_company_Flagstar">
		Select t.Title_Id, t.bfirstname1, t.blastname1, t.bfirstname2, t.blastname2, t.bfirstname3, t.blastname3, t.bfirstname4, t.blastname4, t.company1, t.searchtype, t.Loan_Number, ta.data3, ta.Data4, ta.data6, t.vesting_override
		from Title t, title_ins_add ta
		where t.title_Id = #title_id# and ta.type = 'DATA' and ta.title_id = t.title_id
	</CFQUERY>
   
<cfset Name = read_company_flagstar.data3>
<cfif Len(read_company_flagstar.data4)>
<cfset Name = Name & ' AND ' & read_company_flagstar.data4>
</cfif>
<cfset Name = Name & ', ' & read_company_flagstar.data6>

<cfif read_company_Flagstar.searchtype eq 'Purchase'>
<cfset Name = read_company_flagstar.bfirstname1 & ' ' & read_company_flagstar.blastname1>
<cfif Len(read_company_Flagstar.blastname2)>
<cfset Name = Name & ', ' & read_company_flagstar.bfirstname2 & ' ' & read_company_flagstar.blastname2>
</cfif>
<cfif Len(read_company_Flagstar.blastname3)>
<cfset Name = Name & ', ' & read_company_flagstar.bfirstname3 & ' ' & read_company_flagstar.blastname3>
</cfif>
<cfif Len(read_company_Flagstar.blastname4)>
<cfset Name = Name & ', ' & read_company_flagstar.bfirstname4 & ' ' & read_company_flagstar.blastname4>
</cfif>
<cfif Len(read_company_Flagstar.company1)>
<cfset Name = read_company_flagstar.company1>
</cfif>
</cfif>

<cfoutput query="read_company_Flagstar">

		<table width="100%" cellpadding=0 cellspacing=0 border=0>
			<tr>
				<td align="Center" colspan="2" style="text-decoration:underline">
					<font size="3">FINAL VESTING</font>					
				</td>				
			</tr>
			<tr><td height="20px"></td><tr>			
			<tr>
				<td align="center" colspan="2">
					<font size="3">Loan Number: <strong>#Loan_Number#</strong> / Reference Number: <strong>#Title_id#</strong></font>					
				</td>
			</tr>
			<tr><td height="20px"></td><tr>
			<tr>
				<td align="Center" colspan="2">
					<font size="3">Please prepare your final loan documents as follows:</font>
					<br><br>
					<font size="3"><strong><cfif read_company_Flagstar.vesting_override neq '' and read_company_Flagstar.vesting_override neq 'NULL'>#read_company_Flagstar.vesting_override#<cfelse>#ReplaceNoCase(Name, ", None Stated", "", "ALL")#</cfif></strong></font>
				</td>
			</tr>
		</table>

</cfoutput>
