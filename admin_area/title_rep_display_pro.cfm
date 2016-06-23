
<cfparam name="buyer_lname" default="">
<cfparam name="buyer_fname" default="">
<cfparam name="seller_fname" default="">
<cfparam name="seller_lname" default="">
<cfparam name="comments" default="">
<cfparam name="events" default=""> 
<cfparam name="appraisal_status" default="">
<cfparam name="sortorder" default=""> 
<cfparam name="user_id" default="">
<cfparam name="oda_month" default="">
<cfparam name="oda_day" default="">
<cfparam name="oda_year" default="">
<cfparam name="title_id" default="">
<cfparam name="prop_id" default="">
<cfparam name="order_id" default="">
<cfparam name="abstract_id" default="">
<cfparam name="abstract_file" default="">
<cfparam name="icl_file" default="">
<cfparam name="closer_file" default="">
<cfparam name="company_id" default=""> 
<cfparam name="a_trigger" default="0">
<CFSET r_count = "0">


	
		

		
		

	
	


	
	<CFIF '#update#' EQ 'yes'>
	
				<CFQUERY datasource="#request.dsn#">
				UPDATE property
				SET  appraisal_status = '#appraisal_status#',
					comments = '#comments#'
				WHERE prop_id = '#prop_id#'
				</CFQUERY>

		</cfif>
		
		
		
		<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>



<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=gray>
	<tr>
		<td width=820 align=center valign=top>
		
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
		<td width=820 align=center valign=top bgcolor=e1e1e1>
		
	
<!--- =================================== --->
<!--- ===/    [ CLIENT INFO ]  TOP   \=== --->
<!--- =================================== --->
<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>

	
	<tr>
			<td width=820 align=left valign=top bgcolor=navy>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Property Report Update</B></CENTER>
			</TD>
		</TR>


		
		
	<tr>
		<td width=820 align=left valign=top bgcolor=e1e1e1>

<!--- =================================== --->
<!--- ===/    [ Search Results ]     \=== --->
<!--- =================================== --->

	<!--- <CFIF #r_count# NEQ "0"> --->


<table width=820 cellpadding=1 cellspacing=1 border=0 bgcolor=BFBFBF>
	<tr>
			<td width=820 align=left valign=top bgcolor=d3d3d3>
				<FONT FACE=ARIAL SIZE=1 color="black">
				<CENTER><B>O r d e r &nbsp;&nbsp;&nbsp;U p d a t e d <br><FONT FACE=ARIAL SIZE=2 color="blue">
				Order <CFOUTPUT> ( <b>#prop_id#</b> ) </cfoutput>has been updated.
				</CENTER>
</td></tr></table></td></tr></table>



</td></tr></table></td></tr></table></center>

</BODY>
</HTML>
		
		
		
		