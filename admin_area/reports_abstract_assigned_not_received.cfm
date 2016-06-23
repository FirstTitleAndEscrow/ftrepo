<CFPARAM NAME="a_fname" DEFAULT="">
<CFPARAM NAME="a_lname" DEFAULT="">
<CFPARAM NAME="a_user" DEFAULT="">
<CFPARAM NAME="a_date" DEFAULT="">
<CFPARAM NAME="a_time" DEFAULT="">
<CFPARAM NAME="a_ip" DEFAULT="">
<CFPARAM NAME="vendor" DEFAULT="">
<CFPARAM NAME="calendar" DEFAULT="">
<CFPARAM NAME="order" DEFAULT="">
<CFPARAM NAME="excel" DEFAULT="0">
<CFPARAM NAME="URL.uid" DEFAULT="#session.ft_user_id#">
<CFPARAM NAME="URL.al" DEFAULT="1">


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_user">
	select * from first_admin

			WHERE ID = #session.ft_user_id#
</CFQUERY>

<cfif isDefined("url.move")>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="updateFile">
		update <cfif type EQ "T">title<cfelse>property</cfif>
		set appraisal_status = 'Awaiting Contract',
		awaitingContract = 1
		where
		<cfif type EQ "T">title_id<cfelse>prop_id</cfif> = #rec_id#
	</cfquery>


</cfif>

<!---d3d3d3--->
<CFSET a_bgcolor = "d3d3d3">
<CFSET a_color_trigger = "1">

<cfoutput>
<cfif #excel# EQ 1>
	<cfset filename = "file.xls">
		<cfcontent type="application/vnd.ms-excel">
<cfheader name="Content-Disposition" value="attachment; filename=#filename#">
#filename#
</cfif>
</cfoutput>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Abstract Assigned Not Received</title>
<script language="javascript">

function to_excel() {
document.excel_form.submit();
}
</script>
</head>

<body>
<!--- Select * from sqlAbstract_Assigned_Not_Received order by a_insert_date --->
<cfset sixty_days_old = DateFormat(DateAdd("d", -60, Now()), "mm/dd/yyyy")>
<cfset one_year_old = DateFormat(DateAdd("d", -365, Now()), "mm/dd/yyyy")>


<CFQUERY datasource="#request.dsn#" NAME="read_Abstract_Assigned_Not_Received_temp">

			SELECT DISTINCT
                      TOP (100) PERCENT dbo.Title.Title_ID AS ID, CAST(dbo.Title.a_insert_date AS smalldatetime) AS a_insert_date, dbo.Companies.company, dbo.Companies.ID as company_id,
                      CAST(dbo.Title.duedate AS smalldatetime) AS duedate, 'T' AS Letter, dbo.Doc_Abstract_Title.a_Date_Assigned, dbo.Doc_Abstract_Title.product_ordered, First_Admin_2.fname AS Taxes,
                      First_Admin_1.fname AS Abstractor, First_Admin_3.fname AS AbstractorIH, dbo.Title.SearchType, dbo.Title.pstate, dbo.Title.on_hold, dbo.Companies.fairfax_client, dbo.Companies.streamline_client,  dbo.Companies.intSales,  dbo.Title.cancelled, dbo.Title.seller_rep
FROM         dbo.Tax_Cert_Title RIGHT OUTER JOIN
                      dbo.Title ON dbo.Tax_Cert_Title.Title_ID = dbo.Title.Title_ID LEFT OUTER JOIN
                      dbo.First_Admin AS First_Admin_3 RIGHT OUTER JOIN
                      dbo.tblUser_Roles ON First_Admin_3.ID = dbo.tblUser_Roles.vendor_mgmt_InHouse_ID LEFT OUTER JOIN
                      dbo.First_Admin AS First_Admin_1 ON dbo.tblUser_Roles.abstract_ID = First_Admin_1.ID LEFT OUTER JOIN
                      dbo.First_Admin AS First_Admin_2 ON dbo.tblUser_Roles.payoff_ID = First_Admin_2.ID ON
                      dbo.Title.Title_ID = dbo.tblUser_Roles.Title_ID LEFT OUTER JOIN
                      dbo.Companies ON dbo.Title.comp_id = dbo.Companies.ID LEFT OUTER JOIN
                      dbo.Doc_Abstract_Title ON dbo.Title.Title_ID = dbo.Doc_Abstract_Title.Title_ID
WHERE     ((dbo.Title.cancelled IS NULL) AND (dbo.Companies.company <> 'test - ABC Mortgage')  AND (dbo.Companies.company <> 'Encompass Test Account') AND (CAST(dbo.Title.a_insert_date AS smalldatetime)
                      >= '#one_year_old#') AND (dbo.Doc_Abstract_Title.a_Date_Assigned IS NOT NULL) AND
                      (dbo.Doc_Abstract_Title.a_Date_Completed IS NULL) AND (dbo.Doc_Abstract_Title.Report_Flag IS NULL) AND
                      (dbo.Title.appraisal_status <> 'Report E-mailed') AND (dbo.Title.appraisal_status <> 'Loan Closed') AND (dbo.Title.appraisal_status <> 'Loan Funded') AND (dbo.Title.appraisal_status <> 'Awaiting Contract') AND (dbo.Title.seller_rep <> '1') AND (dbo.Title.seller_rep <> 'True')
                      AND (dbo.Title.appraisal_status <> 'Loan Closed-Seller Rep') AND (dbo.Doc_Abstract_Title.Abstractor_ID IS NOT NULL) AND
                      (dbo.Doc_Abstract_Title.Abstractor_ID <> 0)
<cfif session.ft_user_id eq 462 or read_user.fairfax_admin eq 1>
and dbo.Companies.fairfax_client = 1
</cfif>

and dbo.Companies.company not like 'Test%'
and dbo.Companies.company not like 'Vanderbilt M%'

<cfif read_user.tx_admin eq 1>
and dbo.Companies.ID IN (select id from dbo.companies where dbo.companies.intSales in (Select dbo.First_admin.ID from dbo.First_admin where dbo.First_admin.tx_employee = 'True'))
or dbo.Title.pstate = 'TX'
</cfif>

<cfif read_user.va_employee eq 1 or read_user.va_employee eq 'True'>
and dbo.Companies.ID IN (select id from dbo.companies where dbo.companies.intSales in (Select dbo.First_admin.ID from dbo.First_admin where dbo.First_admin.va_employee = 'True'))
</cfif>


)
UNION

SELECT DISTINCT
                      TOP (100) PERCENT dbo.Property.Prop_ID AS ID, CAST(dbo.Property.a_insert_date AS smalldatetime) AS a_insert_date, dbo.Companies.company, dbo.Companies.ID as company_id,
                      CAST(dbo.Property.duedate AS smalldatetime) AS duedate, 'P' AS Letter, dbo.Doc_Abstract_Prop.a_Date_Assigned,  dbo.Doc_Abstract_Prop.product_ordered, First_Admin_2.fname AS Taxes,
                      First_Admin_1.fname AS Abstractor, First_Admin_3.fname AS AbstractorIH, dbo.Property.SearchType, dbo.Property.pstate, dbo.Property.on_hold, dbo.Companies.fairfax_client, dbo.Companies.streamline_client,  dbo.Companies.intSales,  dbo.Property.cancelled, dbo.Property.seller_rep
FROM         dbo.Tax_Cert_Prop RIGHT OUTER JOIN
                      dbo.Property ON dbo.Tax_Cert_Prop.Prop_ID = dbo.Property.Prop_ID LEFT OUTER JOIN
                      dbo.First_Admin AS First_Admin_3 RIGHT OUTER JOIN
                      dbo.tblUser_Roles ON First_Admin_3.ID = dbo.tblUser_Roles.vendor_mgmt_InHouse_ID LEFT OUTER JOIN
                      dbo.First_Admin AS First_Admin_1 ON dbo.tblUser_Roles.abstract_ID = First_Admin_1.ID LEFT OUTER JOIN
                      dbo.First_Admin AS First_Admin_2 ON dbo.tblUser_Roles.payoff_ID = First_Admin_2.ID ON
                      dbo.Property.Prop_ID = dbo.tblUser_Roles.Prop_ID LEFT OUTER JOIN
                      dbo.Companies ON dbo.Property.comp_id = dbo.Companies.ID LEFT OUTER JOIN
                      dbo.Doc_Abstract_Prop ON dbo.Property.Prop_ID = dbo.Doc_Abstract_Prop.Prop_ID
WHERE     ((dbo.Property.cancelled IS NULL) AND (dbo.Doc_Abstract_Prop.a_Date_Assigned IS NOT NULL) AND (dbo.Companies.company <> 'test - ABC Mortgage') AND
                      (dbo.Doc_Abstract_Prop.a_Date_Completed IS NULL) AND (CAST(dbo.Property.a_insert_date AS smalldatetime) >= '#one_year_old#') AND (dbo.Doc_Abstract_Prop.Report_Flag IS NULL) AND
                      (dbo.Property.appraisal_status <> 'Report E-mailed') AND (dbo.Property.appraisal_status <> 'Loan Closed') AND
                      (dbo.Property.appraisal_status <> 'Loan Funded') AND (dbo.Property.appraisal_status <> 'Loan Closed-Seller Rep') AND (dbo.Property.appraisal_status <> 'Awaiting Contract') AND
                      (dbo.Doc_Abstract_Prop.Abstractor_ID IS NOT NULL) AND (dbo.Doc_Abstract_Prop.Abstractor_ID <> 0)
<cfif session.ft_user_id eq 462 or read_user.fairfax_admin eq 1>
and dbo.Companies.fairfax_client = 1
</cfif>
and dbo.Companies.company not like 'Test%'
and dbo.Companies.company not like 'Vanderbilt M%'
)

<cfif read_user.tx_admin eq 1>
and dbo.Companies.ID IN (select id from dbo.companies where dbo.companies.intSales in (Select dbo.First_admin.ID from dbo.First_admin where dbo.First_admin.tx_employee = 'True'))
or dbo.Property.pstate = 'TX'
</cfif>

<cfif read_user.va_employee eq 1 or read_user.va_employee eq 'True'>
and dbo.Companies.ID IN (select id from dbo.companies where dbo.companies.intSales in (Select dbo.First_admin.ID from dbo.First_admin where dbo.First_admin.va_employee = 'True'))
</cfif>


ORDER BY ID, a_insert_date
</CFQUERY>



<cfquery dbtype="query" name="read_Abstract_Assigned_Not_Received">
	SELECT *
	FROM read_Abstract_Assigned_Not_Received_temp
	where cancelled <> 1
    and seller_rep <> 'True'
</cfquery>


 <table border=0 width="575">
<tr>
<td width="200">
<cfoutput>
<form name="excel_form" action="reports_abstract_assigned_not_received.cfm?uid=#URL.uid#&al=#URL.al#" method="post">
<input type="hidden" name="excel" value="1">
</form>
</cfoutput>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="excel_submit" type="button" onClick="to_excel();" value="EXPORT TO EXCEL"><br>
</td>
<td width="25" bgcolor="FFCC00">&nbsp;</td>
<td width="150" bgcolor="FFFFFF">= Due Tomorrow</td>
<td width="25" bgcolor="FFFFFF">&nbsp;</td>
<td width="25" bgcolor="FF3333">&nbsp;</td>
<td width="150" bgcolor="FFFFFF">= Past Due</td>

</tr>
</table>


<table >
    <tr>
	    <td
            <CFIF (#UID# eq "56")or (#UID# eq "214") or (#UID# eq "187")>
                colspan = 10
            <CFELSE>
                colspan= 9
            </CFIF>
            width=100% align="center"><B>Abstract Assigned Not Received</B></td>
	</tr>
	<tr>
	<!---R is for Remove.  There's not really any space to make it longer.--->
            <CFIF (#UID# eq "56")or (#UID# eq "214") or (#UID# eq "187")>
                <td align="center"><font size=1 color=black face=verdana><b>Remove</b></font></td>
            </CFIF>
            <td align="center" width="5"><font size=1 color=black face=verdana> </font></td>
            <td align="center"><font size=1 color=black face=verdana><B>Order Num</B></font></td>
			<td align="center"><font size=1 color=black face=verdana><B>Order Date</B></font></td>
			<td align="center"><font size=1 color=black face=verdana><B>Assigned Date</B></font></td>
			<td align="center"><font size=1 color=black face=verdana><B>Due Date</B></font></td>
			<td width=150 align="center"><font size=1 color=black face=verdana><B>Product Ordered</B></font></td>
			<td  width=150 align="center"><font size=1 color=black face=verdana><B>Company Name</B></font></td>
			<td align="center"><font size=1 color=black face=verdana><B>State</B></font></td>
			<td width=150 align="center"><font size=1 color=black face=verdana><B>Abstractor</B></font></td>
			<td align="center"><font size=1 color=black face=verdana><B>Taxes</B></font></td>
			<td align="center"><font size=1 color=black face=verdana><B>On Hold</B></font></td>
			<td align="center"><font size=1 color=black face=verdana><B>Move File To Awaiting Contract</B></font></td>
		</tr>
<cfset aryOrders = ArrayNew(1)>
<CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="read_Abstract_Assigned_Not_Received" group="ID">
<CFQUERY datasource="#request.dsn#" NAME="check_richmond">
select va_employee
from first_admin
where ID =  #read_Abstract_Assigned_Not_Received.intsales# and (va_employee = 1 or va_employee = 'True')
</CFQUERY>

<cfif read_Abstract_Assigned_Not_Received.letter eq "T">
	<cfif read_Abstract_Assigned_Not_Received.streamline_client eq 1>
	<cfset prefix = 'ST'>
	<cfelseif check_richmond.recordcount GTE 1>
	<cfset prefix = 'T(R)'>
	<cfelseif read_Abstract_Assigned_Not_Received.pstate eq 'TX'>
	<cfset prefix = 'T(TX)'>
	<cfelse>
	<cfset prefix = 'T'>
	</cfif>

<cfelseif read_Abstract_Assigned_Not_Received.letter eq "P">
	<cfif read_Abstract_Assigned_Not_Received.streamline_client eq 1>
	<cfset prefix = 'SP'>
	<cfelseif check_richmond.recordcount GTE 1>
	<cfset prefix = 'P(R)'>
	<cfelseif read_Abstract_Assigned_Not_Received.pstate eq 'TX'>
	<cfset prefix = 'P(TX)'>
	<cfelse>
	<cfset prefix = 'P'>
	</cfif>

</cfif>

<CFIF #Letter# eq "T">
<CFQUERY datasource="#request.dsn#" NAME="get_ab_info">
select  t.abstractor_doc_upload3, a.abstractor_id, a.company as abstractor_name from Abstractors a, Doc_Abstract_title t where
t.title_id = #id# and a.abstractor_id = t.abstractor_id
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_tc_sent_info">
select  s_status from Doc_Title_Insurance_Title 
where title_id = #id#
</CFQUERY>
<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="get_ab_info">
select t.abstractor_doc_upload3, a.abstractor_id, a.company as abstractor_name from Abstractors a, Doc_Abstract_Prop t where
t.prop_id = #id# and a.abstractor_id = t.abstractor_id
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_tc_sent_info">
select  s_status from Doc_Title_Insurance_Prop 
where prop_id = #id#
</CFQUERY>
</cfif>

<cftry>
	<cfset orders = aryOrders[company_id]>
<cfcatch type="any">
<CFQUERY datasource="#request.dsn#" NAME="read_orderst">
	select title_id from title where comp_id = #company_id#
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="read_ordersp">
	select prop_id from property where comp_id = #company_id#
</cfquery>

<cfset orders = read_orderst.recordcount + read_ordersp.recordcount>
<cfset aryOrders[company_id] = orders>
</cfcatch>
</cftry>

<cfset a_color_temp = a_bgcolor>
<cfif read_Abstract_Assigned_Not_Received.SearchType eq 'Purchase'>
<cfset a_bgcolor="FFCC66">
<cfelse>
<cfset a_bgcolor = a_color_temp>
</cfif>


<cfset status_color = "FFFFFF">
<cfset tempdays = 0>

<cftry>
<cfif #product_ordered# eq 'Full Search'>
<cfset new_due_date = DateAdd('d', 3, a_date_assigned)>
<cfif DateDiff('d', DateAdd('d', 3, a_date_assigned), Now()) eq 0>
<cfset tempdays =  DateDiff('d', DateAdd('d', 3, a_date_assigned), Now())>

<cfset status_color = "FFCC00">
<cfelseif DateDiff('d', DateAdd('d', 3, a_date_assigned), Now()) gte 0>
<cfset tempdays =  DateDiff('d', DateAdd('d', 3, a_date_assigned), Now())>
<cfset status_color = "FF3333">
</cfif>

<cfelse>
<cfset new_due_date = DateAdd('d', 2, a_date_assigned)>
<cfif DateDiff('d', DateAdd('d', 2, a_date_assigned), Now()) eq 0>
<cfset tempdays =  DateDiff('d', DateAdd('d', 2, a_date_assigned), Now())>
<cfset status_color = "FFCC00">
<cfelseif DateDiff('d', DateAdd('d', 2, a_date_assigned), Now()) gte 0>
<cfset tempdays =  DateDiff('d', DateAdd('d', 2, a_date_assigned), Now())>
<cfset status_color = "FF3333">
</cfif>
</cfif>

<cfcatch type="any">
<cfset status_color = "FFFFFF">
<cfset tempdays = 0>
</cfcatch>
</cftry>

<cfif get_ab_info.abstractor_name does not contain 'Test Vendor' and get_tc_sent_info.s_status neq 1 and (get_ab_info.abstractor_doc_upload3 eq '' or get_ab_info.abstractor_doc_upload3 eq 'NULL')>
		<tr  >


			<CFIF (#UID# eq "56")or (#UID# eq "214") or (#UID# eq "187")>
                <CFIF #Letter# eq "T"><td bgcolor="#a_bgcolor#" align="center"><a href="./Abstract_Unassigned_Removal.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1&company_id=0&Letter=T" target="_blank"><font size=1 color=blue face=verdana><b>R</b></font></a></td>
			    <CFELSE><td bgcolor="#a_bgcolor#" align="center"><a href="./Abstract_Unassigned_Removal.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1&company_id=0&Letter=P" target="_blank"><font size=1 color=blue face=verdana><b>R</b></font></a></td>
                </CFIF>
            </CFIF>
            <td bgcolor="#status_color#" align="center" width="5"><font size=1 color=black face=verdana><b> </b></font></td>
			<CFIF #Letter# eq "T"><td  bgcolor="#a_bgcolor#" align="center"><a href="title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_order_window"><font size=1 color=blue face=verdana>#prefix#-#id#</font></a></td>
			<CFELSE><td bgcolor="#a_bgcolor#" align="center"><a href="prop_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_order_window"><font size=1 color=blue face=verdana>#prefix#-0232#id#</font></a></td>
			</CFIF>
			<td bgcolor="#a_bgcolor#" align="center"><font size=1 color=black face=verdana><b>#DateFormat(a_insert_date, "m/d/yyyy")#</b></font></td>
			<td bgcolor="#a_bgcolor#" align="center"><font size=1 color=black face=verdana><b>#DateFormat(a_date_assigned, "m/d/yyyy")#</b></font></td>
			<td bgcolor="#a_bgcolor#" align="center"><font size=1 color=black face=verdana><b>#DateFormat(new_due_date, "m/d/yyyy")#</b></font></td>
			<td width=150 bgcolor="#a_bgcolor#" align="center"><font size=1 color=black face=verdana><b>#product_ordered#</b></font></td>
			<td width=150 bgcolor="<cfif orders GT 5>#a_bgcolor#<cfelse>red</cfif>" align="center"><a href="client_modify_display.cfm?company_id=#read_Abstract_Assigned_Not_Received.company_ID#&uid=#URL.uid#&al=#URL.al#" target="_company_window"><font size=1 color=blue face=verdana>#company#</font></a></td>
			<td bgcolor="#a_bgcolor#" align="center"><font size=1 color=black face=verdana><b>#read_Abstract_Assigned_Not_Received.pstate#</b></font></td>
			<CFIF #Letter# eq "T">
                        <CFQUERY datasource="#request.dsn#" NAME="read_IH">
						    SELECT     abstract_ID
						    FROM         tblUser_Roles
						    WHERE     (abstract_ID IS NOT NULL) And Title_ID = #id#
					    </CFQUERY>

						<CFIF #read_IH.recordcount# gte "1"><td  width=150 bgcolor="#a_bgcolor#" align="center"><b><a href="./abstractors_modify_view.cfm?abstractor_id=#get_ab_info.Abstractor_id#&uid=#URL.uid#&al=#URL.al#" target="_abs_window"><font size=1 color=Green face=verdana>#get_ab_info.abstractor_name# </font></a></b></td>
                        <CFELSE><td  width=150 bgcolor="#a_bgcolor#" align="center"><b><a href="./abstractors_modify_view.cfm?abstractor_id=#get_ab_info.Abstractor_id#&uid=#URL.uid#&al=#URL.al#" target="_abs_window"><font size=1 color=Green face=verdana>#get_ab_info.abstractor_name#</font></a></b></td>
						</CFIF>
					<CFELSE>
                        <CFQUERY datasource="#request.dsn#" NAME="read_IH2">
						    SELECT     abstract_ID
						    FROM         tblUser_Roles
						    WHERE     (abstract_ID IS NOT NULL) And Prop_ID = #id#
					    </CFQUERY>
						<CFIF #read_IH2.recordcount# gte "1"><td width=150  bgcolor="#a_bgcolor#" align="center"><b><a href="./update_vendor_management_prop.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_parent"><font size=1 color=Green face=verdana>#get_ab_info.abstractor_name#</font></a></b></td>
                        <CFELSE><td width=150 bgcolor="#a_bgcolor#" align="center"><b><a href="./update_vendor_management_InHouse_prop.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_parent"><font size=1 color=Green face=verdana>#get_ab_info.abstractor_name#</font></a></b></td>
						</CFIF>
					</CFIF>

			<CFIF #Letter# eq "T">
					<CFQUERY datasource="#request.dsn#" NAME="read_taxes">
						SELECT     payoff_ID, payoff_Start_Datetime, payoff_Finish_Datetime, Title_ID
						FROM         dbo.tblUser_Roles
						WHERE     (payoff_Start_Datetime IS NOT NULL) AND (payoff_Finish_Datetime IS NULL) And Title_ID = #id#
					</CFQUERY>
					<CFIF #read_taxes.recordcount# gte 1><td bgcolor="#a_bgcolor#" align="center"><b><a href="./update_vendor_management_taxes_title.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_parent"><font size=1 color=Green face=verdana>#taxes#</font></a></b></td><cfelse><td bgcolor="#a_bgcolor#">&nbsp;</td>
					</CFIF>
				<CFELSE>
					<CFQUERY datasource="#request.dsn#" NAME="read_taxes">
						SELECT     payoff_ID, payoff_Start_Datetime, payoff_Finish_Datetime, Title_ID
						FROM         dbo.tblUser_Roles
						WHERE     (payoff_Start_Datetime IS NOT NULL) AND (payoff_Finish_Datetime IS NULL) And Prop_ID = #id#
					</CFQUERY>
					<CFIF #read_taxes.recordcount# gte 1><td bgcolor="#a_bgcolor#" align="center"><b><a href="./update_vendor_management_taxes_prop.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_parent"><font size=1 color=Green face=verdana>#taxes#</font></a></b></td><cfelse><td bgcolor="#a_bgcolor#">&nbsp;</td>
					</CFIF>
				</CFIF>
				<td bgcolor="#a_bgcolor#" align=center><font size=1 face=verdana><cfif read_Abstract_Assigned_Not_Received.on_hold eq 'True'>X<cfelse>&nbsp;</cfif></td>
				<td bgcolor="#a_bgcolor#" align=center><a href="reports_abstract_assigned_not_received.cfm?uid=#uid#&al=#al#&rec_id=#id#&move=1&type=#letter#"><font size=1 face=verdana>Move</font></a></td>
		</tr>
		<CFIF #a_color_trigger# eq "1">
				<CFSET a_bgcolor = "white">
				<CFSET a_color_trigger = "2">
			<CFELSE>
				<CFSET a_bgcolor = "d3d3d3">
				<CFSET a_color_trigger = "1">
			</CFIF>
</cfif>
</CFOUTPUT>
		</table>
</body>
</html>
