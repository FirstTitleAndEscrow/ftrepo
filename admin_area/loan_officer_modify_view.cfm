

		<CFQUERY datasource="#request.dsn#" NAME="read_loan_officers">
		
			SELECT *
			FROM loan_officers
			WHERE id = #proc_id#
			ORDER BY lo_lname ASC, lo_fname ASC
		
		</CFQUERY>
        
        

		
		<CFQUERY datasource="#request.dsn#" NAME="read_companies">
		
			SELECT *
			FROM companies
			WHERE ID = #comp_ID#
		
		</CFQUERY>
        <CFIF #read_companies.Companies_Switch# eq 1>
            <CFQUERY datasource="#request.dsn#" NAME="read_foo_users">
                 SELECT     Loan_Officers.lo_fname, Loan_Officers.lo_lname, Companies_User.fname, Companies_User.lname, Loan_Officers.comp_id, 
                            Companies_User.username, Companies_User.password, Loan_Officers.lo_email, Loan_Officers.lo_fax, Loan_Officers.lo_phone, 
                            Loan_Officers.lo_ext, Companies_User.Administrator, Companies_User.status
                 FROM       Companies_User RIGHT OUTER JOIN
                            Loan_Officers ON Companies_User.User_ID = Loan_Officers.ID
                 WHERE     (Loan_Officers.id = #form.proc_id#)
           </CFQUERY>
        <CFELSE>
            <CFQUERY datasource="#request.dsn#" NAME="read_foo_users">
                SELECT *
	            FROM Loan_Officers
	            WHERE id = '#form.proc_id#'
	            ORDER BY  lo_lname, lo_fname ASC
           </CFQUERY>
        </CFIF>    


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
						<font size=2 color=blue face=arial>Modify Loan Officer<font size=2 color=black face=arial>
						<p>
						Company - <B>#read_companies.company#</B>
						<p>
					
					</td>
				</tr>
			</CFOUTPUT>	

			</table>

					</td>
				</tr>

				<tr>
					<td width=499 align=center valign=top bgcolor=white>


			<table width=367 cellpadding=1 cellspacing=1 border=0 bgcolor=white>

<CFOUTPUT>

	<CFFORM METHOD=POST ACTION="./loan_officer_modify_submit.cfm?uid=#URL.uid#&al=#URL.al#&comp_id=#read_companies.ID#&officer_id=#proc_id#">


				<tr>		

					<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>	
						<img src="./images/clear.gif" height=10 width=85>


					</td>
				</tr>

	<tr>		
		<td width=367 colspan=2 align=left valign=top bgcolor=gray>	
			<font size=2 color=white face=arial>
			Loan <B>Officer</B> Information :
		
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			First Name
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT VALUE="#read_loan_officers.lo_fname#" type=text name="lo_fname"  size=20 maxlength=30
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none;" >
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Last Name
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT VALUE="#read_loan_officers.lo_lname#" type=text name="lo_lname"  size=20 maxlength=30
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none;" >
					
		
		</td>
	</tr>
    <CFIF #read_companies.Companies_Switch# eq "1">
        <tr>		
		    <td width=130 align=right valign=top bgcolor=e6e6e6>	
			    <font size=2 color=black face=arial>
			    User Name
		    </td>
            <td width=300 align=left valign=top bgcolor=e6e6e6>	
			    <CFINPUT type=text name="username" value = "#Read_Foo_Users.username#"    size=20 maxlength=30
				    style="font-size: 9; 
				    font-family: verdana; 
				    font-style: normal; 
				    color: blue; 
				    background-color: e6e6e6; 
				    border-color: e6e6e6; 
				    border-left-width: thin; 
				    border-right-width: thin; 
				    border-top-width: thin; 
				    border-bottom-width: thin; 
				    border-width: thin; 
				    border-style: bar; 
				    clear: none;" >
		    </td>
            </tr>
            <tr>
            <td width=130 align=right valign=top bgcolor=e6e6e6>	
			    <font size=2 color=black face=arial>
			    Password
		    </td>
            <td width=300 align=left valign=top bgcolor=e6e6e6>	
			    <CFINPUT type=text name="password" value = "#Read_Foo_Users.password#"   size=20 maxlength=30
				    style="font-size: 9; 
				    font-family: verdana; 
				    font-style: normal; 
				    color: blue; 
				    background-color: e6e6e6; 
				    border-color: e6e6e6; 
				    border-left-width: thin; 
				    border-right-width: thin; 
				    border-top-width: thin; 
				    border-bottom-width: thin; 
				    border-width: thin; 
				    border-style: bar; 
				    clear: none;" >
		    </td>
	    </tr>       
    </CFIF>
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Email
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT  VALUE="#read_loan_officers.lo_email#" type=text name="lo_email"  size=30 maxlength=160
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none;" >
					
		
		</td>
	</tr>	

		
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Phone
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT VALUE="#read_loan_officers.lo_phone#" type=text name="lo_phone"  size=23 maxlength=15
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none;" >
					
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Phone Ext.
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT VALUE="#read_loan_officers.lo_ext#" type=text name="lo_ext"  size=10 maxlength=6
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none;" >
					
		
		</td>
	</tr>
	
	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Fax
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT VALUE="#read_loan_officers.lo_fax#"  type=text name="lo_fax" size=23 maxlength=15
				style="font-size: 9; 
				font-family: verdana; 
				font-style: normal; 
				color: blue; 
				background-color: e6e6e6; 
				border-color: e6e6e6; 
				border-left-width: thin; 
				border-right-width: thin; 
				border-top-width: thin; 
				border-bottom-width: thin; 
				border-width: thin; 
				border-style: bar; 
				clear: none;" >
					
		
		</td>
	</tr>
	 <CFIF #read_companies.Companies_Switch# eq "1">
       <tr>
            <td width=130 align=right valign=top bgcolor=e6e6e6>	
			    <font size=2 color=black face=arial>
			    Administrator
		    </td> 
            <CFIF  #read_foo_users.Administrator# eq 1>
                <td width=300 align=left valign=top bgcolor=e6e6e6>	
                    <font size=2 color=black face=arial>
					<NOBR><input type=radio name="Administrator" VALUE=1 CHECKED> - Yes</NOBR>
					<br><font size=2 color=red face=arial>
					<NOBR><input type=radio name="Administrator"  VALUE=0 > - No</NOBR><br>
			    </td>
            <CFELSE>
                <td width=300 align=left valign=top bgcolor=e6e6e6>	
                    <font size=2 color=black face=arial>
					<NOBR><input type=radio name="Administrator" VALUE=1 > - Yes</NOBR>
					<br><font size=2 color=red face=arial>
					<NOBR><input type=radio name="Administrator"  VALUE=0 CHECKED> - No</NOBR><br>
		        </td>
            
            </CFIF>
        </tr>    
        <tr>		
		    <td width=130 align=right valign=top bgcolor=e6e6e6>	
			    <font size=2 color=black face=arial>
			    Status
		    </td>
            <CFIF  #read_foo_users.Status# eq 1>
                <td width=300 align=left valign=top bgcolor=e6e6e6>	
                    <font size=2 color=black face=arial>
				    <NOBR><input type=radio name="Status" VALUE=1 CHECKED> - Active</NOBR>
				    <br><font size=2 color=red face=arial>
				    <NOBR><input type=radio name="Status"  VALUE=0 > - Inactive</NOBR><br>
			    </td>
            <CFELSE>
            <td width=300 align=left valign=top bgcolor=e6e6e6>	
                <font size=2 color=black face=arial>
			    <NOBR><input type=radio name="Status" VALUE=1 > - Active</NOBR>
			    <br><font size=2 color=red face=arial>
			    <NOBR><input type=radio name="Status"  VALUE=0 CHECKED> - Inactive</NOBR><br>
			</td>
            </CFIF>
    </CFIF>
	<tr>		
		<table>
	<tr>		
		<td width=183  align=left valign=top bgcolor=e6e6e6>	
			<NOBR><a href="delete_officer.cfm?uid=#URL.uid#&al=#URL.al#&comp_id=#read_companies.ID#&officer_id=#proc_id#"><img src="./images/button_delete.gif" border=0></a></NOBR>
					
		
		</td>
		<td width=183 align=right valign=top bgcolor=e6e6e6>	
			<NOBR><input type=image src="./images/button_modify.gif" border=0><img src="./images/clear.gif" height=10 width=40></NOBR>
					
		
		</td>
	</tr>
	</table>
	</CFFORM>
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


			</BODY>
			</HTML>


	