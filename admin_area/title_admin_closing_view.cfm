
<CFSET r_count = "0">

	<!---=========================================== --->
	<!--- ===/ Get a list of all of the Clients \=== --->
	
		<CFQUERY datasource="#request.dsn#" NAME="read_companies">
		
			SELECT *
			FROM companies
			ORDER BY company ASC
		
		</CFQUERY>
		
		<CFSET c_count = "1">
		<CFSET a_company_name = ArrayNew(1)>
		<CFSET a_company_id   = ArrayNew(1)>
		
		<CFOUTPUT QUERY="read_companies">
			<CFSET a_company_name[c_count] = #company#>
			<CFSET   a_company_id[c_count] = #ID#>
			
			<CFSET c_count = #c_count# + "1">
		</CFOUTPUT>
		
	<!---=========================================== --->	
	<!---===================================================================== --->
	<!--- ===/ Use the list of companies to get a list of all their users \=== --->

		<CFSET    users_fname = ArrayNew(2)>
		<CFSET    users_lname = ArrayNew(2)>
		<CFSET       users_id = ArrayNew(2)>
		<CFSET    a_rec_count = ArrayNew(1)>
		
		<CFSET a_count = "1">
		<CFSET b_count = "1">
		
			<CFLOOP FROM="1" TO="#ArrayLen(a_company_id)#" INDEX="CCC">
				<CFQUERY datasource="#request.dsn#" NAME="read_users">
					SELECT *
					FROM users
					Where comp_id = #a_company_id[CCC]#
					ORDER BY lp_lname ASC, lp_fname ASC
				</CFQUERY>

					<CFOUTPUT QUERY="read_users">
						<CFSET users_fname[CCC][b_count] = #lp_fname#>
						<CFSET users_lname[CCC][b_count] = #lp_lname#>
						<CFSET    users_id[CCC][b_count] = #ID#>

						<CFSET b_count = #b_count# + "1">
					</CFOUTPUT>
						<CFSET a_rec_count[CCC] = #read_users.recordcount#>
						<CFSET b_count = "1">
			</CFLOOP>
	<!---===================================================================== --->		
		

<CFQUERY datasource="#request.dsn#" NAME="read_titleid">
		
		
SELECT *
FROM Title C, Title_Closing_Order_Request O 
WHERE C.title_id = O.title_id AND O.a_Req_closing_month IS NOT NULL
			ORDER BY o.Title_id
		
		</CFQUERY>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
	<tr>
		<td width=780 align=center valign=top>
	
<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=780 align=center valign=top bgcolor=e1e1e1>
		
	
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->

<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=780 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Closing Request Search</B></CENTER>
			</TD>
		</TR>
<CFFORM METHOD=POST ACTION="./title_admin_closing_display.cfm?uid=#URL.uid#&al=#URL.al#&a_trigger=1">
<INPUT type="hidden" name="update" value="no"><INPUT type="hidden" name="uid" value="URL.uid">
	<INPUT type="hidden" name="al" value="URL.al"><tr>
			<td width=780 align=center valign=top bgcolor=d3d3d3>
				<table width=600 cellpadding=1 cellspacing=1 border=0>

									
					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer First Name -  
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="buyer_fname" size=25 maxlength=15
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
						</td>
					</tr>
		<!--- ================================================== --->						
					<tr>
						<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Buyer Last Name -  
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<input type=text name="buyer_lname"  size=25 maxlength=25
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
						</td>
					</tr>
						
						<tr>
					<td bgcolor=d3d3d3 width=150 align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black">
							Title Number
						</td>

						<td bgcolor=d3d3d3 width=500 align=left valign=top>
							<SELECT NAME="title_id"			
								size="1" 
								style="font-size: 9; 
								font-family: verdana; 
								font-style: normal; 
								color: blue; 
								background-color: e1e1e1; 
								border-color: e1e1e1; 
								border-left-width: thin; 
								border-right-width: thin; 
								border-top-width: thin; 
								border-bottom-width: thin; 
								border-width: thin; 
								border-style: bar; 
								clear: none; 
								float: none;" 
								rows="5" 
								cols="45" 
								>
								<OPTION VALUE="NONE">N/A</OPTION>
								<CFOUTPUT QUERY="read_titleid"><OPTION VALUE="#Title_ID#">#Title_ID#</OPTION></CFOUTPUT>			
							</SELECT>
						</td>
					</tr>
						
					<tr>
						<td bgcolor=d3d3d3 colspan=2 width=600 align=right valign=top>
							<INPUT TYPE=image src="./images/button_search.gif" border=0> 
						</td>

					</tr>
</CFFORM>


				</table></TD>
		
			</TR>
<tr>
			<td width=780 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Closing Request Search</B></CENTER>
			</TD>
		</TR>
<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->

			</TD>
		
		</TR>

	</table>


			</TD>
		</TR>

	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
	
	
	