<!--- Check that Title ID was provided --->
<CFIF NOT IsDefined("URL.rec_id")>
 <H1>You did not specify the Order Number</H1>
 <CFABORT>
</CFIF>

 <!--- Get the film record --->
<CFQUERY NAME="processor" datasource="#request.dsn#">
	SELECT * FROM 
	sqlProcessingOpenOrders
	WHERE Title_ID=#URL.rec_id# 
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_processor">
	SELECT username, ID, fname + ' ' + lname AS Name
	FROM   First_Admin
	WHERE    
    (role_id = 11) OR
           (role_id = 22) OR
           (role_id = 23) AND (role_mgr = 1)
	ORDER BY fname + ' ' + lname
</CFQUERY>

<!--- Get ratings --->
<!--- Page header --->
<!---<CFINCLUDE TEMPLATE="header.cfm">--->
<!--- Update movie form --->
<CFFORM ACTION="update2_processing.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#processor.title_id#&a_trigger=1"><!--- Embed primary key as a hidden field --->
<CFOUTPUT>
<TABLE ALIGN="center" BGCOLOR="white">
 	<tr>
   		<td colspan=2 align= "middle" height="76"><IMG style="WIDTH: 891px; HEIGHT: 70px" height=70 src="images/logo_menu_1.gif" width=825 ></td>
  	</tr>
</Table>
<TABLE ALIGN="center" BGCOLOR="white">
   <TR>
        <TH colspan="2" Align="center">
            <FONT SIZE="+1"><Center>Reassign Processor</CENTER></FONT>
        </TH>
    </TR>
    <TR>
        <TD>
            Order Num:
        </TD>
        <TD>
			#Processor.Title_ID#
       	</TD>
    </TR>
    <TR>
        <TD>
            Assigned Date:
        </TD>
        <TD>
			#DateFormat(processor.dateandtime, "mm/dd/yyyy")# #TimeFormat(processor.dateandtime, "hh:mm tt")#
		</TD>
    </TR>
  	<TR>
    	<TD>
			Borrower:
		</TD>
    	<TD>
			#processor.BFirstName1# #processor.BLastName1#
		</TD>
	</TR>
    <TR>
        <TD>
            Client:
        </TD>
		<td>
			#processor.company#
		</td>
	</tr>
	<TR>
		<TD>
            Closing Date:
        </TD>
		<td>
			#processor.A_Req_Closing_month#/#processor.A_Req_Closing_Day#/#processor.A_Req_Closing_year#
		</td>	
	</TR>	
	<TR>
		<TD>
            Processor Name:
        </TD>
		<td>
			#processor.fname# #processor.lname#
		</td>	
	</TR>
	<tr>
		<td>
			Reassign To:
		</td>
		<TD><!--- Ratings list --->
			<CFSELECT Name="NewName"
				QUERY="read_processor"
				Value="username"
				Display="Name"
				Selected="#processor.fname# #processor.lname#">
			</CFSELECT>
		</TD>
    </TR>
	<tr>
		<td colspan="2" Align="center">
			<input Type="submit" Value="Update">
		</td>
	</tr>
    </CFOUTPUT>
</TABLE>
</CFFORM><!--- Page footer --->
