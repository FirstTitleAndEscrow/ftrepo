
		<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM tax_cert_title
			where title_id = 1224
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Title
			WHERE title_ID = 1224

		</CFQUERY>



<CFQUERY datasource="#request.dsn#" NAME="read_title_abstract">
	SELECT *
	FROM Doc_Abstract_Title
	WHERE title_ID = 1224
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_assigned_abstractor">
	SELECT *
	FROM Abstractors
	WHERE abstractor_ID = '#read_title_abstract.abstractor_ID#'
</CFQUERY>
<CFIF #read_title_abstract.abstractor_ID_2# neq "">
	<CFQUERY datasource="#request.dsn#" NAME="read_assigned_abstractor_2">
		SELECT *
		FROM Abstractors
		WHERE abstractor_ID = '#read_title_abstract.abstractor_ID_2#'
	</CFQUERY>
</CFIF>

<CFIF #read_title_abstract.abstractor_ID_3# neq "">
	<CFQUERY datasource="#request.dsn#" NAME="read_assigned_abstractor_3">
		SELECT *
		FROM Abstractors
		WHERE abstractor_ID = '#read_title_abstract.abstractor_ID_3#'
	</CFQUERY>
</CFIF>

<CFQUERY datasource="#request.dsn#" NAME="read_all_abstractors">
	SELECT *
	FROM Abstractors where type = 4
	ORDER BY company ASC, lname ASC, fname ASC
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_zip_code">
	SELECT *
	FROM title
	WHERE pstate = '#read_title.pstate#' AND UPPER(pcounty) = UPPER('#read_title.pcounty#')
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_state">
	SELECT *
	FROM Abstractors_county
	where st_abbrev = '#read_zip_code.pstate#' AND UPPER(ct_name) = UPPER('#read_zip_code.pcounty#')
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_all_abstractors">
	SELECT *
	FROM Abstractors_county a, abstractors b
	where a.st_abbrev = '#read_zip_code.pstate#' AND UPPER(a.ct_name) = UPPER('#read_zip_code.pcounty#') AND a.abstractor_id = b.abstractor_id and b.type = 4
</CFQUERY>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>

</TITLE>
<cfoutput><script type="text/javascript" language="javascript" src="https://#cgi.server_name#/admin_area/calendar/calendar.js"></script></cfoutput>

</HEAD>
<cfoutput><IFRAME STYLE="display:none;position:absolute;width:157;height:158;z-index=100" ID="CalFrame" MARGINHEIGHT=0 MARGINWIDTH=0 NORESIZE FRAMEBORDER=0 SCROLLING=NO SRC="https://#cgi.server_name#/calendar/popup_calendar.html"></IFRAME></cfoutput>

<BODY BGCOLOR="#FFFFFF" TEXT="Black" LINK="Blue" VLINK="Blue" ALINK="Blue" BACKGROUND="./" TopMargin=0 LeftMargin=0 MarginHeight=0 MarginWidth=0>

<CENTER>

<CFFORM  name="frm" ACTION="./title_tax_cert_submit.cfm" ENCTYPE="multipart/form-data" METHOD=POST>

<CFOUTPUT>
<table width=519 cellpadding=1 cellspacing=1 border=0>


		<tr>
			<td width=519 colspan=2 align=left valign=top bgcolor=f3f3f3>
				<font size=3 color=blue face=arial>
				<B>Tax Authority</B>
			</td>
		</tr>


<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Payable To:


		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT Required="Yes" Message="You must enter a TAX ID" type=text name="payto"  size=40 maxlength=50
				VALUE="#read_report.data19#"
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
				clear: none;" >


		</td>
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Tax Collector:


		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT Required="Yes" Message="You must enter a TAX ID" type=text name="taxcoll"  size=40 maxlength=50
				VALUE="#read_report.data19#"
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
				clear: none;" >


		</td>
	</tr>


	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Address-1:


		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT Required="Yes" Message="You must enter a TAX ID" type=text name="add1"  size=40 maxlength=50
				VALUE="#read_report.data19#"
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
				clear: none;" >


		</td>
	</tr>


	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Address-2:


		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT Required="Yes" Message="You must enter a TAX ID" type=text name="add2"  size=40 maxlength=50
				VALUE="#read_report.data19#"
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
				clear: none;" >


		</td>
	</tr>


		<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			City:


		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT Required="Yes" Message="You must enter a TAX ID" type=text name="add2"  size=30 maxlength=50
				VALUE="#read_report.data19#"
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
				clear: none;" >


		</td>
	</tr>



	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			State


		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>
			<select name="state"
size="1"
								style="font-size: 9;
								font-family: verdana;
								font-style: normal;
								color: blue;
								background-color: e1e1e1;
								border-color: e1e1e1;
								border-left-width: thin;
								border-right-width: thin;
								border-top-width: thin;
								border-bottom-width: thin;
								border-width: thin;
								border-style: bar;
								clear: none;
								float: none;"
								rows="5"
								cols="45">
	<cfif #read_report.data29# neq "">
		<option value="#read_report.data29#">#read_report.data29#</option> <cfelse>
<option value="">AL</option>
</cfif>
		<option value="AR">AR</option>

		<option value=""></option>
		</select>


		</td>
	</tr>










	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Zip Code


		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="zip"  size=20 maxlength=50
				VALUE="#read_report.data28#"
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
				clear: none;" >


		</td>
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Phone


		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="phone"  size=30 maxlength=50
				VALUE="#read_report.data28#"
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
				clear: none;" >


		</td>
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Web Address


		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="web"  size=40 maxlength=50
				VALUE="#read_report.data28#"
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
				clear: none;" >


		</td>
	</tr>



	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
		APN/Account Num:


		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="acctnum"  size=30 maxlength=50
				VALUE="#read_report.data28#"
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
				clear: none;" >


		</td>
	</tr>





		<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Tax Frequency:


		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>
	<SELECT NAME="taxfre"
			size="1"
			style="font-size: 9;
			font-family: verdana;
			font-style: normal;
			color: blue;
			background-color: e1e1e1;
			border-color: e1e1e1;
			border-left-width: thin;
			border-right-width: thin;
			border-top-width: thin;
			border-bottom-width: thin;
			border-width: thin;
			border-style: bar;
			clear: none;
			float: none;"
			rows="5"
			cols="45"
			>
			<OPTION VALUE="Annually">Annually</OPTION>
			<OPTION VALUE="Semi Annually">Semi Annually</OPTION>
			<OPTION VALUE="Quarterly">Quarterly</OPTION>

			</SELECT>



</td></tr>


		<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Paid Date:


		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>
	 from <cfINPUT type="text" NAME="paidFrom"  SIZE=10 MAXLENGTH=199
							VALUE=""
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							<A href="javascript:ShowCalendar(document.all('calpic'),document.all('paidFrom'),document.all('null'),'01/1/2003', '12/31/2009')" onclick="event.cancelBubble=true;"><img src="https://#cgi.server_name#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic" style="POSITION: relative"></A>&nbsp;&nbsp;to
							 <cfINPUT type="text" NAME="paidTo"  SIZE=10 MAXLENGTH=199
							VALUE=""
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							<A href="javascript:ShowCalendar(document.all('calpic2'),document.all('paidTo'),document.all('null'),'01/1/2003', '12/31/2009')" onclick="event.cancelBubble=true;"><img src="https://#cgi.server_name#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic2" style="POSITION: relative"></A>




</td></tr>





<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
		Last Tax Amt:


		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="lastamt"  size=30 maxlength=50
				VALUE="#read_report.data28#"
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
				clear: none;" >


		</td>
	</tr>






	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Next Tax Due(Date):


		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>
 from <cfINPUT type="text" NAME="dueFrom"  SIZE=10 MAXLENGTH=199
							VALUE=""
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							<A href="javascript:ShowCalendar(document.all('calpic'),document.all('dueFrom'),document.all('null'),'01/1/2003', '12/31/2009')" onclick="event.cancelBubble=true;"><img src="https://#cgi.server_name#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic" style="POSITION: relative"></A>&nbsp;&nbsp;to
							 <cfINPUT type="text" NAME="paidTo"  SIZE=10 MAXLENGTH=199
							VALUE=""
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >
							<A href="javascript:ShowCalendar(document.all('calpic2'),document.all('dueTo'),document.all('null'),'01/1/2003', '12/31/2009')" onclick="event.cancelBubble=true;"><img src="https://#cgi.server_name#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic2" style="POSITION: relative"></A>




</td></tr>



	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
		Due Amt:


		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="dueamt"  size=30 maxlength=50
				VALUE="#read_report.data28#"
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
				clear: none;" >


		</td>
	</tr>




		<tr>
			<td width=519 colspan=2 align=left valign=top bgcolor=f3f3f3>
				<font size=3 color=blue face=arial>
				<B>Delinquent Information</B>
			</td>
		</tr>





	<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
		Delinquent Amt:


		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>
			<CFINPUT  type=text name="delamt"  size=30 maxlength=50
				VALUE="#read_report.data28#"
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
				clear: none;" >


		</td>
	</tr>





		<tr>
		<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Good Thru Date:


		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>
	 <cfINPUT type="text" NAME="thruDate"  SIZE=10 MAXLENGTH=199
							VALUE=""
							style="font-size: 9;
							font-family: verdana;
							font-style: normal;
							color: 003F1E;
							background-color: E4E3E3;
							border-color: white;
							border-left-width: thin;
							border-right-width: thin;
							border-top-width: thin;
							border-bottom-width: thin;
							border-width: thin;
							border-style: bar;
							clear: none;" >

<A href="javascript:ShowCalendar(document.all('calpic2'),document.all('thruDate'),document.all('null'),'01/1/2003', '12/31/2009')" onclick="event.cancelBubble=true;"><img src="https://#cgi.server_name#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic2" style="POSITION: relative"></A>


</td></tr>


				<tr>
			<td width=519 colspan=2 align=left valign=top bgcolor=f3f3f3>
				<font size=3 color=blue face=arial>
				    <br>
			</td>
		</tr>
	<tr>
	<td width=200 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Comments

		</td>

		<td width=319 align=left valign=top bgcolor=e6e6e6>
			<TEXTAREA name="comments"  COLS=50 ROWS=5
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
					clear: none;">#read_report.data34#
					</TEXTAREA>

		</td>
	</tr>

</CFOUTPUT>
								<tr>
								<td width=200 align=right valign=top bgcolor=e6e6e6>
									<font size=2 color=black face=arial>
									Select Tax Vendor to outsource
								</td>
								<td width=319 align=left valign=top bgcolor=e6e6e6>
									<SELECT NAME="Abstractor_ID_new"
										size="1"
										style="font-size: 9;
										font-family: verdana;
										font-style: normal;
										color: blue;
										background-color: e1e1e1;
										border-color: e1e1e1;
										border-left-width: thin;
										border-right-width: thin;
										border-top-width: thin;
										border-bottom-width: thin;
										border-width: thin;
										border-style: bar;
										clear: none;
										float: none;"
										rows="5"
										cols="45"
										>
									<OPTION VALUE="NONE" SELECTED></OPTION>



									</SELECT>

		<tr>
			<td width=519 colspan=2  align=right valign=top bgcolor=e1e1e1>
				<input type=image src="./images/button_submit.gif" border=0>
			</td>
		</tr>




	</table>

</cfform>




</BODY>
</HTML>
