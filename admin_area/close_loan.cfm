<cfparam name="form.close_month" default="">
<cfparam name="form.close_day" default="">
<cfparam name="form.close_year" default="">
<cfparam name="form.close_time" default="">

<script language="javascript">
function validate_form()
{
    if (document.frm.close_month.value == '' || document.frm.close_day.value == '' || document.frm.close_year.value == '' || document.frm.close_time.value == '') {
    alert('You must fill in the date and time that this Loan was closed');
    return false;
} else {
return true;
}
}

</script>

<cfquery datasource="#request.dsn#" name="getuser">
    select *
    from first_admin
    where id = #url.uid#
</cfquery>

<cfquery name="get_order" datasource="#request.dsn#">
    select *
    from Title
    where title_id = #URL.rec_id#
</cfquery>

<cfquery name="get_comp" datasource="#request.dsn#">
    select *
    from companies
    where id = #get_order.comp_id#
</cfquery>

<cfquery name="get_list" datasource="#request.dsn#">
    select * from eventlist
    where title_id = #get_order.title_id#
</cfquery>

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
                <tr>
                    <td width="99%" align=center valign=top>
                        <FONT FACE=ARIAL SIZE=2 color="red">
	                    <br><br>
                        <center><B>ARE YOU SURE YOU WANT TO CLOSE THIS LOAN?
                        </B><br><br><FONT FACE=ARIAL SIZE=2 color="blue">
                        <!--- If you choose so and would like to proceed click on the "Proceed" button, otherwise click the "Return" button to be redirected to the calendar search menu. ---> To mark this loan as 'closed', please enter the actual date and time of the closing, and click the 'Proceed' button,<br>
otherwise, click the "Return" button to be redirected to the calendar search menu.</center> </td></tr>
						</table>
<CFFORM ACTION="#CGI.SCRIPT_NAME#?uid=#URL.uid#&al=#URL.al#&rec_id=#get_order.title_id#&a_trigger=2" onsubmit="return validate_form();" METHOD=post NAME="frm">

<table align="center">
<tr>
<td align="left" valign="top">
<select name="close_month">
<option value="">Month</option>
<option value="01" <cfif form.close_month eq '01'>selected</cfif>>January</option>
<option value="02" <cfif form.close_month eq '02'>selected</cfif>>February</option>
<option value="03" <cfif form.close_month eq '03'>selected</cfif>>March</option>
<option value="04" <cfif form.close_month eq '04'>selected</cfif>>April</option>
<option value="05" <cfif form.close_month eq '05'>selected</cfif>>May</option>
<option value="06" <cfif form.close_month eq '06'>selected</cfif>>June</option>
<option value="07" <cfif form.close_month eq '07'>selected</cfif>>July</option>
<option value="08" <cfif form.close_month eq '08'>selected</cfif>>August</option>
<option value="09" <cfif form.close_month eq '09'>selected</cfif>>September</option>
<option value="10" <cfif form.close_month eq '10'>selected</cfif>>October</option>
<option value="11" <cfif form.close_month eq '11'>selected</cfif>>November</option>
<option value="12" <cfif form.close_month eq '12'>selected</cfif>>December</option>
</select>
</td>
<td align="left" valign="top"><select name="close_day">
<option value="">Day</option>
<option value="01" <cfif form.close_day eq '01'>selected</cfif>>1</option>
<option value="02" <cfif form.close_day eq '02'>selected</cfif>>2</option>
<option value="03" <cfif form.close_day eq '03'>selected</cfif>>3</option>
<option value="04" <cfif form.close_day eq '04'>selected</cfif>>4</option>
<option value="05" <cfif form.close_day eq '05'>selected</cfif>>5</option>
<option value="06" <cfif form.close_day eq '06'>selected</cfif>>6</option>
<option value="07" <cfif form.close_day eq '07'>selected</cfif>>7</option>
<option value="08" <cfif form.close_day eq '08'>selected</cfif>>8</option>
<option value="09" <cfif form.close_day eq '09'>selected</cfif>>9</option>
<option value="10" <cfif form.close_day eq '10'>selected</cfif>>10</option>
<option value="11" <cfif form.close_day eq '11'>selected</cfif>>11</option>
<option value="12" <cfif form.close_day eq '12'>selected</cfif>>12</option>
<option value="13" <cfif form.close_day eq '13'>selected</cfif>>13</option>
<option value="14" <cfif form.close_day eq '14'>selected</cfif>>14</option>
<option value="15" <cfif form.close_day eq '15'>selected</cfif>>15</option>
<option value="16" <cfif form.close_day eq '16'>selected</cfif>>16</option>
<option value="17" <cfif form.close_day eq '17'>selected</cfif>>17</option>
<option value="18" <cfif form.close_day eq '18'>selected</cfif>>18</option>
<option value="19" <cfif form.close_day eq '19'>selected</cfif>>19</option>
<option value="20" <cfif form.close_day eq '20'>selected</cfif>>20</option>
<option value="21" <cfif form.close_day eq '21'>selected</cfif>>21</option>
<option value="22" <cfif form.close_day eq '22'>selected</cfif>>22</option>
<option value="23" <cfif form.close_day eq '23'>selected</cfif>>23</option>
<option value="24" <cfif form.close_day eq '24'>selected</cfif>>24</option>
<option value="25" <cfif form.close_day eq '25'>selected</cfif>>25</option>
<option value="26" <cfif form.close_day eq '26'>selected</cfif>>26</option>
<option value="27" <cfif form.close_day eq '27'>selected</cfif>>27</option>
<option value="28" <cfif form.close_day eq '28'>selected</cfif>>28</option>
<option value="29" <cfif form.close_day eq '29'>selected</cfif>>29</option>
<option value="30" <cfif form.close_day eq '30'>selected</cfif>>30</option>
<option value="31" <cfif form.close_day eq '31'>selected</cfif>>31</option>
</select></td>
<td align="eft" valign="top"><select name="close_year">
<option value="">Year</option>
<option value="2004" <cfif form.close_year eq '2004'>selected</cfif>>2004</option>
<option value="2005" <cfif form.close_year eq '2005'>selected</cfif>>2005</option>
<option value="2006" <cfif form.close_year eq '2006'>selected</cfif>>2006</option>
<option value="2007" <cfif form.close_year eq '2007'>selected</cfif>>2007</option>
<option value="2008" <cfif form.close_year eq '2008'>selected</cfif>>2008</option>
<option value="2009" <cfif form.close_year eq '2009'>selected</cfif>>2009</option>
<option value="2010" <cfif form.close_year eq '2010'>selected</cfif>>2010</option>
<option value="2011" <cfif form.close_year eq '2011'>selected</cfif>>2011</option>
<option value="2012" <cfif form.close_year eq '2012'>selected</cfif>>2012</option>
<option value="2013" <cfif form.close_year eq '2013'>selected</cfif>>2013</option>
<option value="2014" <cfif form.close_year eq '2014'>selected</cfif>>2014</option>
<option value="2015" <cfif form.close_year eq '2015'>selected</cfif>>2015</option>
<option value="2016" <cfif form.close_year eq '2016'>selected</cfif>>2016</option>
<option value="2017" <cfif form.close_year eq '2017'>selected</cfif>>2017</option>
<option value="2018" <cfif form.close_year eq '2018'>selected</cfif>>2018</option>
<option value="2019" <cfif form.close_year eq '2019'>selected</cfif>>2019</option>
<option value="2020" <cfif form.close_year eq '2020'>selected</cfif>>2020</option>
</select>
</td>
<td align="left" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;</td>
<td align="eft" valign="top"><select name="close_time">
<option value="">Time</option>
<option value="7:00:00" <cfif form.close_time eq '7:00:00'>selected</cfif>>7:00 AM</option>
<option value="7:30:00" <cfif form.close_time eq '7:30:00'>selected</cfif>>7:30 AM</option>
<option value="8:00:00" <cfif form.close_time eq '8:00:00'>selected</cfif>>8:00 AM</option>
<option value="8:30:00" <cfif form.close_time eq '8:30:00'>selected</cfif>>8:30 AM</option>
<option value="9:00:00" <cfif form.close_time eq '9:00:00'>selected</cfif>>9:00 AM</option>
<option value="9:30:00" <cfif form.close_time eq '9:30:00'>selected</cfif>>9:30 AM</option>
<option value="10:00:00" <cfif form.close_time eq '10:00:00'>selected</cfif>>10:00 AM</option>
<option value="10:30:00" <cfif form.close_time eq '10:30:00'>selected</cfif>>10:30 AM</option>
<option value="11:00:00" <cfif form.close_time eq '11:00:00'>selected</cfif>>11:00 AM</option>
<option value="11:30:00" <cfif form.close_time eq '11:30:00'>selected</cfif>>11:30 AM</option>
<option value="12:00:00" <cfif form.close_time eq '12:00:00'>selected</cfif>>12:00 PM</option>
<option value="12:30:00" <cfif form.close_time eq '12:30:00'>selected</cfif>>12:30 PM</option>
<option value="13:00:00" <cfif form.close_time eq '13:00:00'>selected</cfif>>1:00 PM</option>
<option value="13:30:00" <cfif form.close_time eq '13:30:00'>selected</cfif>>1:30 PM</option>
<option value="14:00:00" <cfif form.close_time eq '14:00:00'>selected</cfif>>2:00 PM</option>
<option value="14:30:00" <cfif form.close_time eq '14:30:00'>selected</cfif>>2:30 PM</option>
<option value="15:00:00" <cfif form.close_time eq '15:00:00'>selected</cfif>>3:00 PM</option>
<option value="15:30:00" <cfif form.close_time eq '15:30:00'>selected</cfif>>3:30 PM</option>
<option value="16:00:00" <cfif form.close_time eq '16:00:00'>selected</cfif>>4:00 PM</option>
<option value="16:30:00" <cfif form.close_time eq '16:30:00'>selected</cfif>>4:30 PM</option>
<option value="17:00:00" <cfif form.close_time eq '17:00:00'>selected</cfif>>5:00 PM</option>
<option value="17:30:00" <cfif form.close_time eq '17:30:00'>selected</cfif>>5:30 PM</option>
<option value="18:00:00" <cfif form.close_time eq '18:00:00'>selected</cfif>>6:00 PM</option>
<option value="18:30:00" <cfif form.close_time eq '18:30:00'>selected</cfif>>6:30 PM</option>
<option value="19:00:00" <cfif form.close_time eq '19:00:00'>selected</cfif>>7:00 PM</option>
<option value="19:30:00" <cfif form.close_time eq '19:30:00'>selected</cfif>>7:30 PM</option>
<option value="20:00:00" <cfif form.close_time eq '20:00:00'>selected</cfif>>8:00 PM</option>
<option value="20:30:00" <cfif form.close_time eq '20:30:00'>selected</cfif>>8:30 PM</option>
<option value="21:00:00" <cfif form.close_time eq '21:00:00'>selected</cfif>>9:00 PM</option>
<option value="21:30:00" <cfif form.close_time eq '21:30:00'>selected</cfif>>9:30 PM</option>
<option value="22:00:00" <cfif form.close_time eq '22:00:00'>selected</cfif>>10:00 PM</option>
<option value="22:30:00" <cfif form.close_time eq '22:30:00'>selected</cfif>>10:30 PM</option>
<option value="23:00:00" <cfif form.close_time eq '23:00:00'>selected</cfif>>11:00 PM</option>
<option value="23:30:00" <cfif form.close_time eq '23:30:00'>selected</cfif>>11:30 PM</option>
</select>
</td>
</tr>
</table>
<table width="350" align="center">
	                    <tr>
                            <td width="50%" align=left valign=bottom>
		                        <br><br><br>
<cfoutput>
		<NOBR><a href="https://#cgi.server_name#/admin_area/Calendar_company.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=0&company_id=0" target="work"><img src="./images/button_return.gif" border=0 ALT="Return to main menu"></a>
			</NOBR></cfoutput>
                            </td>
			                <td width="50%" align="right" valign=bottom>
			                    <NOBR><input type=image border=0 src="./images/button_proceed.gif"> &nbsp;&nbsp;&nbsp;&nbsp;</NOBR>
                            </td>
                        </tr>
</table>
</cfform>

<cfif #a_trigger# EQ "2">
   <cfif (#get_list.c_month# NEQ "") AND (#get_order.appraisal_status# eq 'Closing Scheduled' or #get_order.appraisal_status# eq 'In Typing' or #get_order.appraisal_status# eq 'Report E-mailed')>
        <cfquery name="updateclosing" datasource="#request.dsn#">
            update Title
            set
	        Appraisal_status = 'Loan Closed'
            where title_id = #URL.rec_id#
        </cfquery>


        <CFSET order_date_adj = form.close_month & "/" &  form.close_day & "/" & form.close_year & " " & form.close_time>
		 <CFSET cl_button_pushed = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
		<cfquery name="up" datasource="#request.dsn#">
                update eventlist
                set
	            l_date = '#DateFormat(Now(), "m/d/yyyy")#',
	            cl_dateandtime = '#order_date_adj#',
				cl_button_pushed = '#cl_button_pushed#',
	            l_time = '#TimeFormat(Now(), "HH:mm:ss")#'
                where title_id = #URL.rec_id#
            </cfquery>

            <CFQUERY datasource="#request.dsn#" NAME="read_user">
		        select *
                from first_admin
			    WHERE ID = #session.ft_user_id#
		    </CFQUERY>
		    <CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_user.FName#', '#read_user.LName#', #URL.rec_id#, 'Loan Closed', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
		    </CFQUERY>
            <!---Harry 11/12/2004 115 and 621 are MIC and they should not be getting this email.
            I used my name on this so that I can monitor the situation.
            This was all originally regular IF statements that were not working.
            Also, if Weichert it needs to go to the Loan Officer and the Loan Processor
            --->
            <!---Harry 11/15/2004.  Gary told me to add wthomas to the MIC Loan Closed Orders --->
<cfinclude template="send_loan_closed_emails.cfm">
            <!---End Harry 11/12/2004 --->
			<table>
                        <TR>
                            <TD ALIGN=CENTER>
                                <FONT FACE=ARIAL COLOR="red" SIZE=4>Admin - Loan Closed</FONT>
                                <HR>

                            </TD>
                        </TR>
                    <center>
                        <tr>
                            <td>
                                <font size=3 face=arial>
                                Loan has been closed for order &nbsp;<b><cfoutput>#url.rec_id#</cfoutput></b>&nbsp; and an email has been sent for confirmation.
                            </td>
                        </tr>
                        <p>
                        </P>
    <cfelse>
                        <TR>
                            <TD ALIGN=CENTER>
                                <FONT FACE=ARIAL COLOR="red" SIZE=4>Admin - Loan NOT Closed</FONT>
                                <HR>
                            </TD>
                        </TR>
                    <center>
                        <tr>
                            <td><font size=3 face=arial>
                                Loan has WAS NOT closed for order &nbsp;<b><cfoutput>#url.rec_id#</cfoutput></b>&nbsp; Closing information should be sent to client before this function is used!
                            </td>
                        </tr>
                        <p>
                        </P>

    </cfif>
</cfif>
                    </table>
                    </center>