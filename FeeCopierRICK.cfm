

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Copy Fees</title>
<style type="text/css" media="screen">
<!-- 
body, TD {
margin: 3;
padding: 3;
font: 10px verdana, arial, sans-serif;
}
input {
margin: 3;
padding: 3;
font: 9px verdana, arial, sans-serif;
}
select, option {
margin: 3;
padding: 3;
font: 14px verdana, arial, sans-serif;
}
.header {

font: 14px verdana, arial, sans-serif;
}
-->
</style>
<style>
table {
       background-attachment: scroll;
       background-color: ##CCCCCC;
       height: auto;
       border: 1px solid #data_table_border_color#;
}
TR {
       font-family: Arial, sans-serif;
       font-size: 10px;
       font-style: normal;
       line-height: 19px;
       color: ##00066;
       text-decoration: none;
       text-align: left;
       vertical-align: top;
       background-color: ##FFFFFF;
}
.data {
       font-family: Arial, sans-serif;
       font-size: 10px;
       font-style: normal;
       line-height: 19px;
       color: ##00066;
       text-decoration: none;
       text-align: left;
       vertical-align: top;
       background-color: ##FFFFFF;
}
OPTION, SELECT {
       font-family: Arial, sans-serif;
       font-size: 10px;
       font-style: normal;
       line-height: 19px;
       color: ##00066;
       text-decoration: none;
       text-align: left;
       vertical-align: top;
       background-color: ##FFFFFF;
}
.data_header {
       font-family: Arial, sans-serif;
       font-size: 10px;
       font-style: normal;
       line-height: 19px;
       color: ##FFFFFF;
       text-decoration: bold;
       text-align: left;
       vertical-align: top;
       background-color: #data_table_header_bgcolor#;
}
</style>

<!--- rick added toid_alt to this check --->
<script>
	function validate()
	{
		 
	   if(document.getElementById("toid").value == "" && document.getElementById("toid_alt").value == "")
	   {
	      alert("Please select a company from drop downlist"); // prompt user
	      document.getElementById("toid").focus(); //set focus back to control
	      return false;
	   }
	   if(document.getElementById("State").value == "")
	   {
	      alert("Please select state from drop downlist"); // prompt user
	      document.getElementById("State").focus(); //set focus back to control
	      return false;
	   }
	}

</script>
</head>


<body>


<table width="100%" cellpadding=0 cellspacing=0 border=0>
<tr><td align="left" valign="middle" style="font-size: 28px; color:#99CCCC;" width="85%"><strong>Copy Fees from One Client to Another</strong></td>
<td align="right"><table width="300" cellpadding=0 cellspacing=0 border=0>
<tr>
<td align="center" style="font-size: 13px; color:#555FAA"><strong>Monkeywork Elimination Tools</td>
</tr> 
<tr>
<td align="right"><hr style="size:1;"></td>
</tr>
<tr>
<td align="center" style="font-size: 9px; color:#555FAA">justifying our existence since 2005</td>
</tr> 
</table>
</td></tr>
</table>

</td></tr>
</table>

<cfparam name="form.submit" default="">
<cfparam name="form.fromid" default="0">
<cfparam name="form.toid" default="0">


<CFQUERY datasource="#request.dsn#" name="get_all_State">
       Select distinct a_states from Company_Billing_States_HUD2010 order by a_states
</CFQUERY>    

<!---<CFQUERY DATASOURCE="#request.dsn#" name="get_all_companies" cachedwithin="#CreateTimeSpan(0, 6, 0, 0)#">--->
<CFQUERY DATASOURCE="#request.dsn#" name="get_all_companies">
	Select * from Companies where company <> '' and company IS NOT NULL order by company
</CFQUERY>
<cfif form.submit neq "">
	
		<cfobject type="component" name="feeCopierObj" component="cfc.FeeCopierRICK">
		<cfset Tocompany="">
	    <cfset default_id = ListGetAt(form.fromid, 1, "-")>
		
		<!--- rick change --->
		<cfif IsDefined("form.toid_alt") and form.toid_alt neq "">
			<cfset toIdlist=form.toid_alt>
		<cfelse>
			<cfset toIdlist=form.toid>
		</cfif>
			
		<cfif IsDefined("form.fromid_alt") and form.fromid_alt neq "">
			<cfset form.fromid=form.fromid_alt>
		</cfif>
		<!--- end rick change --->
			
			<cfset stateList=form.State>

			<Cfset toCompany =feeCopierObj.mainProcessing(form.fromid,toIdlist,stateList)>
			<!--- For Testing Purpose call the following and comment above function call----
				<Cfset toCompany =feeCopierObj.mainProcessing(1822,"1821,1823","MD,VA,WV")>
			---> 
       <cfset message = "Fees copied from " & #ListGetAt(form.fromid, 1, "-")# & " to " & #ListChangeDelims(Tocompany,",")# & "">
</cfif>

<form action="#cgi.script_name#" method="post" name="form">
<table cellpadding="4" cellspacing="1" width="40%">




<tr class="data_header">
    <td align="left">Select a Company to Copy Line Costs From:<BR>
 		<select name="fromid" id="fromid" required="true">
       		<cfoutput query="get_all_companies">
       			<option value="#ID#-#Company#" <cfif ListGetAt(form.fromid, 1, "-") eq ID>selected</cfif>>#ID#-#Company#</option>
       		</cfoutput>
       </select>
<!--- rick change --->
<br>
<br>
Or type a company ID here to copy from this ID<br>
<input type="text" name="fromid_alt" id="fromid_alt" size=5 maxlength=8>
<!--- end rick change --->
       
     </td >
	 <td align="left">
	 	
	 </td>
</tr>
<tr class="data_header">
    <td align="left">To:<BR>
    	<select name="toid" id="toid" size=25 multiple>
       		<cfoutput query="get_all_companies">
       			<option VALUE=#ID# >#ID#-#Company#</option>
       		</cfoutput>
       </select>
<!--- rick change --->
<br>
<br>
Or paste company IDs here, separated by commas<br>
<input type="text" name="toid_alt" id="toid_alt" size=75 maxlength=2000>
<!--- end rick change --->

	</td>
	<td align="left">State:<BR>
	    <select name="state" id="state" size=25 multiple required="true">
	    	<OPTION VALUE="ALL" selected="">ALL</OPTION>
	    		<cfoutput query="get_all_State">
	       			<option VALUE=#a_states# >#a_states#</option>
	    		</cfoutput>
	     </select>
     </td>
</tr>
<tr class="data_header">
	<td align="left" colspan="2">
		<input type="submit" name="submit" onclick="return validate();" value="Copy Line Costs">
	</td>
	<td>
	 </td>
</tr>
</table>
<table>
<tr class="data_header">
	<td align="left">
		<cfif form.submit neq "">
			<cfoutput>#message#</cfoutput>
		</cfif>	
	</td>
</tr>
</table>

</form><br>
</body>
</html>
