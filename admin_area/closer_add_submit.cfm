<CFQUERY datasource="#request.dsn#" NAME="check_closer">
	SELECT *
	FROM Closer
	WHERE Company = '#form.company#' AND lname = '#form.lname#' AND fname = '#form.fname#'
</CFQUERY>
<cfif check_closer.recordcount>
<script language="javascript">
alert("It appears that this particular Closer is already listed in the system");
history.go(-1);
</script>
<cfabort>
</cfif>		
<CFQUERY datasource="#request.dsn#" NAME="check_companies">
		SELECT *
		FROM Companies
		WHERE a_user = '#form.user_name#'
		and a_pass = '#form.pass#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="check_users">
		SELECT *
		FROM Users
		WHERE a_user = '#form.user_name#'
		and a_pass = '#form.pass#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="check_closer">
		SELECT *
		FROM Closer
		WHERE username = '#form.user_name#'
		and password = '#form.pass#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="check_abstractors">
		SELECT *
		FROM Abstractors
		WHERE username = '#form.user_name#'
		and password = '#form.pass#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="check_co_user">
		SELECT *
		FROM Companies_User
		WHERE username = '#form.user_name#'
		and password = '#form.pass#'
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
<CFPARAM NAME="internetaccess" DEFAULT="">
<CFPARAM NAME="eocompany" DEFAULT="">
<CFPARAM NAME="eoexpiredate" DEFAULT="">
<CFPARAM NAME="eoamount" DEFAULT="">
<CFPARAM NAME="otherphone" DEFAULT="">
<CFPARAM NAME="homephone" DEFAULT="">
<CFPARAM NAME="zip" DEFAULT="">
<CFPARAM NAME="a_cost" DEFAULT="">
<CFPARAM NAME="spref" DEFAULT="">
<CFPARAM NAME="user_name" DEFAULT="">
<CFPARAM NAME="pass" DEFAULT="">
<CFPARAM NAME="TAXid" DEFAULT="">
<CFPARAM NAME="ssn" DEFAULT="">
<CFPARAM NAME="tss_id" DEFAULT="">	
<CFPARAM NAME="a_note_1" DEFAULT="">
<CFPARAM NAME="a_comments" DEFAULT="">
<CFPARAM NAME="zip_id" DEFAULT="">

<!---CFIF #Len(PhonePrimary1)# gte 1>
    <CFSET Phone = #PhonePrimary1#>
<CFELSE>
    <CFSET Phone = #PhoneHome1#>
</CFIF>
<CFSET Cell = #PhoneCell1#>
<CFSET Pager = #PhonePager1#>
<CFSET Fax = #PhoneFax1#>
<CFSET a_cost = #a_cost#>   
--->
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
		
			INSERT INTO Closer (tss_id, company, username, password, fname, lname, phone, cell, pager, fax, addr1, addr2, city, state, zip_code, email, a_cost, pref_for_send, a_note_1, a_comments, insert_time, insert_date, ssn, taxid, homephone, otherphone, internetAccess, eocompany, eoamount, eoexpiredate)
			VALUES('#tss_id#', '#company#', '#user_name#', '#pass#', '#fname#',  '#lname#', '#phone#', '#cell#', '#pager#', '#fax#', '#addr1#', '#addr2#', '#city#', '#state#', '#zip#', '#email#', '#a_cost#',  '#spref#',  '#a_note_1#',  '#a_comments#', '#c_time#', '#c_date#', '#SSN#', '#TAXID#', '#homephone#', '#otherphone#', '#internetaccess#', '#eocompany#', '#eoamount#', '#eoexpiredate#')
		
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="Read_ID">
		
			SELECT *
			FROM Closer
			WHERE insert_time = '#c_time#' AND insert_date = '#c_date#'
		
		</CFQUERY>

<CFLOOP FROM="1" TO="#ArrayLen(st_abbrv_1)#" INDEX="SSS">
			<CFQUERY datasource="#request.dsn#">
				INSERT INTO Closer_county(Closer_ID, company, st_abbrev, ct_name)
				VALUES(#Read_ID.Closer_ID#, '#read_ID.company#', '#st_abbrv_1[SSS]#', '#cty_name_1[SSS]#')
			</CFQUERY>
		</CFLOOP>



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
			<font size=2 color=green face=arial><B>The Closer was added</B>
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

	<!--- <tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			TSS Code -  
		
		
		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#tss_id#</B>
		</td>
	</tr> --->
	
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
			<b>#user_name#</b>
					
		
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
			<b>#pass#</b>
					
		
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
			<b>#zip#</b>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Charge for Svc - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#a_cost#</B>
					
		
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
			Counties this closer will serve
	
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
			Preferences for recieving Closer Notice
	
		</td>
	</tr>
	
	<tr>
		
		<td width=468 colspan=2 align=center valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
		<b>#spref#</b>

		
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
</BODY>
</HTML>




