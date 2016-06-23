<CFQUERY datasource="#request.dsn#" NAME="read_title">
		
			SELECT *
			FROM ancillary
			WHERE anc_id = #URL.rec_id#

</cfquery>

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
			<NOBR>Order number - <font face=verdana size=2 color=blue><B>ANC-#URL.rec_id#</B></font></NOBR>
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

 

</table></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></NOBR>

</body>
</html>
