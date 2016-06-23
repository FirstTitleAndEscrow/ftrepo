<CFQUERY datasource="#request.dsn#" NAME="read_title">
		
			SELECT *
			FROM Title
			WHERE title_id = #URL.rec_id#

</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="read_ins_title">
		
			SELECT *
			FROM doc_title_insurance_title
			WHERE title_id = #URL.rec_id#

</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="read_tax_title">
		
			SELECT *
			FROM tax_cert_title
			WHERE title_id = #URL.rec_id#

</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="read_abstract_title">
		
			SELECT *
			FROM  doc_abstract_title
			WHERE title_id = #URL.rec_id#

</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="read_payoff_title">
		
			SELECT *
			FROM pay_off_lender_1_title
			WHERE title_id = #URL.rec_id#

</cfquery>
 <cfquery  datasource="#request.dsn#" name="closing_requested">
SELECT *
FROM Title_Closing_Order_Request
Where Title_Id = #URL.rec_id#
</cfquery> 

 <cfquery datasource="#request.dsn#" name="closing_assigned" >
SELECT *
FROM doc_closer_title
Where Title_Id = #URL.rec_id#
</cfquery>


<CFQUERY datasource="#request.dsn#" NAME="closing_submitted">		
				SELECT *
				FROM eventlist
				Where Title_Id = #URL.rec_id#
			</CFQUERY>
			
	<CFQUERY datasource="#request.dsn#" NAME="read_closer_data">
		
			SELECT DISTINCT a.title_id from closer_info a, title b
			
			 where a.title_id = #url.rec_id# AND a.title_id = b.title_id and a.closer_data is not null and b.e_status is null
		
</CFQUERY> 

	<CFQUERY datasource="#request.dsn#" NAME="read_abstractor_data">
		
			SELECT DISTINCT a.title_id from abstractor_info a, title b
			
			 where a.title_id = #url.rec_id# and a.abstract_data is not null and b.e_status is null
		
</CFQUERY> 

<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">
<html>
<head>
	<title>1st Title & Escrow, Inc. - Show Detailed Events Order</title>
</head>

<body leftmargin="0" topmargin="0" marginheight = "0" marginwidth = "0" bgcolor="elelel">
<table width=620 border="0" cellpadding="0" cellspacing="0"><tr><nobr><td colspan="2" align="center"valign=bottom><IMG height=1 src="./images/clear.gif" width=10><b><font size=2 color=red face=arial><IMG height=1 src="./images/clear.gif" width=30><cfoutput>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #datnow# - #timnow#</CFOUTPUT> (EST)</b></FONT></td></tr><br>

<TABLE WIDTH=620 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>
<TR><br>
<TD ALIGN=middle>
<FONT FACE=ARIAL COLOR="red" SIZE=4>Admin - Detailed Events</FONT><br><br>
<HR><CFOUTPUT>
  <!--- <center> <font face=verdana size=2 color=black> If you would like to modify this closing information click here
   <a href="./title_closing_info.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#get_id.title_id#"><img src="./images/button_modify.gif" border=0 ALT="Modify Closing info"></a>	
          </center>    --->           
</cfoutput>
</TD></TR>
<CFOUTPUT>
<center>
	<table width=620 cellpadding=1 cellspacing=1 border=1 bgcolor=e1e1e1>
		<tr>
			<td width=620 align=center valign=top bgcolor=e1e1e1>
			
			<font face=verdana size=2 color=black>
			<NOBR>Order number - <font face=verdana size=2 color=blue><B>T-#URL.rec_id#</B></font></NOBR>
			</td>
		</tr>
	

	
		<tr>
			<td width=110 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>1st Borrower Name: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=verdana size=2 color=blue>
			<B>#Read_Title.BFirstName1# #Read_Title.bminame1# &nbsp;&nbsp;#Read_Title.BLastName1#</B></NOBR>
			</td>
			
		</tr>
			
		
		<tr>
			<td width=110 align=center valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>2nd Borrower Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=verdana size=2 color=blue>
			<B>#Read_Title.BFirstName2# #Read_Title.bminame2# &nbsp;&nbsp;#Read_Title.BLastName2#</B></NOBR>
			</td>
			
			
		</tr>
	

	
		<tr>
			<td width=110 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<center><NOBR>State - <font face=verdana size=2 color=blue><b>#Read_Title.pstate#</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;City - <font face=verdana size=2 color=blue><b> #Read_Title.pcity#</b></font>&nbsp;&nbsp;&nbsp;<font face=verdana size=2 color=blue><b>#Read_Title.pzip#</b></font></NOBR></center>
			</td>
		</tr>
	

	
</center>
</CFOUTPUT>

</table>
<center>
<table width=620 cellpadding=1 cellspacing=1 border=1 bgcolor=e1e1e1>

 <cfoutput>

<tr>
	<td width=620 colspan = "2" align=center valign=top bgcolor=d3d3d3><font size=2 face=arial><b>Title Information</font></b> </td>
</tr>


		<tr>
			
			<td width="30%" align=center valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Abstractor Assigned?
			</td>
			 <td width="70%" align=left valign=top bgcolor=e1e1e1>
<cfif #read_abstract_title.a_assigned_by# GT "">
<font face=verdana color="BlUE" size="2"><b><i>YES</i></b></font>
<CFELSE>
<font face=verdana color="BlUE" size="2"><b><i>NO</i></b></font>
</CFIF>
</td></tr>
<TR>
<td width = "30%" align=center valign=top bgcolor=e1e1e1>
	<font face=verdana size=2 color=black>
	Abstract Received?
</td>

<td width="70%" align=left valign=top bgcolor=e1e1e1><font size=2 face=arial>
<cfif #read_abstract_title.a_recieved_by# GT "">
<font face=verdana color="Blue" size="2"><b><i>YES</i></b> </font>		
<CFELSE>
<font face=verdana color="BlUE" size="2"><i><b>NO</b></i></font>
</CFIF>

</td>
		</tr>

	<TR>
<td width = "30%" align=center valign=top bgcolor=e1e1e1>
	<font face=verdana size=2 color=black>
	Payoffs ordered?
</td>

<td width="70%" align=left valign=top bgcolor=e1e1e1><font size=2 face=arial>
<cfif #read_payoff_title.a_assigned_by# GT "">
<font face=verdana color="Blue" size="2"><b><i>YES</i></b> </font>		
<CFELSE>
<font face=verdana color="BlUE" size="2"><i><b>NO</b></i></font>
</CFIF>

</td>
		</tr>
		<TR>
<td width = "30%" align=center valign=top bgcolor=e1e1e1>
	<font face=verdana size=2 color=black>
	Payoffs Received?
</td>

<td width="70%" align=left valign=top bgcolor=e1e1e1><font size=2 face=arial>
<cfif #read_payoff_title.a_assigned_by# GT "">
<font face=verdana color="Blue" size="2"><b><i>YES</i></b> </font>		
<CFELSE>
<font face=verdana color="BlUE" size="2"><i><b>NO</b></i></font>
</CFIF>

</td>
		</tr>
		<TR>
<td width = "30%" align=center valign=top bgcolor=e1e1e1>
	<font face=verdana size=2 color=black>
	Title Insurane completed?
</td>

<td width="70%" align=left valign=top bgcolor=e1e1e1><font size=2 face=arial>
<cfif #read_ins_title.s_status# GT "0">
<font face=verdana color="Blue" size="2"><b><i>YES</i></b> </font>		
<CFELSE>
<font face=verdana color="BlUE" size="2"><i><b>NO</b></i></font>
</CFIF>

</td>
		</tr>
	
		
	<TR>
<td width = "30%" align=center valign=top bgcolor=e1e1e1>
	<font face=verdana size=2 color=black>
	Tax Cert Completed?
</td>

<td width="70%" align=left valign=top bgcolor=e1e1e1><font size=2 face=arial>
<cfif #read_tax_title.taxes_completed# GT "0">
<font face=verdana color="Blue" size="2"><b><i>YES</i></b> </font>		
<CFELSE>
<font face=verdana color="BlUE" size="2"><i><b>NO</b></i></font>
</CFIF>

</td>
		</tr>
			</tr>
	<TR>
<td width = "30%" align=center valign=top bgcolor=e1e1e1>
	<font face=verdana size=2 color=black>
	ICL completed?
</td>

<td width="70%" align=left valign=top bgcolor=e1e1e1><font size=2 face=arial>
<cfif (#read_title.request_icl# eq 'Yes') and (#read_title.icl_upload# GT "" or #read_title.icl_upload2# GT "")>
<font face=verdana color="Blue" size="2"><b><i>YES</i></b> </font>		
<CFELSE>
<font face=verdana color="BlUE" size="2"><i><b>NO</b></i></font>
</CFIF>

</td>
		</tr>
	
	</tr>
	<TR>
<td width = "30%" align=center valign=top bgcolor=e1e1e1>
	<font face=verdana size=2 color=black>
	Files sent from Abstractor?
</td>

<td width="70%" align=left valign=top bgcolor=e1e1e1><font size=2 face=arial>
 	
<cfif (#read_title.e_status# EQ "") and (#read_abstract_title.abstract_upload1# GT "" or #read_abstract_title.abstract_upload2# GT "" or #read_abstract_title.abstract_upload3# GT "")>
<font face=verdana color="Blue" size="2"><b><i>YES</i></b> </font>		
<CFELSE>
<font face=verdana color="BlUE" size="2"><i><b>NO</b></i></font>
</CFIF>

</td>
		</tr>
		<TR>
<td width = "30%" align=center valign=top bgcolor=e1e1e1>
	<font face=verdana size=2 color=black>
	Data sent by Abstractor?
</td>

<td width="70%" align=left valign=top bgcolor=e1e1e1><font size=2 face=arial>
 	
<cfif #read_abstractor_data.recordcount# GT "0">
<font face=verdana color="Blue" size="2"><b><i>YES</i></b> </font>		
<CFELSE>
<font face=verdana color="BlUE" size="2"><i><b>NO</b></i></font>
</CFIF>

</td>
		</tr>
		
		
</table>
</cfoutput>

<center>
<table width=620 cellpadding=1 cellspacing=1 border=1 bgcolor=e1e1e1>

 <cfoutput>

<tr>
	<td width=620 colspan = "2" align=center valign=top bgcolor=d3d3d3><font size=2 face=arial><b>Closing Information</font></b> </td>
</tr>


		<tr>
			
			<td width="30%" align=center valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing  Requested?
			</td>
			 <td width="70%" align=left valign=top bgcolor=e1e1e1>
<cfif #closing_requested.a_filled_out_date# GT "">
<font face=verdana color="BlUE" size="2"><b><i>YES</i></b></font>
<CFELSE>
<font face=verdana color="BlUE" size="2"><b><i>NO</i></b></font>
</CFIF>
</td></tr>
<TR>
<td width = "30%" align=center valign=top bgcolor=e1e1e1>
	<font face=verdana size=2 color=black>
	Closer Assigned?
</td>

<td width="70%" align=left valign=top bgcolor=e1e1e1><font size=2 face=arial>
<cfif #closing_assigned.a_assigned_by# GT "">
<font face=verdana color="Blue" size="2"><b><i>YES</i></b> </font>		
<CFELSE>
<font face=verdana color="BlUE" size="2"><i><b>NO</b></i></font>
</CFIF>

</td>
		</tr>

	<TR>
<td width = "30%" align=center valign=top bgcolor=e1e1e1>
	<font face=verdana size=2 color=black>
	Closing Submitted?
</td>

<td width="70%" align=left valign=top bgcolor=e1e1e1><font size=2 face=arial>
<cfif #closing_submitted.c_month# GT "">
<font face=verdana color="Blue" size="2"><b><i>YES</i></b> </font>		
<CFELSE>
<font face=verdana color="BlUE" size="2"><i><b>NO</b></i></font>
</CFIF>

</td>
		</tr>
		<TR>
<td width = "30%" align=center valign=top bgcolor=e1e1e1>
	<font face=verdana size=2 color=black>
	Loan Closed?
</td>

<td width="70%" align=left valign=top bgcolor=e1e1e1><font size=2 face=arial>
<cfif #read_title.appraisal_status# EQ 'Loan Closed'>
<font face=verdana color="Blue" size="2"><b><i>YES</i></b> </font>		
<CFELSE>
<font face=verdana color="BlUE" size="2"><i><b>NO</b></i></font>
</CFIF>

</td>
		</tr>
		
		<TR>
<td width = "30%" align=center valign=top bgcolor=e1e1e1>
	<font face=verdana size=2 color=black>
	Files sent by Closer?
</td>

<td width="70%" align=left valign=top bgcolor=e1e1e1><font size=2 face=arial>

<cfif (#read_title.e_status# eq "") AND (#closing_assigned.closer_upload# GT "")>
<font face=verdana color="Blue" size="2"><b><i>YES</i></b> </font>		
<CFELSE>
<font face=verdana color="BlUE" size="2"><i><b>NO</b></i></font>
</CFIF>

</td>
		</tr>
		
		<TR>
<td width = "30%" align=center valign=top bgcolor=e1e1e1>
	<font face=verdana size=2 color=black>
	Data sent by Closer?
</td>

<td width="70%" align=left valign=top bgcolor=e1e1e1><font size=2 face=arial>
<cfif #read_closer_data.recordcount# GT "0">
<font face=verdana color="Blue" size="2"><b><i>YES</i></b> </font>		
<CFELSE>
<font face=verdana color="BlUE" size="2"><i><b>NO</b></i></font>
</CFIF>

</td>
		</tr>
			
	</cfoutput>

</table></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></NOBR>

</body>
</html>
