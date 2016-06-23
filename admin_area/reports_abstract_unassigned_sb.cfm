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
<title>Abstract Unassigned</title>
<script language="javascript">

function to_excel() {
document.excel_form.submit();
}
</script>

</head>
<cfset the_date = DateFormat(DateAdd("d", -90, Now()), "mm/dd/yyyy")>
<cfset sixty_days_old = DateFormat(DateAdd("d", -60, Now()), "mm/dd/yyyy")>
<body>
<cfoutput>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_Abstract_Not_Assigned">
SELECT    *
FROM         sqlTitle_Abstract_Not_Assigned_sb
WHERE     a_insert_date > '#sixty_days_old#'
UNION
SELECT    *
FROM         sqlProp_Abstract_Not_Assigned_sb
WHERE     a_insert_date > '#sixty_days_old#'
</CFQUERY>
</cfoutput>

<cfoutput>
<form name="excel_form" action="reports_abstract_unassigned_sb.cfm?uid=#URL.uid#&al=#URL.al#" method="post">
<input type="hidden" name="excel" value="1">
</form>
</cfoutput>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="excel_submit" type="button" onclick="to_excel();" value="EXPORT TO EXCEL"><br>




<cfoutput>
<TABLE cellSpacing=1 cellPadding=1 width="100%" align="Center">
	<tr>
		<td align="center"
            <CFIF (#UID# eq "56")or (#UID# eq "214") or (#UID# eq "187")>
              colspan = 8
            <CFELSE>
              colspan= 7
            </CFIF>
            width="100%">
			<B>Abstract Unassigned</B>
		</td>
	</tr>
	<tr>
		<td align="center" ><font size=1 color=black face=verdana><b>Assigned</b></font></td>
        <!---Pam Heidi Harry--->
        <CFIF (#UID# eq "56")or (#UID# eq "214") or (#UID# eq "187")>
        <td align="center"><font size=1 color=black face=verdana><b>Remove</b></font></td>
        </CFIF>
		<td align="center"><font size=1 color=black face=verdana><b>Order Num</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>Order Date</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>Due Date</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>Company Name</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>State</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>Abstractor</b></font></td>
		<td align="center"><font size=1 color=black face=verdana><b>Taxes</b></font></td>
	</tr>
	</cfoutput>
<CFOUTPUT MAXROWS="500000" StartRow="1" QUERY="read_Abstract_Not_Assigned">
<cfset a_color_temp = a_bgcolor>
<cfif read_abstract_Not_Assigned.SearchType eq 'Purchase'>
<cfset a_bgcolor="FFCC66">
<cfelse>
<cfset a_bgcolor = a_color_temp>
</cfif>
    <tr>
	    <CFIF #Letter# eq "T">
			<td bgcolor="#a_bgcolor#" align="center"><a href="./title_abstract_doc_view_sb.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1&company_id=0" target="_blank"><font size=1 color=red face=verdana><b>A</font></a></td>
		<CFELSE>
			<td bgcolor="#a_bgcolor#" align="center"><a href="./prop_abstract_doc_view_sb.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1&company_id=0" target="_blank"><font size=1 color=red face=verdana><b>A</font></a></td>
		</CFIF>
        <CFIF (#UID# eq "56")or (#UID# eq "214") or (#UID# eq "187")>
            <CFIF #Letter# eq "T">
                <td bgcolor="#a_bgcolor#" align="center"><a href="./Abstract_Unassigned_Removal_sb.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1&company_id=0&Letter=T" target="_blank"><font size=1 color=blue face=verdana><b>R</font></a></td>
  	        <CFELSE>
			    <td bgcolor="#a_bgcolor#" align="center"><a href="./Abstract_Unassigned_Removal_sb.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1&company_id=0&Letter=P" target="_blank"><font size=1 color=blue face=verdana><b>R</font></a></td>
            </CFIF>
        </CFIF>
		<CFIF #Letter# eq "T">
			<td bgcolor="#a_bgcolor#"><a href="title_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>T-#id#</font></a></td>
		<CFELSE>
			<td bgcolor="#a_bgcolor#"><a href="prop_report_modify.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_blank"><font size=1 color=blue face=verdana>P-0232#id#</font></a></td>
		</CFIF>
		<td bgcolor="#a_bgcolor#" align="center"><font size=1 color=black face=verdana><b>
			#DateFormat(a_insert_date, "m/d/yyyy")#</b></font></td>
		<td bgcolor="#a_bgcolor#" align="center"><font size=1 color=black face=verdana><b>
		    #DateFormat(DueDate, "m/d/yyyy")#</b></font></td>
		<td bgcolor="#a_bgcolor#" align="center"><font size=1 color=black face=verdana><b>
			<a href="client_modify_display.cfm?company_id=#read_Abstract_Not_Assigned.companyID#&uid=#URL.uid#&al=#URL.al#" target="_company_window"><font size=1 color=blue face=verdana>#company#</a></b></font></td>
		<td bgcolor="#a_bgcolor#" align="center"><font size=1 color=black face=verdana><b>
			#pstate#</b></font></td>
		<td bgcolor="#a_bgcolor#" align="center">
		<CFIF #Letter# eq "T">
                <CFQUERY DATASOURCE="#request.dsn#" NAME="read_IH">
						    SELECT     abstract_ID
						    FROM         tblUser_Roles
						    WHERE     (abstract_ID IS NOT NULL) And Title_ID = #id#
				</CFQUERY>
                <CFIF #read_IH.recordcount# gte "1">
				<b><a href="./update_vendor_management_title.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_parent"><font size=1 color=Green face=verdana>#abstractor#</font></a></b>
                <CFELSE>
				<b><a href="./update_vendor_management_InHouse_title.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_parent"><font size=1 color=Green face=verdana>#abstractorIH#</font></a></b>
				</CFIF>
			<CFELSE>
                <CFQUERY DATASOURCE="#request.dsn#" NAME="read_IH2">
						    SELECT     abstract_ID
						    FROM         tblUser_Roles
						    WHERE     (abstract_ID IS NOT NULL) And Prop_ID = #id#
                </CFQUERY>
                <CFIF #read_IH2.recordcount# gte "1">
				<b><a href="./update_vendor_management_prop.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_parent"><font size=1 color=Green face=verdana>#abstractor#</font></a></b>
                <CFELSE>
				<b><a href="./update_vendor_management_InHouse_prop.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_parent"><font size=1 color=Green face=verdana>#abstractor#</font></a></b>
                </CFIF>
			</CFIF>
		</td>
		<td bgcolor="#a_bgcolor#" align="center">
		<CFIF #Letter# eq "T">
		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_taxes">
						SELECT     payoff_ID, payoff_Start_Datetime, payoff_Finish_Datetime, Title_ID
						FROM         dbo.tblUser_Roles
						WHERE     (payoff_Start_Datetime IS NOT NULL) AND (payoff_Finish_Datetime IS NULL) And Title_ID = #id#
				</CFQUERY>
				<CFIF #read_taxes.recordcount# gte 1>
				<b><a href="./update_vendor_management_taxes_title.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_parent"><font size=1 color=Green face=verdana>#taxes#</font></a></b>
				</CFIF>
			<CFELSE>
				<CFQUERY DATASOURCE="#request.dsn#" NAME="read_taxes">
						SELECT     payoff_ID, payoff_Start_Datetime, payoff_Finish_Datetime, Title_ID
						FROM         dbo.tblUser_Roles
						WHERE     (payoff_Start_Datetime IS NOT NULL) AND (payoff_Finish_Datetime IS NULL) And Prop_ID = #id#
				</CFQUERY>
				<CFIF #read_taxes.recordcount# gte 1>
				<b><a href="./update_vendor_management_taxes_prop.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_parent"><font size=1 color=Green face=verdana>#taxes#</font></a></b>
				</CFIF>
			</CFIF>
		</td>
	</tr>
	<CFIF #a_color_trigger# eq "1">
		<CFSET a_bgcolor = "white">
		<CFSET a_color_trigger = "2">
	<CFELSE>
		<CFSET a_bgcolor = "d3d3d3">
		<CFSET a_color_trigger = "1">
	</CFIF>
</CFOUTPUT>

</body>
</html>
