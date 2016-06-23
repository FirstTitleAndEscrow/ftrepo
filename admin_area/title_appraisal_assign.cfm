	

		<CFQUERY datasource="#request.dsn#" NAME="read_all_Appraisers">
		
			SELECT *
			FROM Appraisers 
			ORDER BY company ASC, lname ASC, fname ASC
		
		</CFQUERY>


		<CFQUERY datasource="#request.dsn#" NAME="read_title">
		
			SELECT *
			FROM Title
			WHERE title_ID = #rec_ID#
		
		</CFQUERY>





		
	

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
				<CENTER><B>Title Committment Report</B></CENTER>
			</TD>
		</TR>

	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>

		<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">




<!--- =================================== --->
<!--- =================================== --->



<CFOUTPUT>


<table width=520 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
		<tr>
			<td width=519 colspan=2 align=center valign=top bgcolor=f3f3f3>
				<font size=3 color=blue face=arial>
				<B>Appraisal Form</B>
			</td>
		</tr>

		
		<tr>
			<td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3>
				<font size=2 color=black face=arial>
				<B>Appraisal Information :</B>
			</td>
		</tr>	


		<tr>
			<td width=200  align=right valign=top bgcolor=d3d3d3>
				<font size=2 color=black face=arial>
				Appraisal Type -  
			</td>
			<td width=319  align=left valign=top bgcolor=e1e1e1>
				<font size=2 color=blue face=verdana>
				
					<B>#read_title.appraisal_type#</B>

			</td>
		</tr>
		
		<tr>
			<td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3>
				<font size=2 color=black face=arial>
				List of all Appraisers.  <br>
				<font size=1 color=blue face=arial>Select an Appraiser from the list below.
			</td>
		</tr>		
</CFOUTPUT>

<CFFORM NAME="frm" ACTION="./title_Appraisal_doc_assign.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#rec_id#&a_trigger=1&company_id=#company_ID#" METHOD=POST>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			Appraisers List
		
		
		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>	
			<SELECT NAME="Appraiser_ID_new" 			
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
				<CFOUTPUT QUERY="read_all_Appraisers"><OPTION VALUE="#Appraiser_ID#">#Company# -  #lname#, #fname#</OPTION></CFOUTPUT>			
				</SELECT>
					
		
		</td>
	</tr>		

		<tr>
			<td width=519 colspan=2  align=right valign=top bgcolor=f3f3f3>
				<NOBR><input type=image src="./images/button_submit.gif" border=0><img src="./images/clear.gif" height=10 width=40></NOBR>
			</td>
		</tr>


</CFFORM>


<CFOUTPUT>

	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			PRESENT OWNER
		
		
		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
				<B>#read_title.sfirstname1# #read_title.sminame1# #read_title.slastname1#</B><br>
				<B>#read_title.sfirstname2# #read_title.sminame2# #read_title.slastname2#</B>
		</td>
	</tr>


	<tr>		
		<td width=130 align=right valign=top bgcolor=e6e6e6>	
			<font size=2 color=black face=arial>
			PURCHASER 
		
		
		</td>

		<td width=368 align=left valign=top bgcolor=e6e6e6>	
			<font size=2 color=blue face=arial>
				<B>#read_title.bfirstname1# #read_title.bminame1# #read_title.blastname1#</B><br>
				<B>#read_title.bfirstname2# #read_title.bminame2# #read_title.blastname2#</B>
		</td>
	</tr>




		
<!--- =========================================================== --->
		<tr>
			<td width=519 colspan=2  align=center valign=top bgcolor=f3f3f3>
				<font size=2 color=black face=arial>
				<B>Property Address:</B>
			</td>
		</tr>	

		<tr>
			<td width=519 colspan=2  align=center valign=top bgcolor=e1e1e1>
				
				<table width=518 cellpadding=1 cellspacing=1 border=0>
					<tr>
						<td width=217 align=right valign=top>
							<font size=2 color=blue face=arial>
							<B>#read_title.paddress#</B>
						</td>
						
						<td width=120 align=right valign=top>
							<font size=2 color=blue face=arial>
							<B>#read_title.pcity#</B>
						</td>				

						<td width=20 align=right valign=top>
							<font size=2 color=blue face=arial>
							<B>#read_title.pstate#</B>
						</td>

						<td width=60 align=right valign=top>
							<font size=2 color=blue face=arial>
							<B>#read_title.pzip#</B>
						</td>				
						<td width=100 align=right valign=top>
							<font size=2 color=blue face=arial>
							<B>#read_title.pcounty#</B>
						</td>
					</tr>
					<tr>
						<td width=517 colspan=5 align=right valign=top>
							<font size=2 color=blue face=arial>
							<CFIF #read_title.estimate_value# GT "">
							Estimated Property Value is.... <font size=2 color=blue face=arial>
							<B>$ #NumberFormat(read_title.estimate_value, "999,999,999.99")#</B></CFIF>
						</td>
					</tr>

				</table>
				
			</td>
		</tr>	
<!--- =========================================================== --->				

	</table>

</CFOUTPUT>

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