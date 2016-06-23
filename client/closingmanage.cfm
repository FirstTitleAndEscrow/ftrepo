<img src="http://www.firsttitleservices.com/images/logo.jpg" width="460" height="110" title="First Title" alt="First Title" border="0">
<cfsetting showdebugoutput="no">
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_title">
	SELECT *
	FROM Title
	WHERE title_ID = #rec_ID#
</cfquery>
<CFQUERY DATASOURCE="#request.dsn#" NAME="comments">
	SELECT *
	FROM eventlist
	Where Title_Id = #rec_id#
</CFQUERY>
 <cfquery name="getorderinfo" DATASOURCE="#request.dsn#">
SELECT *
FROM Title_Closing_Order_Request
Where Title_Id = #rec_id#
</cfquery>
<cfif a EQ 3>
<center>
<cfoutput>
<cfif isDefined("form.submit")>
	<cfif a EQ 3>
		<cfmail to="ybattle@firsttitleservices.com" FROM="webmaster@firsttitleservices.com" Subject="Status message for closing T-#rec_id#">The closing for file #rec_id# <cfif takeplace EQ 1>did take place as scheduled.<cfelse>did not take place as scheduled. The closer stated the reason as #whynot#.</cfif> Additional comments: #additionalcomments#
		</cfmail>
		
		<cfif takeplace EQ 1>
			 <cfquery name="updateclosing" datasource="#request.dsn#">
	            update Title
	            set 
		        Appraisal_status = 'Loan Closed'			
	            where title_id = #rec_id#
	        </cfquery>
	        <CFSET cl_button_pushed = '#DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now(), "HH:mm:ss")#'>
			<cfquery name="up" datasource="#request.dsn#">
                update eventlist
                set 
	            l_date = '#DateFormat(Now(), "m/d/yyyy")#',
	            cl_dateandtime = '#cl_button_pushed#',
				cl_button_pushed = '#cl_button_pushed#',
	            l_time = '#TimeFormat(Now(), "HH:mm:ss")#'
                where title_id = #rec_id#
            </cfquery>
		</cfif>
	</cfif>
	<h4>Thank you for your feedback.</h4>
<cfelse>
<h4>Closing Scheduled For #read_title.title_id# -- Loan Number-#read_title.loan_number#</h4>
<form action="closingmanage.cfm" method="post">
<input type="hidden" value="3" name="a">
<input type="hidden" value="#rec_id#" name="rec_id">
<table width=100% cellpadding=1 cellspacing=1 border=1 bgcolor=e1e1e1>
		<tr>
			<td align=center valign=top bgcolor=e1e1e1>

			<font face=verdana size=2 color=black>
			<NOBR>Did this closing take place? - </NOBR>
			<br><font face=verdana size=2 color=blue><B><input type="radio" name="takeplace" value="1" checked> Yes</B></font>
			<br><font face=verdana size=2 color=blue><B><input type="radio" name="takeplace" value="0"> No</B></font>
			</td>
		</tr>
		<tr>
			<td align=center valign=top bgcolor=e1e1e1>

			<font face=verdana size=2 color=black>
			<NOBR>If no why did i not take place? - </NOBR>
			<br><font face=verdana size=2 color=blue><B><input type="text" name="whynot"></B></font>
			
			</td>
		</tr>
		<tr>
			<td align=center valign=top bgcolor=e1e1e1>

			<font face=verdana size=2 color=black>
			<NOBR>Additional Comments - </NOBR>
			<br><font face=verdana size=2 color=blue><B><input type="text" name="additionalcomments"></B></font>
			
			</td>
		</tr>
</table>
<input type="submit" value="submit" name="submit">
</form>
</cfif>
</cfoutput>
</center>
</cfif>
<cfif a EQ 2>
<center>
<cfoutput>
<cfif isDefined("form.submit")>
	<cfif a EQ 2>
		<cfmail to="ybattle@firsttitleservices.com" FROM="webmaster@firsttitleservices.com" Subject="Status message for closing T-#rec_id#">The closer for file #rec_id# has been <cfif ontime EQ 1>will be on time for the closing.<cfelse>will not be on time for the closing. The closer will be #howlate# late.</cfif> Additional comments: #additionalcomments#
		</cfmail>
	</cfif>
	<h4>Thank you for your feedback.</h4>
<cfelse>
<h4>Closing Scheduled For #read_title.title_id# -- Loan Number-#read_title.loan_number#</h4>
<form action="closingmanage.cfm" method="post">
<input type="hidden" value="2" name="a">
<input type="hidden" value="#rec_id#" name="rec_id">
<table width=100% cellpadding=1 cellspacing=1 border=1 bgcolor=e1e1e1>
		<tr>
			<td align=center valign=top bgcolor=e1e1e1>

			<font face=verdana size=2 color=black>
			<NOBR>Will you be on time for your scheduled closing? - </NOBR>
			<br><font face=verdana size=2 color=blue><B><input type="radio" name="ontime" value="1" checked> Yes</B></font>
			<br><font face=verdana size=2 color=blue><B><input type="radio" name="ontime" value="0"> No</B></font>
			</td>
		</tr>
		<tr>
			<td align=center valign=top bgcolor=e1e1e1>

			<font face=verdana size=2 color=black>
			<NOBR>If no how late will you be? - </NOBR>
			<br><font face=verdana size=2 color=blue><B><input type="text" name="howlate"></B></font>
			
			</td>
		</tr>
		<tr>
			<td align=center valign=top bgcolor=e1e1e1>

			<font face=verdana size=2 color=black>
			<NOBR>Additional Comments - </NOBR>
			<br><font face=verdana size=2 color=blue><B><input type="text" name="additionalcomments"></B></font>
			
			</td>
		</tr>
</table>
<input type="submit" value="submit" name="submit">
</form>
</cfif>
</cfoutput>
</center>
</cfif>
<cfif a EQ 1>
<cfif isDefined("form.submit")>
	<cfif a EQ 1>
		<cfmail to="ybattle@firsttitleservices.com" FROM="webmaster@firsttitleservices.com" Subject="Status message for closing T-#rec_id#">The file #rec_id# has been <cfif accepted EQ 1>accepted<cfelse>rejected</cfif> by the closer.
		</cfmail>
	</cfif>
	<h4>Thank you for your feedback.</h4>
<cfelse>

<center>
<cfoutput>
<h4>Closing Scheduled For #read_title.title_id# -- Loan Number-#read_title.loan_number#</h4>
<form action="closingmanage.cfm" method="post">
<input type="hidden" value="1" name="a">
<input type="hidden" value="#rec_id#" name="rec_id">
<input type="radio" name="accepted" value="1" checked> Accept This Closing
<br><input type="radio" name="accepted" value="0"> Reject This Closing
<br>
<input type="submit" value="submit" name="submit">
</form>
<table width=100% cellpadding=1 cellspacing=1 border=1 bgcolor=e1e1e1>
		<tr>
			<td align=center valign=top bgcolor=e1e1e1>

			<font face=verdana size=2 color=black>
			<NOBR>Order number - <font face=verdana size=2 color=blue><B>#rec_id#</B></font></NOBR>
			</td>
		</tr>



		<tr>
			<td width=110 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>1st Borrower Name - <font face=verdana size=2 color=blue>
			<B>#Read_Title.BFirstName1# #Read_Title.bminame1# &nbsp;&nbsp;#Read_Title.BLastName1#</B><cfif #Read_Title.Bhphone1# neq "">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone: <font face=verdana size=2 color=blue><B>#Read_Title.Bhphone1#</b></cfif></NOBR>
			</td>

		</tr>


		<tr>
			<td width=110 align=center valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>2nd Borrower Name - <font face=verdana size=2 color=blue>
			<B>#Read_Title.BFirstName2# #Read_Title.bminame2# &nbsp;&nbsp;#Read_Title.BLastName2#</B><cfif #Read_Title.Bhphone2# neq "">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone: <font face=verdana size=2 color=blue><B>#Read_Title.Bhphone2#</b></cfif></NOBR>
			</td>


		</tr>



		<tr>
			<td width=620 align=left valign=top bgcolor=e1e1e1>
			<font face=verdana size=2 color=black>
			<NOBR>Address - <font face=verdana size=2 color=blue><b>#Read_Title.pADDRESS#</b></font>
			<br><br>
			City - <font face=verdana size=2 color=blue><b> #Read_Title.pcity#</b></font>
			<br><br>			
			State - <font face=verdana size=2 color=blue><b>#Read_Title.pstate#</b></font></NOBR>
			<br><br>
			Zip - <font face=verdana size=2 color=blue><b>#Read_Title.pzip#</b></font>
			
		</td>
		</tr>





</table>
<table width=100% cellpadding=1 cellspacing=1 border=1 bgcolor=e1e1e1>



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
</table>
<table width=100% cellpadding=1 cellspacing=1 border=1 bgcolor=e1e1e1>

<tr>
	<td width="30%" align=center valign=middle bgcolor=e1e1e1><font size=2 face=arial>Closing Details</font> </td>
	 <td width="70%" align=left valign=top bgcolor=e1e1e1><font size=2 face=arial>
	#comments.c_comment#


</tr>

</table>
</center>
</cfoutput>
</cfif>
</cfif>