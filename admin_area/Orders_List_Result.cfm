<CFSET a_bgcolor = "d3d3d3">
<CFSET a_color_trigger = "1">

<CFIF #company_id# neq "ALL">
	<CFQUERY datasource="#request.dsn#" NAME= "read_companies" >
		SELECT     	ID
		FROM        Companies
		GROUP BY ID,intCustServ
		HAVING      (ID IN(#company_id#))
	</CFQUERY>		
</CFIF>
	
<CFIF #company_id# eq "ALL">
	<CFQUERY datasource="#request.dsn#" NAME= "read_info" >
		SELECT     Title.Title_ID, Title.check_date AS Order_Date, Companies.company, Title.pname, Title.oname,
	  			Title.pphone, Title.p_email, Title.ophone, Title.o_email
		FROM       Title LEFT OUTER JOIN
               Companies ON Title.comp_id = Companies.ID
		WHERE     (Title.check_date BETWEEN '#startdate#' AND '#enddate#') AND (Companies.intCustServ = #url.uid#)
				and Title.Cancelled is null 
		ORDER BY Companies.company, Title.check_date
	</CFQUERY>
	
	<CFQUERY datasource="#request.dsn#" NAME= "read_info_property" >
		SELECT     Property.prop_ID, Property.check_date AS Order_Date, Companies.company, Property.pname, Property.oname,
	  			Property.pphone, Property.p_email, Property.ophone, Property.o_email
		FROM       Property LEFT OUTER JOIN
               Companies ON Property.comp_id = Companies.ID
		WHERE     (Property.check_date BETWEEN '#startdate#' AND '#enddate#') AND (Companies.intCustServ = #url.uid#)
				and Property.Cancelled is null 
		ORDER BY Companies.company, Property.check_date
	</CFQUERY>
	
<CFELSEIF #Len(company_ID)# lt 5>
	<CFQUERY datasource="#request.dsn#" NAME= "read_info" >
		SELECT    	Title.Title_ID, Title.check_date AS Order_Date, Companies.company, Title.pname, Title.oname,
				  	Title.pphone, Title.p_email, Title.ophone, Title.o_email
		FROM        Title LEFT OUTER JOIN
               		Companies ON Title.comp_id = Companies.ID
		WHERE      (Title.check_date BETWEEN '#startdate#' AND '#enddate#') AND (Title.comp_id IN (#company_id#))
					and Title.Cancelled is null
		ORDER BY Title.check_date, Title.Title_ID	
	</CFQUERY>
	
	<CFQUERY datasource="#request.dsn#" NAME= "read_info_property" >
		SELECT    	Property.Prop_ID, Property.check_date AS Order_Date, Companies.company, Property.pname, Property.oname,
				  	Property.pphone, Property.p_email, Property.ophone, Property.o_email
		FROM        Property LEFT OUTER JOIN
               		Companies ON Property.comp_id = Companies.ID
		WHERE      (Property.check_date BETWEEN '#startdate#' AND '#enddate#') AND (Property.comp_id IN (#company_id#))
					and Property.Cancelled is null
		ORDER BY Property.check_date, Property.prop_ID	
	</CFQUERY>
</CFIF>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Order Results</title>
</head>

<body>
<table width="98%" cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
		<td width="98%" align=center valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;&nbsp;R e s u l t s </B></CENTER>
		</TD>
	</TR>
	<tr>
		<td width="98%" align=center valign=top bgcolor=d3d3d3>
<table width="98%" cellpadding=1 cellspacing=1 border=0>
	<tr>
		<td bgcolor=gray  align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Order Num
		</td>
		<td bgcolor=gray  align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Order Date
		</td>
		<td bgcolor=gray  align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Company Name
		</td>
		<td bgcolor=gray  align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Loan Processor 
		</td>
		<td bgcolor=gray  align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Loan Processor Phone 
		</td>
		<td bgcolor=gray  align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Loan Processor Email 
		</td>
		<td bgcolor=gray  align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Loan Officer
		</td>
		<td bgcolor=gray  align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Loan Officer Phone
		</td>
		<td bgcolor=gray  align=center valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			Loan Officer Email
		</td>
	</tr>
	<tr>
		<td bgcolor="white" colspan = 9 width="100%" align=center valign=top>
			<center><b>Title Orders</b></center>
		</td>
	</tr>
<CFIF #company_id# neq "ALL">
	<CFLOOP QUERY="read_companies">
		<CFQUERY datasource="#request.dsn#" NAME= "read_info" >
			SELECT  Title.Title_ID, Title.check_date AS Order_Date, Companies.company, Title.pname, Title.oname,
				Title.pphone, Title.p_email, Title.ophone, Title.o_email
			FROM    Title LEFT OUTER JOIN
               	Companies ON Title.comp_id = Companies.ID
			WHERE   (Title.check_date BETWEEN '#startdate#' AND '#enddate#') AND (Title.comp_id IN (#read_companies.ID#))
				and Title.Cancelled is null
			ORDER BY Title.check_date, Title.Title_ID	
		</CFQUERY>
		<cfif #read_info.recordcount# neq "0">
			<tr>
				<td bgcolor="#a_bgcolor#" colspan = 9 width="100%" align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					<cfoutput>
						From #startdate# to #enddate# The Company #read_info.company# ordered #read_info.recordcount# Title Orders<br>
					</cfoutput>
				</td>
			</tr>
			<CFOUTPUT QUERY="read_info" StartRow="1" MAXROWS="100000">
			<tr>
				<td bgcolor="#a_bgcolor#"  align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					#title_id#
				</td>
				<td bgcolor="#a_bgcolor#"  align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					#DateFormat(Order_Date, "m/d/yyyy")#
				</td>
				<td bgcolor="#a_bgcolor#"  align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					#Company#
				</td>
				<td bgcolor="#a_bgcolor#"  align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					#pname#
				</td>
				<td bgcolor="#a_bgcolor#"  align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					#pphone#
				</td>
				<td bgcolor="#a_bgcolor#"  align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					#p_email#
				</td>
				<td bgcolor="#a_bgcolor#" align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					#oname#
				</td>
				<td bgcolor="#a_bgcolor#"  align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					#ophone#
				</td>
				<td bgcolor="#a_bgcolor#"  align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					#o_email#
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
		</CFIF>
	</CFLOOP>
		<tr>
				<td bgcolor="white" colspan = 9 width="100%" align=center valign=top>
					<center><b>Property Orders</b></center>
				</td>
			</tr>						
	<CFLOOP QUERY="read_companies">	
		<CFQUERY datasource="#request.dsn#" NAME= "read_info_property" >
			SELECT  Property.Prop_ID, Property.check_date AS Order_Date, Companies.company, Property.pname,Property.oname,
				Property.pphone, Property.p_email, Property.ophone,Property.o_email
			FROM    Property LEFT OUTER JOIN
               	Companies ON Property.comp_id = Companies.ID
			WHERE   (Property.check_date BETWEEN '#startdate#' AND '#enddate#') AND (Property.comp_id IN (#read_companies.ID#))
				and Property.Cancelled is null
			ORDER BY Property.check_date, Property.prop_ID	
		</CFQUERY>
		
		<cfif #read_info_property.recordcount# neq "0">
			<tr>
				<td bgcolor="#a_bgcolor#" colspan = 9 width="100%" align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					<cfoutput>
						From #startdate# to #enddate# The Company #read_info_property.company# ordered #read_info_Property.recordcount# Property Orders<br>
					</cfoutput>
				</td>
			</tr>
			<CFOUTPUT QUERY="read_info_property" StartRow="1" MAXROWS="100000">
			<tr>
				<td bgcolor="#a_bgcolor#"  align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					#prop_id#
				</td>
				<td bgcolor="#a_bgcolor#"  align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					#DateFormat(Order_Date, "m/d/yyyy")#
				</td>
				<td bgcolor="#a_bgcolor#"  align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					#Company#
				</td>
				<td bgcolor="#a_bgcolor#"  align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					#pname#
				</td>
				<td bgcolor="#a_bgcolor#"  align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					#pphone#
				</td>
				<td bgcolor="#a_bgcolor#"  align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					#p_email#
				</td>
				<td bgcolor="#a_bgcolor#" align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					#oname#
				</td>
				<td bgcolor="#a_bgcolor#"  align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					#ophone#
				</td>
				<td bgcolor="#a_bgcolor#"  align=center valign=top>
					<FONT FACE=verdana SIZE=1 color="black">
					#o_email#
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
		</CFIF>	
	</CFLOOP>
<CFELSE>
<!---All was selected --->
	<cfif #read_info.recordcount# neq "0">
		<tr>
			<td bgcolor="#a_bgcolor#" colspan = 9 width="100%" align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				<CFOUTPUT>From #startdate# to #enddate# All companies ordered #read_info.recordcount# Title Orders<br></CFOUTPUT>
			</td>
		</tr>
<CFOUTPUT QUERY="read_info" StartRow="1" MAXROWS="100000">
		
		<tr>
			<td bgcolor="#a_bgcolor#"  align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				#title_id#
			</td>
			<td bgcolor="#a_bgcolor#"  align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				#DateFormat(Order_Date, "m/d/yyyy")#
			</td>
			<td bgcolor="#a_bgcolor#"  align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				#Company#
			</td>
			<td bgcolor="#a_bgcolor#"  align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				#pname#
			</td>
			<td bgcolor="#a_bgcolor#"  align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				#pphone#
			</td>
			<td bgcolor="#a_bgcolor#"  align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				#p_email#
			</td>
			<td bgcolor="#a_bgcolor#" align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				#oname#
			</td>
			<td bgcolor="#a_bgcolor#"  align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				#ophone#
			</td>
			<td bgcolor="#a_bgcolor#"  align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				#o_email#
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
		</CFIF>
		<cfif #read_info_property.recordcount# neq "0">
		<tr>
		<td bgcolor="white" colspan = 9 width="100%" align=center valign=top>
			<center><b>Property Orders</b></center>
		</td>
	</tr>
	<tr>
			<td bgcolor="#a_bgcolor#" colspan = 9 width="100%" align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				<cfoutput>
					From #startdate# to #enddate# All Companies ordered #read_info_Property.recordcount# Property Orders<br>
				</cfoutput>
			</td>
		</tr>
		</CFIF>
		<CFOUTPUT QUERY="read_info_property" StartRow="1" MAXROWS="100000">
		
		<tr>
			<td bgcolor="#a_bgcolor#"  align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				#prop_id#
			</td>
			<td bgcolor="#a_bgcolor#"  align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				#DateFormat(Order_Date, "m/d/yyyy")#
			</td>
			<td bgcolor="#a_bgcolor#"  align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				#Company#
			</td>
			<td bgcolor="#a_bgcolor#"  align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				#pname#
			</td>
			<td bgcolor="#a_bgcolor#"  align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				#pphone#
			</td>
			<td bgcolor="#a_bgcolor#"  align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				#p_email#
			</td>
			<td bgcolor="#a_bgcolor#" align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				#oname#
			</td>
			<td bgcolor="#a_bgcolor#"  align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				#ophone#
			</td>
			<td bgcolor="#a_bgcolor#"  align=center valign=top>
				<FONT FACE=verdana SIZE=1 color="black">
				#o_email#
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
				
</CFIF>
</Table>					
</body>
</html>