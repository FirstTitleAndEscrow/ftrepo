
<CFPARAM NAME="a_direction" DEFAULT="">
<CFPARAM NAME="Insurance_Company" DEFAULT="">
<CFPARAM NAME="Title_Ins_Co_Is" DEFAULT="0">
<CFPARAM NAME="A_Update_DB_Flag" DEFAULT="0">






		<!--- ===/ If the A_Update_DB_Flag is GT 0   \=== --->
		<!--- ===/ then we need to update the proper \=== --->
		<!--- ===/ Table with the data from the form \=== --->



		<CFIF #A_Update_DB_Flag# GT "0">
		<CFQUERY datasource="#request.dsn#" NAME="read_tp">
				SELECT *
				FROM thirdparty
				Where id = #thirdpID#
			</CFQUERY>

		<cfoutput>test</cfoutput>


		<CFQUERY datasource="#request.dsn#">
				INSERT INTO Title_Notes(FName, LName, Order_ID, N_Note, N_Date, N_Time, note_type, access, access2)
				VALUES('#read_tp.first#', '#read_tp.last#', #URL.rec_id#, '#N_Note_1#', '#DateFormat(Now(), "m/d/yyyy")#', '#TimeFormat(Now(), "HH:mm:ss")#', 'T', '1', '1')
			</CFQUERY>



			<CFQUERY datasource="#request.dsn#" NAME="read_info">
				SELECT *
				FROM Title_Notes
				WHERE N_date = '#DateFormat(Now(), "m/d/yyyy")#' AND N_Time = '#TimeFormat(Now(), "HH:mm:ss")#' and order_id = #url.rec_id#
			</CFQUERY>
			<cfif #read_info.access2# eq 1>
			<CFQUERY datasource="#request.dsn#">
				update doc_abstract_title
				set vendor_Date = '#read_info.n_date#',
				vendor_Time = '#read_info.n_time#'
			where title_ID = #URL.rec_id#
			</CFQUERY>
		</cfif>



		<CFQUERY datasource="#request.dsn#" NAME="read_notes">
				SELECT *
				FROM Title_Notes
				WHERE order_id = #URL.rec_id# and N_Note = 'Clear to Close'
			</CFQUERY>
			<cfif #read_notes.recordcount# GT 0>
		<CFQUERY datasource="#request.dsn#">
				Update Title_Notes
				set status = 1
				where note_id = #read_info.note_id# and N_Note != 'Clear to Close'
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#">
				Update doc_title_insurance_title
				set clear_close = 1
				where title_id = #url.rec_id#
			</CFQUERY>
		<cfelse>
		<CFQUERY datasource="#request.dsn#">
				Update Title_Notes
				set status = 1
				where note_id = #read_info.note_id# and N_Note != 'Clear to Close'
			</CFQUERY>

		</cfif>



	<CFQUERY datasource="#request.dsn#" NAME="read_email">
				SELECT *
				FROM Title
				Where title_id = #rec_id#
			</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">

			SELECT *
			FROM companies
			WHERE ID = #read_email.comp_ID#

		</CFQUERY>
<cftry>
<cfinvoke component = "cfc.team_info"	method = "getTeamEmail"	returnVariable = "team_email" team_id="#read_sel_company.team_id#">
		<cfif #read_email.comp_id# eq 115>


<cfelse>


<CFMAIL
TO="#team_email#"
FROM="#team_email#"
Subject="Comment has been added by your First Title team for order #rec_id#-#read_email.bfirstname1# #read_email.blastname1#"
TIMEOUT="600"
>

The following comment below has been noted regarding the above referenced file:

Comment entered by: #username#
Date and time entered: #read_info.n_date#  #read_info.n_time#

Comment: '#N_Note_1#'

Please contact your First Title processing contact with any questions.
Thank you.

First Title staff

</cfmail>

		</cfif>

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


			</cfif>

			<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #URL.rec_id# and note_type = 'T' and access = 1
				ORDER BY Note_ID ASC
			</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_vendor_notes">
				SELECT *
				FROM Title_Notes
				Where Order_Id = #URL.rec_id# and note_type = 'V' and access = 1
				ORDER BY Note_ID ASC
			</CFQUERY>

	<CFQUERY datasource="#request.dsn#" NAME="read_notes">
				SELECT *
				FROM Title
				Where title_id = #rec_id# and n_status = 1
			</CFQUERY>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
<!--- location.href='view_title_comments_nav.cfm?user_id_1=<cfoutput>#USER_ID_1#</cfoutput>&lo_id=<cfoutput>#lo_id#</cfoutput>&rec_id=<cfoutput>#url.rec_id#</cfoutput>&a_trigger=1&Title_Ins_Co_Is=<cfoutput>#Title_Ins_Co_Is#</cfoutput>&A_Update_DB_Flag=1&N_Note_1=' + frm.N_Note_1 + '&username=' + name;
 --->
<script >

    function locate(){
         var name = prompt("Type your full name below", "");
	if (name != '' && name != null && document.frm.N_Note_1.value != ''){
		document.frm.username.value = name;
		return true
		}else{
		alert ("Comment was NOT added")
return false;
  }
return true;
}

</script>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=d3d3d3>
	<tr>
		<td width=590 align=center valign=top>

<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

		<td width=590 align=center valign=top bgcolor=e1e1e1>


<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>


		<tr>
			<td width=590  align=right valign=top bgcolor=e1e1e1>
			<tr>
			<td width=590 align=center valign=top bgcolor=green>
				<font face=verdana size=1 color=white>
				<b>View Comments for order <CFOUTPUT>#url.rec_id#</CFOUTPUT></a>
		</tr>


		<cfif #read_all_notes.recordcount# GT 0>
<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=590 align=center valign=top bgcolor=e1e1e1>
		<B><font face=verdana size=2 color=blue>Processing Notes -- Clients may add their own comments below which automatically transmit to our client services team!</FONT></B>
</td></tr></table></cfif>
<CFOUTPUT QUERY="Read_all_notes">

	<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#DateFormat(N_Date, "mm/dd/yyyy")#
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#TimeFormat(N_Time, "HH:mm:ss")#
					</td>
					<td width=125 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#Fname# #LName#
					</td>
				<tr>
			</table>

		<td width=444 align=left valign=top bgcolor=e1e1e1>
			<PRE><font face=verdana size=1 color=black>#N_Note#</PRE>
		</td>
	</tr>
</table>

</CFOUTPUT>
<CFOUTPUT QUERY="Read_vendor_notes">

	<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>

		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#DateFormat(N_Date, "mm/dd/yyyy")#
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#TimeFormat(N_Time, "HH:mm:ss")#
					</td>
					<td width=125 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=black>
						#Fname# #LName#
					</td>
				<tr>
			</table>

		<td width=444 align=left valign=top bgcolor=e1e1e1>
			<PRE><font face=verdana size=1 color=black>#N_Note#</PRE>
		</td>
	</tr>
</table>

</CFOUTPUT>

<p>

<CFFORM NAME="frm" ACTION="./view_Title_comments_nav_tp.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#url.rec_id#&thirdpID=#thirdpID#&a_trigger=1&Title_Ins_Co_Is=#Title_Ins_Co_Is#&A_Update_DB_Flag=1"  ENCTYPE="multipart/form-data" METHOD=POST>

	<table width=590 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
		<tr>
			<td width=590 align=center valign=top bgcolor=green>
				<font face=verdana size=1 color=white>
				<b>Add Comments for order <CFOUTPUT>#url.rec_id#</CFOUTPUT></a>
		<!--- <cfif #username# neq ""><cfoutput>#username#, #N_Note_1#</cfoutput></cfif> --->
		</tr>
	<!--- 	<tr>
			<td width=590 align=center valign=top bgcolor=yellow>
				<font face=verdana size=1 color=red>
				<b>NOTE: PLEASE USE FIXED COMMENTS THAT APPLY. OTHERWISE, REPORTING WILL BE INCORRECT
		</tr> --->
		<tr>
			<td width=590 align=left valign=top bgcolor=e1e1e1>
		<font face=verdana size=1 color=blue>

Type comments below and click "Add" <br><br>


				<TEXTAREA name="N_Note_1" COLS=80 ROWS=5
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
					clear: none;"></TEXTAREA>
		</tr>

	<INPUT TYPE=HIDDEN NAME="username" VALUE="">

		<tr>
			<td width=590 align=right valign=top bgcolor=e1e1e1>
				<input type=image src="./images/button_add.gif" border=0>
		</tr>


	</table>

</table>
			</td>
		</tr>
</table>

				</FORM>
<p>

<br><br>
<a href="javascript:window.close();"><img src="./images/button_close.gif" border=0></a>
</td>
</tr>

	</table>


			</TD>
		</TR>

	</table>
</CFFORM>
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
</HTML>


