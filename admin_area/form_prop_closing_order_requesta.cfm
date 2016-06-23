<CFPARAM NAME="a_direction" DEFAULT="">
<CFPARAM NAME="Insurance_Company" DEFAULT="">
<CFPARAM NAME="Title_Ins_Co_Is" DEFAULT="0">
<!--- <CFPARAM NAME="Job_number" DEFAULT="0"> --->
<CFPARAM NAME="A_Update_DB_Flag" DEFAULT="0">
<CFPARAM NAME="N_Note_1" DEFAULT="2">


 <!--- <CFQUERY datasource="#request.dsn#" NAME="read_user">
		SELECT *
		FROM first_admin
		WHERE ID = '#URL.uid#'
		
	</CFQUERY>  --->
<CFQUERY datasource="#request.dsn#" NAME="get_title">
		
			SELECT *
			FROM Property
			WHERE prop_ID = #rec_ID#

		
		
		</cfquery>
			<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		SELECT company
		FROM companies
		WHERE id = #get_title.comp_id#
		
	</CFQUERY>

		<!--- ===/ If the A_Update_DB_Flag is GT 0   \=== --->
		<!--- ===/ then we need to update the proper \=== --->
		<!--- ===/ Table with the data from the form \=== --->
		


		<CFIF #A_Update_DB_Flag# EQ "2">

			
		<CFQUERY datasource="#request.dsn#" NAME="read_title">
		
			SELECT *
			FROM Property
			WHERE prop_ID = #rec_ID#

		
		
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
					FROM Title_Closing_Order_Request_Prop
					Where Prop_Id = #rec_id#
				</CFQUERY>			
				<CFOUTPUT>
<CFSET A_req_closing_date = '#comfirm_day#-#confirm_mon#-#confirm_year#'>

</CFOUTPUT>
			<CFQUERY datasource="#request.dsn#">		
				UPDATE Title_Closing_Order_Request_Prop
				SET	<!--- Job_Number 				 =  #Job_Number#, --->
					
					A_Req_Closing_Day   	 = '#comfirm_Day#',
					A_Req_Closing_Time		 = '#A_Req_Closing_Time#',
					A_Req_Closing_month		 = '#confirm_mon#',
					A_Req_Closing_year		 = '#confirm_year#',
					A_Settle_Location		 = '#A_Settle_Location#',
				
					 request_date  		= '#FORM.confirm_year##FORM.confirm_mon##FORM.comfirm_day#',
					A_Req_By_Company 		 = '#A_Req_By_Company#',
					A_Req_By_Phone 			 = '#A_Req_By_Phone#',
					A_Req_By_Ext 			 = '#A_Req_By_Ext#',
					A_Req_By_Fax 			 = '#A_Req_By_Fax#',
					A_Req_By_Email 			 = '#A_Req_By_Email#',
					A_Req_By_After_Hours_Phone = '#A_Req_By_After_Hours_Phone#',
					A_Managers_Name 		 = '#A_Managers_Name#',
					A_Managers_Phone		 = '#A_Managers_Phone#',
					<!--- A_When_Pkg_Will_Be_Ready = '#A_When_Pkg_Will_Be_Ready#', --->
					A_How_Will_Be_Shipped	 = '#A_How_Will_Be_Shipped#',
					
						
						a_filled_out_date        = '#DateFormat(Now(), "m/d/yyyy")#',
						a_filled_out_time        = '#TimeFormat(Now(), "HH:mm:ss")#',
					a_filled_out_by          = 1,
						A_Special_Inst			 = '#A_Special_Inst#'					
					
				WHERE Prop_ID = #rec_id#
			</CFQUERY>	
			
		</CFIF>

<CFQUERY datasource="#request.dsn#">		
				UPDATE Property
				SET	appraisal_status = 'Closing Requested'
				WHERE Prop_ID = #rec_id#
</cfquery>
	<!--- ======/ If the Mark as Sent button was selected \=== --->
	
		<CFIF #A_Update_DB_Flag# EQ "5">
<CFQUERY datasource="#request.dsn#" NAME="read_title">
		
			SELECT *
			FROM Property
			WHERE prop_ID = #rec_ID#
</cfquery>
			
				<CFQUERY datasource="#request.dsn#" NAME="bbb">		
					SELECT *
					FROM Title_Closing_Order_Request_Prop
					Where Prop_Id = #rec_id#
				</CFQUERY>			
				<CFSET A_req_closing_date = '#comfirm_day#-#confirm_mon#-#confirm_year#'>
			<CFQUERY datasource="#request.dsn#">		
				UPDATE Title_Closing_Order_Request_Prop
				SET	<!--- Job_Number 				 =  #Job_Number#, --->
					<!---  A_Req_Date 				 = '#c_insert_date#',
					A_Req_Time				 = '#c_insert_time#',  --->
					A_Req_Closing_Day   	 = '#comfirm_Day#',
					A_Req_Closing_Time		 = '#A_Req_Closing_Time#',
					A_Req_Closing_month		 = '#confirm_mon#',
					A_Req_Closing_year		 = '#confirm_year#',
					A_Settle_Location		 = '#A_Settle_Location#',
					request_date  		= '#FORM.confirm_year##FORM.confirm_mon##FORM.comfirm_day#',
					<!--- A_Requested_By 			 = '#A_Requested_By#', --->
					<!--- A_Req_By_Title  		 = '#A_Req_By_Title#', --->
					A_Req_By_Company 		 = '#A_Req_By_Company#',
					A_Req_By_Phone 			 = '#A_Req_By_Phone#',
					A_Req_By_Ext 			 = '#A_Req_By_Ext#',
					A_Req_By_Fax 			 = '#A_Req_By_Fax#',
					A_Req_By_Email 			 = '#A_Req_By_Email#',
					A_Req_By_After_Hours_Phone = '#A_Req_By_After_Hours_Phone#',
					A_Managers_Name 		 = '#A_Managers_Name#',
					A_Managers_Phone		 = '#A_Managers_Phone#',
					<!--- A_When_Pkg_Will_Be_Ready = '#A_When_Pkg_Will_Be_Ready#', --->
					A_How_Will_Be_Shipped	 = '#A_How_Will_Be_Shipped#',
					A_Special_Inst			 = '#A_Special_Inst#',
					a_sent_date        = '#DateFormat(Now(), "m/d/yyyy")#',
					a_sent_time     = '#TimeFormat(Now(), "HH:mm:ss")#',
					a_filled_out_date        = '#DateFormat(Now(), "m/d/yyyy")#',
						a_filled_out_time        = '#TimeFormat(Now(), "HH:mm:ss")#',
					
					a_filled_out_by          = 1
				
				
					<!--- a_sent_by          = #url.uid# --->
				WHERE Prop_ID = #rec_id#
			</CFQUERY>	
			
		</CFIF>
		<cfquery name="getorderinfo" datasource="#request.dsn#">
SELECT *
FROM Title_Closing_Order_Request_Prop
Where Prop_Id = #rec_id#
</cfquery>

	<!--- Read all of the Notes for this title --->
	
			<CFQUERY datasource="#request.dsn#" NAME="aaaa">		
				SELECT *
				FROM Title_Closing_Order_Request_Prop
				Where Prop_Id = #rec_id#
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
				FROM Property
				Where Prop_Id = #rec_id#
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
				<CENTER><B>Property Closing Order Request Form</B></CENTER>
			</TD>
		</TR>
	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>

		
	<p>
<center><b><font face=verdana size=2 color=blue> COMPLETE FORM BELOW TO REQUEST CLOSING</font></b></center>
<P>

<table width=700 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>


		<tr>
			<td width=700  align=right valign=top bgcolor=e1e1e1>



			
	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=d1d1d1>
			
		<tr>
			<td width=100 align=right valign=top bgcolor=d1d1d1>
				<font size=2 color=black face=arial>
				Date - Time - 
			</td>
			<td width=249 align=left valign=top bgcolor=d1d1d1>
				<font size=2 color=blue face=arial>
			<cfoutput>	<CFIF #a_filled# GT "0">
					<font size=2 color=blue face=arial><B>#aaaa.a_filled_out_date#</B> - <B>#aaaa.a_filled_out_time#</B></NOBR>				
				</CFIF></cfoutput>
			</td>
		
		</tr>
	</table>


<!---removed title Ins from the next line because Prop Orders do not have that --->
<CFFORM NAME="frm" ACTION="./form_prop_closing_request_reciept_admin.cfm?rec_id=#rec_id#&a_trigger=1&A_Update_DB_Flag=2" METHOD=POST>
<CFOUTPUT>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=right valign=top bgcolor=e1e1e1>
			<p>
			<br>
			<font face=verdana size=2 color=black>
			<NOBR>Order number -0232 <font face=verdana size=2 color=blue><B>#URL.rec_id#</B></font></NOBR>
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
<CFOUTPUT>
	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
	</table>
	
	

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
		
			
			<td width="30%" align=center valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Date Request
			</td>
			


<td width="70%" align=left valign=top bgcolor=e1e1e1>
<select name="confirm_mon"
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
								cols="45">
	 	<cfif #getorderinfo.a_req_closing_month# NEQ "">
		<option value="#getorderinfo.A_Req_Closing_month#" selected>#getorderinfo.A_Req_Closing_month#</option>
		<option value="01">01</option>
		<option value="02">02</option>
		<option value="03">03</option>
		<option value="04">04</option>
		<option value="05">05</option>
		<option value="06">06</option>
		<option value="07">07</option>
		<option value="08">08</option>
		<option value="09">09</option>
		<option value="10">10</option>
		<option value="11">11</option>
		<option value="12">12</option>
<cfelse>
<option value="">Month</option>

		
	   	<option value="01">January</option>
		<option value="02">February</option>
		<option value="03">March</option>
		<option value="04">April</option>
		<option value="05">May</option>
		<option value="06">June</option>
		<option value="07">July</option>
		<option value="08">August</option>
		<option value="09">September</option>
		<option value="10">October</option>
		<option value="11">November</option>
		<option value="12">December</option>
</cfif>

</select>

<select name="comfirm_day"
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
								cols="45">
	 	<cfif #getorderinfo.a_req_closing_day# NEQ "">
		<option value="#getorderinfo.A_Req_Closing_day#" selected>#getorderinfo.A_Req_Closing_day#</option>
		<cfelse>
		<OPTION VALUE="">Day</OPTION>
		</cfif>
		
		<OPTION VALUE="01">01</OPTION>
		<OPTION VALUE="02">02</OPTION>
		<OPTION VALUE="03">03</OPTION>
		<OPTION VALUE="04">04</OPTION>
		<OPTION VALUE="05">05</OPTION>
		<OPTION VALUE="06">06</OPTION>
		<OPTION VALUE="07">07</OPTION>
		<OPTION VALUE="08">08</OPTION>
		<OPTION VALUE="09">09</OPTION>
		<OPTION VALUE="10">10</OPTION>
		<OPTION VALUE="11">11</OPTION>
		<OPTION VALUE="12">12</OPTION>
		<OPTION VALUE="13">13</OPTION>
		<OPTION VALUE="14">14</OPTION>
		<OPTION VALUE="15">15</OPTION>
		<OPTION VALUE="16">16</OPTION>
		<OPTION VALUE="17">17</OPTION>
		<OPTION VALUE="18">18</OPTION>
		<OPTION VALUE="19">19</OPTION>
		<OPTION VALUE="20">20</OPTION>
		<OPTION VALUE="21">21</OPTION>
		<OPTION VALUE="22">22</OPTION>
		<OPTION VALUE="23">23</OPTION>
		<OPTION VALUE="24">24</OPTION>
		<OPTION VALUE="25">25</OPTION>
		<OPTION VALUE="26">26</OPTION>
		<OPTION VALUE="27">27</OPTION>
		<OPTION VALUE="28">28</OPTION>
		<OPTION VALUE="29">29</OPTION>
		<OPTION VALUE="30">30</OPTION>			
		<OPTION VALUE="31">31</OPTION>

</select>  

<select name="confirm_year"
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
								cols="45">
		<cfif #getorderinfo.a_req_closing_year# NEQ "">
		<option value="#getorderinfo.A_Req_Closing_year#" selected>#getorderinfo.A_Req_Closing_year#</option>
		<cfelse>
		<option value="">Year</option>
		</cfif>
	   	<option value="2000">2000</option>
		<option value="2001">2001</option>
		<option value="2002">2002</option>
		<option value="2003">2003</option>
		<option value="2004">2004</option>
		<option value="2005">2005</option>
		<option value="2006">2006</option>
		<option value="2007">2007</option>
		<option value="2008">2008</option>
		<option value="2009">2009</option>
		<option value="2010">2010</option>
		<option value="2011">2011</option>
		<option value="2012">2012</option>
		<option value="2013">2013</option>
		<option value="2014">2014</option>
		<option value="2015">2015</option>
<option value="2016">2016</option>
<option value="2017">2017</option>
<option value="2018">2018</option>
<option value="2019">2019</option>
<option value="2020">2020</option>
		</select>
		

</td></tr>

		<TR>
			<td width = "30%" align=center valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Time Request
			</td>
			
			<td width="70%" align=left valign=top bgcolor=e1e1e1>
			<SELECT name="a_req_closing_time"
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
								cols="45">
<cfif #getorderinfo.a_req_closing_time# NEQ "">
		<option value="#getorderinfo.A_Req_Closing_time#" selected>#getorderinfo.A_Req_Closing_time#</option>
		<cfelse>
		<option value="">
		</cfif>
<option value="">
<option value="08:00 am">8:00 am
<option value="08:30 am">8:30 am
<option value="09:00 am">9:00 am
<option value="09:30 am">9:30 am
<option value="10:00 am">10:00 am
<option value="10:30 am">10:30 am
<option value="11:00 am">11:00 am
<option value="11:30 am">11:30 am
<option value="12:00 am">12:00 pm
<option value="12:30 am">12:30 pm
<option value="1:00 pm">1:00 pm
<option value="1:30 pm">1:30 pm
<option value="2:00 pm">2:00 pm
<option value="2:30 pm">2:30 pm
<option value="3:00 pm">3:00 pm
<option value="3:30 pm">3:30 pm
<option value="4:00 pm">4:00 pm
<option value="4:30 pm">4:30 pm
<option value="5:00 pm">5:00 pm
<option value="5:30 pm">5:30 pm
<option value="6:00 pm">6:00 pm
<option value="6:30 pm">6:30 pm
<option value="7:00 pm">7:00 pm
<option value="7:30 pm">7:30 pm
<option value="8:00 pm">8:00 pm
<option value="8:30 pm">8:30 pm
<option value="9:00 pm">9:00 pm
<option value="9:30 pm">9:30 pm
<option value="10:30 pm">10:30 pm
<option value="11:00 pm">11:00 pm
</SELECT>

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
			Location for Closing </td>
		<td width=410 align=left valign=top bgcolor=e1e1e1>
			
					<select name="A_Settle_Location"
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
								cols="45">
	 	<cfif #getorderinfo.a_req_closing_month# NEQ "">
		<option value="#getorderinfo.A_Settle_Location#">#getorderinfo.A_Settle_Location#</option>
		</cfif>
		<option value="address">Property Address</option>
		<option value="other">Other</option>
		
		
	</select>
			</td>
		</tr>
					
					 <tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Requesting Company -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<cfif #getorderinfo.A_Req_By_Company# NEQ "">
						<CFINPUT type=text name="A_Req_By_Company"  size=35 maxlength=100
							VALUE="#getorderinfo.A_Req_By_Company#"
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
						<cfelse>
						<CFINPUT type=text name="A_Req_By_Company"  size=35 maxlength=100
							VALUE="#read_comp.company#"
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
							</cfif>
						</td>
					</tr> 
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Phone -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<cfif #getorderinfo.A_Req_By_Phone# NEQ "">
						<CFINPUT type=text name="A_Req_By_Phone"  size=35 maxlength=50
							VALUE="#getorderinfo.A_Req_By_Phone#"
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
						<cfelse>
						<CFINPUT type=text name="A_Req_By_Phone"  size=35 maxlength=50
							VALUE="#read_title.pPhone#"
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
							</cfif>
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Phone Ext -
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<cfif #getorderinfo.A_Req_By_Ext# NEQ "">
						<CFINPUT type=text name="A_Req_By_Ext"  size=15 maxlength=50
							VALUE="#getorderinfo.A_Req_By_Ext#"
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
							<cfelse>
							<CFINPUT type=text name="A_Req_By_Ext"  size=15 maxlength=50
							VALUE="#read_title.pExt#"
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
							</cfif>
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Fax - 
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<cfif #getorderinfo.A_Req_By_Fax# NEQ "">
						<CFINPUT type=text name="A_Req_By_Fax"  size=35 maxlength=50
							VALUE="#getorderinfo.A_Req_By_Fax#"
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
						<cfelse>
						<CFINPUT type=text name="A_Req_By_Fax"  size=35 maxlength=50
							VALUE="#read_title.pFax#"
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
							</cfif>
						</td>
					</tr>
				<!--- ============================================================== --->
					<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
						<font face=verdana size=2 color=black>
						Email - 
						</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
						<cfif #getorderinfo.A_Req_By_Email# NEQ "">
						<CFINPUT type=text name="A_Req_By_Email"  size=60 maxlength=160
							VALUE="#getorderinfo.A_Req_By_Email#"
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
						<cfelse>
						<CFINPUT type=text name="A_Req_By_Email"  size=60 maxlength=160
							VALUE="#read_title.verifyemail#"
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
							</cfif>
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
						<tr>
						<td width=268 align=right valign=top bgcolor=e1e1e1>
				
					<p><font face=verdana size=2 color=black>
				How will package be shipped  - <font face=verdana size=1 color=green>
				<br>				
				</td>
						<td width=410 align=left valign=top bgcolor=e1e1e1>
							<select name="A_How_Will_Be_Shipped"
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
								cols="45">
	 	<cfif #getorderinfo.A_How_Will_Be_Shipped# NEQ "">
		<option value="#getorderinfo.A_Settle_Location#">#getorderinfo.A_How_Will_Be_Shipped#</option>
		</cfif>
		<option value="email">Email</option>
		<option value="internet">Internet</option>
		<option value="Overnight">Overnight</option>
		<option value="other">Other</option>
		
		
	</select></td>
					</tr>
			
			</table>
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
				<INPUT type=image src="./images/button_submit.gif" border=0>
			</td>
		</tr>
	</table>
</CFOUTPUT>
</CFFORM>

<CFFORM NAME="frm" ACTION="./form_prop_closing_order_request.cfm?rec_id=#rec_id#&a_trigger=1&A_Update_DB_Flag=5" METHOD=POST>
<CFOUTPUT>
<input type=hidden name="Job_Number" VALUE="#aaaa.Job_Number#">
<input type=hidden name="A_Req_Date" VALUE="#aaaa.A_Req_Date#">
<input type=hidden name="A_Req_Time" VALUE="#aaaa.A_Req_Time#">
<input type=hidden name="A_Req_Closing_Day" VALUE="#aaaa.A_Req_Closing_Day#">
<input type=hidden name="A_Req_Closing_month" VALUE="#aaaa.A_Req_Closing_month#">
<input type=hidden name="A_Req_Closing_year" VALUE="#aaaa.A_Req_Closing_year#">
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
</CFFORM>	
</BODY>
</HTML>
	

	