<cfset is_VA = 0>

<cfif #date# eq "">
<CFLOCATION URL="https://#cgi.server_name#/admin_area/title_closing_doc_view.cfm?uid=#uid#&al=#al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&a_flag=1">

<cfelse>



<CFQUERY datasource="#request.dsn#" NAME="read_title_closer">

			SELECT *
			FROM Doc_closer_Title
			WHERE title_ID = #rec_ID#

		</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_assigned_closer">

			SELECT *
			FROM closer
			WHERE  closer_ID = #read_title_closer.closer_ID#

</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#

		</CFQUERY>
 <CFQUERY datasource="#request.dsn#" NAME="aaaa">
				SELECT *
				FROM Title_Closing_Order_Request
				Where Title_Id = #read_title.title_id#
			</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_comp">
		SELECT company, intsales
		FROM companies
		WHERE id = #read_title.comp_id#
	</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="check_VA">
		SELECT * from First_admin
		WHERE id = #read_comp.intSales#
	</CFQUERY>

<cfif check_VA.va_employee eq 'True'>
<cfset is_VA = 1>
</cfif>
<CFQUERY datasource="#request.dsn#" NAME="check_FX">
		SELECT * from First_admin
		WHERE id = #read_comp.intSales#
	</CFQUERY>

<cfif check_FX.ft_fairfax_employee eq 'True'>
<cfset is_FX = 1>
</cfif>
			<CFQUERY datasource="#request.dsn#" NAME="read_ft_user">

			SELECT *
			FROM first_admin
			WHERE ID = #read_title_closer.a_Assigned_by#

		</CFQUERY>

<cfif is_VA eq 1>
<cfset from_email = 'richmond@firsttitleservices.com'>
<cfelse>
<cfset from_email = 'closingfax@firsttitleservices.com'>
</cfif>

<cfif #read_assigned_closer.pref_for_send# EQ "Fax">
<CFMAIL
TO="1#TRIM(read_assigned_closer.fax)#@efaxsend.com,#read_ft_user.email#"
FROM="#from_email#"

Subject="Witness Closing Request from First Title/National Signing - Order #rec_id#"
TIMEOUT="600"
>

CLOSING REQUEST ORDER FORM FROM FIRST TITLE/NATIONAL SIGNING


Closing Form for order number: #rec_id#

Assigned by: #user_that_started#;
Phone: #read_ft_user.phone#; Fax: #read_ft_user.fax#; Email: #read_ft_user.email#

Date Ordered - #DateFormat(Now(), "m/d/yyyy")#    Time Ordered - #TimeFormat(Now(), "HH:mm:ss")#

<CFIF #read_assigned_closer.recordcount# EQ "0">
Closer Assigned - Not yet Assigned<CFELSE>
Closer Assigned - #assign#</CFIF>

Phone -  #phone#
Ext -  #ext#
Email - #email#
Fax -  #fax#
Sent by - #sent#

SELLER:
<cfif #read_title.slastname1# neq "">
#read_title.sfirstname1# #read_title.sminame1# #read_title.slastname1#               #read_title.sssn1#
#read_title.sfirstname2# #read_title.sminame2# #read_title.slastname2#               #read_title.sssn2#
<cfelse>
N/A - See borrower info below
</cfif>
BORROWER INFORMATION

NAME: #read_title.bfirstname1# #read_title.bminame1# #read_title.blastname1#			SSN: #read_title.bssn1#
<cfif #read_title.bhphone1# neq "">PHONE: #read_title.bhphone1#</cfif>
<CFIF #READ_TITLE.BLASTNAME2# NEQ "">#read_title.bfirstname2# #read_title.bminame2# #read_title.blastname2#&nbsp;&nbsp;&nbsp;&nbsp;SSN: #read_title.bssn2#
<cfif #read_title.bhphone2# neq "">Phone: #read_title.bhphone2#</cfif></CFIF>


PROPERTY ADDRESS:

#read_title.paddress# #read_title.pcity# #read_title.pstate#, #read_title.pzip#

COUNTY: #read_title.pcounty#

Date of Appointment: #aaaa.a_req_closing_month#/#aaaa.a_req_closing_day#/#aaaa.a_req_closing_year#
Time of Appointment: #aaaa.a_req_closing_time#
Location of Appointment: #aaaa.a_settle_location#
Special Instructions:  #aaaa.a_special_inst#

Please reply by email to sender to confirm acceptance of this closing request.
If you are unable to reply by email please contact us TOLL FREE at
<cfif is_VA eq 1>1-888-243-3060<cfelse>1-866-484-8537 ext. 307,356,313, or 320; or by fax at 301-315-8162</cfif>

Thank you for working with us.
Closing Department

</CFMAIL>

<cfelse>
<cfif is_VA eq 1>
<cfset from_email = 'richmond@firsttitleservices.com'>
<cfelse>
<cfset from_email = 'closings@firsttitleservices.com'>
</cfif>

<CFMAIL
TO="#read_assigned_closer.email#; #read_ft_user.email#"
FROM="#from_email#"
Subject="Witness Closing Request from First Title/National Signing - Order #rec_id#"
TIMEOUT="600"
type = "html"
>

CLOSING REQUEST ORDER FORM FROM FIRST TITLE/NATIONAL SIGNING<br><br>

<table width=520 cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF>
<tr>
		<td width=520 align=center valign=top bgcolor=f3f3f3>Closing Form for order number: #rec_id#
</td></tr>
<tr>	<td width=520 align=center valign=top bgcolor=f3f3f3>
Person that Assigned the Closer - #user_that_started#
</td></tr>
<tr>	<td width=520 align=center valign=top bgcolor=f3f3f3>
Date Ordered - #DateFormat(Now(), "m/d/yyyy")#    Time Ordered - #TimeFormat(Now(), "HH:mm:ss")#
</td></tr><tr>	<td width=520 align=center valign=top bgcolor=f3f3f3>
<CFIF #read_assigned_closer.recordcount# EQ "0">
Closer Assigned - Not yet Assigned<CFELSE>
Closer Assigned - #assign#</CFIF></td></tr>
<tr>	<td width=520 align=center valign=top bgcolor=f3f3f3>
Phone -  #phone#</td></tr>
<tr>	<td width=520 align=center valign=top bgcolor=f3f3f3>
Ext -  #ext#</td></tr>
<tr>	<td width=520 align=center valign=top bgcolor=f3f3f3>
Email - #email#</td></tr>
<tr>	<td width=520 align=center valign=top bgcolor=f3f3f3>
Fax -  #fax#</td></tr>
<tr>	<td width=520 align=center valign=top bgcolor=f3f3f3>
Sent by - #sent#</td></tr>
</table>


<table width=520 cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF>

	<tr>
		<td width=200 align=right valign=top bgcolor=f3f3f3>
			<font size=2 color=black face=arial>
			SELLER:


		</td>

		<td width=319 align=left valign=top bgcolor=f3f3f3>
			<cfif #read_title.slastname1# neq "">
			<font size=2 color=blue face=arial>
				<B>#read_title.sfirstname1# #read_title.sminame1# #read_title.slastname1#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#read_title.sssn1# </B><br>
				<B>#read_title.sfirstname2# #read_title.sminame2# #read_title.slastname2#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#read_title.sssn2#</B>
		<cfelse>
		<font size=2 color=blue face=arial><b>N/A - See borrower info below</b>
		</cfif>
		</td>


	</tr>


	<tr>
		<td width=200 align=right valign=top bgcolor=f3f3f3>
			<font size=2 color=black face=arial>
			BORROWER:


		</td>

		<td width=310 align=left valign=top bgcolor=f3f3f3>
			<font size=2 color=blue face=arial>
				<B>#read_title.bfirstname1# #read_title.bminame1# #read_title.blastname1#&nbsp;&nbsp;&nbsp;&nbsp;SSN: #read_title.bssn1#<cfif #read_title.bhphone1# neq ""><br>Phone: #read_title.bhphone1#</cfif></B><br>
				<CFIF #READ_TITLE.BLASTNAME2# NEQ ""><B>#read_title.bfirstname2# #read_title.bminame2# #read_title.blastname2#&nbsp;&nbsp;&nbsp;&nbsp;SSN: #read_title.bssn2#<cfif #read_title.bhphone1# neq ""><br>Phone: #read_title.bhphone1#</cfif></B></CFIF>
		</td>


	</tr>


		<tr>
			<td width=200 align=right valign=top bgcolor=f3f3f3>
				<font size=2 color=black face=arial>
				PROPERTY ADDRESS:
			</td>



			<td width=319 align=left valign=top bgcolor=f3f3f3>




							<font size=2 color=blue face=arial>
							<B>#read_title.paddress#</B><br>
							<font size=2 color=blue face=arial>
							<B>#read_title.pcity#,</B>&nbsp;
							<font size=2 color=blue face=arial>
							<B>#read_title.pstate#</B>&nbsp;
					<font size=2 color=blue face=arial>
							<B>#read_title.pzip#</B><br>

						</td>
				</tr><tr>
				<td width=200 align=right valign=top bgcolor=f3f3f3>
						<font size=2 color=black face=arial>
				COUNTY:
				</td>
						<td width=319 align=left valign=top bgcolor=f3f3f3>
							<font size=2 color=blue face=arial>
							<B>#read_title.pcounty#</B>
						</td>
					</tr>


				</table>

<table width=520 cellpadding=1 cellspacing=1 border=1 bgcolor=BFBFBF>

	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Date of Appointment:


		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

				<B>#aaaa.a_req_closing_month#/#aaaa.a_req_closing_day#/#aaaa.a_req_closing_year# </B>
		</td>


	</tr>


	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Time of Appointment:


		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

				<B>#aaaa.a_req_closing_time# </B>
		</td>


	</tr>

<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Location of Appointment:


		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

				<B>#aaaa.a_settle_location# </B>
		</td>


	</tr>

	<tr>

<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Special Instructions:


		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>

				<B>#aaaa.a_special_inst# </B>
		</td>


	</tr>


</TABLE><br><br>
	Please reply by email to sender to confirm acceptance of this closing request.<br> If you are unable to reply by email please contact us <br>
	TOLL FREE at <cfif is_VA eq 1>1-888-243-3060<cfelse>1-866-484-8537 ext. 307,356,313, or 320; or by fax at 301-315-8162</cfif><br><br>

	Thank you for working with us.<br><br>
	Closing Department
</CFMAIL>

</cfif>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<body>
email has been sent to the person that processed the order


</body>
</html>
</cfif>