
<CFPARAM NAME="a_end_sel" DEFAULT="">

<CFSET a_list_of_picks = #ListToArray(a_end_sel, ",")#>




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

			<td width=581 align=center valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>
				<CFIF #a_list_to_view# EQ "ALL">
					All  Endorsements (Not State Specific)
				<CFELSEIF #a_list_to_view# EQ "MD">
					Maryland  Endorsements
				<CFELSE>
					District of Columbia Endorsements
				</CFIF>
				</B></CENTER>
			</TD>
		</TR>


	<tr>
		<td width=581 align=center valign=top bgcolor=e1e1e1>

	

				<table width=580 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
		

<CFSET a_final_endorsements = "">

					<tr>
						<td  width=580 align=left valign=top >
						
<CFLOOP FROM="1" TO="#ArrayLen(a_list_of_picks)#" INDEX="AAA">


		<CFQUERY datasource="#request.dsn#" NAME="read_selected_endorsements">		
			SELECT *
			FROM doc_endorsements
			WHERE Endorsement_ID = #a_list_of_picks[AAA]#
		</CFQUERY>
		
		
		<CFQUERY datasource="#request.dsn#">		
			INSERT INTO Title_Endorsements_Selected(Title_ID, Endorse_Item, Endorse_Name)
			VALUES(#rec_id#, '#read_selected_endorsements.Endorse_Content#', '#read_selected_endorsements.Endorse_name#')
		</CFQUERY>		
		
		
		
<CFOUTPUT>
					
					<CFSET a_final_endorsements = #a_final_endorsements# & #Chr(10)# & #Chr(13)# & #Chr(10)# & #Chr(13)# & #read_selected_endorsements.endorse_content#>
					
							<FONT FACE=verdana SIZE=2 color="black">
							#read_selected_endorsements.endorse_content#<p>

</CFOUTPUT>

</CFLOOP>			
			
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
	
	
	