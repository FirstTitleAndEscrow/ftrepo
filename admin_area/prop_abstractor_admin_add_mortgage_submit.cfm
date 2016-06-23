<CFPARAM NAME="mort1" DEFAULT="">
<CFPARAM NAME="mort2" DEFAULT="">
<CFPARAM NAME="mort3" DEFAULT="">
<CFPARAM NAME="amt" DEFAULT="">
<CFPARAM NAME="docnum" DEFAULT="">
<CFPARAM NAME="book" DEFAULT="">
<CFPARAM NAME="page" DEFAULT="">
<CFPARAM NAME="inst_mon" DEFAULT="">
<CFPARAM NAME="inst_day" DEFAULT="">
<CFPARAM NAME="inst_year" DEFAULT="">
<CFPARAM NAME="rec_mon" DEFAULT="">
<CFPARAM NAME="rec_day" DEFAULT="">
<CFPARAM NAME="rec_year" DEFAULT="">
<CFPARAM NAME="openend" DEFAULT="">
<CFPARAM NAME="trustee" DEFAULT="">
<CFPARAM NAME="info" DEFAULT="">
<CFPARAM NAME="info2" DEFAULT="">
<CFPARAM NAME="ass1" DEFAULT="">
<CFPARAM NAME="doc_num1" DEFAULT="">
<CFPARAM NAME="book1" DEFAULT="">
<CFPARAM NAME="page1" DEFAULT="">
<CFPARAM NAME="rec_mon1" DEFAULT="">
<CFPARAM NAME="rec_day1" DEFAULT="">
<CFPARAM NAME="rec_year1" DEFAULT="">
<CFPARAM NAME="ass2" DEFAULT="">
<CFPARAM NAME="doc_num2" DEFAULT="">
<CFPARAM NAME="book2" DEFAULT="">
<CFPARAM NAME="page2" DEFAULT="">
<CFPARAM NAME="rec_mon2" DEFAULT="">
<CFPARAM NAME="rec_day2" DEFAULT="">
<CFPARAM NAME="rec_year2" DEFAULT="">
<CFPARAM NAME="ass3" DEFAULT="">
<CFPARAM NAME="doc_num3" DEFAULT="">
<CFPARAM NAME="book3" DEFAULT="">
<CFPARAM NAME="page3" DEFAULT="">
<CFPARAM NAME="rec_mon3" DEFAULT="">
<CFPARAM NAME="rec_day3" DEFAULT="">
<CFPARAM NAME="rec_year3" DEFAULT="">
<CFPARAM NAME="ass4" DEFAULT="">
<CFPARAM NAME="doc_num4" DEFAULT="">
<CFPARAM NAME="book4" DEFAULT="">
<CFPARAM NAME="page4" DEFAULT="">
<CFPARAM NAME="rec_mon4" DEFAULT="">
<CFPARAM NAME="rec_day4" DEFAULT="">
<CFPARAM NAME="rec_year4" DEFAULT="">
<CFPARAM NAME="openend" DEFAULT="">
<CFPARAM NAME="comments" DEFAULT="">
<CFPARAM NAME="subject_trust" DEFAULT="0">

<CFSET instdate = #CreateDate(#inst_year#, #inst_mon#, #inst_day#)#>
<CFSET recdate = #CreateDate(#rec_year#, #rec_mon#, #rec_day#)#>

<cfif #rec_year1# NEQ "" AND #rec_mon1# NEQ "" AND #rec_mon1# NEQ "">
<CFSET recdate1 = #CreateDate(#rec_year1#, #rec_mon1#, #rec_day1#)#>
<cfelse>
<cfset recdate1 = "">
</cfif>
<cfif #rec_year2# NEQ "" AND #rec_mon2# NEQ "" AND #rec_mon2# NEQ "">
<CFSET recdate2 = #CreateDate(#rec_year2#, #rec_mon2#, #rec_day2#)#>
<cfelse>
<cfset recdate2 = "">
</cfif>
<cfif #rec_year3# NEQ "" AND #rec_mon3# NEQ "" AND #rec_mon3# NEQ "">
<CFSET recdate3 = #CreateDate(#rec_year3#, #rec_mon3#, #rec_day3#)#>
<cfelse>
<cfset recdate3 = "">
</cfif>
<cfif #rec_year4# NEQ "" AND #rec_mon4# NEQ "" AND #rec_mon4# NEQ "">
<CFSET recdate4 = #CreateDate(#rec_year4#, #rec_mon4#, #rec_day4#)#>
<cfelse>
<cfset recdate4 = "">
</cfif>

<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>



<CFQUERY datasource="#request.dsn#" NAME="read_type">

			SELECT type
			FROM prop_ins_add
			where prop_id = #rec_id# and type = 'MORTGAGE'
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
		</cfif>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				prop_ins_add (prop_id, type, seq_num, status, insert_date, insert_time, data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16, data17, data18, data19, data20, data21, data22, data23, data24, data25, data26, data27, data28, data29, data30, data31, data32, data33, comments, subject_trust)
				VALUES (#rec_id#, 'MORTGAGE', '#seq_num#', 'O', '#c_date#', '#c_time#', '#mort1#', '#mort2#', '#mort3#', '#amt#', '#docnum#', '#book#', '#page#', '#DateFormat(instdate, "mm/dd/yyyy")#', '#DateFormat(recdate, "mm/dd/yyyy")#', '#trustee#', '#info#', '#info2#', '#ass1#', '#doc_num1#', '#book1#', '#page1#', '#DateFormat(recdate1, "mm/dd/yyyy")#', '#ass2#', '#doc_num2#', '#book2#', '#page2#', '#DateFormat(recdate2, "mm/dd/yyyy")#', '#ass3#', '#doc_num3#', '#book3#', '#page3#', '#DateFormat(recdate3, "mm/dd/yyyy")#', '#ass4#', '#doc_num4#', '#book4#', '#page4#', '#DateFormat(recdate4, "mm/dd/yyyy")#', '#openend#', '#comments#', '#subject_trust#')

</cfquery>
<cfquery  datasource="#request.dsn#">
			INSERT INTO prop_ins_view
				(prop_id, type, seq_num, status, insert_date, insert_time, data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16, data17, data18, data19, data20, data21, data22, data23, data24, data25, data26, data27, data28, data29, data30, data31, data32, data33, comments, subject_trust)
				VALUES (#rec_id#, 'MORTGAGE', '#seq_num#', 'O', '#c_date#', '#c_time#', '#mort1#', '#mort2#', '#mort3#', '#amt#', '#docnum#', '#book#', '#page#', '#DateFormat(instdate, "mm/dd/yyyy")#', '#DateFormat(recdate, "mm/dd/yyyy")#', '#trustee#', '#info#', '#info2#', '#ass1#', '#doc_num1#', '#book1#', '#page1#', '#DateFormat(recdate1, "mm/dd/yyyy")#', '#ass2#', '#doc_num2#', '#book2#', '#page2#', '#DateFormat(recdate2, "mm/dd/yyyy")#', '#ass3#', '#doc_num3#', '#book3#', '#page3#', '#DateFormat(recdate3, "mm/dd/yyyy")#', '#ass4#', '#doc_num4#', '#book4#', '#page4#', '#DateFormat(recdate4, "mm/dd/yyyy")#', '#openend#', '#comments#', '#subject_trust#')


</cfquery>
<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM prop_ins_add
			where prop_id = #rec_id#
		</CFQUERY>
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
	<CFINCLUDE TEMPLATE="./includes/prop_top_navt.cfm">
<CENTER>
<table width=798 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>


<CFOUTPUT>
	<tr>
		<td width=798 align=center valign=top bgcolor=d3d3d3>
			<font size=2 color=green face=arial><b>Add Mortgage</b><font size=2 color=black face=arial>
			<p>
			<!--- Company - <B>#read_companies.company#</B> --->
			<p>
			Below is the Mortgage information entered for order number <font size=2 color=green face=arial><b>#url.rec_id#</b>.<br>
		Click here to go back to the main page.<a href="./prop_vendor_admin_data_form.cfm?uid=#url.uid#&al=#url.al#&rec_id=#url.rec_id#"><img src="./images/button_return.gif" border=0 ALT="Click this button to return to main"></a>


		</td>
	</tr>
</CFOUTPUT>

</table>

		</td>
	</tr>

	<tr>
			<td width=798 align=center valign=top bgcolor=e6e6e6>


<center>
<table width=600 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

<!---
	<CFFORM METHOD=POST ACTION="https://#cgi.server_name#/abstractor_add_mortgage_submit.cfm" name="frm" ENABLECAB="Yes">

 --->
	<tr>

		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/clear.gif" height=10 width=85>


		</td>
	</tr>


<!--- ===/ LOAN PROCESSOR INFO \=== --->
<cfoutput>
	<tr>
		<td width=498 colspan=2 align=left valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			<B>Motgage</B> Information :


		</td>
	</tr>

	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Mortgagee


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#mort1#


		</td>
	</tr>
<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Mortgagor 1


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#mort2#


		</td>
	</tr>
<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Mortgagor 2


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
		#mort3#


		</td>
	</tr>


	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Amount


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
	#amt#


		</td>
	</tr>
<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Document Number


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
	#docnum#

		</td>
	</tr>
	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Book


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#book#


		</td>
	</tr>
	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Page


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#page#


		</td>
	</tr>
	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Date of Mortgage


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#inst_mon#/#inst_day#/#inst_year#
		</td>
	</tr>
		<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Recording Date


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#rec_mon#/#rec_day#/#rec_year#



		</td>
	</tr>



	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
		Open End


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
	#openend#
</td>
	</tr>


	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
		Subject Trust


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
	<cfif subject_trust eq 1>Yes<cfelse>No</cfif>
</td>
	</tr>


	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Trustee


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#trustee#


		</td>
	</tr>

<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Information


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#info#

		</td>
	</tr>

	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>



		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#info2#

		</td>
	</tr>

	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1st Assignee


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#ass1#


		</td>
	</tr>
	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Document Number


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#doc_num1#


		</td>
	</tr>
	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Book


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#book1#


		</td>
	</tr>
	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Page


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#page1#


		</td>
	</tr>

	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Recording Date


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#rec_mon1#/#rec_day1#/#rec_year1#


		</td>
	</tr>
		<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			2nd Assignee


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#ass2#


		</td>
	</tr>
	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Document Number


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#doc_num2#


		</td>
	</tr>
	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Book


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#book2#


		</td>
	</tr>
	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Page


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#page2#


		</td>
	</tr>

	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Recording Date


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#rec_mon2#/#rec_day2#/#rec_year2#


		</td>
	</tr>

<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			3rd Assignee


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#ass3#


		</td>
	</tr>
	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Document Number


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#doc_num3#


		</td>
	</tr>
	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Book


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#book3#


		</td>
	</tr>
	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Page


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#page3#


		</td>
	</tr>

	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Recording Date


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#rec_mon3#/#rec_day3#/#rec_year3#


		</td>
	</tr>
<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			4th Assignee


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#ass4#


		</td>
	</tr>
	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Document Number


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#doc_num4#


		</td>
	</tr>
	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Book


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#book4#


		</td>
	</tr>
	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Page


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#page4#


		</td>
	</tr>

	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Recording Date


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#rec_mon4#/#rec_day4#/#rec_year4#


		</td>
	</tr>


	<tr>
		<td width=300 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Comments


		</td>

		<td width=600 align=left valign=top bgcolor=e6e6e6>
			#comments#


		</td>
	</tr>



	<!--- <tr>

			<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<NOBR><input type=image src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/button_add.gif" border=0><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/clear.gif" height=10 width=40></NOBR>


		</td>
	</tr> --->

</cfoutput>

</table>
<!---
</CFFORM>	 --->
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


