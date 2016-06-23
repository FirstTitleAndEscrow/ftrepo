<!--- 
<CFQUERY datasource="#request.dsn#" NAME="read_CS_employee">
    SELECT     First_Admin.fname + ' ' + First_Admin.lname AS Name, First_Admin.phone, First_Admin.email, First_Admin.ID AS empl_id
    FROM       Companies INNER JOIN
               First_Admin ON Companies.intCustServ = First_Admin.ID
    WHERE      (Companies.intCustServ IS NOT NULL) AND (First_Admin.status = 1) AND (Companies.ID = #comp_id#)
</CFQUERY>
<CFIF #read_CS_employee.recordcount# gt "0">
    <!---I had to add that last line ID <> 3 today because someone changed Donna from Customer Service Manager
    to Customer Service which made her name show up two times on this report--->
    
    <CFQUERY datasource="#request.dsn#" NAME="read_employee">
        SELECT     fname + ' ' + lname AS Name, phone, email, ID
        FROM         First_Admin
        WHERE     (role_id = 5) AND (status = 1) AND (ID <> #read_CS_employee.empl_id#)
        AND (ID <> 3)
    </CFQUERY>
<CFELSE>
    <CFQUERY datasource="#request.dsn#" NAME="read_employee">
        SELECT     fname + ' ' + lname AS Name, phone, email, ID
        FROM         First_Admin
        WHERE     (role_id = 5) AND (status = 1)
    </CFQUERY>
</CFIF>     --->
<cftry>
<cfinvoke	component = "cfc.team_info"	method = "getTeam"	returnVariable = "get_team_info" comp_id="#comp_id#">
<cfcatch type="Any">
		<cfoutput>
		<cfmail from="rjermain@firsttitleservices.com" to="rjermain@firsttitleservices.com" subject="Team Email Failure">
		<hr>
			<h1>Other Error: #cfcatch.Type#</h1>
			<ul>
				<li><b>Message:</b> #cfcatch.Message#
				<li><b>Detail:</b> #cfcatch.Detail#
				<li><B>Page:</B> #GetBaseTemplatePath()#
			</ul>
		</cfmail>
        </cfoutput>
	</cfcatch>
</cftry>
<cfif get_team_info.recordcount gt 0>
<tr>
		<td align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>NAME<CFIF get_team_info.recordcount gt 1>S</CFIF></td>
		<td   align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>PHONE/EXT</td>
		<td  align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>FAX</td>
		<td align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>EMAIL</td>
		</TD>
</TR>
<!---This row is for the companies Customer Service Person--->
    <CFOUTPUT QUERY="get_team_info">
	<cfif get_team_info.Member_ID eq get_team_info.Leader_id>
        <tr>
        	<td align=left valign=top bgcolor=elelel>
        		<font face=verdana size=2 color=black>&nbsp;#get_team_info.FName# #get_team_info.LName# - Team Lead</font>
        	</td>
        	<td align=center valign=middle bgcolor=elelel rowspan="#get_team_info.recordcount#">
        		<font face=verdana size=2 color=black>#get_team_info.Phone#</font>
        	</td>
        	<td align=center valign=middle bgcolor=elelel rowspan="#get_team_info.recordcount#">
        		<font face=verdana size=2 color=black>#get_team_info.fax#</font>
        	</td>
        	<td align=center valign=middle bgcolor=elelel rowspan="#get_team_info.recordcount#">
        		<font face=verdana size=2 color=black>#get_team_info.email#</font>
        	</td>
        </tr>
		</cfif>
    </CFOUTPUT>
	<CFOUTPUT QUERY="get_team_info">
	<cfif get_team_info.Member_ID neq get_team_info.Leader_id>
        <tr>
        	<td align=left valign=top bgcolor=elelel>
        		<font face=verdana size=2 color=black>&nbsp;#get_team_info.FName# #get_team_info.LName#</font>
        	</td>
        </tr>
		</cfif>
    </CFOUTPUT>
</CFIF>    

<!---Keep Donna at bottom per Steve
<tr>
	<td width=200 align=left valign=top bgcolor=elelel>
		<font face=verdana size=2 color=black>Customer Service Manager</font>
	</td>
	<td width=180 align=left valign=top bgcolor=elelel>
		<font face=verdana size=2 color=black>Donna Anderson</font>
	</td>
	<td width=160 align=left valign=top bgcolor=elelel>
		<font face=verdana size=2 color=black>301-279-0303 X 327</font>
	</td>
	<td width=180 align=left valign=top bgcolor=elelel>
		<font face=verdana size=2 color=black>danderson@firsttitleservices.com</font>
	</td>
</tr>
			
--->