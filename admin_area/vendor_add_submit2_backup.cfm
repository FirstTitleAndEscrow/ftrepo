<cfparam name="form.COMPANY" default="">
<cfparam name="form.USERNAME" default="">
<cfparam name="form.PASSWORD" default="">
<cfparam name="form.FNAME" default="">
<cfparam name="form.LNAME" default="">
<cfparam name="form.PHONE" default="">
<cfparam name="form.FAX" default="">
<cfparam name="form.CELL" default="">
<cfparam name="form.PAGER" default="">
<cfparam name="form.EMAIL" default="">
<cfparam name="form.ADDR1" default="">
<cfparam name="form.ADDR2" default="">
<cfparam name="form.A_NOTE_1" default="">
<cfparam name="form.CITY" default="">
<cfparam name="form.STATE" default="">
<cfparam name="form.ZIP_CODE" default="">
<cfparam name="form.SERVICE_TYPE" default="">
<cfparam name="form.A_COST" default="">
<cfparam name="form.DEEDONLY" default="">
<cfparam name="form.OE1" default="">
<cfparam name="form.OE2" default="">
<cfparam name="form.MORT" default="">
<cfparam name="form.JUDG" default="">
<cfparam name="form.REC" default="">
<cfparam name="form.REC_UPDATE" default="">
<cfparam name="form.SERVICE_TYPE" default="">
<cfparam name="form.APPRAISER_CHARGE" default="">
<cfparam name="form.SERVICE_TYPE" default="">
<cfparam name="form.CLOSER_CHARGE" default="">
<cfparam name="form.SERVICE_TYPE" default="">
<cfparam name="form.TAX_CHARGE" default="">
<cfparam name="form.SERVICE_TYPE" default="">
<cfparam name="form.ICL_CHARGE" default="">
<cfparam name="form.SERVICE_TYPE" default="">
<cfparam name="form.PAYOFF_CHARGE" default="">
<cfparam name="form.SERVICE_TYPE" default="">
<cfparam name="form.DEED_CHARGE" default="">
<cfparam name="form.A_COMMENTS" default="">
<cfparam name="form.ZIP_ID" default="">
<cfparam name="form.ZIP_ID" default="">
<cfparam name="form.ZIP_ID" default="">
<cfparam name="form.ZIP_ID" default="">
<cfparam name="form.PREF_FOR_SEND" default="">



<CFQUERY datasource="#request.dsn#" NAME="check_abs">
	SELECT *
	FROM Abstractors
	WHERE Company = '#form.company#' AND lname = '#form.lname#' AND fname = '#form.fname#'
</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="check_vendors">
	SELECT *
	FROM Vendors_Stacie
	WHERE Company = '#form.company#' AND lname = '#form.lname#' AND fname = '#form.fname#'
</CFQUERY>
<cfif check_abs.recordcount or check_vendors.recordcount>
<script language="javascript">
alert("It appears that this particular Abstractor is already listed in the system");
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

<CFQUERY datasource="#request.dsn#" NAME="check_new_vendors">
		SELECT *
		FROM Vendors_Stacie
		WHERE username = '#form.username#'
		and password = '#form.password#'
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="check_co_user">
		SELECT *
		FROM Companies_User
		WHERE username = '#form.username#'
		and password = '#form.password#'
</CFQUERY>

<cfif check_companies.recordcount or check_users.recordcount or check_closer.recordcount or check_abstractors.recordcount or check_co_user.recordcount or check_new)vendors.recordcount>
<script language="javascript">
alert("That UserName/Password combination is already in use, please choose another");
history.go(-1);
</script>
<cfabort>
</cfif>		
		
		
		
		
		
		
		



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
		
			INSERT INTO Vendors_STACIE (TSS_ID,COMPANY,USERNAME,PASSWORD,FNAME,LNAME,PHONE,FAX,CELL,PAGER,EMAIL,ADDR1,ADDR2,A_NOTE_1,CITY,STATE,ZIP_CODE,SERVICE_TYPE,A_COST,DEEDONLY,OE1,OE2,MORT,JUDG,REC,REC_UPDATE,APPRAISER_CHARGE,CLOSER_CHARGE,TAX_CHARGE,ICL_CHARGE,PAYOFF_CHARGE,DEED_CHARGE,A_COMMENTS,PREF_FOR_SEND,INSERT_TIME)
			VALUES('#form.TSS_ID#', '#form.COMPANY#', '#form.USERNAME#', '#form.PASSWORD#', '#form.FNAME#', '#form.LNAME#', '#form.PHONE#', '#form.FAX#', '#form.CELL#', '#form.PAGER#', '#form.EMAIL#', '#form.ADDR1#', '#form.ADDR2#', '#form.A_NOTE_1#', '#form.CITY#', '#form.STATE#', '#form.ZIP_CODE#', '#form.SERVICE_TYPE#', '#form.A_COST#', '#form.DEEDONLY#', '#form.OE1#', '#form.OE2#', '#form.MORT#', '#form.JUDG#', '#form.REC#', '#form.REC_UPDATE#', '#form.APPRAISER_CHARGE#', '#form.CLOSER_CHARGE#', '#form.TAX_CHARGE#', '#form.ICL_CHARGE#', '#form.PAYOFF_CHARGE#', '#form.DEED_CHARGE#', '#form.A_COMMENTS#', '#form.PREF_FOR_SEND#', '#form.INSERT_TIME#')
		
		</CFQUERY>
<CFQUERY datasource="#request.dsn#" NAME="Read_ID">
		
			SELECT *
			FROM Vendors_STACIE
			WHERE insert_time = '#c_time#' AND insert_date = '#c_date#'
		
		</CFQUERY>
<CFLOOP FROM="1" TO="#ArrayLen(st_abbrv_1)#" INDEX="SSS">
<CFQUERY datasource="#request.dsn#">
				INSERT INTO Abstractors_county_STACIE(Abstractor_ID, company, st_abbrev, ct_name)
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
			<font size=2 color=green face=arial><B>The Vendor was added</B>
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
			<b>#form.company#</b>
					
		
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
			<b>#form.username#</b>
					
		
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
			<b>#form.password#</b>
					
		
		</td>
	</tr>	
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			First Name - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#form.fname#</b>
					
		
		</td>
	</tr>	

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Last Name - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#form.lname#</b>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Phone - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#form.phone#</b>
					
		
		</td>
	</tr>
<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Cell - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#form.cell#</b>
					
		
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Pager - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#form.pager#</b>
					
		
		</td>
	</tr>
	
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Fax - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#form.fax#</b>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Email - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#form.email#</b>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Address - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#form.addr1#</b>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Address - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#form.addr2#</b>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Notes - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#form.a_note_1#</b>
					
		
		</td>
	</tr>
	
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			City - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#form.city#</b>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			State - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
		<font size=2 color=blue face=arial>
			<b>#form.state#</b>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Zip Code - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
		<font size=2 color=blue face=arial>
			<b>#form.zip_code#</b>
					
		
		</td>
	</tr>

<tr><td colspan=2>Vendor Services</td></tr>
<cfif ListContainsNoCase(form.service_type, "1", ",")>
<tr><td colspan=2>Abstracting</td></tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			O&E(1) + Update - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#a_cost#</B>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Deed only
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#deedonly#</B>
					
		
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			O&E 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#oe1#</B>
					
		
		</td>
	</tr>
		<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			O&E(2) 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#oe2#</B>
					
		
		</td>
	</tr>
	
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			MTG search - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#mort#</B>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Judgment - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#judg#</B>
					
		
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Recording
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#rec#</B>
					
		
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Record w/update
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#rec_update#</B>
					
		
		</td>
	</tr>
</cfif>
	
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
TO="rjermain@firsttitleservices.com"
FROM="webmaster@firsttitleservices.com" Subject="Abstractor added to First Title Database"
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
			ABSTRACTOR ADDED
					
		
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
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			O&E(1) + Update - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#a_cost#</B>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Deed only
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#deedonly#</B>
					
		
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			O&E 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#oe1#</B>
					
		
		</td>
	</tr>
		<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			O&E(2) 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#oe2#</B>
					
		
		</td>
	</tr>
	
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			MTG search - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#mort#</B>
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Judgment - 
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#judg#</B>
					
		
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Recording
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#rec#</B>
					
		
		</td>
	</tr>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=gray face=arial>
			Record w/update
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>
			<font size=2 color=blue face=arial>
			<B>#rec_update#</B>
					
		
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
</CFMAIL>

</BODY>
</HTML>




