<CFPARAM NAME="a_trigger" DEFAULT="0">



<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Loan Funding</title>
</head>

<body>

<center>

<cfif #a_trigger# eq 1>
<CFSET order_date_adj = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
<cfquery datasource="#request.dsn#">

update eventlist
set loanfun = 1,
fl_dateandtime = '#order_date_adj#'
where title_id = #url.rec_id#
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="read_user">

			select * from first_admin

			WHERE ID = #session.ft_user_id#

		</CFQUERY>

		<CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Loan Funded', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		</CFQUERY>

<!--- send out Loan Funded Emails --->
<cfinclude template="send_loan_funded_emails.cfm">


<center>

<table width="400">
  <tr>
    <td colspan="2"><font face="Arial, Helvetica, sans-serif" size="2">
		Loan has been funded for <cfoutput>#rec_id#. </cfoutput>
      </font></td>
  </tr>

 <tr>
    <td align = "center" colspan="2"><br><br><br>
	 <a href="javascript:window.close();"><img src="https://firsttitleservices.com/images/button_close.gif" border=0></a>
	</td> </tr>
</table></center>
</cfif>
</center>
</body>
</html>