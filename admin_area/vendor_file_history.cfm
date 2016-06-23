<cfparam name="url.rec_id" default="0">
<cfparam name="url.task" default="All">
<cfparam name="url.Order_type" default="T">



<CFQUERY datasource="#request.dsn#" NAME="read_history">
			SELECT *
			FROM Vendor_Tracker_New v, Vendors_STACIE s
			where v.order_id = #url.rec_id#
			and v.order_type = '#url.order_type#'
			<cfif url.task neq 'All'>
			and v.task = '#url.task#'
			</cfif>
			and s.vendor_id = v.vendor_id
			ORDER BY v.assign_date, assign_time desc
</CFQUERY>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Untitled Page</title>
<meta name="generator" content="WYSIWYG Web Builder - https://www.wysiwygwebbuilder.com">
<style type="text/css">
body
{
   background-color: #FFFFFF;
   color: #000000;
}

TD {font-size:11px; font-family:Arial, Helvetica, sans-serif; color:#000000;}
</style>
<font size=2 face="Arial, Helvetica, sans-serif"><center><cfoutput>Vendor Assignment History for<br>
File: #url.Order_type#-#url.rec_id#<br>
<cfif url.task neq 'ALL'>
#url.task#
</cfif><br>
</cfoutput></center><br></font>

<cfif read_history.recordcount eq 0>
<table cellpadding=3 cellspacing=1>
<tr bgcolor=ffffff>
<td align=left valign=bottom width="600"><strong>This file has not been assigned</strong></td></tr></table>
<cfelse>
<table width="570" cellpadding=0 cellspacing=0>
<tr bgcolor=000000><td><table cellpadding=3 cellspacing=1>
<tr bgcolor=ffffff>
<td align=left valign=bottom width="70"><strong>Assigned Date</strong></td>
<td align=left valign=bottom width="70"><strong>Task</strong></td>
<td align=left valign=bottom width="70"><strong>Product</strong></td>
<td align=left valign=bottom width="70"><strong>Vendor</strong></td>
<td align=left valign=bottom width="70"><strong>Returned Date</strong></td>
<td align=left valign=bottom width="70"><strong>Completed</strong></td>
<td align=left valign=bottom width="70"><strong>Assigned By</strong></td>
<td align=right valign=bottom width="70"><strong>Price</strong></td>
</tr>


<cfoutput query="read_history">
<CFQUERY datasource="#request.dsn#" NAME="find_assigned_by">
			SELECT *
			FROM First_admin
			where ID = #read_history.assigned_by#
</CFQUERY>

<tr bgcolor=ffffff>
<td align=left valign=bottom width="70">#DateFormat(assign_date, "m/dd/yy")#</td>
<td align=left valign=bottom width="70">#read_history.task#</td>
<td align=left valign=bottom width="70">#read_history.product_ordered# <cfif read_history.product_ordered eq 'bring_to_date'>(#DateFormat(read_history.bring_to_date, "m/dd/yy")#)</cfif></td>
<td align=left valign=bottom width="70">#read_history.company#</td>
<td align=left valign=bottom width="70"><cfif read_history.return_date neq 'NULL'>#DateFormat(return_date, "m/dd/yy")#</cfif></td>
<td align=left valign=bottom width="70"><cfif read_history.completed eq 1><strong><font color="green">Yes</font></strong><cfelseif  read_history.completed eq 0><strong><font color="red">No</font></strong></cfif></td>
<td align=left valign=bottom width="70">#find_assigned_by.fname# #find_assigned_by.lname#</td>
<td align=right valign=bottom width="70">#DollarFormat(read_history.assigned_price)#</td>
</tr>
</cfoutput>
</cfif>


</table>
</td></tr></table>
</body>
</html>