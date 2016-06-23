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
						<CENTER><B>Title Closing Order Reschedule Form</B></CENTER>
					</TD>
				</TR>
				<tr>
					<td width=790 align=center valign=top bgcolor=e1e1e1>
						<p>
						<center><b><font face=verdana size=2 color=blue> COMPLETE FORM BELOW TO RESCHEDULE CLOSING</font></b></center>
						<P>
						<table width=700 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
							<tr>
								<td width=700  align=right valign=top bgcolor=e1e1e1>
									<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=d1d1d1>
									</table>
<CFFORM NAME="frm" ACTION="./form_title_closing_order_reschedule_confirm.cfm?rec_id=#rec_id#&uid=#url.uid#" METHOD=POST>
	<CFOUTPUT>
									<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
										<tr>
											<td width=699 align=right valign=top bgcolor=e1e1e1>
												<p>
												<br>
												<font face=verdana size=2 color=black>
												<NOBR>Order number - <font face=verdana size=2 color=blue>
												<B>#URL.rec_id#</B>
												</font>
												</NOBR>
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
											<td>
												<Input type="radio" Name="Resched" Value="1" 
													>A. Postponed, Original Fee
											</td>
											<td>
												<Input type="radio" Name="Resched" Value="2" 
													>B.  Rescheduled, Additional Fee
											</td>
											<td>
												<Input type="radio" Name="Resched" Value="3" 
													>C.  Cancel, no fee at all
											</td>
										</tr>
										<tr>
										<td colspan="3"><font face=verdana size=1 color=blue align=left><br>
										By selecting option B you will be adding an additional charge to the HUD-1.<br>The charges are $250 for a lawyer state or $125 for a non-lawyer state.<br>
										If you select option C the Order will be canceled.</font>
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

			</td>
		</tr>		
</table>
			</td>
		</tr>		
</table>

	
<p>
<p>

</td>
</tr>

	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
	

	