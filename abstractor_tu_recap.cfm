
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
			<font size=2 color=green face=arial><b>Add Recap</b><font size=2 color=black face=arial>
			<p>
			<!--- Company - <B>#read_companies.company#</B> --->
			<p>
			Enter the recap info in the form below for order number <font size=2 color=green face=arial><b>#url.rec_id#</b>.
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
	<CFFORM METHOD=POST ACTION="https://#cgi.server_name#/abstractor_tu_recap_submit.cfm?rec_id=#url.rec_id#" name="frm" ENABLECAB="Yes">


	<tr>

		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/clear.gif" height=10 width=85>


		</td>
	</tr>


<!--- ===/ LOAN PROCESSOR INFO \=== --->

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
			<SELECT NAME="select1"
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
			<OPTION VALUE=""></OPTION>
			<OPTION VALUE="Y">Yes</OPTION>
			<OPTION VALUE="N">No</OPTION>

			</SELECT>


		</td>
	</tr>



	 <tr>
		<td width=277 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Property has oil or gas lease recorded


		</td>

		<td width=90 align=left valign=top bgcolor=e6e6e6>
			<SELECT NAME="select2"
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
			<OPTION VALUE=""></OPTION>
			<OPTION VALUE="Y">Yes</OPTION>
			<OPTION VALUE="N">No</OPTION>
			<OPTION VALUE="U">Unknown</OPTION>
			</SELECT>


		</td>
	</tr>

	<tr>
		<td width=277 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Property is tribal property (reservation land)


		</td>

		<td width=90 align=left valign=top bgcolor=e6e6e6>
			<SELECT NAME="select3"
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
			<OPTION VALUE=""></OPTION>
			<OPTION VALUE="Y">Yes</OPTION>
			<OPTION VALUE="N">No</OPTION>
			<OPTION VALUE="U">Unknown</OPTION>
			</SELECT>


		</td>
	</tr>

	<tr>
		<td width=277 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Property grantee is a trust


		</td>

		<td width=90 align=left valign=top bgcolor=e6e6e6>
			<SELECT NAME="select4"
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
			<OPTION VALUE=""></OPTION>
			<OPTION VALUE="Y">Yes</OPTION>
			<OPTION VALUE="N">No</OPTION>

			</SELECT>


		</td>
	</tr>

	<tr>
		<td width=277 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Property is leasehold


		</td>

		<td width=90 align=left valign=top bgcolor=e6e6e6>
			<SELECT NAME="select5"
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
			<OPTION VALUE=""></OPTION>
			<OPTION VALUE="Y">Yes</OPTION>
			<OPTION VALUE="N">No</OPTION>

			</SELECT>


		</td>
	</tr>
	<tr>
		<td width=277 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Property is torrens/registered land


		</td>

		<td width=90 align=left valign=top bgcolor=e6e6e6>
			<SELECT NAME="select6"
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
			<OPTION VALUE=""></OPTION>
			<OPTION VALUE="Y">Yes</OPTION>
			<OPTION VALUE="N">No</OPTION>
			<OPTION VALUE="U">Unknown</OPTION>
			</SELECT>


		</td>
	</tr>

	<tr>
		<td width=277 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Properties covered by a blanket mgt.


		</td>

		<td width=90 align=left valign=top bgcolor=e6e6e6>
			<SELECT NAME="select7"
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
			<OPTION VALUE=""></OPTION>
			<OPTION VALUE="Y">Yes</OPTION>
			<OPTION VALUE="N">No</OPTION>
			<OPTION VALUE="U">Unknown</OPTION>
			</SELECT>


		</td>
	</tr>

		<tr>
		<td width=277 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Mortgage 1 is neg am./reverse mgt


		</td>

		<td width=90 align=left valign=top bgcolor=e6e6e6>
			<SELECT NAME="select8"
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
			<OPTION VALUE=""></OPTION>
			<OPTION VALUE="Y">Yes</OPTION>
			<OPTION VALUE="N">No</OPTION>

			</SELECT>


		</td>
	</tr>
			<tr>
		<td width=277 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Mortgage 2 is neg am./reverse mgt


		</td>

		<td width=90 align=left valign=top bgcolor=e6e6e6>
			<SELECT NAME="select9"
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
			<OPTION VALUE=""></OPTION>
			<OPTION VALUE="Y">Yes</OPTION>
			<OPTION VALUE="N">No</OPTION>

			</SELECT>


		</td>
	</tr>

			<tr>
		<td width=277 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Mortgage 3 is neg am./reverse mgt


		</td>

		<td width=90 align=left valign=top bgcolor=e6e6e6>
			<SELECT NAME="select10"
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
			<OPTION VALUE=""></OPTION>
			<OPTION VALUE="Y">Yes</OPTION>
			<OPTION VALUE="N">No</OPTION>

			</SELECT>


		</td>
	</tr>
			<tr>
		<td width=277 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Mortgage 4 is neg am./reverse mgt


		</td>

		<td width=90 align=left valign=top bgcolor=e6e6e6>
			<SELECT NAME="select11"
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
			<OPTION VALUE=""></OPTION>
			<OPTION VALUE="Y">Yes</OPTION>
			<OPTION VALUE="N">No</OPTION>

			</SELECT>


		</td>
	</tr>

	<tr>

			<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<NOBR><input type=image src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/button_add.gif" border=0><img src="https://<cfoutput>#cgi.server_name#</cfoutput>/images/clear.gif" height=10 width=40></NOBR>


		</td>
	</tr>



</table>

</CFFORM>
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


