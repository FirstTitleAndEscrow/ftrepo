<CFQUERY datasource="#request.dsn#" NAME="read_report">
		
			SELECT *
			FROM Title a, doc_abstract_title f
			WHERE a.title_id = f.title_id AND f.a_assigned_by is not null AND f.a_recieved_by is null and (abstractor_id = 160 or abstractor_id = 162)
</cfquery>

	<CFLOOP query="read_report">
	
<CFQUERY datasource="#request.dsn#" NAME="read_abstractor">
		
			SELECT *
			FROM abstractors where abstractor_id = #abstractor_id#
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="read_report2">
		
			SELECT *
			FROM Title a, doc_abstract_title f
			WHERE a.title_id = f.title_id and f.abstractor_id = #abstractor_id#
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="read_admin">
		
			SELECT *
			FROM first_admin
			WHERE ID = #a_assigned_by#
</cfquery>

<cfif #read_abstractor.pref_for_send# eq "email">
				<CFMAIL
				TO="#read_abstractor.email#"
				FROM="webmaster@firsttitleservices.com" Subject="First Title/Absracts USA, LLC - Outstanding Title Reports"
				TIMEOUT="600"
				type = "HTML"
				>

		<table width=780 cellpadding=3 cellspacing=3 border=0 bgcolor=white>
	<tr>
		<td width=780 align=center valign=top bgcolor=white>
			
			<p><FONT SIZE=3 color=black face=arial>Please Respond by 8:00 AM the next business day from Receipt</font></p>
			
			<p><FONT SIZE=3 color=black face=arial>Below please find an itemization of all outstanding property information requests with your company. Please provide us with an update all orders in progress. We expect all reports returned to us in 24-36 hours from assignment.  You may update us in the following ways: (1) e-mail reply to #read_admin.email#; (2)fax this form to #read_admin.fax#; or (3) phone at #read_admin.phone#. 
			</p>
			
<br>
			
		</td></tr>
		</table>
	<table width=780 cellpadding=3 cellspacing=3 border=0 bgcolor=white>
			<tr>
		<td width=780 align=center valign=top bgcolor=white>
			<tr>
			<td width=10 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>Borrower name</td>
		</TD>
		<td width=200 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>Order num</td>
			<td width=300 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>Address</td>
			<td width=30 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>Order Date</td>
			<td width=240 align=center valign=top bgcolor=d3d3d3>
			<FONT FACE=ARIAL color=blue SIZE=2><b>Vendor Comments</td>
			</TR>
<CFLOOP query="read_report2">
<tr>
	<td width=10 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#bfirstname1#&nbsp;#blastname1#</td>
			<td width=200 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#title_id#</td>
			<td width=300 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#paddress#&nbsp;#pcity#,&nbsp;#pstate#.&nbsp;#pzip#</td>
			<td width=30 align=left valign=top bgcolor=elelel>
			<font face=verdana size=2 color=black>#DateFormat(a_date_assigned, "mm/dd/yyyy")#</td>
			<td width=240 align=left valign=top bgcolor=elelel>
			</td>
	</TR>
</cfloop>	

		</td></tr>
		</table>
			<table width=780 cellpadding=3 cellspacing=3 border=0 bgcolor=white>
	<tr>
		<td width=780 align=center valign=top bgcolor=white>
			<p>
			<FONT SIZE=3 color=black face=arial>
			<br>
			Thank you for your professional handling of our business.
			If you should have any questions regarding the files, please contact #read_admin.fname# #read_admin.lname# at the number and e-mail address above.</font><br><br>
			<br><br>
			<B>ABSTRACTS, U.S.A., LLC</b>
			</p>
		</td></tr>
		</table>	
</cfmail>
<cfelse>
<CFMAIL
TO="1#read_abstractor.fax#@efaxsend.com"
FROM="neworders@firsttitleservices.com" Subject="First Title/Absracts USA, LLC - Outstanding Title Reports"
TIMEOUT="600"
>

ABSTRACTS USA, L.L.C/FIRST TITLE - OUTSTANDING TITLE REPORTS 
			
Please Respond by 8:00 AM the next business day from Receipt
			
Below please find an itemization of all outstanding property information requests with your company. Please provide us with an update all orders in progress. We expect all reports returned to us in 24-36 hours from assignment.  You may update us in the following ways: (1) e-mail reply to #read_admin.email# ; (2)fax this form to #read_admin.fax#; or (3) phone at #read_admin.phone#. 
			
<CFLOOP query="read_report2">
Order Date:   #DateFormat(a_date_assigned, "mm/dd/yyyy")#   Order num:	#title_id#   
Borrower name:	 #bfirstname1# #blastname1#   
Address:   #paddress##pcity#,#pstate##pzip# 
Vendor Comments (please complete):
									
</cfloop>
Thank you for your professional handling of our business.
If you should have any questions regarding the files, please contact #read_admin.fname# #read_admin.lname# at the number and e-mail address above.


ABSTRACTS, U.S.A., LLC
</cfmail>
				</cfif>
</cfloop>
