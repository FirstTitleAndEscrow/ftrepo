



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
			FROM Title_companies
			WHERE Title_co_ID = 7		
		</CFQUERY>

		

		<CFQUERY datasource="#request.dsn#" NAME="read_current_endorsements">		
			SELECT *
			FROM doc_amer_title_fla_title
			WHERE Title_ID = #rec_ID#		
		</CFQUERY>



		<CFQUERY datasource="#request.dsn#" NAME="read_all_endorsements">		
			SELECT *
			FROM doc_endorsements
			WHERE Endorse_Ref = 'ALL'
			ORDER BY Endorse_Name ASC
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
				<CENTER><B>Title Insurance Endorsements</B></CENTER>
			</TD>
		</TR>
	<tr>
		<td width=581 align=center valign=top bgcolor=e1e1e1>

		
<CFFORM NAME="frm" ACTION="./Title_select_endorsements.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" METHOD=POST>

		

				<table width=580 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
		
					<tr>
						<td width=580 align=center valign=top bgcolor=white>
						<FONT FACE=verdana SIZE=1 color="blue">
						Choose an Endorsement List to view
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
	
	
	