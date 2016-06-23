<cfset dateCalendarStart = "01/01/2010">
<cfset dateCalendarEnd = "12/31/2012">
<cfparam name="uid" default="">
<cfparam name="lo_id" default="">
<cfparam name="rec_id" default="52555">

<cffunction name="FixDecimals" >
	<cfargument name="input_num">
	<cfif IsNumeric(arguments.input_num)>
		<cfset new_num = NumberFormat(arguments.input_num, "_,___,___,___.__")>
	<cfelse>
		<cfset new_num = arguments.input_num>
	</cfif>
	<cfif arguments.input_num eq 0>
		<cfset new_num = "">
	</cfif>
	<cfset new_num = "">
	<cfreturn new_num>
	<cfoutput><cfdump var="#new_num#"></cfoutput><cfabort>
</cffunction>

<CFQUERY datasource="#request.dsn#" NAME="get_title_data">
			SELECT *
			FROM title
			WHERE Title_ID = #rec_id#
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_hud_data">
			SELECT *
			FROM HUD2010_TITLE_DATA
			WHERE Title_ID = #rec_id#
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="get_hud_data_b">
			SELECT *
			FROM HUD2010_TITLE_DATA_B
			WHERE Title_ID = #rec_id#
		</CFQUERY>

<cfoutput>
<html>
<head>
<title>Settlement Statement (HUD-1)</title>
<script type="text/javascript" language="javascript" src="https://www.firsttitleservices.com/admin_area/calendar/calendar.js"></script>
<style type="text/css">
<!--
body { margin:0px;padding:0px;font-family:arial,sans-serif;font-size:10px;}
table { font-size:10px;}
textarea { font-family:arial,sans-serif; font-size:10px; }
input.text, input.date, input.two_digit, input.four_digit { font-size:10px; width:180px; }
input.userout { font-size:10px; width:160px; }
input.userin { font-size:10px; width:180px; }
p.pagebreak { page-break-before:always }
.page_container { width:1110px; }
.page_title { font-size:20px; }
.table_header { font-weight:bold; background-color:black; color:white; }
.bsilver { border-right:1px solid black; border-left:1px solid black; border-bottom:1px solid black;  background-color:##dddddd; }
.bdarksilver { border:1px solid black; background-color:##bbbbbb; }
.bdarksilver_head { border:1px solid black; font-weight:bold; background-color:##bbbbbb; }
.black { font-weight:bold; background-color:black; color:white; }
.bordered { border-bottom:1px solid black; border-right:1px solid black; text-align:right; vertical-align:bottom;  }
.bordered_wleft { border-bottom:1px solid black; border-left:1px solid black; border-right:1px solid black; text-align:right; vertical-align:bottom;  }
input.two_digit { width:100px}
input.date { width:100px; }
<cfif isDefined('form.populatevarnames')>
.page_container { width:1470px; }
textarea { font-family:arial,sans-serif; font-size:10px; color:##004000; background:##cdfed0; border:1px dotted ##004000; }
input.text, input.date, input.two_digit, input.four_digit { font-size:10px; width:180px; color:##004000;background:##cdfed0; border:1px dotted ##004000; }
input.userout { font-size:10px; width:180px; color:##400000; background:##ffdfdf; border:1px dotted ##400000; }
input.userin { font-size:10px; width:180px; color:##400000; background:##ffdfdf; border:1px dotted ##400000; }
input.two_digit { width:180px}
input.date { width:180px; }
-->
</style>
	<cfset fieldlist=form.fieldnames>
	<cfset fieldlist=ListDeleteAt(fieldlist,ListFindNoCase(fieldlist,'POPULATEVARNAMES'))>
	<script type="text/javascript" language="JavaScript"><!--
		function writeName() {
		<cfloop list="#fieldlist#" index="i">document.hud1_form.#i#.value = '#i#';
		</cfloop> }
	//--></script>
	</head>
	<body onload="writeName();">
<cfelse>
-->
</style>
	</head>
	<body>
</cfif>

	<IFRAME STYLE="display:none;position:absolute;width:157;height:158;z-index=100" ID="CalFrame" MARGINHEIGHT=0 MARGINWIDTH=0 NORESIZE FRAMEBORDER=0 SCROLLING=NO SRC="https://www.firsttitleservices.com/calendar/popup_calendar.html"></IFRAME>

<div class="page_container">

<form action="https://#cgi.server_name#/HUD1_2010_modify_submit.cfm" method="post" name="hud1_form">
<input type="hidden" name="rec_id" value="#rec_id#" >
<!--- <br /><br /><br />
<input type="submit" name="populatevarnames" value="Populate Variable Names" >
<input type="submit" name="clearvarnames" value="Clear Variable Names" >
<br /><br /><br />

	<cfif isDefined('form.populatevarnames')>
		<span class="page_title">#ListLen(form.fieldnames)# Form Fields Found</span>
		<br />
		<span class="left_text"><em>click below for details</em></span>
		<cfset structVarList=StructCopy(#form#)>
		<cfset boolDeleteSuccess=StructDelete(structVarList, "FIELDNAMES")>
		<cfdump var="#structVarList#" expand="false" label="Form Scope Dump (FORM.FIELDNAMES removed)">
	<cfelse>
		<span class="page_title">Press the button to populate the variable names. </span>
	</cfif>

<br /><br /><br />

<!-- HEADER
<img alt="HUD Logo" src="HUD%20Logo.png" height="64" width="70" />
<div style="position:absolute;top:24;left:82"><span class="page_title">A. Settlement Statement (HUD-1)</span></div>
<div style="position:absolute;top:23;left:518"><span>OMB Approval No. 2502-0265</span></div>
<div style="position:absolute;top:38;left:518"><span class="gray_title">DRAFT - QUOTE VALID UNTIL #DateFormat(DateAdd("d", 60, Now()), "mm/dd/yyyy")#</span></div>
    	-->
 --->
<!-- TABLE: Type of Loan -->
<table width="100%" summary="Type of Loan" border="1" cellspacing="0">
<tr>
<td colspan="4" class="black">B. Type of Loan</td>
</tr>
<tr>
<td>
<table summary="Loan Types" cellpadding="0" cellspacing="0">
<tr>
<td><input type="radio" name="B_LOANTYPE" value="FHA" <cfif get_hud_data.B_LOANTYPE eq 'FHA'>checked</cfif> /></td><td>FHA</td>
<td><input type="radio" name="B_LOANTYPE" value="RHS" <cfif get_hud_data.B_LOANTYPE eq 'RHS'>checked</cfif> /></td><td>RHS</td>
<td><input type="radio" name="B_LOANTYPE" value="COU" <cfif get_hud_data.B_LOANTYPE eq 'COU'>checked</cfif> /></td><td>Conv. Unins.</td>
<tr>
<tr>
<td><input type="radio" name="B_LOANTYPE" value="VA" checked <cfif get_hud_data.B_LOANTYPE eq 'VA'>checked</cfif> /></td><td>VA</td>
<td><input type="radio" name="B_LOANTYPE" value="COI" <cfif get_hud_data.B_LOANTYPE eq 'COI'>checked</cfif> /></td><td>Conv. Ins.</td>
<tr>
</table>
</td>
<td>6. File Number: <br /> <input type="text" class="text" name="B_6_FILENUMBER" value="#get_title_data.title_id#" /> </td>
<td>7. Loan Number: <br /> <input type="text" class="text" name="B_7_LOANNUMBER" value="#get_title_data.loan_number#" /> </td>
<td>8. Mortgage Insurance Case Number: <br /> <input type="text" class="text" name="B_8_CASENUMBER" valye="#get_hud_data.B_8_CASENUMBER#" /> </td>
</tr>
<tr>
<td colspan="4"><b>C. Note:</b> This form is furnished to give you a statement of actual settlement costs. Amounts paid to and by the settlement agent are shown. Items marked
"(p.o.c.)" were paid outside the closing; they are shown here for informational purposes and are not included in the totals.</td>
</tr>
<tr>
<td>D. Name &amp; Address of Borrower: <br /> <textarea cols="40" rows="3" name="D_BORROWERNAMEADDRESS">#get_hud_data.D_BORROWERNAMEADDRESS#</textarea> </td>
<td colspan="2">E. Name &amp; Address of Seller: <br /> <textarea cols="40" rows="3" name="E_SELLERNAMEADDRESS">#get_hud_data.E_SELLERNAMEADDRESS#</textarea> </td>
<td>F. Name &amp; Address of Lender: <br /> <textarea cols="40" rows="3" name="F_LENDERNAMEADDRESS">#get_hud_data.F_LENDERNAMEADDRESS#</textarea> </td>
</tr>
<tr>
<td rowspan="2" valign="top">G. Property Location: <br />
<input type="text" class="text" name="PADDRESS"  value="#get_title_data.PADDRESS#" /> <br />
<input type="text" class="text" name="PCOUNTY" value="#get_title_data.PCOUNTY#" /> <br />
<input type="text" class="text" name="PCITY" value="#get_title_data.PCITY#" /> <br />
<input type="text" class="text" name="PSTATE" value="#get_title_data.PSTATE#" /> <br />
<input type="text" class="text" name="PZIP" value="#get_title_data.PZIP#" />
</td>
<td colspan="2">H. Settlement Agent: <br /> <input type="text" class="text" name="H_SETTLEMENTAGENT"  value="#get_hud_data.H_SETTLEMENTAGENT#" /> </td>
<td>I. Settlement Date: <br /> <input type="text" class="date" name="I_1_SETTLEMENTDATE"  value="#get_hud_data.I_1_SETTLEMENTDATE#" />
<A href="javascript:ShowCalendar(document.all('calpic'),document.all('I_1_SETTLEMENTDATE'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://#CGI.SERVER_NAME#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic" style="POSITION: relative"></A> </td>
</tr>
<tr>
<td colspan="2">Place of Settlement: <br /> <textarea cols="40" rows="3" name="I_2_SETTLEMENTADDRESS">#get_hud_data.I_1_SETTLEMENTDATE#</textarea></td>
<td>&nbsp;</td>
</tr>
</table><!-- TABLE: Type of Loan -->

<br />

<!-- TABLE: Summary of Transactions -->
<table width="100%" cellspacing="0" border="0" summary="Summary of Transactions">
<tr>
<td colspan="2" class="table_header">J. Summary of Borrower's Transaction</td>
<td>&nbsp;  </td>
<td colspan="2" class="table_header">K. Summary of Seller's Transaction</td>
</tr>
<tr><td height="1" colspan="2"></td><td></td><td height="1" colspan="2"></td></tr>
<tr>
<td colspan="2" class="bdarksilver_head">100. Gross Amount Due from Borrower</td>
<td></td>
<td colspan="2" class="bdarksilver_head">400. Gross Amount Due to Seller</td>
</tr>
<tr>
<td class="bsilver">101. Contract sales price</td>
<td class="bordered"><input type="text" class="text" name="A_0101_CONTRACTSALESPRICE"  value="#Trim(get_hud_data.A_0101_CONTRACTSALESPRICE)#"  /></td>
<td></td>
<td class="bsilver">401. Contract sales price</td>
<td class="bordered"><input type="text" class="text" name="A_0401_CONTRACTSALESPRICE"  value="#get_hud_data.A_0401_CONTRACTSALESPRICE#" /></td>
</tr>
<tr>
<td class="bsilver">102. Personal property</td>
<td class="bordered"><input type="text" class="text" name="A_0102_PERSONALPROPERTY"  value="#get_hud_data.A_0102_PERSONALPROPERTY#"/></td>
<td></td>
<td class="bsilver">402. Personal property</td>
<td class="bordered"><input type="text" class="text" name="A_0402_PERSONALPROPERTY"  value="#get_hud_data.A_0402_PERSONALPROPERTY#"/></td>
</tr>
<tr>
<td class="bsilver">103. Settlement charges to borrower (line 1400)</td>
<td class="bordered"><input type="text" class="text" name="A_0103_SETTLEMENTCHARGESTOBORROWER"  value="#get_hud_data.A_0103_SETTLEMENTCHARGESTOBORROWER#"/></td>
<td></td>
<td class="bsilver">403.</td>
<td class="bordered">&nbsp;</td>
</tr>
<tr>
<td class="bsilver">104. <input type="text" class="userout" name="A_0104_USERDESC"  value="#get_hud_data.A_0104_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0104_USERAMOUNT" value="#get_hud_data.A_0104_USERAMOUNT#" /></td>
<td></td>
<td class="bsilver">404. <input type="text" class="userout" name="A_0404_USERDESC" value="#get_hud_data.A_0104_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0404_USERAMOUNT" value="#get_hud_data.A_0404_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">105. <input type="text" class="userout" name="A_0105_USERDESC" value="#get_hud_data.A_0104_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0105_USERAMOUNT" value="#get_hud_data.A_0105_USERAMOUNT#" /></td>
<td></td>
<td class="bsilver">405. <input type="text" class="userout" name="A_0405_USERDESC" value="#get_hud_data.A_0104_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0405_USERAMOUNT" value="#get_hud_data.A_0405_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver" colspan="2" style="font-weight:bold;">Adjustment for items paid by seller in advance</td>
<td></td>
<td class="bsilver" colspan="2" style="font-weight:bold;">Adjustments for items paid by seller in advance</td>
</tr>
<tr>
<td class="bsilver">106. City/town taxes
<input type="text" class="date" name="A_0106_CITYTOWNTAXESDATEFROM"  value="#DateFormat(get_hud_data.A_0106_CITYTOWNTAXESDATEFROM, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic2'),document.all('A_0106_CITYTOWNTAXESDATEFROM'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://#CGI.SERVER_NAME#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic2" style="POSITION: relative"></A>
to <input type="text" class="date" name="A_0106_CITYTOWNTAXESDATETO"  value="#DateFormat(get_hud_data.A_0106_CITYTOWNTAXESDATETO, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic3'),document.all('A_0106_CITYTOWNTAXESDATETO'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://#CGI.SERVER_NAME#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic3" style="POSITION: relative"></A></td>
<td class="bordered"><input type="text" class="text" name="A_0106_CITYTOWNTAXESAMOUNT"  value="#get_hud_data.A_0106_CITYTOWNTAXESAMOUNT#" /></td>
<td></td>
<td class="bsilver">406. City/town taxes
<input type="text" class="date" name="A_0406_CITYTOWNTAXESDATEFROM" value="#DateFormat(get_hud_data.A_0406_CITYTOWNTAXESDATEFROM, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic4'),document.all('A_0406_CITYTOWNTAXESDATEFROM'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://#CGI.SERVER_NAME#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic4" style="POSITION: relative"></A>
to <input type="text" class="date" name="A_0406_CITYTOWNTAXESDATETO" value="#DateFormat(get_hud_data.A_0406_CITYTOWNTAXESDATETO, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic5'),document.all('A_0406_CITYTOWNTAXESDATETO'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://#CGI.SERVER_NAME#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic5" style="POSITION: relative"></A></td>
<td class="bordered"><input type="text" class="text" name="A_0406_CITYTOWNTAXESAMOUNT"  value="#get_hud_data.A_0406_CITYTOWNTAXESAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">107. County taxes
<input type="text" class="date" name="A_0107_COUNTYTAXESDATEFROM" value="#DateFormat(get_hud_data.A_0107_COUNTYTAXESDATEFROM, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic6'),document.all('A_0107_COUNTYTAXESDATEFROM'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://#CGI.SERVER_NAME#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic6" style="POSITION: relative"></A>
to <input type="text" class="date" name="A_0107_COUNTYTAXESDATETO" value="#DateFormat(get_hud_data.A_0107_COUNTYTAXESDATETO, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic7'),document.all('A_0107_COUNTYTAXESDATETO'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://#CGI.SERVER_NAME#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic7" style="POSITION: relative"></A></td>
<td class="bordered"><input type="text" class="text" name="A_0107_COUNTYTAXESAMOUNT" value="#get_hud_data.A_0107_COUNTYTAXESAMOUNT#" /></td>
<td></td>
<td class="bsilver">407. County taxes
<input type="text" class="date" name="A_0407_COUNTYTAXESDATEFROM" value="#DateFormat(get_hud_data.A_0407_COUNTYTAXESDATEFROM, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic8'),document.all('A_0407_COUNTYTAXESDATEFROM'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://#CGI.SERVER_NAME#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic8" style="POSITION: relative"></A>
to <input type="text" class="date" name="A_0407_COUNTYTAXESDATETO" value="#DateFormat(get_hud_data.A_0407_COUNTYTAXESDATETO, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic9'),document.all('A_0407_COUNTYTAXESDATETO'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://#CGI.SERVER_NAME#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic9" style="POSITION: relative"></A></td>
<td class="bordered"><input type="text" class="text" name="A_0407_COUNTYTAXESAMOUNT" value="#get_hud_data.A_0407_COUNTYTAXESAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">108. Assessments
<input type="text" class="date" name="A_0108_ASSESSMENTSDATEFROM" value="#DateFormat(get_hud_data.A_0108_ASSESSMENTSDATEFROM, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic10'),document.all('A_0108_ASSESSMENTSDATEFROM'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://#CGI.SERVER_NAME#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic10" style="POSITION: relative"></A>
to <input type="text" class="date" name="A_0108_ASSESSMENTSDATETO" value="#DateFormat(get_hud_data.A_0108_ASSESSMENTSDATETO, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic11'),document.all('A_0108_ASSESSMENTSDATETO'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://#CGI.SERVER_NAME#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic11" style="POSITION: relative"></A></td>
<td class="bordered"><input type="text" class="text" name="A_0108_ASSESSMENTSAMOUNT" value="#get_hud_data.A_0108_ASSESSMENTSAMOUNT#" /></td>
<td></td>
<td class="bsilver">408. Assessments
<input type="text" class="date" name="A_0408_ASSESSMENTSDATEFROM" value="#DateFormat(get_hud_data.A_0408_ASSESSMENTSDATEFROM, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic12'),document.all('A_0408_ASSESSMENTSDATEFROM'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://#CGI.SERVER_NAME#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic12" style="POSITION: relative"></A>
to <input type="text" class="date" name="A_0408_ASSESSMENTSDATETO" value="#DateFormat(get_hud_data.A_0408_ASSESSMENTSDATETO, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic13'),document.all('A_0408_ASSESSMENTSDATETO'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://#CGI.SERVER_NAME#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic13" style="POSITION: relative"></A></td>
<td class="bordered"><input type="text" class="text" name="A_0408_ASSESSMENTSAMOUNT" value="#get_hud_data.A_0408_ASSESSMENTSAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">109. <input type="text" class="userout" name="A_0109_USERDESC" value="#get_hud_data.A_0109_USERDESC#" />
 to <input type="text" class="userout" name="A_0109_USERPAYTO" value="#get_hud_data.A_0109_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0109_USERAMOUNT" value="#get_hud_data.A_0109_USERAMOUNT#" /></td>
<td></td>
<td class="bsilver">409. <input type="text" class="userout" name="A_0409_USERDESC" value="#get_hud_data.A_0409_USERDESC#" />
to <input type="text" class="userout" name="A_0409_USERPAYTO" value="#get_hud_data.A_0409_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0409_USERAMOUNT" value="#get_hud_data.A_0409_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">110. <input type="text" class="userout" name="A_0110_USERDESC" value="#get_hud_data.A_0110_USERDESC#" />
to <input type="text" class="userout" name="A_0110_USERPAYTO" value="#get_hud_data.A_0110_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0110_USERAMOUNT" value="#get_hud_data.A_0110_USERAMOUNT#" /></td>
<td></td>
<td class="bsilver">410. <input type="text" class="userout" name="A_0410_USERDESC" value="#get_hud_data.A_0410_USERDESC#" />
to <input type="text" class="userout" name="A_0410_USERPAYTO" value="#get_hud_data.A_0410_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0410_USERAMOUNT" value="#get_hud_data.A_0410_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">111. <input type="text" class="userout" name="A_0111_USERDESC" value="#get_hud_data.A_0111_USERDESC#" />
to <input type="text" class="userout" name="A_0111_USERPAYTO" value="#get_hud_data.A_0111_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0111_USERAMOUNT" value="#get_hud_data.A_0111_USERAMOUNT#" /></td>
<td></td>
<td class="bsilver">411. <input type="text" class="userout" name="A_0411_USERDESC" value="#get_hud_data.A_0411_USERDESC#" />
to <input type="text" class="userout" name="A_0411_USERPAYTO" value="#get_hud_data.A_0411_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0411_USERAMOUNT" value="#get_hud_data.A_0411_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">112. <input type="text" class="userout" name="A_0112_USERDESC" value="#get_hud_data.A_0112_USERDESC#" />
to <input type="text" class="userout" name="A_0112_USERPAYTO" value="#get_hud_data.A_0112_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0112_USERAMOUNT" value="#get_hud_data.A_0112_USERAMOUNT#" /></td>
<td></td>
<td class="bsilver">412. <input type="text" class="userout" name="A_0412_USERDESC" value="#get_hud_data.A_0412_USERDESC#" />
to <input type="text" class="userout" name="A_0412_USERPAYTO" value="#get_hud_data.A_0412_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0412_USERAMOUNT" value="#get_hud_data.A_0412_USERAMOUNT#" /></td>
</tr>


<!-- 200 / 500 -->

<tr>
<td colspan="2" class="bdarksilver_head">200. Amounts Paid by or in Behalf of Borrower</td>
<td></td>
<td colspan="2" class="bdarksilver_head">500. Reductions In Amount Due to Seller</td>
</tr>
<tr>
<td class="bsilver">201. Deposit or earnest money</td>
<td class="bordered"><input type="text" class="text" name="A_0201_EARNESTMONEYAMOUNT" value="#get_hud_data.A_0412_USERAMOUNT#" /></td>
<td></td>
<td class="bsilver">501. Excess deposit (see instructions)</td>
<td class="bordered"><input type="text" class="text" name="A_0501_EXCESSDEPOSITAMOUNT" value="#get_hud_data.A_0412_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">202. Principal amount of new loan(s)</td>
<td class="bordered"><input type="text" class="text" name="A_0202_PRINCIPALNEWLOANAMOUNT" value="#get_hud_data.A_0412_USERAMOUNT#" /></td>
<td></td>
<td class="bsilver">502. Settlement charges to seller (line 1400)</td>
<td class="bordered"><input type="text" class="text" name="A_0502_SETTLEMENTCHARGESTOSELLERAMOUNT" value="#get_hud_data.A_0412_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">203. Existing loan(s) taken subject to</td>
<td class="bordered"><input type="text" class="text" name="A_0203_EXISTINGLOANSAMOUNT" value="#get_hud_data.A_0412_USERAMOUNT#" /></td>
<td></td>
<td class="bsilver">503. Existing loan(s) taken subject to</td>
<td class="bordered"><input type="text" class="text" name="A_0503_EXISTINGLOANSAMOUNT" value="#get_hud_data.A_0412_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">204.</td>
<td class="bordered">&nbsp;</td>
<td></td>
<td class="bsilver">504. Payoff of first mortgage loan</td>
<td class="bordered"><input type="text" class="text" name="A_0504_PAYOFFFIRSTMORTGAGEAMOUNT" value="#get_hud_data.A_0412_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">205.</td>
<td class="bordered">&nbsp;</td>
<td></td>
<td class="bsilver">505. Payoff of second mortgage loan</td>
<td class="bordered"><input type="text" class="text" name="A_0505_PAYOFFSECONDMORTGAGEAMOUNT" value="#get_hud_data.A_0412_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">206. <input type="text" class="userout" name="A_0206_USERDESC" value="#get_hud_data.A_0206_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0206_USERAMOUNT" value="#get_hud_data.A_0206_USERAMOUNT#" /></td>
<td></td>
<td class="bsilver">506. <input type="text" class="userout" name="A_0506_USERDESC" value="#get_hud_data.A_0506_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0506_USERAMOUNT" value="#get_hud_data.A_0506_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">207. <input type="text" class="userout" name="A_0207_USERDESC" value="#get_hud_data.A_0207_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0207_USERAMOUNT" value="#get_hud_data.A_0207_USERAMOUNT#" /></td>
<td></td>
<td class="bsilver">507. <input type="text" class="userout" name="A_0507_USERDESC" value="#get_hud_data.A_0507_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0507_USERAMOUNT" value="#get_hud_data.A_0507_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">208. <input type="text" class="userout" name="A_0208_USERDESC" value="#get_hud_data.A_0208_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0208_USERAMOUNT" value="#get_hud_data.A_0208_USERAMOUNT#" /></td>
<td></td>
<td class="bsilver">508. <input type="text" class="userout" name="A_0508_USERDESC" value="#get_hud_data.A_0508_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0508_USERAMOUNT" value="#get_hud_data.A_0508_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">209. <input type="text" class="userout" name="A_0209_USERDESC" value="#get_hud_data.A_0209_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0209_USERAMOUNT" value="#get_hud_data.A_0209_USERAMOUNT#" /></td>
<td></td>
<td class="bsilver">509. <input type="text" class="userout" name="A_0509_USERDESC" value="#get_hud_data.A_0509_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0509_USERAMOUNT" value="#get_hud_data.A_0509_USERAMOUNT#" /></td>
</tr>

<!-- Adjustments 200 / 500 -->

<tr>
<td class="bsilver" colspan="2" style="font-weight:bold;">Adjustments for items unpaid by seller</td>
<td></td>
<td class="bsilver" colspan="2" style="font-weight:bold;">Adjustments for items unpaid by seller</td>
</tr>
<tr>
<td class="bsilver">210. City/town taxes
<input type="text" class="date" name="A_0210_CITYTOWNTAXESDATEFROM" value="#DateFormat(get_hud_data.A_0210_CITYTOWNTAXESDATEFROM, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic14'),document.all('A_0210_CITYTOWNTAXESDATEFROM'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://#CGI.SERVER_NAME#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic14" style="POSITION: relative"></A>
 to <input type="text" class="date" name="A_0210_CITYTOWNTAXESDATETO" value="#DateFormat(get_hud_data.A_0210_CITYTOWNTAXESDATETO, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic15'),document.all('A_0210_CITYTOWNTAXESDATETO'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://#CGI.SERVER_NAME#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic15" style="POSITION: relative"></A></td>
<td class="bordered"><input type="text" class="text" name="A_0210_CITYTOWNTAXESAMOUNT" value="#get_hud_data.A_0210_CITYTOWNTAXESAMOUNT#" /></td>
<td></td>
<td class="bsilver">510. City/town taxes
<input type="text" class="date" name="A_0510_CITYTOWNTAXESDATEFROM" value="#DateFormat(get_hud_data.A_0510_CITYTOWNTAXESDATEFROM, 'm/d/yyyy')#" /> <A href="javascript:ShowCalendar(document.all('calpic16'),document.all('A_0510_CITYTOWNTAXESDATEFROM'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://#CGI.SERVER_NAME#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic16" style="POSITION: relative"></A>
to <input type="text" class="date" name="A_0510_CITYTOWNTAXESDATETO" value="#DateFormat(get_hud_data.A_0510_CITYTOWNTAXESDATETO, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic17'),document.all('A_0510_CITYTOWNTAXESDATETO'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://#CGI.SERVER_NAME#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic17" style="POSITION: relative"></A></td>
<td class="bordered"><input type="text" class="text" name="A_0510_CITYTOWNTAXESAMOUNT" value="#get_hud_data.A_0510_CITYTOWNTAXESAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">211. County taxes
<input type="text" class="date" name="A_0211_COUNTYTAXESDATEFROM" value="#DateFormat(get_hud_data.A_0211_COUNTYTAXESDATEFROM, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic18'),document.all('A_0211_COUNTYTAXESDATEFROM'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://#CGI.SERVER_NAME#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic18" style="POSITION: relative"></A>
to <input type="text" class="date" name="A_0211_COUNTYTAXESDATETO" value="#DateFormat(get_hud_data.A_0211_COUNTYTAXESDATETO, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic19'),document.all('A_0211_COUNTYTAXESDATETO'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://#CGI.SERVER_NAME#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic19" style="POSITION: relative"></A></td>
<td class="bordered"><input type="text" class="text" name="A_0211_COUNTYTAXESAMOUNT" value="#get_hud_data.A_0211_COUNTYTAXESAMOUNT#" /></td>
<td></td>
<td class="bsilver">511. County taxes
<input type="text" class="date" name="A_0511_COUNTYTAXESDATEFROM" value="#DateFormat(get_hud_data.A_0511_COUNTYTAXESDATEFROM, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic20'),document.all('A_0511_COUNTYTAXESDATEFROM'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://#CGI.SERVER_NAME#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic20" style="POSITION: relative"></A>
to <input type="text" class="date" name="A_0511_COUNTYTAXESDATETO" value="#DateFormat(get_hud_data.A_0511_COUNTYTAXESDATETO, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic21'),document.all('A_0511_COUNTYTAXESDATETO'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://#CGI.SERVER_NAME#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic21" style="POSITION: relative"></A></td>
<td class="bordered"><input type="text" class="text" name="A_0511_COUNTYTAXESAMOUNT" value="#get_hud_data.A_0511_COUNTYTAXESAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">212. Assessments
<input type="text" class="date" name="A_0212_ASSESSMENTSDATEFROM" value="#DateFormat(get_hud_data.A_0212_ASSESSMENTSDATEFROM, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic22'),document.all('A_0212_ASSESSMENTSDATEFROM'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://#CGI.SERVER_NAME#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic22" style="POSITION: relative"></A>
to <input type="text" class="date" name="A_0212_ASSESSMENTSDATETO" value="#DateFormat(get_hud_data.A_0212_ASSESSMENTSDATETO, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic23'),document.all('A_0212_ASSESSMENTSDATETO'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://#CGI.SERVER_NAME#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic23" style="POSITION: relative"></A></td>
<td class="bordered"><input type="text" class="text" name="A_0212_ASSESSMENTSAMOUNT" value="#get_hud_data.A_0212_ASSESSMENTSAMOUNT#" /></td>
<td></td>
<td class="bsilver">512. Assessments
<input type="text" class="date" name="A_0512_ASSESSMENTSDATEFROM" value="#DateFormat(get_hud_data.A_0512_ASSESSMENTSDATEFROM, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic24'),document.all('A_0512_ASSESSMENTSDATEFROM'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://#CGI.SERVER_NAME#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic24" style="POSITION: relative"></A>
to <input type="text" class="date" name="A_0512_ASSESSMENTSDATETO" value="#DateFormat(get_hud_data.A_0512_ASSESSMENTSDATETO, 'm/d/yyyy')#" /><A href="javascript:ShowCalendar(document.all('calpic25'),document.all('A_0512_ASSESSMENTSDATETO'),document.all('null'),'#dateCalendarStart#','#dateCalendarEnd#')" onclick="event.cancelBubble=true;"><img src="https://#CGI.SERVER_NAME#/calendar/images/calendarSm.gif" width="25" height="19" alt="" border="0" id="calpic25" style="POSITION: relative"></A></td>
<td class="bordered"><input type="text" class="text" name="A_0512_ASSESSMENTSAMOUNT" value="#get_hud_data.A_0512_ASSESSMENTSAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">213. <input type="text" class="userout" name="A_0213_USERDESC" value="#get_hud_data.A_0213_USERDESC#" />
 to <input type="text" class="userout" name="A_0213_USERPAYTO" value="#get_hud_data.A_0213_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0213_USERAMOUNT" value="#get_hud_data.A_0213_USERAMOUNT#" /></td>
<td></td>
<td class="bsilver">513.  <input type="text" class="userout" name="A_0513_USERDESC" value="#get_hud_data.A_0513_USERDESC#" />
to <input type="text" class="userout" name="A_0513_USERPAYTO" value="#get_hud_data.A_0513_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0513_USERAMOUNT" value="#get_hud_data.A_0513_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">214. <input type="text" class="userout" name="A_0214_USERDESC" value="#get_hud_data.A_0214_USERDESC#" />
to <input type="text" class="userout" name="A_0214_USERPAYTO" value="#get_hud_data.A_0214_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0214_USERAMOUNT" value="#get_hud_data.A_0214_USERAMOUNT#" /></td>
<td></td>
<td class="bsilver">514.  <input type="text" class="userout" name="A_0514_USERDESC" value="#get_hud_data.A_0514_USERDESC#" />
to <input type="text" class="userout" name="A_0514_USERPAYTO" value="#get_hud_data.A_0514_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0514_USERAMOUNT" value="#get_hud_data.A_0514_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">215. <input type="text" class="userout" name="A_0215_USERDESC" value="#get_hud_data.A_0215_USERDESC#" />
to <input type="text" class="userout" name="A_0215_USERPAYTO" value="#get_hud_data.A_0215_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0215_USERAMOUNT" value="#get_hud_data.A_0215_USERAMOUNT#" /></td>
<td></td>
<td class="bsilver">515.  <input type="text" class="userout" name="A_0515_USERDESC" value="#get_hud_data.A_0515_USERDESC#" />
to <input type="text" class="userout" name="A_0515_USERPAYTO" value="#get_hud_data.A_0515_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0515_USERAMOUNT" value="#get_hud_data.A_0515_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">216. <input type="text" class="userout" name="A_0216_USERDESC" value="#get_hud_data.A_0216_USERDESC#" />
to <input type="text" class="userout" name="A_0216_USERPAYTO" value="#get_hud_data.A_0216_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0216_USERAMOUNT" value="#get_hud_data.A_0216_USERAMOUNT#" /></td>
<td></td>
<td class="bsilver">516.  <input type="text" class="userout" name="A_0516_USERDESC" value="#get_hud_data.A_0516_USERDESC#" />
to <input type="text" class="userout" name="A_0516_USERPAYTO" value="#get_hud_data.A_0516_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0516_USERAMOUNT" value="#get_hud_data.A_0516_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">217. <input type="text" class="userout" name="A_0217_USERDESC" value="#get_hud_data.A_0217_USERDESC#" />
to <input type="text" class="userout" name="A_0217_USERPAYTO" value="#get_hud_data.A_0217_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0217_USERAMOUNT" value="#get_hud_data.A_0217_USERAMOUNT#" /></td>
<td></td>
<td class="bsilver">517.  <input type="text" class="userout" name="A_0517_USERDESC" value="#get_hud_data.A_0517_USERDESC#" />
to <input type="text" class="userout" name="A_0517_USERPAYTO" value="#get_hud_data.A_0517_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0517_USERAMOUNT" value="#get_hud_data.A_0517_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">218. <input type="text" class="userout" name="A_0218_USERDESC" value="#get_hud_data.A_0218_USERDESC#" />
to <input type="text" class="userout" name="A_0218_USERPAYTO" value="#get_hud_data.A_0218_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0218_USERAMOUNT" value="#get_hud_data.A_0218_USERAMOUNT#" /></td>
<td></td>
<td class="bsilver">518.  <input type="text" class="userout" name="A_0518_USERDESC" value="#get_hud_data.A_0518_USERDESC#" />
to <input type="text" class="userout" name="A_0518_USERPAYTO" value="#get_hud_data.A_0518_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0518_USERAMOUNT" value="#get_hud_data.A_0518_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">219. <input type="text" class="userout" name="A_0219_USERDESC" value="#get_hud_data.A_0219_USERDESC#" />
to <input type="text" class="userout" name="A_0219_USERPAYTO" value="#get_hud_data.A_0219_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0219_USERAMOUNT" value="#get_hud_data.A_0219_USERAMOUNT#" /></td>
<td></td>
<td class="bsilver">519.  <input type="text" class="userout" name="A_0519_USERDESC" value="#get_hud_data.A_0519_USERDESC#" />
to <input type="text" class="userout" name="A_0519_USERPAYTO" value="#get_hud_data.A_0519_USERPAYTO#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0519_USERAMOUNT" value="#get_hud_data.A_0519_USERAMOUNT#" /></td>
</tr>

<tr>
<td class="bsilver"><br /><b>220. Total Paid by/for Seller</b></td>
<td class="bordered"><input type="text" class="text" name="A_0220_TOTALPAIDBYSELLERAMOUNT" value="#get_hud_data.A_0220_TOTALPAIDBYSELLERAMOUNT#" /></td>
<td></td>
<td class="bsilver"><br /><b>520. Total Reduction Amount Due Seller</b></td>
<td class="bordered"><input type="text" class="text" name="A_0520_REDUCTIONDUESELLERAMOUNT" value="#get_hud_data.A_0520_REDUCTIONDUESELLERAMOUNT#" /></td>
</tr>

<!-- Cash at Settlement -->

<tr>
<td colspan="2" class="bdarksilver_head">300. Cash at Settlement from/to Borrower</td>
<td></td>
<td colspan="2" class="bdarksilver_head">600. Cash at Settlement to/from Seller</td>
</tr>
<tr>
<td class="bsilver">301. Gross amount due from borrower (line 120)</td>
<td class="bordered"><input type="text" class="text" name="A_0301_GROSSDUEFROMBORROWERAMOUNT" value="#get_hud_data.A_0520_REDUCTIONDUESELLERAMOUNT#" /></td>
<td></td>
<td class="bsilver">601. Gross amount due to seller (line 420)</td>
<td class="bordered"><input type="text" class="text" name="A_0601_GROSSDUETOSELLERAMOUNT" value="#get_hud_data.A_0520_REDUCTIONDUESELLERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">302. Less amounts paid by/for borrower (line 220)</td>
<td class="bordered"><input type="text" class="text" name="A_0302_LESSPAIDBYBORROWERAMOUNT" value="#get_hud_data.A_0302_LESSPAIDBYBORROWERAMOUNT#" /></td>
<td></td>
<td class="bsilver">602. Less reductions in amount due seller (line 520)</td>
<td class="bordered"><input type="text" class="text" name="A_0602_LESSREDUCTIONSDUESELLERAMOUNT" value="#get_hud_data.A_0602_LESSREDUCTIONSDUESELLERAMOUNT#" /></td>
</tr>
<tr>
<td height="30" valign="middle" class="bsilver" style="font-weight:bold;">303. Cash
<input type="radio"  name="A_0303_CASHTOFROM" value="FROM" onclick="document.hud1_form.A_0603_CASHTOFROM[0].checked = true;" <cfif get_hud_data.A_0303_CASHTOFROM eq 'FROM'>CHECKED</cfif> /> From
<input type="radio"  name="A_0303_CASHTOFROM" value="TO"   onclick="document.hud1_form.A_0603_CASHTOFROM[1].checked = true;" <cfif get_hud_data.A_0303_CASHTOFROM eq 'TO'>CHECKED</cfif> />To Borrower</td>
<td class="bordered"><input type="text" class="text" name="A_0303_CASHAMOUNT" value="#get_hud_data.A_0303_CASHAMOUNT#" /></td>
<td></td>
<td height="30" valign="middle" class="bsilver" style="font-weight:bold;">603. Cash
<input type="radio"  name="A_0603_CASHTOFROM" value="TO"   onclick="document.hud1_form.A_0303_CASHTOFROM[0].checked = true;" <cfif get_hud_data.A_0603_CASHTOFROM eq 'FROM'>CHECKED</cfif> />To
<input type="radio"  name="A_0603_CASHTOFROM" value="FROM" onclick="document.hud1_form.A_0303_CASHTOFROM[1].checked = true;" <cfif get_hud_data.A_0603_CASHTOFROM eq 'TO'>CHECKED</cfif> />From Seller</td>
<td class="bordered"><input type="text" class="text" name="A_0603_CASHAMOUNT" value="#get_hud_data.A_0603_CASHAMOUNT#" /></td>
</tr>

</table><!-- TABLE: Summary of Transactions -->

<br />
<p>The Public Reporting Burden for this collection of information is estimated at 35 minutes per response for collecting, reviewing, and
reporting the data. This agency may not collect this information, and you are not required to complete this form, unless it displays a
currently valid OMB control number. No confidentiality is assured; this disclosure is mandatory. This is designed to provide the parties to
a RESPA covered transaction with information during the settlement process.</p>

<P CLASS="pagebreak"><!-- PAGE BREAK (printing) -->&nbsp;</p>


<!-- TABLE: Settlement Charges -->
<table width="100%" cellspacing="0" border="0" summary="Summary of Transactions">
<tr>
<td colspan="3" class="black">L. Settlement Charges</td>
</tr>
<tr><td height="4" colspan="3"></td></tr>
<tr>
<td class="bdarksilver_head">700. Total Real Estate Broker Fees</td>
<td width="15%" rowspan="4" class="bdarksilver" align="center" valign="middle" style="border-left:none;">Paid From <br /> Borrower's <br />Funds at <br /> Settlement</td>
<td width="15%" rowspan="4" class="bdarksilver" align="center" valign="middle" style="border-left:none;">Paid From <br /> Seller's <br />Funds at <br /> Settlement</td>
</tr>
<tr>
<td class="bsilver">&nbsp;&nbsp;&nbsp;&nbsp;Division of commission (line 700) as follows:</td>
</tr>
<tr>
<td class="bsilver">701. $<input type="text" class="text" name="A_0701_COMMISSIONAMOUNT" value="#get_hud_data.A_0701_COMMISSIONAMOUNT#" /> to<input type="text" class="text" name="A_0701_COMMISSIONPAYTO" value="#get_hud_data.A_0701_COMMISSIONPAYTO#" /></td>
</tr>
<tr>
<td class="bsilver">702. $<input type="text" class="text" name="A_0702_COMMISSIONAMOUNT" value="#get_hud_data.A_0702_COMMISSIONAMOUNT#" /> to<input type="text" class="text" name="A_0702_COMMISSIONPAYTO" value="#get_hud_data.A_0702_COMMISSIONPAYTO#" /></td>
</tr>
<tr>
<td class="bsilver">703. Commission paid at settlement</td>
<td class="bordered"><input type="text" class="text" name="A_0703_BORROWER_COMMISSIONAMOUNT" value="#get_hud_data.A_0703_BORROWER_COMMISSIONAMOUNT#" /></td>
<td class="bordered"><input type="text" class="text" name="A_0703_SELLER_COMMISSIONAMOUNT" value="#get_hud_data.A_0703_SELLER_COMMISSIONAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">704. <input type="text" class="userout" name="A_0704_USERDESC"  value="#get_hud_data.A_0704_USERDESC#" /> to <input type="text" class="userout" name="A_0704_USERPAYTO"  value="#get_hud_data.A_0704_USERPAYTO#" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_0704_BORROWER_USERAMOUNT" value="#get_hud_data.A_0704_BORROWER_USERAMOUNT#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0704_SELLER_USERAMOUNT" value="#get_hud_data.A_0704_SELLER_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">705. <input type="text" class="userout" name="A_0705_USERDESC" value="#get_hud_data.A_0705_USERDESC#"  /> to <input type="text" class="userout" name="A_0705_USERPAYTO" value="#get_hud_data.A_0705_USERPAYTO#"  /> </td>
<td class="bordered"><input type="text" class="userin" name="A_0705_BORROWER_USERAMOUNT" value="#get_hud_data.A_0705_BORROWER_USERAMOUNT#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0705_SELLER_USERAMOUNT" value="#get_hud_data.A_0705_SELLER_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">706. <input type="text" class="userout" name="A_0706_USERDESC" value="#get_hud_data.A_0706_USERDESC#"  /> to <input type="text" class="userout" name="A_0706_USERPAYTO"  value="#get_hud_data.A_0706_USERPAYTO#" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_0706_BORROWER_USERAMOUNT" value="#get_hud_data.A_0706_BORROWER_USERAMOUNT#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0706_SELLER_USERAMOUNT" value="#get_hud_data.A_0706_SELLER_USERAMOUNT#" /></td>
</tr>

<!-- 800 -->
<tr><td height="4" colspan="3"></td></tr>
<tr>
<td colspan="3" class="bdarksilver_head">800. Items Payable in Connection with Loan</td>
</tr>
<tr>
<td class="bsilver">801. Our origination charge $<input type="text" class="text" name="A_0801_OUTSIDE_ORIGINATIONCHARGE" value="#get_hud_data.A_0801_OUTSIDE_ORIGINATIONCHARGE#" /></td>
<td class="bordered"><input type="text" class="text" name="A_0801_BORROWER_ORIGINATIONCHARGE" value="#get_hud_data.A_0801_BORROWER_ORIGINATIONCHARGE#" /></td>
<td class="bordered"><input type="text" class="text" name="A_0801_SELLER_ORIGINATIONCHARGE" value="#get_hud_data.A_0801_SELLER_ORIGINATIONCHARGE#" /></td>
</tr>
<tr>
<td class="bsilver">802. Your credit or charge (points) for the specific interest rate chosen $<input type="text" class="text" name="A_0802_OUTSIDE_POINTS"  value="#get_hud_data.A_0802_OUTSIDE_POINTS#" /></td>
<td class="bordered"><input type="text" class="text" name="A_0802_BORROWER_POINTS" value="#get_hud_data.A_0802_BORROWER_POINTS#" /></td>
<td class="bordered"><input type="text" class="text" name="A_0802_SELLER_POINTS" value="#get_hud_data.A_0802_SELLER_POINTS#" /></td>
</tr>
<tr>
<td class="bsilver">803. Your adjusted origination charges</td>
<td class="bordered"><input type="text" class="text" name="A_0803_BORROWER_ADJORIGINATIONCHARGE" value="#get_hud_data.A_0803_BORROWER_ADJORIGINATIONCHARGE#" /></td>
<td class="bordered"><input type="text" class="text" name="A_0803_SELLER_ADJORIGINATIONCHARGE" value="#get_hud_data.A_0803_SELLER_ADJORIGINATIONCHARGE#" /></td>
</tr>
<tr>
<td class="bsilver">804. Appraisal fee to<input type="text" class="text" name="A_0804_APPRAISALFEEPAYTO" value="#get_hud_data.A_0804_APPRAISALFEEPAYTO#" /> </td>
<td class="bordered"><input type="text" class="text" name="A_0804_BORROWER_APPRAISALFEE" value="#get_hud_data.A_0804_BORROWER_APPRAISALFEE#" /></td>
<td class="bordered"><input type="text" class="text" name="A_0804_SELLER_APPRAISALFEE" value="#get_hud_data.A_0804_SELLER_APPRAISALFEE#" /></td>
</tr>
<tr>
<td class="bsilver">805. Credit report to<input type="text" class="text" name="A_0805_CREDITREPORTPAYTO" value="#get_hud_data.A_0805_CREDITREPORTPAYTO#" /></td>
<td class="bordered"><input type="text" class="text" name="A_0805_BORROWER_CREDITREPORT" value="#get_hud_data.A_0805_BORROWER_CREDITREPORT#" /></td>
<td class="bordered"><input type="text" class="text" name="A_0805_SELLER_CREDITREPORT" value="#get_hud_data.A_0805_SELLER_CREDITREPORT#" /></td>
</tr>
<tr>
<td class="bsilver">806. Tax service to<input type="text" class="text" name="A_0806_TAXSERVICEPAYTO" value="#get_hud_data.A_0806_TAXSERVICEPAYTO#" /></td>
<td class="bordered"><input type="text" class="text" name="A_0806_BORROWER_TAXSERVICE" value="#get_hud_data.A_0806_BORROWER_TAXSERVICE#" /></td>
<td class="bordered"><input type="text" class="text" name="A_0806_SELLER_TAXSERVICE" value="#get_hud_data.A_0806_SELLER_TAXSERVICE#" /></td>
</tr>
<tr>
<td class="bsilver">807. Flood certification to <input type="text" class="text" name="A_0807_FLOODCERTPAYTO" value="#get_hud_data.A_0807_FLOODCERTPAYTO#" /></td>
<td class="bordered"><input type="text" class="text" name="A_0807_BORROWER_FLOODCERT" value="#get_hud_data.A_0807_BORROWER_FLOODCERT#" /></td>
<td class="bordered"><input type="text" class="text" name="A_0807_SELLER_FLOODCERT" value="#get_hud_data.A_0807_SELLER_FLOODCERT#" /></td>
</tr>
<tr>
<td class="bsilver">808. <input type="text" class="userout" name="A_0808_USERDESC"  value="#get_hud_data.A_0808_USERDESC#" /> to <input type="text" class="userout" name="A_0808_USERPAYTO"  value="#get_hud_data.A_0808_USERPAYTO#" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_0808_BORROWER_USERAMOUNT" value="#get_hud_data.A_0808_BORROWER_USERAMOUNT#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0808_SELLER_USERAMOUNT" value="#get_hud_data.A_0808_SELLER_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">809. <input type="text" class="userout" name="A_0809_USERDESC"  value="#get_hud_data.A_0809_USERDESC#" /> to <input type="text" class="userout" name="A_0809_USERPAYTO"  value="#get_hud_data.A_0809_USERPAYTO#" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_0809_BORROWER_USERAMOUNT" value="#get_hud_data.A_0809_BORROWER_USERAMOUNT#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0809_SELLER_USERAMOUNT" value="#get_hud_data.A_0809_SELLER_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">810. <input type="text" class="userout" name="A_0810_USERDESC"  value="#get_hud_data.A_0810_USERDESC#" /> to <input type="text" class="userout" name="A_0810_USERPAYTO" value="#get_hud_data.A_0810_USERPAYTO#"  /> </td>
<td class="bordered"><input type="text" class="userin" name="A_0810_BORROWER_USERAMOUNT" value="#get_hud_data.A_0810_BORROWER_USERAMOUNT#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0810_SELLER_USERAMOUNT" value="#get_hud_data.A_0810_SELLER_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">811. <input type="text" class="userout" name="A_0811_USERDESC"  value="#get_hud_data.A_0811_USERDESC#" /> to <input type="text" class="userout" name="A_0811_USERPAYTO"  value="#get_hud_data.A_0811_USERPAYTO#" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_0811_BORROWER_USERAMOUNT" value="#get_hud_data.A_0811_BORROWER_USERAMOUNT#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0811_SELLER_USERAMOUNT" value="#get_hud_data.A_0811_SELLER_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">812. <input type="text" class="userout" name="A_0812_USERDESC"  value="#get_hud_data.A_0812_USERDESC#" /> to <input type="text" class="userout" name="A_0812_USERPAYTO" value="#get_hud_data.A_0812_USERPAYTO#"  /> </td>
<td class="bordered"><input type="text" class="userin" name="A_0812_BORROWER_USERAMOUNT" value="#get_hud_data.A_0812_BORROWER_USERAMOUNT#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0812_SELLER_USERAMOUNT" value="#get_hud_data.A_0812_SELLER_USERAMOUNT#" /></td>
</tr>


<!-- 900 -->
<tr><td height="4" colspan="3"></td></tr>
<tr>
<td colspan="3" class="bdarksilver_head">900. Items Required by Lender to Be Paid in Advance</td>
</tr>
<tr>
<td class="bsilver">901. Daily interest charges from
<input type="text" class="date" name="A_0901_DAILYINTERESTDATEFROM" value="#DateFormat(get_hud_data.A_0901_DAILYINTERESTDATEFROM, 'm/d/yyyy')#" /> to <input type="text" name="A_0901_DAILYINTERESTDATETO" class="date" value="#DateFormat(get_hud_data.A_0901_DAILYINTERESTDATETO, 'm/d/yyyy')#"/>
@ $<input type="text" class="text" name="A_0901_OUTSIDE_DAILYINTERESTPERDAY" value="#get_hud_data.A_0901_OUTSIDE_DAILYINTERESTPERDAY#" /> /day</td>
<td class="bordered"><input type="text" class="text" name="A_0901_BORROWER_DAILYINTEREST" value="#get_hud_data.A_0901_BORROWER_DAILYINTEREST#" /></td>
<td class="bordered"><input type="text" class="text" name="A_0901_SELLER_DAILYINTEREST" value="#get_hud_data.A_0901_SELLER_DAILYINTEREST#" /></td>
</tr>
<tr>
<td class="bsilver">902. Mortgage insurance premium for
<input type="text" class="date" name="A_0902_MORTGAGEINSMONTHS" value="#get_hud_data.A_0902_MORTGAGEINSMONTHS#" /> months
to <input type="text" class="text" name="A_0902_MORTGAGEINSPAYTO" value="#get_hud_data.A_0902_MORTGAGEINSPAYTO#" /></td>
<td class="bordered"><input type="text" class="text" name="A_0902_BORROWER_MORTGAGEINS" value="#get_hud_data.A_0902_BORROWER_MORTGAGEINS#" /></td>
<td class="bordered"><input type="text" class="text" name="A_0902_SELLER_MORTGAGEINS" value="#get_hud_data.A_0902_SELLER_MORTGAGEINS#" /></td>
</tr>
<tr>
<td class="bsilver">903. Homeowner's insurance for
<input type="text" class="date" name="A_0903_HOMEOWNERSINSMONTHS" value="#get_hud_data.A_0903_HOMEOWNERSINSMONTHS#" /> months
to <input type="text" class="text" name="A_0903_HOMEOWNERSINSPAYTO" value="#get_hud_data.A_0903_HOMEOWNERSINSPAYTO#" /></td>
<td class="bordered"><input type="text" class="text" name="A_0903_BORROWER_HOMEOWNERSINS" value="#get_hud_data.A_0903_BORROWER_HOMEOWNERSINS#" /></td>
<td class="bordered"><input type="text" class="text" name="A_0903_SELLER_HOMEOWNERSINS" value="#get_hud_data.A_0903_SELLER_HOMEOWNERSINS#" /></td>
</tr>
<tr>
<td class="bsilver">904. <input type="text" class="userout" name="A_0904_USERDESC" value="#get_hud_data.A_0904_USERDESC#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0904_BORROWER_USERAMOUNT" value="#get_hud_data.A_0904_BORROWER_USERAMOUNT#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_0904_SELLER_USERAMOUNT" value="#get_hud_data.A_0904_SELLER_USERAMOUNT#" /></td>
</tr>

<!-- 1000 -->
<tr><td height="4" colspan="3"></td></tr>
<tr>
<td colspan="3" class="bdarksilver_head">1000. Reserves Deposited with Lender</td>
</tr>
<tr>
<td class="bsilver">1001. Initial deposit for your escrow account</td>
<td class="bordered"><input type="text" class="text" name="A_1001_BORROWER_INITIALESCROWDEPOSIT" value="#get_hud_data.A_1001_BORROWER_INITIALESCROWDEPOSIT#" /></td>
<td class="bordered"><input type="text" class="text" name="A_1001_SELLER_INITIALESCROWDEPOSIT" value="#get_hud_data.A_1001_SELLER_INITIALESCROWDEPOSIT#" /></td>
</tr>
<tr>
<td class="bsilver"><div style="float:left">1002. Homeowner's insurance</div>
<div style="float:right"> <input type="text" class="two_digit" name="A_1002_HOMEOWNERSINSMONTHS" value="#get_hud_data.A_1002_HOMEOWNERSINSMONTHS#" />months @
$<input type="text" class="text" name="A_1002_HOMEOWNERSINSPERMONTH" value="#get_hud_data.A_1002_HOMEOWNERSINSPERMONTH#" /> per month
$<input type="text" class="text" name="A_1002_OUTSIDE_HOMEOWNERSINS" value="#get_hud_data.A_1002_OUTSIDE_HOMEOWNERSINS#" /></div></td>
<td class="bordered"><input type="text" class="text" name="A_1002_BORROWER_HOMEOWNERSINS" value="#get_hud_data.A_1002_BORROWER_HOMEOWNERSINS#" /></td>
<td class="bordered"><input type="text" class="text" name="A_1002_SELLER_HOMEOWNERSINS" value="#get_hud_data.A_1002_SELLER_HOMEOWNERSINS#" /></td>
</tr>
<tr>
<td class="bsilver"><div style="float:left">1003. Mortgage insurance</div>
<div style="float:right"> <input type="text" class="two_digit" name="A_1003_MORTGAGEINSMONTHS" value="#get_hud_data.A_1003_MORTGAGEINSMONTHS#"  />months @
$<input type="text" class="text" name="A_1003_MORTGAGEINSPERMONTH" value="#get_hud_data.A_1003_MORTGAGEINSPERMONTH#" /> per month
$<input type="text" class="text" name="A_1003_OUTSIDE_MORTGAGEINS" value="#get_hud_data.A_1003_OUTSIDE_MORTGAGEINS#" /></div></td>
<td class="bordered"><input type="text" class="text" name="A_1003_BORROWER_MORTGAGEINS" value="#get_hud_data.A_1003_BORROWER_MORTGAGEINS#" /></td>
<td class="bordered"><input type="text" class="text" name="A_1003_SELLER_MORTGAGEINS" value="#get_hud_data.A_1003_SELLER_MORTGAGEINS#" /></td>
</tr>
<tr>
<td class="bsilver"><div style="float:left">1004. City property tax</div>
<div style="float:right"> <input type="text" class="two_digit" name="A_1004_CITYPROPTAXMONTHS" value="#get_hud_data.A_1004_CITYPROPTAXMONTHS#" />months @
$<input type="text" class="text" name="A_1004_CITYPROPTAXPERMONTH" value="#get_hud_data.A_1004_CITYPROPTAXPERMONTH#" /> per month
$<input type="text" class="text" name="A_1004_OUTSIDE_CITYPROPTAX" value="#get_hud_data.A_1004_OUTSIDE_CITYPROPTAX#" /></div></td>
<td class="bordered"><input type="text" class="text" name="A_1004_BORROWER_CITYPROPTAX" value="#get_hud_data.A_1004_BORROWER_CITYPROPTAX#" /></td>
<td class="bordered"><input type="text" class="text" name="A_1004_SELLER_CITYPROPTAX" value="#get_hud_data.A_1004_SELLER_CITYPROPTAX#" /></td>
</tr>
<tr>
<td class="bsilver"><div style="float:left">1005. County property tax</div>
<div style="float:right"> <input type="text" class="two_digit" name="A_1005_COUNTYPROPTAXMONTHS" value="#get_hud_data.A_1005_COUNTYPROPTAXMONTHS#" />months @
$<input type="text" class="text" name="A_1005_COUNTYPROPTAXPERMONTH" value="#get_hud_data.A_1005_COUNTYPROPTAXPERMONTH#" /> per month
$<input type="text" class="text" name="A_1005_OUTSIDE_COUNTYPROPTAX" value="#get_hud_data.A_1005_OUTSIDE_COUNTYPROPTAX#" /></div></td>
<td class="bordered"><input type="text" class="text" name="A_1005_BORROWER_COUNTYPROPTAX" value="#get_hud_data.A_1005_BORROWER_COUNTYPROPTAX#" /></td>
<td class="bordered"><input type="text" class="text" name="A_1005_SELLER_COUNTYPROPTAX" value="#get_hud_data.A_1005_SELLER_COUNTYPROPTAX#" /></td>
</tr>
<tr>
<td class="bsilver"><div style="float:left">1006. Assessments</div>
<div style="float:right"> <input type="text" class="two_digit" name="A_1006_ASSESSMENTSMONTHS" value="#get_hud_data.A_1006_ASSESSMENTSMONTHS#" />months @
$<input type="text" class="text" name="A_1006_ASSESSMENTSPERMONTH" value="#get_hud_data.A_1006_ASSESSMENTSPERMONTH#" /> per month
$<input type="text" class="text" name="A_1006_OUTSIDE_ASSESSMENTS" value="#get_hud_data.A_1006_OUTSIDE_ASSESSMENTS#" /></div></td>
<td class="bordered"><input type="text" class="text" name="A_1006_BORROWER_ASSESSMENTS" value="#get_hud_data.A_1006_BORROWER_ASSESSMENTS#" /></td>
<td class="bordered"><input type="text" class="text" name="A_1006_SELLER_ASSESSMENTS" value="#get_hud_data.A_1006_SELLER_ASSESSMENTS#" /></td>
</tr>
<tr>
<td class="bsilver">1007. Aggregate Adjustment
<div style="float:right"><input type="text" class="text" name="A_1007_OUTSIDE_AGGREGATEADJUSTMENT" value="#get_hud_data.A_1007_OUTSIDE_AGGREGATEADJUSTMENT#" /></div></td>
<td class="bordered"><input type="text" class="text" name="A_1007_BORROWER_AGGREGATEADJUSTMENT" value="#get_hud_data.A_1007_BORROWER_AGGREGATEADJUSTMENT#" /></td>
<td class="bordered"><input type="text" class="text" name="A_1007_SELLER_AGGREGATEADJUSTMENT" value="#get_hud_data.A_1007_SELLER_AGGREGATEADJUSTMENT#" /></td>
</tr>

<!-- 1100 -->
<tr><td height="4" colspan="3"></td></tr>
<tr>
<td colspan="3" class="bdarksilver_head">1100. Title Charges</td>
</tr>
<tr>
<td class="bsilver">1101. Title services and lender's title insurance</td>
<td class="bordered"><input type="text" class="text" name="A_1101_BORROWER_TITLESERVICES" value="#get_hud_data.A_1101_BORROWER_TITLESERVICES#" /></td>
<td class="bordered"><input type="text" class="text" name="A_1101_SELLER_TITLESERVICES" value="#get_hud_data.A_1101_SELLER_TITLESERVICES#" /></td>
</tr>
<tr>
<td class="bsilver">1102. Settlement or closing fee
to <input type="text" class="text" name="A_1102_CLOSINGFEEPAYTO" value="#get_hud_data.A_1102_CLOSINGFEEPAYTO#" />
$<input type="text" class="text" name="A_1102_OUTSIDE_CLOSINGFEE" value="#get_hud_data.A_1102_OUTSIDE_CLOSINGFEE#" /></td>
<td class="bordered"><input type="text" class="text" name="A_1102_BORROWER_CLOSINGFEE" value="#get_hud_data.A_1102_BORROWER_CLOSINGFEE#" /></td>
<td class="bordered"><input type="text" class="text" name="A_1102_SELLER_CLOSINGFEE" value="#get_hud_data.A_1102_SELLER_CLOSINGFEE#" /></td>
</tr>
<tr>
<td class="bsilver">1103. Owner's title insurance
to <input type="text" class="text" name="A_1103_OWNERSTITLEINSPAYTO" value="#get_hud_data.A_1103_OWNERSTITLEINSPAYTO#" />
$<input type="text" class="text" name="A_1103_OUTSIDE_OWNERSTITLEINS" value="#get_hud_data.A_1103_OUTSIDE_OWNERSTITLEINS#" /></td>
<td class="bordered"><input type="text" class="text" name="A_1103_BORROWER_OWNERSTITLEINS" value="#get_hud_data.A_1103_BORROWER_OWNERSTITLEINS#" /></td>
<td class="bordered"><input type="text" class="text" name="A_1103_SELLER_OWNERSTITLEINS" value="#get_hud_data.A_1103_SELLER_OWNERSTITLEINS#" /></td>
</tr>
<tr>
<td class="bsilver">1104. Lender's title insurance
to <input type="text" class="text" name="A_1104_LENDERSTITLEINSPAYTO" value="#get_hud_data.A_1104_LENDERSTITLEINSPAYTO#" />
$<input type="text" class="text" name="A_1104_OUTSIDE_LENDERSTITLEINS" value="#get_hud_data.A_1104_OUTSIDE_LENDERSTITLEINS#" /> </td>
<td class="bordered"><input type="text" class="text" name="A_1104_BORROWER_LENDERSTITLEINS" value="#get_hud_data.A_1104_BORROWER_LENDERSTITLEINS#" /></td>
<td class="bordered"><input type="text" class="text" name="A_1104_SELLER_LENDERSTITLEINS" value="#get_hud_data.A_1104_SELLER_LENDERSTITLEINS#" /></td>
</tr>
<tr>
<td class="bsilver">1105. Lender's title policy limit
$<input type="text" class="text" name="A_1105_LENDERSTITLEPOLICYLIMIT" value="#get_hud_data.A_1105_LENDERSTITLEPOLICYLIMIT#" /> </td>
<td class="bordered">&nbsp; </td>
<td class="bordered">&nbsp; </td>
</tr>
<tr>
<td class="bsilver">1106. Owner's title policy limit
$<input type="text" class="text" name="A_1106_OWNERSTITLEPOLICYLIMIT" value="#get_hud_data.A_1106_OWNERSTITLEPOLICYLIMIT#" /> </td>
<td class="bordered">&nbsp; </td>
<td class="bordered">&nbsp; </td>
</tr>
<tr>
<td class="bsilver">1107. Agent's portion of the total title insurance premium
$<input type="text" class="text" name="A_1107_AGENTPREMIUMPORTION" value="#get_hud_data.A_1107_AGENTPREMIUMPORTION#" /> </td>
<td class="bordered">&nbsp; </td>
<td class="bordered">&nbsp; </td>
</tr>
<tr>
<td class="bsilver">1108. Underwriter's portion of the total title insurance premium
$<input type="text" class="text" name="A_1108_UNDERWRITERPREMIUMPORTION" value="#get_hud_data.A_1108_UNDERWRITERPREMIUMPORTION#"  /> </td>
<td class="bordered">&nbsp; </td>
<td class="bordered">&nbsp; </td>
</tr>
<tr>
<td class="bsilver">1109. <input type="text" class="userout" name="A_1109_USERDESC" value="#get_hud_data.A_1109_USERDESC#" />
to <input type="text" class="userout" name="A_1109_USERPAYTO"  value="#get_hud_data.A_1109_USERPAYTO#" />
$<input type="text" class="userout" name="A_1109_OUTSIDE_USERAMOUNT" value="#get_hud_data.A_1109_OUTSIDE_USERAMOUNT#" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_1109_BORROWER_USERAMOUNT" value="#get_hud_data.A_1109_BORROWER_USERAMOUNT#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1109_SELLER_USERAMOUNT" value="#get_hud_data.A_1109_SELLER_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">1110. <input type="text" class="userout" name="A_1110_USERDESC"  value="#get_hud_data.A_1110_USERDESC#" />
to <input type="text" class="userout" name="A_1110_USERPAYTO"  value="#get_hud_data.A_1110_USERPAYTO#" />
$<input type="text" class="userout" name="A_1110_OUTSIDE_USERAMOUNT" value="#get_hud_data.A_1110_OUTSIDE_USERAMOUNT#" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_1110_BORROWER_USERAMOUNT" value="#get_hud_data.A_1110_BORROWER_USERAMOUNT#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1110_SELLER_USERAMOUNT" value="#get_hud_data.A_1110_SELLER_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">1111. <input type="text" class="userout" name="A_1111_USERDESC"  value="#get_hud_data.A_1111_USERDESC#" />
to <input type="text" class="userout" name="A_1111_USERPAYTO"  value="#get_hud_data.A_1111_USERPAYTO#" />
$<input type="text" class="userout" name="A_1111_OUTSIDE_USERAMOUNT" value="#get_hud_data.A_1111_OUTSIDE_USERAMOUNT#" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_1111_BORROWER_USERAMOUNT" value="#get_hud_data.A_1111_BORROWER_USERAMOUNT#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1111_SELLER_USERAMOUNT" value="#get_hud_data.A_1111_SELLER_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">1112. <input type="text" class="userout" name="A_1112_USERDESC" value="#get_hud_data.A_1112_USERDESC#" />
to <input type="text" class="userout" name="A_1112_USERPAYTO" value="#get_hud_data.A_1112_USERPAYTO#" />
$<input type="text" class="userout" name="A_1112_OUTSIDE_USERAMOUNT" value="#get_hud_data.A_1112_OUTSIDE_USERAMOUNT#" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_1112_BORROWER_USERAMOUNT" value="#get_hud_data.A_1112_BORROWER_USERAMOUNT#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1112_SELLER_USERAMOUNT" value="#get_hud_data.A_1112_SELLER_USERAMOUNT#" /></td>
</tr>
<tr>
<td class="bsilver">1113. <input type="text" class="userout" name="A_1113_USERDESC" value="#get_hud_data.A_1113_USERDESC#" />
to <input type="text" class="userout" name="A_1113_USERPAYTO" value="#get_hud_data.A_1113_USERPAYTO#" />
$<input type="text" class="userout" name="A_1113_OUTSIDE_USERAMOUNT" value="#get_hud_data.A_1113_OUTSIDE_USERAMOUNT#" /> </td>
<td class="bordered"><input type="text" class="userin" name="A_1113_BORROWER_USERAMOUNT" value="#get_hud_data.A_1113_BORROWER_USERAMOUNT#" /></td>
<td class="bordered"><input type="text" class="userin" name="A_1113_SELLER_USERAMOUNT" value="#get_hud_data.A_1113_SELLER_USERAMOUNT#" /></td>
</tr>
<cfinclude template="HUD1_2010_modify_b.cfm">
<script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body>
</html>
</cfoutput>