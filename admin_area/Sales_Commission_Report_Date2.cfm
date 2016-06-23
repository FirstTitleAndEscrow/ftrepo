<CFPARAM NAME="a_trigger" DEFAULT="0">
<CFPARAM NAME="form.startdate" DEFAULT="">
<CFPARAM NAME="form.enddate" DEFAULT="">
<CFQUERY datasource="#request.dsn#" NAME="all_companies">
SELECT c.id, c.Company
FROM Companies c
where c.test_account = 0
and c.streamline_client <> 1
and c.a_status = 1
order by c.Company
</cfquery>

<CFQUERY datasource="#request.dsn#" NAME="all_sales_people">
SELECT     ID, fname, lname, username, status
FROM         First_Admin
WHERE     (role_id = 24) AND (status = 1 OR
                      status = 'True') AND (va_employee IS NULL OR
                      va_employee = 0) AND (mi_employee IS NULL OR
                      mi_employee = 0) AND (mo_employee IS NULL OR
                      mo_employee = 0) AND (mi_flushing_employee IS NULL OR
                      mi_flushing_employee = 0) AND (tx_employee IS NULL OR
                      tx_employee = 0) AND (ft_fairfax_employee IS NULL OR
                      ft_fairfax_employee = 0) AND (ID NOT IN (327, 264, 450)) OR
                      (ID = 319) OR
                      (ID = 408)
					  or (ID = 59)
					  or (ID = 56)
					  or (ID = 294)
ORDER BY lname
</cfquery>
<cfparam name="form.clients" default="all">
<cfparam name="form.sales_people" default="all">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head><script language="JavaScript" src="calendar2.js"></script>
<title>Page title</title>
</head>
<body>
<CFFORM NAME="frm" ACTION="./Sales_Commission_Report_Result3.cfm?uid=#url.uid#" METHOD=POST>
<cfoutput>
<cfset bgcolor = 'efefef'>
    <table width="75%" Border="0">


        <TR>
            <td colspan="2">
                <B><Center>Sales Commission Report</center></B>
            </td>     
        </TR>
        <CFIF #a_trigger# eq "1">
        <TR>
            <td  colspan="2">
                <FONT FACE=verdana SIZE=3 color="red">
                <Center>You did not enter a start or end date.</center>
                </font>
            </td>     
        </TR>
        </CFIF>
        <CFIF #a_trigger# eq "2">
        <TR>
            <td  colspan="2">
                <FONT FACE=verdana SIZE=3 color="red">
                <Center>You did not enter a valid start or a valid end date.</center>
                </font>
            </td>     
        </TR>
        </CFIF>
        <TR>
            <td  colspan="2">
                <FONT FACE=verdana SIZE=2 color="red">
                <Center>Please enter your start and end dates by Clicking on each Calendar</center>
                </font>
            </td>     
        </TR>

    </table>    

<table  class="table_border">
<tr>
<td colspan=3 align="top" valign="left"><span class="table_header"><strong>Date Range</strong></span></td>
<td align="top" valign="left"><span class="table_header"><strong>Salesperson</strong></span></td>
<td align="top" valign="left"><span class="table_header"><strong>Client</strong></span></td>
</tr>
<tr>
<td align="bottom" valign="left"><span class="table_header">Start Date</span></td>
<td align="bottom">&nbsp;</td>
<td align="bottom" valign="left"><span class="table_header">End Date</span></td>
<td rowspan=3 align="top" valign="left"> <SELECT NAME="sales_people"	multiple		
								size="5" 
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
								
								<OPTION VALUE="All" <cfif form.sales_people eq 'All'>selected</cfif>>All</OPTION>
								<CFloop QUERY="all_sales_people"><OPTION VALUE="#all_sales_people.ID#" <cfif ListFindNoCase(form.sales_people, all_sales_people.ID, ',')>selected</cfif>>#all_sales_people.fname# #all_sales_people.lname#</OPTION></CFloop>			
							</SELECT></td>
<td rowspan=3 align="top" valign="left"><SELECT NAME="clients"	multiple		
								size="5" 
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
								
								<OPTION VALUE="All" <cfif form.clients eq 'All'>selected</cfif>>All</OPTION>
								<CFloop QUERY="all_companies"><OPTION VALUE="#all_companies.ID#" <cfif ListFindNoCase(form.clients, all_companies.ID, ',')>selected</cfif>>#all_companies.Company#</OPTION></CFloop>			
							</SELECT></td>
</tr>
<tr>
<td align="top" valign="left"><input type="Text" name="startdate" value="#form.startdate#">
				<a href="javascript:cal5.popup();"><img src="images/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick the start date"></a></td>
<td align="middle" valign="center"><span class="table_header">-</span></td>
<td align="top" valign="left"><input type="Text" name="enddate" value="#form.enddate#">
				<a href="javascript:cal6.popup();"><img src="images/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick the end date"></a></td>
</tr>
<tr>
<td  align="top" valign="left" colspan=3><input name="submit" type="submit" value="Refresh"></td>
</tr>
</table>
</cfoutput>
</CFFORM>
<script language="JavaScript">
			<!-- // create calendar object(s) just after form tag closed
				 // specify form element as the only parameter (document.forms['formname'].elements['inputname']);
				 // note: you can have as many calendar objects as you need for your application
				
				var cal5 = new calendar2(document.forms['frm'].elements['startdate']);
				cal5.year_scroll = true;
				cal5.time_comp = false;
				
				var cal6 = new calendar2(document.forms['frm'].elements['enddate']);
				cal6.year_scroll = true;
				cal6.time_comp = false;
				
			//-->
</script>	
<br>
<br>

</body>
</html>
