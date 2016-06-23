<!--- <CFPARAM NAME="docid" DEFAULT="">
<CFPARAM NAME="book" DEFAULT="">
<CFPARAM NAME="page" DEFAULT="">
<CFPARAM NAME="inst_mon" DEFAULT="">
<CFPARAM NAME="inst_day" DEFAULT="">
<CFPARAM NAME="inst_year" DEFAULT="">
<CFPARAM NAME="amount" DEFAULT="">
<CFPARAM NAME="lien" DEFAULT="">
<CFPARAM NAME="dept" DEFAULT="">
<CFPARAM NAME="info" DEFAULT="">
<CFPARAM NAME="info2" DEFAULT="">
 --->

<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>

<!--- <CFSET instdate = #CreateDate(#inst_year#, #inst_mon#, #inst_day#)#> --->

<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM prop_ins_add
			where prop_id = #rec_id# and type = 'LIEN' and seq_num = #seq_num#
		</CFQUERY>

<!--- <cfif #read_type.recordcount# eq 0>
		<cfset seq_num = 1>
<cfelseif #read_type.recordcount# eq 1>
		<cfset seq_num = 2>
<cfelseif #read_type.recordcount# eq 2>
		<cfset seq_num = 3>
	<cfelseif #read_type.recordcount# eq 3>
		<cfset seq_num = 4>
<cfelseif #read_type.recordcount# eq 4>
		<cfset seq_num = 5>
	<cfelseif #read_type.recordcount# eq 5>
		<cfset seq_num = 6>
		<cfelseif #read_type.recordcount# eq 6>
		<cfset seq_num = 7>
		<cfelseif #read_type.recordcount# eq 7>
		<cfset seq_num = 8>
		<cfelseif #read_type.recordcount# eq 8>
		<cfset seq_num = 9>
		<cfelseif #read_type.recordcount# eq 9>
		<cfset seq_num = 10>
		<cfelse>
		<cfset seq_num = 11>
		</cfif>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				title_ins_add (title_id, type, seq_num, status, insert_date, insert_time, data1, data2, data3, data4, data5, data6, data7, data8, data9)
				VALUES (#rec_id#, 'LIEN', '#seq_num#', 'O', '#c_date#', '#c_time#', '#docid#', '#book#', '#page#', '#DateFormat(instdate, "mm/dd/yyyy")#', '#amount#', '#lien#', '#dept#', '#info#', '#info2#')

</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM title_ins_add
			where title_id = #rec_id#
		</CFQUERY> --->



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>


<TITLE>First Title Abstractor Services</TITLE>

</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>

<CENTER>

<table width=798 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=798 align=center valign=top>
	<CENTER>
<table width=798 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>


	<tr>
		<td width=798 align=center valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>
	<CFINCLUDE TEMPLATE="./includes/prop_top_nav.cfm">
<CENTER>
<table width=798 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

<CFOUTPUT>
	<tr>
		<td width=798 align=center valign=top bgcolor=d3d3d3>
			<font size=2 color=green face=arial><b>Add Lien</b><font size=2 color=black face=arial>
			<p>
			<!--- Company - <B>#read_companies.company#</B> --->
			<p>
			You have Entered the Lien info in the form shown below for order number <font size=2 color=green face=arial><b>#url.rec_id#</b> <br> Click this button to return.
		</td>
	</tr>
</CFOUTPUT>

</table>

		</td>
	</tr>

	<tr>
		<td width=798 align=center valign=top bgcolor=e6e6e6>


<center>
<table width=498 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<!--- <CFFORM METHOD=POST ACTION="https://#cgi.server_name#/abstractor_add_lien_submit.cfm?rec_id=#url.rec_id#" name="frm" ENABLECAB="Yes">
 --->

	<tr>

		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/clear.gif" height=10 width=85>


		</td>
	</tr>


<!--- ===/ LOAN PROCESSOR INFO \=== --->
	<cfoutput query = "read_report">
	<tr>
	<td width=498 colspan=2 align=left valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			<B>Lien</B> Information :


		</td>
	</tr>

	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Docket Number


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			#data1#


		</td>
	</tr>

	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Book


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			#data2#


		</td>
	</tr>


	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Page


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
		#data3#


		</td>
	</tr>

	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Date


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			#data4#

		</td>
	</tr>

	<tr>
<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Recorded

		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
		#data9#


		</td>
	</tr>

<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Amount


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
			#data5#


		</td>
	</tr>

	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Lienholder


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
		#data6#

		</td>
	</tr>
	<tr>
		<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Debtor


		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
#data7#


		</td>
	</tr>

	<tr>
	<td width=183 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Additional Info

		</td>

		<td width=217 align=left valign=top bgcolor=e6e6e6>
		#data8#


		</td>
	</tr>



</cfoutput>

	<!--- <tr>

			<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<NOBR><input type=image src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/button_add.gif" border=0><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/clear.gif" height=10 width=40></NOBR>


		</td>
	</tr> --->



</table>

<!--- </CFFORM>	 --->
		</td>

	</tr>
</table>


	</td>
</tr>
</table>

	</td>
</tr>
</table>


</BODY>
</HTML>


