<!--- 	Created June 13, 2000 Jeanne Sarfaty Glazer
		------------------------------------------
		LOG:
		6/13/00	JSG Created File
		------------------------------------------
		Copyright:  A-1 Internet Services, Inc.
--->		
		
		

<CFQUERY DATASOURCE="First_Title_Services" name="getorderinfo">
SELECT *
FROM ORDERS
</CFQUERY>
		
		
<!---------- CHECK ORDERS' orderdate -------------->
<CFOUTPUT query="getorderinfo">

	<!--- strip out day month and year from orderdate string --->
	<CFSET dat_1 = #ListToArray(#orderdate#, "-")#>
	<CFSET count=1>
	<CFLOOP FROM="1" TO="#ArrayLen(dat_1)#" INDEX="sss">
	
		<CFIF count EQ 1>
			<CFSET newdat = #dat_1[sss]#>
		<CFELSEIF count EQ 2>
			<CFSET newmon = #dat_1[sss]#>
		<CFELSEIF count EQ 3>
			<CFSET newyr = #dat_1[sss]#>
			<!---only take first two digits of newyear i.e. exclude the time info--->
			<CFSET newyear = '#Left(newyr, 2)#'>			
		<CFELSE><!---do nothing--->			
		</CFIF>
		
		<CFSET count = #count# + 1>
		
	</CFLOOP>

	<!--- this is in the format dd-mmm-yy --->
	<CFSET today = #DateFormat(Now())#>
	<CFSET arc_date = #DateAdd('D', -15, #today#)#>
	<CFSET archive_date = #DateFormat(#arc_date#, "DD-MMM-YY")#>

	<CFIF (#orderdate# LT #archive_date#) AND ( (#status# EQ 'Cancelled per client') OR (#status# EQ 'Closed') )>
	
			<CFQUERY DATASOURCE="First_Title_Services" name="archive_data">
			INSERT INTO Orders_Archive (orderid, servicetype, orderdate, customerid, loginid, status, rpttype, searchtype, deedtransfer, insured, loanamt, polender1, poacctno1, pophone1, polender2, poacctno2, pophone2, delayreason, duedate, closing_status, file_upload)
			VALUES('#orderid#', '#servicetype#', '#orderdate#', '#customerid#', '#loginid#', '#status#', '#rpttype#', '#searchtype#', '#deedtransfer#', '#insured#', '#loanamt#', '#polender1#', '#poacctno1#', '#pophone1#', '#polender2#', '#poacctno2#', '#pophone2#', '#delayreason#', '#duedate#', '#closing_status#', '#file_upload#')
			</CFQUERY>

			<CFQUERY DATASOURCE="First_Title_Services" name="delete_record">
			DELETE FROM Orders
			WHERE orderid = #orderid#
			</CFQUERY>
			
	<CFELSE>	
	</CFIF>		
	
</CFOUTPUT>
<!---------- END CHECK ORDERS' orderdate -------------->












<CFQUERY DATASOURCE="First_Title_Services" name="getclosinginfo">
SELECT *
FROM CLOSING
</CFQUERY>
		
		
<!---------- CHECK CLOSING's orderdate -------------->
<CFOUTPUT query="getclosinginfo">

	<!--- strip out day month and year from orderdate string --->
	<CFSET dat_1 = #ListToArray(#closingdate#, "-")#>
	<CFSET count=1>
	<CFLOOP FROM="1" TO="#ArrayLen(dat_1)#" INDEX="sss">
	
		<CFIF count EQ 1>
			<CFSET newdat = #dat_1[sss]#>#newdat#<BR>
		<CFELSEIF count EQ 2>
			<CFSET newmon = #dat_1[sss]#>#newmon#<BR>
		<CFELSEIF count EQ 3>
			<CFSET newyr = #dat_1[sss]#>
			<!---only take first two digits of newyear --->
			<CFSET newyear = '#Right(newyr, 2)#'>#newyear#<BR>			
		<CFELSE><!---do nothing--->			
		</CFIF>
		
		<CFSET count = #count# + 1>
		
	</CFLOOP>

	<!--- this is in the format dd-mmm-yy --->
	<CFSET today = #DateFormat(Now())#>
	<CFSET arc_date = #DateAdd('D', -15, #today#)#>
	<CFSET archive_date = #DateFormat(#arc_date#, "DD-MMM-YY")#>#archive_date#<p>

	<CFIF #closingdate# LT #archive_date#>yes
	
			<CFQUERY DATASOURCE="First_Title_Services" name="archive_data">
			INSERT INTO Closing_Archive (closingid, orderid, customerid, loginid, orderdate, closingdate, closingtime, closingtype, closingoption, closingloantype, verifyemail, closingstatus, delayreason, duedate, confirmcompany, confirmcontact, confirmaddress, confirmcity, confirmstate, confirmzip, confirmphone, confirmfax, confirmemail)
			VALUES('#closingid#', '# orderid#', '# customerid#', '# loginid#', '# orderdate#', '# closingdate#', '# closingtime#', '# closingtype#', '# closingoption#', '# closingloantype#', '# verifyemail#', '# closingstatus#', '# delayreason#', '# duedate#', '# confirmcompany#', '# confirmcontact#', '# confirmaddress#', '# confirmcity#', '# confirmstate#', '# confirmzip#', '# confirmphone#', '# confirmfax#', '# confirmemail#')
			</CFQUERY>

			<CFQUERY DATASOURCE="First_Title_Services" name="delete_record">
			DELETE FROM Closing
			WHERE orderid = #orderid#
			</CFQUERY>
			
	<CFELSE>no		
	</CFIF>		
	
</CFOUTPUT>
<!---------- END CHECK ORDERS' orderdate -------------->