<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="/javascript/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/javascript/TableTools.min.js"></script>
<script type="text/javascript" src="/javascript/ZeroClipboard.js"></script>

<link rel="stylesheet" type="text/css" href="/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="/css/jquery.dataTables_themeroller.css">
<link rel="stylesheet" type="text/css" href="/css/TableTools.css">
<link rel="stylesheet" type="text/css" href="/css/TableTools_JUI.css">

<cfset ri_employee = 0>
<CFQUERY datasource="#request.dsn#" NAME="get_user">
select va_employee
from first_admin
where ID = #session.ft_user_id#
</CFQUERY>
<cfif get_user.va_employee eq 'True'>
<cfset ri_employee = 1>
</cfif>

<cfset fx_employee = 0>
<CFQUERY datasource="#request.dsn#" NAME="get_user">
select ft_fairfax_employee
from first_admin
where ID = #session.ft_user_id#
</CFQUERY>
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



<cfparam name="FORM.columnNameHdn" default="" >



</head>


<body>
<cfquery name="first_title_services_dev" datasource="#request.dsn#">
SELECT Title_ID ,  order_date, BLASTNAME1 , paddress, pstate,  loan_number, insured, 'Notes' as  Notes,Type, pname, 

 CASE WHEN

(online_docs_to_be_recorded = 'true'  AND online_docs_recorded  IS NULL) THEN 'X' ELSE  '' END as  online_docs_needed,

CASE WHEN

(Corporate_Docs_Needed ='true'  AND Corporate_docs_received  IS NULL) THEN 'X' ELSE  '' END as  corp_docs_needed,

CASE WHEN

(Trust_Docs_Needed ='true'  AND Trust_docs_received  IS NULL) THEN 'X' ELSE  '' END as  trust_doc_needed,

CASE WHEN

(Subordination_Needed ='true'  AND Subordination_received  IS NULL) THEN 'X' ELSE  '' END as  subordination_needed,

 

CASE WHEN

(Surveys_Needed ='true'  AND Surveys_Received  IS NULL) THEN 'X' ELSE  '' END as  survey_needed

, IsNull(Type,'') as code, oda_month ,searchType, comp_id,

(SELECT distinct streamline_client FROM Companies  where id=  t.comp_id) as streamline_client,

(SELECT cl_dateandtime FROM Eventlist where  title_id= t.title_id) as closed_date,

(SELECT fl_dateandtime FROM Eventlist where  title_id= t.title_id) as funded_date

FROM Title t

WHERE (online_docs_to_be_recorded = 'true'  and online_docs_recorded  IS NULL or

Corporate_Docs_Needed = 'true'  and Corporate_docs_received  IS NULL or

Trust_Docs_Needed = 'true'  and Trust_docs_received  IS NULL or

Surveys_Needed = 'true'  and Surveys_Received  IS NULL or

Subordination_Needed = 'true'  and Subordination_received  IS NULL) and cancelled IS  NULL 

 and (SELECT  cl_dateandtime FROM  Eventlist where title_id= t.title_id) IS NULL 

 and (SELECT  fl_dateandtime FROM  Eventlist where title_id= t.title_id) IS NULL

    order by  title_id

</cfquery>

<CENTER>
<CENTER>

<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF id="doctable">
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

			
				<table width=820 class="tablesorter" id="mydata">
				    <thead>
				    <tr>
				    	<th  width=50 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Title</th>
				    	<th  width=50 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Order Date</th>
					    <th  width=50 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Borrower last Name</th>
					    <th  width=50 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Loan Number</th>
					    <th  width=50 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Property Address</th>
					    <th  width=50 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">State</th>
					    <th  width=50 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Lender</th>
					    <th  width=50 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Processor</th>
					    <th  width=50 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Online</th>
					    <th  width=50 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Corporate</th>
					    <th  width=50 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Trust</th>
					    <th  width=50 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Surveys</th>
					    <th  width=50 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Subordination</th>
					    <th  width=50 align=center valign=top><FONT FACE=verdana SIZE=1 color="black">Notes</th>

				    </tr>
				    </thead>
				    <tbody bgcolor="white">
					<cfoutput query="first_title_services_dev">
<cfset richmond = 0>
<CFQUERY datasource="#request.dsn#" NAME="get_va">
select f.va_employee
from first_admin f, Companies c, title t
where
t.title_id = #title_id#
and c.id = t.comp_id
and f.id = c.intsales
</CFQUERY>
<cfif get_va.va_employee eq 'True'>
<cfset richmond = 1>
</cfif>
<cfset fx = 0>
<CFQUERY datasource="#request.dsn#" NAME="get_fx">
select f.ft_fairfax_employee
from first_admin f, Companies c, title t
where
t.title_id = #title_id#
and c.id = t.comp_id
and f.id = c.intsales
</CFQUERY>
<cfif get_fx.ft_fairfax_employee eq 'True'>
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
				            <td bgcolor=#a_bgcolor# align=left valign=top><FONT FACE=verdana SIZE=1 color="black">#DateFormat(order_date, "mm/dd/yyyy")#</font></td>
				            <td bgcolor=#a_bgcolor# align=left valign=top><FONT FACE=verdana SIZE=1 color="black">#BLASTNAME1#</font></td>
							<td bgcolor=#a_bgcolor# align=left valign=top><FONT FACE=verdana SIZE=1 color="black">#loan_number#</font></td>
							<td bgcolor=#a_bgcolor# align=left valign=top><FONT FACE=verdana SIZE=1 color="black">#paddress#</font></td>
							<td bgcolor=#a_bgcolor# align=left valign=top><FONT FACE=verdana SIZE=1 color="black">#pstate#</font></td>
							<td bgcolor=#a_bgcolor# align=left valign=top><FONT FACE=verdana SIZE=1 color="black">#Insured#</font></td>
							<td bgcolor=#a_bgcolor# align=left valign=top><FONT FACE=verdana SIZE=1 color="black">#pname#</font></td>
							<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black">#online_docs_needed#</font></td>
							<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black">#corp_docs_needed#</font></td>
							<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black">#trust_doc_needed#</font></td>
							<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black">#survey_needed#</font></td>
							<td bgcolor=#a_bgcolor# align=center valign=top><FONT FACE=verdana SIZE=1 color="black">#subordination_needed#</font></td>
							<td bgcolor=#a_bgcolor# align=left valign=top>
								 <!---<a href="./title_comments_nav.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&company_id=#company_id#" target="prop_hud_pg1" onClick="window.open('','prop_hud_pg1','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">#Notes#</a>--->
								  <a href="./title_comments_nav.cfm?uid=485&al=1&rec_id=#title_id#&company_id&code=#code#" target='title_comment' onClick="window.open('','title_comment','width=620,height=500,status=0,resizable=1,scrollbars=1')"><FONT FACE=verdana SIZE=1 color="blue">#Notes#</a>
							</td>

				        </tr>
						</cfif>
				    </cfoutput>
				    </tbody>
				</table>
				
		</td>
	</tr>
</table>
<script type="text/javascript">	
 $(function() {

	$('#mydata').dataTable({
			
			"bPaginate": true,
		    "bLengthChange": true,
	        "bFilter": true,
	        "bSort": true,
			"bStateSave": true,
	        "bInfo": false,
			"bAutoWidth": true,
			"iDisplayLength": 50,
		    "sDom": 'T<"clear">lfrtip',
		    
        "oTableTools": {
            "aButtons": [
				{
					"sExtends": "csv",
					"sButtonText": "Save to CSV"
				}
			],
            "sSwfPath": "../media/swf/copy_csv_xls_pdf.swf"
        }
		});
		
	
  
   });
  
</script>
</body>
</html>