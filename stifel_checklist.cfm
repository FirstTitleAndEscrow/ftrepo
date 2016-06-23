<IE:DEVICERECT ID="page0" CLASS="masterstyle" MEDIA="print">
<CFQUERY datasource="#request.dsn#" NAME="find_data">
Select * from Rosicki where order_id = #rec_id#
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="find_title_data">
Select * from title where title_id = #rec_id#
</cfquery>


<center>
<font face="Arial, Helvetica, sans-serif">
<cfoutput>

<table width="800" border="1" cellspacing="2" cellpadding="8">
  <tr>
    <td align="left" valign="top"><font face="Arial, Helvetica, sans-serif">
<center><strong>TITLE REPORT CHECKLIST</strong></center><br><br>

<strong>Loan number:</strong>&nbsp;&nbsp;#find_title_data.loan_number#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><br><br>
Property Address:</strong> #find_title_data.paddress#, #find_title_data.pcity#, #find_title_data.pstate# #find_title_data.pzip#<br><br>

<strong>Title vesting:</strong>&nbsp;<cfif read_title.vesting_override neq '' and read_title.vesting_override neq 'NULL'>#read_title.vesting_override#<cfelse>
<cfif read_title.title_id eq 52901>Elizabeth Warren<cfelseif read_title.title_id eq 52914>Julie Konik<cfelseif read_title.title_id eq 44863>Emilio R. Limchoa and Imelda T. Limchoa<cfelseif read_title.title_id eq 52794>The Village Cooperative Homes<cfelseif read_title.title_id eq 44894>Kindra McLeroy Pack, Barbara A. McLeroy and Wayne McLeroy by Barbara A. McLeroy, his heir.<cfelseif read_title.title_id eq 59179>Chang-Tai Hsieh and Sally Jo Hsieh<cfelseif read_title.title_id eq 57411>ALEXANDER MAKRIS<cfelseif read_title.comp_id eq 3943 or read_title.comp_id eq 4043 or read_title.comp_id eq 4042>#read_title.full_vesting#<cfelse>#read_title_data.data3#<cfif #read_title_data.data4# neq "">&nbsp;AND&nbsp;#read_title_data.data4#</cfif><cfif #read_title_data.data6# neq "">,&nbsp;#read_title_data.DATA6#</b></font></cfif></cfif>
</cfif><br><br>

<strong>Delinquent Taxes</strong><br><br>
&nbsp;&nbsp;&nbsp;<cfif #read_tax.delamt# neq "">
Delinquent amount <cfif IsNumeric(read_tax.delamt)>#DollarFormat(ReplaceNoCase(read_tax.delamt, ",", "", "ALL"))#<cfelse>#read_tax.delamt#</cfif>, <cfif #read_tax.thrudate# neq "">good through date #read_tax.thrudate#. </cfif> <cfif #trim(read_tax.comments)# neq "" and #read_tax.comments# neq 'NULL'> Comments: #read_tax.comments# </cfif><cfelse>No Delinquent taxes</cfif><BR><BR>

<strong>Outstanding Mortgages/Judgments/Liens</strong>&nbsp;&nbsp;&nbsp;<br><br>
<CFQUERY datasource="#request.dsn#" NAME="read_mortgages">
			select * from title_ins_view
			WHERE title_id = #rec_ID# and selectedOrgs4 in (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)
			order by selectedOrgs4
</cfquery> 
<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mortgages</strong><br>
<cfif read_mortgages.recordcount eq 0>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No Mortgages<br>
<cfelse>
<table width="90%">
<tr>
<td align="left" valign="top" width="75%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Payee</strong></td>
<td align="left" valign="top" width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Principal Amount</strong></td>
</tr>
<cfloop query="read_mortgages">
<tr>
<td align="left" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#read_mortgages.data1#</td>
<td align="left" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<cfif IsNumeric(read_mortgages.data4)>#DollarFormat(ReplaceNoCase(read_mortgages.data4, ",", "", "ALL"))#<cfelse>#read_mortgages.data4#</cfif></td>
</tr>
</cfloop>
</table>
</cfif><br>
<br>


<CFQUERY datasource="#request.dsn#" NAME="read_liens">
			select * from title_ins_view
			WHERE title_id = #rec_ID# and selectedOrgs3 in (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)
			order by selectedOrgs3
</cfquery> 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Liens</strong><br>
<cfif read_liens.recordcount eq 0>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No Liens<br>
<cfelse>
<table width="90%">
<tr>
<td align="left" valign="top" width="75%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Payee</strong></td>
<td align="left" valign="top" width="25%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>Principal Amount</strong></td>
</tr>
<cfloop query="read_liens">
<tr>
<td align="left" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#read_liens.data6#</td>
<td align="left" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<cfif IsNumeric(read_liens.data5)>#DollarFormat(ReplaceNoCase(read_liens.data5, ",", "", "ALL"))#<cfelse>#read_liens.data5#</cfif></td>
</tr> 
</cfloop>
</table>
</cfif><br>
<br>
</td></tr></table>
</cfoutput>
</IE:DEVICERECT>