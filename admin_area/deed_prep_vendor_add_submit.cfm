
<CFQUERY datasource="#request.dsn#" NAME="check_payoff">
	SELECT *
	FROM Abstractors
	WHERE Company = '#form.company#' AND lname = '#form.lname#' AND fname = '#form.fname#' and type = 7
</CFQUERY>
<cfif check_payoff.recordcount gte 1>
<script language="javascript">
alert("It appears that this particular Deed Prep Vendor is already listed in the system");
history.go(-1);
</script>
<cfabort>
</cfif>		
<CFQUERY datasource="#request.dsn#" NAME="check_companies">
		SELECT *
		FROM Companies
		WHERE a_user = '#form.username#'
		and a_pass = '#form.password#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="check_users">
		SELECT *
		FROM Users
		WHERE a_user = '#form.username#'
		and a_pass = '#form.password#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="check_closer">
		SELECT *
		FROM Closer
		WHERE username = '#form.username#'
		and password = '#form.password#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="check_abstractors">
		SELECT *
		FROM Abstractors
		WHERE username = '#form.username#'
		and password = '#form.password#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="check_co_user">
		SELECT *
		FROM Companies_User
		WHERE username = '#form.username#'
		and password = '#form.password#'
</CFQUERY>

<cfif check_companies.recordcount or check_users.recordcount or check_closer.recordcount or check_abstractors.recordcount or check_co_user.recordcount>
<script language="javascript">
alert("That UserName/Password combination is already in use, please choose another");
history.go(-1);
</script>
<cfabort>
</cfif>		

<CFPARAM NAME="company" DEFAULT="">
<CFPARAM NAME="fname" DEFAULT="">
<CFPARAM NAME="lname" DEFAULT="">
<CFPARAM NAME="phone" DEFAULT="">
<CFPARAM NAME="cell" DEFAULT="">
<CFPARAM NAME="pager" DEFAULT="">
<CFPARAM NAME="fax" DEFAULT="">
<CFPARAM NAME="addr1" DEFAULT="">
<CFPARAM NAME="addr2" DEFAULT="">
<CFPARAM NAME="city" DEFAULT="">
<CFPARAM NAME="state" DEFAULT="">
<CFPARAM NAME="zip_code" DEFAULT="">
<CFPARAM NAME="a_cost" DEFAULT="">
<CFPARAM NAME="spref" DEFAULT="">
<CFPARAM NAME="username" DEFAULT="">
<CFPARAM NAME="password" DEFAULT="">
<CFPARAM NAME="tss_id" DEFAULT="">	
<CFPARAM NAME="a_note_1" DEFAULT="">
<CFPARAM NAME="a_comments" DEFAULT="">
<CFPARAM NAME="zip_id" DEFAULT="">
<CFPARAM NAME="oe" DEFAULT="">
<CFPARAM NAME="deedonly" DEFAULT="">
<CFPARAM NAME="oe1" DEFAULT="">
<CFPARAM NAME="oe2" DEFAULT="">
<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="EOInsurance" DEFAULT="">
<CFPARAM NAME="ViaEmail2" DEFAULT="">
<CFPARAM NAME="ViaEmail" DEFAULT="">
<CFPARAM NAME="zip_id" DEFAULT="">
<CFPARAM NAME="fname" DEFAULT="">
<CFPARAM NAME="lname" DEFAULT="">
<CFPARAM NAME="company" DEFAULT="">
<CFPARAM NAME="addr1" DEFAULT="">
<CFPARAM NAME="addr2" DEFAULT="">
<CFPARAM NAME="zip" DEFAULT="">
<CFPARAM NAME="state" DEFAULT="">
<CFPARAM NAME="zip2" DEFAULT="">
<CFPARAM NAME="oe1" DEFAULT="">
<CFPARAM NAME="a_cost" DEFAULT="">
<CFPARAM NAME="oe2" DEFAULT="">
<CFPARAM NAME="deedonly" DEFAULT="">

<CFPARAM NAME="mort" DEFAULT="">
<CFPARAM NAME="judg" DEFAULT="">
<CFPARAM NAME="rec" DEFAULT="">
<CFPARAM NAME="rec_update" DEFAULT="">
<CFPARAM NAME="zip2" DEFAULT="">
<CFPARAM NAME="state2" DEFAULT="">
<CFPARAM NAME="city" DEFAULT="">
<CFPARAM NAME="city2" DEFAULT="">
<CFPARAM NAME="email" DEFAULT="">
<CFPARAM NAME="phone" DEFAULT="">
<CFPARAM NAME="fax" DEFAULT="">
<CFPARAM NAME="spref" DEFAULT="">
<CFPARAM NAME="a_comments" DEFAULT="">
<CFPARAM NAME="a_cost" DEFAULT="">
<CFPARAM NAME="a_note_1" DEFAULT="">
<CFPARAM NAME="pricetime1" DEFAULT="">
<CFPARAM NAME="pricetime2" DEFAULT="">
<CFPARAM NAME="pricetime3" DEFAULT="">
<CFPARAM NAME="pricetime4" DEFAULT="">
<CFPARAM NAME="pricetime5" DEFAULT="">
<CFPARAM NAME="pricetime6" DEFAULT="">
<CFPARAM NAME="pricetime7" DEFAULT="">
<CFPARAM NAME="pricetime8" DEFAULT="">
<CFPARAM NAME="eocompany" DEFAULT="">
<CFPARAM NAME="eoexpiredate" DEFAULT="">
<CFPARAM NAME="eoamount" DEFAULT="">
<CFPARAM NAME="otherphone" DEFAULT="">
<CFPARAM NAME="homephone" DEFAULT="">
<CFPARAM NAME="zip_code" DEFAULT="">
<CFPARAM NAME="a_cost" DEFAULT="">
<CFPARAM NAME="spref" DEFAULT="">
<CFPARAM NAME="user_name" DEFAULT="">
<CFPARAM NAME="pref_for_send" DEFAULT="">
<CFPARAM NAME="pass" DEFAULT="">
<CFPARAM NAME="TAXid" DEFAULT="">
<CFPARAM NAME="ssn" DEFAULT="">
<CFPARAM NAME="tss_id" DEFAULT="">	
<CFPARAM NAME="a_note_1" DEFAULT="">
<CFPARAM NAME="a_comments" DEFAULT="">
<CFPARAM NAME="zip_id" DEFAULT="">
<CFPARAM NAME="refCO1" DEFAULT="">
<CFPARAM NAME="refCO2" DEFAULT="">
<CFPARAM NAME="refphone1" DEFAULT="">
<CFPARAM NAME="refphone2" DEFAULT="">
<CFPARAM NAME="zip_code2" DEFAULT="">

<CFSET c_time = #TimeFormat(Now(), "HH:mm:ss")#>
<CFSET c_date = #DateFormat(Now(), "mm/dd/yyyy")#>


<CFSET zip_id_2 = #ListToArray(zip_id, ",")#>
	<CFSET st_abbrv_1 = ArrayNew(1)>
	<CFSET cty_name_1 = ArrayNew(1)>
	
		<CFLOOP FROM="1" TO="#ArrayLen(zip_id_2)#" INDEX="MMM">
			<CFSET st_temp = #ListToArray(zip_id_2[MMM], "|")#>

				<CFSET st_abbrv_1[MMM] = #st_temp[1]#>
				<CFSET cty_name_1[MMM] = #st_temp[2]#>		
		
		
		</CFLOOP>
	



		<CFQUERY datasource="#request.dsn#" >
		
			INSERT INTO Abstractors (type, tss_id, company, username, password, fname, lname, phone, cell, pager, fax, addr1, addr2, city, state, zip_code, email, a_cost, pref_for_send, a_note_1, a_comments, insert_time, insert_date, oe, deedonly, oe1, oe2, mort, rec, judg, rec_update, refphone1, refphone2, refCo1, refCo2, city2, state2, zip_code2, ssn, taxid, homephone, otherphone, eocompany, eoamount, eoexpiredate)
			VALUES(7, '#tss_id#', '#company#', '#username#', '#password#', '#fname#',  '#lname#', '#phone#', '#cell#', '#pager#', '#fax#', '#addr1#', '#addr2#', '#city#', '#state#', '#zip_code#', '#email#', '#a_cost#',  '#pref_for_send#',  '#a_note_1#', '#a_comments#', '#c_time#', '#c_date#', '#oe#', '#deedonly#', '#oe1#', '#oe2#', '#mort#', '#rec#', '#judg#', '#rec_update#', '#refphone1#', '#refphone2#', '#refCo1#', '#refCo2#', '#city2#', '#state2#', '#zip_code2#', '#SSN#', '#TAXID#', '#homephone#', '#otherphone#', '#eocompany#', '#eoamount#', '#eoexpiredate#')
		
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="Read_ID">
		
			SELECT *
			FROM Abstractors
			WHERE insert_time = '#c_time#' AND insert_date = '#c_date#'
		
		</CFQUERY>
<CFLOOP FROM="1" TO="#ArrayLen(st_abbrv_1)#" INDEX="SSS">
<CFQUERY datasource="#request.dsn#">
				INSERT INTO Abstractors_county(Abstractor_ID, company, st_abbrev, ct_name)
				VALUES(#Read_ID.Abstractor_ID#, '#read_ID.company#', '#st_abbrv_1[SSS]#', '#cty_name_1[SSS]#')
			</CFQUERY>
</cfloop>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<TITLE>First Title Services Admin</TITLE>

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
		<td width=498 align=center valign=top bgcolor=white>
			<font size=2 color=green face=arial><B>The Deed Preparation Vendor was added</B>
		</td>
	</tr>
</CFOUTPUT>	

</table>

		</td>
	</tr>

	<tr>
		<td width=499 align=center valign=top bgcolor=white>
			

<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=white>
<CFOUTPUT>
	<tr>		
		
		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>	
			<img src="./images/clear.gif" height=10 width=85>
					
		
		</td>
	</tr>

	
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Company Name - 
		
		
		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#company#</b>
					
		
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<b><font size=2 color=black face=arial>
			User Name - 
		</b>
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=red face=arial>
			<b>#username#</b>
					
		
		</td>
	</tr>	
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<b><font size=2 color=black face=arial>
			Password - 
		</b>
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=red face=arial>
			<b>#password#</b>
					
		
		</td>
	</tr>	
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			First Name - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#fname#</b>
					
		
		</td>
	</tr>	

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Last Name - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#lname#</b>
					
		
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
			Cell - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#cell#</b>
					
		
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Pager - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#pager#</b>
					
		
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
			Notes - 
		
		
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
		<td width=468 colspan=2 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Comments :
	
		</td>
	</tr>

	<tr>
		
		<td width=468 colspan=2 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
		<b>#a_comments#</b>
		
		</td>
	</tr>
<tr>		
		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Counties this Abstractor will serve
	
		</td>
	</tr>

<tr>
		
		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
		<b>#zip_id#</b>

		
		</td>
	</tr>
	<tr>		
		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Preferences for recieving Abstractor Notice
	
		</td>
	</tr>
	
	<tr>
		
		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
		<b>#pref_for_send#</b>

		
		</td>
	</tr>

	
</table>
	
		</td>	

	</tr>
</table>

</table>	

	</td>
</tr>
</table>

</CFOUTPUT>

<CFMAIL
TO="tlittle@firsttitleservices.com"
FROM="webmaster@firsttitleservices.com" Subject="Deed Preparation Vendor added to First Title Database"
TIMEOUT="600"
type="HTML"
>

<table width=500 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=500 align=center valign=top>
		
<table width=499 cellpadding=1 cellspacing=1 border=0 bgcolor=white>


	<tr>
		<td width=499 align=center valign=top bgcolor=white>
			

<table width=498 cellpadding=0 cellspacing=0 border=0 bgcolor=white>

	<tr>		
		
		<td width=498 colspan=2 align=right valign=top bgcolor=e6e6e6>	
			Deed Preparation Vendor ADDED
					
		
		</td>
	</tr>

<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Company Name - 
		
		
		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#company#</b>
					
		
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<b><font size=2 color=black face=arial>
			User Name - 
		</b>
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=red face=arial>
			<b>#username#</b>
					
		
		</td>
	</tr>	
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<b><font size=2 color=black face=arial>
			Password - 
		</b>
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=red face=arial>
			<b>#password#</b>
					
		
		</td>
	</tr>	
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			First Name - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#fname#</b>
					
		
		</td>
	</tr>	

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Last Name - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#lname#</b>
					
		
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
			Cell - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#cell#</b>
					
		
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Pager - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#pager#</b>
					
		
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
			Notes - 
		
		
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
			<b>#zip_code#</b>
					
		
		</td>
	</tr>

	

	
	<tr>		
		<td width=468 colspan=2 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Comments :
	
		</td>
	</tr>

	<tr>
		
		<td width=468 colspan=2 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
		<b>#a_comments#</b>
		
		</td>
	</tr>
<tr>		
		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Counties this Tax Vendor will serve
	
		</td>
	</tr>

<tr>
		
		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
		<b>#zip_id#</b>

		
		</td>
	</tr>
	<tr>		
		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Preferences for recieving Deed Prep Vendor Notice
	
		</td>
	</tr>
	
	<tr>
		
		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
		<b>#pref_for_send#</b>

				</td>
	</tr>

	
</table>
	
		</td>	

	</tr>
</table>

</table>	

	</td>
</tr>
</table>
</CFMAIL>

</BODY>
</HTML>