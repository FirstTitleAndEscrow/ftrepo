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

<CFSET a_bgcolor = "d3d3d3">
<CFSET a_color_trigger = "1">

<CFPARAM NAME="MaxRows" DEFAULT="1000">
<CFPARAM NAME="StartRow" DEFAULT="1">

<CFQUERY datasource="#request.dsn#">
	Delete from tblCServ_Temp
</CFQUERY>

<CFQUERY datasource="#request.dsn#">
	exec sp_CustServ1
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_2">
		SELECT  Title.Title_ID AS ID, Companies.company,
		'Abstractor Not Assigned' As Event, Title.bfirstname1 + ' ' + Title.blastname1 AS Name,
		DATEDIFF(hh, Title.dateandtime, GETDATE())% 24 AS Hours,
		DATEDIFF(dd, Title.dateandtime, GETDATE()) AS Days,
        DATEDIFF(n, Title.dateandtime, GETDATE()) % 60 AS minutes,  Companies.intCustServ, 'T' as Type
		FROM  Title LEFT OUTER JOIN
        Companies ON Title.comp_id = Companies.ID LEFT OUTER JOIN
        Doc_Abstract_Title ON Title.Title_ID = Doc_Abstract_Title.Title_ID
        WHERE  	 (Doc_Abstract_Title.a_Date_Assigned IS NULL) AND
		(Title.cancelled IS NULL) AND (DATEDIFF(hh, Title.dateandtime, GETDATE()) > 2)
        AND (Companies.intCustServ IS NOT NULL)
</CFQUERY>

<CFLOOP QUERY="read_2">
	<cfquery name="testInsert" datasource="#request.dsn#">
		Insert into tblCServ_Temp (ID, Company, Event, Name, hours, days, minutes,intCustomerService,type)
	 	Values (#trim(read_2.ID)#, '#trim(read_2.Company)#', '#trim(read_2.Event)#' , '#trim(read_2.Name)#', #trim(read_2.hours)# , #trim(read_2.days)# , #trim(read_2.minutes)#, #trim(read_2.intCustServ)#,'#trim(read_2.type)#')
	</CFQUERY>
</CFLOOP>
<!---Abstractor Not Assigned Property--->
<CFQUERY datasource="#request.dsn#">
	exec sp_CustServ3
</CFQUERY>
<CFQUERY datasource="#request.dsn#">
	exec sp_CustServ4
</CFQUERY>
<CFQUERY datasource="#request.dsn#">
	exec sp_CustServ5
</CFQUERY>
<!---Binder Data Not Merged--->
<CFQUERY datasource="#request.dsn#" NAME="read_6">
		  SELECT     Title.Title_ID AS ID, companies.company,'Binder Data Not Merged' As Event, Title.bfirstname1 + ' ' + Title.blastname1 AS Name,
			   		 DATEDIFF(HOUR,Doc_Abstract_Title.r_dateandtime,GETDATE())%24 AS Hours,
					 DATEDIFF(dd, Doc_Abstract_Title.r_dateandtime, GETDATE()) AS Days,
 					 DATEDIFF(n, Doc_Abstract_Title.r_dateandtime, GETDATE()) % 60 AS minutes,companies.intCustServ,'T' as Type
		  FROM       Doc_Title_Insurance_Title INNER JOIN
                     Doc_Abstract_Title ON Doc_Title_Insurance_Title.Title_ID =
 					 Doc_Abstract_Title.Title_ID INNER JOIN
                     Title ON Doc_Abstract_Title.Title_ID = Title.Title_ID LEFT OUTER
 					 JOIN Companies ON Title.comp_id = Companies.ID
		  WHERE      (Title.cancelled IS NULL) AND
					 (Doc_Abstract_Title.a_Date_Completed IS NOT NULL) AND
 					 (DATEDIFF(HOUR, Doc_Abstract_Title.r_dateandtime, GETDATE()) > 2)
 					 AND (Doc_Title_Insurance_Title.merge_date IS NULL) AND
		  			 (Title.cancelled IS NULL)AND
					 (Companies.intCustServ IS NOT NULL)
</CFQUERY>

<CFLOOP QUERY="read_6">
	<cfquery name="testInsert" datasource="#request.dsn#">
		Insert into tblCServ_Temp (ID, Company, Event, Name, hours, days, minutes,intCustomerService,Type)
	 	Values (#trim(read_6.ID)#, '#trim(read_6.Company)#', '#trim(read_6.Event)#' , '#trim(read_6.Name)#', #trim(read_6.hours)# , #trim(read_6.days)# , #trim(read_6.minutes)#, #trim(read_6.intCustServ)#,'#trim(read_6.type)#')
	</CFQUERY>
</CFLOOP>


<!---Abstractor Assigned Not Received Property--->
<CFQUERY datasource="#request.dsn#" NAME="read_7">
	SELECT     	Title_Closing_Order_Request.Title_ID As ID, Companies.Company,
				'Closer Not Assigned' As Event,
	  			Title.bfirstname1 + ' ' + Title.blastname1 AS Name,DATEDIFF(HOUR, Title_Closing_Order_Request.c_dateandtime, GETDATE())% 24 AS Hours,
				DATEDIFF(dd, Title_Closing_Order_Request.c_dateandtime, GETDATE()) AS 	days,
				DATEDIFF(n, Title_Closing_Order_Request.c_dateandtime, GETDATE()) % 60
                    		AS minutes, companies.intCustServ, 'T' as Type
	FROM        Doc_Closer_Title INNER JOIN
                Title_Closing_Order_Request ON Doc_Closer_Title.TITLE_ID =
 				Title_Closing_Order_Request.Title_ID INNER JOIN
                Title ON Doc_Closer_Title.TITLE_ID = Title.Title_ID LEFT OUTER JOIN
                Companies ON Title.comp_id = Companies.ID
	WHERE      	(DATEDIFF(HOUR, Title_Closing_Order_Request.c_dateandtime, GETDATE()) 		> 1)
				AND (Doc_Closer_Title.A_DATE_ASSIGNED IS NULL) AND
                (Title.cancelled IS NULL)AND
				companies.intCustServ is not null
</CFQUERY>

<CFLOOP QUERY="read_7">
	<cfquery name="testInsert" datasource="#request.dsn#">
		Insert into tblCServ_Temp (ID, Company, Event, Name, hours, days, minutes,intCustomerService,type)
	 	Values (#trim(read_7.ID)#, '#trim(read_7.Company)#', '#trim(read_7.Event)#' , '#trim(read_7.Name)#', #trim(read_7.hours)# , #trim(read_7.days)# , #trim(read_7.minutes)#, #trim(read_7.intCustServ)#,'#trim(read_7.Type)#')
	</CFQUERY>
</CFLOOP>



<CFQUERY datasource="#request.dsn#" NAME="read_8">
	SELECT     Title_Closing_Order_Request.Title_ID As ID,Companies.company,'Closing Info Not Submitted' as Event,
				Title.bfirstname1 + ' ' + Title.blastname1 AS Name,
				DATEDIFF(Hh, Title_Closing_Order_Request.c_dateandtime, GETDATE()) % 24
			   AS Hours,
			   DATEDIFF(dd, Title_Closing_Order_Request.c_dateandtime, GETDATE()) AS
 			   days,
			   DATEDIFF(n,Title_Closing_Order_Request.c_dateandtime, GETDATE()) % 60 AS
 			   minutes ,intCustServ,'T' as Type
	FROM       EventList INNER JOIN
			   Title_Closing_Order_Request ON EventList.Title_id =
 	           Title_Closing_Order_Request.Title_ID INNER JOIN
               Title ON Title_Closing_Order_Request.Title_ID = Title.Title_ID LEFT OUTER
 			   JOIN Companies ON Title.comp_id = Companies.ID
	WHERE     (Title.cancelled IS NULL) AND
		      (Title_Closing_Order_Request.a_Req_Closing_Day IS NOT NULL) AND
 	          (EventList.c_Day IS NULL) AND
              (DATEDIFF(Hh, Title_Closing_Order_Request.c_dateandtime, GETDATE()) > 4)
			  AND (Companies.intCustServ is not null)
</CFQUERY>

<CFLOOP QUERY="read_8">
	<cfquery name="testInsert" datasource="#request.dsn#">
		Insert into tblCServ_Temp (ID, Company, Event, Name, hours, days, minutes,intCustomerService,type)
	 	Values (#trim(read_8.ID)#, '#trim(read_8.Company)#', '#trim(read_8.Event)#' , '#trim(read_8.Name)#', #trim(read_8.hours)# , #trim(read_8.days)# , #trim(read_8.minutes)#, #trim(read_8.intCustServ)#,'#trim(read_8.Type)#')
	</CFQUERY>
</CFLOOP>

<CFQUERY datasource="#request.dsn#">
	Exec sp_CustServ9
</CFQUERY>

<CFQUERY datasource="#request.dsn#">
	Exec sp_CustServ10
</CFQUERY>

<!---Pre Funding Not Completed--->
<CFQUERY datasource="#request.dsn#" NAME="read_11">
		SELECT     	Tax_Cert_Title.Title_ID As ID, Companies.company, 'Pre Funding Not Completed' As Event,
					Title.bfirstname1 + ' ' + Title.blastname1 AS name,
					DATEDIFF(HOUR, EventList.cl_dateandtime, GETDATE()) AS Hours,
 					DATEDIFF(dd,EventList.cl_dateandtime, GETDATE())%24 AS days,
					DATEDIFF(n, EventList.cl_dateandtime, GETDATE()) %60 AS minutes,
					Companies.intCustServ,'T' as Type
		FROM        EventList INNER JOIN
                    Tax_Cert_Title ON EventList.Title_id = Tax_Cert_Title.Title_ID INNER
 					JOIN Title ON Tax_Cert_Title.Title_ID = Title.Title_ID INNER JOIN
                    Companies ON Title.comp_id = Companies.ID
		WHERE     	(Title.cancelled IS NULL) AND (Tax_Cert_Title.pre_funding IS NULL)
 					AND (EventList.cl_dateandtime IS NOT NULL) AND
					(DATEDIFF(HOUR,EventList.cl_dateandtime, GETDATE()) > 0)
					AND  (Companies.IntCustServ is not null) AND
                      (NOT (dbo.Title.appraisal_status LIKE 'Loan CLosed'))
</CFQUERY>

<CFLOOP QUERY="read_11">
	<cfquery name="testInsert" datasource="#request.dsn#">
		Insert into tblCServ_Temp (ID, Company, Event, Name, hours, days, minutes,intCustomerService,Type)
	 	Values (#trim(read_11.ID)#, '#trim(read_11.Company)#', '#trim(read_11.Event)#' , '#trim(read_11.Name)#', #trim(read_11.hours)# , #trim(read_11.days)# , #trim(read_11.minutes)#, #trim(read_11.intCustServ)#,'#trim(read_11.Type)#')
	</CFQUERY>
</CFLOOP>
<!---Property Data Not Merged--->
<CFQUERY datasource="#request.dsn#">
	Exec sp_CustServ12
</CFQUERY>

<CFQUERY datasource="#request.dsn#">
	Exec sp_CustServ13
</CFQUERY>

<CFQUERY datasource="#request.dsn#">
	Exec sp_CustServ14
</CFQUERY>

<CFQUERY datasource="#request.dsn#">
	Exec sp_CustServ15
</CFQUERY>

<CFQUERY datasource="#request.dsn#">
	Exec sp_CustServ16
</CFQUERY>

<CFQUERY datasource="#request.dsn#">
	Exec sp_CustServ17
</CFQUERY>

<CFQUERY datasource="#request.dsn#">
	Exec sp_CustServ18
</CFQUERY>

<CFQUERY datasource="#request.dsn#">
	Exec sp_CustServ19
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="TempTable">
	Select * from tblCServ_Temp where intCustomerService is not null order by intCustomerService,company,event
</CFQUERY>


<html>
<head>
<title>Customer Service</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<!---Harry 11/23/2004 --->
<table width="893" cellpadding=1 cellspacing=1 border=0 bgcolor=white></table>
	<table width="893" align="center" height="85" border="0" style="WIDTH: 893px; HEIGHT: 85px">
  		<tr>
    		<td align= "middle" height="76"><IMG style="WIDTH: 891px; HEIGHT: 70px" height=70 src="images/logo_menu_1.gif" width=825 ></td>
  		</tr>
		<TR>
			<TD>
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
								><input type="image" src="https://#cgi.server_name#/admin_area/images/button_search.gif" border=0 alt="Quick file search">
</cfFORM>
</CFOUTPUT>
<a href="http://firsttitle.sysaidit.com" target="new">Help Desk</a> </TD>
		</TR>
<tr><td><cfoutput><a href="https://#cgi.server_name#/admin_area/FT_Policies/ft_policies.cfm" target="New" onClick="window.open('','New','left=0,top=0,width=400,height=400,status=0,resizable=0,location=0,menubar=0,toolbar=0,scrollbars=1')">Company Policies</a><BR></cfoutput><br>
</td></tr></table>
	<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">
		<TR colspan="18">
			<td width="99" align="center" colspan="2">
				<B>Clients</B>
			</td>
			<td width="99" align="center" colspan="2">
				<B>Users</B>
			</td>
			<td width="99" align="center" colspan="2">
				<b>Closers</b>
			</td>
			<td width="99" align="center" colspan="2">
				<b>Appraisers</b>
			</TD>
			<td width="99" align="center" colspan="2">
				<b>Abstractors</b>
			</TD>
			<td width="99" align="center" colspan="2">
				<b>Third Parties</b>
			</TD>
			<td width="99" align="center" colspan="2">
				<b>Lenders</b>
			</TD>
			<td width="99" align="center" colspan="2">
				<b>FT Agencies</b>
			</TD>
			<td width="99"align="center" colspan="2">
				<b>Title Ins Co</b>
			</td>
		</TR>
		<TR>
			<td width="45" align="center">
				<CFoutput>
				<a href="./client_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=blue face=verdana>A</font>
				</CFOUTPUT>
			</td>
			<td width="45" align="center">
				<CFoutput>
				<a href="./client_modify.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=red face=verdana>M</font>
				</CFOUTPUT>
			</td>
			<td width="45" align="center">
				<CFoutput>
				<a href="./user_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=blue face=verdana>A</font>
				</CFOUTPUT>
			</td>
			<td width="45" align="center">
				<CFoutput>
				<a href="./user_modify.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=red face=verdana>M</font>
				</CFOUTPUT>
			</TD>
			<td width="45" align="center">
				<CFoutput>
				<a href="./closer_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=blue face=verdana>A</font>
				</CFOUTPUT>
			</TD>
			<td width="45" align="center">
				<CFoutput>
				<a href="./closer_modify.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=red face=verdana>M</font>
				</CFOUTPUT>
			</TD>
			<td width="45" align="center">
				<CFoutput>
				<a href="./appraisers_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=blue face=verdana>A</font>
				</CFOUTPUT>
			</TD>
			<td width="45" align="center">
				<CFoutput>
				<a href="./appraisers_modify.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=red face=verdana>M</font>
				</CFOUTPUT>
			</TD>
			<td width="45"align="center">
				<CFoutput>
				<a href="./abstractors_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=blue face=verdana>A</font>
				</CFOUTPUT>
			</td>
			<td width="45" align="center">
				<CFOUTPUT>
				<a href="./abstractors_modify.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=red face=verdana>M</font>
				</CFOUTPUT>
			</td>
			<td width="45" align="center">
				<CFoutput>
				<a href="./tp_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=blue face=verdana>A</font>
				</CFOUTPUT>
			</td>
			<td width="45" align="center">
				<CFoutput>
				<a href="./tp_modify.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=red face=verdana>M</font>
				</CFOUTPUT>
			</td>
			<td width="45" align="center">
				<CFoutput>
				<a href="./lenders_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=blue face=verdana>A</font>
				</CFOUTPUT>
			</TD>
			<td width="45" align="center">
				<CFoutput>
				<a href="./lenders_modify_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=red face=verdana>M</font>
				</CFOUTPUT>
			</TD>
			<td width="45" align="center">
				<CFoutput>
				<a href="./title_FT_Agency_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=blue face=verdana>A</font>
				</CFOUTPUT>
			</TD>
			<td width="45" align="center">
				<CFoutput>
				<a href="./title_FT_Agency_modify_Select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=red face=verdana>M</font>
				</CFOUTPUT>
			</TD>
			<td width="45" align="center">
				<CFoutput>
				<a href="./title_Ins_Co_add.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
				<font size=2 color=blue face=verdana>A</font>
				</CFOUTPUT>
			</TD>
			<td width="45"align="center">
				<CFoutput>
				<a href="./title_Ins_Co_modify_Select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
		  		<font size=2 color=red face=verdana>M</font>
				</CFOUTPUT>
			</td>
		</TR>
	</table>
	<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">
		<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/calendar_choose.cfm?uid=#URL.uid#&al=#URL.al#&trigger=0"target="_blank"><font size=2 color=red face=verdana>Processing Calendar</font></a></cfoutput></CENTER></td>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/title_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank"><font size=2 color=blue face=verdana>Orders</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/calendar_company.cfm?uid=#URL.uid#&al=#URL.al#"target="_blank"><font size=2 color=green face=verdana>Calendar</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/statistics_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=red face=verdana>Statistics</font></a></cfoutput></CENTER>
		<CFIF #role_mgr# eq "1">
			<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/monitor_user.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=yellow face=verdana>Monitor User</font></a></cfoutput></CENTER>
		</CFIF>
		<td width="111" bgcolor="#CCD2D2"><Center><cfoutput><a href="https://#cgi.server_name#/admin_area/weblinks_search.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=orange face=verdana>Web Links</font></a></cfoutput></CENTER>
		<td width="111" bgcolor="#CCD2D2"><Center><A HREF="#" onclick="location.reload()">Refresh</A></center></td>
		<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td width="111" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</table>

	<table width="893" align="center">
		<tr>
			<TD colspan=6><Center><B>Orderdue Items</B></CENTER></TD>
		</tr>
		<tr>
			<TD colspan=6><Center><B></B></CENTER></TD>
		</tr>
		<TR>
			<td bgcolor="elelel" valign=top align="center">
				<B>Order Num</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Event Type</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Cust Serv Rep</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Borrower</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Client</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Past Due</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Comments</B>
			</td>
		</TR>
		<CFOUTPUT QUERY="TempTable" StartRow="#StartRow#" MAXROWS="#MaxRows#">
		<tr>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<CFIF #Type# eq "T">
				<a href="https://#cgi.server_name#/admin_area/title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_blank">
				<font size=1 color=blue face=verdana>
				#type#-#id#
				</font>
				</a>
				<CFELSE>
				<a href="https://#cgi.server_name#/admin_area/prop_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_blank">
				<font size=1 color=blue face=verdana>
				#type#-0232#id#
				</font>
				</a>
				</CFIF>
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Event#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
					<CFQUERY datasource="#request.dsn#" NAME="read_CName">
						SELECT     fname + ' ' + lname AS CName from First_Admin where ID = #TempTable.intCustomerService#
					</CFQUERY>
				#read_CName.Cname#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Name#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Company#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#days# days #hours# hours #minutes# minutes
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="https://#cgi.server_name#/admin_area/title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')">
				<FONT FACE=verdana SIZE=1 color="blue">
				add/view</a>
			</td>
		</tr>

		</CFOUTPUT>


	</table>


</table>

<cfinclude template="team_popup.cfm">