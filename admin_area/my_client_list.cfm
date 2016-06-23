<cfparam name="form.sales_people" default="ALL">


<CFQUERY datasource="#request.dsn#" NAME="comps">
        SELECT c.*, a.fname, a.lname FROM Companies c 
		left join first_admin a on a.id = c.intsales
		where 1 = 1
		<cfif session.ft_user_id EQ 618 OR session.ft_user_id EQ 59 OR session.ft_user_id EQ 285>
			<cfif form.sales_people NEQ "ALL">
				AND c.intSales IN (#form.sales_people#)
			</cfif>
		<cfelse>
			AND c.intSales = '#session.ft_user_id#'
		</cfif>
		order by c.a_date desc,c.company
</CFQUERY>

<STYLE>
TABLE {font-family:Arial, Helvetica, sans-serif; font-size: 11px;}

</STYLE>
<cfif session.ft_user_id EQ 618 or session.ft_user_id EQ 59 OR session.ft_user_id EQ 285>
<CFQUERY datasource="#request.dsn#" NAME="all_sales_people">
SELECT     ID, fname, lname, username, status
FROM         First_Admin
WHERE     (role_id = 24 OR (role_id = 34 AND id <> 450)) AND (status = 1 OR status = 'True') <!--- AND (va_employee IS NULL OR
                      va_employee = 0) AND (mi_employee IS NULL OR
                      mi_employee = 0) AND (mo_employee IS NULL OR
                      mo_employee = 0) AND (mi_flushing_employee IS NULL OR
                      mi_flushing_employee = 0)  AND (tx_employee IS NULL OR
                      tx_employee = 0) ---> AND (ID NOT IN (327, 264, 450)) OR
                      (ID = 319) OR (ID = 460) OR (ID = 501) OR
                      (ID = 408)
					  or (ID = 59)
					  or (ID = 56)
					  or (ID = 294)
ORDER BY lname
</cfquery>
<cfoutput>
<form action="my_client_list.cfm" method="post">
<h3>Select salesperson(s):</h3>		
<SELECT NAME="sales_people"	multiple		
								size="5" 
								
								rows="5" 
								cols="45" 
								>
								
								<OPTION VALUE="All" <cfif form.sales_people eq 'All'>selected</cfif>>All</OPTION>
								<CFloop QUERY="all_sales_people"><OPTION VALUE="#all_sales_people.ID#" <cfif ListFindNoCase(form.sales_people, all_sales_people.ID, ',')>selected</cfif>>#all_sales_people.fname# #all_sales_people.lname#</OPTION></CFloop>			
							</SELECT><br><br>
							<input type="submit" value="Submit"><br><br>
</form>
</cfoutput>
</cfif>
<table cellpadding="3" border=1>
<tr bgcolor="#CCCCCC">
<td>Company</td>
<td>Address</td>
<td>City</td>
<td>State</td>
<td>Zip</td>
<td>Contact First Name</td>
<td>Contact Last Name</td>
<td>Phone</td>
<td>Fax</td>
<td>Email</td>
<cfif session.ft_user_id EQ 618 OR session.ft_user_id EQ 59 OR session.ft_user_id EQ 285>
<td>Salesperson</td>
<td>Signup Date</td>
</cfif>
</tr>
<cfoutput query="comps">
<tr>
<td>#Company#</td>
<td>#addr1#<cfif Len(comps.addr2)>, #addr2#</cfif></td>
<td>#city#</td>
<td>#state#</td>
<td>#zip_code#</td>
<td>#contact_fname#</td>
<td>#contact_lname#</td>
<td>#phone#</td>
<td>#fax#</td>
<td>#email#</td>
<cfif session.ft_user_id EQ 618 OR session.ft_user_id EQ 59 OR session.ft_user_id EQ 285>
<td>#fname# #lname#</td>
<td>#DateFormat(a_date,"m/dd/yyyy")#</td>
</cfif>
</tr>
</cfoutput>
</table>
