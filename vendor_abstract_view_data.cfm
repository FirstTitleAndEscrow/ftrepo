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
<CFIF IsDefined("form.selectedMortgage5") is True>
 <cfif #form.selectedMortgage5# is 5>

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
		<td width=140 align=left valign=top bgcolor=e1e1e1>



<cfif #status# EQ "U">
		<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Data 1</font></a>
			<cfelse>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Data 1</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=1>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 1<br>
		</td>
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
		<td width=140 align=left valign=top bgcolor=e1e1e1>



<cfif #status# EQ "U">
		<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Data 2</font></a>
			<cfelse>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Data 2</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=2>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 2<br>
		</td>
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
		<td width=140 align=left valign=top bgcolor=e1e1e1>



<cfif #status# EQ "U">
		<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Data 3</font></a>
			<cfelse>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Data 3</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=3>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 3<br>
		</td>
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
			<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #status# EQ "U">
		<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Data 4</font></a>
			<cfelse>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Data 4</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=4>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 4<br>
		</td>
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
				<td width=140 align=left valign=top bgcolor=e1e1e1>

		<cfif #status# EQ "U">
		<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Data 5</font></a>
			<cfelse>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Data 5</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=5>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 5<br>
		</td>
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
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #status# EQ "U">
		<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Data 6</font></a>
			<cfelse>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Data 6</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=6>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 6<br>
		</td>
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
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #status# EQ "U">
		<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Data 7</font></a>
			<cfelse>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Data 7</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=7>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 7<br>
		</td>
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
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #status# EQ "U">
		<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Data 8</font></a>
			<cfelse>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Data 8</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=8>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 8<br>
		</td>
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
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #status# EQ "U">
		<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Data 9</font></a>
			<cfelse>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Data 9</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=9>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 9<br>
		</td>
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
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #status# EQ "U">
		<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Data 10</font></a>
			<cfelse>
			<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Data 10</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="radio" NAME="SelectedDeed" VALUE=10>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge DATA 10<br>
		</td>
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
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 1</font></a>
			<cfelse>
			<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 1</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage" VALUE=1>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 1<br>
		</td>
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
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 2</font></a>
			<cfelse>
			<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 2</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage2" VALUE=2>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 2<br>
		</td>
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
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 3</font></a>
			<cfelse>
			<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 3</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage3" VALUE=3>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 3<br>
		</td>
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
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 4</font></a>
			<cfelse>
			<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 4</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage4" VALUE=4>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 4<br>
		</td>
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
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 5</font></a>
			<cfelse>
			<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 5</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage5" VALUE=5>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 5<br>
		</td>
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
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 6</font></a>
			<cfelse>
			<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 6</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage6" VALUE=6>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 6<br>
		</td>
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
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 7</font></a>
			<cfelse>
			<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 7</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage7" VALUE=7>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 7<br>
		</td>
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
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 8</font></a>
			<cfelse>
			<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 8</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage8" VALUE=8>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 8<br>
		</td>
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
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 9</font></a>
			<cfelse>
			<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 9</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage9" VALUE=9>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 9<br>
		</td>
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
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_mortgage.status# EQ "U">
		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Mortgage 10</font></a>
			<cfelse>
			<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Mortgage 10</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedMortgage10" VALUE=10>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge MORTGAGE 10<br>
		</td>
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
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 1</font></a>
			<cfelse>
			<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 1</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien" VALUE=1>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 1<br>
		</td>
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
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 2</font></a>
			<cfelse>
			<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 2</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien2" VALUE=2>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 2<br>
		</td>
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
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 3</font></a>
			<cfelse>
			<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 3</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien3" VALUE=3>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 3<br>
		</td>
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
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 4</font></a>
			<cfelse>
			<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 4</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien4" VALUE=4>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 4<br>
		</td>
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
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 5</font></a>
			<cfelse>
			<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 5</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien5" VALUE=5>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 5<br>
		</td>
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
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 6</font></a>
			<cfelse>
			<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 6</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien6" VALUE=6>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 6<br>
		</td>
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
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 7</font></a>
			<cfelse>
			<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 7</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien7" VALUE=7>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 7<br>
		</td>
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
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 8</font></a>
			<cfelse>
			<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 8</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien8" VALUE=8>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 8<br>
		</td>
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
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 9</font></a>
			<cfelse>
			<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 9</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien9" VALUE=9>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 9<br>
		</td>
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
				<td width=140 align=left valign=top bgcolor=e1e1e1>
		<cfif #read_lien.status# EQ "U">
		<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Updated Lien 10</font></a>
			<cfelse>
			<a href="./abstractor_add_LIEN_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Original Lien 10</font></a>
		</cfif>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1> <INPUT TYPE="checkbox" NAME="SelectedLien10" VALUE=10>
 		<FONT FACE=verdana SIZE=1 color="black">   Select to merge LIEN 10<br>
		</td>
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
<br>
Click this button to merge <INPUT TYPE=IMAGE SRC="./images/button_merge.gif" border=0>
</cfform>

<cfif #a_trigger# eq 85>
<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
<tr>
			<td width=699 align=center valign=top bgcolor=e1e1e1>

<b><font face=verdana size=2 color=blue>All selected item(s) were successfully merged to Title Commitment!</font></b><br>
</td>
</tr>
</table>
</cfif>
<table width=699 cellpadding=1 cellspacing=1 border=0 bgcolor=e1e1e1>
<tr>
			<td width=699 align=center valign=top bgcolor=e1e1e1>

<b><font face=verdana size=3 color=red>Already merged data </font></b><br>
</td>
</tr>
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

		<a href="./abstractor_add_deed_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Data submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>

		<CFQUERY datasource="#request.dsn#" NAME="read_sent_mortgage">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 1
			</cfquery>

<cfif #read_sent_mortgage.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_mortgage">

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

		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 1 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_sent_mortgage2">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 2
			</cfquery>

<cfif #read_sent_mortgage2.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_mortgage2">

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

		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 2 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_sent_mortgage3">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 3
			</cfquery>

<cfif #read_sent_mortgage3.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_mortgage3">

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

		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 3 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_sent_mortgage4">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 4
			</cfquery>

<cfif #read_sent_mortgage4.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_mortgage4">

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

		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 4 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>

<CFQUERY datasource="#request.dsn#" NAME="read_sent_mortgage5">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 5
			</cfquery>

<cfif #read_sent_mortgage5.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_mortgage5">

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

		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 5 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>
<CFQUERY datasource="#request.dsn#" NAME="read_sent_mortgage6">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 6
			</cfquery>

<cfif #read_sent_mortgage6.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_mortgage6">

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

		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 6 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>
<CFQUERY datasource="#request.dsn#" NAME="read_sent_mortgage7">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 7
			</cfquery>

<cfif #read_sent_mortgage7.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_mortgage7">

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

		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 7 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>
<CFQUERY datasource="#request.dsn#" NAME="read_sent_mortgage8">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 8
			</cfquery>

<cfif #read_sent_mortgage8.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_mortgage8">

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

		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 8 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>
<CFQUERY datasource="#request.dsn#" NAME="read_sent_mortgage9">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 9
			</cfquery>

<cfif #read_sent_mortgage9.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_mortgage9">

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

		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 9 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>
<CFQUERY datasource="#request.dsn#" NAME="read_sent_mortgage10">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs4 = 10
			</cfquery>

<cfif #read_sent_mortgage10.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_mortgage10">

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

		<a href="./abstractor_add_mortgage_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Mortgage 10 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>

		<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 1
			</cfquery>


<cfif #read_sent_lien.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_lien">

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

		<a href="./abstractor_add_lien_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Lien 1 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>

		<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien2">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 2
			</cfquery>

		<cfif #read_sent_lien2.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien2">

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

		<a href="./abstractor_add_lien_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Lien 2 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>

		<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien3">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 3
			</cfquery>

		<cfif #read_sent_lien3.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien3">

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

		<a href="./abstractor_add_lien_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Lien 3 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>

	<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien4">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 4
			</cfquery>

		<cfif #read_sent_lien4.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien4">

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

		<a href="./abstractor_add_lien_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Lien 4 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>
	<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien5">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 5
			</cfquery>

		<cfif #read_sent_lien5.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien5">

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

		<a href="./abstractor_add_lien_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Lien 5 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>
	<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien6">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 6
			</cfquery>

		<cfif #read_sent_lien6.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien6">

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

		<a href="./abstractor_add_lien_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Lien 6 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>

	<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien7">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 7
			</cfquery>

		<cfif #read_sent_lien7.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien7">

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

		<a href="./abstractor_add_lien_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Lien 7 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>
	<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien8">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 8
			</cfquery>

		<cfif #read_sent_lien8.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien8">

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

		<a href="./abstractor_add_lien_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Lien 8 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>
	<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien9">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 9
			</cfquery>
		<cfif #read_sent_lien9.recordcount# GT 0>

<CFOUTPUT QUERY="read_sent_lien9">

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

		<a href="./abstractor_add_lien_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Lien 9 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>
	<CFQUERY datasource="#request.dsn#" NAME="read_sent_lien10">
			select * from title_ins_view
			WHERE title_id = #url.rec_ID# and selectedOrgs3 = 10
			</cfquery>

		<cfif #read_sent_lien10.recordcount# GT 0>
<CFOUTPUT QUERY="read_sent_lien10">

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

		<a href="./abstractor_add_lien_view.cfm?uid=#URL.uid#&al=#URL.al#&rec_id=#title_id#&seq_num=#seq_num#&company_id=0"><font size=1 color=blue face=verdana>Lien 10 submitted</font></a>
			</td>
	<td width=290 align=left valign=top bgcolor=e1e1e1>
		</td>
	</tr>
</table>


		</CFOUTPUT>
		</cfif>
</td>
</tr>

	</table>


			</TD>
		</TR>

	</table>

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
</HTML>


