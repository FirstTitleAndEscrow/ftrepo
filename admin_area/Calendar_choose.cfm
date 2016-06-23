<!---This variable right here will be used to send you to the calendar you need to go to
If Trigger is 1 then go the the Closing/Funding Calendar
If Trigger is 0 or null then go to the Processing Calendar
--->
<CFPARAM NAME="Trigger" DEFAULT="1">




<cfquery datasource="#request.dsn#" name="getuser">
	select * from first_admin
	where id = #url.uid#
</cfquery>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>Untitled</title>
</head>
<BODY BGCOLOR="elelel" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">
<CENTER>
    <table width=500 border="0" cellpadding="0" cellspacing="0" background="">
        <tr>
            <td width=500 align=right valign=top>
<CFOUTPUT>
                <font size=1 color=blue face=arial><NOBR>[ #DateFormat(Now(), "ddddd")# ]&nbsp;&nbsp;&nbsp; #DateFormat(Now(), "mmmmm dd, yyyy")# - #TimeFormat(Now(), "HH:mm:ss")# (Eastern Standard Time)&nbsp;&nbsp;&nbsp;&nbsp;</NOBR>
</CFOUTPUT>     <p><br><p></p></font></td></tr>
    </table>
</CENTER>
<CENTER><br><br><br><br><br>
<!---This goes to the Funding Closing Department--->

<!--- ./calendar_search_0709.cfm?uid=#uid#&al=#URL.al# --->
<cfif #trigger# EQ "1"> 
    <CFFORM NAME="frm" ACTION="./calendar_search_0709.cfm?uid=#uid#&al=#URL.al#" METHOD=POST>
        <input type="hidden" name="uid" value="<cfoutput>#getuser.id#</cfoutput>">
        
    <table border="0"  width=500 cellpadding="1" cellspacing="1" align = "center">
	    <tr align="center" valign=top bgcolor=navy>
			<td width=500  align="center" valign=top bgcolor=blue>
			<CENTER><font size=2 color=white face=arial align="center">
				             Choose the Company for which to administer closings from calendar </CENTER>
				<CFIF #getuser.role_ID# neq "24" or (session.mi_employee eq 1) or (session.mo_employee eq 1) or (session.mi_flushing_employee eq 1) or (session.ft_fairfax_employee eq 1) or (session.va_employee eq 1) or (session.tx_employee eq 1) or (session.ft_user_id eq 366)><CENTER><font size=2 color=white face=arial align="center">
				            Note: Uncheck "ALL" option if you select one or more clients</CENTER></cfif>
			</td>
        </tr><tr>
			<td width=500  align=center valign=top bgcolor=d1d1d1>
				<SELECT NAME="comp_id" 		multiple	
			size="7" 
			style="font-size: 9; 
			font-family: verdana; 
			font-style: normal; 
			color: blue; 
			background-color: e1e1e1; 
			border-color: e1e1e1; 
			border-left-width: thin; 
			border-right-width: thin; 
			border-top-width: thin; 
			border-bottom-width: thin; 
			border-width: thin; 
			border-style: bar; 
			clear: none; 
			float: none;" 
			rows="5" 
			cols="45" 
			> 
			<CFINCLUDE TEMPLATE="./includes/companies.cfm">
			



  

<cfif session.ft_user_id eq 322>
<CFQUERY datasource="#request.dsn#" NAME="read_kelly_companies">
	SELECT *
	FROM companies
	WHERE a_status = 1 and streamline_client <> 1
</CFQUERY>
<cfset full_list_comp_ids = ValueList(read_kelly_companies.ID, ",")>
</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_companies">
	SELECT *
	FROM companies
	WHERE ID in (#full_list_comp_ids#) order by company
</CFQUERY>

			
			
			<CFIF #getuser.role_ID# neq "24" or (session.mi_employee eq 1) or (session.mo_employee eq 1) or (session.mi_flushing_employee eq 1) or (session.ft_fairfax_employee eq 1) or (session.va_employee eq 1) or (session.tx_employee eq 1) or (session.ft_user_id eq 366)>
			<option value="ALL" selected>ALL</option>
			</CFIF>
			<CFOUTPUT QUERY="read_companies"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>			
			</SELECT>		
			</td>
		</tr>
		
		<tr>
			<td width=500 colspan=2  align=center valign=top bgcolor=d1d1d1>
				<INPUT TYPE=IMAGE SRC="./images/button_proceed.gif" border=0> 
			</td>	
		</tr>
		
		
	</table></CENTER>


</CFFORM>	
<CFELSE>



    <!---This goes to the Processing Closing Department--->
    <CFFORM NAME="frm" ACTION="./calendar.cfm?uid=#uid#&al=#URL.al#" METHOD=POST>
        <table border="0"  width=500 cellpadding="1" cellspacing="1" align = "center">
		    <tr align="center" valign=top bgcolor=navy>
			    <td width=500  align="center" valign=top bgcolor=blue>
				    <CENTER><font size=2 color=white face=arial align="center">
				             Choose the Company for which to administer closings from calendar </CENTER>
<CFIF #getuser.role_ID# neq "24" or (session.mi_employee eq 1) or (session.mo_employee eq 1) or (session.mi_flushing_employee eq 1) or (session.ft_fairfax_employee eq 1) or (session.va_employee eq 1) or (session.tx_employee eq 1) or (session.ft_user_id eq 366)><CENTER><font size=2 color=white face=arial align="center">
				            Note: Uncheck "ALL" option if you select one or more clients</CENTER></cfif>
			    </td>
            </tr>
            <tr>
			    <td width=500  align=center valign=top bgcolor=d1d1d1>
				    <SELECT NAME="comp_id" 		multiple	
			size="7" 
			style="font-size: 9; 
			font-family: verdana; 
			font-style: normal; 
			color: blue; 
			background-color: e1e1e1; 
			border-color: e1e1e1; 
			border-left-width: thin; 
			border-right-width: thin; 
			border-top-width: thin; 
			border-bottom-width: thin; 
			border-width: thin; 
			border-style: bar; 
			clear: none; 
			float: none;" 
			rows="5" 
			cols="45" 
			>
			<CFINCLUDE TEMPLATE="./includes/companies.cfm">
			
<cfif session.ft_user_id eq 322>
<CFQUERY datasource="#request.dsn#" NAME="read_kelly_companies">
	SELECT *
	FROM companies
	WHERE a_status = 1 and streamline_client <> 1
</CFQUERY>
<cfset full_list_comp_ids = ValueList(read_kelly_companies.ID, ",")>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_companies">
	SELECT *
	FROM companies
	WHERE ID in (#full_list_comp_ids#)  order by company
</CFQUERY>
			<CFIF #getuser.role_ID# neq "24" or (session.mi_employee eq 1) or (session.mo_employee eq 1) or (session.mi_flushing_employee eq 1) or (session.ft_fairfax_employee eq 1)  or (session.va_employee eq 1) or (session.tx_employee eq 1) or (session.ft_user_id eq 366)>
			<option value="ALL" selected>ALL</option>
			</CFIF>
			<CFOUTPUT QUERY="read_companies"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>			
			</SELECT>		
			</td>
		</tr>
		
		<tr>
			<td width=500 colspan=2  align=center valign=top bgcolor=d1d1d1>
				<INPUT TYPE=IMAGE SRC="./images/button_proceed.gif" border=0> 
			</td>	
		</tr>
		
		
	</table></CENTER>


</CFFORM>	

</cfif>
</BODY>
</html>
