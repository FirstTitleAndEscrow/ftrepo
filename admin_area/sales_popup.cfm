<!-- check if this person is assigned to a team --->
<CFQUERY datasource="#request.dsn#" NAME="read_companies">
	SELECT * 
	FROM Companies
	where intSales = '#session.ft_user_id#'
</CFQUERY>



<cfif read_companies.recordcount>

<script language="javascript">
window.open('sales_popup_data.cfm',null,
    'height=300,width=800,status=yes,toolbar=no,menubar=no,location=no, scrollbars=yes');
</script>
</cfif>

