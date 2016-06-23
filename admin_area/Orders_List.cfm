<!---Get Customer Service Person's Name --->
<CFQUERY datasource="#request.dsn#" NAME= "read_user" >
	Select *  
	from First_Admin 
	where ID = #url.UID#
</CFQUERY>

<!---Company List --->
<CFQUERY datasource="#request.dsn#" NAME= "read_companies" >
	Select ID, Company 
	from Companies where 
	intCustServ = #URL.UID#
	Order by Company
</CFQUERY>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<script language="JavaScript" src="calendar2.js"></script>
<title>Company List</title>
</head>

<body>

<table width=780 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
		<td colspan=2 >
			<FONT FACE=ARIAL SIZE=2 >
			<CENTER><B>Orders By Client for <cfoutput>#read_user.fname# #read_user.lname#</cfoutput></B></CENTER>
		</TD>
	</TR>
<CFFORM NAME="frm" ACTION="./Orders_List_Result.cfm?uid=#url.uid#" METHOD=POST>
	<tr>
		<td bgcolor=d3d3d3 align=right valign=top>
			<FONT FACE=verdana SIZE=1 color="black">
			<CENTER><b>Clients</b></CENTER>
		</td>
	</tr>
	<tr>
		<td bgcolor=d3d3d3 align=left valign=top>
			<center>
			<SELECT NAME="company_id"			
				size="7" 
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
				multiple
				>
				<OPTION VALUE="ALL">All</OPTION>
					<CFOUTPUT QUERY="read_companies">
				<OPTION VALUE="#ID#">#Company#</OPTION>
					</CFOUTPUT>			
			</SELECT></center>
		</td>
	</tr>
	<tr>
		<td>
			    <b>FROM:  </b><input type="Text" name="startdate" value="">
				<a href="javascript:cal5.popup();"><img src="images/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick the start date"></a>	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<b>TO:  </b><input type="Text" name="enddate" value="">
				<a href="javascript:cal6.popup();"><img src="images/cal.gif" width="16" height="16" border="0" alt="Click Here to Pick the end date"></a>
		</td>
	</tr>
	<tr>
		<td bgcolor=d3d3d3 width="100%" align=center valign=top>
			<INPUT TYPE=image src="./images/button_proceed.gif" border=0> 	
		</td>
	</tr>
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
</table>
</body>
</html>
