

		<CFQUERY datasource="#request.dsn#" NAME="read_title">
		
			SELECT *
			FROM Title
			WHERE title_ID = #url.rec_ID#

		
		</CFQUERY>
		
		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">		
			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_ID#
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_sales">		
			SELECT *
			FROM First_Admin
			WHERE ID = #read_sel_company.IntSales#
		</CFQUERY>

<CFQUERY datasource="#request.dsn#" NAME="read_team_info">
			SELECT t.*, f.FNAME, f.LNAME
			FROM TEAMS t, FIRST_ADMIN f
			WHERE t.ID = #read_sel_company.Team_ID#
			and t.Leader_ID = f.ID
		</CFQUERY>
		
		
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="#ffffff" TEXT="#000000" LINK="#ff0000" VLINK="#800000" ALINK="#ff00ff" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth="0" MarginHeight="0">

<CENTER>
<CENTER>
<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="gray">
	<tr>
		<td width=830 align=middle valign=top>
		
<table width=830 cellpadding=1 cellspacing=1 border=0 bgcolor="white">
	<!--- <tr>
		<td width=830 align=middle valign=top bgcolor="e1e1el">
			<IMG src="./images/logo_title_reports.gif">
			
		</td>
	</tr>
 --->


	<tr>
		<td width=830 align=middle valign=top bgcolor=e1e1el>




	<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">
	





<CFOUTPUT QUERY="read_title"> <!--- =================================== ---><!--- ===/    [ CLIENT INFO ]  TOP   \=== ---><!--- =================================== --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=bfbfbf>
	<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>CLIENT SPECIFIC INFORMATION</B></CENTER></FONT>
			</td>
		</tr>

		<TR>
			<TD width=519 align=left valign=top bgcolor=blue>
				<FONT SIZE=3 color=white face=arial>
				Order Number is...<b>T-#read_title.title_id#</b></FONT>
			</TD>
			</tr>
			<CFIF #Len(read_title.title_abstract)# gt 1>
				<tr>
					<TD width=519 align=left valign=top bgcolor=red>
						<FONT SIZE=3 color=white face=arial>
						<B>This Order has already been searched.  Refer to #read_title.title_abstract#</B></FONT>
					</TD>
				</tr>
			</CFIF> 
		<TR>
			<TD width=519 align=middle valign=top bgcolor=d3d3d3>
				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=100 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="black">
							Order Date</FONT>
							 
						</td>

						<td width=255 colspan=3 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="black">
							Due Date -</FONT>
							   
						</td>

						<td width=155 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="black">
							Status -</FONT>
							   

						</td>
					</tr>
		
					<tr>
						<td width=100 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=verdana SIZE=1 color="blue"> <b>#a_month#/#a_day#/#a_year#</b></FONT>
						</td>

						<td width=85 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Month -	<FONT FACE=verdana SIZE=1 color="blue"><b>#DateFormat(duedate, "mm")#</b></FONT></FONT>
						</td>

						<td width=85 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Day - <FONT FACE=verdana SIZE=1 color="blue"><b>#DateFormat(duedate, "dd")#</b></FONT></FONT>
						</td>

						<td width=85 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Year - <FONT FACE=verdana SIZE=1 color="blue"><b>#DateFormat(duedate, "yyyy")#</b></FONT></FONT>
						</td>

						<td width=155 align=middle valign=top bgcolor=d3d3d3>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#appraisal_status#</b></FONT>
						</td>
					</tr>
				</table></CFOUTPUT>

<CFOUTPUT QUERY="read_title">
		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
		
					<tr>
						<td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Unit No./Loan Officer:</b>
						</TD>
						
						<td colspan=2 width=259 align=left valign=top bgcolor=d3d3d3>
							<FONT FACE=ARIAL SIZE=2 color="maroon">
							<b>Unit No./Loan Processor:</b>
						</TD>

					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Name 
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B>#oname#</B>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Name 
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B>#pname#</B>
						</td>
					</tr>
						
					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone No.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#ophone#</b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone No.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<B>#pphone#</b>
						</td>
					</tr>
						
					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#oext#</b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#pext#</b>
						</td>
					</tr>
					
					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Fax
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#ofax#</b>
						</td>

						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Fax
						</td>

						<td width=134 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#pfax#</b>
						</td>
					</tr>
					
					<tr>
						<td width=300 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Email
						</td>

						<td width=300 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Email
						</td>
					</tr>

					<tr>
						<td width=400 colspan=2 bgcolor="f1f1f1" align=center valign=top> <!--- width=256 --->
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#o_email#</b>
						</td>

						<td width=400 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#p_email#</b>
						</td>
					</tr>

				</table>
			</td>
		</tr>

</table>

</cfoutput>
<!--- ======================================================================== --->

<!--- ========================================= --->
<!--- ===/    [ BORROWER - SELLER ]  TOP   \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		
		
		
		
		
						<tr>
			<td width=519 align=left colspan=2 valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Third Party Access Request</B></CENTER><br>
					<FONT FACE=arial SIZE=1 color="black"><B>This feature allows you to give access to third parties to your orders.
		
				</TD>
		</TR>	<CFQUERY datasource="#request.dsn#" NAME="third_party">
			SELECT *
			FROM thirdparty a inner join  thirdpartyorders b on a.ID = b.thirdpID
			WHERE orderid = #read_title.title_id# 
		
		</CFQUERY>
			
		<tr>
			<td width=519 bgcolor="f1f1f1" align=left valign=top>

							<FONT FACE=ARIAL SIZE=1 color="black">
							<b>Selected Third Party(ies) for this order </b> </font><br><br>

			<B><cfoutput query="third_party"><FONT FACE=verdana SIZE=1 color="red">Name:</font> <FONT FACE=verdana SIZE=1 color="blue">#FIRST# #LAST# </font><FONT FACE=verdana SIZE=1 color="red">Company: </font><FONT FACE=verdana SIZE=1 color="blue">#COMPANY# </font><FONT FACE=verdana SIZE=1 color="red">Email:</font> <FONT FACE=verdana SIZE=1 color="blue">#EMAIL# </font><FONT FACE=verdana SIZE=1 color="red">Phone:</font><FONT FACE=verdana SIZE=1 color="blue"> #PHONE#</font><br></CFOUTPUT></b>
			<cfoutput  QUERY="read_title">
				
				</font><br>
		</td>
		
		
		</TR>	
		
		
		
		
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>BORROWER / SELLER INFORMATION</B></CENTER><br><FONT FACE=ARIAL SIZE=2 color="maroon">
				<b>Borrowers Info:</b>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Borrowers Info [ FIRST ]  \=== --->
		<!--- =================================== --->
					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							1.>>
						</td>
						
						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#blastname1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bfirstname1#</b>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bminame1#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bssn1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bhphone1#</b>  
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bwphone1#</b>
							
						</td>
						
						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bext1#</b>
						</td>

					</tr>
					
		<!--- =================================== --->
		<!--- ===/ Borrowers Info [ SECOND ] \=== --->
		<!--- =================================== --->

					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							2.>>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#blastname2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bfirstname2#</b>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bminame2#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bssn2#</b> 
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bhphone2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bwphone2#</b>
							
						</td>
						
						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bext2#</b>
						</td>

					</tr>


		<!--- =================================== --->
		<!--- ===/ Borrowers Info [ THIRD ]  \=== --->
		<!--- =================================== --->
					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							3.>>
						</td>
						
						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#blastname3#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bfirstname3#</b>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bminame3#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bssn3#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bhphone3#</b>  
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bwphone3#</b>
							
						</td>
						
						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bext3#</b>
						</td>

					</tr>
					
		<!--- =================================== --->
		<!--- ===/ Borrowers Info [ FOURTH ]  \=== --->
		<!--- =================================== --->
					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							4.>>
						</td>
						
						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#blastname4#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bfirstname4#</b>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bminame4#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bssn4#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bhphone4#</b>  
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bwphone4#</b>
							
						</td>
						
						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#bext4#</b>
						</td>

					</tr>
					
					<tr>
						<td width=335 colspan=5 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xx-xxxx</font>&nbsp;&nbsp; ^&nbsp;&nbsp;</NOBR> 
						</td>

						<td width=180 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xxx-xxxx</font>&nbsp;&nbsp; ^ 
						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp; 
						</td>
					</tr>
					<tr>
						<td width=25 colspan=1 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							&nbsp; 
						</td>
						<td width=90 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="gray">
							Company Name<br></b>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#company1#</b>
						</td>
						<td width=90 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="gray">
							Tax ID <br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#taxID1#</b>
						</td>
					</tr>
				</table>
			</td>
		</tr>


						
	<!--- ======================================================================= --->
	
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="maroon">
				<b>Sellers Info:</b>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- ================================== --->
		<!--- ===/  SELLERS Info [ FIRST ]  \=== --->
		<!--- ================================== --->
					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							1.>>
						</td>
						
						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#slastname1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sfirstname1#</b>  
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sminame1#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sssn1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#shphone1#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#swphone1#</b>
							
						</td>
						


						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sext1#</b>
						</td>

					</tr>
					
		<!--- ================================== --->
		<!--- ===/ SELLERS  Info [ SECOND ] \=== --->
		<!--- ================================== --->

					<tr>
						<td width=25 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							2.>>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Last Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#slastname2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							First Name<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sfirstname2#</b>
						</td>

						<td width=30 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							MI.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sminame2#</b>
						</td>

						<td width=100 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Social Sec. No.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sssn2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Home Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#shphone2#</b>
						</td>

						<td width=90 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Work Ph.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#swphone2#</b>
							
						</td>
						
						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Ext.<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#sext2#</b>
						</td>

					</tr>

					<tr>
						<td width=335 colspan=5 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xx-xxxx</font>&nbsp;&nbsp; ^&nbsp;&nbsp;</NOBR> 
						</td>

						<td width=180 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xxx-xxxx</font>&nbsp;&nbsp; ^ 
						</td>

						<td width=40 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp; 
						</td>
					</tr>
					<tr>
						<td width=25 colspan=1 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							<p>
							<br>
							&nbsp; 
						</td>
						<td width=90 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="gray">
							Company Name<br></b>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#company2#</b>
						</td>
						<td width=90 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="gray">
							Tax ID <br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#taxID2#</b>
						</td>
					</tr>
				</table>
			</td>
		</tr>


</table>



<!--- ======================================================================== --->

<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=center valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<B>PROPERTY ADDRESS</B>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Property  Info [ FIRST ]  \=== --->
		<!--- =================================== --->
					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Street Address <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#paddress#</b>
						</td>
					</tr>

					<tr>
						<td width=205  bgcolor="f1f1f1" align=right><FONT FACE=ARIAL SIZE=1 color="gray">
							City, State, Zip:</td>
						<td width=314  bgcolor="f1f1f1" align=left>
							<NOBR><FONT FACE=verdana SIZE=1 color="blue"><b>#pcity#,&nbsp;#pstate#  #pzip#</b>
							</NOBR>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							County <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#pcounty#</b>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Legal Description <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#plegaldesc#</b>
						</td>
					</tr>

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Property Use <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#prop_use_type#</B>
						</td>
					</tr>				

					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Is this a Condo or PUD <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#condo_pud#</b>
						</td>
					</tr>
					
				</table>
			</td>
		</tr>


</table>


						
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 COLSPAN = 2 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>MAILING ADDRESS</B></CENTER>
			</TD>
		</TR>
		<tr>
						<td width=519  COLSPAN = 2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="blue">
							#mailing_address#
						</td>
		</tr>
		
		
		
				<tr>
			<td width=519 COLSPAN = 2 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>LOAN NUMBER</B></CENTER>
			</TD>
		</TR>
		<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Loan Number&nbsp;&nbsp; <br>
						</td>
		<td width=314  bgcolor="f1f1f1" align=left valign=top>
							#loan_number#
						</td>
		</tr>
		
			<tr>
			<td width=519 colspan = 2 bgcolor="f1f1f1" align=center valign=top>

							<FONT FACE=ARIAL SIZE=1 color="gray">
							Type of HUD selected:
						
						
	<FONT FACE=ARIAL SIZE=2 color="red">
							<cfif #hud_type# eq 0>HUD1<cfelse>HUD1A</cfif>
						
						
		</td>
		
		
		</TR>
		
</table>
<!--- ======================================================================== --->

<!--- ========================================= --->
<!--- ===/       [ COMMENTS ]  TOP         \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>COMMENTS</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#a_COMMENT#</B>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<!--- ======================================================================= --->

<!--- ======================================================================== --->

<!--- ========================================= --->
<!--- ===/        [ PAYOFF ]  TOP          \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>PAYOFF INFORMATION:</B></CENTER>
			</TD>
		</TR>
		
		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- =================================== --->
		<!--- ===/ Payoff Lender  [ FIRST ]  \=== --->
		<!--- =================================== --->
	<tr>
						<td bgcolor="f1f1f1" align=center valign=top colspan=3>
							<FONT FACE=ARIAL SIZE=1 color="gray">
<CENTER>Do payoffs need to be ordered?&nbsp;&nbsp;YES <input type="radio" name="payoff_needed" value="1" <cfif payoff_needed eq 1>checked</cfif>>&nbsp;&nbsp;NO <input type="radio" name="payoff_needed" value="0" <cfif payoff_needed eq 0>checked</cfif>></CENTER>
						</td>
					</tr>
									<tr>
						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">First Lender<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#polender1#</b>
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Account Number<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#poacctno1#</b>
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone Number<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#pophone1#</b>
						</td>
					</tr>
					
		<!--- ==================================== --->
		<!--- ===/ Payoff Lender  [ SECOND ]  \=== --->
		<!--- ==================================== --->
					<tr>
						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Second Lender<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#polender2#</b>
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Account Number<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#poacctno2#</b>
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Phone Number<br>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#pophone2#</b>
						</td>
					</tr>

					
					<tr>
						<td width=172 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp; 
						</td>

						<td width=172  bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp; 
						</td>

						<td width=172 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							^ &nbsp;&nbsp;<FONT FACE=ARIAL SIZE=1 color="blue">xxx-xxx-xxxx</font>&nbsp;&nbsp; ^ 
						</td>
					</tr>

				</table>
			</td>
		</tr>

	<!--- ======================================================================= --->
</table>
<!--- ======================================================================== --->





<!--- ================================================ --->
<!--- ===/          [ TITLE INSURANCE ]           \=== --->
<!--- ================================================ --->

<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>TITLE INSURANCE INFORMATION:</B></CENTER>
			</TD>
		</TR>
		
			<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
<cfif searchtype contains "Second Mortgage">
				<tr>
						<td bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Junior Loan Policy?</font>
						</td>
						<td colspan="3" bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b><cfif jlp_policy eq 1>Yes<cfelse>No</cfif></font>
						</td>
			        </tr>
</cfif>
					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Transaction Type
						</td>

						<td width=150 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#SearchType#</b>   
						</td>

						<td width=100 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Deed Transfer
						</td>

						<td width=144 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#Deedtransfer#</b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Proposed Insured
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#Insured#</b>   
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Loan Amt 
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#loanamt_float#</b> 
						</td>
						</tr>
						
						<tr>
						<td width=140 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Current Loan Balances 
						</td>

						<td COLSPAN=3 width=379 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#estimated_loan_float#</b> 
						</td>
						</tr>
	
						<tr>
			
			<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<b><FONT FACE=ARIAL SIZE=1 color="gray">
							Purchase Price </b>
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#purchase#</font></td>
					</tr>
			
			
			<tr>
			<td width=519 colspan = 4 bgcolor="f1f1f1" align=left valign=top>

							<NOBR><FONT FACE=ARIAL SIZE=1 color="gray">
							Will there be a piggyback second mortgage closed with the above loan?  
						<FONT FACE=ARIAL SIZE=2 color="red">
							<CFIF #piggy# EQ "0">NO<CFELSE>YES</CFIF></td>
		
		
		</TR>
				
			<tr>
			<td width=519 colspan = 4 bgcolor="f1f1f1" align=left valign=top>

							<NOBR><FONT FACE=ARIAL SIZE=1 color="gray">
							Will title insurance be required on this piggyback loan?  
						<FONT FACE=ARIAL SIZE=2 color="red">
							<cfif #ins# eq 0>NO<cfelse>YES</CFIF>  
						
						
		</td></TR>	
				<tr>
			<td width=519 colspan = 4 bgcolor="f1f1f1" align=left valign=top>

							<NOBR><FONT FACE=ARIAL SIZE=1 color="gray">
							What is the loan amount of this second mortgage loan? #secloan#
						
		</td></TR>	
		
					
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Loan Type 
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#loan_type_111#</b>
						</td>
					</tr>

					<tr>
						<td width=125 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Loan Program  
						</td>

						<td COLSPAN=3 width=394 bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#loan_program_333#</b>
						</td>
					</tr>

				</table>
			</td>
		</tr>

	<!--- ======================================================================= --->
</table>
<!--- ======================================================================== --->


<cfif read_title.aname neq "" and read_title.aname IS NOT 'NULL'>
	<!--- ========================================= --->
<!--- ===/    ICL REQUESTED        \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>ICL has been requested</B></CENTER>
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray>Lender:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#read_title.aname#</b>
						</td>
					</tr>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray>Address:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#read_title.aaddress#</b><br>
<b>#read_title.acity#, #read_title.astate# #read_title.azip#</b>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</cfif>	


<!--- ========================================= --->
<!--- ===/    [ VERIFY ORDER ]  TOP        \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Verify Order was Received</B></CENTER><br>
				<FONT FACE=arial SIZE=1 color="black"><B>By providing us with an email address, you will receive a confirmation  e-mail of your order having been received by us.
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray>Your E-Mail:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#Verifyemail#</b>
						</td>
					</tr>

					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL color=black SIZE=1>You may also have verification sent to up to two other e-mail addresses.</FONT><br>
							<FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#Verifyemail_2#</b>
							<br>
							<FONT FACE=ARIAL SIZE=2 color=gray>Other E-Mail:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#Verifyemail_3#</b>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<!--- ======================================================================= --->
<!--- =========================================== --->
<!--- ===/    [ RECEIVE REPORT ]  TOP        \=== --->
<!--- =========================================== --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Request copy of Final Report</B></CENTER><br>
				<FONT FACE=arial SIZE=1 color="black"><B>If you would like to receive a copy of the final report, please provide us with an email address.
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=2 color=gray> E-Mail:</FONT>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#RptbyEmail#</b>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	
	
	
	<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>Title Commitment to be Issued By:</B></CENTER>
			</TD>
		</TR>
<CFQUERY datasource="#request.dsn#" NAME="title_companies">
			SELECT tc.company
			FROM title t, Title_companies tc, Doc_Title_Insurance_Title d
			where t.title_id = #read_title.title_id#
			and d.title_id = t.title_id
			and tc.title_co_id = d.insurance_co 
</CFQUERY>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=519 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#title_companies.company#</b>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<!--- ======================================================================= --->

<!--- ======================================================================== --->




	<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>ROA Hutton Specific Information</B></CENTER>
			</TD>
		</TR>
		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Share Loan Payoff:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>$#line_102#</b>
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Monthly Condo Fee:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>$#line_1304#</b>
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Payoff to University Bank:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>$#line_105#</b>
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Payoff to NCB:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>$#line_104#</b>
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Power of Attorney Request:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#line_1112#</b>
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Assignment of Interest:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#line_1113#</b>
						</td>
					</tr>
					<tr>
						<td width=200 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=verdana SIZE=1 color="black"><b>Senior:</b>&nbsp;&nbsp;
						</td>
						<td bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#senior#</b>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
<!--- ======================================================================= --->
<p>
<!--- ======================================================================== --->
<p></p></CFOUTPUT>

		</TD>
	</TR>
		

		</td>
	</tr><!--- ====================================================================== ---><!--- ====================================================================== ---><!--- ====================================================================== --->


	<tr>
		<!--- <td width=830 align=left valign=top bgcolor=e1e1el>
		<nobr><A href="javascript:window.close();"><IMG src="./images/button_close.gif" border=0></a></nobr>		



			</td>
		 --->
		
		</tr>

	
	
	</table>

			
			</td>
		</tr>

	</table></CENTER></CENTER>
	
</BODY>
</HTML>
	

	
	
	
	