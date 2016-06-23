<CFPARAM NAME="day" DEFAULT="">
<CFPARAM NAME="month" DEFAULT="">
<CFPARAM NAME="year" DEFAULT="">
<CFPARAM NAME="grantor1" DEFAULT="">
<CFPARAM NAME="grantor2" DEFAULT="">
<CFPARAM NAME="grantee1" DEFAULT="">
<CFPARAM NAME="grantee2" DEFAULT="">
<CFPARAM NAME="deedtype" DEFAULT="">
<CFPARAM NAME="mannertitle" DEFAULT="">
<CFPARAM NAME="docnum" DEFAULT="">
<CFPARAM NAME="book" DEFAULT="">
<CFPARAM NAME="page" DEFAULT="">
<CFPARAM NAME="inst_mon" DEFAULT="">
<CFPARAM NAME="inst_day" DEFAULT="">
<CFPARAM NAME="inst_year" DEFAULT="">
<CFPARAM NAME="rec_mon" DEFAULT="">
<CFPARAM NAME="rec_day" DEFAULT="">
<CFPARAM NAME="rec_year" DEFAULT="">
<CFPARAM NAME="trustee" DEFAULT="">
<CFPARAM NAME="vest" DEFAULT="">
<CFPARAM NAME="consider" DEFAULT="">
<CFPARAM NAME="township" DEFAULT="">
<CFPARAM NAME="info" DEFAULT="">
<CFPARAM NAME="info2" DEFAULT="">
<CFPARAM NAME="a_comments" DEFAULT="">
<CFPARAM NAME="Legalsubdivision" DEFAULT="">
<CFPARAM NAME="LegalBlock" DEFAULT="">
<CFPARAM NAME="LegalLot" DEFAULT="">
<CFPARAM NAME="consider_type" DEFAULT="">
<CFPARAM NAME="comments" DEFAULT="">

<CFSET effective = #CreateDate(#year#, #month#, #day#)#>
<CFSET instdate = #CreateDate(#inst_year#, #inst_mon#, #inst_day#)#>
<CFSET recdate = #CreateDate(#rec_year#, #rec_mon#, #rec_day#)#>
<CFSET searchdate = #CreateDate(#search_year#, #search_mon#, #search_day#)#>


<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>

<CFQUERY datasource="#request.dsn#" NAME="read_order">
    SELECT *
	FROM Property
	WHERE prop_id = #url.rec_ID#
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_type">
    SELECT type
	FROM prop_ins_add
	where prop_id = #rec_id# and type = 'DATA'
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
		<cfset seq_num = read_type.recordcount + 1>
		</cfif>


<cfquery  datasource="#request.dsn#">
			INSERT INTO
				prop_ins_add (prop_id, type, seq_num, status, insert_date, insert_time, data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16, data17, data37, data38, Legalsubdivision,LegalBlock,LegalLot,notes,consider_type<CFIF #read_order.search_type# neq "d">, addreq, addex</CFIF>,search_date, comments)
				VALUES (#rec_id#, 'DATA', '#seq_num#', 'O', '#c_date#', '#c_time#', '#grantor1#', '#grantor2#', '#grantee1#', '#grantee2#', '#deedtype#', '#mannertitle#', '#docnum#', '#book#', '#page#', '#DateFormat(instdate, "mm/dd/yyyy")#', '#DateFormat(recdate, "mm/dd/yyyy")#', '#trustee#', '#vest#', '#info#', '#info2#', '#consider#', '#township#', '#DateFormat(effective, "mm/dd/yyyy")#', '#select1#', '#Legalsubdivision#','#LegalBlock#','#LegalLot#','#a_comments#','#consider_type#'<CFIF #read_order.search_type# neq "d">,'#addreq#', '#addex#'</CFIF>,'#search_mon#/#search_day#/#search_year#', '#comments#')
</cfquery>
<!---It seems totally stupid to me that there would be two inserts here but I'm not willing to get rid
of one incase it is referenced somewhere else.
Harry 10/28/04
--->
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				prop_ins_view (prop_id, type, seq_num, status, insert_date, insert_time, data1, data2, data3, data4, data5, data6, data7, data8, data9, data10, data11, data12, data13, data14, data15, data16, data17, data37, data38, Legalsubdivision,LegalBlock,LegalLot,notes,consider_type<CFIF #read_order.search_type# neq "d">, addreq, addex</CFIF>,search_date, comments)
				VALUES (#rec_id#, 'DATA', '#seq_num#', 'O', '#c_date#', '#c_time#', '#grantor1#', '#grantor2#', '#grantee1#', '#grantee2#', '#deedtype#', '#mannertitle#', '#docnum#', '#book#', '#page#', '#DateFormat(instdate, "mm/dd/yyyy")#', '#DateFormat(recdate, "mm/dd/yyyy")#', '#trustee#', '#vest#', '#info#', '#info2#', '#consider#', '#township#', '#DateFormat(effective, "mm/dd/yyyy")#', '#select1#', '#Legalsubdivision#','#LegalBlock#','#LegalLot#','#a_comments#','#consider_type#'<CFIF #read_order.search_type# neq "d">, '#addreq#', '#addex#'</CFIF>,'#search_mon#/#search_day#/#search_year#', '#comments#')
</cfquery>


<CFQUERY datasource="#request.dsn#" NAME="read_report">
    SELECT *
	FROM prop_ins_add
	where prop_id = #rec_id# and type = 'DATA'
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
			<font size=2 color=green face=arial><b>Add Data receipt</b><font size=2 color=black face=arial>
			<p>

			<p>
			 You have Entered the data info shown below for order number <font size=2 color=green face=arial><b>#url.rec_id#</b><br>.
			Click here to go back to the main page.<a href="./prop_vendor_admin_data_form.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#url.rec_id#"><img src="./images/button_return.gif" border=0 ALT="Click this button to return to main"></a>

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

	<tr>

		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<img src="/images/clear.gif" height=10 width=85>


		</td>
	</tr>


<cfoutput>

<tr>
		<td width=498 colspan=2 align=center valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			<B>Effective</B> Date:


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Effective Date


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<nobr>#month#/#day#/#year#



		</td>
	</tr>
    <tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Search Date


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<nobr>#searchdate#



		</td>
	</tr>

	<tr>
		<td width=498 colspan=2 align=center valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			<B>Type of Vesting:</B>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Type of Vesting


		</td>

	<td width=237 align=left valign=top bgcolor=e6e6e6>

#select1#


		</td>
	</tr>




	<tr>
		<td width=498 colspan=2 align=center valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			<B>Deed</B> Information entered:


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Grantor 1


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#grantor1#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Grantor 2


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
	#grantor2#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
		Grantee 1


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		#grantee1#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Grantee 2


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
	#grantee2#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Type of Deed


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#deedtype#

		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Manner of Tile


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
						#mannertitle#

		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Document Number

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#docnum#

		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Book


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#book#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Page


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
	#page#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Instrument Date


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#inst_mon#/#inst_day#/#inst_year#



		</td>
	</tr>
		<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Recording Date


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#rec_mon#/#rec_day#/#rec_year#


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Trustee


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#trustee#

		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Vesting


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#vest#


		</td>
	</tr>
    	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Consideration

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#consider#

		</td>
	</tr>
    <tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Consideration Type

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#consider_type#

		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Township

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#township#

		</td>
	</tr>

	<tr>
    <!---Harry 10/28/04--->
    <tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Subdivision

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#LegalSubdivision#

		</td>
	</tr>
    <tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Legal Block/Bldg

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#LegalBlock#

		</td>
	</tr>
    <tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Legal Lot

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#LegalLot#

		</td>
	</tr>

    <!---End--->
	<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>

		Additional Info

		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#info#


		</td>
	</tr>
<tr>
	<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			#info2#


		</td>
	</tr>



	<table width=498 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=498 colspan=2 align=center valign=top bgcolor=gray>
			<font size=2 color=white face=arial>
			<B>Legal</B> Information Entered:


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Legal


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		#a_comments#


		</td>
	</tr>
    <CFIF #read_order.search_type# neq "D">
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Additional Requirement


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		#addreq#


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Additional Exceptions


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		#addex#


		</td>
	</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Comments


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		#comments#


		</td>
	</tr>
    </CFIF>
	</table>

</cfoutput>

	<!--- <tr>

		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<NOBR><input type=image src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/button_add.gif" border=0><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/clear.gif" height=10 width=40></NOBR>


		</td>
	</tr>
 --->


</table>

<!--- </CFFORM> --->
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


