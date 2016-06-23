
<CFPARAM NAME="select1" DEFAULT="">
<CFPARAM NAME="select2" DEFAULT="">
<CFPARAM NAME="select3" DEFAULT="">
<CFPARAM NAME="select4" DEFAULT="">
<CFPARAM NAME="select5" DEFAULT="">
<CFPARAM NAME="select6" DEFAULT="">
<CFPARAM NAME="select7" DEFAULT="">
<CFPARAM NAME="select8" DEFAULT="">
<CFPARAM NAME="select9" DEFAULT="">
<CFPARAM NAME="select10" DEFAULT="">
<CFPARAM NAME="select11" DEFAULT="">

<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>


<CFQUERY datasource="#request.dsn#" NAME="read_type">

			SELECT type
			FROM title_ins_add
			where title_id = #rec_id# and type = 'RECAP'
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

<cfif #read_type.recordcount# eq 0>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				title_ins_add (title_id, type, seq_num, status, insert_date, insert_time, data1)
				VALUES (#rec_id#, 'RECAP', '#seq_num#', 'O', '#c_date#', '#c_time#', '#select1#')

</cfquery>
<cfquery  datasource="#request.dsn#">
			INSERT INTO
				title_ins_view (title_id, type, seq_num, status, insert_date, insert_time, data1)
				VALUES (#rec_id#, 'RECAP', '#seq_num#', 'O', '#c_date#', '#c_time#', '#select1#')


</cfquery>
<cfelse>

<cfquery  datasource="#request.dsn#">
		UPDATE
title_ins_add
set title_id =#rec_id#,
type= 'RECAP',
seq_num='#seq_num#',
status= 'U',
insert_date='#c_date#',
insert_time='#c_time#',
data1='#select1#'

</cfquery>

</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_report">

			SELECT *
			FROM title_ins_add
			where title_id = #rec_id#
		</CFQUERY>

<!--- , data2, data3, data4, data5, data6, data7, data8, data9, data10, data11 , '#select2#', '#select3#', '#select4#', '#select5#', '#select6#', '#select7#', '#select8#', '#select9#', '#select10#', '#select11#'
 ---><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
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
			<font size=2 color=green face=arial><b>Add Recap</b><font size=2 color=black face=arial>
			<p>
			<!--- Company - <B>#read_companies.company#</B> --->
			<p>
			You have entered the recap info in the form shown below for order number <font size=2 color=green face=arial><b>#url.rec_id#</b>.
		<br> Click here to return</td>
	</tr>
</CFOUTPUT>

</table>

		</td>
	</tr>

	<tr>
		<td width=798 align=center valign=top bgcolor=e6e6e6>


<center>
<table width=498 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<!--- <CFFORM METHOD=POST ACTION="https://#cgi.server_name#/abstractor_add_recap_submit.cfm" name="frm" ENABLECAB="Yes">

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
			<B>Recap</B> Information :


		</td>
	</tr>

	<tr>
		<td width=277 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Deed type is Land Contract (sales agreement)


		</td>

		<td width=90 align=left valign=top bgcolor=e6e6e6>
			#select1#


		</td>
	</tr>



	<!--- <tr>
		<td width=277 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Property has oil or gas lease recorded


		</td>

		<td width=90 align=left valign=top bgcolor=e6e6e6>
			#select2#

		</td>
	</tr>

	<tr>
		<td width=277 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Property is tribal property (reservation land)


		</td>

		<td width=90 align=left valign=top bgcolor=e6e6e6>
		#select3#


		</td>
	</tr>

	<tr>
		<td width=277 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Property grantee is a trust


		</td>

		<td width=90 align=left valign=top bgcolor=e6e6e6>
		#select4#


		</td>
	</tr>

	<tr>
		<td width=277 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Property is leasehold


		</td>

		<td width=90 align=left valign=top bgcolor=e6e6e6>
#select5#


		</td>
	</tr>
	<tr>
		<td width=277 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Property is torrens/registered land


		</td>

		<td width=90 align=left valign=top bgcolor=e6e6e6>
			#select6#


		</td>
	</tr>

	<tr>
		<td width=277 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Properties covered by a blanket mgt.


		</td>

		<td width=90 align=left valign=top bgcolor=e6e6e6>
			#select7#


		</td>
	</tr>

		<tr>
		<td width=277 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Mortgage 1 is neg am./reverse mgt


		</td>

		<td width=90 align=left valign=top bgcolor=e6e6e6>
			#select8#


		</td>
	</tr>
			<tr>
		<td width=277 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Mortgage 2 is neg am./reverse mgt


		</td>

		<td width=90 align=left valign=top bgcolor=e6e6e6>
		#select9#


		</td>
	</tr>

			<tr>
		<td width=277 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Mortgage 3 is neg am./reverse mgt


		</td>

		<td width=90 align=left valign=top bgcolor=e6e6e6>
			#select10#


		</td>
	</tr>
			<tr>
		<td width=277 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Mortgage 4 is neg am./reverse mgt


		</td>

		<td width=90 align=left valign=top bgcolor=e6e6e6>
			#select11#


		</td> --->
	</tr>
	</cfoutput>
	<tr>

			<cfoutput><td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<!--- <NOBR><input type=image src="https://#cgi.server_name#/images/button_add.gif" border=0><img src="#cgi.server_name#/images/clear.gif" height=10 width=40></cfoutput></NOBR>
				 --->

		</td>
	</tr>



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


