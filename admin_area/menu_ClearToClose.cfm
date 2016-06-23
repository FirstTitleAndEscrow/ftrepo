	<CFSET MaxRows = 2000>
	<CFSET StartRow = 1>
<CFPARAM NAME="a_fname" DEFAULT="">
<CFPARAM NAME="a_lname" DEFAULT="">
<CFPARAM NAME="a_user" DEFAULT="">
<CFPARAM NAME="a_date" DEFAULT="">
<CFPARAM NAME="a_time" DEFAULT="">
<CFPARAM NAME="a_ip" DEFAULT="">
<CFPARAM NAME="vendor" DEFAULT="">
<CFPARAM NAME="calendar" DEFAULT="">
<CFPARAM NAME="order" DEFAULT="">
<CFPARAM NAME="role_mgr" DEFAULT="">

<cfset ninety_days_ago = DateAdd("d", -90, Now())>

<CFSET a_bgcolor = "d3d3d3">
<CFSET a_color_trigger = "1">

<CFQUERY datasource="#request.dsn#" NAME="read_user">
	select * from first_admin
			WHERE ID = #session.ft_user_id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_NotClear_To_Close_Name">
	Select * from sqlCTC_NotClear_To_Close where CTC_Name = '#a_fname#'
	<cfif session.ft_user_id eq 462 or read_user.fairfax_admin eq 1>
	and fairfax_client = 1
	</cfif>
	<cfif session.ft_user_id eq 418 or session.ft_user_id eq 411>
	and (streamline_client = 0 or streamline_client = NULL)
	</cfif>
</CFQUERY>

<cfset chase_realEC_accts = "7393,7402">
<html>
<head>
<title>Clear To Close</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
<script>

function ctcAssign(title_id){

			//var datastring = {questionTabID:$('#QuestionTabID').val()};
			$.ajax(
	           {
				type:"POST",
	               url:"/cfc/ctcAssign.cfc?method=assignCTC&returnformat=plain&title_id="+title_id+"&assignedToID="+$('#ctc_'+title_id).val(),
	               //data:datastring,
	               success: function(response)
	               {
					var resp = jQuery.trim(response);
					
	                //$("#practiceData").html(resp);
	     
	       
	                
	                


	               }
	           });

}
</script>
<style> 
ul { margin-left: 467px;
			margin-right: 150px; 
			margin-top: 10px;
}

</style>
</head>

<body>
<table width="893" cellpadding=1 cellspacing=1 border=0 bgcolor=white></table>
<table width="893" align="center" height="85" border="0" style="WIDTH: 893px; HEIGHT: 85px">
	<tr>
    	<td align= "middle" height="76"><IMG style="WIDTH: 891px; HEIGHT: 70px" height=70 src="images/logo_menu_1.gif" width=825 ></td>
  	</tr>
	<TR>
		<TD><cfif IsDefined("session.ft_user_id") and session.ft_user_id neq 323>
<CFOUTPUT>
<cfFORM NAME="Search" METHOD="post" ACTION="https://#cgi.server_name#/admin_area/title_REP_display_single.cfm?uid=#URL.uid#&al=#URL.al#" >
  				<FONT FACE=ARIAL SIZE=2 color="gray">Quick Search</font><input type=text name="number" size=10 maxlength=15
					size="1"
					style="font-size: 9;
					font-family: verdana;
					font-style: normal;
					color: blue;
					background-color: e6e6e6;
					border-color: e6e6e6;
					border-left-width: thin;
					border-right-width: thin;
					border-top-width: thin;
					border-bottom-width: thin;
					border-width: thin;
					border-style: bar;
					clear: none;"
					>
					<input type="image" src="https://#cgi.server_name#/admin_area/images/button_search.gif" border=0 alt="Quick file search">
</cfFORM>
</CFOUTPUT></cfif>

<a href="http://firsttitle.sysaidit.com" target="new">Help Desk</a>

		</TD>
	</TR>
<tr><td><cfoutput><a href="https://#cgi.server_name#/admin_area/FT_Policies/ft_policies.cfm" target="New" onClick="window.open('','New','left=0,top=0,width=400,height=400,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">Company Policies</a><BR></cfoutput><br></td></tr>
</table>
<cfif IsDefined("session.ft_user_id") and session.ft_user_id neq 323>
<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">
	<tr>
		<td width="111" bgcolor="#CCD2D2"><cfif read_user.streamline_employee eq 'True'><a href="reports_ab_received_client_system_not_updated.cfm?uid=#url.uid#&al=1" target="new">Abstract Received, Client Sytem NOT Updated</a></cfif></td>
		<td width="111" bgcolor="#CCD2D2"><cfif read_user.streamline_employee eq 'True'>
<a href="streamline_lp_report.cfm?uid=#url.uid#" target="new">Streamline&nbsp;Loan<BR>
Processor&nbsp;Report</a>
</cfif></td>
		<td width="111" bgcolor="#CCD2D2">
				<Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/cancelled_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color="660000" face=verdana>Cancelled</font></a>
				</cfoutput>
				</CENTER>
		</td>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/title_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank"><font size=2 color=blue face=verdana>Orders</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/calendar_company.cfm?uid=#URL.uid#&al=#URL.al#"target="_blank"><font size=2 color=green face=verdana>Calendar</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/statistics_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=red face=verdana>Statistics</font></a></cfoutput></CENTER>
			<CFIF #role_mgr# eq "1">
				<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/monitor_user.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=yellow face=verdana>Monitor User</font></a></cfoutput></CENTER>
			</CFIF>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/weblinks_search.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=orange face=verdana>Web Links</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><A HREF="#" onClick="location.reload()">Refresh</A></center></td>
		<td width="111" bgcolor="#CCD2D2"><Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/login_as_client.cfm?uid=#URL.uid#&al=#URL.al#" target="client_window">
				<font size=2 color=blue face=verdana>Login As Client</font></a>
				</cfoutput>
				</CENTER></td>
		<td width="111" bgcolor="#CCD2D2"><Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/met/projects" target="projects_window">
				<font size=2 color=blue face=verdana>Projects</font></a>
				</cfoutput>
				</CENTER></td>
</tr></table> </cfif>
<ul> 
		<!--- New Reports Menu --->
       <cfinclude template="/admin_area/met/ricks_page.cfm">
	</ul>
<table width="100%">
	<tr>
		<TD align="center">
			<B><P align=center>Welcome&nbsp;<CFOUTPUT>#a_fname#&nbsp;#a_lname#&nbsp;</CFOUTPUT>to the First Title
            Clear To Close Log In Screen.&nbsp;&nbsp;<CFOUTPUT>The Date is #DateFormat(Now(), "m/d/yyyy")# and time #LSTimeFormat(Now(),"hh:mm tt")#</CFOUTPUT></P></B>
		</TD>
	</tr>
</table>
<table width="100%">
<tr>
<td align="left" valign="top">
<blockquote>
The three reports that used to live on this page have been divided into separate links (below). Each report opens in a new window. This was done to decrease the load on the server, and prevent crashes.<br>
<br>
<UL>
<cfoutput><LI><a href="report_binder_data_not_merged.cfm?uid=#uid#&al=#al#" target="report1">Binder Data Not Merged</a></LI>
<LI><a href="report_binder_typed_ins_not_complete.cfm?uid=#uid#&al=#al#" target="report2">Binder Typed / Ins. Not Completed</a></LI>
<LI><a href="report_title_ins_complete_not_clear_all.cfm?uid=#uid#&al=#al#" target="report3">Title Ins Complete / Not Clear to Close</a></LI>

<LI><a href="report_binder_data_not_merged.cfm?uid=#uid#&al=#al#&sbonly=1" target="report6">Binder Data Not Merged S&B Only</a></LI>
<LI><a href="report_binder_typed_ins_not_complete.cfm?uid=#uid#&al=#al#&sbonly=1" target="report2">Binder Typed / Ins. Not Completed S&B Only</a></LI>
<LI><a href="report_title_ins_complete_not_clear_all.cfm?uid=#uid#&al=#al#&sbonly=1" target="report3">Title Ins Complete / Not Clear to Close S&B Only</a></LI>

<LI><a href="report_binder_typed_ins_not_complete.cfm?uid=#uid#&al=#al#&streamlineonly=1" target="report2">Binder Typed / Ins. Not Completed Streamline Only</a></LI>
<LI><a href="report_title_ins_complete_not_clear_all.cfm?uid=#uid#&al=#al#&streamlineonly=1" target="report3">Title Ins Complete / Not Clear to Close Streamline Only</a></LI>

</cfoutput>
<cfif session.ft_user_id eq 476 OR session.ft_user_id eq 500 OR session.ft_user_id eq 499>
	<LI><a href="reports_tracking_new.cfm" target="report4">Chase/RealEC Turn Time Report</a></LI>
</cfif>
<cfif session.ft_user_id eq 427 or session.ft_user_id eq 476 or session.ft_user_id eq 487>
<LI><a href="reports_waiting_on_docs.cfm?uid=#url.uid#" target="commissions">Waiting on Docs</a></LI>
<LI><a href="reports_funded_without_policy.cfm?uid=<cfoutput>#url.uid#&al=0</cfoutput>" target="new">Loan Funded Policy Not Uploaded</a></LI>
<LI><a href="report_funded_without_recording.cfm?uid=<cfoutput>#url.uid#&al=0</cfoutput>" target="new">Loan Funded Recording Not Uploaded</a></LI>
</cfif>
<cfif session.ft_user_id eq 500>
<cfoutput>
<li><a href="reports_abstract_unassigned.cfm?uid=#URL.uid#&al=#URL.al#" target="abstract_unassigned">Abstract Unassigned</a></li>
<li><a href="reports_abstract_assigned_not_received.cfm?uid=#URL.uid#&al=#URL.al#" target="abstract_assigned_not_received">Abstract Assigned Not Received</a></li>
<li><a href="reports_tax_data_not_completed.cfm?uid=#URL.uid#&al=#URL.al#" target="tax_data_not_completed">Tax Data Not Completed</a></li>
</cfoutput>
</cfif>



<cfif session.ft_user_id eq 499>
	<LI><a href="reports_tracking_flagstar.cfm" target="new">Flagstar Turntime Report</a></LI>
</cfif>

</UL>
</blockquote>
</td>
</tr></table>
<!---
	<cfinclude template="team_popup.cfm">
--->