<CFPARAM NAME="inst_mon" DEFAULT="">
<CFPARAM NAME="inst_day" DEFAULT="">
<CFPARAM NAME="inst_year" DEFAULT="">
<CFPARAM NAME="a_comments" DEFAULT="">
<CFPARAM NAME="add1" DEFAULT="">
<CFPARAM NAME="add2" DEFAULT="">
<CFPARAM NAME="city" DEFAULT="">
<CFPARAM NAME="state" DEFAULT="">
<CFPARAM NAME="zip" DEFAULT="">
<CFPARAM NAME="country" DEFAULT="">
<CFPARAM NAME="info" DEFAULT="">
<CFPARAM NAME="info2" DEFAULT="">
<CFPARAM NAME="info3" DEFAULT="">
<CFPARAM NAME="info4" DEFAULT="">
<CFPARAM NAME="info5" DEFAULT="">
<CFPARAM NAME="info6" DEFAULT="">
<CFPARAM NAME="info7" DEFAULT="">
<CFPARAM NAME="info8" DEFAULT="">



<CFSET instdate = #CreateDate(#inst_year#, #inst_mon#, #inst_day#)#>


<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>



<CFQUERY datasource="#request.dsn#" NAME="read_type">

			SELECT type
			FROM TRANSUNIONSVCS
			where order_num = '#rec_id#' and type = 'UPDATE'
		</CFQUERY>

<cfif #read_type.recordcount# eq 0>
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
				TRANSUNIONSVCS (order_num, type, seq_num, data1, notes, data4, data17, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16)
				VALUES ('#rec_id#', 'UPDATE', '#seq_num#', '#DateFormat(instdate, "mm/dd/yyyy")#', '#a_comments#', '#add1#', '#add2#', '#city#', '#state#', '#zip#', '#country#', '#info#', '#info2#', '#info3#', '#info4#', '#info5#', '#info6#', '#info7#', '#info8#')

</cfquery>
<!--- <cfquery  datasource="#request.dsn#">
			INSERT INTO
				title_ins_view (title_id, type, seq_num, status, insert_date, insert_time, data1, notes, data4, data17, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16)
				VALUES (#rec_id#, 'UPDATE', '#seq_num#', 'O', '#c_date#', '#c_time#', '#DateFormat(instdate, "mm/dd/yyyy")#', '#a_comments#', '#add1#', '#add2#', '#city#', '#state#', '#zip#', '#country#', '#info#', '#info2#', '#info3#', '#info4#', '#info5#', '#info6#', '#info7#', '#info8#')

</cfquery> --->
<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM TRANSUNIONSVCS
			where order_num = '#rec_id#'
		</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>


<TITLE><cfoutput>#session.site.short_name#</cfoutput> Abstractor Services</TITLE>

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
	<CFINCLUDE TEMPLATE="./includes/title_top_nava.cfm">
<CENTER>
<table width=798 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

<CFOUTPUT>
	<tr>
		<td width=798 align=center valign=top bgcolor=d3d3d3>
			<font size=2 color=green face=arial><b>Add Update</b><font size=2 color=black face=arial>
			<p>
			<!--- Company - <B>#read_companies.company#</B> --->
			<p>
			Enter the Update info in the form below for order number <font size=2 color=green face=arial><b>#url.rec_id#</b>.
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
<!---

	<CFFORM METHOD=POST ACTION="https://#cgi.server_name#/abstractor_add_update_submit.cfm" name="frm" ENABLECAB="Yes">
 --->

	<tr>

		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/clear.gif" height=10 width=85>


		</td>
	</tr>

<cfoutput>
<!--- ===/ LOAN PROCESSOR INFO \=== --->

	<tr>
		<td width=498 colspan=2 align=left valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			<B>Update</B> Information :


		</td>
	</tr>
	<tr>
		<td width=115 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Effective Date


		</td>

		<td width=285 align=left valign=top bgcolor=e6e6e6>
			#inst_mon#/#inst_day#/#inst_year#



		</td>
	</tr>

	<tr>
		<td width=115 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Current Ownership


		</td>

		<td width=285 align=left valign=top bgcolor=e6e6e6>
			#a_comments#


		</td>
	</tr>


	<tr>
		<td width=115 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Address 1


		</td>

		<td width=285 align=left valign=top bgcolor=e6e6e6>
		#add1#


		</td>
	</tr>

		<tr>
		<td width=115 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Address 2


		</td>

		<td width=285 align=left valign=top bgcolor=e6e6e6>
			#add2#


		</td>
	</tr>



	<tr>
		<td width=115 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			City


		</td>

		<td width=285 align=left valign=top bgcolor=e6e6e6>
			#city#


		</td>
	</tr>

	<tr>
		<td width=115 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			State


		</td>

		<td width=285 align=left valign=top bgcolor=e6e6e6>
			#state#


		</td>
	</tr>
	<tr>
		<td width=115 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Zip


		</td>

		<td width=285 align=left valign=top bgcolor=e6e6e6>
		#zip#


		</td>
	</tr>
	<tr>
		<td width=115 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Country


		</td>

		<td width=285 align=left valign=top bgcolor=e6e6e6>
		#country#


		</td>
	</tr>


	<tr>
	<td width=115 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Additional Info

		</td>

		<td width=285 align=left valign=top bgcolor=e6e6e6>
			#info#


		</td>
	</tr>

<tr>
	<td width=115 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>


		</td>

		<td width=285 align=left valign=top bgcolor=e6e6e6>
			#info2#


		</td>
	</tr>
	<tr>
	<td width=115 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>


		</td>

		<td width=285 align=left valign=top bgcolor=e6e6e6>
			#info3#


		</td>
	</tr>
	<tr>
	<td width=115 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>


		</td>

		<td width=285 align=left valign=top bgcolor=e6e6e6>
			#info4#


		</td>
	</tr>
	<tr>
	<td width=115 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>


		</td>

		<td width=285 align=left valign=top bgcolor=e6e6e6>
			#info5#


		</td>
	</tr>
	<tr>
	<td width=115 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>



		</td>

		<td width=285 align=left valign=top bgcolor=e6e6e6>
			#info6#


		</td>
	</tr>
	<tr>
	<td width=115 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>


		</td>

		<td width=285 align=left valign=top bgcolor=e6e6e6>
			#info7#


		</td>
	</tr>
	<tr>
	<td width=115 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>



		</td>

		<td width=285 align=left valign=top bgcolor=e6e6e6>
			#info8#


		</td>
	</tr>
</cfoutput>
	<!--- <tr>

		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<NOBR><input type=image src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/button_add.gif" border=0><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/clear.gif" height=10 width=40></NOBR>


		</td>
	</tr> --->



</table>
</center>
<!--- </CFFORM>	 --->
		</td>

	</tr>
</table>
</center>

	</td>
</tr>
</table>
</center>
	</td>
</tr>
</table>
</center>

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


