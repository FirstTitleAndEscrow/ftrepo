<cfparam name="form.cancel_closing" default="">

<cfif form.cancel_closing neq "">
<CFQUERY datasource="#request.dsn#" NAME="delete_request">
	delete
	FROM Title_Closing_order_Request
	WHERE title_ID = #rec_ID#
</cfquery>

<cflocation url="form_title_closing_order_requesta.cfm?AL=1&REC_ID=#rec_ID#&UID=#url.uid#&cancelled=1">
</cfif>

<!--- <cfif cgi.REMOTE_ADDR eq '98.233.53.115'>
<cfabort>
</cfif> --->
<CFPARAM NAME="a_direction" DEFAULT="">
<CFPARAM NAME="Insurance_Company" DEFAULT="">
<CFPARAM NAME="Title_Ins_Co_Is" DEFAULT="0">
<CFPARAM NAME="input_date" DEFAULT=""> 
<CFPARAM NAME="A_Update_DB_Flag" DEFAULT="0">
<CFPARAM NAME="N_Note_1" DEFAULT="2">
<CFPARAM NAME="preproc_name" DEFAULT="">
<CFPARAM NAME="is_lender" DEFAULT="0">
<CFPARAM NAME="lender_name" DEFAULT="">
<CFPARAM NAME="lender_contact_name" DEFAULT="">
<CFPARAM NAME="lender_phone" DEFAULT="">
<CFPARAM NAME="ref_number" DEFAULT="">

<!---Includes Section pre-processing --->
<CFINCLUDE TEMPLATE="./includes/preprocessing.cfm">
<CFINCLUDE TEMPLATE="./includes/preprocessing2.cfm">
<!---Clear To Close Person that will be assigned this Order --->

<CFQUERY datasource="#request.dsn#" NAME="get_title">
	SELECT *
	FROM Title
	WHERE title_ID = #rec_ID#
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_sales_rep">
	SELECT intSales
	FROM  companies
	WHERE ID = #get_title.comp_ID#
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="get_sales_rep_info">
	SELECT fname, lname, email, closing_emails
	FROM  First_Admin
	WHERE ID = #get_sales_rep.intSales#
</cfquery>




		<!--- ===/ If the A_Update_DB_Flag is GT 0   \=== --->
		<!--- ===/ then we need to update the proper \=== --->
		<!--- ===/ Table with the data from the form \=== --->
		
<CFQUERY datasource="#request.dsn#" NAME="read_title">
	SELECT *
	FROM Title
	WHERE title_ID = #rec_ID#
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="read_comp">
	SELECT company
	FROM companies
	WHERE id = #read_title.comp_id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_uder_info">		
	SELECT *
	FROM First_Admin
	WHERE ID = #read_title.comp_ID#
</CFQUERY>	
			
<CFQUERY datasource="#request.dsn#" NAME="bbb">		
	SELECT *
	FROM Title_Closing_Order_Request
	Where Title_Id = #rec_id#
</CFQUERY>			
<CFQUERY datasource="#request.dsn#" NAME="aaaa">		
	SELECT *
	FROM Title_Closing_Order_Request
	Where Title_Id = #rec_id#
</CFQUERY>

<CFSET A_req_closing_date = '#confirm_mon#-#comfirm_day#-#confirm_year#'>
<CFSET a_contract_busted_date = '#confirm_busted_mon#/#confirm_busted_day#/#confirm_busted_year#'>
<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>


<cfset message = "">
<cfif IsDate(a_req_closing_date) and dateCompare(DateFormat(Now(), "m/d/yyyy"), a_req_closing_date) eq 1>
<cfset message = message & "Closing Date cannot be in the past, please go back and change the Closing Date to a date in the future\n\n">
</cfif>
<cfif IsDate(a_contract_busted_date) and dateCompare(DateFormat(Now(), "m/d/yyyy"), a_contract_busted_date) eq 1>
<cfset message = message & "Contract Busted cannot be in the past, please go back and change the Contract Busted to a date in the future\n\n">
</cfif>


<cfoutput>
<cfif message neq ''>
<script language="javascript">
var msg = '#message#';
alert(msg);
history.back();
</script>
<cfabort>
</cfif>
</cfoutput>

<CFQUERY datasource="#request.dsn#" NAME="read_comp">
	SELECT company, streamline_client
	FROM companies
	WHERE id = #get_title.comp_id#
</CFQUERY>

<cfif read_comp.streamline_client eq 1 and a_contract_busted_date eq '//'>
<script language="javascript">
alert("Please fill in the Contract Busted Date");
history.back();
</script>

</cfif>

<CFQUERY datasource="#request.dsn#" name="check_record">
Select * from Title_Closing_Order_Request
where title_id = #rec_id#
</CFQUERY>
<cfif not check_record.recordcount>
<CFQUERY datasource="#request.dsn#" name="insert_record">
insert into Title_Closing_Order_Request
(title_id)
values
(#rec_id#)
</CFQUERY>
</cfif>

<CFQUERY datasource="#request.dsn#" name="check_rec">
Select * from Title_Closing_Order_Request
where title_id = #rec_id#
</CFQUERY>
<cfif check_rec.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" name="insert_rec">
Insert into Title_Closing_Order_Request
(title_id)
values
(#rec_id#)
</CFQUERY>
</cfif>



<cfif IsDate(A_req_closing_date)>

<CFQUERY datasource="#request.dsn#">		
	UPDATE Title_Closing_Order_Request
				SET	
					A_Req_Closing_Day   	 = '#comfirm_Day#',
					A_Req_Closing_Time		 = '#A_Req_Closing_Time#',
					A_Req_Closing_month		 = '#confirm_mon#',
					A_Req_Closing_year		 = '#confirm_year#',
					A_Settle_Location		 = '#A_Settle_Location#',
                    A_req_closing_date       = '#A_req_closing_date#',
					request_date  		     = '#FORM.confirm_mon#/#FORM.comfirm_day#/#FORM.confirm_year#',
					A_Req_By_Company 		 = '#A_Req_By_Company#',
					A_Req_By_Phone 			 = '#A_Req_By_Phone#',
					A_Req_By_Ext 			 = '#A_Req_By_Ext#',
					A_Req_By_Fax 			 = '#A_Req_By_Fax#',
					A_Req_By_Email 			 = '#A_Req_By_Email#',
					A_Req_By_After_Hours_Phone = '#A_Req_By_After_Hours_Phone#',
					A_Managers_Name 		 = '#A_Managers_Name#',
					A_Managers_Phone		 = '#A_Managers_Phone#',
					c_dateandtime		     = '#order_date_adj#',
					c_comp_id                = #read_title.comp_id#,
					A_How_Will_Be_Shipped	 = '#A_How_Will_Be_Shipped#',
					A_Special_Inst			 = '#A_Special_Inst#',
					a_sent_date              = '#DateFormat(Now(), "m/d/yyyy")#',
					a_sent_time              = '#TimeFormat(Now(), "HH:mm:ss")#',
					a_filled_out_date        = '#DateFormat(Now(), "m/d/yyyy")#',
					a_filled_out_time        = '#TimeFormat(Now(), "HH:mm:ss")#',
					a_filled_out_by          = 1,
					p_name					 = '#preproc_name#',
					dateandtime				 = getdate(),
					is_lender = '#is_lender#',
					lender_name = '#lender_name#',
					lender_contact_name = '#lender_contact_name#',
					lender_phone = '#lender_phone#',
					ref_number = '#ref_number#',
					<cfif IsDate(a_contract_busted_date)>
					contract_busted_date = '#DateFormat(a_contract_busted_date, "m/d/yyyy")#'
					<cfelse>
					contract_busted_date = NULL
					</cfif>
				WHERE Title_ID = #rec_id#
</CFQUERY>	


<cfelseif isDate(a_contract_busted_date)>
<CFQUERY datasource="#request.dsn#">		
	UPDATE Title_Closing_Order_Request
				SET	contract_busted_date = '#DateFormat(a_contract_busted_date, "m/d/yyyy")#'
				WHERE Title_ID = #rec_id#
</CFQUERY>	

</cfif>

<!---If the Title_ID is not in tblUser_Roles then we need to do an insert 
     otherwise we will use update --->
	
<cfif isDate(A_req_closing_date)>
<CFQUERY datasource="#request.dsn#" NAME="read_title_count">
	Select title_id 
	from tblUser_Roles
	where title_ID = #rec_id#
</CFQUERY>

<CFIF #read_title_count.recordcount# gte 1>
	<CFQUERY datasource="#request.dsn#">
		Update tblUser_Roles
		set Preprocessor_ID = #preprocessing#,
			Preprocessor_Start_Datetime = getdate()
		where title_ID = #rec_id#
	</CFQUERY>
<CFELSE>
	<CFQUERY datasource="#request.dsn#">
		Insert into tblUser_Roles
		(title_id,Preprocessor_ID, Preprocessor_Start_Datetime)
		Values(#rec_ID#,#preprocessing#,getdate())
	</CFQUERY>
</CFIF>

<cfif #bbb.request_dateold# neq "">
	<CFQUERY datasource="#request.dsn#" NAME="read_com">
			select * from Title_Notes
			WHERE order_ID = #rec_id# and N_Note like 'Postponed%'
	</CFQUERY>
			
	<cfif #read_com.recordcount# eq 0>
			<CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('Toronicia', 'Woods', #URL.rec_id#, 'Postponed to #DateFormat(bbb.request_Date, "mm")# #A_Req_Closing_Time#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
			</CFQUERY>
	<cfelse>
			<cfquery datasource="#request.dsn#">
				update Title_Notes
				set  N_Note = 'Postponed to #DateFormat(bbb.request_Date, "mm")# #A_Req_Closing_Time#',
				N_Date = '#DateFormat(Now(), "m/d/yyyy")#', 
				N_Time = '#TimeFormat(Now(), "HH:mm:ss")#', 
			 	access = '1', 
	 			access2 = '1'	
				where order_ID = #rec_id# and N_Note like 'Postponed%'
			</cfquery>
	</cfif>
<cfif get_sales_rep_info.closing_emails eq 'True'>
<cfmail to="<cfif get_sales_rep_info.email does not contain 'spape'>;#get_sales_rep_info.email#<cfelse>closings@firsttitleservices.com</cfif>" from="webmaster@firsttitleservices.com" subject="T-#rec_id# - Closing Postponed">

Closing has been postponed for file T-#rec_id#

Closing has been postponed for #confirm_mon#/#comfirm_Day#/#confirm_year# at #A_Req_Closing_Time#

Location: #A_Settle_Location#

(this is an automated email)

</cfmail>
</cfif>

</cfif>

	<!-- sazan changed 11/28/05 -->		
		
	<CFQUERY datasource="#request.dsn#" NAME="read_title">
		
			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#
		
		</CFQUERY>


<cfif #read_title.appraisal_status# neq "Loan Closed">
<CFQUERY datasource="#request.dsn#">		
	UPDATE Title
	SET	appraisal_status = 'Closing Requested'
	WHERE Title_ID = #rec_id#
</cfquery>
</cfif>


<!-- sazan changed 11/28/05 -->
<cfinvoke	component = "cfc.team_info"	method = "getTeam"	returnVariable = "get_team_info" comp_id="#get_title.comp_id#">
<CFQUERY datasource="#request.dsn#" NAME="get_leader">
SELECT * from first_admin where ID = #get_team_info.leader_id#
</cfquery>
<cfset leader_email = get_leader.email>
<cfset leader_fname = get_leader.fname>
<cfset leader_lname = get_leader.lname>

<CFQUERY datasource="#request.dsn#">		
	INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#leader_fname#', '#leader_lname#', #URL.rec_id#, 'Closing request received by client', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')		
</CFQUERY>



<CFQUERY datasource="#request.dsn#" NAME="read_event">
		select * from eventlist
			WHERE title_ID = #rec_id#
</CFQUERY>

<cfif NOT read_event.recordcount>
<CFQUERY datasource="#request.dsn#" NAME="insert_event">
insert into eventlist (title_id) values (#rec_id#)
</cfquery>
</cfif>

<cfif #read_event.c_day# neq "">
		<cfquery name="get_old1" datasource="#request.dsn#">
			select request_date, a_req_closing_date from Title_Closing_Order_Request
			where title_id = #URL.rec_id#
		</cfquery>

<CFQUERY datasource="#request.dsn#" name="check_rec">
Select * from Title_Closing_Order_Request
where title_id = #url.rec_id#
</CFQUERY>
<cfif check_rec.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" name="insert_rec">
Insert into Title_Closing_Order_Request
(title_id)
values
(#url.rec_id#)
</CFQUERY>
</cfif>

<cfquery name="upd2" datasource="#request.dsn#">
			update Title_Closing_Order_Request
			set 
			request_dateold = '#get_old1.request_date#'
			where title_id = #URL.rec_id#
		</cfquery>

		<cfquery name="get_old" datasource="#request.dsn#">
			select yearmonth, c_time from eventlist
			where title_id = #URL.rec_id#
		</cfquery>

<CFQUERY datasource="#request.dsn#" name="check_rec">
Select * from eventlist
where title_id = #url.rec_id#
</CFQUERY>
<cfif check_rec.recordcount eq 0>
<CFQUERY datasource="#request.dsn#" name="insert_rec">
Insert into eventlist
(title_id)
values
(#url.rec_id#)
</CFQUERY>
</cfif>
		<cfquery name="upd" datasource="#request.dsn#">
			update eventlist
			set 
			yearmonthold = '#get_old.yearmonth#',
			c_timeold = '#get_old.c_time#'
			where title_id = #URL.rec_id#
		</cfquery>
		
		<cfquery name="updateclosing" datasource="#request.dsn#">
			update eventlist
			set 
			yearmonth = null,
			sc_dateandtime = null,
			yearmonthday = null,
			c_day = null,
			c_time = null,
			c_year = null,
			c_month = null,
			c_comment = null,
			s_time = null,
			s_date = null,
			l_date = null,
			l_time = null,
			closing_date = null
			where title_id = #URL.rec_id#
		</cfquery>
</cfif>	
	<CFQUERY datasource="#request.dsn#" NAME="read_cl">
			select * from doc_closer_title
			WHERE title_ID = #rec_id#
	</CFQUERY>

<cfif NOT read_cl.recordcount>
<CFQUERY datasource="#request.dsn#" NAME="insert_event">
insert into doc_closer_title (title_id) values (#rec_id#)
</cfquery>
</cfif>


<cfif #read_cl.a_date_assigned# neq "">
	<CFQUERY datasource="#request.dsn#" NAME="read_t">
		UPDATE Doc_closer_Title
			SET closer_ID = null,
			a_Assigned_by = null,
			ac_dateandtime = null,
			a_Date_Assigned = null,
			a_Time_Assigned = null
			WHERE title_ID = #rec_ID#
	</CFQUERY>
</cfif>
		
<CFQUERY datasource="#request.dsn#" NAME="read_title">
	SELECT *
	FROM Title
	WHERE title_ID = #rec_ID#
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		SELECT company
		FROM companies
		WHERE id = #read_title.comp_id#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_uder_info">		
	SELECT *
	FROM First_Admin
	WHERE ID = #read_title.comp_ID#
</CFQUERY>	
			
<CFQUERY datasource="#request.dsn#" NAME="bbb">		
	SELECT *
	FROM Title_Closing_Order_Request
	Where Title_Id = #rec_id#
</CFQUERY>	

<cfquery name="getorderinfo" datasource="#request.dsn#">
	SELECT *
	FROM Title_Closing_Order_Request
	Where Title_Id = #rec_id#
</cfquery>

<!--- Read all of the Notes for this title --->
<CFQUERY datasource="#request.dsn#" NAME="aaaa">		
	SELECT *
	FROM Title_Closing_Order_Request
	Where Title_Id = #rec_id#
</CFQUERY>

<CFIF #aaaa.a_sent_by# GT 0>
	<CFSET a_sent = "1">				
<CFELSE>
	<CFSET a_sent = "0">				
</CFIF>

<CFIF #aaaa.a_filled_out_by# GT 0>
	<CFSET a_filled = "1">				
<CFELSE>
	<CFSET a_filled = "0">				
</CFIF>

<CFQUERY datasource="#request.dsn#" NAME="Read_Title">		
	SELECT *
	FROM Title
	Where Title_Id = #rec_id#
</CFQUERY>
</cfif>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>

</head>

		
<BODY BGCOLOR="white" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>
<cfset url.al = 1>
<cfset company_id = read_title.comp_id>
<cfinclude template="includes/title_top_nav.cfm">
<CENTER>
<CENTER>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=790 align=center valign=top>
		
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width=790 align=left valign=top bgcolor=blue>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Closing Order Request Form</B></CENTER>
			</TD>
		</TR>
	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>

		
		<p>
<cfoutput>
<cfif IsDate(A_req_closing_date)>
<center><b><font face=verdana size=3 color=blue> THANK YOU! CLOSING HAS BEEN REQUESTED FOR ORDER #READ_TITLE.TITLE_ID#</font></b></center>
<P>
<cfelseif not IsDate(A_req_closing_date) and IsDate(a_contract_busted_date)>
<center><b><font face=verdana size=3 color=blue> THANK YOU! CONTRACTED BUSTED DATE HAS BEEN CHANGED, CLOSING HAS **NOT** BEEN REQUESTED FOR ORDER #READ_TITLE.TITLE_ID#</font></b></center>
<P>
</cfif>

<table width=700 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>


		<tr>
			<td width=700  align=center valign=top bgcolor=e1e1e1>


		
	</cfoutput>		
	


<table width=700 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=700 align=center valign=top>
		<B><font face=verdana size=2 color=white>Below is the information entered for this closing schedule </FONT></B><br>

<table width=700 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

		<td width=700 align=center valign=top bgcolor=e1e1e1>
<table width=700 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
		<tr>
			<td width=700  align=right valign=top bgcolor=e1e1e1>
<CFOUTPUT>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=center valign=top bgcolor=e1e1e1>
			<p>
			<br>
			<font face=verdana size=2 color=black>
			<NOBR>Order number - <font face=verdana size=2 color=blue><B>#URL.rec_id#</B></font></NOBR>
			</td>
		</tr>
	</table>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=350 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>Borrower Name :</NOBR>
			</td>
			<td width=349 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>Borrower Name :</NOBR>
			</td>
		</tr>
		<tr>
			<td width=350 align=Left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=blue>
			<B>#Read_Title.BFirstName1# #Read_Title.bminame1# #Read_Title.BLastName1#</B>
			</td>
			<td width=349 align=Left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=blue>
			<B>#Read_Title.BFirstName2# #Read_Title.bminame2# #Read_Title.BLastName2#</B>
			</td>
		</tr>
	</table>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>State - <font face=verdana size=2 color=blue><b>#Read_Title.pstate#</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;City - <font face=verdana size=2 color=blue><b> #Read_Title.pcity#</b></font>&nbsp;&nbsp;&nbsp;<font face=verdana size=2 color=blue><b>#Read_Title.pzip#</b></font></NOBR>
			</td>
		</tr>
	</table>


</CFOUTPUT>
<CFOUTPUT QUERY="aaaa">
	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		
	</table>
	
	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=148 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				<NOBR>Date of Request - 
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>					
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_filled_out_Date#</B>
			</td>

			<td width=148 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				<NOBR>Time of Request - 
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>					
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_filled_out_Time#</B>
			</td>
		</tr>
	</table>	

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=149 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Date Req.
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_Req_Closing_month#/#aaaa.A_Req_Closing_Day#/#aaaa.A_Req_Closing_year#</B>
			</td>					

			<td width=149 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Time Req.
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_Req_Closing_Time#</B>
			</td>
		</tr>
				<tr>
			<td width=149 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Contract Busted Date
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<cfif IsDate(a_contract_busted_date)>
				<B>#DateFormat(a_contract_busted_date, "m/d/yyyy")#</B>
				</cfif>
			</td>					
			</tr>

	</table>


	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=left valign=top bgcolor=e1e1e1>
				<table width=698 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
					
					<tr>
			<td width=268 align=right valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			Location for Closing -
			</td>
			<td width=410 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=blue><B>#aaaa.A_Settle_Location#</B></PRE>
			</td>
				</tr>	
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Requesting Company -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Company#</B>
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Phone -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Phone#</B>
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Phone Ext -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Ext#</B>
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Fax - 
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Fax#</B>
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Email - 
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Email#</B>
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						After Hours / Weekend Phone and Ext - 
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_After_Hours_Phone#</B>
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Managers Name -   
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Managers_Name#</B>
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Managers Phone  -   
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Managers_Phone#</B>
						</td>
					
				</tr>
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
					<font face=verdana size=2 color=black>
					How will package be shipped  - 
				</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_How_Will_Be_Shipped#</B>
				</td>
				</tr>
				<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
					<font face=verdana size=2 color=black>
					Lender?  - 
				</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B><cfif aaaa.is_lender eq 1>Yes</cfif><cfif aaaa.is_lender eq 0>No</cfif></B>
				</td>
				</tr>
				<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
					<font face=verdana size=2 color=black>
					Lender Name  - 
				</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.lender_name#</B>
				</td>
				</tr>
				<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
					<font face=verdana size=2 color=black>
					Lender Contact Name  - 
				</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.lender_contact_name#</B>
				</td>
				</tr>
				<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
					<font face=verdana size=2 color=black>
					Lender Phone  - 
				</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.lender_phone#</B>
				</td>
				</tr>
				<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
					<font face=verdana size=2 color=black>
					Loan or Reference Number  - 
				</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.ref_number#</B>
				</td>
				</tr>
				<!--- ============================================================== --->
			</table>
				<font face=verdana size=2 color=black>			
				Special Instructions :<br> 
				<PRE><font face=verdana size=2 color=blue><B>#aaaa.A_Special_Inst#</B></PRE>

			</td>
		</tr>
	</table>


</CFOUTPUT>

	</table>




			</td>
		</tr>		
</table>
			</td>
		</tr>		
</table>

<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->

</td>
</tr>

	</table>

			
			</TD>
		</TR>

	</table>

<CFQUERY datasource="#request.dsn#" NAME="is_VA">
SELECT f.va_employee from companies c, first_admin f
where c.ID = #read_title.comp_id#
and f.ID = c.intSales
</CFQUERY>
<cfif is_VA.va_employee eq 'True'>
<cfset email_address = "richmond@firsttitleservices.com">
<cfelse>
<cfset email_address = "closings@firsttitleservices.com">
</cfif>

	
<CFIF #Len(A_Req_By_Email)# gt "1">
	<CFSET b_emails_to_first_title = "#A_Req_By_Email#, #email_address#">
<CFELSE>
    <CFSET b_emails_to_first_title = "#email_address#">    
</CFIF>
<!---These If Statements are impossible to figure out in this code
I'm going to write some stupid code right here to get around it.
Company 621 is another company that MIC bought and needs to follow the rules.
I don't trust the conditional statement to work so I'm doing it this way.
I can't test this because if MIC receives an email in error they will freak out.  
Harry 11/12/04
--->
<CFSET company = #read_title.comp_id# >

<CFIF #company# eq "621">
    <CFSET #company# eq "115">
</CFIF>        
<!---End Harry 11/12/2004--->  
<cfif (#company# neq "115") ><!---MIC--->
    <cfif #company# eq "559"><!---Weichert 559--->
            <CFIF (#A_Req_By_Email# neq "#trim(get_title.o_email)#") AND (#len(get_title.o_email)# gt "1")>
                <CFSET b_emails_to_first_title = #b_emails_to_first_title# & ",#trim(get_title.o_email)#">
            </CFIF>
            <CFIF (#A_Req_By_Email# neq "#trim(get_title.p_email)#") AND  (#len(get_title.p_email)# gt "1")>
                <CFSET b_emails_to_first_title = #b_emails_to_first_title# & ",#trim(get_title.p_email)#">
            </CFIF>        
        <CFELSE>
            <CFSET b_emails_to_first_title = "#A_Req_By_Email#,closings@firsttitleservices.com">        
        </CFIF>
		<CFIF #company# eq "859" or #company# eq "919" or #company# eq "953" 
			or #company# eq "947" or #company# eq "946" or #company# eq "948" 
			or #company# eq "944" or #company# eq "949" or #company# eq "951" 
			or #company# eq "945" or #company# eq "950" or #company# eq "943" 
			or #company# eq "941" or #company# eq "942" or #company# eq "968">
            <CFSET  #b_emails_to_first_title# = "#read_title.p_email#,kklos@weichertfinancial.com">
		</CFIF>


<CFIF #company# eq "1835"> <!--- Union Mortgage - Annendale --->
	<CFSET b_emails_to_first_title = #b_emails_to_first_title# & ";closingdepartment@union-mtg.com">
	</CFIF>


<CFQUERY datasource="#request.dsn#" NAME="is_VA">
SELECT f.va_employee from companies c, first_admin f
where c.ID = #read_title.comp_id#
and f.ID = c.intSales
</CFQUERY>
<cfif is_VA.va_employee eq 'True'>
<cfset b_emails_to_first_title = "richmond@firsttitleservices.com">
<cfelse>
<cfset b_emails_to_first_title = #b_emails_to_first_title#>
</cfif>

<cfif get_sales_rep_info.closing_emails eq 'True' and get_sales_rep_info.closing_emails does not contain 'spape'>
<CFSET b_emails_to_first_title = #b_emails_to_first_title# & ";" & #get_sales_rep_info.email#>
</cfif>
<cfif IsDate(A_req_closing_date)>
			<CFMAIL
                TO="#b_emails_to_first_title#"
                FROM="#b_emails_to_first_title#"
                SERVER="127.0.0.1"
                Subject="First Title - Closing Request for order #read_title.title_id# -- Loan number-#read_title.loan_number#, #read_title.bfirstname1# #read_title.blastname1#"
                TIMEOUT="600"
                type="HTML"
                >


<table width=700 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>


	<tr>
		<td width=700 align=center valign=top>
		<B><font face=verdana size=2 color=white>Title Closing Order Request Form</FONT></B><br>
</tr>


		<tr>
			<td width=700  align=right valign=top bgcolor=e1e1e1>


	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=center valign=top bgcolor=e1e1e1>
			<p>
			<br>
			<font face=verdana size=2 color=black>
			<NOBR>Order number - <font face=verdana size=2 color=blue><B>#URL.rec_id#</B></font></NOBR>
			</td>
		</tr>
	</table>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=350 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>Borrower Name :</NOBR>
			</td>
			<td width=349 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>Borrower Name :</NOBR>
			</td>
		</tr>
		<tr>
			<td width=350 align=Left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=blue>
			<B>#Read_Title.BFirstName1# #Read_Title.bminame1# #Read_Title.BLastName1#</B>
			</td>
			<td width=349 align=Left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=blue>
			<B>#Read_Title.BFirstName2# #Read_Title.bminame2# #Read_Title.BLastName2#</B>
			</td>
		</tr>
	</table>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>State - <font face=verdana size=2 color=blue><b>#Read_Title.pstate#</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;City - <font face=verdana size=2 color=blue><b> #Read_Title.pcity#</b></font>&nbsp;&nbsp;&nbsp;<font face=verdana size=2 color=blue><b>#Read_Title.pzip#</b></font></NOBR>
			</td>
		</tr>
	</table>



	
	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=148 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				<NOBR>Date of Request - 
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>					
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_filled_out_Date#</B>
			</td>

			<td width=148 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				<NOBR>Time of Request - 
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>					
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_filled_out_Time#</B>
			</td>
		</tr>
	</table>	

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=149 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Date Req.
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_Req_Closing_month#/#aaaa.A_Req_Closing_Day#/#aaaa.A_Req_Closing_year#</B>
			</td>					

			<td width=149 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Time Req.
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_Req_Closing_Time#</B>
			</td>
		</tr>
					<tr>
			<td width=149 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Contract Busted Date
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<cfif IsDate(a_contract_busted_date)>
				<B>#DateFormat(a_contract_busted_date, "m/d/yyyy")#</B>
				</cfif>
			</td>					
			</tr>
</table>


	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=left valign=top bgcolor=e1e1e1>
				<table width=698 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
			
					<tr>
			<td width=268 align=right valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			Location for Closing -
			</td>
			<td width=410 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=blue><B>#aaaa.A_Settle_Location#</B></PRE>
			</td>
				</tr>	
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Requesting Company -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Company#</B>
						</td>
					</tr>
			
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Phone -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Phone#</B>
						</td>
					</tr>
			
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Phone Ext -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Ext#</B>
						</td>
					</tr>
				
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Fax - 
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Fax#</B>
						</td>
					</tr>
				
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Email - 
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Email#</B>
						</td>
					</tr>
		
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						After Hours / Weekend Phone and Ext - 
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_After_Hours_Phone#</B>
						</td>
					</tr>
		
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Managers Name -   
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Managers_Name#</B>
						</td>
					</tr>
		
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Managers Phone  -   
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Managers_Phone#</B>
						</td>
					
				</tr>
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
					<font face=verdana size=2 color=black>
					How will package be shipped  - 
				</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_How_Will_Be_Shipped#</B>
				</td>
				</tr>
				<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
					<font face=verdana size=2 color=black>
					Lender?  - 
				</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B><cfif aaaa.is_lender eq 1>Yes</cfif><cfif aaaa.is_lender eq 0>No</cfif></B>
				</td>
				</tr>
				<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
					<font face=verdana size=2 color=black>
					Lender Name  - 
				</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.lender_name#</B>
				</td>
				</tr>
				<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
					<font face=verdana size=2 color=black>
					Lender Contact Name  - 
				</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.lender_contact_name#</B>
				</td>
				</tr>
				<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
					<font face=verdana size=2 color=black>
					Lender Phone  - 
				</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.lender_Phone#</B>
				</td>
				</tr>
				<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
					<font face=verdana size=2 color=black>
					Loan or Reference Number  - 
				</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.ref_number#</B>
				</td>
				</tr>
			
			</table>

			
				<font face=verdana size=2 color=black>			
				Special Instructions :<br> 
				<PRE><font face=verdana size=2 color=blue><B>#aaaa.A_Special_Inst#</B></PRE>

			</td>
		</tr>
	</table>
		
</CFMAIL>
</cfif>

<cfelse>
<CFQUERY datasource="#request.dsn#" NAME="is_VA">
SELECT f.va_employee from companies c, first_admin f
where c.ID = #read_title.comp_id#
and f.ID = c.intSales
</CFQUERY>

<cfif is_VA.va_employee eq 'True'>
<cfset email_address = "richmond@firsttitleservices.com">
<cfelse>
<cfset email_address = "closings@firsttitleservices.com">
</cfif>

<cfif IsDate(A_req_closing_date)>
		<CFMAIL
TO="#email_address#"
FROM="#email_address#"
SERVER="127.0.0.1"
Subject="First Title - Closing Request for order #read_title.title_id# -- Loan number-#read_title.loan_number#, #read_title.bfirstname1# #read_title.blastname1#"
TIMEOUT="600"
type="HTML"
>


<table width=700 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>


	<tr>
		<td width=700 align=center valign=top>
		<B><font face=verdana size=2 color=white>Title Closing Order Request Form</FONT></B><br>
</tr>


		<tr>
			<td width=700  align=right valign=top bgcolor=e1e1e1>


	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=center valign=top bgcolor=e1e1e1>
			<p>
			<br>
			<font face=verdana size=2 color=black>
			<NOBR>Order number - <font face=verdana size=2 color=blue><B>#URL.rec_id#</B></font></NOBR>
			</td>
		</tr>
	</table>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=350 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>Borrower Name :</NOBR>
			</td>
			<td width=349 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>Borrower Name :</NOBR>
			</td>
		</tr>
		<tr>
			<td width=350 align=Left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=blue>
			<B>#Read_Title.BFirstName1# #Read_Title.bminame1# #Read_Title.BLastName1#</B>
			</td>
			<td width=349 align=Left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=blue>
			<B>#Read_Title.BFirstName2# #Read_Title.bminame2# #Read_Title.BLastName2#</B>
			</td>
		</tr>
	</table>
	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>State - <font face=verdana size=2 color=blue><b>#Read_Title.pstate#</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;City - <font face=verdana size=2 color=blue><b> #Read_Title.pcity#</b></font>&nbsp;&nbsp;&nbsp;<font face=verdana size=2 color=blue><b>#Read_Title.pzip#</b></font></NOBR>
			</td>
		</tr>
	</table>
	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=148 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				<NOBR>Date of Request - 
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>					
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_filled_out_Date#</B>
			</td>

			<td width=148 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				<NOBR>Time of Request - 
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>					
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_filled_out_Time#</B>
			</td>
		</tr>
	</table>	
	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=149 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Date Req.
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_Req_Closing_month#/#aaaa.A_Req_Closing_Day#/#aaaa.A_Req_Closing_year#</B>
			</td>					

			<td width=149 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Time Req.
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_Req_Closing_Time#</B>
			</td>
		</tr>
						<tr>
			<td width=149 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Contract Busted Date
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<cfif IsDate(a_contract_busted_date)>
				<B>#DateFormat(a_contract_busted_date, "m/d/yyyy")#</B>
				</cfif>
			</td>					
			</tr>

	</table>
	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=left valign=top bgcolor=e1e1e1>
				<table width=698 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
			
					<tr>
			<td width=268 align=right valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			Location for Closing -
			</td>
			<td width=410 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=blue><B>#aaaa.A_Settle_Location#</B></PRE>
			</td>
				</tr>	
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Requesting Company -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Company#</B>
						</td>
					</tr>
			
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Phone -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Phone#</B>
						</td>
					</tr>
			
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Phone Ext -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Ext#</B>
						</td>
					</tr>
				
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Fax - 
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Fax#</B>
						</td>
					</tr>
				
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Email - 
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_Email#</B>
						</td>
					</tr>
		
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						After Hours / Weekend Phone and Ext - 
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Req_By_After_Hours_Phone#</B>
						</td>
					</tr>
		
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Managers Name -   
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Managers_Name#</B>
						</td>
					</tr>
		
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Managers Phone  -   
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=blue>
						<B>#aaaa.A_Managers_Phone#</B>
						</td>
					
				</tr>
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
					<font face=verdana size=2 color=black>
					How will package be shipped  - 
				</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.A_How_Will_Be_Shipped#</B>
				</td>
				</tr>
			<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
					<font face=verdana size=2 color=black>
					Lender Name  - 
				</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.lender_name#</B>
				</td>
				</tr>
				<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
					<font face=verdana size=2 color=black>
					Lender Contact Name  - 
				</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.lender_contact_name#</B>
				</td>
				</tr>
				<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
					<font face=verdana size=2 color=black>
					Lender Phone  - 
				</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.lender_Phone#</B>
				</td>
				</tr>
				<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
					<font face=verdana size=2 color=black>
					Loan or Reference Number  - 
				</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=blue>
				<B>#aaaa.ref_number#</B>
				</td>
				</tr>
			</table>

			
				<font face=verdana size=2 color=black>			
				Special Instructions :<br> 
				<PRE><font face=verdana size=2 color=blue><B>#aaaa.A_Special_Inst#</B></PRE>

			</td>
		</tr>
	</table>
		
</CFMAIL>
</cfif>
	</cfif>

</BODY>
</HTML>
	

	