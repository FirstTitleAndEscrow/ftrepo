



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

		<CFQUERY datasource="#request.dsn#" NAME="read_ins_committments">		
			SELECT *
			FROM Doc_Title_Insurance_Title
			WHERE Title_ID = #rec_ID#		
		</CFQUERY>

		<CFQUERY datasource="#request.dsn#" NAME="read_Title_FT_Agency_company">
		
			SELECT *
			FROM Title_FT_Agencies
			WHERE Title_FT_Agency_ID = #read_ins_committments.Insurance_Co#
		
		</CFQUERY>		
		

		<CFQUERY datasource="#request.dsn#" NAME="read_clause_group_names">		
			SELECT *
			FROM Title_Committment_Clause_Groups
			ORDER BY Clause_Group_Name ASC
		</CFQUERY>


	

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>
<table width=582 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=582 align=center valign=top>
		
<table width=581 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width=581 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Title Insurance Commitments</B></CENTER>
			</TD>
		</TR>
	<tr>
		<td width=581 align=center valign=top bgcolor=e1e1e1>

		
<CFFORM NAME="frm" ACTION="./Title_Committment_select.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#&a_section_code=#a_section_code#" METHOD=POST>

		

				<table width=580 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
		
					<tr>
						<td width=580 align=center valign=top bgcolor=white>
						<FONT FACE=verdana SIZE=1 color="blue">
						Choose a Committment Clause State to view
						</td>

					</tr>


					<tr>
						<td width=580 align=center valign=top bgcolor=white>
							<SELECT NAME="a_list_to_view" 			
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
								<OPTION VALUE="ALL">All (not State Specific)</OPTION>
								<OPTION VALUE="MD">MD</OPTION>
								<OPTION VALUE="DC">DC</OPTION>
						</SELECT>
						</td>

					</tr>

					<tr>
						<td width=580 align=center valign=top bgcolor=white>
						<FONT FACE=verdana SIZE=1 color="blue">
						Choose a Commitment Clause to view
						</td>

					</tr>


					<tr>
						<td width=580 align=center valign=top bgcolor=white>
							<SELECT NAME="a_clause_group_is" 			
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
						<CFOUTPUT QUERY="read_clause_group_names">
								<OPTION VALUE="#Clause_group_name#">#Clause_group_name#</OPTION>
						</CFOUTPUT>
						</SELECT>
						</td>

					</tr>
					


					<tr>
						<td width=519  align=right valign=top bgcolor=white>
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
	
	
	