
<CFPARAM NAME="a_direction" DEFAULT="">
<CFPARAM NAME="Insurance_Company" DEFAULT="">
<CFPARAM NAME="Title_Ins_Co_Is" DEFAULT="0">
<CFPARAM NAME="A_Update_DB_Flag" DEFAULT="0">
<CFPARAM NAME="shipping" DEFAULT="0">


	<cfif #a_trigger# EQ "1">

			<CFIF #A_Update_DB_Flag# GT "0">
			<CFQUERY datasource="#request.dsn#" NAME="read_all_shipping">
				SELECT *
				FROM abstractor_info
				Where title_Id = #URL.rec_id#

			</CFQUERY>


	<!--- <cfif #read_all_shipping.recordcount# GT "0">

		<CFQUERY datasource="#request.dsn#">
				update abstractor_Info
				set title_ID = #URL.rec_id#,
				abstract_data = '#shipping#',
				abstract_Date = '#DateFormat(Now(), "m/d/yyyy")#',
				abstract_Time = '#TimeFormat(Now(), "HH:mm:ss")#'
			where title_ID = #URL.rec_id#
			</CFQUERY>

			<cfelse> --->

			<CFQUERY datasource="#request.dsn#">
				Insert into abstractor_Info
				(title_ID, abstract_data, abstract_Date, abstract_Time)
				values (#URL.rec_id#,
				 '#shipping#',
				 '#DateFormat(Now(), "m/d/yyyy")#',
				 '#TimeFormat(Now(), "HH:mm:ss")#'
				)
			</CFQUERY>

					<CFQUERY datasource="#request.dsn#" NAME="read_cl">
				SELECT distinct title_id
				FROM abstractor_info
				Where title_Id = #URL.rec_id#

			</CFQUERY>

			<CFQUERY datasource="#request.dsn#">
				update doc_abstract_title
				set abstract_Date = '#DateFormat(Now(), "m/d/yyyy")#',
				abstract_Time = '#TimeFormat(Now(), "HH:mm:ss")#'
			where title_ID = #URL.rec_id#
			</CFQUERY>


		<!--- 	</cfif> --->
		</CFIF>


	<!--- Read all of the Notes for this title --->

			<CFQUERY datasource="#request.dsn#" NAME="read_all_notes">
				SELECT *
				FROM abstractor_info
				Where title_Id = #URL.rec_id#

			</CFQUERY>
		<cfelse>

		<CFIF #A_Update_DB_Flag# GT "0">
			<CFQUERY datasource="#request.dsn#" NAME="read_shipping">
				SELECT *
				FROM closer_info
				Where title_Id = #URL.rec_id#

			</CFQUERY>


	<!--- <cfif #read_shipping.recordcount# GT "0">

		<CFQUERY datasource="#request.dsn#">
				update closer_Info
				set title_ID = #URL.rec_id#,
				closer_data = '#shipping#',
				closer_Date = '#DateFormat(Now(), "m/d/yyyy")#',
				closer_Time = '#TimeFormat(Now(), "HH:mm:ss")#'
			where title_ID = #URL.rec_id#
			</CFQUERY>

			<cfelse> --->


			<CFQUERY datasource="#request.dsn#">
				Insert into closer_Info
				(title_ID, closer_data, closer_Date, closer_Time)
				values (#URL.rec_id#,
				 '#shipping#',
				 '#DateFormat(Now(), "m/d/yyyy")#',
				 '#TimeFormat(Now(), "HH:mm:ss")#'
				)
			</CFQUERY>

				<CFQUERY datasource="#request.dsn#" NAME="read_cl">
				SELECT distinct title_id
				FROM closer_info
				Where title_Id = #URL.rec_id#

			</CFQUERY>

			<CFQUERY datasource="#request.dsn#">
				update doc_closer_title
				set closer_Date = '#DateFormat(Now(), "m/d/yyyy")#',
				closer_Time = '#TimeFormat(Now(), "HH:mm:ss")#'
			where title_ID = #URL.rec_id#
			</CFQUERY>

			<!--- </cfif> --->
		</CFIF>


	<!--- Read all of the Notes for this title --->

			<CFQUERY datasource="#request.dsn#" NAME="read_notes">
				SELECT *
				FROM closer_info
				Where title_Id = #URL.rec_id#

			</CFQUERY>



		</cfif>

			<CFQUERY datasource="#request.dsn#" NAME="read_closer">
				SELECT *
				FROM closer_info
				Where title_Id = #URL.rec_id#

			</CFQUERY>

			<CFQUERY datasource="#request.dsn#" NAME="read_abstract">
				SELECT *
				FROM abstractor_info
				Where title_Id = #URL.rec_id#

			</CFQUERY>

			<CFQUERY datasource="#request.dsn#" NAME="read_title">
				SELECT *
				FROM title
				Where title_Id = #URL.rec_id#
			</CFQUERY>
			<CFQUERY datasource="#request.dsn#" NAME="read_company">
				SELECT *
				FROM Companies
				Where Id = #read_title.comp_id#
			</CFQUERY>
<cftry>
<cfinvoke component = "cfc.team_info"	method = "getTeamEmail"	returnVariable = "team_email" team_id="#read_company.team_id#">
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

<CFIF #A_Update_DB_Flag# eq "2">

<CFMAIL
TO="pgibb@firsttitleservices.com"
FROM="#team_email#" Subject="New information sent from Closer vendor for order #read_title.title_id#"
TIMEOUT="600"
	>
The following comment below has been noted regarding the above referenced file:

Comment: <cfif #shipping# neq "">'#shipping#'</cfif>

First Title
</CFMAIL>
<cfelse>
<CFMAIL
TO="pibb@firsttitleservices.com"
FROM="pibb@firsttitleservices.com" Subject="New information sent from Abstractor vendor for order #read_title.title_id#"
TIMEOUT="600"
	>
The following comment below has been noted regarding the above referenced file:

Comment: <cfif #shipping# neq "">'#shipping#'</cfif>

First Title
</CFMAIL>
</cfif>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<cfif #a_trigger# EQ "1">


<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<CFINCLUDE TEMPLATE="./includes/title_top_navv.cfm">
		<p><tr>
		<td width=790 align=center valign=top>

<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width=790 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Abstractor Data Information</B></CENTER>
			</TD>
		</TR>
	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>

<CFOUTPUT QUERY="Read_all_notes">
	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>




			<td width=255 align=left valign=top bgcolor=e1e1e1>



			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#abstract_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#abstract_Time#</b>
					</td>

				<tr>


			</table>


		<td width=444 align=left valign=top bgcolor=e1e1e1>
			<PRE><font face=verdana size=1 color=black>#read_all_notes.abstract_data#</PRE>
		</td>
	</tr>
</table>


		</CFOUTPUT>





<p>

<CFFORM NAME="frm" ACTION="./title_vendor_add_data.cfm?username=#url.username#&password=#url.password#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&Title_Ins_Co_Is=#Title_Ins_Co_Is#&A_Update_DB_Flag=1" METHOD=POST>

	<table width=619 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
		<tr>
			<td width=619 align=center valign=top bgcolor=green>
				<font face=verdana size=1 color=white>
				<b>Add Raw Data </b>
		</tr>
		<tr>
			<cfoutput><td width=619 align=left valign=top bgcolor=e1e1e1>
				<TEXTAREA name="shipping"  COLS=120 ROWS=20
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
					<p>
		</td></cfoutput></tr>
		<tr>
			<td width=619 align=right valign=top bgcolor=e1e1e1>
				<input type=image src="./images/button_add.gif" border=0>
		</tr>
		</table>

</table>
			</td>
		</tr>
</table>
<p>
<p>

</td>
</tr>

	</table>


			</TD>
		</TR>

	</table>

</CFFORM>
<cfelse>

<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<CFINCLUDE TEMPLATE="./includes/title_top_navc.cfm"><tr>
		<td width=790 align=center valign=top>

		<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width=790 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Closer Data Information</B></CENTER>
			</TD>
		</TR>
	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>


		<p>

<CFOUTPUT QUERY="Read_notes">
	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>



				<td width=255 align=left valign=top bgcolor=e1e1e1>




			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#closer_Date#</b>
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#closer_Time#</b>
					</td>

				<tr>


			</table>

		<td width=444 align=left valign=top bgcolor=e1e1e1>
			<PRE><font face=verdana size=1 color=black>#read_notes.closer_data#</PRE>
		</td>
	</tr>
</table>
		</CFOUTPUT>





<p>

<CFFORM NAME="frm" ACTION="./title_vendor_add_data.cfm?user=#url.user#&pass=#url.pass#&rec_id=#rec_id#&a_trigger=2&company_id=#company_ID#&Title_Ins_Co_Is=#Title_Ins_Co_Is#&A_Update_DB_Flag=2" METHOD=POST>

	<table width=619 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
		<tr>
			<td width=619 align=center valign=top bgcolor=green>
				<font face=verdana size=1 color=white>
				<b>Add Data </b>
		</tr>
		<tr>
			<cfoutput><td width=619 align=left valign=top bgcolor=e1e1e1>
				<TEXTAREA name="shipping"  COLS=120 ROWS=20
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
					<p>
		</td></cfoutput></tr>
		<tr>
			<td width=619 align=right valign=top bgcolor=e1e1e1>
				<input type=image src="./images/button_add.gif" border=0>
		</tr>
		</table>

</table>
			</td>
		</tr>
</table>







<p>
<p>


<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->

</td>
</tr>

	</table>


			</TD>
		</TR>

	</table>
</CFFORM>
</cfif>
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


