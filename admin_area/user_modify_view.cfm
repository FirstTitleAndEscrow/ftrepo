    <CFQUERY datasource="#request.dsn#" NAME="read_companies">
	    SELECT *
		FROM companies
		WHERE ID = #comp_ID#
    </CFQUERY>
        
    <CFIF #Read_companies.Companies_Switch# eq "1">
        <CFQUERY datasource="#request.dsn#" NAME="read_user">
               SELECT       Companies_User.fname, Companies_User.lname, Companies_User.username, Companies_User.password, Users.lp_email, 
                            Users.cc_email_1, Users.cc_email_2, Users.lp_phone, Users.lp_ext, Users.lp_fax, Companies_User.status, 
                            Companies_User.Administrator, Companies_User.Job_Title,Users.lp_fname, Users.lp_lname
                FROM        Companies_User RIGHT OUTER JOIN
                            Users ON Companies_User.User_ID = Users.ID
                WHERE      (Users.ID = #user_id#) and (Users.comp_ID = #comp_id#)
            </CFQUERY>   
    <CFELSE>             
        <CFQUERY datasource="#request.dsn#" NAME="read_user">
		        SELECT *
		    	FROM users
			    WHERE comp_id = #comp_id# AND ID = #user_id#
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
						<font size=2 color=blue face=arial>Modify Loan Processor<font size=2 color=black face=arial>
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

	<CFFORM METHOD=POST ACTION="./user_modify_submit.cfm?uid=#URL.uid#&al=#URL.al#&comp_id=#read_companies.ID#&user_id=#user_id#" onsubmit="javascript:return ValidateForm(this)" >


				<tr>		

					<td width=367 colspan=2 align=right valign=top bgcolor=e6e6e6>	
						<img src="./images/clear.gif" height=10 width=85>


					</td>
				</tr>


	<tr>		
		<td width=367 colspan=2 align=left valign=top bgcolor=gray>	
			<font size=2 color=white face=arial>
			Loan <B>Processor</B> Information :
		
		
		</td>
	</tr>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			First Name
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT VALUE="#read_user.lp_fname#" type=text name="lp_fname"  size=20 maxlength=30
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
			<CFINPUT VALUE="#read_user.lp_lname#" type=text name="lp_lname"  size=20 maxlength=30
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
			    <CFINPUT type=text name="username" value="#read_user.username#"   size=20 maxlength=30
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
			    <CFINPUT type=text name="password" value = "#read_user.password#" size=20 maxlength=30
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
			<CFINPUT  VALUE="#read_user.lp_email#" type=text name="lp_email"  size=30 maxlength=160
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
			cc. Email 1
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT  type=text name="cc_email_1" VALUE="#read_user.cc_email_1#" size=30 maxlength=160
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
			cc. Email 2
		
		
		</td>

		<td width=237 align=left valign=top bgcolor=e6e6e6>	
			<CFINPUT  type=text name="cc_email_2" VALUE="#read_user.cc_email_2#"  size=30 maxlength=160
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
			<CFINPUT VALUE="#read_user.lp_phone#" type=text name="lp_phone"  size=23 maxlength=15
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
			<CFINPUT VALUE="#read_user.lp_ext#" type=text name="lp_ext"  size=10 maxlength=6
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
			<CFINPUT VALUE="#read_user.lp_fax#"  type=text name="lp_fax" size=23 maxlength=15
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
	
      <CFIF #read_companies.Companies_Switch# eq 1>
                                                                        <tr>		
		                                                                    <td width=130 align=right valign=top bgcolor=e6e6e6>	
			                                                                    <font size=2 color=black face=arial>
			                                                                    Administrator
		                                                                    </td>
                                                                            <CFIF  #read_user.Administrator# eq "1">
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
                                                                            
                                                                            </td>
                                                                        </tr>  
                                                                        <tr>		
		                                                                    <td width=130 align=right valign=top bgcolor=e6e6e6>	
			                                                                    <font size=2 color=black face=arial>
			                                                                   
		                                                                    </td>
                                                                            <CFIF  #read_user.Status# eq 1>
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
                                                                          
                                                                    </tr>  	 
                                                                    </CFIF>

</table><table>
	<tr>		
		<td width=183  align=left valign=top bgcolor=e6e6e6>	
			<NOBR><a href="delete_processor.cfm?uid=#URL.uid#&al=#URL.al#&comp_id=#read_companies.ID#&user_id=#user_id#"><img src="./images/button_delete.gif" border=0></a></NOBR>
					
		
		</td>
		<td width=183  align=right valign=top bgcolor=e6e6e6>	
			<NOBR><input type=image src="./images/button_modify.gif" border=0></NOBR>
					
		
		</td>
	</tr>
	
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


	