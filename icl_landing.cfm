<CFQUERY datasource="#request.dsn#" NAME="read_abstractor">
		
	SELECT *
	FROM abstractors 
	WHERE username = '#URLDecode(url.username)#' and password = '#URLDecode(url.password)#' 

</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_icl">

	select title_id 
	from doc_abstract_title
	where abstractor_icl_id = #read_abstractor.abstractor_id#
	AND abstractor_icl_upload IS NULL OR abstractor_icl_upload = ''
	order by title_id
</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>

<script type="text/javascript">
function put() {
var frm;
frm = document.frm;

if (frm.Prop_id.value != 'NONE') {
if (frm.Title_id.value != 'NONE') {
frm.Title_id.selectedIndex = frm.Title_id.options[1];
}
}
}

function puta() {
var frm;
frm = document.frm;

if (frm.Title_id.value != 'NONE') {
if (frm.Prop_id.value != 'NONE') {
frm.Prop_id.selectedIndex = frm.Prop_id.options[1];
}
}
}



</script>

</head>


<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>



<CENTER>
<CENTER>
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=780 align=center valign=top>

<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=780 align=center valign=top bgcolor=e1e1e1>


<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 colspan=2 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>ICL Order Search</B></CENTER>
			</TD>
		</TR>

<CFFORM name="frm" METHOD=POST ACTION="icl_detail.cfm?username=#username#&password=#password#">
<INPUT type="hidden" name="uid" value="URL.uid">
<cfoutput><input type="hidden" name="username" value="#username#">
<input type="hidden" name="password" value="#password#"></cfoutput>
							<tr>


					<td bgcolor=d3d3d3 width=300 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">Title ID<br>
<br>

						</td>

						<td bgcolor=d3d3d3 width=300 align=left valign=top><SELECT NAME="rec_id"			onchange="puta()"
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
								<OPTION VALUE="NONE">N/A</OPTION>
								<cfif read_icl.recordcount neq 0>
								<CFOUTPUT QUERY="read_icl"><OPTION VALUE="#Title_ID#">#Title_ID#</OPTION>
								</CFOUTPUT>
								</cfif>
							</SELECT>
						</td>
					</tr>



					<tr>
						<td bgcolor=d3d3d3 colspan=2  align=center valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0>
						</td>

					</tr>
</CFFORM>



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







<cfabort>
<!--- old code --->
<CFQUERY datasource="#request.dsn#" NAME="read_abstractor">
		
	SELECT *
	FROM abstractors 
	WHERE username = '#URLDecode(url.username)#' and password = '#URLDecode(url.password)#' 

</CFQUERY>


<CFQUERY datasource="#request.dsn#" NAME="read_icl">

	select title_id 
	from doc_abstract_title
	where abstractor_icl_id = #read_abstractor.abstractor_id#
	AND abstractor_icl_upload IS NULL OR abstractor_icl_upload = ''
</CFQUERY>

<cfif read_icl.recordcount>
	<table>
	<cfoutput query="read_icl">
		<CFQUERY datasource="#request.dsn#" NAME="read_title">

			select *
			from title where title_id = #read_icl.title_id#
		</CFQUERY>
	<tr><td><a href="icl_detail.cfm?rec_id=#title_id#&username=#username#&password=#password#&company_id=#read_title.comp_id#">T-#title_id#</a></td></tr>
	</cfoutput>
	</table>

<cfelse>

	<p>You are not assigned any icl files.</p>
</cfif>
