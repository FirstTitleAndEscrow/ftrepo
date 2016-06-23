
<CFQUERY datasource="#request.dsn#" NAME="read_title">

			SELECT *
			FROM Title
			WHERE title_ID = #URL.rec_ID#


		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="read_list_of_Insurance_Co_IDs">
				SELECT DISTINCT Title_Co_ID
				FROM Title_Companies_States
				 WHERE ST_Abbrev LIKE '%#read_Title.pstate#%'
				ORDER BY Title_Co_ID ASC
			</CFQUERY>
		<CFSET a_Title_Insurance_Company = ArrayNew(1)>
		<CFSET a_Title_Co_ID  = ArrayNew(1)>
		<CFSET Title_Ins_Count = "1">

		<CFOUTPUT QUERY="read_list_of_Insurance_Co_IDs">
			<CFQUERY datasource="#request.dsn#" NAME="read_List_of_Insurance_companies">
				SELECT *
				FROM Title_Companies
				 WHERE Title_Co_ID = #Title_Co_ID#
			</CFQUERY>

			<CFSET a_Title_Insurance_Company[Title_Ins_Count]  = #read_List_of_Insurance_companies.Company#>
			<CFSET a_Title_Co_ID[Title_Ins_Count]  = #read_List_of_Insurance_companies.Title_Co_ID#>
			<CFSET Title_Ins_Count                  = #Title_Ins_Count# + "1">
		</CFOUTPUT>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>Untitled</title>
</head>

<BODY BGCOLOR="elelel" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">
<CENTER>
<table width=500 border="0" cellpadding="0" cellspacing="0" background="">
	<tr><td width=500 align=left valign=top><IMG src="./images/logo_top_1.gif"></td></tr>
	<tr><td width=500 align=left valign=top><NOBR><A onclick="window.open('','New','width=550,height=550,status=0,resizable=0,scrollbars=1')" href="./zip_code_search.cfm" target=New><IMG src="./images/nav_zip_search.gif" border=0></A><A href="./site_page.cfm?page_id=1"><IMG src="./images/nav_serving.gif" border=0></A><A href="./site_page.cfm?page_id=2"><IMG src="./images/nav_closing.gif" border=0></A><A href="./client_login.cfm"><IMG src="./images/nav_cust_login.gif" border=0></A><A href="./site_page.cfm?page_id=3"><IMG src="./images/nav_contact.gif" border=0></A><A href="./email.cfm?pass=0"><IMG src="./images/nav_email.gif" border=0></A></NOBR></td></tr>
	<tr><td width=500 align=right valign=top><CFOUTPUT><font size=1 color=blue face=arial><NOBR>[ #DateFormat(Now(), "ddddd")# ]&nbsp;&nbsp;&nbsp; #DateFormat(Now(), "mmmmm dd, yyyy")# - #TimeFormat(Now(), "HH:mm:ss")# (Eastern Standard Time)&nbsp;&nbsp;&nbsp;&nbsp;</NOBR></CFOUTPUT><p><br><p></p></font></td></tr>
</table></CENTER>
<CENTER><br><br><br><br><br><br><br>
<CFFORM NAME="frm" ACTION="./endorse_modify.cfm?user_id_1=#USER_ID_1#&lo_id=#lo_id#&rec_id=#read_title.title_id#&a_trigger=1&company_id=#company_ID#" METHOD=POST>

<table border="0"  width=500 cellpadding="1" cellspacing="1" align = "center">

		<tr align="center" valign=top bgcolor=gray>
			<td width=500  align="center" valign=top bgcolor=green>
				<CENTER><font size=2 color=white face=arial align="center">
				             Choose the Title Insurance Company for Endorsement
			</td></CENTER><p><br>
</tr><tr>
			<td width=500  align=center valign=top bgcolor=d1d1d1>
				<SELECT NAME="Insurance_Company"
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
					>


			    <OPTION VALUE="American Pioneer Title Ins. Co." SELECTED>American Pioneer Title Ins. Co.</OPTION>
				<OPTION VALUE="Stewart Title">Stewart Title</OPTION>
				<OPTION VALUE="Chicago Title Insurance Company">Chicago Title Insurance Company</OPTION>



					</SELECT>
			</td>
		</tr>

		<tr>
			<td width=500 colspan=2  align=center valign=top bgcolor=d1d1d1>
				<INPUT TYPE=IMAGE SRC="./images/button_submit.gif" border=0>
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
