<cfquery name="get_order" datasource="#request.dsn#">
	select * from Title
	where title_id = #URL.rec_id#
</cfquery>

<CFSET datnow = "#DateFormat(Now())#">
<CFSET timnow = "#TimeFormat(Now())#">
<html>
<head>
	<title>1st Title & Escrow, Inc. - Processing</title>
</head>

<body leftmargin="0" bgcolor="d3d3d3"topmargin="0" marginheight="0" marginwidth="0">
<table width=620 border="0" cellpadding="0" cellspacing="0">
	<tr><nobr>
		<td colspan="2" valign=bottom>
			<img src="./images/clear.gif" width="10" height="1"><b><font size=2 color=red face=arial><img src="./images/clear.gif" width="30" height="1"><cfoutput>#datnow# - #timnow#</cfoutput> (EST)</b>
		</td>
	</tr>
<br>
<center>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="elelel">
<tr>
	<td width="99%" align=center valign=top>
		<FONT FACE=ARIAL SIZE=2 color="red">
		<br><br>			
		<center><B>ARE YOU SURE YOU FINISHED WITH THIS ORDER?
		</B><br><br><FONT FACE=ARIAL SIZE=2 color="blue">If you choose so and would like to proceed click on the "Proceed" button, otherwise click the "Return" button to be redirected to the calendar search menu. </center> 
	</td>
</tr>

<CFFORM NAME="frm" ACTION="./menu_processing_all.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#get_order.title_id#&a_trigger=2" METHOD=POST> 
<tr>
	<td width="50%" align=left valign=bottom>
		<br><br><br><br><br><br>	
<cfoutput>
	<NOBR><a href="./menu_processing.cfm?&company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#get_order.title_id#&a_trigger=1"><img src="./images/button_return.gif" border=0 ALT="Return to main menu"></a> 
	  
	</NOBR>
</cfoutput>
	</td>
	<td width="50%" align=center valign=bottom>
		<NOBR><input type=image border=0 src="./images/button_proceed.gif"> &nbsp;&nbsp;&nbsp;&nbsp;</NOBR>
	</td>
</tr>

	
<CFQUERY datasource="#request.dsn#">
	Update tblUser_Roles
	set processor_end_datetime = #Now()# 
	where Title_ID = #rec_id#
</CFQUERY>
<CFQUERY datasource="#request.dsn#" name="read_user_name"> 
    SELECT     First_Admin.fname + ' ' + First_Admin.lname AS username
    FROM         tblUser_Roles LEFT OUTER JOIN
                      First_Admin ON tblUser_Roles.Processor_ID = First_Admin.ID
    WHERE     (tblUser_Roles.Title_ID = #rec_id#)
</CFQUERY>	
<cfquery  datasource="#request.dsn#">
	INSERT INTO 
				TITLE_NOTES (fname,lname,n_date,n_time,order_id,n_note,note_type,status)
				Values ('System','Web','#DateFormat(Now(), "m/d/yyyy")#','#TimeFormat(Now(), "HH:mm:ss")#','#rec_id#','Processing was completed by #trim(read_user_name.username)#','T','1')
</CFQUERY>		
</cfform>

<center>
<tr>
	<td><font size=3 face=arial>
		This order is now finished - &nbsp;<b><cfoutput>#url.rec_id#</cfoutput></b>&nbsp;
	</td>
</tr>
<p></P>	
<center>


</table>
</center>
