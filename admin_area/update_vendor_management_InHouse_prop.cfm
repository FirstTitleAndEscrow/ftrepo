<!--- Check that Title ID was provided --->
<CFIF NOT IsDefined("URL.rec_id")>
 <H1>You did not specify the Order Number</H1>
 <CFABORT>
</CFIF>

 <!--- Taxes --->
<CFQUERY NAME="preprocessor" datasource="#request.dsn#">
	SELECT * 
	FROM 
	sqlAbstract_InHouse
	WHERE Title_ID=#URL.rec_id# 
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_processor">
	SELECT     username, ID, fname + ' ' + lname AS Name
	FROM         First_Admin
	WHERE     (role_id = 19 and Status = 1) OR
              (role_id = 29 and Status = 1) OR
              (role_id = 27 and Status = 1) OR
              (role_id = 17 and Status = 1)
              
	ORDER BY username
</CFQUERY>

<CFFORM ACTION="update2_vendor_management_InHouse_prop.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1"><!--- Embed primary key as a hidden field --->
<CFOUTPUT>
<TABLE ALIGN="center" BGCOLOR="white">
 	<tr>
   		<td colspan=2 align= "middle" height="76"><IMG style="WIDTH: 891px; HEIGHT: 70px" height=70 src="images/logo_menu_1.gif" width=825 ></td>
  	</tr>
</Table>
<TABLE ALIGN="center" BGCOLOR="white">
   <TR>
        <TH colspan="2" Align="center">
            <FONT SIZE="+1"><Center>Reassign In House Abstractor</CENTER></FONT>
        </TH>
    </TR>
    <TR>
        <TD>
            Order Num:
        </TD>
        <TD>
			0232#preprocessor.Title_ID#
       	</TD>
    </TR>
    <TR>
        <TD>
            Assigned Date:
        </TD>
        <TD>
			#Trim(preprocessor.a_date_assigned)# 
		</TD>
    </TR>
  	<TR>
    	<TD>
			Borrower:
		</TD>
    	<TD>
			#preprocessor.BFirstName1# #preprocessor.BLastName1#
		</TD>
	</TR>
    <TR>
        <TD>
            Client:
        </TD>
		<td>
			#preprocessor.company#
		</td>
	</tr>
	<TR>
		<TD>
            Employee Assigned:
        </TD>
		<td>
			#preprocessor.fname# #preprocessor.lname#
		</td>	
	</TR>
	<tr>
		<td>
			Reassign To:
		</td>
		<TD><!--- Ratings list --->
			<CFSELECT Name="NewName"
				QUERY="read_processor"
				Value="ID"
				Display="Name"
				Selected="#preprocessor.vendor_mgmt_InHouse_ID#">
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
