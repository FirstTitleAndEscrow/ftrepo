
<CFPARAM NAME="a_direction" DEFAULT="">
<CFPARAM NAME="Insurance_Company" DEFAULT="">
<CFPARAM NAME="Title_Ins_Co_Is" DEFAULT="0">
<CFPARAM NAME="A_Update_DB_Flag" DEFAULT="0">
<CFPARAM NAME="N_Note_1" DEFAULT="2">




	<!--- Read all of the Notes for this title --->
	
			<CFQUERY datasource="#request.dsn#" NAME="aaaa">		
				SELECT *
				FROM Title_Closing_Order_Request_Prop
				Where Prop_Id = '#URL.rec_id#'
			</CFQUERY>




			<CFQUERY datasource="#request.dsn#" NAME="Read_Title">		
				SELECT *
				FROM Property
				Where Prop_Id = '#URL.rec_id#'
			</CFQUERY>



<!--- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER> --->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="#ffffff" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

<CENTER>
<CENTER>
<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="gray">
	<tr>
		<td width=830 align=middle valign=top>
		
<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="white">
	<tr>
		<td width=830 align=middle valign=top bgcolor=e1e1el>




<!--- 	<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm"> --->

<table width=700 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=700 align=center valign=top>
		
<table width=700 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width=700 align=left valign=top bgcolor=d1d1d1>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Property Closing Order Request Form</B></CENTER>
			<br>
				<CFOUTPUT>
  <center> <font face=verdana size=2 color=black> 
To modify this Closing Information click <a href="./form_prop_closing_order_requesta.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#read_title.prop_id#"><img src="./images/button_modify.gif" border=0 ALT="Modify Closing info"></a> 
          </center>   <br>           
</cfoutput>
			</TD>
		</TR>
	<tr>
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
				<!--- ============================================================== --->
			</table>

			
				
				<font face=verdana size=2 color=black>			
				Special Instructions :<br> 
				<PRE><font face=verdana size=2 color=blue><B>#aaaa.A_Special_Inst#</B></PRE>

			</td>
		</tr>
	</table>


</CFOUTPUT>

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=699 align=center valign=top bgcolor=e1e1e1>
				<p>
				<br>
				<p>
				<br>
				<p>
				<br>
				<p>
				<font size=2 color=black face=verdana>
				Papermaster & Weltman, First Title & Escrow/American Title Services<br>
				301.279.0303 ~ Fax 301.279.7930<br>
				www.FirstTitleServices.com
				
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
	
	
	