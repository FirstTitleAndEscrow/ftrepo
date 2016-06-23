<CFOUTPUT>
<!--- <CFSET closingdate = #comfirm_day#-#confirm_mon#-#confirm_year#> --->
<!--- <CFSET YearMonth = #confirm_year##confirm_mon#>--->
<CFSET YearMonthDay = '#confirm_year##confirm_mon##comfirm_day#'> 
<cfset day = #comfirm_day#>
<cfset month = #confirm_mon#>
<cfset year = #confirm_year#>
<cfset time = '#confirm_time#'>
</CFOUTPUT>
<!---<cfquery datasource="#request.dsn#" name="getuser">

select * from first_admin
where id = #session.ft_user_id#
</cfquery>

 <cfquery name="updateclosing" datasource="#request.dsn#">
update Title_Closing_Order_Request
set 
	A_Req_Closing_Day = #day#,
	A_Req_Closing_month = #month#,
	A_Req_Closing_year = #year#,
	A_Req_Closing_Time = '#time#',
	c_comment = '#comments#'
where title_id = #URL.rec_id#
</cfquery> --->
<cfquery name="updateclosing" datasource="#request.dsn#">
update Title
set 
	Appraisal_status = 'Closing Scheduled'
where title_id = #title_id#
</cfquery>

<cfquery name="updateclosing" datasource="#request.dsn#">
update Title_Closing_Order_Request
set 
	a_filled_out_date        = '#DateFormat(Now(), "m/d/yyyy")#',
	a_filled_out_time        = '#TimeFormat(Now(), "HH:mm:ss")#'
	<!--- a_filled_out_by          = #Uid# --->
where title_id = #title_id#
</cfquery>

<cfquery name="get_order" datasource="#request.dsn#">
select * from Title

where title_id = #title_id#
</cfquery>
<cfquery name="get_comp" datasource="#request.dsn#">
select * from companies

where id = #get_order.comp_id#
</cfquery>

<cfquery name="get_list" datasource="#request.dsn#">
select * from eventlist

where title_id = #get_order.title_id#
</cfquery>

<cfquery name="updateclosing" datasource="#request.dsn#">
update eventlist
set 
	b_fname= '#form.bfirstname1#',
b_lname = '#form.blastname1#',
	c_Day = #day#,
	c_month = #month#,
	c_year = #year#,
	c_Time = '#time#',
	closing_date = '#DateFormat(Now(), "m/d/yyyy")#',
	s_date = '#DateFormat(Now(), "m/d/yyyy")#',
	s_time = '#TimeFormat(Now(), "HH:mm:ss")#',
	c_comment = '#comments#',
	yearmonthday = '#yearmonthday#',
	comp_id = #get_order.comp_id#,
company = '#get_comp.company#'
	<!--- UserID = #getuser.ID# --->
where title_id = #URL.rec_id#
</cfquery>

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