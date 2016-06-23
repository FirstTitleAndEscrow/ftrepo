	<cfparam name="a_flag" default="0">

		<CFQUERY datasource="#request.dsn#" NAME="read_title">
		
			SELECT *
			FROM Appraisal
			WHERE app_ID = #rec_ID#

		
		</CFQUERY>
		
		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">
		
			SELECT *
			FROM companies
			WHERE ID = #read_title.comp_ID#
		
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



<cfset code = "A">
<cfset rec_type = "app">
	<CFINCLUDE TEMPLATE="title_top_nav.cfm"> 
	





<CFOUTPUT QUERY="read_title"> <!--- =================================== ---><!--- ===/    [ CLIENT INFO ]  TOP   \=== ---><!--- =================================== --->
<CFQUERY datasource="#request.dsn#" NAME="read_team_info">
			SELECT t.*, f.FNAME, f.LNAME
			FROM TEAMS t, FIRST_ADMIN f
			WHERE t.ID = #read_sel_company.Team_ID#
			and t.Leader_ID = f.ID
		</CFQUERY>

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
				Order Number is...<b>APP-210#read_title.app_id#</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#read_team_info.NAME#: #read_team_info.FNAME# #read_team_info.LNAME#</FONT>
			</TD>
		</TR>
		
		
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
							Appraisal Status -</FONT>
							   

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
						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Email
						</td>

						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Email
						</td>
					</tr>

					<tr>
						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#o_email#</b>
						</td>

						<td width=256 colspan=2 bgcolor="f1f1f1" align=center valign=top>
							<FONT FACE=verdana SIZE=1 color="blue">
							<b>#p_email#</b>
						</td>
					</tr>

				</table>
			</td>
		</tr>

</table>


<!--- ======================================================================== --->

<!--- ========================================= --->
<!--- ===/    [ BORROWER - SELLER ]  TOP   \=== --->
<!--- ========================================= --->
<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
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
					
					<tr>
						<td width=205 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Loan Number <br>
						</td>

						<td width=314  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#loan_number#</b>
						</td>
					</tr>
				
				</table>
			</td>
		</tr>


</table>

<!--- ======================================================================== --->

<!--- ========================================= --->
<!--- ===/       [ COMMENTS ]  TOP         \=== --->
<!--- ========================================= --->


<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 align=center valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=2 color="black">
				<CENTER><B>PAYMENT INFORMATION</B></CENTER><br>
				
			</TD>
		</TR>

		<TR>
			<TD width=519 align=center valign=top bgcolor=d3d3d3>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>

		<!--- ==================================== --->
		<!--- ===/ Appraisal  Info [       ]  \=== --->
		<!--- ==================================== --->
				
					<tr>
						<td width=201  bgcolor="f1f1f1" align=right><FONT FACE=ARIAL SIZE=1 color="gray">
							Appraisal Type</td>
						<td width=313  bgcolor="f1f1f1" align=left>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#appraisal_type#</B>
						</td>
					</tr>

					<tr>
						<td width=201 bgcolor="f1f1f1" align=right valign=top>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							Estimated Value <br>
							<FONT FACE=verdana SIZE=1 color="gray" >(format xxxxxxxxxx.xx)
						</td>

						<td width=313  bgcolor="f1f1f1" align=left valign=top>
							<FONT FACE=verdana SIZE=1 color="blue"><b>#estimate_value#</b> 
						</td>
					</tr>

					<TR>
						<TD width=514 bgcolor="d3d3d3" colspan=4 align="center">

					<!--- ===/ Payment Type \=== --->
					
							<table width=515 cellpadding=1 cellspacing=1 border=0>
						
						
								<tr>
									<td width=512 colspan=3 align=left valign=top>
									
					<!--- ===/ Payment Method \=== --->
					
							<table width=519 cellpadding=1 cellspacing=1 border=0>
								<tr>
									<td width=519 colspan=2 align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="maroon">
										<B>APPRAISAL PAYMENT </FONT> 
									</td>
								</tr>

								<tr>
									<td bgcolor="f1f1f1" width=519  align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="maroon">
										<B>Pyment method chosen
									</td>

									
								</tr>

								<tr>
	<cfif #pay_method# eq "3">	
								
								<td bgcolor="f3f3f3" width=519  align=center valign=top>
									
						<!--- ============================ --->
						<!--- ===/ PAY BY CREDIT CARD \=== --->
						<!--- ============================ --->
						
							<table width=252 cellpadding=0 cellspacing=0 border=0>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Credit Card  
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
										<FONT FACE=verdana SIZE=1 color="blue">
									<b>#app_credit_card#</b>
									</td>
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Card No.   
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
										<FONT FACE=verdana SIZE=1 color="blue">
										<b>#app_cc_num#</b>
									</td>
								</tr>


								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Card Exp Month
									</td>
									
									<td bgcolor="f1f1f1" width=140 align=left valign=top>

									<FONT FACE=verdana SIZE=1 color="blue">
									<b>#app_cc_exp_month#</b>

								</td>
							</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Card Exp Year
									</td>
									
									<td bgcolor="f1f1f1" width=140 align=left valign=top>

									<FONT FACE=verdana SIZE=1 color="blue">
									<b>#app_cc_exp_year#</b>

								</td>
							</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Card Holder Name
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
										<FONT FACE=verdana SIZE=1 color="blue">
										<b>#app_cc_name#</b>
									</td>
								</tr>
							</table>
							
								</td>
<cfelseif #pay_method# eq "4">
								<td bgcolor="f3f3f3" width=519  align=center valign=top>								

						<!--- ============================ --->
						<!--- ===/    PAY BY CHECK    \=== --->
						<!--- ============================ --->
						
							<table width=252 cellpadding=0 cellspacing=0 border=0>
								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Account Holder Name   
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
											<FONT FACE=verdana SIZE=1 color="blue">
											<b>#app_ck_acct_name#</b>
									</td>
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Street / PO Box   
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
											<FONT FACE=verdana SIZE=1 color="blue">
											<b>#app_ck_addr1#</b>
									</td>
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Street / PO Box   
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
											<FONT FACE=verdana SIZE=1 color="blue">
											<b>#app_ck_addr2#</b>
									</td>
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >City   
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
											<FONT FACE=verdana SIZE=1 color="blue">
											<b>#app_ck_city#</b>
									</td>
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >State   
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
											<FONT FACE=verdana SIZE=1 color="blue">
											<b>#app_ck_state#</b>
									</td>
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Account No.   
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
										<FONT FACE=verdana SIZE=1 color="blue">
										<b>#app_ck_acct_no#</b>
									</td>
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Bank Name   
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
										<FONT FACE=verdana SIZE=1 color="blue">
										<b>#app_ck_bank#</b>
									</td>
								</tr>

								<tr>
									<TD bgcolor="f1f1f1" width=110 align=right>
										<FONT FACE=verdana SIZE=1 color="gray" >Routing No.    
									</td>
									<td bgcolor="f1f1f1" width=140 align=left valign=top>
										<FONT FACE=verdana SIZE=1 color="blue">
										<b>#app_ck_route_no#</b>
									</td>
								</tr>
							</table>
						</td>
			
			<cfelseif #pay_method# eq "2">
			<tr>
			<td bgcolor="f1f1f1" width=515  align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="maroon">
										<FONT FACE=verdana SIZE=1 color="blue"><b>COD</b>
									</td>
</tr>
			
				<cfelse>
				<tr>
			<td bgcolor="f1f1f1" width=515  align=center valign=top>
										<FONT FACE=ARIAL SIZE=1 color="maroon">
										<FONT FACE=verdana SIZE=1 color="blue"><b>Bill us</b>
									</td>
</tr>
				</cfif>
				
					</tr>				
							</table>

									</td>
								</tr>
								
							</table>

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
<!--- ======================================================================= --->
<p>
<!--- ======================================================================== --->

						</TD>
					</TR>
				</table>
		</TD>
	</TR>
</TABLE>
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
	

	
	
	
	