





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
		<td width=499 align=center valign=top bgcolor=e1e1e1>
			<IMG SRC="./images/title_01.gif">
			
		</td>
	</tr>

	<tr>
		<td width=499 align=center valign=top bgcolor=e2e2e2>
			<FONT SIZE=2 color=black face=arial>

<table width=499 cellpadding=3 cellspacing=3 border=0 bgcolor=white>
	<tr>
		<td width=230 align=left valign=top bgcolor=white>
			<FONT SIZE=1 color=black face=arial>
			Use the administrator to Manage the Mortgage Clients/Companys of First Title Services.
			<p>
			You can Add, Modify and Disable Clients, but they cannot be deleted.
			<p>
			You must Login to proceed.

			
		</td>



		<td width=230 align=center valign=top bgcolor=white>


<TABLE border=0 cellpadding=1 cellspacing=1 width=211 >
								<TR>
									<td width=211 align=center valign=top bgcolor=black>

<TABLE border=0 cellpadding=1 cellspacing=1 width=210 >
								<TR>
									<td width=210 align=center valign=top bgcolor=white>

<!--- user login section --->

							<TABLE border=0 cellpadding=1 cellspacing=1 width=209 >
								<TR>
									<td width=209 align=right valign=top bgcolor=f4f4f4>
										<CENTER>
										<font face=arial size=2 color=blue>
										<b>[ User Login ]</b>
										</CENTER>
									</td>
								</tr>
								

								<TR>
									<td width=209 align=right valign=top bgcolor=f4f4f4>
<FORM method=post action="https://<cfoutput>#cgi.server_name#</cfoutput>/admin_area/login.cfm" >

										<NOBR><font face=arial size=1 color=black>
										User Name
										<input type=text  maxlength=30 name=username value="" size=17 REQUIRED="Yes" MESSAGE="You must enter a User Name"
														size="1" 
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
														clear: none;" ></NOBR>
									</td>
								</tr>
								

								<TR>
									<td width=209 align=right valign=top bgcolor=f4f4f4>						
										<NOBR><font face=arial size=1 color=black>
										Password
										<input type=password name=password maxlength=30 value=""  size=17 REQUIRED="Yes" MESSAGE="You must enter a Password"
														size="1" 
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
										</NOBR>
									</td>
								</tr>
					

								<TR>
									<td width=209 align=right valign=top bgcolor=f4f4f4>
<CFOUTPUT>

	<INPUT TYPE=HIDDEN name=users_ip_1 VALUE="#CGI.REMOTE_ADDR#">

</CFOUTPUT>	
										<input type=image src="./images/button_login.gif" border=0>

										
										
											</td>
								</tr>
							</table>
							
							
							
							
									</td>
								</tr>
							</table>

									</td>
								</tr>
							</table>
									
									
</FORM>


			
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
