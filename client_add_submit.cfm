
<CFPARAM NAME="phone" DEFAULT="">
<CFPARAM NAME="fax" DEFAULT="">
<CFPARAM NAME="addr1" DEFAULT="">
<CFPARAM NAME="addr2" DEFAULT="">
<CFPARAM NAME="city" DEFAULT="">
<CFPARAM NAME="state" DEFAULT="">
<CFPARAM NAME="zip_code" DEFAULT="">
<CFPARAM NAME="email" DEFAULT="">
<CFPARAM NAME="a_cost" DEFAULT="">
<CFPARAM NAME="st_abbrev" DEFAULT="">
<CFPARAM NAME="ft_agencies" DEFAULT="">
<CFPARAM NAME="a_comment" DEFAULT="">
<CFPARAM NAME="a_note_1" DEFAULT="">



<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>
<CFSET b_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET b_date = #DateFormat(Now(), "mm/dd/yyyy")#>



	<CFQUERY datasource="#request.dsn#">

			INSERT INTO companies(company, phone, fax, addr1, addr2, city, state, zip_code, email, a_time, a_date, a_note_1, a_comment, a_uid, a_status)
			VALUES('#URL.company#', '#phone#', '#fax#', '#addr1#', '#addr2#', '#city#', '#state#', '#zip_code#', '#email#', '#c_time#', '#c_date#', '#a_note_1#', '#a_comment#', '#UID#', 1)

		</CFQUERY>


	<CFQUERY datasource="#request.dsn#" NAME="Read_ID">

			SELECT *
			FROM companies
			WHERE a_time = '#c_time#' AND a_date = '#c_date#'

		</CFQUERY>




<CFQUERY datasource="#request.dsn#" >

			INSERT INTO Company_Billing_Values(company_id,  a_1101, a_1102, a_1103, a_1104, a_1105, a_1106, a_1107, a_1111, a_1111_text, a_1112, a_1112_text, a_1113, a_1113_text, a_1205, a_1205_text, a_1303, a_1303_text, a_1304, a_1304_text, a_1305, a_1305_text, b_time, b_date)
			VALUES(#read_id.id#,  '#a_1101#', '#a_1102#', '#a_1103#', '#a_1104#', '#a_1105#', '#a_1106#', '#a_1107#', '#a_1111#', '#a_1111_text#', '#a_1112#', '#a_1112_text#', '#a_1113#', '#a_1113_text#', '#a_1205#', '#a_1205_text#', '#a_1303#', '#a_1205_text#', '#a_1304#', '#a_1304_text#', '#a_1305#', '#a_1305_text#', '#b_time#', '#b_date#')

		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="Read_billing_ID">

			SELECT *
			FROM Company_Billing_Values
			WHERE b_time = '#b_time#' AND b_date = '#b_date#'

		</CFQUERY>

		<CFSET a_state_list = #ListToArray(FORM.st_abbrev, ",")#>

	<CFLOOP FROM="1" TO="#ArrayLen(a_state_list)#" INDEX="DDD">

		<CFQUERY datasource="#request.dsn#" >
			INSERT INTO company_billing_states(billing_id, company_ID, a_states)
			VALUES(#Read_billing_ID.billing_id#, #Read_billing_ID.company_id#, '#a_state_list[DDD]#')
		</CFQUERY>


	</CFLOOP>




		<CFSET a_agency_list = #ListToArray(FORM.ft_agencies, ",")#>

	<CFLOOP FROM="1" TO="#ArrayLen(a_agency_list)#" INDEX="DDD">

		<CFQUERY datasource="#request.dsn#" NAME="read_agency_1">
			SELECT *
			FROM title_FT_Agencies
			WHERE Title_FT_Agency_id = #a_agency_list[DDD]#
		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" >
			INSERT INTO company_agency_assoc(billing_id, title_FT_Agency_ID, title_FT_Agency_Name, title_FT_Agency_State, Company_ID)
			VALUES(#Read_billing_ID.billing_id#, #read_agency_1.title_FT_Agency_ID#, '#read_agency_1.company#',  '#read_agency_1.state#', #read_id.id#)
		</CFQUERY>

	</CFLOOP>









<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE><cfoutput>#session.site.short_name#</cfoutput> Services Admin</TITLE>

</HEAD>

<BODY BGCOLOR=e1e1e1 TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="./" topmargin=0 leftmargin=0 marginheight=0 marginwidth=0>



<CENTER>

<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=500 align=center valign=top>

<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

	<tr>
		<td width=499 align=center valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>

<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=e3e3e3>

<CFOUTPUT>
	<tr>
		<td width=498 align=left valign=top bgcolor=white>
			<font size=2 color=black face=arial>Add Mortgage Client/Customer
		</td>
	</tr>
</CFOUTPUT>

</table>

		</td>
	</tr>

	<tr>
		<td width=499 align=center valign=top bgcolor=white>


<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=white>

	<tr>
			<td width=130 align=left valign=top bgcolor=green>
				<FONT SIZE=2 color=white face=arial>
				The Client has been sucessfully added to the database.

		</td>

		<td width=368 align=left valign=top bgcolor=e1e1e1>


<table width=367 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
<CFOUTPUT>
	<tr>

		<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>
			<img src="./images/clear.gif" height=10 width=85>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			Company Name


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=verdana>
			<B>#URL.company#</B>

	     </td>
	</tr>
</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Address -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#addr1#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Address -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#addr2#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Note -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#a_note_1#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			City -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#city#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			State -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#state#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Zip Code -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#zip_CODE#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Phone -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#phone#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Fax -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#fax#</b>


		</td>
	</tr>

	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Email -


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#email#</b>


		</td>
	</tr>

	<tr>
		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=verdana>
				Comments :

		</td>
	</tr>

	<tr>
		<td width=498 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=verdana>
			<B>#a_comment#</B>

		</td>
	</tr>

	</tr>

		<td width=367 colspan=2 align=left valign=top bgcolor=e6e6e6>
			<p>

			<p>

		</td>
	</tr>
		<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			Ft Agency Selected


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#read_agency_1.company#</b>


		</td>






</tr>
	<tr>
		<td width=130 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=gray face=arial>
			States Served


		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#st_abbrev#</b>


		</td>






</tr>
	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1101. <img src="./images/info-01.gif" ALT="Settlement or Closing Fee">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1101#</b></nobr>
		</td>


		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1111. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1111#</b></nobr>
		</td>
	<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1111_text#</b></nobr>
		</td>

	</tr>

	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1102. <img src="./images/info-01.gif" ALT="Abstract or Title Search">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1102#</b></nobr>
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1112. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1112#</b></nobr>
		</td>
	<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1112_text#</b></nobr>
		</td>

	</tr>

	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1103. <img src="./images/info-01.gif" ALT="Title Examination">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1103#</b></nobr>
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1113. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1113#</b></nobr>
		</td>
	<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1113_text#</b></nobr>
		</td>

	</tr>

	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1104. <img src="./images/info-01.gif" ALT="Title Insurance Binder">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1104#</b></nobr>
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1205. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1205#</b></nobr>
		</td>
	<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1205_text#</b></nobr>
		</td>

	</tr>

	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1105. <img src="./images/info-01.gif" ALT="Document Preparation">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1105#</b></nobr>
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1303. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1303#</b></nobr>
		</td>
	<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1303_text#</b></nobr>
		</td>

	</tr>

	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1106. <img src="./images/info-01.gif" ALT="Notary Fees">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1106#</b></nobr>
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1304. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1304#</b></nobr>
		</td>

	<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1304_text#</b></nobr>
		</td>
	</tr>

	<tr>
		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1107. <img src="./images/info-01.gif" ALT="Attorney's Fees">
		</td>

		<td width=147 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1107#</b></nobr>
		</td>

		<td width=100 align=right valign=top bgcolor=e6e6e6>
			<font size=2 color=black face=arial>
			1305. <img src="./images/info-01.gif" ALT="Data on this line is variable">
		</td>

		<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1305#</b></nobr>
		</td>
	<td width=150 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<nobr>&nbsp;&nbsp;&nbsp;<b>#a_1305_text#</b></nobr>
		</td>

	</tr>

</table>

</CFOUTPUT>


</table>

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


