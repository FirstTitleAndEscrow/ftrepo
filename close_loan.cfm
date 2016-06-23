<CFQUERY datasource="#request.dsn#" NAME="no_emails">
Select *
FROM Do_Not_Email
</cfquery>
<cfset do_not_email_list = ValueList(no_emails.email_address, ",">



<cfquery datasource="#request.dsn#" name="getuser">

select * from first_admin
where id = #url.uid#
</cfquery>



<cfquery name="get_order" datasource="#request.dsn#">
select * from Title

where title_id = #URL.rec_id#
</cfquery>
<cfquery name="get_comp" datasource="#request.dsn#">
select * from companies

where id = #get_order.comp_id#
</cfquery>

<cfquery name="get_list" datasource="#request.dsn#">
select * from eventlist

where title_id = #get_order.title_id#
</cfquery>








<!--- </cfif> --->


<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">
<html>
<head>
	<title>1st Title & Escrow, Inc. - Updated Order</title>
</head>

<body leftmargin="0" bgcolor="d3d3d3"topmargin="0" marginheight="0" marginwidth="0">
<table width=620 border="0" cellpadding="0" cellspacing="0"><tr><nobr><td colspan="2" valign=bottom><img src="./images/clear.gif" width="10" height="1"><b><font size=2 color=red face=arial><img src="./images/clear.gif" width="30" height="1"><cfoutput>#datnow# - #timnow#</cfoutput> (EST)</b></td></tr><br>



<center>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="elelel">
<tr><td width="99%" align=center valign=top>
<FONT FACE=ARIAL SIZE=2 color="red">
	<br><br>
<center><B>ARE YOU SURE YOU WANT TO CLOSE THIS LOAN?
</B><br><br><FONT FACE=ARIAL SIZE=2 color="blue">If you choose so and would like to proceed click on the "Proceed" button, otherwise click the "Return" button to be redirected to the calendar search menu. </center> </td></tr>

<CFFORM NAME="frm" ACTION="./close_loan.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#get_order.title_id#&a_trigger=2" METHOD=POST>
	<tr><td width="50%" align=left valign=bottom>
		<br><br><br><br><br><br>
		<cfoutput>
		<NOBR><a href="https://#cgi.server_name#/admin_area/Calendar_company.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0" target="work"><img src="./images/button_return.gif" border=0 ALT="Return to main menu"></a>
			</NOBR></cfoutput></td>

			<td width="50%" align=center valign=bottom>
			<NOBR><input type=image border=0 src="./images/button_proceed.gif"> &nbsp;&nbsp;&nbsp;&nbsp;</NOBR></td>


			</tr>


</cfform>







<cfif #a_trigger# EQ "2">

<cfif (#get_list.c_month# NEQ "") AND (#get_order.appraisal_status# eq 'Closing Scheduled' or #get_order.appraisal_status# eq 'In Typing' or #get_order.appraisal_status# eq 'Report E-mailed')>

<cfquery name="updateclosing" datasource="#request.dsn#">
update Title
set
	Appraisal_status = 'Loan Closed'
where title_id = #URL.rec_id#
</cfquery>

<cfquery name="up" datasource="#request.dsn#">
update eventlist
set
	l_date = '#DateFormat(Now(), "m/d/yyyy")#',
	l_time = '#TimeFormat(Now(), "HH:mm:ss")#'
where title_id = #URL.rec_id#
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="read_user">
			select * from first_admin
			WHERE ID = #session.ft_user_id#
</CFQUERY>
		<CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Loan Closed', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>

<cfif #get_order.comp_id# neq "115">
<cfif #get_order.comp_id# eq 154 or #get_order.comp_id# eq 155 or #get_order.comp_id# eq 156 or #get_order.comp_id# eq 157 or #get_order.comp_id# eq 158 or #get_order.comp_id# eq 159 or #get_order.comp_id# eq 160 or #get_order.comp_id# eq 161 or #get_order.comp_id# eq 162 or #get_order.comp_id# eq 163 or #get_order.comp_id# eq 164 or #get_order.comp_id# eq 165 or #get_order.comp_id# eq 166 or #get_order.comp_id# eq 167 or #get_order.comp_id# eq 168 or #get_order.comp_id# eq 169 or #get_order.comp_id# eq 170 or #get_order.comp_id# eq 182 or #get_order.comp_id# eq 181 or #get_order.comp_id# eq 183 or #get_order.comp_id# eq 184 or #get_order.comp_id# eq 185 or #get_order.comp_id# eq 186 or #get_order.comp_id# eq 187 or #get_order.comp_id# eq 188 or #get_order.comp_id# eq 189 or #get_order.comp_id# eq 192 or #get_order.comp_id# eq 190 or #get_order.comp_id# eq 193 or #get_order.comp_id# eq 194 or #get_order.comp_id# eq 195 or #get_order.comp_id# eq 196 or #get_order.comp_id# eq 197  or #get_order.comp_id# eq 198  or #get_order.comp_id# eq 199  or #get_order.comp_id# eq 200  or #get_order.comp_id# eq 201>


<CFMAIL
TO="sharonlee@homeownersloan.com,loandocs@firsttitleservices.com"
FROM="loandocs@firsttitleservices.com" Subject="Your Loan Closed with #session.site.short_name# - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# "
TIMEOUT="600"
>
Dear Mr. Lee:

Loan has been closed for order #get_order.title_id#.

All correspondence must go through #session.site.long_name#
</CFMAIL>

<cfelse>

<cfif NOT ListContainsNoCase(do_not_email_list, get_order.p_email, ",") and NOT get_order.p_email contains 'rosicki'>
<CFMAIL
TO="#get_order.p_email#"
FROM="loandocs@firsttitleservices.com" Subject="Your Loan Closed with #session.site.short_name# - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# "
TIMEOUT="600"
>

Dear #get_order.pname#:
Loan has been closed for order #get_order.title_id#.

All correspondence must go through #session.site.long_name#
</CFMAIL>
</cfif>
</cfif>

<cfelse>
<CFMAIL
TO="htravis@firsttitleservices.com,loandocs@firsttitleservices.com"
FROM="loandocs@firsttitleservices.com" Subject="Your Loan Closed with #session.site.short_name# - Order: #get_order.title_id# - #get_order.bfirstname1# #get_order.blastname1# "
TIMEOUT="600"
>

Loan has been closed for order #get_order.title_id#.

All correspondence must go through #session.site.long_name#
</CFMAIL>

</cfif>


<TR>
<TD ALIGN=CENTER>
<FONT FACE=ARIAL COLOR="red" SIZE=4>Admin - Loan Closed</FONT>
<HR>

</TD>
</TR>



<center>

<tr><td><font size=3 face=arial>
Loan has been closed for order &nbsp;<b><cfoutput>#url.rec_id#</cfoutput></b>&nbsp; and an email has been sent for confirmation.


</td></tr><p></P>
<cfelse>
<TR>
<TD ALIGN=CENTER>
<FONT FACE=ARIAL COLOR="red" SIZE=4>Admin - Loan NOT Closed</FONT>
<HR>

</TD>
</TR>



<center>

<tr><td><font size=3 face=arial>
Loan has WAS NOT closed for order &nbsp;<b><cfoutput>#url.rec_id#</cfoutput></b>&nbsp; Closing information should be sent to client before this function is used!


</td></tr><p></P>

</cfif></cfif>

</table></center>