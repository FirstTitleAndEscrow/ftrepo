
<CFPARAM NAME="a_direction" DEFAULT="">
<CFPARAM NAME="Insurance_Company" DEFAULT="">
<CFPARAM NAME="Title_Ins_Co_Is" DEFAULT="0">
<CFPARAM NAME="A_Update_DB_Flag" DEFAULT="0">
<CFPARAM NAME="N_Note_1" DEFAULT="2">







		<!--- ===/ If the A_Update_DB_Flag is GT 0   \=== --->
		<!--- ===/ then we need to update the proper \=== --->
		<!--- ===/ Table with the data from the form \=== --->
		


		<CFIF #A_Update_DB_Flag# EQ "2">

			<CFQUERY datasource="#request.dsn#" NAME="read_uder_info">		
				SELECT *
				FROM First_Admin
				WHERE ID = #URL.uid#
			</CFQUERY>	
			
				<CFQUERY datasource="#request.dsn#" NAME="bbb">		
					SELECT *
					FROM Title_Closing_Order_Request
					Where Title_Id = #URL.rec_id#
				</CFQUERY>			
				
			<CFQUERY datasource="#request.dsn#">		
				UPDATE Title_Closing_Order_Request
				SET	Job_Number 				 =  #Job_Number#,
					A_Req_Date 				 = '#A_Req_Date#',
					A_Req_Time				 = '#A_Req_Time#',
					A_Req_Closing_Date   	 = '#A_Req_Closing_Date#',
					A_Req_Closing_Time		 = '#A_Req_Closing_Time#',
					A_Settle_Location		 = '#A_Settle_Location#',
					A_Requested_By 			 = '#A_Requested_By#',
					A_Req_By_Title  		 = '#A_Req_By_Title#',
					A_Req_By_Company 		 = '#A_Req_By_Company#',
					A_Req_By_Phone 			 = '#A_Req_By_Phone#',
					A_Req_By_Ext 			 = '#A_Req_By_Ext#',
					A_Req_By_Fax 			 = '#A_Req_By_Fax#',
					A_Req_By_Email 			 = '#A_Req_By_Email#',
					A_Req_By_After_Hours_Phone = '#A_Req_By_After_Hours_Phone#',
					A_Managers_Name 		 = '#A_Managers_Name#',
					A_Managers_Phone		 = '#A_Managers_Phone#',
					A_When_Pkg_Will_Be_Ready = '#A_When_Pkg_Will_Be_Ready#',
					A_How_Will_Be_Shipped	 = '#A_How_Will_Be_Shipped#',
					<CFIF #bbb.a_filled_out_by# EQ 0>
						A_Special_Inst			 = '#A_Special_Inst#',
						a_filled_out_date        = '#DateFormat(Now(), "m/d/yyyy")#',
						a_filled_out_time        = '#TimeFormat(Now(), "HH:mm:ss")#',
						a_filled_out_by          = #URL.uid#
					<CFELSE>
						A_Special_Inst			 = '#A_Special_Inst#'					
					</CFIF>
				WHERE Title_ID = #URL.rec_id#
			</CFQUERY>	
			
		</CFIF>



	<!--- ======/ If the Mark as Sent button was selected \=== --->
	
		<CFIF #A_Update_DB_Flag# EQ "5">

			<CFQUERY datasource="#request.dsn#" NAME="read_uder_info">		
				SELECT *
				FROM First_Admin
				WHERE ID = #URL.uid#
			</CFQUERY>	
			
				<CFQUERY datasource="#request.dsn#" NAME="bbb">		
					SELECT *
					FROM Title_Closing_Order_Request
					Where Title_Id = #URL.rec_id#
				</CFQUERY>			
				
			<CFQUERY datasource="#request.dsn#">		
				UPDATE Title_Closing_Order_Request
				SET	Job_Number 				 =  #Job_Number#,
					A_Req_Date 				 = '#A_Req_Date#',
					A_Req_Time				 = '#A_Req_Time#',
					A_Req_Closing_Date   	 = '#A_Req_Closing_Date#',
					A_Req_Closing_Time		 = '#A_Req_Closing_Time#',
					A_Settle_Location		 = '#A_Settle_Location#',
					A_Requested_By 			 = '#A_Requested_By#',
					A_Req_By_Title  		 = '#A_Req_By_Title#',
					A_Req_By_Company 		 = '#A_Req_By_Company#',
					A_Req_By_Phone 			 = '#A_Req_By_Phone#',
					A_Req_By_Ext 			 = '#A_Req_By_Ext#',
					A_Req_By_Fax 			 = '#A_Req_By_Fax#',
					A_Req_By_Email 			 = '#A_Req_By_Email#',
					A_Req_By_After_Hours_Phone = '#A_Req_By_After_Hours_Phone#',
					A_Managers_Name 		 = '#A_Managers_Name#',
					A_Managers_Phone		 = '#A_Managers_Phone#',
					A_When_Pkg_Will_Be_Ready = '#A_When_Pkg_Will_Be_Ready#',
					A_How_Will_Be_Shipped	 = '#A_How_Will_Be_Shipped#',
					A_Special_Inst			 = '#A_Special_Inst#',
					a_sent_date        = '#DateFormat(Now(), "m/d/yyyy")#',
					a_sent_time     = '#TimeFormat(Now(), "HH:mm:ss")#',
					a_sent_by          = #URL.uid#
				WHERE Title_ID = #URL.rec_id#
			</CFQUERY>	
			
		</CFIF>
		

	<!--- Read all of the Notes for this title --->
	
			<CFQUERY datasource="#request.dsn#" NAME="aaaa">		
				SELECT *
				FROM Title_Closing_Order_Request
				Where Title_Id = #URL.rec_id#
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
				Where Title_Id = #URL.rec_id#
			</CFQUERY>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=790 align=center valign=top>
		
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width=790 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Closing Order Request Form</B></CENTER>
			</TD>
		</TR>
	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>

		<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">
		<p>

<table width=700 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>


		<tr>
			<td width=700  align=right valign=top bgcolor=e1e1e1>

<cfoutput>

			<CFQUERY datasource="#request.dsn#" NAME="read_users_info_6">		
				SELECT *
				FROM First_Admin
				Where ID = #aaaa.a_filled_out_by#
			</CFQUERY>

			<CFQUERY datasource="#request.dsn#" NAME="read_users_info_5">		
				SELECT *
				FROM First_Admin
				Where ID = #aaaa.a_sent_by#
			</CFQUERY>
			
	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=d1d1d1>
		<tr>
			<td width=100 align=left valign=top bgcolor=d1d1d1>
				<font size=2 color=black face=arial>
				FILLED Out By - 
			</td>
			<td width=249 align=left valign=top bgcolor=d1d1d1>
				<font size=2 color=blue face=arial>
				<CFIF #a_filled# GT "0">
					<B>#read_users_info_6.fname#  #read_users_info_6.lname#</B>
				<CFELSE>
					<font size=2 color=red face=arial>
					<b>Not FILLED out yet</b>				
				</CFIF>
			</td>
			<td width=100 align=right valign=top bgcolor=d1d1d1>
				<font size=2 color=black face=arial>
				SENT By - 
			</td>
			<td width=250 align=left valign=top bgcolor=d1d1d1>
				<font size=2 color=blue face=arial>
				<CFIF #a_sent# GT "0">
					<B>#read_users_info_5.fname#  #read_users_info_5.lname#</B>
				<CFELSE>
					<font size=2 color=red face=arial>
					<b>Not SENT out yet</b>				
				</CFIF>
			</td>
		</tr>
	<!--- =================================================================== --->
		<tr>
			<td width=100 align=right valign=top bgcolor=d1d1d1>
				<font size=2 color=black face=arial>
				Date - Time - 
			</td>
			<td width=249 align=left valign=top bgcolor=d1d1d1>
				<font size=2 color=blue face=arial>
				<CFIF #a_filled# GT "0">
					<font size=2 color=blue face=arial><B>#aaaa.a_filled_out_date#</B> - <B>#aaaa.a_filled_out_time#</B></NOBR>				
				</CFIF>
			</td>
			<td width=100 align=right valign=top bgcolor=d1d1d1>
				<font size=2 color=black face=arial>
				Date - Time -  
			</td>
			<td width=250 align=left valign=top bgcolor=d1d1d1>
				<font size=2 color=blue face=arial>
				<CFIF #a_sent# GT "0">
					<font size=2 color=blue face=arial><B>#aaaa.a_sent_date#</B> -  <B>#aaaa.a_sent_time#</B>
				</CFIF>
			</td>
		</tr>
	</table>

</cfoutput>


<CFFORM NAME="frm" ACTION="./Title_Closing_Order_Request.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&Title_Ins_Co_Is=#Title_Ins_Co_Is#&A_Update_DB_Flag=2" METHOD=POST>


<CFOUTPUT>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=right valign=top bgcolor=e1e1e1>
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
		<tr>
			<td width=699 align=right valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>Job number - <CFINPUT type=text name="Job_Number"  size=35 maxlength=50
			VALUE="#aaaa.Job_Number#"
				style="font-size: 9; 
				font-family: verdana; 
				font-style: bold; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none; "></NOBR>
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
				<CFINPUT type=text name="A_Req_Date"  size=35 maxlength=50
					VALUE="#aaaa.A_Req_Date#"
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
					clear: none; ">
			</td>

			<td width=148 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				<NOBR>Time of Request - 
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>					
				<CFINPUT type=text name="A_Req_Time"  size=35 maxlength=50
					VALUE="#aaaa.A_Req_Time#"
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
					clear: none; ">
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
				<CFINPUT type=text name="A_Req_Closing_Date"  size=35 maxlength=50
					VALUE="#aaaa.A_Req_Closing_Date#"
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
					clear: none; ">
			</td>					

			<td width=149 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Time Req.
			</td>
			<td width=200 align=left valign=top bgcolor=e1e1e1>
				<CFINPUT type=text name="A_Req_Closing_Time"  size=35 maxlength=50
					VALUE="#aaaa.A_Req_Closing_Time#"
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
					clear: none; ">
			</td>
		</tr>
	</table>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			Location for Closing :
			<BR>
			<TEXTAREA name="A_Settle_Location"  COLS=90 ROWS=6
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
					clear: none;">#aaaa.A_Settle_Location#</TEXTAREA>
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
						Requested By -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<CFINPUT type=text name="A_Requested_By"  size=35 maxlength=100
							VALUE="#aaaa.A_Requested_By#"
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
							clear: none; ">
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Requestors Title -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<CFINPUT type=text name="A_Req_By_Title"  size=35 maxlength=100
							VALUE="#aaaa.A_Req_By_Title#"
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
							clear: none; ">
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Requesting Company -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<CFINPUT type=text name="A_Req_By_Company"  size=35 maxlength=100
							VALUE="#aaaa.A_Req_By_Company#"
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
							clear: none; ">
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Phone -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<CFINPUT type=text name="A_Req_By_Phone"  size=35 maxlength=50
							VALUE="#aaaa.A_Req_By_Phone#"
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
							clear: none; ">
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Phone Ext -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<CFINPUT type=text name="A_Req_By_Ext"  size=15 maxlength=50
							VALUE="#aaaa.A_Req_By_Ext#"
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
							clear: none; ">
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Fax - 
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<CFINPUT type=text name="A_Req_By_Fax"  size=35 maxlength=50
							VALUE="#aaaa.A_Req_By_Fax#"
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
							clear: none; ">
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Email - 
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<CFINPUT type=text name="A_Req_By_Email"  size=60 maxlength=160
							VALUE="#aaaa.A_Req_By_Email#"
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
							clear: none; ">
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						After Hours / Weekend Phone and Ext - 
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<CFINPUT type=text name="A_Req_By_After_Hours_Phone"  size=60 maxlength=160
							VALUE="#aaaa.A_Req_By_After_Hours_Phone#"
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
							clear: none; ">
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Managers Name -   
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<CFINPUT type=text name="A_Managers_Name"  size=60 maxlength=160
							VALUE="#aaaa.A_Managers_Name#"
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
							clear: none; ">
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Managers Phone  -   
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<CFINPUT type=text name="A_Managers_Phone"  size=35 maxlength=50
							VALUE="#aaaa.A_Managers_Phone#"
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
							clear: none; ">
						</td>
					</tr>
				<!--- ============================================================== --->
			</table>

				<p><font face=verdana size=2 color=black>
				When will the Package be ready :<br> 
				<TEXTAREA name="A_When_Pkg_Will_Be_Ready"  COLS=110 ROWS=8
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
					clear: none;">#aaaa.A_When_Pkg_Will_Be_Ready#</TEXTAREA>
					<p><font face=verdana size=2 color=black>
				How will package be shipped  - <font face=verdana size=1 color=green>(Email / Internet / Overnight / Other)
				<br>				
				<CFINPUT type=text name="A_How_Will_Be_Shipped"  size=35 maxlength=50
						VALUE="#aaaa.A_How_Will_Be_Shipped#"
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
				clear: none; ">
				<p>		<font face=verdana size=2 color=black>			
				Special Instructions :<br> 
				<TEXTAREA name="A_Special_Inst"  COLS=110 ROWS=8
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
					clear: none;">#aaaa.A_Special_Inst#</TEXTAREA>
					<p>
			</td>
		</tr>
	</table>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=right valign=top bgcolor=e1e1e1>
				<INPUT type=image src="./images/button_modify.gif" border=0>
			</td>
		</tr>
	</table>
</CFOUTPUT>
</CFFORM>

<CFFORM NAME="frm" ACTION="./Title_Closing_Order_Request.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&Title_Ins_Co_Is=#Title_Ins_Co_Is#&A_Update_DB_Flag=5" METHOD=POST>
<CFOUTPUT>
<input type=hidden name="Job_Number" VALUE="#aaaa.Job_Number#">
<input type=hidden name="A_Req_Date" VALUE="#aaaa.A_Req_Date#">
<input type=hidden name="A_Req_Time" VALUE="#aaaa.A_Req_Time#">
<input type=hidden name="A_Req_Closing_Date" VALUE="#aaaa.A_Req_Closing_Date#">
<input type=hidden name="A_Req_Closing_Time" VALUE="#aaaa.A_Req_Closing_Time#">
<input type=hidden name="A_Settle_Location" VALUE="#aaaa.A_Settle_Location#">
<input type=hidden name="A_Requested_By" VALUE="#aaaa.A_Requested_By#">
<input type=hidden name="A_Req_By_Title" VALUE="#aaaa.A_Req_By_Title#">
<input type=hidden name="A_Req_By_Company" VALUE="#aaaa.A_Req_By_Company#">
<input type=hidden name="A_Req_By_Phone" VALUE="#aaaa.A_Req_By_Phone#">
<input type=hidden name="A_Req_By_Ext" VALUE="#aaaa.A_Req_By_Ext#">
<input type=hidden name="A_Req_By_Fax" VALUE="#aaaa.A_Req_By_Fax#">
<input type=hidden name="A_Req_By_Email" VALUE="#aaaa.A_Req_By_Email#">
<input type=hidden name="A_Req_By_After_Hours_Phone" VALUE="#aaaa.A_Req_By_After_Hours_Phone#">
<input type=hidden name="A_Managers_Name" VALUE="#aaaa.A_Managers_Name#">
<input type=hidden name="A_Managers_Phone" VALUE="#aaaa.A_Managers_Phone#">
<input type=hidden name="A_When_Pkg_Will_Be_Ready" VALUE="#aaaa.A_When_Pkg_Will_Be_Ready#">
<input type=hidden name="A_How_Will_Be_Shipped" VALUE="#aaaa.A_How_Will_Be_Shipped#">
<input type=hidden name="A_Special_Inst" VALUE="#aaaa.A_Special_Inst#">
</CFOUTPUT>
	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=right valign=top bgcolor=e1e1e1>
				<INPUT type=image src="./images/button_mark_as_sent.gif" border=0>
			</td>
		</tr>
	</table>	
</CFFORM>
	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=1 color=red>
				<img src="./images/arrow_blue_up.gif"><br>
				If you made changes to the form above, you must first click the MODIFY Button.<br>
				Then, when the page reloads, you can click on the MARK AS SENT button.
			</td>
		</tr>
	</table>	
	





			</td>
		</tr>		
</table>
			</td>
		</tr>		
</table>

	
<p>
<p>


<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->

</td>
</tr>

	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
	
	
	