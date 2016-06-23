
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>

</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>



<CENTER>

<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=500 align=center valign=top>
		
<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

	<tr>
		<td width=499 align=center valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>

<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

<CFOUTPUT>
	<tr>
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=black face=arial>Modify Mortgage Client/Customer
		</td>
	</tr>
</CFOUTPUT>	

</table>

		</td>
	</tr>


<CFOUTPUT>
	<!--- <FORM METHOD=POST ACTION="./client_modify_display_dev.cfm?uid=#URL.uid#&al=#URL.al#"> --->
	<FORM METHOD=POST ACTION="./client_modify_display.cfm?uid=#URL.uid#&al=#URL.al#">
</CFOUTPUT>


		
	<tr>
		<td width=499 align=center valign=top bgcolor=white>
			

<table width=498 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>		
		
		<td width=497 align=center valign=top bgcolor=e1e1e1>	
			<img src="./images/clear.gif" height=10 width=85>
			<FONT SIZE=1 color=black face=arial>
			From the list below, Select a Client to Modify.
		
		</td>
	</tr>		

	<tr>		
		
		<td width=497  align=right valign=top bgcolor=e1e1e1>	
			<SELECT NAME="company_id"			
			size="1" 
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
<CFQUERY datasource="#request.dsn#" NAME="read_user" cachedwithin="#CreateTimeSpan(0,0,1,0)#">
	SELECT  *
	FROM	First_Admin 
	where id = #session.ft_user_id#
</CFQUERY>
<cfif read_user.role_id eq 34> <!--- new sales admin role --->
<CFQUERY datasource="#request.dsn#" NAME="read_companies" cachedwithin="#CreateTimeSpan(0,0,1,0)#">
SELECT c.*
FROM Companies c
where 
c.test_account = 0
and c.streamline_client <> 1
		<cfif GetBaseTemplatePath() contains 'title_rep_display.cfm'>
		ORDER BY c.ID
		<cfelse>
		ORDER BY c.COMPANY ASC
		</cfif>
	</CFQUERY>
</cfif>

<cfif session.ft_user_id eq 252 or  session.ft_user_id eq 362 or  session.ft_user_id eq 449><!--- if this is Heid- --->
<CFQUERY datasource="#request.dsn#" NAME="read_companies" cachedwithin="#CreateTimeSpan(0,0,1,0)#">
SELECT c.*
FROM Companies c
where 
c.test_account = 0
and c.streamline_client = 1
		<cfif GetBaseTemplatePath() contains 'title_rep_display.cfm'>
		ORDER BY c.ID
		<cfelse>
		ORDER BY c.COMPANY ASC
		</cfif>
	</CFQUERY>

</cfif>

<cfif session.ft_user_id eq 474 or  session.ft_user_id eq 475 or  session.ft_user_id eq 248><!--- if this is the India guys- --->

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_companies" cachedwithin="#CreateTimeSpan(0,0,1,0)#">
SELECT c.*
FROM Companies c
where
c.test_account = 0
		<cfif GetBaseTemplatePath() contains 'title_rep_display.cfm'>
		ORDER BY c.ID
		<cfelse>
		ORDER BY c.COMPANY ASC
		</cfif>
	</CFQUERY>

</cfif>


<cfif read_user.ID eq 362>
	<CFQUERY datasource="#request.dsn#" NAME="read_companies" cachedwithin="#CreateTimeSpan(0,0,1,0)#">
		SELECT *
		FROM companies where a_status=1
		and test_account=0
		<cfif GetBaseTemplatePath() contains 'title_rep_display.cfm'>
		ORDER BY ID
		<cfelse>
		ORDER BY COMPANY ASC
		</cfif>
	</CFQUERY>
</cfif>


		<CFOUTPUT QUERY="read_companies"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>			
			</SELECT>		
		</td>
	</tr>

	<tr>		
		
		<td width=497 align=right valign=top bgcolor=e6e6e6>	
			<NOBR><input type=image src="./images/button_next.gif" border=0><img src="./images/clear.gif" height=10 width=40></NOBR>
					
		
		</td>
	</tr>
	
	
</table>
</FORM>	



	</td>
</tr>
</table>	

	</td>
</tr>
</table>


</BODY>
</HTML>



	                                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                                    <!---  <cfdump var = '#session#'>--->
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              