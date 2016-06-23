<cfquery name="get_closing" datasource="#request.dsn#">
select * from Title_Closing_Order_Request_Prop
where prop_id = #URL.rec_id#
</cfquery>

<cfquery name="get_closer" datasource="#request.dsn#">
select * from Doc_closer_Prop
where prop_id = #URL.rec_id#
</cfquery>

<cfquery datasource="#request.dsn#" name="getuser">

select * from first_admin
where id = #url.uid#
</cfquery>

<cfquery name="get_id" datasource="#request.dsn#">
SELECT *
FROM Property
Where Prop_Id = #URL.rec_id#
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="Read_Title">		
				SELECT *
				FROM Property
				Where Prop_Id = #URL.rec_id#
			</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_comp_id">
	SELECT team_id from companies where id = #read_title.comp_id#
</CFQUERY>
<cftry>
<cfinvoke component = "cfc.team_info"	method = "getTeamEmail"	returnVariable = "team_email" team_id="#read_comp_id.team_id#">
<cfcatch type="Any">
		<cfoutput>
		<cfmail from="rjermain@firsttitleservices.com" to="rjermain@firsttitleservices.com" subject="Team Email Failure">
		<hr>
			<h1>Other Error: #cfcatch.Type#</h1>
			<ul>
				<li><b>Message:</b> #cfcatch.Message#
				<li><b>Detail:</b> #cfcatch.Detail#
				<li><B>Page:</B> #GetBaseTemplatePath()#
			</ul>
		</cfmail>
        </cfoutput>
	</cfcatch>
</cftry>


 <cfquery name="getorderinfo" datasource="#request.dsn#">
SELECT *
FROM Title_Closing_Order_Request_Prop
Where Prop_Id = #get_id.Prop_id#
</cfquery> 
<cfquery name="get_name" datasource="#request.dsn#">
select *
from Property
where prop_id = #get_id.prop_id#
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="aaaa">		
				SELECT *
				FROM eventlist
				Where prop_Id = #URL.rec_id#
			</CFQUERY>


<cfquery name="get_order" datasource="#request.dsn#">
select * from Property
where prop_id = #URL.rec_id#
</cfquery>

<cfif (#get_closing.a_filled_out_date# NEQ "") and (#get_closer.a_assigned_by# GT "0")>

<cfquery name="get_comp" datasource="#request.dsn#">
select * from companies
where id = #get_order.comp_id#
</cfquery>

<cfquery name="get_list" datasource="#request.dsn#">
select * from eventlist

where prop_id = #get_order.prop_id#
</cfquery>
<cfoutput>
<CFSET yourDate = CreateDate(FORM.confirm_year, FORM.confirm_mon, FORM.comfirm_day)>
</cfoutput>
<CFSET order_date_adj = '#DateFormat(yourDate, "mm/dd/yyyy")# #TimeFormat(form.confirm_time, "HH:mm:ss")#'>

<cfquery name="updateclosing" datasource="#request.dsn#">
update eventlist
	set 
	b_fname= '#get_order.bfirstname1#',
	b_lname = '#get_order.blastname1#',
	yearmonthday = '#FORM.confirm_year##FORM.confirm_mon##FORM.comfirm_day#',
	yearmonth = '#FORM.confirm_year##FORM.confirm_mon##FORM.comfirm_day#',
	s_date = '#DateFormat(Now(), "m/d/yyyy")#',
	s_time = '#TimeFormat(Now(), "HH:mm:ss")#',
	closing_date = '#DateFormat(Now(), "m/d/yyyy")#',
	sc_dateandtime = '#order_date_adj#',
	c_Day = '#form.comfirm_day#',
	c_month = '#form.confirm_mon#',
	c_year = '#form.confirm_year#',
	c_Time = '#form.confirm_time#',	
	fee = '#fee#',	
	c_comment = '#form.comments#',	
	comp_id = #get_order.comp_id#,
	company = '#get_comp.company#',
	UserID = #getuser.ID#
where prop_id = #URL.rec_id#
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="comments">		
				SELECT *
				FROM eventlist
				Where prop_Id = #URL.rec_id#
			</CFQUERY>
<cfquery name="updateclosing" datasource="#request.dsn#">
	update Property
	set 
	Appraisal_status = 'Closing Scheduled'
	where Prop_id = #URL.rec_id#
</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="read_user">
		
			select * from first_admin
			WHERE ID = #session.ft_user_id#
		
		</CFQUERY>
		<CFQUERY datasource="#request.dsn#">		
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Closing confirmed and information submitted to client', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'P', '1', '1')		
		</CFQUERY>
		
<CFIF (#get_order.pstate# EQ "AL") OR (#get_order.pstate# EQ "CT") or (#get_order.pstate# EQ "DC") or (#get_order.pstate# EQ "DE") or (#get_order.pstate# EQ "FL") or (#get_order.pstate# EQ "GA") or (#get_order.pstate# EQ "KY") or (#get_order.pstate# EQ "MA") or (#get_order.pstate# EQ "ME") or (#get_order.pstate# EQ "MD") or (#get_order.pstate# EQ "CO") or (#get_order.pstate# EQ "NJ")> 
<CFSET b_emails_to_first_title = "pgibb@firsttitleservices.com">
<CFELSEIF (#get_order.pstate# EQ "AR") OR (#get_order.pstate# EQ "NC") or (#get_order.pstate# EQ "IN") or (#get_order.pstate# EQ "MI") or (#get_order.pstate# EQ "MO") or (#get_order.pstate# EQ "TN") or (#get_order.pstate# EQ "VA") or (#get_order.pstate# EQ "WI") or (#get_order.pstate# EQ "AZ") or (#get_order.pstate# EQ "MT")>
<CFSET b_emails_to_first_title = "pgibb@firsttitleservices.com">
<CFELSEIF (#get_order.pstate# EQ "IA") OR (#get_order.pstate# EQ "IL") or (#get_order.pstate# EQ "KS") or (#get_order.pstate# EQ "LA") or (#get_order.pstate# EQ "MN") or (#get_order.pstate# EQ "MS") or (#get_order.pstate# EQ "NH") or (#get_order.pstate# EQ "NY") or (#get_order.pstate# EQ "ND") or (#get_order.pstate# EQ "OH") or (#get_order.pstate# EQ "PA") or (#get_order.pstate# EQ "RI") or (#get_order.pstate# EQ "VT") or (#get_order.pstate# EQ "WV")>
<CFSET b_emails_to_first_title = "pgibb@firsttitleservices.com">
<CFELSE>
<CFSET b_emails_to_first_title = "pgibb@firsttitleservices.com">
</CFIF>	

		
		
<cfif #get_order.comp_id# neq "115">

<CFMAIL
TO="#getorderinfo.A_Req_By_Email#,#b_emails_to_first_title#"
FROM="#team_email#"
Subject="#get_order.blastname1#, #get_order.bfirstname1#:  #get_order.prop_id# -- Loan Number-#get_order.loan_number#"
TIMEOUT="600"
type="html"
><center>
<table width=620 cellpadding=1 cellspacing=1 border=1 bgcolor=e1e1e1>
		<tr>
			<td width=620 align=center valign=top bgcolor=e1e1e1>
			
			<font face=verdana size=2 color=black>
			<NOBR>Order number - <font face=verdana size=2 color=blue><B>0232#URL.rec_id#</B></font></NOBR>
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
	

</center>


</table>
<center>
<table width=620 cellpadding=1 cellspacing=1 border=1 bgcolor=e1e1e1>



<tr>
	<td width=620 colspan = "2" align=center valign=top bgcolor=d3d3d3><font size=2 face=arial><b>Closing Information</font></b> </td>
</tr>

<tr>
			
			<td width="30%" align=center valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Date Submitted
			</td>
			 <td width="70%" align=left valign=top bgcolor=e1e1e1>
<font color="Black" size="2"><b>Submitted: #DateFormat(comments.closing_date, "m/d/yyyy")# at #comments.s_time#</b></font>

	</td>
	</tr>
	
		<tr>
			
			<td width="30%" align=center valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Date Scheduled
			</td>
			 <td width="70%" align=left valign=top bgcolor=e1e1e1>
<font color="Black" size="2"><b>Scheduled: #comments.c_month#/#comments.c_day#/#comments.c_year#</b></font>


<BR><font color="Blue" size="2"><i>requested: #getorderinfo.A_Req_Closing_month#/#getorderinfo.A_Req_Closing_day#/#getorderinfo.A_Req_Closing_year#</i> </font>	
</td></tr>
<TR>
			<td width = "30%" align=center valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Time Assigned
			</td>

	
	 <td width="70%" align=left valign=top bgcolor=e1e1e1><font size=2 face=arial>
<font color="Black" size="2"><b>Assigned: #TimeFormat(comments.c_time, "HH:mm:ss")#</b></font>

<BR><font color="Blue" size="2"><i>requested: #getorderinfo.A_Req_Closing_Time#</i> </font>		


</td>
		</tr>
</table></center>
	<center>	
	<table width=620 cellpadding=1 cellspacing=1 border=1 bgcolor=e1e1e1>

<tr>
	<td width="30%" align=center valign=middle bgcolor=e1e1e1><font size=2 face=arial>Closing Details</font> </td>
	 <td width="70%" align=left valign=top bgcolor=e1e1e1><font size=2 face=arial>
	#comments.c_comment#
	

</tr>

</table></center>


</CFMAIL>
<cfelse>
<CFMAIL
TO="#b_emails_to_first_title#"
FROM="#team_email#"
Subject="#get_order.blastname1#, #get_order.bfirstname1#:  0232#get_order.prop_id# -- Loan Number-#get_order.loan_number#"
TIMEOUT="600"
type="html"
><center>
<table width=620 cellpadding=1 cellspacing=1 border=1 bgcolor=e1e1e1>
		<tr>
			<td width=620 align=center valign=top bgcolor=e1e1e1>
			
			<font face=verdana size=2 color=black>
			<NOBR>Order number - <font face=verdana size=2 color=blue><B>0232#URL.rec_id#</B></font></NOBR>
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
	

</center>


</table>
<center>
<table width=620 cellpadding=1 cellspacing=1 border=1 bgcolor=e1e1e1>



<tr>
	<td width=620 colspan = "2" align=center valign=top bgcolor=d3d3d3><font size=2 face=arial><b>Closing Information</font></b> </td>
</tr>

<tr>
			
			<td width="30%" align=center valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Date Submitted
			</td>
			 <td width="70%" align=left valign=top bgcolor=e1e1e1>
<font color="Black" size="2"><b>Submitted: #DateFormat(comments.closing_date, "m/d/yyyy")# at #comments.s_time#</b></font>

	</td>
	</tr>
	
		<tr>
			
			<td width="30%" align=center valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Date Scheduled
			</td>
			 <td width="70%" align=left valign=top bgcolor=e1e1e1>
<font color="Black" size="2"><b>Scheduled: #comments.c_month#/#comments.c_day#/#comments.c_year#</b></font>


<BR><font color="Blue" size="2"><i>requested: #getorderinfo.A_Req_Closing_month#/#getorderinfo.A_Req_Closing_day#/#getorderinfo.A_Req_Closing_year#</i> </font>	
</td></tr>
<TR>
			<td width = "30%" align=center valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Time Assigned
			</td>

	
	 <td width="70%" align=left valign=top bgcolor=e1e1e1><font size=2 face=arial>
<font color="Black" size="2"><b>Assigned: #TimeFormat(comments.c_time, "HH:mm:ss")#</b></font>

<BR><font color="Blue" size="2"><i>requested: #getorderinfo.A_Req_Closing_Time#</i> </font>		


</td>
		</tr>
</table></center>
	<center>	
	<table width=620 cellpadding=1 cellspacing=1 border=1 bgcolor=e1e1e1>

<tr>
	<td width="30%" align=center valign=middle bgcolor=e1e1e1><font size=2 face=arial>Closing Details</font> </td>
	 <td width="70%" align=left valign=top bgcolor=e1e1e1><font size=2 face=arial>
	#comments.c_comment#
	

</tr>

</table></center>

</CFMAIL>
</cfif>
<cfif #get_closer.recordcount# GT 0>
<cfquery name="get_closer2" datasource="#request.dsn#">
select * from closer
where closer_id = #get_closer.closer_id#
</cfquery>
<cfif #get_closer2.pref_for_send# eq "Email">
<!---  --->
<CFMAIL
TO="#get_closer2.email#"
FROM="#team_email#"
Subject="#get_order.blastname1#, #get_order.bfirstname1#:  0232#get_order.prop_id# -- Loan Number-#get_order.loan_number#"
TIMEOUT="600"
type="html"
><center>
<table width=620 cellpadding=1 cellspacing=1 border=1 bgcolor=e1e1e1>
		<tr>
			<td width=620 align=center valign=top bgcolor=e1e1e1>
			
			<font face=verdana size=2 color=black>
			<NOBR>Order number - <font face=verdana size=2 color=blue><B>#URL.rec_id#</B></font></NOBR>
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
	

</center>


</table>
<center>
<table width=620 cellpadding=1 cellspacing=1 border=1 bgcolor=e1e1e1>



<tr>
	<td width=620 colspan = "2" align=center valign=top bgcolor=d3d3d3><font size=2 face=arial><b>Closing Information</font></b> </td>
</tr>

<tr>
			
			<td width="30%" align=center valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Date Submitted
			</td>
			 <td width="70%" align=left valign=top bgcolor=e1e1e1>
<font color="Black" size="2"><b>Submitted: #DateFormat(comments.closing_date, "m/d/yyyy")# at #comments.s_time#</b></font>

	</td>
	</tr>
	
		<tr>
			
			<td width="30%" align=center valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Date Scheduled
			</td>
			 <td width="70%" align=left valign=top bgcolor=e1e1e1>
<font color="Black" size="2"><b>Scheduled: #comments.c_month#/#comments.c_day#/#comments.c_year#</b></font>


<BR><font color="Blue" size="2"><i>requested: #getorderinfo.A_Req_Closing_month#/#getorderinfo.A_Req_Closing_day#/#getorderinfo.A_Req_Closing_year#</i> </font>	
</td></tr>
<TR>
			<td width = "30%" align=center valign=top bgcolor=e1e1e1>
				<font face=verdana size=2 color=black>
				Closing Time Assigned
			</td>

	
	 <td width="70%" align=left valign=top bgcolor=e1e1e1><font size=2 face=arial>
<font color="Black" size="2"><b>Assigned: #TimeFormat(comments.c_time, "HH:mm:ss")#</b></font>

<BR><font color="Blue" size="2"><i>requested: #getorderinfo.A_Req_Closing_Time#</i> </font>		


</td>
		</tr>
</table></center>
	<center>	
	<table width=620 cellpadding=1 cellspacing=1 border=1 bgcolor=e1e1e1>

<tr>
	<td width="30%" align=center valign=middle bgcolor=e1e1e1><font size=2 face=arial>Closing Details</font> </td>
	 <td width="70%" align=left valign=top bgcolor=e1e1e1><font size=2 face=arial>
	#comments.c_comment#
	

</tr>

</table></center>

</CFMAIL>
<cfelse>
<CFMAIL
TO="1#get_closer2.fax#@efaxsend.com"
FROM="closingfax@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="#get_order.blastname1#, #get_order.bfirstname1#:  0232#get_order.prop_id# -- Loan Number-#get_order.loan_number#"
TIMEOUT="600"
>
1st Borrower Name: #Read_Title.BFirstName1# #Read_Title.bminame1#     #Read_Title.BLastName1#<cfif #Read_Title.Bhphone1# neq "">       Phone: #Read_Title.Bhphone1#</cfif>
<cfif #Read_Title.BFirstName2# neq ""> 2nd Borrower Name: #Read_Title.BFirstName2# #Read_Title.bminame2#     #Read_Title.BLastName2# <cfif #Read_Title.Bhphone2# neq "">        Phone: #Read_Title.Bhphone2#</cfif></cfif>

Address - #Read_Title.pADDRESS#    City - #Read_Title.pcity#    Zip - #Read_Title.pzip#     State - #Read_Title.pstate#
		

Closing Day: #comments.c_month#/#comments.c_day#/#comments.c_year#
Closing Time: #TimeFormat(comments.c_time, "HH:mm:ss")#

Comments: #comments.c_comment#

All correspondence must go through First Title & Escrow, Inc..
</CFMAIL>
</cfif>
</cfif>
<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">
<html>
<head>
	<title>1st Title & Escrow, Inc. - Updated Order</title>
</head>

<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
<table width=620 border="0" cellpadding="0" cellspacing="0"><tr><nobr><td colspan="2" valign=bottom><img src="./images/clear.gif" width="10" height="1"><b><font size=2 color=red face=arial><img src="./images/clear.gif" width="30" height="1"><cfoutput>#datnow# - #timnow#</cfoutput> (EST)</b></td></tr><br>



<TABLE WIDTH=455 BORDER=0 CELLSPACING=-1 align="center">
<TR>
<TD ALIGN=CENTER>
<FONT FACE=ARIAL COLOR="red" SIZE=4>Admin - Updated Closing</FONT>
<HR>

</TD>
</TR>
</TABLE>


<center>
<table border=0 align=center width=455>
<tr><td><font size=3 face=arial>
The selected closing order with closing no. of &nbsp;<b><cfoutput>#url.rec_id#</cfoutput></b>&nbsp; has been updated from the database.


<cfoutput>
<cfif  #update# is "Update This Closing Information">
<!---do nothing--->
<cfelse>
The confirmation information has sent to the customer  at &nbsp;<b>#verifyemail#</b>.
</cfif></cfoutput>
</td></tr><p></P>	
<CFELSE>

<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">
<html>
<head>
	<title>1st Title & Escrow, Inc. - Updated Order</title>
</head>

<body leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
<table width=620 border="0" cellpadding="0" cellspacing="0"><tr><nobr><td colspan="2" valign=bottom><img src="./images/clear.gif" width="10" height="1"><b><font size=2 color=red face=arial><img src="./images/clear.gif" width="30" height="1"><cfoutput>#datnow# - #timnow#</cfoutput> (EST)</b></td></tr><br>



<TABLE WIDTH=455 BORDER=0 CELLSPACING=-1 align="center">
<TR>
<TD ALIGN=CENTER>
<FONT FACE=ARIAL COLOR="red" SIZE=4>Admin - Updated Closing</FONT>
<HR>

</TD>
</TR>
</TABLE>


<center>
<table border=0 align=center width=455>
<tr><td><font size=3 face=arial>
The selected closing order with closing no. of &nbsp;<b><cfoutput>#url.rec_id#</cfoutput></b>&nbsp; has NOT been updated from the database.<br>
The order is excpected to be REQUESTED and ASSIGNED a closer before it can be submitted to client!
<!---<cfoutput>
<cfif  #update# is "Update This Closing Information">
do nothing
<cfelse>
The confirmation information has sent to the customer  at &nbsp;<b>#verifyemail#</b>.
</cfif></cfoutput>--->
</td></tr><p></P>
</CFIF>
