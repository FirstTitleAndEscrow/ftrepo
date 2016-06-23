



		<CFQUERY datasource="#request.dsn#" NAME="read_Title">
		
			SELECT *
			FROM Title
			WHERE Title_ID = #rec_ID#

		
		</CFQUERY>
		
		<CFQUERY datasource="#request.dsn#" NAME="read_sel_company">
		
			SELECT *
			FROM companies
			WHERE ID = #read_Title.comp_ID#
		
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_title_co">		
			SELECT *
			FROM Title_FT_Agencies
			WHERE Title_FT_Agency_ID = 7		
		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_title_ins">		
			SELECT *
			FROM 
			WHERE Title_ID = #rec_ID#		
		</CFQUERY>
		
		
<CFIF #read_title_ins.a_assigned_by# GT "">


		<!--- ===/ Get the name of the person that is  \=== --->
		<!--- ===/ STARTED the Loan Pay Off Process        \=== --->
		
		<CFQUERY datasource="#request.dsn#" NAME="read_user_assigning">
		
			SELECT *
			FROM first_admin
			WHERE ID = #read_title_ins.a_assigned_by#
		
		</CFQUERY>		
		
		
		<CFSET user_that_started = #read_user_assigning.fname# & " " & #read_user_assigning.lname#>

		
<CFELSE>
		<CFSET user_that_started = "Not Started Yet">
</CFIF>


<CFIF #read_title_ins.a_recieved_by# GT "">

		<!--- ===/ Get the name of the person that is  \=== --->
		<!--- ===/ FINISHED the Loan Pay Off Process        \=== --->
		
		<CFQUERY datasource="#request.dsn#" NAME="read_user_recieving">
		
			SELECT *
			FROM first_admin
			WHERE ID = #read_title_ins.a_recieved_by#
		
		</CFQUERY>		
		
		<CFSET user_that_started = #read_user_recieving.fname# & " " & #read_user_recieving.lname#>

<CFELSE>
		<CFSET user_that_finished = "Not Finished Yet">
</CFIF>		

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=790 align=center valign=top>
		
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width=790 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Insurance Binder</B></CENTER>
			</TD>
		</TR>
<CFOUTPUT>

	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>
		
		
		<CFINCLUDE TEMPLATE="./includes/prop_top_nav.cfm">
		
<!--- ================================================================ --->
<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Person Obtaining Info - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#user_that_started#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Date Started - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#read_.a_assigned_date#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Time Started - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#read_.a_assigned_time#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Person Completing Info - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#user_that_finished#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Date Completed - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#read_title_ins.a_recieved_date#</B>
			</td>
		</tr>

		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Time Completed - 
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=red face=verdana>
				<B>#read_title_ins.a_recieved_time#</B>
			</td>
		</tr>
</table>
<!--- =========================================================== --->

</CFOUTPUT>

<p>

		
<CFFORM NAME="frm" ACTION="./Title_Title_Ins_submit.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" METHOD=POST>




<CFOUTPUT>
		<TR>
			<TD width=789 align=left valign=top bgcolor=white>
		<!--- =================================================================== --->			
			<table width=788 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
				<TR>
					<TD width=788 align=center valign=top>
			<table width=787 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=150 align=center valign=top  bgcolor=e1e1e1>
						<FONT SIZE=2 color=gray face=arial>
						Plant No. <br>
						<INPUT TYPE=TEXT NAME="Plant_no" VALUE="#read_title_ins.Plant_no#" SIZE=20 maxlength=30>
					</td>
					<TD width=487 align=center valign=top bgcolor=e1e1e1>
						<FONT SIZE=2 color=gray face=arial>
						Schedule A<br><FONT SIZE=2 color=black face=arial>
						<b>#read_Title.Title_ID#</b>
					</td>
					<TD width=150 align=center valign=top bgcolor=e1e1e1>
						<FONT SIZE=2 color=gray face=arial>
						Agent / Branch No. <br>
						<INPUT TYPE=TEXT NAME="Agent_Branch" VALUE="#read_title_ins.Agent_Branch#" SIZE=20 maxlength=30>
					</td>
				</tr>
			</table>

					</td>
				</tr>
			</table>
			<p>


			<table width=788 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
				<TR>
					<TD width=788 align=center valign=top>
			<table width=787 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
				<TR>
					<TD width=200 align=center valign=top  bgcolor=e1e1e1>
						<FONT SIZE=2 color=gray face=arial>
						Re-Insurance No. <br>
						<INPUT TYPE=TEXT NAME="reinsurance_no" VALUE="#read_title_ins.reinsurance_no#" SIZE=20 maxlength=30>
					</td>
					<TD width=387 align=center valign=top bgcolor=e1e1e1>
						<FONT SIZE=2 color=gray face=arial>
						Effective Date and Time<br><FONT SIZE=2 color=black face=arial>
						<NOBR>Month - <CFINPUT TYPE=TEXT NAME="a_month_no" VALUE="#read_title_ins.a_month_no#" SIZE=5 maxlength=3 >&nbsp;&nbsp;&nbsp;Day - <CFINPUT TYPE=TEXT NAME="a_day_no" VALUE="#read_title_ins.a_day_no#" SIZE=5 maxlength=3 >&nbsp;&nbsp;&nbsp;Year - <CFINPUT TYPE=TEXT NAME="a_year_no" VALUE="#read_title_ins.a_year_no#" SIZE=8 maxlength=4 ></NOBR>
					</td>
					<TD width=200 align=center valign=top bgcolor=e1e1e1>
						<FONT SIZE=2 color=gray face=arial>
						State / County <br><FONT SIZE=2 color=black face=arial>
						<NOBR><b>#read_title.PState#</b>&nbsp;&nbsp;/&nbsp;&nbsp;#read_title.PCounty#</NOBR>						
					</td>
				</tr>
				
			</table>

					</td>
				</tr>
			</table>

		<!--- =================================================================== --->	
	</td>
</tr>

		<TR>
			<TD width=519 align=center valign=top bgcolor=white>
				<FONT SIZE=2 color=black face=arial>

				<table width=519 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
		
					<tr>
						<td width=250 align=right valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							
						</TD>
						
						<td width=269 align=left valign=top bgcolor=white>
							<FONT FACE=ARIAL SIZE=2 color="black">
							
						</TD>

					</tr>


					<tr>
						<td width=519 colspan=2 align=left valign=top bgcolor=white>
							<p>
							<br>
							<p>
							
							<FONT FACE=ARIAL SIZE=2 color="black">
							Sincerly,<br>
							<b>#user_that_started#</b>
							<p>
							<br>
							<p>
							Authorization:<br>
							

						</TD>

					</tr>
</CFOUTPUT>
					<tr>
						<td width=519 colspan=2 align=right valign=top bgcolor=white>
							<p>
							<br>
							<p>
							<input type=image src="./images/button_submit.gif" border=0>
							
		</CFFORM>
							

						</TD>

					</tr>
					
					
				</table>


		</TD>
	</TR>
		


<!--- ====================================================================== --->
<!--- ====================================================================== --->
<!--- ====================================================================== --->



	</table>

			
			</TD>
		</TR>

	</table>
	
</BODY>
</HTML>
	
	
	
	
	
	
	
	
	COMMITMENT
	Plant #	Schedule ACommitment # Error! AutoText entry not defined.	Agent/Branch #
	
	
	
	
	
	Reinsurance #	Effective Date & TimeCommitmentMonthDayYear @ CommitmentTime	State & CountyFL, PropertyCounty
	
	1.	Policy or Policies to be issued:		
		ALTA LOAN - 1992 (10-17-92) Florida Modified		
		Proposed Insured:		Amount
	LenderLongName, 	$	TILendCoverage 
		ALTA OWNER'S - 1992 (10-17-92) Florida Modified		
		Proposed Insured:		Amount
	AllBuyersWithStatuses	$	TIOwnCoverage
	
	2.	The estate or interest in the land described or referred to in the Commitment and covered herein is 
		Fee Simple
	
		and is at the effective date hereof vested in:
	
	AllOwnersWithStatuses
	
	
	3.	The land is described as follows:
	
	
	
	
			Issued by:Error! AutoText entry not defined.Error! AutoText entry not defined., Error! AutoText entry not defined.
	Countersigned Authorized Signatory		Error! AutoText entry not defined.
	
	NOTE: This Commitment consists of insert pages labeled as Schedule A, Schedule B?Section 1, and Schedule B?Section 2.  This Commitment is of no force and effect unless all schedules are included, along with any Rider pages incorporated by reference in the insert page.
	
	
	
	
	
	
	COMMITMENT
	Plant #	Schedule B - Section 1Commitment # Error! AutoText entry not defined.	Agent/Branch #
	
	
	
	The following are requirements to be complied with:
	
	1.	Instrument(s) creating the estate or interest to be insured must be approved, executed and filed for record, to?wit:
	 
	(X)	Deed in proper form from AllSellersWithStatuses, vesting fee simple title in AllBuyersWithStatuses.
	(X)	Indenture of Mortgage from AllBuyersWithStatuses to LenderName, securing repayment of the original principal amount of $LoanAmount.
	 
	2.	Payment of the full consideration to, or for the account of, the grantors or mortgagors.
	3.	Payment of all taxes, charges, assessments, levied and assessed against subject premises, which are due and payable.
	4	Satisfactory evidence should be had that improvements and/or repairs or alterations thereto are completed; that contractor, subcontractors, labor and materialmen are all paid.
	5	Exceptions 3 and 4 of Schedule B - Section 2 of this commitment may be amended in, or deleted from the policy to be issued if a survey, satisfactory to the company, is furnished to the company.
	
	
	
	COMMITMENT
	Plant #	Schedule B - Section 2Commitment # Error! AutoText entry not defined.	Agent/Branch #
	
	
	
	Exceptions
	
	Schedule B of the policy or policies to be issued will contain exceptions to the following matters unless the same are disposed of to the satisfaction of the company.
	
	1.	Defects, liens, encumbrances, adverse claims or other matters, if any, created, first appearing in the public records or attaching subsequent to the effective date hereof but prior to the date the proposed Insured acquires for value of record the estate or interest or mortgage thereon covered by this Commitment.
	2.	Rights or claims of parties in possession not shown by the public records.
	3.	Encroachments, overlaps, boundary line disputes, and other matters which would be disclosed by an accurate survey and inspection of the premises.
	4.	Easements or claims of easements not shown by the public records.
	5.	Taxes or special assessments which are not shown as existing liens by the public records.
	6.	Taxes and assessments for the year 2002, and subsequent years, which are not yet due and payable.
	
