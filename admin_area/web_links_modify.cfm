<CFPARAM NAME="linktype" DEFAULT="">
<CFPARAM NAME="linktype_other" DEFAULT="">
<CFPARAM NAME="notes" DEFAULT="">
<CFPARAM NAME="images_date" DEFAULT="">
<CFPARAM NAME="weblinks" DEFAULT="">
<CFPARAM NAME="pass" DEFAULT="">
<CFPARAM NAME="username" DEFAULT="">
<CFPARAM NAME="a_trigger" DEFAULT="">
<CFPARAM NAME="a_state" DEFAULT="">
<CFPARAM NAME="a_county" DEFAULT="">
<cfif isDefined("session.ft_user_id") and (session.ft_user_id eq 64 or session.ft_user_id eq 297)>
<cfset url.al = 1>
</cfif>






	<CFQUERY datasource="#request.dsn#" NAME="read_records">
		SELECT *
		FROM abstractors_web
		where web_id = #web_id#

	</CFQUERY>

<script language="javascript">
function quick_check() {

document.getElementById('images_date_row').style.display = 'none';
document.frm.images_date.value = '<cfoutput>#read_records.images_date#</cfoutput>';
document.getElementById('linktype_other_row').style.display = 'none';
document.frm.linktype_other.value = '';

if (document.frm.linktype.value == "Title Searches with Images") {
document.getElementById('images_date_row').style.display = 'block';
document.frm.images_date.value = '<cfoutput>#read_records.images_date#</cfoutput>';
document.getElementById('linktype_other_row').style.display = 'none';
document.frm.linktype_other.value = '';
} else {
document.getElementById('images_date_row').style.display = 'none';
document.frm.images_date.value = '';
}
if (document.frm.linktype.value == "Other") {
document.getElementById('linktype_other_row').style.display = 'block';
document.frm.linktype_other.value = 'Enter Info Here';
document.getElementById('images_date_row').style.display = 'none';
document.frm.images_date.value = '';
} else {
document.getElementById('linktype_other_row').style.display = 'none';
}
}


</script>

<cfif #a_trigger# eq "1">
<cfif #url.al# eq 1>
<cfif linktype eq 'Other'>
<cfset linktype = #linktype_other#>
</cfif>
	<CFQUERY datasource="#request.dsn#">
		UPDATE abstractors_web
		SET linktype = '#linktype#',
		weblinks  = '#weblinks#',
		 pass = '#pass#',
		 username  = '#username#',
		 notes = '#notes#',
		 images_date = '#images_date#'
		where web_id = #web_id#

	</CFQUERY>

	<CFQUERY datasource="#request.dsn#" NAME="read_records">
		SELECT *
		FROM abstractors_web
		where web_id = #web_id#

	</CFQUERY>
<cfelse>


		<CFQUERY datasource="#request.dsn#" NAME="read_records">
		SELECT *
		FROM abstractors_web
		where web_id = #web_id#

	</CFQUERY>

</cfif>
</cfif>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>

</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>
<CENTER>
<table width=552 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=500 align=center valign=top>
<table width=551 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=551 align=center valign=top bgcolor=e2e2e2>
<table width=550 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

	<tr>
		<td width=550 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Manage First Title -- Web Links</B>
		</td>
	</tr>
</table>
		</td>
	</tr>
	<tr>
		<td width=551 align=center valign=top bgcolor=white>


<table width=550 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=550 align=left valign=top bgcolor=f1f1f1>
		<font size=2 color=black face=arial>
		<cfif #a_trigger# NEQ 1>		You can modify any of the items shown below. <cfelse>The weblink has been modified</cfif>
		<br><font size=1 color=blue face=verdana>
		</td>
	</tr>

</table>

		</td>
	</tr>
<cfif #a_trigger# NEQ 1>

<CFOUTPUT>
<FORM METHOD=POST name="frm" ACTION="./web_links_modify.cfm?uid=#URL.uid#&al=#URL.al#&web_id=#web_id#&a_trigger=1&a_state=#a_state#&a_county=#a_county#">

</CFOUTPUT>




<CFOUTPUT QUERY="read_records">
	<tr>
		<td width=551 align=center valign=top bgcolor=white>


<table width=550 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Link Type
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
		<Select NAME="linktype"  id="linktype"
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
				clear: none;"
									onchange="quick_check();">
<OPTION VALUE="#linktype#" selected>#linktype#</OPTION>
<OPTION VALUE="Title Searches with Images" <cfif linktype eq ''>selected</cfif>>Title Searches with Images </OPTION>
<OPTION VALUE="Title Searches - Index Only" <cfif linktype eq ''>selected</cfif>>Title Searches - Index Only </OPTION>
<OPTION VALUE="Plats" <cfif linktype eq ''>selected</cfif>>Plats</OPTION>
<OPTION VALUE="Taxes" <cfif linktype eq ''>selected</cfif>>Taxes</OPTION>
<OPTION VALUE="Civil Court" <cfif linktype eq ''>selected</cfif>>Civil Court</OPTION>
<OPTION VALUE="District Court" <cfif linktype eq ''>selected</cfif>>District Court</OPTION>
<OPTION VALUE="Superior Court" <cfif linktype eq ''>selected</cfif>>Superior Court</OPTION>
<OPTION VALUE="Other">Other</OPTION>

								</select>

			</td>
	</tr>

	<tr id="images_date_row">
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Images Date	</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="images_date" id="images_date" VALUE="#images_date#" size=70 maxlength=200
				size="1"
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
				clear: none;">
</tr>

	<tr id="linktype_other_row" style="display: none;">
			<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Other	</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
		<input type=text name="linktype_other" id="linktype_other" VALUE="" size=70 maxlength=200
				size="1"
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
				clear: none;">
			</td>
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Web Link
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="weblinks" VALUE="#weblinks#" size=70 maxlength=200
				size="1"
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
				clear: none; ">
			</td>
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			User Name
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="username" VALUE="#username#" size=20 maxlength=20
				size="1"
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
				clear: none; ">
			</td>
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
		Password
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<input type=text name="pass" VALUE="#pass#" size=20 maxlength=20
				size="1"
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
				clear: none; ">
			</td>
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
		Notes
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
		<textarea cols="20" rows="5" name="notes" style="font-size: 9;
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
				clear: none; ">#notes#</textarea>

			</td>
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
		Originally added by:
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
<cfif read_records.user_id gt 0>
<CFQUERY datasource="#request.dsn#" NAME="get_user">
select * from first_admin where ID = #read_records.user_id#
</CFQUERY>
<font size=1 color=blue face=verdana>#get_user.fname# #get_user.lname#
</cfif>

			</td>
	</tr>




</CFOUTPUT>

	<tr>
		<td width=550 colspan=2 align=right valign=top bgcolor=f1f1f1>
			<input type=submit value="modify">
			</td>
	</tr>




</table>

		</td>
	</tr>



</FORM>
</cfif>
<cfif #a_trigger# eq "1">
<cfif #url.al# eq 1>
<CFOUTPUT QUERY="read_records">

<table width=550 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=550 align=center valign=top bgcolor=f1f1f1>
			<b><font size=2 color=red face=verdana>
			Record Modified	<b>
		</td>
</tr>
<tr>
		<td width=551 align=center valign=top bgcolor=white>


<table width=550 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Link Type
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
	<font size=1 color=red face=verdana>		#linktype#
			</td>
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Web Link
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
		<font size=1 color=red face=verdana>	#weblinks#
			</td>
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			User Name
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
	<font size=1 color=red face=verdana>	#username#
			</td>
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
		Password
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
		<font size=1 color=red face=verdana>	#pass#

			</td>
	</tr>
</CFOUTPUT>

<cfelse>

<CFOUTPUT>

<table width=550 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=550 align=center valign=top bgcolor=f1f1f1>
			<b><font size=2 color=red face=verdana>
			Email sent to administrator to process request <b>
		</td>
</tr>
<tr>
		<td width=551 align=center valign=top bgcolor=white>


<table width=550 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Link Type
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
		<font size=1 color=red face=verdana>	#linktype#
			</td>
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Web Link
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=red face=verdana>#weblinks#
			</td>
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			User Name
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
	<font size=1 color=red face=verdana>	#username#
			</td>
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
		Password
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
		<font size=1 color=red face=verdana>	#pass#

			</td>
	</tr>
</CFOUTPUT>
		<CFQUERY datasource="#request.dsn#" NAME="user">

			select * from first_admin

			WHERE ID = #session.ft_user_id#


		</CFQUERY>
<CFMAIL
TO="spape@firsttitleservices.com"
FROM="#user.email#" Subject="Weblink info change request"
TIMEOUT="600"
type="HTML"
>

	<tr>
		<td width=550 clospan = 2 align=left valign=top bgcolor=f1f1f1>
			<b><font size=2 color=GREEN face=verdana>
			BEFORE	MODIFICATION<b>
		</td>
</tr>


<table width=550 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=550 align=center valign=top bgcolor=f1f1f1>
			<b><font size=2 color=red face=verdana>
			Record Modified	<b>
		</td>
</tr>
<tr>
		<td width=551 align=center valign=top bgcolor=white>


<table width=550 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Link Type
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
	<font size=1 color=red face=verdana>		#read_records.linktype#
			</td>
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Web Link
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
		<font size=1 color=red face=verdana>	#read_records.weblinks#
			</td>
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			User Name
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
	<font size=1 color=red face=verdana>	#read_records.username#
			</td>
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
		Password
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
		<font size=1 color=red face=verdana>	#read_records.pass#

			</td>
	</tr>



	<tr>
		<td width=550 colspan = 2 align=left valign=top bgcolor=f1f1f1>
			<b><font size=2 color=GREEN face=verdana>
			AFTER MODIFICATION	<b>
		</td>
</tr>


<table width=550 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=550 align=center valign=top bgcolor=f1f1f1>
			<b><font size=2 color=red face=verdana>
			The following weblink has been requested to be changed <b>
		</td>
</tr>
<tr>
		<td width=551 align=center valign=top bgcolor=white>


<table width=550 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Link Type
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
		<font size=1 color=red face=verdana>	#linktype#
			</td>
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			Web Link
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=red face=verdana>#weblinks#
			</td>
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
			User Name
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
		<font size=1 color=red face=verdana>#username#
			</td>
	</tr>

	<tr>
		<td width=200 align=right valign=top bgcolor=f1f1f1>
			<font size=1 color=black face=verdana>
		Password
		</td>
		<td width=350 align=left valign=top bgcolor=f1f1f1>
			<font size=1 color=red face=verdana>#pass#

			</td>
	</tr>

<table width=498>
<tr>
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>Click <NOBR><a href="https://#CGI.SERVER_NAME#/admin_area/web_links_modify.cfm?uid=59&al=1&web_ID=#web_ID#&linktype=#linktype#&weblinks=#weblinks#&username=#username#&pass=#pass#&a_trigger=1">HERE</a></NOBR>
to allow the modification</B>
		</td>
	</tr>
</table>
</cfmail>


</cfif>






</table>

		</td>
	</tr>




<CFOUTPUT>
				<tr>
					<td width=550 align=left valign=top bgcolor=f1f1f1>
						<A href="./weblinks_search.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=2&a_state=#a_state#&a_county=#a_county#"><img src="./images/button_return.gif" border=0></A>
					</td>
				</tr>
</CFOUTPUT>
</table>


</cfif>
</table>



	</td>
</tr>
</table>
<script language="javascript">
quick_check();
</script>
</BODY>
</HTML>

