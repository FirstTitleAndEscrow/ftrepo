<CFPARAM NAME="a_trigger" DEFAULT=0>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
<title>1st Title & Escrow, Inc. </title>
<!--- <SCRIPT LANGUAGE="JavaScript">

function checkAll(field)
{
for (i = 0; i < field.length; i++)
	field[i].checked = true ;
}

function uncheckAll(field)
{
for (i = 0; i < field.length; i++)
	field[i].checked = false ;
}

</script> --->



</head>

<BODY BGCOLOR="e1e1e1" TEXT="000000" LINK="FF0000" VLINK="800000" ALINK="FF00FF" BACKGROUND="?"  TopMargin=0 LeftMargin=0 MarginWidth=0 MarginHeight=0>

<CENTER>
<CENTER>

<cfif #a_trigger# eq 1>


<CFIF IsDefined("form.selectedDeed") is True>
 <cfif #form.selectedDeed# is 1>
 
  <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs = null
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA'
		
		</CFQUERY> 

		
<CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			
			SET selectedOrgs = 1
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA' and seq_num = 1
		
		</CFQUERY> 

<cfelseif #form.selectedDeed# is 10>
 
  <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs = null
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA'
		
		</CFQUERY> 
		
<CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			
			SET selectedOrgs = 10
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA' and seq_num = 1
		
		</CFQUERY> 

</cfif>
</cfif>
 <CFIF IsDefined("form.selectedDeed") is True>
 <cfif #form.selectedDeed# is 2>
  <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs = null
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA'
		
		</CFQUERY> 
 
 
<CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			
			SET selectedOrgs = 2
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA' and seq_num = 2
		
		</CFQUERY> 

 <cfelseif #form.selectedDeed# is 20>
  <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs = null
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA'
		
		</CFQUERY> 
 
 
<CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			
			SET selectedOrgs = 20
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA' and seq_num = 2
		
		</CFQUERY> 
</cfif>
</cfif>
<CFIF IsDefined("form.selectedDeed") is True>
 <cfif #form.selectedDeed# is 3>
 
  <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs = null
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA'
		
		</CFQUERY> 
 	
<CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			
			SET selectedOrgs = 3
		
			WHERE  title_id = #URL.rec_id# and type = 'DATA' and seq_num = 3
		
		</CFQUERY> 

 <cfelseif #form.selectedDeed# is 30>
 
  <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs = null
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA'
		
		</CFQUERY> 
 	
<CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			
			SET selectedOrgs = 30
		
			WHERE  title_id = #URL.rec_id# and type = 'DATA' and seq_num = 3
		
		</CFQUERY> 
</cfif>
</cfif>

<CFIF IsDefined("form.selectedDeed") is True>
 <cfif #form.selectedDeed# is 4>
  <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs = null
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA'
		
		</CFQUERY> 
 

<CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			
			SET selectedOrgs = 4
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA' and seq_num = 4
		
		</CFQUERY> 

 <cfelseif #form.selectedDeed# is 40>
  <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs = null
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA'
		
		</CFQUERY> 
 

<CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			
			SET selectedOrgs = 40
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA' and seq_num = 4
		
		</CFQUERY> 
</cfif>
</cfif>

<CFIF IsDefined("form.selectedDeed") is True>
 <cfif #form.selectedDeed# is 5>
  <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs = null
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA'
		
		</CFQUERY> 

<CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			
			SET selectedOrgs = 5
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA' and seq_num = 5
		
		</CFQUERY> 

 <cfelseif #form.selectedDeed# is 50>
  <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs = null
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA'
		
		</CFQUERY> 

<CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			
			SET selectedOrgs = 50
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA' and seq_num = 5
		
		</CFQUERY> 
</cfif>
</cfif>

<CFIF IsDefined("form.selectedDeed") is True>
 <cfif #form.selectedDeed# is 6>
  <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs = null
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA'
		
		</CFQUERY> 
 
<CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
		
			SET selectedOrgs = 6
		
			WHERE  title_id = #URL.rec_id# and type = 'DATA' and seq_num = 6
		
		</CFQUERY> 

 <cfelseif #form.selectedDeed# is 60>
  <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs = null
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA'
		
		</CFQUERY> 
 
<CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
		
			SET selectedOrgs = 60
		
			WHERE  title_id = #URL.rec_id# and type = 'DATA' and seq_num = 6
		
		</CFQUERY> 
</cfif>
</cfif>
<CFIF IsDefined("form.selectedDeed") is True>
 <cfif #form.selectedDeed# is 7>
  <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs = null
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA'
		
		</CFQUERY> 
 
<CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			
			SET selectedOrgs = 7
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA' and seq_num = 7
		
		</CFQUERY> 

 <cfelseif #form.selectedDeed# is 70>
  <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs = null
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA'
		
		</CFQUERY> 
 
<CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			
			SET selectedOrgs = 70
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA' and seq_num = 7
		
		</CFQUERY> 
</cfif>
</cfif> 
<CFIF IsDefined("form.selectedDeed") is True>
 <cfif #form.selectedDeed# is 8>
  <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs = null
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA'
		
		</CFQUERY> 
 
<CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			
			SET selectedOrgs = 8
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA' and seq_num = 8
		
		</CFQUERY> 

 <cfelseif #form.selectedDeed# is 80>
  <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs = null
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA'
		
		</CFQUERY> 
 
<CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			
			SET selectedOrgs = 80
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA' and seq_num = 8
		
		</CFQUERY> 
</cfif>
</cfif> 

<CFIF IsDefined("form.selectedDeed") is True>
 <cfif #form.selectedDeed# is 9>
  <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs = null
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA'
		
		</CFQUERY> 

<CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			
			SET selectedOrgs = 9
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA' and seq_num = 9
		
		</CFQUERY> 

 <cfelseif #form.selectedDeed# is 90>
  <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs = null
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA'
		
		</CFQUERY> 

<CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			
			SET selectedOrgs = 90
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA' and seq_num = 9
		
		</CFQUERY> 
</cfif>
</cfif> 
<CFIF IsDefined("form.selectedDeed") is True>
 <cfif #form.selectedDeed# is 10>
 
 <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs = null
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA'
		
		</CFQUERY> 
 
<CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			
			SET selectedOrgs = 10
			
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA' and seq_num = 10
		
		</CFQUERY> 

 <cfelseif #form.selectedDeed# is 100>
 
 <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs = null
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA'
		
		</CFQUERY> 
 
<CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			
			SET selectedOrgs = 100
			
			
			WHERE  title_id = #URL.rec_id# and type = 'DATA' and seq_num = 10
		
		</CFQUERY> 
</cfif>
</cfif> 

<CFIF IsDefined("form.selectedLien") is True>
 <cfif #form.selectedLien# is 1>
 
 <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs3 = 1
			WHERE  title_id = #URL.rec_id# and type = 'Lien' and seq_num = 1
		
		</CFQUERY> 
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien2") is True>
 <cfif #form.selectedLien2# is 2>
 
 <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs3 = 2
			WHERE  title_id = #URL.rec_id# and type = 'Lien' and seq_num = 2
		
		</CFQUERY> 
</cfif>
</cfif>

<CFIF IsDefined("form.selectedLien3") is True>
 <cfif #form.selectedLien3# is 3>
 
 <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs3 = 3
			WHERE  title_id = #URL.rec_id# and type = 'Lien' and seq_num = 3
		
		</CFQUERY> 
</cfif>
</cfif>
<CFIF IsDefined("form.selectedLien4") is True>
 <cfif #form.selectedLien4# is 4>
 
 <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs3 = 4
			WHERE  title_id = #URL.rec_id# and type = 'Lien' and seq_num = 4
		
		</CFQUERY> 
</cfif>
</cfif>
<CFIF IsDefined("form.selectedLien5") is True>
 <cfif #form.selectedLien5# is 5>
 
 <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs3 = 5
			WHERE  title_id = #URL.rec_id# and type = 'Lien' and seq_num = 5
		
		</CFQUERY> 
</cfif>
</cfif>
<CFIF IsDefined("form.selectedLien6") is True>
 <cfif #form.selectedLien6# is 6>
 
 <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs3 = 6
			WHERE  title_id = #URL.rec_id# and type = 'Lien' and seq_num = 6
		
		</CFQUERY> 
</cfif>
</cfif>
<CFIF IsDefined("form.selectedLien7") is True>
 <cfif #form.selectedLien7# is 7>
 
 <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs3 = 7
			WHERE  title_id = #URL.rec_id# and type = 'Lien' and seq_num = 7
		
		</CFQUERY> 
</cfif>
</cfif>
<CFIF IsDefined("form.selectedLien8") is True>
 <cfif #form.selectedLien8# is 8>
 
 <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs3 = 8
			WHERE  title_id = #URL.rec_id# and type = 'Lien' and seq_num = 8
		
		</CFQUERY> 
</cfif>
</cfif>
<CFIF IsDefined("form.selectedLien9") is True>
 <cfif #form.selectedLien9# is 9>
 
 <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs3 = 9
			WHERE  title_id = #URL.rec_id# and type = 'Lien' and seq_num = 9
		
		</CFQUERY> 
</cfif>
</cfif>
<CFIF IsDefined("form.selectedLien10") is True>
 <cfif #form.selectedLien10# is 10>
 
 <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs3 = 10
			WHERE  title_id = #URL.rec_id# and type = 'Lien' and seq_num = 10
		
		</CFQUERY> 
</cfif>
</cfif>


<CFIF IsDefined("form.selectedMortgage") is True>
 <cfif #form.selectedMortgage# is 1>
 
 <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs4 = 1
			WHERE  title_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 1
		
		</CFQUERY> 
</cfif>
</cfif>

<CFIF IsDefined("form.selectedMortgage2") is True>
 <cfif #form.selectedMortgage2# is 2>
 
 <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs4 = 2
			WHERE  title_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 2
		
		</CFQUERY> 
</cfif>
</cfif>

<CFIF IsDefined("form.selectedMortgage3") is True>
 <cfif #form.selectedMortgage3# is 3>
 
 <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs4 = 3
			WHERE  title_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 3
		
		</CFQUERY> 
</cfif>
</cfif>
<CFIF IsDefined("form.selectedMortgage4") is True>
 <cfif #form.selectedMortgage4# is 4>
 
 <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs4 = 4
			WHERE  title_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 4
		
		</CFQUERY> 
</cfif>
</cfif>
<CFIF IsDefined("form.selectedLien5") is True>
 <cfif #form.selectedLien5# is 5>
 
 <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs4 = 5
			WHERE  title_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 5
		
		</CFQUERY> 
</cfif>
</cfif>
<CFIF IsDefined("form.selectedMortgage6") is True>
 <cfif #form.selectedMortgage6# is 6>
 
 <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs4 = 6
			WHERE  title_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 6
		
		</CFQUERY> 
</cfif>
</cfif>
<CFIF IsDefined("form.selectedMortgage7") is True>
 <cfif #form.selectedMortgage7# is 7>
 
 <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs4 = 7
			WHERE  title_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 7
		
		</CFQUERY> 
</cfif>
</cfif>
<CFIF IsDefined("form.selectedMortgage8") is True>
 <cfif #form.selectedMortgage8# is 8>
 
 <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs4 = 8
			WHERE  title_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 8
		
		</CFQUERY> 
</cfif>
</cfif>
<CFIF IsDefined("form.selectedMortgage9") is True>
 <cfif #form.selectedMortgage9# is 9>
 
 <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs4 = 9
			WHERE  title_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 9
		
		</CFQUERY> 
</cfif>
</cfif>
<CFIF IsDefined("form.selectedMortgage10") is True>
 <cfif #form.selectedMortgage10# is 10>
 
 <CFQUERY datasource="#request.dsn#" >
		
			UPDATE title_ins_view
			SET 
			
			
			selectedOrgs4 = 10
			WHERE  title_id = #URL.rec_id# and type = 'Mortgage' and seq_num = 10
		
		</CFQUERY> 
</cfif>
</cfif>

</cfif>




<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=elelel>
	<tr>
		<td width=790 align=center valign=top>
		<CFINCLUDE TEMPLATE="./includes/title_top_nav.cfm">
<table width=790 cellpadding=1 cellspacing=1 border=0 bgcolor=white>
	<tr>
			<td width=790 align=left valign=top bgcolor=green>
				<FONT FACE=ARIAL SIZE=2 color="white">
				<CENTER><B>Abstractor Data Information</B></CENTER>
			</TD>
		</TR>
	<tr>
		<td width=790 align=center valign=top bgcolor=e1e1e1>
<CFFORM name = "frm" METHOD=POST ACTION="./vendor_abstract_view_data.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#url.rec_id#&a_trigger=1&company_id=0">



<CFQUERY datasource="#request.dsn#" NAME="read_sent">		
				SELECT *
				FROM title_ins_view
				Where title_Id = #URL.rec_id# and type = 'DATA' and selectedOrgs is not null
				
</CFQUERY>
<cfif #read_sent.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<td width=140 align=left valign=top bgcolor=e1e1e1>
	
		<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>submitted data</font></a>	
			</td>		
	<td width=290 align=left valign=top bgcolor=e1e1e1> 
		</td>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
		</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_DEED">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'DATA'
				
</CFQUERY>


<cfif #read_deed.recordcount# GT 0>



<CFQUERY datasource="#request.dsn#" NAME="read_seq_num1">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'DATA' and seq_num = 1
				
</CFQUERY>



<cfif #read_seq_num1.recordcount# GT 0 AND #read_seq_num1.complete# EQ 1>

<CFOUTPUT QUERY="read_seq_num1">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
	
			

		
<cfif #status# EQ "U">
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated data 1</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=10> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 1<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new data 1</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=1> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 1<br>
		</td>
		</cfif>
				
	
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
	</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num2">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'DATA' and seq_num = 2
				
</CFQUERY>

<cfif #read_seq_num2.recordcount# GT 0 AND #read_seq_num2.complete# EQ 1>
<CFOUTPUT QUERY="read_seq_num2">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
		<cfif #status# EQ "U">
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated data 2</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=20> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 2<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new data 2</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=2> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 2<br>
		</td>
		</cfif>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num3">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'DATA' and seq_num = 3
				
</CFQUERY>

<cfif #read_seq_num3.recordcount# GT 0 AND #read_seq_num3.complete# EQ 1>

<CFOUTPUT QUERY="read_seq_num3">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
		<cfif #status# EQ "U">
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated data 3</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=30> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 3<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new data 3</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=3> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 3<br>
		</td>
		</cfif>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num4">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'DATA' and seq_num = 4
				
</CFQUERY>
<cfif #read_seq_num4.recordcount# GT 0 AND #read_seq_num4.complete# EQ 1>

<CFOUTPUT QUERY="read_seq_num4">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
			<cfif #status# EQ "U">
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated data 4</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=40> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 4<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new data 4</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=4> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 4<br>
		</td>
		</cfif>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num5">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'DATA' and seq_num = 5
				
</CFQUERY>
<cfif #read_seq_num5.recordcount# GT 0 AND #read_seq_num5.complete# EQ 1>

<CFOUTPUT QUERY="read_seq_num5">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<cfif #status# EQ "U">
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated data 5</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=50> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 5<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new data 5</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=5> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 5<br>
		</td>
		</cfif>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num6">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'DATA' and seq_num = 6
				
</CFQUERY>
<cfif #read_seq_num6.recordcount# GT 0 AND #read_seq_num6.complete# EQ 1>

<CFOUTPUT QUERY="read_seq_num6">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<cfif #status# EQ "U">
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated data 6</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=60> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 6<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new data 6</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=6> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 6<br>
		</td>
		</cfif>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num7">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'DATA' and seq_num = 7
				
</CFQUERY>
<cfif #read_seq_num7.recordcount# GT 0 AND #read_seq_num7.complete# EQ 1>

<CFOUTPUT QUERY="read_seq_num7">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<cfif #status# EQ "U">
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated data 7</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=70> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 7<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new data 7</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=7> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 7<br>
		</td>
		</cfif>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif> 
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num8">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'DATA' and seq_num = 8
				
</CFQUERY>

<cfif #read_seq_num8.recordcount# GT 0 AND #read_seq_num8.complete# EQ 1>
<CFOUTPUT QUERY="read_seq_num8">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<cfif #status# EQ "U">
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated data 8</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=80> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 8<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new data 8</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=8> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 8<br>
		</td>
		</cfif>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num9">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'DATA' and seq_num = 9
				
</CFQUERY>

<cfif #read_seq_num9.recordcount# GT 0 AND #read_seq_num9.complete# EQ 1>
<CFOUTPUT QUERY="read_seq_num9">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<cfif #status# EQ "U">
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated data 9</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=90> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 9<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new data 9</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=9> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 9<br>
		</td>
		</cfif>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num10">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'DATA' and seq_num = 10
				
</CFQUERY>
<cfif #read_seq_num10.recordcount# GT 0 AND #read_seq_num10.complete# EQ 1>

<CFOUTPUT QUERY="read_seq_num10">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
			<cfif #status# EQ "U">
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated data 10</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=100> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 10<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new data 10</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=10> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 10<br>
		</td>
		</cfif>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	

</cfif>
</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_LIEN">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'LIEN'
				
</CFQUERY>


<cfif #read_LIEN.recordcount# GT 0>



<CFQUERY datasource="#request.dsn#" NAME="read_seq_num1">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'LIEN' and seq_num = 1
				
</CFQUERY>

<cfif #read_seq_num1.recordcount# GT 0 AND #read_seq_num1.complete# EQ 1>

<CFOUTPUT QUERY="read_seq_num1">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				
		<cfif #read_lien.status# EQ "U">
		<td width=140 align=left valign=top bgcolor=e1e1e1>
		<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated lien 1</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien" VALUE=10> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 1<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new lien 1</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien" VALUE=1> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 1<br>
		</td>
		</cfif>
				
	
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
	</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num2">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'LIEN' and seq_num = 2
				
</CFQUERY>

<cfif #read_seq_num2.recordcount# GT 0 AND #read_seq_num2.complete# EQ 1>
<CFOUTPUT QUERY="read_seq_num2">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<cfif #read_lien.status# EQ "U">
		<td width=140 align=left valign=top bgcolor=e1e1e1>
		<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated lien 2</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien" VALUE=20> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 2<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new lien 2</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien" VALUE=2> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 2<br>
		</td>
		</cfif>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num3">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'LIEN' and seq_num = 3
				
</CFQUERY>

<cfif #read_seq_num3.recordcount# GT 0 AND #read_seq_num3.complete# EQ 1>

<CFOUTPUT QUERY="read_seq_num3">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<cfif #read_lien.status# EQ "U">
		<td width=140 align=left valign=top bgcolor=e1e1e1>
		<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated lien 3</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien" VALUE=30> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 3<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new lien 3</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien" VALUE=3> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 3<br>
		</td>
		</cfif>
	</tr>
</table>
		
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num4">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'LIEN' and seq_num = 4
				
</CFQUERY>
<cfif #read_seq_num4.recordcount# GT 0 AND #read_seq_num4.complete# EQ 1>

<CFOUTPUT QUERY="read_seq_num4">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<cfif #read_lien.status# EQ "U">
		<td width=140 align=left valign=top bgcolor=e1e1e1>
		<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated lien 4</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien" VALUE=40> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 4<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new lien 4</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien" VALUE=4> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 4<br>
		</td>
		</cfif>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num5">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'LIEN' and seq_num = 5
				
</CFQUERY>
<cfif #read_seq_num5.recordcount# GT 0 AND #read_seq_num5.complete# EQ 1>

<CFOUTPUT QUERY="read_seq_num5">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<cfif #read_lien.status# EQ "U">
		<td width=140 align=left valign=top bgcolor=e1e1e1>
		<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated lien 5</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien" VALUE=50> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 5<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new lien 5</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien" VALUE=5> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 5<br>
		</td>
		</cfif>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num6">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'LIEN' and seq_num = 6
				
</CFQUERY>
<cfif #read_seq_num6.recordcount# GT 0 AND #read_seq_num6.complete# EQ 1>

<CFOUTPUT QUERY="read_seq_num6">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<cfif #read_lien.status# EQ "U">
		<td width=140 align=left valign=top bgcolor=e1e1e1>
		<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated lien 6</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien" VALUE=60> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 6<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new lien 6 </font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien" VALUE=6> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 6<br>
		</td>
		</cfif>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num7">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'LIEN' and seq_num = 7
				
</CFQUERY>
<cfif #read_seq_num7.recordcount# GT 0 AND #read_seq_num7.complete# EQ 1>

<CFOUTPUT QUERY="read_seq_num7">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<cfif #read_lien.status# EQ "U">
		<td width=140 align=left valign=top bgcolor=e1e1e1>
		<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated lien 7</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien" VALUE=70> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 7<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new lien 7</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien" VALUE=7> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 7<br>
		</td>
		</cfif>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num8">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'LIEN' and seq_num = 8
				
</CFQUERY>

<cfif #read_seq_num8.recordcount# GT 0 AND #read_seq_num8.complete# EQ 1>
<CFOUTPUT QUERY="read_seq_num8">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<cfif #read_lien.status# EQ "U">
		<td width=140 align=left valign=top bgcolor=e1e1e1>
		<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated lien 8</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien" VALUE=80> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 8<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new lien 8</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien" VALUE=8> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 8<br>
		</td>
		</cfif>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num9">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'LIEN' and seq_num = 9
				
</CFQUERY>

<cfif #read_seq_num9.recordcount# GT 0 AND #read_seq_num9.complete# EQ 1>
<CFOUTPUT QUERY="read_seq_num9">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<cfif #read_lien.status# EQ "U">
		<td width=140 align=left valign=top bgcolor=e1e1e1>
		<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated lien 9</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien" VALUE=90> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 9<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new lien 9</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien" VALUE=9> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 9<br>
		</td>
		</cfif>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num10">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'LIEN' and seq_num = 10
				
</CFQUERY>
<cfif #read_seq_num10.recordcount# GT 0 AND #read_seq_num10.complete# EQ 1>

<CFOUTPUT QUERY="read_seq_num10">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<cfif #read_lien.status# EQ "U">
		<td width=140 align=left valign=top bgcolor=e1e1e1>
		<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated lien 10</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien" VALUE=100> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 10<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new lien 10</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien" VALUE=10> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 10<br>
		</td>
		</cfif>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
	
	
	</cfif>


</cfif>


<CFQUERY datasource="#request.dsn#" NAME="read_mortgage">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'MORTGAGE'
				
</CFQUERY>


<cfif #read_mortgage.recordcount# GT 0>



<CFQUERY datasource="#request.dsn#" NAME="read_seq_num1">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 1
				
</CFQUERY>

<cfif #read_seq_num1.recordcount# GT 0 AND #read_seq_num1.complete# EQ 1>

<CFOUTPUT QUERY="read_seq_num1">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				
		<cfif #read_mortgage.status# EQ "U">
		<td width=140 align=left valign=top bgcolor=e1e1e1>
		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated mortgage 1</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage" VALUE=10> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 1<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new mortgage 1</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage" VALUE=1> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 1<br>
		</td>
		</cfif>
				
	
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
	</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num2">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 2
				
</CFQUERY>

<cfif #read_seq_num2.recordcount# GT 0 AND #read_seq_num2.complete# EQ 1>
<CFOUTPUT QUERY="read_seq_num2">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<cfif #read_mortgage.status# EQ "U">
		<td width=140 align=left valign=top bgcolor=e1e1e1>
		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated mortgage 2</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage" VALUE=20> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 2<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new mortgage 2</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage" VALUE=2> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 2<br>
		</td>
		</cfif>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num3">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 3
				
</CFQUERY>

<cfif #read_seq_num3.recordcount# GT 0 AND #read_seq_num3.complete# EQ 1>

<CFOUTPUT QUERY="read_seq_num3">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<cfif #read_mortgage.status# EQ "U">
		<td width=140 align=left valign=top bgcolor=e1e1e1>
		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated mortgage 3</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage" VALUE=30> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 3<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new mortgage 3</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage" VALUE=3> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 3<br>
		</td>
		</cfif>
	</tr>
</table>
		
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num4">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 4
				
</CFQUERY>
<cfif #read_seq_num4.recordcount# GT 0 AND #read_seq_num4.complete# EQ 1>

<CFOUTPUT QUERY="read_seq_num4">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<cfif #read_mortgage.status# EQ "U">
		<td width=140 align=left valign=top bgcolor=e1e1e1>
		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated mortgage 4</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage" VALUE=40> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 4<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new mortgage 4</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage" VALUE=4> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 4<br>
		</td>
		</cfif>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num5">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 5
				
</CFQUERY>
<cfif #read_seq_num5.recordcount# GT 0 AND #read_seq_num5.complete# EQ 1>

<CFOUTPUT QUERY="read_seq_num5">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<cfif #read_mortgage.status# EQ "U">
		<td width=140 align=left valign=top bgcolor=e1e1e1>
		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated mortgage 5</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage" VALUE=50> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 5<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new mortgage 5</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage" VALUE=5> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 5<br>
		</td>
		</cfif>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num6">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 6
				
</CFQUERY>
<cfif #read_seq_num6.recordcount# GT 0 AND #read_seq_num6.complete# EQ 1>

<CFOUTPUT QUERY="read_seq_num6">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<cfif #read_mortgage.status# EQ "U">
		<td width=140 align=left valign=top bgcolor=e1e1e1>
		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated mortgage 6</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage" VALUE=60> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 6<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new mortgage 6</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage" VALUE=6> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 6<br>
		</td>
		</cfif>
	</tr>
</table>
		
		</CFOUTPUT> 	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num7">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 7
				
</CFQUERY>
<cfif #read_seq_num7.recordcount# GT 0 AND #read_seq_num7.complete# EQ 1>

<CFOUTPUT QUERY="read_seq_num7">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr><!--- <td width=65 align=center valign=middle bgcolor=d1d1d1>
					<font face=verdana size=1 color=blue>
						<b>#u_Fname# #u_LName#</b>	</td> --->
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<cfif #read_mortgage.status# EQ "U">
		<td width=140 align=left valign=top bgcolor=e1e1e1>
		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated mortgage 7</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage" VALUE=70> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 7<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new mortgage 7</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage" VALUE=7> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 7<br>
		</td>
		</cfif>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

 <CFQUERY datasource="#request.dsn#" NAME="read_seq_num8">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 8
				
</CFQUERY>

<cfif #read_seq_num8.recordcount# GT 0 AND #read_seq_num8.complete# EQ 1>
<CFOUTPUT QUERY="read_seq_num8">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<cfif #read_mortgage.status# EQ "U">
		<td width=140 align=left valign=top bgcolor=e1e1e1>
		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated mortgage 8</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage" VALUE=80> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 8<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new mortgage 8</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage" VALUE=8> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 8<br>
		</td>
		</cfif>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num9">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 9
				
</CFQUERY>

<cfif #read_seq_num9.recordcount# GT 0 AND #read_seq_num9.complete# EQ 1>
<CFOUTPUT QUERY="read_seq_num9">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<cfif #read_mortgage.status# EQ "U">
		<td width=140 align=left valign=top bgcolor=e1e1e1>
		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated mortgage 9</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage" VALUE=90> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 9<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new mortgage 9</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage" VALUE=9> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 9<br>
		</td>
		</cfif>
	</tr>
</table>
		
		</CFOUTPUT> 	
	
		</cfif>
	

<CFQUERY datasource="#request.dsn#" NAME="read_seq_num10">		
				SELECT *
				FROM title_ins_add
				Where title_Id = #URL.rec_id# and type = 'MORTGAGE' and seq_num = 10
				
</CFQUERY>
<cfif #read_seq_num10.recordcount# GT 0 AND #read_seq_num10.complete# EQ 1>

<CFOUTPUT QUERY="read_seq_num10">

	<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
		<tr>
			<td width=255 align=left valign=top bgcolor=e1e1e1>

		
			<table width=255 cellpadding=1 cellspacing=1 border=0 >
				<tr>
						<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Date#</b>				
					</td>
					<td width=65 align=center valign=middle bgcolor=d1d1d1>
						<font face=verdana size=1 color=blue>
						<b>#insert_Time#</b>				
					</td>
					
				<tr>
			
			
			</table>
				<cfif #read_mortgage.status# EQ "U">
		<td width=140 align=left valign=top bgcolor=e1e1e1>
		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>updated mortgage 10</font></a>	
			</td>	
			<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage" VALUE=100> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 10<br>
		</td>
			<cfelse>
			<td width=140 align=left valign=top bgcolor=e1e1e1>
			<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>new mortgage 10</font></a>	
		</td>	
		<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage" VALUE=10> 
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 10<br>
		</td>
		</cfif>
	</tr>
</table>
		
		
		</CFOUTPUT> 	
	
	
	
	</cfif>
	

</cfif>

			</td>
		</tr>		
</table>

<!--- <nobr><input type="button" name="CheckAll" value="Check All"
onClick="checkAll(document.frm.selectedDeed)">
<input type="button" name="UnCheckAll" value="Uncheck All"
onClick="uncheckAll(document.frm.selectedDeed)"></nobr>
--->
<br><br>
Click this button to merge <INPUT TYPE=IMAGE SRC="./images/button_merge.gif" border=0>  
			
</cfform>

</td>
</tr>

	</table>

			
			</TD>
		</TR>

	</table>

</BODY>
</HTML>
	
	
	