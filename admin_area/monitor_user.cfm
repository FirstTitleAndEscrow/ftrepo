
<CFPARAM NAME="a_state"     DEFAULT="None">
<CFPARAM NAME="a_zip"       DEFAULT="None">
<CFPARAM NAME="a_county"    DEFAULT="None">
<CFPARAM NAME="a_city"      DEFAULT="None">
<CFPARAM NAME="a_area_code" DEFAULT="None">
<CFPARAM NAME="confirm_mon" DEFAULT="">
<CFPARAM NAME="confirm_mon_to" DEFAULT="">
<CFPARAM NAME="events" DEFAULT="">
<CFPARAM NAME="order" DEFAULT="">
<CFPARAM NAME="comfirm_day" DEFAULT="">
<CFPARAM NAME="comfirm_day_to" DEFAULT="">
<CFPARAM NAME="confirm_year" DEFAULT="">
<CFPARAM NAME="confirm_year_to" DEFAULT="">
<CFPARAM NAME="a_trigger"   DEFAULT="1">
<CFPARAM NAME="r_count"     DEFAULT="0">
<CFPARAM NAME="comp_id"     DEFAULT="">
<CFPARAM NAME="product" DEFAULT="">
<cfparam name="a_flag" default="1">

<!---Current Date, time --->
<CFSET check_date = #DateFormat(Now(), "dddd")#>
<CFSET insert_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET insert_date = #DateFormat(Now(), "mm-dd-yyyy")#>

<!---If the day of the week is Monday --->
<cfif #check_date# eq "Monday">

	<CFQUERY datasource="#request.dsn#" NAME="check_report">
		SELECT *
		FROM datecompare
		WHERE comparedate = '#insert_date#'
	</cfquery>
	<!---If the compare date = insert date has less than two records --->
	<cfif #check_report.recordcount# LT "2">
		<CFQUERY datasource="#request.dsn#" >
			INSERT INTO  datecompare(comparedate)
			VALUES('#insert_date#')
		</CFQUERY>
	</cfif>

	<CFQUERY datasource="#request.dsn#" NAME="read_reporting">
			SELECT *
			FROM datecompare
			WHERE comparedate = '#insert_date#'
	</cfquery>
	<!---If the compare date = insert date has less than two records --->
	<cfif #read_reporting.recordcount# LT 2>
		<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
		<!---Update the following tables with current date and time --->
		<CFQUERY datasource="#request.dsn#">		
			UPDATE Title
			SET	t_currentdate = '#order_date_adj#'
		</cfquery>

		<CFQUERY datasource="#request.dsn#">		
			UPDATE property
			SET	t_currentdate = '#order_date_adj#'
		</cfquery>

		<CFQUERY datasource="#request.dsn#">		
			UPDATE doc_abstract_Title
			SET	a_currentdate = '#order_date_adj#'
		</cfquery>
		
		 <CFQUERY datasource="#request.dsn#">		
			UPDATE Pay_Off_Lender_1_Title
			SET	p_currentdate = '#order_date_adj#'
		</cfquery>
		<CFQUERY datasource="#request.dsn#">		
			UPDATE Pay_Off_Lender_2_Title
			SET	p_currentdate = '#order_date_adj#'
		</cfquery>

 		<CFQUERY datasource="#request.dsn#">		
			UPDATE doc_abstract_prop
			SET	a_currentdate = '#order_date_adj#'
		</cfquery>

		<CFQUERY datasource="#request.dsn#">		
			UPDATE doc_title_insurance_title
			SET	ti_currentdate = '#order_date_adj#'
		</cfquery>

		<CFQUERY datasource="#request.dsn#">		
			UPDATE doc_title_insurance_prop
			SET	ti_currentdate = '#order_date_adj#'
		</cfquery>
		<CFQUERY datasource="#request.dsn#">		
			UPDATE tax_cert_title
			SET	tx_currentdate = '#order_date_adj#'
		</cfquery>

		<CFQUERY datasource="#request.dsn#">		
			UPDATE title_closing_order_request
			SET	c_currentdate = '#order_date_adj#'
		</cfquery>
		
		<CFQUERY datasource="#request.dsn#">		
			UPDATE doc_closer_title
			SET	ac_currentdate = '#order_date_adj#'
		</cfquery>
		
		<CFQUERY datasource="#request.dsn#">		
			UPDATE eventlist
			SET	e_currentdate = '#order_date_adj#'
		</cfquery>
		<!--Different Views By Date Age --->
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM Title a, doc_abstract_title f
			WHERE a.title_id = f.title_id and a.cancelled is null AND f.a_date_assigned is null and (datediff(HOUR, a.dateandtime, f.a_currentdate) > 2) 
		</CFQUERY>  
	
		<CFQUERY datasource="#request.dsn#" NAME="read_report1">
			SELECT *
			FROM Title a, doc_abstract_title f
			WHERE a.title_id = f.title_id and a.cancelled is null AND f.a_date_completed is null AND (datediff(HOUR, a.dateandtime, f.a_currentdate) > 56) 
		</CFQUERY>  
		
		<CFQUERY datasource="#request.dsn#" NAME="read_report2">
			SELECT *
			FROM title c, doc_abstract_title a, doc_title_insurance_title f
			WHERE a.title_id = f.title_id and a.title_id = c.title_id and c.cancelled is null AND a.a_date_completed is not null and f.merge_date is null and (datediff(HOUR, a.r_dateandtime, f.ti_currentdate) > 2) 
		</CFQUERY>  
		
		 <CFQUERY datasource="#request.dsn#" NAME="read_report3">
			SELECT *
			FROM title a, doc_title_insurance_title f
			WHERE a.title_id = f.title_id and a.cancelled is null AND f.a_recieved_date is null and (datediff(HOUR, a.dateandtime, f.ti_currentdate) > 60) 
		</CFQUERY> 
		 
		<CFQUERY datasource="#request.dsn#" NAME="read_report4">
			SELECT *
			FROM title a, tax_cert_title f
			WHERE a.title_id = f.title_id and a.cancelled is null AND f.t_dateandtime is null and (datediff(HOUR, a.dateandtime, f.tx_currentdate) > 24) 
		</CFQUERY> 
		
		<CFQUERY datasource="#request.dsn#" NAME="read_report5">
			SELECT *
			FROM title c, title_closing_order_request a, doc_closer_title f
			WHERE a.title_id = f.title_id and a.title_id = c.title_id and c.cancelled is null AND a.a_req_closing_day is not null AND f.a_date_assigned is null and (datediff(HOUR, a.c_dateandtime, f.ac_currentdate) > 1) 
		</CFQUERY> 
		 
		 <CFQUERY datasource="#request.dsn#" NAME="read_report6">
			SELECT *
			FROM title c, title_closing_order_request a, eventlist f
			WHERE a.title_id = f.title_id and a.title_id = c.title_id and c.cancelled is null AND a.a_req_closing_day is not null AND f.c_day is null AND (datediff(HOUR, a.c_dateandtime, f.e_currentdate) > 4) 
		</CFQUERY> 
		 
		<CFQUERY datasource="#request.dsn#" NAME="read_report7">
			SELECT *
			FROM title a, doc_closer_title f
			WHERE a.title_id = f.title_id and a.cancelled is null AND f.closing_instructions is not null AND f.final_hud is null and (datediff(HOUR, f.inst_dateandtime, f.ac_currentdate) > 2) 
		</CFQUERY> 
		
		<CFQUERY datasource="#request.dsn#" NAME="read_report8">
			SELECT *
			FROM title c, title_closing_order_request a, eventlist f
			WHERE a.title_id = f.title_id and a.title_id = c.title_id and c.cancelled is null AND f.c_day is not null AND f.cl_dateandtime is null and (datediff(HOUR, f.sc_dateandtime, f.e_currentdate) > 6) 
		</CFQUERY> 
		
		<CFQUERY datasource="#request.dsn#" NAME="read_report9">
			SELECT *
			FROM title c, title_closing_order_request a, eventlist f
			WHERE a.title_id = f.title_id and a.title_id = c.title_id and c.cancelled is null AND f.c_day is not null AND f.fl_dateandtime is null and (datediff(HOUR, f.sc_dateandtime, f.e_currentdate) > 80) 
		</CFQUERY> 

		<CFQUERY datasource="#request.dsn#" NAME="read_report10">
			SELECT *
			FROM title c, tax_cert_title a, eventlist f
			WHERE a.title_id = f.title_id and a.title_id = c.title_id and c.cancelled is null AND a.pre_funding is null AND f.cl_dateandtime is not null and (datediff(HOUR, f.cl_dateandtime, f.e_currentdate) > 0) 
		</CFQUERY> 
		
		<CFQUERY datasource="#request.dsn#" NAME="read_report11">
			SELECT *
			FROM Property c, doc_abstract_prop a, doc_title_insurance_prop f
			WHERE a.prop_id = f.prop_id and a.prop_id = c.prop_id AND a.a_date_completed is not null and f.merge_date is null and (datediff(HOUR, a.r_dateandtime, f.ti_currentdate) > 2) 
		</CFQUERY> 
		
		<CFQUERY datasource="#request.dsn#" NAME="read_report12">
			SELECT *
			FROM property a, doc_title_insurance_prop f
			WHERE a.prop_id = f.prop_id AND f.a_recieved_date is null and (datediff(HOUR, a.dateandtime, f.ti_currentdate) > 60) 
		</CFQUERY>  
		
		<CFQUERY datasource="#request.dsn#" NAME="read_report13">
			SELECT a.*, f.*, c.team_id, t.name AS TEAM_NAME
			FROM Title a, Pay_Off_Lender_1_Title f, Companies c, Teams t
			WHERE a.title_id = f.title_id and a.cancelled is null AND a.polender1 is not null and a.polender1 != '' AND f.a_assigned_date is null and (datediff(HOUR, f.pa_dateandtime, f.p_currentdate) > 2) 
			and a.title_id not in (18315,18960,20120,18982, 19065, 19117, 19142, 16085,16101,16634,16650,16733,16916,17033,17037,17053,17121,17166,17205,17227,17229,17423,17425,17607,17653,17782,18114,18208,18425,18565,18570,18731,18904,19399,19400,19324,19318,19316,19282,19447,17265,18264,18528,16966,17601,17661,17687,17977,19872, 19894, 19881,19867,19908,19881,20989,21006,21004,20999,20339,21000,21002)
			and c.ID = a.comp_id
			and t.ID = c.team_id 
		</CFQUERY>  
		
		<CFQUERY datasource="#request.dsn#" NAME="read_report14">
			SELECT a.*, f.*, c.team_id, t.name AS TEAM_NAME
			FROM Title a, Pay_Off_Lender_1_Title f, Companies c, Teams t
			WHERE a.title_id = f.title_id and a.cancelled is null AND a.polender1 is not null and a.polender1 != '' and  f.a_recieved_date is null AND (datediff(HOUR, f.pa_dateandtime, f.p_currentdate) > 72) 
			and a.title_id not in (18315,18960, 18982, 20120,19065, 19117, 19142, 16085,16101,16634,16650,16733,16916,17033,17037,17053,17121,17166,17205,17227,17229,17423,17425,17607,17653,17782,18114,18208,18425,18565,18570,18731,18904,19399,19400,19324,19318,19316,19282,19447,17265,18264,18528,16966,17601,17661,17687,17977,19872, 19894, 19881,19867,19908,19881,20989,21006,21004,20999,20339,21000,21002)
			and c.ID = a.comp_id
			and t.ID = c.team_id
		 </CFQUERY>  
		 
		 
		 
		 
		 		<CFQUERY datasource="#request.dsn#" NAME="read_report15">
			SELECT a.*, f.*, c.team_id, t.name AS TEAM_NAME
			FROM Title a, Pay_Off_Lender_2_Title f, Companies c, Teams t
			WHERE a.title_id = f.title_id and a.cancelled is null AND a.polender2 is not null and a.polender2 != '' AND f.a_assigned_date is null and (datediff(HOUR, f.pa_dateandtime, f.p_currentdate) > 2) 
			and a.title_id not in (18315,18960,20120,18982, 19065, 19117, 19142, 16085,16101,16634,16650,16733,16916,17033,17037,17053,17121,17166,17205,17227,17229,17423,17425,17607,17653,17782,18114,18208,18425,18565,18570,18731,18904,19399,19400,19324,19318,19316,19282,19447,17265,18264,18528,16966,17601,17661,17687,17977,19872, 19894, 19881,19867,19908,19881,20989,21006,21004,20999,20339,21000,21002) 
			and c.ID = a.comp_id
			and t.ID = c.team_id
		</CFQUERY>  
		
		<CFQUERY datasource="#request.dsn#" NAME="read_report16">
			SELECT a.*, f.*, c.team_id, t.name AS TEAM_NAME
			FROM Title a, Pay_Off_Lender_2_Title f, Companies c, Teams t
			WHERE a.title_id = f.title_id and a.cancelled is null AND a.polender2 is not null and a.polender2 != '' and  f.a_recieved_date is null AND (datediff(HOUR, f.pa_dateandtime, f.p_currentdate) > 72) 
			and a.title_id not in (18315,18960, 18982, 20120,19065, 19117, 19142, 16085,16101,16634,16650,16733,16916,17033,17037,17053,17121,17166,17205,17227,17229,17423,17425,17607,17653,17782,18114,18208,18425,18565,18570,18731,18904,19399,19400,19324,19318,19316,19282,19447,17265,18264,18528,16966,17601,17661,17687,17977,19872, 19894, 19881,19867,19908,19881,20989,21006,21004,20999,20339,21000,21002)
			and c.ID = a.comp_id
			and t.ID = c.team_id
		 </CFQUERY>  
		 
		<CFQUERY datasource="#request.dsn#" NAME="read_report17">
			SELECT     *
			FROM Title LEFT OUTER JOIN
            Companies ON Title.comp_id = Companies.ID LEFT OUTER JOIN
            Doc_Closer_Title ON Title.Title_ID = Doc_Closer_Title.TITLE_ID LEFT OUTER JOIN
            EventList ON Title.Title_ID = EventList.Title_id
			WHERE     (Doc_Closer_Title.closing_instructions IS NOT NULL) AND (Doc_Closer_Title.final_HUD IS NULL) AND (DATEDIFF(HOUR, 
            Doc_Closer_Title.inst_dateandtime, Doc_Closer_Title.ac_currentdate) >= 1) 
			AND (CAST(EventList.YearMonth AS smalldatetime) = CONVERT(CHAR(8), GETDATE(), 112))
		</CFQUERY>
		
		<!---Typing over one half hour --->
		<CFQUERY datasource="#request.dsn#" NAME="read_report19">
			SELECT     	Title_ID, Typing_ID, fname, lname, DATEADD(mi, 30, Typing_Start_Datetime) AS Time_Due, 
						Due_Date, bfirstname1, blastname1, company, Letter, 
                      	Typing_Start_Datetime
			FROM        sqlTyping
			WHERE       (DATEADD(mi, 30, Typing_Start_Datetime) <= GETDATE())
		</CFQUERY>
		
		<CFQUERY datasource="#request.dsn#" NAME="read_report20">
			SELECT     dbo.tblUser_Roles.Title_ID AS ID, 'In House Abstract Not Uploaded' AS Event, dbo.tblUser_Roles.vendor_mgmt_InHouse_ID, 
                      dbo.Title.bfirstname1 + ' ' + dbo.Title.blastname1 AS Name, DATEDIFF(hh, dbo.tblUser_Roles.vendor_mgmt_InHouse_Start_Datetime, GETDATE()) 
                      AS p_Hours, DATEDIFF(n, dbo.tblUser_Roles.vendor_mgmt_InHouse_Start_Datetime, GETDATE()) AS p_minutes, DATEDIFF(dd, 
                      dbo.tblUser_Roles.vendor_mgmt_InHouse_Start_Datetime, GETDATE()) AS p_days, dbo.Title.comp_id, dbo.Companies.company, 
                      dbo.First_Admin.fname, dbo.First_Admin.lname
			FROM         dbo.Title LEFT OUTER JOIN
                      dbo.Companies ON dbo.Title.comp_id = dbo.Companies.ID FULL OUTER JOIN
                      dbo.tblUser_Roles LEFT OUTER JOIN
                      dbo.First_Admin ON dbo.tblUser_Roles.vendor_mgmt_InHouse_ID = dbo.First_Admin.ID ON dbo.Title.Title_ID = dbo.tblUser_Roles.Title_ID
			WHERE     (dbo.tblUser_Roles.Title_ID IS NOT NULL) AND (dbo.tblUser_Roles.vendor_mgmt_InHouse_Start_Datetime IS NOT NULL) AND 
                      (dbo.tblUser_Roles.vendor_mgmt_InHouse_Finish_Datetime IS NULL) AND (dbo.tblUser_Roles.Cancelled IS NULL) AND (dbo.Companies.ID <> 100) 
                      AND (DATEDIFF(hh, dbo.tblUser_Roles.vendor_mgmt_InHouse_Start_Datetime, GETDATE()) >= 2)
		</CFQUERY> 

		 
		<CfOUTPUT QUERY="read_report">
			<CFSET add_day = #DateAdd('D', 2, #dateandtime#)#>
			<CFQUERY datasource="#request.dsn#">		
				UPDATE Title
				SET	
				dateandtime = #add_day#
				where title_id = #title_id#
			</cfquery>
		</CFOUTPUT>
			
		<CfOUTPUT QUERY="read_report1">
			<CFSET add_day = #DateAdd('D', 2, #dateandtime#)#>
			<CFQUERY datasource="#request.dsn#">		
				UPDATE Title
				SET	
				dateandtime = #add_day#
				where title_id = #title_id#
			</cfquery>
		</CFOUTPUT>
					
		<CFOUTPUT QUERY="read_report2">
			<CFSET add_day = #DateAdd('D', 2, #r_dateandtime#)#>
			<CFQUERY datasource="#request.dsn#">		
				UPDATE doc_abstract_prop
				SET	
				r_dateandtime = #add_day#
				where prop_id = #prop_id#
			</cfquery>
		</CFOUTPUT>
		
		<CFOUTPUT QUERY="read_report3">
			<CFSET add_day = #DateAdd('D', 2, #dateandtime#)#>
			<CFQUERY datasource="#request.dsn#">		
				UPDATE property
				SET	
				dateandtime = #add_day#
				where prop_id = #prop_id#
			</cfquery>
		</CFOUTPUT>

		<CFOUTPUT QUERY="read_report4">
			<CFSET add_day = #DateAdd('D', 2, #dateandtime#)#>
			<CFQUERY datasource="#request.dsn#">		
				UPDATE Title
				SET	
				dateandtime = #add_day#
				where title_id = #title_id#
			</cfquery>
		</CFOUTPUT>
		
		<CFOUTPUT QUERY="read_report5">
			<CFSET add_day = #DateAdd('D', 2, #c_dateandtime#)#>
			<CFQUERY datasource="#request.dsn#">		
				UPDATE Title_closing_request_title
				SET	
				c_dateandtime = #add_day#
				where title_id = #title_id#
			</cfquery>
		</CFOUTPUT>
		
		<CFOUTPUT QUERY="read_report6">
			<CFSET add_day = #DateAdd('D', 2, #c_dateandtime#)#>
			<CFQUERY datasource="#request.dsn#">		
				UPDATE Title_closing_request_title
				SET	
				c_dateandtime = #add_day#
				where title_id = #title_id#
			</cfquery>
		</CFOUTPUT>
		
		<CFOUTPUT QUERY="read_report7">
			<CFSET add_day = #DateAdd('D', 2, #inst_dateandtime#)#>
			<CFQUERY datasource="#request.dsn#">		
				UPDATE doc_closer_title
				SET	
				inst_dateandtime = #add_day#
				where title_id = #title_id#
			</cfquery>
		</CFOUTPUT>
		
		<CFOUTPUT QUERY="read_report8">
			<CFSET add_day = #DateAdd('D', 2, #sc_dateandtime#)#>
			<CFQUERY datasource="#request.dsn#">		
				UPDATE eventlist
				SET	
				sc_dateandtime = #add_day#
				where title_id = #title_id#
			</cfquery>
		</CFOUTPUT>
		
		<CFOUTPUT QUERY="read_report9">
			<CFSET add_day = #DateAdd('D', 2, #sc_dateandtime#)#>
			<CFQUERY datasource="#request.dsn#">		
				UPDATE eventlist
				SET	
				sc_dateandtime = #add_day#
				where title_id = #title_id#
			</cfquery>
		</CFOUTPUT>
			
		<CFOUTPUT QUERY="read_report13">
			<CFSET add_day = #DateAdd('D', 2, #pa_dateandtime#)#>
			<CFQUERY datasource="#request.dsn#">		
				UPDATE Pay_Off_Lender_1_Title
				SET	
				pa_dateandtime = #add_day#
				where title_id = #title_id#
			</cfquery>
		</CFOUTPUT>
		
		<CFOUTPUT QUERY="read_report14">
			<CFSET add_day = #DateAdd('D', 2, #p_dateandtime#)#>
			<CFQUERY datasource="#request.dsn#">		
				UPDATE Pay_Off_Lender_1_Title
				SET	
				p_dateandtime = #add_day#
				where title_id = #title_id#
			</cfquery>
		</CFOUTPUT>
		
		
		<CFOUTPUT QUERY="read_report15">
			<CFSET add_day = #DateAdd('D', 2, #pa_dateandtime#)#>
			<CFQUERY datasource="#request.dsn#">		
				UPDATE Pay_Off_Lender_2_Title
				SET	
				pa_dateandtime = #add_day#
				where title_id = #title_id#
			</cfquery>
		</CFOUTPUT>
		
		<CFOUTPUT QUERY="read_report16">
			<CFSET add_day = #DateAdd('D', 2, #p_dateandtime#)#>
			<CFQUERY datasource="#request.dsn#">		
				UPDATE Pay_Off_Lender_2_Title
				SET	
				p_dateandtime = #add_day#
				where title_id = #title_id#
			</cfquery>
		</CFOUTPUT>
		
		 <CFOUTPUT QUERY="read_report17">
			<CFSET add_day = #DateAdd('D', 2, #inst_dateandtime#)#>
			<CFQUERY datasource="#request.dsn#">		
				UPDATE doc_closer_title
				SET	
				inst_dateandtime = #add_day#
				where title_id = #title_id#
			</cfquery>
		</CFOUTPUT>
	</cfif>
</cfif>

<table width="100%" cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width="50%" align=left valign=top bgcolor=f1f1f1>
			<FONT FACE=ARIAL SIZE=2 color="black">
			<CENTER><B>Event</B></CENTER>
		</TD>
		<td width="50%" align=left valign=top bgcolor=f1f1f1>
			<FONT FACE=ARIAL SIZE=2 color="black">
			<CENTER><B>Client</B></CENTER>
		</TD>
	</TR>
<CFFORM NAME="frm" ACTION="./monitor_user.cfm?uid=#url.uid#&al=#URL.al#&a_trigger=2" METHOD=POST>
	<tr>
		<td width="50%" align=left valign=top bgcolor=elelel>
			<FONT FACE=ARIAL SIZE=2 color="black">
			<CENTER>	
			<select name="events" multiple
				size="5" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: 003F1E; 
				background-color: E4E3E3; 
				border-color: white; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; 
				float: none;" 
				rows="3" 
				cols="45" 
				>
								
				<OPTION VALUE="Abstractor Not Assigned">Abstractors Not Assigned</OPTION>
				<OPTION VALUE="Abstractor Not Received">Abstractors Not Received</OPTION>
				<OPTION VALUE="Binder Data Not Merged">Binder Data Not Merged</OPTION>
				<OPTION VALUE="Closer Not Assigned">Closer Not Assigned</OPTION>
				<OPTION VALUE="Closing Info Not Submitted">Closing Info Not Submitted</OPTION>
				<OPTION VALUE="Final Hud Not Complete">Final Hud Not Complete</OPTION>		
				<OPTION VALUE="Final Hud Not Complete One Hour">Final Hud Not Complete One Hour</OPTION>							
				<OPTION VALUE="ICL Uncompleted">ICL Uncompleted</OPTION>
				<OPTION VALUE="In House Abstract Not Uploaded">In House Abstract Not Uploaded</OPTION>
				<OPTION VALUE="Loan Not Closed">Loan Not Closed</OPTION>
				<OPTION VALUE="Loan Not Funded">Loan Not Funded</OPTION>
				<OPTION VALUE="Outstanding pre-processed files">Outstanding pre-processed files</OPTION>
				<OPTION VALUE="Payoffs Not Ordered">Payoffs Not Ordered</OPTION>
				<OPTION VALUE="Payoffs Not Received">Payoffs Not Received</OPTION>
				<option value="Pre-Funding NOT Completed">Pre-Funding NOT Completed</OPTION>
				<OPTION VALUE="Property Closing Info Not Submitted">Property Closing Info Not Submitted</OPTION>
				<OPTION VALUE="Property Data Not Completed">Property Data Not Completed</OPTION>
				<OPTION VALUE="Property Data Not Merged">Property Data Not Merged</OPTION>
				<OPTION VALUE="Title Ins Not Completed">Title Ins Not Completed</OPTION>
				<OPTION VALUE="Tax Data Not Completed">Tax Data Not Completed</OPTION>
				<OPTION VALUE="Typing Not Completed">Typing Not Completed</OPTION>
			</select>
			
			</CENTER>
		</TD>
<cfquery datasource="#request.dsn#" name="va_comps">
	select ID from companies
	where intSales in (Select ID from First_admin where va_employee = 1)
</cfquery>	
<cfset va_companies = ValueList(va_comps.ID, ",")>
<cfquery datasource="#request.dsn#" name="fx_comps">
	select ID from companies
	where intSales in (Select ID from First_admin where ft_fairfax_employee = 1)
</cfquery>	
<cfset fx_companies = ValueList(fx_comps.ID, ",")>

<cfquery datasource="#request.dsn#" name="getcomp">
	select * from companies
	where a_status = 1
	<cfif session.va_employee eq 1>
	and ID in (#va_companies#)
	<cfelseif session.ft_fairfax_employee eq 1>
	and ID in (#fx_companies#)
	</cfif>
	order by company
</cfquery>	
		<td width="50%" align=center valign=top bgcolor=elelel>
			<select name="order" multiple
				size="5" 
				size="1" 
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: 003F1E; 
				background-color: E4E3E3; 
				border-color: white; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; 
				float: none;" 
				rows="3" 
				cols="45" 
			>

<CFOUTPUT QUERY="getcomp">
			<OPTION VALUE="#ID#">#company#</OPTION>
</CFOUTPUT>			
			</SELECT>
		</td>
	</TR>
	<tr>
		<td colspan = 2 bgcolor=d3d3d3 width="100%" align=center valign=top>
			<INPUT TYPE=image src="./images/button_search.gif" border=0> 	
		</td>		 
	</tr>
</CFFORM>
</table>			
<CFIF #a_trigger# EQ "2">
<table>	
	<tr>
		<td width="100%" align=left valign=top bgcolor=e1e1e1>
		<table width="100%" cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
			<tr>
				<td width="100%" align=center valign=top bgcolor=d3d3d3>
					<FONT FACE=ARIAL SIZE=2 color="black">
					<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;&nbsp;R e s u l t s </B></CENTER>
				</TD>
			</TR>
			<tr>
				<td width="100%" align=center valign=top bgcolor=d3d3d3>
					<table width="100%" cellpadding=1 cellspacing=1 border=0>
<!---Harry 06/01/2004 Setting up a case statement--->
<CFSWITCH EXPRESSION="#Events#">  
<CFCASE VALUE = "Final Hud Not Complete One Hour">
						<tr>
							<td bgcolor=gray align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="black">Event Type
							</td>
							<td bgcolor=gray align=right valign=top>
								<FONT FACE=verdana SIZE=1 color="black">Case Number
							</td>
							<td bgcolor=gray align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="black">
								Borrower Name
							</td>
							<td bgcolor=gray align=right valign=top>
								<FONT FACE=verdana SIZE=1 color="black">
								Hours/Days Past Due
							</td>
							<td bgcolor=gray align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="black">Client
							</td>
							<td bgcolor=gray align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="black">Processor
							</td>
						</tr>
</CFCASE>		
<CFCASE VALUE = "In House Abstract Not Uploaded">
						<tr>
							<td bgcolor=gray align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="black">
								Event Type
							</td>
							<td bgcolor=gray align=right valign=top>
								<FONT FACE=verdana SIZE=1 color="black">
								Case Number
							</td>
							<td bgcolor=gray align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="black">
								Borrower Name
							</td>
							<td bgcolor=gray align=right valign=top>
								<FONT FACE=verdana SIZE=1 color="black">
								Hours/Days Past Due
							</td>
							<td bgcolor=gray align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="black">
								Client
							</td>
							<td bgcolor=gray align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="black">
								Processor
							</td>
						</tr>
</CFCASE>		

<CFCASE VALUE = "Outstanding pre-processed files">						
						<tr>
							<td bgcolor=gray align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="black">Event Type
							</td>
							<td bgcolor=gray align=right valign=top>
								<FONT FACE=verdana SIZE=1 color="black">Case Number
							</td>
							<td bgcolor=gray align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="black">
								Company
							</td>
							<td bgcolor=gray align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="black">
								Borrower Name
							</td>
							<td bgcolor=gray align=right valign=top>
								<FONT FACE=verdana SIZE=1 color="black">
								Hours/Days Past Due
							</td>
							<td bgcolor=gray align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="black">
								Processor
							</td>
						</tr>
</CFCASE>

<CFCASE VALUE = "Typing Not Completed">						
						<tr>
							<td bgcolor=gray align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="black">
								Event Type
							</td>
							<td bgcolor=gray align=right valign=top>
								<FONT FACE=verdana SIZE=1 color="black">
								Case Number
							</td>
							<td bgcolor=gray align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="black">
								Company
							</td>
							<td bgcolor=gray align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="black">
								Borrower Name
							</td>
							<td bgcolor=gray align=right valign=top>
								<FONT FACE=verdana SIZE=1 color="black">
								Hours/Days Past Due
							</td>
							<td bgcolor=gray align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="black">
								Processor
							</td>
						</tr>
</CFCASE>

<CFDEFAULTCASE>
						<tr>
							<td bgcolor=gray width=200 align=center valign=top>
								<FONT FACE=verdana SIZE=1 color="black">Event Type
							</td>
							<td bgcolor=gray width=150 align=center valign=top>
								<FONT FACE=verdana SIZE=1 color="black">Case Number
							</td>
							<td bgcolor=gray width=200 align=center valign=top>
								<FONT FACE=verdana SIZE=1 color="black">
								Hours/Days Past Due
							</td>
							<td bgcolor=gray width=300 align=center valign=top>
								<FONT FACE=verdana SIZE=1 color="black">Client
							</td>
							<td bgcolor=gray width=150 align=center valign=top>
								<FONT FACE=verdana SIZE=1 color="black">Team
							</td>
</tr></CFDEFAULTCASE>
</CFSWITCH>
						
<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>

<CFQUERY datasource="#request.dsn#">		
				UPDATE Title
				SET	t_currentdate = '#order_date_adj#'				
</cfquery>

<CFQUERY datasource="#request.dsn#">		
				UPDATE property
				SET	t_currentdate = '#order_date_adj#'				
</cfquery>

<CFQUERY datasource="#request.dsn#">		
				UPDATE doc_abstract_Title
				SET	a_currentdate = '#order_date_adj#'
				
</cfquery>

<CFQUERY datasource="#request.dsn#">		
				UPDATE Pay_Off_Lender_1_Title
				SET	p_currentdate = '#order_date_adj#'
</cfquery>


<CFQUERY datasource="#request.dsn#">		
				UPDATE Pay_Off_Lender_2_Title
				SET	p_currentdate = '#order_date_adj#'
</cfquery>

<CFQUERY datasource="#request.dsn#">		
				UPDATE doc_abstract_prop
				SET	a_currentdate = '#order_date_adj#'
</cfquery>

<CFQUERY datasource="#request.dsn#">		
				UPDATE doc_title_insurance_title
				SET	ti_currentdate = '#order_date_adj#'
</cfquery>

<CFQUERY datasource="#request.dsn#">		
				UPDATE doc_title_insurance_prop
				SET	ti_currentdate = '#order_date_adj#'
</cfquery>

<CFQUERY datasource="#request.dsn#">		
				UPDATE tax_cert_title
				SET	tx_currentdate = '#order_date_adj#'
</cfquery>

<CFQUERY datasource="#request.dsn#">		
				UPDATE title_closing_order_request
				SET	c_currentdate = '#order_date_adj#'
</cfquery>

<CFQUERY datasource="#request.dsn#">		
				UPDATE doc_closer_title
				SET	ac_currentdate = '#order_date_adj#'
</cfquery>

<CFQUERY datasource="#request.dsn#">		
				UPDATE eventlist
				SET	e_currentdate = '#order_date_adj#'
</cfquery>

	<cfif #events# CONTAINS "Abstractor Not Assigned" or #events# eq ""> 
		<CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM Title a, doc_abstract_title f
			WHERE a.title_id = f.title_id and a.cancelled is null AND f.a_date_assigned is null and (datediff(HOUR, a.dateandtime, f.a_currentdate) > 2) 
			<cfif #order# NEQ "">
				AND a.comp_id = #order#
			</cfif>
		</CFQUERY>  
	<cfelse>
		 <CFQUERY datasource="#request.dsn#" NAME="read_report">
			SELECT *
			FROM Title
			WHERE 0 = 1
		</CFQUERY>  
	</cfif>
	
	<cfif #events# CONTAINS "Abstractor Not Received" or #events# eq ""> 
		<CFQUERY datasource="#request.dsn#" NAME="read_report1">
			SELECT *
			FROM Title a, doc_abstract_title f
			WHERE a.title_id = f.title_id and a.cancelled is null AND f.a_date_completed is null AND (datediff(HOUR, a.dateandtime, f.a_currentdate) > 56) 
			<cfif #order# NEQ "">
				AND a.comp_id = #order#
			</cfif>
		</CFQUERY>  
	<cfelse>
		<CFQUERY datasource="#request.dsn#" NAME="read_report1">
			SELECT *
			FROM Title
			WHERE 0 = 1
		</CFQUERY>  
	</cfif>
	
	<cfif #events# CONTAINS "Binder Data Not Merged" or #events# eq ""> 
		<CFQUERY datasource="#request.dsn#" NAME="read_report2">
			SELECT *
			FROM title c, doc_abstract_title a, doc_title_insurance_title f
			WHERE a.title_id = f.title_id and a.title_id = c.title_id and c.cancelled is null AND a.a_date_completed is not null and f.merge_date is null and (datediff(HOUR, a.r_dateandtime, f.ti_currentdate) > 2) 
			<cfif #order# NEQ "">
				AND c.comp_id = #order#
			</cfif>
		</CFQUERY>  
	<cfelse>
		<CFQUERY datasource="#request.dsn#" NAME="read_report2">
			SELECT *
			FROM Title
			WHERE 0 = 1
		</CFQUERY>  
	</cfif>
	
	<cfif #events# CONTAINS "Title Ins Not Completed" or #events# eq ""> 
		<CFQUERY datasource="#request.dsn#" NAME="read_report3">
			SELECT *
			FROM title a, doc_title_insurance_title f
			WHERE a.title_id = f.title_id and a.cancelled is null AND f.a_recieved_date is null and (datediff(HOUR, a.dateandtime, f.ti_currentdate) > 60) 
			<cfif #order# NEQ "">
				AND a.comp_id = #order#
			</cfif>
		 </CFQUERY>  
	<cfelse>
		<CFQUERY datasource="#request.dsn#" NAME="read_report3">
			SELECT *
			FROM Title
			WHERE 0 = 1
		</CFQUERY>  
	</cfif>
	
	<cfif #events# CONTAINS "Taxa Data Not Completed" or #events# eq ""> 
		<CFQUERY datasource="#request.dsn#" NAME="read_report4">
			SELECT *
			FROM title a, tax_cert_title f
			WHERE a.title_id = f.title_id and a.cancelled is null AND f.t_dateandtime is null and (datediff(HOUR, a.dateandtime, f.tx_currentdate) > 24) 
			<cfif #order# NEQ "">
				AND a.comp_id = #order#
			</cfif>
		</CFQUERY> 
	<cfelse>
		 <CFQUERY datasource="#request.dsn#" NAME="read_report4">
			SELECT *
			FROM Title
			WHERE 0 = 1
		</CFQUERY>  
	</cfif>
	
	<cfif #events# CONTAINS "Closer Not Assigned" or #events# eq ""> 
		<CFQUERY datasource="#request.dsn#" NAME="read_report5">
		
			SELECT *
			FROM title c, title_closing_order_request a, doc_closer_title f
			WHERE a.title_id = f.title_id and a.title_id = c.title_id and c.cancelled is null AND a.a_req_closing_day is not null AND f.a_date_assigned is null and (datediff(HOUR, a.c_dateandtime, f.ac_currentdate) > 1) 
			<cfif #order# NEQ "">
				AND c.comp_id = #order#
			</cfif>
		 </CFQUERY> 
	<cfelse>
		<CFQUERY datasource="#request.dsn#" NAME="read_report5">
			SELECT *
			FROM Title
			WHERE 0 = 1
		</CFQUERY>  
	</cfif>
		 
	<cfif #events# CONTAINS "Closing Info Not Submitted" or #events# eq ""> 
		 <CFQUERY datasource="#request.dsn#" NAME="read_report6">
			SELECT *
			FROM title c, title_closing_order_request a, eventlist f
			WHERE a.title_id = f.title_id and a.title_id = c.title_id and c.cancelled is null AND a.a_req_closing_day is not null AND f.c_day is null AND (datediff(HOUR, a.c_dateandtime, f.e_currentdate) > 4) 
			<cfif #order# NEQ "">
				AND c.comp_id = #order#
			</cfif>
		 </CFQUERY> 
	<cfelse>
		<CFQUERY datasource="#request.dsn#" NAME="read_report6">
			SELECT *
			FROM Title
			WHERE 0 = 1
		</CFQUERY>  
	</cfif>
	
	<cfif #events# eq "Final Hud Not Complete" or #events# eq ""> 
		<CFQUERY datasource="#request.dsn#" NAME="read_report7">
			SELECT *
			FROM title a, doc_closer_title f
			WHERE a.title_id = f.title_id and a.cancelled is null AND f.closing_instructions is not null AND f.final_hud is null and (datediff(HOUR, f.inst_dateandtime, f.ac_currentdate) > 2) 
			<cfif #order# NEQ "">
				AND a.comp_id = #order#
			</cfif>
		 </CFQUERY> 
	<cfelse>
		<CFQUERY datasource="#request.dsn#" NAME="read_report7">
			SELECT *
			FROM Title
			WHERE 0 = 1
		</CFQUERY>  
	</cfif>
	
	<cfif #events# CONTAINS "Loan Not Closed" or #events# eq ""> 
		<CFQUERY datasource="#request.dsn#" NAME="read_report8">
			SELECT *
			FROM title c, title_closing_order_request a, eventlist f
			WHERE a.title_id = f.title_id and a.title_id = c.title_id and c.cancelled is null AND f.c_day is not null AND f.cl_dateandtime is null and (datediff(HOUR, f.sc_dateandtime, f.e_currentdate) > 6) 
				<cfif #order# NEQ "">
					AND c.comp_id = #order#
				</cfif>
		 	</CFQUERY> 
	<cfelse>
		<CFQUERY datasource="#request.dsn#" NAME="read_report8">
			SELECT *
			FROM Title
			WHERE 0 = 1
		</CFQUERY>  
	</cfif>
	
	<cfif #events# CONTAINS "Loan Not Funded" or #events# eq ""> 
		<CFQUERY datasource="#request.dsn#" NAME="read_report9">
			SELECT *
			FROM title c, title_closing_order_request a, eventlist f
			WHERE a.title_id = f.title_id and a.title_id = c.title_id and c.cancelled is null AND f.c_day is not null AND f.fl_dateandtime is null and (datediff(HOUR, f.sc_dateandtime, f.e_currentdate) > 80) 
			<cfif #order# NEQ "">
				AND c.comp_id = #order#
			</cfif>	
		</CFQUERY> 
	<cfelse>
		<CFQUERY datasource="#request.dsn#" NAME="read_report9">
			SELECT *
			FROM Title
			WHERE 0 = 1
		</CFQUERY>  
	</cfif>
	
	<cfif #events# CONTAINS "Pre-Funding NOT Completed" or #events# eq ""> 
		    <CFQUERY datasource="#request.dsn#" NAME="read_report10">
			SELECT *
			FROM title c, tax_cert_title a, eventlist f
			WHERE a.title_id = f.title_id and a.title_id = c.title_id and c.cancelled is null AND a.pre_funding is null AND f.cl_dateandtime is not null and (datediff(HOUR, f.cl_dateandtime, f.e_currentdate) > 0) 
				<cfif #order# NEQ "">
					AND c.comp_id = #order#
				</cfif>	
			</CFQUERY> 
	<cfelse>
		 <CFQUERY datasource="#request.dsn#" NAME="read_report10">
			SELECT *
			FROM Title
			WHERE 0 = 1
		</CFQUERY>  
	</cfif>
	
	<cfif #events# CONTAINS "Property Data Not Merged" or #events# eq ""> 
		<CFQUERY datasource="#request.dsn#" NAME="read_report11">
			SELECT *
			FROM property c, doc_abstract_prop a, doc_title_insurance_prop f
			WHERE a.prop_id = f.prop_id and a.prop_id = c.prop_id AND a.a_date_completed is not null and f.merge_date is null and (datediff(HOUR, a.r_dateandtime, f.ti_currentdate) > 2) 
			<cfif #order# NEQ "">
				AND c.comp_id = #order#
			</cfif>
		</CFQUERY>  
	<cfelse>
		<CFQUERY datasource="#request.dsn#" NAME="read_report11">
			SELECT *
			FROM Title
			WHERE 0 = 1
		</CFQUERY>  
	</cfif>
	
	<cfif #events# CONTAINS "Property Data Not Completed" or #events# eq ""> 
		<CFQUERY datasource="#request.dsn#" NAME="read_report12">
			SELECT *
			FROM Property a, doc_title_insurance_prop f
			WHERE a.prop_id = f.prop_id AND f.a_recieved_date is null and (datediff(HOUR, a.dateandtime, f.ti_currentdate) > 60) 
			<cfif #order# NEQ "">
				AND a.comp_id = #order#
			</cfif>
		</CFQUERY>  
	<cfelse>
		<CFQUERY datasource="#request.dsn#" NAME="read_report12">
			SELECT *
			FROM Title
			WHERE 0 = 1
		</CFQUERY>  
	</cfif>
			 
	<cfif #events# CONTAINS "Payoffs Not Ordered" or #events# eq ""> 
		<CFQUERY datasource="#request.dsn#" NAME="read_report13">
			SELECT a.*, f.*, c.team_id, t.name AS TEAM_NAME
			FROM Title a, Pay_Off_Lender_1_Title f, Companies c, Teams t
			WHERE a.title_id = f.title_id and a.cancelled is null AND a.polender1 is not null and a.polender1 != '' AND f.a_assigned_date is null and (datediff(HOUR, f.pa_dateandtime, f.p_currentdate) > 2) 
			and a.title_id not in (18315,18960, 18982, 19065, 19117, 19142, 16085,16101,16634,16650,16733,16916,17033,17037,17053,17121,17166,17205,17227,17229,17423,17425,17607,17653,17782,18114,18208,18425,18565,18570,18731,18904,19399,19400,19324,19318,19316,19282,19447,17265,18264,18528,16966,17601,17661,17687,17977) 
			<cfif #order# NEQ "">
				AND a.comp_id = #order#
			</cfif>
			and c.ID = a.comp_id
			and t.ID = c.team_id 
		</CFQUERY>  
		<CFQUERY datasource="#request.dsn#" NAME="read_report15">
			SELECT a.*, f.*, c.team_id, t.name AS TEAM_NAME
			FROM Title a, Pay_Off_Lender_2_Title f, Companies c, Teams t
			WHERE a.title_id = f.title_id and a.cancelled is null AND a.polender2 is not null and a.polender2 != '' AND f.a_assigned_date is null and (datediff(HOUR, f.pa_dateandtime, f.p_currentdate) > 2) 
			and a.title_id not in (18315,18960, 18982, 19065, 19117, 19142, 16085,16101,16634,16650,16733,16916,17033,17037,17053,17121,17166,17205,17227,17229,17423,17425,17607,17653,17782,18114,18208,18425,18565,18570,18731,18904,19399,19400,19324,19318,19316,19282,19447,17265,18264,18528,16966,17601,17661,17687,17977) 
			<cfif #order# NEQ "">
				AND a.comp_id = #order#
			</cfif>
			and c.ID = a.comp_id
			and t.ID = c.team_id 
		</CFQUERY>  
	<cfelse>
		<CFQUERY datasource="#request.dsn#" NAME="read_report13">
			SELECT *
			FROM Title
			WHERE 0 = 1
		</CFQUERY>  
		<CFQUERY datasource="#request.dsn#" NAME="read_report15">
			SELECT *
			FROM Title
			WHERE 0 = 1
		</CFQUERY>  
	</cfif>
	
	<cfif #events# CONTAINS "Payoffs Not Received" or #events# eq ""> 
		<CFQUERY datasource="#request.dsn#" NAME="read_report14">
			SELECT a.*, f.*, c.team_id, t.name AS TEAM_NAME
			FROM Title a, Pay_Off_Lender_1_Title f, Companies c, Teams t
			WHERE a.title_id = f.title_id and a.cancelled is null AND a.polender1 is not null and a.polender1 != '' and f.a_recieved_date is null AND (datediff(HOUR, f.pa_dateandtime, f.p_currentdate) > 72) 
			and a.title_id not in (18315,18960, 18982, 19065, 19117, 19142, 16085,16101,16634,16650,16733,16916,17033,17037,17053,17121,17166,17205,17227,17229,17423,17425,17607,17653,17782,18114,18208,18425,18565,18570,18731,18904,19399,19400,19324,19318,19316,19282,19447,17265,18264,18528,16966,17601,17661,17687,17977,20989,21006,21004,20999,20339,21000,21002)  
			<cfif #order# NEQ "">
				AND a.comp_id = #order#
			</cfif>
			and c.ID = a.comp_id
			and t.ID = c.team_id 
		 </CFQUERY>  
		 <CFQUERY datasource="#request.dsn#" NAME="read_report16">
			SELECT a.*, f.*, c.team_id, t.name AS TEAM_NAME
			FROM Title a, Pay_Off_Lender_2_Title f, Companies c, Teams t
			WHERE a.title_id = f.title_id and a.cancelled is null AND a.polender2 is not null and a.polender2 != '' and f.a_recieved_date is null AND (datediff(HOUR, f.pa_dateandtime, f.p_currentdate) > 72) 
			and a.title_id not in (18315,18960, 18982, 19065, 19117, 19142, 16085,16101,16634,16650,16733,16916,17033,17037,17053,17121,17166,17205,17227,17229,17423,17425,17607,17653,17782,18114,18208,18425,18565,18570,18731,18904,19399,19400,19324,19318,19316,19282,19447,17265,18264,18528,16966,17601,17661,17687,17977,20989,21006,21004,20999,20339,21000,21002)  
			<cfif #order# NEQ "">
				AND a.comp_id = #order#
			</cfif>
			and c.ID = a.comp_id
			and t.ID = c.team_id 
		 </CFQUERY>  
	<cfelse>
		<CFQUERY datasource="#request.dsn#" NAME="read_report14">
			SELECT *
			FROM Title
			WHERE 0 = 1
		</CFQUERY>  
		<CFQUERY datasource="#request.dsn#" NAME="read_report16">
			SELECT *
			FROM Title
			WHERE 0 = 1
		</CFQUERY>  
	</cfif>
		
	<cfif #events# CONTAINS "Final Hud Not Complete One Hour" or #events# eq ""> 
		<CFQUERY datasource="#request.dsn#" NAME="read_report17">
			SELECT 	Title_ID, company, bfirstname1, blastname1,  
				    proc_dateandtime, fname, lname, DATEDIFF(n, proc_dateandtime, 
                    GETDATE()) AS p_minutes, DATEDIFF(d, proc_dateandtime, 
					GETDATE()) AS p_days, DATEDIFF(hh, proc_dateandtime, GETDATE()) AS p_hours
			FROM    sqlProcessingOpenOrders
			WHERE   (DATEDIFF(hh, proc_dateandtime, GETDATE()) > 1)
			
			<cfif #order# NEQ "">
				AND comp_id = #order#
			</cfif>
            ORDER BY proc_dateandtime
		 </CFQUERY> 
	<cfelse>
		<CFQUERY datasource="#request.dsn#" NAME="read_report17">
				SELECT *
				FROM Title
				WHERE 0 = 1
		</CFQUERY>  
	</cfif>
	
	<cfif #events# CONTAINS "Outstanding pre-processed files" or #events# eq ""> 
		<CFQUERY datasource="#request.dsn#" NAME="read_report18">
			SELECT     sqlPreProcessingOpenOrders.Title_ID, sqlPreProcessingOpenOrders.company, sqlPreProcessingOpenOrders.bfirstname1, 
                       sqlPreProcessingOpenOrders.fname, DATEDIFF(hh, sqlPreProcessingOpenOrders.dateandtime, GETDATE()) AS p_hours, 
                       sqlPreProcessingOpenOrders.blastname1, sqlPreProcessingOpenOrders.lname, DATEDIFF(n, sqlPreProcessingOpenOrders.dateandtime, 
                       GETDATE()) AS p_minutes, DATEDIFF(d, sqlPreProcessingOpenOrders.dateandtime, GETDATE()) AS p_days
			FROM       sqlPreProcessingOpenOrders LEFT OUTER JOIN
                       First_Admin ON sqlPreProcessingOpenOrders.p_name = First_Admin.username
			WHERE      (DATEDIFF(hh, sqlPreProcessingOpenOrders.dateandtime, GETDATE()) > 1)
						ORDER BY DATEDIFF(n, sqlPreProcessingOpenOrders.dateandtime, GETDATE()) DESC
		<cfif #order# NEQ "">
				AND Companies.comp_id = #order#
			</cfif>
		 </CFQUERY> 
	<cfelse>
		<CFQUERY datasource="#request.dsn#" NAME="read_report18">
			SELECT *
			FROM Title
			WHERE 0 = 1
		</CFQUERY>  
	</cfif>
	
	<cfif #events# CONTAINS "Typing Not Completed" or #events# eq ""> 
		<CFQUERY datasource="#request.dsn#" NAME="read_report19">
			SELECT     	Title_ID, Typing_ID, fname, lname, Datediff(n,Typing_start_datetime,getdate()) as p_minutes,
						Datediff(d,Typing_start_datetime,getdate()) as p_days, Datediff(n,Typing_start_datetime,getdate()) as p_minutes,
						Datediff(hh,Typing_start_datetime,getdate()) as p_hours, DATEADD(mi, 30, Typing_Start_Datetime) AS Time_Due, 
						Due_Date, bfirstname1, blastname1, company, Letter, 
                      	Typing_Start_Datetime
			FROM        sqlTyping
			WHERE       (DATEADD(mi, 30, Typing_Start_Datetime) <= GETDATE())
		</CFQUERY> 
	<cfelse>
		<CFQUERY datasource="#request.dsn#" NAME="read_report19">
			SELECT *
			FROM Title
			WHERE 0 = 1
		</CFQUERY>  
	</cfif>
	<cfif #events# CONTAINS "In House Abstract Not Uploaded" or #events# eq ""> 
		<CFQUERY datasource="#request.dsn#" NAME="read_report20">
			SELECT     dbo.tblUser_Roles.Title_ID AS ID, 'In House Abstract Not Uploaded' AS Event, dbo.tblUser_Roles.vendor_mgmt_InHouse_ID, 
                      dbo.Title.bfirstname1 + ' ' + dbo.Title.blastname1 AS Name, DATEDIFF(hh, dbo.tblUser_Roles.vendor_mgmt_InHouse_Start_Datetime, GETDATE()) 
                      AS p_Hours, DATEDIFF(n, dbo.tblUser_Roles.vendor_mgmt_InHouse_Start_Datetime, GETDATE()) AS p_minutes, DATEDIFF(dd, 
                      dbo.tblUser_Roles.vendor_mgmt_InHouse_Start_Datetime, GETDATE()) AS p_days, dbo.Title.comp_id, dbo.Companies.company, 
                      dbo.First_Admin.fname, dbo.First_Admin.lname
			FROM         dbo.Title LEFT OUTER JOIN
                      dbo.Companies ON dbo.Title.comp_id = dbo.Companies.ID FULL OUTER JOIN
                      dbo.tblUser_Roles LEFT OUTER JOIN
                      dbo.First_Admin ON dbo.tblUser_Roles.vendor_mgmt_InHouse_ID = dbo.First_Admin.ID ON dbo.Title.Title_ID = dbo.tblUser_Roles.Title_ID
			WHERE     (dbo.tblUser_Roles.Title_ID IS NOT NULL) AND (dbo.tblUser_Roles.vendor_mgmt_InHouse_Start_Datetime IS NOT NULL) AND 
                      (dbo.tblUser_Roles.vendor_mgmt_InHouse_Finish_Datetime IS NULL) AND (dbo.tblUser_Roles.Cancelled IS NULL) AND (dbo.Companies.ID <> 100) 
                      AND (DATEDIFF(hh, dbo.tblUser_Roles.vendor_mgmt_InHouse_Start_Datetime, GETDATE()) >= 2)
		</CFQUERY> 
	<cfelse>
		<CFQUERY datasource="#request.dsn#" NAME="read_report20">
			SELECT *
			FROM Title
			WHERE 0 = 1
		</CFQUERY>  
	</cfif>
	
	
<CFSET r_count = #read_report.recordcount#  + #read_report1.recordcount# + #read_report2.recordcount# + #read_report3.recordcount# + #read_report4.recordcount# + #read_report5.recordcount# + #read_report6.recordcount# + #read_report7.recordcount# + #read_report8.recordcount# + #read_report9.recordcount# + #read_report11.recordcount# + #read_report12.recordcount# + #read_report13.recordcount# + #read_report14.recordcount# + #read_report15.recordcount# + #read_report16.recordcount# + #read_report10.recordcount# + #read_report17.recordcount# + #read_report18.recordcount# + #read_report19.recordcount# + #read_report20.recordcount#>
<CFSET a_bgcolor = "d3d3d3">
<CFSET a_color_trigger = "1">

	<cfif #r_count# neq "0">
						<tr>
						<CFSWITCH EXPRESSION="#Events#"> 
						<CFCASE VALUE = "Final Hud Not Complete One Hour">
							<td bgcolor="#a_bgcolor#" colspan = 6 width="100%" align=center valign=top>
						</CFCASE>
						<CFCASE VALUE = "In House Abstract Not Uploaded">
							<td bgcolor="#a_bgcolor#" colspan = 6 width="100%" align=center valign=top>
						</CFCASE>
						<CFCASE VALUE = "Typing Not Completed">
							<td bgcolor="#a_bgcolor#" colspan = 6 width="100%" align=center valign=top>
						</CFCASE>
						<CFCASE VALUE = "Outstanding pre-processed files">
							<td bgcolor="#a_bgcolor#" colspan = 6 width="100%" align=center valign=top>
						</CFCASE>	
						<CFDEFAULTCASE>
							<td bgcolor="#a_bgcolor#" colspan = 5 width="100%" align=center valign=top>
						</CFDEFAULTCASE>
						</CFSWITCH>
							<FONT FACE=verdana SIZE=1 color="black">
								<cfoutput>#r_count# records found outstanding as of #DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#</cfoutput>
							</td>
						<tr>
	</cfif>

<CfOUTPUT QUERY="read_report">
	<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		SELECT *
		FROM Companies 
		WHERE ID = '#comp_id#'
	</CFQUERY>			<tr>
							<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
								<FONT FACE=verdana SIZE=1 color="blue">
								Abstract NOT Assigned
							</td>
						<td bgcolor="#a_bgcolor#" width=150 align=right valign=top>
								<FONT FACE=verdana SIZE=1 color="blue">
								#title_id#  
						</td>			
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
								<FONT FACE=verdana SIZE=1 color="blue">
<cfset totalminutes = "#DATEDIFF("n", dateandtime, a_currentdate)#">
<cfset hours = "#DATEDIFF("h", dateandtime, a_currentdate)#">
<cfset days = "#DATEDIFF("d", dateandtime, a_currentdate)#">
						
<!--- <cfset days = int(hours\24)> --->
<cfset hours = int(hours mod 24)>
<cfset minutes = int(totalminutes mod 60)>

								<!---  #totalminutes# minutes =  --->
								#days# days, #hours# hours, #minutes# minutes 
						</td>			
						<!---This might be wrong.  Could be a TR --->
						</td>
						<td bgcolor="#a_bgcolor#" width=300 align=right valign=top>
								<FONT FACE=verdana SIZE=1 color="Blue">#read_comp.company#
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

<CFOUTPUT QUERY="read_report1">
		<CFQUERY datasource="#request.dsn#" NAME="read_comp">
			SELECT *
			FROM Companies 
			WHERE ID = '#comp_id#'
		</CFQUERY>	<tr>
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							Abstract NOT Received
						</td>
						<td bgcolor="#a_bgcolor#" width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							#title_id#  
						</td>			
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
<cfset totalminutes = "#DATEDIFF("n", dateandtime, a_currentdate)#">
<cfset hours = "#DATEDIFF("h", dateandtime, a_currentdate)#">
<cfset days = "#DATEDIFF("d", dateandtime, a_currentdate)#">
						
<cfset hours = int(hours mod 24)>
<cfset minutes = int(totalminutes mod 60)>

								<!---  #totalminutes# minutes =  --->
								#days# days, #hours# hours, #minutes# minutes 
						</td>			
						<!---This could be wrong. --->
						</td>
						<td bgcolor="#a_bgcolor#" width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="Blue">#read_comp.company#
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

<CFOUTPUT QUERY="read_report2">
	<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		SELECT *
		FROM Companies 
		WHERE ID = '#comp_id#'
	</CFQUERY>	
					<tr>
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							Binder Data NOT Merged
						</td>
						<td bgcolor="#a_bgcolor#" width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							#title_id#  
						</td>			
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
<cfset totalminutes = "#DATEDIFF("n", r_dateandtime, ti_currentdate)#">
<cfset hours = "#DATEDIFF("h", r_dateandtime, ti_currentdate)#">
<cfset days = "#DATEDIFF("d", r_dateandtime, ti_currentdate)#">
						
<cfset hours = int(hours mod 24)>
<cfset minutes = int(totalminutes mod 60)>

<!---  #totalminutes# minutes =  --->#days# days, #hours# hours, #minutes# minutes 
						</td>			
						</td>
							<td bgcolor="#a_bgcolor#" width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="Blue">#read_comp.company#
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

<CFOUTPUT QUERY="read_report3">
	<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		SELECT *
		FROM Companies 
		WHERE ID = '#comp_id#'
	</CFQUERY>	
				<tr>
					<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							Title Ins NOT Completed
					</td>
					<td bgcolor="#a_bgcolor#" width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							#title_id#  
					</td>			
					<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
<cfset totalminutes = "#DATEDIFF("n", dateandtime, ti_currentdate)#">
<cfset hours = "#DATEDIFF("h", dateandtime, ti_currentdate)#">
<cfset days = "#DATEDIFF("d", dateandtime, ti_currentdate)#">
						
<!--- <cfset days = int(hours\24)> --->
<cfset hours = int(hours mod 24)>
<cfset minutes = int(totalminutes mod 60)>

<!---  #totalminutes# minutes =  --->#days# days, #hours# hours, #minutes# minutes 
					</td>			
					</td>
					<td bgcolor="#a_bgcolor#" width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="Blue">#read_comp.company#
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

<CFOUTPUT QUERY="read_report4">
<CFQUERY datasource="#request.dsn#" NAME="read_comp">
	SELECT *
	FROM Companies 
	WHERE ID = '#comp_id#'
</CFQUERY>
				<tr>
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							Tax Data NOT Completed
						</td>
						<td bgcolor="#a_bgcolor#" width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							#title_id#  
						</td>			
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
<cfset totalminutes = "#DATEDIFF("n", dateandtime, tx_currentdate)#">
<cfset hours = "#DATEDIFF("h", dateandtime, tx_currentdate)#">
<cfset days = "#DATEDIFF("d", dateandtime, tx_currentdate)#">
						
<!--- <cfset days = int(hours\24)> --->
<cfset hours = int(hours mod 24)>
<cfset minutes = int(totalminutes mod 60)>

								<!---  #totalminutes# minutes =  --->
								#days# days, #hours# hours, #minutes# minutes 
						</td>			
						</td>
						<td bgcolor="#a_bgcolor#" width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="Blue">#read_comp.company#
	
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

<CFOUTPUT QUERY="read_report5">
<CFQUERY datasource="#request.dsn#" NAME="read_comp">
	SELECT *
	FROM Companies 
	WHERE ID = '#comp_id#'
</CFQUERY>			
					<tr>
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							Closer NOT Assigned
						</td>
						<td bgcolor="#a_bgcolor#" width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							#title_id#  
						</td>			
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
<cfset totalminutes = "#DATEDIFF("n", c_dateandtime, ac_currentdate)#">
<cfset hours = "#DATEDIFF("h", c_dateandtime, ac_currentdate)#">
<cfset days = "#DATEDIFF("d", c_dateandtime, ac_currentdate)#">
						
<!--- <cfset days = int(hours\24)> --->
<cfset hours = int(hours mod 24)>
<cfset minutes = int(totalminutes mod 60)>

							<!---  #totalminutes# minutes =  --->
							#days# days, #hours# hours, #minutes# minutes 
						</td>			
						</td>
						<td bgcolor="#a_bgcolor#" width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="Blue">#read_comp.company#
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

<CFOUTPUT QUERY="read_report6">
	<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		SELECT *
		FROM Companies 
		WHERE ID = '#c_comp_id#'
	</CFQUERY>	
					<tr>
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							Closing Info NOT Submitted
						</td>
						<td bgcolor="#a_bgcolor#" width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							#title_id#  
						</td>			
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
<cfset totalminutes = "#DATEDIFF("n", c_dateandtime, e_currentdate)#">
<cfset hours = "#DATEDIFF("h", c_dateandtime, e_currentdate)#">
<cfset days = "#DATEDIFF("d", c_dateandtime, e_currentdate)#">
						
<!--- <cfset days = int(hours\24)> --->
<cfset hours = int(hours mod 24)>
<cfset minutes = int(totalminutes mod 60)>

							<!---  #totalminutes# minutes =  --->#
							days# days, #hours# hours, #minutes# minutes 
						</td>			
						</td>
						<td bgcolor="#a_bgcolor#" width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="Blue">#read_comp.company#
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

<CFOUTPUT QUERY="read_report7">
	<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		SELECT *
		FROM Companies 
		WHERE ID = '#comp_id#'
	</CFQUERY>	
					<tr>
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							Final HUD NOT Complete
						</td>
						<td bgcolor="#a_bgcolor#" width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							#title_id#  
						</td>			
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
<cfset totalminutes = "#DATEDIFF("n", inst_dateandtime, ac_currentdate)#">
<cfset hours = "#DATEDIFF("h", inst_dateandtime, ac_currentdate)#">
<cfset days = "#DATEDIFF("d", inst_dateandtime, ac_currentdate)#">
						
<!--- <cfset days = int(hours\24)> --->
<cfset hours = int(hours mod 24)>
<cfset minutes = int(totalminutes mod 60)>

							<!---  #totalminutes# minutes =  --->
							#days# days, #hours# hours, #minutes# minutes 
						</td>			
						</td>
							<td bgcolor="#a_bgcolor#" width=300 align=right valign=top>
								<FONT FACE=verdana SIZE=1 color="Blue">#read_comp.company#
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

<CFOUTPUT QUERY="read_report8">
	<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		SELECT *
		FROM Companies 
		WHERE ID = '#comp_id#'
	</CFQUERY>	
					<tr>
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							Loan NOT Closed
						</td>
						<td bgcolor="#a_bgcolor#" width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							#title_id#  
						</td>			
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
<cfset totalminutes = "#DATEDIFF("n", sc_dateandtime, e_currentdate)#">
<cfset hours = "#DATEDIFF("h", sc_dateandtime, e_currentdate)#">
<cfset days = "#DATEDIFF("d", sc_dateandtime, e_currentdate)#">
						
<!--- <cfset days = int(hours\24)> --->
<cfset hours = int(hours mod 24)>
<cfset minutes = int(totalminutes mod 60)>

							<!---  #totalminutes# minutes =  --->
							#days# days, #hours# hours, #minutes# minutes 
						</td>			
						</td>
						<td bgcolor="#a_bgcolor#" width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="Blue">#read_comp.company#
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

<CFOUTPUT QUERY="read_report9">
<CFQUERY datasource="#request.dsn#" NAME="read_comp">
	SELECT *
	FROM Companies 
	WHERE ID = '#comp_id#'
</CFQUERY>	
					<tr>
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							Loan NOT Funded
						</td>
						<td bgcolor="#a_bgcolor#" width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							#title_id#  
						</td>			
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
<cfset totalminutes = "#DATEDIFF("n", sc_dateandtime, e_currentdate)#">
<cfset hours = "#DATEDIFF("h", sc_dateandtime, e_currentdate)#">
<cfset days = "#DATEDIFF("d", sc_dateandtime, e_currentdate)#">

<!--- <cfset days = int(hours\24)> --->
<cfset hours = int(hours mod 24)>
<cfset minutes = int(totalminutes mod 60)>

							<!---  #totalminutes# minutes =  --->
							#days# days, #hours# hours, #minutes# minutes 
						</td>			
						</td>
							<td bgcolor="#a_bgcolor#" width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="Blue">#read_comp.company#
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

<CFOUTPUT QUERY="read_report10">
<CFQUERY datasource="#request.dsn#" NAME="read_comp">
	SELECT *
	FROM Companies 
	WHERE ID = '#comp_id#'
</CFQUERY>	
					<tr>
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							Pre-Funding NOT Completed
						</td>
						<td bgcolor="#a_bgcolor#" width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							#title_id#  
						</td>			
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<cfset totalminutes = "#DATEDIFF("n", cl_dateandtime, e_currentdate)#">
							<cfset hours = "#DATEDIFF("h", cl_dateandtime, e_currentdate)#">
							<cfset days = "#DATEDIFF("d", cl_dateandtime, e_currentdate)#">
						
<!--- <cfset days = int(hours\24)> --->
<cfset hours = int(hours mod 24)>
<cfset minutes = int(totalminutes mod 60)>

							<!---  #totalminutes# minutes =  --->
							#days# days, #hours# hours, #minutes# minutes 
						</td>			
						</td>
						<td bgcolor="#a_bgcolor#" width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="Blue">#read_comp.company#
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

<CFOUTPUT QUERY="read_report11">
<CFQUERY datasource="#request.dsn#" NAME="read_comp">
	SELECT *
	FROM Companies 
	WHERE ID = '#comp_id#'
</CFQUERY>			<tr>
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							Property Data NOT Merged
						</td>

						<td bgcolor="#a_bgcolor#" width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							0232#prop_id#  
						</td>			
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">

<cfset totalminutes = "#DATEDIFF("n", r_dateandtime, ti_currentdate)#">
<cfset hours = "#DATEDIFF("h", r_dateandtime, ti_currentdate)#">
<cfset days = "#DATEDIFF("d", r_dateandtime, ti_currentdate)#">
						
<!--- <cfset days = int(hours\24)> --->
<cfset hours = int(hours mod 24)>
<cfset minutes = int(totalminutes mod 60)>

							<!---  #totalminutes# minutes =  --->
							#days# days, #hours# hours, #minutes# minutes 
						</td>			
						</td>
						<td bgcolor="#a_bgcolor#" width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="Blue">#read_comp.company#
	
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

<CFOUTPUT QUERY="read_report12">
	<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		SELECT *
		FROM Companies 
		WHERE ID = '#comp_id#'
	</CFQUERY>	
				<tr>
					<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							Property Data NOT Completed
					</td>
					<td bgcolor="#a_bgcolor#" width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							0232#prop_id#  
					</td>			
					<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
<cfset totalminutes = "#DATEDIFF("n", dateandtime, ti_currentdate)#">
<cfset hours = "#DATEDIFF("h", dateandtime, ti_currentdate)#">
<cfset days = "#DATEDIFF("d", dateandtime, ti_currentdate)#">
						
<!--- <cfset days = int(hours\24)> --->
<cfset hours = int(hours mod 24)>
<cfset minutes = int(totalminutes mod 60)>

<!---  #totalminutes# minutes =  --->#days# days, #hours# hours, #minutes# minutes 
					</td>			
					</td>
					<td bgcolor="#a_bgcolor#" width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="Blue">#read_comp.company#
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

<CFOUTPUT QUERY="read_report13">
	<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		SELECT *
		FROM Companies 
		WHERE ID = '#comp_id#'
	</CFQUERY>	
					<tr>
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							Payoffs NOT Ordered
						</td>
						<td bgcolor="#a_bgcolor#" width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							#title_id#  
						</td>			
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
									<cfset totalminutes = "#DATEDIFF("n", pa_dateandtime, p_currentdate)#">
									<cfset hours = "#DATEDIFF("h", pa_dateandtime, p_currentdate)#">
									<cfset days = "#DATEDIFF("d", pa_dateandtime, p_currentdate)#">
									<!--- <cfset days = int(hours\24)> --->
									<cfset hours = int(hours mod 24)>
									<cfset minutes = int(totalminutes mod 60)>
									<!---  #totalminutes# minutes =  --->
									#days# days, #hours# hours, #minutes# minutes 
						</td>			
						</td>
						<td bgcolor="#a_bgcolor#" width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="Blue">#read_comp.company#
						</td>
						<td bgcolor="#a_bgcolor#" width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="Blue">#TEAM_NAME#
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
			
<CFOUTPUT QUERY="read_report14">
<CFQUERY datasource="#request.dsn#" NAME="read_comp">
	SELECT *
	FROM Companies 
	WHERE ID = '#comp_id#'
</CFQUERY>	
					<tr>
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							Payoffs NOT Received
						</td>

						<td bgcolor="#a_bgcolor#" width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							#read_report14.title_id#  
						</td>			
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
<cfset totalminutes = "#DATEDIFF("n", read_report14.pa_dateandtime, read_report14.p_currentdate)#">
<cfset hours = "#DATEDIFF("h", read_report14.pa_dateandtime, read_report14.p_currentdate)#">
<cfset days = "#DATEDIFF("d", read_report14.pa_dateandtime, read_report14.p_currentdate)#">
						
<!--- <cfset days = int(hours\24)> --->
<cfset hours = int(hours mod 24)>
<cfset minutes = int(totalminutes mod 60)>

							<!---  #totalminutes# minutes =  --->
							#days# days, #hours# hours, #minutes# minutes 
						</td>			
						</td>
						<td bgcolor="#a_bgcolor#" width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="Blue">#read_comp.company#
						</td>
						<td bgcolor="#a_bgcolor#" width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="Blue">#read_report14.TEAM_NAME#
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











<CFOUTPUT QUERY="read_report15">
	<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		SELECT *
		FROM Companies 
		WHERE ID = '#comp_id#'
	</CFQUERY>	
					<tr>
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							Payoffs NOT Ordered
						</td>
						<td bgcolor="#a_bgcolor#" width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							#title_id#  
						</td>			
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
									<cfset totalminutes = "#DATEDIFF("n", pa_dateandtime, p_currentdate)#">
									<cfset hours = "#DATEDIFF("h", pa_dateandtime, p_currentdate)#">
									<cfset days = "#DATEDIFF("d", pa_dateandtime, p_currentdate)#">
									<!--- <cfset days = int(hours\24)> --->
									<cfset hours = int(hours mod 24)>
									<cfset minutes = int(totalminutes mod 60)>
									<!---  #totalminutes# minutes =  --->
									#days# days, #hours# hours, #minutes# minutes 
						</td>			
						</td>
						<td bgcolor="#a_bgcolor#" width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="Blue">#read_comp.company#
						</td>
						<td bgcolor="#a_bgcolor#" width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="Blue">#TEAM_NAME#
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
			
<CFOUTPUT QUERY="read_report16">
<CFQUERY datasource="#request.dsn#" NAME="read_comp">
	SELECT *
	FROM Companies 
	WHERE ID = '#comp_id#'
</CFQUERY>	
					<tr>
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							Payoffs NOT Received
						</td>

						<td bgcolor="#a_bgcolor#" width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							#read_report16.title_id#  
						</td>			
						<td bgcolor="#a_bgcolor#" width=200 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
<cfset totalminutes = "#DATEDIFF("n", read_report16.pa_dateandtime, read_report16.p_currentdate)#">
<cfset hours = "#DATEDIFF("h", read_report16.pa_dateandtime, read_report16.p_currentdate)#">
<cfset days = "#DATEDIFF("d", read_report16.pa_dateandtime, read_report16.p_currentdate)#">
						
<!--- <cfset days = int(hours\24)> --->
<cfset hours = int(hours mod 24)>
<cfset minutes = int(totalminutes mod 60)>

							<!---  #totalminutes# minutes =  --->
							#days# days, #hours# hours, #minutes# minutes 
						</td>			
						</td>
						<td bgcolor="#a_bgcolor#" width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="Blue">#read_comp.company#
						</td>
						<td bgcolor="#a_bgcolor#" width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="Blue">#read_report16.TEAM_NAME#
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
						
<CFOUTPUT QUERY="read_report17">
	<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		SELECT *
		FROM Companies 
		WHERE ID = '#comp_id#'
	</CFQUERY>	
					<tr>
						<td bgcolor="#a_bgcolor#"  align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							Final HUD NOT Complete One Hour
						</td>
						<td bgcolor="#a_bgcolor#"  align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							#title_id#  
						</td>			
						
						</td>
						
							<td bgcolor="#a_bgcolor#" align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="Blue">#read_report17.bfirstname1# #read_report17.blastname1#
							</td>
							
							<td bgcolor="#a_bgcolor#"  align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
<cfset totalminutes = "#p_minutes#">
<cfset hours = "#p_hours#">
<cfset days = "#p_days#">
<cfset hours = int(hours mod 24)>
<cfset minutes = int(totalminutes mod 60)>

							<!---  #totalminutes# minutes =  --->
							#days# days, #hours# hours, #minutes# minutes 
						</td>			
							<td bgcolor="#a_bgcolor#" align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="Blue">#read_report17.company#
							</td>
							<td bgcolor="#a_bgcolor#" align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="Blue">#read_report17.fname# #read_report17.lname#
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

<!---End --->
<CFOUTPUT QUERY="read_report18">
	<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		SELECT *
		FROM Companies 
		WHERE ID = '#comp_id#'
	</CFQUERY>	
					<tr>
						<td bgcolor="#a_bgcolor#"  align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							Outstanding Pre-Processed Files
						</td>
						<td bgcolor="#a_bgcolor#"  align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							#title_id#  
						</td>			
						
						</td>
						<td bgcolor="#a_bgcolor#" align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="Blue">#read_report18.company#
							</td>
							<td bgcolor="#a_bgcolor#" align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="Blue">#read_report18.bfirstname1# #read_report18.blastname1#
							</td>
								<td bgcolor="#a_bgcolor#"  align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
<cfset totalminutes = "#p_hours#">
<cfset hours = "#p_minutes#">
<cfset days = "#p_days#">
						
<!--- <cfset days = int(hours\24)> --->
<cfset hours = int(hours mod 24)>
<cfset minutes = int(totalminutes mod 60)>

							<!---  #totalminutes# minutes =  --->
							#days# days, #hours# hours, #minutes# minutes 
						</td>	
							<td bgcolor="#a_bgcolor#" align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="Blue">#read_report18.fname# #read_report18.lname#
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

<CFOUTPUT QUERY="read_report19">
	<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		SELECT *
		FROM Companies 
		WHERE ID = '#comp_id#'
	</CFQUERY>	
					<tr>
						<td bgcolor="#a_bgcolor#"  align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							Typing Not Completed
						</td>
						<td bgcolor="#a_bgcolor#"  align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							#title_id#  
						</td>			
						
						</td>
						<td bgcolor="#a_bgcolor#" align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="Blue">#read_report19.company#
							</td>
							<td bgcolor="#a_bgcolor#" align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="Blue">#read_report19.bfirstname1# #read_report19.blastname1#
							</td>
								<td bgcolor="#a_bgcolor#"  align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
<cfset totalminutes = "#p_hours#">
<cfset hours = "#p_minutes#">
<cfset days = "#p_days#">
						
<!--- <cfset days = int(hours\24)> --->
<cfset hours = int(hours mod 24)>
<cfset minutes = int(totalminutes mod 60)>

							<!---  #totalminutes# minutes =  --->
							#days# days, #hours# hours, #minutes# minutes 
						</td>	
							<td bgcolor="#a_bgcolor#" align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="Blue">#read_report19.fname# #read_report19.lname#
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

<CFOUTPUT QUERY="read_report20">
	<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		SELECT *
		FROM Companies 
		WHERE ID = '#comp_id#'
	</CFQUERY>	
					<tr>
						<td bgcolor="#a_bgcolor#"  align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							#Event#
						</td>
						<td bgcolor="#a_bgcolor#"  align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							#id#  
						</td>			
						
						</td>
						
							<td bgcolor="#a_bgcolor#" align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="Blue">#read_report20.Name#
							</td>
							
							<td bgcolor="#a_bgcolor#"  align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
								<cfset totalminutes = "#p_minutes#">
								<cfset hours = "#p_hours#">
								<cfset days = "#p_days#">
								<cfset hours = int(hours mod 24)>
								<cfset minutes = int(totalminutes mod 60)>

							<!---  #totalminutes# minutes =  --->
							#days# days, #hours# hours, #minutes# minutes 
						</td>			
							<td bgcolor="#a_bgcolor#" align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="Blue">#read_report20.company#
							</td>
							<td bgcolor="#a_bgcolor#" align=left valign=top>
								<FONT FACE=verdana SIZE=1 color="Blue">#read_report20.fname# #read_report20.lname#
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


				</table>
			</td>
		</tr>
	</table>
</cfif> 