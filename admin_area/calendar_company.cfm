<cfparam name="url.uid" default=0>
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
<!--- 188 = Denise Miller, 19=Toronica Woods, 73 = Monique Smith, 74 = Nicole Brown, 159 =Charles Chen, 134=noone
136=Michael Stone, 120=noone, 77=Shelly Brown, 67=noone, 150=noone, 10=Christie Greeno, 21=Maryska Mouyal
80=Allison Kemp, 85=Keri Burton, 110=noone, 149=noone, 151=Mary Alvarez, 152=shavon Deal,111=noone, 117=noone  --->
<cfif #uid# EQ "188" OR #uid# EQ "187" OR #UID# EQ "19" OR #UID# EQ "221" OR #UID# EQ "73" OR #UID# EQ "74" OR #UID# EQ "159" OR #UID# EQ "77" OR #UID# EQ "10" OR #UID# EQ "80" OR #UID# EQ "111" OR #UID# EQ "234" OR #UID# EQ "90" OR #UID# EQ "218" OR #UID# EQ "274" or #UID# EQ "289"
or #getuser.Role_ID# eq 1> <!---Accounting-Funding Department --->
<CFFORM NAME="frm" ACTION="./calendar_search_0709.cfm?uid=#uid#&al=#URL.al#" METHOD=POST>
<input type="hidden" name="uid" value="#getuser.id#">
<table border="0"  width=500 cellpadding="1" cellspacing="1" align = "center">
		
		<tr align="center" valign=top bgcolor=navy>
			<td width=500  align="center" valign=top bgcolor=blue>
				<CENTER><font size=2 color=white face=arial align="center">
				            Note: Uncheck "ALL" option if you select one or more clients</CENTER>
			</td><CENTER><font size=2 color=white face=arial align="center">
				             Choose the Company for which to administer closings from calendar </CENTER>
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
			<CFIF #getuser.role_ID# neq "24">
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
<CFFORM NAME="frm" ACTION="./calendar.cfm?uid=#uid#&al=#URL.al#" METHOD=POST>
<table border="0"  width=500 cellpadding="1" cellspacing="1" align = "center">
		
		<tr align="center" valign=top bgcolor=navy>
			<td width=500  align="center" valign=top bgcolor=blue>
				<CENTER><font size=2 color=white face=arial align="center">
				            Note: Uncheck "ALL" option if you select one or more clients </CENTER>
			</td><CENTER><font size=2 color=white face=arial align="center">
				             Choose the Company for which to administer closings from calendar </CENTER>
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
			
			<option value="ALL" selected>ALL</option>
			
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
