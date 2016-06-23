<!--- Check that Title ID was provided --->
<CFIF NOT IsDefined("URL.rec_id")>
 <H1>You did not specify the Order Number</H1>
 <CFABORT>
</CFIF>

 <!---  --->
<CFQUERY NAME="preprocessor" datasource="#request.dsn#">
	SELECT     Title.bfirstname1, Title.blastname1, First_Admin.fname, First_Admin.lname, tblUser_Roles.CleartoClose_ID, 
                      tblUser_Roles.Title_ID, tblUser_Roles.CleartoClose_Start_Datetime, Companies.company
	FROM         Title LEFT OUTER JOIN
                      Companies ON Title.comp_id = Companies.ID RIGHT OUTER JOIN
                      tblUser_Roles ON Title.Title_ID = tblUser_Roles.Title_ID LEFT OUTER JOIN
                      First_Admin ON tblUser_Roles.CleartoClose_ID = First_Admin.ID
	WHERE     (tblUser_Roles.CleartoClose_ID IS NOT NULL) AND (tblUser_Roles.Title_ID = #rec_ID#)
</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_processor">
	SELECT username, ID, fname + ' ' + lname AS Name
	FROM   First_Admin
	WHERE  (role_id = 3)
	ORDER BY fname + ' ' + lname
</CFQUERY>

<!--- Get ratings --->
<!--- Page header --->
<!---<CFINCLUDE TEMPLATE="header.cfm">--->
<!--- Update movie form --->
<CFFORM ACTION="update2_cleartoclose.cfm?company_id=0&uid=#URL.uid#&al=#URL.al#&rec_id=#preprocessor.title_id#&a_trigger=1">
<CFOUTPUT>
<TABLE ALIGN="center" BGCOLOR="white">
 	<tr>
   		<td colspan=2 align= "middle" height="76"><IMG style="WIDTH: 891px; HEIGHT: 70px" height=70 src="images/logo_menu_1.gif" width=825 ></td>
  	</tr>
</Table>
<TABLE ALIGN="center" BGCOLOR="white">
   <TR>
        <TH colspan="2" Align="center">
            <FONT SIZE="+1"><Center>Reassign Clear To Close</CENTER></FONT>
        </TH>
    </TR>
    <TR>
        <TD>
            Order Num:
        </TD>
        <TD>
			#preprocessor.Title_ID#
       	</TD>
    </TR>
    <TR>
        <TD>
            Assigned Date:
        </TD>
        <TD>
			#Trim(preprocessor.cleartoclose_Start_datetime)# 
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
            CTC Name:
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
				Selected="#preprocessor.fname# #preprocessor.lname#">
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
