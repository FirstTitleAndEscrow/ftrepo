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
        WHERE  	 (Doc_Abstract_Title.a_Date_Assigned IS NULL)  AND 
		(Title.cancelled IS NULL) AND (Title.orderRemoveCustService IS NULL) AND (Title.cancelled IS NULL) AND (DATEDIFF(hh, Title.dateandtime, GETDATE()) > 2) 
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
		  WHERE      (Title.cancelled IS NULL)  AND 
					 (Doc_Abstract_Title.a_Date_Completed IS NOT NULL) AND
 					 (DATEDIFF(HOUR, Doc_Abstract_Title.r_dateandtime, GETDATE()) > 2)
 					 AND (Doc_Title_Insurance_Title.merge_date IS NULL) AND (Title.orderRemoveCustService IS NULL)  AND 
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
				AND (Doc_Closer_Title.A_DATE_ASSIGNED IS NULL)  AND 
                (Title.cancelled IS NULL) AND (Title.orderRemoveCustService IS NULL) AND 
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
	WHERE     (Title.cancelled IS NULL) AND (Title.orderRemoveCustService IS NULL)  AND 
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
		WHERE     	(Title.cancelled IS NULL) AND (Title.orderRemoveCustService IS NULL) AND (Tax_Cert_Title.pre_funding IS NULL)
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
	Select * from tblCServ_Temp where intCustomerService is not null and remove is null order by intCustomerService,company,event
</CFQUERY>

		
<html>
<head>
<title>Customer Service</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>

<table width="893" cellpadding=1 cellspacing=1 border=0 bgcolor=white></table> 
	<table width="893" align="center" height="85" border="0" style="WIDTH: 893px; HEIGHT: 85px">
  		<tr>
    		<td align= "middle" height="76"><IMG style="WIDTH: 891px; HEIGHT: 70px" height=70 src="images/logo_menu_1.gif" width=825 ></td>
  		</tr>
		<!---Harry --->
	</table>
	<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">
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
				<B>Remove</B>
			</td>		
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
			<a href="Order_Removal.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1&company_id=0&Letter=T" taget="_blank"><CENTER><font size=1 color=red face=verdana><b>R</font></CENTER></a>
			<CFELSE>
			<a href="Order_Removal.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1&company_id=0&Letter=P" taget="_blank"><CENTER><font size=1 color=red face=verdana><b>R</font></CENTER></a>
			</cfif>
			</td>
			
			<td bgcolor="#a_bgcolor#" valign=center align="center"> 
				<font size=1 color=black face=verdana><b>
				<CFIF #Type# eq "T">
				<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_blank">
				<font size=1 color=blue face=verdana>
				#type#-#id#
				</font>
				</a>
				<CFELSE>
				<a href="prop_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="_blank">
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
				<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#id#&a_trigger=1" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')">
				<FONT FACE=verdana SIZE=1 color="blue">
				add/view</a>
			</td>
		</tr>
		
		</CFOUTPUT>
		
	
	</table>
	

</table>
