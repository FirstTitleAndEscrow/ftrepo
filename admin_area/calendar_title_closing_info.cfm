<cfquery name="get_id" datasource="#request.dsn#">
SELECT *
FROM Title
Where Title_Id = #url.rec_id#
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="Read_Title">		
				SELECT *
				FROM Title
				Where Title_Id = #get_id.title_id#
			</CFQUERY>
<!--- <cfquery name="getorderinfo" datasource="#request.dsn#">
SELECT *
FROM Title_Closing_Order_Request
Where Title_Id = #get_id.title_id#
</cfquery> --->
<cfquery name="get_name" datasource="#request.dsn#">
select *
from title 
where title_id = #get_id.title_id#
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="aaaa">		
				SELECT *
				FROM eventlist
				Where Title_Id = #get_id.title_id#
			</CFQUERY>

<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">
<html>
<head>
	<title>1st Title & Escrow, Inc. - Show Detail Order</title>
</head>

<body leftmargin="0" topmargin="0" marginheight = "0" marginwidth = "0" bgcolor="elelel">
<table width=620 border="0" cellpadding="0" cellspacing="0"><tr><nobr><td colspan="2" align="center"valign=bottom><IMG height=1 src="./images/clear.gif" width=10><b><font size=2 color=red face=arial><IMG height=1 src="./images/clear.gif" width=30><cfoutput>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #datnow# - #timnow#</CFOUTPUT> (EST)</b></FONT></td></tr><br>

<TABLE WIDTH=620 BORDER=1 CELLSPACING=1 align="center" bgcolor=d3d3d3>
                <TBODY>
<TR><br>
<TD ALIGN=middle>
<FONT FACE=ARIAL COLOR="red" SIZE=4>Admin - Individual Closing</FONT>
<HR>
                         
</TD></TR>
<CFOUTPUT>
<center>
	<table width=620 cellpadding=1 cellspacing=1 border=1 bgcolor=e1e1e1>
		<tr>
			<td width=620 align=center valign=top bgcolor=e1e1e1>
			
			<font face=verdana size=2 color=black>
			<NOBR>Order number - <font face=verdana size=2 color=blue><B>#Read_Title.title_id#</B></font></NOBR>
			</td>
		</tr>
	

	
		<tr>
			<td width=110 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>1st Borrower Name: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=verdana size=2 color=blue>
			<B>#Read_Title.BFirstName1# #Read_Title.bminame1# &nbsp;&nbsp;#Read_Title.BLastName1#</B><cfif #Read_Title.Bhphone1# neq "">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone: <font face=verdana size=2 color=blue><B>#Read_Title.Bhphone1#</b></cfif></NOBR>
			</td>
			
		</tr>
			
		
		<tr>
			<td width=110 align=center valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>2nd Borrower Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face=verdana size=2 color=blue>
			<B>#Read_Title.BFirstName2# #Read_Title.bminame2# &nbsp;&nbsp;#Read_Title.BLastName2#</B><cfif #Read_Title.Bhphone2# neq "">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone: <font face=verdana size=2 color=blue><B>#Read_Title.Bhphone2#</b></cfif></NOBR>
			</td>
			
			
		</tr>
	

	
		<tr>
			<td width=620 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<center><NOBR>Address - <font face=verdana size=2 color=blue><b>#Read_Title.pADDRESS#</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;City - <font face=verdana size=2 color=blue><b> #Read_Title.pcity#</b></font>&nbsp;&nbsp;&nbsp;<font face=verdana size=2 color=blue><b>#Read_Title.pzip#</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;State - <font face=verdana size=2 color=blue><b>#Read_Title.pstate#</b></font></NOBR></center>
			</td>
		</tr>
	

		<!--- <tr>
			<td width=620 align=right valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<center><NOBR>Job number - <font face=verdana size=2 color=blue><B> #getorderinfo.Job_Number#</B></NOBR></center>
			</td>
		</tr> --->
	
</center>
</CFOUTPUT>

</table>
<center>
<table width=620 cellpadding=1 cellspacing=1 border=1 bgcolor=e1e1e1>

<cfoutput query = get_name>
<form action="./calendar_update_title_closing.cfm?rec_id=#rec_id#&a_trigger=1&comp_id=#read_title.comp_ID#" method="post">
<input type="hidden" name="rec_id" value="#rec_id#">
<input type="hidden" name="title_id" value="#get_id.title_id#">
<input type="hidden" name="verifyemail" value="#get_name.verifyemail#">
<input type="hidden" name="blastname1" value="#get_name.blastname1#"><br>
<input type="hidden" name="bfirstname1" value="#get_name.bfirstname1#">
<tr>
	<td width=620 colspan = "2" align=center valign=top bgcolor=d3d3d3><font size=2 face=arial><b>Closing Information</font></b> </td>
</tr>



	
	
		<tr>
			
			<td width="30%" align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Date Assign
			</td>
			 <td width="70%" align=left valign=top bgcolor=e1e1e1>

<select name="confirm_mon">
	 	<Cfif #aaaa.recordcount# GT "0">
<Cfif #aaaa.c_month# NEQ "10" or #aaaa.c_month# NEQ "11" or #aaaa.c_month# NEQ "12">
<option value="#aaaa.c_month#" selected>0#aaaa.c_month#
<cfelse>
<option value="#aaaa.c_month#" selected>#aaaa.c_month#
</cfif>
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

<select name="comfirm_day">
<Cfif #aaaa.recordcount# GT "0">
<Cfif (#aaaa.c_day# EQ "10") or (#aaaa.c_day# EQ "11") or (#aaaa.c_day# EQ "12")or (#aaaa.c_day# EQ "13")
or (#aaaa.c_day# EQ "14")or (#aaaa.c_day# EQ "15")or (#aaaa.c_day# EQ "16") or (#aaaa.c_day# EQ "17")
or (#aaaa.c_day# EQ "18")or (#aaaa.c_day# EQ "19")or (#aaaa.c_day# EQ "20")or (#aaaa.c_day# EQ "21")
or (#aaaa.c_day# EQ "22")or (#aaaa.c_day# EQ "23")or (#aaaa.c_day# EQ "24")or (#aaaa.c_day# EQ "24")
or (#aaaa.c_day# EQ "25")or (#aaaa.c_day# EQ "26")or (#aaaa.c_day# EQ "27")or (#aaaa.c_day# EQ "28")
or (#aaaa.c_day# EQ "29")or (#aaaa.c_day# EQ "30")or (#aaaa.c_day# EQ "31")>
<option value="#aaaa.c_day#" selected>#aaaa.c_day#
<cfelse>
<option value="#aaaa.c_day#" selected>0#aaaa.c_day#
</cfif>
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
<select name="confirm_year">
		<Cfif #aaaa.recordcount# GT "0">
<option value="#aaaa.c_year#" selected>#aaaa.c_year#
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

<!--- <BR><font color="Blue" size="2"><i>requested: #getorderinfo.A_Req_Closing_month#/#getorderinfo.A_Req_Closing_day#/#getorderinfo.A_Req_Closing_year#</i> </font>	 --->
</td></tr>
<TR>
			<td width = "30%" align=right valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Time Assign
			</td>

	
	 <td width="70%" align=left valign=top bgcolor=e1e1e1><font size=2 face=arial>
<SELECT name="confirm_time">
<Cfif #aaaa.recordcount# GT "0">
<option value="#aaaa.c_Time#" selected>#aaaa.C_Time#
<cfelse>
<option value="">Time</option>
</cfif>
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
<!--- <BR><font color="Blue" size="2"><i>requested: #getorderinfo.A_Req_Closing_Time#</i> </font> --->		


</td>
		</tr>
</table></center>
	<center>	
	<table width=620 cellpadding=1 cellspacing=1 border=1 bgcolor=e1e1e1>

<tr>
	<td width="30%" align=right valign=middle bgcolor=e1e1e1><font size=2 face=arial>Info</font> </td>
	 <td width="70%" align=center valign=top bgcolor=e1e1e1><font size=2 face=arial>
	<TEXTAREA name="comments"  COLS=110 ROWS=8
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
					clear: none;">#aaaa.c_comment#</TEXTAREA>
					<p>

</tr>

</table></center>





</CFOUTPUT>



<!---button for property report--->

<cfoutput>
<table border=0 align=center width=455 bgcolor=elelel>
                            <TBODY>

<tr><td valign="center" align="center">
<input type="submit" name="update" value="Update & Email Closing Info.">
<!---<input type="hidden" name="title_id" value="#getorderinfo.title_id#">
<input type="hidden" name="verifyemail" value="#get_name.verifyemail#">
 <input type="hidden" name="blastname1" value="#get_name.blastname1#"><br>
<input type="hidden" name="bfirstname1" value="#get_name.bfirstname1#"> --->
</td>
</form>
</tr>
</CFOUTPUT>


</table></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></NOBR>

</body>
</html>
