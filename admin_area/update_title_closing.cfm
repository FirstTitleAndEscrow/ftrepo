<cfset objChase = CreateObject('component','cfc.chaseRealEC')>
<cfset twilioUsername = "AC81ebd9ed78692ef63a36efd73499d23f" />
<cfset twilioPassword = "159e672a604836c2a167cb6726638511" />

<cfset twilioFrom = "443-648-9210" />
<cfset twilioSMSResource = (
    "https://api.twilio.com/2008-08-01" &
    "/Accounts/#twilioUsername#/SMS/Messages"
    ) />
<cfset scheduling_email = "scheduling@firsttitleservices.com">
<cfparam name="form.signing_method_type" default="">
<cfparam name="form.signing_location_address" default="">
<cfparam name="form.signing_location_city" default="">
<cfparam name="form.signing_location_state" default="">
<cfparam name="form.signing_location_zip" default="">
<cfparam name="form.signing_location" default="">

<CFQUERY DATASOURCE="#request.dsn#" NAME="get_title">
	SELECT *
	FROM Title
	WHERE title_ID = #url.rec_ID#
</cfquery>
<CFQUERY DATASOURCE="#request.dsn#" NAME="get_sales_rep">
	SELECT intSales
	FROM  companies
	WHERE ID = #get_title.comp_ID#
</cfquery>
<CFQUERY DATASOURCE="#request.dsn#" NAME="get_sales_rep_info">
	SELECT fname, lname, email, closing_emails
	FROM  First_Admin
	WHERE ID = #get_sales_rep.intSales#
</cfquery>

<cfparam name="form.cancel_closing" default="">
<cfif form.cancel_closing eq 'Cancel This Closing'>
<cfset objChase.processEvent(eventCode=766, firstTitleSending=1, productCode=29, title_id=#url.rec_id#)>

<cfquery name="delete_closing" DATASOURCE="#request.dsn#">
delete from Title_Closing_Order_Request
where title_id = #URL.rec_id#
</cfquery>
<cfquery name="delete_closing" DATASOURCE="#request.dsn#">
Insert into Title_Closing_Order_Request (title_id)
values (#URL.rec_id#)
</cfquery>

<CFQUERY DATASOURCE="#request.dsn#" NAME="delete_event">
delete
FROM eventlist
Where Title_Id = #URL.rec_id#
</CFQUERY>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_user">
select * from first_admin

			WHERE ID = #session.ft_user_id#
</CFQUERY>
<CFQUERY DATASOURCE="#request.dsn#" name="insert_note">
INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Closing has been cancelled', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
</CFQUERY>
<cfif get_sales_rep_info.closing_emails eq 'True'>
<cfmail to="#get_sales_rep_info.email#" from="webmaster@firsttitleservices.com" subject="T-#rec_id# - Closing Cancelled">

Closing has been cancelled for file T-#rec_id#

(this is an automated email)

</cfmail>
</cfif>


<cfif Len(get_title.notify_closing_email) GTE 1>
<cfmail to="#get_title.notify_closing_email#" from="webmaster@firsttitleservices.com" subject="T-#rec_id# - Closing Cancelled">

Closing has been cancelled for file T-#rec_id#

(this is an automated email, you are receiving this email because your email was listed when "Notify Me When Closing is Scheduled" was selected. Reason for notification: #get_title.notify_closing_reason#)

</cfmail>
</cfif>


<CFQUERY DATASOURCE="#request.dsn#" name="update_title">
update Title
set appraisal_status = 'Report E-mailed'
where title_id = #URL.rec_id#
</CFQUERY>


<cflocation url="title_closing_info.cfm?uid=#url.uid#&al=#URL.al#&rec_id=#URL.rec_id#&a_trigger=1&company_id=#URL.comp_id#&cancelled=1" addtoken="no">



</cfif>

<cfquery name="get_closing" DATASOURCE="#request.dsn#">
select * from Title_Closing_Order_Request
where title_id = #URL.rec_id#
</cfquery>

<cfquery name="get_comp" DATASOURCE="#request.dsn#">
select * from title t, companies c
where t.title_id = #URL.rec_id#
and c.ID = t.comp_id
</cfquery>



<cfif Len(FORM.confirm_year) AND LEN(FORM.confirm_mon) AND Len(FORM.confirm_day)>
<CFSET closing_date = CreateDate(FORM.confirm_year, FORM.confirm_mon, FORM.confirm_day)>
<CFSET busted_date = CreateDate(FORM.confirm_busted_year, FORM.confirm_busted_mon, FORM.confirm_busted_day)>

<cfif get_comp.streamline_client EQ 1>
<cfif IsDate(closing_date) and IsDate(busted_date)>
<cfset compare_dates = DateCompare(closing_date, busted_date)>
<cfif compare_dates eq 1>
<script language="javascript">
alert("The Closing Date you are attempting to set is past the Contract Busted Date. This is usually not acceptable. Please make sure this is what you intend to do.");
</script>
</cfif>
</cfif>
</cfif>
</cfif>



<cfquery name="get_closer" DATASOURCE="#request.dsn#">
select * from Doc_closer_Title

where title_id = #URL.rec_id#
</cfquery>

<cfquery DATASOURCE="#request.dsn#" name="getuser">

select * from first_admin
where id = #url.uid#
</cfquery>

<cfquery name="get_id" DATASOURCE="#request.dsn#">
SELECT *
FROM Title
Where Title_Id = #URL.rec_id#
</cfquery>
<CFQUERY DATASOURCE="#request.dsn#" NAME="Read_Title">
				SELECT *
				FROM Title
				Where Title_Id = #URL.rec_id#
			</CFQUERY>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_comp_id">
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


 <cfquery name="getorderinfo" DATASOURCE="#request.dsn#">
SELECT *
FROM Title_Closing_Order_Request
Where Title_Id = #get_id.title_id#
</cfquery>
<cfquery name="get_name" DATASOURCE="#request.dsn#">
select *
from title
where title_id = #get_id.title_id#
</cfquery>

<CFQUERY DATASOURCE="#request.dsn#" NAME="aaaa">
				SELECT *
				FROM eventlist
				Where Title_Id = #URL.rec_id#
			</CFQUERY>


<cfquery name="get_order" DATASOURCE="#request.dsn#">
select * from Title
where title_id = #URL.rec_id#
</cfquery>

<cfif (#get_closing.a_filled_out_date# NEQ "") >

<cfquery name="get_comp" DATASOURCE="#request.dsn#">
select * from companies

where id = #get_order.comp_id#
</cfquery>

<cfquery name="get_list" DATASOURCE="#request.dsn#">
select * from eventlist

where title_id = #get_order.title_id#
</cfquery>
<cfoutput>
<cfif Len(FORM.confirm_year) AND LEN(FORM.confirm_mon) AND Len(FORM.confirm_day)>
<CFSET yourDate = CreateDate(FORM.confirm_year, FORM.confirm_mon, FORM.confirm_day)>
</cfif>
</cfoutput>
<cfif Len(FORM.confirm_year) AND LEN(FORM.confirm_mon) AND Len(FORM.confirm_day)>
<CFSET order_date_adj = '#DateFormat(yourDate, "mm/dd/yyyy")# #TimeFormat(form.confirm_time, "HH:mm:ss")#'>
</cfif>
<cfquery name="get_currentEventlist" DATASOURCE="#request.dsn#">
Select * from eventlist
where title_id = #URL.rec_id#
</cfquery>

<cfif get_currentEventlist.recordcount eq 0>
<cfquery name="insertEventlist" DATASOURCE="#request.dsn#">
insert into eventlist (title_id)
values (#URL.rec_id#)
</cfquery>
</cfif>

<cfif Len(FORM.confirm_year) AND LEN(FORM.confirm_mon) AND Len(FORM.confirm_day)>
<cfquery name="updateclosing" DATASOURCE="#request.dsn#">
update eventlist
set
	b_fname= '#get_order.bfirstname1#',
b_lname = '#get_order.blastname1#',
	yearmonthday = '#FORM.confirm_year##FORM.confirm_mon##FORM.confirm_day#',
yearmonth = '#FORM.confirm_year##FORM.confirm_mon##FORM.confirm_day#',
s_date = '#DateFormat(Now(), "m/d/yyyy")#',
s_time = '#TimeFormat(Now(), "HH:mm:ss")#',
closing_date = '#DateFormat(Now(), "m/d/yyyy")#',
sc_dateandtime = '#order_date_adj#',
	c_Day = '#form.confirm_day#',
	c_month = '#form.confirm_mon#',
	c_year = '#form.confirm_year#',
	c_Time = '#form.confirm_time#',
	fee = '#fee#',
	c_comment = '#form.comments#',
comp_id = #get_order.comp_id#,
company = '#get_comp.company#',
	UserID = #getuser.ID#
where title_id = #URL.rec_id#
</cfquery>
</cfif>
<cfquery name="get_currentTCOR" DATASOURCE="#request.dsn#">
Select * from Title_Closing_Order_Request
where title_id = #URL.rec_id#
</cfquery>

<cfquery name="updateTCOR" DATASOURCE="#request.dsn#">
update Title_Closing_Order_Request
set
signing_method_type = '#form.signing_method_type#',
signing_location_address = '#form.signing_location_address#',
signing_location_city = '#form.signing_location_city#',
signing_location_state = '#form.signing_location_state#',
signing_location_zip = '#form.signing_location_zip#',
signing_location = '#form.signing_location#',
notary_name='#notary_name#',
notary_phone='#notary_phone#',
notary_email='#notary_email#'
where title_id = #URL.rec_id#
</cfquery>

<cfset busted_date = '#form.confirm_busted_mon#-#form.confirm_busted_day#-#form.confirm_busted_year#'>


<cfif Len(get_order.realec_transactionid)>
<cfif getorderinfo.multiple_sets eq 1>
<cfset productCode=285>
<cfelse>
<cfset productCode=284>
</cfif>


        <cfset signingLocation.type = #form.signing_location#>
		<cfset signingLocation.addr1 = #form.signing_location_address#>
		<cfset signingLocation.city = #form.signing_location_city#>
		<cfset signingLocation.state = #form.signing_location_state#>
		<cfset signingLocation.zip = #form.signing_location_zip#>
		<cfset signingLocation.signingMethod = #form.signing_method_type#>
		<cfif isDefined("datetimechange")>
		<cfset signingMethod.signingMethod = #form.signing_method_type#>
		<cfset signingMethod.scheduledDate = "#form.confirm_year#/#form.confirm_mon#/#form.confirm_day#">
		<cfset signingMethod.scheduledTime = '#TimeFormat(form.confirm_time, "HH:mm:ss")#'>
		</cfif>

<cfif isDefined("locationchange")>
	<cfset objChase.processEvent(eventcode=303,title_ID=url.rec_id,firsttitlesending=true,productCode=productCode,signingLocation=signingLocation)>
</cfif>
<cfif isDefined("datetimechange")>
	<cfset objChase.processEvent(eventcode=310,title_ID=url.rec_id,firsttitlesending=true,productCode=productCode,signingMethod=signingMethod)>
</cfif>
<cfset objChase.processEvent(eventCode=410, firstTitleSending=1, productCode=productCode, title_id=#url.rec_id#)>
				

</cfif>


<cfif IsDate(busted_date)>
<cfquery name="updatebusteddate" DATASOURCE="#request.dsn#">
update Title_Closing_Order_Request
set contract_busted_date = '#DateFormat(busted_date, "m/d/yyy")#'
where title_id = #URL.rec_id#
</cfquery>
<cfelse>
<cfquery name="updatebusteddate" DATASOURCE="#request.dsn#">
update Title_Closing_Order_Request
set contract_busted_date = NULL
where title_id = #URL.rec_id#
</cfquery>
</cfif>
<CFQUERY DATASOURCE="#request.dsn#" NAME="comments">
				SELECT *
				FROM eventlist
				Where Title_Id = #URL.rec_id#
			</CFQUERY>

		<!-- sazan changed 11/28/05 -->

	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#

		</CFQUERY>

<cfif #read_title.appraisal_status# neq "Loan Closed">

<cfquery name="updateclosing" DATASOURCE="#request.dsn#">
update Title
set
	Appraisal_status = 'Closing Scheduled'
where title_id = #URL.rec_id#
</cfquery>
	<!-- sazan changed 11/28/05 -->

</cfif>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_user">

			select * from first_admin
			WHERE ID = #session.ft_user_id#

		</CFQUERY>
		<CFQUERY DATASOURCE="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Closing confirmed and information submitted to client', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>



<CFIF #Len(getorderinfo.A_Req_By_Email)# gt "1">
	<CFSET b_emails_to_first_title = "#getorderinfo.A_Req_By_Email#; closings@firsttitleservices.com">
<CFELSE>
<CFQUERY DATASOURCE="#request.dsn#" NAME="is_VA">
SELECT f.va_employee from companies c, first_admin f
where c.ID = #read_title.comp_id#
and f.ID = c.intSales
</CFQUERY>
<cfif is_VA.va_employee eq 'True'>
<cfset b_emails_to_first_title = "richmond@firsttitleservices.com">
<cfelse>
<cfset b_emails_to_first_title = "closings@firsttitleservices.com">
</cfif></CFIF>

<cfif Len(get_title.notify_closing_email) GTE 1>
<cfmail to="#get_title.notify_closing_email#" from="webmaster@firsttitleservices.com" subject="T-#rec_id# - Closing Scheduled">

Closing has been scheduled for file T-#rec_id#

Scheduled: #comments.c_month#/#comments.c_day#/#comments.c_year#

(this is an automated email, you are receiving this email because your email was listed when "Notify Me When Closing is Scheduled" was selected.

Reason for notification: #get_title.notify_closing_reason#)

</cfmail>
</cfif>


<!---These If Statements are impossible to figure out in this code
I'm going to write some stupid code right here to get around it.
Company 621 is another company that MIC bought and needs to follow the rules.
I don't trust the conditional statement to work so I'm doing it this way.
I can't test this because if MIC receives an email in error they will freak out.
Harry 11/12/04
--->
<CFSET company = #get_order.comp_id# >

<CFIF #company# eq "621">
    <CFSET #company# eq "115">
</CFIF>
<!---End Harry 11/12/2004--->



<cfif (#company# neq "115") >
    <cfif #company# eq "559"><!---Weichert 559--->
        <CFIF (#getorderinfo.A_Req_By_Email# neq "#trim(get_order.o_email)#") AND (#len(get_order.o_email)# gt "1")>
            <CFSET b_emails_to_first_title = #b_emails_to_first_title# & ";#trim(get_order.o_email)#">
        </CFIF>
        <CFIF (#getorderinfo.A_Req_By_Email# neq "#trim(get_order.p_email)#") AND  (#len(get_order.p_email)# gt "1")>
            <CFSET b_emails_to_first_title = #b_emails_to_first_title# & ";#trim(get_order.p_email)#">
        </CFIF>
    </CFIF>

<cfif #company# eq 623>
<cfset b_emails_to_first_title = get_order.p_email & ";" & get_order.o_email>
</cfif>

<cfif Len(notary_phone)><!--- closingmanage.cfm?rec_id=52555&a=1--->
<cfsavecontent variable="message">First Title Closing Scheduled: http://machine1.firsttitleservices.com/client/closingmanage.cfm?rec_id=<cfoutput>#rec_id#</cfoutput>&a=1</cfsavecontent>
<cfhttp
        result="post"
        method="post"
        url="#twilioSMSResource#"
        username="#twilioUsername#"
        password="#twilioPassword#">

        <cfhttpparam
            type="formfield"
            name="From"
            value="#twilioFrom#"
            />


        <cfhttpparam
            type="formfield"
            name="To"
            value="#notary_phone#"
            />

        <cfhttpparam
            type="formfield"
            name="Body"
            value="#message#"
            />



    </cfhttp>
</cfif>
<!--- per Aaron Oaks, 2/12/2013 --->
<CFQUERY datasource="#request.dsn#" NAME="is_VA">
SELECT f.va_employee from companies c, first_admin f
where c.ID = #read_title.comp_id#
and f.ID = c.intSales
</CFQUERY>
<cfif is_VA.va_employee eq 'True'>
<cfset b_emails_to_first_title = get_order.p_email & ";" & get_order.o_email>
<cfset b_emails_to_first_title = b_emails_to_first_title & "," & "team_1@firsttitleservices.com,htanner@firsttitleservices.com">
<cfset scheduling_email = "team_1@firsttitleservices.com">
<cfelse>
<cfset b_emails_to_first_title = "closings@firsttitleservices.com">
</cfif>


<cfif get_sales_rep_info.closing_emails eq 'True'>
    <CFSET b_emails_to_first_title = b_emails_to_first_title & "," & get_sales_rep_info.email>
</cfif>


<CFMAIL
TO="#b_emails_to_first_title#"
FROM="#scheduling_email#"
SERVER="127.0.0.1"
Subject="#get_order.blastname1#, #get_order.bfirstname1#:  #get_order.title_id# -- Loan Number-#get_order.loan_number#"
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


<!--- per Aaron Oaks, 2/12/2013 --->
<CFQUERY datasource="#request.dsn#" NAME="is_VA">
SELECT f.va_employee from companies c, first_admin f
where c.ID = #read_title.comp_id#
and f.ID = c.intSales
</CFQUERY>
<cfif is_VA.va_employee eq 'True'>
<cfset b_emails_to_first_title = get_order.p_email & ";" & get_order.o_email>
<cfset b_emails_to_first_title = b_emails_to_first_title & "," & "team_1@firsttitleservices.com,htanner@firsttitleservices.com">
<cfset scheduling_email = "team_1@firsttitleservices.com">
<cfelse>
<cfset b_emails_to_first_title = "closings@firsttitleservices.com">
</cfif>

<cfif get_sales_rep_info.closing_emails eq 'True'>
    <CFSET b_emails_to_first_title = "#b_emails_to_first_title#," & get_sales_rep_info.email>
<cfelse>
<cfset b_emails_to_first_title = "#b_emails_to_first_title#">
</cfif>

<CFMAIL
TO="#b_emails_to_first_title#"
FROM="#scheduling_email#"
SERVER="127.0.0.1"
Subject="#get_order.blastname1#, #get_order.bfirstname1#:  #get_order.title_id# -- Loan Number-#get_order.loan_number#"
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
</cfif>
<cfif #get_closer.recordcount# GT 0 AND Len(get_closer.closer_id)>
<cfquery name="get_closer2" DATASOURCE="#request.dsn#">
select * from closer
where closer_id = #get_closer.closer_id#
</cfquery>
<cfif #get_closer2.pref_for_send# eq "Email">
<!---  --->
<CFMAIL
TO="#get_closer2.email#"
FROM="#team_email#"
Subject="#get_order.blastname1#, #get_order.bfirstname1#:  #get_order.title_id# -- Loan Number-#get_order.loan_number#"
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
TO="1#trim(get_closer2.fax)#@efaxsend.com"
FROM="closingfax@firsttitleservices.com"
SERVER="127.0.0.1"
Subject="#get_order.blastname1#, #get_order.bfirstname1#:  #get_order.title_id# -- Loan Number-#get_order.loan_number#"
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
The order is expected to be REQUESTED and ASSIGNED a closer before it can be submitted to client!

</td></tr><p></P>
</CFIF>
