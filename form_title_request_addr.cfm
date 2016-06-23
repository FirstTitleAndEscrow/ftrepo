<CFPARAM NAME="session.comp_id" DEFAULT="">
<CFPARAM NAME="session.order.property_city" DEFAULT="">
<CFPARAM NAME="session.order.property_state" DEFAULT="">
<CFPARAM NAME="session.order.property_zip" DEFAULT="">
<CFPARAM NAME="emp" DEFAULT="0">
<CFPARAM NAME="ordering_co" DEFAULT="0">
<cfparam name="final_document_retrieval" default="0">
<cfparam name="policy_recovery" default="0">


<cfif IsDefined("session.order") and session.order.property_zip neq ''>
<cfoutput>
<CFLOCATION URL="https://#cgi.server_name#/form_title_request.cfm?comp_id=#session.comp_id#&user_id_1=#form.USER_ID_1#&lo_id=#form.lo_id#&zip_trigger=1&pcity=#session.order.property_city#&pstate=#session.order.property_state#&zip_id=#session.order.property_zip#&title=1&property=0&appraisal=0&other=0&emp=0&ordering_co=0">
</cfoutput>
</cfif>

<CFQUERY DATASOURCE="#request.dsn#" NAME="read_company">
SELECT *
FROM companies
WHERE ID = '#comp_id#'
ORDER BY company ASC
</CFQUERY>

<CFIF #read_company.companies_switch# eq "1">
    <CFQUERY DATASOURCE="#request.dsn#" NAME="read_company_user">
        SELECT *
        FROM companies_user
        WHERE ID = #emp#
    </CFQUERY>
    <CFSET emp = #read_company_user.ID#>
</CFIF>


<CFQUERY DATASOURCE="#request.dsn#" NAME="read_state_list">
SELECT * FROM first_title_states_all ORDER BY st_abbrev ASC
</CFQUERY>
<CFQUERY DATASOURCE="#request.dsn#" NAME="get_states">
SELECT     *
FROM       First_Title_States
order by st_abbrev
</CFQUERY>


<CFIF #property# eq 1>
	<CFQUERY DATASOURCE="#request.dsn#" NAME="read_state_list">
SELECT * FROM first_title_states_all ORDER BY st_abbrev ASC
	</CFQUERY>
<CFELSE>
        <CFIF IsDefined("url.comp_id") and url.comp_id eq 3704>
		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_state_list">
		SELECT * FROM first_title_states_all ORDER BY st_abbrev ASC
		</CFQUERY>
        <cfelse>
		<CFQUERY DATASOURCE="#request.dsn#" NAME="read_state_list">
		SELECT     *
		FROM       First_Title_States
		order by st_abbrev
		</CFQUERY>
		</cfif>
</CFIF>


<cfif #read_company.recordcount# GT 0>
<CFQUERY DATASOURCE="#request.dsn#" NAME="read_user">
SELECT *
FROM users
WHERE comp_id = #read_company.id#
ORDER BY lp_lname ASC
</CFQUERY>
</cfif>

<!--- <CFIF IsDefined("form.title") is True> <cfset title=#title#> <cfelse> <cfset title=0></cfif>
<CFIF IsDefined("form.property") is True> <cfset property=#property#> <cfelse> <cfset property=0></cfif>
<CFIF IsDefined("form.appraisal") is True> <cfset appraisal=#appraisal#> <cfelse> <cfset appraisal=0></cfif>
<CFIF IsDefined("form.other") is True> <cfset other=#other#> <cfelse> <cfset other=0></cfif>


 --->

<!---2/4/13 :Start--->
<script language="JavaScript">
function submitFormPage()
{
<cfif property eq 1>
		submitWith = 'fileBrowseNo';		
		
		doSubmit = DoValidation();	
<cfelse>

	var fileObj = document.getElementById('fileToBrowseNameId');
	fileObjValue = fileObj.value; 
	 
	var doSubmit = true;
	var submitWith = '';
	
		
	if(fileObjValue != '')
	{
		doSubmit = true;
		submitWith = 'fileBrowseYes';
	}
	else
	{
		submitWith = 'fileBrowseNo';		
		
		doSubmit = DoValidation();	
	  
	}
</cfif>	
	
	if(doSubmit)
	{
		document.frm.action = "<cfoutput>./form_title_request_addr_verify.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#&final_document_retrieval=#final_document_retrieval#&policy_recovery=#policy_recovery#&zip_id=0&zip_trigger=0&a_trigger=7&emp=#emp#&ordering_co=#ordering_co#</cfoutput>" + '&submitFormWith=' + submitWith;
	   
	   document.frm.submit();
		
	}
	
}


function DoValidation()
{

  var CityObj  = document.getElementById('pcity');
  var StateObj = document.getElementById('pstate');
  var ZipObj   = document.getElementById('pzip');
  
  
  
  var errorMsg = '';
  
  if(CityObj.value == '')
    errorMsg = errorMsg + '\n' + 'You must enter a CITY';
  
  if(StateObj.value == '')
    errorMsg = errorMsg + '\n' + 'You must enter a STATE';
	
  if(ZipObj.value == '')
    errorMsg = errorMsg + '\n' + 'You must enter a Zip';
  
  
  if(errorMsg == '')
    return true;
  else
   {
   	alert(errorMsg);
	return false;
   }
    
 
 
}
</script>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. - Property Request Form</title>
<STYLE TYPE="text/css">
body {background-attachment:fixed;scrollbar-base-color:#708090}
.menu1 {color:#000000;font:normal bold 11px helvetica, geneva, sans serif;text-align:center;font-color:#000000}
.menu1:link    {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:visited {text-decoration:none;color:#000000;font:normal bold 11px helvetica, geneva, sans serif;}
.menu1:hover   {font:normal bold 11px helvetica, geneva, sans serif;text-decoration:none;color:#FFFFFF}
</style>
</head>
<BODY BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#FF0000" VLINK="#800000" ALINK="#FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td align = "center">

<table width="770" height="110" border=0 cellpadding=0 cellspacing=0 background="/client/images/banner_black_wout_logo.jpg" valign=top>
  <tr>
    <td rowspan="2" valign="top" width="220"><cfinclude template="logo_swap_include.cfm"></td>
    <td valign="top" align="right"><br>

	<cfFORM NAME="Search" METHOD="post" ACTION="title_client_single_display.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&ordering_co=#ordering_co#">

	<table border=0 align="right" cellpadding="0" cellspacing=0>
	<tr><td align="right" valign="center">
  <a href="https://<cfoutput>#cgi.server_name#</cfoutput>/quicksearchhelp.cfm" target="quicksearch" onClick="window.open('','quicksearch','width=320,height=170,status=0,resizable=0,scrollbars=0')"><font size=2 color=red face=arial>Quick Search</font></a>
&nbsp;&nbsp;</td>
  <td align="right" valign="center"><input type="text" name="number" size=10></td>
  <td align="right" valign="center">&nbsp;<input type="image" src="/client/images/searchgo.jpg" border=0 alt="Begin your Web search"></td>
  </tr></table>
 </cfFORM>
</td>
  </tr>
  <tr>
    <td valign="top" align="center" width="560"><nobr></nobr><br>
      &nbsp;</td>
  </tr>
</table>


</td></tr></tbody></table>

<table width=780 border="0" cellpadding="0" cellspacing="0" background="./images/back_03.gif">
  <TBODY>
   <tr>
  <td>
<center>
<table cellpadding="1" cellspacing="1" bgcolor = "000000" border="0" valign="top" width="770" height="25">
		<center>
		<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		 --->    <CFOUTPUT><TR>
		 <td valign="middle" align = "center" width="95"  height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FECE62'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#';return false;"><a class="menu1" href="https://#cgi.server_name#/contact_team.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#"><nobr><img src="/client/images/arrowlogin.jpg" border=0>&nbsp;<strong>CONTACT TEAM</strong>&nbsp;</nobr></a></td>
          <td valign="middle" align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='E79DF5'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#';return false;"><a class="menu1" href="https://#cgi.server_name#/calculator.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#"><nobr><img src="/client/images/arrowcontact.jpg" border=0>&nbsp;<strong>FEE CALCULATOR</strong>&nbsp;</nobr></a></td>
         <td valign="middle"  align = "center" width="115" height="20" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF0000'" onmouseout="this.bgColor='CCD2D2'"><a class="menu1" href="https://#cgi.server_name#/coverage_areas.cfm" target="ft_states" onClick="window.open('','ft_states','width=630,height=530,status=0,resizable=0,scrollbars=0')"><nobr><img src="/client/images/arrowproducts.jpg" border=0>&nbsp;COVERAGE AREAS&nbsp;</nobr></a></td>
          <CFIF #read_company.companies_switch# eq "1">
            <CFIF #read_company_user.Administrator# eq "1">
                <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&ordering_co=#ordering_co#';return false;"> <a class="menu1"  href="https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&ordering_co=#ordering_co#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
            </CFIF>
	      <CFELSE>
          <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='00FF66'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&ordering_co=#ordering_co#';return false;"> <a class="menu1"  href="https://#cgi.server_name#/loan_offcr_add.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&ordering_co=#ordering_co#" target="New"><nobr><img src="/client/images/arrowvendor.jpg" border=0>&nbsp;<strong>USER ADMIN</strong>&nbsp;</nobr></a></td>
          </CFIF>
    <td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='FF9900'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0&ordering_co=#ordering_co#';return false;"><a class="menu1" href="https://#cgi.server_name#/title_client_rep_view.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&a_trigger=8&company_id=0&ordering_co=#ordering_co#"><nobr><img src="/client/images/arrowcareers.jpg" border=0>&nbsp;<strong>PRODUCT REPORTS</strong>&nbsp;</nobr></a></td>
	<td width="95" height="20" valign="middle"  align = "center" bgcolor="CCD2D2" nowrap onmouseover="this.bgColor='0066CC'" onmouseout="this.bgColor='CCD2D2'" onClick="document.location.href='https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#';return false;"><a class="menu1" href="https://#cgi.server_name#/calendar.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&company_id=#read_company.id#&ordering_co=#ordering_co#"><nobr><img src="/client/images/arrowcompany.jpg" border=0 valign="middel">&nbsp;<strong>CLOSING CALENDAR</strong>&nbsp;</nobr></a></td>
<!--- <td width="95" bgcolor="#CCD2D2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	 ---></tr></CFOUTPUT></center>
 </table>

<p><CFOUTPUT>

				<CFIF #title# neq "0">
				<img src="./images/label_title.gif">
				<cfelseif #property# neq "0">
				<img src="./images/property_title.gif">
				<cfelseif #appraisal# neq "0">
				<img src="./images/appraisal_title.gif">
				<cfelseif #other# neq "0">
				<img src="./images/ancillary_title.gif">
				</cfif>
		</CFOUTPUT>		<p>
<!--- <CFIF IsDefined("form.title") is True> <cfset title=#title#> <cfelse> <cfset title=0></cfif>
<CFIF IsDefined("form.property") is True> <cfset property=#property#> <cfelse> <cfset property=0></cfif>
<CFIF IsDefined("form.appraisal") is True> <cfset appraisal=#appraisal#> <cfelse> <cfset appraisal=0></cfif>
<CFIF IsDefined("form.other") is True> <cfset other=#other#> <cfelse> <cfset other=0></cfif>
 --->
	<CFFORM NAME="frm" ACTION="./form_title_request_addr_verify.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&title=#title#&property=#property#&appraisal=#appraisal#&other=#other#&final_document_retrieval=#final_document_retrieval#&policy_recovery=#policy_recovery#&zip_id=0&zip_trigger=0&a_trigger=7&emp=#emp#&ordering_co=#ordering_co#" ENCTYPE="multipart/form-data" METHOD=POST>

	<center>

				<table width=607 cellpadding=1 cellspacing=1 border=0 bgcolor=f1f1f1>
					<tr>
						<td width=607 colspan=3  bgcolor="f1f1f1" align=center>
							<FONT FACE=ARIAL SIZE=2 color="blue">
							Enter the City, State AND Zip Code for this property.  If you do not know the Zip Code, you may enter "0" and our web system will calculate the <u><b>Zip Code</b></u> and the <u><b>County</b></u> for the property.
							<p>
						</td>
					</tr>

					<tr>
						<td width=305  bgcolor="f1f1f1" align=center>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							City:
						</td>
						<td width=114  bgcolor="f1f1f1" align=center>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							State:
						</td>
					<td width=414  bgcolor="f1f1f1" align=left>
							<FONT FACE=ARIAL SIZE=1 color="gray">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Zip:
						</td>
					</tr>


<CFIF #zip_trigger# EQ "1">
					<tr>
						<td width=305  bgcolor="f1f1f1" align=center>
							<CFINPUT TYPE="Text" NAME="pcity" VALUE="#pcity1#" <!---REQUIRED="Yes" Message="You must enter a CITY"---> SIZE=19 MAXLENGTH=25
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" >
								</td>
						<td width=114  bgcolor="f1f1f1" align=center>
							<select name="pstate" onchange="stateresult()"
									size="1"
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;
									float: none;"
									rows="3"
									cols="45"
									>
					<CFOUTPUT QUERY="read_state_list">
					
					<CFIF #st_abbrev# EQ "#pstate1#">
					<option value="#st_abbrev#" SELECTED>#st_abbrev#</option>
					<CFELSE>
					<option value="#st_abbrev#">#st_abbrev#</option>
					</CFIF>
					
					</CFOUTPUT>
								</select>

					</td>
					<td width=405  bgcolor="f1f1f1" align=center>
							<CFINPUT TYPE="Text" NAME="pzip" VALUE="#pzip1#" <!---REQUIRED="Yes" Message="You must enter a zip code"---> SIZE=19 MAXLENGTH=25
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" > <FONT FACE=ARIAL SIZE=1 color="gray">(enter 0 if unknown)
								</td>

					</tr>


<CFELSE>
					<tr>
						<td width=305  bgcolor="f1f1f1" align=center>
							<CFINPUT TYPE="Text" NAME="pcity" <!--- REQUIRED="Yes" Message="You must enter a CITY"---> SIZE=19 MAXLENGTH=25
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" >
						</td>
						<td width=114  bgcolor="f1f1f1" align=center>

							<select name="pstate" onchange="stateresult()"
									size="1"
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;
									float: none;"
									rows="3"
									cols="45"
									>
					<CFOUTPUT QUERY="read_state_list">

<option value="#st_abbrev#">#st_abbrev#</option>


					</CFOUTPUT>
								</select>

					</td>
					<td width=405  bgcolor="f1f1f1" align=center>
							<CFINPUT TYPE="Text" NAME="pzip" <!---REQUIRED="Yes" Message="You must enter a zip code"---> SIZE=19 MAXLENGTH=25
									style="font-size: 9;
									font-family: verdana;
									font-style: normal;
									color: 003F1E;
									background-color: E4E3E3;
									border-color: white;
									border-left-width: thin;
									border-right-width: thin;
									border-top-width: thin;
									border-bottom-width: thin;
									border-width: thin;
									border-style: bar;
									clear: none;" > <FONT FACE=ARIAL SIZE=1 color="gray">(enter 0 if unknown)
								</td>
					</tr>

		</CFIF>

		<!--- =================================== --->
		<!--- ===/ Property  Info [ FIRST ]  \=== --->
		<!--- =================================== --->
		<!---FNMA: File Read :Start :2/4/13--->
<cfif Isdefined("URL.Title") AND #Url.Title# EQ 1>
<cfif session.comp_id eq 6780 or  session.comp_id eq 7218 or  session.comp_id eq 7713 or  session.comp_id eq 1754 or  session.comp_id eq 8668 or  session.comp_id eq 8669 or  session.comp_id eq 11949>
<tr><td  colspan=7 bgcolor="ffffff" align=center><br>
<img src="./images/or.gif"></td></tr>
			<tr>
						<td  colspan=7 bgcolor="f1f1f1" align=center>
							<FONT FACE=ARIAL SIZE=2 color="blue">
							 <BR><BR>Alternatively, you can simply upload a standard Fannie Mae .FNM file
					by clicking the Browse button<BR>
							 <input type="file" id="fileToBrowseNameId" name="fileToBrowseName" style='width:400' ><br>
<br>

							 
							<p>
						</td>
					</tr>
					
				<tr>
				<td align="center">
					<!--- Fnm file Read.--->
				</td>
				
			</tr>
			<!---FNMA: File Read :End:2/4/13--->
<cfelse>
<input type="hidden" id="fileToBrowseNameId" name="fileToBrowseName" value="">
</cfif>
</cfif>
</table>

</center></p>
<p>
		</TD>
	</TR>

		<tr><td width=770 align=center valign=bottom>
			<NOBR>
			<cfoutput><a href="https://#cgi.server_name#/client_acct_mgt.cfm?comp_id=#comp_id#&user_id_1=#USER_ID_1#&lo_id=#lo_id#&ordering_co=#ordering_co#"><img src="./images/button_go_back.gif" border=0 ALT="Go to main menu"></a>
			</cfoutput>
			<!---<input type=image border=0 src="./images/button_continue.gif"></NOBR>---> <!---2/4/13--->
			<a href="javascript:void(0);" onClick="submitFormPage();" style="text-decoration:none" border="0">
			
			<input type=image border=0 src="./images/button_continue.gif" onclick="submitFormPage();"></a>
		
		</td></tr>			

</CFFORM>

</TABLE>
		<tr><td width=780 align=left valign=bottom><IMG src="./images/bottom.gif" width = "780"></td></tr></TBODY></TABLE>
</CENTER>

<script type="text/javascript">



  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-195021-17']);

  _gaq.push(['_trackPageview']);



  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'https://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();



</script>

</body>
</html>