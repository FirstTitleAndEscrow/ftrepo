<CFPARAM NAME="a_fname" DEFAULT="">
<CFPARAM NAME="a_lname" DEFAULT="">
<CFPARAM NAME="a_user" DEFAULT="">
<CFPARAM NAME="a_date" DEFAULT="">
<CFPARAM NAME="a_time" DEFAULT="">
<CFPARAM NAME="a_ip" DEFAULT="">
<CFPARAM NAME="vendor" DEFAULT="">
<CFPARAM NAME="calendar" DEFAULT="">
<CFPARAM NAME="order" DEFAULT="">
<!---d3d3d3--->
<CFSET a_bgcolor = "d3d3d3">
<CFSET a_color_trigger = "1">

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_user">
	select * from first_admin

			WHERE ID = #session.ft_user_id#
</CFQUERY>


<html>
<head>
	<title>Vendor Management</title>
</head>

<body>
<TABLE cellSpacing=1 cellPadding=1 width="100%" align=center>
	<tr>
    	<td valign="middle" height="76"><IMG style="WIDTH: 980px; HEIGHT: 70px" height=70 src="images/logo_menu_1.gif" width=825 ></td>
  	</tr>
	
</table>    
<cfoutput>
<table>
	<tr>
		<TD align="center" >
			<B><P>Welcome&nbsp;#a_fname#&nbsp;#a_lname#&nbsp;to the Vendor Management Screen.&nbsp;&nbsp;The Date is #DateFormat(Now(), "m/d/yyyy")# and time #LSTimeFormat(Now(),"hh:mm tt")#</P></B>
		</TD>
	</tr>
</TABLE>
<CFQUERY DATASOURCE="#request.dsn#" NAME="get_current_user">		
			SELECT *
			FROM First_Admin
			WHERE ID = #session.ft_user_id#
		</CFQUERY>

The following reports are currently available to you. Clicking on these reports will launch them in a new window, which you can keep open while working in other windows. This will eliminate the need to "return" to the report and re-run it.<br>
<br>
<br>
<ul>
	<!---
<li><a href="reports_abstract_unassigned.cfm?uid=#URL.uid#&al=#URL.al#" target="abstract_unassigned">Abstract Unassigned</a></li>
<li><a href="reports_abstract_assigned_not_received.cfm?uid=#URL.uid#&al=#URL.al#" target="abstract_assigned_not_received">Abstract Assigned Not Received</a></li>
<li><a href="reports_tax_data_not_completed.cfm?uid=#URL.uid#&al=#URL.al#" target="tax_data_not_completed">Tax Data Not Completed</a></li>


<cfif read_user.streamline_employee eq 'True'>
<li><a href="streamline_lp_report.cfm?uid=#url.uid#" target="new">Streamline&nbsp;Loan<BR>
Processor&nbsp;Report</a></li></cfif>
<cfif read_user.streamline_employee eq 'True'>
<li><a href="reports_ab_received_client_system_not_updated.cfm?uid=#url.uid#&al=1" target="new">Abstract Received, Client Sytem NOT Updated</a></li></cfif>
<cfif read_user.streamline_employee eq 'True'>
<li><a href="streamline_order_feed.cfm?uid=#url.uid#&al=1" target="new">Streamline Automatic Order Feed</a></li></cfif>
<li><a href="reports_title_claims_issues.cfm?uid=#url.uid#&al=1" target="new">Unresolved Title Claims / Title Issues</a></li>
<!---<cfif session.ft_user_id eq 417 or session.ft_user_id eq 240>--->
--->
<li><a href="vendor_add2_sb.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="new">Vendors Add</a></li>
<li><a href="vendor_modify_choose_sb.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="new">Vendors Modify</a></li>
<li><a href="client_modify_sb.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="new">Client Modify</a></li>
<li><a href="login_as_client_sb.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="new">Login As Client</a></li>
<!---
<li><a href="reports_abstract_unassigned_sb.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="new">Abstracts Unassigned</a></li>
<li><a href="reports_abstract_assigned_not_received_sb.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="new">Abstracts Assigned Not Yet Received</a></li>
--->
</ul>
</cfoutput>



	


</body>
</html>
