
<cfquery datasource="#request.dsn#" name="getuser">

select * from first_admin
where id = #url.uid#
</cfquery>

			<CFQUERY datasource="#request.dsn#" NAME="read_companies">
				SELECT *
				FROM Companies
				 order by company
			</CFQUERY>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<BODY BGCOLOR="elelel" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">
<CENTER>
<table width=500 border="0" cellpadding="0" cellspacing="0" background="">

	<tr><td width=500 align=right valign=top><CFOUTPUT><font size=1 color=blue face=arial><NOBR>[ #DateFormat(Now(), "ddddd")# ]&nbsp;&nbsp;&nbsp; #DateFormat(Now(), "mmmmm dd, yyyy")# - #TimeFormat(Now(), "HH:mm:ss")# (Eastern Standard Time)&nbsp;&nbsp;&nbsp;&nbsp;</NOBR></CFOUTPUT><p><br><p></p></font></td></tr>
</table></CENTER>
<CENTER><br><br><br><br><br>
<CFFORM NAME="frm" ACTION="./calendar_search.cfm?uid=#uid#" METHOD=POST>
<input type="hidden" name="uid" value="#getuser.id#">
<table border="0"  width=500 cellpadding="1" cellspacing="1" align = "center">

		<tr align="center" valign=top bgcolor=navy>
			<td width=500  align="center" valign=top bgcolor=blue>
				<CENTER><font size=2 color=white face=arial align="center">
				             Choose the Company for which to view closings from calendar
			</td></CENTER><p><br>
</tr><tr>
			<td width=500  align=center valign=top bgcolor=d1d1d1>
				<SELECT NAME="comp_id"
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
			><option value="ALL">ALL</option>
			<CFOUTPUT QUERY="read_companies"><OPTION VALUE="#ID#">#Company#</OPTION></CFOUTPUT>
			</SELECT>
			</td>
		</tr>

		<tr>
			<td width=500 colspan=2  align=center valign=top bgcolor=d1d1d1>
				<INPUT TYPE=IMAGE SRC="./images/button_proceed.gif" border=0>
			</td>
		</tr>


	</table></CENTER>


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
</html>
