<html>
<head>	
<!---<link rel="stylesheet" type="text/css" href="http://localhost/Testproject/themes/blue/style.css" />--->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="https://dev.firsttitleservices.com/js/jquery.tablesorter.js"></script>
<!---<script type="text/javascript" src="http://localhost/FT/jquery.tablesorter.js"></script>--->

<cfset ri_employee = 0>
<CFQUERY datasource="#request.dsn#" NAME="get_user">
select va_employee, ft_fairfax_employee
from first_admin
where ID = #session.ft_user_id#
</CFQUERY>
<cfif get_user.va_employee eq 'True'>
<cfset ri_employee = 1>
</cfif>
<cfif get_user.ft_fairfax_employee eq 'True'>
<cfset fx_employee = 1>
</cfif>

<style>
th { cursor: pointer; }


table.tablesorter {
	font-family:arial;
	background-color: #CDCDCD;
	margin:10px 0pt 15px;
	font-size: 8pt;
	width: 100%;
	text-align: left;
}
table.tablesorter thead tr th {
	background-color: #e6EEEE;
	border: 1px solid #FFF;
	font-size: 8pt;
	padding: 4px;
}

table.tablesorter thead tr .header {
	background-image: url(./images/bg.gif);
	background-repeat: no-repeat;
	background-position: center right;
	cursor: pointer;
}

table.tablesorter thead tr .headerSortUp {
	background-image: url(./images/asc.gif);
}
table.tablesorter thead tr .headerSortDown {
	background-image: url(./images/desc.gif);
}

</style> 

<script>
$(document).ready(function() {
	var asc_sort=false;

$("#mydata").tablesorter();

});

/*
function ExportToExcel()
{
	var getParentDiv=document.getElementById("parentdiv");
	var Exportbtn=document.createElement("BUTTON");
	var btntext=document.createTextNode("Export To Excel");
	
	Exportbtn.appendChild(btntext);
	Exportbtn.name="exportBtn";
	
	Exportbtn.onclick = function(){
		PropForm.submit();
	};
	
	getParentDiv.appendChild(Exportbtn);
}
*/
</script>

<cfparam name="FORM.columnNameHdn" default="" >

<script language="JavaScript" >
	
	function SortByColumn(columnName)
	{
			  
		if (columnName == 'Title') {
			columnName = 'Title_ID';
		}
					
		document.PropForm.columnNameHdn.value = columnName;	
	}	
	
</script>

</head>
<body onload="javascript:InitializeSubmitbutton();">
<cfoutput>
	<cfif isDefined("FORM.exportBtn")>
	         <cfobject component="title_company" name="titleObj">
              <cfscript> 
                  //Use an absolute path for the files. ---> 
                     theDir=GetDirectoryFromPath(GetCurrentTemplatePath()); 
                  	 theFile=theDir & "titles.xls"; 
                  //Create empty ColdFusion spreadsheet objects. ---> 
                 	 theSheet = SpreadsheetNew("TitleData"); 
                  // Create a Header Row at the top of the report --->
		              SpreadsheetAddRow(theSheet, " Title Id , Borrower Last Name , Property Address, Property State, Lender, Online docs needed, Corporate docs needed, Trust docs needed, Surveys needed");
		              SpreadsheetFormatRow(theSheet, {bold=TRUE, alignment="center"}, 1);                  
                  //Populate object with query. ---> 
                 	  SpreadsheetAddRows(theSheet,titleObj.getSpreadsheetData());  
                 	                                
              </cfscript> 					 
               
              <!--- <cfdump var="#titleObj.getSpreadsheetData()#" label="SpreadsheetAddRows">--->
               
             <cfspreadsheet action="write" filename="#theFile#" name="theSheet" sheetname="titles" overwrite=true >              
                  
              <cfset filenamex=Chr(34)&"titles.xls"&chr(34)> 
              <cfheader name="Content-Disposition" value="attachment; filename=#filenamex#"> 
              <cfcontent TYPE="application/ms-excel" FILE="#theFile#">   
	</cfif>
</cfoutput>
<body>		
	
<cfquery name="get_files" datasource="#request.dsn#">
	SELECT Title_ID , BLASTNAME1 , paddress, pstate, loan_number, insured, 'Notes' as Notes,Type
	FROM Title 
	WHERE cleartoCloseReview_assignedToID = '514' and cancelled IS NULL
    
</cfquery>

<CENTER>
<CENTER>

<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF >
	<tr>

		<td width=820 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>S e a r c h &nbsp;&nbsp;&nbsp;R e s u l t s <br><FONT FACE=ARIAL SIZE=2 color="blue">
				The search located records as shown below.
				</CENTER>

		</TD>
	</TR>
	<tr>
		<td width=820 align=left valign=top bgcolor=d3d3d3>

			<!---------------------------------------------------->
			<!--- AT FIRST RECORD --->
			<!---------------------------------------------------->

			<form name="PropForm" method="post">
				<input type="hidden" name="columnNameHdn" value="" /> 
				<input type="hidden" name="sortdirection" value="a" />
				<table width=820 class="tablesorter" id="mydata">
				    <thead>
				    <tr>
				    	<th  width=50 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Title</th>
					    <th  width=50 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Borrower last Name</th>
					    <th  width=50 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Loan Number</th>
					    <th  width=50 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Property Address</th>
					    <th  width=50 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">State</th>
					    <th  width=50 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Lender</th>
<!--- 					    
						<th  width=50 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Online</th>
					    <th  width=50 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Corporate</th>
					    <th  width=50 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Trust</th>
					    <th  width=50 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Surveys</th>
					    <th  width=50 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Subordination</th>
 --->
 					    <th  width=50 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Notes</th>
				    	
				    </tr>
				    </thead>
				    <tbody bgcolor="white">
					<cfoutput query="get_files">
<cfset richmond = 0>
<CFQUERY datasource="#request.dsn#" NAME="get_va">
select f.va_employee, f.ft_fairfax_employee
from first_admin f, Companies c, title t
where 
t.title_id = #title_id#
and c.id = t.comp_id
and f.id = c.intsales
</CFQUERY>
<cfif get_va.va_employee eq 'True'>
<cfset richmond = 1>
</cfif>
<cfif get_va.ft_fairfax_employee eq 'True'>
<cfset fx = 1>
</cfif>

						<cfset a_bgcolor="white">
					<cfif searchType eq "Purchase">
							<cfif comp_id eq 7393 OR comp_id eq 7402>
								<cfset a_bgcolor="red">
							<cfelse>
								<cfset a_bgcolor="FFCC66">
							</cfif>
						</cfif>
<cfif richmond eq 1 or (richmond eq 0 and ri_employee eq 0)>
			        <tr>
				            <td bgcolor=#a_bgcolor# align=right valign=top> 
								<!---<a href="./title_report_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_id#&oda_month=#oda_month#&code=#code#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">#title_id#</a>--->
								<a href="../admin_area/title_report_nav.cfm?uid=485&al=1&rec_id=#title_id#&company_id=0&oda_month=#oda_month#&code=#code#" target="title_pg" onClick="window.open('','title_pg','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue"><cfif streamline_client>ST</cfif>#title_id# <cfif richmond>(R)</cfif></a>
				            	
				            </td>
				            <td bgcolor=#a_bgcolor# align=left valign=top><FONT FACE=verdana SIZE=1 color="black">#BLASTNAME1#</font></td>
							<td bgcolor=#a_bgcolor# align=left valign=top><FONT FACE=verdana SIZE=1 color="black">#loan_number#</font></td>
							<td bgcolor=#a_bgcolor# align=left valign=top><FONT FACE=verdana SIZE=1 color="black">#paddress#</font></td>
							<td bgcolor=#a_bgcolor# align=left valign=top><FONT FACE=verdana SIZE=1 color="black">#pstate#</font></td>
							<td bgcolor=#a_bgcolor# align=left valign=top><FONT FACE=verdana SIZE=1 color="black">#Insured#</font></td>

<!---
							<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black">#online_docs_needed#</font></td>
							<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black">#corp_docs_needed#</font></td>
							<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black">#trust_doc_needed#</font></td>
							<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black">#survey_needed#</font></td>
							<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black">#subordination_needed#</font></td>
--->
							<td bgcolor=#a_bgcolor# align=left valign=top>
								 <!---<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">#Notes#</a>--->
								  <a href="./title_comments_nav.cfm?uid=485&al=1&rec_id=#title_id#&company_id&code=#code#" target='title_comment' onClick="window.open('','title_comment','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">#Notes#</a>
							</td>
				
				        </tr>
						</cfif>
				    </cfoutput>
				    </tbody>
				</table> 
				<div id="parentdiv" style="padding-top:10; padding-left:300">
			 		<input type="submit" value="Export to Excel" name="exportBtn">
			 	</div>	
			</form>
		</td>
	</tr>
</table>

</body>
</html>