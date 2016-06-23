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

<CFQUERY datasource="#request.dsn#" NAME="read_companies">
			   SELECT ID
			   FROM Companies
			   WHERE (intCustServ = #url.uid#)
			   Order by ID
</CFQUERY>
<CFIF #read_companies.RecordCount# gte 1>
<!---Create a variable to hold all of the ID's --->
<CFSET companylist = "">

<CFLOOP Query="read_companies">
			   <CFOUTPUT>
			      <CFSET companylist = #companylist#&","&#ID#>
			   </CFOUTPUT>
</CFLOOP>

<!---Function to strip off the leading comma--->
<CFSET strLength = #len(companylist)#>
<CFSET companylist = #mid(companylist,2,strLength)#>

<!---Abstractor Not Assigned Title--->
<CFQUERY datasource="#request.dsn#" NAME="read_1">
			    SELECT  Title.Title_ID AS ID, Companies.company,
						'Abstractor Not Assigned' As Event,
						DATEDIFF(hh, Title.dateandtime, GETDATE())% 24 AS Hours,
						DATEDIFF(dd, Title.dateandtime, GETDATE()) AS Days,
                		DATEDIFF(n, Title.dateandtime, GETDATE()) % 60 AS minutes,
						Title.bfirstname1 + ' ' + Title.blastname1 AS Name
			    FROM  	Title LEFT OUTER JOIN
                      	Companies ON Title.comp_id = Companies.ID LEFT OUTER JOIN
                      	Doc_Abstract_Title ON Title.Title_ID
						= Doc_Abstract_Title.Title_ID
         		WHERE   (Doc_Abstract_Title.a_Date_Assigned IS NULL) AND
						(Title.cancelled IS NULL) AND
						(DATEDIFF(hh, Title.dateandtime, GETDATE()) > 2) AND
                        (Companies.ID IN (#companylist#))
</CFQUERY>

<!---Abstractor Not Assigned Property--->
<CFQUERY datasource="#request.dsn#" NAME="read_2">
			 SELECT     Property.Prop_ID AS ID, Companies.company,
						'Abstractor Not Assigned' AS Event,
                        Property.bfirstname1 + ' ' + Property.blastname1 AS Name,
 						DATEDIFF(hh, Property.a_insert_date, GETDATE()) % 24 AS hours,
                        DATEDIFF(dd, Property.a_insert_date, GETDATE()) AS days,
 						DATEDIFF(n, Property.a_insert_date, GETDATE()) % 60 AS minutes
			FROM        Property LEFT OUTER JOIN
                        Companies ON Property.comp_id = Companies.ID LEFT OUTER JOIN
                        Doc_Abstract_Prop ON Property.Prop_ID = Doc_Abstract_Prop.Prop_ID
			WHERE       (Doc_Abstract_Prop.a_Date_Assigned IS NULL) AND
						(Companies.ID <> 100) AND
 						(Companies.ID IN (#companylist#))
</CFQUERY>

<!---Abstractor Assigned Not Received Title--->
<CFQUERY datasource="#request.dsn#" NAME="read_3">
			SELECT     Title.Title_ID AS ID, Companies.company,
					   'Abstractor Assigned Not Received' As Event,
					   DATEDIFF(hh, Title.dateandtime, GETDATE())% 24 AS Hours,
					   DATEDIFF(dd, Title.dateandtime, GETDATE()) AS Days,
					   DATEDIFF(n, Title.dateandtime, GETDATE()) % 60 AS minutes,
					   Title.bfirstname1 + ' '  + Title.blastname1 AS Name
			FROM       Title LEFT OUTER JOIN
                       Companies ON Title.comp_id = Companies.ID LEFT OUTER JOIN
                       Doc_Abstract_Title ON Title.Title_ID = Doc_Abstract_Title.Title_ID
            WHERE      (Doc_Abstract_Title.a_Date_Assigned IS NOT NULL) AND
  					   (Title.cancelled IS NULL) AND
					   (DATEDIFF(hh, Title.dateandtime, GETDATE()) > 56)
                       AND (Doc_Abstract_Title.a_Date_Completed IS NULL) AND
 					   (Companies.ID IN (#companylist#))
</CFQUERY>

<!---Abstractor Assigned Not Received Property--->
<CFQUERY datasource="#request.dsn#" NAME="read_4">
			SELECT     Property.Prop_ID AS ID, Companies.company,
					   'Abstract NotReceived' As Event,
					   Property.bfirstname1 + ' ' + Property.blastname1 As Name,
					   DATEDIFF(hh, Property.a_insert_date, GETDATE()) % 24 AS Hours,
 					   DATEDIFF(dd, Property.a_insert_date, GETDATE()) AS Days,
 					   DATEDIFF(n,Property.a_insert_date, GETDATE()) % 60 AS minutes
			FROM       Property LEFT OUTER JOIN
                       Companies ON Property.comp_id = Companies.ID LEFT OUTER JOIN
                       Doc_Abstract_Prop ON Property.Prop_ID = Doc_Abstract_Prop.Prop_ID
			WHERE     (DATEDIFF(hh, Property.dateandtime, GETDATE()) > 56) AND
 					  (Doc_Abstract_Prop.a_Date_Assigned IS NOT NULL) AND
                      (Doc_Abstract_Prop.a_Date_Completed IS NULL) AND
 					  (Property.appraisal_status <> 'Report Emailed')
					  and (Companies.ID IN (#companylist#))
</CFQUERY>

<!---Binder Data Not Meged --->
<CFQUERY datasource="#request.dsn#" NAME="read_5">
		  SELECT     Title.Title_ID AS ID, 'Binder Data Not Merged' As Event,
			   		 DATEDIFF(HOUR,Doc_Abstract_Title.r_dateandtime,GETDATE())%24 AS Hours,
					 Companies.company, Title.bfirstname1 + ' ' + Title.blastname1 AS Name,
					 DATEDIFF(dd, Doc_Abstract_Title.r_dateandtime, GETDATE()) AS Days,
 					 DATEDIFF(n, Doc_Abstract_Title.r_dateandtime, GETDATE()) % 60 AS minutes
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
					 (Companies.ID IN (#companylist#))
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_6">
		SELECT     	DATEDIFF(HOUR, Title_Closing_Order_Request.c_dateandtime, GETDATE())% 24 AS Hours,
					Title_Closing_Order_Request.Title_ID As ID,
				    'Closer Not Assigned' As Event,
	  				Title.bfirstname1 + ' ' + Title.blastname1 AS Name,
					DATEDIFF(dd, Title_Closing_Order_Request.c_dateandtime, GETDATE()) AS 	days,
					DATEDIFF(n, Title_Closing_Order_Request.c_dateandtime, GETDATE()) % 60
                    AS minutes,
					Companies.company
		FROM        Doc_Closer_Title INNER JOIN
                    Title_Closing_Order_Request ON Doc_Closer_Title.TITLE_ID =
 					Title_Closing_Order_Request.Title_ID INNER JOIN
                    Title ON Doc_Closer_Title.TITLE_ID = Title.Title_ID LEFT OUTER JOIN
                    Companies ON Title.comp_id = Companies.ID
		WHERE      (DATEDIFF(HOUR, Title_Closing_Order_Request.c_dateandtime, GETDATE()) 		> 1)
					AND (Doc_Closer_Title.A_DATE_ASSIGNED IS NULL) AND
                    (Title.cancelled IS NULL)AND
					(Companies.ID IN (#companylist#))
</CFQUERY>
<!---Closing Info Not Submitted--->
<CFQUERY datasource="#request.dsn#" NAME="read_7">
	SELECT     DATEDIFF(Hh, Title_Closing_Order_Request.c_dateandtime, GETDATE()) % 24
			   AS Hours, Title_Closing_Order_Request.Title_ID As ID,Companies.company,
			   DATEDIFF(dd, Title_Closing_Order_Request.c_dateandtime, GETDATE()) AS
 			   days, Title.bfirstname1 + ' ' + Title.blastname1 AS Name,
			   DATEDIFF(n,Title_Closing_Order_Request.c_dateandtime, GETDATE()) % 60 AS
 			   minutes, 'Binder Data Not Merged' as Event
	FROM       EventList INNER JOIN
			   Title_Closing_Order_Request ON EventList.Title_id =
 	           Title_Closing_Order_Request.Title_ID INNER JOIN
               Title ON Title_Closing_Order_Request.Title_ID = Title.Title_ID LEFT OUTER
 			   JOIN Companies ON Title.comp_id = Companies.ID
	WHERE     (Title.cancelled IS NULL) AND
		      (Title_Closing_Order_Request.a_Req_Closing_Day IS NOT NULL) AND
 	          (EventList.c_Day IS NULL) AND
              (DATEDIFF(Hh, Title_Closing_Order_Request.c_dateandtime, GETDATE()) > 4)
			  AND (Companies.ID IN (#companylist#))
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_8">
	SELECT     	Title.Title_ID as ID, 'Final Hud Not Complete' As Event,
				DATEDIFF(hh,Doc_Closer_Title.inst_dateandtime,GETDATE())% 24 AS hours,
				DATEDIFF(dd, Doc_Closer_Title.inst_dateandtime, GETDATE()) AS days,
 				DATEDIFF(n, Doc_Closer_Title.inst_dateandtime, GETDATE())% 60 AS minutes,
 				Companies.company,Title.bfirstname1 + ' ' + Title.blastname1 AS Name
	FROM        Title INNER JOIN
				Doc_Closer_Title ON Title.Title_ID = Doc_Closer_Title.TITLE_ID LEFT OUTER
 				JOIN Companies ON Title.comp_id = Companies.ID
	WHERE       (Title.cancelled IS NULL) AND (Doc_Closer_Title.closing_instructions IS
 				NOT NULL) AND (Doc_Closer_Title.final_HUD IS NULL) AND
                (DATEDIFF(hh, Doc_Closer_Title.inst_dateandtime, GETDATE()) > 2)
				AND (Companies.ID IN (#companylist#))
</CFQUERY>

<!---Loan Not Closed--->
<CFQUERY datasource="#request.dsn#" NAME="read_9">
	SELECT      Title_Closing_Order_Request.Title_ID As ID,
				'Loan Not Closed' As Event,
				DATEDIFF(HOUR, EventList.sc_dateandtime, GETDATE())%24 AS hours,
 			    DATEDIFF(dd, EventList.sc_dateandtime, GETDATE()) AS days,
				DATEDIFF(n,EventList.sc_dateandtime, GETDATE()) % 60 AS minutes,
 				Companies.company, Title.bfirstname1 + ' ' + Title.blastname1 AS Name
	FROM        EventList INNER JOIN
                Title_Closing_Order_Request ON EventList.Title_id =
 				Title_Closing_Order_Request.Title_ID INNER JOIN
                Title ON Title_Closing_Order_Request.Title_ID = Title.Title_ID LEFT OUTER
 				JOIN Companies ON Title.comp_id = Companies.ID
	WHERE       (Title.cancelled IS NULL) AND (EventList.c_Day IS NOT NULL) AND
 				(EventList.cl_dateandtime IS NULL) AND
				(DATEDIFF(HOUR, EventList.sc_dateandtime, GETDATE()) > 6)
				AND (Companies.ID IN (#companylist#))
</CFQUERY>
<!---Loan Not Funded--->
<CFQUERY datasource="#request.dsn#" NAME="read_10">
	SELECT     	Title_Closing_Order_Request.Title_ID as ID,
				'Loan Not Funded' As Event,
				DATEDIFF(HOUR, EventList.sc_dateandtime, GETDATE())%24 AS Hours,
                Title.bfirstname1 + ' ' + Title.blastname1 AS Name,
				DATEDIFF(dd, EventList.sc_dateandtime, GETDATE()) AS days,
				DATEDIFF(n,EventList.sc_dateandtime, GETDATE()) % 60 AS minutes,
		 		Companies.company
	FROM        EventList INNER JOIN
                Title_Closing_Order_Request ON EventList.Title_id =
 				Title_Closing_Order_Request.Title_ID INNER JOIN
				Title ON Title_Closing_Order_Request.Title_ID =
				Title.Title_ID LEFT OUTER JOIN
                Companies ON Title.comp_id = Companies.ID
	WHERE     	(Title.cancelled IS NULL) AND (EventList.c_Day IS NOT NULL) AND
 				(EventList.fl_dateandtime IS NULL) AND
				(DATEDIFF(HOUR,EventList.sc_dateandtime, GETDATE()) > 80)
				AND (Title.cancelled IS NULL)
				AND (Companies.ID IN (#companylist#))
</CFQUERY>
<!---Pre Funding Not Completed--->
<CFQUERY datasource="#request.dsn#" NAME="read_11">
		SELECT     	Tax_Cert_Title.Title_ID As ID, 'Pre Funding Not Completed' As Event,
					DATEDIFF(HOUR, EventList.cl_dateandtime, GETDATE()) AS Hours,
 					Companies.company,
					DATEDIFF(dd,EventList.cl_dateandtime, GETDATE())%24 AS days,
					DATEDIFF(n, EventList.cl_dateandtime, GETDATE()) %60 AS minutes,
                    Title.bfirstname1 + ' ' + Title.blastname1 AS name
		FROM        EventList INNER JOIN
                    Tax_Cert_Title ON EventList.Title_id = Tax_Cert_Title.Title_ID INNER
 					JOIN Title ON Tax_Cert_Title.Title_ID = Title.Title_ID INNER JOIN
                    Companies ON Title.comp_id = Companies.ID
		WHERE     	(Title.cancelled IS NULL) AND (Tax_Cert_Title.pre_funding IS NULL)
 					AND (EventList.cl_dateandtime IS NOT NULL) AND
					(DATEDIFF(HOUR,EventList.cl_dateandtime, GETDATE()) > 0)
					AND (Companies.ID IN (#companylist#))
</CFQUERY>
<!---Property Data Not Merged--->
<CFQUERY datasource="#request.dsn#" NAME="read_12">
	SELECT     	Doc_Title_Insurance_Prop.Prop_ID As ID,'Property Data Not Merged' As Event,
				DATEDIFF(HOUR, Doc_Abstract_Prop.r_dateandtime, GETDATE())%24 AS hours,
 				DATEDIFF(dd,Doc_Abstract_Prop.r_dateandtime, GETDATE()) AS days,
 				DATEDIFF(n, Doc_Abstract_Prop.r_dateandtime, GETDATE()) % 60 AS minutes,
                Property.bfirstname1 + ' ' + Property.blastname1 AS Name,
	 			Companies.company
	FROM        Doc_Title_Insurance_Prop INNER JOIN
                Doc_Abstract_Prop ON Doc_Title_Insurance_Prop.Prop_ID =
		 		Doc_Abstract_Prop.Prop_ID INNER JOIN
                Property ON Doc_Abstract_Prop.Prop_ID = Property.Prop_ID LEFT OUTER JOIN
				Companies ON Property.comp_id = Companies.ID
	WHERE      (Doc_Abstract_Prop.a_Date_Completed IS NOT NULL) AND
 			   (Doc_Title_Insurance_Prop.merge_date IS NULL) AND
			   (DATEDIFF(HOUR,Doc_Abstract_Prop.r_dateandtime, GETDATE()) > 2)
			   AND (Companies.ID IN (#companylist#))
</CFQUERY>
<!---Property Data Not Completed--->
<CFQUERY datasource="#request.dsn#" NAME="read_13">
	SELECT     	Property.Prop_ID,'Property Data Not Completed' As Event,
				DATEDIFF(HOUR, Property.dateandtime, GETDATE()) % 24 AS Hours,
				DATEDIFF(dd, Property.dateandtime, GETDATE()) AS days,
				DATEDIFF(n, Property.dateandtime, GETDATE())%60  AS minutes,
 		        Companies.company,Property.bfirstname1 + ' ' + Property.blastname1
				AS 	name, Companies.ID
	FROM        Property INNER JOIN
                Doc_Title_Insurance_Prop ON Property.Prop_ID =
 				Doc_Title_Insurance_Prop.Prop_ID LEFT OUTER JOIN
                Companies ON Property.comp_id = Companies.ID
	WHERE       (Doc_Title_Insurance_Prop.a_recieved_date IS NULL) AND
				(DATEDIFF(HOUR,Property.dateandtime, GETDATE()) > 60) AND
                (Companies.ID <> 100) AND (Companies.ID IN (#companylist#))
</CFQUERY>

<!---Payoffs Not Ordered--->
<CFQUERY datasource="#request.dsn#" NAME="read_14">
	SELECT     	Title.Title_ID As ID,'Payoffs Not Ordered' As Event,
				DATEDIFF(HOUR, Pay_Off_Lender_1_Title.pa_dateandtime, GETDATE())%24 AS
 				Hours, DATEDIFF(dd,Pay_Off_Lender_1_Title.pa_dateandtime, GETDATE()) AS
		 	    days, DATEDIFF(n, Pay_Off_Lender_1_Title.pa_dateandtime, GETDATE())%60 AS
 				minutes, Title.bfirstname1 + ' ' + Title.blastname1 AS name,
 				Companies.company
	FROM        Title INNER JOIN Pay_Off_Lender_1_Title ON Title.Title_ID =
 				Pay_Off_Lender_1_Title.Title_ID AND
                Title.Title_ID = Pay_Off_Lender_1_Title.Title_ID LEFT OUTER JOIN
                Companies ON Title.comp_id = Companies.ID
	WHERE       (Title.cancelled IS NULL) AND (Title.polender1 IS NOT NULL) AND
 				(Title.polender1 <> '') AND
                (Pay_Off_Lender_1_Title.a_assigned_date IS NULL) AND
				(DATEDIFF(HOUR, Pay_Off_Lender_1_Title.pa_dateandtime, GETDATE()) > 2)
				AND (Companies.ID IN (#companylist#))
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_15">
	SELECT     	Title.Title_ID As ID,'Payoffs Not Received' As Event,
				DATEDIFF(HOUR, Pay_Off_Lender_1_Title.pa_dateandtime, GETDATE())%24 AS
 				hours, DATEDIFF(dd,Pay_Off_Lender_1_Title.pa_dateandtime, GETDATE()) AS
 				days, DATEDIFF(n, Pay_Off_Lender_1_Title.pa_dateandtime, GETDATE())%60 AS
 				minutes,Title.bfirstname1 + ' ' + Title.blastname1 AS name,
				Companies.company
	FROM        Title INNER JOIN
                Pay_Off_Lender_1_Title ON Title.Title_ID =
 				Pay_Off_Lender_1_Title.Title_ID LEFT OUTER JOIN
                Companies ON Title.comp_id = Companies.ID
	WHERE     	(Title.cancelled IS NULL) AND (Title.polender1 IS NOT NULL) AND
 				(Title.polender1 <> '') AND
                (Pay_Off_Lender_1_Title.a_recieved_date IS NULL) AND
				(DATEDIFF(HOUR, Pay_Off_Lender_1_Title.pa_dateandtime, GETDATE()) > 72)
				AND (Companies.ID IN (#companylist#))
</CFQUERY>
<!---Outstanding pre-processed files--->

<CFQUERY datasource="#request.dsn#" NAME="Read_16">
	SELECT     	sqlPreProcessingOpenOrders.Title_ID As ID,'Outstanding Preprocessed Files' As Event,
 				   	sqlPreProcessingOpenOrders.company,
                   	sqlPreProcessingOpenOrders.bfirstname1 + ' ' +
 				   	sqlPreProcessingOpenOrders.blastname1 AS name, DATEDIFF(n,
                   	sqlPreProcessingOpenOrders.dateandtime, GETDATE())%60 AS minutes,
 					DATEDIFF(d, sqlPreProcessingOpenOrders.dateandtime, GETDATE())
                    AS days,
					DATEDIFF(hh, sqlPreProcessingOpenOrders.dateandtime, GETDATE())%24 AS
 					hours
		FROM        sqlPreProcessingOpenOrders LEFT OUTER JOIN
                    First_Admin ON sqlPreProcessingOpenOrders.p_name =
 					First_Admin.username
		Where		sqlPreprocessingOpenOrders.ID In (#companylist#)
					ORDER BY DATEDIFF(n, sqlPreProcessingOpenOrders.dateandtime,
			 		GETDATE()) DESC
</CFQUERY>
</CFIF>

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
		<TR><TD>
		<CFOUTPUT>
		<cfFORM NAME="Search" METHOD="post" ACTION="https://#cgi.server_name#/admin_area/title_REP_display_single.cfm?uid=#URL.uid#&al=#URL.al#" target="work">
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
</CFOUTPUT></TD></TR>
	</table>
	<CFLOOP QUERY="CTC_Names">
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
	<TR>
		</table>
		</cfloop> <!--- A guess on where the closing </cfloop> goes the </cfloop> was missing so I guessed did not look like code was used. 4/05 --->
		<table width="893" align="center" height="30" border="0" style="WIDTH: 893px; HEIGHT: 30px">
		<td width="99" bgcolor="#CCD2D2">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
		<td width="99" bgcolor="#CCD2D2">
			<Center>
			<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/title_rep_view.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1" target="_blank">
						<font size=2 color=blue face=verdana>Orders</font></a>
			</cfoutput>
			</CENTER>
		<td width="99" bgcolor="#CCD2D2">
			<Center>
			<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/calendar_company.cfm?uid=#URL.uid#&al=#URL.al#"target="_blank">
					<font size=2 color=green face=verdana>Calendar</font>
					</a>
			</cfoutput>
			</CENTER>
		<td width="99" bgcolor="#CCD2D2">
			<Center>
			<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/statistics_select.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank">
				<font size=2 color=red face=verdana>Statistics</font></a>
			</cfoutput>
			</CENTER>

			<td width="99" bgcolor="#CCD2D2">
				<Center>
				<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/monitor_user.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank">
				<font size=2 color=yellow face=verdana>Monitor User</font></a>
				</cfoutput>
				</CENTER>

		<td width="99" bgcolor="#CCD2D2">
			<Center>
			<cfoutput>
<A HREF="https://#cgi.server_name#/admin_area/weblinks_search.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=6&company_id=0" target="_blank"><font size=2 color=orange face=verdana>Web Links</font></a>
			</cfoutput>
			</CENTER>
		<td width="99" bgcolor="#CCD2D2">
			<Center>
				<A HREF="#" onclick="location.reload()">Refresh</A>
			</center>
		</td>
		<td width="99" bgcolor="#CCD2D2">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
		<td width="99" bgcolor="#CCD2D2">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
		</TR>
	</table>

	<table width="893">
		<tr>
			<TD>
				<B><P align=center>Welcome&nbsp;<CFOUTPUT>#a_fname#&nbsp;#a_lname#&nbsp;</CFOUTPUT>to the First Title
            	Customer Service Log In Screen.&nbsp;&nbsp;<CFOUTPUT>The Date is #DateFormat(Now(), "m/d/yyyy")# and time #LSTimeFormat(Now(),"hh:mm tt")#</CFOUTPUT></P></B>
			</TD>
		</tr>
	</table>

<CFIF #read_companies.RecordCount# gte 1 >
	<table width="893" align="center">

		<tr>
			<TD colspan=6><Center><B>Orderdue Items</B></CENTER></TD>
		</tr>
		<tr>
			<TD colspan=6><Center><B>#read_Companies.company#</B></CENTER></TD>
		</tr>
		<TR>
			<td bgcolor="elelel" valign=top align="center">
				<B>Order Num</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Event Type</B>
			</td>
			<td bgcolor="elelel" valign=top align="center">
				<B>Borrower Name</B>
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
		<CFPARAM NAME="MaxRows" DEFAULT="1000">
		<CFPARAM NAME="StartRow" DEFAULT="1">
		<CFOUTPUT QUERY="read_1" StartRow="#StartRow#" MAXROWS="#MaxRows#">
		<tr>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_1.id#&a_trigger=1" target="_blank">
				<font size=1 color=blue face=verdana>
				T-#id#
				</font>
				</a>
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Event#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Name#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#company#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#days# days #hours# hours #minutes# minutes
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_1.id#&a_trigger=1" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')">
				<FONT FACE=verdana SIZE=1 color="blue">
				add/view</a>
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
		<CFOUTPUT QUERY="read_2" StartRow="#StartRow#" MAXROWS="#MaxRows#">
		<tr>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="prop_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_2.id#&a_trigger=1" target="_blank">
				<font size=1 color=blue face=verdana>
				P-0232#id#
				</font>
				</a>
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Event#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Name#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#company#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#days# days #hours# hours #minutes# minutes
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_2.id#&a_trigger=1" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')">
				<FONT FACE=verdana SIZE=1 color="blue">
				add/view</a>
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
		<CFOUTPUT QUERY="read_3" StartRow="#StartRow#" MAXROWS="#MaxRows#">
		<tr>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_3.id#&a_trigger=1" target="_blank">
				<font size=1 color=blue face=verdana>
				T-#id#
				</font>
				</a>
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Event#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Name#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#company#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#days# days #hours# hours #minutes# minutes
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_3.id#&a_trigger=1" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')">
				<FONT FACE=verdana SIZE=1 color="blue">
				add/view</a>
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
		<CFOUTPUT QUERY="read_4" StartRow="#StartRow#" MAXROWS="#MaxRows#">
		<tr>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="prop_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_4.id#&a_trigger=1" target="_blank">
				<font size=1 color=blue face=verdana>
				P-0232#id#
				</font>
				</a>
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Event#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Name#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#company#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#days# days #hours# hours #minutes# minutes
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_4.id#&a_trigger=1" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')">
				<FONT FACE=verdana SIZE=1 color="blue">
				add/view</a>
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
		<CFOUTPUT QUERY="read_5" StartRow="#StartRow#" MAXROWS="#MaxRows#">
		<tr>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_5.id#&a_trigger=1" target="_blank">
				<font size=1 color=blue face=verdana>
				T-#id#
				</font>
				</a>
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Event#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Name#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#company#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#days# days #hours# hours #minutes# minutes
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_5.id#&a_trigger=1" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')">
				<FONT FACE=verdana SIZE=1 color="blue">
				add/view</a>
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
		<CFOUTPUT QUERY="read_6" StartRow="#StartRow#" MAXROWS="#MaxRows#">
		<tr>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_6.id#&a_trigger=1" target="_blank">
				<font size=1 color=blue face=verdana>
				T-#id#
				</font>
				</a>
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Event#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Name#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#company#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#days# days #hours# hours #minutes# minutes
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_6.id#&a_trigger=1" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')">
				<FONT FACE=verdana SIZE=1 color="blue">
				add/view</a>
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
		<CFOUTPUT QUERY="read_7" StartRow="#StartRow#" MAXROWS="#MaxRows#">
		<tr>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_7.id#&a_trigger=1" target="_blank">
				<font size=1 color=blue face=verdana>
				T-#id#
				</font>
				</a>
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Event#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Name#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#company#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#days# days #hours# hours #minutes# minutes
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_7.id#&a_trigger=1" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')">
				<FONT FACE=verdana SIZE=1 color="blue">
				add/view</a>
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
		<CFOUTPUT QUERY="read_8" StartRow="#StartRow#" MAXROWS="#MaxRows#">
		<tr>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_8.id#&a_trigger=1" target="_blank">
				<font size=1 color=blue face=verdana>
				T-#id#
				</font>
				</a>
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Event#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Name#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#company#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#days# days #hours# hours #minutes# minutes
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_8.id#&a_trigger=1" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')">
				<FONT FACE=verdana SIZE=1 color="blue">
				add/view</a>
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
		<CFOUTPUT QUERY="read_9" StartRow="#StartRow#" MAXROWS="#MaxRows#">
		<tr>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_9.id#&a_trigger=1" target="_blank">
				<font size=1 color=blue face=verdana>
				T-#id#
				</font>
				</a>
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Event#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Name#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#company#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#days# days #hours# hours #minutes# minutes
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_9.id#&a_trigger=1" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')">
				<FONT FACE=verdana SIZE=1 color="blue">
				add/view</a>
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
		<CFOUTPUT QUERY="read_10" StartRow="#StartRow#" MAXROWS="#MaxRows#">
		<tr>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_10.id#&a_trigger=1" target="_blank">
				<font size=1 color=blue face=verdana>
				T-#id#
				</font>
				</a>
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Event#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Name#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#company#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#days# days #hours# hours #minutes# minutes
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_10.id#&a_trigger=1" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')">
				<FONT FACE=verdana SIZE=1 color="blue">
				add/view</a>
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
	<CFOUTPUT QUERY="read_11" StartRow="#StartRow#" MAXROWS="#MaxRows#">
		<tr>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_11.id#&a_trigger=1" target="_blank">
				<font size=1 color=blue face=verdana>
				T-#id#
				</font>
				</a>
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Event#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Name#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#company#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#days# days #hours# hours #minutes# minutes
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_11.id#&a_trigger=1" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')">
				<FONT FACE=verdana SIZE=1 color="blue">
				add/view</a>
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
		<CFOUTPUT QUERY="read_12" StartRow="#StartRow#" MAXROWS="#MaxRows#">
		<tr>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="prop_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_12.id#&a_trigger=1" target="_blank">
				<font size=1 color=blue face=verdana>
				P-0232#id#
				</font>
				</a>
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Event#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Name#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#company#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#days# days #hours# hours #minutes# minutes
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_12.id#&a_trigger=1" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')">
				<FONT FACE=verdana SIZE=1 color="blue">
				add/view</a>
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
		<CFOUTPUT QUERY="read_13" StartRow="#StartRow#" MAXROWS="#MaxRows#">
		<tr>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="prop_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_13.id#&a_trigger=1" target="_blank">
				<font size=1 color=blue face=verdana>
				P-0232#id#
				</font>
				</a>
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Event#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Name#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#company#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#days# days #hours# hours #minutes# minutes
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_13.id#&a_trigger=1" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')">
				<FONT FACE=verdana SIZE=1 color="blue">
				add/view</a>
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
		<CFOUTPUT QUERY="read_14" StartRow="#StartRow#" MAXROWS="#MaxRows#">
		<tr>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_14.id#&a_trigger=1" target="_blank">
				<font size=1 color=blue face=verdana>
				T-#id#
				</font>
				</a>
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Event#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Name#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#company#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#days# days #hours# hours #minutes# minutes
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_14.id#&a_trigger=1" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')">
				<FONT FACE=verdana SIZE=1 color="blue">
				add/view</a>
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
		<CFOUTPUT QUERY="read_15" StartRow="#StartRow#" MAXROWS="#MaxRows#">
		<tr>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_15.id#&a_trigger=1" target="_blank">
				<font size=1 color=blue face=verdana>
				T-#id#
				</font>
				</a>
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Event#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Name#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#company#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#days# days #hours# hours #minutes# minutes
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_15.id#&a_trigger=1" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')">
				<FONT FACE=verdana SIZE=1 color="blue">
				add/view</a>
			</td>
		</tr>
		</CFOUTPUT>
		<CFOUTPUT QUERY="read_16" StartRow="#StartRow#" MAXROWS="#MaxRows#">
		<tr>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_report_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_16.id#&a_trigger=1" target="_blank">
				<font size=1 color=blue face=verdana>
				T-#id#
				</font>
				</a>
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Event#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#Name#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#company#
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				#days# days #hours# hours #minutes# minutes
			</td>
			<td bgcolor="#a_bgcolor#" valign=center align="center">
				<font size=1 color=black face=verdana><b>
				<a href="title_comments_nav.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#read_16.id#&a_trigger=1" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')">
				<FONT FACE=verdana SIZE=1 color="blue">
				add/view</a>
			</td>
		</tr>

		</CFOUTPUT>
	</table>
<CFELSE>
	<table>
		<tr>
			<td>
				<CENTER><BOLD>You do not have any First Title Clients assigned to you</BOLD></CENTER>
			</td>
		</tr>
	</table>
</CFIF>
</table>