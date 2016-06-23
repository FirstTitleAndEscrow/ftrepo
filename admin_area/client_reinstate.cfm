
<cfparam name="id" default="">
<!--- company:<cfoutput>#company#</cfoutput> 
id:<cfoutput>#form.id#</cfoutput>
urlid:<cfoutput>#url.uid#</cfoutput> --->

<cfif form.id neq ""> 

<CFQUERY datasource="#request.dsn#" NAME="check_user">
	SELECT  *
	FROM	First_Admin 
	where id = #url.uid#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="company_name">
	SELECT  company
	FROM	companies
	where id = #id#
</CFQUERY>
<CFINCLUDE TEMPLATE="./includes/companies.cfm">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>Client Reinstate</TITLE>
</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>
<CENTER>

							<table width=498 height=250 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>
<CFOUTPUT>
								<tr>
									<td width="498" align="center" valign="middle" bgcolor="e3e3e3">
										<font size="2" color="black" face="arial">Client Reinstate Status:</font><br><br>
									
<font size="2" color="red"><strong> Company&nbsp;</font><FONT SIZE="2" color="blue" face="arial"><cfoutput>#company_name.company#&nbsp;</font><font size="2" color="red">was successfully reinstated </font></strong></cfoutput></td>
								</tr>
</CFOUTPUT>	
							</table>			
						<table width="367" cellpadding="1" cellspacing="1" border="0" bgcolor="white">



<cfquery datasource="#request.dsn#" name="reinstate_company">
update companies
set 
a_status=1, 
a_date_mod = '#DateFormat(Now(), "mm/dd/yy")#',
a_time_mod = '#TimeFormat(Now(), "HH:mm:ss")#',
a_uid_mod = '#URL.uid#'
where id=#id#
</cfquery>

</td></tr>
</table>
</center>
</BODY>
</HTML>
<cfelse> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>Client Reinstate</TITLE>
</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>
<CENTER>

<table  width="600" height="250">

<tr><td align="center" valign="middle">
<FONT SIZE="3" color="red" face="arial"><bold>Please go back and choose company from the list!</bold></font>

</td></tr></table>
</center>
</BODY>
</HTML>
</cfif>

